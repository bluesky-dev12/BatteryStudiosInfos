class xAlienPawnGidGroup extends xPawnGibGroup;

var Class<wEmitter> BloodHitClass_Alpha;
var Class<wEmitter> BloodHitClass_Gamma;
var Class<wEmitter> BloodHitClass_Eta;
var Class<wEmitter> BloodHitClass_Kappa;
var Class<wEmitter> BloodHitClass_Omega;
var Class<Emitter> TransEffectClass_ToAlien;
var Class<Emitter> TransEffectClass_ToHero;
var Class<Emitter> TransEffectClass_ToAlien_1st;
var Class<Emitter> TransEffectClass_ToHero_1st;
var Class<Emitter> EffectClass_DefenceSuccessFromInfection;
var Class<Emitter> BreathingEffectClass;
var Class<Emitter> LevelupEffectClass[3];
var Class<Emitter> SuperHeroEffectClass;
var Class<Emitter> TankerShieldEffectClass;
var Class<Emitter> AlienHealEffectClass;
var Class<Emitter> AlienHealEffectClass_1st;

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
    TransEffectClass_ToAlien=Class'XEffects_Decompressed.Alien_transformation'
    TransEffectClass_ToHero=Class'XEffects_Decompressed.Hero_transformation'
    TransEffectClass_ToAlien_1st=Class'XEffects_Decompressed.Alien_transformation_1ST'
    TransEffectClass_ToHero_1st=Class'XEffects_Decompressed.Hero_transformation_1ST'
    EffectClass_DefenceSuccessFromInfection=Class'XEffects_Decompressed.Alien_infection_defence'
    BreathingEffectClass=Class'XEffects_Decompressed.alien_breath'
    LevelupEffectClass[0]=Class'XEffects_Decompressed.Human_level_up_light_01'
    LevelupEffectClass[1]=Class'XEffects_Decompressed.Human_level_up_light_02'
    LevelupEffectClass[2]=Class'XEffects_Decompressed.Human_level_up_light_03'
    SuperHeroEffectClass=Class'XEffects_Decompressed.Human_awaken'
    TankerShieldEffectClass=Class'XEffects_Decompressed.alien_tankersheld'
    AlienHealEffectClass=Class'XEffects_Decompressed.Alien_healing_skill'
    AlienHealEffectClass_1st=Class'XEffects_Decompressed.Alien_healing_skill_1ST'
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