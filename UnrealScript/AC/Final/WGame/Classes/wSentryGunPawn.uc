class wSentryGunPawn extends wBotVehicle;

const SENTRYGUN_VIEW_VERTICAL_HALF_ANGLE = 45.0;
const SENTRYGUN_VIEW_HORIZONTAL_HALF_ANGLE = 45.0;
const SENTRYGUN_ROTATION_STEP = 17000;
const SENTRYGUN_IDLE_ROTATION_STEP = 5000;
const VIEW_HEIGHT_TOP_LIMIT = 530;
const VIEW_HEIGHT_BOTOOM_LIMIT = 530;
const LIFE_TIME_IN_IDLE = 65;
const DEBRIS_COUNT = 6;
const BREAKDOWN_EFFECT_GENERATE_HEALTH_RATE = 0.25;

enum EMUZZLE_ROTATION_RESULT_TYPE
{
    EMUZZLE_ROTATION_IDLE,          // 0
    EMUZZLE_ROTATION_WORKING,       // 1
    EMUZZLE_ROTATION_TARGETING      // 2
};

var float m_fIdleElapsedTime;
var int m_iHorizontalPositiveAngleRUU;
var int m_iHorizontalNagativeAngleRUU;
var int m_iVerticalPositiveAngleRUU;
var int m_iVerticalNagativeAngleRUU;
var bool m_bIdleHorizontalPositiveTurning;
var bool m_bInitSentryGun;
var bool m_bCalledFunction_InitSentryZuzzleRotationParam;
var bool m_bCanSeeTarget;
var name m_naWeaponIdle;
var name m_naWeaponDestroy;
var Vector m_vExplosionEffectLocation;
var SpriteWidget MinimapIconAlly;
var SpriteWidget MinimapIconEnemy;
var Emitter m_BreakDownEmitter;
var Pawn m_TargetPawn;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        m_TargetPawn, m_bCanSeeTarget, 
        m_bIdleHorizontalPositiveTurning, m_bInitSentryGun, 
        m_vExplosionEffectLocation;
}

simulated event PostBeginPlay()
{
    AssignInitialPose();
    // End:0x20
    if(wMyParam == none)
    {
        wMyParam = new Class'Engine.wMyPlayerStatus';
    }
    InitMyParam();
    bBlockActors = true;
    SetPhysics(0);
    Level.SentryGuns[Level.SentryGuns.Length] = self;
    AddSpecificBoneRotator('Bone_SentryG01_Weapon', 0);
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    local Coords boneCoords;
    local Vector RotateBoneOffset;

    super(wPawn).AddDefaultInventory(bQuickslotChange);
    PlayerReplicationInfo.bOutOfLives = true;
    boneCoords = Weapon.ThirdPersonActor.GetBoneCoords('Bone_CaseEjector01');
    m_vExplosionEffectLocation = boneCoords.Origin;
    // End:0x87
    if(float(100) < Abs(float(Rotation.Pitch)))
    {
        RotateBoneOffset.Z -= float(10);
        SetBoneLocation('Main_Rotate', RotateBoneOffset);
    }
    //return;    
}

simulated function AddAllyEffect(optional int iSideIndex)
{
    // End:0x29
    if(none != allyEffect)
    {
        DetachFromBone(allyEffect);
        allyEffect.Destroy();
        allyEffect = none;
    }
    // End:0x5D
    if(TeamIndex == Level.GetMatchMaker().My_iTeam)
    {
        allyEffect = Spawn(Class'XEffects.Charater_FX_Strobo_light_Blue', self);        
    }
    else
    {
        allyEffect = Spawn(Class'XEffects.Charater_FX_Strobo_light_Red', self);
    }
    // End:0xB8
    if(false == AttachToBone(allyEffect, 'Bone_Body'))
    {
        Log("Fail to AttachToBone wSentryGunPawn::PostBeginPlay");
    }
    //return;    
}

function UnPossessed()
{
    // End:0x29
    if(allyEffect != none)
    {
        DetachFromBone(allyEffect);
        allyEffect.Destroy();
        allyEffect = none;
    }
    bMovable = false;
    super(wPawn).UnPossessed();
    //return;    
}

event Destroyed()
{
    local int i;

    Spawn(Class'XEffects.SentryGun_Destroy_Explo',,, m_vExplosionEffectLocation);
    // End:0x38
    if(none != m_BreakDownEmitter)
    {
        DetachFromBone(m_BreakDownEmitter);
        m_BreakDownEmitter.Destroy();
        m_BreakDownEmitter = none;
    }
    // End:0x65
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    Level.Game.AnnounceSentryGun_Destory(TeamIndex);
    RemoveLevelSentryGun();
    SpawnDebris();
    super.Destroyed();
    FmodPlaySound("Warfare_Sound_Weapon/SP/SentryGun/wrecked", 2);
    //return;    
}

simulated function RemoveLevelSentryGun()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(lp1 < Level.SentryGuns.Length)
    {
        // End:0x52
        if(Level.SentryGuns[lp1] == self)
        {
            Level.SentryGuns.Remove(lp1, 1);
            // [Explicit Break]
            goto J0x5C;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5C:

    //return;    
}

simulated event Tick(float Delta)
{
    super(wPawn).Tick(Delta);
    // End:0x42
    if(m_bInitSentryGun)
    {
        // End:0x26
        if(false == m_bCalledFunction_InitSentryZuzzleRotationParam)
        {
            InitSentryZuzzleRotationParam();
        }
        // End:0x3F
        if(false == IsInState('Dying'))
        {
            Tick_Activate(Delta);
        }        
    }
    else
    {
        // End:0x55
        if(none != Weapon)
        {
            m_bInitSentryGun = true;
        }
    }
    // End:0x62
    if(none != m_BreakDownEmitter)
    {
        return;
    }
    // End:0x7C
    if((0.2500000 * HealthMax) <= float(Health))
    {
        return;
    }
    m_BreakDownEmitter = Spawn(Class'XEffects.SentryGun_breakdown', self);
    Weapon.ThirdPersonActor.AttachToBone(m_BreakDownEmitter, 'Bone_CaseEjector01');
    FmodPlayOwnedSound("Warfare_Sound_Weapon/SP/SentryGun/spark", 0);
    //return;    
}

protected simulated function InitSentryZuzzleRotationParam()
{
    local int iSentryGunHalfAngleRUU;

    m_bCalledFunction_InitSentryZuzzleRotationParam = true;
    iSentryGunHalfAngleRUU = Degree2RUU(45.0000000);
    m_iHorizontalPositiveAngleRUU = (Rotation.Yaw + iSentryGunHalfAngleRUU) & 65535;
    m_iHorizontalNagativeAngleRUU = (Rotation.Yaw - iSentryGunHalfAngleRUU) & 65535;
    iSentryGunHalfAngleRUU = Degree2RUU(45.0000000);
    m_iVerticalPositiveAngleRUU = (Rotation.Pitch + iSentryGunHalfAngleRUU) & 65535;
    m_iVerticalNagativeAngleRUU = (Rotation.Pitch - iSentryGunHalfAngleRUU) & 65535;
    // End:0xB8
    if(0 == m_iHorizontalPositiveAngleRUU)
    {
        m_iHorizontalPositiveAngleRUU = 65535;
    }
    // End:0xCE
    if(0 == m_iVerticalPositiveAngleRUU)
    {
        m_iVerticalPositiveAngleRUU = 65535;
    }
    PeripheralVision = Cos((45.0000000 * 3.1400001) / 180.0000000);
    //return;    
}

protected simulated function Tick_Activate(float dt)
{
    local bool bResult, bResult2, bIdleRotation;
    local wSentryGunPawn.EMUZZLE_ROTATION_RESULT_TYPE eMuzzleRotationResult, eMuzzleRotationResult2;

    // End:0x10
    if(float(65) <= m_fIdleElapsedTime)
    {
        return;
    }
    // End:0x43
    if(none != Controller)
    {
        wAIBotBase(Controller).Planner.WorkingState.bAimingTarget = false;
    }
    bIdleRotation = true;
    eMuzzleRotationResult = 0;
    eMuzzleRotationResult2 = 0;
    // End:0x102
    if(m_bCanSeeTarget)
    {
        eMuzzleRotationResult = UpdateMuzzleBoneRotation(dt, m_TargetPawn, true);
        // End:0xAD
        if(int(0) != int(eMuzzleRotationResult))
        {
            m_fIdleElapsedTime = 0.0000000;
            eMuzzleRotationResult2 = UpdateMuzzleBoneRotation(dt, m_TargetPawn, false);
        }
        // End:0x102
        if((int(2) == int(eMuzzleRotationResult)) && int(2) == int(eMuzzleRotationResult2))
        {
            // End:0x102
            if(none != Controller)
            {
                wAIBotBase(Controller).Planner.WorkingState.bAimingTarget = true;
            }
        }
    }
    // End:0x1E8
    if((int(0) == int(eMuzzleRotationResult)) && int(0) == int(eMuzzleRotationResult2))
    {
        m_fIdleElapsedTime += dt;
        // End:0x166
        if(float(65) <= m_fIdleElapsedTime)
        {
            // End:0x166
            if(201 != PlayerReplicationInfo.NPCID)
            {
                Died(none, Class'Engine.DamageType', Location);
                return;
            }
        }
        // End:0x1A0
        if((none != m_TargetPawn) && none != Controller)
        {
            wAIBotBase(Controller).Memory.RemoveByPawn(m_TargetPawn);
        }
        // End:0x1CD
        if(Weapon.FireMode[0].bIsFiring)
        {
            Weapon.StopFire(0);
        }
        // End:0x1E8
        if(UpdateIdleMuzzle(dt, false))
        {
            UpdateIdleMuzzle(dt, true);
        }
    }
    //return;    
}

protected simulated function wSentryGunPawn.EMUZZLE_ROTATION_RESULT_TYPE UpdateMuzzleBoneRotation(float dt, Pawn targetPawn, bool bYaw)
{
    local int iPositiveAngleRUU, iNagativeAngleRUU, iTargetRUU, iWeaponRUU, iSentryGunRUU;

    local Rotator rotSentryGunPawnTarget;
    local wSentryGunPawn.EMUZZLE_ROTATION_RESULT_TYPE eResult;

    eResult = 1;
    // End:0x41
    if(bYaw)
    {
        iSentryGunRUU = Rotation.Yaw & 65535;
        iPositiveAngleRUU = m_iHorizontalPositiveAngleRUU;
        iNagativeAngleRUU = m_iHorizontalNagativeAngleRUU;        
    }
    else
    {
        // End:0x6F
        if((Location.Z - targetPawn.Location.Z) > float(530))
        {
            return 0;
        }
        // End:0x9D
        if((targetPawn.Location.Z - Location.Z) > float(530))
        {
            return 0;
        }
        iSentryGunRUU = Rotation.Pitch & 65535;
        iPositiveAngleRUU = m_iVerticalPositiveAngleRUU;
        iNagativeAngleRUU = m_iVerticalNagativeAngleRUU;
    }
    // End:0xE0
    if(0 == iSentryGunRUU)
    {
        iSentryGunRUU = 65535;
    }
    rotSentryGunPawnTarget = Rotator(targetPawn.Location - Location);
    // End:0x120
    if(bYaw)
    {
        iTargetRUU = rotSentryGunPawnTarget.Yaw & 65535;        
    }
    else
    {
        iTargetRUU = rotSentryGunPawnTarget.Pitch & 65535;
    }
    // End:0x14D
    if(0 == iTargetRUU)
    {
        iTargetRUU = 65535;
    }
    // End:0x17E
    if(bYaw)
    {
        iWeaponRUU = (Rotation.Yaw + rotSpecificBoneRotator[0].Yaw) & 65535;        
    }
    else
    {
        iWeaponRUU = (Rotation.Pitch + rotSpecificBoneRotator[0].Pitch) & 65535;
    }
    // End:0x1B9
    if(0 == iWeaponRUU)
    {
        iWeaponRUU = 65535;
    }
    // End:0x225
    if(iPositiveAngleRUU < iNagativeAngleRUU)
    {
        // End:0x1E3
        if(iPositiveAngleRUU >= iTargetRUU)
        {
            iTargetRUU += 65535;
        }
        // End:0x1FE
        if(iPositiveAngleRUU >= iWeaponRUU)
        {
            iWeaponRUU += 65535;
        }
        // End:0x219
        if(iPositiveAngleRUU >= iSentryGunRUU)
        {
            iSentryGunRUU += 65535;
        }
        iPositiveAngleRUU += 65535;
    }
    // End:0x237
    if(iPositiveAngleRUU <= iTargetRUU)
    {
        return 0;
    }
    // End:0x249
    if(iNagativeAngleRUU >= iTargetRUU)
    {
        return 0;
    }
    // End:0x2AE
    if(iTargetRUU < iWeaponRUU)
    {
        iWeaponRUU -= int(dt * float(17000));
        // End:0x291
        if(iTargetRUU > iWeaponRUU)
        {
            iWeaponRUU = iTargetRUU;
            eResult = 2;
        }
        // End:0x2AB
        if(iWeaponRUU < iNagativeAngleRUU)
        {
            iWeaponRUU = iNagativeAngleRUU;
        }        
    }
    else
    {
        // End:0x313
        if(iTargetRUU > iWeaponRUU)
        {
            iWeaponRUU += int(dt * float(17000));
            // End:0x2F6
            if(iTargetRUU < iWeaponRUU)
            {
                iWeaponRUU = iTargetRUU;
                eResult = 2;
            }
            // End:0x310
            if(iWeaponRUU > iPositiveAngleRUU)
            {
                iWeaponRUU = iPositiveAngleRUU;
            }            
        }
        else
        {
            eResult = 2;
        }
    }
    // End:0x34E
    if(bYaw)
    {
        rotSpecificBoneRotator[0].Yaw = (iWeaponRUU & 65535) - (iSentryGunRUU & 65535);        
    }
    else
    {
        rotSpecificBoneRotator[0].Pitch = (iWeaponRUU & 65535) - (iSentryGunRUU & 65535);
    }
    return eResult;
    //return;    
}

protected simulated function bool UpdateIdleMuzzle(float dt, bool bYaw)
{
    local int iPositiveAngleRUU, iNagativeAngleRUU, iWeaponRUU, iSentryGunRUU, iVerticalCenterRUU;

    local bool bResult;

    // End:0x39
    if(bYaw)
    {
        iSentryGunRUU = Rotation.Yaw & 65535;
        iPositiveAngleRUU = m_iHorizontalPositiveAngleRUU;
        iNagativeAngleRUU = m_iHorizontalNagativeAngleRUU;        
    }
    else
    {
        iSentryGunRUU = Rotation.Pitch & 65535;
        iPositiveAngleRUU = m_iVerticalPositiveAngleRUU;
        iNagativeAngleRUU = m_iVerticalNagativeAngleRUU;
    }
    // End:0x7C
    if(0 == iSentryGunRUU)
    {
        iSentryGunRUU = 65535;
    }
    // End:0xAD
    if(bYaw)
    {
        iWeaponRUU = (Rotation.Yaw + rotSpecificBoneRotator[0].Yaw) & 65535;        
    }
    else
    {
        iWeaponRUU = (Rotation.Pitch + rotSpecificBoneRotator[0].Pitch) & 65535;
    }
    // End:0xE8
    if(0 == iWeaponRUU)
    {
        iWeaponRUU = 65535;
    }
    // End:0x139
    if(iPositiveAngleRUU < iNagativeAngleRUU)
    {
        // End:0x112
        if(iPositiveAngleRUU >= iWeaponRUU)
        {
            iWeaponRUU += 65535;
        }
        // End:0x12D
        if(iPositiveAngleRUU >= iSentryGunRUU)
        {
            iSentryGunRUU += 65535;
        }
        iPositiveAngleRUU += 65535;
    }
    // End:0x1EA
    if(bYaw)
    {
        // End:0x187
        if(m_bIdleHorizontalPositiveTurning)
        {
            iWeaponRUU += int(dt * float(5000));
            // End:0x184
            if(iWeaponRUU > iPositiveAngleRUU)
            {
                iWeaponRUU = iPositiveAngleRUU;
                m_bIdleHorizontalPositiveTurning = false;
            }            
        }
        else
        {
            iWeaponRUU -= int(dt * float(5000));
            // End:0x1C0
            if(iWeaponRUU < iNagativeAngleRUU)
            {
                iWeaponRUU = iNagativeAngleRUU;
                m_bIdleHorizontalPositiveTurning = true;
            }
        }
        rotSpecificBoneRotator[0].Yaw = (iWeaponRUU & 65535) - (iSentryGunRUU & 65535);        
    }
    else
    {
        iVerticalCenterRUU = iNagativeAngleRUU + ((iPositiveAngleRUU - iNagativeAngleRUU) / 2);
        // End:0x24A
        if(iVerticalCenterRUU > iWeaponRUU)
        {
            iWeaponRUU += int(dt * float(5000));
            // End:0x247
            if(iWeaponRUU > iVerticalCenterRUU)
            {
                iWeaponRUU = iVerticalCenterRUU;
            }            
        }
        else
        {
            // End:0x28D
            if(iVerticalCenterRUU < iWeaponRUU)
            {
                iWeaponRUU -= int(dt * float(5000));
                // End:0x28A
                if(iWeaponRUU < iVerticalCenterRUU)
                {
                    iWeaponRUU = iVerticalCenterRUU;
                }                
            }
            else
            {
                return true;
            }
        }
        rotSpecificBoneRotator[0].Pitch = (iWeaponRUU & 65535) - (iSentryGunRUU & 65535);
    }
    return false;
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(Actor.CollisionPartsType collisionParts)
{
    return GibGroupClass.default.HelicopterHitClass;
    //return;    
}

simulated function StopFiring()
{
    WeaponAttachment(Weapon.ThirdPersonActor).PlayWeaponAnim(m_naWeaponIdle, 1.0000000, 0.0000000, 0);
    //return;    
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
    WeaponAttachment(Weapon.ThirdPersonActor).PlayWeaponAnim(m_naWeaponDestroy, 1.0000000, 0.0000000, 0);
    //return;    
}

simulated function SpawnDebris()
{
    local int i;
    local float fGibPerterbation;
    local Vector v3GibVelocity, v3Velocity;
    local Coords boneCoords;
    local name BoneName[6];
    local Class<Gib> GibClass[6];

    BoneName[0] = 'Bone_SentryG01_B';
    BoneName[1] = 'Bone_Body';
    BoneName[2] = 'Bone_GunPoint';
    BoneName[3] = 'Bone_SentryG01_LF';
    BoneName[4] = 'Bone_Magazine';
    BoneName[5] = 'Bone_SentryG01_RF';
    GibClass[0] = Class'XEffects.GibSentryBack';
    GibClass[1] = Class'XEffects.GibSentryBody';
    GibClass[2] = Class'XEffects.GibSentryGunPoint';
    GibClass[3] = Class'XEffects.GibSentryLFProp';
    GibClass[4] = Class'XEffects.GibSentryMagazine';
    GibClass[5] = Class'XEffects.GibSentryRFProp';
    i = 0;
    J0xAB:

    // End:0x15F [Loop If]
    if(i < 6)
    {
        v3Velocity.X = float(SignedRand(0, 100));
        v3Velocity.Y = float(SignedRand(0, 100));
        v3Velocity.Z = float(SignedRand(0, 100));
        v3GibVelocity = v3Velocity * (float(100) + (float(90) * FRand()));
        boneCoords = GetBoneCoords(BoneName[i]);
        SpawnGiblet(GibClass[i], boneCoords.Origin, Rotation, 1.0000000, v3GibVelocity);
        ++i;
        // [Loop Continue]
        goto J0xAB;
    }
    //return;    
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    //return;    
}

function PlayDyingSound()
{
    //return;    
}

defaultproperties
{
    m_naWeaponIdle="Idle"
    m_naWeaponDestroy="Destroy"
    MinimapIconAlly=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_wh_sentry_finalblend',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemy=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_r_sentry_finalblend',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bMeleeFighter=false
    bCanDodge=false
    bRollToDesired=true
    bPenetrate=true
    SightRadius=10000.0000000
    ControllerClass=Class'WGame_Decompressed.wAISentryGunController'
    bApplyInverseBoneRotation=false
    Physics=1
    CollisionRadius=55.0000000
    CollisionHeight=53.0000000
    bBlockActors=false
}