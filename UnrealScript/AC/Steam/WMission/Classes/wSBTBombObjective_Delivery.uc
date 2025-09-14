/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSBTBombObjective_Delivery.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wSBTBombObjective_Delivery extends wBombObjective_Delivery
    hidecategories(Lighting,LightColor,Karma,Force);

defaultproperties
{
    DeliveringObject=class'wGameObject_SBTBomb'
    ApplyGameInfo="wMission.wSBTGameInfo"
}