class xAlienPawnGidGroup extends xPawnGibGroup;

var Class<wEmitter> BloodHitClass_Alpha;
var Class<wEmitter> BloodHitClass_Gamma;
var Class<wEmitter> BloodHitClass_Eta;
var Class<wEmitter> BloodHitClass_Kappa;
var Class<wEmitter> BloodHitClass_Omega;

static function PrecacheContent(LevelInfo Level)
{
    super.PrecacheContent(Level);
    // End:0x2A
    if(default.BloodHitClass_Alpha != none)
    {
        default.BloodHitClass_Alpha.static.PrecacheContent(Level);
    }
    // End:0x49
    if(default.BloodHitClass_Gamma != none)
    {
        default.BloodHitClass_Gamma.static.PrecacheContent(Level);
    }
    // End:0x68
    if(default.BloodHitClass_Eta != none)
    {
        default.BloodHitClass_Eta.static.PrecacheContent(Level);
    }
    // End:0x87
    if(default.BloodHitClass_Omega != none)
    {
        default.BloodHitClass_Omega.static.PrecacheContent(Level);
    }
    //return;    
}

defaultproperties
{
    BloodHitClass_Alpha=Class'XEffects_Decompressed.BloodSpurt_Alien'
    BloodHitClass_Gamma=Class'XEffects_Decompressed.BloodSpurt_Alien_Gamma'
    BloodHitClass_Eta=Class'XEffects_Decompressed.BloodSpurt_Alien_Eta'
    BloodHitClass_Kappa=Class'XEffects_Decompressed.BloodSpurt_Alien_Kappa'
    BloodHitClass_Omega=Class'XEffects_Decompressed.BloodSpurt_Alien_Omega'
    BloodHitClass=none
    BloodHitHeadshotClass=none
    BloodHitClass_01=none
    BloodHitClass_02=none
    Teen_BloodHitClass=none
    Teen_BloodHitHeadshotClass=none
    Teen_BloodHitClass_01=none
    Teen_BloodHitClass_02=none
    BloodGibClass=none
}