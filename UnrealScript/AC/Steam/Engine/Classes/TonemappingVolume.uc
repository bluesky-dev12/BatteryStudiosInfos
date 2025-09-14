/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TonemappingVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class TonemappingVolume extends Volume
    native
    notplaceable;

var() byte TonemappingIndex;

defaultproperties
{
    DrawType=14
    RemoteRole=0
}