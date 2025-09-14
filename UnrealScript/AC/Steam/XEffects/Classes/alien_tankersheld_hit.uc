/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\alien_tankersheld_hit.uc
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
class alien_tankersheld_hit extends Effects;

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
        Spawn(class'alien_tankersheld_hit_BulletHole', self,, Location, rotator(float(-1) * vector(Rotation)));
        bViewed = true;
    }
    // End:0xb5
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(class'alien_tankersheld_hiteffect');
}

defaultproperties
{
    ImpactSound=SoundGroup'Warfare_Sound_Impact.Glass.impact_glass'
    DrawType=0
    CullDistance=7000.0
    LifeSpan=0.10
    Style=6
}