/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DamTypeExploBarrel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DamTypeExploBarrel extends DamageType
    abstract;

static function GetHitEffects(out class<wEmitter> HitEffects[4], int VictimHealth)
{
    HitEffects[0] = class'HitSmoke';
    // End:0x28
    if(VictimHealth <= 0)
    {
        HitEffects[1] = class'HitFlameBig';
    }
    // End:0x41
    else
    {
        // End:0x41
        if(FRand() < 0.80)
        {
            HitEffects[1] = class'HitFlame';
        }
    }
}

defaultproperties
{
    DeathString="%k?? ??? ???? %o?? ???????"
    FemaleSuicide="%o ?? ???? ?? ??? ?? ??? ?????"
    MaleSuicide="%o ?? ???? ?? ??? ?? ??? ?????"
    bDetonatesGoop=true
    bThrowRagdoll=true
    bFlaming=true
    GibPerterbation=0.150
}