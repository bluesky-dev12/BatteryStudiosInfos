class HitEffect_Teen_Blood extends Effects;

var string ImpactSound;

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x29
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x29
        if(Instigator != none)
        {
            MakeNoise(0.3000000);
        }
    }
    // End:0x48
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SpawnEffects();
    }
    //return;    
}

simulated function SpawnEffects()
{
    Spawn(Class'XEffects_Decompressed.HitEffect_Teen_blood_hit');
    //return;    
}

defaultproperties
{
    ImpactSound="Warfare_Sound_Impact/char/normal_rand"
    DrawType=0
    CullDistance=7000.0000000
    LifeSpan=0.1000000
    Style=6
}