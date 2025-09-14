/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitEffect_Dirt.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class HitEffect_Dirt extends Effects;

var Sound ImpactSound;

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x29
    if(Role == 4)
    {
        // End:0x29
        if(Instigator != none)
        {
            MakeNoise(0.30);
        }
    }
    // End:0x48
    if(Level.NetMode != 1)
    {
        SpawnEffects();
    }
}

simulated function SpawnEffects()
{
    local PlayerController P;
    local bool bViewed;

    PlaySound(ImpactSound);
    P = Level.GetLocalPlayerController();
    // End:0xa1
    if(P != none && P.ViewTarget != none && vector(P.Rotation) Dot Location - P.ViewTarget.Location > float(0))
    {
        Spawn(class'HitEffect_dirt_BulletHole', self,, Location, rotator(float(-1) * vector(Rotation)));
        bViewed = true;
    }
    // End:0xb5
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(class'HitEffect_Dirt_hit');
}

defaultproperties
{
    ImpactSound=SoundGroup'Warfare_Sound_Impact.Dirt.impact_dirt'
    DrawType=0
    CullDistance=7000.0
    LifeSpan=0.10
    Style=6
}