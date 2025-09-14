class HitEffect_water_wall extends Effects;

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
    FmodPlaySound(ImpactSound);
    Spawn(Class'XEffects_Decompressed.HitEffect_water_wall_hit');
    //return;    
}

defaultproperties
{
    ImpactSound="Warfare_Sound_Impact/water/water_rand"
    DrawType=0
    CullDistance=7000.0000000
    LifeSpan=0.1000000
    Style=6
}