class wSBTBombObjective_Delivery extends wBombObjective_Delivery
    hidecategories(Lighting,LightColor,Karma,Force);

defaultproperties
{
    DeliveringObject=Class'WMission_Decompressed.wGameObject_SBTBomb'
    ApplyGameInfo="wMission.wSBTGameInfo"
}