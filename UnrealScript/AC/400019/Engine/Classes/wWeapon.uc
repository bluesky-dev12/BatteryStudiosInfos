class wWeapon extends Inventory
    abstract
    native
    nativereplication
    notplaceable
    hidedropdown;

const NUM_FIRE_MODES = 3;

enum EWeaponClientState
{
    WS_None,                        // 0
    WS_Hidden,                      // 1
    WS_BringUp,                     // 2
    WS_PutDown,                     // 3
    WS_ReadyToFire                  // 4
};

enum EMeleeState
{
    WMS_None,                       // 0
    WMS_Attacking                   // 1
};

var() Actor.eWeaponType WeaponType;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var string BaseName;
var bool bHoldFire;
var float fAccumulationOverHeat;
var() Class<wWeaponFire> FireModeClass[3];
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
var name DefenceAnim;
var() float IdleAnimRate;
var() float RestAnimRate;
var() float RunAnimRate;
var() float SprintAnimRate;
var() float SelectAnimRate;
var() float SelectNewAnimRate;
var() float PutDownAnimRate;
var() float PutDownQuickAnimRate;
var() float DefenceAnimRate;
var() string SelectForce;
var string FmodNullSound;
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
var() localized cache string Description;
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Ammo, AmmoCharge, 
        bHoldFire, bPickupChange, 
        fAccumulationOverHeat, iPainting_Item_ID;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientAddMagazine, ClientForceAmmoUpdate, 
        ClientPlayDefence, ClientQuickAimZoom, 
        ClientQuickReload, ClientWeaponSet, 
        ClientWeaponThrown, ClientWriteStats, 
        SetHands_Client, wLoadOut_Client;

    // Pos:0x01A
    reliable if(int(Role) < int(ROLE_Authority))
        ServerActionThrowsWeapon, ServerCancelFire, 
        ServerFmodPlayOwnedSound, ServerMeleeFire, 
        ServerStartFire, ServerStopFire, 
        ServerThrowingWeapon;
}

// Export UwWeapon::execInitWeaponFires(FFrame&, void* const)
native final function InitWeaponFires();

simulated function float ChargeBar()
{
    //return;    
}

simulated function Class<wAmmunition> GetAmmoClass(int Mode)
{
    return none;
    //return;    
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
    //return;    
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
    // End:0x6B
    if(Ammo[1] != none)
    {
        Ammo[1].AmmoAmount = 999;
    }
    //return;    
}

simulated function int MaxAmmo(int Mode)
{
    return BaseParams.iAmmo_Max;
    return 0;
    //return;    
}

simulated function FillToInitialAmmo()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial;
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
    //return;    
}

simulated function FillToDefaultAmmo()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial;
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
    //return;    
}

simulated function int AmmoAmount(int Mode)
{
    // End:0x1D
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
    //return;    
}

simulated function Class<Pickup> AmmoPickupClass(int Mode)
{
    return FireMode[Mode].AmmoClass.default.PickupClass;
    return none;
    //return;    
}

simulated function bool AmmoMaxed(int Mode)
{
    // End:0x22
    if(bNoAmmoInstances)
    {
        return AmmoCharge[Mode] >= (MaxAmmo(Mode));
    }
    // End:0x35
    if(Ammo[Mode] == none)
    {
        return false;
    }
    return Ammo[Mode].AmmoAmount >= (MaxAmmo(Mode));
    //return;    
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
    //return;    
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
        return 0.0000000;        
    }
    else
    {
        return float(Ammo[Mode].AmmoAmount) / float(Ammo[Mode].MaxAmmo);
    }
    //return;    
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
        if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
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
    //return;    
}

function bool AddAmmo(int AmmoToAdd, int Mode)
{
    // End:0xA5
    if(bNoAmmoInstances)
    {
        // End:0x44
        if(Level.GRI.WeaponBerserk > 1.0000000)
        {
            AmmoCharge[Mode] = MaxAmmo(Mode);            
        }
        else
        {
            // End:0x8A
            if(AmmoCharge[Mode] < (MaxAmmo(Mode)))
            {
                AmmoCharge[Mode] = Min(MaxAmmo(Mode), AmmoCharge[Mode] + AmmoToAdd);
            }
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
        return true;
    }
    // End:0xD1
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].AddAmmo(AmmoToAdd);
    }
    //return;    
}

simulated function bool HasAmmo()
{
    // End:0x8F
    if(bNoAmmoInstances)
    {
        return (((FireMode[0] != none) && AmmoCharge[0] >= FireMode[0].AmmoPerFire) || (FireMode[1] != none) && AmmoCharge[1] >= FireMode[1].AmmoPerFire) || (FireMode[2] != none) && AmmoCharge[2] >= FireMode[2].AmmoPerFire;
    }
    return ((((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire) || ((Ammo[1] != none) && FireMode[1] != none) && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire) || ((Ammo[2] != none) && FireMode[2] != none) && Ammo[2].AmmoAmount >= FireMode[2].AmmoPerFire;
    //return;    
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
    //return;    
}

simulated function float DesireAmmo(Class<Inventory> NewAmmoClass, bool bDetour)
{
    return 0.0000000;
    //return;    
}

simulated function bool CheckOutOfAmmo()
{
    // End:0x8C
    if((Instigator != none) && Instigator.Weapon == self)
    {
        // End:0x50
        if(bNoAmmoInstances)
        {
            // End:0x4E
            if((AmmoCharge[0] <= 0) && AmmoCharge[1] <= 0)
            {
                OutOfAmmo();
                return false;
            }
            return true;
        }
        // End:0x6E
        if(Ammo[0] != none)
        {
            Ammo[0].CheckOutOfAmmo();
        }
        // End:0x8C
        if(Ammo[1] != none)
        {
            Ammo[1].CheckOutOfAmmo();
        }
    }
    return true;
    //return;    
}

simulated function PostNetReceive()
{
    //return;    
}

simulated function DrawWeaponInfo(Canvas C)
{
    //return;    
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
    //return;    
}

function StartDebugging()
{
    //return;    
}

simulated function ClientWriteStats(byte Mode, bool bMatch, bool bAllowFire, bool bDelay, bool bAlt, float wait)
{
    Log((((((((((((string(self) $ " Same weapon ") $ string(bMatch)) $ " Mode ") $ string(Mode)) $ " Allow fire ") $ string(bAllowFire)) $ " delay start fire ") $ string(bDelay)) $ " alt firing ") $ string(bAlt)) $ " next fire wait ") $ string(wait));
    //return;    
}

function Class<DamageType> GetDamageType()
{
    //return;    
}

function HackPlayFireSound()
{
    // End:0x43
    if((FireMode[0] != none) && FireMode[0].FmodFireSound != "")
    {
        FmodPlaySound(FireMode[0].FmodFireSound, 0, 1.0000000);
    }
    //return;    
}

function float RangedAttackTime()
{
    return 0.0000000;
    //return;    
}

function bool RecommendRangedAttack()
{
    return false;
    //return;    
}

function bool RecommendLongRangedAttack()
{
    return false;
    //return;    
}

function bool FocusOnLeader(bool bLeaderFiring)
{
    return false;
    //return;    
}

function FireHack(byte Mode)
{
    //return;    
}

function bool SplashDamage()
{
    return FireMode[BotMode].bSplashDamage;
    //return;    
}

function bool RecommendSplashDamage()
{
    return FireMode[BotMode].bRecommendSplashDamage;
    //return;    
}

function float GetDamageRadius()
{
    // End:0x23
    if(FireMode[BotMode].ProjectileClass == none)
    {
        return 0.0000000;        
    }
    else
    {
        return FireMode[BotMode].ProjectileClass.default.DamageRadius;
    }
    //return;    
}

function float RefireRate()
{
    return FireMode[BotMode].BotRefireRate;
    //return;    
}

function bool FireOnRelease()
{
    return FireMode[BotMode].bFireOnRelease;
    //return;    
}

simulated function Loaded()
{
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local int i;
    local string t;
    local name Anim;
    local float frame, Rate;

    Canvas.SetDrawColor(0, byte(255), 0);
    // End:0x8E
    if((Pawn(Owner) != none) && Pawn(Owner).PlayerReplicationInfo != none)
    {
        Canvas.DrawText((("WEAPON " $ (GetItemName(string(self)))) $ " Owner ") $ Pawn(Owner).PlayerReplicationInfo.PlayerName);        
    }
    else
    {
        Canvas.DrawText((("WEAPON " $ (GetItemName(string(self)))) $ " Owner ") $ string(Owner));
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    t = ((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " Client state ";
    switch(ClientState)
    {
        // End:0x14B
        case 0:
            t = t $ "None";
            // End:0x1C9
            break;
        // End:0x168
        case 1:
            t = t $ "Hidden";
            // End:0x1C9
            break;
        // End:0x186
        case 2:
            t = t $ "BringUp";
            // End:0x1C9
            break;
        // End:0x1A4
        case 3:
            t = t $ "PutDown";
            // End:0x1C9
            break;
        // End:0x1C6
        case 4:
            t = t $ "ReadyToFire";
            // End:0x1C9
            break;
        // End:0xFFFF
        default:
            break;
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x25C
    if(int(DrawType) == int(8))
    {
        Canvas.DrawText((("     StaticMesh " $ (GetItemName(string(StaticMesh)))) $ " AmbientSound ") $ string(AmbientSound), false);        
    }
    else
    {
        Canvas.DrawText((("     Mesh " $ (GetItemName(string(Mesh)))) $ " AmbientSound ") $ string(AmbientSound), false);
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x499
    if(Mesh != none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        GetAnimParams(0, Anim, frame, Rate);
        t = (((("     AnimSequence " $ string(Anim)) $ " Frame ") $ string(frame)) $ " Rate ") $ string(Rate);
        // End:0x36C
        if(bAnimByOwner)
        {
            t = t $ " Anim by Owner";
        }
        Canvas.DrawText(t, false);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        Canvas.SetDrawColor(0, byte(255), 0);
        t = (((((((("Eyeheight " $ string(Instigator.EyeHeight)) $ " base ") $ string(Instigator.BaseEyeHeight)) $ " landbob ") $ string(Instigator.LandBob)) $ " just landed ") $ string(Instigator.bJustLanded)) $ " land recover ") $ string(Instigator.bLandRecovery);
        Canvas.DrawText(t, false);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    i = 0;
    J0x4A0:

    // End:0x598 [Loop If]
    if(i < 3)
    {
        // End:0x508
        if(FireMode[i] == none)
        {
            Canvas.DrawText("NO FIREMODE " $ string(i));
            YPos += YL;
            Canvas.SetPos(4.0000000, YPos);            
        }
        else
        {
            FireMode[i].DisplayDebug(Canvas, YL, YPos);
        }
        Canvas.DrawText((("Ammunition " $ string(i)) $ " amount ") $ string(AmmoAmount(i)));
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        i++;
        // [Loop Continue]
        goto J0x4A0;
    }
    Canvas.DrawText((((("Location: " $ string(Location)) $ "(PAWN : ") $ string(Instigator.Location)) $ ") Rotation ") $ string(Rotation), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("bSprint: " $ string(bSprint)) $ "/FireMode[0].bIsFiring:") $ string(FireMode[0].bIsFiring)) $ "/bFireOnRelease:") $ string(FireMode[0].bFireOnRelease), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("(H)PlayerViewOffset:" $ string(PlayerViewOffset)) $ "vBreathOffset:") $ string(vBreathOffset), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    local wWeapon Recommended;
    local float oldRating;

    // End:0x2F
    if((Instigator == none) || Instigator.Controller == none)
    {
        rating = -2.0000000;        
    }
    else
    {
        rating = (RateSelf()) + Instigator.Controller.WeaponPreference(self);
    }
    // End:0xA8
    if(Inventory != none)
    {
        Recommended = Inventory.RecommendWeapon(oldRating);
        // End:0xA8
        if((Recommended != none) && oldRating > rating)
        {
            rating = oldRating;
            return Recommended;
        }
    }
    return self;
    //return;    
}

function SetAITarget(Actor t)
{
    //return;    
}

function byte BestMode()
{
    // End:0x25
    if(int(Instigator.Controller.bFire) != 0)
    {
        return 0;        
    }
    else
    {
        // End:0x47
        if(int(Instigator.Controller.bAltFire) != 0)
        {
            return 1;
        }
    }
    // End:0x56
    if(FRand() < 0.5000000)
    {
        return 1;
    }
    return 0;
    //return;    
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
    local int newmode;
    local Controller C;

    C = Instigator.Controller;
    newmode = int(BestMode());
    // End:0x52
    if(newmode == 0)
    {
        C.bFire = 1;
        C.bAltFire = 0;        
    }
    else
    {
        C.bFire = 0;
        C.bAltFire = 1;
    }
    // End:0x7F
    if(bFinished)
    {
        return true;
    }
    // End:0xB6
    if(FireMode[BotMode].IsFiring())
    {
        // End:0xAB
        if(BotMode == newmode)
        {
            return true;            
        }
        else
        {
            StopFire(BotMode);
        }
    }
    // End:0xDA
    if(!ReadyToFire(newmode) || int(ClientState) != int(4))
    {
        return false;
    }
    BotMode = newmode;
    StartFire(newmode);
    return true;
    //return;    
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return FireMode[BotMode].GetFireStart(X, Y, Z);
    //return;    
}

simulated function float RateSelf()
{
    // End:0x19
    if(!HasAmmo())
    {
        CurrentRating = -2.0000000;        
    }
    else
    {
        // End:0x36
        if(Instigator.Controller == none)
        {
            return 0.0000000;            
        }
        else
        {
            CurrentRating = Instigator.Controller.RateWeapon(self);
        }
    }
    return CurrentRating;
    //return;    
}

function float GetAIRating()
{
    return AIRating;
    //return;    
}

function float SuggestAttackStyle()
{
    return 0.0000000;
    //return;    
}

function float SuggestDefenseStyle()
{
    return 0.0000000;
    //return;    
}

function bool SplashJump()
{
    return FireMode[BotMode].bSplashJump;
    //return;    
}

function bool CanAttack(Actor Other)
{
    local float dist, CheckDist;
    local Vector HitLocation, HitNormal, X, Y, Z, projStart;

    local Actor HitActor;
    local int M;
    local bool bInstantHit;

    // End:0x23
    if((Instigator == none) || Instigator.Controller == none)
    {
        return false;
    }
    dist = VSize(Instigator.Location - Other.Location);
    // End:0x83
    if((dist > FireMode[0].MaxRange()) && dist > FireMode[1].MaxRange())
    {
        return false;
    }
    // End:0xA4
    if(!Instigator.Controller.LineOfSightTo(Other))
    {
        return false;
    }
    M = 0;
    J0xAB:

    // End:0x15F [Loop If]
    if(M < 3)
    {
        // End:0xCB
        if(FireMode[M] == none)
        {
            // [Explicit Continue]
            goto J0x155;
        }
        // End:0xEE
        if(FireMode[M].bInstantHit)
        {
            bInstantHit = true;
            // [Explicit Continue]
            goto J0x155;
        }
        CheckDist = FMax(CheckDist, 0.5000000 * FireMode[M].ProjectileClass.default.Speed);
        CheckDist = FMax(CheckDist, 300.0000000);
        CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
        J0x155:

        M++;
        // [Loop Continue]
        goto J0xAB;
    }
    GetAxes(Instigator.Controller.Rotation, X, Y, Z);
    projStart = GetFireStart(X, Y, Z);
    // End:0x1F4
    if(bInstantHit)
    {
        HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);        
    }
    else
    {
        HitActor = Trace(HitLocation, HitNormal, projStart + (CheckDist * Normal((Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000))) - Location)), projStart, true);
    }
    // End:0x26F
    if((HitActor == none) || HitActor == Other)
    {
        return true;
    }
    // End:0x296
    if(Pawn(HitActor) == none)
    {
        return !HitActor.BlocksShotAt(Other);
    }
    // End:0x2E3
    if((Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
    {
        return true;
    }
    return false;
    //return;    
}

simulated function SetGRI(GameReplicationInfo G)
{
    //return;    
}

simulated function Destroyed()
{
    local int M;

    Instigator.FmodPlayOwnedSound(FmodNullSound, 3,,, false);
    // End:0x52
    if(int(Role) < int(ROLE_Authority))
    {
        ServerFmodPlayOwnedSound(FmodNullSound, 3,,, false);
        Instigator.FmodServerSpecPlaySound(FmodNullSound, 3,,, false);
    }
    AmbientSound = none;
    M = 0;
    J0x60:

    // End:0xCC [Loop If]
    if(M < 3)
    {
        // End:0x92
        if(FireMode[M] != none)
        {
            FireMode[M].DestroyEffects();
        }
        // End:0xC2
        if(Ammo[M] != none)
        {
            Ammo[M].Destroy();
            Ammo[M] = none;
        }
        M++;
        // [Loop Continue]
        goto J0x60;
    }
    M = 0;
    J0xD3:

    // End:0x10C [Loop If]
    if(M < Parts.Length)
    {
        Parts[M].Destroy();
        Parts[M] = none;
        M++;
        // [Loop Continue]
        goto J0xD3;
    }
    Parts.Length = 0;
    // End:0x132
    if(wHands != none)
    {
        wHands.Destroy();
        wHands = none;
    }
    super.Destroyed();
    //return;    
}

simulated function Reselect()
{
    //return;    
}

simulated function bool WeaponCentered()
{
    return bSpectated || Hand > float(1);
    //return;    
}

function RenderScope(Canvas Canv)
{
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    local int M;

    // End:0x88
    if((((Instigator == none) || Instigator.Controller == none) || Level.GetLocalPlayerController() != Instigator.Controller) || Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).IsSpectating())
    {
        return;
    }
    M = 0;
    J0x8F:

    // End:0xD0 [Loop If]
    if(M < 3)
    {
        // End:0xC6
        if(FireMode[M] != none)
        {
            FireMode[M].DrawMuzzleFlash(Canvas);
        }
        M++;
        // [Loop Continue]
        goto J0x8F;
    }
    // End:0xF0
    if(Class'Engine.PlayerController'.default.bSmallWeapons)
    {
        PlayerViewOffset = SmallViewOffset;        
    }
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
    // End:0x17D
    if(Hand == float(0))
    {
        PlayerViewOffset.Y = 0.0000000;
    }
    //return;    
}

simulated function ApplyOffset_Trans()
{
    PlayerViewOffset += vStanceOffset;
    PlayerViewOffset += vPartsOffset;
    PlayerViewOffset += vBreathOffset;
    //return;    
}

simulated function ApplyOffset_Rot()
{
    local Rotator rBone;

    rBone = rot(0, 0, 0);
    rBone.Yaw = -rSwayRot.Yaw;
    rBone.Yaw = -rFiringSwayRot.Yaw;
    SetBoneRotation('Bone_Pibot01', rBone, 0, 1.0000000);
    rBone = rot(0, 0, 0);
    rBone.Roll = -rSwayRot.Pitch;
    rBone.Roll = -rFiringSwayRot.Pitch;
    SetBoneRotation('Bone_Pitch', rBone, 0, 1.0000000);
    //return;    
}

simulated function ApplyOffset()
{
    ApplyOffset_Rot();
    ApplyOffset_Trans();
    //return;    
}

simulated function PreDrawFPWeapon()
{
    //return;    
}

simulated function SetHand(float InHand)
{
    Hand = InHand;
    //return;    
}

simulated function GetViewAxes(out Vector XAxis, out Vector YAxis, out Vector ZAxis)
{
    // End:0x36
    if(Instigator.Controller == none)
    {
        GetAxes(Instigator.Rotation, XAxis, YAxis, ZAxis);        
    }
    else
    {
        GetAxes(Instigator.Controller.Rotation, XAxis, YAxis, ZAxis);
    }
    //return;    
}

simulated function Vector CenteredEffectStart()
{
    return Instigator.Location;
    //return;    
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
        // End:0xAD
        if(Class'Engine.PlayerController'.default.bSmallWeapons)
        {
            return (((Instigator.Location + Instigator.CalcDrawOffset(self)) + (SmallEffectOffset.X * X)) + ((SmallEffectOffset.Y * Y) * Hand)) + (SmallEffectOffset.Z * Z);            
        }
        else
        {
            return (((Instigator.Location + Instigator.CalcDrawOffset(self)) + (EffectOffset.X * X)) + ((EffectOffset.Y * Y) * Hand)) + (EffectOffset.Z * Z);
        }        
    }
    else
    {
        return (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) + (Vector(Instigator.Rotation) * 40.0000000);
    }
    //return;    
}

simulated function IncrementFlashCount(int Mode)
{
    // End:0xB8
    if(WeaponAttachment(ThirdPersonActor) != none)
    {
        WeaponAttachment(ThirdPersonActor).FiringMode = byte(Mode);
        WeaponAttachment(ThirdPersonActor).FlashCount++;
        // End:0x8B
        if(Mode == 2)
        {
            // End:0x75
            if(self.IsA('wMeleeWeapon'))
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = true;                
            }
            else
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = false;
            }
        }
        // End:0xB8
        if(int(Level.NetMode) == int(NM_ListenServer))
        {
            WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
        }
    }
    //return;    
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
    //return;    
}

simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    local wWeapon newWeapon;

    // End:0xA8
    if(int(InventoryGroup) == int(f))
    {
        // End:0xA3
        if(!HasAmmo())
        {
            // End:0x33
            if(Inventory == none)
            {
                newWeapon = none;                
            }
            else
            {
                newWeapon = Inventory.WeaponChange(f, bSilent);
            }
            // End:0x9A
            if((!bSilent && newWeapon == none) && Instigator.IsHumanControlled())
            {
                Instigator.ClientMessage(ItemName $ MessageNoAmmo);
            }
            return newWeapon;            
        }
        else
        {
            return self;
        }        
    }
    else
    {
        // End:0xB8
        if(Inventory == none)
        {
            return none;            
        }
        else
        {
            return Inventory.WeaponChange(f, bSilent);
        }
    }
    //return;    
}

simulated function wWeapon WeaponChangeWClass(name wClass)
{
    // End:0x10
    if(IsA(wClass))
    {
        return self;        
    }
    else
    {
        // End:0x20
        if(Inventory == none)
        {
            return none;            
        }
        else
        {
            return Inventory.WeaponChangeWClass(wClass);
        }
    }
    //return;    
}

simulated function wWeapon WeaponChangeWID(int iWeaponID)
{
    // End:0x1D
    if(BaseParams.iWeaponID == iWeaponID)
    {
        return self;        
    }
    else
    {
        // End:0x2D
        if(Inventory == none)
        {
            return none;            
        }
        else
        {
            return Inventory.WeaponChangeWID(iWeaponID);
        }
    }
    //return;    
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x19C
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
        else
        {
            // End:0xA7
            if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
            {
                // End:0xA4
                if((int(GroupOffset) < int(CurrentWeapon.GroupOffset)) && (int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || int(GroupOffset) > int(CurrentChoice.GroupOffset))
                {
                    CurrentChoice = self;
                }                
            }
            else
            {
                // End:0xE9
                if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
                {
                    // End:0xE6
                    if(int(GroupOffset) > int(CurrentChoice.GroupOffset))
                    {
                        CurrentChoice = self;
                    }                    
                }
                else
                {
                    // End:0x152
                    if(int(InventoryGroup) > int(CurrentChoice.InventoryGroup))
                    {
                        // End:0x14F
                        if((int(InventoryGroup) < int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup))
                        {
                            CurrentChoice = self;
                        }                        
                    }
                    else
                    {
                        // End:0x19C
                        if((int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) < int(CurrentWeapon.InventoryGroup))
                        {
                            CurrentChoice = self;
                        }
                    }
                }
            }
        }
    }
    // End:0x1B0
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x19C
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
        else
        {
            // End:0xA7
            if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
            {
                // End:0xA4
                if((int(GroupOffset) > int(CurrentWeapon.GroupOffset)) && (int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || int(GroupOffset) < int(CurrentChoice.GroupOffset))
                {
                    CurrentChoice = self;
                }                
            }
            else
            {
                // End:0xE9
                if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
                {
                    // End:0xE6
                    if(int(GroupOffset) < int(CurrentChoice.GroupOffset))
                    {
                        CurrentChoice = self;
                    }                    
                }
                else
                {
                    // End:0x152
                    if(int(InventoryGroup) < int(CurrentChoice.InventoryGroup))
                    {
                        // End:0x14F
                        if((int(InventoryGroup) > int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup))
                        {
                            CurrentChoice = self;
                        }                        
                    }
                    else
                    {
                        // End:0x19C
                        if((int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) > int(CurrentWeapon.InventoryGroup))
                        {
                            CurrentChoice = self;
                        }
                    }
                }
            }
        }
    }
    // End:0x1B0
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

function HolderDied()
{
    local int M;

    M = 0;
    J0x07:

    // End:0x6D [Loop If]
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
        M++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function bool CanThrow()
{
    local int Mode;

    Mode = 0;
    J0x07:

    // End:0x7A [Loop If]
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
        Mode++;
        // [Loop Continue]
        goto J0x07;
    }
    return (bCanThrow && ((int(ClientState) == int(4)) || int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer)) && HasAmmo();
    //return;    
}

function RemoveWeapon()
{
    local int M;

    ClientWeaponThrown();
    M = 0;
    J0x0D:

    // End:0x46 [Loop If]
    if(M < 3)
    {
        // End:0x3C
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        M++;
        // [Loop Continue]
        goto J0x0D;
    }
    // End:0x5C
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
    }
    Destroy();
    //return;    
}

function DropFrom(Vector StartLocation, Rotator StartRotation)
{
    local int M;
    local Pickup Pickup;

    // End:0x1A
    if(!bCanThrow || !HasAmmo())
    {
        return;
    }
    ClientWeaponThrown();
    M = 0;
    J0x27:

    // End:0x60 [Loop If]
    if(M < 3)
    {
        // End:0x56
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        M++;
        // [Loop Continue]
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
        // End:0xE9
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
    //return;    
}

simulated function DetachFromPawn(Pawn P)
{
    super.DetachFromPawn(P);
    P.AmbientSound = none;
    //return;    
}

simulated function ClientWeaponThrown()
{
    local int M;

    AmbientSound = none;
    Instigator.AmbientSound = none;
    // End:0x32
    if(int(Level.NetMode) != int(NM_Client))
    {
        return;
    }
    Instigator.DeleteInventory(self);
    M = 0;
    J0x49:

    // End:0x8A [Loop If]
    if(M < 3)
    {
        // End:0x80
        if(Ammo[M] != none)
        {
            Instigator.DeleteInventory(Ammo[M]);
        }
        M++;
        // [Loop Continue]
        goto J0x49;
    }
    //return;    
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
    local int M;
    local wWeapon W;
    local bool bPossiblySwitch, bJustSpawned;

    Instigator = Other;
    // End:0x55
    if((W == none) || W.Class != Class)
    {
        bJustSpawned = true;
        super.GiveTo(Other);
        bPossiblySwitch = true;
        W = self;        
    }
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
    J0x8B:

    // End:0xF0 [Loop If]
    if(M < 3)
    {
        // End:0xE6
        if(FireMode[M] != none)
        {
            FireMode[M].Instigator = Instigator;
            W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
        }
        M++;
        // [Loop Continue]
        goto J0x8B;
    }
    // End:0x128
    if(!bJustSpawned)
    {
        M = 0;
        J0x102:

        // End:0x125 [Loop If]
        if(M < 3)
        {
            Ammo[M] = none;
            M++;
            // [Loop Continue]
            goto J0x102;
        }
        Destroy();
    }
    //return;    
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
    //return;    
}

simulated function CheckPartsSet()
{
    //return;    
}

simulated function ClientWeaponSet(bool bPossiblySwitch)
{
    local int Mode, nStartWeaponIdx;

    Log("[wWeapon::ClientWeaponSet] entry");
    Instigator = Pawn(Owner);
    bPendingSwitch = bPossiblySwitch;
    // End:0x65
    if((Instigator != none) && Instigator.IsA('wHelicopter'))
    {        
    }
    else
    {
        // End:0x89
        if((Instigator != none) && Instigator.IsA('wAIDefencePawn'))
        {            
        }
        else
        {
            // End:0x11F
            if(((Instigator == none) || Instigator.PlayerReplicationInfo == none) || (Instigator.PlayerReplicationInfo.bNoTeam == false) && Instigator.PlayerReplicationInfo.Team == none)
            {
                // End:0x116
                if(Instigator.IsA('wAIDefencePawn') || Instigator.IsA('wFlyingDefenceBot'))
                {                    
                }
                else
                {
                    GotoState('PendingClientWeaponSet');
                }
                return;
            }
        }
    }
    Mode = 0;
    J0x126:

    // End:0x204 [Loop If]
    if(Mode < 3)
    {
        // End:0x1B5
        if(FireModeClass[Mode] != none)
        {
            // End:0x1B5
            if((FireMode[Mode] == none) || (((FireMode[Mode].AmmoClass != none) && !bNoAmmoInstances) && Ammo[Mode] == none) && FireMode[Mode].AmmoPerFire > 0)
            {
                GotoState('PendingClientWeaponSet');
                return;
            }
        }
        // End:0x1FA
        if(FireMode[Mode] != none)
        {
            FireMode[Mode].Instigator = Instigator;
            FireMode[Mode].Level = Level;
        }
        Mode++;
        // [Loop Continue]
        goto J0x126;
    }
    CheckPartsSet();
    ClientState = 1;
    GotoState('Hidden');
    // End:0x241
    if(wHands == none)
    {
        // End:0x241
        if(false == Instigator.IsA('wBotVehicle'))
        {
            SetHands();
        }
    }
    // End:0x289
    if(false == Instigator.IsA('wBotVehicle'))
    {
        // End:0x289
        if((int(Level.NetMode) == int(NM_DedicatedServer)) || !Instigator.IsHumanControlled())
        {
            return;
        }
    }
    // End:0x2F7
    if(((Instigator.Weapon != none) && Instigator.Weapon == self) || Instigator.PendingWeapon == self)
    {
        // End:0x2EF
        if(Instigator.PendingWeapon != none)
        {
            Instigator.ChangedWeapon();            
        }
        else
        {
            BringUp();
        }
        return;
    }
    // End:0x32A
    if((Instigator.PendingWeapon != none) && Instigator.PendingWeapon.bForceSwitch)
    {
        return;
    }
    // End:0x38B
    if((bPickupChange == true) && (BaseParams.iInventoryGroup != 3) || BaseParams.iInventoryGroup != 6)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();
        bPickupChange = false;
    }
    nStartWeaponIdx = 1;
    // End:0x3D3
    if(int(Level.GetMatchMaker().2) == int(Level.GetMatchMaker().eWeaponLimit))
    {
        nStartWeaponIdx = 2;        
    }
    else
    {
        // End:0x414
        if(int(Level.GetMatchMaker().3) == int(Level.GetMatchMaker().eWeaponLimit))
        {
            nStartWeaponIdx = 4;            
        }
        else
        {
            // End:0x480
            if((Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA()) || int(Level.GetMatchMaker().1) == int(Level.GetMatchMaker().eWeaponLimit))
            {
                nStartWeaponIdx = 3;
            }
        }
    }
    // End:0x4D0
    if((Instigator.Weapon == none) && BaseParams.iInventoryGroup == nStartWeaponIdx)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();        
    }
    else
    {
        // End:0x5F8
        if((bPossiblySwitch && Instigator.Weapon != none) && !Instigator.Weapon.IsFiring())
        {
            // End:0x54B
            if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
            {
                return;
            }
            // End:0x5AD
            if(Instigator.PendingWeapon != none)
            {
                // End:0x5AA
                if((RateSelf()) > Instigator.PendingWeapon.RateSelf())
                {
                    Instigator.PendingWeapon = self;
                    Instigator.Weapon.PutDown();
                }                
            }
            else
            {
                // End:0x5F8
                if((RateSelf()) > Instigator.Weapon.RateSelf())
                {
                    Instigator.PendingWeapon = self;
                    Instigator.Weapon.PutDown();
                }
            }
        }
    }
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    local int Mode;
    local float fAnimRate;
    local string strSoundName;
    local Controller tempCon;

    // End:0x3E3
    if(int(ClientState) == int(1))
    {
        // End:0x3DB
        if(Instigator.IsLocallyControlled())
        {
            // End:0x3DB
            if(Mesh != none)
            {
                fAnimRate = SelectAnimRate;
                // End:0x59
                if(Instigator.CanQuickWeaponChange() == true)
                {
                    fAnimRate *= 1.3000000;
                }
                // End:0x227
                if((bCanSelectNew == true) && HasAnim(SelectNewAnim))
                {
                    PlayAnim(SelectNewAnim, fAnimRate, 0.0000000);
                    // End:0x9C
                    if(int(Role) < int(ROLE_Authority))
                    {
                        bCanSelectNew = false;
                    }
                    // End:0x191
                    if(((ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_helicopter_R") || ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_uav_R") || ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_artillery_R")
                    {
                        strSoundName = Class'Engine.wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                        tempCon = Instigator.Controller;
                        Instigator.FmodPlayOwnedSound(strSoundName, 0);                        
                    }
                    else
                    {
                        Instigator.FmodPlaySoundUseID(ResParams.default.fsound_Select_New, 3, 1.0000000,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x224
                        if(int(Role) < int(ROLE_Authority))
                        {
                            Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Select_New, 3, 1.0000000,, false, false, -1, false);
                        }
                    }                    
                }
                else
                {
                    // End:0x3DB
                    if(HasAnim(SelectAnim))
                    {
                        PlayAnim(SelectAnim, SelectAnimRate * fAnimRate, 0.0000000);
                        bCanSelectNew = false;
                        // End:0x348
                        if(((ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_helicopter_R") || ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_uav_R") || ResParams.default.sound_Select_PackType == "/Combat_self/v_cb_call_artillery_R")
                        {
                            strSoundName = Class'Engine.wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                            tempCon = Instigator.Controller;
                            Instigator.FmodPlayOwnedSound(strSoundName, 0);                            
                        }
                        else
                        {
                            Instigator.FmodPlaySoundUseID(ResParams.default.fsound_Select, 3, 1.0000000,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x3DB
                            if(int(Role) < int(ROLE_Authority))
                            {
                                Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Select, 3, 1.0000000,, false, false, -1, false);
                            }
                        }
                    }
                }
            }
        }
        ClientState = 2;
    }
    Mode = 0;
    J0x3EA:

    // End:0x487 [Loop If]
    if(Mode < 3)
    {
        // End:0x47D
        if(FireMode[Mode] != none)
        {
            FireMode[Mode].bIsFiring = false;
            FireMode[Mode].HoldTime = 0.0000000;
            FireMode[Mode].bServerDelayStartFire = false;
            FireMode[Mode].bServerDelayStopFire = false;
            FireMode[Mode].bInstantStop = false;
        }
        Mode++;
        // [Loop Continue]
        goto J0x3EA;
    }
    // End:0x546
    if(((PrevWeapon != none) && PrevWeapon.HasAmmo()) && !PrevWeapon.bNoVoluntarySwitch)
    {
        // End:0x4DD
        if(!PrevWeapon.IsA('wMeleeWeapon'))
        {
            OldWeapon = PrevWeapon;
        }
        // End:0x543
        if(OldWeapon != none)
        {
            Instigator.FmodPlayOwnedSound(FmodNullSound, 3,,, false);
            // End:0x543
            if(int(Role) < int(ROLE_Authority))
            {
                OldWeapon.ServerFmodPlayOwnedSound(FmodNullSound, 3,,, false);
                Instigator.FmodServerSpecPlaySound(FmodNullSound, 3,,, false);
            }
        }        
    }
    else
    {
        OldWeapon = none;
    }
    // End:0x59B
    if(Instigator != none)
    {
        Instigator.SetAimModeValueOnly(false);
        // End:0x59B
        if(Instigator.Controller != none)
        {
            bSprint = Instigator.Controller.bSprint;
        }
    }
    // End:0x5B4
    if(!self.IsA('wDemopack'))
    {
        ActionThrowsWeapon(0);
    }
    // End:0x5D8
    if(OldWeapon.IsA('wDemopack'))
    {
        OldWeapon.ActionThrowsWeapon(0);
    }
    //return;    
}

function ServerFmodPlayOwnedSound(string SoundName, optional Actor.ESoundSlot Slot, optional float Pitch, optional bool bNoOverride, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    Instigator.FmodPlaySound(SoundName, Slot, Pitch, bNoOverride, Attenuate, Loop, SellectTeam, bExceptOwner);
    //return;    
}

simulated function ActionThrowsWeapon(int Num)
{
    ServerActionThrowsWeapon(Num);
    byActionThrowsWeapon = byte(Num);
    //return;    
}

function ServerActionThrowsWeapon(int Num)
{
    byActionThrowsWeapon = byte(Num);
    //return;    
}

simulated function bool PutDown()
{
    local int Mode;
    local bool bNoAnim;

    // End:0x22
    if(int(MeleeState) == int(1))
    {
        Instigator.PendingWeapon = none;
        return false;
    }
    // End:0x81
    if((Instigator.CanQuickWeaponChange() == true) || (Instigator.PendingWeapon != none) && Instigator.PendingWeapon.BaseParams.bApplyQuickDrop == true)
    {
        bQuickDropAnim = true;        
    }
    else
    {
        bQuickDropAnim = false;
    }
    // End:0x25E
    if((int(ClientState) == int(2)) || int(ClientState) == int(4))
    {
        // End:0x163
        if((Instigator.PendingWeapon != none) && !Instigator.PendingWeapon.bForceSwitch)
        {
            Mode = 0;
            J0xE5:

            // End:0x163 [Loop If]
            if(Mode < 3)
            {
                // End:0x105
                if(none == FireMode[Mode])
                {
                    // [Explicit Continue]
                    goto J0x159;
                }
                // End:0x159
                if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
                {
                    // End:0x157
                    if(FireMode[Mode].IsA('wThrowingFire'))
                    {
                        // [Explicit Continue]
                        goto J0x159;
                        // [Explicit Continue]
                        goto J0x159;
                    }
                    return false;
                }
                J0x159:

                Mode++;
                // [Loop Continue]
                goto J0xE5;
            }
        }
        // End:0x256
        if(Instigator.IsLocallyControlled())
        {
            Mode = 0;
            J0x17C:

            // End:0x1F0 [Loop If]
            if(Mode < 3)
            {
                // End:0x1E6
                if((FireMode[Mode] != none) && FireMode[Mode].bIsFiring)
                {
                    // End:0x1DB
                    if(FireMode[Mode].IsA('wThrowingFire'))
                    {
                        ClientCancelFire(Mode);
                        // [Explicit Continue]
                        goto J0x1E6;
                    }
                    ClientStopFire(Mode);
                }
                J0x1E6:

                Mode++;
                // [Loop Continue]
                goto J0x17C;
            }
            // End:0x21E
            if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
            {
                PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0000000);                
            }
            else
            {
                // End:0x23E
                if(HasAnim(PutDownAnim))
                {
                    PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);                    
                }
                else
                {
                    // End:0x256
                    if(int(WeaponType) != int(12))
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

    // End:0x2BA [Loop If]
    if(Mode < 3)
    {
        // End:0x2B0
        if(none != FireMode[Mode])
        {
            FireMode[Mode].bServerDelayStartFire = false;
            FireMode[Mode].bServerDelayStopFire = false;
        }
        Mode++;
        // [Loop Continue]
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
        else
        {
            Mode = 0;
            J0x319:

            // End:0x355 [Loop If]
            if(Mode < 3)
            {
                // End:0x34B
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].DestroyEffects();
                }
                Mode++;
                // [Loop Continue]
                goto J0x319;
            }
        }
    }
    return true;
    //return;    
}

simulated function Fire(float f)
{
    //return;    
}

simulated function AltFire(float f)
{
    // End:0x17
    if(bSprint == true)
    {
        bBlendSprint_AdsIdle = true;        
    }
    else
    {
        bBlendSprint_AdsIdle = false;
    }
    Log((("<AltFire> bSprint : " $ string(bSprint)) $ "bBlendSprint_AdsIdle : ") $ string(bBlendSprint_AdsIdle));
    //return;    
}

simulated event WeaponTick(float dt)
{
    CalcStanceOffset(dt);
    CalcBreathOffset();
    CalcSwayRot(dt);
    CalcFiringSwayRot(dt);
    ProcessMoveAni();
    //return;    
}

simulated function ProcessMoveAni()
{
    // End:0x24
    if((Instigator == none) || Instigator.bIsProned == false)
    {
        return;
    }
    // End:0x3B
    if(Instigator.bIsDefencing == true)
    {
        return;
    }
    // End:0x85
    if(((((int(ClientState) != int(4)) || bSprint == true) || (IsReloading()) == true) || (IsFiring()) == true) || (IsMeleeAttacking()) == true)
    {
        return;
    }
    // End:0xAF
    if(Instigator.bIsIdle == true)
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);        
    }
    else
    {
        LoopAnim(ProneMoveAnim, 1.0000000, 0.2000000);
    }
    //return;    
}

simulated function OutOfAmmo()
{
    // End:0x2E
    if(((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo())
    {
        return;
    }
    DoAutoSwitch();
    //return;    
}

simulated function DoAutoSwitch()
{
    Instigator.Controller.SwitchToBestWeapon();
    //return;    
}

simulated event ClientStartFire(int Mode)
{
    // End:0x48
    if(Pawn(Owner).Controller.IsInState('GameEnded') || Pawn(Owner).Controller.IsInState('RoundEnded'))
    {
        return;
    }
    // End:0x93
    if(int(Role) < int(ROLE_Authority))
    {
        // End:0x90
        if(StartFire(Mode))
        {
            PlayerController(Instigator.Controller).SetViewValue();
            ServerStartFire(byte(Mode));
        }        
    }
    else
    {
        StartFire(Mode);
    }
    //return;    
}

simulated event NotifyReloaded()
{
    //return;    
}

simulated event ClientStopFire(int Mode)
{
    // End:0x18
    if(FireMode[Mode].bEnableBustMode)
    {
    }
    // End:0x33
    if(int(Role) < int(ROLE_Authority))
    {
        StopFire(Mode);
    }
    ServerStopFire(byte(Mode));
    //return;    
}

simulated function ClientCancelFire(int Mode)
{
    //return;    
}

event ServerStartFire(byte Mode)
{
    // End:0x64
    if((Instigator != none) && Instigator.Weapon != self)
    {
        // End:0x49
        if(Instigator.Weapon == none)
        {
            Instigator.ServerChangedWeapon(none, self);            
        }
        else
        {
            Instigator.Weapon.SynchronizeWeapon(self);
        }
        return;
    }
    // End:0x12D
    if((FireMode[int(Mode)].NextFireTime <= (Level.TimeSeconds + FireMode[int(Mode)].PreFireTime)) && StartFire(int(Mode)))
    {
        Log("FireMode[Mode].NextFireTime <= Level.TimeSeconds ");
        FireMode[int(Mode)].ServerStartFireTime = Level.TimeSeconds;
        FireMode[int(Mode)].bServerDelayStartFire = false;        
    }
    else
    {
        // End:0x181
        if(FireMode[int(Mode)].AllowFire())
        {
            Log("FireMode[Mode].AllowFire()");
            FireMode[int(Mode)].bServerDelayStartFire = true;            
        }
        else
        {
            ClientForceAmmoUpdate(int(Mode), AmmoAmount(int(Mode)));
        }
    }
    //return;    
}

simulated function ClientForceAmmoUpdate(int Mode, int NewAmount)
{
    Log((((string(self) $ " ClientForceAmmoUpdate mode ") $ string(Mode)) $ " newamount ") $ string(NewAmount));
    // End:0x63
    if(bNoAmmoInstances)
    {
        AmmoCharge[Mode] = NewAmount;        
    }
    else
    {
        // End:0x8E
        if(Ammo[Mode] != none)
        {
            Ammo[Mode].AmmoAmount = NewAmount;
        }
    }
    //return;    
}

function SynchronizeWeapon(wWeapon ClientWeapon)
{
    Instigator.ServerChangedWeapon(self, ClientWeapon);
    //return;    
}

function ServerStopFire(byte Mode)
{
    // End:0x61
    if(FireMode[int(Mode)].bServerDelayStartFire || FireMode[int(Mode)].ServerStartFireTime == Level.TimeSeconds)
    {
        FireMode[int(Mode)].bServerDelayStopFire = true;        
    }
    else
    {
        StopFire(int(Mode));
    }
    //return;    
}

function ServerCancelFire(byte Mode)
{
    //return;    
}

simulated event bool ReadyToFire(int Mode)
{
    local int alt;

    // End:0x12
    if(int(MeleeState) == int(1))
    {
        return false;
    }
    // End:0x25
    if(none == FireMode[Mode])
    {
        return false;
    }
    // End:0x3A
    if(Mode == 0)
    {
        alt = 1;        
    }
    else
    {
        alt = 0;
    }
    // End:0xA1
    if(none != FireMode[alt])
    {
        // End:0xA1
        if(FireMode[alt] != FireMode[Mode])
        {
            // End:0xA1
            if(FireMode[alt].bModeExclusive && FireMode[alt].bIsFiring)
            {
                return false;
            }
        }
    }
    // End:0xBE
    if(false == FireMode[Mode].AllowFire())
    {
        return false;
    }
    // End:0xFD
    if(FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
    {
        return false;
    }
    return true;
    //return;    
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
    else
    {
        alt = 0;
    }
    FireMode[Mode].bIsFiring = true;
    FireMode[Mode].bNowWaiting = false;
    FireMode[Mode].IsFiringBustMode = true;
    FireMode[Mode].bReleasedFiring = false;
    FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
    // End:0x141
    if((FireMode[alt] != none) && FireMode[alt].bModeExclusive)
    {
        Log("prevents rapidly");
        FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
    }
    // End:0x1B6
    if(Instigator.IsLocallyControlled())
    {
        // End:0x1A0
        if((FireMode[Mode].PreFireTime > 0.0000000) || FireMode[Mode].bFireOnRelease)
        {
            FireMode[Mode].PlayPreFire();
        }
        FireMode[Mode].FireCount = 0;
    }
    FireMode[Mode].StartFiring();
    return true;
    //return;    
}

simulated event StopFire(int Mode)
{
    // End:0x2F
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
    // End:0x103
    if(FireMode[Mode].bEnableBustMode)
    {
        FireMode[Mode].IsFiringBustMode = false;
        FireMode[Mode].iFireCount = 0;
        // End:0x103
        if(FireMode[Mode].bReleasedFiring == false)
        {
            Instigator.Controller.bFire = 0;
        }
    }
    FireMode[Mode].StopFiring();
    // End:0x13D
    if(!FireMode[Mode].bFireOnRelease)
    {
        ZeroFlashCount(Mode);
    }
    StoreAmmo();
    //return;    
}

simulated function CancelFire(int Mode)
{
    //return;    
}

function StoreAmmo()
{
    local PlayerController PC;
    local string strName;

    PC = PlayerController(Pawn(Owner).Owner);
    // End:0x41
    if((PC == none) || PC.GSSS == none)
    {
        return;
    }
    // End:0x64
    if(__NFUN_919__(InventoryUniqueNumber, 0))
    {
        strName = BaseParams.strName;        
    }
    else
    {
        strName = __NFUN_918__(InventoryUniqueNumber);
    }
    PC.GSSS.SetToStorage_WeaponAmmo(strName, AmmoCharge[0], AmmoCharge[0]);
    //return;    
}

simulated function ImmediateStopFire()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xE1 [Loop If]
    if(i < 3)
    {
        ClientStopFire(i);
        // End:0xD7
        if(FireMode[i].bFireOnRelease)
        {
            // End:0xA8
            if((Level.TimeSeconds > FireMode[i].NextFireTime) && FireMode[i].bInstantStop || !FireMode[i].bNowWaiting)
            {
                FireMode[i].ModeDoFire();
            }
            // End:0xD7
            if(FireMode[i].bWaitForRelease)
            {
                FireMode[i].bNowWaiting = true;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function Timer()
{
    //return;    
}

simulated function bool IsFiring()
{
    // End:0x8C
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        return (int(ClientState) == int(4)) && ((FireMode[0] != none) && FireMode[0].IsFiring()) || (FireMode[1] != none) && FireMode[1].IsFiring();
    }
    return (int(ClientState) == int(4)) && ((FireMode[0] != none) && FireMode[0].IsFiring()) || (FireMode[1] != none) && FireMode[1].IsFiring();
    //return;    
}

simulated function bool IsSingleFire()
{
    // End:0x19
    if(BaseParams.iFireMode == 0)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool IsRapidFire()
{
    // End:0x38
    if((FireMode[1] != none) && FireMode[1].bIsFiring)
    {
        return FireMode[1].bPawnRapidFireAnim;        
    }
    else
    {
        // End:0x5A
        if(FireMode[0] != none)
        {
            return FireMode[0].bPawnRapidFireAnim;            
        }
        else
        {
            return false;
        }
    }
    //return;    
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    //return;    
}

simulated function CheckSuperBerserk()
{
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local int Mode;
    local float OldDownDelay;

    OldDownDelay = DownDelay;
    DownDelay = 0.0000000;
    GetAnimParams(0, Anim, frame, Rate);
    // End:0x182
    if(int(ClientState) == int(4))
    {
        // End:0x55
        if(int(MeleeState) == int(1))
        {
            PlayIdle();            
        }
        else
        {
            // End:0xC1
            if(((FireMode[0] != none) && Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
            {
                PlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);                
            }
            else
            {
                // End:0x12D
                if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
                {
                    PlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);                    
                }
                else
                {
                    // End:0x17F
                    if(((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring)
                    {
                        PlayIdle();
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x1E6
        if(int(ClientState) == int(2))
        {
            Mode = 0;
            J0x199:

            // End:0x1D5 [Loop If]
            if(Mode < 3)
            {
                // End:0x1CB
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].InitEffects();
                }
                Mode++;
                // [Loop Continue]
                goto J0x199;
            }
            PlayIdle();
            ClientState = 4;            
        }
        else
        {
            // End:0x2F4
            if(int(ClientState) == int(3))
            {
                // End:0x250
                if(OldDownDelay > float(0))
                {
                    // End:0x231
                    if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
                    {
                        PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0000000);                        
                    }
                    else
                    {
                        // End:0x24E
                        if(HasAnim(PutDownAnim))
                        {
                            PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
                        }
                    }
                    return;
                }
                // End:0x275
                if(Instigator.PendingWeapon == none)
                {
                    PlayIdle();
                    ClientState = 4;                    
                }
                else
                {
                    ClientState = 1;
                    Instigator.ChangedWeapon();
                    // End:0x2B1
                    if(Instigator.Weapon == self)
                    {
                        PlayIdle();
                        ClientState = 4;                        
                    }
                    else
                    {
                        Mode = 0;
                        J0x2B8:

                        // End:0x2F4 [Loop If]
                        if(Mode < 3)
                        {
                            // End:0x2EA
                            if(FireMode[Mode] != none)
                            {
                                FireMode[Mode].DestroyEffects();
                            }
                            Mode++;
                            // [Loop Continue]
                            goto J0x2B8;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

simulated function PlayIdle()
{
    // End:0x1E
    if(bSprint)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.3000000);        
    }
    else
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
    }
    // End:0x96
    if(int(MeleeState) == int(1))
    {
        MeleeState = 0;
        // End:0x96
        if(Pawn(Owner) != none)
        {
            Pawn(Owner).Controller.bMeleeFire = 0;
            Pawn(Owner).Controller.bFire = 0;
        }
    }
    //return;    
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
    return false;
    //return;    
}

simulated function bool CheckTryToDrive()
{
    return true;
    //return;    
}

function DoReflectEffect(int Drain)
{
    //return;    
}

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
    //return;    
}

simulated function bool WantsZoomFade()
{
    return false;
    //return;    
}

function bool CanHeal(Actor Other)
{
    return false;
    //return;    
}

function bool ShouldFireWithoutTarget()
{
    return false;
    //return;    
}

function bool ShootHoop(Controller B, Vector ShootLoc)
{
    return false;
    //return;    
}

simulated function PawnUnpossessed()
{
    //return;    
}

simulated function wWeaponFire GetFireMode(byte Mode)
{
    // End:0x1C
    if(int(Mode) < 3)
    {
        return FireMode[int(Mode)];
    }
    return none;
    //return;    
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    local int i;

    BaseParams = wBase;
    WeaponType = BaseParams.eType;
    InventoryGroup = byte(BaseParams.iInventoryGroup);
    SetFireModeClass_ToMode(wBase);
    // End:0x154
    if(szFireModeClass == "")
    {
        switch(BaseParams.BulletType)
        {
            // End:0x7F
            case 1:
                szFireModeClass = "Engine.wInstantFire";
                // End:0x154
                break;
            // End:0x104
            case 2:
                switch(BaseParams.ProjMoveType)
                {
                    // End:0xBA
                    case 1:
                        szFireModeClass = "WWeapons.wThrowingFire";
                        // End:0x104
                        break;
                    // End:0xDE
                    case 2:
                        szFireModeClass = "WWeapons.wRocketFire";
                        // End:0x104
                        break;
                    // End:0x101
                    case 3:
                        szFireModeClass = "WWeapons.wFlameFire";
                        // End:0x104
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            // End:0x14E
            case 3:
                switch(BaseParams.eType)
                {
                    // End:0x148
                    case 19:
                        szFireModeClass = "WWeapons.wWeaponFireInstallPack";
                        // End:0x14B
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                // End:0x154
                break;
            // End:0xFFFF
            default:
                // End:0x154
                break;
                break;
        }
    }
    // End:0x17D
    if(szFireModeClass != "")
    {
        FireModeClass[0] = Class<wWeaponFire>(DynamicLoadObject(szFireModeClass, Class'Core.Class'));
    }
    SelectAnimRate = BaseParams.fAnimRate_BringUp;
    PutDownAnimRate = BaseParams.fAnimRate_PutDown;
    PutDownQuickAnimRate = BaseParams.fAnimRate_PutDown_Quick;
    fBreathSeconds = BaseParams.fBreathSpeed_Idle;
    // End:0x2CB
    if(BaseParams.wt_BoundingMax > float(0))
    {
        wt_RandomMul = BaseParams.wt_RandomMul;
        wt_BoundingMax = int(BaseParams.wt_BoundingMax);
        i = 0;
        J0x214:

        // End:0x298 [Loop If]
        if(float(i) < BaseParams.wt_BoundingMax)
        {
            wt_x[i] = BaseParams.wt_x[i];
            wt_y[i] = BaseParams.wt_y[i];
            wt_RandomWeight[i] = BaseParams.wt_RandomWeight[i];
            i++;
            // [Loop Continue]
            goto J0x214;
        }
        Log(("" $ string(BaseParams.iWeaponID)) $ " Loadout WeaponTraceInfo!");
    }
    // End:0x3CC
    if(BaseParams.wtAim_BoundingMax > float(0))
    {
        wtAim_RandomMul = BaseParams.wtAim_RandomMul;
        wtAim_BoundingMax = int(BaseParams.wtAim_BoundingMax);
        i = 0;
        J0x312:

        // End:0x396 [Loop If]
        if(float(i) < BaseParams.wtAim_BoundingMax)
        {
            wtAim_x[i] = BaseParams.wtAim_x[i];
            wtAim_y[i] = BaseParams.wtAim_y[i];
            wtAim_RandomWeight[i] = BaseParams.wtAim_RandomWeight[i];
            i++;
            // [Loop Continue]
            goto J0x312;
        }
        Log(("" $ string(BaseParams.iWeaponID)) $ " Loadout WeaponTraceAimInfo!");
    }
    //return;    
}

simulated function SetFireModeClass_ToMode(wWeaponBaseParams wBase)
{
    switch(wBase.BulletType)
    {
        // End:0xA9
        case 2:
            switch(wBase.ProjMoveType)
            {
                // End:0x62
                case 3:
                    // End:0x5F
                    if(Instigator.IsA('wAIDefencePawn'))
                    {
                        szFireModeClass = "WWeapons.wFlameFire_Alien";
                    }
                    // End:0xA6
                    break;
                // End:0xA0
                case 2:
                    // End:0x9D
                    if(Instigator.IsA('wFlyingDefenceBot'))
                    {
                        szFireModeClass = "WWeapons.wRocketFire_Alien";
                    }
                    // End:0xA6
                    break;
                // End:0xFFFF
                default:
                    // End:0xA6
                    break;
                    break;
            }
            // End:0xAF
            break;
        // End:0xFFFF
        default:
            // End:0xAF
            break;
            break;
    }
    //return;    
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    FmodNullSound = "Warfare_Sound_Char/etc/nullsound";
    //return;    
}

simulated function SetHands()
{
    local Mesh meshHands;
    local int iBodyItemID, iTeamIndex;
    local Material mt;
    local wItemBoxHK ItemInfo;

    // End:0x1E
    if(wHands != none)
    {
        wHands.Destroy();
        wHands = none;
    }
    // End:0x17B
    if((Instigator != none) && Instigator.PlayerReplicationInfo != none)
    {
        // End:0xC5
        if((Level.GRI.GameClass ~= "WGame.wDeathMatch") || Level.GRI.GameClass ~= "WMission.wAlienGameInfo")
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.SideID;            
        }
        else
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.Team.TeamIndex;
        }
        // End:0x118
        if(iTeamIndex == 0)
        {
            iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[0];            
        }
        else
        {
            iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[1];
        }
        // End:0x14D
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        meshHands = Level.GameMgr.GetItemResourceMesh(iBodyItemID, false, byte(iTeamIndex));        
    }
    else
    {
        meshHands = Level.GameMgr.GetItemResourceMesh(15000, false, 0);
    }
    wHands = Spawn(Class'Engine.wSkinShell', self);
    wHands.SetDrawType(2);
    wHands.LinkMesh(meshHands);
    wHands.SetBase(self);
    wHands.SetOwner(self);
    AttachToBone(wHands, 'XXXX_Dummy');
    ItemInfo = Level.GameMgr.FindUIItem(iBodyItemID);
    // End:0x2A3
    if((ItemInfo != none) && ItemInfo.ItemType != 11)
    {
        // End:0x2A3
        if(Instigator.PlayerReplicationInfo.iCamouflageItemID > 0)
        {
            mt = Get1stCamouflageMt(Instigator.PlayerReplicationInfo.iCamouflageItemID, byte(iTeamIndex));
            wHands.Skins[0] = mt;
        }
    }
    //return;    
}

function SetHands_Server()
{
    SetHands();
    SetHands_Client();
    //return;    
}

simulated function SetHands_Client()
{
    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        SetHands();
    }
    //return;    
}

simulated function Material Get1stCamouflageMt(int iItemID, byte byTeam)
{
    local Material mt;
    local wItemResourceParam cResParam;
    local wGameManager GM;
    local int iBodyItemID;
    local string str1stCamouflage;

    GM = Level.GameMgr;
    // End:0x103
    if(int(byTeam) == 0)
    {
        iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[0];
        // End:0x56
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        cResParam = GM.GetItemResourceParam(iBodyItemID);
        str1stCamouflage = cResParam.strRes_1st_AF_Camouflage;
        cResParam = GM.GetItemResourceParam(iItemID);
        str1stCamouflage = str1stCamouflage $ cResParam.strRes_1st_AF_Camouflage;
        // End:0x100
        if((cResParam.mesh_Base_1st == none) && Len(str1stCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(str1stCamouflage, Class'Engine.Material'));
        }        
    }
    else
    {
        iBodyItemID = Instigator.PlayerReplicationInfo.aiBodyItemID[1];
        // End:0x138
        if(iBodyItemID <= 0)
        {
            iBodyItemID = 15000;
        }
        cResParam = GM.GetItemResourceParam(iBodyItemID);
        str1stCamouflage = cResParam.strRes_1st_RSA_Camouflage;
        cResParam = GM.GetItemResourceParam(iItemID);
        str1stCamouflage = str1stCamouflage $ cResParam.strRes_1st_RSA_Camouflage;
        // End:0x1E2
        if((cResParam.mesh_Base_1st_RSA == none) && Len(str1stCamouflage) > 1)
        {
            mt = Material(GM.DynamicLoadObject(str1stCamouflage, Class'Engine.Material'));
        }
    }
    return mt;
    //return;    
}

function wLoadOut_Server(int iID, int iAddPartsID, optional bool bInGamePlaying)
{
    wLoadOut(iID, iAddPartsID);
    wLoadOut_Client(iID, iAddPartsID);
    //return;    
}

simulated function wLoadOut_Client(int iID, int iAddPartsID)
{
    // End:0x20
    if(int(Role) != int(ROLE_Authority))
    {
        wLoadOut(iID, iAddPartsID);
    }
    //return;    
}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;
    local int M;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    Log("[wWeapon::wLoadOut] entry");
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0xA3
    if(wRes == none)
    {
        Log("[wWeapon::wLoadOut] if(wRes == none)");
        return;
    }
    Log("[wWeapon::wLoadOut] ID=" $ string(iID));
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, false));
    bCanSelectNew = true;
    SetBaseParams(wBase);
    SetResParams(wRes);
    M = 0;
    J0x110:

    // End:0x165 [Loop If]
    if(M < 3)
    {
        // End:0x15B
        if((FireModeClass[M] != none) && FireMode[M] == none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        M++;
        // [Loop Continue]
        goto J0x110;
    }
    InitWeaponFires();
    M = 0;
    J0x172:

    // End:0x27C [Loop If]
    if(M < 3)
    {
        // End:0x272
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
        M++;
        // [Loop Continue]
        goto J0x172;
    }
    // End:0x2BC
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        MaxLights = byte(Min(4, int(MaxLights)));
    }
    // End:0x2DE
    if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallViewOffset = default.PlayerViewOffset;
    }
    // End:0x30E
    if(SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;
    }
    // End:0x37C
    if(bUseOldWeaponMesh && OldMesh != none)
    {
        bInitOldMesh = true;
        LinkMesh(OldMesh);
        Log("[wWeapon::wLoadOut] if ( bUseOldWeaponMesh && (OldMesh != None) )");
    }
    M = 0;
    J0x383:

    // End:0x3BF [Loop If]
    if(M < 3)
    {
        // End:0x3B5
        if(FireMode[M] != none)
        {
            FireMode[M].wLoadOut();
        }
        M++;
        // [Loop Continue]
        goto J0x383;
    }
    FillToInitialAmmo();
    // End:0x40B
    if(FireMode[0] != none)
    {
        FireMode[0].Load = float(FireMode[0].AmmoPerFire);
        FireMode[0].HoldTime = 0.0000000;
    }
    AddPartsGroup(iID, iAddPartsID);
    ClientWeaponSet(true);
    SetAddPartsParams();
    fMeleeDelay = BaseParams.fMeleeDelay;
    fFireDelay = BaseParams.fFireDelay;
    self.SRand_FireCount = 0;
    self.SRand_ReloadCount = 0;
    //return;    
}

simulated function SetAddPartsParams()
{
    //return;    
}

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
    if((wcip.iItemID <= 0) || wcip.iItemID != iWeaponID)
    {
        return;
    }
    iSightPartID = iAddPartsID & 1023;
    iBarrelPartID = iAddPartsID & 130048;
    iSilencerPartID = iAddPartsID & 16646144;
    iGunstockPartID = iAddPartsID & 2130706432;
    // End:0x2E0
    if(iSightPartID > 1)
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x2DD
        if((wcpp.iItemID > 0) && wcpp.iPartID == iSightPartID)
        {
            iSubSightPartItemID = wcip.iSightOnAddItemID;
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x2DD
            if(ItemResParam.iItemResourceID != -1)
            {
                ItemParam = Level.GameMgr.GetItemParam(wcpp.iItemID);
                AimDiff.X = wcip.vAimDiff.X + wcpp.vAddAimDiff.X;
                AimDiff.Y = wcip.vAimDiff.Y + wcpp.vAddAimDiff.Y;
                AimDiff.Z = wcip.vAimDiff.Z + wcpp.vAddAimDiff.Z;
                // End:0x27A
                if(int(ItemParam.eType) == int(20))
                {
                    AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);                    
                }
                else
                {
                    // End:0x2DD
                    if(int(ItemParam.eType) == int(26))
                    {
                        AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, wcpp.iItemID, iAddPartsID);
                    }
                }
            }
        }        
    }
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
            AimDiff.X = 0.0000000;
            AimDiff.Y = 0.0000000;
            AimDiff.Z = 0.0000000;
            // End:0x3EB
            if(int(ItemParam.eType) == int(20))
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);                
            }
            else
            {
                // End:0x446
                if(int(ItemParam.eType) == int(26))
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, ItemResParam.strHaveDotName, AimDiff, iSubSightPartItemID, iAddPartsID, true);
                }
            }
        }
    }
    // End:0x516
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x516
        if(wcpp.iItemID > 0)
        {
            ItemResParam = Level.GameMgr.GetItemResourceParam(wcpp.iItemID);
            // End:0x516
            if(ItemResParam.iItemResourceID != -1)
            {
                AddParts(5, ItemResParam.strRes_1st, ItemResParam.strRes_3rd_AF_Backpack, "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
            }
        }
    }
    // End:0x58A
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x58A
        if(wcpp.iItemID > 0)
        {
            AddParts(6, "", "", "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
        }
    }
    // End:0x5FE
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = Level.GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x5FE
        if(wcpp.iItemID > 0)
        {
            AddParts(4, "", "", "", vect(0.0000000, 0.0000000, 0.0000000), wcpp.iItemID, iAddPartsID);
        }
    }
    // End:0x63C
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID,, iPainting_Item_ID);        
    }
    else
    {
        // End:0x68C
        if(wcip.iDefaultPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, iAddPartsID,, wcip.iDefaultPaintingID);            
        }
        else
        {
            Skins.Length = 0;
        }
    }
    //return;    
}

function AttachToPawn(Pawn P)
{
    local name BoneName;
    local bool bActiveThirdPersonFire;

    Instigator = P;
    // End:0x231
    if(ThirdPersonActor == none)
    {
        // End:0x89
        if(((BaseParams.iWeaponID == 50001) || BaseParams.iWeaponID == 90020) || BaseParams.iWeaponID == 90022)
        {
            szWeaponAttachmentName = "WWeapons.wHeliMainAttachment";            
        }
        else
        {
            // End:0xC9
            if(BaseParams.iWeaponID == 50002)
            {
                szWeaponAttachmentName = "WWeapons.wHeliRPGAttachment_L";                
            }
            else
            {
                // End:0x13A
                if(((BaseParams.iWeaponID == 50005) || BaseParams.iWeaponID == 90021) || BaseParams.iWeaponID == 90023)
                {
                    szWeaponAttachmentName = "WWeapons.wHeliRPGAttachment_R";
                }
            }
        }
        AttachmentClass = Class<InventoryAttachment>(DynamicLoadObject(szWeaponAttachmentName, Class'Core.Class'));
        ThirdPersonActor = Spawn(AttachmentClass, Owner);
        // End:0x1A4
        if(false == IsA('wWeapon_Turret_FNM240'))
        {
            WeaponAttachment(ThirdPersonActor).Weapon = self;
            WeaponAttachment(ThirdPersonActor).iPainting_Item_ID = iPainting_Item_ID;
        }
        WeaponAttachment(ThirdPersonActor).iRepWeaponID = BaseParams.iWeaponID;
        WeaponAttachment(ThirdPersonActor).iRepAddPartsID = InventoryClassAddPartsID;
        WeaponAttachment(ThirdPersonActor).wLoadOut(WeaponAttachment(ThirdPersonActor).iRepWeaponID, WeaponAttachment(ThirdPersonActor).iRepAddPartsID);
        InventoryAttachment(ThirdPersonActor).InitFor(self);        
    }
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    // End:0x2C7
    if(ThirdPersonActor.AttachmentBone != 'None')
    {
        // End:0x2C4
        if(false == P.AttachToBone(ThirdPersonActor, ThirdPersonActor.AttachmentBone))
        {
            Log("Attach failed, bone name : " $ string(ThirdPersonActor.AttachmentBone));
        }        
    }
    else
    {
        BoneName = P.GetWeaponBoneFor(self);
        // End:0x336
        if(BoneName != 'None')
        {
            // End:0x333
            if(false == P.AttachToBone(ThirdPersonActor, BoneName))
            {
                Log("Attach failed, bone name : " $ string(BoneName));
            }            
        }
        else
        {
            ThirdPersonActor.SetLocation(P.Location);
            ThirdPersonActor.SetBase(P);
            bActiveThirdPersonFire = true;
        }
    }
    // End:0x3AB
    if(false == bActiveThirdPersonFire)
    {
        // End:0x3AB
        if(IsA('wWeapon_Turret_FNM240'))
        {
            ThirdPersonActor.SetLocation(P.Location);
            ThirdPersonActor.SetBase(P);
        }
    }
    //return;    
}

simulated function FireOne(int iFireMode)
{
    //return;    
}

simulated function AddParts(wWeaponAcce.EAcceType Type, string szName, string szSkinName, string strHaveDotName, Vector AimDiff, int iItemID, int iPartsGroupID, optional bool bSightSub)
{
    local int i;

    // End:0x138
    if(!bSightSub)
    {
        i = 0;
        J0x12:

        // End:0x138 [Loop If]
        if(i < Parts.Length)
        {
            // End:0xA8
            if(int(Parts[i].AcceType) == int(Type))
            {
                // End:0x86
                if(Parts[i].szName == szName)
                {
                    Parts[i].Destroy();
                    Parts[i] = none;
                    return;                    
                }
                else
                {
                    Parts[i].Destroy();
                    Parts[i] = none;
                    // [Explicit Break]
                    goto J0x138;
                }
            }
            // End:0x12E
            if(((int(Parts[i].AcceType) == int(1)) && int(Type) == int(3)) || (int(Parts[i].AcceType) == int(3)) && int(Type) == int(1))
            {
                Parts[i].Destroy();
                Parts[i] = none;
                // [Explicit Break]
                goto J0x138;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    J0x138:

    // End:0x14D
    if(bSightSub)
    {
        i = Parts.Length;
    }
    // End:0x284
    if(Parts.Length == i)
    {
        Parts.Length = Parts.Length + 1;
        Parts[i] = Spawn(Class'Engine.wWeaponAcce', self);
        // End:0x1D4
        if((iItemID == -1) && iPartsGroupID == -1)
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID, true);            
        }
        else
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID);
        }
        // End:0x23B
        if(Len(szSkinName) > 1)
        {
            Parts[i].Skins[0] = Material(DynamicLoadObject(szSkinName, Class'Engine.Material'));
        }
        // End:0x284
        if((Len(strHaveDotName) > 1) && strHaveDotName != szName)
        {
            AddParts(2, strHaveDotName, "", strHaveDotName, vect(0.0000000, 0.0000000, 0.0000000), -1, -1);
        }
    }
    //return;    
}

simulated function SetSprint(bool bValue)
{
    // End:0x0B
    if(IsWeaponChanging())
    {
        return;
    }
    bSprint = bValue;
    // End:0x35
    if((IsMeleeAttacking()) || int(ClientState) == int(2))
    {
        return;
    }
    // End:0x47
    if((IsReloading()) == false)
    {
        PlayIdle();
    }
    //return;    
}

simulated function bool GetSprint()
{
    return bSprint;
    //return;    
}

simulated function bool IsReloading()
{
    return false;
    //return;    
}

simulated function bool IsWeaponChanging()
{
    // End:0x12
    if(int(ClientState) == int(3))
    {
        return true;
    }
    return false;
    //return;    
}

simulated function bool IsPutdowning()
{
    // End:0x12
    if(int(ClientState) == int(3))
    {
        return true;
    }
    return false;
    //return;    
}

simulated function bool IsMeleeAttacking()
{
    // End:0x12
    if(int(MeleeState) == int(1))
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsExistParts(wWeaponAcce.EAcceType Type)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < Parts.Length)
    {
        // End:0x3B
        if(int(Parts[i].AcceType) == int(Type))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

simulated function float CalcDestPivot()
{
    local float fDestPivot;

    // End:0x17
    if(bLanding)
    {
        fDestPivot = -5.0000000;        
    }
    else
    {
        // End:0x37
        if(Instigator.bIsProned)
        {
            fDestPivot = -1.6000000;            
        }
        else
        {
            // End:0x57
            if(Instigator.bIsCrouched)
            {
                fDestPivot = -1.0000000;                
            }
            else
            {
                fDestPivot = 0.0000000;
            }
        }
    }
    // End:0x9B
    if(!bLanding)
    {
        fDestPivot += ((VSize(Instigator.Velocity) * -0.0050000) * BaseParams.fMovePivot);
    }
    return fDestPivot;
    //return;    
}

simulated function CalcStanceOffset(float fDelta)
{
    local float fDestPivot, fDeltaPivot, fDMax, fDMin;

    fDMin = 2.0000000 * fDelta;
    fDMax = 6.0000000 * fDelta;
    // End:0x106
    if(Instigator.Controller.IsA('PlayerController'))
    {
        fDestPivot = CalcDestPivot();
        // End:0x106
        if(fDestPivot != fStancePivot)
        {
            fDeltaPivot = ((fDestPivot - fStancePivot) * float(6)) * fDelta;
            // End:0xB3
            if(fDeltaPivot < float(0))
            {
                fDeltaPivot = FMax(fDeltaPivot, -fDMax);
                fDeltaPivot = FMin(fDeltaPivot, -fDMin);                
            }
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
    //return;    
}

simulated function CalcBreathOffset()
{
    local float fBoxWidth, fBoxHeight, fTimeValue;

    // End:0x16
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    // End:0x2E
    if(BaseParams.fBreathRadius_Idle == float(0))
    {
        return;
    }
    // End:0x4F
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
    J0x96:

    fTimeValue = Level.TimeSeconds - fBreathOffsetReflecTime_X;
    // End:0xE4
    if(fTimeValue >= fBreathSeconds)
    {
        bBreathOffsetXLeft = !bBreathOffsetXLeft;
        fBreathOffsetReflecTime_X = fBreathOffsetReflecTime_X + fBreathSeconds;        
    }
    else
    {
        vBreathOffset.Y = Cos(((fTimeValue / fBreathSeconds) - 0.5000000) * 3.1415927) * (fBoxWidth / float(2));
        // End:0x134
        if(bBreathOffsetXLeft)
        {
            vBreathOffset.Y *= float(-1);
        }
    }
    // End:0x96
    if(!(true))
        goto J0x96;
    J0x138:

    fTimeValue = Level.TimeSeconds - fBreathOffsetReflecTime_Y;
    // End:0x194
    if(fTimeValue >= (fBreathSeconds * fBreathRatio))
    {
        bBreathOffsetYUp = !bBreathOffsetYUp;
        fBreathOffsetReflecTime_Y = fBreathOffsetReflecTime_Y + (fBreathSeconds * fBreathRatio);        
    }
    else
    {
        vBreathOffset.Z = Cos(((fTimeValue / (fBreathSeconds * fBreathRatio)) - 0.5000000) * 3.1415927) * (fBoxHeight / float(2));
        // End:0x1EB
        if(bBreathOffsetYUp)
        {
            vBreathOffset.Z *= float(-1);
        }
    }
    // End:0x138
    if(!(true))
        goto J0x138;
    //return;    
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
    iPitchMax = int(BaseParams.fFiringSway_HipX_Max * 0.2000000);
    iYawMax = int(BaseParams.fFiringSway_HipY_Max * 0.2000000);
    iPitchMax = iPitchMax + Rand(iPitchMax);
    iYawMax = iYawMax + Rand(iRandYaw);
    iPitchMax_Aim = int(BaseParams.fFiringSway_AdsX_Max * 0.2000000);
    iYawMax_Aim = int(BaseParams.fFiringSway_AdsY_Max * 0.2000000);
    iPitchMax_Aim = iPitchMax_Aim + Rand(iPitchMax_Aim);
    iYawMax_Aim = iYawMax_Aim + Rand(iYawMax_Aim);
    iRandPitch = Rand(3);
    iRandYaw = Rand(3);
    // End:0x12E
    if(iRandPitch > 1)
    {
        rFiringSway_LastCameraRot.Pitch += iPitchMax;
        rFiringSway_LastCameraRot_Aim.Pitch += iPitchMax_Aim;        
    }
    else
    {
        // End:0x15B
        if(iRandPitch > 0)
        {
            rFiringSway_LastCameraRot.Pitch -= iPitchMax;
            rFiringSway_LastCameraRot_Aim.Pitch -= iPitchMax_Aim;
        }
    }
    // End:0x18B
    if(iRandYaw > 1)
    {
        rFiringSway_LastCameraRot.Yaw += iYawMax;
        rFiringSway_LastCameraRot_Aim.Yaw += iYawMax_Aim;        
    }
    else
    {
        // End:0x1B8
        if(iRandYaw > 0)
        {
            rFiringSway_LastCameraRot.Yaw -= iYawMax;
            rFiringSway_LastCameraRot_Aim.Yaw -= iYawMax_Aim;
        }
    }
    //return;    
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
    if((IsFiring()) == false)
    {
        rFiringSway_LastCameraRot = rot(0, 0, 0);
        rFiringSwayRot = rot(0, 0, 0);
        fFiringSwayAccumTime_Pitch = 0.0000000;
        fFiringSwayAccumTime_Yaw = 0.0000000;
        return;
    }
    rDelta.Pitch = -rFiringSway_LastCameraRot.Pitch;
    rDelta.Yaw = -rFiringSway_LastCameraRot.Yaw;
    rDelta /= fDeltaTime;
    rDelta.Pitch *= BaseParams.fFiringSway_HipX_Incr;
    rDelta.Yaw *= BaseParams.fFiringSway_HipY_Incr;
    iDeltaRot = -rFiringSway_LastCameraRot.Pitch;
    // End:0x11B
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
    // End:0x1CE
    if(Abs(float(rFiringSwayDestRot.Pitch)) > BaseParams.fFiringSway_HipX_Max)
    {
        // End:0x1B3
        if(rFiringSwayDestRot.Pitch < 0)
        {
            rFiringSwayDestRot.Pitch = int(-BaseParams.fFiringSway_HipX_Max);            
        }
        else
        {
            rFiringSwayDestRot.Pitch = int(BaseParams.fFiringSway_HipX_Max);
        }
    }
    // End:0x23A
    if(Abs(float(rFiringSwayDestRot.Yaw)) > BaseParams.fFiringSway_HipY_Max)
    {
        // End:0x21F
        if(rFiringSwayDestRot.Yaw < 0)
        {
            rFiringSwayDestRot.Yaw = int(-BaseParams.fFiringSway_HipY_Max);            
        }
        else
        {
            rFiringSwayDestRot.Yaw = int(BaseParams.fFiringSway_HipY_Max);
        }
    }
    fVelo = float(rFiringSwayDestRot.Pitch - rFiringSwayRot.Pitch);
    // End:0x273
    if(fVelo == float(0))
    {
        fFiringSwayAccumTime_Pitch = 0.0000000;        
    }
    else
    {
        fFiringSwayAccumTime_Pitch += fDeltaTime;
    }
    iDeltaP = int(float(int(fVelo * BaseParams.fFiringSway_HipX_Speed)) * fFiringSwayAccumTime_Pitch);
    // End:0x2CE
    if(iDeltaP != 0)
    {
        rFiringSwayRot.Pitch += iDeltaP;
        fFiringSwayAccumTime_Pitch = 0.0000000;
    }
    fVelo = float(rFiringSwayDestRot.Yaw - rFiringSwayRot.Yaw);
    // End:0x307
    if(fVelo == float(0))
    {
        fFiringSwayAccumTime_Yaw = 0.0000000;        
    }
    else
    {
        fFiringSwayAccumTime_Yaw += fDeltaTime;
    }
    iDeltaY = int(float(int(fVelo * BaseParams.fFiringSway_HipY_Speed)) * fFiringSwayAccumTime_Yaw);
    // End:0x362
    if(iDeltaY != 0)
    {
        rFiringSwayRot.Yaw += iDeltaY;
        fFiringSwayAccumTime_Yaw = 0.0000000;
    }
    rFiringSway_LastCameraRot = rFiringSwayRot;
    //return;    
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
    // End:0xD2
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
        // End:0x17D
        if(rSwayDestRot.Pitch < 0)
        {
            rSwayDestRot.Pitch = int(-BaseParams.fSway_HipX_Max);            
        }
        else
        {
            rSwayDestRot.Pitch = int(BaseParams.fSway_HipX_Max);
        }
    }
    // End:0x204
    if(Abs(float(rSwayDestRot.Yaw)) > BaseParams.fSway_HipY_Max)
    {
        // End:0x1E9
        if(rSwayDestRot.Yaw < 0)
        {
            rSwayDestRot.Yaw = int(-BaseParams.fSway_HipY_Max);            
        }
        else
        {
            rSwayDestRot.Yaw = int(BaseParams.fSway_HipY_Max);
        }
    }
    fVelo = float(rSwayDestRot.Pitch - rSwayRot.Pitch);
    // End:0x23D
    if(fVelo == float(0))
    {
        fSwayAccumTime_Pitch = 0.0000000;        
    }
    else
    {
        fSwayAccumTime_Pitch += fDeltaTime;
    }
    iDeltaP = int(float(int(fVelo * BaseParams.fSway_HipX_Speed)) * fSwayAccumTime_Pitch);
    // End:0x298
    if(iDeltaP != 0)
    {
        rSwayRot.Pitch += iDeltaP;
        fSwayAccumTime_Pitch = 0.0000000;
    }
    fVelo = float(rSwayDestRot.Yaw - rSwayRot.Yaw);
    // End:0x2D1
    if(fVelo == float(0))
    {
        fSwayAccumTime_Yaw = 0.0000000;        
    }
    else
    {
        fSwayAccumTime_Yaw += fDeltaTime;
    }
    iDeltaY = int(float(int(fVelo * BaseParams.fSway_HipY_Speed)) * fSwayAccumTime_Yaw);
    // End:0x32C
    if(iDeltaY != 0)
    {
        rSwayRot.Yaw += iDeltaY;
        fSwayAccumTime_Yaw = 0.0000000;
    }
    rSway_LastCameraRot = PC.Rotation;
    //return;    
}

// Export UwWeapon::execDelFireMode(FFrame&, void* const)
native function DelFireMode(int iMode)
{
    //native.iMode;        
}

simulated function bool IsCanUseWeapon()
{
    return (CheckOutOfAmmo()) == true;
    //return;    
}

function SetAmmoTotal(int Mode, int TotalAmmo)
{
    AmmoCharge[Mode] = TotalAmmo;
    //return;    
}

function SetAmmoAmount(int Mode, int CurrentAmmo)
{
    AmmoCharge[Mode] = CurrentAmmo;
    //return;    
}

simulated function SetAttackedOffset(Vector VOffset)
{
    vAttackedOffset = VOffset;
    //return;    
}

simulated function SetAttackedRot(Rotator rRot)
{
    rAttackedRot = rRot;
    //return;    
}

simulated function SetWalkingSwayRot(Rotator rRot)
{
    rWalkingSwayRot = rRot;
    //return;    
}

simulated function int GetAmmountAddMagazine()
{
    return BaseParams.iAmmo_Initial + BaseParams.iAmmo_Magazine;
    //return;    
}

function ServerAddMagazine()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial + BaseParams.iAmmo_Magazine;
    ClientAddMagazine();
    //return;    
}

simulated function ClientAddMagazine()
{
    AmmoCharge[0] = BaseParams.iAmmo_Initial + BaseParams.iAmmo_Magazine;
    //return;    
}

function ServerQuickAimZoom(bool bOn)
{
    bQuickAimZoom = bOn;
    ClientQuickAimZoom(bOn);
    //return;    
}

simulated function ClientQuickAimZoom(bool bOn)
{
    bQuickAimZoom = bOn;
    //return;    
}

function ServerQuickReload(bool bOn)
{
    bQuickReload = bOn;
    ClientQuickReload(bOn);
    //return;    
}

simulated function ClientQuickReload(bool bOn)
{
    bQuickReload = bOn;
    //return;    
}

simulated function ClientPlayDefence()
{
    PlayAnim(DefenceAnim, 0.0000000, 0.2000000, 1);
    MeleeState = 0;
    //return;    
}

simulated function int GetCurTotalAmmoCount()
{
    //return;    
}

simulated function int GetCurMagazineAmmoCount()
{
    //return;    
}

simulated function ActiveFireDelay()
{
    //return;    
}

simulated function ActiveMeleeDelay()
{
    //return;    
}

simulated function ClientThrowingWeapon()
{
    //return;    
}

function ServerThrowingWeapon()
{
    //return;    
}

simulated function ClientMeleeFire()
{
    //return;    
}

function ServerMeleeFire()
{
    //return;    
}

simulated function SkillUseByWeapon(int Mode)
{
    // End:0x45
    if((Mode == 0) && Instigator.IsLocallyControlled())
    {
        Instigator.Controller.SkillUsedByWeapon(BaseParams.iWeaponID);
    }
    //return;    
}

state PendingClientWeaponSet
{
    simulated function Timer()
    {
        // End:0x1C
        if(Pawn(Owner) != none)
        {
            ClientWeaponSet(bPendingSwitch);
        }
        // End:0x30
        if(IsInState('PendingClientWeaponSet'))
        {
            SetTimer(0.0500000, false);
        }
        //return;        
    }

    simulated function BeginState()
    {
        SetTimer(0.0500000, false);
        //return;        
    }

    simulated function EndState()
    {
        //return;        
    }
    stop;    
}

state Hidden
{    stop;    
}

defaultproperties
{
    FireModeClass[2]=Class'Engine.wMeleeFire'
    IdleAnim="Idle"
    RestAnim="rest"
    RunAnim="Run"
    SprintAnim="Sprint"
    SelectAnim="Select"
    SelectNewAnim="Select_New"
    PutDownAnim="PutDown"
    PutdownQuickAnim="PutDown_Quick"
    ProneMoveAnim="ProneMove"
    SprintUpAnim="Sprint_Up"
    DefenceAnim="Defence"
    IdleAnimRate=1.0000000
    RestAnimRate=1.0000000
    RunAnimRate=1.0000000
    SprintAnimRate=1.0000000
    SelectAnimRate=1.3636000
    PutDownAnimRate=1.3636000
    PutDownQuickAnimRate=1.0000000
    DefenceAnimRate=1.0000000
    AIRating=0.5000000
    CurrentRating=0.5000000
    bCanThrow=true
    bNoAmmoInstances=true
    OldDrawScale=1.0000000
    OldCenteredOffsetY=-10.0000000
    OldCenteredRoll=2000
    MessageNoAmmo=" has no ammo"
    DisplayFOV=68.0000000
    HudColor=(R=255,G=255,B=0,A=255)
    CenteredOffsetY=-10.0000000
    CenteredRoll=2000
    CustomCrossHairColor=(R=255,G=255,B=255,A=255)
    CustomCrossHairScale=1.0000000
    CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross1"
    MinReloadPct=0.5000000
    szWeaponAttachmentName="WGame.wWeaponAttachment"
    fBreathRatio=0.9000000
    InventoryGroup=1
    PickupClass=Class'Engine.wWeaponPickup'
    LightType=2
    LightEffect=21
    LightHue=31
    LightSaturation=156
    LightBrightness=550.0000000
    LightRadius=30.0000000
    LightPeriod=3
    LightCone=30
    DrawType=2
    NetUpdateFrequency=2.0000000
    NetPriority=3.0000000
    AmbientGlow=20
    MaxLights=6
    ScaleGlow=1.5000000
    SoundVolume=255
    TransientSoundVolume=1.0000000
    bNetNotify=true
}