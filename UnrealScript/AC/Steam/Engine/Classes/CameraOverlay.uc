/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CameraOverlay.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class CameraOverlay extends CameraEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var() Color OverlayColor;
var() Material OverlayMaterial;

defaultproperties
{
    OverlayColor=(R=255,G=255,B=255,A=255)
}