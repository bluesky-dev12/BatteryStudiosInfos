/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerStart_SBT.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class PlayerStart_SBT extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force)
    placeable;

defaultproperties
{
    ApplyGameInfo="wMission.wSBTGameInfo"
    Texture=Texture'SpawnSBT'
}