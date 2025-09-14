/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerStart_DOM.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *
 *******************************************************************************/
class PlayerStart_DOM extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force)
    placeable;

enum EApplyFlag
{
    A_FLAG,
    B_FLAG,
    C_FLAG,
    Neutral
};

var() PlayerStart_DOM.EApplyFlag eApplyFlagType;

defaultproperties
{
    ApplyGameInfo="wMission.wDOMGameInfo"
    Texture=Texture'DOM_Player'
}