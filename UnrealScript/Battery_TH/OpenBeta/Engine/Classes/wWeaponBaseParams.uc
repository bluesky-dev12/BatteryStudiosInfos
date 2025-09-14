class wWeaponBaseParams extends Object
    native;

enum EDamType
{
    DamType_None,                   // 0
    DamType_BulletNormal,           // 1
    DamType_BulletHeavy,            // 2
    DamType_ExploNormal,            // 3
    DamType_ExploHeavy              // 4
};

enum EBulletType
{
    BulletType_None,                // 0
    BulletType_Inst,                // 1
    BulletType_Proj                 // 2
};

enum EReloadType
{
    ReloadType_None,                // 0
    ReloadType_Magazine,            // 1
    ReloadType_Bullet               // 2
};

enum EProjMoveType
{
    ProjMoveType_None,              // 0
    ProjMoveType_Throwing,          // 1
    ProjMoveType_Rocket,            // 2
    ProjMoveType_Flame              // 3
};

enum ECrosshairType
{
    CrosshairType_Basic,            // 0
    CrosshairType_Image             // 1
};

enum EWEAPON_BASE_PARAMS_TYPE
{
    WBP_WEAPON_RESOURCE_ID,         // 0
    WBP_FIRE_MODE,                  // 1
    WBP_WEAPON_TYPE,                // 2
    WBP_WEAPON_NUM,                 // 3
    WBP_WEAPON_PRIORITY,            // 4
    WBP_DAMAGE_TYPE,                // 5
    WBP_AIM_FIRE,                   // 6
    WBP_RATE_OF_FIRE,               // 7
    WBP_ROUND_BURST_COUNT,          // 8
    WBP_ROUND_BURST_TIME,           // 9
    WBP_FIRE_DELAY,                 // 10
    WBP_MELEE_DELAY,                // 11
    WBP_BULLET_NAME,                // 12
    WBP_ZOOM_1,                     // 13
    WBP_ZOOM_2,                     // 14
    WBP_OVERHEAT,                   // 15
    WBP_OVERHEAT_UP,                // 16
    WBP_OVERHEAT_DOWN,              // 17
    WBP_BULLET_TYPE,                // 18
    WBP_PROJECTILE_MOVE_TYPE,       // 19
    WBP_BULLET_COUNT,               // 20
    WBP_PROJECTILE_SPEED,           // 21
    WBP_BULLET_IMPACT_EXPLODE,      // 22
    WBP_BULLET_LAND_EXPLODE,        // 23
    WBP_PROJECTILE_TAKE_DAMAGE,     // 24
    WBP_BULLET_BOUND_DECEL,         // 25
    WBP_BULLET_THROW_ROTATE,        // 26
    WBP_BULLET_THROW_ANGLE,         // 27
    WBP_BULLET_GRAVITY,             // 28
    WBP_BOMBING_WEAPON_ID,          // 29
    WBP_FUSE_TIME,                  // 30
    WBP_ACTIVE_TIME,                // 31
    WBP_2ND_BULLET_COUNT,           // 32
    WBP_MOMENTUM,                   // 33
    WBP_MOMENTUM_CHAR,              // 34
    WBP_GORE_DAMAGE_OUTER,          // 35
    WBP_GORE_DAMAGE,                // 36
    WBP_DAMAGE_OUTER,               // 37
    WBP_DAMAGE,                     // 38
    WBP_DAMAGE_EFFECTIVE_RANGE,     // 39
    WBP_DAMAGE_OUTER_RANGE,         // 40
    WBP_PARTS_DAMAGE_HEAD,          // 41
    WBP_PARTS_DAMAGE_UPPERTORSO,    // 42
    WBP_PARTS_DAMAGE_LOWERTORSO,    // 43
    WBP_PARTS_DAMAGE_UPPERARM,      // 44
    WBP_PARTS_DAMAGE_LOWERARM,      // 45
    WBP_PARTS_DAMAGE_UPPERLEG,      // 46
    WBP_PARTS_DAMAGE_LOWERLEG,      // 47
    WBP_PARTS_DAMAGE_HEIL,          // 48
    WBP_HIT_EFFECT_FRIENDLY,        // 49
    WBP_HIT_GUN_KICK,               // 50
    WBP_HIT_STUN_TIME,              // 51
    WBP_HIT_FREEZE_TIME,            // 52
    WBP_HIT_VIEW_FLASH_TIME,        // 53
    WBP_HIT_EAXSOUND_TIME,          // 54
    WBP_HIT_EAXSOUND_CLASS,         // 55
    WBP_HIT_FIRE_TIME,              // 56
    WBP_MELEE_DAMAGE,               // 57
    WBP_RELOAD_TYPE,                // 58
    WBP_RECHAMBER,                  // 59
    WBP_ANI_TIME_RECHAMER,          // 60
    WBP_ANI_TIME_RELOAD,            // 61
    WBP_ANI_TIME_RELOAD_EMPTY,      // 62
    WBP_ANI_TIME_RELOAD_START,      // 63
    WBP_ANI_TIME_RELOAD_END,        // 64
    WBP_EXPLOSION_INNER_RADIUS,     // 65
    WBP_EXPLOSION_OUTER_RADIUS,     // 66
    WBP_GROUND_RUMBLE_RADIUS,       // 67
    WBP_GROUND_RUMBLE_FORCE,        // 68
    WBP_EXPLOSION_INNER_DAMAGE,     // 69
    WBP_EXPLOSION_OUTER_DAMAGE,     // 70
    WBP_START_AMMO,                 // 71
    WBP_CLIP_SIZE,                  // 72
    WBP_RELOAD_AMMO,                // 73
    WBP_MAX_AMMO,                   // 74
    WBP_SPREAD_AIM_MOVE_ADD,        // 75
    WBP_SPREAD_JUMP,                // 76
    WBP_SPREAD_STAND_MIN,           // 77
    WBP_SPREAD_STAND_MAX,           // 78
    WBP_SPREAD_DUCKED_MIN,          // 79
    WBP_SPREAD_DUCKED_MAX,          // 80
    WBP_SPREAD_PRONE_MIN,           // 81
    WBP_SPREAD_PRONE_MAX,           // 82
    WBP_SPREAD_MOVE_ADD,            // 83
    WBP_SPREAD_FIRE_ADD,            // 84
    WBP_SPREAD_OUT_SPEED,           // 85
    WBP_SPREAD_STAND_IN_RT,         // 86
    WBP_SPREAD_DUCKED_IN_RT,        // 87
    WBP_SPREAD_PRONE_IN_RT,         // 88
    WBP_VIEW_KICK_HIP_X_MIN,        // 89
    WBP_VIEW_KICK_HIP_X_MAX,        // 90
    WBP_VIEW_KICK_HIP_Y_MIN,        // 91
    WBP_VIEW_KICK_HIP_Y_MAX,        // 92
    WBP_VIEW_KICK_HIP_ACCEL,        // 93
    WBP_VIEW_KICK_HIP_DECEL,        // 94
    WBP_VIEW_KICK_HIP_STAY_TIME,    // 95
    WBP_VIEW_KICK_HIP_DECAY_SPEED,  // 96
    WBP_VIEW_KICK_HIP_DECAY_TIME_FAST,// 97
    WBP_VIEW_KICK_ADS_X_MIN,        // 98
    WBP_VIEW_KICK_ADS_X_MAX,        // 99
    WBP_VIEW_KICK_ADS_Y_MIN,        // 100
    WBP_VIEW_KICK_ADS_Y_MAX,        // 101
    WBP_VIEW_KICK_ADS_ACCEL,        // 102
    WBP_VIEW_KICK_ADS_DECEL,        // 103
    WBP_VIEW_KICK_ADS_STAY_TIME,    // 104
    WBP_VIEW_KICK_ADS_DECAY_SPEED,  // 105
    WBP_VIEW_KICK_ADS_DECAY_TIME_FAST,// 106
    WBP_BREATH_STAND_GUN,           // 107
    WBP_BREATH_STAND_GUN_SPEED,     // 108
    WBP_BREATH_ADS_GUNNAIM,         // 109
    WBP_BREATH_ADS_GUNNAIM_SPEED,   // 110
    WBP_BREATH_ADS_DUCKED_GUNNAIM,  // 111
    WBP_BREATH_ADS_DUCKED_GUNNAIM_SPEED,// 112
    WBP_BREATH_ADS_PRONE_GUNNAIM,   // 113
    WBP_BREATH_ADS_PRONE_GUNNAIM_SPEED,// 114
    WBP_BOB_SPRINT_GUN,             // 115
    WBP_BOB_SPRINT_GUN_Y,           // 116
    WBP_BOB_SPRINT_VIEW,            // 117
    WBP_BOB_SPRINT_VIEW_Y,          // 118
    WBP_BOB_ADS_MOVE_GUNNAIM,       // 119
    WBP_BOB_ADS_MOVE_GUNNAIM_Y,     // 120
    WBP_BOB_ADS_MOVE_VIEW,          // 121
    WBP_BOB_ADS_MOVE_VIEW_Y,        // 122
    WBP_BOB_HIP_MOVE_GUN,           // 123
    WBP_BOB_HIP_MOVE_GUN_Y,         // 124
    WBP_BOB_HIP_MOVE_VIEW,          // 125
    WBP_BOB_HIP_MOVE_VIEW_Y,        // 126
    WBP_BOB_HIP_DUCKED_MOVE_GUN,    // 127
    WBP_BOB_HIP_DUCKED_MOVE_GUN_Y,  // 128
    WBP_BOB_HIP_DUCKED_MOVE_VIEW,   // 129
    WBP_BOB_HIP_DUCKED_MOVE_VIEW_Y, // 130
    WBP_BOB_HIP_PRONE_MOVE_VIEW,    // 131
    WBP_BOB_HIP_PRONE_MOVE_VIEW_Y,  // 132
    WBP_WP_SPRINT_STA_RATE,         // 133
    WBP_WP_GUN_MOVE_SPEED,          // 134
    WBP_WP_GUN_MOVE_TIME,           // 135
    WBP_WP_GUN_MOVE_DELAY,          // 136
    WBP_WP_SPRINT_MOVE,             // 137
    WBP_WP_STAND_MOVE,              // 138
    WBP_WP_CROUCH_MOVE,             // 139
    WBP_WP_PRONE_MOVE,              // 140
    WBP_WP_AIM_MOVE,                // 141
    WBP_WP_CROUCH_AIM_MOVE,         // 142
    WBP_ANI_RATE_DROP,              // 143
    WBP_ANI_RATE_DROP_QUICK,        // 144
    WBP_DROP_QUICK,                 // 145
    WBP_ANI_RATE_RAISE,             // 146
    WBP_ANI_RATE_SPRINT_RAISE,      // 147
    WBP_ANI_RATE_ADS_ON,            // 148
    WBP_ANI_RATE_ADS_OFF,           // 149
    WBP_SWAY_GUN_HIP_X_MAX_ANGLE,   // 150
    WBP_SWAY_GUN_HIP_X_MOVE_ANGLE,  // 151
    WBP_SWAY_GUN_HIP_X_MOVE,        // 152
    WBP_SWAY_GUN_HIP_Y_MAX_ANGLE,   // 153
    WBP_SWAY_GUN_HIP_Y_MOVE_ANGLE,  // 154
    WBP_SWAY_GUN_HIP_Y_MOVE,        // 155
    WBP_SWAY_GUN_ADS_X_MAX_ANGLE,   // 156
    WBP_SWAY_GUN_ADS_X_MOVE_ANGLE,  // 157
    WBP_SWAY_GUN_ADS_X_MOVE,        // 158
    WBP_SWAY_GUN_ADS_Y_MAX_ANGLE,   // 159
    WBP_SWAY_GUN_ADS_Y_MOVE_ANGLE,  // 160
    WBP_SWAY_GUN_ADS_Y_MOVE,        // 161
    WBP_VIEW_ANGLE_PITCH_MAX,       // 162
    WBP_CROSSHAIR_TYPE,             // 163
    WBP_CROSSHAIR_IMAGE,            // 164
    WBP_GUN_POS_HIP_MOVE_FRONT_Y,   // 165
    WBP_GUN_POS_HIP_MOVE_FRONT_X,   // 166
    WBP_UI_DAMAGE,                  // 167
    WBP_UI_SPREAD,                  // 168
    WBP_UI_VIEW_KICK,               // 169
    WBP_UI_RATE_OF_FIRE,            // 170
    WBP_UI_MOVE,                    // 171
    WBP_UI_RANGE,                   // 172
    WBP_NPC_SPREAD_RATE,            // 173
    WBP_NPC_RATE_OF_FIRE,           // 174
    WBP_NPC_FIRE                    // 175
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
var(Damage) float fMomentum;
var(Damage) float fMomentum_Pawn;
var(Damage) float fDamRange_Eff;
var(Damage) float fDamRange_Max;
var(Damage) int iDam_OOR;
var(Damage) int iDamMelee;
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
var(MoveSpeed) float fSprintSpeed;
var(MoveSpeed) float fRunSpeed;
var(MoveSpeed) float fCrouchSpeed;
var(MoveSpeed) float fPronedSpeed;
var(MoveSpeed) float fAimRunSpeed;
var(MoveSpeed) float fAimCrouchSpeed;
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
var(Crosshair) wWeaponBaseParams.ECrosshairType CrosshairType;
var(Crosshair) string CrosshairImage;
var float fNPCSpreadRate;
var float fNPCRateOfFire;
var int iNPCFire;
var float wt_BoundingMax;
var float wt_RandomMul;
var float wt_x[60];
var float wt_y[60];
var float wt_RandomWeight[60];
var float wtAim_BoundingMax;
var float wtAim_RandomMul;
var float wtAim_x[60];
var float wtAim_y[60];
var float wtAim_RandomWeight[60];

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
        // End:0xFFFF
        default:
            return byte(-1);
            break;
    }
    //return;    
}

function wWeaponBaseParams.EProjMoveType GetProjMoveType(string szValue)
{
    switch(szValue)
    {
        // End:0x11
        case "TW":
            return 1;
        // End:0x1C
        case "RPG":
            return 2;
        // End:0x30
        case "FlameThrower":
            return 3;
        // End:0xFFFF
        default:
            return byte(-1);
            break;
    }
    //return;    
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
        // End:0xFFFF
        default:
            return byte(-1);
            break;
    }
    //return;    
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
        // End:0xFFFF
        default:
            return byte(-1);
            break;
    }
    //return;    
}

defaultproperties
{
    strName="Btr_Weapon"
    iWeaponID=-1
    fBulletGravity=1.0000000
    fSprintSpeed=570.0000000
    fRunSpeed=370.0000000
    fCrouchSpeed=252.0000000
    fPronedSpeed=100.0000000
    fAimRunSpeed=122.0000000
    fAimCrouchSpeed=83.0000000
}