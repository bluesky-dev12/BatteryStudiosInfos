/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\xPawnGibGroup.uc
 * Package Imports:
 *	XEffects
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:14
 *	Functions:4
 *
 *******************************************************************************/
class xPawnGibGroup extends Object
    abstract;

enum EGibType
{
    EGT_Arm_L,
    EGT_Arm_R,
    EGT_Leg_L,
    EGT_Leg_R,
    EGT_Head,
    EGT_Body,
    EGT_Mix,
    EGT_None
};

var(Gib) array< class<Gib> > Gibs;
var class<wEmitter> BloodHitClass;
var class<wEmitter> BloodHitHeadshotClass;
var class<wEmitter> BloodHitClass_01;
var class<wEmitter> BloodHitClass_02;
var class<wEmitter> Teen_BloodHitClass;
var class<wEmitter> Teen_BloodHitHeadshotClass;
var class<wEmitter> Teen_BloodHitClass_01;
var class<wEmitter> Teen_BloodHitClass_02;
var class<wEmitter> BloodGibClass;
var class<wEmitter> BloodEmitClass;
var class<wEmitter> HelicopterHitClass;
var class<Emitter> IdentificationFriendClass;
var Sound GibSounds;

static function PrecacheContent(LevelInfo Level)
{
    local int i;

    // End:0x1f
    if(default.BloodHitClass != none)
    {
        default.BloodHitClass.static.PrecacheContent(Level);
    }
    // End:0x3e
    if(default.BloodHitHeadshotClass != none)
    {
        default.BloodHitHeadshotClass.static.PrecacheContent(Level);
    }
    // End:0x5d
    if(default.BloodHitClass_01 != none)
    {
        default.BloodHitClass_01.static.PrecacheContent(Level);
    }
    // End:0x7c
    if(default.BloodHitClass_02 != none)
    {
        default.BloodHitClass_02.static.PrecacheContent(Level);
    }
    // End:0x9b
    if(default.Teen_BloodHitClass != none)
    {
        default.Teen_BloodHitClass.static.PrecacheContent(Level);
    }
    // End:0xba
    if(default.Teen_BloodHitHeadshotClass != none)
    {
        default.Teen_BloodHitHeadshotClass.static.PrecacheContent(Level);
    }
    // End:0xd9
    if(default.Teen_BloodHitClass_01 != none)
    {
        default.Teen_BloodHitClass_01.static.PrecacheContent(Level);
    }
    // End:0xf8
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
    J0x15c:
    // End:0x1d9 [While If]
    if(i < default.Gibs.Length)
    {
        // End:0x1ac
        if(default.Gibs[i].default.Skins.Length > 0)
        {
            Level.AddPrecacheMaterial(default.Gibs[i].default.Skins[0]);
        }
        Level.AddPrecacheStaticMesh(default.Gibs[i].default.StaticMesh);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15c;
    }
}

static function class<Gib> GetGibClass(xPawnGibGroup.EGibType gibType)
{
    return default.Gibs[gibType];
}

static function class<wEmitter> GetBloodEmitClass()
{
    return default.BloodEmitClass;
}

static function Sound GibSound()
{
    return default.GibSounds;
}

defaultproperties
{
    Gibs=// Object reference not set to an instance of an object.
    
    BloodHitClass=class'BloodSpurt'
    BloodHitHeadshotClass=class'BloodSpurt_Headshot'
    BloodHitClass_01=class'BloodSmallHit_A'
    BloodHitClass_02=class'BloodSmallHit_B'
    Teen_BloodHitClass=class'BloodSpurt_Teen'
    Teen_BloodHitHeadshotClass=class'BloodSpurt_Headshot_Teen'
    Teen_BloodHitClass_01=class'BloodSpurt_Teen'
    Teen_BloodHitClass_02=class'BloodSpurt_Teen'
    BloodGibClass=class'BloodExplosion'
    BloodEmitClass=class'BloodJet'
    HelicopterHitClass=class'HelicopterHitEffect'
    IdentificationFriendClass=class'Charater_FX_Strobo_light_Blue'
    GibSounds=SoundGroup'Warfare_Sound_Impact.gore.impact_gore'
}