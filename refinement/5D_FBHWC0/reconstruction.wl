(*
Construction of w(x) and W(x) from the equation for w'(r) and recalling that W = 
*)

ReconstructSolution[fields_, parameters_] := Module[
	{F, B, H, W},
	F = fields["F"];
	B = fields["B"];
	H = fields["H"];
	W = fields["W"];

	f = sinx (1 + cosx^2 F);
	b = sinx (1 + cosx^2 B);
	hreduced = cosx^2 H;(*Subscript[h, reduced] = h - r^2*)
	w = cosx^4*W;

	OmegaValue = ChebyshevInterpolationFunction[{0}, {y, w}][[1]];(*Omega = w(r=rh) = w(x=0)*)


	<|
		"DerivedFields" -> <|"w" -> w, "f" -> f, "b" -> b, "hreduced" -> hreduced|>,
		"OmegaValue" -> OmegaValue
	|>
];
