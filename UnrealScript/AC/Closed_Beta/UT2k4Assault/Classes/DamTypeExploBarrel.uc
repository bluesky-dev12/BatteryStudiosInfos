class DamTypeExploBarrel extends DamageType
    abstract;

static function GetHitEffects(out Class<wEmitter> HitEffects[4], int VictimHealth)
{
    HitEffects[0] = Class'XEffects.HitSmoke';
    // End:0x28
    if(VictimHealth <= 0)
    {
        HitEffects[1] = Class'XEffects.HitFlameBig';        
    }
    else
    {
        // End:0x41
        if(FRand() < 0.8000000)
        {
            HitEffects[1] = Class'XEffects.HitFlame';
        }
    }
    //return;    
}

defaultproperties
{
    DeathString="%k?? ??? ???? %o?? ???????"
    FemaleSuicide="%o ?? ???? ?? ??? ?? ??? ?????"
    MaleSuicide="%o ?? ???? ?? ??? ?? ??? ?????"
    bDetonatesGoop=true
    bThrowRagdoll=true
    bFlaming=true
    GibPerterbation=0.1500000
}