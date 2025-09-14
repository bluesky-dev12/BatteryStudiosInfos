/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CubemapVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class CubemapVolume extends Volume
    native
    notplaceable;

var() Material Cubemap;

defaultproperties
{
    DrawType=14
    RemoteRole=0
}