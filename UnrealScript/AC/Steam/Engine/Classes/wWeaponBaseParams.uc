/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponBaseParams.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:7
 *	Properties:206
 *	Functions:4
 *
 *******************************************************************************/
class wWeaponBaseParams extends Object
    native;

enum EDamType
{
    DamType_None,
    DamType_BulletNormal,
    DamType_BulletHeavy,
    DamType_ExploNormal,
    DamType_ExploHeavy
};

enum EBulletType
{
    BulletType_None,
    BulletType_Inst,
    BulletType_Proj
};

enum EReloadType
{
    ReloadType_None,
    ReloadType_Magazine,
    ReloadType_Bullet
};

enum EProjMoveType
{
    ProjMoveType_None,
    ProjMoveType_Throwing,
    ProjMoveType_Rocket,
    ProjMoveType_Flame
};

enum ECrosshairType
{
    CrosshairType_Basic,
    CrosshairType_Image
};

enum EWEAPON_EX_BASE_PARAMS_TYPE
{
    WEXBP_MELEE_DELAY,
    WEXBP_MELEE_DAMAGE,
    WEXBP_MELEE_RANGE,
    WEXBP_MELEE_EXTENT,
    WEXBP_MELEE_DAMAGE_HEAD,
    WEXBP_MELEE_DAMAGE_UPPERTORSO,
    WEXBP_MELEE_DAMAGE_LOWERTORSO,
    WEXBP_MELEE_DAMAGE_UPPERARM,
    WEXBP_MELEE_DAMAGE_LOWERARM,
    WEXBP_MELEE_DAMAGE_UPPERLEG,
    WEXBP_MELEE_DAMAGE_LOWERLEG,
    WEXBP_FIRING_SWAY_HIP_X_MAX_ANGLE,
    WEXBP_FIRING_SWAY_HIP_X_MOVE_ANGLE,
    WEXBP_FIRING_SWAY_HIP_X_MOVE,
    WEXBP_FIRING_SWAY_HIP_Y_MAX_ANGLE,
    WEXBP_FIRING_SWAY_HIP_Y_MOVE_ANGLE,
    WEXBP_FIRING_SWAY_HIP_Y_MOVE,
    WEXBP_FIRING_SWAY_ADS_X_MAX_ANGLE,
    WEXBP_FIRING_SWAY_ADS_X_MOVE_ANGLE,
    WEXBP_FIRING_SWAY_ADS_X_MOVE,
    WEXBP_FIRING_SWAY_ADS_Y_MAX_ANGLE,
    WEXBP_FIRING_SWAY_ADS_Y_MOVE_ANGLE,
    WEXBP_FIRING_SWAY_ADS_Y_MOVE
};

enum EWEAPON_BASE_PARAMS_TYPE
{
    WBP_WEAPON_RESOURCE_ID,
    WBP_FIRE_MODE,
    WBP_WEAPON_TYPE,
    WBP_WEAPON_NUM,
    WBP_WEAPON_PRIORITY,
    WBP_DAMAGE_TYPE,
    WBP_AIM_FIRE,
    WBP_RATE_OF_FIRE,
    WBP_ROUND_BURST_COUNT,
    WBP_ROUND_BURST_TIME,
    WBP_FIRE_DELAY,
    WBP_BULLET_NAME,
    WBP_ZOOM_1,
    WBP_ZOOM_2,
    WBP_OVERHEAT,
    WBP_OVERHEAT_UP,
    WBP_OVERHEAT_DOWN,
    WBP_BULLET_TYPE,
    WBP_PROJECTILE_MOVE_TYPE,
    WBP_BULLET_COUNT,
    WBP_PROJECTILE_SPEED,
    WBP_BULLET_IMPACT_EXPLODE,
    WBP_BULLET_LAND_EXPLODE,
    WBP_PROJECTILE_TAKE_DAMAGE,
    WBP_BULLET_BOUND_DECEL,
    WBP_BULLET_THROW_ROTATE,
    WBP_BULLET_THROW_ANGLE,
    WBP_BULLET_GRAVITY,
    WBP_BOMBING_WEAPON_ID,
    WBP_FUSE_TIME,
    WBP_ACTIVE_TIME,
    WBP_2ND_BULLET_COUNT,
    WBP_MOMENTUM,
    WBP_MOMENTUM_CHAR,
    WBP_GORE_DAMAGE_OUTER,
    WBP_GORE_DAMAGE,
    WBP_DAMAGE_OUTER,
    WBP_DAMAGE,
    WBP_DAMAGE_WALLSHOT,
    WBP_DAMAGE_EFFECTIVE_RANGE,
    WBP_DAMAGE_OUTER_RANGE,
    WBP_PARTS_DAMAGE_HEAD,
    WBP_PARTS_DAMAGE_UPPERTORSO,
    WBP_PARTS_DAMAGE_LOWERTORSO,
    WBP_PARTS_DAMAGE_UPPERARM,
    WBP_PARTS_DAMAGE_LOWERARM,
    WBP_PARTS_DAMAGE_UPPERLEG,
    WBP_PARTS_DAMAGE_LOWERLEG,
    WBP_PARTS_DAMAGE_HEIL,
    WBP_HIT_EFFECT_FRIENDLY,
    WBP_HIT_GUN_KICK,
    WBP_HIT_STUN_TIME,
    WBP_HIT_FREEZE_TIME,
    WBP_HIT_VIEW_FLASH_TIME,
    WBP_HIT_EAXSOUND_TIME,
    WBP_HIT_EAXSOUND_CLASS,
    WBP_HIT_FIRE_TIME,
    WBP_RELOAD_TYPE,
    WBP_RECHAMBER,
    WBP_ANI_TIME_RECHAMER,
    WBP_ANI_TIME_RELOAD,
    WBP_ANI_TIME_RELOAD_EMPTY,
    WBP_ANI_TIME_RELOAD_START,
    WBP_ANI_TIME_RELOAD_END,
    WBP_EXPLOSION_INNER_RADIUS,
    WBP_EXPLOSION_OUTER_RADIUS,
    WBP_GROUND_RUMBLE_RADIUS,
    WBP_GROUND_RUMBLE_FORCE,
    WBP_EXPLOSION_INNER_DAMAGE,
    WBP_EXPLOSION_OUTER_DAMAGE,
    WBP_START_AMMO,
    WBP_CLIP_SIZE,
    WBP_RELOAD_AMMO,
    WBP_MAX_AMMO,
    WBP_SPREAD_2ND_STARTNUM,
    WBP_SPREAD_2ND_ADD,
    WBP_SPREAD_2ND_MAX,
    WBP_SPREAD_AIM_MOVE_ADD,
    WBP_SPREAD_VISUAL_ADD,
    WBP_SPREAD_SHOTGUN,
    WBP_SPREAD_JUMP,
    WBP_SPREAD_STAND_MIN,
    WBP_SPREAD_STAND_MAX,
    WBP_SPREAD_DUCKED_MIN,
    WBP_SPREAD_DUCKED_MAX,
    WBP_SPREAD_PRONE_MIN,
    WBP_SPREAD_PRONE_MAX,
    WBP_SPREAD_MOVE_ADD,
    WBP_SPREAD_FIRE_ADD,
    WBP_SPREAD_OUT_SPEED,
    WBP_SPREAD_STAND_IN_RT,
    WBP_SPREAD_DUCKED_IN_RT,
    WBP_SPREAD_PRONE_IN_RT,
    WBP_VIEW_KICK_HIP_X_MIN,
    WBP_VIEW_KICK_HIP_X_MAX,
    WBP_VIEW_KICK_HIP_Y_MIN,
    WBP_VIEW_KICK_HIP_Y_MAX,
    WBP_VIEW_KICK_HIP_ACCEL,
    WBP_VIEW_KICK_HIP_DECEL,
    WBP_VIEW_KICK_HIP_STAY_TIME,
    WBP_VIEW_KICK_HIP_DECAY_SPEED,
    WBP_VIEW_KICK_HIP_DECAY_TIME_FAST,
    WBP_VIEW_KICK_ADS_X_MIN,
    WBP_VIEW_KICK_ADS_X_MAX,
    WBP_VIEW_KICK_ADS_Y_MIN,
    WBP_VIEW_KICK_ADS_Y_MAX,
    WBP_VIEW_KICK_ADS_ACCEL,
    WBP_VIEW_KICK_ADS_DECEL,
    WBP_VIEW_KICK_ADS_STAY_TIME,
    WBP_VIEW_KICK_ADS_DECAY_SPEED,
    WBP_VIEW_KICK_ADS_DECAY_TIME_FAST,
    WBP_BREATH_STAND_GUN,
    WBP_BREATH_STAND_GUN_SPEED,
    WBP_BREATH_ADS_GUNNAIM,
    WBP_BREATH_ADS_GUNNAIM_SPEED,
    WBP_BREATH_ADS_DUCKED_GUNNAIM,
    WBP_BREATH_ADS_DUCKED_GUNNAIM_SPEED,
    WBP_BREATH_ADS_PRONE_GUNNAIM,
    WBP_BREATH_ADS_PRONE_GUNNAIM_SPEED,
    WBP_BOB_SPRINT_GUN,
    WBP_BOB_SPRINT_GUN_Y,
    WBP_BOB_SPRINT_VIEW,
    WBP_BOB_SPRINT_VIEW_Y,
    WBP_BOB_ADS_MOVE_GUNNAIM,
    WBP_BOB_ADS_MOVE_GUNNAIM_Y,
    WBP_BOB_ADS_MOVE_VIEW,
    WBP_BOB_ADS_MOVE_VIEW_Y,
    WBP_BOB_HIP_MOVE_GUN,
    WBP_BOB_HIP_MOVE_GUN_Y,
    WBP_BOB_HIP_MOVE_VIEW,
    WBP_BOB_HIP_MOVE_VIEW_Y,
    WBP_BOB_HIP_DUCKED_MOVE_GUN,
    WBP_BOB_HIP_DUCKED_MOVE_GUN_Y,
    WBP_BOB_HIP_DUCKED_MOVE_VIEW,
    WBP_BOB_HIP_DUCKED_MOVE_VIEW_Y,
    WBP_BOB_HIP_PRONE_MOVE_VIEW,
    WBP_BOB_HIP_PRONE_MOVE_VIEW_Y,
    WBP_WP_SPRINT_STA_RATE,
    WBP_WP_SPRINT_STA_RECOVERY,
    WBP_WP_GUN_MOVE_SPEED,
    WBP_WP_GUN_MOVE_TIME,
    WBP_WP_GUN_MOVE_DELAY,
    WBP_WP_SPRINT_MOVE,
    WBP_WP_STAND_MOVE,
    WBP_WP_CROUCH_MOVE,
    WBP_WP_PRONE_MOVE,
    WBP_WP_AIM_MOVE,
    WBP_WP_CROUCH_AIM_MOVE,
    WBP_ANI_RATE_DROP,
    WBP_ANI_RATE_DROP_QUICK,
    WBP_DROP_QUICK,
    WBP_ANI_RATE_RAISE,
    WBP_ANI_RATE_SPRINT_RAISE,
    WBP_ANI_RATE_ADS_ON,
    WBP_ANI_RATE_ADS_OFF,
    WBP_SWAY_GUN_HIP_X_MAX_ANGLE,
    WBP_SWAY_GUN_HIP_X_MOVE_ANGLE,
    WBP_SWAY_GUN_HIP_X_MOVE,
    WBP_SWAY_GUN_HIP_Y_MAX_ANGLE,
    WBP_SWAY_GUN_HIP_Y_MOVE_ANGLE,
    WBP_SWAY_GUN_HIP_Y_MOVE,
    WBP_SWAY_GUN_ADS_X_MAX_ANGLE,
    WBP_SWAY_GUN_ADS_X_MOVE_ANGLE,
    WBP_SWAY_GUN_ADS_X_MOVE,
    WBP_SWAY_GUN_ADS_Y_MAX_ANGLE,
    WBP_SWAY_GUN_ADS_Y_MOVE_ANGLE,
    WBP_SWAY_GUN_ADS_Y_MOVE,
    WBP_VIEW_ANGLE_PITCH_MAX,
    WBP_CROSSHAIR_TYPE,
    WBP_CROSSHAIR_IMAGE,
    WBP_GUN_POS_HIP_MOVE_FRONT_Y,
    WBP_GUN_POS_HIP_MOVE_FRONT_X,
    WBP_UI_DAMAGE,
    WBP_UI_SPREAD,
    WBP_UI_VIEW_KICK,
    WBP_UI_RATE_OF_FIRE,
    WBP_UI_MOVE,
    WBP_UI_RANGE,
    WBP_NPC_SPREAD_RATE,
    WBP_NPC_RATE_OF_FIRE,
    WBP_NPC_FIRE
};

var(Base) editconst Actor.eWeaponType eType;
var(Base) editconst string strName;
var(Base) editconst int iWeaponID;
var(Base) int iInventoryGroup;
var(Base) int iPriority;
var(Resource) editconst string szClass_Resource;
var(Firing) int iFireMode;
var(Firing) bool bAimAvailable;
var(Firing) float fRateOfFire;
var(Firing) float fFireDelay;
var(Firing) float fMeleeDelay;
var(Firing) int iRoundBurstCount;
var(Firing) float fRoundBurstTime;
var(Zoom) float fZoomFOV;
var(OverHeat) bool bOverHeat;
var(OverHeat) float fOverHeat_Up;
var(OverHeat) float fOverHeat_Down;
var(Bullet) wWeaponBaseParams.EBulletType BulletType;
var(Bullet) wWeaponBaseParams.EProjMoveType ProjMoveType;
var(Bullet) int iBulletCount;
var(Bullet) float fProjSpeed;
var(Bullet) bool bExplodeCollide;
var(Bullet) bool bProjTakeDamage;
var(Bullet) int iBombWeaponID;
var(Bullet) float fFuseTime;
var(Bullet) float fActiveTime;
var(Bullet) float fProjDecelEachBound;
var(Bullet) float fProjSpin;
var(Bullet) float fProjThrowPitch;
var(Bullet) int i2ndBulletCount;
var(Bullet) bool bBulletLandExplode;
var(Damage) wWeaponBaseParams.EDamType damtype;
var(Damage) int iDamage;
var(Damage) float fDamWallShot;
var(Damage) float fMomentum;
var(Damage) float fMomentum_Pawn;
var(Damage) float fDamRange_Eff;
var(Damage) float fDamRange_Max;
var(Damage) int iDam_OOR;
var(Damage) int iDamMelee;
var(Damage) int iMeleeRange;
var(Damage) int iMeleeExtent;
var(Damage) float fMeleeDam_Head;
var(Damage) float fMeleeDam_UpperTorso;
var(Damage) float fMeleeDam_LowerTorso;
var(Damage) float fMeleeDam_UpperArm;
var(Damage) float fMeleeDam_LowerArm;
var(Damage) float fMeleeDam_UpperLeg;
var(Damage) float fMeleeDam_LowerLeg;
var(Damage) float fDamPerc_Head;
var(Damage) float fDamPerc_UpperTorso;
var(Damage) float fDamPerc_LowerTorso;
var(Damage) float fDamPerc_UpperArm;
var(Damage) float fDamPerc_LowerArm;
var(Damage) float fDamPerc_UpperLeg;
var(Damage) float fDamPerc_LowerLeg;
var(Damage) float fDamPerc_Heli;
var(Hit) bool bHitEffFriendly;
var(Hit) float fHitGunKick;
var(Hit) float fHitStunTime;
var(Hit) float fHitFlashTime;
var(Hit) float fHitFireTime;
var(Hit) float fHitFreezeTime;
var(Hit) float fHitEAXEffectTime;
var(Hit) string strHitEAXEffectClass;
var(Reload) wWeaponBaseParams.EReloadType ReloadType;
var(Reload) bool bRechamber;
var(Reload) float fRechamberRate;
var(Reload) float fReloadRate;
var(Reload) float fReloadEmptyRate;
var(Reload) float fReloadBeginRate;
var(Reload) float fReloadEndRate;
var(Gravity) float fBulletGravity;
var(Explosion) float fExplRad_Inner;
var(Explosion) float fExplRad_Outer;
var(Explosion) float fExplDam_Inner;
var(Explosion) float fExplDam_Outer;
var(Explosion) float fExplForce_Effect;
var(Explosion) float fExplRad_Effect;
var(Ammo) int iAmmo_Magazine;
var(Ammo) int iAmmo_Reload;
var(Ammo) int iAmmo_Initial;
var(Ammo) int iAmmo_Max;
var(Spread) int iSpread_2nd_StartNum;
var(Spread) float fSpread_2nd_Add;
var(Spread) float fSpread_2nd_Max;
var(Spread) int iSpread_Visual_Add;
var(Spread) float fSpread_Shotgun;
var(Spread) float fSpread_Jump;
var(Spread) float fSpread_Stand_Min;
var(Spread) float fSpread_Stand_Max;
var(Spread) float fSpread_Ducked_Min;
var(Spread) float fSpread_Ducked_Max;
var(Spread) float fSpread_Prone_Min;
var(Spread) float fSpread_Prone_Max;
var(Spread) float fSpread_Move_Add;
var(Spread) float fSpread_Fire_Add;
var(Spread) float fSpread_Image_Increase;
var(Spread) float fSpread_Stand_Reduce;
var(Spread) float fSpread_Ducked_Reduce;
var(Spread) float fSpread_Prone_Reduce;
var(Spread) float fSpread_Aim_move_add;
var(Recoil) float fViewKickHip_XMin;
var(Recoil) float fViewKickHip_XMax;
var(Recoil) float fViewKickHip_YMin;
var(Recoil) float fViewKickHip_YMax;
var(Recoil) float fViewKickHip_Accel;
var(Recoil) float fViewKickHip_Decel;
var(Recoil) float fViewKickHip_StayTime;
var(Recoil) float fViewKickHip_DecaySpeed;
var(Recoil) float fViewKickHip_DecayTimeFast;
var(Recoil) float fViewKickAds_XMin;
var(Recoil) float fViewKickAds_XMax;
var(Recoil) float fViewKickAds_YMin;
var(Recoil) float fViewKickAds_YMax;
var(Recoil) float fViewKickAds_Accel;
var(Recoil) float fViewKickAds_Decel;
var(Recoil) float fViewKickAds_StayTime;
var(Recoil) float fViewKickAds_DecaySpeed;
var(Recoil) float fViewKickAds_DecayTimeFast;
var(Anim) float fAnimRate_PutDown;
var(Anim) float fAnimRate_PutDown_Quick;
var(Anim) float fAnimRate_BringUp;
var(Anim) float fAnimRate_SprintBringUp;
var(Anim) float fAnimRate_AdsOn;
var(Anim) float fAnimRate_AdsOff;
var(Anim) bool bApplyQuickDrop;
var(View) float fMaxPitch;
var(View) int iCrossHair;
var(View) float fMovePivot;
var(MoveSpeed) float fSprintStaminaRate;
var(MoveSpeed) float fSprintSpeed;
var(MoveSpeed) float fRunSpeed;
var(MoveSpeed) float fCrouchSpeed;
var(MoveSpeed) float fPronedSpeed;
var(MoveSpeed) float fAimRunSpeed;
var(MoveSpeed) float fAimCrouchSpeed;
var(MoveSpeed) float fStaminaRecovery;
var(MoveSpeed) float fHitMoveSpeed;
var(MoveSpeed) float fHitMoveTime;
var(MoveSpeed) float fHitMoveDelay;
var(Aim) float fBreathRadius_Idle;
var(Aim) float fBreathSpeed_Idle;
var(Aim) float fBreathRadius_Aim;
var(Aim) float fBreathSpeed_Aim;
var(Aim) float fBreathRadius_DuckedAim;
var(Aim) float fBreathSpeed_DuckedAim;
var(Aim) float fBreathRadius_ProneAim;
var(Aim) float fBreathSpeed_ProneAim;
var(Bobbing) float fBobWeapon_Move;
var(Bobbing) float fBobScreen_Move;
var(Bobbing) float fBobWeapon_Ads_Move;
var(Bobbing) float fBobScreen_Ads_Move;
var(Bobbing) float fBobWeapon_Ducked_Move;
var(Bobbing) float fBobScreen_Ducked_Move;
var(Bobbing) float fBobScreen_Prone_Move;
var(Bobbing) float fBobWeapon_Sprint_Move;
var(Bobbing) float fBobScreen_Sprint_Move;
var(Bobbing) float fBobWeapon_sprint_y;
var(Bobbing) float fBobScreen_sprint_y;
var(Bobbing) float fBobWeapon_ads_move_y;
var(Bobbing) float fBobScreen_ads_move_y;
var(Bobbing) float fBobWeapon_move_y;
var(Bobbing) float fBobScreen_move_y;
var(Bobbing) float fBobWeapon_ducked_move_y;
var(Bobbing) float fBobScreen_ducked_move_y;
var(Bobbing) float fBobScreen_prone_move_y;
var(Sway) float fSway_HipX_Max;
var(Sway) float fSway_HipX_Incr;
var(Sway) float fSway_HipX_Speed;
var(Sway) float fSway_HipY_Max;
var(Sway) float fSway_HipY_Incr;
var(Sway) float fSway_HipY_Speed;
var(Sway) float fSway_AdsX_Max;
var(Sway) float fSway_AdsX_Incr;
var(Sway) float fSway_AdsX_Speed;
var(Sway) float fSway_AdsY_Max;
var(Sway) float fSway_AdsY_Incr;
var(Sway) float fSway_AdsY_Speed;
var(Sway) float fFiringSway_HipX_Max;
var(Sway) float fFiringSway_HipX_Incr;
var(Sway) float fFiringSway_HipX_Speed;
var(Sway) float fFiringSway_HipY_Max;
var(Sway) float fFiringSway_HipY_Incr;
var(Sway) float fFiringSway_HipY_Speed;
var(Sway) float fFiringSway_AdsX_Max;
var(Sway) float fFiringSway_AdsX_Incr;
var(Sway) float fFiringSway_AdsX_Speed;
var(Sway) float fFiringSway_AdsY_Max;
var(Sway) float fFiringSway_AdsY_Incr;
var(Sway) float fFiringSway_AdsY_Speed;
var(Crosshair) wWeaponBaseParams.ECrosshairType CrosshairType;
var(Crosshair) string CrosshairImage;
var float fNPCSpreadRate;
var float fNPCRateOfFire;
var int iNPCFire;
var float wt_BoundingMax;
var float wt_RandomMul;
var array<float> wt_x;
var array<float> wt_y;
var array<float> wt_RandomWeight;
var float wtAim_BoundingMax;
var float wtAim_RandomMul;
var array<float> wtAim_x;
var array<float> wtAim_y;
var array<float> wtAim_RandomWeight;

function wWeaponBaseParams.EBulletType GetBulletType(string szValue)
{
    switch(szValue)
    {
        // End:0x16
        case "Instant":
            return 1;
        // End:0x28
        case "Projectile":
            return 2;
        // End:0xffff
        default:
            return byte(-1);
    }
}

function wWeaponBaseParams.EProjMoveType GetProjMoveType(string szValue)
{
    switch(szValue)
    {
        // End:0x11
        case "TW":
            return 1;
        // End:0x1c
        case "RPG":
            return 2;
        // End:0x30
        case "FlameThrower":
            return 3;
        // End:0xffff
        default:
            return byte(-1);
    }
}

function wWeaponBaseParams.EReloadType GetReloadType(string szValue)
{
    switch(szValue)
    {
        // End:0x17
        case "Magazine":
            return 1;
        // End:0x25
        case "Bullet":
            return 2;
        // End:0xffff
        default:
            return byte(-1);
    }
}

function wWeaponBaseParams.ECrosshairType GetCrosshairType(string szValue)
{
    switch(szValue)
    {
        // End:0x14
        case "basic":
            return 0;
        // End:0x21
        case "image":
            return 1;
        // End:0xffff
        default:
            return byte(-1);
    }
}

defaultproperties
{
    strName="Btr_Weapon"
    iWeaponID=-1
    fBulletGravity=1.0
    fSprintSpeed=570.0
    fRunSpeed=370.0
    fCrouchSpeed=252.0
    fPronedSpeed=100.0
    fAimRunSpeed=122.0
    fAimCrouchSpeed=83.0
}