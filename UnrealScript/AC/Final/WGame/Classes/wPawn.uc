class wPawn extends UnrealPawn;

const InvenSkillStartIndex = 12;

enum EFireAnimState
{
    FS_None,                        // 0
    FS_PlayOnce,                    // 1
    FS_Looping,                     // 2
    FS_Ready                        // 3
};

enum eSpecialState
{
    SState_Planting,                // 0
    SState_Diffusing                // 1
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
var Class<SpeciesType> Species;
var(Sounds) float GruntVolume;
var(Sounds) float FootstepVolume;
var transient int SimHitFxTicker;
var(Gib) Class<xPawnGibGroup> GibGroupClass;
var(Gib) int GibCountCalf;
var(Gib) int GibCountForearm;
var(Gib) int GibCountHead;
var(Gib) int GibCountTorso;
var(Gib) int GibCountUpperArm;
var float MinTimeBetweenPainSounds;
var localized string HeadShotMessage;
var string SoundFootsteps[30];
var string SoundFootsteps_3rd[30];
var(Sounds) Class<wPawnSoundGroup> SoundGroupClass;
var string sndScream;
var string sndDie;
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
var wSkinShell wParts[4];
var int MyCamouFlageID;
var int MyTeamIdx;
var wSkinShell wGoreParts[5];
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
var bool bProximityFuze;
var float fProximityFuzeTime;
var wPawn ProximityBot;
var Emitter allyEffect;
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
var Class<wFPWeaponAttachment> FPWeaponAttachmentClass;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientResetPhysicsBasedAnim, ClientSkillDeadPlayer, 
        ClientSwitchToLastWeapon, ClientWeaponReset;

    // Pos:0x00D
    reliable if(int(Role) < int(ROLE_Authority))
        ServerCallNoWeaponMessage, ServerQSlotChangeCheck;
}

simulated function PlayTurretIdleAnim(optional bool UpDown)
{
    // End:0x3A
    if(UpDown)
    {
        AnimBlendParams(1, 0.5000000, 0.0000000, 0.0000000, RootBone);
        PlayAnim(TurretIdleUpDown, 1.0000000, 0.1000000, 1);        
    }
    else
    {
        PlayAnim(TurretIdle, 1.0000000, 0.1000000, 0);
    }
    //return;    
}

simulated function SimulatedSetRotation(Rotator R)
{
    SetRotation(R);
    //return;    
}

simulated function ClientWeaponReset()
{
    // End:0x25
    if(wGun(Weapon) != none)
    {
        wGun(Weapon).SetAim(false);
    }
    //return;    
}

simulated function Fire(optional float f)
{
    super(Pawn).Fire(f);
    //return;    
}

simulated function AltFire(optional float f)
{
    super(Pawn).AltFire(f);
    //return;    
}

simulated function PlayWaiting()
{
    //return;    
}

function RosterEntry GetPlacedRoster()
{
    PlayerReplicationInfo.CharacterName = PlacedCharacterName;
    return Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(PlacedCharacterName);
    //return;    
}

function PossessedBy(Controller C)
{
    super(Pawn).PossessedBy(C);
    // End:0x21
    if(Controller != none)
    {
        OldController = Controller;
    }
    //return;    
}

function UnPossessed()
{
    self.ClientWeaponReset();
    super(Pawn).UnPossessed();
    //return;    
}

simulated function bool WasPlayerPawn()
{
    return (OldController != none) && OldController.bIsPlayer;
    //return;    
}

function DoTranslocateOut(Vector PrevLocation)
{
    //return;    
}

simulated function AssignInitialPose()
{
    // End:0x4A
    if(DrivenVehicle != none)
    {
        // End:0x39
        if(HasAnim(DrivenVehicle.DriveAnim))
        {
            LoopAnim(DrivenVehicle.DriveAnim,, 0.1000000);            
        }
        else
        {
            LoopAnim('Vehicle_Driving',, 0.1000000);
        }        
    }
    else
    {
        TweenAnim(MovementAnims[0], 0.0000000);
    }
    AnimBlendParams(1, 1.0000000, 0.2000000, 0.2000000, SpineBone1);
    BoneRefresh();
    //return;    
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
    if(allyEffect != none)
    {
        DetachFromBone(allyEffect);
        allyEffect.Destroy();
        allyEffect = none;
    }
    i = 0;
    J0x47:

    // End:0x9E [Loop If]
    if(i < 4)
    {
        // End:0x94
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x47;
    }
    i = 0;
    J0xA5:

    // End:0xFC [Loop If]
    if(i < 5)
    {
        // End:0xF2
        if(wGoreParts[i] != none)
        {
            DetachFromBone(wGoreParts[i]);
            wGoreParts[i].Destroy();
            wGoreParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0xA5;
    }
    // End:0x11A
    if(FPWeaponAttachment != none)
    {
        FPWeaponAttachment.Destroy();
        FPWeaponAttachment = none;
    }
    super(Pawn).Destroyed();
    //return;    
}

simulated function RemoveFlamingEffects()
{
    local int i;

    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    i = 0;
    J0x22:

    // End:0x90 [Loop If]
    if(i < Attached.Length)
    {
        // End:0x86
        if(Attached[i].IsA('wEmitter') && !Attached[i].IsA('BloodJet'))
        {
            wEmitter(Attached[i]).mRegen = false;
        }
        i++;
        // [Loop Continue]
        goto J0x22;
    }
    //return;    
}

simulated event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    // End:0x18
    if(NewVolume.bWaterVolume)
    {
        RemoveFlamingEffects();
    }
    super(Actor).PhysicsVolumeChange(NewVolume);
    //return;    
}

function float AdjustedStrength()
{
    // End:0x0F
    if(bBerserk)
    {
        return 1.0000000;
    }
    return 0.0000000;
    //return;    
}

function DeactivateSpawnProtection()
{
    // End:0x0B
    if(bSpawnDone)
    {
        return;
    }
    bSpawnDone = true;
    // End:0x88
    if((Level.TimeSeconds - SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
    {
        bSpawnIn = true;
        SpawnTime = (Level.TimeSeconds - DeathMatch(Level.Game).SpawnProtectionTime) - float(1);
    }
    //return;    
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    super(Pawn).PlayTeleportEffect(bOut, bSound);
    //return;    
}

function PlayMoverHitSound()
{
    //return;    
}

function PlayDyingSound()
{
    // End:0x0B
    if(bSkeletized)
    {
        return;
    }
    // End:0x33
    if(bGibbed)
    {
        FmodPlaySound(GibGroupClass.static.GibSound(), 2, 1.0000000, true);
        return;
    }
    // End:0x59
    if(HeadVolume.bWaterVolume)
    {
        FmodPlaySound(GetSound(6), 2,, true);
        return;
    }
    //return;    
}

function Gasp()
{
    // End:0x12
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x33
    if(BreathTime < float(2))
    {
        FmodPlaySound(GetSound(5), 3);        
    }
    else
    {
        FmodPlaySound(GetSound(5), 3);
    }
    //return;    
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
    //return;    
}

simulated function int GetTeamNum()
{
    // End:0x1B
    if(Controller != none)
    {
        return Controller.GetTeamNum();
    }
    // End:0x55
    if((DrivenVehicle != none) && DrivenVehicle.Controller != none)
    {
        return DrivenVehicle.Controller.GetTeamNum();
    }
    // End:0x70
    if(OldController != none)
    {
        return OldController.GetTeamNum();
    }
    // End:0x94
    if((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none)
    {
        return 255;
    }
    return PlayerReplicationInfo.Team.TeamIndex;
    //return;    
}

function TeamInfo GetTeam()
{
    // End:0x1A
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.Team;
    }
    // End:0x53
    if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
    {
        return DrivenVehicle.PlayerReplicationInfo.Team;
    }
    // End:0x8C
    if((OldController != none) && OldController.PlayerReplicationInfo != none)
    {
        return OldController.PlayerReplicationInfo.Team;
    }
    return none;
    //return;    
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
            Controller.Adrenaline = 0.0000000;
        }
    }
    super(Pawn).RemovePowerups();
    //return;    
}

simulated function TickFX(float DeltaTime)
{
    // End:0x35
    if((SimHitFxTicker != HitFxTicker) && Level.GetLocalPlayerController().Pawn != self)
    {
        ProcessHitFX();
    }
    //return;    
}

simulated function TickDamage(float DeltaTime)
{
    // End:0xA0
    if(bBurning && BurningProj != none)
    {
        // End:0xA0
        if((Level.TimeSeconds - fLastBurningTime) >= 1.0000000)
        {
            TakeDamage(BurningProj.BaseParams.iDamage, BurningProj.Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), BurningProj.ResParams,, int(8));
            fLastBurningTime = Level.TimeSeconds;
            BurningProj = none;
        }
    }
    //return;    
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

    // End:0x8C [Loop If]
    if(i < Attached.Length)
    {
        // End:0x82
        if(wProjectile(Attached[i]) != none)
        {
            Attached[i].SetBase(none);
        }
        i++;
        // [Loop Continue]
        goto J0x49;
    }
    PlayTurretIdleAnim(true);
    PlayTurretIdleAnim();
    V.SetEntryViewRotation(Weapon.Rotation);
    //return;    
}

simulated function StopDriving(Vehicle V)
{
    super(Pawn).StopDriving(V);
    // End:0x2E
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = !bInvis;
    }
    // End:0x49
    if(WeaponAttachment != none)
    {
        WeaponAttachment.Hide(false);
    }
    AnimBlendParams(1, 0.0000000, 0.0000000,, FireRootBone);
    ScriptPlayIdle(0);
    V.SetExitViewRotation(self);
    //return;    
}

simulated function AttachEffect(Class<wEmitter> EmitterClass, name BoneName, Vector Location, Rotator Rotation)
{
    local Actor A;
    local int i;

    // End:0x1C
    if(bSkeletized || BoneName == 'None')
    {
        return;
    }
    i = 0;
    J0x23:

    // End:0x72 [Loop If]
    if(i < Attached.Length)
    {
        // End:0x47
        if(Attached[i] == none)
        {
            // [Explicit Continue]
            goto J0x68;
        }
        // End:0x68
        if(Attached[i].AttachmentBone != BoneName)
        {
            // [Explicit Continue]
        }
        J0x68:

        i++;
        // [Loop Continue]
        goto J0x23;
    }
    // End:0x8E
    if(IsInState('Dying'))
    {
        Location.Z -= CollisionHeight;
    }
    A = Spawn(EmitterClass,,, Location, Rotation);
    // End:0xFE
    if(!AttachToBone(A, BoneName))
    {
        Log((("Couldn't attach " $ string(EmitterClass)) $ " to ") $ string(BoneName), 'Error');
        A.Destroy();
        return;
    }
    i = 0;
    J0x105:

    // End:0x137 [Loop If]
    if(i < Attached.Length)
    {
        // End:0x12D
        if(Attached[i] == A)
        {
            // [Explicit Break]
            goto J0x137;
        }
        i++;
        // [Loop Continue]
        goto J0x105;
    }
    J0x137:

    A.SetRelativeRotation(Rotation);
    //return;    
}

simulated event SetHeadScale(float NewScale)
{
    HeadScale = NewScale;
    SetBoneScale(4, HeadScale, 'head');
    //return;    
}

simulated function SpawnGiblet(Class<Gib> GibClass, Vector Location, Rotator Rotation, float GibPerterbation, Vector GibVelocity)
{
    local Gib Giblet;
    local Vector direction, Dummy;

    // End:0x21
    if((GibClass == none) || Level.GetIsNoGore())
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
    GibPerterbation *= 32768.0000000;
    Rotation.Pitch += int(((FRand() * 3.0000000) * GibPerterbation) - GibPerterbation);
    Rotation.Yaw += int(((FRand() * 3.0000000) * GibPerterbation) - GibPerterbation);
    Rotation.Roll += int(((FRand() * 3.0000000) * GibPerterbation) - GibPerterbation);
    GetAxes(Rotation, Dummy, Dummy, direction);
    Giblet.Velocity = GibVelocity * FMin(FRand() + 0.4000000, 1.0000000);
    Giblet.LifeSpan = (Giblet.LifeSpan + (float(2) * FRand())) - float(1);
    //return;    
}

simulated function ProcessHitFX()
{
    local Coords boneCoords;

    // End:0x42
    if(((int(Level.NetMode) == int(NM_DedicatedServer)) || bSkeletized) || Mesh == SkeletonMesh)
    {
        SimHitFxTicker = HitFxTicker;
        return;
    }
    SimHitFxTicker = SimHitFxTicker;
    J0x4D:

    // End:0x1A6 [Loop If]
    if(SimHitFxTicker != HitFxTicker)
    {
        // End:0xD2
        if(((HitFx[SimHitFxTicker].damtype == none) || HitFx[SimHitFxTicker].damtype == Class'Engine.wDamageUnknown') || (Level.bDropDetail && (Level.TimeSeconds - LastRenderTime) > float(3)) && !IsHumanControlled())
        {            
        }
        else
        {
            boneCoords = GetBoneCoords(HitFx[SimHitFxTicker].Bone);
            // End:0x147
            if(!bSkeletized)
            {
                AttachEffect(GetBloodHitClass(byte(HitFx[SimHitFxTicker].iCollisionPart)), HitFx[SimHitFxTicker].Bone, HitFx[SimHitFxTicker].vHitLoc, HitFx[SimHitFxTicker].rotDir);
            }
            // End:0x16C
            if(Level.GetIsNoGore())
            {
                HitFx[SimHitFxTicker].bSever = false;
            }
            // End:0x18B
            if(HitFx[SimHitFxTicker].bSever)
            {
                SpawnGoreGiblet(SimHitFxTicker);
            }
        }
        SimHitFxTicker = int(float(SimHitFxTicker + 1) % float(8));
        // [Loop Continue]
        goto J0x4D;
    }
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(Actor.CollisionPartsType collisionParts)
{
    // End:0x46
    if(int(collisionParts) == int(1))
    {
        // End:0x34
        if(Level.GetIsTeenVersion())
        {
            return GibGroupClass.default.Teen_BloodHitHeadshotClass;            
        }
        else
        {
            return GibGroupClass.default.BloodHitHeadshotClass;
        }        
    }
    else
    {
        // End:0x6A
        if(Level.GetIsTeenVersion())
        {
            return GibGroupClass.default.Teen_BloodHitClass;            
        }
        else
        {
            return GibGroupClass.default.BloodHitClass;
        }
    }
    //return;    
}

simulated function HideBone(name BoneName)
{
    local int BoneScaleSlot;

    // End:0x19
    if(BoneName == 'lthigh')
    {
        BoneScaleSlot = 0;        
    }
    else
    {
        // End:0x32
        if(BoneName == 'rthigh')
        {
            BoneScaleSlot = 1;            
        }
        else
        {
            // End:0x4C
            if(BoneName == 'rfarm')
            {
                BoneScaleSlot = 2;                
            }
            else
            {
                // End:0x66
                if(BoneName == 'lfarm')
                {
                    BoneScaleSlot = 3;                    
                }
                else
                {
                    // End:0x80
                    if(BoneName == 'head')
                    {
                        BoneScaleSlot = 4;                        
                    }
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
    SetBoneScale(BoneScaleSlot, 0.0000000, BoneName);
    //return;    
}

function CalcHitLoc(Vector HitLoc, Vector hitRay, out name BoneName, out float dist)
{
    BoneName = GetClosestBone(HitLoc, hitRay, dist);
    //return;    
}

function DoDamageFX(name BoneName, int Damage, Class<DamageType> DamageType, Rotator R, Vector HitLoc, optional int CollisionPart)
{
    // End:0x158
    if((Damage >= 1) || Health <= 0)
    {
        HitFx[HitFxTicker].damtype = DamageType;
        HitFx[HitFxTicker].iCollisionPart = CollisionPart;
        // End:0x76
        if(((Health - Damage) <= 0) || Health <= 0)
        {
            HitFx[HitFxTicker].bSever = true;
        }
        // End:0xF2
        if((DamageType.default.bNeverSevers || Level.GetIsNoGore()) || (Level.Game != none) && Level.Game.PreventSever(self, BoneName, Damage, DamageType))
        {
            HitFx[HitFxTicker].bSever = false;
        }
        HitFx[HitFxTicker].Bone = BoneName;
        HitFx[HitFxTicker].rotDir = R;
        HitFx[HitFxTicker].vHitLoc = HitLoc;
        HitFxTicker = HitFxTicker + 1;
        // End:0x158
        if(HitFxTicker > (8 - 1))
        {
            HitFxTicker = 0;
        }
    }
    //return;    
}

simulated function StartDeRes()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    Projectors.Remove(0, Projectors.Length);
    bAcceptsProjectors = false;
    // End:0x4C
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = false;
    }
    RemoveFlamingEffects();
    SetOverlayMaterial(none, 0.0000000, true);
    bDeRes = true;
    //return;    
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
    // End:0x39
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        Time *= 0.7500000;
    }
    super(Actor).SetOverlayMaterial(mat, Time, bOverride);
    //return;    
}

simulated function TickDeRes(float DeltaTime)
{
    return;
    // End:0x2C
    if(LifeSpan < 3.0000000)
    {
        AmbientGlow = byte(254.0000000 * (LifeSpan / 3.0000000));
    }
    //return;    
}

simulated function TestVersion_SetParameters()
{
    // End:0x0D
    if(wMyParam == none)
    {
        return;
    }
    // End:0xDF
    if((WeaponAttachment != none) && WeaponAttachment.BaseParams != none)
    {
        GroundSpeed = WeaponAttachment.BaseParams.fRunSpeed;
        SprintSpeed = WeaponAttachment.BaseParams.fSprintSpeed;
        CrouchedSpeed = WeaponAttachment.BaseParams.fCrouchSpeed;
        PronedSpeed = WeaponAttachment.BaseParams.fPronedSpeed;
        AimedGroundSpeed = WeaponAttachment.BaseParams.fAimRunSpeed;
        AimedCrouchedSpeed = WeaponAttachment.BaseParams.fAimCrouchSpeed;        
    }
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
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super(Pawn).Tick(DeltaTime);
    TestVersion_SetParameters();
    // End:0x5C
    if(((Controller != none) && Controller.SkillBase != none) && int(Role) == int(ROLE_Authority))
    {
        Controller.SkillBase.UpdateProcess();
    }
    TickDamage(DeltaTime);
    // End:0xD2
    if(wMyParam != none)
    {
        // End:0xD2
        if(JumpZ != wMyParam.JumpMaxAcc)
        {
            JumpZ += (wMyParam.JumpRecoverRate * DeltaTime);
            // End:0xD2
            if(JumpZ > wMyParam.JumpMaxAcc)
            {
                JumpZ = wMyParam.JumpMaxAcc;
            }
        }
    }
    // End:0xED
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x103
    if(Controller != none)
    {
        OldController = Controller;
    }
    TickFX(DeltaTime);
    // End:0x122
    if(bDeRes)
    {
        TickDeRes(DeltaTime);
    }
    //return;    
}

simulated function TickDamageWithinRadius(float DeltaTime)
{
    // End:0x87
    if(bProximityFuze && ProximityBot != none)
    {
        // End:0x87
        if((Level.TimeSeconds - fProximityFuzeTime) >= 1.0000000)
        {
            TakeDamage(int(ProximityBot.MeleeDamage), ProximityBot, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.wDamageFlameThrower',, int(8));
            fProximityFuzeTime = Level.TimeSeconds;
            ProximityBot = none;
        }
    }
    //return;    
}

function SetProximityFuze(bool bProximity, wPawn aiBot)
{
    // End:0x20
    if((bProximityFuze == bProximity) && ProximityBot != none)
    {
        return;
    }
    bProximityFuze = bProximity;
    ProximityBot = aiBot;
    //return;    
}

simulated function WithinRadius()
{
    local wAIPawn collidingPawn;

    bProximityFuze = false;
    // End:0x2B
    foreach self.VisibleCollidingActors(Class'WGame_Decompressed.wAIPawn', collidingPawn, 500.0000000)
    {
        bProximityFuze = true;        
    }    
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    wPlayer(Level.GetLocalPlayerController()).wPawnCounts++;
    AssignInitialPose();
    // End:0x45
    if(wMyParam == none)
    {
        wMyParam = new Class'Engine.wMyPlayerStatus';
    }
    InitMyParam();
    //return;    
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
    // End:0x2E9
    if(((PlayerController(Controller) != none) && PlayerController(Controller).SkillBase != none) && PlayerController(Controller).SkillBase.bAddStamina)
    {
        wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime * 1.3000000;        
    }
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
    //return;    
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    MultiJumpRemaining = MaxMultiJump;
    bCanDoubleJump = CanMultiJump();
    Level.GetLocalPlayerController().myHUD.ResetHud();
    iBackupTeamNum = GetTeamNum();
    //return;    
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local Vector HitNormal, hitRay;
    local name HitBone;
    local float HitBoneDist;
    local PlayerController PC;
    local bool bShowEffects, bRecentHit;

    bRecentHit = (Level.TimeSeconds - LastPainTime) < 0.5000000;
    super(Pawn).PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x51
    if(Damage <= float(0))
    {
        return;
    }
    PC = PlayerController(Controller);
    bShowEffects = (((int(Level.NetMode) != int(NM_Standalone)) || (Level.TimeSeconds - LastRenderTime) < 2.5000000) || (instigatedBy != none) && PlayerController(instigatedBy.Controller) != none) || PC != none;
    // End:0xE1
    if(!bShowEffects)
    {
        return;
    }
    hitRay = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x13B
    if(instigatedBy != none)
    {
        hitRay = Normal(HitLocation - (instigatedBy.Location + (vect(0.0000000, 0.0000000, 1.0000000) * instigatedBy.EyeHeight)));
    }
    // End:0x160
    if(DamageType.default.bLocationalHit)
    {
        GetBoneNameByCollisionID(CollisionPart, HitBone);        
    }
    else
    {
        HitLocation = Location;
        HitBone = 'None';
        HitBoneDist = 0.0000000;
    }
    // End:0x1B2
    if(DamageType.default.bAlwaysSevers && DamageType.default.bSpecial)
    {
        HitBone = 'head';
    }
    // End:0x1F9
    if(instigatedBy != none)
    {
        HitNormal = Normal((Normal(instigatedBy.Location - HitLocation) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));        
    }
    else
    {
        HitNormal = Normal((vect(0.0000000, 0.0000000, 1.0000000) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));
    }
    // End:0x23A
    if(DamageType.default.bCausesBlood)
    {
    }
    DoDamageFX(HitBone, int(Damage), DamageType, Rotator(HitNormal), HitLocation, CollisionPart);
    //return;    
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int Damage)
{
    // End:0x2D
    if(Weapon != none)
    {
        return Weapon.CheckReflect(HitLocation, RefNormal, Damage);        
    }
    else
    {
        return false;
    }
    //return;    
}

function name GetWeaponBoneFor(Inventory i)
{
    local wWeapon Weapon;

    Weapon = wWeapon(i);
    // End:0x44
    if(none != Weapon)
    {
        switch(Weapon.WeaponType)
        {
            // End:0x36
            case 10:
                return 'DemoPack';
            // End:0x41
            case 18:
                return 'Bone_SentryG01_Axis';
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return 'righthand';
        //return;        
    }
}

function name GetOffhandBoneFor(Inventory i)
{
    return 'bip01 l hand';
    //return;    
}

event PlayLandedSound(int SurfType)
{
    // End:0x0D
    if(Instigator == none)
    {
        return;
    }
    // End:0xB4
    if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
    {
        PlayerController(Controller).FmodClientPlaySound(SoundGroupClass.static.GetLandedSound2D(SurfType),,, 0);
        FmodPlaySound(SoundGroupClass.static.GetLandedSound3d(SurfType), 0, 1.0000000,,,,, true);
        FmodSpecPlaySound(SoundGroupClass.static.GetLandedSound2D(SurfType), 0);
    }
    //return;    
}

event Landed(Vector HitNormal)
{
    super(Pawn).Landed(HitNormal);
    MultiJumpRemaining = MaxMultiJump;
    Velocity *= wMyParam.Land_Dropspeed_Rate;
    //return;    
}

simulated function name GetAnimSequence()
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    return Anim;
    //return;    
}

simulated function PlayDoubleJump()
{
    local name Anim;

    Anim = DoubleJumpAnims[Get4WayDirection()];
    // End:0x2F
    if(PlayAnim(Anim, 1.0000000, 0.1000000))
    {
        bWaitForAnim = true;
    }
    AnimAction = Anim;
    //return;    
}

simulated function bool FindValidTaunt(out name Sequence)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < TauntAnims.Length)
    {
        // End:0x2E
        if(Sequence == TauntAnims[i])
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    j = Class'WGame_Decompressed.SpeciesType'.static.GetOffsetForSequence(Sequence);
    // End:0x71
    if((j < 0) || j >= TauntAnims.Length)
    {
        return false;
    }
    Sequence = TauntAnims[j];
    return Sequence != 'None';
    //return;    
}

simulated event SetAnimAction(name NewAction, optional bool bNoBlendAnim)
{
    local string strAction;
    local float fAnimRate;
    local bool bDemopack;

    // End:0x0D
    if(Mesh == none)
    {
        return;
    }
    strAction = string(NewAction);
    // End:0x73D
    if(!bWaitForAnim)
    {
        AnimAction = NewAction;
        // End:0x73
        if((Weapon != none) && AnimAction == Weapon.SprintAnim)
        {
            Weapon.LoopAnim(NewAction, 0.3000000, 0.3000000);            
        }
        else
        {
            // End:0x124
            if(InStr(strAction, "_Reload") != -1)
            {
                StopFiring();
                // End:0xAD
                if(bCanQuickReload == true)
                {
                    fAnimRate = 1.5000000;                    
                }
                else
                {
                    fAnimRate = 1.0000000;
                }
                AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                PlayAnim(NewAction, fAnimRate, 0.1000000, 1);
                AnimBlendToAlpha(1, 1.0000000, 0.2000000);
                // End:0x119
                if(FPWeaponAttachment != none)
                {
                    FPWeaponAttachment.SetAnimAction(0, bCanQuickReload);
                }
                bReloading = true;                
            }
            else
            {
                // End:0x1C0
                if((InStr(strAction, "_Bolt") != -1) || InStr(strAction, "_Pump") != -1)
                {
                    fAnimRate = 1.0000000;
                    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                    PlayAnim(NewAction, fAnimRate, 0.1000000, 1);
                    AnimBlendToAlpha(1, 1.0000000, 0.1000000);
                    // End:0x1BD
                    if(FPWeaponAttachment != none)
                    {
                        FPWeaponAttachment.SetAnimAction(2, false);
                    }                    
                }
                else
                {
                    // End:0x222
                    if(InStr(strAction, "Hit_") != -1)
                    {
                        // End:0x21F
                        if(!IsAnimating(2))
                        {
                            AnimBlendParams(2, 1.0000000, 0.0000000,, FireRootBone);
                            PlayAnim(AnimAction, 1.0000000, 0.1000000, 2);
                            AnimBlendToAlpha(2, 1.0000000, 0.0000000);
                        }                        
                    }
                    else
                    {
                        // End:0x361
                        if((InStr(strAction, "_Putdown") != -1) || InStr(strAction, "_PutDown") != -1)
                        {
                            // End:0x27E
                            if(InStr(strAction, "DemoPack_") != -1)
                            {
                                bDemopack = true;
                            }
                            // End:0x2A6
                            if((bCanQuickWeaponChange == true) && bDemopack == false)
                            {
                                fAnimRate = 2.0000000;                                
                            }
                            else
                            {
                                fAnimRate = 1.0000000;
                            }
                            AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                            PlayAnim(NewAction, fAnimRate, 0.1000000, 1);
                            AnimBlendToAlpha(1, 1.0000000, 0.2000000);
                            // End:0x35E
                            if(FPWeaponAttachment != none)
                            {
                                // End:0x347
                                if(bDemopack)
                                {
                                    // End:0x332
                                    if(InStr(strAction, "_Plant") == -1)
                                    {
                                        FPWeaponAttachment.SetAnimAction(3, false);                                        
                                    }
                                    else
                                    {
                                        FPWeaponAttachment.SetAnimAction(3, true);
                                    }                                    
                                }
                                else
                                {
                                    FPWeaponAttachment.SetAnimAction(1, bCanQuickWeaponChange);
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x42D
                            if(InStr(strAction, "_Select") != -1)
                            {
                                // End:0x395
                                if(bCanQuickWeaponChange == true)
                                {
                                    fAnimRate = 1.3000000;                                    
                                }
                                else
                                {
                                    fAnimRate = 1.0000000;
                                }
                                // End:0x3EB
                                if(bNoBlendAnim)
                                {
                                    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
                                    PlayAnim(NewAction, fAnimRate, 0.0000000, 1);
                                    AnimBlendToAlpha(1, 1.0000000, 1.0000000);                                    
                                }
                                else
                                {
                                    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                                    PlayAnim(NewAction, fAnimRate, 0.1000000, 1);
                                    AnimBlendToAlpha(1, 1.0000000, 0.2000000);
                                }                                
                            }
                            else
                            {
                                // End:0x4A0
                                if((InStr(strAction, "_Plant") != -1) || InStr(strAction, "_Defuse") != -1)
                                {
                                    AnimBlendParams(1, 1.0000000, 0.0000000,, FireRootBone);
                                    PlayAnim(NewAction, 1.0000000, 0.1000000, 1);
                                    AnimBlendToAlpha(1, 1.0000000, 0.1000000);                                    
                                }
                                else
                                {
                                    // End:0x514
                                    if(((int(Physics) == int(0)) || (Level.Game != none) && Level.Game.IsInState('MatchOver')) && DrivenVehicle == none)
                                    {
                                        PlayAnim(AnimAction,, 0.1000000);
                                        AnimBlendToAlpha(1, 0.0000000, 0.0500000);                                        
                                    }
                                    else
                                    {
                                        // End:0x637
                                        if(((DrivenVehicle != none) || int(Physics) == int(2)) || (int(Physics) == int(1)) && Velocity.Z != float(0))
                                        {
                                            // End:0x5BC
                                            if(CheckTauntValid(AnimAction))
                                            {
                                                // End:0x5B9
                                                if((int(FireState) == int(0)) || int(FireState) == int(3))
                                                {
                                                    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                                                    PlayAnim(NewAction,, 0.1000000, 1);
                                                    FireState = 3;
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x5FC
                                                if((InStr(strAction, "_Idle") == -1) && PlayAnim(AnimAction))
                                                {
                                                    // End:0x5F9
                                                    if(int(Physics) != int(0))
                                                    {
                                                        bWaitForAnim = true;
                                                    }                                                    
                                                }
                                                else
                                                {
                                                    // End:0x629
                                                    if((InStr(strAction, "_Idle") != -1) && AnimAction == (GetAnimSequence()))
                                                    {                                                        
                                                    }
                                                    else
                                                    {
                                                        AnimAction = 'None';
                                                    }
                                                }
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0x692
                                            if(InStr(strAction, "_Throw") != -1)
                                            {
                                                AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                                                PlayAnim(NewAction, 1.0000000, 0.1000000, 1);
                                                AnimBlendToAlpha(1, 1.0000000, 0.2000000);                                                
                                            }
                                            else
                                            {
                                                // End:0x6E9
                                                if(((bIsIdle && !bIsCrouched) && !bIsProned) && Bot(Controller) == none)
                                                {
                                                    PlayAnim(AnimAction,, 0.1000000);
                                                    AnimBlendToAlpha(1, 0.0000000, 0.0500000);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x73D
                                                    if((int(FireState) == int(0)) || int(FireState) == int(3))
                                                    {
                                                        AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
                                                        PlayAnim(NewAction,, 0.1000000, 1);
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
    //return;    
}

simulated function StartFiring(bool bHeavy, bool bRapid)
{
    local name FireAnim, WeaponAnim;
    local bool bFrag, hasBomb;
    local byte byTeamNumber;
    local bool bApplyLowerBody, bApplyWeapon;

    // End:0x12
    if(int(Physics) == int(3))
    {
        return;
    }
    // End:0x20
    if(bIsTurreting == true)
    {
        return;
    }
    // End:0x4D
    if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
    {
        bFrag = true;        
    }
    else
    {
        bFrag = false;
    }
    // End:0x93
    if((bFrag == false) && bIsIdle == false)
    {
        // End:0x93
        if((int(TypeOfWeapon) != int(10)) && int(TypeOfWeapon) != int(19))
        {
            return;
        }
    }
    // End:0xB5
    if(none != Controller)
    {
        byTeamNumber = byte(Controller.GetTeamNum());
    }
    hasBomb = (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byTeamNumber);
    // End:0x246
    if(bIsCrouched == true)
    {
        // End:0x1FC
        if(bIsAiming == false)
        {
            // End:0x14D
            if(int(TypeOfWeapon) == int(17))
            {
                FireAnim = Knife_Fire_Cr;                
            }
            else
            {
                // End:0x167
                if(bFrag == true)
                {
                    FireAnim = Frag_Burst_Anim;                    
                }
                else
                {
                    // End:0x185
                    if(int(TypeOfWeapon) == int(4))
                    {
                        FireAnim = Pistol_FireCrouchRifleRapidAnim;                        
                    }
                    else
                    {
                        // End:0x1A3
                        if(int(TypeOfWeapon) == int(7))
                        {
                            FireAnim = Rpg_FireCrouchRifleRapidAnim;                            
                        }
                        else
                        {
                            // End:0x1EE
                            if(int(TypeOfWeapon) == int(10))
                            {
                                // End:0x1E0
                                if((PlayerReplicationInfo.HasFlag != none) || hasBomb)
                                {
                                    FireAnim = Crouch_Bomb_Plant;                                    
                                }
                                else
                                {
                                    FireAnim = Crouch_Bomb_Defuse;
                                }                                
                            }
                            else
                            {
                                FireAnim = FireCrouchRifleRapidAnim;
                            }
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x21A
            if(int(TypeOfWeapon) == int(4))
            {
                FireAnim = Pistol_FireCrouchRifleRapidAnim;                
            }
            else
            {
                // End:0x238
                if(int(TypeOfWeapon) == int(7))
                {
                    FireAnim = Rpg_FireCrouchRifleRapidAnim;                    
                }
                else
                {
                    FireAnim = FireCrouchRifleRapidAnim;
                }
            }
        }        
    }
    else
    {
        // End:0x31F
        if(bIsProned == true)
        {
            // End:0x270
            if(int(TypeOfWeapon) == int(17))
            {
                FireAnim = Knife_Fire_Pr;                
            }
            else
            {
                // End:0x28A
                if(bFrag == true)
                {
                    FireAnim = Frag_ProneBurst;                    
                }
                else
                {
                    // End:0x2A8
                    if(int(TypeOfWeapon) == int(4))
                    {
                        FireAnim = Pistol_ProneBurst;                        
                    }
                    else
                    {
                        // End:0x2C6
                        if(int(TypeOfWeapon) == int(7))
                        {
                            FireAnim = Rpg_ProneBurst;                            
                        }
                        else
                        {
                            // End:0x311
                            if(int(TypeOfWeapon) == int(10))
                            {
                                // End:0x303
                                if((PlayerReplicationInfo.HasFlag != none) || hasBomb)
                                {
                                    FireAnim = Prone_Bomb_Plant;                                    
                                }
                                else
                                {
                                    FireAnim = Prone_Bomb_Defuse;
                                }                                
                            }
                            else
                            {
                                FireAnim = FireProneRifleRapidAnim;
                            }
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x481
            if(bIsAiming == false)
            {
                // End:0x349
                if(int(TypeOfWeapon) == int(17))
                {
                    FireAnim = Knife_Fire;                    
                }
                else
                {
                    // End:0x363
                    if(bFrag == true)
                    {
                        FireAnim = Frag_Burst_Anim;                        
                    }
                    else
                    {
                        // End:0x381
                        if(int(TypeOfWeapon) == int(4))
                        {
                            FireAnim = Pistol_FireRifleRapidAnim;                            
                        }
                        else
                        {
                            // End:0x39F
                            if(int(TypeOfWeapon) == int(7))
                            {
                                FireAnim = Rpg_Burst_Anim;                                
                            }
                            else
                            {
                                // End:0x3EA
                                if(int(TypeOfWeapon) == int(10))
                                {
                                    // End:0x3DC
                                    if((PlayerReplicationInfo.HasFlag != none) || hasBomb)
                                    {
                                        FireAnim = Bomb_Plant;                                        
                                    }
                                    else
                                    {
                                        FireAnim = Bomb_Defuse;
                                    }                                    
                                }
                                else
                                {
                                    // End:0x473
                                    if(int(TypeOfWeapon) == int(19))
                                    {
                                        FireAnim = SentryGunPack_Plant;
                                        WeaponAnim = SentryGunPack_Weapon_Plant_Anim;
                                        bApplyLowerBody = true;
                                        bApplyWeapon = true;
                                        // End:0x43D
                                        if(FPWeaponAttachment != none)
                                        {
                                            FPWeaponAttachment.SetAnimAction(4, true);
                                        }
                                        FmodPlaySound("Warfare_Sound_Weapon/SP/SentryGun/install", 3);                                        
                                    }
                                    else
                                    {
                                        FireAnim = FireRifleRapidAnim;
                                    }
                                }
                            }
                        }
                    }
                }                
            }
            else
            {
                // End:0x49F
                if(int(TypeOfWeapon) == int(4))
                {
                    FireAnim = Pistol_FireAimRifleRapidAnim;                    
                }
                else
                {
                    // End:0x4BD
                    if(int(TypeOfWeapon) == int(7))
                    {
                        FireAnim = Rpg_Burst_Anim;                        
                    }
                    else
                    {
                        // End:0x546
                        if(int(TypeOfWeapon) == int(19))
                        {
                            FireAnim = SentryGunPack_Plant;
                            WeaponAnim = SentryGunPack_Weapon_Plant_Anim;
                            bApplyLowerBody = true;
                            bApplyWeapon = true;
                            // End:0x510
                            if(FPWeaponAttachment != none)
                            {
                                FPWeaponAttachment.SetAnimAction(4, true);
                            }
                            FmodPlaySound("Warfare_Sound_Weapon/SP/SentryGun/install", 3);                            
                        }
                        else
                        {
                            FireAnim = FireAimRifleRapidAnim;
                        }
                    }
                }
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
    // End:0x5ED
    if(bRapid)
    {
        // End:0x5EA
        if(int(FireState) != int(2))
        {
            LoopAnim(FireAnim,, 0.0000000, 1);
            // End:0x5AC
            if(bApplyLowerBody)
            {
                LoopAnim(FireAnim,, 0.0000000, 0);
            }
            // End:0x5E2
            if(bApplyWeapon)
            {
                WeaponAttachment(Weapon.ThirdPersonActor).LoopWeaponAnim(WeaponAnim, 1.0000000, 0.0000000, 0);
            }
            FireState = 2;
        }        
    }
    else
    {
        PlayAnim(FireAnim,, 0.0000000, 1);
        // End:0x614
        if(bApplyLowerBody)
        {
            PlayAnim(FireAnim,, 0.0000000, 0);
        }
        // End:0x64A
        if(bApplyWeapon)
        {
            WeaponAttachment(Weapon.ThirdPersonActor).PlayWeaponAnim(WeaponAnim, 1.0000000, 0.0000000, 0);
        }
        FireState = 1;
    }
    IdleTime = Level.TimeSeconds;
    //return;    
}

simulated function StopFiring()
{
    local name StopAnim, WeaponAnim;
    local bool bApplyLowerBody, bApplyWeapon;

    // End:0x18
    if(int(FireState) == int(2))
    {
        FireState = 1;
    }
    IdleTime = Level.TimeSeconds;
    // End:0x7F
    if(int(TypeOfWeapon) == int(19))
    {
        StopAnim = SentryGunPack_PlantStop;
        WeaponAnim = SentryGunPack_Weapon_Idle_Anim;
        bApplyLowerBody = true;
        bApplyWeapon = true;
        // End:0x7F
        if(FPWeaponAttachment != none)
        {
            FPWeaponAttachment.SetAnimAction(4, false);
        }
    }
    // End:0x9D
    if('None' != StopAnim)
    {
        PlayAnim(StopAnim,, 0.0000000, 1);
    }
    // End:0xB5
    if(bApplyLowerBody)
    {
        PlayAnim(StopAnim,, 0.0000000, 0);
    }
    // End:0xEB
    if(bApplyWeapon)
    {
        WeaponAttachment(Weapon.ThirdPersonActor).PlayWeaponAnim(WeaponAnim, 1.0000000, 0.0000000, 0);
    }
    //return;    
}

simulated function bool GetIsFiring()
{
    // End:0x24
    if((int(FireState) == int(0)) || int(FireState) == int(3))
    {
        return false;
    }
    return true;
    //return;    
}

simulated event InitialPlayer()
{
    FireState = 0;
    //return;    
}

simulated function ScriptPlayIdle(int Channel)
{
    // End:0x0E
    if(bIsIdle == false)
    {
        return;
    }
    // End:0x7E
    if(bIsCrouched == true)
    {
        // End:0x52
        if(bIsAiming == false)
        {
            // End:0x44
            if(int(TypeOfWeapon) == int(4))
            {
                IdleAnim = Pistol_IdleCrouchAnim;                
            }
            else
            {
                IdleAnim = IdleCrouchAnim;
            }            
        }
        else
        {
            // End:0x70
            if(int(TypeOfWeapon) == int(4))
            {
                IdleAnim = Pistol_IdleCrouchAnim;                
            }
            else
            {
                IdleAnim = IdleAimCrouchAnim;
            }
        }        
    }
    else
    {
        // End:0xB3
        if(bIsProned)
        {
            // End:0xA5
            if(int(TypeOfWeapon) == int(4))
            {
                IdleAnim = Pistol_IdleProne;                
            }
            else
            {
                IdleAnim = IdleProneAnim;
            }            
        }
        else
        {
            // End:0x157
            if(bIsAiming == false)
            {
                // End:0xDD
                if(int(TypeOfWeapon) == int(4))
                {
                    IdleAnim = Pistol_IdleRifleAnim;                    
                }
                else
                {
                    // End:0x10D
                    if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                    {
                        IdleAnim = Frag_Idle_Anim;                        
                    }
                    else
                    {
                        // End:0x12B
                        if(int(TypeOfWeapon) == int(7))
                        {
                            IdleAnim = Rpg_Idle_Anim;                            
                        }
                        else
                        {
                            // End:0x149
                            if(int(TypeOfWeapon) == int(19))
                            {
                                IdleAnim = SentryGunPack_IdleAnim;                                
                            }
                            else
                            {
                                IdleAnim = IdleRifleAnim;
                            }
                        }
                    }
                }                
            }
            else
            {
                // End:0x175
                if(int(TypeOfWeapon) == int(4))
                {
                    IdleAnim = Pistol_IdleRifleAnim;                    
                }
                else
                {
                    // End:0x193
                    if(int(TypeOfWeapon) == int(7))
                    {
                        IdleAnim = Rpg_Idle_Anim;                        
                    }
                    else
                    {
                        IdleAnim = IdleAimAnim;
                    }
                }
            }
        }
    }
    LoopAnim(IdleAnim,, 0.2500000, Channel);
    //return;    
}

simulated event AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local string strAnim;

    // End:0x18E
    if(Channel == 1)
    {
        GetAnimParams(1, Anim, frame, Rate);
        strAnim = string(Anim);
        // End:0x6E
        if(InStr(strAnim, "_Reload") != -1)
        {
            FireState = 0;
            AnimBlendToAlpha(1, 0.0000000, 0.2000000);
            bReloading = false;
            return;            
        }
        else
        {
            // End:0x8E
            if(InStr(strAnim, "_Putdown") != -1)
            {
                return;                
            }
            else
            {
                // End:0xF2
                if(InStr(strAnim, "_Select") != -1)
                {
                    // End:0xDC
                    if(bIsIdle)
                    {
                        GetAnimParams(0, Anim, frame, Rate);
                        // End:0xDC
                        if(Anim != Frag_Burst_Anim)
                        {
                            ForcePlayIdle();
                        }
                    }
                    AnimBlendToAlpha(1, 0.0000000, 0.2000000);
                    return;                    
                }
                else
                {
                    // End:0x122
                    if(InStr(strAnim, "Mattack") != -1)
                    {
                        bMeleeAttacking = false;
                        // End:0x122
                        if(bIsDefencing == true)
                        {
                            return;
                        }
                    }
                }
            }
        }
        // End:0x14E
        if(int(FireState) == int(3))
        {
            AnimBlendToAlpha(1, 0.0000000, 0.1200000);
            FireState = 0;            
        }
        else
        {
            // End:0x17A
            if(int(FireState) == int(1))
            {
                AnimBlendToAlpha(1, 0.0000000, 0.1200000);
                FireState = 3;                
            }
            else
            {
                AnimBlendToAlpha(1, 0.0000000, 0.1200000);
            }
        }        
    }
    else
    {
        // End:0x1F2
        if(Channel == 2)
        {
            GetAnimParams(2, Anim, frame, Rate);
            strAnim = string(Anim);
            // End:0x1EF
            if(InStr(strAnim, "Hit_") != -1)
            {
                AnimBlendParams(2, 0.0000000, 0.0000000,, FireRootBone);
                return;
            }            
        }
        else
        {
            // End:0x1FD
            if(Channel == 0)
            {
            }
        }
    }
    //return;    
}

function PlayWeaponSwitch(wWeapon newWeapon)
{
    local bool bApplyWeapon, bNoBlendAnim;
    local name naWeaponAnim;

    // End:0x24
    if((int(TypeOfWeapon) == int(10)) || int(TypeOfWeapon) == int(12))
    {
        return;
    }
    // End:0x5E
    if(((newWeapon != none) && wKnife(newWeapon).MyOldWeapon != none) && int(TypeOfWeapon) == int(17))
    {
        return;
    }
    bCanJump = true;
    // End:0x14E
    if(bIsProned)
    {
        // End:0x8D
        if(int(TypeOfWeapon) == int(4))
        {
            WeaponSelectAnim = Pistol_ProneSelect;            
        }
        else
        {
            // End:0xBD
            if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
            {
                WeaponSelectAnim = Frag_ProneSelect;                
            }
            else
            {
                // End:0xDB
                if(int(TypeOfWeapon) == int(7))
                {
                    WeaponSelectAnim = Rpg_ProneSelect;                    
                }
                else
                {
                    // End:0x11D
                    if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                    {
                        WeaponSelectAnim = TelegraphPack_SelectAnim;                        
                    }
                    else
                    {
                        // End:0x140
                        if(newWeapon.bCanSelectNew == true)
                        {
                            WeaponSelectAnim = SelectNew_Prone_Rifle_Anim;                            
                        }
                        else
                        {
                            WeaponSelectAnim = Select_Prone_Rifle_Anim;
                        }
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x236
        if(bIsCrouched)
        {
            // End:0x175
            if(int(TypeOfWeapon) == int(4))
            {
                WeaponSelectAnim = Pistol_CrouchSelect;                
            }
            else
            {
                // End:0x1A5
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    WeaponSelectAnim = Frag_CrouchSelect;                    
                }
                else
                {
                    // End:0x1C3
                    if(int(TypeOfWeapon) == int(7))
                    {
                        WeaponSelectAnim = Rpg_CrouchSelect;                        
                    }
                    else
                    {
                        // End:0x205
                        if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                        {
                            WeaponSelectAnim = TelegraphPack_SelectAnim;                            
                        }
                        else
                        {
                            // End:0x228
                            if(newWeapon.bCanSelectNew == true)
                            {
                                WeaponSelectAnim = SelectNew_Crouch_Rifle_Anim;                                
                            }
                            else
                            {
                                WeaponSelectAnim = Select_Crouch_Rifle_Anim;
                            }
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x254
            if(int(TypeOfWeapon) == int(4))
            {
                WeaponSelectAnim = Pistol_Select_Rifle_Anim;                
            }
            else
            {
                // End:0x284
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    WeaponSelectAnim = Frag_Select_Anim;                    
                }
                else
                {
                    // End:0x2A2
                    if(int(TypeOfWeapon) == int(7))
                    {
                        WeaponSelectAnim = Rpg_Select_Anim;                        
                    }
                    else
                    {
                        // End:0x2E4
                        if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                        {
                            WeaponSelectAnim = TelegraphPack_SelectAnim;                            
                        }
                        else
                        {
                            // End:0x36F
                            if(int(TypeOfWeapon) == int(19))
                            {
                                WeaponSelectAnim = SentryGunPack_Select_Anim;
                                naWeaponAnim = SentryGunPack_Weapon_Select_Anim;
                                bApplyWeapon = true;
                                bCanJump = false;
                                bNoBlendAnim = true;
                                SetSprinting(false);
                                Controller.bRun = 0;
                                Controller.bOldRun = 0;
                                Controller.bDClickMove = false;
                                Weapon.SetSprint(false);                                
                            }
                            else
                            {
                                // End:0x392
                                if(newWeapon.bCanSelectNew == true)
                                {
                                    WeaponSelectAnim = SelectNew_Rifle_Anim;                                    
                                }
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
    }
    // End:0x3D3
    if(bApplyWeapon)
    {
        WeaponAttachment(Weapon.ThirdPersonActor).PlayWeaponAnim(naWeaponAnim, 1.0000000, 0.0000000, 0);
    }
    SetAnimAction(WeaponSelectAnim, bNoBlendAnim);
    //return;    
}

function ServerPlayPutdownWeaponAnim(bool bQuick)
{
    local bool hasBomb, bDemopack;
    local name Anim;
    local float frame, Rate;

    // End:0x21D
    if(bIsProned == true)
    {
        // End:0x44
        if(int(TypeOfWeapon) == int(4))
        {
            // End:0x36
            if(bQuick == true)
            {
                WeaponPutDownAnim = Pistol_PronePutdownQuick;                
            }
            else
            {
                WeaponPutDownAnim = Pistol_PronePutdown;
            }            
        }
        else
        {
            // End:0x8E
            if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
            {
                // End:0x80
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Frag_PronePutdownQuick;                    
                }
                else
                {
                    WeaponPutDownAnim = Frag_PronePutdown;
                }                
            }
            else
            {
                // End:0xC6
                if(int(TypeOfWeapon) == int(7))
                {
                    // End:0xB8
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Rpg_PronePutdownQuick;                        
                    }
                    else
                    {
                        WeaponPutDownAnim = Rpg_PronePutdown;
                    }                    
                }
                else
                {
                    // End:0x108
                    if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                    {
                        WeaponPutDownAnim = TelegraphPack_PutdownAnim;                        
                    }
                    else
                    {
                        // End:0x1F5
                        if(int(TypeOfWeapon) == int(10))
                        {
                            hasBomb = (PlayerReplicationInfo.HasFlag != none) && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                            hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                            // End:0x1DF
                            if(hasBomb)
                            {
                                WeaponPutDownAnim = DemoPack_Plant_Prone_PutDown_Anim;                                
                            }
                            else
                            {
                                WeaponPutDownAnim = DemoPack_Defuse_Prone_PutDown_Anim;
                            }
                            bDemopack = true;                            
                        }
                        else
                        {
                            // End:0x20F
                            if(bQuick == true)
                            {
                                WeaponPutDownAnim = PutdownQuick_Prone_Rifle_Anim;                                
                            }
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
    else
    {
        // End:0x43A
        if(bIsCrouched == true)
        {
            // End:0x261
            if(int(TypeOfWeapon) == int(4))
            {
                // End:0x253
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Pistol_CrouchPutdownQuick;                    
                }
                else
                {
                    WeaponPutDownAnim = Pistol_CrouchPutdown;
                }                
            }
            else
            {
                // End:0x2AB
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    // End:0x29D
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Frag_CrouchPutdownQuick;                        
                    }
                    else
                    {
                        WeaponPutDownAnim = Frag_CrouchPutdown;
                    }                    
                }
                else
                {
                    // End:0x2E3
                    if(int(TypeOfWeapon) == int(7))
                    {
                        // End:0x2D5
                        if(bQuick == true)
                        {
                            WeaponPutDownAnim = Rpg_CrouchPutdownQuick;                            
                        }
                        else
                        {
                            WeaponPutDownAnim = Rpg_CrouchPutdown;
                        }                        
                    }
                    else
                    {
                        // End:0x325
                        if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                        {
                            WeaponPutDownAnim = TelegraphPack_PutdownAnim;                            
                        }
                        else
                        {
                            // End:0x412
                            if(int(TypeOfWeapon) == int(10))
                            {
                                hasBomb = (PlayerReplicationInfo.HasFlag != none) && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                                hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                                // End:0x3FC
                                if(hasBomb)
                                {
                                    WeaponPutDownAnim = DemoPack_Plant_PutDown_Anim;                                    
                                }
                                else
                                {
                                    WeaponPutDownAnim = DemoPack_Defuse_PutDown_Anim;
                                }
                                bDemopack = true;                                
                            }
                            else
                            {
                                // End:0x42C
                                if(bQuick == true)
                                {
                                    WeaponPutDownAnim = PutdownQuick_Crouch_Rifle_Anim;                                    
                                }
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
        else
        {
            // End:0x472
            if(int(TypeOfWeapon) == int(4))
            {
                // End:0x464
                if(bQuick == true)
                {
                    WeaponPutDownAnim = Pistol_PutdownQuick_Rifle_Anim;                    
                }
                else
                {
                    WeaponPutDownAnim = Pistol_Putdown_Rifle_Anim;
                }                
            }
            else
            {
                // End:0x4BC
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    // End:0x4AE
                    if(bQuick == true)
                    {
                        WeaponPutDownAnim = Frag_PutDownQuick_Anim;                        
                    }
                    else
                    {
                        WeaponPutDownAnim = Frag_PutDown_Anim;
                    }                    
                }
                else
                {
                    // End:0x4F4
                    if(int(TypeOfWeapon) == int(7))
                    {
                        // End:0x4E6
                        if(bQuick == true)
                        {
                            WeaponPutDownAnim = Rpg_PutDownQuick_Anim;                            
                        }
                        else
                        {
                            WeaponPutDownAnim = Rpg_PutDown_Anim;
                        }                        
                    }
                    else
                    {
                        // End:0x536
                        if(((int(TypeOfWeapon) == int(15)) || int(TypeOfWeapon) == int(16)) || int(TypeOfWeapon) == int(14))
                        {
                            WeaponPutDownAnim = TelegraphPack_PutdownAnim;                            
                        }
                        else
                        {
                            // End:0x623
                            if(int(TypeOfWeapon) == int(10))
                            {
                                hasBomb = (PlayerReplicationInfo.HasFlag != none) && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
                                hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(Controller.GetTeamNum()));
                                // End:0x60D
                                if(hasBomb)
                                {
                                    WeaponPutDownAnim = DemoPack_Plant_PutDown_Anim;                                    
                                }
                                else
                                {
                                    WeaponPutDownAnim = DemoPack_Defuse_PutDown_Anim;
                                }
                                bDemopack = true;                                
                            }
                            else
                            {
                                // End:0x65B
                                if(int(TypeOfWeapon) == int(19))
                                {
                                    // End:0x64D
                                    if(bQuick == true)
                                    {
                                        WeaponPutDownAnim = SentryGunPack_PutDown;                                        
                                    }
                                    else
                                    {
                                        WeaponPutDownAnim = SentryGunPack_PutDown;
                                    }                                    
                                }
                                else
                                {
                                    // End:0x675
                                    if(bQuick == true)
                                    {
                                        WeaponPutDownAnim = PutdownQuick_Rifle_Anim;                                        
                                    }
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
    }
    // End:0x6B0
    if(bDemopack)
    {
        GetAnimParams(1, Anim, frame, Rate);
        // End:0x6B0
        if(Anim == WeaponPutDownAnim)
        {
            return;
        }
    }
    SetAnimAction(WeaponPutDownAnim);
    //return;    
}

function ServerThrowsWeaponAnim(bool bQuick)
{
    local bool hasBomb, bEnableThrowBomb, bDemopack;
    local name Anim;
    local float frame, Rate;

    // End:0xE1
    if(int(TypeOfWeapon) == int(10))
    {
        hasBomb = (PlayerReplicationInfo.HasFlag != none) && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
        bEnableThrowBomb = (hasBomb && !Level.GRI.bMultiBomb) && !Level.GRI.bObjectivePlanted;
        // End:0xD7
        if(bEnableThrowBomb)
        {
            // End:0xB2
            if(bIsProned)
            {
                WeaponPutDownAnim = DemoPack_Throw_Prone_Anim;                
            }
            else
            {
                // End:0xC9
                if(bIsCrouched)
                {
                    WeaponPutDownAnim = DemoPack_Throw_Crouch_Anim;                    
                }
                else
                {
                    WeaponPutDownAnim = DemoPack_Throw_Anim;
                }
            }            
        }
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
    //return;    
}

simulated event CheckProneAni(bool bGoProne)
{
    // End:0x2F
    if((Weapon != none) && Weapon.IsReloading())
    {
        bWaitForAnim = false;
        PlayReload();
        return;
    }
    AnimBlendParams(1, 0.0000000, 0.0000000, 1.0000000, FireRootBone);
    AnimBlendToAlpha(1, 0.0000000, 0.2000000);
    //return;    
}

function PlayVictoryAnimation()
{
    local int tauntNum;

    tauntNum = Rand(TauntAnims.Length - 3);
    SetAnimAction(TauntAnims[3 + tauntNum]);
    //return;    
}

simulated function SetWeaponAttachment(wWeaponAttachment NewAtt)
{
    WeaponAttachment = NewAtt;
    //return;    
}

event KSkelConvulse()
{
    // End:0x1C
    if(RagConvulseMaterial != none)
    {
        SetOverlayMaterial(RagConvulseMaterial, 0.4000000, true);
    }
    //return;    
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand(true);
    RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
    bFixedRotationDir = true;
    bRotateToDesired = false;
    //return;    
}

simulated function PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
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
    // End:0x20E
    if(DamageType != none)
    {
        // End:0x165
        if(DamageType.default.bSkeletize)
        {
            SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 4.0000000, true);
            // End:0x162
            if(!bSkeletized)
            {
                // End:0x12B
                if((int(Level.NetMode) != int(NM_DedicatedServer)) && SkeletonMesh != none)
                {
                    // End:0xE4
                    if(DamageType.default.bLeaveBodyEffect)
                    {
                    }
                    GetAnimParams(0, Seq, frame, Rate);
                    LinkMesh(SkeletonMesh, true);
                    Skins.Length = 0;
                    PlayAnim(Seq, 0.0000000, 0.0000000);
                    SetAnimFrame(frame);
                }
                // End:0x14E
                if(int(Physics) == int(1))
                {
                    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                }
                TearOffMomentum *= 0.2500000;
                bSkeletized = true;
            }            
        }
        else
        {
            // End:0x19F
            if(DamageType.default.DeathOverlayMaterial != none)
            {
                SetOverlayMaterial(DamageType.default.DeathOverlayMaterial, DamageType.default.DeathOverlayTime, true);                
            }
            else
            {
                // End:0x20E
                if(((DamageType.default.DamageOverlayMaterial != none) && int(Level.DetailMode) != int(0)) && !Level.bDropDetail)
                {
                    SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 2.0000000 * DamageType.default.DamageOverlayTime, true);
                }
            }
        }
    }
    AnimBlendParams(1, 0.0000000);
    FireState = 0;
    LifeSpan = RagdollLifeSpan;
    PlayDyingAnimation(DamageType, HitLoc);
    GotoState('Dying');
    //return;    
}

function PlayDyingAnimation(Class<DamageType> DamageType, Vector HitLoc)
{
    local Vector shotDir, hitLocRel, deathAngVel, shotStrength;
    local float maxDim;
    local string RagSkelName;
    local KarmaParamsSkel skelParams;
    local bool PlayersRagdoll;
    local PlayerController PC;

    // End:0x0D
    if(Mesh == none)
    {
        return;
    }
    // End:0x42D
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x41
        if(OldController != none)
        {
            PC = PlayerController(OldController);
        }
        // End:0x6A
        if((PC != none) && PC.ViewTarget == self)
        {
            PlayersRagdoll = true;
        }
        // End:0x84
        if(RagdollOverride != "")
        {
            RagSkelName = RagdollOverride;            
        }
        else
        {
            Log("wPawn.PlayDying: No Species");
        }
        // End:0xC3
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
        // End:0x42D
        if(Level.bLevelPrecached && Level.GetIsUseRagdoll())
        {
            // End:0xFB
            if(RagSkelName != "")
            {
                KMakeRagdollAvailable();
            }
            // End:0x42D
            if(KIsRagdollAvailable() && RagSkelName != "")
            {
                skelParams = KarmaParamsSkel(KParams);
                skelParams.KSkeleton = RagSkelName;
                StopAnimating();
                // End:0x1A6
                if(DamageType != none)
                {
                    // End:0x16C
                    if(DamageType.default.bLeaveBodyEffect)
                    {
                        TearOffMomentum = vect(0.0000000, 0.0000000, 0.0000000);
                    }
                    // End:0x1A6
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
                // End:0x21C
                if(VSize(TearOffMomentum) < 0.0100000)
                {
                    deathAngVel = VRand() * 18000.0000000;                    
                }
                else
                {
                    deathAngVel = RagInvInertia * (hitLocRel Cross shotStrength);
                }
                skelParams.KStartLinVel = TearOffMomentum + Velocity;
                // End:0x2AC
                if((!DamageType.default.bLeaveBodyEffect && !DamageType.default.bRubbery) && Velocity.Z > float(-10))
                {
                    skelParams.KStartLinVel.Z += RagDeathUpKick;
                }
                // End:0x2F0
                if(DamageType.default.bRubbery)
                {
                    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    skelParams.KStartAngVel = vect(0.0000000, 0.0000000, 0.0000000);                    
                }
                else
                {
                    skelParams.KStartAngVel = deathAngVel;
                    maxDim = float(Max(int(CollisionRadius), int(CollisionHeight)));
                    skelParams.KShotStart = TakeHitLocation - (float(1) * shotDir);
                    skelParams.KShotEnd = TakeHitLocation + ((float(2) * maxDim) * shotDir);
                    skelParams.KShotStrength = RagShootStrength;
                }
                // End:0x3BC
                if((DamageType != none) && DamageType.default.bCauseConvulsions)
                {
                    RagConvulseMaterial = DamageType.default.DamageOverlayMaterial;
                    skelParams.bKDoConvulsions = true;
                }
                KSetBlockKarma(true);
                SetPhysics(14);
                // End:0x3E2
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
    // End:0x4A6
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0x4A3
        if(((PC == none) || PC.ViewTarget != self) || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }        
    }
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    // End:0x4D9
    if(int(Physics) != int(14))
    {
        SetPhysics(2);
    }
    //return;    
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
    // End:0x5B
    if((((GibCountTorso + GibCountHead) + GibCountForearm) + GibCountUpperArm) > 3)
    {
        Spawn(GibGroupClass.default.BloodGibClass,,, Location);
    }
    GibCountTorso--;
    //return;    
}

simulated function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
    //return;    
}

function PlayTakeHit(Vector HitLocation, int Damage, Class<DamageType> DamageType)
{
    // End:0x0D
    if(Damage <= 0)
    {
        return;
    }
    PlayDirectionalHit(HitLocation, DamageType.default.UseHitStunAni);
    // End:0x48
    if((Level.TimeSeconds - LastPainSound) < MinTimeBetweenPainSounds)
    {
        return;
    }
    LastPainSound = Level.TimeSeconds;
    // End:0xA7
    if(HeadVolume.bWaterVolume)
    {
        // End:0x95
        if(DamageType.IsA('Drowned'))
        {
            FmodPlaySound(GetSound(6), 2);            
        }
        else
        {
            FmodPlaySound(GetSound(6), 2);
        }
        return;
    }
    //return;    
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    local int numSounds, soundNum;

    numSounds = RagImpactSounds.Length;
    // End:0x59
    if((numSounds > 0) && Level.TimeSeconds > (RagLastSoundTime + RagImpactSoundInterval))
    {
        soundNum = Rand(numSounds);
        RagLastSoundTime = Level.TimeSeconds;
    }
    //return;    
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
    local Vector X, Y, Z, Dir;
    local bool bTmProned, bTmCrouched;

    // End:0x34
    if((bEndProned || bIsProned) || (PlayerReplicationInfo == none) && bWasProned)
    {
        bTmProned = true;
    }
    // End:0x68
    if((bEndCrouched || bIsCrouched) || (PlayerReplicationInfo == none) && bWasCrouched)
    {
        bTmCrouched = true;
    }
    // End:0x84
    if(bTmProned == true)
    {
        PlayAnim(Death_Pr,, 0.0000000);
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    HitLoc.Z = Location.Z;
    // End:0xE5
    if((VSize(Velocity) < 10.0000000) && VSize(Location - HitLoc) < 1.0000000)
    {
        Dir = VRand();        
    }
    else
    {
        // End:0x116
        if(VSize(Velocity) > 0.0000000)
        {
            Dir = Normal(Velocity * vect(1.0000000, 1.0000000, 0.0000000));            
        }
        else
        {
            Dir = -Normal(Location - HitLoc);
        }
    }
    // End:0x193
    if(((Dir Dot X) > 0.7000000) || Dir == vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0x17D
        if(bTmCrouched == true)
        {
            PlayAnim(Death_Cr_B[Rand(2)],, 0.0000000);            
        }
        else
        {
            PlayAnim(Death_B[Rand(3)],, 0.0000000);
        }        
    }
    else
    {
        // End:0x1E1
        if((Dir Dot X) < -0.7000000)
        {
            // End:0x1CB
            if(bTmCrouched == true)
            {
                PlayAnim(Death_Cr_F[Rand(2)],, 0.0000000);                
            }
            else
            {
                PlayAnim(Death_F[Rand(3)],, 0.0000000);
            }            
        }
        else
        {
            // End:0x22D
            if((Dir Dot Y) > float(0))
            {
                // End:0x217
                if(bTmCrouched == true)
                {
                    PlayAnim(Death_Cr_L[Rand(2)],, 0.0000000);                    
                }
                else
                {
                    PlayAnim(Death_L[Rand(3)],, 0.0000000);
                }                
            }
            else
            {
                // End:0x270
                if(HasAnim('DeathR'))
                {
                    // End:0x25A
                    if(bTmCrouched == true)
                    {
                        PlayAnim(Death_Cr_R[Rand(2)],, 0.0000000);                        
                    }
                    else
                    {
                        PlayAnim(Death_R[Rand(3)],, 0.0000000);
                    }                    
                }
                else
                {
                    // End:0x292
                    if(bTmCrouched == true)
                    {
                        PlayAnim(Death_Cr_F[Rand(2)],, 0.0000000);                        
                    }
                    else
                    {
                        PlayAnim(Death_F[Rand(3)],, 0.0000000);
                    }
                }
            }
        }
    }
    AnimBlendParams(1, 0.0000000, 0.0000000, 1.0000000, FireRootBone);
    AnimBlendToAlpha(1, 0.0000000, 0.0000000);
    AnimBlendParams(2, 0.0000000, 0.0000000, 1.0000000, FireRootBone);
    AnimBlendToAlpha(2, 0.0000000, 0.0000000);
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    local Vector X, Y, Z, Dir;
    local name HitAnimName;
    local int iDir;
    local bool bTmProned, bTmCrouched;

    // End:0x1C
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
        // End:0xA0
        if(int(TypeOfWeapon) == int(4))
        {
            // End:0x78
            if(bTmProned == true)
            {
                HitAnimName = Hit_PS_Stun_Pr;                
            }
            else
            {
                // End:0x92
                if(bTmCrouched == true)
                {
                    HitAnimName = Hit_PS_Stun_Cr;                    
                }
                else
                {
                    HitAnimName = Hit_PS_Stun;
                }
            }            
        }
        else
        {
            // End:0x104
            if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
            {
                // End:0xDC
                if(bTmProned == true)
                {
                    HitAnimName = Hit_FR_Stun_Pr;                    
                }
                else
                {
                    // End:0xF6
                    if(bTmCrouched == true)
                    {
                        HitAnimName = Hit_FR_Stun_Cr;                        
                    }
                    else
                    {
                        HitAnimName = Hit_FR_Stun;
                    }
                }                
            }
            else
            {
                // End:0x156
                if(int(TypeOfWeapon) == int(7))
                {
                    // End:0x12E
                    if(bTmProned == true)
                    {
                        HitAnimName = Hit_RPG_Stun_Pr;                        
                    }
                    else
                    {
                        // End:0x148
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_RPG_Stun_Cr;                            
                        }
                        else
                        {
                            HitAnimName = Hit_RPG_Stun;
                        }
                    }                    
                }
                else
                {
                    // End:0x170
                    if(bTmProned == true)
                    {
                        HitAnimName = Hit_Stun_Pr;                        
                    }
                    else
                    {
                        // End:0x18A
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_Stun_Cr;                            
                        }
                        else
                        {
                            HitAnimName = Hit_Stun;
                        }
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x21E
        if(bTmProned == true)
        {
            // End:0x1C2
            if(int(TypeOfWeapon) == int(4))
            {
                HitAnimName = Hit_PS_Pr;                
            }
            else
            {
                // End:0x1F2
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    HitAnimName = Hit_FR_Pr;                    
                }
                else
                {
                    // End:0x210
                    if(int(TypeOfWeapon) == int(7))
                    {
                        HitAnimName = Hit_RPG_Pr;                        
                    }
                    else
                    {
                        HitAnimName = Hit_Pr;
                    }
                }
            }            
        }
        else
        {
            GetAxes(Rotation, X, Y, Z);
            HitLoc.Z = Location.Z;
            // End:0x26C
            if(VSize(Location - HitLoc) < 1.0000000)
            {
                Dir = VRand();                
            }
            else
            {
                Dir = -Normal(Location - HitLoc);
            }
            // End:0x2BB
            if(((Dir Dot X) > 0.7000000) || Dir == vect(0.0000000, 0.0000000, 0.0000000))
            {
                iDir = 0;                
            }
            else
            {
                // End:0x2DB
                if((Dir Dot X) < -0.7000000)
                {
                    iDir = 1;                    
                }
                else
                {
                    // End:0x2FA
                    if((Dir Dot Y) > float(0))
                    {
                        iDir = 3;                        
                    }
                    else
                    {
                        iDir = 2;
                    }
                }
            }
            // End:0x346
            if(int(TypeOfWeapon) == int(4))
            {
                // End:0x332
                if(bTmCrouched == true)
                {
                    HitAnimName = Hit_PS_Cr[iDir];                    
                }
                else
                {
                    HitAnimName = Hit_PS[iDir];
                }                
            }
            else
            {
                // End:0x39C
                if((int(TypeOfWeapon) == int(5)) || int(TypeOfWeapon) == int(17))
                {
                    // End:0x388
                    if(bTmCrouched == true)
                    {
                        HitAnimName = Hit_FR_Cr[iDir];                        
                    }
                    else
                    {
                        HitAnimName = Hit_FR[iDir];
                    }                    
                }
                else
                {
                    // End:0x3E0
                    if(int(TypeOfWeapon) == int(7))
                    {
                        // End:0x3CC
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_RPG_Cr[iDir];                            
                        }
                        else
                        {
                            HitAnimName = Hit_RPG[iDir];
                        }                        
                    }
                    else
                    {
                        // End:0x400
                        if(bTmCrouched == true)
                        {
                            HitAnimName = Hit_AR_Cr[iDir];                            
                        }
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
    else
    {
        // End:0x443
        if(int(Role) == int(ROLE_Authority))
        {
            SetAnimAction(HitAnimName);            
        }
        else
        {
            ServerSetAnimAction(HitAnimName);
        }
    }
    //return;    
}

simulated function PlayBreathSound()
{
    FmodPlaySound(SoundGroupClass.static.GetBreathSound(), 0);
    //return;    
}

simulated function PlayEquipHitSound()
{
    FmodPlaySound(SoundGroupClass.static.GetEquipHitSound(), 0);
    //return;    
}

simulated function FootStepping(int side)
{
    local int SurfaceNum;
    local Actor A;
    local Material FloorMat;
    local Vector HL, HN, Start, End;

    SurfaceNum = 0;
    // End:0x1D
    if(bIsCrouched || bIsProned)
    {
        return;
    }
    // End:0x71
    if(((Base != none) && !Base.IsA('LevelInfo')) && int(Base.SurfaceType) != 0)
    {
        SurfaceNum = int(Base.SurfaceType);        
    }
    else
    {
        Start = Location - (vect(0.0000000, 0.0000000, 1.0000000) * CollisionHeight);
        End = Start - vect(0.0000000, 0.0000000, 16.0000000);
        A = Trace(HL, HN, End, Start, false,, FloorMat);
        // End:0xF4
        if(FloorMat != none)
        {
            SurfaceNum = int(FloorMat.SurfaceType);            
        }
        else
        {
            // End:0x115
            if(A != none)
            {
                SurfaceNum = int(A.SurfaceType);
            }
        }
    }
    // End:0x13A
    if(IsLocalPlayerViewtarget())
    {
        FmodPlaySound(SoundFootsteps[SurfaceNum], 0,,, true,,, false);        
    }
    else
    {
        FmodPlaySound(SoundFootsteps_3rd[SurfaceNum], 0,,, true,,, false);
    }
    //return;    
}

simulated function PlayFootStepLeft()
{
    // End:0x37
    if((bIsAiming == false) && Level.GetLocalPlayerController().ViewTarget != self)
    {
        PlayFootStep(-1);
    }
    //return;    
}

simulated function PlayFootStepRight()
{
    // End:0x33
    if((bIsAiming == false) && Level.GetLocalPlayerController().ViewTarget != self)
    {
        PlayFootStep(1);
    }
    //return;    
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    local bool isWomanVoice;

    // End:0x0D
    if(ActualDamage <= 0)
    {
        return;
    }
    // End:0x36
    if(((sndScream == "") && sndDie == "") || PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0xA0
    if((PlayerReplicationInfo.aiBodyItemID[PlayerReplicationInfo.Team.TeamIndex] > 15499) && PlayerReplicationInfo.aiBodyItemID[PlayerReplicationInfo.Team.TeamIndex] < 16000)
    {
        isWomanVoice = true;
    }
    // End:0x1D7
    if(LeftHealth <= 0)
    {
        // End:0x152
        if(Killer != none)
        {
            // End:0xF2
            if(!isWomanVoice)
            {
                PlayerController(Killer).ClientFmodPlaySoundLocal(sndDie, 0, 1.0000000, false, true, false, -1, false, Location);                
            }
            else
            {
                PlayerController(Killer).ClientFmodPlaySoundLocal("Warfare_Sound_Voice_CH_Female/Sound_Char/etc/char_die", 0, 1.0000000, false, true, false, -1, false, Location);
            }
        }
        // End:0x198
        if(int(byte(CollisionPart)) == int(1))
        {
            FmodPlaySound("Warfare_Sound_Impact/Char/headshot_rand", 0);            
        }
        else
        {
            FmodPlaySound(sndScream, 0);
            FmodPlaySound("Warfare_Sound_Impact/Char/normal_rand", 0);
        }        
    }
    else
    {
        // End:0x47B
        if(DamageType != Class'Engine.fell')
        {
            // End:0x347
            if(Killer != none)
            {
                // End:0x22D
                if(!isWomanVoice)
                {
                    PlayerController(Killer).ClientFmodPlaySoundLocal(sndScream, 0, 1.0000000, false, true, false, -1, false, Location);                    
                }
                else
                {
                    PlayerController(Killer).ClientFmodPlaySoundLocal("Warfare_Sound_Voice_CH_Female/Sound_Char/breath/etc_pain", 0, 1.0000000, false, true, false, -1, false, Location);
                }
                // End:0x2F7
                if(int(byte(CollisionPart)) == int(1))
                {
                    PlayerController(Killer).ClientFmodPlaySoundLocal("Warfare_Sound_Impact/Char/headshot_rand", 0, 1.0000000, false, true, false, -1, false, Location);                    
                }
                else
                {
                    PlayerController(Killer).ClientFmodPlaySoundLocal("Warfare_Sound_Impact/Char/normal_rand", 0, 1.0000000, false, true, false, -1, false, Location);
                }
            }
            // End:0x367
            if(!isWomanVoice)
            {
                FmodPlaySound(sndScream, 0, 1.0000000);                
            }
            else
            {
                FmodPlaySound("Warfare_Sound_Voice_CH_Female/Sound_Char/breath/etc_pain", 0, 1.0000000);
            }
            // End:0x3F4
            if(int(byte(CollisionPart)) == int(1))
            {
                FmodPlaySound("Warfare_Sound_Impact/Char/headshot_rand", 0);                
            }
            else
            {
                FmodPlaySound(sndScream, 0, 1.0000000);
                // End:0x44C
                if(int(byte(CollisionPart)) == int(1))
                {
                    FmodPlaySound("Warfare_Sound_Impact/Char/headshot_rand", 0);                    
                }
                else
                {
                    FmodPlaySound("Warfare_Sound_Impact/Char/normal_rand", 0);
                }
            }
        }
    }
    //return;    
}

function float GetShieldStrengthMax()
{
    return ShieldStrengthMax;
    //return;    
}

function float GetShieldStrength()
{
    return ShieldStrength;
    //return;    
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
    //return;    
}

function bool AddShieldStrength(int ShieldAmount)
{
    local int OldShieldStrength;

    OldShieldStrength = int(ShieldStrength);
    ShieldStrength += float(CanUseShield(ShieldAmount));
    // End:0x51
    if(ShieldAmount == 50)
    {
        SmallShieldStrength = 50.0000000;
        // End:0x51
        if(ShieldStrength < float(50))
        {
            ShieldStrength = 50.0000000;
        }
    }
    return ShieldStrength != float(OldShieldStrength);
    //return;    
}

function bool InCurrentCombo()
{
    return CurrentCombo != none;
    //return;    
}

function DoComboName(string ComboClassName)
{
    //return;    
}

function DoCombo(Class<Combo> ComboClass)
{
    //return;    
}

simulated function bool HasUDamage()
{
    return false;
    //return;    
}

function EnableUDamage(float Amount)
{
    //return;    
}

function DisableUDamage()
{
    //return;    
}

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
    //return;    
}

function ChangedWeapon()
{
    super(Pawn).ChangedWeapon();
    // End:0x167
    if((((PlayerController(Controller) == Level.GetLocalPlayerController()) || Controller.IsA('wAIBot')) && Weapon != none) && Weapon.BaseParams != none)
    {
        wMyParam.SprintSpeed = Weapon.BaseParams.fSprintSpeed;
        wMyParam.RunSpeed = Weapon.BaseParams.fRunSpeed;
        wMyParam.CrouchSpeed = Weapon.BaseParams.fCrouchSpeed;
        wMyParam.PronedSpeed = Weapon.BaseParams.fPronedSpeed;
        wMyParam.AimRunSpeed = Weapon.BaseParams.fAimRunSpeed;
        wMyParam.AimCrouchSpeed = Weapon.BaseParams.fAimCrouchSpeed;
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
    //return;    
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    super(Pawn).ServerChangedWeapon(OldWeapon, newWeapon);
    // End:0x13B
    if((Weapon != none) && Weapon.BaseParams != none)
    {
        wMyParam.SprintSpeed = Weapon.BaseParams.fSprintSpeed;
        wMyParam.RunSpeed = Weapon.BaseParams.fRunSpeed;
        wMyParam.CrouchSpeed = Weapon.BaseParams.fCrouchSpeed;
        wMyParam.PronedSpeed = Weapon.BaseParams.fPronedSpeed;
        wMyParam.AimRunSpeed = Weapon.BaseParams.fAimRunSpeed;
        wMyParam.AimCrouchSpeed = Weapon.BaseParams.fAimCrouchSpeed;
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
    //return;    
}

function SetInvisibility(float Time)
{
    //return;    
}

function Vector BotDodge(Vector Dir)
{
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
    return true;
    //return;    
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
    return true;
    //return;    
}

function DoDoubleJump(bool bUpdating)
{
    //return;    
}

function bool CanDoubleJump()
{
    return false;
    //return;    
}

function bool CanMultiJump()
{
    return false;
    //return;    
}

function bool DoJump(bool bUpdating)
{
    // End:0x74
    if(((!bUpdating && CanDoubleJump()) && Abs(Velocity.Z) < float(100)) && IsLocallyControlled())
    {
        // End:0x5E
        if(PlayerController(Controller) != none)
        {
            PlayerController(Controller).bDoubleJump = true;
        }
        DoDoubleJump(bUpdating);
        MultiJumpRemaining -= 1;
        return true;
    }
    // End:0xC6
    if(super(Pawn).DoJump(bUpdating))
    {
        JumpZ -= wMyParam.JumpReduceRate;
        // End:0xC4
        if(JumpZ < wMyParam.JumpMinAcc)
        {
            JumpZ = wMyParam.JumpMinAcc;
        }
        return true;
    }
    return false;
    //return;    
}

simulated function NotifyTeamChanged()
{
    PostNetReceive();
    //return;    
}

simulated event PostNetReceive()
{
    // End:0x39
    if(PlayerReplicationInfo != none)
    {
        Setup(Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName));
        bNetNotify = false;        
    }
    else
    {
        Log(string(self) $ "wPawn::PostNetReceive() -> PlayerReplication Info is None !!!!");
    }
    //return;    
}

simulated function ClientReStart()
{
    super(Pawn).ClientReStart();
    // End:0x1C
    if(Controller != none)
    {
        OldController = Controller;
    }
    //return;    
}

simulated function bool CheckValidFemaleDefault()
{
    return ((((((PlacedFemaleCharacterName ~= "Tamika") || PlacedFemaleCharacterName ~= "Sapphire") || PlacedFemaleCharacterName ~= "Enigma") || PlacedFemaleCharacterName ~= "Cathode") || PlacedFemaleCharacterName ~= "Rylisa") || PlacedFemaleCharacterName ~= "Ophelia") || PlacedFemaleCharacterName ~= "Zarina";
    //return;    
}

simulated function bool CheckValidMaleDefault()
{
    return ((((((PlacedCharacterName ~= "Jakob") || PlacedCharacterName ~= "Gorge") || PlacedCharacterName ~= "Malcolm") || PlacedCharacterName ~= "Xan") || PlacedCharacterName ~= "Brock") || PlacedCharacterName ~= "Gaargod") || PlacedCharacterName ~= "Axon";
    //return;    
}

simulated function bool ForceDefaultCharacter()
{
    local PlayerController P;

    // End:0x16
    if(!Class'UnrealGame.DeathMatch'.default.bForceDefaultCharacter)
    {
        return false;
    }
    P = Level.GetLocalPlayerController();
    // End:0xD9
    if((P != none) && P.PlayerReplicationInfo != none)
    {
        // End:0xA2
        if(P.PlayerReplicationInfo.bIsFemale)
        {
            PlacedFemaleCharacterName = P.PlayerReplicationInfo.CharacterName;
            // End:0x9F
            if(!CheckValidFemaleDefault())
            {
                PlacedFemaleCharacterName = "Tamika";
                return false;
            }            
        }
        else
        {
            PlacedCharacterName = P.PlayerReplicationInfo.CharacterName;
            // End:0xD9
            if(!CheckValidMaleDefault())
            {
                PlacedCharacterName = "Jakob";
                return false;
            }
        }
    }
    return true;
    //return;    
}

simulated function string GetDefaultCharacter()
{
    // End:0x30
    if(Level.IsDemoBuild())
    {
        PlacedFemaleCharacterName = "Tamika";
        PlacedCharacterName = "Jakob";        
    }
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
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.bIsFemale)
    {
        return PlacedFemaleCharacterName;        
    }
    else
    {
        return PlacedCharacterName;
    }
    //return;    
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
    local int iSideIndex;
    local wPartsGroupParam tmParam;
    local int BodyID, HeadID, FaceID, AcceID, BackPackID, PouChID,
	    CamouflageID;

    local wItemResourceParam resParam;
    local wMatchMaker MatchMaker;

    RagdollOverride = "Char_07";
    MatchMaker = Level.GetMatchMaker();
    // End:0x5D
    if(Class'Engine.wGameSettings'.static.GetModeIndex_Alien() == MatchMaker.kGame_GameMode)
    {
        iSideIndex = PlayerReplicationInfo.SideID;        
    }
    else
    {
        // End:0xC4
        if(Level.GRI.bTeamGame)
        {
            iSideIndex = GetTeamNum();
            // End:0xC1
            if(255 == iSideIndex)
            {
                // End:0xC1
                if(PlayerReplicationInfo.Team != none)
                {
                    iSideIndex = PlayerReplicationInfo.Team.TeamIndex;
                }
            }            
        }
        else
        {
            iSideIndex = PlayerReplicationInfo.SideID;
        }
    }
    // End:0xFC
    if(iSideIndex == 0)
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[0];        
    }
    else
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[1];
    }
    // End:0x189
    if(15000 != BodyID)
    {
        tmParam = Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID);
        FaceID = -1;
        HeadID = -1;
        AcceID = -1;
        BackPackID = -1;
        PouChID = -1;
        CamouflageID = -1;        
    }
    else
    {
        FaceID = PlayerReplicationInfo.iHeadItemID;
        HeadID = PlayerReplicationInfo.iHelmetItemID;
        AcceID = PlayerReplicationInfo.iAccessoryItemID;
        BackPackID = PlayerReplicationInfo.iBackPackItemID;
        PouChID = PlayerReplicationInfo.iPouchItemID;
        CamouflageID = PlayerReplicationInfo.iCamouflageItemID;
    }
    ResetAllParts();
    MyCamouFlageID = PlayerReplicationInfo.iCamouflageItemID;
    MyTeamIdx = PlayerReplicationInfo.Team.TeamIndex;
    // End:0x2A0
    if(!Class'WGame_Decompressed.wPlayerInfo'.static.SetupPawn(self, BodyID, HeadID, AcceID, BackPackID, PouChID, CamouflageID, iSideIndex))
    {
        Log("[Error] class'wPlayerInfo'.static.Setup", 'Error');
    }
    resParam = Level.GameMgr.GetItemResourceParam(BodyID);
    // End:0x2F9
    if(iSideIndex == 0)
    {
        strGoreMeshName = resParam.strRes_3rd_AF_Gore;
        strGoreStaticMeshName = resParam.strRes_3rd_AF_Gore_Static;        
    }
    else
    {
        strGoreMeshName = resParam.strRes_3rd_RSA_Gore;
        strGoreStaticMeshName = resParam.strRes_3rd_RSA_Gore_Static;
    }
    ResetPhysicsBasedAnim();
    AddAllyEffect(iSideIndex);
    //return;    
}

simulated function ResetPhysicsBasedAnim()
{
    bIsIdle = false;
    bWaitForAnim = false;
    //return;    
}

function ClientResetPhysicsBasedAnim()
{
    ResetPhysicsBasedAnim();
    //return;    
}

function string GetSound(wPawnSoundGroup.ESoundType soundType)
{
    return SoundGroupClass.static.GetSound(soundType);
    //return;    
}

function Class<Gib> GetGibClass(xPawnGibGroup.EGibType gibType)
{
    return GibGroupClass.static.GetGibClass(gibType);
    //return;    
}

simulated function DoDerezEffect()
{
    //return;    
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x38
    if(PlayerReplicationInfo != none)
    {
        CalcItemUsedTime(Level.GetMatchMaker().GetUserInfoByUserName(PlayerReplicationInfo.PlayerName));
    }
    // End:0x72
    if((Killer != none) && Killer.IsA('wBotVehicleController'))
    {
        Killer = wBotVehicleController(Killer).Caller;
    }
    // End:0xB1
    if((Controller != none) && Controller.SkillBase != none)
    {
        Controller.SkillBase.DeadPlayer();
        ClientSkillDeadPlayer();
    }
    super(Pawn).Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);
    //return;    
}

simulated function ResetAllParts()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < 4)
    {
        // End:0x54
        if(wParts[i] != none)
        {
            DetachFromBone(wParts[i]);
            wParts[i].Destroy();
            wParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function SetCamouflage(int iItemID, byte byTeam)
{
    local Material mt;
    local wItemResourceParam cResParam;
    local wGameManager GM;
    local string strCamouflage;
    local int BodyID;

    // End:0x15
    if(iItemID <= 0)
    {
        Skins.Length = 0;
        return;
    }
    GM = Level.GameMgr;
    // End:0xF9
    if(int(byTeam) == 0)
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[0];
        cResParam = GM.GetItemResourceParam(BodyID);
        strCamouflage = cResParam.strRes_3rd_AF_Backpack;
        cResParam = GM.GetItemResourceParam(iItemID);
        strCamouflage = strCamouflage $ cResParam.strRes_3rd_AF_Backpack;
        // End:0xF6
        if((cResParam.mesh_Base_3rd == none) && Len(strCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strCamouflage, Class'Engine.Material'));
        }        
    }
    else
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[1];
        cResParam = GM.GetItemResourceParam(BodyID);
        strCamouflage = cResParam.strRes_3rd_RSA_Backpack;
        cResParam = GM.GetItemResourceParam(iItemID);
        strCamouflage = strCamouflage $ cResParam.strRes_3rd_RSA_Backpack;
        // End:0x1B9
        if((cResParam.mesh_Base_3rd_RSA == none) && Len(strCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strCamouflage, Class'Engine.Material'));
        }
    }
    Skins[0] = mt;
    //return;    
}

simulated function Material GetCamouflage(int iItemID, byte byTeam)
{
    local Material mt;
    local wItemResourceParam cResParam;
    local wGameManager GM;
    local int BodyID;
    local string strCamouflage;

    // End:0x0D
    if(iItemID <= 0)
    {
        return none;
    }
    GM = Level.GameMgr;
    // End:0xF1
    if(int(byTeam) == 0)
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[0];
        cResParam = GM.GetItemResourceParam(BodyID);
        strCamouflage = cResParam.strRes_3rd_AF_Backpack;
        cResParam = GM.GetItemResourceParam(iItemID);
        strCamouflage = strCamouflage $ cResParam.strRes_3rd_AF_Backpack;
        // End:0xEE
        if((cResParam.mesh_Base_3rd == none) && Len(strCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strCamouflage, Class'Engine.Material'));
        }        
    }
    else
    {
        BodyID = PlayerReplicationInfo.aiBodyItemID[1];
        cResParam = GM.GetItemResourceParam(BodyID);
        strCamouflage = cResParam.strRes_3rd_RSA_Backpack;
        cResParam = GM.GetItemResourceParam(iItemID);
        strCamouflage = strCamouflage $ cResParam.strRes_3rd_RSA_Backpack;
        // End:0x1B1
        if((cResParam.mesh_Base_3rd_RSA == none) && Len(strCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(strCamouflage, Class'Engine.Material'));
        }
    }
    return mt;
    //return;    
}

simulated function SetParts(Actor.ePlayerParts iPartsIndex, Mesh resMesh, StaticMesh resStaticMesh)
{
    local Vector tmLoc;

    // End:0x12
    if(int(iPartsIndex) > int(3))
    {
        return;
    }
    // End:0x2C
    if((resMesh == none) && resStaticMesh == none)
    {
        return;
    }
    // End:0x75
    if(wParts[int(iPartsIndex)] != none)
    {
        DetachFromBone(wParts[int(iPartsIndex)]);
        wParts[int(iPartsIndex)].Destroy();
        wParts[int(iPartsIndex)] = none;
    }
    // End:0x17B
    if(int(iPartsIndex) != int(1))
    {
        wParts[int(iPartsIndex)] = Spawn(Class'Engine.wSkinShell', self);
        wParts[int(iPartsIndex)].SetDrawType(2);
        wParts[int(iPartsIndex)].LinkMesh(resMesh);
        wParts[int(iPartsIndex)].SetBase(self);
        wParts[int(iPartsIndex)].SetOwner(self);
        tmLoc = wParts[int(iPartsIndex)].Location;
        tmLoc.X += float(20);
        wParts[int(iPartsIndex)].SetLocation(tmLoc);
        // End:0x178
        if(AttachToBone(wParts[int(iPartsIndex)], MainRootBone) == false)
        {
            AttachToBone(wParts[int(iPartsIndex)], 'XXXX_Dummy');
        }        
    }
    else
    {
        wParts[int(iPartsIndex)] = Spawn(Class'Engine.wSkinShell', self);
        wParts[int(iPartsIndex)].SetDrawType(8);
        wParts[int(iPartsIndex)].SetStaticMesh(resStaticMesh);
        wParts[int(iPartsIndex)].SetBase(self);
        wParts[int(iPartsIndex)].SetOwner(self);
        wParts[int(iPartsIndex)].bAnimByOwner = false;
        AttachToBone(wParts[int(iPartsIndex)], 'Acce');
    }
    //return;    
}

event EndProne(float HeightAdjust)
{
    // End:0x27
    if((PlayerReplicationInfo == none) || PlayerReplicationInfo.IsDead)
    {
        bEndProned = true;
    }
    super(Pawn).EndProne(HeightAdjust);
    //return;    
}

event EndCrouch(float HeightAdjust)
{
    // End:0x27
    if((PlayerReplicationInfo == none) || PlayerReplicationInfo.IsDead)
    {
        bEndCrouched = true;
    }
    super(Pawn).EndCrouch(HeightAdjust);
    //return;    
}

simulated function MakeGorePawn(int iPart)
{
    local int i, j;
    local Mesh NewMesh;
    local xPawnGibGroup.EGibType eTemp, eTempAdd;
    local int iTeamNum;
    local name Anim;
    local float frame, Rate;
    local Material mt;

    // End:0x10
    if(iPart == int(0))
    {
        return;
    }
    // End:0x35
    if(self == Level.GetLocalPlayerController().Pawn)
    {
        i = 0;
    }
    i = 0;
    J0x3C:

    // End:0x93 [Loop If]
    if(i < 5)
    {
        // End:0x89
        if(wGoreParts[i] != none)
        {
            DetachFromBone(wGoreParts[i]);
            wGoreParts[i].Destroy();
            wGoreParts[i] = none;
        }
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    eTemp = GetGibParts(iPart);
    eTempAdd = 7;
    // End:0x128
    if(int(eTemp) == int(6))
    {
        switch(byte(iPart))
        {
            // End:0xDD
            case 12:
                eTemp = 0;
                eTempAdd = 2;
                // End:0x128
                break;
            // End:0xF5
            case 13:
                eTemp = 1;
                eTempAdd = 3;
                // End:0x128
                break;
            // End:0x10D
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
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        iTeamNum = GetTeamNum();
        // End:0x14B
        if(iTeamNum == 255)
        {
            iTeamNum = iBackupTeamNum;
        }
        GetAnimParams(0, Anim, frame, Rate);
        NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "Body", Class'Engine.Mesh'));
        // End:0x1C3
        if(NewMesh == none)
        {
            Log("Failed to load player mesh :: Char_B_Gore.Body");
            return;
        }
        LinkMesh(NewMesh);
        PlayDirectionalHit(Location, false, true);
        i = 0;
        // End:0x22E
        if((int(eTemp) == int(0)) || int(eTempAdd) == int(0))
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreLArm", Class'Engine.Mesh'));            
        }
        else
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "LArm", Class'Engine.Mesh'));
        }
        wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
        wGoreParts[i].SetDrawType(2);
        wGoreParts[i].LinkMesh(NewMesh);
        wGoreParts[i].SetBase(self);
        wGoreParts[i].SetOwner(self);
        // End:0x2F1
        if(AttachToBone(wGoreParts[i], MainRootBone) == false)
        {
            AttachToBone(wGoreParts[i], 'XXXX_Dummy');
        }
        i++;
        // End:0x344
        if((int(eTemp) == int(1)) || int(eTempAdd) == int(1))
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreRArm", Class'Engine.Mesh'));            
        }
        else
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "RArm", Class'Engine.Mesh'));
        }
        wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
        wGoreParts[i].SetDrawType(2);
        wGoreParts[i].LinkMesh(NewMesh);
        wGoreParts[i].SetBase(self);
        wGoreParts[i].SetOwner(self);
        // End:0x407
        if(AttachToBone(wGoreParts[i], MainRootBone) == false)
        {
            AttachToBone(wGoreParts[i], 'XXXX_Dummy');
        }
        i++;
        // End:0x45A
        if((int(eTemp) == int(2)) || int(eTempAdd) == int(2))
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreLLeg", Class'Engine.Mesh'));            
        }
        else
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "LLeg", Class'Engine.Mesh'));
        }
        wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
        wGoreParts[i].SetDrawType(2);
        wGoreParts[i].LinkMesh(NewMesh);
        wGoreParts[i].SetBase(self);
        wGoreParts[i].SetOwner(self);
        // End:0x51D
        if(AttachToBone(wGoreParts[i], MainRootBone) == false)
        {
            AttachToBone(wGoreParts[i], 'XXXX_Dummy');
        }
        i++;
        // End:0x570
        if((int(eTemp) == int(3)) || int(eTempAdd) == int(3))
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreRLeg", Class'Engine.Mesh'));            
        }
        else
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "RLeg", Class'Engine.Mesh'));
        }
        wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
        wGoreParts[i].SetDrawType(2);
        wGoreParts[i].LinkMesh(NewMesh);
        wGoreParts[i].SetBase(self);
        wGoreParts[i].SetOwner(self);
        // End:0x633
        if(AttachToBone(wGoreParts[i], MainRootBone) == false)
        {
            AttachToBone(wGoreParts[i], 'XXXX_Dummy');
        }
        i++;
        // End:0x840
        if(int(eTemp) == int(4))
        {
            j = int(0);
            // End:0x695
            if(wParts[j] != none)
            {
                DetachFromBone(wParts[j]);
                wParts[j].Destroy();
                wParts[j] = none;
            }
            j = int(1);
            // End:0x6E0
            if(wParts[j] != none)
            {
                DetachFromBone(wParts[j]);
                wParts[j].Destroy();
                wParts[j] = none;
            }
            j = int(2);
            // End:0x72B
            if(wParts[j] != none)
            {
                DetachFromBone(wParts[j]);
                wParts[j].Destroy();
                wParts[j] = none;
            }
            j = int(3);
            // End:0x776
            if(wParts[j] != none)
            {
                DetachFromBone(wParts[j]);
                wParts[j].Destroy();
                wParts[j] = none;
            }
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "GoreHead", Class'Engine.Mesh'));
            wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x83D
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }            
        }
        else
        {
            NewMesh = Mesh(DynamicLoadObject(strGoreMeshName $ "Head", Class'Engine.Mesh'));
            wGoreParts[i] = Spawn(Class'Engine.wSkinShell', self);
            wGoreParts[i].SetDrawType(2);
            wGoreParts[i].LinkMesh(NewMesh);
            wGoreParts[i].SetBase(self);
            wGoreParts[i].SetOwner(self);
            // End:0x903
            if(AttachToBone(wGoreParts[i], MainRootBone) == false)
            {
                AttachToBone(wGoreParts[i], 'XXXX_Dummy');
            }
        }
        i = 0;
        J0x90A:

        // End:0x978 [Loop If]
        if(i < 5)
        {
            // End:0x96E
            if((i != 4) && MyCamouFlageID > 0)
            {
                mt = GetCamouflage(MyCamouFlageID, byte(MyTeamIdx));
                // End:0x96E
                if(mt != none)
                {
                    wGoreParts[i].Skins[0] = mt;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x90A;
        }
        //return;        
    }
}

simulated function SpawnGoreGiblet(int iIndex)
{
    local Coords boneCoords;
    local float GibPerterbation;
    local xPawnGibGroup.EGibType eTemp;
    local Vector direction, Dummy, GibVelocity;

    boneCoords = GetBoneCoords(HitFx[iIndex].Bone);
    GibPerterbation = HitFx[iIndex].damtype.default.GibPerterbation;
    eTemp = GetGibParts(HitFx[iIndex].iCollisionPart);
    GetAxes(Rotation, Dummy, Dummy, direction);
    // End:0x93
    if(int(eTemp) == int(4))
    {
        GibVelocity = Normal(direction) * float(200);        
    }
    else
    {
        GibVelocity = Velocity + (Normal(direction) * (float(100) + (float(90) * FRand())));
    }
    // End:0x34F
    if(int(eTemp) == int(6))
    {
        // End:0x169
        if(HitFx[iIndex].iCollisionPart == int(12))
        {
            boneCoords = GetBoneCoords('bip01 l upperarm');
            SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
            boneCoords = GetBoneCoords('bip01 l thigh');
            SpawnGiblet(GetGibClass(2), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);            
        }
        else
        {
            // End:0x20B
            if(HitFx[iIndex].iCollisionPart == int(13))
            {
                boneCoords = GetBoneCoords('bip01 r upperarm');
                SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                boneCoords = GetBoneCoords('bip01 r thigh');
                SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);                
            }
            else
            {
                // End:0x2AD
                if(HitFx[iIndex].iCollisionPart == int(14))
                {
                    boneCoords = GetBoneCoords('bip01 l upperarm');
                    SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                    boneCoords = GetBoneCoords('bip01 r upperarm');
                    SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);                    
                }
                else
                {
                    // End:0x34C
                    if(HitFx[iIndex].iCollisionPart == int(15))
                    {
                        boneCoords = GetBoneCoords('bip01 l thigh');
                        SpawnGiblet(GetGibClass(2), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                        boneCoords = GetBoneCoords('bip01 r thigh');
                        SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x394
        if(int(eTemp) != int(7))
        {
            SpawnGiblet(GetGibClass(eTemp), boneCoords.Origin, HitFx[iIndex].rotDir, GibPerterbation, GibVelocity);
        }
    }
    //return;    
}

simulated function xPawnGibGroup.EGibType GetGibParts(int iCollisionPart)
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
        // End:0x6E
        case 13:
        // End:0x73
        case 14:
        // End:0x7E
        case 15:
            return 6;
            // End:0x87
            break;
        // End:0xFFFF
        default:
            return 7;
            break;
    }    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 865
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 718
    // 1 & Type:Switch Position:0x087
    //return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 865
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 718
    // 1 & Type:Switch Position:0x087    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 865
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 718
    // 1 & Type:Switch Position:0x087
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 865
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in D:\ArcticCombat\GitTools\Unreal_Explorer\UE-Explorer\UELib\src\ByteCodeDecompiler.cs:line 740
    // 1 & Type:Switch Position:0x087
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    local int i;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;

    Log("[wPawn::AddDefaultSkills] bQuickslotChange=" $ string(bQuickslotChange));
    kMM = Level.GetMatchMaker();
    // End:0x125
    if(kMM.UserInfos.Length > 0)
    {
        i = 0;
        J0x6A:

        // End:0xDA [Loop If]
        if(i < kMM.UserInfos.Length)
        {
            // End:0xD0
            if(kMM.UserInfos[i].UserName == PlayerReplicationInfo.PlayerName)
            {
                kUser = kMM.UserInfos[i];
                // [Explicit Break]
                goto J0xDA;
            }
            i++;
            // [Loop Continue]
            goto J0x6A;
        }
        J0xDA:

        // End:0x122
        if(kUser != none)
        {
            AddSkillByInventory(kUser);
            SetSelectedQuickSlotSkills(kUser);
            PlayerController(Controller).iBupQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
        }        
    }
    else
    {
        // End:0x16B
        if(Controller.IsA('wPlayer'))
        {
            wPlayer(Controller).AddSkill(40001);
            wPlayer(Controller).AddSkill(40005);
        }
    }
    SkillInit(bQuickslotChange);
    //return;    
}

function AddSkillByInventory(wMatchUserInfo kUser)
{
    local int i, j;
    local wItemBaseParam ItemParam;

    j = 12;
    i = 0;
    J0x0F:

    // End:0x21F [Loop If]
    if(i < kUser.EquippedItems.Length)
    {
        // End:0x100
        if(kUser.EquippedItems[i].SlotPosition == int(13))
        {
            ItemParam = Level.GameMgr.GetItemParam(kUser.EquippedItems[i].ItemID);
            // End:0xFD
            if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) > 0)
            {
                wPlayer(Controller).AddSkill(int(ItemParam.strOptionValue[0]));
                AddedSkillList[j++] = int(ItemParam.strOptionValue[0]);
            }
            // [Explicit Continue]
            goto J0x215;
        }
        // End:0x215
        if((kUser.EquippedItems[i].SlotPosition == int(26)) || kUser.EquippedItems[i].SlotPosition == int(29))
        {
            // End:0x215
            if(Level.GetMatchMaker().IsNewDefenceMode())
            {
                ItemParam = Level.GameMgr.GetItemParam(kUser.EquippedItems[i].ItemID);
                // End:0x215
                if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) > 0)
                {
                    wPlayer(Controller).AddSkill(int(ItemParam.strOptionValue[0]));
                    AddedSkillList[j++] = int(ItemParam.strOptionValue[0]);
                }
            }
        }
        J0x215:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

function AddWeaponFromSkill(BtrDouble iUniqueID, int iaWeaponID)
{
    local sStartWeaponInfo sInfo;

    super(Pawn).AddWeaponFromSkill(iUniqueID, iaWeaponID);
    sInfo.iWeaponID = iaWeaponID;
    sInfo.iPartsID = -1;
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
    //return;    
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
    i = 0;
    J0x1C:

    // End:0x3F [Loop If]
    if(i < 12)
    {
        AddedSkillList[i] = 0;
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    // End:0x11A
    if(PlayerController(Controller).iSelectedQSlotIndex >= 0)
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
        i = 0;
        J0x87:

        // End:0x11A [Loop If]
        if(i < 4)
        {
            // End:0x110
            if(curQSlot.SkillID[i] > 0)
            {
                // End:0xF4
                if((int(kMM.1) == int(kMM.eWeaponLimit)) && (GetSlotPosbySkillID(kUser, curQSlot.SkillID[i])) == int(14))
                {
                    // [Explicit Continue]
                    goto J0x110;
                }
                AddedSkillList[i] = curQSlot.SkillID[i];
            }
            J0x110:

            i++;
            // [Loop Continue]
            goto J0x87;
        }
    }
    j = 4;
    i = 0;
    J0x129:

    // End:0x3E7 [Loop If]
    if(i < arStartWeaponInfo.Length)
    {
        iSightPartID = arStartWeaponInfo[i].iPartsID & 1023;
        iBarrelPartID = arStartWeaponInfo[i].iPartsID & 130048;
        iSilencerPartID = arStartWeaponInfo[i].iPartsID & 16646144;
        iGunstockPartID = arStartWeaponInfo[i].iPartsID & 2130706432;
        wcpp = none;
        // End:0x236
        if(iSightPartID > 1)
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
            // End:0x236
            if(((wcpp.iItemID > 0) && wcpp.iSkillID > 0) && j < 12)
            {
                AddedSkillList[j++] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x2C3
        if(iBarrelPartID > (1 << 10))
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
            // End:0x2C3
            if(((wcpp.iItemID > 0) && wcpp.iSkillID > 0) && j < 12)
            {
                AddedSkillList[j++] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x350
        if(iSilencerPartID > (1 << 17))
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
            // End:0x350
            if(((wcpp.iItemID > 0) && wcpp.iSkillID > 0) && j < 12)
            {
                AddedSkillList[j++] = wcpp.iSkillID;
            }
        }
        wcpp = none;
        // End:0x3DD
        if(iGunstockPartID > (1 << 24))
        {
            wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
            // End:0x3DD
            if(((wcpp.iItemID > 0) && wcpp.iSkillID > 0) && j < 12)
            {
                AddedSkillList[j++] = wcpp.iSkillID;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x129;
    }
    SkillBase = wPlayer(Controller).SkillBase;
    i = 0;
    J0x407:

    // End:0x4BD [Loop If]
    if(i < SkillBase.Skills.Length)
    {
        bFind = false;
        j = 0;
        J0x42F:

        // End:0x47D [Loop If]
        if(j < 22)
        {
            // End:0x473
            if(SkillBase.Skills[i].SkillID == AddedSkillList[j])
            {
                bFind = true;
                // [Explicit Break]
                goto J0x47D;
            }
            j++;
            // [Loop Continue]
            goto J0x42F;
        }
        J0x47D:

        // End:0x4B3
        if(bFind == false)
        {
            remList[remList.Length] = SkillBase.Skills[i].SkillID;
        }
        i++;
        // [Loop Continue]
        goto J0x407;
    }
    i = 0;
    J0x4C4:

    // End:0x4FD [Loop If]
    if(i < remList.Length)
    {
        wPlayer(Controller).RemoveSkill(remList[i]);
        i++;
        // [Loop Continue]
        goto J0x4C4;
    }
    i = 0;
    J0x504:

    // End:0x539 [Loop If]
    if(i < 12)
    {
        wPlayer(Controller).AddSkill(AddedSkillList[i]);
        i++;
        // [Loop Continue]
        goto J0x504;
    }
    i = 0;
    J0x540:

    // End:0x5B1 [Loop If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0x5A7
        if(int(kUser.EquippedSkills[i].byModeItem) != 0)
        {
            wPlayer(Controller).AddSkill(kUser.EquippedSkills[i].SkillID);
        }
        i++;
        // [Loop Continue]
        goto J0x540;
    }
    // End:0x5ED
    if(wPlayer(Controller).myHUD != none)
    {
        wPlayer(Controller).myHUD.CallEvent(, 777);
    }
    //return;    
}

function AddBaseInvenSkill(wMatchUserInfo kUser, int iPos)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7D [Loop If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0x73
        if(kUser.EquippedSkills[i].SlotPosition == iPos)
        {
            wPlayer(Controller).AddSkill(kUser.EquippedSkills[i].SkillID);
            // [Explicit Break]
            goto J0x7D;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x7D:

    //return;    
}

function int GetSlotPosbySkillID(wMatchUserInfo kUser, int iSkillID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < kUser.EquippedSkills.Length)
    {
        // End:0x5D
        if(kUser.EquippedSkills[i].SkillID == iSkillID)
        {
            return kUser.EquippedSkills[i].SlotPosition;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function ChangeInventoryByQSlot()
{
    local Inventory tmInv, tmDel, tmStart;

    tmInv = Inventory;
    J0x0B:

    // End:0xA1 [Loop If]
    if(tmInv != none)
    {
        // End:0x73
        if((int(tmInv.InventoryGroup) == 5) || int(tmInv.InventoryGroup) == 6)
        {
            // End:0x5C
            if(tmStart == none)
            {
                tmStart = tmInv;
            }
            tmInv = tmInv.Inventory;            
        }
        else
        {
            tmDel = tmInv;
            tmInv = tmInv.Inventory;
            tmDel.Destroy();
        }
        // [Loop Continue]
        goto J0x0B;
    }
    Inventory = tmStart;
    // End:0xE2
    if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
    {
        AddDefaultInventoryDOA(true);        
    }
    else
    {
        AddDefaultInventory(true);
    }
    AddDefaultSkills(true);
    //return;    
}

function RemoveAllInventory()
{
    J0x00:
    // End:0x1A [Loop If]
    if(Inventory != none)
    {
        Inventory.Destroy();
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}

function RemoveInventoryByDamageType(Actor.eWeaponType removeWeaponType)
{
    local Inventory Inv;
    local wWeapon InvWeapon;

    Inv = Inventory;
    J0x0B:

    // End:0x72 [Loop If]
    if(Inv != none)
    {
        InvWeapon = wWeapon(Inv);
        // End:0x5B
        if((InvWeapon != none) && int(InvWeapon.WeaponType) == int(removeWeaponType))
        {
            Inv.Destroy();
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    local int i, PlayerID, PartsID;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local sStartWeaponInfo sInfo;
    local wWeapon W;

    kMM = Level.GetMatchMaker();
    // End:0x2A6
    if(kMM.UserInfos.Length > 0)
    {
        // End:0xA2
        if(false == IsA('wSentryGunPawn'))
        {
            kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
            Log("[wPawn::AddDefaultInventory] name=" $ PlayerReplicationInfo.PlayerName);
            CalcItemUsedTime(kUser);
            RemoveAllInventory();
        }
        // End:0x142
        if((false == IsA('wSentryGunPawn')) && kUser.EquippedQSlots.Length > 0)
        {
            arStartWeaponInfo.Length = 0;
            // End:0x10F
            if(Controller.IsA('PlayerController') && PlayerController(Controller).iSelectedQSlotIndex >= 0)
            {
                SetSelectedQuickSlotInventory(kUser, bQuickslotChange);
            }
            // End:0x13F
            if(bQuickslotChange == false)
            {
                CheckWeaponBySubGameMode(kUser);
                iStartQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
            }            
        }
        else
        {
            // End:0x1DD
            if(IsA('wBotVehicle') || IsA('wAIPawn'))
            {
                i = 0;
                J0x161:

                // End:0x1DA [Loop If]
                if(i < wRequiredEquipment.Length)
                {
                    // End:0x188
                    if(wRequiredEquipment[i] == 0)
                    {
                        // [Explicit Break]
                        goto J0x1DA;
                        // [Explicit Continue]
                        goto J0x1D0;
                    }
                    // End:0x1AC
                    if(i < wRequiredParts.Length)
                    {
                        PartsID = wRequiredParts[i];                        
                    }
                    else
                    {
                        PartsID = 0;
                    }
                    AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], PartsID, false);
                    J0x1D0:

                    i++;
                    // [Loop Continue]
                    goto J0x161;
                }
                J0x1DA:
                
            }
            else
            {
                AddWeapon(EmptyBtrDouble(), 2000, 1001, false);
                AddWeapon(EmptyBtrDouble(), 1010, 31, false);
                AddWeapon(EmptyBtrDouble(), 6000, 0, false);
            }
        }
        // End:0x2A3
        if(false == IsA('wBotVehicle'))
        {
            // End:0x2A3
            if((Level.GRI.GameClass == "WMission.wSDGameInfo") || Level.GRI.GameClass == "WMission.wSBTGameInfo")
            {
                AddWeapon(EmptyBtrDouble(), 7002, 0, false);
            }
        }        
    }
    else
    {
        Log("##LEEKSLOG [wPawn::AddDefaultInventory] - kMM.UserInfos.Length <= 0 ");
        i = 0;
        J0x2F5:

        // End:0x33F [Loop If]
        if(i < wRequiredEquipment.Length)
        {
            // End:0x31C
            if(wRequiredEquipment[i] == 0)
            {
                // [Explicit Break]
                goto J0x33F;
                // [Explicit Continue]
                goto J0x335;
            }
            AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], 0, false);
            J0x335:

            i++;
            // [Loop Continue]
            goto J0x2F5;
        }
    }
    J0x33F:

    PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    super.AddDefaultInventory();
    W = GetWeaponByInvenGroup(1);
    W.ReSetMeleeFireAnim_Server(GetWeaponByInvenGroup(3).BaseParams.iWeaponID);
    // End:0x3CF
    if(Level.GetMatchMaker().BotTutorial)
    {
        SetInfiniteAmmoTutorial(true);
    }
    //return;    
}

function SetPistolInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
    WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
    // End:0x71
    if(int(WBP.eType) != int(4))
    {
        return;
    }
    AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
    sInfo.iWeaponID = curQSlot.ItemID[i];
    sInfo.iPartsID = curQSlot.PartsID[i];
    sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemOnUse[i] = 1;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemUsedCount[i]++;
    //return;    
}

function SetShotGunlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
    WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
    AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
    sInfo.iWeaponID = curQSlot.ItemID[i];
    sInfo.iPartsID = curQSlot.PartsID[i];
    sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemOnUse[i] = 1;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemUsedCount[i]++;
    //return;    
}

function SetMGlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID;

    curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
    AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
    sInfo.iWeaponID = curQSlot.ItemID[i];
    sInfo.iPartsID = curQSlot.PartsID[i];
    sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemOnUse[i] = 1;
    kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemUsedCount[i]++;
    //return;    
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
    else
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
        WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
        // End:0xE5
        if(int(WBP.eType) == int(4))
        {
            return;
        }
        AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
        sInfo.iWeaponID = curQSlot.ItemID[i];
        sInfo.iPartsID = curQSlot.PartsID[i];
        sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemOnUse[i] = 1;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemUsedCount[i]++;
    }
    //return;    
}

function SetGrenadlInvenByWeaponLimited(int i, wMatchMaker kMM, wMatchUserInfo kUser, bool IsQuick)
{
    local sStartWeaponInfo sInfo;
    local EquippedQSlotInfo curQSlot;
    local wWeaponBaseParams WBP;
    local int iItemID, k;

    // End:0x7C
    if(i == 0)
    {
        AddWeapon(EmptyBtrDouble(), 6203, 0, false);
        sInfo.iWeaponID = 6203;
        sInfo.iPartsID = 0;
        sInfo.iUniqueID = EmptyBtrDouble();
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.SetItemUse(i);
        SetInfiniteAmmo(9);        
    }
    else
    {
        curQSlot = kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex];
        WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
        // End:0xED
        if(int(WBP.eType) != int(17))
        {
            return;
        }
        AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
        sInfo.iWeaponID = curQSlot.ItemID[i];
        sInfo.iPartsID = curQSlot.PartsID[i];
        sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemOnUse[i] = 1;
        kUser.EquippedQSlots[PlayerController(Controller).iSelectedQSlotIndex].ItemUsedCount[i]++;
    }
    //return;    
}

function AddDefaultInventoryDOA(optional bool bQuickslotChange)
{
    local int i, PlayerID;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local sStartWeaponInfo sInfo;

    kMM = Level.GetMatchMaker();
    // End:0xB5
    if(kMM.UserInfos.Length > 0)
    {
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        RemoveAllInventory();
        Log("[wPawn::AddDefaultInventoryDOA] name=" $ PlayerReplicationInfo.PlayerName);
        AddWeapon(EmptyBtrDouble(), 9002, 0, false);
        AddWeapon(EmptyBtrDouble(), 9000, 0, false);        
    }
    else
    {
        i = 0;
        J0xBC:

        // End:0x106 [Loop If]
        if(i < wRequiredEquipment.Length)
        {
            // End:0xE3
            if(wRequiredEquipment[i] == 0)
            {
                // [Explicit Break]
                goto J0x106;
                // [Explicit Continue]
                goto J0xFC;
            }
            AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], 0, false);
            J0xFC:

            i++;
            // [Loop Continue]
            goto J0xBC;
        }
    }
    J0x106:

    PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    AddDefaultInventory();
    //return;    
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
    J0x5B:

    // End:0x23B [Loop If]
    if(i < kUser.EquippedQSlots.Length)
    {
        // End:0x231
        if(kUser.EquippedQSlots[i].ItemID[0] != 0)
        {
            iItemID = kUser.EquippedQSlots[i].ItemID[0];
            WBP = Level.WeaponMgr.GetBaseParam(iItemID);
            // End:0x12F
            if(int(kMM.eWeaponLimit) == int(kMM.5))
            {
                // End:0x12F
                if(int(WBP.eType) == int(2))
                {
                    PlayerController(Controller).SelectQuickSlot(i);
                    return true;
                }
            }
            // End:0x185
            if(int(kMM.eWeaponLimit) == int(kMM.6))
            {
                // End:0x185
                if(int(WBP.eType) != int(2))
                {
                    PlayerController(Controller).SelectQuickSlot(i);
                    return true;
                }
            }
            // End:0x1DB
            if(int(kMM.eWeaponLimit) == int(kMM.8))
            {
                // End:0x1DB
                if(int(WBP.eType) == int(6))
                {
                    PlayerController(Controller).SelectQuickSlot(i);
                    return true;
                }
            }
            // End:0x231
            if(int(kMM.eWeaponLimit) == int(kMM.9))
            {
                // End:0x231
                if(int(WBP.eType) == int(9))
                {
                    PlayerController(Controller).SelectQuickSlot(i);
                    return true;
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    return true;
    //return;    
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

    // End:0x1CD [Loop If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0x1B6
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
            // End:0x1B6
            if(G != none)
            {
                // End:0x1B6
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
        // [Loop Continue]
        goto J0x21;
    }
    //return;    
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
    J0x1E:

    // End:0x27D [Loop If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0xD5
        if(((((int(W.WeaponType) != int(1)) && int(W.WeaponType) != int(2)) && int(W.WeaponType) != int(3)) && int(W.WeaponType) != int(4)) && int(W.WeaponType) != int(5))
        {
            Inv = Inv.Inventory;            
        }
        else
        {
            iAmmoAmount = W.BaseParams.iAmmo_Magazine;
            // End:0x16A
            if(int(W.WeaponType) == int(5))
            {
                ammoCount = iGranadeCount;
                // End:0x127
                if(bSetGR)
                {
                    bDeleteGranade = true;
                }
                // End:0x13E
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
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

function AddWeaponByWeaponLimited(int iWeaponID, int iPartsID, BtrDouble UniqueID)
{
    local sStartWeaponInfo sInfo;

    AddWeapon(EmptyBtrDouble(), iWeaponID, iPartsID, false);
    sInfo.iWeaponID = iWeaponID;
    sInfo.iPartsID = iPartsID;
    sInfo.iUniqueID = EmptyBtrDouble();
    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
    //return;    
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

    Log((("[wPawn::SetSelectedQuickSlotInventory] name=" $ PlayerReplicationInfo.PlayerName) $ " / bQuickslotChange=") $ string(bQuickslotChange));
    kMM = Level.GetMatchMaker();
    iSelectedQSlotIndex = PlayerController(Controller).iSelectedQSlotIndex;
    iPrevSelectedQSlotIndex = PlayerController(Controller).iPrevSelectedQSlotIndex;
    curQSlot = kUser.EquippedQSlots[iSelectedQSlotIndex];
    i = 0;
    J0xCA:

    // End:0xA92 [Loop If]
    if(i < 5)
    {
        // End:0x128
        if(((i == 3) && Level.GRI.GameClass == "WGame.wTeamGame") && kMM.IsSDRespawn())
        {
            // [Explicit Continue]
            goto J0xA88;
        }
        // End:0x157
        if(curQSlot.ItemID[i] != 0)
        {
            targetUniqueID = curQSlot.ItemUniqueID[i];            
        }
        else
        {
            j = 0;
            J0x15E:

            // End:0x1D3 [Loop If]
            if(j < 5)
            {
                iSlotPos = int(Level.GameMgr.ConvertIndexToQuickSlotType(j, false));
                // End:0x1C9
                if(iSlotPos == (int(0) + i))
                {
                    targetUniqueID = kUser.EquippedQSlots[0].ItemUniqueID[j];
                    // [Explicit Break]
                    goto J0x1D3;
                }
                j++;
                // [Loop Continue]
                goto J0x15E;
            }
        }
        J0x1D3:

        // End:0x243
        if(!Level.GetMatchMaker().BotTutorial)
        {
            j = 0;
            J0x1F8:

            // End:0x230 [Loop If]
            if(j < arStartWeaponInfo.Length)
            {
                // End:0x226
                if(__NFUN_912__(targetUniqueID, arStartWeaponInfo[j].iUniqueID))
                {
                    // [Explicit Break]
                    goto J0x230;
                }
                j++;
                // [Loop Continue]
                goto J0x1F8;
            }
            J0x230:

            // End:0x243
            if(j != arStartWeaponInfo.Length)
            {
                // [Explicit Continue]
                goto J0xA88;
            }
        }
        bPermitWeaponChange = true;
        // End:0x2D9
        if(int(kMM.eWeaponLimit) != int(kMM.0))
        {
            WBP = Level.WeaponMgr.GetBaseParam(curQSlot.ItemID[i]);
            // End:0x2D9
            if(WBP != none)
            {
                bPermitWeaponChange = Controller.IsPermitSpecialMode(true, WBP.iInventoryGroup, WBP.eType);
            }
        }
        // End:0x40B
        if((curQSlot.ItemID[i] != 0) && int(kMM.eWeaponLimit) == int(kMM.0))
        {
            AddWeapon(curQSlot.ItemUniqueID[i], curQSlot.ItemID[i], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[i]);
            sInfo.iWeaponID = curQSlot.ItemID[i];
            sInfo.iPartsID = curQSlot.PartsID[i];
            sInfo.iUniqueID = curQSlot.ItemUniqueID[i];
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemOnUse[i] = 1;
            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemUsedCount[i]++;
            HasWeaponInSlot = true;
            // [Explicit Continue]
            goto J0xA88;
        }
        // End:0xA67
        if(int(kMM.eWeaponLimit) != int(kMM.0))
        {
            iSlotPos = int(0) + i;
            // End:0x5B3
            if(int(kMM.4) == int(kMM.eWeaponLimit))
            {
                // End:0x4C3
                if(iSlotPos == int(0))
                {
                    AddWeapon(EmptyBtrDouble(), 5012, 0, false);
                    sInfo.iWeaponID = 5012;
                    sInfo.iPartsID = 0;
                    sInfo.iUniqueID = EmptyBtrDouble();
                    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;                    
                }
                else
                {
                    AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                    sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                    sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                    sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                    arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                    kUser.EquippedQSlots[iSelectedQSlotIndex].ItemOnUse[iSlotPos] = 1;
                    kUser.EquippedQSlots[iSelectedQSlotIndex].ItemUsedCount[iSlotPos]++;
                }                
            }
            else
            {
                // End:0x6D6
                if(int(kMM.1) == int(kMM.eWeaponLimit))
                {
                    // End:0x6D3
                    if(iSlotPos == int(4))
                    {
                        AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[iSlotPos], false, curQSlot.Painting_Item_ID[iSlotPos]);
                        sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                        sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                        sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                        arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                        kUser.EquippedQSlots[iSelectedQSlotIndex].ItemOnUse[iSlotPos] = 1;
                        kUser.EquippedQSlots[iSelectedQSlotIndex].ItemUsedCount[iSlotPos]++;                        
                    }                    
                }
                else
                {
                    // End:0x809
                    if(int(kMM.5) == int(kMM.eWeaponLimit))
                    {
                        // End:0x719
                        if((iSlotPos == int(2)) || iSlotPos == int(3))
                        {                            
                        }
                        else
                        {
                            AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                            sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                            sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                            sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemOnUse[iSlotPos] = 1;
                            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemUsedCount[iSlotPos]++;
                        }                        
                    }
                    else
                    {
                        // End:0x91B
                        if(int(kMM.6) == int(kMM.eWeaponLimit))
                        {
                            AddWeapon(curQSlot.ItemUniqueID[iSlotPos], curQSlot.ItemID[iSlotPos], curQSlot.PartsID[i], false, curQSlot.Painting_Item_ID[iSlotPos]);
                            sInfo.iWeaponID = curQSlot.ItemID[iSlotPos];
                            sInfo.iPartsID = curQSlot.PartsID[iSlotPos];
                            sInfo.iUniqueID = curQSlot.ItemUniqueID[iSlotPos];
                            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
                            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemOnUse[iSlotPos] = 1;
                            kUser.EquippedQSlots[iSelectedQSlotIndex].ItemUsedCount[iSlotPos]++;                            
                        }
                        else
                        {
                            // End:0x940
                            if(int(kMM.7) == int(kMM.eWeaponLimit))
                            {                                
                            }
                            else
                            {
                                // End:0x97B
                                if(int(kMM.2) == int(kMM.eWeaponLimit))
                                {
                                    SetPistolInvenByWeaponLimited(i, kMM, kUser, true);                                    
                                }
                                else
                                {
                                    // End:0x9B6
                                    if(int(kMM.8) == int(kMM.eWeaponLimit))
                                    {
                                        SetShotGunlInvenByWeaponLimited(i, kMM, kUser, true);                                        
                                    }
                                    else
                                    {
                                        // End:0x9F1
                                        if(int(kMM.9) == int(kMM.eWeaponLimit))
                                        {
                                            SetMGlInvenByWeaponLimited(i, kMM, kUser, true);                                            
                                        }
                                        else
                                        {
                                            // End:0xA2C
                                            if(int(kMM.10) == int(kMM.eWeaponLimit))
                                            {
                                                SetFlameThrowerlInvenByWeaponLimited(i, kMM, kUser, true);                                                
                                            }
                                            else
                                            {
                                                // End:0xA64
                                                if(int(kMM.3) == int(kMM.eWeaponLimit))
                                                {
                                                    SetGrenadlInvenByWeaponLimited(i, kMM, kUser, true);
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
            // [Explicit Continue]
            goto J0xA88;
        }
        // End:0xA88
        if(i < 1)
        {
            AddBaseInvenWeapon(kUser, int(0) + i);
        }
        J0xA88:

        i++;
        // [Loop Continue]
        goto J0xCA;
    }
    // End:0xBD3
    if((HasWeaponInSlot && iPrevSelectedQSlotIndex != iSelectedQSlotIndex) && bQuickslotChange == false)
    {
        PlayerID = kMM.GetUIDByUserName(PlayerController(Controller).PlayerReplicationInfo.PlayerName);
        clog((((("[sfReqGamePlay_ChangeWeaponSet] PlayerID:" $ string(PlayerID)) $ "/Set Num:") $ string(iSelectedQSlotIndex)) $ "/PS:") $ string(iPrevSelectedQSlotIndex));
        Log((("[sfReqGamePlay_ChangeWeaponSet] PlayerID:" $ string(PlayerID)) $ "/Set Num:") $ string(iSelectedQSlotIndex));
        Level.Game.SendReqChangeWeaponSet(PlayerID, iSelectedQSlotIndex);
        PlayerController(Controller).iPrevSelectedQSlotIndex = iSelectedQSlotIndex;
    }
    //return;    
}

function AddBaseInvenWeapon(wMatchUserInfo kUser, int iPos)
{
    local int i;
    local wMatchMaker kMM;
    local sStartWeaponInfo sInfo;
    local int iSlotPosition;

    kMM = Level.GetMatchMaker();
    i = 0;
    J0x1C:

    // End:0x192 [Loop If]
    if(i < 5)
    {
        iSlotPosition = int(Level.GameMgr.ConvertIndexToQuickSlotType(i, false));
        // End:0x188
        if(iSlotPosition == iPos)
        {
            // End:0x80
            if(kUser.EquippedQSlots[0].ItemID[i] == 0)
            {
                return;
            }
            AddWeapon(kUser.EquippedQSlots[0].ItemUniqueID[i], kUser.EquippedQSlots[0].ItemID[i], kUser.EquippedQSlots[0].PartsID[i], false, kUser.EquippedQSlots[0].Painting_Item_ID[i]);
            sInfo.iWeaponID = kUser.EquippedItems[i].ItemID;
            sInfo.iPartsID = kUser.EquippedItems[i].AddPartID;
            sInfo.iUniqueID = kUser.EquippedItems[i].UniqueID;
            arStartWeaponInfo[arStartWeaponInfo.Length] = sInfo;
            kUser.SetItemUse(i);
            // [Explicit Break]
            goto J0x192;
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    J0x192:

    //return;    
}

simulated function ClientQSlotChangeCheck()
{
    ServerQSlotChangeCheck();
    //return;    
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
    Controller.SkillBase.ChangedQuickSlot();
    //return;    
}

simulated function ClientSwitchToLastWeapon(optional byte defuseSwitch)
{
    // End:0x55
    if(1 == int(defuseSwitch))
    {
        // End:0x55
        if(!Weapon.IsA('wDemopack'))
        {
            Log((string(self) $ " 1 == defuseSwitch / Weapon : ") $ string(Weapon));
            return;
        }
    }
    SwitchToLastWeapon();
    //return;    
}

function SpawnMedals()
{
    local Actor spawnedActor;
    local Vector offset;
    local Rotator Rotation;

    Level.GRI.Teams[GetTeamNum()].Score2 -= float(PlayerReplicationInfo.NumMedals);
    J0x39:

    // End:0xEC [Loop If]
    if(PlayerReplicationInfo.NumMedals > 0)
    {
        PlayerReplicationInfo.NumMedals--;
        offset = MakeVector((FRand() - 0.5000000) * float(80), (FRand() - 0.5000000) * float(80), 0.0000000);
        spawnedActor = Spawn(Class'WGame_Decompressed.wMedalPack',,, (Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + offset,, true);
        Rotation.Yaw = int(FRand() * float(65535));
        spawnedActor.SetRotation(Rotation);
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

function int SpawnBlackbox()
{
    local int blackBoxNum;
    local float fRandom;
    local wMapInfo mapInfo;
    local PlayerController PC;
    local wItemBaseParam ItemParam;

    blackBoxNum = 0;
    PC = PlayerController(Controller);
    // End:0x15B
    if(PC != none)
    {
        mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
        fRandom = Level.Game.GetSupplyRandom();
        fRandom -= mapInfo.m_BlackBoxInfo;
        // End:0x15B
        if(fRandom < float(0))
        {
            ItemParam = Level.GameMgr.GetItemParam(int(mapInfo.m_BlackBoxItemID));
            PC.ClientMessage(Class'Engine.BTCustomDrawHK'.static.FormatString(Class'Engine.wMessage_Game'.default.strGotBlackBox, ItemParam.strDisplayName), 'GotItem');
            PC.ClientFmodPlaySoundLocal("Warfare_Sound_UI/Luckyshop/blackbox", 0);
            blackBoxNum = int(mapInfo.m_BlackBoxItemID);
        }
    }
    return blackBoxNum;
    //return;    
}

function int SpawnSupplyItem()
{
    local int i, spawnID;
    local float fRandom;
    local wMapInfo mapInfo;
    local Actor spawnedActor;
    local wMatchMaker kMM;

    // End:0x0E
    if(IsA('wBotVehicle'))
    {
        return 255;
    }
    Log("go SpawnSupply");
    kMM = Level.GetMatchMaker();
    // End:0x4A
    if(kMM.BotTutorial)
    {
        return 255;
    }
    spawnID = 255;
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
    fRandom = Level.Game.GetSupplyRandom();
    fRandom -= mapInfo.m_afDropItem[int(0)];
    // End:0x14E
    if(int(kMM.eWeaponLimit) != int(kMM.1))
    {
        // End:0x14E
        if(fRandom < float(0))
        {
            spawnedActor = Spawn(Class'WGame_Decompressed.wHealthPack',,, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
            Log("SpawnSupplyItem: wHealthPack");
            spawnID = int(0);
        }
    }
    // End:0x462
    if(none == spawnedActor)
    {
        // End:0x1D6
        if(((Level.GRI.GameClass == "WMission.wSDGameInfo") || int(kMM.eWeaponLimit) == int(kMM.5)) || int(kMM.eWeaponLimit) == int(kMM.1))
        {            
        }
        else
        {
            i = 0;
            J0x1DD:

            // End:0x462 [Loop If]
            if(i < int(5))
            {
                // End:0x1FC
                if(int(0) == i)
                {
                    // [Explicit Continue]
                    goto J0x458;
                }
                // End:0x299
                if(int(4) == i)
                {
                    // End:0x274
                    if(("WMission.wDOAGameInfo" == Level.GRI.GameClass) || "WMission.wDeathMatch" == Level.GRI.GameClass)
                    {
                        // [Explicit Continue]
                        goto J0x458;
                    }
                    // End:0x299
                    if(int(kMM.eWeaponLimit) != int(kMM.0))
                    {
                        // [Explicit Continue]
                        goto J0x458;
                    }
                }
                fRandom -= mapInfo.m_afDropItem[i];
                // End:0x2C4
                if(fRandom >= float(0))
                {
                    // [Explicit Continue]
                    goto J0x458;
                }
                switch(byte(i))
                {
                    // End:0x31D
                    case 1:
                        spawnedActor = Spawn(Class'WGame_Decompressed.wUAVPack',,, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
                        Log("SpawnSupplyItem: wUAVPack");
                        // End:0x43F
                        break;
                    // End:0x36E
                    case 2:
                        spawnedActor = Spawn(Class'WGame_Decompressed.wHeliPack',,, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
                        Log("SpawnSupplyItem: wHeliPack");
                        // End:0x43F
                        break;
                    // End:0x3C2
                    case 3:
                        spawnedActor = Spawn(Class'WGame_Decompressed.wBombingPack',,, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
                        Log("SpawnSupplyItem: wBombingPack");
                        // End:0x43F
                        break;
                    // End:0x418
                    case 4:
                        spawnedActor = Spawn(Class'WGame_Decompressed.wSentryGunPack',,, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
                        Log("SpawnSupplyItem: wSentryGunPack");
                        // End:0x43F
                        break;
                    // End:0xFFFF
                    default:
                        Log("Invalid ESUPPLY_ITEM_TYPE");
                        assert(false);
                        // End:0x43F
                        break;
                        break;
                }
                spawnID = i;
                // End:0x458
                if(none != spawnedActor)
                {
                    // [Explicit Break]
                    goto J0x462;
                }
                J0x458:

                ++i;
                // [Loop Continue]
                goto J0x1DD;
            }
        }
    }
    J0x462:

    // End:0x481
    if(none != spawnedActor)
    {
        Pickup(spawnedActor).InitDroppedPack();
    }
    return spawnID;
    //return;    
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
    //return;    
}

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
        else
        {
            // End:0x53
            if(int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Knife_Fire_Pr;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle_Pr;
            }
        }        
    }
    else
    {
        // End:0xC2
        if(bIsCrouched == true)
        {
            // End:0x84
            if(bMeleeKnifeOrButt)
            {
                CurrentMelee3rd = Meele_Knife_Cr;                
            }
            else
            {
                // End:0xB4
                if(int(WeaponAttachment.BaseParams.eType) == int(17))
                {
                    CurrentMelee3rd = Knife_Fire_Cr;                    
                }
                else
                {
                    CurrentMelee3rd = Meele_Rifle_Cr;
                }
            }            
        }
        else
        {
            // End:0xD9
            if(bMeleeKnifeOrButt)
            {
                CurrentMelee3rd = Meele_Knife;                
            }
            else
            {
                // End:0x109
                if(int(WeaponAttachment.BaseParams.eType) == int(17))
                {
                    CurrentMelee3rd = Knife_Fire;                    
                }
                else
                {
                    CurrentMelee3rd = Meele_Rifle;
                }
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
    PlayAnim(CurrentMelee3rd, 1.0000000, 0.0000000, 1);
    bMeleeAttacking = true;
    Log("MeleeAni - " $ string(CurrentMelee3rd));
    //return;    
}

simulated function PlayRechamber()
{
    local name CurAnimName;
    local wGun Gun;

    Gun = wGun(Weapon);
    // End:0x6F
    if(bIsProned)
    {
        // End:0x61
        if((int(Gun.WeaponType) == int(6)) && Gun.BaseParams.fRechamberRate != float(0))
        {
            CurAnimName = ShotGun_Prone_Pump;            
        }
        else
        {
            CurAnimName = Rifle_Prone_BoltLeverAnim;
        }        
    }
    else
    {
        // End:0xCE
        if(bIsCrouched)
        {
            // End:0xC0
            if((int(Gun.WeaponType) == int(6)) && Gun.BaseParams.fRechamberRate != float(0))
            {
                CurAnimName = ShotGun_Crouch_Pump;                
            }
            else
            {
                CurAnimName = Rifle_Crouch_BoltLeverAnim;
            }            
        }
        else
        {
            // End:0x116
            if((int(Gun.WeaponType) == int(6)) && Gun.BaseParams.fRechamberRate != float(0))
            {
                CurAnimName = ShotGun_BoltLeverAnim;                
            }
            else
            {
                CurAnimName = Rifle_BoltLeverAnim;
            }
        }
    }
    // End:0x13F
    if(int(Role) == int(ROLE_Authority))
    {
        SetAnimAction(CurAnimName);        
    }
    else
    {
        ServerSetAnimAction(CurAnimName);
    }
    // End:0x1B2
    if(((Gun != none) && Gun.bRechamber) && Gun.CheckAim())
    {
        // End:0x1B2
        if(int(Gun.WeaponType) != int(6))
        {
            Gun.FireMode[1].AutoAimCount = 2;
        }
    }
    //return;    
}

simulated function PlayReload()
{
    local name CurrentReload3rd;

    // End:0x123
    if(bIsProned)
    {
        // End:0x50
        if(int(TypeOfWeapon) == int(4))
        {
            // End:0x42
            if(WeaponAttachment.ResParams.default.Use2ndAni)
            {
                CurrentReload3rd = Pistol_ProneReload_2nd;                
            }
            else
            {
                CurrentReload3rd = Pistol_ProneReload;
            }            
        }
        else
        {
            // End:0x97
            if(int(TypeOfWeapon) == int(7))
            {
                // End:0x89
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Rpg_ProneReload_2nd;                    
                }
                else
                {
                    CurrentReload3rd = Rpg_ProneReload;
                }                
            }
            else
            {
                // End:0xE5
                if(int(TypeOfWeapon) == int(6))
                {
                    // End:0xD7
                    if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                    {
                        CurrentReload3rd = ShotGun_Prone_Reload3;                        
                    }
                    else
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_Anim;
                    }                    
                }
                else
                {
                    // End:0x115
                    if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_2nd_Anim;                        
                    }
                    else
                    {
                        CurrentReload3rd = Reload_Prone_Rifle_Anim;
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x246
        if(bIsCrouched)
        {
            // End:0x173
            if(int(TypeOfWeapon) == int(4))
            {
                // End:0x165
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Pistol_CrouchReload_2nd;                    
                }
                else
                {
                    CurrentReload3rd = Pistol_CrouchReload;
                }                
            }
            else
            {
                // End:0x1BA
                if(int(TypeOfWeapon) == int(7))
                {
                    // End:0x1AC
                    if(WeaponAttachment.ResParams.default.Use2ndAni)
                    {
                        CurrentReload3rd = Rpg_CrouchReload_2nd;                        
                    }
                    else
                    {
                        CurrentReload3rd = Rpg_CrouchReload;
                    }                    
                }
                else
                {
                    // End:0x208
                    if(int(TypeOfWeapon) == int(6))
                    {
                        // End:0x1FA
                        if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                        {
                            CurrentReload3rd = ShotGun_Crouch_Reload3;                            
                        }
                        else
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_Anim;
                        }                        
                    }
                    else
                    {
                        // End:0x238
                        if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_2nd_Anim;                            
                        }
                        else
                        {
                            CurrentReload3rd = Reload_Crouch_Rifle_Anim;
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x28D
            if(int(TypeOfWeapon) == int(4))
            {
                // End:0x27F
                if(WeaponAttachment.ResParams.default.Use2ndAni)
                {
                    CurrentReload3rd = Pistol_Reload_Rifle_2nd_Anim;                    
                }
                else
                {
                    CurrentReload3rd = Pistol_Reload_Rifle_Anim;
                }                
            }
            else
            {
                // End:0x2D4
                if(int(TypeOfWeapon) == int(7))
                {
                    // End:0x2C6
                    if(WeaponAttachment.ResParams.default.Use2ndAni)
                    {
                        CurrentReload3rd = Rpg_Reload_2nd_Anim;                        
                    }
                    else
                    {
                        CurrentReload3rd = Rpg_Reload_Anim;
                    }                    
                }
                else
                {
                    // End:0x322
                    if(int(TypeOfWeapon) == int(6))
                    {
                        // End:0x314
                        if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                        {
                            CurrentReload3rd = ShotGun_Reload;                            
                        }
                        else
                        {
                            CurrentReload3rd = Reload_Rifle_Anim;
                        }                        
                    }
                    else
                    {
                        // End:0x352
                        if(int(WeaponAttachment.BaseParams.ReloadType) == int(2))
                        {
                            CurrentReload3rd = Reload_Rifle_2nd_Anim;                            
                        }
                        else
                        {
                            CurrentReload3rd = Reload_Rifle_Anim;
                        }
                    }
                }
            }
        }
    }
    // End:0x37B
    if(int(Role) == int(ROLE_Authority))
    {
        SetAnimAction(CurrentReload3rd);        
    }
    else
    {
        ServerSetAnimAction(CurrentReload3rd);
    }
    MakeNoise(0.5000000);
    //return;    
}

function HandlePickup(Pickup pick)
{
    local wWeaponPickup WPick;
    local wWeapon W, W2Drop;
    local Inventory invW;
    local wItemBaseParam ItemParam;

    // End:0x3D8
    if(pick.IsA('wWeaponPickup'))
    {
        WPick = wWeaponPickup(pick);
        // End:0x1BD
        if((WPick.BaseParams.iInventoryGroup == 1) || WPick.BaseParams.iInventoryGroup == 2)
        {
            J0x61:

            // End:0x1BD [Loop If]
            if(true)
            {
                // End:0x7E
                if(invW == none)
                {
                    invW = Inventory;                    
                }
                else
                {
                    invW = invW.Inventory;
                }
                // End:0xA0
                if(invW == none)
                {
                    // [Explicit Break]
                    goto J0x1BD;
                }
                W2Drop = wWeapon(invW);
                // End:0xBE
                if(W2Drop == none)
                {                    
                }
                else
                {
                    // End:0xED
                    if(int(W2Drop.InventoryGroup) != WPick.BaseParams.iInventoryGroup)
                    {                        
                    }
                    else
                    {
                        // End:0x10C
                        if((W != none) && W2Drop == W)
                        {                            
                        }
                        else
                        {
                            ItemParam = Level.GameMgr.GetItemParam(W2Drop.BaseParams.iWeaponID);
                            // End:0x173
                            if((ItemParam.iItemID >= 0) && int(ItemParam.eGrade) == int(11))
                            {                                
                            }
                            else
                            {
                                W2Drop.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                                W2Drop.DropFrom(kPendingWPick.Location, kPendingWPick.Rotation);
                            }
                        }
                    }
                }
                // [Loop Continue]
                goto J0x61;
            }
        }
        J0x1BD:

        // End:0x2F1
        if(W != none)
        {
            W.AmmoCharge[0] += WPick.AmmoAmount[0];
            W.AmmoCharge[0] = Min(W.AmmoCharge[0], W.BaseParams.iAmmo_Max);
            W.AmmoCharge[1] += WPick.AmmoAmount[1];
            W.AmmoCharge[1] = Min(W.AmmoCharge[1], W.BaseParams.iAmmo_Max);
            // End:0x2EE
            if(W.IsA('wGun'))
            {
                W.AmmoCharge[0] += WPick.AmmoAmount_Loaded;
                W.AmmoCharge[0] = Min(W.AmmoCharge[0], W.BaseParams.iAmmo_Max);
            }            
        }
        else
        {
            W = AddWeapon(EmptyBtrDouble(), WPick.iRepWeaponID, WPick.iRepAddPartsID, true, WPick.iPainting_Item_ID);
            SetAddWeaponSkill(W, WPick.iRepWeaponID, WPick.iRepAddPartsID);
            // End:0x3D8
            if(W != none)
            {
                W.AmmoCharge[0] = WPick.AmmoAmount[0];
                W.AmmoCharge[1] = WPick.AmmoAmount[1];
                // End:0x3D8
                if(W.IsA('wGun'))
                {
                    wGun(W).AmmoCharge_CurLoaded = WPick.AmmoAmount_Loaded;
                }
            }
        }
    }
    super(Pawn).HandlePickup(pick);
    //return;    
}

simulated function AddNoWeaponChangeMessage(byte bySlot)
{
    ServerCallNoWeaponMessage(bySlot);
    //return;    
}

function ServerCallNoWeaponMessage(byte bySlot)
{
    local int i;
    local wWeaponBaseParams WBP;
    local wItemResourceParam resParam;

    i = 0;
    J0x07:

    // End:0xDB [Loop If]
    if(i < arStartWeaponInfo.Length)
    {
        WBP = Level.WeaponMgr.GetBaseParam(arStartWeaponInfo[i].iWeaponID);
        // End:0xD1
        if(WBP.iInventoryGroup == int(bySlot))
        {
            resParam = Level.GameMgr.GetItemResourceParam(arStartWeaponInfo[i].iWeaponID);
            // End:0xCE
            if(resParam.iItemResourceID != -1)
            {
                PlayerController(Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_NoWeapon', arStartWeaponInfo[i].iWeaponID);
            }
            // [Explicit Break]
            goto J0xDB;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xDB:

    //return;    
}

simulated function MakeShellEffect()
{
    //return;    
}

simulated function MakeShellEffect_Rechamber()
{
    // End:0x23
    if((WeaponAttachment == none) || WeaponAttachment.BaseParams == none)
    {
        return;
    }
    WeaponAttachment.MakeSpawnShell(true);
    // End:0x59
    if(wGun(Weapon) != none)
    {
        wGun(Weapon).StateRechamber = 3;
    }
    //return;    
}

simulated function RenderFPWeaponAttachment(Canvas C)
{
    // End:0x0D
    if(WeaponAttachment == none)
    {
        return;
    }
    // End:0x60
    if(FPWeaponAttachment == none)
    {
        FPWeaponAttachment = Spawn(FPWeaponAttachmentClass);
        FPWeaponAttachment.wLoadOut(WeaponAttachment.iRepWeaponID, WeaponAttachment.iRepAddPartsID, WeaponAttachment.iPainting_Item_ID, self);
    }
    // End:0xDE
    if((FPWeaponAttachment.iSavedWID != WeaponAttachment.iRepWeaponID) || FPWeaponAttachment.iSavedPartsID != WeaponAttachment.iRepAddPartsID)
    {
        FPWeaponAttachment.wLoadOut(WeaponAttachment.iRepWeaponID, WeaponAttachment.iRepAddPartsID, WeaponAttachment.iPainting_Item_ID, self);
    }
    FPWeaponAttachment.RenderOverlays(C);
    //return;    
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

    // End:0xAC [Loop If]
    if(i < SkillBase.Skills.Length)
    {
        // End:0x6F
        if(SkillBase.Skills[i].IsA('wSkill_QuickAimZoom'))
        {
            W.ServerQuickAimZoom(true);
            // [Explicit Continue]
            goto J0xA2;
        }
        // End:0xA2
        if(SkillBase.Skills[i].IsA('wSkill_QuickReload'))
        {
            W.ServerQuickReload(true);
        }
        J0xA2:

        i++;
        // [Loop Continue]
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
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x212
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x212
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x2A3
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x2A3
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x334
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x334
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    j = 0;
    J0x33B:

    // End:0x44B [Loop If]
    if(j < PartSkillList.Length)
    {
        iCheck = 0;
        i = 4;
        J0x35A:

        // End:0x399 [Loop If]
        if(i < 12)
        {
            // End:0x38F
            if(PartSkillList[j] == AddedSkillList[i])
            {
                iCheck = i;
                // [Explicit Break]
                goto J0x399;
            }
            i++;
            // [Loop Continue]
            goto J0x35A;
        }
        J0x399:

        // End:0x441
        if(iCheck == 0)
        {
            i = 4;
            J0x3AC:

            // End:0x3F8 [Loop If]
            if(i < 12)
            {
                // End:0x3EE
                if(AddedSkillList[i] == 0)
                {
                    AddedSkillList[i] = PartSkillList[j];
                    iCheck = i;
                    // [Explicit Break]
                    goto J0x3F8;
                }
                i++;
                // [Loop Continue]
                goto J0x3AC;
            }
            J0x3F8:

            // End:0x441
            if(iCheck != 0)
            {
                wPlayer(Controller).AddSkill(PartSkillList[j]);
                wPlayer(Controller).ApplySkill_Client(PartSkillList[j]);
            }
        }
        j++;
        // [Loop Continue]
        goto J0x33B;
    }
    //return;    
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
    // End:0xF9
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0xF9
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x18A
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x18A
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x21B
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x21B
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    wcpp = none;
    // End:0x2AC
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x2AC
        if((wcpp.iItemID > 0) && wcpp.iSkillID > 0)
        {
            PartSkillList.Length = PartSkillList.Length + 1;
            PartSkillList[PartSkillList.Length - 1] = wcpp.iSkillID;
        }
    }
    j = 0;
    J0x2B3:

    // End:0x392 [Loop If]
    if(j < PartSkillList.Length)
    {
        iCount = 0;
        i = 0;
        J0x2D1:

        // End:0x309 [Loop If]
        if(i < 12)
        {
            // End:0x2FF
            if(AddedSkillList[i] == PartSkillList[j])
            {
                iCount++;
            }
            i++;
            // [Loop Continue]
            goto J0x2D1;
        }
        // End:0x35D
        if(iCount > 0)
        {
            i = 4;
            J0x31C:

            // End:0x35D [Loop If]
            if(i < 12)
            {
                // End:0x353
                if(AddedSkillList[i] == PartSkillList[j])
                {
                    AddedSkillList[i] = 0;
                    // [Explicit Break]
                    goto J0x35D;
                }
                i++;
                // [Loop Continue]
                goto J0x31C;
            }
        }
        J0x35D:

        // End:0x388
        if(iCount < 2)
        {
            wPlayer(Controller).RemoveSkill(PartSkillList[j]);
        }
        j++;
        // [Loop Continue]
        goto J0x2B3;
    }
    //return;    
}

function bool AddWeaponMagazine()
{
    local Inventory Inv;
    local int Count;
    local float MaxAmmo, CurAmmo, AddAmmo;
    local bool bResult;

    Inv = Inventory;
    J0x0B:

    // End:0xD0 [Loop If]
    if((Inv != none) && Count < 50)
    {
        // End:0xB2
        if(Inv.IsA('wWeapon') && int(Inv.InventoryGroup) < 3)
        {
            wWeapon(Inv).GetAmmoCount(MaxAmmo, CurAmmo);
            // End:0xB2
            if((MaxAmmo + CurAmmo) < float(wWeapon(Inv).GetAmmountAddMagazine()))
            {
                wWeapon(Inv).ServerAddMagazine();
                bResult = true;
            }
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    Controller.SkillBase.bAddManazine = true;
    return bResult;
    //return;    
}

function bool AddWeaponFillAmmoAndMagazine()
{
    local Inventory Inv;
    local int Count;
    local float MaxAmmo, CurAmmo, AddAmmo, fTotalAmmo;
    local bool bResult;

    Inv = Inventory;
    J0x0B:

    // End:0x150 [Loop If]
    if((Inv != none) && Count < 50)
    {
        // End:0x132
        if(Inv.IsA('wWeapon') && int(Inv.InventoryGroup) < 3)
        {
            wWeapon(Inv).GetAmmoCount(MaxAmmo, CurAmmo);
            // End:0xB2
            if(Level.GetMatchMaker().IsNewDefenceMode())
            {
                fTotalAmmo = float(wWeapon(Inv).BaseParams.iAmmo_Initial);                
            }
            else
            {
                fTotalAmmo = float(wWeapon(Inv).GetAmmountAddMagazine());
            }
            // End:0x132
            if((MaxAmmo + CurAmmo) < fTotalAmmo)
            {
                wWeapon(Inv).FillToInitialAmmo();
                // End:0x12A
                if(Controller.SkillBase.bAddManazine == true)
                {
                    wWeapon(Inv).ServerAddMagazine();
                }
                bResult = true;
            }
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    return bResult;
    //return;    
}

function SetWeaponQuickAimZoom(bool bOn)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0B:

    // End:0x70 [Loop If]
    if((Inv != none) && Count < 50)
    {
        // End:0x52
        if(Inv.IsA('wWeapon'))
        {
            wWeapon(Inv).ServerQuickAimZoom(bOn);
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetWeaponQuickReload(bool bOn)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0B:

    // End:0x70 [Loop If]
    if((Inv != none) && Count < 50)
    {
        // End:0x52
        if(Inv.IsA('wWeapon'))
        {
            wWeapon(Inv).ServerQuickReload(bOn);
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    bCanQuickReload = true;
    //return;    
}

function SetWeaponQuickChange(bool bOn)
{
    bCanQuickWeaponChange = bOn;
    //return;    
}

simulated function GetWeaponAttachmentInfo(out byte byFlashCount, out byte byFiringMode)
{
    // End:0x33
    if(WeaponAttachment != none)
    {
        byFlashCount = WeaponAttachment.FlashCount;
        byFiringMode = WeaponAttachment.FiringMode;
    }
    //return;    
}

function SetBurning(bool bBurn, wProjectile proj)
{
    // End:0x20
    if((bBurning == bBurn) && BurningProj != none)
    {
        return;
    }
    bBurning = bBurn;
    BurningProj = proj;
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("### WeaponAttachment FlashCount : " $ string(WeaponAttachment.FlashCount));
    // End:0xC0
    if(FPWeaponAttachment != none)
    {
        FPWeaponAttachment.DisplayDebug(Canvas, YL, YPos);
    }
    //return;    
}

exec function reset_weapon()
{
    local wWeaponBaseParams WBP;
    local byte i;
    local wMatchMaker MatchMaker;

    MatchMaker = Level.GetMatchMaker();
    Level.WeaponMgr.LoadWeaponParams(MatchMaker.GetParamsExcelPathFileName());
    WBP = Level.WeaponMgr.GetBaseParam(Weapon.BaseParams.iWeaponID);
    Weapon.BaseParams = WBP;
    WeaponAttachment.BaseParams = WBP;
    i = 0;
    J0xA1:

    // End:0x123 [Loop If]
    if(int(i) < Weapon.3)
    {
        // End:0x119
        if(Weapon.FireMode[int(i)] != none)
        {
            Weapon.FireMode[int(i)].NextFireTime = 0.0000000;
            Weapon.FireMode[int(i)].wLoadOut();
        }
        i++;
        // [Loop Continue]
        goto J0xA1;
    }
    TestVersion_SetParameters();
    //return;    
}

simulated function AddAllyEffect(optional int iSideIndex)
{
    // End:0x20
    if(false == Level.GRI.bTeamGame)
    {
        return;
    }
    // End:0x44
    if(iSideIndex != Level.GetMatchMaker().My_iTeam)
    {
        return;
    }
    // End:0x51
    if(none != allyEffect)
    {
        return;
    }
    // End:0x88
    if("WMission.wAlienGameInfo" ~= Level.GRI.GameClass)
    {
        return;
    }
    // End:0x96
    if(false == bAlreadySetup)
    {
        return;
    }
    Log((((("AddIFF PlayerName:" $ PlayerReplicationInfo.PlayerName) $ " iSideIndex:") $ string(GetTeamNum())) $ " MyTeam:") $ string(Level.GetMatchMaker().My_iTeam));
    allyEffect = Spawn(GibGroupClass.default.IdentificationFriendClass, self);
    AttachToBone(allyEffect, 'Bip01 R Clavicle');
    //return;    
}

simulated function ClientSkillDeadPlayer()
{
    // End:0x28
    if(int(Role) < int(ROLE_Authority))
    {
        Controller.SkillBase.DeadPlayer();
    }
    //return;    
}

function SkillInit(optional bool bQuickslotChange)
{
    // End:0x0D
    if(IsA('wSentryGunPawn'))
    {
        return;
    }
    // End:0x3B
    if(Controller.IsA('wPlayer'))
    {
        wPlayer(Controller).SkillInit_Server(bQuickslotChange);
    }
    PlayerController(Controller).ClientCheckSkill();
    //return;    
}

exec function SpawnSentry(string strCheatTeamID)
{
    local DeathMatch DeathMatch;

    DeathMatch = DeathMatch(Level.Game);
    DeathMatch.AddwAIBot("1", strCheatTeamID, "WGame.wAISentryGunController", "0", string(200),, Controller, true, Location,, true);
    //return;    
}

exec function SpawnDSentry()
{
    local DeathMatch DeathMatch;

    DeathMatch = DeathMatch(Level.Game);
    DeathMatch.AddwAIBot("1", "0", "WGame.wAISentryGunController", "0", string(201),, Controller, true, Location,, true);
    //return;    
}

state Dying
{
    simulated function AnimEnd(int Channel)
    {
        ReduceCylinder();
        //return;        
    }

    event FellOutOfWorld(Actor.eKillZType KillType)
    {
        return;
        //return;        
    }

    function LandThump()
    {
        // End:0x26
        if(int(Physics) == int(0))
        {
            bThumped = true;
            FmodPlaySound(GetSound(1));
        }
        //return;        
    }

    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
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
        // End:0x26C
        if(int(Physics) == int(14))
        {
            // End:0x31
            if(bRubbery)
            {
                return;
            }
            // End:0xA9
            if(DamageType.default.bThrowRagdoll)
            {
                shotDir = Normal(Momentum);
                PushLinVel = (RagDeathVel * shotDir) + vect(0.0000000, 0.0000000, 250.0000000);
                PushAngVel = Normal(shotDir Cross vect(0.0000000, 0.0000000, 1.0000000)) * float(-18000);
                KSetSkelVel(PushLinVel, PushAngVel);                
            }
            else
            {
                // End:0x1DE
                if(DamageType.default.bRagdollBullet)
                {
                    // End:0xED
                    if(Momentum == vect(0.0000000, 0.0000000, 0.0000000))
                    {
                        Momentum = HitLocation - instigatedBy.Location;
                    }
                    // End:0x187
                    if(FRand() < 0.6500000)
                    {
                        // End:0x11E
                        if(Velocity.Z <= float(0))
                        {
                            PushLinVel = vect(0.0000000, 0.0000000, 40.0000000);
                        }
                        PushAngVel = Normal(Normal(Momentum) Cross vect(0.0000000, 0.0000000, 1.0000000)) * float(-8000);
                        PushAngVel.X *= 0.5000000;
                        PushAngVel.Y *= 0.5000000;
                        PushAngVel.Z *= float(4);
                        KSetSkelVel(PushLinVel, PushAngVel);
                    }
                    PushLinVel = RagShootStrength * Normal(Momentum);
                    KAddImpulse(PushLinVel, HitLocation);
                    // End:0x1DB
                    if((LifeSpan > float(0)) && LifeSpan < (DeResTime + float(2)))
                    {
                        LifeSpan += 0.2000000;
                    }                    
                }
                else
                {
                    PushLinVel = RagShootStrength * Normal(Momentum);
                    KAddImpulse(PushLinVel, HitLocation);
                }
            }
            // End:0x26A
            if(((DamageType.default.DamageOverlayMaterial != none) && int(Level.DetailMode) != int(0)) && !Level.bDropDetail)
            {
                SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
            }
            return;
        }
        // End:0x2B6
        if((DamageType.default.bFastInstantHit && (GetAnimSequence()) == 'Death_Spasm') && RepeaterDeathCount < 6)
        {
            PlayAnim('Death_Spasm',, 0.2000000);
            RepeaterDeathCount++;            
        }
        else
        {
            // End:0x54D
            if(Damage > 0)
            {
                // End:0x3A6
                if(instigatedBy != none)
                {
                    // End:0x304
                    if(instigatedBy.IsA('wPawn') && wPawn(instigatedBy).bBerserk)
                    {
                        Damage *= float(2);
                    }
                    // End:0x3A6
                    if(instigatedBy.Location != Location)
                    {
                        SelfToInstigator = instigatedBy.Location - Location;
                        SelfToHit = HitLocation - Location;
                        CrossPlaneNormal = Normal(SelfToInstigator Cross vect(0.0000000, 0.0000000, 1.0000000));
                        W = CrossPlaneNormal Dot Location;
                        // End:0x39B
                        if((HitLocation Dot CrossPlaneNormal) < W)
                        {
                            YawDir = -1.0000000;                            
                        }
                        else
                        {
                            YawDir = 1.0000000;
                        }
                    }
                }
                // End:0x3EC
                if(VSize(Momentum) < float(10))
                {
                    Momentum = (-Normal(SelfToInstigator) * float(Damage)) * 1000.0000000;
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
                CalcHitLoc(HitLocation, vect(0.0000000, 0.0000000, 0.0000000), HitBone, HitBoneDist);
                // End:0x4FD
                if(instigatedBy != none)
                {
                    HitNormal = Normal((Normal(instigatedBy.Location - HitLocation) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));                    
                }
                else
                {
                    HitNormal = Normal((vect(0.0000000, 0.0000000, 1.0000000) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));
                }
                DoDamageFX(HitBone, Damage, DamageType, Rotator(HitNormal), HitLocation);
            }
        }
        //return;        
    }

    simulated function BeginState()
    {
        Level.GetLocalPlayerController().myHUD.NotifyDeath(self);
        super.BeginState();
        AmbientSound = none;
        //return;        
    }

    simulated function Timer()
    {
        local KarmaParamsSkel skelParams;

        // End:0x1B
        if(!PlayerCanSeeMe())
        {
            // End:0x18
            if(RagdollLifeSpan != float(0))
            {
                Destroy();
            }            
        }
        else
        {
            // End:0xE5
            if((LifeSpan <= DeResTime) && bDeRes == false)
            {
                skelParams = KarmaParamsSkel(KParams);
                // End:0xCB
                if(((PlayerController(OldController) != none) && PlayerController(OldController).ViewTarget == self) && Viewport(PlayerController(OldController).Player) != none)
                {
                    skelParams.bKImportantRagdoll = true;
                    LifeSpan = FMax(LifeSpan, DeResTime + 2.0000000);
                    SetTimer(1.0000000, false);
                    return;                    
                }
                else
                {
                    skelParams.bKImportantRagdoll = false;
                }
                StartDeRes();                
            }
            else
            {
                SetTimer(1.0000000, false);
            }
        }
        //return;        
    }

    event KVelDropBelow()
    {
        local float NewLifeSpan;

        // End:0x38
        if(bDeRes == false)
        {
            NewLifeSpan = DeResTime + 3.5000000;
            // End:0x38
            if(NewLifeSpan < LifeSpan)
            {
                LifeSpan = NewLifeSpan;
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bCanDodgeDoubleJump=true
    ShieldStrengthMax=150.0000000
    Species=Class'WGame_Decompressed.SPECIES_Merc'
    GruntVolume=0.1800000
    FootstepVolume=0.6000000
    GibGroupClass=Class'XEffects.xPawnGibGroup'
    GibCountCalf=4
    GibCountForearm=2
    GibCountHead=2
    GibCountTorso=2
    GibCountUpperArm=2
    MinTimeBetweenPainSounds=0.3500000
    SoundFootsteps[0]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[1]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[2]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[3]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[4]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[5]="Warfare_Sound_FootStep/Dirt/foot_dirt_2d"
    SoundFootsteps[6]="Warfare_Sound_FootStep/Metal/foot_metal_2d"
    SoundFootsteps[7]="Warfare_Sound_FootStep/Metal/foot_metal_2d"
    SoundFootsteps[8]="Warfare_Sound_FootStep/Wood/foot_wood_2d"
    SoundFootsteps[9]="Warfare_Sound_FootStep/Plant/foot_plant_2d"
    SoundFootsteps[10]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[11]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[12]="Warfare_Sound_FootStep/Snow/foot_snow_2d"
    SoundFootsteps[13]="Warfare_Sound_FootStep/Waterwaist/foot_waterwaist_2d"
    SoundFootsteps[14]="Warfare_Sound_FootStep/Glass/foot_glass_2d"
    SoundFootsteps[15]="Warfare_Sound_FootStep/Carpet/foot_carpet_2d"
    SoundFootsteps[16]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[17]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[20]="Warfare_Sound_FootStep/Woodcreak/foot_woodcreak_2d"
    SoundFootsteps[21]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[22]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[23]="Warfare_Sound_FootStep/Stone/foot_stone_2d"
    SoundFootsteps[24]="Warfare_Sound_FootStep/Carpet/foot_carpet_2d"
    SoundFootsteps[25]="Warfare_Sound_FootStep/Leaves/foot_leaves_2d"
    SoundFootsteps[26]="Warfare_Sound_FootStep/Carpet/foot_carpet_2d"
    SoundFootsteps[27]="Warfare_Sound_FootStep/Sand/foot_sand_2d"
    SoundFootsteps[28]="Warfare_Sound_FootStep/Mud/foot_mud_2d"
    SoundFootsteps[29]="Warfare_Sound_FootStep/Waterfoot/foot_waterfoot_2d"
    SoundFootsteps_3rd[0]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[1]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[2]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[3]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[4]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[5]="Warfare_Sound_FootStep/Dirt/foot_dirt_3d"
    SoundFootsteps_3rd[6]="Warfare_Sound_FootStep/Metal/foot_metal_3d"
    SoundFootsteps_3rd[7]="Warfare_Sound_FootStep/Metal/foot_metal_3d"
    SoundFootsteps_3rd[8]="Warfare_Sound_FootStep/Wood/foot_wood_3d"
    SoundFootsteps_3rd[9]="Warfare_Sound_FootStep/Plant/foot_plant_3d"
    SoundFootsteps_3rd[10]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[11]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[12]="Warfare_Sound_FootStep/Snow/foot_snow_3d"
    SoundFootsteps_3rd[13]="Warfare_Sound_FootStep/Waterwaist/foot_waterwaist_3d"
    SoundFootsteps_3rd[14]="Warfare_Sound_FootStep/Glass/foot_glass_3d"
    SoundFootsteps_3rd[15]="Warfare_Sound_FootStep/Carpet/foot_carpet_3d"
    SoundFootsteps_3rd[16]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[17]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[20]="Warfare_Sound_FootStep/Woodcreak/foot_woodcreak_3d"
    SoundFootsteps_3rd[21]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[22]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[23]="Warfare_Sound_FootStep/Stone/foot_stone_3d"
    SoundFootsteps_3rd[24]="Warfare_Sound_FootStep/Carpet/foot_carpet_3d"
    SoundFootsteps_3rd[25]="Warfare_Sound_FootStep/Leaves/foot_leaves_3d"
    SoundFootsteps_3rd[26]="Warfare_Sound_FootStep/Carpet/foot_carpet_3d"
    SoundFootsteps_3rd[27]="Warfare_Sound_FootStep/Sand/foot_sand_3d"
    SoundFootsteps_3rd[28]="Warfare_Sound_FootStep/Mud/foot_mud_3d"
    SoundFootsteps_3rd[29]="Warfare_Sound_FootStep/Waterfoot/foot_waterfoot_3d"
    SoundGroupClass=Class'WGame_Decompressed.wMercMaleSoundGroup'
    sndScream="Warfare_Sound_Char/breath/etc_pain"
    sndDie="Warfare_Sound_Char/etc/char_die"
    MultiJumpRemaining=1
    MultiJumpBoost=25
    FireRootBone="Bip01 Spine1"
    Pistol_FireRifleRapidAnim="Pistol_Burst"
    TelegraphPack_PutdownAnim="HeliPack_Putdown"
    TelegraphPack_SelectAnim="HeliPack_Select"
    DeResTime=6.0000000
    DeResLiftVel=(Points=/* Array type was not detected. */)
    DeResLiftSoftness=(Points=/* Array type was not detected. */)
    DeResLateralFriction=0.3000000
    RagdollLifeSpan=13.0000000
    RagInvInertia=4.0000000
    RagDeathVel=400.0000000
    RagShootStrength=14000.0000000
    RagSpinScale=2.5000000
    RagDeathUpKick=150.0000000
    RagGravScale=1.0000000
    RagImpactSoundInterval=0.5000000
    RagImpactVolume=2.5000000
    PlacedCharacterName="Jakob"
    PlacedFemaleCharacterName="Tamika"
    iWarpCount=2
    iStartQSlotIndex=-1
    Hit_Stun="Hit_Stun"
    Hit_Stun_Cr="Hit_Crouch_Stun"
    Hit_Stun_Pr="Hit_Prone_Stun"
    Hit_PS[0]="Hit_PS_F"
    Hit_PS[1]="Hit_PS_B"
    Hit_PS[2]="Hit_PS_L"
    Hit_PS[3]="Hit_PS_R"
    Hit_PS_Head="Hit_PS_Head"
    Hit_PS_Cr[0]="Hit_PS_CrouchF"
    Hit_PS_Cr[1]="Hit_PS_CoruchB"
    Hit_PS_Cr[2]="Hit_PS_CrouchL"
    Hit_PS_Cr[3]="Hit_PS_CrouchR"
    Hit_PS_Pr="Hit_PS_Prone"
    Hit_PS_Stun="Hit_PS_Stun"
    Hit_PS_Stun_Cr="Hit_PS_Crouch_Stun"
    Hit_PS_Stun_Pr="Hit_PS_Prone_Stun"
    Hit_FR[0]="Hit_Frag_F"
    Hit_FR[1]="Hit_Frag_B"
    Hit_FR[2]="Hit_Frag_L"
    Hit_FR[3]="Hit_Frag_R"
    Hit_FR_Head="Hit_Frag_Head"
    Hit_FR_Cr[0]="Hit_Frag_CrouchF"
    Hit_FR_Cr[1]="Hit_Frag_CoruchB"
    Hit_FR_Cr[2]="Hit_Frag_CrouchL"
    Hit_FR_Cr[3]="Hit_Frag_CrouchR"
    Hit_FR_Pr="Hit_Frag_Prone"
    Hit_FR_Stun="Hit_Frag_Stun"
    Hit_FR_Stun_Cr="Hit_FR_Crouch_Stun"
    Hit_FR_Stun_Pr="Hit_FR_Prone_Stun"
    Hit_RPG[0]="Hit_RPG_F"
    Hit_RPG[1]="Hit_RPG_B"
    Hit_RPG[2]="Hit_RPG_L"
    Hit_RPG[3]="Hit_RPG_R"
    Hit_RPG_Head="Hit_RPG_Head"
    Hit_RPG_Cr[0]="Hit_RPG_CrouchF"
    Hit_RPG_Cr[1]="Hit_RPG_CoruchB"
    Hit_RPG_Cr[2]="Hit_RPG_CrouchL"
    Hit_RPG_Cr[3]="Hit_RPG_CrouchR"
    Hit_RPG_Pr="Hit_RPG_Prone"
    Hit_RPG_Stun="Hit_RPG_Stun"
    Hit_RPG_Stun_Cr="Hit_RPG_Crouch_Stun"
    Hit_RPG_Stun_Pr="Hit_RPG_Prone_Stun"
    Meele_Rifle_Fail="Mattack_Rifle_Fail"
    Meele_Rifle_Cr_Fail="Mattack_Rifle_Crouch_Fail"
    Meele_Rifle_Pr_Fail="Mattack_Rifle_Prone_Fail"
    Meele_Knife_Fail="Mattack_Knife_Fail"
    Meele_Knife_Cr_Fail="Mattack_Knife_Crouch_Fail"
    Meele_Knife_Pr_Fail="Mattack_Knife_Prone_Fail"
    Knife_Fire="MAttack_Ka1281"
    Knife_Fire_Cr="MAttack_Ka1281_Crouch"
    Knife_Fire_Pr="MAttack_Ka1281_Prone"
    Rifle_Crouch_BoltLeverAnim="AR_Crouch_BoltLever"
    Reload_Rifle_2nd_Anim="AR_Reload2"
    Reload_Crouch_Rifle_Anim="AR_Crouch_Reload"
    Reload_Crouch_Rifle_2nd_Anim="AR_Crouch_Reload2"
    Reload_Prone_Rifle_2nd_Anim="AR_Prone_Reload2"
    Pistol_Reload_Rifle_2nd_Anim="Pistol_Reload2"
    Pistol_CrouchReload="Pistol_Crouch_Reload"
    Pistol_CrouchReload_2nd="Pistol_Crouch_Reload2"
    Pistol_ProneReload_2nd="Pistol_Prone_Reload2"
    Rpg_Reload_2nd_Anim="RPG_Reload2"
    Rpg_CrouchReload="RPG_Crouch_Reload"
    Rpg_CrouchReload_2nd="RPG_Crouch_Reload2"
    Rpg_ProneReload_2nd="RPG_Prone_Reload2"
    Putdown_Crouch_Rifle_Anim="AR_Crouch_Putdown"
    PutdownQuick_Crouch_Rifle_Anim="AR_Crouch_Putdown_Quick"
    Pistol_CrouchPutdown="Pistol_Crouch_Putdown"
    Pistol_CrouchPutdownQuick="Pistol_Crouch_Putdown_Quick"
    Frag_CrouchPutdown="Frag_Crouch_Putdown"
    Frag_CrouchPutdownQuick="Frag_Crouch_Putdown_Quick"
    Rpg_CrouchPutdown="RPG_Crouch_Putdown"
    Rpg_CrouchPutdownQuick="RPG_Crouch_Putdown_Quick"
    Select_Crouch_Rifle_Anim="AR_Crouch_Select"
    SelectNew_Crouch_Rifle_Anim="AR_Crouch_Select_New"
    Pistol_CrouchSelect="Pistol_Crouch_Select"
    Frag_CrouchSelect="Frag_Crouch_Select"
    Rpg_CrouchSelect="RPG_Crouch_Select"
    wRequiredEquipment[0]=1000
    wRequiredEquipment[1]=1010
    wRequiredEquipment[2]=1020
    wRequiredEquipment[3]=1021
    wRequiredEquipment[4]=1022
    wRequiredEquipment[5]=1030
    wRequiredEquipment[6]=2000
    wRequiredEquipment[7]=2010
    wRequiredEquipment[8]=2011
    wRequiredEquipment[9]=2012
    wRequiredEquipment[10]=2013
    wRequiredEquipment[11]=2014
    wRequiredEquipment[12]=2015
    wRequiredEquipment[13]=2020
    wRequiredEquipment[14]=2021
    wRequiredEquipment[15]=2030
    wRequiredEquipment[16]=2031
    wRequiredEquipment[17]=2040
    wRequiredEquipment[18]=2041
    wRequiredEquipment[19]=2042
    wRequiredEquipment[20]=2043
    wRequiredEquipment[21]=2044
    wRequiredEquipment[22]=3000
    wRequiredEquipment[23]=3010
    wRequiredEquipment[24]=3011
    wRequiredEquipment[25]=3020
    wRequiredEquipment[26]=3021
    wRequiredEquipment[27]=3030
    wRequiredEquipment[28]=3031
    wRequiredEquipment[29]=3032
    wRequiredEquipment[30]=3033
    wRequiredEquipment[31]=3034
    wRequiredEquipment[32]=3035
    wRequiredEquipment[33]=4000
    wRequiredEquipment[34]=4010
    wRequiredEquipment[35]=4011
    wRequiredEquipment[36]=4020
    wRequiredEquipment[37]=4030
    wRequiredEquipment[38]=4031
    wRequiredEquipment[39]=4040
    wRequiredEquipment[40]=4041
    wRequiredEquipment[41]=4042
    wRequiredEquipment[42]=4043
    wRequiredEquipment[43]=4044
    wRequiredEquipment[44]=4045
    wRequiredEquipment[45]=6000
    wRequiredEquipment[46]=6001
    wRequiredEquipment[47]=6002
    wRequiredEquipment[48]=7001
    wRequiredEquipment[49]=5001
    wRequiredEquipment[50]=5003
    wRequiredEquipment[51]=40005
    wRequiredEquipment[52]=40006
    wRequiredEquipment[53]=1031
    wRequiredEquipment[54]=1032
    wRequiredEquipment[55]=9000
    wRequiredEquipment[56]=5011
    wRequiredEquipment[57]=2050
    wRequiredEquipment[58]=2051
    wRequiredEquipment[59]=4051
    wRequiredEquipment[60]=3093
    wRequiredEquipment[61]=3094
    FPWeaponAttachmentClass=Class'Engine.wFPWeaponAttachment'
    VoiceType="wGame.MercMaleVoice"
    bAddToLevelPawnList=true
    ProneHeight=23.0000000
    ProneRadius=38.0000000
    StandHeight=74.0000000
    StandRadius=38.0000000
    bCanWallDodge=true
    bNoCoronas=false
    bScriptPostRender=true
    GroundSpeed=370.0000000
    WaterSpeed=200.0000000
    AirSpeed=270.0000000
    JumpZ=530.0000000
    SprintSpeed=570.0000000
    CrouchedSpeed=252.0000000
    AimedGroundSpeed=122.0000000
    AimedCrouchedSpeed=83.0000000
    BaseEyeHeight=65.0000000
    BaseEyeHeightCroucned=36.0000000
    BaseEyeHeightProned=13.0000000
    EyeHeight=38.0000000
    CrouchHeight=57.5000000
    CrouchRadius=38.0000000
    ControllerClass=Class'WGame_Decompressed.wBot'
    bPhysicsAnimUpdate=true
    bDoTorsoTwist=true
    DodgeSpeedFactor=1.5000000
    DodgeSpeedZ=210.0000000
    IdleRifleAnim="AR_Idle"
    IdleRestAnim[0]="AR_Idle_Rest"
    IdleRestAnim[1]="AR_Idle"
    MovementAnims[0]="AR_RunF"
    MovementAnims[1]="AR_RunB"
    MovementAnims[2]="AR_RunL"
    MovementAnims[3]="AR_RunR"
    FireRifleRapidAnim="AR_Burst"
    FireRifleBurstAnim="AR_Semi"
    Rifle_BoltLeverAnim="AR_BoltLever"
    Reload_Rifle_Anim="AR_Reload"
    Putdown_Rifle_Anim="AR_Putdown"
    PutdownQuick_Rifle_Anim="AR_Putdown_Quick"
    Select_Rifle_Anim="AR_Select"
    SelectNew_Rifle_Anim="AR_Select_New"
    SprintAnims[0]="AR_Sprint"
    SprintAnims[1]="AR_RunB"
    SprintAnims[2]="AR_RunL"
    SprintAnims[3]="AR_RunR"
    IdleAimAnim="AR_Aim"
    AimAnims[0]="AR_AimF"
    AimAnims[1]="AR_AimB"
    AimAnims[2]="AR_AimL"
    AimAnims[3]="AR_AimR"
    FireAimRifleRapidAnim="AR_Aim_Burst"
    FireAimRifleSemiAnim="AR_Aim_Semi"
    TakeoffStillAnim="Jump_Takeoffstill"
    AirStillAnim="Jump_AirStill"
    TakeoffAnims[0]="JumpF_Takeoff"
    TakeoffAnims[1]="JumpB_Takeoff"
    TakeoffAnims[2]="JumpL_Takeoff"
    TakeoffAnims[3]="JumpR_Takeoff"
    AirAnims[0]="JumpF_Mid"
    AirAnims[1]="JumpB_Mid"
    AirAnims[2]="JumpL_Mid"
    AirAnims[3]="JumpR_Mid"
    LandAnims[0]="JumpF_Land"
    LandAnims[1]="JumpB_Land"
    LandAnims[2]="JumpL_Land"
    LandAnims[3]="JumpR_Land"
    LandAnims[4]="Jump_Land"
    Pistol_TakeoffStillAnim="Jump_PS_TakeoffStill"
    Pistol_AirStillAnim="Jump_PS_AirStill"
    Pistol_TakeoffAnims[0]="JumpF_PS_Takeoff"
    Pistol_TakeoffAnims[1]="JumpB_PS_Takeoff"
    Pistol_TakeoffAnims[2]="JumpL_PS_Takeoff"
    Pistol_TakeoffAnims[3]="JumpR_PS_Takeoff"
    Pistol_AirAnims[0]="JumpF_PS_Mid"
    Pistol_AirAnims[1]="JumpB_PS_Mid"
    Pistol_AirAnims[2]="JumpL_PS_Mid"
    Pistol_AirAnims[3]="JumpR_PS_Mid"
    Pistol_LandAnims[0]="JumpF_PS_Land"
    Pistol_LandAnims[1]="JumpB_PS_Land"
    Pistol_LandAnims[2]="JumpL_PS_Land"
    Pistol_LandAnims[3]="JumpR_PS_Land"
    Pistol_LandAnims[4]="Jump_PS_Land"
    Frag_TakeoffStillAnim="Jump_Frag_Takeoffstill"
    Frag_AirStillAnim="Jump_Frag_AirStill"
    Frag_TakeoffAnims[0]="JumpF_Frag_Takeoff"
    Frag_TakeoffAnims[1]="JumpB_Frag_Takeoff"
    Frag_TakeoffAnims[2]="JumpL_Frag_Takeoff"
    Frag_TakeoffAnims[3]="JumpR_Frag_Takeoff"
    Frag_AirAnims[0]="JumpF_Frag_Mid"
    Frag_AirAnims[1]="JumpB_Frag_Mid"
    Frag_AirAnims[2]="JumpL_Frag_Mid"
    Frag_AirAnims[3]="JumpR_Frag_Mid"
    Frag_LandAnims[0]="JumpF_Frag_Land"
    Frag_LandAnims[1]="JumpB_Frag_Land"
    Frag_LandAnims[2]="JumpL_Frag_Land"
    Frag_LandAnims[3]="JumpR_Frag_Land"
    Frag_LandAnims[4]="Jump_Frag_Land"
    Rpg_TakeoffStillAnim="Jump_RPG_Takeoffstill"
    Rpg_AirStillAnim="Jump_RPG_AirStill"
    Rpg_TakeoffAnims[0]="JumpF_RPG_Takeoff"
    Rpg_TakeoffAnims[1]="JumpB_RPG_Takeoff"
    Rpg_TakeoffAnims[2]="JumpL_RPG_Takeoff"
    Rpg_TakeoffAnims[3]="JumpR_RPG_Takeoff"
    Rpg_AirAnims[0]="JumpF_RPG_Mid"
    Rpg_AirAnims[1]="JumpB_RPG_Mid"
    Rpg_AirAnims[2]="JumpL_RPG_Mid"
    Rpg_AirAnims[3]="JumpR_RPG_Mid"
    Rpg_LandAnims[0]="JumpF_RPG_Land"
    Rpg_LandAnims[1]="JumpB_RPG_Land"
    Rpg_LandAnims[2]="JumpL_RPG_Land"
    Rpg_LandAnims[3]="JumpR_RPG_Land"
    Rpg_LandAnims[4]="Jump_RPG_Land"
    IdleCrouchAnim="AR_Crouch"
    IdleCrouchRestAnim[0]="AR_Crouch_Rest"
    IdleCrouchRestAnim[1]="AR_Crouch"
    CrouchAnims[0]="AR_CrouchF"
    CrouchAnims[1]="AR_CrouchB"
    CrouchAnims[2]="AR_CrouchL"
    CrouchAnims[3]="AR_CrouchR"
    FireCrouchRifleRapidAnim="AR_Crouch_Burst"
    IdleAimCrouchAnim="AR_Crouch"
    AimCrouchAnims[0]="AR_Crouch_AimF"
    AimCrouchAnims[1]="AR_Crouch_AimB"
    AimCrouchAnims[2]="AR_Crouch_AimL"
    AimCrouchAnims[3]="AR_Crouch_AimR"
    IdleProneAnim="AR_Prone"
    ProneAnims[0]="AR_ProneF"
    ProneAnims[1]="AR_ProneB"
    ProneAnims[2]="AR_ProneL"
    ProneAnims[3]="AR_ProneR"
    FireProneRifleRapidAnim="AR_Prone_Burst"
    Rifle_Prone_BoltLeverAnim="AR_Prone_BoltLever"
    Reload_Prone_Rifle_Anim="AR_Prone_Reload"
    Putdown_Prone_Rifle_Anim="AR_Prone_Putdown"
    PutdownQuick_Prone_Rifle_Anim="AR_Prone_Putdown_Quick"
    Select_Prone_Rifle_Anim="AR_Prone_Select"
    SelectNew_Prone_Rifle_Anim="AR_Prone_Select_New"
    Prone_Standup_Anim="AR_Prone_Up"
    Meele_Rifle="MAttack_Rifle"
    Meele_Rifle_Cr="MAttack_Rifle_Crouch"
    Meele_Rifle_Pr="Mattack_Rifle_Prone"
    Meele_Rifle_F="MAttack_RifleF"
    Meele_Rifle_Cr_F="MAttack_Rifle_CrouchF"
    Meele_Knife="MAttack_Ka1281"
    Meele_Knife_Cr="MAttack_Ka1281_Crouch"
    Meele_Knife_Pr="MAttack_Ka1281_Prone"
    Meele_Knife_F="Mattack_KnifeF"
    Meele_Knife_Cr_F="Mattack_Knife_CrouchF"
    Meele_Scharge="ShoulderCharge_Stand"
    Pistol_IdleRifleAnim="Pistol_Idle"
    Pistol_IdleRestAnim[0]="Pistol_Idle_Rest"
    Pistol_IdleRestAnim[1]="Pistol_Idle"
    Pistol_MovementAnims[0]="Pistol_RunF"
    Pistol_MovementAnims[1]="Pistol_RunB"
    Pistol_MovementAnims[2]="Pistol_RunL"
    Pistol_MovementAnims[3]="Pistol_RunR"
    Pistol_FireAimRifleRapidAnim="Pistol_Burst"
    Pistol_Reload_Rifle_Anim="Pistol_Reload"
    Pistol_Putdown_Rifle_Anim="Pistol_Putdown"
    Pistol_PutdownQuick_Rifle_Anim="Pistol_Putdown_Quick"
    Pistol_Select_Rifle_Anim="Pistol_Select"
    Pistol_SprintAnims[0]="Pistol_Sprint"
    Pistol_SprintAnims[1]="Pistol_RunB"
    Pistol_SprintAnims[2]="Pistol_RunL"
    Pistol_SprintAnims[3]="Pistol_RunR"
    Pistol_IdleCrouchAnim="Pistol_Crouch"
    Pistol_IdleCrouchRest[0]="Pistol_Crouch_Rest"
    Pistol_IdleCrouchRest[1]="Pistol_Crouch"
    Pistol_CrouchAnims[0]="Pistol_CrouchF"
    Pistol_CrouchAnims[1]="Pistol_CrouchB"
    Pistol_CrouchAnims[2]="Pistol_CrouchL"
    Pistol_CrouchAnims[3]="Pistol_CrouchR"
    Pistol_FireCrouchRifleRapidAnim="Pistol_Crouch_Burst"
    Pistol_IdleProne="Pistol_Prone"
    Pistol_ProneBurst="Pistol_Prone_Burst"
    Pistol_ProneReload="Pistol_Prone_Reload"
    Pistol_PronePutdown="Pistol_Prone_Putdown"
    Pistol_PronePutdownQuick="Pistol_Prone_Putdown_Quick"
    Pistol_ProneSelect="Pistol_Prone_Select"
    Frag_Idle_Anim="Frag_Idle"
    Frag_Rest_Idle_Anim[0]="Frag_Idle"
    Frag_Rest_Idle_Anim[1]="Frag_Idle"
    Frag_MovementAnims[0]="Frag_RunF"
    Frag_MovementAnims[1]="Frag_RunB"
    Frag_MovementAnims[2]="Frag_RunL"
    Frag_MovementAnims[3]="Frag_RunR"
    Frag_PutDown_Anim="Frag_Putdown"
    Frag_PutDownQuick_Anim="Frag_Putdown_Quick"
    Frag_Select_Anim="Frag_Select"
    Frag_Burst_Anim="Frag_Burst"
    Frag_SprintAnims[0]="Frag_Sprint"
    Frag_SprintAnims[1]="Frag_RunB"
    Frag_SprintAnims[2]="Frag_RunL"
    Frag_SprintAnims[3]="Frag_RunR"
    Frag_IdleCrouchAnim="Frag_Crouch"
    Frag_CrouchMovementAnims[0]="Frag_CrouchF"
    Frag_CrouchMovementAnims[1]="Frag_CrouchB"
    Frag_CrouchMovementAnims[2]="Frag_CrouchL"
    Frag_CrouchMovementAnims[3]="Frag_CrouchR"
    Frag_IdleProne="Frag_Prone"
    Frag_ProneBurst="Frag_Prone_Burst"
    Frag_PronePutdown="Frag_Prone_Putdown"
    Frag_PronePutdownQuick="Frag_Prone_Putdown_Quick"
    Frag_ProneSelect="Frag_Prone_Select"
    Rpg_Idle_Anim="RPG_Idle"
    Rpg_Rest_Idle_Anim="RPG_Idle_Rest"
    Rpg_MovementAnims[0]="RPG_RunF"
    Rpg_MovementAnims[1]="RPG_RunB"
    Rpg_MovementAnims[2]="RPG_RunL"
    Rpg_MovementAnims[3]="RPG_RunR"
    Rpg_Burst_Anim="RPG_Burst"
    Rpg_Reload_Anim="RPG_Reload"
    Rpg_PutDown_Anim="RPG_Putdown"
    Rpg_PutDownQuick_Anim="RPG_Putdown_Quick"
    Rpg_Select_Anim="RPG_Select"
    Rpg_SprintAnims[0]="RPG_Sprint"
    Rpg_SprintAnims[1]="RPG_RunB"
    Rpg_SprintAnims[2]="RPG_RunL"
    Rpg_SprintAnims[3]="RPG_RunR"
    Rpg_Idle_AimAnim="RPG_Aim"
    Rpg_AimAnims[0]="RPG_AimF"
    Rpg_AimAnims[1]="RPG_AimB"
    Rpg_AimAnims[2]="RPG_AimL"
    Rpg_AimAnims[3]="RPG_AimR"
    Rpg_AimAnims_Cr[0]="RPG_Crouch_AimF"
    Rpg_AimAnims_Cr[1]="RPG_Crouch_AimB"
    Rpg_AimAnims_Cr[2]="RPG_Crouch_AimL"
    Rpg_AimAnims_Cr[3]="RPG_Crouch_AimR"
    Rpg_IdleCrouchAnim="RPG_Crouch"
    Rpg_IdleCrouchRest="RPG_Crouch_Rest"
    Rpg_CrouchMovementAnims[0]="RPG_CrouchF"
    Rpg_CrouchMovementAnims[1]="RPG_CrouchB"
    Rpg_CrouchMovementAnims[2]="RPG_CrouchL"
    Rpg_CrouchMovementAnims[3]="RPG_CrouchR"
    Rpg_FireCrouchRifleRapidAnim="RPG_Crouch_Burst"
    Rpg_IdleProne="RPG_Prone"
    Rpg_ProneBurst="RPG_Prone_Burst"
    Rpg_ProneReload="RPG_Prone_Reload"
    Rpg_PronePutdown="RPG_Prone_Putdown"
    Rpg_PronePutdownQuick="RPG_Prone_Putdown_Quick"
    Rpg_ProneSelect="RPG_Prone_Select"
    Rpg_Prone_Standup_Anim="RPG_Prone_Up"
    SentryGunPack_IdleAnim="SentryG01_Idle"
    SentryGunPack_MovementAnims[0]="SentryG01_RunF"
    SentryGunPack_MovementAnims[1]="SentryG01_RunB"
    SentryGunPack_MovementAnims[2]="SentryG01_RunL"
    SentryGunPack_MovementAnims[3]="SentryG01_RunR"
    SentryGunPack_PutDown="SentryG01_PutDown"
    SentryGunPack_Select_Anim="SentryG01_Select"
    SentryGunPack_Plant="SentryG01_Plant"
    SentryGunPack_PlantStop="SentryG01_PlantStop"
    SentryGunPack_TakeoffStillAnim="Jump_SentryG01_Takeoffstill"
    SentryGunPack_AirStillAnim="Jump_SentryG01_AirStill"
    SentryGunPack_TakeoffAnims[0]="JumpF_SentryG01_Takeoff"
    SentryGunPack_TakeoffAnims[1]="JumpB_SentryG01_Takeoff"
    SentryGunPack_TakeoffAnims[2]="JumpL_SentryG01_Takeoff"
    SentryGunPack_TakeoffAnims[3]="JumpR_SentryG01_Takeoff"
    SentryGunPack_AirAnims[0]="JumpF_SentryG01_Mid"
    SentryGunPack_AirAnims[1]="JumpB_SentryG01_Mid"
    SentryGunPack_AirAnims[2]="JumpL_SentryG01_Mid"
    SentryGunPack_AirAnims[3]="JumpR_SentryG01_Mid"
    SentryGunPack_LandAnims[0]="JumpF_SentryG01_Land"
    SentryGunPack_LandAnims[1]="JumpB_SentryG01_Land"
    SentryGunPack_LandAnims[2]="JumpL_SentryG01_Land"
    SentryGunPack_LandAnims[3]="JumpR_SentryG01_Land"
    SentryGunPack_LandAnims[4]="Jump_SentryG01_Land"
    SentryGunPack_Weapon_Select_Anim="Select"
    SentryGunPack_Weapon_Plant_Anim="plant"
    SentryGunPack_Weapon_Idle_Anim="Idle"
    TurretIdle="MG_Idle"
    TurretIdleUpDown="MG_UpDown"
    TurretBurst="MG_Burst"
    ShotGun_BoltLeverAnim="AR_Pump"
    ShotGun_Reload="AR_Reload3"
    ShotGun_Crouch_Pump="AR_Crouch_Pump"
    ShotGun_Crouch_Reload3="AR_Crouch_Reload3"
    ShotGun_Prone_Pump="AR_Prone_Pump"
    ShotGun_Prone_Reload3="AR_Prone_Reload3"
    Hit_AR[0]="Hit_F"
    Hit_AR[1]="Hit_B"
    Hit_AR[2]="Hit_L"
    Hit_AR[3]="Hit_R"
    Hit_Head="Hit_Head"
    Hit_AR_Cr[0]="Hit_CrouchF"
    Hit_AR_Cr[1]="Hit_CrouchB"
    Hit_AR_Cr[2]="Hit_CrouchL"
    Hit_AR_Cr[3]="Hit_CrouchR"
    Hit_Pr="Hit_Prone"
    Death_F[0]="DeathF"
    Death_F[1]="DeathF2"
    Death_F[2]="DeathF3"
    Death_B[0]="DeathB"
    Death_B[1]="DeathB2"
    Death_B[2]="DeathB3"
    Death_L[0]="DeathL"
    Death_L[1]="DeathL2"
    Death_L[2]="DeathL3"
    Death_R[0]="DeathR"
    Death_R[1]="DeathR2"
    Death_R[2]="DeathR3"
    Death_Head="Death_Head"
    Death_Cr_F[0]="Death_CrouchF"
    Death_Cr_F[1]="Death_CrouchF2"
    Death_Cr_B[0]="Death_CrouchB"
    Death_Cr_B[1]="Death_CrouchB2"
    Death_Cr_L[0]="Death_CrouchL"
    Death_Cr_L[1]="Death_CrouchL2"
    Death_Cr_R[0]="Death_CrouchR"
    Death_Cr_R[1]="Death_CrouchR2"
    Death_Cr_Head="Death_Crouch_Head"
    Death_Pr="Death_Prone"
    Death_Frag_F="Death_FragF"
    Death_Frag_B="Death_FragB"
    Death_Frag_L="Death_FragL"
    Death_Frag_R="Death_FragR"
    Bomb_Plant="DemoPack_Plant"
    Bomb_Defuse="DemoPack_Defuse"
    Crouch_Bomb_Plant="Demopack_Crouch_Plant"
    Crouch_Bomb_Defuse="Demopack_Crouch_Defuse"
    Prone_Bomb_Plant="Demopack_Prone_Plant"
    Prone_Bomb_Defuse="Demopack_Prone_Defuse"
    Bomb_Throw="Throw"
    DemoPack_Plant_PutDown_Anim="DemoPack_Plant_PutDown"
    DemoPack_Defuse_PutDown_Anim="DemoPack_Defuse_PutDown"
    DemoPack_Plant_Crouch_PutDown_Anim="DemoPack_Plant_Crouch_PutDown"
    DemoPack_Defuse_Crouch_PutDown_Anim="DemoPack_Defuse_Crouch_PutDown"
    DemoPack_Plant_Prone_PutDown_Anim="DemoPack_Plant_Prone_PutDown"
    DemoPack_Defuse_Prone_PutDown_Anim="DemoPack_Defuse_Prone_PutDown"
    DemoPack_Throw_Anim="DemoPack_Throw"
    DemoPack_Throw_Crouch_Anim="DemoPack_Crouch_Throw"
    DemoPack_Throw_Prone_Anim="DemoPack_Prone_Throw"
    MainRootBone="Main_Dummy"
    MainRotateBone="Main_Rotate"
    RootBone="Bip01"
    HeadBone="bip01 head"
    SpineBone="bip01 spine"
    SpineBone1="Bip01 Spine1"
    SpineBone2="bip01 spine2"
    PelvisBone="Bip01 Pelvis"
    LightHue=204
    LightSaturation=0
    LightBrightness=255.0000000
    LightRadius=3.0000000
    bActorShadows=true
    LODBias=1.8000000
    PrePivot=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
    AmbientGlow=0
    MaxLights=8
    ScaleGlow=0.3000000
    CollisionRadius=38.0000000
    CollisionHeight=74.0000000
    bUseCylinderCollision=false
    bNetNotify=true
    RotationRate=(Pitch=3072,Yaw=20000,Roll=2048)
    // Reference: KarmaParamsSkel'WGame_Decompressed.wPawn.PawnKParams'
    begin object name="PawnKParams" class=Engine.KarmaParamsSkel
        KConvulseSpacing=(Min=0.5000000,Max=2.2000000)
        KLinearDamping=0.1500000
        KAngularDamping=0.0500000
        KBuoyancy=1.0000000
        KStartEnabled=true
        KVelDropBelowThreshold=50.0000000
        bHighDetailOnly=false
        KFriction=0.6000000
        KRestitution=0.3000000
        KImpactThreshold=500.0000000
    end object
    KParams=PawnKParams
}