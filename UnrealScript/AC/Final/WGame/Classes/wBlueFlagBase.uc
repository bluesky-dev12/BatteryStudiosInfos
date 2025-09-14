class wBlueFlagBase extends wRealCTFBase
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    local wCTFBase wBase;

    super.PostBeginPlay();
    // End:0x48
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        wBase = Spawn(Class'WGame_Decompressed.wCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
    }
    //return;    
}

defaultproperties
{
    FlagType=Class'WGame_Decompressed.wBlueFlag'
    DefenderTeamIndex=1
    DefenseScriptTags="DefendBlueFlag"
    ObjectiveName="??"
}