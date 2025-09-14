/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SubActionCameraEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *
 *******************************************************************************/
class SubActionCameraEffect extends MatSubAction
    native
    editinlinenew
    collapsecategories
    noexport;

var() editinline CameraEffect CameraEffect;
var() float StartAlpha;
var() float EndAlpha;
var() bool DisableAfterDuration;

defaultproperties
{
    EndAlpha=1.0
    Icon=Texture'SubActionFade'
    Desc="Camera Effects"
}