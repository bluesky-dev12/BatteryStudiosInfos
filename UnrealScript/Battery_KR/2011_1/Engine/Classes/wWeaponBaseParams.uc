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

var(Base) editconst Actor.eWeaponType eType;
var(Base) editconst string strName;
var(Base) editconst int iWeaponID;
var(Base) int iInventoryGroup;
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