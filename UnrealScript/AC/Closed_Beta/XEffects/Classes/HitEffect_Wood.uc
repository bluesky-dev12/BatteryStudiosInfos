class HitEffect_Wood extends Effects;

var Sound ImpactSound;

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

    PlaySound(ImpactSound);
    P = Level.GetLocalPlayerController();
    // End:0xA1
    if(((P != none) && P.ViewTarget != none) && (Vector(P.Rotation) Dot (Location - P.ViewTarget.Location)) > float(0))
    {
        Spawn(Class'XEffects_Decompressed.HitEffect_wood_BulletHole', self,, Location, Rotator(float(-1) * Vector(Rotation)));
        bViewed = true;
    }
    // End:0xB5
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(Class'XEffects_Decompressed.HitEffect_Wood_hit');
    //return;    
}

defaultproperties
{
    ImpactSound=SoundGroup'Warfare_Sound_Impact.wood.impact_wood'
    DrawType=0
    CullDistance=7000.0000000
    LifeSpan=0.1000000
    Style=6
}