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
var Class<Emitter> effect_Explosion;
var Class<Emitter> effect_Explosion_dirt;
var Class<Emitter> effect_Explosion_grass;
var Class<Emitter> effect_Explosion_metal;
var Class<Emitter> effect_Explosion_snow;
var Class<Emitter> effect_Explosion_water;
var Class<Emitter> effect_Explosion_wood;
var Class<Emitter> effect_Explosion_enemy;
var Class<Emitter> effect_PointMark;
var Class<Emitter> Proj_Smoke;
var Class<Effects> Proj_Corona;
var Class<wEmitter> Proj_ExplosionCrap;
var Class<Projector> Proj_ExplosionDecal;
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
    // End:0x1C
    if(default.szClass_Shell != "")
    {
        DynamicLoadObject(default.szClass_Shell, Class'Core.Class');
    }
    // End:0x38
    if(default.szClass_Shell_3rd != "")
    {
        DynamicLoadObject(default.szClass_Shell_3rd, Class'Core.Class');
    }
    // End:0x54
    if(default.szClass_Clip != "")
    {
        DynamicLoadObject(default.szClass_Clip, Class'Core.Class');
    }
    // End:0x70
    if(default.szClass_Tracer != "")
    {
        DynamicLoadObject(default.szClass_Tracer, Class'Core.Class');
    }
    // End:0x8C
    if(default.szClass_Muzz_1st != "")
    {
        DynamicLoadObject(default.szClass_Muzz_1st, Class'Core.Class');
    }
    // End:0xA8
    if(default.szClass_Muzz_3rd != "")
    {
        DynamicLoadObject(default.szClass_Muzz_3rd, Class'Core.Class');
    }
    // End:0xC4
    if(default.szClass_Smoke_1st != "")
    {
        DynamicLoadObject(default.szClass_Smoke_1st, Class'Core.Class');
    }
    // End:0xE0
    if(default.szClass_Smoke_3rd != "")
    {
        DynamicLoadObject(default.szClass_Smoke_3rd, Class'Core.Class');
    }
    // End:0xFC
    if(default.szClass_Smoke_Silencer_1st != "")
    {
        DynamicLoadObject(default.szClass_Smoke_Silencer_1st, Class'Core.Class');
    }
    // End:0x118
    if(default.szClass_Smoke_Silencer_3rd != "")
    {
        DynamicLoadObject(default.szClass_Smoke_Silencer_3rd, Class'Core.Class');
    }
    //return;    
}

static function PrecacheMaterials(LevelInfo Level)
{
    // End:0x30
    if(default.szIcon_HUD != "")
    {
        Level.AddPrecacheMaterial(Material(DynamicLoadObject(default.szIcon_HUD, Class'Engine_Decompressed.Material')));
    }
    // End:0x60
    if(default.szIcon_Kill != "")
    {
        Level.AddPrecacheMaterial(Material(DynamicLoadObject(default.szIcon_Kill, Class'Engine_Decompressed.Material')));
    }
    //return;    
}

static function PrecacheSound()
{
    // End:0x21
    if(default.sound_Fire_Stereo != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Stereo), Class'Engine_Decompressed.Sound');
    }
    // End:0x42
    if(default.sound_Fire_Silencer_Stereo != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Silencer_Stereo), Class'Engine_Decompressed.Sound');
    }
    // End:0x63
    if(default.sound_Fire != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire), Class'Engine_Decompressed.Sound');
    }
    // End:0x84
    if(default.sound_Fire_Silencer != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Silencer), Class'Engine_Decompressed.Sound');
    }
    // End:0xA5
    if(default.sound_Fire_Shell != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Shell), Class'Engine_Decompressed.Sound');
    }
    // End:0xC6
    if(default.sound_Fire_Empty != none)
    {
        DynamicLoadObject("" $ string(default.sound_Fire_Empty), Class'Engine_Decompressed.Sound');
    }
    // End:0xE7
    if(default.sound_Melee_Ok != none)
    {
        DynamicLoadObject("" $ string(default.sound_Melee_Ok), Class'Engine_Decompressed.Sound');
    }
    // End:0x108
    if(default.sound_Melee_Miss != none)
    {
        DynamicLoadObject("" $ string(default.sound_Melee_Miss), Class'Engine_Decompressed.Sound');
    }
    // End:0x129
    if(default.sound_Reload != none)
    {
        DynamicLoadObject("" $ string(default.sound_Reload), Class'Engine_Decompressed.Sound');
    }
    // End:0x14A
    if(default.sound_ReloadEmpty != none)
    {
        DynamicLoadObject("" $ string(default.sound_ReloadEmpty), Class'Engine_Decompressed.Sound');
    }
    // End:0x16B
    if(default.sound_Select != none)
    {
        DynamicLoadObject("" $ string(default.sound_Select), Class'Engine_Decompressed.Sound');
    }
    // End:0x18C
    if(default.sound_Select_New != none)
    {
        DynamicLoadObject("" $ string(default.sound_Select_New), Class'Engine_Decompressed.Sound');
    }
    // End:0x1AD
    if(default.sound_Pickup != none)
    {
        DynamicLoadObject("" $ string(default.sound_Pickup), Class'Engine_Decompressed.Sound');
    }
    //return;    
}

defaultproperties
{
    rad_Fire=120.0000000
    rad_MeleeFire=60.0000000
    rad_Fire_Silencer=80.0000000
    rad_Fire_Far=300.0000000
    rad_Fire_Stop=300.0000000
    rad_Reload=150.0000000
    rad_Explosion=300.0000000
    rad_Bullet_Move=300.0000000
}