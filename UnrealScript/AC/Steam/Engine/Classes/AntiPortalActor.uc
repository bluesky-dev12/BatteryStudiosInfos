/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AntiPortalActor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *
 *******************************************************************************/
class AntiPortalActor extends Actor
    native
    placeable;

enum EnumAntiPortalMode
{
    APM_Global,
    APM_TouchingZone,
    APM_Link
};

var(AntiPortal) AntiPortalActor.EnumAntiPortalMode AntiPortalMode;

defaultproperties
{
    DrawType=11
    bNoDelete=true
    RemoteRole=0
    bEdShouldSnap=true
}