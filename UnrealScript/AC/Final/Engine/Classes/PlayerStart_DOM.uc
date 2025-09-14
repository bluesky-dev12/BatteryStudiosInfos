class PlayerStart_DOM extends PlayerStart
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

enum EApplyFlag
{
    A_FLAG,                         // 0
    B_FLAG,                         // 1
    C_FLAG,                         // 2
    Neutral                         // 3
};

var() PlayerStart_DOM.EApplyFlag eApplyFlagType;

defaultproperties
{
    ApplyGameInfo="wMission.wDOMGameInfo"
    Texture=Texture'Engine_Decompressed.DOM_Player'
}