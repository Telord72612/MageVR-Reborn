Scriptname VRBP_Native Native Hidden
{Native declarations backed by VRBackpack.dll - the per-hand held-mesh orientation
 corrector. The real bodies live in the SKSE plugin; this lets Papyrus type-check.}

Function SetRightHandFix(Float x, Float y, Float z) Global Native
Function SetTokenForm(Form akToken) Global Native
Function SetEnabled(Bool abEnabled) Global Native
Bool Function IsBigBackpack(Form akWorn) Global Native
