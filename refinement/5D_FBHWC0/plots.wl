
(*
============
Output Plots
============
*)

GenerateInputDataPlot[initialData_] := Module[
	{grid, seedFields, referenceGrid, referenceFields, ExportPath, plot},

	grid = initialData["Grid"];
	seedFields = initialData["SeedFields"];
	referenceGrid = initialData["ReferenceGrid"];
	referenceFields = initialData["ReferenceFields"];
	ExportPath = initialData["Paths"]["ExportPath"];

	plot = ListLinePlot[
		{
			Transpose[{referenceGrid, referenceFields["F"]}], Transpose[{grid, seedFields["F"]}],
			Transpose[{referenceGrid, referenceFields["B"]}], Transpose[{grid, seedFields["B"]}],
			Transpose[{referenceGrid, referenceFields["H"]}], Transpose[{grid, seedFields["H"]}],
			Transpose[{referenceGrid, referenceFields["W"]}], Transpose[{grid, seedFields["W"]}]
		},
		PlotRange -> All,
		Background -> White
	];

	Export[FileNameJoin[{ExportPath, "Plot_Input_Data.png"}], plot];

	plot
];

GenerateHomogeneousGridResidualPlot[residualData_, solution_] := Module[
	{xgrid, residuals, ExportPath, plot},

	xgrid = residualData["Grid"];
	residuals = residualData["Residuals"];
	ExportPath = solution["Paths"]["ExportPath"];
	
	plot = ListLogPlot[
		Map[Transpose[{xgrid, Abs[#]}] &, residuals],
		Joined -> True,
		Background -> White,
		PlotRange -> {
			{0, Pi/2},
			All
		},
		ImageSize -> 500,
		PlotLegends -> {
			Style["Res(Eq1)", Black, 15],
			Style["Res(Eq2)", Black, 15],
			Style["Res(Eq3)", Black, 15]
		},
		TicksStyle -> Directive[Black, 14]
	];

	Export[FileNameJoin[{ExportPath, "Plot_Residual_homogeneous_grid.png"}], plot];

	plot
];

GeneratePlots[solution_, initialData_] := Module[
	{fields, derivedFields, discretization, finalStage, refGrid, refFields, ExportPath,
		Nx, fieldsAndDeriv, systemResidual,
		Residue1, Residue2, Residue3,
		PlotResidual1, CompDetermVsNN, CompDetermVsNNOriginal,
		fnn, bnn, hnn,
		F, B, H, W, f, b, hreduced, w, y, Dy, D2y},

	fields = solution["OptimizedFields"];
	derivedFields = solution["DerivedFields"];
	discretization = solution["Discretization"];
	finalStage = Last[solution["Stages"]];
	refGrid = initialData["ReferenceGrid"];
	refFields = initialData["ReferenceFields"];
	ExportPath = solution["Paths"]["ExportPath"];

	y = discretization["Grid"];
	Dy = discretization["Dy"];
	D2y = discretization["D2y"];

	F = fields["F"];
	B = fields["B"];
	H = fields["H"];
	W = fields["W"];

	f = derivedFields["f"];
	b = derivedFields["b"];
	hreduced = derivedFields["hreduced"];
	w = derivedFields["w"];

	Nx = Length[F];
	fieldsAndDeriv = BuildFieldsAndDeriv[fields, GetEquations["FieldDerivativeMap"], Dy, D2y];

	paramOptimizeList = Map[#paramOptimize &, Select[boundaryConds, #eq == "addNew" &]];
	Do[fieldsAndDeriv[p] = parameters[p], {p, paramOptimizeList}];

	systemResidual = SystemFunction[fieldsAndDeriv, GetEquations["varsSymb"], GetEquations];

	Residue1 = systemResidual[[1 ;; Nx]];
	Residue2 = systemResidual[[1 + Nx ;; 2 Nx]];
	Residue3 = systemResidual[[1 + 2 Nx ;; 3 Nx]];
	Residue4 = systemResidual[[1 + 3 Nx ;; 4 Nx]];

	PlotResidual1 = ListLogPlot[{
		Transpose[{y, Abs[Residue1]}],
		Transpose[{y, Abs[Residue2]}],
		Transpose[{y, Abs[Residue3]}],
		Transpose[{y, Abs[Residue4]}]
		},
		Joined -> True,
		Background -> White,
		PlotRange -> {{0, Pi/2}, All},
		ImageSize -> 500,
		PlotLegends -> {
			Style["Res(Eq1)", Black, 15],
			Style["Res(Eq2)", Black, 15],
			Style["Res(Eq3)", Black, 15],
			Style["Res(Eq4)", Black, 15]
		},
		TicksStyle -> Directive[Black, 14]
	];

	Export[FileNameJoin[{ExportPath, "Plot_Residual_Gauss-Newton.png"}], PlotResidual1];


	(*
		Deterministic solution vs Neural Network
	*)
	CompDetermVsNN = Show[
		ListLinePlot[
			{
				Transpose[{y, F}],
				Transpose[{y, B}],
				Transpose[{y, H}],
				Transpose[{y, W}]
			},
			Background -> White,
			PlotRange -> {{0, Pi/2}, All},
			ImageSize -> 500,
			PlotLegends -> {
				Style["F", Black, 15],
				Style["B", Black, 15],
				Style["H", Black, 15],
				Style["W", Black, 15]
			},
			TicksStyle -> Directive[Black, 14]
		],
		ListLinePlot[
			{
				Transpose[{refGrid, refFields["F"]}],
				Transpose[{refGrid, refFields["B"]}],
				Transpose[{refGrid, refFields["H"]}],
				Transpose[{refGrid, refFields["W"]}]
			},
			PlotStyle -> {{Black, Dashed}},
			Background -> White,
			PlotRange -> {{0, Pi/2}, All},
			PlotLegends -> {
				Style["F_NN", Black, 15],
				Style["B_NN", Black, 15],
				Style["H_NN", Black, 15],
				Style["W_NN", Black, 15]
			},
			TicksStyle -> Directive[Black, 14]
		]
	];

	Export[FileNameJoin[{ExportPath, "Plot_Deterministic_vs_NN.png"}], CompDetermVsNN];

	(*
		Original variables plot
	*)
	fnn = Sin[refGrid] (1 + Cos[refGrid]^2 refFields["F"]);
	bnn = Sin[refGrid] (1 + Cos[refGrid]^2 refFields["B"]);
	hnn = Cos[refGrid]^2 refFields["H"];

	CompDetermVsNNOriginal = Show[
		ListLinePlot[
			{
				Transpose[{y, f}],
				Transpose[{y, b}],
				Transpose[{y, hreduced}],
				Transpose[{y, w}]
			},
			Background -> White,
			PlotRange -> {{0, Pi/2}, All},
			ImageSize -> 500,
			PlotLegends -> {
				Style["f", Black, 15],
				Style["b", Black, 15],
				Style["hreduced", Black, 15],
				Style["w", Black, 15]
			},
			TicksStyle -> Directive[Black, 14]
		],
		ListLinePlot[
			{
				Transpose[{refGrid, fnn}],
				Transpose[{refGrid, bnn}],
				Transpose[{refGrid, hnn}],
				Transpose[{refGrid, Cos[refGrid]^4 refFields["W"]}]
			},
			PlotStyle -> {{Black, Dashed}},
			Background -> White,
			PlotRange -> {{0, Pi/2}, All},
			PlotLegends -> {
				Style["f_NN", Black, 15],
				Style["b_NN", Black, 15],
				Style["h_NN-r^2", Black, 15],
				Style["w_NN", Black, 15]
			},
			TicksStyle -> Directive[Black, 14]
		]
	];

	Export[
		FileNameJoin[{ExportPath, "Plot_Deterministic_vs_NN_original.png"}],
		CompDetermVsNNOriginal
	];

];
