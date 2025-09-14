class HitEffect_Dirt extends Effects;

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
    // End:0xA4
    if(((P != none) && P.ViewTarget != none) && (Vector(P.Rotation) Dot (Location - P.ViewTarget.Location)) > float(0))
    {
        Spawn(Class'XEffects_Decompressed.HitEffect_dirt_BulletHole', self,, Location, Rotator(float(-1) * Vector(Rotation)));
        bViewed = true;
    }
    // End:0xB8
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(Class'XEffects_Decompressed.HitEffect_Dirt_hit');
    //return;    
}

defaultproperties
{
    ImpactSound="Warfare_Sound_Impact/Dirt/Dirt_rand"
    DrawType=0
    CullDistance=7000.0000000
    LifeSpan=0.1000000
    Style=6
}