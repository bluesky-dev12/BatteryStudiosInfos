/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitEffect_blood_spurt.uc
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
class HitEffect_blood_spurt extends Effects;

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

    P = Level.GetLocalPlayerController();
    // End:0xd7
    if(P != none && P.ViewTarget != none && VSize(P.ViewTarget.Location - Location) < float(1600) * P.FOVBias && vector(P.Rotation) Dot Location - P.ViewTarget.Location > float(0))
    {
        Spawn(class'HitEffect_Concrete_BulletHole', self,, Location, rotator(float(-1) * vector(Rotation)));
        bViewed = true;
    }
    // End:0xeb
    if(PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Spawn(class'HitEffect_blood_spurt_hit');
}

defaultproperties
{
    ImpactSound=SoundGroup'Warfare_Sound_Impact.char.impact_char_nomal'
    DrawType=0
    CullDistance=7000.0
    LifeSpan=0.10
    Style=6
}