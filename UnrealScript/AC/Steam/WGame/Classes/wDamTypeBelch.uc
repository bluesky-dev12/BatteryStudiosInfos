/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDamTypeBelch.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wDamTypeBelch extends DamageType
    abstract;

static function GetHitEffects(out class<wEmitter> HitEffects[4], int VictemHealth)
{
    HitEffects[0] = class'HitSmoke';
    // End:0x36
    if(VictemHealth <= 0 && FRand() < 0.20)
    {
        HitEffects[1] = class'HitFlameBig';
    }
    // End:0x4f
    else
    {
        // End:0x4f
        if(FRand() < 0.80)
        {
            HitEffects[1] = class'HitFlame';
        }
    }
}

defaultproperties
{
    bDetonatesGoop=true
    KDamageImpulse=20000.0
}