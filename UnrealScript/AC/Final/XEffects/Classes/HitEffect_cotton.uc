class HitEffect_cotton extends Effects;

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
    local PlayerController P;
    local bool bViewed;

    FmodPlaySound(ImpactSound);
    P = Level.GetLocalPlayerController();
    // End:0xE2
    if((((P != none) && P.ViewTarget != none) && VSize(P.ViewTarget.Location - Location) < (float(1600) * P.FOVBias)) && (Vector(P.Rotation) Dot (Location - P.ViewTarget.Location)) > float(0))
    {
        Spawn(Class'XEffects_Decompressed.HitEffect_cotton_BulletHole', self,, Location, Rotator(float(-1) * Vector(Rotation)));
        bViewed = true;
    }
    // End:0xF6
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(Class'XEffects_Decompressed.HitEffect_cotton_hit');
    //return;    
}

defaultproperties
{
    ImpactSound="Warfare_Sound_Impact/cloth/cloth_rand"
    DrawType=0
    CullDistance=7000.0000000
    LifeSpan=0.1000000
    Style=6
}