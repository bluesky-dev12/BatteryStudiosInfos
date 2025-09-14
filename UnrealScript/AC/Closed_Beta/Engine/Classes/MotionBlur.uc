class MotionBlur extends CameraEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var() byte BlurAlpha;
var const transient pointer RenderTargets[2];
var const float LastFrameTime;

defaultproperties
{
    BlurAlpha=128
}