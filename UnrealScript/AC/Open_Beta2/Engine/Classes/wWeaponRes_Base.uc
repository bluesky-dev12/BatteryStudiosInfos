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
var Class<Effects> effect_Melee_Attack1;
var Class<Effects> effect_Melee_Attack2;
var Class<Emitter> effect_Explosion;
var Class<Emitter> effect_Explosion_dirt;
var Class<Emitter> effect_Explosion_grass;
var Class<Emitter> effect_Explosion_metal;
var Class<Emitter> effect_Explosion_snow;
var Class<Emitter> effect_Explosion_water;
var Class<Emitter> effect_Explosion_wood;
var Class<Emitter> effect_Explosion_enemy;
var Class<Emitter> effect_PointMark;
var Class<Emitter> effect_StartFuse;
var Class<Emitter> effect_Idle_1st;
var Class<Emitter> effect_Idle_3rd;
var Class<Emitter> Proj_Smoke;
var Class<Emitter> Proj_SmokeEx;
var Class<Effects> Proj_Corona;
var Class<Effects> Proj_CoronaEx;
var Class<wEmitter> Proj_ExplosionCrap;
var Class<Projector> Proj_ExplosionDecal;
var string szIcon_HUD;
var string szIcon_Kill;
var IntBoxWH ibIcon_Kill;
var string szIcon_Ammo;
var string szType_DisplayAmmo;
var Sound sound_Start_Fuse;
var string fsound_Ready;
var string fsound_Fire;
var string fsound_Fire_Stereo;
var string fSound_Fire_Silencer;
var string fsound_Fire_Silencer_Stereo;
var string fsound_Fire_Far;
var string fsound_Fire_Stop;
var string fsound_Fire_Shell;
var string fsound_Fire_Empty;
var string fsound_Explosion;
var string fsound_Melee_Ok;
var string fsound_Melee_Miss;
var string fsound_Rechamber;
var string fsound_Reload;
var string fsound_ReloadEmpty;
var string fsound_ReloadBegin;
var string fsound_ReloadEnd;
var string fsound_Select;
var string fsound_Pickup;
var string fsound_Bullet_Impact;
var string fsound_Bullet_Move;
var string fsound_Select_New;
var string fsound_Start_Fuse;
var string sound_Select_PackType;
var string str_sound_Grenade;
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
    //return;    
}
