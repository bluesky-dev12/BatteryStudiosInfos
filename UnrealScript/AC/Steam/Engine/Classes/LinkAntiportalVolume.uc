/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LinkAntiportalVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class LinkAntiportalVolume extends Volume
    native
    notplaceable;

var(LinkAntiportal) array<AntiPortalActor> AntiPortals;

defaultproperties
{
    DrawType=12
    RemoteRole=0
}