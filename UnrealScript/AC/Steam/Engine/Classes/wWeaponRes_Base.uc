/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponRes_Base.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:67
 *	Functions:3
 *
 *******************************************************************************/
class wWeaponRes_Base extends DamageType
    notplaceable;

var int iResourceID;
var string szName;
var StaticMesh stProj;
var string szClass_Shell;
var string szClass_Shell_3rd;
var string szClass_Clip;
var string szClass_Tracer;
var float fTracerPop;
var string szClass_Muzz_1st;
var string szClass_Muzz_3rd;
var string szClass_Smoke_1st;
var string szClass_Smoke_3rd;
var string szClass_Smoke_Silencer_1st;
var string szClass_Smoke_Silencer_3rd;
var class<Emitter> effect_Explosion;
var class<Emitter> effect_Explosion_dirt;
var class<Emitter> effect_Explosion_grass;
var class<Emitter> effect_Explosion_metal;
var class<Emitter> effect_Explosion_snow;
var class<Emitter> effect_Explosion_water;
var class<Emitter> effect_Explosion_wood;
var class<Emitter> effect_Explosion_enemy;
var class<Emitter> effect_PointMark;
var class<Emitter> Proj_Smoke;
var class<Effects> Proj_Corona;
var class<wEmitter> Proj_ExplosionCrap;
var class<Projector> Proj_ExplosionDecal;
var string szIcon_HUD;
var string szIcon_Kill;
var IntBoxWH ibIcon_Kill;
var string szIcon_Ammo;
var string szType_DisplayAmmo;
var Sound sound_Ready;
var Sound sound_Fire;
var Sound sound_Fire_Stereo;
var Sound sound_Fire_Silencer;
var Sound sound_Fire_Silencer_Stereo;
var Sound sound_Fire_Far;
var Sound sound_Fire_Stop;
var Sound sound_Fire_Shell;
var Sound sound_Fire_Empty;
var Sound sound_Explosion;
var Sound sound_Melee_Ok;
var Sound sound_Melee_Miss;
var Sound sound_Rechamber;
var Sound sound_Reload;
var Sound sound_ReloadEmpty;
var Sound sound_ReloadBegin;
var Sound sound_ReloadEnd;
var Sound sound_Select;
var Sound sound_Pickup;
var Sound sound_Bullet_Impact;
var Sound sound_Bullet_Move;
var Sound sound_Select_New;
var string sound_Select_PackType;
var string str_sound_Grenade;
var float rad_Fire;
var float rad_MeleeFire;
var float rad_Fire_Silencer;
var float rad_Fire_Far;
var float rad_Fire_Stop;
var float rad_Reload;
var float rad_Explosion;
var float rad_Bullet_Move;
var bool UseWarhead;
var int iCollisionRadius;
var int iCollisionHeight;

static function PrecacheClasses()
{
    // End:0x1c
    if(default.szClass_Shell != "")
    {
        DynamicLoadObject(default.szClass_Shell, class'Class');
    }
    // End:0x38
    if(default.szClass_Shell_3rd != "")
    {
        DynamicLoadObject(default.szClass_Shell_3rd, class'Class');
    }
    // End:0x54
    if(default.szClass_Clip != "")
    {
        DynamicLoadObject(default.szClass_Clip, class'Class');
    }
    // End:0x70
    if(default.szClass_Tracer != "")
    {
        DynamicLoadObject(default.szClass_Tracer, class'Class');
    }
    // End:0x8c
    if(default.szClass_Muzz_1st != "")
    {
        DynamicLoadObject(default.szClass_Muzz_1st, class'Class');
    }
    // End:0xa8
    if(default.szClass_Muzz_3rd != "")
    {
        DynamicLoadObject(default.szClass_Muzz_3rd, class'Class');
    }
    // End:0xc4
    if(default.szClass_Smoke_1st != "")
    {
        DynamicLoadObject(default.szClass_Smoke_1st, class'Class');
    }
    // End:0xe0
    if(default.szClass_Smoke_3rd != "")
    {
        DynamicLoadObject(default.szClass_Smoke_3rd, class'Class');
    }
    // End:0xfc
    if(default.szClass_Smoke_Silencer_1st != "")
    {
        DynamicLoadObject(default.szClass_Smoke_Silencer_1st, class'Class');
    }
    // End:0x118
    if(default.szClass_Smoke_Silencer_3rd != "")
    {
        DynamicLoadObject(default.szClass_Smoke_Silencer_3rd, class'Class');
    }
}

static function PrecacheMaterials(LevelInfo Level)
{
    // End:0x30
    if(default.szIcon_HUD != "")
    {
        Level.AddPrecacheMaterial(Material(DynamicLoadObject(default.szIcon_HUD, class'Material')));
    }
    // End:0x60
    if(default.szIcon_Kill != "")
    {
        Level.AddPrecacheMaterial(Material(DynamicLoadObject(default.szIcon_Kill, class'Material')));
    }
}

static function PrecacheSound()
{
    // End:0x21
    if(default.sound_Fire_Stereo != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Stereo), class'Sound');
    }
    // End:0x42
    if(default.sound_Fire_Silencer_Stereo != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Silencer_Stereo), class'Sound');
    }
    // End:0x63
    if(default.sound_Fire != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire), class'Sound');
    }
    // End:0x84
    if(default.sound_Fire_Silencer != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Silencer), class'Sound');
    }
    // End:0xa5
    if(default.sound_Fire_Shell != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Shell), class'Sound');
    }
    // End:0xc6
    if(default.sound_Fire_Empty != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Empty), class'Sound');
    }
    // End:0xe7
    if(default.sound_Melee_Ok != none)
    {
        DynamicLoadObject("" $ string(default.sound_Melee_Ok), class'Sound');
    }
    // End:0x108
    if(default.sound_Melee_Miss != none)
    {
        DynamicLoadObject("" $ string(default.sound_Melee_Miss), class'Sound');
    }
    // End:0x129
    if(default.sound_Reload != none)
    {
        DynamicLoadObject("" $ string(default.sound_Reload), class'Sound');
    }
    // End:0x14a
    if(default.sound_ReloadEmpty != none)
    {
        DynamicLoadObject("" $ string(default.sound_ReloadEmpty), class'Sound');
    }
    // End:0x16b
    if(default.sound_Select != none)
    {
        DynamicLoadObject("" $ string(default.sound_Select), class'Sound');
    }
    // End:0x18c
    if(default.sound_Select_New != none)
    {
        DynamicLoadObject("" $ string(default.sound_Select_New), class'Sound');
    }
    // End:0x1ad
    if(default.sound_Pickup != none)
    {
        DynamicLoadObject("" $ string(default.sound_Pickup), class'Sound');
    }
}

defaultproperties
{
    rad_Fire=120.0
    rad_MeleeFire=60.0
    rad_Fire_Silencer=80.0
    rad_Fire_Far=300.0
    rad_Fire_Stop=300.0
    rad_Reload=150.0
    rad_Explosion=300.0
    rad_Bullet_Move=300.0
}