/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPawn.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:2
 *	Properties:164
 *	Functions:175
 *	States:1
 *
 *******************************************************************************/
class wPawn extends UnrealPawn
    dependson(wWeaponAttachment)
    dependson(wPlayer)
    dependson(wBotVehicleController)
    dependson(wPawnSoundGroup)
    dependson(wPlayerInfo)
    dependson(wUtil)
    dependson(Combo)
    dependson(SpeciesType)
    dependson(wRosterEntry);

const InvenSkillStartIndex = 12;

enum EFireAnimState
{
    FS_None,
    FS_PlayOnce,
    FS_Looping,
    FS_Ready
};

enum eSpecialState
{
    SState_Planting,
    SState_Diffusing
};

var int RepeaterDeathCount;
var Combo CurrentCombo;
var bool bBerserk;
var bool bInvis;
var bool bOldInvis;
var bool bGibbed;
var bool bCanDodgeDoubleJump;
var bool bCanBoostDodge;
var bool bAlreadySetup;
var bool bSpawnIn;
var bool bSpawnDone;
var bool bFrozenBody;
var bool bFlaming;
var bool bRubbery;
var bool bClearWeaponOffsets;
var(Shield) float ShieldStrengthMax;
var float SmallShieldStrength;
var class<SpeciesType> Species;
var(Sounds) float GruntVolume;
var(Sounds) float FootstepVolume;
var transient int SimHitFxTicker;
var(Gib) class<xPawnGibGroup> GibGroupClass;
var(Gib) int GibCountCalf;
var(Gib) int GibCountForearm;
var(Gib) int GibCountHead;
var(Gib) int GibCountTorso;
var(Gib) int GibCountUpperArm;
var float MinTimeBetweenPainSounds;
var localized string HeadShotMessage;
var(Sounds) Sound SoundFootsteps[30];
var(Sounds) Sound SoundFootsteps_3rd[30];
var(Sounds) class<wPawnSoundGroup> SoundGroupClass;
var Sound sndScream;
var Sound sndDie;
var wWeaponAttachment WeaponAttachment;
var wFPWeaponAttachment FPWeaponAttachment;
var ShadowProjector PlayerShadow;
var Effect_ShadowController RealtimeShadow;
var bool bRealtimeShadows;
var int iShadowType;
var int MultiJumpRemaining;
var int MaxMultiJump;
var int MultiJumpBoost;
var name WallDodgeAnims[4];
var name IdleHeavyAnim;
var name FireHeavyRapidAnim;
var name FireHeavyBurstAnim;
var name FireRootBone;
var name Pistol_FireRifleRapidAnim;
var name TelegraphPack_PutdownAnim;
var name TelegraphPack_SelectAnim;
var name Pistol_FireAimCrouchRifleRapidAnim;
var wPawn.EFireAnimState FireState;
var Mesh SkeletonMesh;
var bool bSkeletized;
var bool bDeRes;
var float DeResTime;
var Emitter DeResFX;
var(DeRes) InterpCurve DeResLiftVel;
var(DeRes) InterpCurve DeResLiftSoftness;
var(DeRes) float DeResGravScale;
var(DeRes) float DeResLateralFriction;
var(Karma) float RagdollLifeSpan;
var(Karma) float RagInvInertia;
var(Karma) float RagDeathVel;
var(Karma) float RagShootStrength;
var(Karma) float RagSpinScale;
var(Karma) float RagDeathUpKick;
var(Karma) float RagGravScale;
var(Karma) Material RagConvulseMaterial;
var(Karma) array<Sound> RagImpactSounds;
var(Karma) float RagImpactSoundInterval;
var(Karma) float RagImpactVolume;
var transient float RagLastSoundTime;
var string RagdollOverride;
var Controller OldController;
var Material RealSkins[4];
var(AI) string PlacedCharacterName;
var string PlacedFemaleCharacterName;
var byte TeamSkin;
var wSkinShell wParts[3];
var wSkinShell wGoreParts[5];
var float BreathVolume;
var float EquipHitVolume;
var int iDiedCollisionPart;
var int iBackupTeamNum;
var int iWarpCount;
var string strGoreMeshName;
var string strGoreStaticMeshName;
var int AddedSkillList[22];
var int iStartQSlotIndex;
var bool bBurning;
var float fLastBurningTime;
var wProjectile BurningProj;
var Emitter mIFFEffect;
var name Hit_Stun;
var name Hit_Stun_Cr;
var name Hit_Stun_Pr;
var name Hit_PS[4];
var name Hit_PS_Head;
var name Hit_PS_Cr[4];
var name Hit_PS_Pr;
var name Hit_PS_Stun;
var name Hit_PS_Stun_Cr;
var name Hit_PS_Stun_Pr;
var name Hit_FR[4];
var name Hit_FR_Head;
var name Hit_FR_Cr[4];
var name Hit_FR_Pr;
var name Hit_FR_Stun;
var name Hit_FR_Stun_Cr;
var name Hit_FR_Stun_Pr;
var name Hit_RPG[4];
var name Hit_RPG_Head;
var name Hit_RPG_Cr[4];
var name Hit_RPG_Pr;
var name Hit_RPG_Stun;
var name Hit_RPG_Stun_Cr;
var name Hit_RPG_Stun_Pr;
var name Meele_Rifle_Fail;
var name Meele_Rifle_Cr_Fail;
var name Meele_Rifle_Pr_Fail;
var name Meele_Knife_Fail;
var name Meele_Knife_Cr_Fail;
var name Meele_Knife_Pr_Fail;
var name Knife_Fire;
var name Knife_Fire_Cr;
var name Knife_Fire_Pr;
var name Rifle_Crouch_BoltLeverAnim;
var name Reload_Rifle_2nd_Anim;
var name Reload_Crouch_Rifle_Anim;
var name Reload_Crouch_Rifle_2nd_Anim;
var name Reload_Prone_Rifle_2nd_Anim;
var name Pistol_Reload_Rifle_2nd_Anim;
var name Pistol_CrouchReload;
var name Pistol_CrouchReload_2nd;
var name Pistol_ProneReload_2nd;
var name Rpg_Reload_2nd_Anim;
var name Rpg_CrouchReload;
var name Rpg_CrouchReload_2nd;
var name Rpg_ProneReload_2nd;
var name Putdown_Crouch_Rifle_Anim;
var name PutdownQuick_Crouch_Rifle_Anim;
var name Pistol_CrouchPutdown;
var name Pistol_CrouchPutdownQuick;
var name Frag_CrouchPutdown;
var name Frag_CrouchPutdownQuick;
var name Rpg_CrouchPutdown;
var name Rpg_CrouchPutdownQuick;
var name Select_Crouch_Rifle_Anim;
var name SelectNew_Crouch_Rifle_Anim;
var name Pistol_CrouchSelect;
var name Frag_CrouchSelect;
var name Rpg_CrouchSelect;
var bool bEndProned;
var bool bEndCrouched;
var() array<int> wRequiredEquipment;
var array<int> wRequiredParts;
var bool bAimed;
var bool bIsMeleeAttacking;
var Vector GrenadeFireLocation;
var Rotator GrenadeFireRotation;
var Vector GrenadeExplodeLocation;
var BTNetEnums BTNetEnums;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        ClientWeaponReset, ClientSwitchToLastWeapon;

    // Pos:0x0d
    reliable if(Role < 4)
        ServerQSlotChangeCheck, ServerCallNoWeaponMessage;

}

simulated function PlayTurretIdleAnim(optional bool UpDown)
{
    // End:0x3a
    if(UpDown)
    {
        AnimBlendParams(1, 0.50, 0.0, 0.0, RootBone);
        PlayAnim(TurretIdleUpDown, 1.0, 0.10, 1);
    }
    // End:0x4d
    else
    {
        PlayAnim(TurretIdle, 1.0, 0.10, 0);
    }
}

simulated function SimulatedSetRotation(Rotator R)
{
    SetRotation(R);
}

simulated function ClientWeaponReset()
{
    // End:0x25
    if(wGun(Weapon) != none)
    {
        wGun(Weapon).SetAim(false);
    }
}

simulated function Fire(optional float f)
{
    super(Pawn).Fire(f);
}

simulated function AltFire(optional float f)
{
    super(Pawn).AltFire(f);
}

simulated function PlayWaiting();
function RosterEntry GetPlacedRoster()
{
    PlayerReplicationInfo.CharacterName = PlacedCharacterName;
    return class'wRosterEntry'.static.CreateRosterEntryCharacter(PlacedCharacterName);
}

function PossessedBy(Controller C)
{
    super(Pawn).PossessedBy(C);
    // End:0x21
    if(Controller != none)
    {
        OldController = Controller;
    }
}

function UnPossessed()
{
    self.ClientWeaponReset();
    super(Pawn).UnPossessed();
}

simulated function bool WasPlayerPawn()
{
    return OldController != none && OldController.bIsPlayer;
}

function DoTranslocateOut(Vector PrevLocation);
simulated function AssignInitialPose()
{
    // End:0x4a
    if(DrivenVehicle != none)
    {
        // End:0x39
        if(HasAnim(DrivenVehicle.DriveAnim))
        {
            LoopAnim(DrivenVehicle.DriveAnim,, 0.10);
        }
        // End:0x47
        else
        {
            LoopAnim('Vehicle_Driving',, 0.10);
        }
    }
    // End:0x59
    else
    {
        TweenAnim(MovementAnims[0], 0.0);
    }
    AnimBlendParams(1, 1.0, 0.20, 0.20, SpineBone1);
    BoneRefresh();
}

simulated function Destroyed()
{
    local int i;

    // End:0x17
    if(PlayerShadow != none)
    {
        PlayerShadow.Destroy();
    }
    // End:0x40
    if(mIFFEffect != none)
    {
        DetachFromBone(mIFFEffect);
        mIFFEffect.Destroy();
        mIFFEffect = none;
    }
    i = 0;
    J0x47:
    // End:0x9e [While If]
    if(i < 3)
    {
        // End:0x94
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
    i = 0;
    J0xa5:
    // End:0xfc [While If]
    if(i < 5)
    {
        // End:0xf2
        if(wGoreParts[i] != none)
        {
            DetachFromBone(wGoreParts[i]);
            wGoreParts[i].Destroy();
            wGoreParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa5;
    }
    // End:0x11a
    if(FPWeaponAttachment != none)
    {
        FPWeaponAttachment.Destroy();
        FPWeaponAttachment = none;
    }
    // End:0x12c
    if(BTNetEnums != none)
    {
        BTNetEnums = none;
    }
    super(Pawn).Destroyed();
}

simulated function RemoveFlamingEffects()
{
    local int i;

    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    i = 0;
    J0x22:
    // End:0x90 [While If]
    if(i < Attached.Length)
    {
        // End:0x86
        if(Attached[i].IsA('wEmitter') && !Attached[i].IsA('BloodJet'))
        {
            wEmitter(Attached[i]).mRegen = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
}

simulated event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    // End:0x18
    if(NewVolume.bWaterVolume)
    {
        RemoveFlamingEffects();
    }
    super(Actor).PhysicsVolumeChange(NewVolume);
}

function float AdjustedStrength()
{
    // End:0x0f
    if(bBerserk)
    {
        return 1.0;
    }
    return 0.0;
}

function DeactivateSpawnProtection()
{
    // End:0x0b
    if(bSpawnDone)
    {
        return;
    }
    bSpawnDone = true;
    // End:0x88
    if(Level.TimeSeconds - SpawnTime < DeathMatch(Level.Game).SpawnProtectionTime)
    {
        bSpawnIn = true;
        SpawnTime = Level.TimeSeconds - DeathMatch(Level.Game).SpawnProtectionTime - float(1);
    }
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    super(Pawn).PlayTeleportEffect(bOut, bSound);
}

function PlayMoverHitSound()
{
    PlaySound(SoundGroupClass.static.GetHitSound(), 3);
}

function PlayDyingSound()
{
    // End:0x0b
    if(bSkeletized)
    {
        return;
    }
    // End:0x3c
    if(bGibbed)
    {
        PlaySound(GibGroupClass.static.GibSound(), 2, 3.50 * TransientSoundVolume, true, 500.0);
        return;
    }
    // End:0x6f
    if(HeadVolume.bWaterVolume)
    {
        PlaySound(GetSound(6), 2, 2.50 * TransientSoundVolume, true, 500.0);
        return;
    }
}

function Gasp()
{
    // End:0x12
    if(Role != 4)
    {
        return;
    }
    // End:0x30
    if(BreathTime < float(2))
    {
        PlaySound(GetSound(5), 3);
    }
    // End:0x3d
    else
    {
        PlaySound(GetSound(7), 3);
    }
}

function Controller GetKillerController()
{
    // End:0x11
    if(Controller != none)
    {
        return Controller;
    }
    // End:0x22
    if(OldController != none)
    {
        return OldController;
    }
    return none;
}

simulated function int GetTeamNum()
{
    // End:0x1b
    if(Controller != none)
    {
        return Controller.GetTeamNum();
    }
    // End:0x55
    if(DrivenVehicle != none && DrivenVehicle.Controller != none)
    {
        return DrivenVehicle.Controller.GetTeamNum();
    }
    // End:0x70
    if(OldController != none)
    {
        return OldController.GetTeamNum();
    }
    // End:0x94
    if(PlayerReplicationInfo == none || PlayerReplicationInfo.Team == none)
    {
        return 255;
    }
    return PlayerReplicationInfo.Team.TeamIndex;
}

function TeamInfo GetTeam()
{
    // End:0x1a
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.Team;
    }
    // End:0x53
    if(DrivenVehicle != none && DrivenVehicle.PlayerReplicationInfo != none)
    {
        return DrivenVehicle.PlayerReplicationInfo.Team;
    }
    // End:0x8c
    if(OldController != none && OldController.PlayerReplicationInfo != none)
    {
        return OldController.PlayerReplicationInfo.Team;
    }
    return none;
}

function RemovePowerups()
{
    // End:0x36
    if(CurrentCombo != none)
    {
        CurrentCombo.Destroy();
        // End:0x36
        if(Controller != none)
        {
            Controller.Adrenaline = 0.0;
        }
    }
    super(Pawn).RemovePowerups();
}

simulated function TickFX(float DeltaTime)
{
    // End:0x35
    if(SimHitFxTicker != HitFxTicker && Level.GetLocalPlayerController().Pawn != self)
    {
        ProcessHitFX();
    }
}

simulated function TickDamage(float DeltaTime)
{
    // End:0xa0
    if(bBurning && BurningProj != none)
    {
        // End:0xa0
        if(Level.TimeSeconds - fLastBurningTime >= 1.0)
        {
            TakeDamage(BurningProj.BaseParams.iDamage, BurningProj.Instigator, Location, vect(0.0, 0.0, 0.0), BurningProj.ResParams,, 8);
            fLastBurningTime = Level.TimeSeconds;
            BurningProj = none;
        }
    }
}

simulated function StartDriving(Vehicle V)
{
    local int i;

    super(Pawn).StartDriving(V);
    // End:0x27
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = false;
    }
    // End:0x42
    if(WeaponAttachment != none)
    {
        WeaponAttachment.Hide(true);
    }
    i = 0;
    J0x49:
    // End:0x8c [While If]
    if(i < Attached.Length)
    {
        // End:0x82
        if(wProjectile(Attached[i]) != none)
        {
            Attached[i].SetBase(none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    PlayTurretIdleAnim(true);
    PlayTurretIdleAnim();
    V.SetEntryViewRotation(Weapon.Rotation);
}

simulated function StopDriving(Vehicle V)
{
    super(Pawn).StopDriving(V);
    // End:0x2e
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = !bInvis;
    }
    // End:0x49
    if(WeaponAttachment != none)
    {
        WeaponAttachment.Hide(false);
    }
    AnimBlendParams(1, 0.0, 0.0,, FireRootBone);
    ScriptPlayIdle(0);
    V.SetExitViewRotation(self);
}

simulated function AttachEffect(class<wEmitter> EmitterClass, name BoneName, Vector Location, Rotator Rotation)
{
    local Actor A;
    local int i;

    // End:0x1c
    if(bSkeletized || BoneName == 'None')
    {
        return;
    }
    i = 0;
    J0x23:
    // End:0x72 [While If]
    if(i < Attached.Length)
    {
        // End:0x47
        if(Attached[i] == none)
        {
        }
        // End:0x68
        else
        {
            // End:0x68
            if(Attached[i].AttachmentBone != BoneName)
            {
            }
            // End:0x68
            else
            {
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
    // End:0x8e
    if(IsInState('Dying'))
    {
        Location.Z -= CollisionHeight;
    }
    A = Spawn(EmitterClass,,, Location, Rotation);
    // End:0xfe
    if(!AttachToBone(A, BoneName))
    {
        Log("Couldn't attach " $ string(EmitterClass) $ " to " $ string(BoneName), 'Error');
        A.Destroy();
        return;
    }
    i = 0;
    J0x105:
    // End:0x137 [While If]
    if(i < Attached.Length)
    {
        // End:0x12d
        if(Attached[i] == A)
        {
        }
        // End:0x137
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x105;
        }
    }
    A.SetRelativeRotation(Rotation);
}

simulated event SetHeadScale(float NewScale)
{
    HeadScale = NewScale;
    SetBoneScale(4, HeadScale, 'head');
}

simulated function SpawnGiblet(class<Gib> GibClass, Vector Location, Rotator Rotation, float GibPerterbation, Vector GibVelocity)
{
    local Gib Giblet;
    local Vector direction, Dummy;

    // End:0x21
    if(GibClass == none || Level.GetIsNoGore())
    {
        return;
    }
    Instigator = self;
    Giblet = Spawn(GibClass,,, Location, Rotation);
    Giblet.SetTeam(strGoreStaticMeshName);
    // End:0x63
    if(Giblet == none)
    {
        return;
    }
    Giblet.bFlaming = bFlaming;
    Giblet.SpawnTrail();
    GibPerterbation *= 32768.0;
    Rotation.Pitch += int(FRand() * 3.0 * GibPerterbation - GibPerterbation);
    Rotation.Yaw += int(FRand() * 3.0 * GibPerterbation - GibPerterbation);
    Rotation.Roll += int(FRand() * 3.0 * GibPerterbation - GibPerterbation);
    GetAxes(Rotation, Dummy, Dummy, direction);
    Giblet.Velocity = GibVelocity * FMin(FRand() + 0.40, 1.0);
    Giblet.LifeSpan = Giblet.LifeSpan + float(2) * FRand() - float(1);
}

simulated function ProcessHitFX()
{
    local Coords boneCoords;
    local int j;

    // End:0x42
    if(Level.NetMode == 1 || bSkeletized || Mesh == SkeletonMesh)
    {
        SimHitFxTicker = HitFxTicker;
        return;
    }
    SimHitFxTicker = SimHitFxTicker;
    J0x4d:
    // End:0x21a [While If]
    if(SimHitFxTicker != HitFxTicker)
    {
        ++ j;
        // End:0x7c
        if(j > 30)
        {
            SimHitFxTicker = HitFxTicker;
            return;
        }
        // End:0xd6
        if(HitFx[SimHitFxTicker].damtype == none || Level.bDropDetail && Level.TimeSeconds - LastRenderTime > float(3) && !IsHumanControlled())
        {
        }
        // End:0x1ff
        else
        {
            boneCoords = GetBoneCoords(HitFx[SimHitFxTicker].Bone);
            // End:0x1bb
            if(!bSkeletized)
            {
                // End:0x14d
                if(HitFx[SimHitFxTicker].iCollisionPart == 1)
                {
                    AttachEffect(GetBloodHitClass(true), HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
                }
                // End:0x184
                else
                {
                    AttachEffect(GetBloodHitClass(false), HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
                }
                AttachEffect(GetBloodHitClass(false), HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
            }
            // End:0x1e0
            if(Level.GetIsNoGore())
            {
                HitFx[SimHitFxTicker].bSever = false;
            }
            // End:0x1ff
            if(HitFx[SimHitFxTicker].bSever)
            {
                SpawnGoreGiblet(SimHitFxTicker);
            }
        }
        SimHitFxTicker = int(float(SimHitFxTicker + 1) % float(8));
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
}

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    // End:0x42
    if(bHeadShot == true)
    {
        // End:0x30
        if(Level.GetIsTeenVersion())
        {
            return GibGroupClass.default.Teen_BloodHitHeadshotClass;
        }
        // End:0x3f
        else
        {
            return GibGroupClass.default.BloodHitHeadshotClass;
        }
    }
    // End:0x75
    else
    {
        // End:0x66
        if(Level.GetIsTeenVersion())
        {
            return GibGroupClass.default.Teen_BloodHitClass;
        }
        // End:0x75
        else
        {
            return GibGroupClass.default.BloodHitClass;
        }
    }
}

simulated function HideBone(name BoneName)
{
    local int BoneScaleSlot;

    // End:0x19
    if(BoneName == 'lthigh')
    {
        BoneScaleSlot = 0;
    }
    // End:0x97
    else
    {
        // End:0x32
        if(BoneName == 'rthigh')
        {
            BoneScaleSlot = 1;
        }
        // End:0x97
        else
        {
            // End:0x4c
            if(BoneName == 'rfarm')
            {
                BoneScaleSlot = 2;
            }
            // End:0x97
            else
            {
                // End:0x66
                if(BoneName == 'lfarm')
                {
                    BoneScaleSlot = 3;
                }
                // End:0x97
                else
                {
                    // End:0x80
                    if(BoneName == 'head')
                    {
                        BoneScaleSlot = 4;
                    }
                    // End:0x97
                    else
                    {
                        // End:0x97
                        if(BoneName == 'spine')
                        {
                            BoneScaleSlot = 5;
                        }
                    }
                }
            }
        }
    }
    SetBoneScale(BoneScaleSlot, 0.0, BoneName);
}

function CalcHitLoc(Vector HitLoc, Vector hitRay, out name BoneName, out float dist)
{
    BoneName = GetClosestBone(HitLoc, hitRay, dist);
}

function GetBoneNameByCollisionID(int CollisionID, out name BoneName)
{
    switch(byte(CollisionID))
    {
        // End:0x1c
        case 1:
            BoneName = 'Bip01 Head';
            // End:0xfe
            break;
        // End:0x2f
        case 2:
            BoneName = 'Bip01 Spine2';
            // End:0xfe
            break;
        // End:0x42
        case 3:
            BoneName = 'Bip01 Spine';
            // End:0xfe
            break;
        // End:0x55
        case 4:
            BoneName = 'Bip01 L UpperArm';
            // End:0xfe
            break;
        // End:0x68
        case 5:
            BoneName = 'Bip01 R UpperArm';
            // End:0xfe
            break;
        // End:0x7b
        case 6:
            BoneName = 'Bip01 L Forearm';
            // End:0xfe
            break;
        // End:0x8e
        case 7:
            BoneName = 'Bip01 R Forearm';
            // End:0xfe
            break;
        // End:0xa1
        case 8:
            BoneName = 'Bip01 L Thigh';
            // End:0xfe
            break;
        // End:0xb4
        case 9:
            BoneName = 'Bip01 R Thigh';
            // End:0xfe
            break;
        // End:0xc7
        case 10:
            BoneName = 'Bip01 L Calf';
            // End:0xfe
            break;
        // End:0xda
        case 11:
            BoneName = 'Bip01 R Calf';
            // End:0xfe
            break;
        // End:0xed
        case 16:
            BoneName = 'bone_mainrotor';
            // End:0xfe
            break;
        // End:0xffff
        default:
            BoneName = 'Bip01 Spine';
            // End:0xfe Break;
            break;
    }
}

function DoDamageFX(name BoneName, int Damage, class<DamageType> DamageType, Rotator R, Vector HitLoc, optional int CollisionPart)
{
    // End:0x158
    if(Damage > 1 || Health <= 0)
    {
        HitFx[HitFxTicker].damtype = DamageType;
        HitFx[HitFxTicker].iCollisionPart = CollisionPart;
        // End:0x76
        if(Health - Damage <= 0 || Health <= 0)
        {
            HitFx[HitFxTicker].bSever = true;
        }
        // End:0xf2
        if(DamageType.default.bNeverSevers || Level.GetIsNoGore() || Level.Game != none && Level.Game.PreventSever(self, BoneName, Damage, DamageType))
        {
            HitFx[HitFxTicker].bSever = false;
        }
        HitFx[HitFxTicker].Bone = BoneName;
        HitFx[HitFxTicker].rotDir = R;
        HitFx[HitFxTicker].vHitLoc = HitLoc;
        HitFxTicker = HitFxTicker + 1;
        // End:0x158
        if(HitFxTicker > 8 - 1)
        {
            HitFxTicker = 0;
        }
    }
}

simulated function StartDeRes()
{
    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    Projectors.Remove(0, Projectors.Length);
    bAcceptsProjectors = false;
    // End:0x4c
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = false;
    }
    RemoveFlamingEffects();
    SetOverlayMaterial(none, 0.0, true);
    bDeRes = true;
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
    // End:0x39
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        Time *= 0.750;
    }
    super(Actor).SetOverlayMaterial(mat, Time, bOverride);
}

simulated function TickDeRes(float DeltaTime)
{
    return;
    // End:0x2c
    if(LifeSpan < 3.0)
    {
        AmbientGlow = byte(254.0 * LifeSpan / 3.0);
    }
}

simulated function TestVersion_SetParameters()
{
    // End:0x0d
    if(wMyParam == none)
    {
        return;
    }
    // End:0xdf
    if(WeaponAttachment != none && WeaponAttachment.BaseParams != none)
    {
        GroundSpeed = WeaponAttachment.BaseParams.fRunSpeed;
        SprintSpeed = WeaponAttachment.BaseParams.fSprintSpeed;
        CrouchedSpeed = WeaponAttachment.BaseParams.fCrouchSpeed;
        PronedSpeed = WeaponAttachment.BaseParams.fPronedSpeed;
        AimedGroundSpeed = WeaponAttachment.BaseParams.fAimRunSpeed;
        AimedCrouchedSpeed = WeaponAttachment.BaseParams.fAimCrouchSpeed;
    }
    // End:0x157
    else
    {
        GroundSpeed = wMyParam.RunSpeed;
        SprintSpeed = wMyParam.SprintSpeed;
        CrouchedSpeed = wMyParam.CrouchSpeed;
        PronedSpeed = wMyParam.PronedSpeed;
        AimedGroundSpeed = wMyParam.AimRunSpeed;
        AimedCrouchedSpeed = wMyParam.AimCrouchSpeed;
    }
    AccelRate = wMyParam.AccelRate;
    F_DiagmoveRatio = wMyParam.F_DiagmoveRatio;
    SideMoveRatio = wMyParam.SideMoveRatio;
    B_DiagmoveRatio = wMyParam.B_DiagmoveRatio;
    BackMoveRatio = wMyParam.BackMoveRatio;
    TweenRate_Proned_Run = wMyParam.TweenRate_Proned_Run;
    TweenRate_Crouched_Run = wMyParam.TweenRate_Crouched_Run;
    TweenRate_Sprint = wMyParam.TweenRate_Sprint;
    TweenRate_Run = wMyParam.TweenRate_Run;
    TweenRate_Aim_Run = wMyParam.TweenRate_Aim_Run;
    TweenRate_Idle = wMyParam.TweenRate_Idle;
    TweenRate_SideStep = wMyParam.TweenRate_SideStep;
    TweenRate_Proned_Idle = wMyParam.TweenRate_Proned_Idle;
    TweenRate_Crouched_Idle = wMyParam.TweenRate_Crouched_Idle;
    vFL_Rot = wMyParam.FL_Rot;
    vFR_Rot = wMyParam.FR_Rot;
    vBL_Rot = wMyParam.BL_Rot;
    vBR_Rot = wMyParam.BR_Rot;
    vCFL_Rot = wMyParam.CFL_Rot;
    vCFR_Rot = wMyParam.CFR_Rot;
    vCBL_Rot = wMyParam.CBL_Rot;
    vCBR_Rot = wMyParam.CBR_Rot;
    fBodyFL_Rot = wMyParam.BodyFL_Rot;
    fBodyFR_Rot = wMyParam.BodyFR_Rot;
    fBodyBL_Rot = wMyParam.BodyBL_Rot;
    fBodyBR_Rot = wMyParam.BodyBR_Rot;
}

simulated event Tick(float DeltaTime)
{
    super(Pawn).Tick(DeltaTime);
    TestVersion_SetParameters();
    // End:0x4a
    if(Controller != none && Controller.SkillBase != none)
    {
        Controller.SkillBase.UpdateProcess();
    }
    // End:0x65
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0x7b
    if(Controller != none)
    {
        OldController = Controller;
    }
    TestVersion_SetParameters();
    TickFX(DeltaTime);
    TickDamage(DeltaTime);
    // End:0xab
    if(bDeRes)
    {
        TickDeRes(DeltaTime);
    }
    // End:0x116
    if(wMyParam != none)
    {
        // End:0x116
        if(JumpZ != wMyParam.JumpMaxAcc)
        {
            JumpZ += wMyParam.JumpRecoverRate * DeltaTime;
            // End:0x116
            if(JumpZ > wMyParam.JumpMaxAcc)
            {
                JumpZ = wMyParam.JumpMaxAcc;
            }
        }
    }
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    ++ wPlayer(Level.GetLocalPlayerController()).wPawnCounts;
    AssignInitialPose();
    // End:0x45
    if(wMyParam == none)
    {
        wMyParam = new class'wMyPlayerStatus';
    }
    InitMyParam();
}

simulated function InitMyParam()
{
    wMyParam.F_DiagmoveRatio = Level.CharMgr.MyPlayer.F_DiagmoveRatio;
    wMyParam.SideMoveRatio = Level.CharMgr.MyPlayer.SideMoveRatio;
    wMyParam.B_DiagmoveRatio = Level.CharMgr.MyPlayer.B_DiagmoveRatio;
    wMyParam.BackMoveRatio = Level.CharMgr.MyPlayer.BackMoveRatio;
    wMyParam.AccelRate = Level.CharMgr.MyPlayer.AccelRate;
    wMyParam.JumpMaxAcc = Level.CharMgr.MyPlayer.JumpMaxAcc;
    wMyParam.JumpMinAcc = Level.CharMgr.MyPlayer.JumpMinAcc;
    wMyParam.JumpReduceRate = Level.CharMgr.MyPlayer.JumpReduceRate;
    wMyParam.JumpRecoverRate = Level.CharMgr.MyPlayer.JumpRecoverRate;
    wMyParam.Land_Dropspeed_Rate = Level.CharMgr.MyPlayer.Land_Dropspeed_Rate;
    wMyParam.ProneCam_MaxPicth = Level.CharMgr.MyPlayer.ProneCam_MaxPicth;
    wMyParam.ProneCam_MaxYaw = Level.CharMgr.MyPlayer.ProneCam_MaxYaw;
    wMyParam.ProneCam_RotSpeed = Level.CharMgr.MyPlayer.ProneCam_RotSpeed;
    // End:0x2e9
    if(PlayerController(Controller) != none && PlayerController(Controller).SkillBase != none && PlayerController(Controller).SkillBase.bAddStamina)
    {
        wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime * 1.30;
    }
    // End:0x318
    else
    {
        wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime;
    }
    wMyParam.Stm_Delay_Stand = Level.CharMgr.MyPlayer.Stm_Delay_Stand;
    wMyParam.Stm_Delay_Crouch = Level.CharMgr.MyPlayer.Stm_Delay_Crouch;
    wMyParam.Stm_Delay_Hit = Level.CharMgr.MyPlayer.Stm_Delay_Hit;
    JumpZ = wMyParam.JumpMaxAcc;
    wMyParam.TweenRate_Proned_Run = Level.CharMgr.MyPlayer.TweenRate_Proned_Run;
    wMyParam.TweenRate_Crouched_Run = Level.CharMgr.MyPlayer.TweenRate_Crouched_Run;
    wMyParam.TweenRate_Sprint = Level.CharMgr.MyPlayer.TweenRate_Sprint;
    wMyParam.TweenRate_Run = Level.CharMgr.MyPlayer.TweenRate_Run;
    wMyParam.TweenRate_Aim_Run = Level.CharMgr.MyPlayer.TweenRate_Aim_Run;
    wMyParam.TweenRate_Idle = Level.CharMgr.MyPlayer.TweenRate_Idle;
    wMyParam.TweenRate_SideStep = Level.CharMgr.MyPlayer.TweenRate_SideStep;
    wMyParam.TweenRate_Proned_Idle = Level.CharMgr.MyPlayer.TweenRate_Proned_Idle;
    wMyParam.TweenRate_Crouched_Idle = Level.CharMgr.MyPlayer.TweenRate_Crouched_Idle;
    wMyParam.FL_Rot = Level.CharMgr.MyPlayer.FL_Rot;
    wMyParam.FR_Rot = Level.CharMgr.MyPlayer.FR_Rot;
    wMyParam.BL_Rot = Level.CharMgr.MyPlayer.BL_Rot;
    wMyParam.BR_Rot = Level.CharMgr.MyPlayer.BR_Rot;
    wMyParam.CFL_Rot = Level.CharMgr.MyPlayer.CFL_Rot;
    wMyParam.CFR_Rot = Level.CharMgr.MyPlayer.CFR_Rot;
    wMyParam.CBL_Rot = Level.CharMgr.MyPlayer.CBL_Rot;
    wMyParam.CBR_Rot = Level.CharMgr.MyPlayer.CBR_Rot;
    wMyParam.BodyFL_Rot = Level.CharMgr.MyPlayer.BodyFL_Rot;
    wMyParam.BodyFR_Rot = Level.CharMgr.MyPlayer.BodyFR_Rot;
    wMyParam.BodyBL_Rot = Level.CharMgr.MyPlayer.BodyBL_Rot;
    wMyParam.BodyBR_Rot = Level.CharMgr.MyPlayer.BodyBR_Rot;
    wMyParam.Lean_L_Stand_0 = Level.CharMgr.MyPlayer.Lean_L_Stand_0;
    wMyParam.Lean_L_Stand_1 = Level.CharMgr.MyPlayer.Lean_L_Stand_1;
    wMyParam.Lean_L_Stand_2 = Level.CharMgr.MyPlayer.Lean_L_Stand_2;
    wMyParam.Lean_R_Stand_0 = Level.CharMgr.MyPlayer.Lean_R_Stand_0;
    wMyParam.Lean_R_Stand_1 = Level.CharMgr.MyPlayer.Lean_R_Stand_1;
    wMyParam.Lean_R_Stand_2 = Level.CharMgr.MyPlayer.Lean_R_Stand_2;
    wMyParam.Lean_L_Crouch_0 = Level.CharMgr.MyPlayer.Lean_L_Crouch_0;
    wMyParam.Lean_L_Crouch_1 = Level.CharMgr.MyPlayer.Lean_L_Crouch_1;
    wMyParam.Lean_L_Crouch_2 = Level.CharMgr.MyPlayer.Lean_L_Crouch_2;
    wMyParam.Lean_R_Crouch_0 = Level.CharMgr.MyPlayer.Lean_R_Crouch_0;
    wMyParam.Lean_R_Crouch_1 = Level.CharMgr.MyPlayer.Lean_R_Crouch_1;
    wMyParam.Lean_R_Crouch_2 = Level.CharMgr.MyPlayer.Lean_R_Crouch_2;
    wMyParam.Lean_L_Prone_0 = Level.CharMgr.MyPlayer.Lean_L_Prone_0;
    wMyParam.Lean_L_Prone_1 = Level.CharMgr.MyPlayer.Lean_L_Prone_1;
    wMyParam.Lean_L_Prone_2 = Level.CharMgr.MyPlayer.Lean_L_Prone_2;
    wMyParam.Lean_R_Prone_0 = Level.CharMgr.MyPlayer.Lean_R_Prone_0;
    wMyParam.Lean_R_Prone_1 = Level.CharMgr.MyPlayer.Lean_R_Prone_1;
    wMyParam.Lean_R_Prone_2 = Level.CharMgr.MyPlayer.Lean_R_Prone_2;
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    MultiJumpRemaining = MaxMultiJump;
    bCanDoubleJump = CanMultiJump();
    Level.GetLocalPlayerController().myHUD.ResetHud();
    iBackupTeamNum = GetTeamNum();
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local Vector HitNormal, hitRay;
    local name HitBone;
    local float HitBoneDist;
    local PlayerController PC;
    local bool bShowEffects, bRecentHit;

    bRecentHit = Level.TimeSeconds - LastPainTime < 0.50;
    super(Pawn).PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x51
    if(Damage <= float(0))
    {
        return;
    }
    PC = PlayerController(Controller);
    bShowEffects = Level.NetMode != 0 || Level.TimeSeconds - LastRenderTime < 2.50 || instigatedBy != none && PlayerController(instigatedBy.Controller) != none || PC != none;
    // End:0xe1
    if(!bShowEffects)
    {
        return;
    }
    hitRay = vect(0.0, 0.0, 0.0);
    // End:0x13b
    if(instigatedBy != none)
    {
        hitRay = Normal(HitLocation - instigatedBy.Location + vect(0.0, 0.0, 1.0) * instigatedBy.EyeHeight);
    }
    // End:0x160
    if(DamageType.default.bLocationalHit)
    {
        GetBoneNameByCollisionID(CollisionPart, HitBone);
    }
    // End:0x181
    else
    {
        HitLocation = Location;
        HitBone = 'None';
        HitBoneDist = 0.0;
    }
    // End:0x1b2
    if(DamageType.default.bAlwaysSevers && DamageType.default.bSpecial)
    {
        HitBone = 'head';
    }
    // End:0x1f9
    if(instigatedBy != none)
    {
        HitNormal = Normal(Normal(instigatedBy.Location - HitLocation) + VRand() * 0.20 + vect(0.0, 0.0, 2.80));
    }
    // End:0x228
    else
    {
        HitNormal = Normal(vect(0.0, 0.0, 1.0) + VRand() * 0.20 + vect(0.0, 0.0, 2.80));
    }
    // End:0x23a
    if(DamageType.default.bCausesBlood)
    {
    }
    DoDamageFX(HitBone, int(Damage), DamageType, rotator(HitNormal), HitLocation, CollisionPart);
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int Damage)
{
    // End:0x2d
    if(Weapon != none)
    {
        return Weapon.CheckReflect(HitLocation, RefNormal, Damage);
    }
    // End:0x2f
    else
    {
        return false;
    }
}

function name GetWeaponBoneFor(Inventory i)
{
    // End:0x1a
    if(i.IsA('wDemopack'))
    {
        return 'DemoPack';
    }
    return 'righthand';
}

function name GetOffhandBoneFor(Inventory i)
{
    return 'bip01 l hand';
}

event PlayLandedSound(int SurfType)
{
    // End:0x80
    if(Health > 0 && !bHidden && Level.TimeSeconds - SplashTime > 0.250)
    {
        PlayOwnedSound(SoundGroupClass.static.GetLanedSound(SurfType, IsLocalPlayerViewtarget()), 0, FMin(1.0, -0.60 * Velocity.Z / JumpZ),, 95.0);
    }
}

event Landed(Vector HitNormal)
{
    super(Pawn).Landed(HitNormal);
    MultiJumpRemaining = MaxMultiJump;
    Velocity *= wMyParam.Land_Dropspeed_Rate;
}

simulated function name GetAnimSequence()
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    return Anim;
}

simulated function PlayDoubleJump()
{
    local name Anim;

    Anim = DoubleJumpAnims[Get4WayDirection()];
    // End:0x2f
    if(PlayAnim(Anim, 1.0, 0.10))
    {
        bWaitForAnim = true;
    }
    AnimAction = Anim;
}

simulated function bool FindValidTaunt(out name Sequence)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < TauntAnims.Length)
    {
        // End:0x2e
        if(Sequence == TauntAnims[i])
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    j = class'SpeciesType'.static.GetOffsetForSequence(Sequence);
    // End:0x71
    if(j < 0 || j >= TauntAnims.Length)
    {
        return false;
    }
    Sequence = TauntAnims[j];
    return Sequence != 'None';
}

simulated event SetAnimAction(name NewAction)
{
    local string strAction;
    local float fAnimRate;
    local bool bDemopack;

    // End:0x0d
    if(Mesh == none)
    {
        return;
    }
    strAction = string(NewAction);
    // End:0x75d
    if(!bWaitForAnim && bySpecialState == 0)
    {
        AnimAction = NewAction;
        // End:0x82
        if(Weapon != none && AnimAction == Weapon.SprintAnim)
        {
            Weapon.LoopAnim(NewAction, 0.30, 0.30);
        }
        // End:0x75d
        else
        {
            // End:0x18f
            if(InStr(strAction, "_Reload") != -1)
            {
                StopFiring();
                // End:0xbc
                if(bCanQuickReload == true)
                {
                    fAnimRate = 1.50;
                }
                // End:0xc7
                else
                {
                    fAnimRate = 1.0;
                }
                AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                PlayAnim(NewAction, fAnimRate, 0.10, 1);
                AnimBlendToAlpha(1, 1.0, 0.20);
                // End:0x162
                if(GetTeamNum() == Level.GetLocalPlayerController().GetTeamNum() && !bReloading)
                {
                    PlayOwnedSound(Sound(DynamicLoadObject(class'wMessage_Game'.default.SoundAllyReload, class'Sound')), 0, 1.0);
                }
                // End:0x184
                if(FPWeaponAttachment != none)
                {
                    FPWeaponAttachment.SetAnimAction(0, bCanQuickReload);
                }
                bReloading = true;
            }
            // End:0x75d
            else
            {
                // End:0x22b
                if(InStr(strAction, "_Bolt") != -1 || InStr(strAction, "_Pump") != -1)
                {
                    fAnimRate = 1.0;
                    AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                    PlayAnim(NewAction, fAnimRate, 0.10, 1);
                    AnimBlendToAlpha(1, 1.0, 0.10);
                    // End:0x228
                    if(FPWeaponAttachment != none)
                    {
                        FPWeaponAttachment.SetAnimAction(2, false);
                    }
                }
                // End:0x75d
                else
                {
                    // End:0x28d
                    if(InStr(strAction, "Hit_") != -1)
                    {
                        // End:0x28a
                        if(!IsAnimating(2))
                        {
                            AnimBlendParams(2, 1.0, 0.0,, FireRootBone);
                            PlayAnim(AnimAction, 1.0, 0.10, 2);
                            AnimBlendToAlpha(2, 1.0, 0.0);
                        }
                    }
                    // End:0x75d
                    else
                    {
                        // End:0x3cc
                        if(InStr(strAction, "_Putdown") != -1 || InStr(strAction, "_PutDown") != -1)
                        {
                            // End:0x2e9
                            if(InStr(strAction, "DemoPack_") != -1)
                            {
                                bDemopack = true;
                            }
                            // End:0x311
                            if(bCanQuickWeaponChange == true && bDemopack == false)
                            {
                                fAnimRate = 2.0;
                            }
                            // End:0x31c
                            else
                            {
                                fAnimRate = 1.0;
                            }
                            AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                            PlayAnim(NewAction, fAnimRate, 0.10, 1);
                            AnimBlendToAlpha(1, 1.0, 0.20);
                            // End:0x3c9
                            if(FPWeaponAttachment != none)
                            {
                                // End:0x3b2
                                if(bDemopack)
                                {
                                    // End:0x39d
                                    if(InStr(strAction, "_Plant") == -1)
                                    {
                                        FPWeaponAttachment.SetAnimAction(3, false);
                                    }
                                    // End:0x3af
                                    else
                                    {
                                        FPWeaponAttachment.SetAnimAction(3, true);
                                    }
                                }
                                // End:0x3c9
                                else
                                {
                                    FPWeaponAttachment.SetAnimAction(1, bCanQuickWeaponChange);
                                }
                            }
                        }
                        // End:0x75d
                        else
                        {
                            // End:0x44d
                            if(InStr(strAction, "_Select") != -1)
                            {
                                // End:0x400
                                if(bCanQuickWeaponChange == true)
                                {
                                    fAnimRate = 1.30;
                                }
                                // End:0x40b
                                else
                                {
                                    fAnimRate = 1.0;
                                }
                                AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                                PlayAnim(NewAction, fAnimRate, 0.10, 1);
                                AnimBlendToAlpha(1, 1.0, 0.20);
                            }
                            // End:0x75d
                            else
                            {
                                // End:0x4c0
                                if(InStr(strAction, "_Plant") != -1 || InStr(strAction, "_Defuse") != -1)
                                {
                                    AnimBlendParams(1, 1.0, 0.0,, FireRootBone);
                                    PlayAnim(NewAction, 1.0, 0.10, 1);
                                    AnimBlendToAlpha(1, 1.0, 0.10);
                                }
                                // End:0x75d
                                else
                                {
                                    // End:0x534
                                    if(Physics == 0 || Level.Game != none && Level.Game.IsInState('MatchOver') && DrivenVehicle == none)
                                    {
                                        PlayAnim(AnimAction,, 0.10);
                                        AnimBlendToAlpha(1, 0.0, 0.050);
                                    }
                                    // End:0x75d
                                    else
                                    {
                                        // End:0x657
                                        if(DrivenVehicle != none || Physics == 2 || Physics == 1 && Velocity.Z != float(0))
                                        {
                                            // End:0x5dc
                                            if(CheckTauntValid(AnimAction))
                                            {
                                                // End:0x5d9
                                                if(FireState == 0 || FireState == 3)
                                                {
                                                    AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                                                    PlayAnim(NewAction,, 0.10, 1);
                                                    FireState = 3;
                                                }
                                            }
                                            // End:0x654
                                            else
                                            {
                                                // End:0x61c
                                                if(InStr(strAction, "_Idle") == -1 && PlayAnim(AnimAction))
                                                {
                                                    // End:0x619
                                                    if(Physics != 0)
                                                    {
                                                        bWaitForAnim = true;
                                                    }
                                                }
                                                // End:0x654
                                                else
                                                {
                                                    // End:0x649
                                                    if(InStr(strAction, "_Idle") != -1 && AnimAction == GetAnimSequence())
                                                    {
                                                    }
                                                    // End:0x654
                                                    else
                                                    {
                                                        AnimAction = 'None';
                                                    }
                                                }
                                            }
                                        }
                                        // End:0x75d
                                        else
                                        {
                                            // End:0x6b2
                                            if(InStr(strAction, "_Throw") != -1)
                                            {
                                                AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                                                PlayAnim(NewAction, 1.0, 0.10, 1);
                                                AnimBlendToAlpha(1, 1.0, 0.20);
                                            }
                                            // End:0x75d
                                            else
                                            {
                                                // End:0x709
                                                if(bIsIdle && !bIsCrouched && !bIsProned && Bot(Controller) == none)
                                                {
                                                    PlayAnim(AnimAction,, 0.10);
                                                    AnimBlendToAlpha(1, 0.0, 0.050);
                                                }
                                                // End:0x75d
                                                else
                                                {
                                                    // End:0x75d
                                                    if(FireState == 0 || FireState == 3)
                                                    {
                                                        AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
                                                        PlayAnim(NewAction,, 0.10, 1);
                                                        FireState = 3;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

simulated function StartFiring(bool bHeavy, bool bRapid)
{
    local name FireAnim;
    local bool bFrag, hasBomb;
    local byte byTeamNumber;

    // End:0x12
    if(Physics == 3)
    {
        return;
    }
    // End:0x20
    if(bIsTurreting == true)
    {
        return;
    }
    // End:0x4d
    if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
    {
        bFrag = true;
    }
    // End:0x55
    else
    {
        bFrag = false;
    }
    // End:0x83
    if(bFrag == false && bIsIdle == false && TypeOfWeapon != 10)
    {
        return;
    }
    // End:0xa5
    if(none != Controller)
    {
        byTeamNumber = byte(Controller.GetTeamNum());
    }
    hasBomb = Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byTeamNumber);
    // End:0x236
    if(bIsCrouched == true)
    {
        // End:0x1ec
        if(bIsAiming == false)
        {
            // End:0x13d
            if(TypeOfWeapon == 17)
            {
                FireAnim = Knife_Fire_Cr;
            }
            // End:0x1e9
            else
            {
                // End:0x157
                if(bFrag == true)
                {
                    FireAnim = Frag_Burst_Anim;
                }
                // End:0x1e9
                else
                {
                    // End:0x175
                    if(TypeOfWeapon == 4)
                    {
                        FireAnim = Pistol_FireCrouchRifleRapidAnim;
                    }
                    // End:0x1e9
                    else
                    {
                        // End:0x193
                        if(TypeOfWeapon == 7)
                        {
                            FireAnim = Rpg_FireCrouchRifleRapidAnim;
                        }
                        // End:0x1e9
                        else
                        {
                            // End:0x1de
                            if(TypeOfWeapon == 10)
                            {
                                // End:0x1d0
                                if(PlayerReplicationInfo.HasFlag != none || hasBomb)
                                {
                                    FireAnim = Crouch_Bomb_Plant;
                                }
                                // End:0x1db
                                else
                                {
                                    FireAnim = Crouch_Bomb_Defuse;
                                }
                            }
                            // End:0x1e9
                            else
                            {
                                FireAnim = FireCrouchRifleRapidAnim;
                            }
                        }
                    }
                }
            }
        }
        // End:0x233
        else
        {
            // End:0x20a
            if(TypeOfWeapon == 4)
            {
                FireAnim = Pistol_FireCrouchRifleRapidAnim;
            }
            // End:0x233
            else
            {
                // End:0x228
                if(TypeOfWeapon == 7)
                {
                    FireAnim = Rpg_FireCrouchRifleRapidAnim;
                }
                // End:0x233
                else
                {
                    FireAnim = FireCrouchRifleRapidAnim;
                }
            }
        }
    }
    // End:0x42f
    else
    {
        // End:0x30f
        if(bIsProned == true)
        {
            // End:0x260
            if(TypeOfWeapon == 17)
            {
                FireAnim = Knife_Fire_Pr;
            }
            // End:0x30c
            else
            {
                // End:0x27a
                if(bFrag == true)
                {
                    FireAnim = Frag_ProneBurst;
                }
                // End:0x30c
                else
                {
                    // End:0x298
                    if(TypeOfWeapon == 4)
                    {
                        FireAnim = Pistol_ProneBurst;
                    }
                    // End:0x30c
                    else
                    {
                        // End:0x2b6
                        if(TypeOfWeapon == 7)
                        {
                            FireAnim = Rpg_ProneBurst;
                        }
                        // End:0x30c
                        else
                        {
                            // End:0x301
                            if(TypeOfWeapon == 10)
                            {
                                // End:0x2f3
                                if(PlayerReplicationInfo.HasFlag != none || hasBomb)
                                {
                                    FireAnim = Prone_Bomb_Plant;
                                }
                                // End:0x2fe
                                else
                                {
                                    FireAnim = Prone_Bomb_Defuse;
                                }
                            }
                            // End:0x30c
                            else
                            {
                                FireAnim = FireProneRifleRapidAnim;
                            }
                        }
                    }
                }
            }
        }
        // End:0x42f
        else
        {
            // End:0x3e8
            if(bIsAiming == false)
            {
                // End:0x339
                if(TypeOfWeapon == 17)
                {
                    FireAnim = Knife_Fire;
                }
                // End:0x3e5
                else
                {
                    // End:0x353
                    if(bFrag == true)
                    {
                        FireAnim = Frag_Burst_Anim;
                    }
                    // End:0x3e5
                    else
                    {
                        // End:0x371
                        if(TypeOfWeapon == 4)
                        {
                            FireAnim = Pistol_FireRifleRapidAnim;
                        }
                        // End:0x3e5
                        else
                        {
                            // End:0x38f
                            if(TypeOfWeapon == 7)
                            {
                                FireAnim = Rpg_Burst_Anim;
                            }
                            // End:0x3e5
                            else
                            {
                                // End:0x3da
                                if(TypeOfWeapon == 10)
                                {
                                    // End:0x3cc
                                    if(PlayerReplicationInfo.HasFlag != none || hasBomb)
                                    {
                                        FireAnim = Bomb_Plant;
                                    }
                                    // End:0x3d7
                                    else
                                    {
                                        FireAnim = Bomb_Defuse;
                                    }
                                }
                                // End:0x3e5
                                else
                                {
                                    FireAnim = FireRifleRapidAnim;
                                }
                            }
                        }
                    }
                }
            }
            // End:0x42f
            else
            {
                // End:0x406
                if(TypeOfWeapon == 4)
                {
                    FireAnim = Pistol_FireAimRifleRapidAnim;
                }
                // End:0x42f
                else
                {
                    // End:0x424
                    if(TypeOfWeapon == 7)
                    {
                        FireAnim = Rpg_Burst_Anim;
                    }
                    // End:0x42f
                    else
                    {
                        FireAnim = FireAimRifleRapidAnim;
                    }
                }
            }
        }
    }
    AnimBlendParams(1, 1.0, 0.0, 0.20, FireRootBone);
    // End:0x47d
    if(bRapid)
    {
        // End:0x47a
        if(FireState != 2)
        {
            LoopAnim(FireAnim,, 0.0, 1);
            FireState = 2;
        }
    }
    // End:0x494
    else
    {
        PlayAnim(FireAnim,, 0.0, 1);
        FireState = 1;
    }
    // End:0x525
    if(bFrag == true && GetTeamNum() == Level.GetLocalPlayerController().GetTeamNum() && Level.GetLocalPlayerController().Pawn != self)
    {
        PlayOwnedSound(Sound(DynamicLoadObject(class'wGameManager'.default.VoicePackageName $ WeaponAttachment.ResParams.default.str_sound_Grenade, class'Sound')), 0);
    }
    IdleTime = Level.TimeSeconds;
}

simulated function StopFiring()
{
    // End:0x18
    if(FireState == 2)
    {
        FireState = 1;
    }
    IdleTime = Level.TimeSeconds;
}

simulated function bool GetIsFiring()
{
    // End:0x24
    if(FireState == 0 || FireState == 3)
    {
        return false;
    }
    return true;
}

simulated event InitialPlayer()
{
    FireState = 0;
}

simulated function ScriptPlayIdle(int Channel)
{
    // End:0x0e
    if(bIsIdle == false)
    {
        return;
    }
    // End:0x7e
    if(bIsCrouched == true)
    {
        // End:0x52
        if(bIsAiming == false)
        {
            // End:0x44
            if(TypeOfWeapon == 4)
            {
                IdleWeaponAnim = Pistol_IdleCrouchAnim;
            }
            // End:0x4f
            else
            {
                IdleWeaponAnim = IdleCrouchAnim;
            }
        }
        // End:0x7b
        else
        {
            // End:0x70
            if(TypeOfWeapon == 4)
            {
                IdleWeaponAnim = Pistol_IdleCrouchAnim;
            }
            // End:0x7b
            else
            {
                IdleWeaponAnim = IdleAimCrouchAnim;
            }
        }
    }
    // End:0x180
    else
    {
        // End:0xb3
        if(bIsProned)
        {
            // End:0xa5
            if(TypeOfWeapon == 4)
            {
                IdleWeaponAnim = Pistol_IdleProne;
            }
            // End:0xb0
            else
            {
                IdleWeaponAnim = IdleProneAnim;
            }
        }
        // End:0x180
        else
        {
            // End:0x139
            if(bIsAiming == false)
            {
                // End:0xdd
                if(TypeOfWeapon == 4)
                {
                    IdleWeaponAnim = Pistol_IdleRifleAnim;
                }
                // End:0x136
                else
                {
                    // End:0x10d
                    if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                    {
                        IdleWeaponAnim = Frag_Idle_Anim;
                    }
                    // End:0x136
                    else
                    {
                        // End:0x12b
                        if(TypeOfWeapon == 7)
                        {
                            IdleWeaponAnim = Rpg_Idle_Anim;
                        }
                        // End:0x136
                        else
                        {
                            IdleWeaponAnim = IdleRifleAnim;
                        }
                    }
                }
            }
            // End:0x180
            else
            {
                // End:0x157
                if(TypeOfWeapon == 4)
                {
                    IdleWeaponAnim = Pistol_IdleRifleAnim;
                }
                // End:0x180
                else
                {
                    // End:0x175
                    if(TypeOfWeapon == 7)
                    {
                        IdleWeaponAnim = Rpg_Idle_Anim;
                    }
                    // End:0x180
                    else
                    {
                        IdleWeaponAnim = IdleAimAnim;
                    }
                }
            }
        }
    }
    LoopAnim(IdleWeaponAnim,, 0.250, Channel);
}

simulated event AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local string strAnim;

    // End:0x15b
    if(Channel == 1)
    {
        GetAnimParams(1, Anim, frame, Rate);
        strAnim = string(Anim);
        // End:0x6e
        if(InStr(strAnim, "_Reload") != -1)
        {
            FireState = 0;
            AnimBlendToAlpha(1, 0.0, 0.20);
            bReloading = false;
            return;
        }
        // End:0xef
        else
        {
            // End:0x8e
            if(InStr(strAnim, "_Putdown") != -1)
            {
                return;
            }
            // End:0xef
            else
            {
                // End:0xef
                if(InStr(strAnim, "_Select") != -1)
                {
                    // End:0xdc
                    if(bIsIdle)
                    {
                        GetAnimParams(0, Anim, frame, Rate);
                        // End:0xdc
                        if(Anim != Frag_Burst_Anim)
                        {
                            ForcePlayIdle();
                        }
                    }
                    AnimBlendToAlpha(1, 0.0, 0.20);
                    return;
                }
            }
        }
        // End:0x11b
        if(FireState == 3)
        {
            AnimBlendToAlpha(1, 0.0, 0.120);
            FireState = 0;
        }
        // End:0x158
        else
        {
            // End:0x147
            if(FireState == 1)
            {
                AnimBlendToAlpha(1, 0.0, 0.120);
                FireState = 3;
            }
            // End:0x158
            else
            {
                AnimBlendToAlpha(1, 0.0, 0.120);
            }
        }
    }
    // End:0x1ca
    else
    {
        // End:0x1bf
        if(Channel == 2)
        {
            GetAnimParams(2, Anim, frame, Rate);
            strAnim = string(Anim);
            // End:0x1bc
            if(InStr(strAnim, "Hit_") != -1)
            {
                AnimBlendParams(2, 0.0, 0.0,, FireRootBone);
                return;
            }
        }
        // End:0x1ca
        else
        {
            // End:0x1ca
            if(Channel == 0)
            {
            }
        }
    }
}

function PlayWeaponSwitch(wWeapon newWeapon)
{
    // End:0x24
    if(TypeOfWeapon == 10 || TypeOfWeapon == 12)
    {
        return;
    }
    // End:0x10c
    if(bIsProned)
    {
        // End:0x4b
        if(TypeOfWeapon == 4)
        {
            WeaponSelectAnim = Pistol_ProneSelect;
        }
        // End:0x109
        else
        {
            // End:0x7b
            if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
            {
                WeaponSelectAnim = Frag_ProneSelect;
            }
            // End:0x109
            else
            {
                // End:0x99
                if(TypeOfWeapon == 7)
                {
                    WeaponSelectAnim = Rpg_ProneSelect;
                }
                // End:0x109
                else
                {
                    // End:0xdb
                    if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                    {
                        WeaponSelectAnim = TelegraphPack_SelectAnim;
                    }
                    // End:0x109
                    else
                    {
                        // End:0xfe
                        if(newWeapon.bCanSelectNew == true)
                        {
                            WeaponSelectAnim = SelectNew_Prone_Rifle_Anim;
                        }
                        // End:0x109
                        else
                        {
                            WeaponSelectAnim = Select_Prone_Rifle_Anim;
                        }
                    }
                }
            }
        }
    }
    // End:0x2d0
    else
    {
        // End:0x1f4
        if(bIsCrouched)
        {
            // End:0x133
            if(TypeOfWeapon == 4)
            {
                WeaponSelectAnim = Pistol_CrouchSelect;
            }
            // End:0x1f1
            else
            {
                // End:0x163
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    WeaponSelectAnim = Frag_CrouchSelect;
                }
                // End:0x1f1
                else
                {
                    // End:0x181
                    if(TypeOfWeapon == 7)
                    {
                        WeaponSelectAnim = Rpg_CrouchSelect;
                    }
                    // End:0x1f1
                    else
                    {
                        // End:0x1c3
                        if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                        {
                            WeaponSelectAnim = TelegraphPack_SelectAnim;
                        }
                        // End:0x1f1
                        else
                        {
                            // End:0x1e6
                            if(newWeapon.bCanSelectNew == true)
                            {
                                WeaponSelectAnim = SelectNew_Crouch_Rifle_Anim;
                            }
                            // End:0x1f1
                            else
                            {
                                WeaponSelectAnim = Select_Crouch_Rifle_Anim;
                            }
                        }
                    }
                }
            }
        }
        // End:0x2d0
        else
        {
            // End:0x212
            if(TypeOfWeapon == 4)
            {
                WeaponSelectAnim = Pistol_Select_Rifle_Anim;
            }
            // End:0x2d0
            else
            {
                // End:0x242
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    WeaponSelectAnim = Frag_Select_Anim;
                }
                // End:0x2d0
                else
                {
                    // End:0x260
                    if(TypeOfWeapon == 7)
                    {
                        WeaponSelectAnim = Rpg_Select_Anim;
                    }
                    // End:0x2d0
                    else
                    {
                        // End:0x2a2
                        if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                        {
                            WeaponSelectAnim = TelegraphPack_SelectAnim;
                        }
                        // End:0x2d0
                        else
                        {
                            // End:0x2c5
                            if(newWeapon.bCanSelectNew == true)
                            {
                                WeaponSelectAnim = SelectNew_Rifle_Anim;
                            }
                            // End:0x2d0
                            else
                            {
                                WeaponSelectAnim = Select_Rifle_Anim;
                            }
                        }
                    }
                }
            }
        }
    }
    SetAnimAction(WeaponSelectAnim);
}

function ServerPlayPutdownWeaponAnim(bool bQuick)
{
    local bool hasBomb, bDemopack;
    local name Anim;
    local float frame, Rate;

    // End:0x21d
    if(bIsProned == true)
    {
        // End:0x44
        if(TypeOfWeapon == 4)
        {
            // End:0x36
            if(bQuick == true)
            {
                WeaponPutDownAnim = Pistol_PronePutdownQuick;
            }
            // End:0x41
            else
            {
                WeaponPutDownAnim = Pistol_PronePutdown;
            }
        }
        // End:0x21a
        else
        {
            // End:0x8e
            if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
            {
                // End:0x80
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Frag_PronePutdownQuick;
                }
                // End:0x8b
                else
                {
                    WeaponPutDownAnim = Frag_PronePutdown;
                }
            }
            // End:0x21a
            else
            {
                // End:0xc6
                if(TypeOfWeapon == 7)
                {
                    // End:0xb8
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Rpg_PronePutdownQuick;
                    }
                    // End:0xc3
                    else
                    {
                        WeaponPutDownAnim = Rpg_PronePutdown;
                    }
                }
                // End:0x21a
                else
                {
                    // End:0x108
                    if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                    {
                        WeaponPutDownAnim = TelegraphPack_PutdownAnim;
                    }
                    // End:0x21a
                    else
                    {
                        // End:0x1f5
                        if(TypeOfWeapon == 10)
                        {
                            hasBomb = PlayerReplicationInfo.HasFlag != none && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                            hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                            // End:0x1df
                            if(hasBomb)
                            {
                                WeaponPutDownAnim = DemoPack_Plant_Prone_PutDown_Anim;
                            }
                            // End:0x1ea
                            else
                            {
                                WeaponPutDownAnim = DemoPack_Defuse_Prone_PutDown_Anim;
                            }
                            bDemopack = true;
                        }
                        // End:0x21a
                        else
                        {
                            // End:0x20f
                            if(bQuick == true)
                            {
                                WeaponPutDownAnim = PutdownQuick_Prone_Rifle_Anim;
                            }
                            // End:0x21a
                            else
                            {
                                WeaponPutDownAnim = Putdown_Prone_Rifle_Anim;
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x648
    else
    {
        // End:0x43a
        if(bIsCrouched == true)
        {
            // End:0x261
            if(TypeOfWeapon == 4)
            {
                // End:0x253
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Pistol_CrouchPutdownQuick;
                }
                // End:0x25e
                else
                {
                    WeaponPutDownAnim = Pistol_CrouchPutdown;
                }
            }
            // End:0x437
            else
            {
                // End:0x2ab
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    // End:0x29d
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Frag_CrouchPutdownQuick;
                    }
                    // End:0x2a8
                    else
                    {
                        WeaponPutDownAnim = Frag_CrouchPutdown;
                    }
                }
                // End:0x437
                else
                {
                    // End:0x2e3
                    if(TypeOfWeapon == 7)
                    {
                        // End:0x2d5
                        if(bQuick == true)
                        {
                            WeaponPutDownAnim = Rpg_CrouchPutdownQuick;
                        }
                        // End:0x2e0
                        else
                        {
                            WeaponPutDownAnim = Rpg_CrouchPutdown;
                        }
                    }
                    // End:0x437
                    else
                    {
                        // End:0x325
                        if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                        {
                            WeaponPutDownAnim = TelegraphPack_PutdownAnim;
                        }
                        // End:0x437
                        else
                        {
                            // End:0x412
                            if(TypeOfWeapon == 10)
                            {
                                hasBomb = PlayerReplicationInfo.HasFlag != none && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                                hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                                // End:0x3fc
                                if(hasBomb)
                                {
                                    WeaponPutDownAnim = DemoPack_Plant_PutDown_Anim;
                                }
                                // End:0x407
                                else
                                {
                                    WeaponPutDownAnim = DemoPack_Defuse_PutDown_Anim;
                                }
                                bDemopack = true;
                            }
                            // End:0x437
                            else
                            {
                                // End:0x42c
                                if(bQuick == true)
                                {
                                    WeaponPutDownAnim = PutdownQuick_Crouch_Rifle_Anim;
                                }
                                // End:0x437
                                else
                                {
                                    WeaponPutDownAnim = Putdown_Crouch_Rifle_Anim;
                                }
                            }
                        }
                    }
                }
            }
        }
        // End:0x648
        else
        {
            // End:0x472
            if(TypeOfWeapon == 4)
            {
                // End:0x464
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Pistol_PutdownQuick_Rifle_Anim;
                }
                // End:0x46f
                else
                {
                    WeaponPutDownAnim = Pistol_Putdown_Rifle_Anim;
                }
            }
            // End:0x648
            else
            {
                // End:0x4bc
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    // End:0x4ae
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Frag_PutDownQuick_Anim;
                    }
                    // End:0x4b9
                    else
                    {
                        WeaponPutDownAnim = Frag_PutDown_Anim;
                    }
                }
                // End:0x648
                else
                {
                    // End:0x4f4
                    if(TypeOfWeapon == 7)
                    {
                        // End:0x4e6
                        if(bQuick == true)
                        {
                            WeaponPutDownAnim = Rpg_PutDownQuick_Anim;
                        }
                        // End:0x4f1
                        else
                        {
                            WeaponPutDownAnim = Rpg_PutDown_Anim;
                        }
                    }
                    // End:0x648
                    else
                    {
                        // End:0x536
                        if(TypeOfWeapon == 15 || TypeOfWeapon == 16 || TypeOfWeapon == 14)
                        {
                            WeaponPutDownAnim = TelegraphPack_PutdownAnim;
                        }
                        // End:0x648
                        else
                        {
                            // End:0x623
                            if(TypeOfWeapon == 10)
                            {
                                hasBomb = PlayerReplicationInfo.HasFlag != none && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                                hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                                // End:0x60d
                                if(hasBomb)
                                {
                                    WeaponPutDownAnim = DemoPack_Plant_PutDown_Anim;
                                }
                                // End:0x618
                                else
                                {
                                    WeaponPutDownAnim = DemoPack_Defuse_PutDown_Anim;
                                }
                                bDemopack = true;
                            }
                            // End:0x648
                            else
                            {
                                // End:0x63d
                                if(bQuick == true)
                                {
                                    WeaponPutDownAnim = PutdownQuick_Rifle_Anim;
                                }
                                // End:0x648
                                else
                                {
                                    WeaponPutDownAnim = Putdown_Rifle_Anim;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x678
    if(bDemopack)
    {
        GetAnimParams(1, Anim, frame, Rate);
        // End:0x678
        if(Anim == WeaponPutDownAnim)
        {
            return;
        }
    }
    SetAnimAction(WeaponPutDownAnim);
}

function ServerThrowsWeaponAnim(bool bQuick)
{
    local bool hasBomb, bEnableThrowBomb, bDemopack;
    local name Anim;
    local float frame, Rate;

    // End:0xe1
    if(TypeOfWeapon == 10)
    {
        hasBomb = PlayerReplicationInfo.HasFlag != none && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
        bEnableThrowBomb = hasBomb && !Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted;
        // End:0xd7
        if(bEnableThrowBomb)
        {
            // End:0xb2
            if(bIsProned)
            {
                WeaponPutDownAnim = DemoPack_Throw_Prone_Anim;
            }
            // End:0xd4
            else
            {
                // End:0xc9
                if(bIsCrouched)
                {
                    WeaponPutDownAnim = DemoPack_Throw_Crouch_Anim;
                }
                // End:0xd4
                else
                {
                    WeaponPutDownAnim = DemoPack_Throw_Anim;
                }
            }
        }
        // End:0xd9
        else
        {
            return;
        }
        bDemopack = true;
    }
    // End:0x128
    if(bDemopack)
    {
        DropFlag("ThrowsTheWeapon");
        GetAnimParams(1, Anim, frame, Rate);
        // End:0x128
        if(Anim == WeaponPutDownAnim)
        {
            return;
        }
    }
    SetAnimAction(WeaponPutDownAnim);
}

simulated event CheckProneAni(bool bGoProne)
{
    // End:0x2f
    if(Weapon != none && Weapon.IsReloading())
    {
        bWaitForAnim = false;
        PlayReload();
        return;
    }
    AnimBlendParams(1, 0.0, 0.0, 1.0, FireRootBone);
    AnimBlendToAlpha(1, 0.0, 0.20);
}

function PlayVictoryAnimation()
{
    local int tauntNum;

    tauntNum = Rand(TauntAnims.Length - 3);
    SetAnimAction(TauntAnims[3 + tauntNum]);
}

simulated function SetWeaponAttachment(wWeaponAttachment NewAtt)
{
    WeaponAttachment = NewAtt;
}

event KSkelConvulse()
{
    // End:0x1c
    if(RagConvulseMaterial != none)
    {
        SetOverlayMaterial(RagConvulseMaterial, 0.40, true);
    }
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand(true);
    RotationRate.Yaw = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Pitch = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Roll = int(spinRate * float(2) * FRand() - spinRate);
    bFixedRotationDir = true;
    bRotateToDesired = false;
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    local float frame, Rate;
    local name Seq;

    AmbientSound = none;
    bCanTeleport = false;
    bReplicateMovement = false;
    bTearOff = true;
    bPlayedDeath = true;
    iDiedCollisionPart = CollisionPart;
    // End:0x49
    if(CurrentCombo != none)
    {
        CurrentCombo.Destroy();
    }
    HitDamageType = DamageType;
    TakeHitLocation = HitLoc;
    HitCollisionPart = CollisionPart;
    // End:0x20e
    if(DamageType != none)
    {
        // End:0x165
        if(DamageType.default.bSkeletize)
        {
            SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 4.0, true);
            // End:0x162
            if(!bSkeletized)
            {
                // End:0x12b
                if(Level.NetMode != 1 && SkeletonMesh != none)
                {
                    // End:0xe4
                    if(DamageType.default.bLeaveBodyEffect)
                    {
                    }
                    GetAnimParams(0, Seq, frame, Rate);
                    LinkMesh(SkeletonMesh, true);
                    Skins.Length = 0;
                    PlayAnim(Seq, 0.0, 0.0);
                    SetAnimFrame(frame);
                }
                // End:0x14e
                if(Physics == 1)
                {
                    Velocity = vect(0.0, 0.0, 0.0);
                }
                TearOffMomentum *= 0.250;
                bSkeletized = true;
            }
        }
        // End:0x20e
        else
        {
            // End:0x19f
            if(DamageType.default.DeathOverlayMaterial != none)
            {
                SetOverlayMaterial(DamageType.default.DeathOverlayMaterial, DamageType.default.DeathOverlayTime, true);
            }
            // End:0x20e
            else
            {
                // End:0x20e
                if(DamageType.default.DamageOverlayMaterial != none && Level.DetailMode != 0 && !Level.bDropDetail)
                {
                    SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 2.0 * DamageType.default.DamageOverlayTime, true);
                }
            }
        }
    }
    AnimBlendParams(1, 0.0);
    FireState = 0;
    LifeSpan = RagdollLifeSpan;
    PlayDyingAnimation(DamageType, HitLoc);
    GotoState('Dying');
}

function PlayDyingAnimation(class<DamageType> DamageType, Vector HitLoc)
{
    local Vector shotDir, hitLocRel, deathAngVel, shotStrength;
    local float maxDim;
    local string RagSkelName;
    local KarmaParamsSkel skelParams;
    local bool PlayersRagdoll;
    local PlayerController PC;

    // End:0x0d
    if(Mesh == none)
    {
        return;
    }
    // End:0x42d
    if(Level.NetMode != 1)
    {
        // End:0x41
        if(OldController != none)
        {
            PC = PlayerController(OldController);
        }
        // End:0x6a
        if(PC != none && PC.ViewTarget == self)
        {
            PlayersRagdoll = true;
        }
        // End:0x84
        if(RagdollOverride != "")
        {
            RagSkelName = RagdollOverride;
        }
        // End:0xa3
        else
        {
            Log("wPawn.PlayDying: No Species");
        }
        // End:0xc3
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
        // End:0x42d
        if(Level.bLevelPrecached && Level.GetIsUseRagdoll())
        {
            // End:0xfb
            if(RagSkelName != "")
            {
                KMakeRagdollAvailable();
            }
            // End:0x42d
            if(KIsRagdollAvailable() && RagSkelName != "")
            {
                skelParams = KarmaParamsSkel(KParams);
                skelParams.KSkeleton = RagSkelName;
                StopAnimating();
                // End:0x1a6
                if(DamageType != none)
                {
                    // End:0x16c
                    if(DamageType.default.bLeaveBodyEffect)
                    {
                        TearOffMomentum = vect(0.0, 0.0, 0.0);
                    }
                    // End:0x1a6
                    if(DamageType.default.bKUseOwnDeathVel)
                    {
                        RagDeathVel = DamageType.default.KDeathVel;
                        RagDeathUpKick = DamageType.default.KDeathUpKick;
                    }
                }
                shotDir = Normal(TearOffMomentum);
                shotStrength = RagDeathVel * shotDir;
                hitLocRel = TakeHitLocation - Location;
                hitLocRel.X *= RagSpinScale;
                hitLocRel.Y *= RagSpinScale;
                // End:0x21c
                if(VSize(TearOffMomentum) < 0.010)
                {
                    deathAngVel = VRand() * 18000.0;
                }
                // End:0x235
                else
                {
                    deathAngVel = RagInvInertia * hitLocRel Cross shotStrength;
                }
                skelParams.KStartLinVel = TearOffMomentum + Velocity;
                // End:0x2ac
                if(!DamageType.default.bLeaveBodyEffect && !DamageType.default.bRubbery && Velocity.Z > float(-10))
                {
                    skelParams.KStartLinVel.Z += RagDeathUpKick;
                }
                // End:0x2f0
                if(DamageType.default.bRubbery)
                {
                    Velocity = vect(0.0, 0.0, 0.0);
                    skelParams.KStartAngVel = vect(0.0, 0.0, 0.0);
                }
                // End:0x378
                else
                {
                    skelParams.KStartAngVel = deathAngVel;
                    maxDim = float(Max(int(CollisionRadius), int(CollisionHeight)));
                    skelParams.KShotStart = TakeHitLocation - float(1) * shotDir;
                    skelParams.KShotEnd = TakeHitLocation + float(2) * maxDim * shotDir;
                    skelParams.KShotStrength = RagShootStrength;
                }
                // End:0x3bc
                if(DamageType != none && DamageType.default.bCauseConvulsions)
                {
                    RagConvulseMaterial = DamageType.default.DamageOverlayMaterial;
                    skelParams.bKDoConvulsions = true;
                }
                KSetBlockKarma(true);
                SetPhysics(14);
                // End:0x3e2
                if(PlayersRagdoll)
                {
                    skelParams.bKImportantRagdoll = true;
                }
                skelParams.bRubbery = DamageType.default.bRubbery;
                bRubbery = DamageType.default.bRubbery;
                skelParams.KActorGravScale = RagGravScale;
                return;
            }
        }
    }
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    // End:0x4a6
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0x4a3
        if(PC == none || PC.ViewTarget != self || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }
    }
    // End:0x4ae
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0);
    PlayDirectionalDeath(HitLoc);
    // End:0x4d9
    if(Physics != 14)
    {
        SetPhysics(2);
    }
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
    bGibbed = true;
    PlayDyingSound();
    // End:0x22
    if(Level.GetIsNoGore())
    {
        return;
    }
    // End:0x5b
    if(GibCountTorso + GibCountHead + GibCountForearm + GibCountUpperArm > 3)
    {
        Spawn(GibGroupClass.default.BloodGibClass,,, Location);
    }
    -- GibCountTorso;
}

function ClientDying(class<DamageType> DamageType, Vector HitLocation);
function PlayTakeHit(Vector HitLocation, int Damage, class<DamageType> DamageType)
{
    // End:0x0d
    if(Damage <= 0)
    {
        return;
    }
    PlayDirectionalHit(HitLocation, DamageType.default.UseHitStunAni);
    // End:0x48
    if(Level.TimeSeconds - LastPainSound < MinTimeBetweenPainSounds)
    {
        return;
    }
    LastPainSound = Level.TimeSeconds;
    // End:0xb9
    if(HeadVolume.bWaterVolume)
    {
        // End:0x9e
        if(DamageType.IsA('Drowned'))
        {
            PlaySound(GetSound(6), 2, 1.50 * TransientSoundVolume);
        }
        // End:0xb7
        else
        {
            PlaySound(GetSound(2), 2, 1.50 * TransientSoundVolume);
        }
        return;
    }
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    local int numSounds, SoundNum;

    numSounds = RagImpactSounds.Length;
    // End:0x6e
    if(numSounds > 0 && Level.TimeSeconds > RagLastSoundTime + RagImpactSoundInterval)
    {
        SoundNum = Rand(numSounds);
        PlaySound(RagImpactSounds[SoundNum], 2, RagImpactVolume);
        RagLastSoundTime = Level.TimeSeconds;
    }
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
    local Vector X, Y, Z, Dir;
    local bool bTmProned, bTmCrouched;

    // End:0x34
    if(bEndProned || bIsProned || PlayerReplicationInfo == none && bWasProned)
    {
        bTmProned = true;
    }
    // End:0x68
    if(bEndCrouched || bIsCrouched || PlayerReplicationInfo == none && bWasCrouched)
    {
        bTmCrouched = true;
    }
    // End:0x84
    if(bTmProned == true)
    {
        PlayAnim(Death_Pr,, 0.0);
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    HitLoc.Z = Location.Z;
    // End:0xe5
    if(VSize(Velocity) < 10.0 && VSize(Location - HitLoc) < 1.0)
    {
        Dir = VRand();
    }
    // End:0x12c
    else
    {
        // End:0x116
        if(VSize(Velocity) > 0.0)
        {
            Dir = Normal(Velocity * vect(1.0, 1.0, 0.0));
        }
        // End:0x12c
        else
        {
            Dir = -Normal(Location - HitLoc);
        }
    }
    // End:0x193
    if(Dir Dot X > 0.70 || Dir == vect(0.0, 0.0, 0.0))
    {
        // End:0x17d
        if(bTmCrouched == true)
        {
            PlayAnim(Death_Cr_B[Rand(2)],, 0.0);
        }
        // End:0x190
        else
        {
            PlayAnim(Death_B[Rand(3)],, 0.0);
        }
    }
    // End:0x2a5
    else
    {
        // End:0x1e1
        if(Dir Dot X < -0.70)
        {
            // End:0x1cb
            if(bTmCrouched == true)
            {
                PlayAnim(Death_Cr_F[Rand(2)],, 0.0);
            }
            // End:0x1de
            else
            {
                PlayAnim(Death_F[Rand(3)],, 0.0);
            }
        }
        // End:0x2a5
        else
        {
            // End:0x22d
            if(Dir Dot Y > float(0))
            {
                // End:0x217
                if(bTmCrouched == true)
                {
                    PlayAnim(Death_Cr_L[Rand(2)],, 0.0);
                }
                // End:0x22a
                else
                {
                    PlayAnim(Death_L[Rand(3)],, 0.0);
                }
            }
            // End:0x2a5
            else
            {
                // End:0x270
                if(HasAnim('DeathR'))
                {
                    // End:0x25a
                    if(bTmCrouched == true)
                    {
                        PlayAnim(Death_Cr_R[Rand(2)],, 0.0);
                    }
                    // End:0x26d
                    else
                    {
                        PlayAnim(Death_R[Rand(3)],, 0.0);
                    }
                }
                // End:0x2a5
                else
                {
                    // End:0x292
                    if(bTmCrouched == true)
                    {
                        PlayAnim(Death_Cr_F[Rand(2)],, 0.0);
                    }
                    // End:0x2a5
                    else
                    {
                        PlayAnim(Death_F[Rand(3)],, 0.0);
                    }
                }
            }
        }
    }
    AnimBlendParams(1, 0.0, 0.0, 1.0, FireRootBone);
    AnimBlendToAlpha(1, 0.0, 0.0);
    AnimBlendParams(2, 0.0, 0.0, 1.0, FireRootBone);
    AnimBlendToAlpha(2, 0.0, 0.0);
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    local Vector X, Y, Z, Dir;
    local name HitAnimName;
    local int iDir;
    local bool bTmProned, bTmCrouched;

    // End:0x1c
    if(bEndProned || bIsProned)
    {
        bTmProned = true;
    }
    // End:0x38
    if(bEndCrouched || bIsCrouched)
    {
        bTmCrouched = true;
    }
    // End:0x45
    if(DrivenVehicle != none)
    {
        return;
    }
    // End:0x198
    if(bUseHitStun)
    {
        // End:0xa0
        if(TypeOfWeapon == 4)
        {
            // End:0x78
            if(bTmProned == true)
            {
                HitAnimName = Hit_PS_Stun_Pr;
            }
            // End:0x9d
            else
            {
                // End:0x92
                if(bTmCrouched == true)
                {
                    HitAnimName = Hit_PS_Stun_Cr;
                }
                // End:0x9d
                else
                {
                    HitAnimName = Hit_PS_Stun;
                }
            }
        }
        // End:0x195
        else
        {
            // End:0x104
            if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
            {
                // End:0xdc
                if(bTmProned == true)
                {
                    HitAnimName = Hit_FR_Stun_Pr;
                }
                // End:0x101
                else
                {
                    // End:0xf6
                    if(bTmCrouched == true)
                    {
                        HitAnimName = Hit_FR_Stun_Cr;
                    }
                    // End:0x101
                    else
                    {
                        HitAnimName = Hit_FR_Stun;
                    }
                }
            }
            // End:0x195
            else
            {
                // End:0x156
                if(TypeOfWeapon == 7)
                {
                    // End:0x12e
                    if(bTmProned == true)
                    {
                        HitAnimName = Hit_RPG_Stun_Pr;
                    }
                    // End:0x153
                    else
                    {
                        // End:0x148
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_RPG_Stun_Cr;
                        }
                        // End:0x153
                        else
                        {
                            HitAnimName = Hit_RPG_Stun;
                        }
                    }
                }
                // End:0x195
                else
                {
                    // End:0x170
                    if(bTmProned == true)
                    {
                        HitAnimName = Hit_Stun_Pr;
                    }
                    // End:0x195
                    else
                    {
                        // End:0x18a
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_Stun_Cr;
                        }
                        // End:0x195
                        else
                        {
                            HitAnimName = Hit_Stun;
                        }
                    }
                }
            }
        }
    }
    // End:0x411
    else
    {
        // End:0x21e
        if(bTmProned == true)
        {
            // End:0x1c2
            if(TypeOfWeapon == 4)
            {
                HitAnimName = Hit_PS_Pr;
            }
            // End:0x21b
            else
            {
                // End:0x1f2
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    HitAnimName = Hit_FR_Pr;
                }
                // End:0x21b
                else
                {
                    // End:0x210
                    if(TypeOfWeapon == 7)
                    {
                        HitAnimName = Hit_RPG_Pr;
                    }
                    // End:0x21b
                    else
                    {
                        HitAnimName = Hit_Pr;
                    }
                }
            }
        }
        // End:0x411
        else
        {
            GetAxes(Rotation, X, Y, Z);
            HitLoc.Z = Location.Z;
            // End:0x26c
            if(VSize(Location - HitLoc) < 1.0)
            {
                Dir = VRand();
            }
            // End:0x282
            else
            {
                Dir = -Normal(Location - HitLoc);
            }
            // End:0x2bb
            if(Dir Dot X > 0.70 || Dir == vect(0.0, 0.0, 0.0))
            {
                iDir = 0;
            }
            // End:0x302
            else
            {
                // End:0x2db
                if(Dir Dot X < -0.70)
                {
                    iDir = 1;
                }
                // End:0x302
                else
                {
                    // End:0x2fa
                    if(Dir Dot Y > float(0))
                    {
                        iDir = 3;
                    }
                    // End:0x302
                    else
                    {
                        iDir = 2;
                    }
                }
            }
            // End:0x346
            if(TypeOfWeapon == 4)
            {
                // End:0x332
                if(bTmCrouched == true)
                {
                    HitAnimName = Hit_PS_Cr[iDir];
                }
                // End:0x343
                else
                {
                    HitAnimName = Hit_PS[iDir];
                }
            }
            // End:0x411
            else
            {
                // End:0x39c
                if(TypeOfWeapon == 5 || TypeOfWeapon == 17)
                {
                    // End:0x388
                    if(bTmCrouched == true)
                    {
                        HitAnimName = Hit_FR_Cr[iDir];
                    }
                    // End:0x399
                    else
                    {
                        HitAnimName = Hit_FR[iDir];
                    }
                }
                // End:0x411
                else
                {
                    // End:0x3e0
                    if(TypeOfWeapon == 7)
                    {
                        // End:0x3cc
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_RPG_Cr[iDir];
                        }
                        // End:0x3dd
                        else
                        {
                            HitAnimName = Hit_RPG[iDir];
                        }
                    }
                    // End:0x411
                    else
                    {
                        // End:0x400
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_AR_Cr[iDir];
                        }
                        // End:0x411
                        else
                        {
                            HitAnimName = Hit_AR[iDir];
                        }
                    }
                }
            }
        }
    }
    // End:0x425
    if(bGoreChange)
    {
        PlayAnim(HitAnimName);
    }
    // End:0x44e
    else
    {
        // End:0x443
        if(Role == 4)
        {
            SetAnimAction(HitAnimName);
        }
        // End:0x44e
        else
        {
            ServerSetAnimAction(HitAnimName);
        }
    }
}

simulated function PlayBreathSound()
{
    PlaySound(SoundGroupClass.static.GetBreathSound(), 0, BreathVolume);
}

simulated function PlayEquipHitSound()
{
    PlaySound(SoundGroupClass.static.GetEquipHitSound(), 0, EquipHitVolume);
}

simulated function FootStepping(int side)
{
    local int SurfaceNum;
    local Actor A;
    local Material FloorMat;
    local Vector HL, HN, Start, End;

    SurfaceNum = 0;
    // End:0x1d
    if(bIsCrouched || bIsProned)
    {
        return;
    }
    // End:0x71
    if(Base != none && !Base.IsA('LevelInfo') && Base.SurfaceType != 0)
    {
        SurfaceNum = Base.SurfaceType;
    }
    // End:0x115
    else
    {
        Start = Location - vect(0.0, 0.0, 1.0) * CollisionHeight;
        End = Start - vect(0.0, 0.0, 16.0);
        A = Trace(HL, HN, End, Start, false,, FloorMat);
        // End:0xf4
        if(FloorMat != none)
        {
            SurfaceNum = FloorMat.SurfaceType;
        }
        // End:0x115
        else
        {
            // End:0x115
            if(A != none)
            {
                SurfaceNum = A.SurfaceType;
            }
        }
    }
    // End:0x141
    if(IsLocalPlayerViewtarget())
    {
        PlaySound(SoundFootsteps[SurfaceNum], 0, FootstepVolume,, 80.0,, true,,, false);
    }
    // End:0x161
    else
    {
        PlaySound(SoundFootsteps_3rd[SurfaceNum], 0, FootstepVolume,, 80.0,, true,,, false);
    }
}

simulated function PlayFootStepLeft()
{
    // End:0x37
    if(bIsAiming == false && Level.GetLocalPlayerController().ViewTarget != self)
    {
        PlayFootStep(-1);
    }
}

simulated function PlayFootStepRight()
{
    // End:0x33
    if(bIsAiming == false && Level.GetLocalPlayerController().ViewTarget != self)
    {
        PlayFootStep(1);
    }
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    // End:0x0d
    if(ActualDamage <= 0)
    {
        return;
    }
    // End:0x27
    if(sndScream == none && sndDie == none)
    {
        return;
    }
    // End:0x107
    if(LeftHealth <= 0)
    {
        // End:0xc2
        if(Killer != none)
        {
            // End:0x8a
            if(byte(CollisionPart) == 1)
            {
                PlayerController(Killer).ClientPlaySoundHK(sndDie, 0, 1.0, false, 1000.0, 1.0, true, false, -1, false, Location);
            }
            // End:0xc2
            else
            {
                PlayerController(Killer).ClientPlaySoundHK(sndDie, 0, 1.0, false, 1000.0, 1.0, true, false, -1, false, Location);
            }
        }
        // End:0xe6
        if(byte(CollisionPart) == 1)
        {
            PlaySound(soundgroup'impact_char_headshot', 0, 1.0);
        }
        // End:0x104
        else
        {
            PlaySound(soundgroup'impact_char_nomal', 0, 1.0);
            PlaySound(sndScream, 0, 1.0);
        }
    }
    // End:0x267
    else
    {
        // End:0x267
        if(DamageType != class'fell')
        {
            // End:0x216
            if(Killer != none)
            {
                // End:0x1a6
                if(byte(CollisionPart) == 1)
                {
                    PlayerController(Killer).ClientPlaySoundHK(sndScream, 0, 1.0, false, 2000.0, 1.0, true, false, -1, false, Location);
                    PlayerController(Killer).ClientPlaySoundHK(soundgroup'impact_char_headshot', 0, 0.70, false, 2000.0, 1.0, true, false, -1, false, Location);
                }
                // End:0x216
                else
                {
                    PlayerController(Killer).ClientPlaySoundHK(sndScream, 0, 1.0, false, 2000.0, 1.0, true, false, -1, false, Location);
                    PlayerController(Killer).ClientPlaySoundHK(soundgroup'impact_char_nomal', 0, 0.70, false, 2000.0, 1.0, true, false, -1, false, Location);
                }
            }
            // End:0x249
            if(byte(CollisionPart) == 1)
            {
                PlaySound(soundgroup'impact_char_headshot', 0, 1.0);
                PlaySound(sndScream, 0, 1.0);
            }
            // End:0x267
            else
            {
                PlaySound(soundgroup'impact_char_nomal', 0, 1.0);
                PlaySound(sndScream, 0, 1.0);
            }
        }
    }
}

function float GetShieldStrengthMax()
{
    return ShieldStrengthMax;
}

function float GetShieldStrength()
{
    return ShieldStrength;
}

function int CanUseShield(int ShieldAmount)
{
    ShieldStrength = float(Max(int(ShieldStrength), 0));
    // End:0x65
    if(ShieldStrength < ShieldStrengthMax)
    {
        // End:0x40
        if(ShieldAmount == 50)
        {
            ShieldAmount = int(float(50) - SmallShieldStrength);
        }
        return int(float(Min(int(ShieldStrengthMax), int(ShieldStrength + float(ShieldAmount)))) - ShieldStrength);
    }
    return 0;
}

function bool AddShieldStrength(int ShieldAmount)
{
    local int OldShieldStrength;

    OldShieldStrength = int(ShieldStrength);
    ShieldStrength += float(CanUseShield(ShieldAmount));
    // End:0x51
    if(ShieldAmount == 50)
    {
        SmallShieldStrength = 50.0;
        // End:0x51
        if(ShieldStrength < float(50))
        {
            ShieldStrength = 50.0;
        }
    }
    return ShieldStrength != float(OldShieldStrength);
}

function bool InCurrentCombo()
{
    return CurrentCombo != none;
}

function DoComboName(string ComboClassName);
function DoCombo(class<Combo> ComboClass);
simulated function bool HasUDamage()
{
    return false;
}

function EnableUDamage(float Amount);
function DisableUDamage();
function SetWeaponOverlay(Material mat, float Time, bool override)
{
    // End:0x70
    if(Weapon != none)
    {
        Weapon.SetOverlayMaterial(mat, Time, override);
        // End:0x70
        if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
        {
            WeaponAttachment(Weapon.ThirdPersonActor).SetOverlayMaterial(mat, Time, override);
        }
    }
}

function ChangedWeapon()
{
    super(Pawn).ChangedWeapon();
    // End:0x167
    if(PlayerController(Controller) == Level.GetLocalPlayerController() || Controller.IsA('wAIBot') && Weapon != none && Weapon.BaseParams != none)
    {
        wMyParam.SprintSpeed = Weapon.BaseParams.fSprintSpeed;
        wMyParam.RunSpeed = Weapon.BaseParams.fRunSpeed;
        wMyParam.CrouchSpeed = Weapon.BaseParams.fCrouchSpeed;
        wMyParam.PronedSpeed = Weapon.BaseParams.fPronedSpeed;
        wMyParam.AimRunSpeed = Weapon.BaseParams.fAimRunSpeed;
        wMyParam.AimCrouchSpeed = Weapon.BaseParams.fAimCrouchSpeed;
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    super(Pawn).ServerChangedWeapon(OldWeapon, newWeapon);
    // End:0x13b
    if(Weapon != none && Weapon.BaseParams != none)
    {
        wMyParam.SprintSpeed = Weapon.BaseParams.fSprintSpeed;
        wMyParam.RunSpeed = Weapon.BaseParams.fRunSpeed;
        wMyParam.CrouchSpeed = Weapon.BaseParams.fCrouchSpeed;
        wMyParam.PronedSpeed = Weapon.BaseParams.fPronedSpeed;
        wMyParam.AimRunSpeed = Weapon.BaseParams.fAimRunSpeed;
        wMyParam.AimCrouchSpeed = Weapon.BaseParams.fAimCrouchSpeed;
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
}

function SetInvisibility(float Time);
function Vector BotDodge(Vector Dir)
{
    return vect(0.0, 0.0, 0.0);
}

function bool Dodge(Engine.Actor.EDoubleClickDir DoubleClickMove)
{
    return true;
}

function bool PerformDodge(Engine.Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
    return true;
}

function DoDoubleJump(bool bUpdating);
function bool CanDoubleJump()
{
    return false;
}

function bool CanMultiJump()
{
    return false;
}

function bool DoJump(bool bUpdating)
{
    // End:0x74
    if(!bUpdating && CanDoubleJump() && Abs(Velocity.Z) < float(100) && IsLocallyControlled())
    {
        // End:0x5e
        if(PlayerController(Controller) != none)
        {
            PlayerController(Controller).bDoubleJump = true;
        }
        DoDoubleJump(bUpdating);
        MultiJumpRemaining -= 1;
        return true;
    }
    // End:0xc6
    if(super(Pawn).DoJump(bUpdating))
    {
        JumpZ -= wMyParam.JumpReduceRate;
        // End:0xc4
        if(JumpZ < wMyParam.JumpMinAcc)
        {
            JumpZ = wMyParam.JumpMinAcc;
        }
        return true;
    }
    return false;
}

simulated function NotifyTeamChanged()
{
    PostNetReceive();
}

simulated event PostNetReceive()
{
    // End:0x39
    if(PlayerReplicationInfo != none)
    {
        Setup(class'wUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName));
        bNetNotify = false;
    }
    // End:0x80
    else
    {
        Log(string(self) $ "wPawn::PostNetReceive() -> PlayerReplication Info is None !!!!");
    }
}

simulated function ClientReStart()
{
    super(Pawn).ClientReStart();
    // End:0x1c
    if(Controller != none)
    {
        OldController = Controller;
    }
}

simulated function bool CheckValidFemaleDefault()
{
    return PlacedFemaleCharacterName ~= "Tamika" || PlacedFemaleCharacterName ~= "Sapphire" || PlacedFemaleCharacterName ~= "Enigma" || PlacedFemaleCharacterName ~= "Cathode" || PlacedFemaleCharacterName ~= "Rylisa" || PlacedFemaleCharacterName ~= "Ophelia" || PlacedFemaleCharacterName ~= "Zarina";
}

simulated function bool CheckValidMaleDefault()
{
    return PlacedCharacterName ~= "Jakob" || PlacedCharacterName ~= "Gorge" || PlacedCharacterName ~= "Malcolm" || PlacedCharacterName ~= "Xan" || PlacedCharacterName ~= "Brock" || PlacedCharacterName ~= "Gaargod" || PlacedCharacterName ~= "Axon";
}

simulated function bool ForceDefaultCharacter()
{
    local PlayerController P;

    // End:0x16
    if(!class'DeathMatch'.default.bForceDefaultCharacter)
    {
        return false;
    }
    P = Level.GetLocalPlayerController();
    // End:0xd9
    if(P != none && P.PlayerReplicationInfo != none)
    {
        // End:0xa2
        if(P.PlayerReplicationInfo.bIsFemale)
        {
            PlacedFemaleCharacterName = P.PlayerReplicationInfo.CharacterName;
            // End:0x9f
            if(!CheckValidFemaleDefault())
            {
                PlacedFemaleCharacterName = "Tamika";
                return false;
            }
        }
        // End:0xd9
        else
        {
            PlacedCharacterName = P.PlayerReplicationInfo.CharacterName;
            // End:0xd9
            if(!CheckValidMaleDefault())
            {
                PlacedCharacterName = "Jakob";
                return false;
            }
        }
    }
    return true;
}

simulated function string GetDefaultCharacter()
{
    // End:0x30
    if(Level.IsDemoBuild())
    {
        PlacedFemaleCharacterName = "Tamika";
        PlacedCharacterName = "Jakob";
    }
    // End:0x61
    else
    {
        // End:0x49
        if(!CheckValidFemaleDefault())
        {
            PlacedFemaleCharacterName = "Tamika";
        }
        // End:0x61
        if(!CheckValidMaleDefault())
        {
            PlacedCharacterName = "Jakob";
        }
    }
    // End:0x89
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.bIsFemale)
    {
        return PlacedFemaleCharacterName;
    }
    // End:0x8f
    else
    {
        return PlacedCharacterName;
    }
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
    local int iSideIndex;
    local wPartsGroupParam tmParam;
    local int BodyID, HeadID, FaceID, AcceID;
    local wItemResourceParam resParam;

    RagdollOverride = "Char_07";
    // End:0x76
    if(Level.GRI.bTeamGame)
    {
        iSideIndex = GetTeamNum();
        // End:0x73
        if(255 == iSideIndex)
        {
            // End:0x73
            if(PlayerReplicationInfo.Team != none)
            {
                iSideIndex = PlayerReplicationInfo.Team.TeamIndex;
            }
        }
    }
    // End:0x8a
    else
    {
        iSideIndex = PlayerReplicationInfo.SideID;
    }
    // End:0xac
    if(iSideIndex == 0)
    {
        BodyID = PlayerReplicationInfo.iBodyItemID_0;
    }
    // End:0xc0
    else
    {
        BodyID = PlayerReplicationInfo.iBodyItemID_1;
    }
    // End:0x116
    if(BodyID != 15000)
    {
        tmParam = Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID);
        FaceID = -1;
        HeadID = -1;
        AcceID = -1;
    }
    // End:0x152
    else
    {
        FaceID = PlayerReplicationInfo.iHeadItemID;
        HeadID = PlayerReplicationInfo.iHelmetItemID;
        AcceID = PlayerReplicationInfo.iAccessoryItemID;
    }
    ResetAllParts();
    // End:0x1b6
    if(!class'wPlayerInfo'.static.SetupPawn(self, BodyID, FaceID, HeadID, AcceID, iSideIndex))
    {
        Log("[Error] class'wPlayerInfo'.static.Setup", 'Error');
    }
    resParam = Level.GameMgr.GetItemResourceParam(BodyID);
    // End:0x20f
    if(iSideIndex == 0)
    {
        strGoreMeshName = resParam.strRes_3rd_AF_Gore;
        strGoreStaticMeshName = resParam.strRes_3rd_AF_Gore_Static;
    }
    // End:0x237
    else
    {
        strGoreMeshName = resParam.strRes_3rd_RSA_Gore;
        strGoreStaticMeshName = resParam.strRes_3rd_RSA_Gore_Static;
    }
    ResetPhysicsBasedAnim();
    // End:0x280
    if(Level.GRI.bTeamGame)
    {
        // End:0x280
        if(iSideIndex == Level.GetMatchMaker().My_iTeam)
        {
            AddIdentificationFriend();
        }
    }
}

simulated function ResetPhysicsBasedAnim()
{
    bIsIdle = false;
    bWaitForAnim = false;
}

function Sound GetSound(wPawnSoundGroup.ESoundType soundType)
{
    return SoundGroupClass.static.GetSound(soundType);
}

function class<Gib> GetGibClass(XEffects.xPawnGibGroup.EGibType gibType)
{
    return GibGroupClass.static.GetGibClass(gibType);
}

simulated function DoDerezEffect();
function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x38
    if(PlayerReplicationInfo != none)
    {
        CalcItemUsedTime(Level.GetMatchMaker().GetUserInfoByUserName(PlayerReplicationInfo.PlayerName));
    }
    // End:0x72
    if(Killer != none && Killer.IsA('wBotVehicleController'))
    {
        Killer = wBotVehicleController(Killer).Caller;
    }
    // End:0xab
    if(Controller != none && Controller.SkillBase != none)
    {
        Controller.SkillBase.DeadPlayer();
    }
    super(Pawn).Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);
}

simulated function ResetAllParts()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < 3)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function SetParts(Engine.Actor.ePlayerParts iPartsIndex, Mesh resMesh, StaticMesh resStaticMesh)
{
    local Vector tmLoc;

    // End:0x12
    if(iPartsIndex > 2)
    {
        return;
    }
    // End:0x2c
    if(resMesh == none && resStaticMesh == none)
    {
        return;
    }
    // End:0x75
    if(wParts[iPartsIndex] != none)
    {
        DetachFromBone(wParts[iPartsIndex]);
        wParts[iPartsIndex].Destroy();
        wParts[iPartsIndex] = none;
    }
    // End:0x17b
    if(iPartsIndex != 2)
    {
        wParts[iPartsIndex] = Spawn(class'wSkinShell', self,,);
        wParts[iPartsIndex].SetDrawType(2);
        wParts[iPartsIndex].LinkMesh(resMesh);
        wParts[iPartsIndex].SetBase(self);
        wParts[iPartsIndex].SetOwner(self);
        tmLoc = wParts[iPartsIndex].Location;
        tmLoc.X += float(20);
        wParts[iPartsIndex].SetLocation(tmLoc);
        // End:0x178
        if(AttachToBone(wParts[iPartsIndex], MainRootBone) == false)
        {
            AttachToBone(wParts[iPartsIndex], 'XXXX_Dummy');
        }
    }
    // End:0x224
    else
    {
        wParts[iPartsIndex] = Spawn(class'wSkinShell', self,,);
        wParts[iPartsIndex].SetDrawType(8);
        wParts[iPartsIndex].SetStaticMesh(resStaticMesh);
        wParts[iPartsIndex].SetBase(self);
        wParts[iPartsIndex].SetOwner(self);
        wParts[iPartsIndex].bAnimByOwner = false;
        AttachToBone(wParts[iPartsIndex], 'Acce');
    }
}

event EndProne(float HeightAdjust)
{
    // End:0x27
    if(PlayerReplicationInfo == none || PlayerReplicationInfo.IsDead)
    {
        bEndProned = true;
    }
    super(Pawn).EndProne(HeightAdjust);
}

event EndCrouch(float HeightAdjust)
{
    // End:0x27
    if(PlayerReplicationInfo == none || PlayerReplicationInfo.IsDead)
    {
        bEndCrouched = true;
    }
    super(Pawn).EndCrouch(HeightAdjust);
}

simulated function MakeGorePawn(int iPart)
{
    local int i, j;
    local Mesh NewMesh;
    local XEffects.xPawnGibGroup.EGibType eTemp, eTempAdd;
    local int iTeamNum;
    local name Anim;
    local float frame, Rate;

    // End:0x10
    if(iPart == 0)
    {
        return;
    }
    // End:0x35
    if(self == Level.GetLocalPlayerController().Pawn)
    {
        i = 0;
    }
    i = 0;
    J0x3c:
    // End:0x93 [While If]
    if(i < 5)
    {
        // End:0x89
        if(wGoreParts[i] != none)
        {
            DetachFromBone(wGoreParts[i]);
            wGoreParts[i].Destroy();
            wGoreParts[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    eTemp = GetGibParts(iPart);
    eTempAdd = 7;
    // End:0x128
    if(eTemp == 6)
    {
        switch(byte(iPart))
        {
            // End:0xdd
            case 12:
                eTemp = 0;
                eTempAdd = 2;
                // End:0x128
                break;
            // End:0xf5
            case 13:
                eTemp = 1;
                eTempAdd = 3;
                // End:0x128
                break;
            // End:0x10d
            case 14:
                eTemp = 0;
                eTempAdd = 1;
                // End:0x128
                break;
            // End:0x125
            case 15:
                eTemp = 2;
                eTempAdd = 3;
                // End:0x128
                break;
            // End:0xffff
            default:
            }
            iTeamNum = GetTeamNum();
            // End:0x14b
            if(iTeamNum == 255)
            {
                iTeamNum = iBackupTeamNum;
            }
            GetAnimParams(0, Anim, frame, Rate);
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "Body", class'Mesh'));
            // End:0x1c3
            if(NewMesh == none)
            {
                Log("Failed to load player mesh :: Char_B_Gore.Body");
                return;
            }
            LinkMesh(NewMesh);
            PlayDirectionalHit(Location, false, true);
            i = 0;
            // End:0x22e
            if(eTemp == 0 || eTempAdd == 0)
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreLArm", class'Mesh'));
            }
            // End:0x251
            else
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "LArm", class'Mesh'));
            }
            wGoreParts[i] = Spawn(class'wSkinShell', self,,);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x2f1
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }
            ++ i;
            // End:0x344
            if(eTemp == 1 || eTempAdd == 1)
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreRArm", class'Mesh'));
            }
            // End:0x367
            else
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "RArm", class'Mesh'));
            }
            wGoreParts[i] = Spawn(class'wSkinShell', self,,);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x407
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }
            ++ i;
            // End:0x45a
            if(eTemp == 2 || eTempAdd == 2)
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreLLeg", class'Mesh'));
            }
            // End:0x47d
            else
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "LLeg", class'Mesh'));
            }
            wGoreParts[i] = Spawn(class'wSkinShell', self,,);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x51d
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }
            ++ i;
            // End:0x570
            if(eTemp == 3 || eTempAdd == 3)
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreRLeg", class'Mesh'));
            }
            // End:0x593
            else
            {
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "RLeg", class'Mesh'));
            }
            wGoreParts[i] = Spawn(class'wSkinShell', self,,);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x633
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }
            ++ i;
            // End:0x7f5
            if(eTemp == 4)
            {
                j = 0;
                // End:0x695
                if(wParts[j] != none)
                {
                    DetachFromBone(wParts[j]);
                    wParts[j].Destroy();
                    wParts[j] = none;
                }
                j = 1;
                // End:0x6e0
                if(wParts[j] != none)
                {
                    DetachFromBone(wParts[j]);
                    wParts[j].Destroy();
                    wParts[j] = none;
                }
                j = 2;
                // End:0x72b
                if(wParts[j] != none)
                {
                    DetachFromBone(wParts[j]);
                    wParts[j].Destroy();
                    wParts[j] = none;
                }
                NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreHead", class'Mesh'));
                wGoreParts[i] = Spawn(class'wSkinShell', self,,);
                wGoreParts[i].SetDrawType(2);
                wGoreParts[i].LinkMesh(NewMesh);
                wGoreParts[i].SetBase(self);
                wGoreParts[i].SetOwner(self);
                // End:0x7f2
                if(AttachToBone(wGoreParts[i], MainRootBone) == false)
                {
                    AttachToBone(wGoreParts[i], 'XXXX_Dummy');
                }
            }
            // End:0x8d3
            else
            {
                j = 0;
                // End:0x8d3
                if(wParts[j] == none)
                {
                    NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "Head", class'Mesh'));
                    wGoreParts[i] = Spawn(class'wSkinShell', self,,);
                    wGoreParts[i].SetDrawType(2);
                    wGoreParts[i].LinkMesh(NewMesh);
                    wGoreParts[i].SetBase(self);
                    wGoreParts[i].SetOwner(self);
                    // End:0x8d3
                    if(AttachToBone(wGoreParts[i], MainRootBone) == false)
                    {
                        AttachToBone(wGoreParts[i], 'XXXX_Dummy');
                    }
                }
            }
}

simulated function SpawnGoreGiblet(int iIndex)
{
    local Coords boneCoords;
    local float GibPerterbation;
    local XEffects.xPawnGibGroup.EGibType eTemp;
    local Vector direction, Dummy, GibVelocity;

    boneCoords = GetBoneCoords(HitFx[iIndex].Bone);
    GibPerterbation = HitFx[iIndex].damtype.default.GibPerterbation;
    eTemp = GetGibParts(HitFx[iIndex].iCollisionPart);
    GetAxes(Rotation, Dummy, Dummy, direction);
    // End:0x93
    if(eTemp == 4)
    {
        GibVelocity = Normal(direction) * float(200);
    }
    // End:0xb7
    else
    {
        GibVelocity = Velocity + Normal(direction) * float(100) + float(90) * FRand();
    }
    // End:0x34f
    if(eTemp == 6)
    {
        // End:0x169
        if(HitFx[iIndex].iCollisionPart == 12)
        {
            boneCoords = GetBoneCoords('Bip01 L UpperArm');
            SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
            boneCoords = GetBoneCoords('Bip01 L Thigh');
            SpawnGiblet(GetGibClass(2), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
        }
        // End:0x34c
        else
        {
            // End:0x20b
            if(HitFx[iIndex].iCollisionPart == 13)
            {
                boneCoords = GetBoneCoords('Bip01 R UpperArm');
                SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                boneCoords = GetBoneCoords('Bip01 R Thigh');
                SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
            }
            // End:0x34c
            else
            {
                // End:0x2ad
                if(HitFx[iIndex].iCollisionPart == 14)
                {
                    boneCoords = GetBoneCoords('Bip01 L UpperArm');
                    SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                    boneCoords = GetBoneCoords('Bip01 R UpperArm');
                    SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                }
                // End:0x34c
                else
                {
                    // End:0x34c
                    if(HitFx[iIndex].iCollisionPart == 15)
                    {
                        boneCoords = GetBoneCoords('Bip01 L Thigh');
                        SpawnGiblet(GetGibClass(2), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                        boneCoords = GetBoneCoords('Bip01 R Thigh');
                        SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                    }
                }
            }
        }
    }
    // End:0x394
    else
    {
        // End:0x394
        if(eTemp != 7)
        {
            SpawnGiblet(GetGibClass(eTemp), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
        }
    }
}

simulated function XEffects.xPawnGibGroup.EGibType GetGibParts(int iCollisionPart)
{
    switch(byte(iCollisionPart))
    {
        // End:0x14
        case 1:
            return 4;
            // End:0x87
            break;
        // End:0x19
        case 4:
        // End:0x24
        case 6:
            return 0;
            // End:0x87
            break;
        // End:0x29
        case 5:
        // End:0x34
        case 7:
            return 1;
            // End:0x87
            break;
        // End:0x39
        case 8:
        // End:0x44
        case 10:
            return 2;
            // End:0x87
            break;
        // End:0x49
        case 9:
        // End:0x54
        case 11:
            return 3;
            // End:0x87
            break;
        // End:0x59
        case 2:
        // End:0x64
        case 3:
            return 5;
            // End:0x87
            break;
        // End:0x69
        case 12:
        // End:0x6e
        case 13:
        // End:0x73
        case 14:
        // End:0x7e
        case 15:
            return 6;
            // End:0x87
            break;
        // End:0xffff
        default:
            return 7;
    }
    // This is an implied JumpToken;
    goto J0x87;
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    local int i;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;

    Log("[wPawn::AddDefaultSkills] bQuickslotChange=" $ string(bQuickslotChange));
    kMM = Level.GetMatchMaker();
    // End:0x178
    if(kMM.UserInfos.Length > 0)
    {
        i = 0;
        J0x6a:
        // End:0xda [While If]
        if(i < kMM.UserInfos.Length)
        {
            // End:0xd0
            if(kMM.UserInfos[i].UserName == PlayerReplicationInfo.PlayerName)
            {
                kUser = kMM.UserInfos[i];
            }
            // End:0xda
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x6a;
            }
        }
        // End:0x175
        if(kUser != none)
        {
            AddSkillByInventory(kUser);
            SetSelectedQuickSlotSkills(kUser);
            // End:0x14e
            if(kMM.kGame_GameMode == 12)
            {
                wPlayer(Controller).AddSkill(40023);
                Log("[AddDefaultSkills] AddSkill 40023");
            }
            PlayerController(Controller).iBupQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
        }
    }
    // End:0x1be
    else
    {
        // End:0x1be
        if(Controller.IsA('wPlayer'))
        {
            wPlayer(Controller).AddSkill(40001);
            wPlayer(Controller).AddSkill(40005);
        }
    }
    // End:0x1ec
    if(Controller.IsA('wPlayer'))
    {
        wPlayer(Controller).SkillInit_Server(bQuickslotChange);
    }
    PlayerController(Controller).ClientCheckSkill();
}

function AddSkillByInventory(wMatchUserInfo kUser)
{
    local int i, j;
    local wItemBaseParam ItemParam;

    // End:0x1a
    if(BTNetEnums == none)
    {
        BTNetEnums = new class'BTNetEnums';
    }
    j = 12;
    i = 0;
    J0x29:
    // End:0x12a [While If]
    if(i < kUser.EquippedItems.Length)
    {
        // End:0x120
        if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.13)
        {
            ItemParam = Level.GameMgr.GetItemParam(kUser.EquippedItems[i].ItemID);
            // End:0x120
            if(ItemParam.strAddOption[0] == "skill" && int(ItemParam.strOptionValue[0]) > 0)
            {
                wPlayer(Controller).AddSkill(int(ItemParam.strOptionValue[0]));
                AddedSkillList[++ j] = int(ItemParam.strOptionValue[0]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29;
    }
}

function AddWeaponFromSkill(BtrDouble iUniqueID, int iaWeaponID)
{
    local sStartWeaponInfo sInfo;

    super(Pawn).AddWeaponFromSkill(iUniqueID, iaWeaponID);
    sInfo.iWeaponID = iaWeaponID;
    sInfo.iPartsID = -1;
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
}

function SetSelectedQuickSlotSkills(wMatchUserInfo kUser)
{
    local array<int> remList;
    local EquippedQSlotInfo curQSlot;
    local int i, j;
    local bool bFind;
    local wSkillBase SkillBase;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    // End:0x2f
    if(BTNetEnums == none)
    {
        BTNetEnums = new class'BTNetEnums';
    }
    i = 0;
    J0x36:
    // End:0x59 [While If]
    if(i < 12)
    {
        AddedSkillList[i] = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    // End:0x143
    if(PlayerController(Controller).iSelectedQSlotIndex > 0)
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1];
        i = 0;
        J0xa4:
        // End:0x140 [While If]
        if(i < 4)
        {
            // End:0x136
            if(curQSlot.SkillID[i] > 0)
            {
                // End:0x11a
                if(kMM.1 == kMM.eWeaponLimit && GetSlotPosbySkillID(kUser, curQSlot.SkillID[i]) == BTNetEnums.14)
                {
                }
                // End:0x136
                else
                {
                    AddedSkillList[i] = curQSlot.SkillID[i];
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xa4;
        }
    }
    // End:0x18b
    else
    {
        i = 0;
        J0x14a:
        // End:0x18b [While If]
        if(i < 4)
        {
            AddedSkillList[i] = GetInvenSkillIDbyPos(kUser, BTNetEnums.14 + i);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x14a;
        }
    }
    j = 4;
    i = 0;
    J0x19a:
    // End:0x458 [While If]
    if(i < arStartWeaponInfo.Length)
    {
        iSightPartID = arStartWeaponInfo[i].iPartsID & 1023;
        iBarrelPartID = arStartWeaponInfo[i].iPartsID & 130048;
        iSilencerPartID = arStartWeaponInfo[i].iPartsID & 16646144;
        iGunstockPartID = arStartWeaponInfo[i].iPartsID & 2130706432;
        wcpp = none;
        // End:0x2a7
        if(iSightPartID > 1)
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
            // End:0x2a7
            if(wcpp.iItemID > 0 && wcpp.iSkillID > 0 && j < 12)
            {
                AddedSkillList[++ j] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x334
        if(iBarrelPartID > 1 << 10)
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
            // End:0x334
            if(wcpp.iItemID > 0 && wcpp.iSkillID > 0 && j < 12)
            {
                AddedSkillList[++ j] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x3c1
        if(iSilencerPartID > 1 << 17)
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
            // End:0x3c1
            if(wcpp.iItemID > 0 && wcpp.iSkillID > 0 && j < 12)
            {
                AddedSkillList[++ j] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x44e
        if(iGunstockPartID > 1 << 24)
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
            // End:0x44e
            if(wcpp.iItemID > 0 && wcpp.iSkillID > 0 && j < 12)
            {
                AddedSkillList[++ j] = wcpp.iSkillID;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19a;
    }
    SkillBase = wPlayer(Controller).SkillBase;
    i = 0;
    J0x478:
    // End:0x52e [While If]
    if(i < SkillBase.Skills.Length)
    {
        bFind = false;
        j = 0;
        J0x4a0:
        // End:0x4ee [While If]
        if(j < 22)
        {
            // End:0x4e4
            if(SkillBase.Skills[i].SkillID == AddedSkillList[j])
            {
                bFind = true;
            }
            // End:0x4ee
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x4a0;
            }
        }
        // End:0x524
        if(bFind == false)
        {
            remList[remList.Length] = SkillBase.Skills[i].SkillID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x478;
    }
    i = 0;
    J0x535:
    // End:0x56e [While If]
    if(i < remList.Length)
    {
        wPlayer(Controller).RemoveSkill(remList[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x535;
    }
    i = 0;
    J0x575:
    // End:0x5aa [While If]
    if(i < 12)
    {
        wPlayer(Controller).AddSkill(AddedSkillList[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x575;
    }
    wPlayer(Controller).myHUD.CallEvent(, 777);
}

function AddBaseInvenSkill(wMatchUserInfo kUser, int iPos)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7d [While If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0x73
        if(kUser.EquippedSkills[i].SlotPosition == iPos)
        {
            wPlayer(Controller).AddSkill(kUser.EquippedSkills[i].SkillID);
        }
        // End:0x7d
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function int GetInvenSkillIDbyPos(wMatchUserInfo kUser, int iPos)
{
    local int i, iResult;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    i = 0;
    J0x1c:
    // End:0xe0 [While If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0xd6
        if(kUser.EquippedSkills[i].SlotPosition == iPos)
        {
            // End:0xb1
            if(kMM.1 == kMM.eWeaponLimit && kUser.EquippedSkills[i].SlotPosition == BTNetEnums.14)
            {
                iResult = 0;
            }
            // End:0xd0
            else
            {
                iResult = kUser.EquippedSkills[i].SkillID;
            }
            return iResult;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    return 0;
}

function int GetSlotPosbySkillID(wMatchUserInfo kUser, int iSkillID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0x5d
        if(kUser.EquippedSkills[i].SkillID == iSkillID)
        {
            return kUser.EquippedSkills[i].SlotPosition;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function ChangeInventoryByQSlot()
{
    local Inventory tmInv, tmDel, tmStart;

    tmInv = Inventory;
    J0x0b:
    // End:0xa1 [While If]
    if(tmInv != none)
    {
        // End:0x73
        if(tmInv.InventoryGroup == 5 || tmInv.InventoryGroup == 6)
        {
            // End:0x5c
            if(tmStart == none)
            {
                tmStart = tmInv;
            }
            tmInv = tmInv.Inventory;
        }
        // End:0x9e
        else
        {
            tmDel = tmInv;
            tmInv = tmInv.Inventory;
            tmDel.Destroy();
        }
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    Inventory = tmStart;
    // End:0xe2
    if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
    {
        AddDefaultInventoryDOA(true);
    }
    // End:0xe9
    else
    {
        AddDefaultInventory(true);
    }
    AddDefaultSkills(true);
}

function RemoveAllInventory()
{
    // End:0x1a [While If]
    if(Inventory != none)
    {
        J0x00:
        Inventory.Destroy();
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    local int i, PlayerID, PartsID;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local sStartWeaponInfo sInfo;

    kMM = Level.GetMatchMaker();
    // End:0x2f
    if(BTNetEnums == none)
    {
        BTNetEnums = new class'BTNetEnums';
    }
    // End:0x8c7
    if(kMM.UserInfos.Length > 0)
    {
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        Log("[wPawn::AddDefaultInventory] name=" $ PlayerReplicationInfo.PlayerName);
        CalcItemUsedTime(kUser);
        RemoveAllInventory();
        // End:0x729
        if(kUser.EquippedItems.Length > 0)
        {
            arStartWeaponInfo.Length = 0;
            // End:0x10e
            if(Controller.IsA('PlayerController') && PlayerController(Controller).iSelectedQSlotIndex != 0)
            {
                SetSelectedQuickSlotInventory(kUser, bQuickslotChange);
            }
            // End:0x701
            else
            {
                DoSortEquipedItems(kUser);
                i = 0;
                J0x120:
                // End:0x673 [While If]
                if(i < kUser.EquippedItems.Length)
                {
                    // End:0x2ef
                    if(kMM.4 == kMM.eWeaponLimit)
                    {
                        // End:0x1ef
                        if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.0)
                        {
                            AddWeapon(EmptyBtrDouble(), 5012, 0, false);
                            sInfo.iWeaponID = 5012;
                            sInfo.iPartsID = 0;
                            sInfo.iUniqueID = EmptyBtrDouble();
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            kUser.SetItemUse(i);
                        }
                        // End:0x2ec
                        else
                        {
                            AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
                            sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
                            sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
                            sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            kUser.SetItemUse(i);
                        }
                    }
                    // End:0x669
                    else
                    {
                        // End:0x3ef
                        if(kMM.1 == kMM.eWeaponLimit)
                        {
                            // End:0x3ec
                            if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.0)
                            {
                                Log(string(self) $ "[::AddDefaultInventory] AddWeapon Knife 9001 =" $ PlayerReplicationInfo.PlayerName);
                                AddWeapon(EmptyBtrDouble(), 9001, 0, false);
                                sInfo.iWeaponID = 9001;
                                sInfo.iPartsID = 0;
                                sInfo.iUniqueID = EmptyBtrDouble();
                                arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                                kUser.SetItemUse(i);
                            }
                            // End:0x3ec
                            else
                            {
                            }
                        }
                        // End:0x669
                        else
                        {
                            // End:0x56c
                            if(kMM.5 == kMM.eWeaponLimit)
                            {
                                // End:0x46c
                                if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.2 || kUser.EquippedItems[i].SlotPosition == BTNetEnums.3)
                                {
                                }
                                // End:0x569
                                else
                                {
                                    AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
                                    sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
                                    sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
                                    sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
                                    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                                    kUser.SetItemUse(i);
                                }
                            }
                            // End:0x669
                            else
                            {
                                AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
                                sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
                                sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
                                sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
                                arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                                kUser.SetItemUse(i);
                            }
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x120;
                }
                // End:0x68a
                if(bQuickslotChange == false)
                {
                    CheckWeaponBySubGameMode(kUser);
                }
                // End:0x701
                if(bQuickslotChange == false)
                {
                    PlayerID = Level.GetMatchMaker().GetUIDByUserName(PlayerController(Controller).PlayerReplicationInfo.PlayerName);
                    Level.Game.SendReqChangeWeaponSet(PlayerID, PlayerController(Controller).iSelectedQSlotIndex);
                }
            }
            // End:0x726
            if(bQuickslotChange == false)
            {
                iStartQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
            }
        }
        // End:0x802
        else
        {
            // End:0x7c4
            if(IsA('wHelicopter') || IsA('wAIPawn'))
            {
                i = 0;
                J0x748:
                // End:0x7c1 [While If]
                if(i < wRequiredEquipment.Length)
                {
                    // End:0x76f
                    if(wRequiredEquipment[i] == 0)
                    {
                        // This is an implied JumpToken;
                        goto J0x7c1;
                    }
                    // End:0x7b7
                    else
                    {
                        // End:0x793
                        if(i < wRequiredParts.Length)
                        {
                            PartsID = wRequiredParts[i];
                        }
                        // End:0x79a
                        else
                        {
                            PartsID = 0;
                        }
                        AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], PartsID, false);
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x748;
                }
                J0x7c1:
            }
            // End:0x802
            else
            {
                AddWeapon(EmptyBtrDouble(), 2000, 1001, false);
                AddWeapon(EmptyBtrDouble(), 1010, 31, false);
                AddWeapon(EmptyBtrDouble(), 6000, 0, false);
            }
        }
        // End:0x837
        if(kMM.1 != kMM.eWeaponLimit)
        {
            AddWeapon(EmptyBtrDouble(), 9000, 0, false);
        }
        AddWeapon(EmptyBtrDouble(), 9002, 0, false);
        // End:0x8c4
        if(Level.GRI.GameClass == "WMission.wSDGameInfo" || Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            AddWeapon(EmptyBtrDouble(), 7002, 0, false);
        }
    }
    // End:0x960
    else
    {
        Log("##LEEKSLOG [wPawn::AddDefaultInventory] - kMM.UserInfos.Length <= 0 ");
        i = 0;
        J0x916:
        // End:0x960 [While If]
        if(i < wRequiredEquipment.Length)
        {
            // End:0x93d
            if(wRequiredEquipment[i] == 0)
            {
                // This is an implied JumpToken;
                goto J0x960;
            }
            // End:0x956
            else
            {
                AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], 0, false);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x916;
        }
    }
    PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    super.AddDefaultInventory();
    // End:0x9ba
    if(Level.GetMatchMaker().BotTutorial)
    {
        SetInfiniteAmmoTutorial(true);
    }
}

function SetPistolInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    // End:0x13a
    if(IsQuick == false)
    {
        // End:0x3a
        if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.0)
        {
        }
        // End:0x137
        else
        {
            AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
            sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
            sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
            sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.SetItemUse(i);
        }
    }
    // End:0x27f
    else
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1];
        // End:0x27f
        if(i != 0)
        {
            AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
            sInfo.iWeaponID = curQSlot.ItemID[i];
            sInfo.iPartsID = curQSlot.PartsID[i];
            sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemOnUse[i] = 1;
            ++ kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemUsedCount[i];
        }
    }
}

function SetShotGunlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    // End:0x15e
    if(IsQuick == false)
    {
        WBP = Level.WeaponMgr.GetBaseParam(kUser.EquippedItems[i].ItemID);
        // End:0x5e
        if(WBP.eType == 4)
        {
            return;
        }
        AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
        sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
        sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
        sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.SetItemUse(i);
    }
    // End:0x2e1
    else
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1];
        WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
        // End:0x1d2
        if(WBP.eType == 4)
        {
            return;
        }
        AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
        sInfo.iWeaponID = curQSlot.ItemID[i];
        sInfo.iPartsID = curQSlot.PartsID[i];
        sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemOnUse[i] = 1;
        ++ kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemUsedCount[i];
    }
}

function SetMGlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    // End:0x10c
    if(IsQuick == false)
    {
        AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
        sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
        sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
        sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.SetItemUse(i);
    }
    // End:0x246
    else
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1];
        AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
        sInfo.iWeaponID = curQSlot.ItemID[i];
        sInfo.iPartsID = curQSlot.PartsID[i];
        sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemOnUse[i] = 1;
        ++ kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemUsedCount[i];
    }
}

function SetFlameThrowerlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    // End:0x74
    if(i == 0)
    {
        AddWeapon(EmptyBtrDouble(), 5016, 0, false);
        sInfo.iWeaponID = 5016;
        sInfo.iPartsID = 0;
        sInfo.iUniqueID = EmptyBtrDouble();
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.SetItemUse(i);
    }
    // End:0x376
    else
    {
        // End:0x1f3
        if(IsQuick == false)
        {
            // End:0xa1
            if(kUser.EquippedItems[i].SlotPosition == 0)
            {
                return;
            }
            WBP = Level.WeaponMgr.GetBaseParam(kUser.EquippedItems[i].ItemID);
            // End:0xf3
            if(WBP.eType == 4)
            {
                return;
            }
            AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
            sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
            sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
            sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.SetItemUse(i);
        }
        // End:0x376
        else
        {
            curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1];
            WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
            // End:0x267
            if(WBP.eType == 4)
            {
                return;
            }
            AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
            sInfo.iWeaponID = curQSlot.ItemID[i];
            sInfo.iPartsID = curQSlot.PartsID[i];
            sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemOnUse[i] = 1;
            ++ kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex - 1].ItemUsedCount[i];
        }
    }
}

function SetGrenadlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID, k;

    // End:0x79
    if(i == 0)
    {
        AddWeapon(EmptyBtrDouble(), 6000, 0, false);
        sInfo.iWeaponID = 6000;
        sInfo.iPartsID = 0;
        sInfo.iUniqueID = EmptyBtrDouble();
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.SetItemUse(i);
        SetInfiniteAmmo(9);
    }
}

function AddDefaultInventoryDOA(optional bool bQuickslotChange)
{
    local int i, PlayerID;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local sStartWeaponInfo sInfo;

    kMM = Level.GetMatchMaker();
    // End:0x2f
    if(BTNetEnums == none)
    {
        BTNetEnums = new class'BTNetEnums';
    }
    // End:0xcf
    if(kMM.UserInfos.Length > 0)
    {
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        RemoveAllInventory();
        Log("[wPawn::AddDefaultInventoryDOA] name=" $ PlayerReplicationInfo.PlayerName);
        AddWeapon(EmptyBtrDouble(), 9002, 0, false);
        AddWeapon(EmptyBtrDouble(), 9000, 0, false);
    }
    // End:0x120
    else
    {
        i = 0;
        J0xd6:
        // End:0x120 [While If]
        if(i < wRequiredEquipment.Length)
        {
            // End:0xfd
            if(wRequiredEquipment[i] == 0)
            {
                // This is an implied JumpToken;
                goto J0x120;
            }
            // End:0x116
            else
            {
                AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], 0, false);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xd6;
        }
    }
    PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    AddDefaultInventory();
}

function bool CheckWeaponBySubGameMode(wMatchUserInfo kUser)
{
    local PlayerController PC;
    local wWeaponBaseParams WBP;
    local wMyPlayerStatus MyStatus;
    local int iItemID, i;
    local wMatchMaker kMM;

    PC = PlayerController(Controller);
    MyStatus = PC.Level.CharMgr.MyPlayer;
    kMM = PC.Level.GetMatchMaker();
    i = 0;
    J0x5b:
    // End:0x1df [While If]
    if(i < kUser.EquippedItems.Length)
    {
        // End:0x1d5
        if(kUser.EquippedItems[i].SlotPosition == BTNetEnums.0)
        {
            iItemID = kUser.EquippedItems[i].ItemID;
            WBP = Level.WeaponMgr.GetBaseParam(iItemID);
            // End:0x11e
            if(kMM.eWeaponLimit == kMM.5)
            {
                // End:0x11e
                if(WBP.eType == 2)
                {
                    return true;
                }
            }
            // End:0x15b
            if(kMM.eWeaponLimit == kMM.8)
            {
                // End:0x15b
                if(WBP.eType == 6)
                {
                    return true;
                }
            }
            // End:0x198
            if(kMM.eWeaponLimit == kMM.9)
            {
                // End:0x198
                if(WBP.eType == 9)
                {
                    return true;
                }
            }
            // End:0x1d5
            if(kMM.eWeaponLimit == kMM.6)
            {
                // End:0x1d5
                if(WBP.eType != 2)
                {
                    return true;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    i = 0;
    J0x1e6:
    // End:0x3d2 [While If]
    if(i < kUser.EquippedQSlots.Length)
    {
        // End:0x3c8
        if(kUser.EquippedQSlots[i].ItemID[0] != 0)
        {
            iItemID = kUser.EquippedQSlots[i].ItemID[0];
            WBP = Level.WeaponMgr.GetBaseParam(iItemID);
            // End:0x2bd
            if(kMM.eWeaponLimit == kMM.5)
            {
                // End:0x2bd
                if(WBP.eType == 2)
                {
                    PlayerController(Controller).SelectQuickSlot(i + 1);
                    return true;
                }
            }
            // End:0x316
            if(kMM.eWeaponLimit == kMM.6)
            {
                // End:0x316
                if(WBP.eType != 2)
                {
                    PlayerController(Controller).SelectQuickSlot(i + 1);
                    return true;
                }
            }
            // End:0x36f
            if(kMM.eWeaponLimit == kMM.8)
            {
                // End:0x36f
                if(WBP.eType == 6)
                {
                    PlayerController(Controller).SelectQuickSlot(i + 1);
                    return true;
                }
            }
            // End:0x3c8
            if(kMM.eWeaponLimit == kMM.9)
            {
                // End:0x3c8
                if(WBP.eType == 9)
                {
                    PlayerController(Controller).SelectQuickSlot(i + 1);
                    return true;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e6;
    }
    return true;
}

function DoSortEquipedItems(wMatchUserInfo kUserInfo)
{
    local EquippedItemInfo temp;
    local int nLength, i, j;
    local wWeaponManager WM;
    local wWeaponBaseParams kLWB, kRWB;

    WM = Level.WeaponMgr;
    nLength = kUserInfo.EquippedItems.Length;
    i = 0;
    J0x30:
    // End:0x14d [While If]
    if(i < nLength - 1)
    {
        kLWB = WM.GetBaseParam(kUserInfo.EquippedItems[i].ItemID);
        j = i + 1;
        J0x7e:
        // End:0x143 [While If]
        if(j < nLength)
        {
            kRWB = WM.GetBaseParam(kUserInfo.EquippedItems[j].ItemID);
            // End:0x139
            if(kLWB.iPriority > kRWB.iPriority)
            {
                temp = kUserInfo.EquippedItems[i];
                kUserInfo.EquippedItems[i] = kUserInfo.EquippedItems[j];
                kUserInfo.EquippedItems[j] = temp;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x7e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
}

function SetInfiniteAmmo(optional int ammoCount)
{
    local Inventory Inv;
    local wWeapon W;
    local wGun G;

    // End:0x16
    if(ammoCount == 0)
    {
        ammoCount = 99999;
    }
    Inv = Inventory;
    J0x21:
    // End:0x1cd [While If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0x1b6
        if(W != none)
        {
            W.Ammo[0].MaxAmmo = ammoCount;
            W.Ammo[0].AmmoAmount = ammoCount;
            W.Ammo[0].InitialAmount = ammoCount;
            W.Ammo[1].MaxAmmo = ammoCount;
            W.Ammo[1].AmmoAmount = ammoCount;
            W.Ammo[1].InitialAmount = ammoCount;
            W.AmmoCharge[0] = ammoCount;
            W.AmmoCharge[1] = ammoCount;
            G = wGun(W);
            // End:0x1b6
            if(G != none)
            {
                // End:0x1b6
                if(!Level.GetMatchMaker().BotTutorial)
                {
                    G.AmmoCharge_CurLoaded = ammoCount;
                    G.AmmoCharge_MaxLoaded = ammoCount;
                    G.AmmoCharge_Reload = ammoCount;
                    G.AmmoCharge_CurAmmo = ammoCount;
                }
            }
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
}

function SetInfiniteAmmoTutorial(optional bool bDeleteGranade, optional int iGranadeCount)
{
    local Inventory Inv;
    local wWeapon W;
    local int ammoCount, iAmmoAmount;
    local bool bSetGR;

    ammoCount = 999;
    bSetGR = false;
    Inv = Inventory;
    J0x1e:
    // End:0x27d [While If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0xd5
        if(W.WeaponType != 1 && W.WeaponType != 2 && W.WeaponType != 3 && W.WeaponType != 4 && W.WeaponType != 5)
        {
            Inv = Inv.Inventory;
        }
        // End:0x27a
        else
        {
            iAmmoAmount = W.BaseParams.iAmmo_Magazine;
            // End:0x16a
            if(W.WeaponType == 5)
            {
                ammoCount = iGranadeCount;
                // End:0x127
                if(bSetGR)
                {
                    bDeleteGranade = true;
                }
                // End:0x13e
                if(bDeleteGranade)
                {
                    iAmmoAmount = 0;
                    ammoCount = 0;
                }
                // End:0x167
                if(W.BaseParams.iWeaponID == 6000)
                {
                    bSetGR = true;
                }
            }
            // End:0x175
            else
            {
                ammoCount = 999;
            }
            // End:0x266
            if(W != none)
            {
                W.Ammo[0].MaxAmmo = ammoCount;
                W.Ammo[0].AmmoAmount = iAmmoAmount;
                W.Ammo[0].InitialAmount = ammoCount;
                W.Ammo[1].MaxAmmo = ammoCount;
                W.Ammo[1].AmmoAmount = iAmmoAmount;
                W.Ammo[1].InitialAmount = ammoCount;
                W.AmmoCharge[0] = ammoCount;
                W.AmmoCharge[1] = ammoCount;
            }
            Inv = Inv.Inventory;
        }
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
}

function AddWeaponByWeaponLimited(int iWeaponID, int iPartsID, BtrDouble UniqueID)
{
    local sStartWeaponInfo sInfo;

    AddWeapon(EmptyBtrDouble(), iWeaponID, iPartsID, false);
    sInfo.iWeaponID = iWeaponID;
    sInfo.iPartsID = iPartsID;
    sInfo.iUniqueID = EmptyBtrDouble();
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
}

function SetSelectedQuickSlotInventory(wMatchUserInfo kUser, bool bQuickslotChange)
{
    local int i, j, PlayerID, iSelectedQSlotIndex, iPrevSelectedQSlotIndex, iSlotPos;

    local BtrDouble targetUniqueID;
    local wMatchMaker kMM;
    local EquippedQSlotInfo curQSlot;
    local sStartWeaponInfo sInfo;
    local bool HasWeaponInSlot, bPermitWeaponChange;
    local wWeaponBaseParams WBP;

    Log("[wPawn::SetSelectedQuickSlotInventory] name=" $ PlayerReplicationInfo.PlayerName $ " / bQuickslotChange=" $ string(bQuickslotChange));
    // End:0x7c
    if(BTNetEnums == none)
    {
        BTNetEnums = new class'BTNetEnums';
    }
    kMM = Level.GetMatchMaker();
    iSelectedQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
    iPrevSelectedQSlotIndex = PlayerController(Controller).iPrevSelectedQSlotIndex;
    curQSlot = kUser.EquippedQSlots[iSelectedQSlotIndex - 1];
    i = 0;
    J0xe7:
    // End:0x907 [While If]
    if(i < 4)
    {
        // End:0x122
        if(curQSlot.ItemID[i] != 0)
        {
            targetUniqueID = curQSlot.ItemUniqueID[i];
        }
        // End:0x1a0
        else
        {
            j = 0;
            J0x129:
            // End:0x1a0 [While If]
            if(j < kUser.EquippedItems.Length)
            {
                // End:0x196
                if(kUser.EquippedItems[j].SlotPosition == BTNetEnums.0 + i)
                {
                    targetUniqueID = kUser.EquippedItems[j].UniqueID;
                }
                // End:0x1a0
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x129;
                }
            }
        }
        // End:0x210
        if(!Level.GetMatchMaker().BotTutorial)
        {
            j = 0;
            J0x1c5:
            // End:0x1fd [While If]
            if(j < arStartWeaponInfo.Length)
            {
                // End:0x1f3
                if(UnresolvedNativeFunction_99(targetUniqueID, arStartWeaponInfo[j].iUniqueID))
                {
                }
                // End:0x1fd
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x1c5;
                }
            }
            // End:0x210
            if(j != arStartWeaponInfo.Length)
            {
            }
            // End:0x8fd
            else
            {
            }
            bPermitWeaponChange = true;
            // End:0x2a6
            if(kMM.eWeaponLimit != kMM.0)
            {
                WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
                // End:0x2a6
                if(WBP != none)
                {
                    bPermitWeaponChange = Controller.IsPermitSpecialMode(true, WBP.iInventoryGroup, WBP.eType);
                }
            }
            // End:0x3de
            if(curQSlot.ItemID[i] != 0 && kMM.eWeaponLimit == kMM.0)
            {
                AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
                sInfo.iWeaponID = curQSlot.ItemID[i];
                sInfo.iPartsID = curQSlot.PartsID[i];
                sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
                arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemOnUse[i] = 1;
                ++ kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemUsedCount[i];
                HasWeaponInSlot = true;
            }
            // End:0x8fd
            else
            {
                // End:0x8d3
                if(kMM.eWeaponLimit != kMM.0)
                {
                    iSlotPos = BTNetEnums.0 + i;
                    // End:0x59e
                    if(kMM.4 == kMM.eWeaponLimit)
                    {
                        // End:0x4a8
                        if(iSlotPos == BTNetEnums.0)
                        {
                            AddWeapon(EmptyBtrDouble(), 5012, 0, false);
                            sInfo.iWeaponID = 5012;
                            sInfo.iPartsID = 0;
                            sInfo.iUniqueID = EmptyBtrDouble();
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                        }
                        // End:0x59b
                        else
                        {
                            AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                            sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                            sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                            sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemOnUse[iSlotPos] = 1;
                            ++ kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemUsedCount[iSlotPos];
                        }
                    }
                    // End:0x8d0
                    else
                    {
                        // End:0x670
                        if(kMM.1 == kMM.eWeaponLimit)
                        {
                            // End:0x66d
                            if(iSlotPos == BTNetEnums.0)
                            {
                                Log(string(self) $ "[::SetSelectedQuickSlotInventory] AddWeapon Knife 9001 =");
                                AddWeapon(EmptyBtrDouble(), 9001, 0, false);
                                sInfo.iWeaponID = 9001;
                                sInfo.iPartsID = 0;
                                sInfo.iUniqueID = EmptyBtrDouble();
                                arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            }
                            // End:0x66d
                            else
                            {
                            }
                        }
                        // End:0x8d0
                        else
                        {
                            // End:0x7bb
                            if(kMM.5 == kMM.eWeaponLimit)
                            {
                                // End:0x6c5
                                if(iSlotPos == BTNetEnums.2 || iSlotPos == BTNetEnums.3)
                                {
                                }
                                // End:0x7b8
                                else
                                {
                                    AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                                    sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                                    sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                                    sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                                    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                                    kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemOnUse[iSlotPos] = 1;
                                    ++ kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemUsedCount[iSlotPos];
                                }
                            }
                            // End:0x8d0
                            else
                            {
                                // End:0x8d0
                                if(kMM.6 == kMM.eWeaponLimit)
                                {
                                    AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                                    sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                                    sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                                    sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                                    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                                    kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemOnUse[iSlotPos] = 1;
                                    ++ kUser.EquippedQSlots[iSelectedQSlotIndex - 1].ItemUsedCount[iSlotPos];
                                }
                            }
                        }
                    }
                }
                // End:0x8fd
                else
                {
                    // End:0x8fd
                    if(i < 1)
                    {
                        AddBaseInvenWeapon(kUser, BTNetEnums.0 + i);
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe7;
    }
    // End:0xa48
    if(HasWeaponInSlot && iPrevSelectedQSlotIndex != iSelectedQSlotIndex && bQuickslotChange == false)
    {
        PlayerID = kMM.GetUIDByUserName(PlayerController(Controller).PlayerReplicationInfo.PlayerName);
        clog("[sfReqGamePlay_ChangeWeaponSet] PlayerID:" $ string(PlayerID) $ "/Set Num:" $ string(iSelectedQSlotIndex) $ "/PS:" $ string(iPrevSelectedQSlotIndex));
        Log("[sfReqGamePlay_ChangeWeaponSet] PlayerID:" $ string(PlayerID) $ "/Set Num:" $ string(iSelectedQSlotIndex));
        Level.Game.SendReqChangeWeaponSet(PlayerID, iSelectedQSlotIndex);
        PlayerController(Controller).iPrevSelectedQSlotIndex = iSelectedQSlotIndex;
    }
}

function AddBaseInvenWeapon(wMatchUserInfo kUser, int iPos)
{
    local int i;
    local wMatchMaker kMM;
    local sStartWeaponInfo sInfo;

    kMM = Level.GetMatchMaker();
    i = 0;
    J0x1c:
    // End:0x162 [While If]
    if(i < kUser.EquippedItems.Length)
    {
        // End:0x158
        if(kUser.EquippedItems[i].SlotPosition == iPos)
        {
            AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false, kUser.EquippedItems[i].Painting_Item_ID);
            sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
            sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
            sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.SetItemUse(i);
        }
        // End:0x162
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
}

simulated function ClientQSlotChangeCheck()
{
    ServerQSlotChangeCheck();
}

function ServerQSlotChangeCheck()
{
    local int PlayerID;

    // End:0x88
    if(iStartQSlotIndex != PlayerController(Controller).iSelectedQSlotIndex)
    {
        PlayerID = Level.GetMatchMaker().GetUIDByUserName(PlayerController(Controller).PlayerReplicationInfo.PlayerName);
        Level.Game.SendReqChangeWeaponSet(PlayerID, PlayerController(Controller).iSelectedQSlotIndex);
    }
}

function SetSpecialState(byte byState)
{
    bySpecialState = byState;
    Log(string(self) $ " SetSpecialState() : / Weapon : " $ string(Weapon) $ " / bySpecialState : " $ string(bySpecialState));
}

simulated function ClientSwitchToLastWeapon(optional byte defuseSwitch)
{
    // End:0x55
    if(1 == defuseSwitch)
    {
        // End:0x55
        if(!Weapon.IsA('wDemopack'))
        {
            Log(string(self) $ " 1 == defuseSwitch / Weapon : " $ string(Weapon));
            return;
        }
    }
    // End:0x71
    if(Weapon.IsA('wDemopack'))
    {
        SetSpecialState(0);
    }
    SwitchToLastWeapon();
}

function SpawnMedals()
{
    local Actor spawnedActor;
    local Vector offset;
    local Rotator Rotation;

    Level.GRI.Teams[GetTeamNum()].Score2 -= float(PlayerReplicationInfo.NumMedals);
    J0x39:
    // End:0xec [While If]
    if(PlayerReplicationInfo.NumMedals > 0)
    {
        -- PlayerReplicationInfo.NumMedals;
        offset = MakeVector(FRand() - 0.50 * float(80), FRand() - 0.50 * float(80), 0.0);
        spawnedActor = Spawn(class'wMedalPack',,, Location - CollisionHeight * vect(0.0, 0.0, 1.0) + offset,, true);
        Rotation.Yaw = int(FRand() * float(65535));
        spawnedActor.SetRotation(Rotation);
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
}

function int SpawnSupplyItem()
{
    local float fRandom;
    local wMapInfo mapInfo;
    local Actor spawnedActor;
    local int spawnID;
    local wMatchMaker kMM;

    // End:0x0d
    if(IsA('wHelicopter'))
    {
        return 0;
    }
    Log("go SpawnSupply");
    kMM = Level.GetMatchMaker();
    // End:0x48
    if(kMM.BotTutorial)
    {
        return 0;
    }
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
    fRandom = Level.Game.GetSupplyRandom();
    fRandom -= mapInfo.SupplyHealth;
    // End:0x13c
    if(kMM.eWeaponLimit != kMM.1)
    {
        // End:0x13c
        if(fRandom < float(0))
        {
            spawnedActor = Spawn(class'wHealthPack',,, Location - CollisionHeight * vect(0.0, 0.0, 1.0));
            Log("SpawnSupplyItem: wHealthPack");
            spawnID = 1;
        }
    }
    // End:0x1b9
    if(Level.GRI.GameClass == "WMission.wSDGameInfo" || kMM.eWeaponLimit == kMM.5 || kMM.eWeaponLimit == kMM.1)
    {
    }
    // End:0x33d
    else
    {
        fRandom -= mapInfo.SupplyUAV;
        // End:0x238
        if(spawnID == 0 && fRandom < float(0))
        {
            spawnedActor = Spawn(class'wUAVPack',,, Location - CollisionHeight * vect(0.0, 0.0, 1.0));
            Log("SpawnSupplyItem: wUAVPack");
            spawnID = 2;
        }
        fRandom -= mapInfo.SupplyHelicopter;
        // End:0x2b8
        if(spawnID == 0 && fRandom < float(0))
        {
            spawnedActor = Spawn(class'wHeliPack',,, Location - CollisionHeight * vect(0.0, 0.0, 1.0));
            Log("SpawnSupplyItem: wHeliPack");
            spawnID = 3;
        }
        fRandom -= mapInfo.SupplyBombing;
        // End:0x33d
        if(spawnID == 0 && fRandom < float(0))
        {
            spawnedActor = Spawn(class'wArtilleryPack',,, Location - CollisionHeight * vect(0.0, 0.0, 1.0));
            Log("SpawnSupplyItem: wArtilleryPack");
            spawnID = 4;
        }
    }
    // End:0x35c
    if(spawnedActor != none)
    {
        Pickup(spawnedActor).InitDroppedPack();
    }
    return spawnID;
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY);
simulated function PlayMelee(bool bMeleeKnifeOrButt)
{
    local name CurrentMelee3rd;

    // End:0x61
    if(bIsProned == true)
    {
        // End:0x23
        if(bMeleeKnifeOrButt)
        {
            CurrentMelee3rd = Meele_Knife_Pr;
        }
        // End:0x5e
        else
        {
            // End:0x53
            if(WeaponAttachment.BaseParams.eType == 17)
            {
                CurrentMelee3rd = Knife_Fire_Pr;
            }
            // End:0x5e
            else
            {
                CurrentMelee3rd = Meele_Rifle_Pr;
            }
        }
    }
    // End:0x114
    else
    {
        // End:0xc2
        if(bIsCrouched == true)
        {
            // End:0x84
            if(bMeleeKnifeOrButt)
            {
                CurrentMelee3rd = Meele_Knife_Cr;
            }
            // End:0xbf
            else
            {
                // End:0xb4
                if(WeaponAttachment.BaseParams.eType == 17)
                {
                    CurrentMelee3rd = Knife_Fire_Cr;
                }
                // End:0xbf
                else
                {
                    CurrentMelee3rd = Meele_Rifle_Cr;
                }
            }
        }
        // End:0x114
        else
        {
            // End:0xd9
            if(bMeleeKnifeOrButt)
            {
                CurrentMelee3rd = Meele_Knife;
            }
            // End:0x114
            else
            {
                // End:0x109
                if(WeaponAttachment.BaseParams.eType == 17)
                {
                    CurrentMelee3rd = Knife_Fire;
                }
                // End:0x114
                else
                {
                    CurrentMelee3rd = Meele_Rifle;
                }
            }
        }
    }
    AnimBlendParams(1, 1.0, 0.0, 0.0, FireRootBone);
    PlayAnim(CurrentMelee3rd, 1.0, 0.0, 1);
    Log("MeleeAni - " $ string(CurrentMelee3rd));
}

simulated function PlayRechamber()
{
    local name CurAnimName;
    local wGun Gun;

    Gun = wGun(Weapon);
    // End:0x6f
    if(bIsProned)
    {
        // End:0x61
        if(Gun.WeaponType == 6 && Gun.BaseParams.fRechamberRate != float(0))
        {
            CurAnimName = ShotGun_Prone_Pump;
        }
        // End:0x6c
        else
        {
            CurAnimName = Rifle_Prone_BoltLeverAnim;
        }
    }
    // End:0x121
    else
    {
        // End:0xce
        if(bIsCrouched)
        {
            // End:0xc0
            if(Gun.WeaponType == 6 && Gun.BaseParams.fRechamberRate != float(0))
            {
                CurAnimName = ShotGun_Crouch_Pump;
            }
            // End:0xcb
            else
            {
                CurAnimName = Rifle_Crouch_BoltLeverAnim;
            }
        }
        // End:0x121
        else
        {
            // End:0x116
            if(Gun.WeaponType == 6 && Gun.BaseParams.fRechamberRate != float(0))
            {
                CurAnimName = ShotGun_BoltLeverAnim;
            }
            // End:0x121
            else
            {
                CurAnimName = Rifle_BoltLeverAnim;
            }
        }
    }
    // End:0x13f
    if(Role == 4)
    {
        SetAnimAction(CurAnimName);
    }
    // End:0x14a
    else
    {
        ServerSetAnimAction(CurAnimName);
    }
    // End:0x1b2
    if(Gun != none && Gun.bRechamber && Gun.CheckAim())
    {
        // End:0x1b2
        if(Gun.WeaponType != 6)
        {
            Gun.FireMode[1].AutoAimCount = 2;
        }
    }
}

simulated function PlayReload()
{
    local name CurrentReload3rd;

    // End:0x123
    if(bIsProned)
    {
        // End:0x50
        if(TypeOfWeapon == 4)
        {
            // End:0x42
            if(WeaponAttachment.ResParams.default.Use2ndAni)
            {
                CurrentReload3rd = Pistol_ProneReload_2nd;
            }
            // End:0x4d
            else
            {
                CurrentReload3rd = Pistol_ProneReload;
            }
        }
        // End:0x120
        else
        {
            // End:0x97
            if(TypeOfWeapon == 7)
            {
                // End:0x89
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Rpg_ProneReload_2nd;
                }
                // End:0x94
                else
                {
                    CurrentReload3rd = Rpg_ProneReload;
                }
            }
            // End:0x120
            else
            {
                // End:0xe5
                if(TypeOfWeapon == 6)
                {
                    // End:0xd7
                    if(WeaponAttachment.BaseParams.ReloadType == 2)
                    {
                        CurrentReload3rd = ShotGun_Prone_Reload3;
                    }
                    // End:0xe2
                    else
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_Anim;
                    }
                }
                // End:0x120
                else
                {
                    // End:0x115
                    if(WeaponAttachment.BaseParams.ReloadType == 2)
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_2nd_Anim;
                    }
                    // End:0x120
                    else
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_Anim;
                    }
                }
            }
        }
    }
    // End:0x35d
    else
    {
        // End:0x246
        if(bIsCrouched)
        {
            // End:0x173
            if(TypeOfWeapon == 4)
            {
                // End:0x165
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Pistol_CrouchReload_2nd;
                }
                // End:0x170
                else
                {
                    CurrentReload3rd = Pistol_CrouchReload;
                }
            }
            // End:0x243
            else
            {
                // End:0x1ba
                if(TypeOfWeapon == 7)
                {
                    // End:0x1ac
                    if(WeaponAttachment.ResParams.default.Use2ndAni)
                    {
                        CurrentReload3rd = Rpg_CrouchReload_2nd;
                    }
                    // End:0x1b7
                    else
                    {
                        CurrentReload3rd = Rpg_CrouchReload;
                    }
                }
                // End:0x243
                else
                {
                    // End:0x208
                    if(TypeOfWeapon == 6)
                    {
                        // End:0x1fa
                        if(WeaponAttachment.BaseParams.ReloadType == 2)
                        {
                            CurrentReload3rd = ShotGun_Crouch_Reload3;
                        }
                        // End:0x205
                        else
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_Anim;
                        }
                    }
                    // End:0x243
                    else
                    {
                        // End:0x238
                        if(WeaponAttachment.BaseParams.ReloadType == 2)
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_2nd_Anim;
                        }
                        // End:0x243
                        else
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_Anim;
                        }
                    }
                }
            }
        }
        // End:0x35d
        else
        {
            // End:0x28d
            if(TypeOfWeapon == 4)
            {
                // End:0x27f
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Pistol_Reload_Rifle_2nd_Anim;
                }
                // End:0x28a
                else
                {
                    CurrentReload3rd = Pistol_Reload_Rifle_Anim;
                }
            }
            // End:0x35d
            else
            {
                // End:0x2d4
                if(TypeOfWeapon == 7)
                {
                    // End:0x2c6
                    if(WeaponAttachment.ResParams.default.Use2ndAni)
                    {
                        CurrentReload3rd = Rpg_Reload_2nd_Anim;
                    }
                    // End:0x2d1
                    else
                    {
                        CurrentReload3rd = Rpg_Reload_Anim;
                    }
                }
                // End:0x35d
                else
                {
                    // End:0x322
                    if(TypeOfWeapon == 6)
                    {
                        // End:0x314
                        if(WeaponAttachment.BaseParams.ReloadType == 2)
                        {
                            CurrentReload3rd = ShotGun_Reload;
                        }
                        // End:0x31f
                        else
                        {
                            CurrentReload3rd = Reload_Rifle_Anim;
                        }
                    }
                    // End:0x35d
                    else
                    {
                        // End:0x352
                        if(WeaponAttachment.BaseParams.ReloadType == 2)
                        {
                            CurrentReload3rd = Reload_Rifle_2nd_Anim;
                        }
                        // End:0x35d
                        else
                        {
                            CurrentReload3rd = Reload_Rifle_Anim;
                        }
                    }
                }
            }
        }
    }
    // End:0x37b
    if(Role == 4)
    {
        SetAnimAction(CurrentReload3rd);
    }
    // End:0x386
    else
    {
        ServerSetAnimAction(CurrentReload3rd);
    }
    MakeNoise(0.50);
}

function HandlePickup(Pickup pick)
{
    local wWeaponPickup WPick;
    local wWeapon W, W2Drop;
    local Inventory invW;
    local wItemBaseParam ItemParam;

    // End:0x3e3
    if(pick.IsA('wWeaponPickup'))
    {
        WPick = wWeaponPickup(pick);
        // End:0x1bd
        if(WPick.BaseParams.iInventoryGroup == 1 || WPick.BaseParams.iInventoryGroup == 2)
        {
            J0x61:
            // End:0x1bd [While If]
            if(true)
            {
                // End:0x7e
                if(invW == none)
                {
                    invW = Inventory;
                }
                // End:0x92
                else
                {
                    invW = invW.Inventory;
                }
                // End:0xa0
                if(invW == none)
                {
                }
                // End:0x1bd
                else
                {
                    W2Drop = wWeapon(invW);
                    // End:0xbe
                    if(W2Drop == none)
                    {
                    }
                    // End:0x1ba
                    else
                    {
                        // End:0xed
                        if(W2Drop.InventoryGroup != WPick.BaseParams.iInventoryGroup)
                        {
                        }
                        // End:0x1ba
                        else
                        {
                            // End:0x10c
                            if(W != none && W2Drop == W)
                            {
                            }
                            // End:0x1ba
                            else
                            {
                                ItemParam = Level.GameMgr.GetItemParam(W2Drop.BaseParams.iWeaponID);
                                // End:0x173
                                if(ItemParam.iItemID >= 0 && ItemParam.eGrade == 11)
                                {
                                }
                                // End:0x1ba
                                else
                                {
                                    W2Drop.Velocity = vect(0.0, 0.0, 0.0);
                                    W2Drop.DropFrom(kPendingWPick.Location, kPendingWPick.Rotation);
                                }
                            }
                        }
                    }
                    // This is an implied JumpToken; Continue!
                    goto J0x61;
                }
            }
        }
        // End:0x2f1
        if(W != none)
        {
            W.AmmoCharge[0] += WPick.AmmoAmount[0];
            W.AmmoCharge[0] = Min(W.AmmoCharge[0], W.BaseParams.iAmmo_Max);
            W.AmmoCharge[1] += WPick.AmmoAmount[1];
            W.AmmoCharge[1] = Min(W.AmmoCharge[1], W.BaseParams.iAmmo_Max);
            // End:0x2ee
            if(W.IsA('wGun'))
            {
                W.AmmoCharge[0] += WPick.AmmoAmount_Loaded;
                W.AmmoCharge[0] = Min(W.AmmoCharge[0], W.BaseParams.iAmmo_Max);
            }
        }
        // End:0x3d8
        else
        {
            W = AddWeapon(EmptyBtrDouble(), WPick.iRepWeaponID, WPick.iRepAddPartsID, true, WPick.iPainting_Item_ID);
            SetAddWeaponSkill(W, WPick.iRepWeaponID, WPick.iRepAddPartsID);
            // End:0x3d8
            if(W != none)
            {
                W.AmmoCharge[0] = WPick.AmmoAmount[0];
                W.AmmoCharge[1] = WPick.AmmoAmount[1];
                // End:0x3d8
                if(W.IsA('wGun'))
                {
                    wGun(W).AmmoCharge_CurLoaded = WPick.AmmoAmount_Loaded;
                }
            }
        }
        PendingWeapon = W;
    }
    super(Pawn).HandlePickup(pick);
}

simulated function AddNoWeaponChangeMessage(byte bySlot)
{
    ServerCallNoWeaponMessage(bySlot);
}

function ServerCallNoWeaponMessage(byte bySlot)
{
    local int i;
    local wWeaponBaseParams WBP;
    local wItemResourceParam resParam;

    i = 0;
    J0x07:
    // End:0x1c3 [While If]
    if(i < arStartWeaponInfo.Length)
    {
        WBP = Level.WeaponMgr.GetBaseParam(arStartWeaponInfo[i].iWeaponID);
        // End:0x1b9
        if(WBP.iInventoryGroup == bySlot)
        {
            resParam = Level.GameMgr.GetItemResourceParam(arStartWeaponInfo[i].iWeaponID);
            // End:0x1b6
            if(resParam.iItemResourceID != -1)
            {
                switch(resParam.iItemResourceID)
                {
                    // End:0xbd
                    case 6000:
                    // End:0xc5
                    case 6003:
                    // End:0xf7
                    case 6004:
                        PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_NoThrowingGreanade);
                        // End:0x1b6
                        break;
                    // End:0x129
                    case 6001:
                        PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_NoThrowingSmoke);
                        // End:0x1b6
                        break;
                    // End:0x15b
                    case 6002:
                        PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_NoThrowingStun);
                        // End:0x1b6
                        break;
                    // End:0x18a
                    case 7001:
                        PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_NoThrowingC4);
                    // End:0xffff
                    default:
                        PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_NoWeapon', arStartWeaponInfo[i].iWeaponID);
                    }
                    // This is an implied JumpToken;
                    goto J0x1c3;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x07;
            }
            J0x1c3:
}

simulated function MakeShellEffect();
simulated function MakeShellEffect_Rechamber()
{
    // End:0x23
    if(WeaponAttachment == none || WeaponAttachment.BaseParams == none)
    {
        return;
    }
    WeaponAttachment.MakeSpawnShell(true);
    // End:0x59
    if(wGun(Weapon) != none)
    {
        wGun(Weapon).StateRechamber = 3;
    }
}

simulated function RenderFPWeaponAttachment(Canvas C)
{
    // End:0x0d
    if(WeaponAttachment == none)
    {
        return;
    }
    // End:0x60
    if(FPWeaponAttachment == none)
    {
        FPWeaponAttachment = Spawn(class'wFPWeaponAttachment');
        FPWeaponAttachment.wLoadOut(WeaponAttachment.iRepWeaponID, WeaponAttachment.iRepAddPartsID, WeaponAttachment.iPainting_Item_ID, self);
    }
    // End:0xde
    if(FPWeaponAttachment.iSavedWID != WeaponAttachment.iRepWeaponID || FPWeaponAttachment.iSavedPartsID != WeaponAttachment.iRepAddPartsID)
    {
        FPWeaponAttachment.wLoadOut(WeaponAttachment.iRepWeaponID, WeaponAttachment.iRepAddPartsID, WeaponAttachment.iPainting_Item_ID, self);
    }
    FPWeaponAttachment.RenderOverlays(C);
}

function SetAddWeaponSkill(wWeapon W, int iaWeaponID, int iPartsID)
{
    local int i, iCheck, j;
    local wSkillBase SkillBase;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID;
    local array<int> PartSkillList;

    SkillBase = wPlayer(Controller).SkillBase;
    i = 0;
    J0x20:
    // End:0xac [While If]
    if(i < SkillBase.Skills.Length)
    {
        // End:0x6f
        if(SkillBase.Skills[i].IsA('wSkill_QuickAimZoom'))
        {
            W.ServerQuickAimZoom(true);
        }
        // End:0xa2
        else
        {
            // End:0xa2
            if(SkillBase.Skills[i].IsA('wSkill_QuickReload'))
            {
                W.ServerQuickReload(true);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    iSightPartID = iPartsID & 1023;
    iBarrelPartID = iPartsID & 130048;
    iSilencerPartID = iPartsID & 16646144;
    iGunstockPartID = iPartsID & 2130706432;
    wcpp = none;
    // End:0x181
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x181
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x212
    if(iBarrelPartID > 1 << 10)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x212
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x2a3
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x2a3
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x334
    if(iGunstockPartID > 1 << 24)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x334
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    j = 0;
    J0x33b:
    // End:0x44b [While If]
    if(j < PartSkillList.Length)
    {
        iCheck = 0;
        i = 4;
        J0x35a:
        // End:0x399 [While If]
        if(i < 12)
        {
            // End:0x38f
            if(PartSkillList[j] == AddedSkillList[i])
            {
                iCheck = i;
            }
            // End:0x399
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x35a;
            }
        }
        // End:0x441
        if(iCheck == 0)
        {
            i = 4;
            J0x3ac:
            // End:0x3f8 [While If]
            if(i < 12)
            {
                // End:0x3ee
                if(AddedSkillList[i] == 0)
                {
                    AddedSkillList[i] = PartSkillList[j];
                    iCheck = i;
                }
                // End:0x3f8
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x3ac;
                }
            }
            // End:0x441
            if(iCheck != 0)
            {
                wPlayer(Controller).AddSkill(PartSkillList[j]);
                wPlayer(Controller).ApplySkill_Client(PartSkillList[j]);
            }
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x33b;
    }
}

function SetRemoveWeaponSkill(wWeapon W)
{
    local int i, j, iCount;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID;
    local array<int> PartSkillList;

    iSightPartID = W.InventoryClassAddPartsID & 1023;
    iBarrelPartID = W.InventoryClassAddPartsID & 130048;
    iSilencerPartID = W.InventoryClassAddPartsID & 16646144;
    iGunstockPartID = W.InventoryClassAddPartsID & 2130706432;
    wcpp = none;
    // End:0xf9
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0xf9
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x18a
    if(iBarrelPartID > 1 << 10)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x18a
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x21b
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x21b
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x2ac
    if(iGunstockPartID > 1 << 24)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x2ac
        if(wcpp.iItemID > 0 && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    j = 0;
    J0x2b3:
    // End:0x392 [While If]
    if(j < PartSkillList.Length)
    {
        iCount = 0;
        i = 0;
        J0x2d1:
        // End:0x309 [While If]
        if(i < 12)
        {
            // End:0x2ff
            if(AddedSkillList[i] == PartSkillList[j])
            {
                ++ iCount;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2d1;
        }
        // End:0x35d
        if(iCount > 0)
        {
            i = 4;
            J0x31c:
            // End:0x35d [While If]
            if(i < 12)
            {
                // End:0x353
                if(AddedSkillList[i] == PartSkillList[j])
                {
                    AddedSkillList[i] = 0;
                }
                // End:0x35d
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x31c;
                }
            }
        }
        // End:0x388
        if(iCount < 2)
        {
            wPlayer(Controller).RemoveSkill(PartSkillList[j]);
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x2b3;
    }
}

function AddWeaponMagazine()
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0b:
    // End:0x83 [While If]
    if(Inv != none && Count < 50)
    {
        // End:0x65
        if(Inv.IsA('wWeapon') && Inv.InventoryGroup < 3)
        {
            wWeapon(Inv).ServerAddMagazine();
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function SetWeaponQuickAimZoom(bool bOn)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0b:
    // End:0x70 [While If]
    if(Inv != none && Count < 50)
    {
        // End:0x52
        if(Inv.IsA('wWeapon'))
        {
            wWeapon(Inv).ServerQuickAimZoom(bOn);
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function SetWeaponQuickReload(bool bOn)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0b:
    // End:0x70 [While If]
    if(Inv != none && Count < 50)
    {
        // End:0x52
        if(Inv.IsA('wWeapon'))
        {
            wWeapon(Inv).ServerQuickReload(bOn);
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    bCanQuickReload = true;
}

function SetWeaponQuickChange(bool bOn)
{
    bCanQuickWeaponChange = bOn;
}

simulated function GetWeaponAttachmentInfo(out byte byFlashCount, out byte byFiringMode)
{
    // End:0x33
    if(WeaponAttachment != none)
    {
        byFlashCount = WeaponAttachment.FlashCount;
        byFiringMode = WeaponAttachment.FiringMode;
    }
}

function SetBurning(bool bBurn, wProjectile proj)
{
    // End:0x20
    if(bBurning == bBurn && BurningProj != none)
    {
        return;
    }
    bBurning = bBurn;
    BurningProj = proj;
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("### WeaponAttachment FlashCount : " $ string(WeaponAttachment.FlashCount));
    // End:0xc0
    if(FPWeaponAttachment != none)
    {
        FPWeaponAttachment.DisplayDebug(Canvas, YL, YPos);
    }
}

exec function reset_weapon()
{
    local wWeaponBaseParams WBP;
    local byte i;

    Level.WeaponMgr.WeaponParams.Length = 0;
    Level.WeaponMgr.LoadWeaponParams();
    WBP = Level.WeaponMgr.GetBaseParam(Weapon.BaseParams.iWeaponID);
    Weapon.BaseParams = WBP;
    WeaponAttachment.BaseParams = WBP;
    i = 0;
    J0x97:
    // End:0x119 [While If]
    if(i < Weapon.3)
    {
        // End:0x10f
        if(Weapon.FireMode[i] != none)
        {
            Weapon.FireMode[i].NextFireTime = 0.0;
            Weapon.FireMode[i].wLoadOut();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x97;
    }
    TestVersion_SetParameters();
}

simulated function AddIdentificationFriend()
{
    // End:0xa6
    if(bAlreadySetup && mIFFEffect == none)
    {
        Log("AddIFF PlayerName:" $ PlayerReplicationInfo.PlayerName $ " iSideIndex:" $ string(GetTeamNum()) $ " MyTeam:" $ string(Level.GetMatchMaker().My_iTeam));
        mIFFEffect = Spawn(GibGroupClass.default.IdentificationFriendClass, self);
        AttachToBone(mIFFEffect, 'Bip01 R Clavicle');
    }
}

state Dying
{
    simulated function AnimEnd(int Channel)
    {
        ReduceCylinder();
    }

    event FellOutOfWorld(Engine.Actor.eKillZType KillType)
    {
        return;
    }

    function LandThump()
    {
        // End:0x23
        if(Physics == 0)
        {
            bThumped = true;
            PlaySound(GetSound(1));
        }
    }

    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local Vector SelfToHit, SelfToInstigator, CrossPlaneNormal;
        local float W, YawDir;
        local Vector HitNormal, shotDir, PushLinVel, PushAngVel;
        local name HitBone;
        local float HitBoneDist;
        local int MaxCorpseYawRate;

        // End:0x16
        if(bFrozenBody || bRubbery)
        {
            return;
        }
        // End:0x26c
        if(Physics == 14)
        {
            // End:0x31
            if(bRubbery)
            {
                return;
            }
            // End:0xa9
            if(DamageType.default.bThrowRagdoll)
            {
                shotDir = Normal(Momentum);
                PushLinVel = RagDeathVel * shotDir + vect(0.0, 0.0, 250.0);
                PushAngVel = Normal(shotDir Cross vect(0.0, 0.0, 1.0)) * float(-18000);
                KSetSkelVel(PushLinVel, PushAngVel);
            }
            // End:0x202
            else
            {
                // End:0x1de
                if(DamageType.default.bRagdollBullet)
                {
                    // End:0xed
                    if(Momentum == vect(0.0, 0.0, 0.0))
                    {
                        Momentum = HitLocation - instigatedBy.Location;
                    }
                    // End:0x187
                    if(FRand() < 0.650)
                    {
                        // End:0x11e
                        if(Velocity.Z <= float(0))
                        {
                            PushLinVel = vect(0.0, 0.0, 40.0);
                        }
                        PushAngVel = Normal(Normal(Momentum) Cross vect(0.0, 0.0, 1.0)) * float(-8000);
                        PushAngVel.X *= 0.50;
                        PushAngVel.Y *= 0.50;
                        PushAngVel.Z *= float(4);
                        KSetSkelVel(PushLinVel, PushAngVel);
                    }
                    PushLinVel = RagShootStrength * Normal(Momentum);
                    KAddImpulse(PushLinVel, HitLocation);
                    // End:0x1db
                    if(LifeSpan > float(0) && LifeSpan < DeResTime + float(2))
                    {
                        LifeSpan += 0.20;
                    }
                }
                // End:0x202
                else
                {
                    PushLinVel = RagShootStrength * Normal(Momentum);
                    KAddImpulse(PushLinVel, HitLocation);
                }
            }
            // End:0x26a
            if(DamageType.default.DamageOverlayMaterial != none && Level.DetailMode != 0 && !Level.bDropDetail)
            {
                SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
            }
            return;
        }
        // End:0x2b6
        if(DamageType.default.bFastInstantHit && GetAnimSequence() == 'Death_Spasm' && RepeaterDeathCount < 6)
        {
            PlayAnim('Death_Spasm',, 0.20);
            ++ RepeaterDeathCount;
        }
        // End:0x54d
        else
        {
            // End:0x54d
            if(Damage > 0)
            {
                // End:0x3a6
                if(instigatedBy != none)
                {
                    // End:0x304
                    if(instigatedBy.IsA('wPawn') && wPawn(instigatedBy).bBerserk)
                    {
                        Damage *= float(2);
                    }
                    // End:0x3a6
                    if(instigatedBy.Location != Location)
                    {
                        SelfToInstigator = instigatedBy.Location - Location;
                        SelfToHit = HitLocation - Location;
                        CrossPlaneNormal = Normal(SelfToInstigator Cross vect(0.0, 0.0, 1.0));
                        W = CrossPlaneNormal Dot Location;
                        // End:0x39b
                        if(HitLocation Dot CrossPlaneNormal < W)
                        {
                            YawDir = -1.0;
                        }
                        // End:0x3a6
                        else
                        {
                            YawDir = 1.0;
                        }
                    }
                }
                // End:0x3ec
                if(VSize(Momentum) < float(10))
                {
                    Momentum = -Normal(SelfToInstigator) * float(Damage) * 1000.0;
                    Momentum.Z = Abs(Momentum.Z);
                }
                SetPhysics(2);
                Momentum = Momentum / Mass;
                AddVelocity(Momentum);
                bBounce = true;
                RotationRate.Pitch = 0;
                RotationRate.Yaw += int(VSize(Momentum) * YawDir);
                MaxCorpseYawRate = 150000;
                RotationRate.Yaw = Clamp(RotationRate.Yaw, -MaxCorpseYawRate, MaxCorpseYawRate);
                RotationRate.Roll = 0;
                bFixedRotationDir = true;
                bRotateToDesired = false;
                Health -= Damage;
                CalcHitLoc(HitLocation, vect(0.0, 0.0, 0.0), HitBone, HitBoneDist);
                // End:0x4fd
                if(instigatedBy != none)
                {
                    HitNormal = Normal(Normal(instigatedBy.Location - HitLocation) + VRand() * 0.20 + vect(0.0, 0.0, 2.80));
                }
                // End:0x52c
                else
                {
                    HitNormal = Normal(vect(0.0, 0.0, 1.0) + VRand() * 0.20 + vect(0.0, 0.0, 2.80));
                }
                DoDamageFX(HitBone, Damage, DamageType, rotator(HitNormal), HitLocation);
            }
        }
    }

    simulated function BeginState()
    {
        bySpecialState = 0;
        Level.GetLocalPlayerController().myHUD.NotifyDeath(self);
        super.BeginState();
        AmbientSound = none;
    }

    simulated function Timer()
    {
        local KarmaParamsSkel skelParams;

        // End:0x0e
        if(!PlayerCanSeeMe())
        {
            Destroy();
        }
        // End:0xe1
        else
        {
            // End:0xd8
            if(LifeSpan <= DeResTime && bDeRes == false)
            {
                skelParams = KarmaParamsSkel(KParams);
                // End:0xbe
                if(PlayerController(OldController) != none && PlayerController(OldController).ViewTarget == self && Viewport(PlayerController(OldController).Player) != none)
                {
                    skelParams.bKImportantRagdoll = true;
                    LifeSpan = FMax(LifeSpan, DeResTime + 2.0);
                    SetTimer(1.0, false);
                    return;
                }
                // End:0xcf
                else
                {
                    skelParams.bKImportantRagdoll = false;
                }
                StartDeRes();
            }
            // End:0xe1
            else
            {
                SetTimer(1.0, false);
            }
        }
    }

    event KVelDropBelow()
    {
        local float NewLifeSpan;

        // End:0x38
        if(bDeRes == false)
        {
            NewLifeSpan = DeResTime + 3.50;
            // End:0x38
            if(NewLifeSpan < LifeSpan)
            {
                LifeSpan = NewLifeSpan;
            }
        }
    }

}

defaultproperties
{
    bCanDodgeDoubleJump=true
    ShieldStrengthMax=150.0
    Species=class'SPECIES_Merc'
    GruntVolume=0.180
    FootstepVolume=0.60
    GibGroupClass=Class'XEffects.xPawnGibGroup'
    GibCountCalf=4
    GibCountForearm=2
    GibCountHead=2
    GibCountTorso=2
    GibCountUpperArm=2
    MinTimeBetweenPainSounds=0.350
    SoundFootsteps[0]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[1]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[2]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[3]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[4]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[5]=SoundGroup'Warfare_Sound_FootStep.Dirt.foot_dirt_nomal_1st'
    SoundFootsteps[6]=SoundGroup'Warfare_Sound_FootStep.Metal.foot_metal_nomal_1st'
    SoundFootsteps[7]=SoundGroup'Warfare_Sound_FootStep.Metal.foot_metal_nomal_1st'
    SoundFootsteps[8]=SoundGroup'Warfare_Sound_FootStep.wood.foot_wood_nomal_1st'
    SoundFootsteps[9]=SoundGroup'Warfare_Sound_FootStep.grass.foot_grass_nomal_1st'
    SoundFootsteps[10]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[11]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[12]=SoundGroup'Warfare_Sound_FootStep.snow.foot_snow_nomal_1st'
    SoundFootsteps[13]=SoundGroup'Warfare_Sound_FootStep.waterwaist.foot_waterwaist_nomal_1st'
    SoundFootsteps[14]=SoundGroup'Warfare_Sound_FootStep.Glass.foot_glass_nomal_1st'
    SoundFootsteps[15]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal_1st'
    SoundFootsteps[16]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[17]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[20]=SoundGroup'Warfare_Sound_FootStep.woodcreak.foot_woodcreak_nomal_1st'
    SoundFootsteps[21]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[22]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[23]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal_1st'
    SoundFootsteps[24]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal_1st'
    SoundFootsteps[25]=SoundGroup'Warfare_Sound_FootStep.Leaves.foot_leaves_nomal_1st'
    SoundFootsteps[26]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal_1st'
    SoundFootsteps[27]=SoundGroup'Warfare_Sound_FootStep.sand.foot_sand_nomal_1st'
    SoundFootsteps[28]=SoundGroup'Warfare_Sound_FootStep.mud.foot_mud_nomal_1st'
    SoundFootsteps[29]=SoundGroup'Warfare_Sound_FootStep.waterfoot.foot_waterfoot_nomal_1st'
    SoundFootsteps_3rd[0]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[1]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[2]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[3]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[4]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[5]=SoundGroup'Warfare_Sound_FootStep.Dirt.foot_dirt_nomal'
    SoundFootsteps_3rd[6]=SoundGroup'Warfare_Sound_FootStep.Metal.foot_metal_nomal'
    SoundFootsteps_3rd[7]=SoundGroup'Warfare_Sound_FootStep.Metal.foot_metal_nomal'
    SoundFootsteps_3rd[8]=SoundGroup'Warfare_Sound_FootStep.wood.foot_wood_nomal'
    SoundFootsteps_3rd[9]=SoundGroup'Warfare_Sound_FootStep.grass.foot_grass_nomal'
    SoundFootsteps_3rd[10]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[11]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[12]=SoundGroup'Warfare_Sound_FootStep.snow.foot_snow_nomal'
    SoundFootsteps_3rd[13]=SoundGroup'Warfare_Sound_FootStep.waterwaist.foot_waterwaist_nomal'
    SoundFootsteps_3rd[14]=SoundGroup'Warfare_Sound_FootStep.Glass.foot_glass_nomal'
    SoundFootsteps_3rd[15]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal'
    SoundFootsteps_3rd[16]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[17]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[20]=SoundGroup'Warfare_Sound_FootStep.woodcreak.foot_woodcreak_nomal'
    SoundFootsteps_3rd[21]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[22]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[23]=SoundGroup'Warfare_Sound_FootStep.stone.foot_stone_nomal'
    SoundFootsteps_3rd[24]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal'
    SoundFootsteps_3rd[25]=SoundGroup'Warfare_Sound_FootStep.Leaves.foot_leaves_nomal'
    SoundFootsteps_3rd[26]=SoundGroup'Warfare_Sound_FootStep.carpet.foot_carpet_nomal'
    SoundFootsteps_3rd[27]=SoundGroup'Warfare_Sound_FootStep.sand.foot_sand_nomal'
    SoundFootsteps_3rd[28]=SoundGroup'Warfare_Sound_FootStep.mud.foot_mud_nomal'
    SoundFootsteps_3rd[29]=SoundGroup'Warfare_Sound_FootStep.waterfoot.foot_waterfoot_nomal'
    SoundGroupClass=class'wMercMaleSoundGroup'
    sndScream=SoundGroup'Warfare_Sound_Char.breath.char_breath_pain'
    sndDie=SoundGroup'Warfare_Sound_Char.etc.char_die'
    MultiJumpRemaining=1
    MultiJumpBoost=25
    FireRootBone=Bip01 Spine1
    Pistol_FireRifleRapidAnim=Pistol_Burst
    TelegraphPack_PutdownAnim=HeliPack_Putdown
    TelegraphPack_SelectAnim=HeliPack_Select
    DeResTime=6.0
    DeResLiftVel=(Points=// Object reference not set to an instance of an object.
    ,InVal=0.0,OutVal=0.0)
    DeResLiftSoftness=(Points=// Object reference not set to an instance of an object.
    ,InVal=0.0,OutVal=0.30)
    DeResLateralFriction=0.30
    RagdollLifeSpan=13.0
    RagInvInertia=4.0
    RagDeathVel=400.0
    RagShootStrength=14000.0
    RagSpinScale=2.50
    RagDeathUpKick=150.0
    RagGravScale=1.0
    RagImpactSoundInterval=0.50
    RagImpactVolume=2.50
    PlacedCharacterName="Jakob"
    PlacedFemaleCharacterName="Tamika"
    BreathVolume=0.1750
    EquipHitVolume=0.850
    iWarpCount=2
    iStartQSlotIndex=-1
    Hit_Stun=Hit_Stun
    Hit_Stun_Cr=Hit_Crouch_Stun
    Hit_Stun_Pr=Hit_Prone_Stun
    Hit_PS[0]=Hit_PS_F
    Hit_PS[1]=Hit_PS_B
    Hit_PS[2]=Hit_PS_L
    Hit_PS[3]=Hit_PS_R
    Hit_PS_Head=Hit_PS_Head
    Hit_PS_Cr[0]=Hit_PS_CrouchF
    Hit_PS_Cr[1]=Hit_PS_CoruchB
    Hit_PS_Cr[2]=Hit_PS_CrouchL
    Hit_PS_Cr[3]=Hit_PS_CrouchR
    Hit_PS_Pr=Hit_PS_Prone
    Hit_PS_Stun=Hit_PS_Stun
    Hit_PS_Stun_Cr=Hit_PS_Crouch_Stun
    Hit_PS_Stun_Pr=Hit_PS_Prone_Stun
    Hit_FR[0]=Hit_Frag_F
    Hit_FR[1]=Hit_Frag_B
    Hit_FR[2]=Hit_Frag_L
    Hit_FR[3]=Hit_Frag_R
    Hit_FR_Head=Hit_Frag_Head
    Hit_FR_Cr[0]=Hit_Frag_CrouchF
    Hit_FR_Cr[1]=Hit_Frag_CoruchB
    Hit_FR_Cr[2]=Hit_Frag_CrouchL
    Hit_FR_Cr[3]=Hit_Frag_CrouchR
    Hit_FR_Pr=Hit_Frag_Prone
    Hit_FR_Stun=Hit_Frag_Stun
    Hit_FR_Stun_Cr=Hit_FR_Crouch_Stun
    Hit_FR_Stun_Pr=Hit_FR_Prone_Stun
    Hit_RPG[0]=Hit_RPG_F
    Hit_RPG[1]=Hit_RPG_B
    Hit_RPG[2]=Hit_RPG_L
    Hit_RPG[3]=Hit_RPG_R
    Hit_RPG_Head=Hit_RPG_Head
    Hit_RPG_Cr[0]=Hit_RPG_CrouchF
    Hit_RPG_Cr[1]=Hit_RPG_CoruchB
    Hit_RPG_Cr[2]=Hit_RPG_CrouchL
    Hit_RPG_Cr[3]=Hit_RPG_CrouchR
    Hit_RPG_Pr=Hit_RPG_Prone
    Hit_RPG_Stun=Hit_RPG_Stun
    Hit_RPG_Stun_Cr=Hit_RPG_Crouch_Stun
    Hit_RPG_Stun_Pr=Hit_RPG_Prone_Stun
    Meele_Rifle_Fail=Mattack_Rifle_Fail
    Meele_Rifle_Cr_Fail=Mattack_Rifle_Crouch_Fail
    Meele_Rifle_Pr_Fail=Mattack_Rifle_Prone_Fail
    Meele_Knife_Fail=Mattack_Knife_Fail
    Meele_Knife_Cr_Fail=Mattack_Knife_Crouch_Fail
    Meele_Knife_Pr_Fail=Mattack_Knife_Prone_Fail
    Knife_Fire=MAttack_Ka1281
    Knife_Fire_Cr=MAttack_Ka1281_Crouch
    Knife_Fire_Pr=MAttack_Ka1281_Prone
    Rifle_Crouch_BoltLeverAnim=AR_Crouch_BoltLever
    Reload_Rifle_2nd_Anim=AR_Reload2
    Reload_Crouch_Rifle_Anim=AR_Crouch_Reload
    Reload_Crouch_Rifle_2nd_Anim=AR_Crouch_Reload2
    Reload_Prone_Rifle_2nd_Anim=AR_Prone_Reload2
    Pistol_Reload_Rifle_2nd_Anim=Pistol_Reload2
    Pistol_CrouchReload=Pistol_Crouch_Reload
    Pistol_CrouchReload_2nd=Pistol_Crouch_Reload2
    Pistol_ProneReload_2nd=Pistol_Prone_Reload2
    Rpg_Reload_2nd_Anim=RPG_Reload2
    Rpg_CrouchReload=RPG_Crouch_Reload
    Rpg_CrouchReload_2nd=RPG_Crouch_Reload2
    Rpg_ProneReload_2nd=RPG_Prone_Reload2
    Putdown_Crouch_Rifle_Anim=AR_Crouch_Putdown
    PutdownQuick_Crouch_Rifle_Anim=AR_Crouch_Putdown_Quick
    Pistol_CrouchPutdown=Pistol_Crouch_Putdown
    Pistol_CrouchPutdownQuick=Pistol_Crouch_Putdown_Quick
    Frag_CrouchPutdown=Frag_Crouch_Putdown
    Frag_CrouchPutdownQuick=Frag_Crouch_Putdown_Quick
    Rpg_CrouchPutdown=RPG_Crouch_Putdown
    Rpg_CrouchPutdownQuick=RPG_Crouch_Putdown_Quick
    Select_Crouch_Rifle_Anim=AR_Crouch_Select
    SelectNew_Crouch_Rifle_Anim=AR_Crouch_Select_New
    Pistol_CrouchSelect=Pistol_Crouch_Select
    Frag_CrouchSelect=Frag_Crouch_Select
    Rpg_CrouchSelect=RPG_Crouch_Select
    wRequiredEquipment=// Object reference not set to an instance of an object.
    
    VoiceType="wGame.MercMaleVoice"
    bAddToLevelPawnList=true
    ProneHeight=23.0
    ProneRadius=38.0
    bCanWallDodge=true
    bNoCoronas=true
    bScriptPostRender=true
    GroundSpeed=370.0
    WaterSpeed=200.0
    AirSpeed=270.0
    JumpZ=530.0
    SprintSpeed=570.0
    CrouchedSpeed=252.0
    AimedGroundSpeed=122.0
    AimedCrouchedSpeed=83.0
    BaseEyeHeight=65.0
    BaseEyeHeightCroucned=36.0
    BaseEyeHeightProned=13.0
    EyeHeight=38.0
    CrouchHeight=57.50
    CrouchRadius=38.0
    ControllerClass=class'wBot'
    bPhysicsAnimUpdate=true
    bDoTorsoTwist=true
    DodgeSpeedFactor=1.50
    DodgeSpeedZ=210.0
    IdleRifleAnim=AR_Idle
    IdleRestAnim[0]=AR_Idle_Rest
    IdleRestAnim[1]=AR_Idle
    MovementAnims[0]=AR_RunF
    MovementAnims[1]=AR_RunB
    MovementAnims[2]=AR_RunL
    MovementAnims[3]=AR_RunR
    FireRifleRapidAnim=AR_Burst
    FireRifleBurstAnim=AR_Semi
    Rifle_BoltLeverAnim=AR_BoltLever
    Reload_Rifle_Anim=AR_Reload
    Putdown_Rifle_Anim=AR_Putdown
    PutdownQuick_Rifle_Anim=AR_Putdown_Quick
    Select_Rifle_Anim=AR_Select
    SelectNew_Rifle_Anim=AR_Select_New
    SprintAnims[0]=AR_Sprint
    SprintAnims[1]=AR_RunB
    SprintAnims[2]=AR_RunL
    SprintAnims[3]=AR_RunR
    IdleAimAnim=AR_Aim
    AimAnims[0]=AR_AimF
    AimAnims[1]=AR_AimB
    AimAnims[2]=AR_AimL
    AimAnims[3]=AR_AimR
    FireAimRifleRapidAnim=AR_Aim_Burst
    FireAimRifleSemiAnim=AR_Aim_Semi
    TakeoffStillAnim=Jump_Takeoffstill
    AirStillAnim=Jump_AirStill
    TakeoffAnims[0]=JumpF_Takeoff
    TakeoffAnims[1]=JumpB_Takeoff
    TakeoffAnims[2]=JumpL_Takeoff
    TakeoffAnims[3]=JumpR_Takeoff
    AirAnims[0]=JumpF_Mid
    AirAnims[1]=JumpB_Mid
    AirAnims[2]=JumpL_Mid
    AirAnims[3]=JumpR_Mid
    LandAnims[0]=JumpF_Land
    LandAnims[1]=JumpB_Land
    LandAnims[2]=JumpL_Land
    LandAnims[3]=JumpR_Land
    LandAnims[4]=Jump_Land
    Pistol_TakeoffStillAnim=Jump_PS_TakeoffStill
    Pistol_AirStillAnim=Jump_PS_AirStill
    Pistol_TakeoffAnims[0]=JumpF_PS_Takeoff
    Pistol_TakeoffAnims[1]=JumpB_PS_Takeoff
    Pistol_TakeoffAnims[2]=JumpL_PS_Takeoff
    Pistol_TakeoffAnims[3]=JumpR_PS_Takeoff
    Pistol_AirAnims[0]=JumpF_PS_Mid
    Pistol_AirAnims[1]=JumpB_PS_Mid
    Pistol_AirAnims[2]=JumpL_PS_Mid
    Pistol_AirAnims[3]=JumpR_PS_Mid
    Pistol_LandAnims[0]=JumpF_PS_Land
    Pistol_LandAnims[1]=JumpB_PS_Land
    Pistol_LandAnims[2]=JumpL_PS_Land
    Pistol_LandAnims[3]=JumpR_PS_Land
    Pistol_LandAnims[4]=Jump_PS_Land
    Frag_TakeoffStillAnim=Jump_Frag_Takeoffstill
    Frag_AirStillAnim=Jump_Frag_AirStill
    Frag_TakeoffAnims[0]=JumpF_Frag_Takeoff
    Frag_TakeoffAnims[1]=JumpB_Frag_Takeoff
    Frag_TakeoffAnims[2]=JumpL_Frag_Takeoff
    Frag_TakeoffAnims[3]=JumpR_Frag_Takeoff
    Frag_AirAnims[0]=JumpF_Frag_Mid
    Frag_AirAnims[1]=JumpB_Frag_Mid
    Frag_AirAnims[2]=JumpL_Frag_Mid
    Frag_AirAnims[3]=JumpR_Frag_Mid
    Frag_LandAnims[0]=JumpF_Frag_Land
    Frag_LandAnims[1]=JumpB_Frag_Land
    Frag_LandAnims[2]=JumpL_Frag_Land
    Frag_LandAnims[3]=JumpR_Frag_Land
    Frag_LandAnims[4]=Jump_Frag_Land
    Rpg_TakeoffStillAnim=Jump_RPG_Takeoffstill
    Rpg_AirStillAnim=Jump_RPG_AirStill
    Rpg_TakeoffAnims[0]=JumpF_RPG_Takeoff
    Rpg_TakeoffAnims[1]=JumpB_RPG_Takeoff
    Rpg_TakeoffAnims[2]=JumpL_RPG_Takeoff
    Rpg_TakeoffAnims[3]=JumpR_RPG_Takeoff
    Rpg_AirAnims[0]=JumpF_RPG_Mid
    Rpg_AirAnims[1]=JumpB_RPG_Mid
    Rpg_AirAnims[2]=JumpL_RPG_Mid
    Rpg_AirAnims[3]=JumpR_RPG_Mid
    Rpg_LandAnims[0]=JumpF_RPG_Land
    Rpg_LandAnims[1]=JumpB_RPG_Land
    Rpg_LandAnims[2]=JumpL_RPG_Land
    Rpg_LandAnims[3]=JumpR_RPG_Land
    Rpg_LandAnims[4]=Jump_RPG_Land
    IdleCrouchAnim=AR_Crouch
    IdleCrouchRestAnim[0]=AR_Crouch_Rest
    IdleCrouchRestAnim[1]=AR_Crouch
    CrouchAnims[0]=AR_CrouchF
    CrouchAnims[1]=AR_CrouchB
    CrouchAnims[2]=AR_CrouchL
    CrouchAnims[3]=AR_CrouchR
    FireCrouchRifleRapidAnim=AR_Crouch_Burst
    IdleAimCrouchAnim=AR_Crouch
    AimCrouchAnims[0]=AR_Crouch_AimF
    AimCrouchAnims[1]=AR_Crouch_AimB
    AimCrouchAnims[2]=AR_Crouch_AimL
    AimCrouchAnims[3]=AR_Crouch_AimR
    IdleProneAnim=AR_Prone
    ProneAnims[0]=AR_ProneF
    ProneAnims[1]=AR_ProneB
    ProneAnims[2]=AR_ProneL
    ProneAnims[3]=AR_ProneR
    FireProneRifleRapidAnim=AR_Prone_Burst
    Rifle_Prone_BoltLeverAnim=AR_Prone_BoltLever
    Reload_Prone_Rifle_Anim=AR_Prone_Reload
    Putdown_Prone_Rifle_Anim=AR_Prone_Putdown
    PutdownQuick_Prone_Rifle_Anim=AR_Prone_Putdown_Quick
    Select_Prone_Rifle_Anim=AR_Prone_Select
    SelectNew_Prone_Rifle_Anim=AR_Prone_Select_New
    Prone_Standup_Anim=AR_Prone_Up
    Meele_Rifle=MAttack_Rifle
    Meele_Rifle_Cr=MAttack_Rifle_Crouch
    Meele_Rifle_Pr=Mattack_Rifle_Prone
    Meele_Rifle_F=MAttack_RifleF
    Meele_Rifle_Cr_F=MAttack_Rifle_CrouchF
    Meele_Knife=Mattack_Knife
    Meele_Knife_Cr=Mattack_Knife_Crouch
    Meele_Knife_Pr=Mattack_Knife_Prone
    Meele_Knife_F=Mattack_KnifeF
    Meele_Knife_Cr_F=Mattack_Knife_CrouchF
    Meele_Scharge=ShoulderCharge_Stand
    Pistol_IdleRifleAnim=Pistol_Idle
    Pistol_IdleRestAnim[0]=Pistol_Idle_Rest
    Pistol_IdleRestAnim[1]=Pistol_Idle
    Pistol_MovementAnims[0]=Pistol_RunF
    Pistol_MovementAnims[1]=Pistol_RunB
    Pistol_MovementAnims[2]=Pistol_RunL
    Pistol_MovementAnims[3]=Pistol_RunR
    Pistol_FireAimRifleRapidAnim=Pistol_Burst
    Pistol_Reload_Rifle_Anim=Pistol_Reload
    Pistol_Putdown_Rifle_Anim=Pistol_Putdown
    Pistol_PutdownQuick_Rifle_Anim=Pistol_Putdown_Quick
    Pistol_Select_Rifle_Anim=Pistol_Select
    Pistol_SprintAnims[0]=Pistol_Sprint
    Pistol_SprintAnims[1]=Pistol_RunB
    Pistol_SprintAnims[2]=Pistol_RunL
    Pistol_SprintAnims[3]=Pistol_RunR
    Pistol_IdleCrouchAnim=Pistol_Crouch
    Pistol_IdleCrouchRest[0]=Pistol_Crouch_Rest
    Pistol_IdleCrouchRest[1]=Pistol_Crouch
    Pistol_CrouchAnims[0]=Pistol_CrouchF
    Pistol_CrouchAnims[1]=Pistol_CrouchB
    Pistol_CrouchAnims[2]=Pistol_CrouchL
    Pistol_CrouchAnims[3]=Pistol_CrouchR
    Pistol_FireCrouchRifleRapidAnim=Pistol_Crouch_Burst
    Pistol_IdleProne=Pistol_Prone
    Pistol_ProneBurst=Pistol_Prone_Burst
    Pistol_ProneReload=Pistol_Prone_Reload
    Pistol_PronePutdown=Pistol_Prone_Putdown
    Pistol_PronePutdownQuick=Pistol_Prone_Putdown_Quick
    Pistol_ProneSelect=Pistol_Prone_Select
    Frag_Idle_Anim=Frag_Idle
    Frag_Rest_Idle_Anim[0]=Frag_Idle
    Frag_Rest_Idle_Anim[1]=Frag_Idle
    Frag_MovementAnims[0]=Frag_RunF
    Frag_MovementAnims[1]=Frag_RunB
    Frag_MovementAnims[2]=Frag_RunL
    Frag_MovementAnims[3]=Frag_RunR
    Frag_PutDown_Anim=Frag_Putdown
    Frag_PutDownQuick_Anim=Frag_Putdown_Quick
    Frag_Select_Anim=Frag_Select
    Frag_Burst_Anim=Frag_Burst
    Frag_SprintAnims[0]=Frag_Sprint
    Frag_SprintAnims[1]=Frag_RunB
    Frag_SprintAnims[2]=Frag_RunL
    Frag_SprintAnims[3]=Frag_RunR
    Frag_IdleCrouchAnim=Frag_Crouch
    Frag_CrouchMovementAnims[0]=Frag_CrouchF
    Frag_CrouchMovementAnims[1]=Frag_CrouchB
    Frag_CrouchMovementAnims[2]=Frag_CrouchL
    Frag_CrouchMovementAnims[3]=Frag_CrouchR
    Frag_IdleProne=Frag_Prone
    Frag_ProneBurst=Frag_Prone_Burst
    Frag_PronePutdown=Frag_Prone_Putdown
    Frag_PronePutdownQuick=Frag_Prone_Putdown_Quick
    Frag_ProneSelect=Frag_Prone_Select
    Rpg_Idle_Anim=RPG_Idle
    Rpg_Rest_Idle_Anim=RPG_Idle_Rest
    Rpg_MovementAnims[0]=RPG_RunF
    Rpg_MovementAnims[1]=RPG_RunB
    Rpg_MovementAnims[2]=RPG_RunL
    Rpg_MovementAnims[3]=RPG_RunR
    Rpg_Burst_Anim=RPG_Burst
    Rpg_Reload_Anim=RPG_Reload
    Rpg_PutDown_Anim=RPG_Putdown
    Rpg_PutDownQuick_Anim=RPG_Putdown_Quick
    Rpg_Select_Anim=RPG_Select
    Rpg_SprintAnims[0]=RPG_Sprint
    Rpg_SprintAnims[1]=RPG_RunB
    Rpg_SprintAnims[2]=RPG_RunL
    Rpg_SprintAnims[3]=RPG_RunR
    Rpg_Idle_AimAnim=RPG_Aim
    Rpg_AimAnims[0]=RPG_AimF
    Rpg_AimAnims[1]=RPG_AimB
    Rpg_AimAnims[2]=RPG_AimL
    Rpg_AimAnims[3]=RPG_AimR
    Rpg_AimAnims_Cr[0]=RPG_Crouch_AimF
    Rpg_AimAnims_Cr[1]=RPG_Crouch_AimB
    Rpg_AimAnims_Cr[2]=RPG_Crouch_AimL
    Rpg_AimAnims_Cr[3]=RPG_Crouch_AimR
    Rpg_IdleCrouchAnim=RPG_Crouch
    Rpg_IdleCrouchRest=RPG_Crouch_Rest
    Rpg_CrouchMovementAnims[0]=RPG_CrouchF
    Rpg_CrouchMovementAnims[1]=RPG_CrouchB
    Rpg_CrouchMovementAnims[2]=RPG_CrouchL
    Rpg_CrouchMovementAnims[3]=RPG_CrouchR
    Rpg_FireCrouchRifleRapidAnim=RPG_Crouch_Burst
    Rpg_IdleProne=RPG_Prone
    Rpg_ProneBurst=RPG_Prone_Burst
    Rpg_ProneReload=RPG_Prone_Reload
    Rpg_PronePutdown=RPG_Prone_Putdown
    Rpg_PronePutdownQuick=RPG_Prone_Putdown_Quick
    Rpg_ProneSelect=RPG_Prone_Select
    Rpg_Prone_Standup_Anim=RPG_Prone_Up
    TurretIdle=MG_Idle
    TurretIdleUpDown=MG_UpDown
    TurretBurst=MG_Burst
    ShotGun_BoltLeverAnim=AR_Pump
    ShotGun_Reload=AR_Reload3
    ShotGun_Crouch_Pump=AR_Crouch_Pump
    ShotGun_Crouch_Reload3=AR_Crouch_Reload3
    ShotGun_Prone_Pump=AR_Prone_Pump
    ShotGun_Prone_Reload3=AR_Prone_Reload3
    Hit_AR[0]=Hit_F
    Hit_AR[1]=Hit_B
    Hit_AR[2]=Hit_L
    Hit_AR[3]=Hit_R
    Hit_Head=Hit_Head
    Hit_AR_Cr[0]=Hit_CrouchF
    Hit_AR_Cr[1]=Hit_CrouchB
    Hit_AR_Cr[2]=Hit_CrouchL
    Hit_AR_Cr[3]=Hit_CrouchR
    Hit_Pr=Hit_Prone
    Death_F[0]=DeathF
    Death_F[1]=DeathF2
    Death_F[2]=DeathF3
    Death_B[0]=DeathB
    Death_B[1]=DeathB2
    Death_B[2]=DeathB3
    Death_L[0]=DeathL
    Death_L[1]=DeathL2
    Death_L[2]=DeathL3
    Death_R[0]=DeathR
    Death_R[1]=DeathR2
    Death_R[2]=DeathR3
    Death_Head=Death_Head
    Death_Cr_F[0]=Death_CrouchF
    Death_Cr_F[1]=Death_CrouchF2
    Death_Cr_B[0]=Death_CrouchB
    Death_Cr_B[1]=Death_CrouchB2
    Death_Cr_L[0]=Death_CrouchL
    Death_Cr_L[1]=Death_CrouchL2
    Death_Cr_R[0]=Death_CrouchR
    Death_Cr_R[1]=Death_CrouchR2
    Death_Cr_Head=Death_Crouch_Head
    Death_Pr=Death_Prone
    Death_Frag_F=Death_FragF
    Death_Frag_B=Death_FragB
    Death_Frag_L=Death_FragL
    Death_Frag_R=Death_FragR
    Bomb_Plant=DemoPack_Plant
    Bomb_Defuse=DemoPack_Defuse
    Crouch_Bomb_Plant=Demopack_Crouch_Plant
    Crouch_Bomb_Defuse=Demopack_Crouch_Defuse
    Prone_Bomb_Plant=Demopack_Prone_Plant
    Prone_Bomb_Defuse=Demopack_Prone_Defuse
    Bomb_Throw=Throw
    DemoPack_Plant_PutDown_Anim=DemoPack_Plant_PutDown
    DemoPack_Defuse_PutDown_Anim=DemoPack_Defuse_PutDown
    DemoPack_Plant_Crouch_PutDown_Anim=DemoPack_Plant_Crouch_PutDown
    DemoPack_Defuse_Crouch_PutDown_Anim=DemoPack_Defuse_Crouch_PutDown
    DemoPack_Plant_Prone_PutDown_Anim=DemoPack_Plant_Prone_PutDown
    DemoPack_Defuse_Prone_PutDown_Anim=DemoPack_Defuse_Prone_PutDown
    DemoPack_Throw_Anim=DemoPack_Throw
    DemoPack_Throw_Crouch_Anim=DemoPack_Crouch_Throw
    DemoPack_Throw_Prone_Anim=DemoPack_Prone_Throw
    MainRootBone=Main_Dummy
    MainRotateBone=Main_Rotate
    RootBone=Bip01
    HeadBone=Bip01 Head
    SpineBone=Bip01 Spine
    SpineBone1=Bip01 Spine1
    SpineBone2=Bip01 Spine2
    PelvisBone=Bip01 Pelvis
    LightHue=204
    LightSaturation=0
    LightBrightness=255.0
    LightRadius=3.0
    bActorShadows=true
    LODBias=1.80
    PrePivot=(X=0.0,Y=0.0,Z=-5.0)
    AmbientGlow=0
    MaxLights=8
    ScaleGlow=0.30
    CollisionRadius=38.0
    CollisionHeight=74.0
    bUseCylinderCollision=true
    bNetNotify=true
    RotationRate=(Pitch=3072,Yaw=20000,Roll=2048)
    begin object name=PawnKParams class=KarmaParamsSkel
        KConvulseSpacing=(Min=0.50,Max=2.20)
        KLinearDamping=0.150
        KAngularDamping=0.050
        KBuoyancy=1.0
        KStartEnabled=true
        KVelDropBelowThreshold=50.0
        bHighDetailOnly=true
        KFriction=0.60
        KRestitution=0.30
        KImpactThreshold=500.0
    object end
    // Reference: KarmaParamsSkel'wPawn.PawnKParams'
    KParams=PawnKParams
}