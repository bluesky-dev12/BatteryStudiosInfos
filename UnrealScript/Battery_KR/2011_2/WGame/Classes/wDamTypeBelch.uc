class wDamTypeBelch extends DamageType
    abstract;

static function GetHitEffects(out Class<wEmitter> HitEffects[4], int VictemHealth)
{
    HitEffects[0] = Class'XEffects.HitSmoke';
    // End:0x36
    if((VictemHealth <= 0) && FRand() < 0.2000000)
    {
        HitEffects[1] = Class'XEffects.HitFlameBig';        
    }
    else
    {
        // End:0x4F
        if(FRand() < 0.8000000)
        {
            HitEffects[1] = Class'XEffects.HitFlame';
        }
    }
    //return;    
}

defaultproperties
{
    bDetonatesGoop=true
    KDamageImpulse=20000.0000000
}