/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MotionBlur.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
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