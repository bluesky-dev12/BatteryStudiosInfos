class xPawnGibGroup extends Object
    abstract;

enum EGibType
{
    EGT_Arm_L,                      // 0
    EGT_Arm_R,                      // 1
    EGT_Leg_L,                      // 2
    EGT_Leg_R,                      // 3
    EGT_Head,                       // 4
    EGT_Body,                       // 5
    EGT_Mix,                        // 6
    EGT_None                        // 7
};

var(Gib) array< Class<Gib> > Gibs;
var Class<wEmitter> BloodHitClass;
var Class<wEmitter> BloodHitHeadshotClass;
var Class<wEmitter> BloodHitClass_01;
var Class<wEmitter> BloodHitClass_02;
var Class<wEmitter> Teen_BloodHitClass;
var Class<wEmitter> Teen_BloodHitHeadshotClass;
var Class<wEmitter> Teen_BloodHitClass_01;
var Class<wEmitter> Teen_BloodHitClass_02;
var Class<wEmitter> BloodGibClass;
var Class<wEmitter> BloodEmitClass;
var Class<wEmitter> HelicopterHitClass;
var Class<Emitter> IdentificationFriendClass;
var string GibSounds;

static function PrecacheContent(LevelInfo Level)
{
    local int i;

    // End:0x1F
    if(default.BloodHitClass != none)
    {
        default.BloodHitClass.static.PrecacheContent(Level);
    }
    // End:0x3E
    if(default.BloodHitHeadshotClass != none)
    {
        default.BloodHitHeadshotClass.static.PrecacheContent(Level);
    }
    // End:0x5D
    if(default.BloodHitClass_01 != none)
    {
        default.BloodHitClass_01.static.PrecacheContent(Level);
    }
    // End:0x7C
    if(default.BloodHitClass_02 != none)
    {
        default.BloodHitClass_02.static.PrecacheContent(Level);
    }
    // End:0x9B
    if(default.Teen_BloodHitClass != none)
    {
        default.Teen_BloodHitClass.static.PrecacheContent(Level);
    }
    // End:0xBA
    if(default.Teen_BloodHitHeadshotClass != none)
    {
        default.Teen_BloodHitHeadshotClass.static.PrecacheContent(Level);
    }
    // End:0xD9
    if(default.Teen_BloodHitClass_01 != none)
    {
        default.Teen_BloodHitClass_01.static.PrecacheContent(Level);
    }
    // End:0xF8
    if(default.Teen_BloodHitClass_02 != none)
    {
        default.Teen_BloodHitClass_02.static.PrecacheContent(Level);
    }
    // End:0x117
    if(default.HelicopterHitClass != none)
    {
        default.HelicopterHitClass.static.PrecacheContent(Level);
    }
    // End:0x136
    if(default.BloodGibClass != none)
    {
        default.BloodGibClass.static.PrecacheContent(Level);
    }
    // End:0x155
    if(default.BloodEmitClass != none)
    {
        default.BloodEmitClass.static.PrecacheContent(Level);
    }
    i = 0;
    J0x15C:

    // End:0x1D9 [Loop If]
    if(i < default.Gibs.Length)
    {
        // End:0x1AC
        if(default.Gibs[i].default.Skins.Length > 0)
        {
            Level.AddPrecacheMaterial(default.Gibs[i].default.Skins[0]);
        }
        Level.AddPrecacheStaticMesh(default.Gibs[i].default.StaticMesh);
        i++;
        // [Loop Continue]
        goto J0x15C;
    }
    //return;    
}

static function Class<Gib> GetGibClass(xPawnGibGroup.EGibType gibType)
{
    return default.Gibs[int(gibType)];
    //return;    
}

static function Class<wEmitter> GetBloodEmitClass()
{
    return default.BloodEmitClass;
    //return;    
}

static function string GibSound()
{
    return default.GibSounds;
    //return;    
}

defaultproperties
{
    Gibs[0]=Class'XEffects_Decompressed.GibArmL'
    Gibs[1]=Class'XEffects_Decompressed.GibArmR'
    Gibs[2]=Class'XEffects_Decompressed.GibLegL'
    Gibs[3]=Class'XEffects_Decompressed.GibLegR'
    Gibs[4]=Class'XEffects_Decompressed.GibHead'
    Gibs[5]=Class'XEffects_Decompressed.GibOrganicRedTorso'
    BloodHitClass=Class'XEffects_Decompressed.BloodSpurt'
    BloodHitHeadshotClass=Class'XEffects_Decompressed.BloodSpurt_Headshot'
    BloodHitClass_01=Class'XEffects_Decompressed.BloodSmallHit_A'
    BloodHitClass_02=Class'XEffects_Decompressed.BloodSmallHit_B'
    Teen_BloodHitClass=Class'XEffects_Decompressed.BloodSpurt_Teen'
    Teen_BloodHitHeadshotClass=Class'XEffects_Decompressed.BloodSpurt_Headshot_Teen'
    Teen_BloodHitClass_01=Class'XEffects_Decompressed.BloodSpurt_Teen'
    Teen_BloodHitClass_02=Class'XEffects_Decompressed.BloodSpurt_Teen'
    BloodGibClass=Class'XEffects_Decompressed.BloodExplosion'
    BloodEmitClass=Class'XEffects_Decompressed.BloodJet'
    HelicopterHitClass=Class'XEffects_Decompressed.HelicopterHitEffect'
    IdentificationFriendClass=Class'XEffects_Decompressed.Charater_FX_Strobo_light_Blue'
    GibSounds="Warfare_Sound_Impact/gore/gore_rand"
}