/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeapon.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:2
 *	Properties:148
 *	Functions:167
 *	States:2
 *
 *******************************************************************************/
class wWeapon extends Inventory
    dependson(Inventory)
    dependson(wWeaponBaseParams)
    dependson(wWeaponAcce)
    dependson(WeaponAttachment)
    dependson(InventoryAttachment)
    dependson(wGameManager)
    dependson(wWeaponCustomInfoParam)
    dependson(wWeaponCustomPartsParam)
    dependson(wItemResourceParam)
    dependson(wItemBaseParam)
    dependson(wWeaponManager)
    dependson(wWeaponFire)
    dependson(wSkinShell)
    dependson(GameReplicationInfo)
    dependson(PlayerReplicationInfo)
    dependson(TeamInfo)
    dependson(wWeaponRes_Base)
    dependson(Pickup)
    dependson(WeaponPickup)
    dependson(wGameStateStorageSender)
    dependson(wAmmunition)
    dependson(AnnouncerVoice)
    dependson(wMatchMaker)
    dependson(wGameSettings)
    dependson(wWeaponPickup)
    dependson(Canvas)
    dependson(wProjectile)
    native
    nativereplication
    abstract
    notplaceable
    hidedropdown;

const NUM_FIRE_MODES = 3;

enum EWeaponClientState
{
    WS_None,
    WS_Hidden,
    WS_BringUp,
    WS_PutDown,
    WS_ReadyToFire
};

enum EMeleeState
{
    WMS_None,
    WMS_Attacking
};

var() Actor.eWeaponType WeaponType;
var wWeaponBaseParams BaseParams;
var class<wWeaponRes_Base> ResParams;
var string BaseName;
var bool bHoldFire;
var float fAccumulationOverHeat;
var() class<wWeaponFire> FireModeClass[3];
var() wWeaponFire FireMode[3];
var() wAmmunition Ammo[3];
var() name IdleAnim;
var() name RestAnim;
var() name RunAnim;
var() name SprintAnim;
var() name SelectAnim;
var() name SelectNewAnim;
var() name PutDownAnim;
var name PutdownQuickAnim;
var name ProneMoveAnim;
var name SprintUpAnim;
var() float IdleAnimRate;
var() float RestAnimRate;
var() float RunAnimRate;
var() float SprintAnimRate;
var() float SelectAnimRate;
var() float SelectNewAnimRate;
var() float PutDownAnimRate;
var() float PutDownQuickAnimRate;
var() Sound SelectSound;
var() string SelectForce;
var Sound NullSound;
var() int BotMode;
var() float AIRating;
var float CurrentRating;
var() bool bMeleeWeapon;
var() bool bSniping;
var bool bShowChargingBar;
var bool bMatchWeapons;
var() bool bCanThrow;
var() bool bForceSwitch;
var() deprecated bool bNotInPriorityList;
var bool bNotInDemo;
var bool bNoVoluntarySwitch;
var bool bSpectated;
var bool bDebugging;
var bool bNoInstagibReplace;
var bool bInitOldMesh;
var bool bUseOldWeaponMesh;
var bool bEndOfRound;
var bool bNoAmmoInstances;
var bool bBerserk;
var bool bQuickDropAnim;
var bool bQuickThrow;
var bool bCanSelectNew;
var int AmmoCharge[3];
var Mesh OldMesh;
var string OldPickup;
var(OldFirstPerson) float OldDrawScale;
var(OldFirstPerson) float OldCenteredOffsetY;
var(OldFirstPerson) Vector OldPlayerViewOffset;
var(OldFirstPerson) Vector OldSmallViewOffset;
var(OldFirstPerson) Rotator OldPlayerViewPivot;
var(OldFirstPerson) int OldCenteredRoll;
var(OldFirstPerson) int OldCenteredYaw;
var() noimport localized string Description;
var transient bool bPendingSwitch;
var(FirstPerson) Vector EffectOffset;
var() localized string MessageNoAmmo;
var(FirstPerson) float DisplayFOV;
var() wWeapon.EWeaponClientState ClientState;
var() byte ExchangeFireModes;
var() byte Priority;
var() deprecated byte DefaultPriority;
var float Hand;
var float RenderedHand;
var Color HudColor;
var wWeapon OldWeapon;
var(FirstPerson) Vector SmallViewOffset;
var(FirstPerson) Vector SmallEffectOffset;
var(FirstPerson) float CenteredOffsetY;
var(FirstPerson) int CenteredRoll;
var(FirstPerson) int CenteredYaw;
var int CustomCrosshair;
var Color CustomCrossHairColor;
var float CustomCrossHairScale;
var string CustomCrossHairTextureName;
var Texture CustomCrossHairTexture;
var float DownDelay;
var float MinReloadPct;
var wSkinShell wHands;
var string szWeaponAttachmentName;
var array<wWeaponAcce> Parts;
var bool bSprint;
var string szFireModeClass;
var transient Vector vStanceOffset;
var transient Vector vPartsOffset;
var transient Vector vBreathOffset;
var transient bool bBreathOffsetXLeft;
var transient bool bBreathOffsetYUp;
var transient float fBreathOffsetReflecTime_X;
var transient float fBreathOffsetReflecTime_Y;
var transient float fBreathSeconds;
var float fBreathRatio;
var transient Vector vAttackedOffset;
var transient Rotator rAttackedRot;
var transient Rotator rWalkingSwayRot;
var transient Rotator rSwayDestRot;
var transient Rotator rSwayRot;
var transient Rotator rSway_LastCameraRot;
var transient float fSwayAccumTime_Pitch;
var transient float fSwayAccumTime_Yaw;
var transient Rotator rFiringSwayDestRot;
var transient Rotator rFiringSwayRot;
var transient Rotator rFiringSway_LastCameraRot;
var transient float fFiringSwayAccumTime_Pitch;
var transient float fFiringSwayAccumTime_Yaw;
var float wFiringSwayDeltaTime;
var transient Rotator rFiringSwayDestRot_Aim;
var transient Rotator rFiringSwayRot_Aim;
var transient Rotator rFiringSway_LastCameraRot_Aim;
var transient float fFiringSwayAccumTime_Pitch_Aim;
var transient float fFiringSwayAccumTime_Yaw_Aim;
var float fMeleeDelay;
var float fFireDelay;
var bool bActiveMelee;
var bool bActiveFire;
var int iPainting_Item_ID;
var byte byActionThrowsWeapon;
var wWeapon.EMeleeState MeleeState;
var float fStancePivot;
var bool bLanding;
var bool bQuickAimZoom;
var bool bQuickReload;
var bool bPickupChange;
var bool wt_TestAim;
var int wt_index;
var float wt_RandomMul;
var int wt_BoundingMax;
var array<float> wt_x;
var array<float> wt_y;
var array<float> wt_RandomWeight;
var float wtAim_RandomMul;
var int wtAim_BoundingMax;
var array<float> wtAim_x;
var array<float> wtAim_y;
var array<float> wtAim_RandomWeight;
var transient bool bBlendSprint_AdsIdle;
var int SRand_FireCount;
var int SRand_ReloadCount;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        bHoldFire, fAccumulationOverHeat,
        Ammo, AmmoCharge,
        iPainting_Item_ID, bPickupChange;

    // Pos:0x0d
    reliable if(Role == 4)
        ClientWriteStats, ClientWeaponThrown,
        ClientWeaponSet, ClientQuickReload,
        ClientQuickAimZoom, ClientForceAmmoUpdate,
        ClientAddMagazine, wLoadOut_Client;

    // Pos:0x1a
    reliable if(Role < 4)
        ServerPlayOwnedSound, ServerStopFire,
        ServerStartFire, ServerThrowingWeapon,
        ServerCancelFire, ServerMeleeFire;

}

// Export UwWeapon::execInitWeaponFires(FFrame&, void* const)
native final function InitWeaponFires();
simulated function float ChargeBar();
simulated function class<wAmmunition> GetAmmoClass(int Mode)
{
    return none;
}

simulated function MaxOutAmmo()
{
    // End:0x29
    if(bNoAmmoInstances)
    {
        AmmoCharge[0] = MaxAmmo(0);
        AmmoCharge[1] = MaxAmmo(1);
        return;
    }
    // End:0x57
    if(Ammo[0] != none)
    {
        Ammo[0].AmmoAmount = Ammo[0].MaxAmmo;
    }
    // End:0x85
    if(Ammo[1] != none)
    {
        Ammo[1].AmmoAmount = Ammo[1].MaxAmmo;
    }
}

simulated function SuperMaxOutAmmo()
{
    // End:0x25
    if(bNoAmmoInstances)
    {
        AmmoCharge[0] = 999;
        AmmoCharge[1] = 999;
        return;
    }
    // End:0x48
    if(Ammo[0] != none)
    {
        Ammo[0].AmmoAmount = 999;
    }
    // End:0x6b
    if(Ammo[1] != none)
    {
        Ammo[1].AmmoAmount = 999;
    }
}

simulated function int MaxAmmo(int Mode)
{
    return BaseParams.iAmmo_Max;
    return 0;
}

simulated function FillToInitialAmmo()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial;
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
}

simulated function FillToDefaultAmmo()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial;
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
}

simulated function int AmmoAmount(int Mode)
{
    // End:0x1d
    if(bNoAmmoInstances)
    {
        return AmmoCharge[0];
        return AmmoCharge[Mode];
    }
    // End:0x43
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].AmmoAmount;
    }
    return 0;
}

simulated function class<Pickup> AmmoPickupClass(int Mode)
{
    return FireMode[Mode].AmmoClass.default.PickupClass;
    return none;
}

simulated function bool AmmoMaxed(int Mode)
{
    // End:0x22
    if(bNoAmmoInstances)
    {
        return AmmoCharge[Mode] >= MaxAmmo(Mode);
    }
    // End:0x35
    if(Ammo[Mode] == none)
    {
        return false;
    }
    return Ammo[Mode].AmmoAmount >= MaxAmmo(Mode);
}

simulated event GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
    // End:0x29
    if(bNoAmmoInstances)
    {
        MaxAmmoPrimary = float(MaxAmmo(0));
        CurAmmoPrimary = float(AmmoCharge[0]);
        return;
    }
    // End:0x38
    if(Ammo[0] == none)
    {
        return;
    }
    MaxAmmoPrimary = float(Ammo[0].MaxAmmo);
    CurAmmoPrimary = float(Ammo[0].AmmoAmount);
}

simulated function float AmmoStatus(optional int Mode)
{
    // End:0x26
    if(bNoAmmoInstances)
    {
        return float(AmmoCharge[Mode]) / float(MaxAmmo(Mode));
    }
    // End:0x40
    if(Ammo[Mode] == none)
    {
        return 0.0;
    }
    // End:0x6f
    else
    {
        return float(Ammo[Mode].AmmoAmount) / float(Ammo[Mode].MaxAmmo);
    }
}

function bool SeverConsumeAmmo(int Mode, float Load, optional bool bAmountNeededIsMax)
{
    local int AmountNeeded;

    Log("bNoAmmoInstances = " @ string(bNoAmmoInstances));
    // End:0x113
    if(bNoAmmoInstances)
    {
        AmountNeeded = int(Load);
        // End:0x68
        if(bAmountNeededIsMax && AmmoCharge[Mode] < AmountNeeded)
        {
            AmountNeeded = AmmoCharge[Mode];
        }
        // End:0x97
        if(AmmoCharge[Mode] < AmountNeeded)
        {
            Log("CheckOutOfAmmo");
            CheckOutOfAmmo();
            return false;
        }
        AmmoCharge[Mode] -= AmountNeeded;
        Log("SeverConsumeAmmo netUpdateTime = " @ string(NetUpdateTime));
        // End:0x111
        if(Level.NetMode == 0 || Level.NetMode == 2)
        {
            CheckOutOfAmmo();
        }
        return true;
    }
    // End:0x147
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].UseAmmo(int(Load), bAmountNeededIsMax);
    }
    return true;
}

function bool AddAmmo(int AmmoToAdd, int Mode)
{
    // End:0xa5
    if(bNoAmmoInstances)
    {
        // End:0x44
        if(Level.GRI.WeaponBerserk > 1.0)
        {
            AmmoCharge[Mode] = MaxAmmo(Mode);
        }
        // End:0x8a
        else
        {
            // End:0x8a
            if(AmmoCharge[Mode] < MaxAmmo(Mode))
            {
                AmmoCharge[Mode] = Min(MaxAmmo(Mode), AmmoCharge[Mode] + AmmoToAdd);
            }
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
        return true;
    }
    // End:0xd1
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].AddAmmo(AmmoToAdd);
    }
}

simulated function bool HasAmmo()
{
    // End:0x8f
    if(bNoAmmoInstances)
    {
        return FireMode[0] != none && AmmoCharge[0] >= FireMode[0].AmmoPerFire || FireMode[1] != none && AmmoCharge[1] >= FireMode[1].AmmoPerFire || FireMode[2] != none && AmmoCharge[2] >= FireMode[2].AmmoPerFire;
    }
    return Ammo[0] != none && FireMode[0] != none && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire || Ammo[1] != none && FireMode[1] != none && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire || Ammo[2] != none && FireMode[2] != none && Ammo[2].AmmoAmount >= FireMode[2].AmmoPerFire;
}

simulated function bool NeedAmmo(int Mode)
{
    // End:0x25
    if(bNoAmmoInstances)
    {
        return AmmoCharge[Mode] < BaseParams.iAmmo_Initial;
    }
    // End:0x61
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].AmmoAmount < Ammo[Mode].InitialAmount;
    }
    return false;
}

simulated function float DesireAmmo(class<Inventory> NewAmmoClass, bool bDetour)
{
    return 0.0;
}

simulated function bool CheckOutOfAmmo()
{
    // End:0x8c
    if(Instigator != none && Instigator.Weapon == self)
    {
        // End:0x50
        if(bNoAmmoInstances)
        {
            // End:0x4e
            if(AmmoCharge[0] <= 0 && AmmoCharge[1] <= 0)
            {
                OutOfAmmo();
                return false;
            }
            return true;
        }
        // End:0x6e
        if(Ammo[0] != none)
        {
            Ammo[0].CheckOutOfAmmo();
        }
        // End:0x8c
        if(Ammo[1] != none)
        {
            Ammo[1].CheckOutOfAmmo();
        }
    }
    return true;
}

simulated function PostNetReceive();
simulated function DrawWeaponInfo(Canvas C);
simulated function NewDrawWeaponInfo(Canvas C, float YPos);
function StartDebugging();
simulated function ClientWriteStats(byte Mode, bool bMatch, bool bAllowFire, bool bDelay, bool bAlt, float wait)
{
    Log(string(self) $ " Same weapon " $ string(bMatch) $ " Mode " $ string(Mode) $ " Allow fire " $ string(bAllowFire) $ " delay start fire " $ string(bDelay) $ " alt firing " $ string(bAlt) $ " next fire wait " $ string(wait));
}

function class<DamageType> GetDamageType();
function HackPlayFireSound()
{
    // End:0x3f
    if(FireMode[0] != none && FireMode[0].FireSound != none)
    {
        PlaySound(FireMode[0].FireSound, 0, 1.0);
    }
}

function float RangedAttackTime()
{
    return 0.0;
}

function bool RecommendRangedAttack()
{
    return false;
}

function bool RecommendLongRangedAttack()
{
    return false;
}

function bool FocusOnLeader(bool bLeaderFiring)
{
    return false;
}

function FireHack(byte Mode);
function bool SplashDamage()
{
    return FireMode[BotMode].bSplashDamage;
}

function bool RecommendSplashDamage()
{
    return FireMode[BotMode].bRecommendSplashDamage;
}

function float GetDamageRadius()
{
    // End:0x23
    if(FireMode[BotMode].ProjectileClass == none)
    {
        return 0.0;
    }
    // End:0x41
    else
    {
        return FireMode[BotMode].ProjectileClass.default.DamageRadius;
    }
}

function float RefireRate()
{
    return FireMode[BotMode].BotRefireRate;
}

function bool FireOnRelease()
{
    return FireMode[BotMode].bFireOnRelease;
}

simulated function Loaded();
simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local int i;
    local string t;
    local name Anim;
    local float frame, Rate;

    Canvas.SetDrawColor(0, byte(255), 0);
    // End:0x8e
    if(Pawn(Owner) != none && Pawn(Owner).PlayerReplicationInfo != none)
    {
        Canvas.DrawText("WEAPON " $ GetItemName(string(self)) $ " Owner " $ Pawn(Owner).PlayerReplicationInfo.PlayerName);
    }
    // End:0xc2
    else
    {
        Canvas.DrawText("WEAPON " $ GetItemName(string(self)) $ " Owner " $ string(Owner));
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    t = "     STATE: " $ string(GetStateName()) $ " Timer: " $ string(TimerCounter) $ " Client state ";
    switch(ClientState)
    {
        // End:0x14b
        case 0:
            t = t $ "None";
            // End:0x1c9
            break;
        // End:0x168
        case 1:
            t = t $ "Hidden";
            // End:0x1c9
            break;
        // End:0x186
        case 2:
            t = t $ "BringUp";
            // End:0x1c9
            break;
        // End:0x1a4
        case 3:
            t = t $ "PutDown";
            // End:0x1c9
            break;
        // End:0x1c6
        case 4:
            t = t $ "ReadyToFire";
            // End:0x1c9
            break;
        // End:0xffff
        default:
            Canvas.DrawText(t, false);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            // End:0x25c
            if(DrawType == 8)
            {
                Canvas.DrawText("     StaticMesh " $ GetItemName(string(StaticMesh)) $ " AmbientSound " $ string(AmbientSound), false);
            }
            // End:0x29f
            else
            {
                Canvas.DrawText("     Mesh " $ GetItemName(string(Mesh)) $ " AmbientSound " $ string(AmbientSound), false);
            }
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            // End:0x499
            if(Mesh != none)
            {
                Canvas.SetDrawColor(byte(255), 0, 0);
                GetAnimParams(0, Anim, frame, Rate);
                t = "     AnimSequence " $ string(Anim) $ " Frame " $ string(frame) $ " Rate " $ string(Rate);
                // End:0x36c
                if(bAnimByOwner)
                {
                    t = t $ " Anim by Owner";
                }
                Canvas.DrawText(t, false);
                YPos += YL;
                Canvas.SetPos(4.0, YPos);
                Canvas.SetDrawColor(0, byte(255), 0);
                t = "Eyeheight " $ string(Instigator.EyeHeight) $ " base " $ string(Instigator.BaseEyeHeight) $ " landbob " $ string(Instigator.LandBob) $ " just landed " $ string(Instigator.bJustLanded) $ " land recover " $ string(Instigator.bLandRecovery);
                Canvas.DrawText(t, false);
                YPos += YL;
                Canvas.SetPos(4.0, YPos);
            }
            i = 0;
            J0x4a0:
            // End:0x598 [While If]
            if(i < 3)
            {
                // End:0x508
                if(FireMode[i] == none)
                {
                    Canvas.DrawText("NO FIREMODE " $ string(i));
                    YPos += YL;
                    Canvas.SetPos(4.0, YPos);
                }
                // End:0x52c
                else
                {
                    FireMode[i].DisplayDebug(Canvas, YL, YPos);
                }
                Canvas.DrawText("Ammunition " $ string(i) $ " amount " $ string(AmmoAmount(i)));
                YPos += YL;
                Canvas.SetPos(4.0, YPos);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4a0;
            }
            Canvas.DrawText("Location: " $ string(Location) $ "(PAWN : " $ string(Instigator.Location) $ ") Rotation " $ string(Rotation), false);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("bSprint: " $ string(bSprint) $ "/FireMode[0].bIsFiring:" $ string(FireMode[0].bIsFiring), false);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("(H)PlayerViewOffset:" $ string(PlayerViewOffset) $ "vBreathOffset:" $ string(vBreathOffset), false);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    local wWeapon Recommended;
    local float oldRating;

    // End:0x2f
    if(Instigator == none || Instigator.Controller == none)
    {
        rating = -2.0;
    }
    // End:0x56
    else
    {
        rating = RateSelf() + Instigator.Controller.WeaponPreference(self);
    }
    // End:0xa8
    if(Inventory != none)
    {
        Recommended = Inventory.RecommendWeapon(oldRating);
        // End:0xa8
        if(Recommended != none && oldRating > rating)
        {
            rating = oldRating;
            return Recommended;
        }
    }
    return self;
}

function SetAITarget(Actor t);
function byte BestMode()
{
    // End:0x25
    if(Instigator.Controller.bFire != 0)
    {
        return 0;
    }
    // End:0x47
    else
    {
        // End:0x47
        if(Instigator.Controller.bAltFire != 0)
        {
            return 1;
        }
    }
    // End:0x56
    if(FRand() < 0.50)
    {
        return 1;
    }
    return 0;
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
    local int newmode;
    local Controller C;

    C = Instigator.Controller;
    newmode = BestMode();
    // End:0x52
    if(newmode == 0)
    {
        C.bFire = 1;
        C.bAltFire = 0;
    }
    // End:0x74
    else
    {
        C.bFire = 0;
        C.bAltFire = 1;
    }
    // End:0x7f
    if(bFinished)
    {
        return true;
    }
    // End:0xb6
    if(FireMode[BotMode].IsFiring())
    {
        // End:0xab
        if(BotMode == newmode)
        {
            return true;
        }
        // End:0xb6
        else
        {
            StopFire(BotMode);
        }
    }
    // End:0xda
    if(!ReadyToFire(newmode) || ClientState != 4)
    {
        return false;
    }
    BotMode = newmode;
    StartFire(newmode);
    return true;
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return FireMode[BotMode].GetFireStart(X, Y, Z);
}

simulated function float RateSelf()
{
    // End:0x19
    if(!HasAmmo())
    {
        CurrentRating = -2.0;
    }
    // End:0x55
    else
    {
        // End:0x36
        if(Instigator.Controller == none)
        {
            return 0.0;
        }
        // End:0x55
        else
        {
            CurrentRating = Instigator.Controller.RateWeapon(self);
        }
    }
    return CurrentRating;
}

function float GetAIRating()
{
    return AIRating;
}

function float SuggestAttackStyle()
{
    return 0.0;
}

function float SuggestDefenseStyle()
{
    return 0.0;
}

function bool SplashJump()
{
    return FireMode[BotMode].bSplashJump;
}

function bool CanAttack(Actor Other)
{
    local float dist, CheckDist;
    local Vector HitLocation, HitNormal, X, Y, Z, projStart;

    local Actor HitActor;
    local int M;
    local bool bInstantHit;

    // End:0x23
    if(Instigator == none || Instigator.Controller == none)
    {
        return false;
    }
    dist = VSize(Instigator.Location - Other.Location);
    // End:0x83
    if(dist > FireMode[0].MaxRange() && dist > FireMode[1].MaxRange())
    {
        return false;
    }
    // End:0xa4
    if(!Instigator.Controller.LineOfSightTo(Other))
    {
        return false;
    }
    M = 0;
    J0xab:
    // End:0x15f [While If]
    if(M < 3)
    {
        // End:0xcb
        if(FireMode[M] == none)
        {
        }
        // End:0x155
        else
        {
            // End:0xee
            if(FireMode[M].bInstantHit)
            {
                bInstantHit = true;
            }
            // End:0x155
            else
            {
                CheckDist = FMax(CheckDist, 0.50 * FireMode[M].ProjectileClass.default.Speed);
                CheckDist = FMax(CheckDist, 300.0);
                CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
            }
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0xab;
    }
    GetAxes(Instigator.Controller.Rotation, X, Y, Z);
    projStart = GetFireStart(X, Y, Z);
    // End:0x1f4
    if(bInstantHit)
    {
        HitActor = Trace(HitLocation, HitNormal, Other.Location + Other.CollisionHeight * vect(0.0, 0.0, 0.80), projStart, true);
    }
    // End:0x251
    else
    {
        HitActor = Trace(HitLocation, HitNormal, projStart + CheckDist * Normal(Other.Location + Other.CollisionHeight * vect(0.0, 0.0, 0.80) - Location), projStart, true);
    }
    // End:0x26f
    if(HitActor == none || HitActor == Other)
    {
        return true;
    }
    // End:0x296
    if(Pawn(HitActor) == none)
    {
        return !HitActor.BlocksShotAt(Other);
    }
    // End:0x2e3
    if(Pawn(HitActor).Controller == none || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
    {
        return true;
    }
    return false;
}

simulated function SetGRI(GameReplicationInfo G);
simulated function Destroyed()
{
    local int M;

    Instigator.PlayOwnedSound(NullSound, 3,,,,, false);
    // End:0x58
    if(Role < 4)
    {
        ServerPlayOwnedSound(NullSound, 3,,,,, false);
        Instigator.ServerSpecPlaySoundHK(NullSound, 3,,,,, false);
    }
    AmbientSound = none;
    M = 0;
    J0x66:
    // End:0xd2 [While If]
    if(M < 3)
    {
        // End:0x98
        if(FireMode[M] != none)
        {
            FireMode[M].DestroyEffects();
        }
        // End:0xc8
        if(Ammo[M] != none)
        {
            Ammo[M].Destroy();
            Ammo[M] = none;
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x66;
    }
    M = 0;
    J0xd9:
    // End:0x112 [While If]
    if(M < Parts.Length)
    {
        Parts[M].Destroy();
        Parts[M] = none;
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0xd9;
    }
    Parts.Length = 0;
    // End:0x138
    if(wHands != none)
    {
        wHands.Destroy();
        wHands = none;
    }
    super.Destroyed();
}

simulated function Reselect();
simulated function bool WeaponCentered()
{
    return bSpectated || Hand > float(1);
}

function RenderScope(Canvas Canv);
simulated event RenderOverlays(Canvas Canvas)
{
    local int M;

    // End:0x88
    if(Instigator == none || Instigator.Controller == none || Level.GetLocalPlayerController() != Instigator.Controller || Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).IsSpectating())
    {
        return;
    }
    M = 0;
    J0x8f:
    // End:0xd0 [While If]
    if(M < 3)
    {
        // End:0xc6
        if(FireMode[M] != none)
        {
            FireMode[M].DrawMuzzleFlash(Canvas);
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
    // End:0xf0
    if(class'PlayerController'.default.bSmallWeapons)
    {
        PlayerViewOffset = SmallViewOffset;
    }
    // End:0xfb
    else
    {
        PlayerViewOffset = default.PlayerViewOffset;
    }
    SetRotation(Instigator.GetViewRotation());
    ApplyOffset();
    SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
    PreDrawFPWeapon();
    bDrawingFirstPerson = true;
    Canvas.DrawActor(self, false, false, DisplayFOV);
    bDrawingFirstPerson = false;
    // End:0x17d
    if(Hand == float(0))
    {
        PlayerViewOffset.Y = 0.0;
    }
}

simulated function ApplyOffset_Trans()
{
    PlayerViewOffset += vStanceOffset;
    PlayerViewOffset += vPartsOffset;
    PlayerViewOffset += vBreathOffset;
}

simulated function ApplyOffset_Rot()
{
    local Rotator rBone;

    rBone = rot(0, 0, 0);
    rBone.Yaw = -rSwayRot.Yaw;
    rBone.Yaw = -rFiringSwayRot.Yaw;
    SetBoneRotation('Bone_Pibot01', rBone, 0, 1.0);
    rBone = rot(0, 0, 0);
    rBone.Roll = -rSwayRot.Pitch;
    rBone.Roll = -rFiringSwayRot.Pitch;
    SetBoneRotation('Bone_Pitch', rBone, 0, 1.0);
}

simulated function ApplyOffset()
{
    ApplyOffset_Rot();
    ApplyOffset_Trans();
}

simulated function PreDrawFPWeapon();
simulated function SetHand(float InHand)
{
    Hand = InHand;
}

simulated function GetViewAxes(out Vector XAxis, out Vector YAxis, out Vector ZAxis)
{
    // End:0x36
    if(Instigator.Controller == none)
    {
        GetAxes(Instigator.Rotation, XAxis, YAxis, ZAxis);
    }
    // End:0x5e
    else
    {
        GetAxes(Instigator.Controller.Rotation, XAxis, YAxis, ZAxis);
    }
}

simulated function Vector CenteredEffectStart()
{
    return Instigator.Location;
}

simulated function Vector GetEffectStart()
{
    local Vector X, Y, Z;

    // End:0x111
    if(Instigator.IsFirstPerson())
    {
        // End:0x22
        if(WeaponCentered())
        {
            return CenteredEffectStart();
        }
        GetViewAxes(X, Y, Z);
        // End:0xad
        if(class'PlayerController'.default.bSmallWeapons)
        {
            return Instigator.Location + Instigator.CalcDrawOffset(self) + SmallEffectOffset.X * X + SmallEffectOffset.Y * Y * Hand + SmallEffectOffset.Z * Z;
        }
        // End:0x10e
        else
        {
            return Instigator.Location + Instigator.CalcDrawOffset(self) + EffectOffset.X * X + EffectOffset.Y * Y * Hand + EffectOffset.Z * Z;
        }
    }
    // End:0x158
    else
    {
        return Instigator.Location + Instigator.EyeHeight * vect(0.0, 0.0, 0.50) + vector(Instigator.Rotation) * 40.0;
    }
}

simulated function IncrementFlashCount(int Mode)
{
    // End:0xb8
    if(WeaponAttachment(ThirdPersonActor) != none)
    {
        WeaponAttachment(ThirdPersonActor).FiringMode = byte(Mode);
        ++ WeaponAttachment(ThirdPersonActor).FlashCount;
        // End:0x8b
        if(Mode == 2)
        {
            // End:0x75
            if(self.IsA('wMeleeWeapon'))
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = true;
            }
            // End:0x8b
            else
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = false;
            }
        }
        // End:0xb8
        if(Level.NetMode == 2)
        {
            WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
        }
    }
}

simulated function ZeroFlashCount(int Mode)
{
    // End:0x77
    if(WeaponAttachment(ThirdPersonActor) != none)
    {
        WeaponAttachment(ThirdPersonActor).FiringMode = byte(Mode);
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
        WeaponAttachment(ThirdPersonActor).FlashCount = 0;
        WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
    }
}

simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    local wWeapon newWeapon;

    // End:0xa8
    if(InventoryGroup == f)
    {
        // End:0xa3
        if(!HasAmmo())
        {
            // End:0x33
            if(Inventory == none)
            {
                newWeapon = none;
            }
            // End:0x53
            else
            {
                newWeapon = Inventory.WeaponChange(f, bSilent);
            }
            // End:0x9a
            if(!bSilent && newWeapon == none && Instigator.IsHumanControlled())
            {
                Instigator.ClientMessage(ItemName $ MessageNoAmmo);
            }
            return newWeapon;
        }
        // End:0xa5
        else
        {
            return self;
        }
    }
    // End:0xd3
    else
    {
        // End:0xb8
        if(Inventory == none)
        {
            return none;
        }
        // End:0xd3
        else
        {
            return Inventory.WeaponChange(f, bSilent);
        }
    }
}

simulated function wWeapon WeaponChangeWClass(name wClass)
{
    // End:0x10
    if(IsA(wClass))
    {
        return self;
    }
    // End:0x35
    else
    {
        // End:0x20
        if(Inventory == none)
        {
            return none;
        }
        // End:0x35
        else
        {
            return Inventory.WeaponChangeWClass(wClass);
        }
    }
}

simulated function wWeapon WeaponChangeWID(int iWeaponID)
{
    // End:0x1d
    if(BaseParams.iWeaponID == iWeaponID)
    {
        return self;
    }
    // End:0x42
    else
    {
        // End:0x2d
        if(Inventory == none)
        {
            return none;
        }
        // End:0x42
        else
        {
            return Inventory.WeaponChangeWID(iWeaponID);
        }
    }
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x19c
    if(HasAmmo())
    {
        // End:0x29
        if(CurrentChoice == none)
        {
            // End:0x26
            if(CurrentWeapon != self)
            {
                CurrentChoice = self;
            }
        }
        // End:0x19c
        else
        {
            // End:0xa7
            if(InventoryGroup == CurrentWeapon.InventoryGroup)
            {
                // End:0xa4
                if(GroupOffset < CurrentWeapon.GroupOffset && CurrentChoice.InventoryGroup != InventoryGroup || GroupOffset > CurrentChoice.GroupOffset)
                {
                    CurrentChoice = self;
                }
            }
            // End:0x19c
            else
            {
                // End:0xe9
                if(InventoryGroup == CurrentChoice.InventoryGroup)
                {
                    // End:0xe6
                    if(GroupOffset > CurrentChoice.GroupOffset)
                    {
                        CurrentChoice = self;
                    }
                }
                // End:0x19c
                else
                {
                    // End:0x152
                    if(InventoryGroup > CurrentChoice.InventoryGroup)
                    {
                        // End:0x14f
                        if(InventoryGroup < CurrentWeapon.InventoryGroup || CurrentChoice.InventoryGroup > CurrentWeapon.InventoryGroup)
                        {
                            CurrentChoice = self;
                        }
                    }
                    // End:0x19c
                    else
                    {
                        // End:0x19c
                        if(CurrentChoice.InventoryGroup > CurrentWeapon.InventoryGroup && InventoryGroup < CurrentWeapon.InventoryGroup)
                        {
                            CurrentChoice = self;
                        }
                    }
                }
            }
        }
    }
    // End:0x1b0
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x1ca
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x19c
    if(HasAmmo())
    {
        // End:0x29
        if(CurrentChoice == none)
        {
            // End:0x26
            if(CurrentWeapon != self)
            {
                CurrentChoice = self;
            }
        }
        // End:0x19c
        else
        {
            // End:0xa7
            if(InventoryGroup == CurrentWeapon.InventoryGroup)
            {
                // End:0xa4
                if(GroupOffset > CurrentWeapon.GroupOffset && CurrentChoice.InventoryGroup != InventoryGroup || GroupOffset < CurrentChoice.GroupOffset)
                {
                    CurrentChoice = self;
                }
            }
            // End:0x19c
            else
            {
                // End:0xe9
                if(InventoryGroup == CurrentChoice.InventoryGroup)
                {
                    // End:0xe6
                    if(GroupOffset < CurrentChoice.GroupOffset)
                    {
                        CurrentChoice = self;
                    }
                }
                // End:0x19c
                else
                {
                    // End:0x152
                    if(InventoryGroup < CurrentChoice.InventoryGroup)
                    {
                        // End:0x14f
                        if(InventoryGroup > CurrentWeapon.InventoryGroup || CurrentChoice.InventoryGroup < CurrentWeapon.InventoryGroup)
                        {
                            CurrentChoice = self;
                        }
                    }
                    // End:0x19c
                    else
                    {
                        // End:0x19c
                        if(CurrentChoice.InventoryGroup < CurrentWeapon.InventoryGroup && InventoryGroup > CurrentWeapon.InventoryGroup)
                        {
                            CurrentChoice = self;
                        }
                    }
                }
            }
        }
    }
    // End:0x1b0
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x1ca
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
}

function HolderDied()
{
    local int M;

    M = 0;
    J0x07:
    // End:0x6d [While If]
    if(M < 3)
    {
        // End:0x63
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
            // End:0x63
            if(FireMode[M].bFireOnRelease)
            {
                FireMode[M].ModeDoFire();
            }
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function bool CanThrow()
{
    local int Mode;

    Mode = 0;
    J0x07:
    // End:0x7a [While If]
    if(Mode < 3)
    {
        // End:0x47
        if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
        {
            return false;
        }
        // End:0x70
        if(FireMode[Mode].NextFireTime > Level.TimeSeconds)
        {
            return false;
        }
        ++ Mode;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return bCanThrow && ClientState == 4 || Level.NetMode == 1 || Level.NetMode == 2 && HasAmmo();
}

function RemoveWeapon()
{
    local int M;

    ClientWeaponThrown();
    M = 0;
    J0x0d:
    // End:0x46 [While If]
    if(M < 3)
    {
        // End:0x3c
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    // End:0x5c
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
    }
    Destroy();
}

function DropFrom(Vector StartLocation, Rotator StartRotation)
{
    local int M;
    local Pickup Pickup;

    // End:0x1a
    if(!bCanThrow || !HasAmmo())
    {
        return;
    }
    ClientWeaponThrown();
    M = 0;
    J0x27:
    // End:0x60 [While If]
    if(M < 3)
    {
        // End:0x56
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    // End:0x76
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
    }
    Pickup = Spawn(PickupClass,,, StartLocation, StartRotation);
    // End:0x177
    if(Pickup != none)
    {
        Pickup.InitDroppedPickupFor(self);
        Pickup.Velocity = Velocity;
        // End:0xe9
        if(Instigator.Health > 0)
        {
            wWeaponPickup(Pickup).bThrown = true;
        }
        wWeaponPickup(Pickup).iRepWeaponID = BaseParams.iWeaponID;
        wWeaponPickup(Pickup).iRepAddPartsID = InventoryClassAddPartsID;
        wWeaponPickup(Pickup).iPainting_Item_ID = iPainting_Item_ID;
        wWeaponPickup(Pickup).wLoadOut(wWeaponPickup(Pickup).iRepWeaponID, wWeaponPickup(Pickup).iRepAddPartsID);
    }
    Destroy();
}

simulated function DetachFromPawn(Pawn P)
{
    super.DetachFromPawn(P);
    P.AmbientSound = none;
}

simulated function ClientWeaponThrown()
{
    local int M;

    AmbientSound = none;
    Instigator.AmbientSound = none;
    // End:0x32
    if(Level.NetMode != 3)
    {
        return;
    }
    Instigator.DeleteInventory(self);
    M = 0;
    J0x49:
    // End:0x8a [While If]
    if(M < 3)
    {
        // End:0x80
        if(Ammo[M] != none)
        {
            Instigator.DeleteInventory(Ammo[M]);
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
    local int M;
    local wWeapon W;
    local bool bPossiblySwitch, bJustSpawned;

    Instigator = Other;
    // End:0x55
    if(W == none || W.Class != Class)
    {
        bJustSpawned = true;
        super.GiveTo(Other);
        bPossiblySwitch = true;
        W = self;
    }
    // End:0x71
    else
    {
        // End:0x71
        if(!W.HasAmmo())
        {
            bPossiblySwitch = true;
        }
    }
    // End:0x84
    if(Pickup == none)
    {
        bPossiblySwitch = true;
    }
    M = 0;
    J0x8b:
    // End:0xf0 [While If]
    if(M < 3)
    {
        // End:0xe6
        if(FireMode[M] != none)
        {
            FireMode[M].Instigator = Instigator;
            W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x8b;
    }
    // End:0x128
    if(!bJustSpawned)
    {
        M = 0;
        J0x102:
        // End:0x125 [While If]
        if(M < 3)
        {
            Ammo[M] = none;
            ++ M;
            // This is an implied JumpToken; Continue!
            goto J0x102;
        }
        Destroy();
    }
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned);
simulated function CheckPartsSet();
simulated function ClientWeaponSet(bool bPossiblySwitch)
{
    local int Mode, nStartWeaponIdx;

    Instigator = Pawn(Owner);
    bPendingSwitch = bPossiblySwitch;
    // End:0x41
    if(Instigator != none && Instigator.IsA('wHelicopter'))
    {
    }
    // End:0xaa
    else
    {
        // End:0xaa
        if(Instigator == none || Instigator.PlayerReplicationInfo == none || Instigator.PlayerReplicationInfo.bNoTeam == false && Instigator.PlayerReplicationInfo.Team == none)
        {
            GotoState('PendingClientWeaponSet');
            return;
        }
    }
    Mode = 0;
    J0xb1:
    // End:0x18f [While If]
    if(Mode < 3)
    {
        // End:0x140
        if(FireModeClass[Mode] != none)
        {
            // End:0x140
            if(FireMode[Mode] == none || FireMode[Mode].AmmoClass != none && !bNoAmmoInstances && Ammo[Mode] == none && FireMode[Mode].AmmoPerFire > 0)
            {
                GotoState('PendingClientWeaponSet');
                return;
            }
        }
        // End:0x185
        if(FireMode[Mode] != none)
        {
            FireMode[Mode].Instigator = Instigator;
            FireMode[Mode].Level = Level;
        }
        ++ Mode;
        // This is an implied JumpToken; Continue!
        goto J0xb1;
    }
    CheckPartsSet();
    ClientState = 1;
    GotoState('Hidden');
    // End:0x1cd
    if(wHands == none && !Instigator.IsA('wHelicopter'))
    {
        SetHands();
    }
    // End:0x1fe
    if(Level.NetMode == 1 || !Instigator.IsHumanControlled())
    {
        return;
    }
    // End:0x26c
    if(Instigator.Weapon != none && Instigator.Weapon == self || Instigator.PendingWeapon == self)
    {
        // End:0x264
        if(Instigator.PendingWeapon != none)
        {
            Instigator.ChangedWeapon();
        }
        // End:0x26a
        else
        {
            BringUp();
        }
        return;
    }
    // End:0x29f
    if(Instigator.PendingWeapon != none && Instigator.PendingWeapon.bForceSwitch)
    {
        return;
    }
    // End:0x300
    if(bPickupChange == true && BaseParams.iInventoryGroup != 3 || BaseParams.iInventoryGroup != 6)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();
        bPickupChange = false;
    }
    nStartWeaponIdx = 1;
    // End:0x348
    if(Level.GetMatchMaker().2 == Level.GetMatchMaker().eWeaponLimit)
    {
        nStartWeaponIdx = 2;
    }
    // End:0x3bd
    else
    {
        // End:0x389
        if(Level.GetMatchMaker().3 == Level.GetMatchMaker().eWeaponLimit)
        {
            nStartWeaponIdx = 4;
        }
        // End:0x3bd
        else
        {
            // End:0x3bd
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                nStartWeaponIdx = 3;
            }
        }
    }
    // End:0x40d
    if(Instigator.Weapon == none && BaseParams.iInventoryGroup == nStartWeaponIdx)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();
    }
    // End:0x535
    else
    {
        // End:0x535
        if(bPossiblySwitch && Instigator.Weapon != none && !Instigator.Weapon.IsFiring())
        {
            // End:0x488
            if(PlayerController(Instigator.Controller) != none && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
            {
                return;
            }
            // End:0x4ea
            if(Instigator.PendingWeapon != none)
            {
                // End:0x4e7
                if(RateSelf() > Instigator.PendingWeapon.RateSelf())
                {
                    Instigator.PendingWeapon = self;
                    Instigator.Weapon.PutDown();
                }
            }
            // End:0x535
            else
            {
                // End:0x535
                if(RateSelf() > Instigator.Weapon.RateSelf())
                {
                    Instigator.PendingWeapon = self;
                    Instigator.Weapon.PutDown();
                }
            }
        }
    }
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    local int Mode;
    local float fAnimRate;
    local string strSoundName;
    local Sound sndTelegraphTalk;
    local Controller tempCon;

    // End:0x47d
    if(ClientState == 1)
    {
        // End:0x475
        if(Instigator.IsLocallyControlled())
        {
            // End:0x475
            if(Mesh != none)
            {
                fAnimRate = SelectAnimRate;
                // End:0x59
                if(Instigator.CanQuickWeaponChange() == true)
                {
                    fAnimRate *= 1.30;
                }
                // End:0x274
                if(bCanSelectNew == true && HasAnim(SelectNewAnim))
                {
                    PlayAnim(SelectNewAnim, fAnimRate, 0.0);
                    // End:0x9c
                    if(Role < 4)
                    {
                        bCanSelectNew = false;
                    }
                    // End:0x1be
                    if(ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_helicopter_R" || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_uav_R" || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_artillery_R")
                    {
                        strSoundName = class'wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                        tempCon = Instigator.Controller;
                        sndTelegraphTalk = PlayerController(tempCon).StatusAnnouncer.GetSound(strSoundName);
                        Instigator.PlayOwnedSound(sndTelegraphTalk, 0, 1.0);
                    }
                    // End:0x271
                    else
                    {
                        Instigator.PlaySoundHK(ResParams.default.sound_Select_New, 0, TransientSoundVolume,, TransientSoundRadius / float(4), fAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x271
                        if(Role < 4)
                        {
                            Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Select_New, 0, TransientSoundVolume,, TransientSoundRadius / float(4), fAnimRate, false, false, -1, false);
                        }
                    }
                }
                // End:0x475
                else
                {
                    // End:0x475
                    if(HasAnim(SelectAnim))
                    {
                        PlayAnim(SelectAnim, SelectAnimRate * fAnimRate, 0.0);
                        bCanSelectNew = false;
                        // End:0x3c2
                        if(ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_helicopter_R" || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_uav_R" || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_artillery_R")
                        {
                            strSoundName = class'wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                            tempCon = Instigator.Controller;
                            sndTelegraphTalk = PlayerController(tempCon).StatusAnnouncer.GetSound(strSoundName);
                            Instigator.PlayOwnedSound(sndTelegraphTalk, 0, 1.0);
                        }
                        // End:0x475
                        else
                        {
                            Instigator.PlaySoundHK(ResParams.default.sound_Select, 0, TransientSoundVolume,, TransientSoundRadius / float(4), fAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x475
                            if(Role < 4)
                            {
                                Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Select, 0, TransientSoundVolume,, TransientSoundRadius / float(4), fAnimRate, false, false, -1, false);
                            }
                        }
                    }
                }
            }
        }
        ClientState = 2;
    }
    Mode = 0;
    J0x484:
    // End:0x521 [While If]
    if(Mode < 3)
    {
        // End:0x517
        if(FireMode[Mode] != none)
        {
            FireMode[Mode].bIsFiring = false;
            FireMode[Mode].HoldTime = 0.0;
            FireMode[Mode].bServerDelayStartFire = false;
            FireMode[Mode].bServerDelayStopFire = false;
            FireMode[Mode].bInstantStop = false;
        }
        ++ Mode;
        // This is an implied JumpToken; Continue!
        goto J0x484;
    }
    // End:0x5e6
    if(PrevWeapon != none && PrevWeapon.HasAmmo() && !PrevWeapon.bNoVoluntarySwitch)
    {
        // End:0x577
        if(!PrevWeapon.IsA('wMeleeWeapon'))
        {
            OldWeapon = PrevWeapon;
        }
        // End:0x5e3
        if(OldWeapon != none)
        {
            Instigator.PlayOwnedSound(NullSound, 3,,,,, false);
            // End:0x5e3
            if(Role < 4)
            {
                OldWeapon.ServerPlayOwnedSound(NullSound, 3,,,,, false);
                Instigator.ServerSpecPlaySoundHK(NullSound, 3,,,,, false);
            }
        }
    }
    // End:0x5ed
    else
    {
        OldWeapon = none;
    }
    // End:0x63b
    if(Instigator != none)
    {
        Instigator.SetAimModeValueOnly(false);
        // End:0x63b
        if(Instigator.Controller != none)
        {
            bSprint = Instigator.Controller.bSprint;
        }
    }
    // End:0x655
    if(!self.IsA('wDemopack'))
    {
        byActionThrowsWeapon = 0;
    }
    // End:0x67a
    if(OldWeapon.IsA('wDemopack'))
    {
        OldWeapon.byActionThrowsWeapon = 0;
    }
}

function ServerPlayOwnedSound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    Instigator.PlaySound(Sound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner);
}

simulated function bool PutDown()
{
    local int Mode;
    local bool bNoAnim;

    // End:0x22
    if(MeleeState == 1)
    {
        Instigator.PendingWeapon = none;
        return false;
    }
    // End:0x81
    if(Instigator.CanQuickWeaponChange() == true || Instigator.PendingWeapon != none && Instigator.PendingWeapon.BaseParams.bApplyQuickDrop == true)
    {
        bQuickDropAnim = true;
    }
    // End:0x89
    else
    {
        bQuickDropAnim = false;
    }
    // End:0x25e
    if(ClientState == 2 || ClientState == 4)
    {
        // End:0x163
        if(Instigator.PendingWeapon != none && !Instigator.PendingWeapon.bForceSwitch)
        {
            Mode = 0;
            J0xe5:
            // End:0x163 [While If]
            if(Mode < 3)
            {
                // End:0x105
                if(none == FireMode[Mode])
                {
                }
                // End:0x159
                else
                {
                    // End:0x159
                    if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
                    {
                        // End:0x157
                        if(FireMode[Mode].IsA('wThrowingFire'))
                        {
                            // This is an implied JumpToken;
                            goto J0x159;
                        }
                        // End:0x159
                        else
                        {
                            return false;
                        }
                    }
                }
                ++ Mode;
                // This is an implied JumpToken; Continue!
                goto J0xe5;
            }
        }
        // End:0x256
        if(Instigator.IsLocallyControlled())
        {
            Mode = 0;
            J0x17c:
            // End:0x1f0 [While If]
            if(Mode < 3)
            {
                // End:0x1e6
                if(FireMode[Mode] != none && FireMode[Mode].bIsFiring)
                {
                    // End:0x1db
                    if(FireMode[Mode].IsA('wThrowingFire'))
                    {
                        ClientCancelFire(Mode);
                    }
                    // End:0x1e6
                    else
                    {
                        ClientStopFire(Mode);
                    }
                }
                ++ Mode;
                // This is an implied JumpToken; Continue!
                goto J0x17c;
            }
            // End:0x21e
            if(bQuickDropAnim == true && HasAnim(PutdownQuickAnim))
            {
                PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0);
            }
            // End:0x256
            else
            {
                // End:0x23e
                if(HasAnim(PutDownAnim))
                {
                    PlayAnim(PutDownAnim, PutDownAnimRate, 0.0);
                }
                // End:0x256
                else
                {
                    // End:0x256
                    if(WeaponType != 12)
                    {
                        bNoAnim = true;
                    }
                }
            }
        }
        ClientState = 3;
    }
    Mode = 0;
    J0x265:
    // End:0x2ba [While If]
    if(Mode < 3)
    {
        // End:0x2b0
        if(none != FireMode[Mode])
        {
            FireMode[Mode].bServerDelayStartFire = false;
            FireMode[Mode].bServerDelayStopFire = false;
        }
        ++ Mode;
        // This is an implied JumpToken; Continue!
        goto J0x265;
    }
    Instigator.AmbientSound = none;
    // End:0x355
    if(bNoAnim == true)
    {
        ClientState = 1;
        Instigator.ChangedWeapon();
        // End:0x312
        if(Instigator.Weapon == self)
        {
            PlayIdle();
            ClientState = 4;
        }
        // End:0x355
        else
        {
            Mode = 0;
            J0x319:
            // End:0x355 [While If]
            if(Mode < 3)
            {
                // End:0x34b
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].DestroyEffects();
                }
                ++ Mode;
                // This is an implied JumpToken; Continue!
                goto J0x319;
            }
        }
    }
    return true;
}

simulated function Fire(float f);
simulated function AltFire(float f)
{
    // End:0x17
    if(bSprint == true)
    {
        bBlendSprint_AdsIdle = true;
    }
    // End:0x1f
    else
    {
        bBlendSprint_AdsIdle = false;
    }
    Log("<AltFire> bSprint : " $ string(bSprint) $ "bBlendSprint_AdsIdle : " $ string(bBlendSprint_AdsIdle));
}

simulated event WeaponTick(float dt)
{
    CalcStanceOffset(dt);
    CalcBreathOffset();
    CalcSwayRot(dt);
    CalcFiringSwayRot(dt);
    ProcessMoveAni();
}

simulated function ProcessMoveAni()
{
    // End:0x24
    if(Instigator == none || Instigator.bIsProned == false)
    {
        return;
    }
    // End:0x6e
    if(ClientState != 4 || bSprint == true || IsReloading() == true || IsFiring() == true || IsMeleeAttacking() == true)
    {
        return;
    }
    // End:0x98
    if(Instigator.bIsIdle == true)
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.20);
    }
    // End:0xaa
    else
    {
        LoopAnim(ProneMoveAnim, 1.0, 0.20);
    }
}

simulated function OutOfAmmo()
{
    // End:0x2e
    if(Instigator == none || !Instigator.IsLocallyControlled() || HasAmmo())
    {
        return;
    }
    DoAutoSwitch();
}

simulated function DoAutoSwitch()
{
    Instigator.Controller.SwitchToBestWeapon();
}

simulated event ClientStartFire(int Mode)
{
    // End:0x48
    if(Pawn(Owner).Controller.IsInState('GameEnded') || Pawn(Owner).Controller.IsInState('RoundEnded'))
    {
        return;
    }
    // End:0x93
    if(Role < 4)
    {
        // End:0x90
        if(StartFire(Mode))
        {
            PlayerController(Instigator.Controller).SetViewValue();
            ServerStartFire(byte(Mode));
        }
    }
    // End:0x9e
    else
    {
        StartFire(Mode);
    }
}

simulated event NotifyReloaded();
simulated event ClientStopFire(int Mode)
{
    // End:0x18
    if(FireMode[Mode].bEnableBustMode)
    {
    }
    // End:0x33
    if(Role < 4)
    {
        StopFire(Mode);
    }
    ServerStopFire(byte(Mode));
}

simulated function ClientCancelFire(int Mode);
event ServerStartFire(byte Mode)
{
    // End:0x64
    if(Instigator != none && Instigator.Weapon != self)
    {
        // End:0x49
        if(Instigator.Weapon == none)
        {
            Instigator.ServerChangedWeapon(none, self);
        }
        // End:0x62
        else
        {
            Instigator.Weapon.SynchronizeWeapon(self);
        }
        return;
    }
    // End:0x12d
    if(FireMode[Mode].NextFireTime <= Level.TimeSeconds + FireMode[Mode].PreFireTime && StartFire(Mode))
    {
        Log("FireMode[Mode].NextFireTime <= Level.TimeSeconds ");
        FireMode[Mode].ServerStartFireTime = Level.TimeSeconds;
        FireMode[Mode].bServerDelayStartFire = false;
    }
    // End:0x19b
    else
    {
        // End:0x181
        if(FireMode[Mode].AllowFire())
        {
            Log("FireMode[Mode].AllowFire()");
            FireMode[Mode].bServerDelayStartFire = true;
        }
        // End:0x19b
        else
        {
            ClientForceAmmoUpdate(Mode, AmmoAmount(Mode));
        }
    }
}

simulated function ClientForceAmmoUpdate(int Mode, int NewAmount)
{
    Log(string(self) $ " ClientForceAmmoUpdate mode " $ string(Mode) $ " newamount " $ string(NewAmount));
    // End:0x63
    if(bNoAmmoInstances)
    {
        AmmoCharge[Mode] = NewAmount;
    }
    // End:0x8e
    else
    {
        // End:0x8e
        if(Ammo[Mode] != none)
        {
            Ammo[Mode].AmmoAmount = NewAmount;
        }
    }
}

function SynchronizeWeapon(wWeapon ClientWeapon)
{
    Instigator.ServerChangedWeapon(self, ClientWeapon);
}

function ServerStopFire(byte Mode)
{
    // End:0x61
    if(FireMode[Mode].bServerDelayStartFire || FireMode[Mode].ServerStartFireTime == Level.TimeSeconds)
    {
        FireMode[Mode].bServerDelayStopFire = true;
    }
    // End:0x6e
    else
    {
        StopFire(Mode);
    }
}

function ServerCancelFire(byte Mode);
simulated event bool ReadyToFire(int Mode)
{
    local int alt;

    // End:0x12
    if(MeleeState == 1)
    {
        return false;
    }
    // End:0x25
    if(FireMode[Mode] == none)
    {
        return false;
    }
    // End:0x3a
    if(Mode == 0)
    {
        alt = 1;
    }
    // End:0x41
    else
    {
        alt = 0;
    }
    // End:0x100
    if(FireMode[alt] != none && FireMode[alt] != FireMode[Mode] && FireMode[alt].bModeExclusive && FireMode[alt].bIsFiring || !FireMode[Mode].AllowFire() || FireMode[Mode].NextFireTime > Level.TimeSeconds + FireMode[Mode].PreFireTime)
    {
        return false;
    }
    return true;
}

simulated function bool StartFire(int Mode)
{
    local int alt;

    // End:0x12
    if(!ReadyToFire(Mode))
    {
        return false;
    }
    // End:0x27
    if(Mode == 0)
    {
        alt = 1;
    }
    // End:0x2e
    else
    {
        alt = 0;
    }
    FireMode[Mode].bIsFiring = true;
    FireMode[Mode].bNowWaiting = false;
    FireMode[Mode].IsFiringBustMode = true;
    FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
    // End:0x12a
    if(FireMode[alt] != none && FireMode[alt].bModeExclusive)
    {
        Log("prevents rapidly");
        FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
    }
    // End:0x19f
    if(Instigator.IsLocallyControlled())
    {
        // End:0x189
        if(FireMode[Mode].PreFireTime > 0.0 || FireMode[Mode].bFireOnRelease)
        {
            FireMode[Mode].PlayPreFire();
        }
        FireMode[Mode].FireCount = 0;
    }
    FireMode[Mode].StartFiring();
    return true;
}

simulated event StopFire(int Mode)
{
    // End:0x2f
    if(FireMode[Mode].bIsFiring)
    {
        FireMode[Mode].bInstantStop = true;
    }
    // End:0x72
    if(Instigator.IsLocallyControlled() && !FireMode[Mode].bFireOnRelease)
    {
        FireMode[Mode].PlayFireEnd();
    }
    FireMode[Mode].bIsFiring = false;
    // End:0xe8
    if(FireMode[Mode].bEnableBustMode)
    {
        FireMode[Mode].IsFiringBustMode = false;
        FireMode[Mode].iFireCount = 0;
        Instigator.Controller.bFire = 0;
    }
    FireMode[Mode].StopFiring();
    // End:0x122
    if(!FireMode[Mode].bFireOnRelease)
    {
        ZeroFlashCount(Mode);
    }
    StoreAmmo();
}

simulated function CancelFire(int Mode);
function StoreAmmo()
{
    local PlayerController PC;
    local string strName;

    PC = PlayerController(Pawn(Owner).Owner);
    // End:0x41
    if(PC == none || PC.GSSS == none)
    {
        return;
    }
    // End:0x64
    if(UnresolvedNativeFunction_99(InventoryUniqueNumber, 0))
    {
        strName = BaseParams.strName;
    }
    // End:0x72
    else
    {
        strName = UnresolvedNativeFunction_99(InventoryUniqueNumber);
    }
    PC.GSSS.SetToStorage_WeaponAmmo(strName, AmmoCharge[0], AmmoCharge[0]);
}

simulated function ImmediateStopFire()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xe1 [While If]
    if(i < 3)
    {
        ClientStopFire(i);
        // End:0xd7
        if(FireMode[i].bFireOnRelease)
        {
            // End:0xa8
            if(Level.TimeSeconds > FireMode[i].NextFireTime && FireMode[i].bInstantStop || !FireMode[i].bNowWaiting)
            {
                FireMode[i].ModeDoFire();
            }
            // End:0xd7
            if(FireMode[i].bWaitForRelease)
            {
                FireMode[i].bNowWaiting = true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function Timer();
simulated function bool IsFiring()
{
    // End:0x8c
    if(Level.NetMode == 1 || Level.NetMode == 2)
    {
        return ClientState == 4 && FireMode[0] != none && FireMode[0].IsFiring() || FireMode[1] != none && FireMode[1].IsFiring();
    }
    return ClientState == 4 && FireMode[0] != none && FireMode[0].IsFiring() || FireMode[1] != none && FireMode[1].IsFiring();
}

simulated function bool IsSingleFire()
{
    // End:0x19
    if(BaseParams.iFireMode == 0)
    {
        return true;
    }
    // End:0x1b
    else
    {
        return false;
    }
}

function bool IsRapidFire()
{
    // End:0x38
    if(FireMode[1] != none && FireMode[1].bIsFiring)
    {
        return FireMode[1].bPawnRapidFireAnim;
    }
    // End:0x5c
    else
    {
        // End:0x5a
        if(FireMode[0] != none)
        {
            return FireMode[0].bPawnRapidFireAnim;
        }
        // End:0x5c
        else
        {
            return false;
        }
    }
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType);
simulated function CheckSuperBerserk();
simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local int Mode;
    local float OldDownDelay;

    OldDownDelay = DownDelay;
    DownDelay = 0.0;
    GetAnimParams(0, Anim, frame, Rate);
    // End:0x181
    if(ClientState == 4)
    {
        // End:0xa8
        if(FireMode[0] != none && Anim == FireMode[0].FireAnim && HasAnim(FireMode[0].FireEndAnim))
        {
            PlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0);
        }
        // End:0x17e
        else
        {
            // End:0x114
            if(FireMode[1] != none && Anim == FireMode[1].FireAnim && HasAnim(FireMode[1].FireEndAnim))
            {
                PlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0);
            }
            // End:0x17e
            else
            {
                // End:0x169
                if(FireMode[0] == none || !FireMode[0].bIsFiring && FireMode[1] == none || !FireMode[1].bIsFiring)
                {
                    PlayIdle();
                }
                // End:0x17e
                else
                {
                    // End:0x17e
                    if(Anim == 'MeleeAttack')
                    {
                        PlayIdle();
                    }
                }
            }
        }
    }
    // End:0x2f3
    else
    {
        // End:0x1e5
        if(ClientState == 2)
        {
            Mode = 0;
            J0x198:
            // End:0x1d4 [While If]
            if(Mode < 3)
            {
                // End:0x1ca
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].InitEffects();
                }
                ++ Mode;
                // This is an implied JumpToken; Continue!
                goto J0x198;
            }
            PlayIdle();
            ClientState = 4;
        }
        // End:0x2f3
        else
        {
            // End:0x2f3
            if(ClientState == 3)
            {
                // End:0x24f
                if(OldDownDelay > float(0))
                {
                    // End:0x230
                    if(bQuickDropAnim == true && HasAnim(PutdownQuickAnim))
                    {
                        PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0);
                    }
                    // End:0x24d
                    else
                    {
                        // End:0x24d
                        if(HasAnim(PutDownAnim))
                        {
                            PlayAnim(PutDownAnim, PutDownAnimRate, 0.0);
                        }
                    }
                    return;
                }
                // End:0x274
                if(Instigator.PendingWeapon == none)
                {
                    PlayIdle();
                    ClientState = 4;
                }
                // End:0x2f3
                else
                {
                    ClientState = 1;
                    Instigator.ChangedWeapon();
                    // End:0x2b0
                    if(Instigator.Weapon == self)
                    {
                        PlayIdle();
                        ClientState = 4;
                    }
                    // End:0x2f3
                    else
                    {
                        Mode = 0;
                        J0x2b7:
                        // End:0x2f3 [While If]
                        if(Mode < 3)
                        {
                            // End:0x2e9
                            if(FireMode[Mode] != none)
                            {
                                FireMode[Mode].DestroyEffects();
                            }
                            ++ Mode;
                            // This is an implied JumpToken; Continue!
                            goto J0x2b7;
                        }
                    }
                }
            }
        }
    }
}

simulated function PlayIdle()
{
    // End:0x1e
    if(bSprint)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.30);
    }
    // End:0x30
    else
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.20);
    }
    // End:0x48
    if(MeleeState == 1)
    {
        MeleeState = 0;
    }
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
    return false;
}

simulated function bool CheckTryToDrive()
{
    return true;
}

function DoReflectEffect(int Drain);
function bool HandlePickupQuery(Pickup Item)
{
    local WeaponPickup wpu;

    // End:0x09
    if(bNoAmmoInstances)
    {
    }
    // End:0x53
    if(Class == Item.InventoryType)
    {
        wpu = WeaponPickup(Item);
        // End:0x51
        if(wpu != none)
        {
            return !wpu.AllowRepeatPickup();
        }
        // End:0x53
        else
        {
            return false;
        }
    }
    // End:0x60
    if(Inventory == none)
    {
        return false;
    }
    return Inventory.HandlePickupQuery(Item);
}

simulated function bool WantsZoomFade()
{
    return false;
}

function bool CanHeal(Actor Other)
{
    return false;
}

function bool ShouldFireWithoutTarget()
{
    return false;
}

function bool ShootHoop(Controller B, Vector ShootLoc)
{
    return false;
}

simulated function PawnUnpossessed();
simulated function wWeaponFire GetFireMode(byte Mode)
{
    // End:0x1c
    if(Mode < 3)
    {
        return FireMode[Mode];
    }
    return none;
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    local int i;

    BaseParams = wBase;
    WeaponType = BaseParams.eType;
    InventoryGroup = byte(BaseParams.iInventoryGroup);
    // End:0xff
    if(szFireModeClass == "")
    {
        switch(BaseParams.BulletType)
        {
            // End:0x74
            case 1:
                szFireModeClass = "Engine.wInstantFire";
                // End:0xff
                break;
            // End:0xfc
            case 2:
                switch(BaseParams.ProjMoveType)
                {
                    // End:0xaf
                    case 1:
                        szFireModeClass = "WWeapons.wThrowingFire";
                        // End:0xf9
                        break;
                    // End:0xd3
                    case 2:
                        szFireModeClass = "WWeapons.wRocketFire";
                        // End:0xf9
                        break;
                    // End:0xf6
                    case 3:
                        szFireModeClass = "WWeapons.wFlameFire";
                        // End:0xf9
                        break;
                    // End:0xffff
                    default:
                        // End:0xff Break;
                        break;
            }
            // End:0xffff
            default:
            }
            // End:0x128
            if(szFireModeClass != "")
            {
                FireModeClass[0] = class<wWeaponFire>(DynamicLoadObject(szFireModeClass, class'Class'));
            }
            SelectAnimRate = BaseParams.fAnimRate_BringUp;
            PutDownAnimRate = BaseParams.fAnimRate_PutDown;
            PutDownQuickAnimRate = BaseParams.fAnimRate_PutDown_Quick;
            fBreathSeconds = BaseParams.fBreathSpeed_Idle;
            // End:0x276
            if(BaseParams.wt_BoundingMax > float(0))
            {
                wt_RandomMul = BaseParams.wt_RandomMul;
                wt_BoundingMax = int(BaseParams.wt_BoundingMax);
                i = 0;
                J0x1bf:
                // End:0x243 [While If]
                if(float(i) < BaseParams.wt_BoundingMax)
                {
                    wt_x[i] = BaseParams.wt_x[i];
                    wt_y[i] = BaseParams.wt_y[i];
                    wt_RandomWeight[i] = BaseParams.wt_RandomWeight[i];
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x1bf;
                }
                Log("" $ string(BaseParams.iWeaponID) $ " Loadout WeaponTraceInfo!");
            }
            // End:0x377
            if(BaseParams.wtAim_BoundingMax > float(0))
            {
                wtAim_RandomMul = BaseParams.wtAim_RandomMul;
                wtAim_BoundingMax = int(BaseParams.wtAim_BoundingMax);
                i = 0;
                J0x2bd:
                // End:0x341 [While If]
                if(float(i) < BaseParams.wtAim_BoundingMax)
                {
                    wtAim_x[i] = BaseParams.wtAim_x[i];
                    wtAim_y[i] = BaseParams.wtAim_y[i];
                    wtAim_RandomWeight[i] = BaseParams.wtAim_RandomWeight[i];
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x2bd;
                }
                Log("" $ string(BaseParams.iWeaponID) $ " Loadout WeaponTraceAimInfo!");
            }
}

simulated function SetResParams(class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    SelectSound = ResParams.default.sound_Select;
    NullSound = Sound(DynamicLoadObject("Warfare_Sound_Char.etc.nullsound", class'Sound'));
}

simulated function SetHands()
{
    local Mesh meshHands;
    local int iBodyItemID, iTeamIndex;

    // End:0x1e
    if(wHands != none)
    {
        wHands.Destroy();
        wHands = none;
    }
    // End:0x140
    if(Instigator != none && Instigator.PlayerReplicationInfo != none)
    {
        // End:0x8e
        if(Level.GRI.GameClass ~= "WGame.wDeathMatch")
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.SideID;
        }
        // End:0xb4
        else
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.Team.TeamIndex;
        }
        // End:0xdf
        if(iTeamIndex == 0)
        {
            iBodyItemID = Instigator.PlayerReplicationInfo.iBodyItemID_0;
        }
        // End:0xfc
        else
        {
            iBodyItemID = Instigator.PlayerReplicationInfo.iBodyItemID_1;
        }
        // End:0x112
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(iTeamIndex));
    }
    // End:0x166
    else
    {
        meshHands = Level.GameMgr.GetItemResourceMesh(15000, false, 0);
    }
    wHands = Spawn(class'wSkinShell', self,,);
    wHands.SetDrawType(2);
    wHands.LinkMesh(meshHands);
    wHands.SetBase(self);
    wHands.SetOwner(self);
    AttachToBone(wHands, 'XXXX_Dummy');
}

function wLoadOut_Server(int iID, int iAddPartsID, optional bool bInGamePlaying)
{
    wLoadOut(iID, iAddPartsID);
    wLoadOut_Client(iID, iAddPartsID);
}

simulated function wLoadOut_Client(int iID, int iAddPartsID)
{
    // End:0x20
    if(Role != 4)
    {
        wLoadOut(iID, iAddPartsID);
    }
}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local class<wWeaponRes_Base> wRes;
    local int M;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    // End:0x3b
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6b
    if(wRes == none)
    {
        return;
    }
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, false));
    bCanSelectNew = true;
    SetBaseParams(wBase);
    SetResParams(wRes);
    M = 0;
    J0xb4:
    // End:0x109 [While If]
    if(M < 3)
    {
        // End:0xff
        if(FireModeClass[M] != none && FireMode[M] == none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0xb4;
    }
    InitWeaponFires();
    M = 0;
    J0x116:
    // End:0x220 [While If]
    if(M < 3)
    {
        // End:0x216
        if(FireMode[M] != none)
        {
            FireMode[M].ThisModeNum = M;
            FireMode[M].Weapon = self;
            FireMode[M].Instigator = Instigator;
            FireMode[M].Level = Level;
            FireMode[M].Owner = self;
            FireMode[M].PreBeginPlay();
            FireMode[M].BeginPlay();
            FireMode[M].PostBeginPlay();
            FireMode[M].SetInitialState();
            FireMode[M].PostNetBeginPlay();
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x116;
    }
    // End:0x260
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        MaxLights = byte(Min(4, MaxLights));
    }
    // End:0x282
    if(SmallViewOffset == vect(0.0, 0.0, 0.0))
    {
        SmallViewOffset = default.PlayerViewOffset;
    }
    // End:0x2b2
    if(SmallEffectOffset == vect(0.0, 0.0, 0.0))
    {
        SmallEffectOffset = EffectOffset + default.PlayerViewOffset - SmallViewOffset;
    }
    // End:0x2db
    if(bUseOldWeaponMesh && OldMesh != none)
    {
        bInitOldMesh = true;
        LinkMesh(OldMesh);
    }
    M = 0;
    J0x2e2:
    // End:0x31e [While If]
    if(M < 3)
    {
        // End:0x314
        if(FireMode[M] != none)
        {
            FireMode[M].wLoadOut();
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x2e2;
    }
    FillToInitialAmmo();
    // End:0x36a
    if(FireMode[0] != none)
    {
        FireMode[0].Load = float(FireMode[0].AmmoPerFire);
        FireMode[0].HoldTime = 0.0;
    }
    AddPartsGroup(iID, iAddPartsID);
    ClientWeaponSet(true);
    SetAddPartsParams();
    fMeleeDelay = BaseParams.fMeleeDelay;
    fFireDelay = BaseParams.fFireDelay;
    self.SRand_FireCount = 0;
    self.SRand_ReloadCount = 0;
}

simulated function SetAddPartsParams();
simulated function AddPartsGroup(int iWeaponID, int iAddPartsID)
{
    local wItemBaseParam ItemParam;
    local wItemResourceParam ItemResParam;
    local Vector AimDiff;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, iSubSightPartItemID;

    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iWeaponID);
    // End:0x53
    if(wcip.iItemID <= 0 || wcip.iItemID != iWeaponID)
    {
        return;
    }
    iSightPartID = iAddPartsID & 1023;
    iBarrelPartID = iAddPartsID & 130048;
    iSilencerPartID = iAddPartsID & 16646144;
    iGunstockPartID = iAddPartsID & 2130706432;
    // End:0x2e0
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x2dd
        if(wcpp.iItemID > 0 && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x2dd
            if(ItemResParam.iItemResourceID != -1)
            {
                ItemParam = Level.GameMgr.GetItemParam(wcpp.iItemID);
                AimDiff.X = wcip.vAimDiff.X + wcpp.vAddAimDiff.X;
                AimDiff.Y = wcip.vAimDiff.Y + wcpp.vAddAimDiff.Y;
                AimDiff.Z = wcip.vAimDiff.Z + wcpp.vAddAimDiff.Z;
                // End:0x27a
                if(ItemParam.eType == 20)
                {
                    AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                }
                // End:0x2dd
                else
                {
                    // End:0x2dd
                    if(ItemParam.eType == 26)
                    {
                        AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                    }
                }
            }
        }
    }
    // End:0x2f4
    else
    {
        iSubSightPartItemID = wcip.iSightOffAddItemID;
    }
    // End:0x446
    if(iSubSightPartItemID > 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(iSubSightPartItemID);
        // End:0x446
        if(ItemResParam.iItemResourceID != -1)
        {
            ItemParam = Level.GameMgr.GetItemParam(iSubSightPartItemID);
            AimDiff.X = 0.0;
            AimDiff.Y = 0.0;
            AimDiff.Z = 0.0;
            // End:0x3eb
            if(ItemParam.eType == 20)
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
            }
            // End:0x446
            else
            {
                // End:0x446
                if(ItemParam.eType == 26)
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
                }
            }
        }
    }
    // End:0x516
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x516
        if(wcpp.iItemID > 0)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x516
            if(ItemResParam.iItemResourceID != -1)
            {
                AddParts(5, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, "", vect(0.0, 0.0, 0.0), wcpp.iItemID, iAddPartsID);
            }
        }
    }
    // End:0x554
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID,, iPainting_Item_ID);
    }
    // End:0x5ac
    else
    {
        // End:0x5a4
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID,, wcip.iDefaultPaintingID);
        }
        // End:0x5ac
        else
        {
            Skins.Length = 0;
        }
    }
}

function AttachToPawn(Pawn P)
{
    local name BoneName;

    Instigator = P;
    // End:0x1b8
    if(ThirdPersonActor == none)
    {
        // End:0x52
        if(BaseParams.iWeaponID == 50001)
        {
            szWeaponAttachmentName = "WWeapons.wHeliMainAttachment";
        }
        // End:0x92
        if(BaseParams.iWeaponID == 50002)
        {
            szWeaponAttachmentName = "WWeapons.wHeliRPGAttachment_L";
        }
        // End:0xcf
        else
        {
            // End:0xcf
            if(BaseParams.iWeaponID == 50005)
            {
                szWeaponAttachmentName = "WWeapons.wHeliRPGAttachment_R";
            }
        }
        AttachmentClass = class<InventoryAttachment>(DynamicLoadObject(szWeaponAttachmentName, class'Class'));
        ThirdPersonActor = Spawn(AttachmentClass, Owner);
        WeaponAttachment(ThirdPersonActor).Weapon = self;
        WeaponAttachment(ThirdPersonActor).iRepWeaponID = BaseParams.iWeaponID;
        WeaponAttachment(ThirdPersonActor).iRepAddPartsID = InventoryClassAddPartsID;
        WeaponAttachment(ThirdPersonActor).iPainting_Item_ID = iPainting_Item_ID;
        WeaponAttachment(ThirdPersonActor).wLoadOut(WeaponAttachment(ThirdPersonActor).iRepWeaponID, WeaponAttachment(ThirdPersonActor).iRepAddPartsID);
        InventoryAttachment(ThirdPersonActor).InitFor(self);
    }
    // End:0x1da
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    BoneName = P.GetWeaponBoneFor(self);
    // End:0x22d
    if(ThirdPersonActor.AttachmentBone != 'None')
    {
        P.AttachToBone(ThirdPersonActor, ThirdPersonActor.AttachmentBone);
    }
    // End:0x283
    else
    {
        // End:0x258
        if(BoneName != 'None')
        {
            P.AttachToBone(ThirdPersonActor, BoneName);
        }
        // End:0x283
        else
        {
            ThirdPersonActor.SetLocation(P.Location);
            ThirdPersonActor.SetBase(P);
        }
    }
}

simulated function FireOne(int iFireMode);
simulated function AddParts(wWeaponAcce.EAcceType Type, string szName, string szSkinName, string strHaveDotName, Vector AimDiff, int iItemID, int iPartsGroupID, optional bool bSightSub)
{
    local int i;

    // End:0x138
    if(!bSightSub)
    {
        i = 0;
        J0x12:
        // End:0x138 [While If]
        if(i < Parts.Length)
        {
            // End:0xa8
            if(Parts[i].AcceType == Type)
            {
                // End:0x86
                if(Parts[i].szName == szName)
                {
                    Parts[i].Destroy();
                    Parts[i] = none;
                    return;
                }
                // End:0xa8
                else
                {
                    Parts[i].Destroy();
                    Parts[i] = none;
                    // This is an implied JumpToken;
                    goto J0x138;
                }
            }
            // End:0x12e
            if(Parts[i].AcceType == 1 && Type == 3 || Parts[i].AcceType == 3 && Type == 1)
            {
                Parts[i].Destroy();
                Parts[i] = none;
            }
            // End:0x138
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x12;
            }
        }
    }
    // End:0x14d
    if(bSightSub)
    {
        i = Parts.Length;
    }
    // End:0x284
    if(Parts.Length == i)
    {
        Parts.Length = Parts.Length + 1;
        Parts[i] = Spawn(class'wWeaponAcce', self);
        // End:0x1d4
        if(iItemID == -1 && iPartsGroupID == -1)
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID, true);
        }
        // End:0x202
        else
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID);
        }
        // End:0x23b
        if(Len(szSkinName) > 1)
        {
            Parts[i].Skins[0] = Material(DynamicLoadObject(szSkinName, class'Material'));
        }
        // End:0x284
        if(Len(strHaveDotName) > 1 && strHaveDotName != szName)
        {
            AddParts(2, strHaveDotName, "", strHaveDotName, vect(0.0, 0.0, 0.0), -1, -1);
        }
    }
}

simulated function SetSprint(bool bValue)
{
    // End:0x0b
    if(IsWeaponChanging())
    {
        return;
    }
    bSprint = bValue;
    // End:0x35
    if(IsMeleeAttacking() || ClientState == 2)
    {
        return;
    }
    // End:0x47
    if(IsReloading() == false)
    {
        PlayIdle();
    }
}

simulated function bool GetSprint()
{
    return bSprint;
}

simulated function bool IsReloading()
{
    return false;
}

simulated function bool IsWeaponChanging()
{
    // End:0x12
    if(ClientState == 3)
    {
        return true;
    }
    return false;
}

simulated function bool IsPutdowning()
{
    // End:0x12
    if(ClientState == 3)
    {
        return true;
    }
    return false;
}

simulated function bool IsMeleeAttacking()
{
    // End:0x12
    if(MeleeState == 1)
    {
        return true;
    }
    return false;
}

function bool IsExistParts(wWeaponAcce.EAcceType Type)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < Parts.Length)
    {
        // End:0x3b
        if(Parts[i].AcceType == Type)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

simulated function float CalcDestPivot()
{
    local float fDestPivot;

    // End:0x17
    if(bLanding)
    {
        fDestPivot = -5.0;
    }
    // End:0x62
    else
    {
        // End:0x37
        if(Instigator.bIsProned)
        {
            fDestPivot = -1.60;
        }
        // End:0x62
        else
        {
            // End:0x57
            if(Instigator.bIsCrouched)
            {
                fDestPivot = -1.0;
            }
            // End:0x62
            else
            {
                fDestPivot = 0.0;
            }
        }
    }
    // End:0x9b
    if(!bLanding)
    {
        fDestPivot += VSize(Instigator.Velocity) * -0.0050 * BaseParams.fMovePivot;
    }
    return fDestPivot;
}

simulated function CalcStanceOffset(float fDelta)
{
    local float fDestPivot, fDeltaPivot, fDMax, fDMin;

    fDMin = 2.0 * fDelta;
    fDMax = 6.0 * fDelta;
    // End:0x106
    if(Instigator.Controller.IsA('PlayerController'))
    {
        fDestPivot = CalcDestPivot();
        // End:0x106
        if(fDestPivot != fStancePivot)
        {
            fDeltaPivot = fDestPivot - fStancePivot * float(6) * fDelta;
            // End:0xb3
            if(fDeltaPivot < float(0))
            {
                fDeltaPivot = FMax(fDeltaPivot, -fDMax);
                fDeltaPivot = FMin(fDeltaPivot, -fDMin);
            }
            // End:0xd7
            else
            {
                fDeltaPivot = FMin(fDeltaPivot, fDMax);
                fDeltaPivot = FMax(fDeltaPivot, fDMin);
            }
            fStancePivot += fDeltaPivot;
            // End:0x106
            if(Abs(fDestPivot - fStancePivot) < fDMin)
            {
                fStancePivot = fDestPivot;
            }
        }
    }
    vStanceOffset.Z = fStancePivot;
}

simulated function CalcBreathOffset()
{
    local float fBoxWidth, fBoxHeight, fTimeValue;

    // End:0x16
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    // End:0x2e
    if(BaseParams.fBreathRadius_Idle == float(0))
    {
        return;
    }
    // End:0x4f
    if(fBreathOffsetReflecTime_X == float(0))
    {
        fBreathOffsetReflecTime_X = Level.TimeSeconds;
    }
    // End:0x70
    if(fBreathOffsetReflecTime_Y == float(0))
    {
        fBreathOffsetReflecTime_Y = Level.TimeSeconds;
    }
    fBoxWidth = BaseParams.fBreathRadius_Idle;
    fBoxHeight = fBoxWidth * fBreathRatio;
    fTimeValue = Level.TimeSeconds - fBreathOffsetReflecTime_X;
    // End:0xe4
    if(fTimeValue >= fBreathSeconds)
    {
        bBreathOffsetXLeft = !bBreathOffsetXLeft;
        fBreathOffsetReflecTime_X = fBreathOffsetReflecTime_X + fBreathSeconds;
    }
    // End:0x134
    else
    {
        vBreathOffset.Y = Cos(fTimeValue / fBreathSeconds - 0.50 * 3.1415930) * fBoxWidth / float(2);
        // End:0x134
        if(bBreathOffsetXLeft)
        {
            vBreathOffset.Y *= float(-1);
        }
    }
    // End:0x96
    if(true)
    	goto J0x96;
    fTimeValue = Level.TimeSeconds - fBreathOffsetReflecTime_Y;
    // End:0x194
    if(fTimeValue >= fBreathSeconds * fBreathRatio)
    {
        bBreathOffsetYUp = !bBreathOffsetYUp;
        fBreathOffsetReflecTime_Y = fBreathOffsetReflecTime_Y + fBreathSeconds * fBreathRatio;
    }
    // End:0x1eb
    else
    {
        vBreathOffset.Z = Cos(fTimeValue / fBreathSeconds * fBreathRatio - 0.50 * 3.1415930) * fBoxHeight / float(2);
        // End:0x1eb
        if(bBreathOffsetYUp)
        {
            vBreathOffset.Z *= float(-1);
        }
    }
    // End:0x138
    if(true)
    	goto J0x138;
}

simulated function SetRandFiringSwayRot()
{
    local PlayerController PC;
    local int iRandPitch, iRandYaw, iPitchMax, iYawMax, iPitchMax_Aim, iYawMax_Aim;

    PC = PlayerController(Instigator.Controller);
    // End:0x26
    if(PC == none)
    {
        return;
    }
    iPitchMax = int(BaseParams.fFiringSway_HipX_Max * 0.20);
    iYawMax = int(BaseParams.fFiringSway_HipY_Max * 0.20);
    iPitchMax = iPitchMax + Rand(iPitchMax);
    iYawMax = iYawMax + Rand(iRandYaw);
    iPitchMax_Aim = int(BaseParams.fFiringSway_AdsX_Max * 0.20);
    iYawMax_Aim = int(BaseParams.fFiringSway_AdsY_Max * 0.20);
    iPitchMax_Aim = iPitchMax_Aim + Rand(iPitchMax_Aim);
    iYawMax_Aim = iYawMax_Aim + Rand(iYawMax_Aim);
    iRandPitch = Rand(3);
    iRandYaw = Rand(3);
    // End:0x12e
    if(iRandPitch > 1)
    {
        rFiringSway_LastCameraRot.Pitch += iPitchMax;
        rFiringSway_LastCameraRot_Aim.Pitch += iPitchMax_Aim;
    }
    // End:0x15b
    else
    {
        // End:0x15b
        if(iRandPitch > 0)
        {
            rFiringSway_LastCameraRot.Pitch -= iPitchMax;
            rFiringSway_LastCameraRot_Aim.Pitch -= iPitchMax_Aim;
        }
    }
    // End:0x18b
    if(iRandYaw > 1)
    {
        rFiringSway_LastCameraRot.Yaw += iYawMax;
        rFiringSway_LastCameraRot_Aim.Yaw += iYawMax_Aim;
    }
    // End:0x1b8
    else
    {
        // End:0x1b8
        if(iRandYaw > 0)
        {
            rFiringSway_LastCameraRot.Yaw -= iYawMax;
            rFiringSway_LastCameraRot_Aim.Yaw -= iYawMax_Aim;
        }
    }
}

simulated function CalcFiringSwayRot(float fDeltaTime)
{
    local PlayerController PC;
    local Rotator rDelta;
    local float fVelo;
    local int iDeltaP, iDeltaY, iDeltaRot;

    PC = PlayerController(Instigator.Controller);
    // End:0x26
    if(PC == none)
    {
        return;
    }
    // End:0x70
    if(IsFiring() == false)
    {
        rFiringSway_LastCameraRot = rot(0, 0, 0);
        rFiringSwayRot = rot(0, 0, 0);
        fFiringSwayAccumTime_Pitch = 0.0;
        fFiringSwayAccumTime_Yaw = 0.0;
        return;
    }
    rDelta.Pitch = -rFiringSway_LastCameraRot.Pitch;
    rDelta.Yaw = -rFiringSway_LastCameraRot.Yaw;
    rDelta /= fDeltaTime;
    rDelta.Pitch *= BaseParams.fFiringSway_HipX_Incr;
    rDelta.Yaw *= BaseParams.fFiringSway_HipY_Incr;
    iDeltaRot = -rFiringSway_LastCameraRot.Pitch;
    // End:0x11b
    if(Abs(float(iDeltaRot)) > float(12800))
    {
        rDelta.Pitch = rFiringSwayDestRot.Pitch;
    }
    iDeltaRot = -rFiringSway_LastCameraRot.Yaw;
    // End:0x157
    if(Abs(float(iDeltaRot)) > float(12800))
    {
        rDelta.Yaw = rFiringSwayDestRot.Yaw;
    }
    rFiringSwayDestRot = rDelta;
    // End:0x1ce
    if(Abs(float(rFiringSwayDestRot.Pitch)) > BaseParams.fFiringSway_HipX_Max)
    {
        // End:0x1b3
        if(rFiringSwayDestRot.Pitch < 0)
        {
            rFiringSwayDestRot.Pitch = int(-BaseParams.fFiringSway_HipX_Max);
        }
        // End:0x1ce
        else
        {
            rFiringSwayDestRot.Pitch = int(BaseParams.fFiringSway_HipX_Max);
        }
    }
    // End:0x23a
    if(Abs(float(rFiringSwayDestRot.Yaw)) > BaseParams.fFiringSway_HipY_Max)
    {
        // End:0x21f
        if(rFiringSwayDestRot.Yaw < 0)
        {
            rFiringSwayDestRot.Yaw = int(-BaseParams.fFiringSway_HipY_Max);
        }
        // End:0x23a
        else
        {
            rFiringSwayDestRot.Yaw = int(BaseParams.fFiringSway_HipY_Max);
        }
    }
    fVelo = float(rFiringSwayDestRot.Pitch - rFiringSwayRot.Pitch);
    // End:0x273
    if(fVelo == float(0))
    {
        fFiringSwayAccumTime_Pitch = 0.0;
    }
    // End:0x27f
    else
    {
        fFiringSwayAccumTime_Pitch += fDeltaTime;
    }
    iDeltaP = int(float(int(fVelo * BaseParams.fFiringSway_HipX_Speed)) * fFiringSwayAccumTime_Pitch);
    // End:0x2ce
    if(iDeltaP != 0)
    {
        rFiringSwayRot.Pitch += iDeltaP;
        fFiringSwayAccumTime_Pitch = 0.0;
    }
    fVelo = float(rFiringSwayDestRot.Yaw - rFiringSwayRot.Yaw);
    // End:0x307
    if(fVelo == float(0))
    {
        fFiringSwayAccumTime_Yaw = 0.0;
    }
    // End:0x313
    else
    {
        fFiringSwayAccumTime_Yaw += fDeltaTime;
    }
    iDeltaY = int(float(int(fVelo * BaseParams.fFiringSway_HipY_Speed)) * fFiringSwayAccumTime_Yaw);
    // End:0x362
    if(iDeltaY != 0)
    {
        rFiringSwayRot.Yaw += iDeltaY;
        fFiringSwayAccumTime_Yaw = 0.0;
    }
    rFiringSway_LastCameraRot = rFiringSwayRot;
}

simulated function CalcSwayRot(float fDeltaTime)
{
    local PlayerController PC;
    local Rotator rDelta;
    local float fVelo;
    local int iDeltaP, iDeltaY, iDeltaRot;

    PC = PlayerController(Instigator.Controller);
    // End:0x26
    if(PC == none)
    {
        return;
    }
    rDelta = PC.Rotation - rSway_LastCameraRot;
    rDelta /= fDeltaTime;
    rDelta.Pitch *= BaseParams.fSway_HipX_Incr;
    rDelta.Yaw *= BaseParams.fSway_HipY_Incr;
    iDeltaRot = PC.Rotation.Pitch - rSway_LastCameraRot.Pitch;
    // End:0xd2
    if(Abs(float(iDeltaRot)) > float(12800))
    {
        rDelta.Pitch = rSwayDestRot.Pitch;
    }
    iDeltaRot = PC.Rotation.Yaw - rSway_LastCameraRot.Yaw;
    // End:0x121
    if(Abs(float(iDeltaRot)) > float(12800))
    {
        rDelta.Yaw = rSwayDestRot.Yaw;
    }
    rSwayDestRot = rDelta;
    // End:0x198
    if(Abs(float(rSwayDestRot.Pitch)) > BaseParams.fSway_HipX_Max)
    {
        // End:0x17d
        if(rSwayDestRot.Pitch < 0)
        {
            rSwayDestRot.Pitch = int(-BaseParams.fSway_HipX_Max);
        }
        // End:0x198
        else
        {
            rSwayDestRot.Pitch = int(BaseParams.fSway_HipX_Max);
        }
    }
    // End:0x204
    if(Abs(float(rSwayDestRot.Yaw)) > BaseParams.fSway_HipY_Max)
    {
        // End:0x1e9
        if(rSwayDestRot.Yaw < 0)
        {
            rSwayDestRot.Yaw = int(-BaseParams.fSway_HipY_Max);
        }
        // End:0x204
        else
        {
            rSwayDestRot.Yaw = int(BaseParams.fSway_HipY_Max);
        }
    }
    fVelo = float(rSwayDestRot.Pitch - rSwayRot.Pitch);
    // End:0x23d
    if(fVelo == float(0))
    {
        fSwayAccumTime_Pitch = 0.0;
    }
    // End:0x249
    else
    {
        fSwayAccumTime_Pitch += fDeltaTime;
    }
    iDeltaP = int(float(int(fVelo * BaseParams.fSway_HipX_Speed)) * fSwayAccumTime_Pitch);
    // End:0x298
    if(iDeltaP != 0)
    {
        rSwayRot.Pitch += iDeltaP;
        fSwayAccumTime_Pitch = 0.0;
    }
    fVelo = float(rSwayDestRot.Yaw - rSwayRot.Yaw);
    // End:0x2d1
    if(fVelo == float(0))
    {
        fSwayAccumTime_Yaw = 0.0;
    }
    // End:0x2dd
    else
    {
        fSwayAccumTime_Yaw += fDeltaTime;
    }
    iDeltaY = int(float(int(fVelo * BaseParams.fSway_HipY_Speed)) * fSwayAccumTime_Yaw);
    // End:0x32c
    if(iDeltaY != 0)
    {
        rSwayRot.Yaw += iDeltaY;
        fSwayAccumTime_Yaw = 0.0;
    }
    rSway_LastCameraRot = PC.Rotation;
}

// Export UwWeapon::execDelFireMode(FFrame&, void* const)
native function DelFireMode(int iMode);
simulated function bool IsCanUseWeapon()
{
    return CheckOutOfAmmo() == true;
}

function SetAmmoTotal(int Mode, int TotalAmmo)
{
    AmmoCharge[Mode] = TotalAmmo;
}

function SetAmmoAmount(int Mode, int CurrentAmmo)
{
    AmmoCharge[Mode] = CurrentAmmo;
}

simulated function SetAttackedOffset(Vector VOffset)
{
    vAttackedOffset = VOffset;
}

simulated function SetAttackedRot(Rotator rRot)
{
    rAttackedRot = rRot;
}

simulated function SetWalkingSwayRot(Rotator rRot)
{
    rWalkingSwayRot = rRot;
}

function ServerAddMagazine()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial + BaseParams.iAmmo_Magazine;
    ClientAddMagazine();
}

simulated function ClientAddMagazine()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial + BaseParams.iAmmo_Magazine;
}

function ServerQuickAimZoom(bool bOn)
{
    bQuickAimZoom = bOn;
    ClientQuickAimZoom(bOn);
}

simulated function ClientQuickAimZoom(bool bOn)
{
    bQuickAimZoom = bOn;
}

function ServerQuickReload(bool bOn)
{
    bQuickReload = bOn;
    ClientQuickReload(bOn);
}

simulated function ClientQuickReload(bool bOn)
{
    bQuickReload = bOn;
}

simulated function int GetCurTotalAmmoCount();
simulated function int GetCurMagazineAmmoCount();
simulated function ActiveFireDelay();
simulated function ActiveMeleeDelay();
simulated function ClientThrowingWeapon();
function ServerThrowingWeapon();
simulated function ClientMeleeFire();
function ServerMeleeFire();

state PendingClientWeaponSet
{
    simulated function Timer()
    {
        // End:0x1c
        if(Pawn(Owner) != none)
        {
            ClientWeaponSet(bPendingSwitch);
        }
        // End:0x30
        if(IsInState('PendingClientWeaponSet'))
        {
            SetTimer(0.050, false);
        }
    }

    simulated function BeginState()
    {
        SetTimer(0.050, false);
    }

    simulated function EndState();

}

state Hidden
{

}

defaultproperties
{
    FireModeClass[2]=class'wMeleeFire'
    IdleAnim=Idle
    RestAnim=rest
    RunAnim=Run
    SprintAnim=Sprint
    SelectAnim=Select
    SelectNewAnim=Select_New
    PutDownAnim=PutDown
    PutdownQuickAnim=PutDown_Quick
    ProneMoveAnim=ProneMove
    SprintUpAnim=Sprint_Up
    IdleAnimRate=1.0
    RestAnimRate=1.0
    RunAnimRate=1.0
    SprintAnimRate=1.0
    SelectAnimRate=1.36360
    PutDownAnimRate=1.36360
    PutDownQuickAnimRate=1.0
    AIRating=0.50
    CurrentRating=0.50
    bCanThrow=true
    bNoAmmoInstances=true
    OldDrawScale=1.0
    OldCenteredOffsetY=-10.0
    OldCenteredRoll=2000
    MessageNoAmmo=" has no ammo"
    DisplayFOV=68.0
    HudColor=(R=255,G=255,B=0,A=255)
    CenteredOffsetY=-10.0
    CenteredRoll=2000
    CustomCrossHairColor=(R=255,G=255,B=255,A=255)
    CustomCrossHairScale=1.0
    CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross1"
    MinReloadPct=0.50
    szWeaponAttachmentName="WGame.wWeaponAttachment"
    fBreathRatio=0.90
    InventoryGroup=1
    PickupClass=class'wWeaponPickup'
    LightType=2
    LightEffect=21
    LightHue=31
    LightSaturation=156
    LightBrightness=550.0
    LightRadius=30.0
    LightPeriod=3
    LightCone=30
    DrawType=2
    NetUpdateFrequency=2.0
    NetPriority=3.0
    AmbientGlow=20
    MaxLights=6
    ScaleGlow=1.50
    SoundVolume=255
    TransientSoundVolume=1.0
    bNetNotify=true
}