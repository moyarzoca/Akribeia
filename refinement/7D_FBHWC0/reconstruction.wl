(*
Construction of w(x) and W(x) from the equation for w'(r) and recalling that W = 
*)

ReconstructSolution[fields_, parameters_] := Module[
	{F, B, H, W},
	F = fields["F"];
	B = fields["B"];
	H = fields["H"];
	W = fields["W"];

	f = 1 + cosx^4 (sinx*F - 1);
	b = 1 + cosx^4 (sinx*B - 1);
	hreduced = cosx^4 H;(*Subscript[h, reduced] = h - r^2*)
	w = cosx^6*W;

	OmegaValue = ChebyshevInterpolationFunction[{0}, {y, w}][[1]];(*Omega = w(r=rh) = w(x=0)*)


	<|
		"DerivedFields" -> <|"w" -> w, "f" -> f, "b" -> b, "hreduced" -> hreduced|>,
		"OmegaValue" -> OmegaValue
	|>
];
