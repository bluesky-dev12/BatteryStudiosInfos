class wRedFlagBase extends wRealCTFBase
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x42
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Spawn(Class'WGame_Decompressed.wCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
    }
    //return;    
}

defaultproperties
{
    FlagType=Class'WGame_Decompressed.wRedFlag'
    DefenseScriptTags="DefendRedFlag"
    ObjectiveName="??"
}