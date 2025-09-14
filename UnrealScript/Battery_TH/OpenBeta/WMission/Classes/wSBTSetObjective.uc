class wSBTSetObjective extends wSetObjective
    hidecategories(Lighting,LightColor,Karma,Force);

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    // End:0x2B
    if(!Level.Game.bChangedHost)
    {
        bActive = false;
    }
    //return;    
}

defaultproperties
{
    fSettingLength=3.8299999
    fDecLength=1.1000000
    ObjectivePriority=1
    ApplyGameInfo="wMission.wSBTGameInfo"
    Tag="'"
}