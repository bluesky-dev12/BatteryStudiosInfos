/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSBTBombObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wSBTBombObjective extends wBombObjective
    hidecategories(Lighting,LightColor,Karma,Force);

defaultproperties
{
    FlagType=class'wGameObject_SBTBomb'
    ApplyGameInfo="wMission.wSBTGameInfo"
}