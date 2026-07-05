SetParameterState[parameters_] := (
	\[Alpha] = parameters["alpha"];
	rh = parameters["rh"];
	C0 = parameters["C0"];
	Omega = parameters["OhSeed"];
);

(*
=======================
	Load CSV tools
=======================
*)

LoadReferenceSeedData[path_] := Module[
	{rawData, parameters, referenceGrid, referenceFields},

	rawData = Import[path];

	parameters = <|
		"alpha" -> SetPrecision[rawData[[2, 1]], Pre],
		"rh" -> SetPrecision[rawData[[2, 2]], Pre],
		"C0" -> SetPrecision[rawData[[2, 3]], Pre],
		"OhSeed" -> SetPrecision[rawData[[2, -1]], Pre]
	|>;

	referenceGrid = Table[rawData[[i, 5]], {i, 2, Length[rawData]}];
	referenceFields = <|
		"F" -> Table[rawData[[i, 6]], {i, 2, Length[rawData]}],
		"B" -> Table[rawData[[i, 7]], {i, 2, Length[rawData]}],
		"H" -> Table[rawData[[i, 8]], {i, 2, Length[rawData]}],
		"W" -> Table[rawData[[i, 9]], {i, 2, Length[rawData]}]
	|>;

	<|
		"Parameters" -> parameters,
		"ReferenceGrid" -> referenceGrid,
		"ReferenceFields" -> referenceFields
	|>
];

InterpolateSeedFields[Nx_, referenceGrid_, referenceFields_] := Module[
	{seedGrid, seedFields},

	ChebyshevPoints[Nx];
	seedGrid = y;

	seedFields = AssociationMap[
		Interpolation[Transpose[{referenceGrid, referenceFields[#]}]] /@ seedGrid &,
		{"F", "B", "H", "W"}
	];

	<|
		"Grid" -> seedGrid,
		"SeedFields" -> seedFields,
		"Fields" -> KeyTake[seedFields, {"F", "B", "H", "W"}]
	|>
];

ReadInterpolateSeedCSV[Nx_, path_] := Module[
	{referenceData, interpolatedData},

	referenceData = LoadReferenceSeedData[path];
	interpolatedData = InterpolateSeedFields[Nx, referenceData["ReferenceGrid"], referenceData["ReferenceFields"]];

	Join[referenceData, interpolatedData]
];

(*
=======================
	Lookup tools
=======================
*)

GetInputObjectValue[conf_, key_, default_: Missing["KeyAbsent", key]] := Module[
	{value},

	value = Lookup[conf, key, default];
	If[value === Missing["KeyAbsent", key], value, SetPrecision[value, Pre]]
];

RequireInputObjectValue[conf_, key_] := Module[
	{value},

	value = GetInputObjectValue[conf, key];
	If[value === Missing["KeyAbsent", key],
		Print["WARNING: Missing required input key \"" <> key <> "\" for Network seed loading."];
		Abort[]
	];

	value
];

(*
=======================
	Neural Network tools
=======================
*)


AssambleModels[weightBias_, networkParameters_: <||>] := Module[
	{NetBundle, Fnet, Bnet, Hnet, Wnet, C0net, Oh, x0},
	Get[FileNameJoin[{RootFolder, "network", "network.wl"}]];
	NetBundle = BuildNeuralNetworkBundle[weightBias];
	Fnet = NetBundle["F"];
	Bnet = NetBundle["B"];
	Hnet = NetBundle["H"];
	Wnet = NetBundle["W"];
	C0net = NetBundle["C0"];

	Oh = Lookup[networkParameters, "Oh", Lookup[networkParameters, "OhSeed", 0]];
	x0 = Lookup[networkParameters, "x0", Print["Warning: x0 is not given. Returning 1"];1];
	<|
		"F" -> Function[{x, alph}, Fnet[{x, alph}]],
		"B" -> Function[{x, alph}, Bnet[{x, alph}]],
		"H" -> Function[{x, alph}, Hnet[{x, alph}]],
		"W" -> Function[{x, alph}, (Oh + (1-Exp[-(x-x0)])*Wnet[{x, alph}])],
		"C0" -> Function[{alph}, C0net[{alph}]]
	|>
];

BuildEvalNetwork[Nx_, pathJSON_, conf_: <||>] := Module[
	{
		WeightBias, models, alphaValue, rhValue, omegaConfValue, referenceNPoints,
		networkParameters, seedGrid, referenceGrid, evaluateField, seedFields,
		referenceFields, parameters, C0
	},
	WeightBias = Import[pathJSON, "RawJSON"];

	alphaValue = RequireInputObjectValue[conf, "alpha"];

	rhValue = RequireInputObjectValue[conf, "rh"];
	omegaConfValue = GetInputObjectValue[conf, "Oh", 0];
	referenceNPoints = Round[Lookup[conf, "ReferenceNumberPoints", 100]];

	networkParameters = <|
		"Oh" -> omegaConfValue,
		"x0" -> GetInputObjectValue[conf, "x0", 1]
	|>;
	models = AssambleModels[WeightBias, networkParameters];

	ChebyshevPoints[Nx];
	seedGrid = y;
	referenceGrid = SetPrecision[Pi/2 Range[0, referenceNPoints]/referenceNPoints, Pre];

	evaluateField[fieldName_, grid_] := SetPrecision[(models[fieldName][#, alphaValue] &) /@ grid, Pre];

	seedFields = AssociationMap[evaluateField[#, seedGrid] &, {"F", "B", "H", "W"}];
	referenceFields = AssociationMap[evaluateField[#, referenceGrid] &, {"F", "B", "H", "W"}];

	C0 = SetPrecision[models["C0"][alphaValue], Pre];

	seedFields["C0"] = C0;

	parameters = <|
		"alpha" -> alphaValue,
		"rh" -> rhValue,
		"C0" -> C0,
		"Oh" -> omegaConfValue
	|>;

	<|
		"Parameters" -> parameters,
		"Grid" -> seedGrid,
		"SeedFields" -> seedFields,
		"Fields" -> KeyTake[seedFields, {"F", "B", "H", "W"}],
		"ReferenceGrid" -> referenceGrid,
		"ReferenceFields" -> referenceFields
	|>
];

(*
=======================
	Orchestrator
=======================
*)

LoadInitialData[InputObject_] := Module[
	{initialStage, initialData, parameters, fields, dataFormat},

	initialStage = First[Stages];
	dataFormat = InputObject["format"];

	Which[
	"CouplingsCoordFuncs"===dataFormat, 
		initialData = ReadInterpolateSeedCSV[initialStage["Npoints"], InputObject["seed"]],
	"Network"===dataFormat,
		initialData = BuildEvalNetwork[initialStage["Npoints"], InputObject["seed"], InputObject],
	True,
		Print["WARNING: The format of the data has not been specified!!!!"];
		Abort[]
	];


	parameters = initialData["Parameters"];
	fields = initialData["Fields"];

	SetParameterState[parameters];
	y = initialData["Grid"];
	F = fields["F"];
	B = fields["B"];
	H = fields["H"];
	W = fields["W"];

	Print["Data loaded in " <> dataFormat <> " format"];
	Print[
		"Parameters: \[Alpha] = " <> ToString[\[Alpha] 1.] <>
		"  rh = " <> ToString[rh 1.] <>
		"   C0 = " <> ToString[C0 1.] <>
		"   Oh = " <> ToString[Oh*1.]
	];

	<|
		"Fields" -> fields,
		"Grid" -> initialData["Grid"],
		"SeedFields" -> initialData["SeedFields"],
		"ReferenceGrid" -> initialData["ReferenceGrid"],
		"ReferenceFields" -> initialData["ReferenceFields"],
		"Parameters" -> parameters,
		"Paths" -> <|"ExportPath" -> ExportPath|>
	|>
];
