ExportSolutionCSV[solution_] := Module[
    {grid, parameters, alpha, rh, c0, omega, exportPath, families, extraColSpecs},

    grid = solution["Discretization", "Grid"];
    parameters = solution["Parameters"];
    {alpha, rh, c0} = {parameters["alpha"], parameters["rh"], parameters["C0"]};
    omega = solution["OmegaValue"];
    exportPath = solution["Paths", "ExportPath"];

    families = KeyTake[solution, {"OptimizedFields", "DerivedFields"}];
    extraColSpecs = {
        {"alpha", alpha &},
        {"rh", rh &},
        {"C0", c0 &},
        {"Omega", omega &},
        {"r", (rh + Tan[grid[[#]]] &)},
        {"x", grid[[#]] &}
    };

    ExportFieldFamiliesToCSV[families, extraColSpecs, exportPath, "gauss_newton_solution.csv"]
];

ExportSolutionCoeffs[solution_] := Module[
    {exportPath, transformField, families},
    Print["Extracting coefficients ..."];
    exportPath = solution["Paths", "ExportPath"];
    transformField = Map[GetChebyshevCoefficients, #] &;
    families = Map[transformField, KeyTake[solution, {"OptimizedFields", "DerivedFields"}]];
    ExportCoeffs[families, exportPath]
];
