/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CameraEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class CameraEffect extends Object
    native
    noexport
    abstract;

var float Alpha;
var bool FinalEffect;
var int cameraeffect_dummy;

defaultproperties
{
    Alpha=1.0
}