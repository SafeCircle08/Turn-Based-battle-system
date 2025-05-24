function reduceDimAlpha(_obj, _ref = oDrumPadObjectsParent)
{
	image_xscale -= 0.01;
	image_yscale -= 0.01;
	image_alpha -= 0.02;
	if (image_alpha <= -1) { instance_destroy(_ref); }
}