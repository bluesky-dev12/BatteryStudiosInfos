/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitEffect_blood_Alien_Omega.uc
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
class HitEffect_blood_Alien_Omega extends Effects;

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
    Spawn(class'HitEffect_blood_hit_Alien_Omega');
}

defaultproperties
{
    ImpactSound=SoundGroup'Warfare_Sound_Impact.char.impact_char_nomal'
    DrawType=0
    CullDistance=7000.0
    LifeSpan=0.10
    Style=6
}