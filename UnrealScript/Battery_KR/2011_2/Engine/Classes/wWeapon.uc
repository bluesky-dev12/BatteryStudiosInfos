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
        ClientQuickAimZoom, ClientQuickReload, 
        ClientWeaponSet, ClientWeaponThrown, 
        ClientWriteStats, wLoadOut_Client;

    // Pos:0x01A
    reliable if(int(Role) < int(ROLE_Authority))
        ServerCancelFire, ServerMeleeFire, 
        ServerPlayOwnedSound, ServerStartFire, 
        ServerStopFire, ServerThrowingWeapon;
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

    // End:0xCB
    if(bNoAmmoInstances)
    {
        AmountNeeded = int(Load);
        // End:0x47
        if(bAmountNeededIsMax && AmmoCharge[Mode] < AmountNeeded)
        {
            AmountNeeded = AmmoCharge[Mode];
        }
        // End:0x64
        if(AmmoCharge[Mode] < AmountNeeded)
        {
            CheckOutOfAmmo();
            return false;
        }
        AmmoCharge[Mode] -= AmountNeeded;
        NetUpdateTime = Level.TimeSeconds - float(1);
        // End:0xC9
        if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
        {
            CheckOutOfAmmo();
        }
        return true;
    }
    // End:0xFF
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
    local int i;
    local float curr, Max;

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
    // End:0x3F
    if((FireMode[0] != none) && FireMode[0].FireSound != none)
    {
        PlaySound(FireMode[0].FireSound, 0, 1.0000000);
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
    Canvas.DrawText((("bSprint: " $ string(bSprint)) $ "/FireMode[0].bIsFiring:") $ string(FireMode[0].bIsFiring), false);
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

    Instigator.PlayOwnedSound(NullSound, 3,,,,, false);
    // End:0x58
    if(int(Role) < int(ROLE_Authority))
    {
        ServerPlayOwnedSound(NullSound, 3,,,,, false);
        Instigator.ServerSpecPlaySoundHK(NullSound, 3,,,,, false);
    }
    AmbientSound = none;
    M = 0;
    J0x66:

    // End:0xD2 [Loop If]
    if(M < 3)
    {
        // End:0x98
        if(FireMode[M] != none)
        {
            FireMode[M].DestroyEffects();
        }
        // End:0xC8
        if(Ammo[M] != none)
        {
            Ammo[M].Destroy();
            Ammo[M] = none;
        }
        M++;
        // [Loop Continue]
        goto J0x66;
    }
    M = 0;
    J0xD9:

    // End:0x112 [Loop If]
    if(M < Parts.Length)
    {
        Parts[M].Destroy();
        Parts[M] = none;
        M++;
        // [Loop Continue]
        goto J0xD9;
    }
    Parts.Length = 0;
    // End:0x138
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
    if(Class'Engine_Decompressed.PlayerController'.default.bSmallWeapons)
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
    SetBoneRotation('Bone_Pibot01', rBone, 0, 1.0000000);
    rBone = rot(0, 0, 0);
    rBone.Roll = -rSwayRot.Pitch;
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
        if(Class'Engine_Decompressed.PlayerController'.default.bSmallWeapons)
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
    // End:0xC1
    if(WeaponAttachment(ThirdPersonActor) != none)
    {
        WeaponAttachment(ThirdPersonActor).FiringMode = byte(Mode);
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
        WeaponAttachment(ThirdPersonActor).FlashCount++;
        // End:0xAD
        if(Mode == 2)
        {
            // End:0x97
            if(self.IsA('wMeleeWeapon'))
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = true;                
            }
            else
            {
                WeaponAttachment(ThirdPersonActor).bMeleeKnifeOrButt = false;
            }
        }
        WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
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

simulated function wWeapon WeaponChange(byte F, bool bSilent)
{
    local wWeapon newWeapon;

    // End:0xA8
    if(int(InventoryGroup) == int(F))
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
                newWeapon = Inventory.WeaponChange(F, bSilent);
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
            return Inventory.WeaponChange(F, bSilent);
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
    local int Mode;

    Instigator = Pawn(Owner);
    bPendingSwitch = bPossiblySwitch;
    // End:0x41
    if((Instigator != none) && Instigator.IsA('wHelicopter'))
    {        
    }
    else
    {
        // End:0xAA
        if(((Instigator == none) || Instigator.PlayerReplicationInfo == none) || (Instigator.PlayerReplicationInfo.bNoTeam == false) && Instigator.PlayerReplicationInfo.Team == none)
        {
            GotoState('PendingClientWeaponSet');
            return;
        }
    }
    Mode = 0;
    J0xB1:

    // End:0x18F [Loop If]
    if(Mode < 3)
    {
        // End:0x140
        if(FireModeClass[Mode] != none)
        {
            // End:0x140
            if((FireMode[Mode] == none) || (((FireMode[Mode].AmmoClass != none) && !bNoAmmoInstances) && Ammo[Mode] == none) && FireMode[Mode].AmmoPerFire > 0)
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
        Mode++;
        // [Loop Continue]
        goto J0xB1;
    }
    CheckPartsSet();
    ClientState = 1;
    GotoState('Hidden');
    // End:0x1CD
    if((wHands == none) && !Instigator.IsA('wHelicopter'))
    {
        SetHands();
    }
    // End:0x1FE
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || !Instigator.IsHumanControlled())
    {
        return;
    }
    // End:0x26C
    if(((Instigator.Weapon != none) && Instigator.Weapon == self) || Instigator.PendingWeapon == self)
    {
        // End:0x264
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
    // End:0x29F
    if((Instigator.PendingWeapon != none) && Instigator.PendingWeapon.bForceSwitch)
    {
        return;
    }
    // End:0x316
    if((bPickupChange == true) && ((BaseParams.iInventoryGroup == 1) || BaseParams.iInventoryGroup == 2) || BaseParams.iInventoryGroup == 5)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();
        bPickupChange = false;
    }
    // End:0x362
    if((Instigator.Weapon == none) && BaseParams.iInventoryGroup == 1)
    {
        Instigator.PendingWeapon = self;
        Instigator.ChangedWeapon();        
    }
    else
    {
        // End:0x48A
        if((bPossiblySwitch && Instigator.Weapon != none) && !Instigator.Weapon.IsFiring())
        {
            // End:0x3DD
            if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
            {
                return;
            }
            // End:0x43F
            if(Instigator.PendingWeapon != none)
            {
                // End:0x43C
                if((RateSelf()) > Instigator.PendingWeapon.RateSelf())
                {
                    Instigator.PendingWeapon = self;
                    Instigator.Weapon.PutDown();
                }                
            }
            else
            {
                // End:0x48A
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
    local Sound sndTelegraphTalk;
    local Controller tempCon;

    // End:0x414
    if(int(ClientState) == int(1))
    {
        // End:0x40C
        if(Instigator.IsLocallyControlled())
        {
            // End:0x40C
            if(Mesh != none)
            {
                // End:0x50
                if(Instigator.CanQuickWeaponChange() == true)
                {
                    fAnimRate = 1.3000000;                    
                }
                else
                {
                    fAnimRate = 1.0000000;
                }
                // End:0x244
                if((bCanSelectNew == true) && HasAnim(SelectNewAnim))
                {
                    PlayAnim(SelectNewAnim, SelectAnimRate * fAnimRate, 0.0000000);
                    // End:0xA5
                    if(int(Role) < int(ROLE_Authority))
                    {
                        bCanSelectNew = false;
                    }
                    // End:0x18E
                    if((ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_helicopter_R") || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_uav_R")
                    {
                        strSoundName = Class'Engine_Decompressed.wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                        tempCon = Instigator.Controller;
                        sndTelegraphTalk = PlayerController(tempCon).StatusAnnouncer.GetSound(strSoundName);
                        Instigator.PlayOwnedSound(sndTelegraphTalk, 0, 1.0000000);                        
                    }
                    else
                    {
                        Instigator.PlaySoundHK(ResParams.default.sound_Select_New, 0, TransientSoundVolume,, TransientSoundRadius / float(4), 1.0000000, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x241
                        if(int(Role) < int(ROLE_Authority))
                        {
                            Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Select_New, 0, TransientSoundVolume,, TransientSoundRadius / float(4), 1.0000000, false, false, -1, false);
                        }
                    }                    
                }
                else
                {
                    // End:0x40C
                    if(HasAnim(SelectAnim))
                    {
                        PlayAnim(SelectAnim, SelectAnimRate * fAnimRate, 0.0000000);
                        bCanSelectNew = false;
                        // End:0x359
                        if((ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_helicopter_R") || ResParams.default.sound_Select_PackType == ".Combat_self.v_cb_call_uav_R")
                        {
                            strSoundName = Class'Engine_Decompressed.wGameManager'.default.VoicePackageName $ ResParams.default.sound_Select_PackType;
                            tempCon = Instigator.Controller;
                            sndTelegraphTalk = PlayerController(tempCon).StatusAnnouncer.GetSound(strSoundName);
                            Instigator.PlayOwnedSound(sndTelegraphTalk, 0, 1.0000000);                            
                        }
                        else
                        {
                            Instigator.PlaySoundHK(ResParams.default.sound_Select, 0, TransientSoundVolume,, TransientSoundRadius / float(4), 1.0000000, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x40C
                            if(int(Role) < int(ROLE_Authority))
                            {
                                Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Select, 0, TransientSoundVolume,, TransientSoundRadius / float(4), 1.0000000, false, false, -1, false);
                            }
                        }
                    }
                }
            }
        }
        ClientState = 2;
    }
    Mode = 0;
    J0x41B:

    // End:0x4B8 [Loop If]
    if(Mode < 3)
    {
        // End:0x4AE
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
        goto J0x41B;
    }
    // End:0x57D
    if(((PrevWeapon != none) && PrevWeapon.HasAmmo()) && !PrevWeapon.bNoVoluntarySwitch)
    {
        // End:0x50E
        if(!PrevWeapon.IsA('wMeleeWeapon'))
        {
            OldWeapon = PrevWeapon;
        }
        // End:0x57A
        if(OldWeapon != none)
        {
            Instigator.PlayOwnedSound(NullSound, 3,,,,, false);
            // End:0x57A
            if(int(Role) < int(ROLE_Authority))
            {
                OldWeapon.ServerPlayOwnedSound(NullSound, 3,,,,, false);
                Instigator.ServerSpecPlaySoundHK(NullSound, 3,,,,, false);
            }
        }        
    }
    else
    {
        OldWeapon = none;
    }
    // End:0x5D2
    if(Instigator != none)
    {
        Instigator.SetAimModeValueOnly(false);
        // End:0x5D2
        if(Instigator.Controller != none)
        {
            bSprint = Instigator.Controller.bSprint;
        }
    }
    // End:0x5EC
    if(!self.IsA('wDemopack'))
    {
        byActionThrowsWeapon = 0;
    }
    // End:0x611
    if(OldWeapon.IsA('wDemopack'))
    {
        OldWeapon.byActionThrowsWeapon = 0;
    }
    //return;    
}

function ServerPlayOwnedSound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    Instigator.PlaySound(Sound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner);
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
    OldWeapon = none;
    // End:0x35C
    if(bNoAnim == true)
    {
        ClientState = 1;
        Instigator.ChangedWeapon();
        // End:0x319
        if(Instigator.Weapon == self)
        {
            PlayIdle();
            ClientState = 4;            
        }
        else
        {
            Mode = 0;
            J0x320:

            // End:0x35C [Loop If]
            if(Mode < 3)
            {
                // End:0x352
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].DestroyEffects();
                }
                Mode++;
                // [Loop Continue]
                goto J0x320;
            }
        }
    }
    return true;
    //return;    
}

simulated function Fire(float F)
{
    //return;    
}

simulated function AltFire(float F)
{
    //return;    
}

simulated event WeaponTick(float dt)
{
    CalcStanceOffset(dt);
    CalcBreathOffset();
    CalcSwayRot(dt);
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
    // End:0x6E
    if(((((int(ClientState) != int(4)) || bSprint == true) || (IsReloading()) == true) || (IsFiring()) == true) || (IsMeleeAttacking()) == true)
    {
        return;
    }
    // End:0x98
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

simulated event ClientStopFire(int Mode)
{
    // End:0x32
    if(FireMode[Mode].bEnableBustMode)
    {
        // End:0x32
        if(FireMode[Mode].IsFiringBustMode)
        {
            return;
        }
    }
    // End:0x4D
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
    // End:0xF8
    if((FireMode[int(Mode)].NextFireTime <= (Level.TimeSeconds + FireMode[int(Mode)].PreFireTime)) && StartFire(int(Mode)))
    {
        FireMode[int(Mode)].ServerStartFireTime = Level.TimeSeconds;
        FireMode[int(Mode)].bServerDelayStartFire = false;        
    }
    else
    {
        // End:0x12E
        if(FireMode[int(Mode)].AllowFire())
        {
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
    // End:0x9A
    if(!Instigator.IsLocallyControlled())
    {
        FireMode[int(Mode)].iFireCount = 0;
    }
    //return;    
}

function ServerCancelFire(byte Mode)
{
    //return;    
}

simulated function bool ReadyToFire(int Mode)
{
    local int alt;

    // End:0x12
    if(int(MeleeState) == int(1))
    {
        return false;
    }
    // End:0x25
    if(FireMode[Mode] == none)
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
    // End:0x100
    if((((((FireMode[alt] != none) && FireMode[alt] != FireMode[Mode]) && FireMode[alt].bModeExclusive) && FireMode[alt].bIsFiring) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
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
    FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
    // End:0xE8
    if((FireMode[alt] != none) && FireMode[alt].bModeExclusive)
    {
        FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
    }
    // End:0x15D
    if(Instigator.IsLocallyControlled())
    {
        // End:0x147
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
    FireMode[Mode].StopFiring();
    // End:0xC3
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
    // End:0x181
    if(int(ClientState) == int(4))
    {
        // End:0xA8
        if(((FireMode[0] != none) && Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
        {
            PlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);            
        }
        else
        {
            // End:0x114
            if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
            {
                PlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);                
            }
            else
            {
                // End:0x169
                if(((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring)
                {
                    PlayIdle();                    
                }
                else
                {
                    // End:0x17E
                    if(Anim == 'MeleeAttack')
                    {
                        PlayIdle();
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x1E5
        if(int(ClientState) == int(2))
        {
            Mode = 0;
            J0x198:

            // End:0x1D4 [Loop If]
            if(Mode < 3)
            {
                // End:0x1CA
                if(FireMode[Mode] != none)
                {
                    FireMode[Mode].InitEffects();
                }
                Mode++;
                // [Loop Continue]
                goto J0x198;
            }
            PlayIdle();
            ClientState = 4;            
        }
        else
        {
            // End:0x2F3
            if(int(ClientState) == int(3))
            {
                // End:0x24F
                if(OldDownDelay > float(0))
                {
                    // End:0x230
                    if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
                    {
                        PlayAnim(PutdownQuickAnim, PutDownQuickAnimRate, 0.0000000);                        
                    }
                    else
                    {
                        // End:0x24D
                        if(HasAnim(PutDownAnim))
                        {
                            PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
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
                else
                {
                    ClientState = 1;
                    Instigator.ChangedWeapon();
                    // End:0x2B0
                    if(Instigator.Weapon == self)
                    {
                        PlayIdle();
                        ClientState = 4;                        
                    }
                    else
                    {
                        Mode = 0;
                        J0x2B7:

                        // End:0x2F3 [Loop If]
                        if(Mode < 3)
                        {
                            // End:0x2E9
                            if(FireMode[Mode] != none)
                            {
                                FireMode[Mode].DestroyEffects();
                            }
                            Mode++;
                            // [Loop Continue]
                            goto J0x2B7;
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
    // End:0x48
    if(int(MeleeState) == int(1))
    {
        MeleeState = 0;
    }
    //return;    
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
    return false;
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
    BaseParams = wBase;
    WeaponType = BaseParams.eType;
    InventoryGroup = byte(BaseParams.iInventoryGroup);
    // End:0xFF
    if(szFireModeClass == "")
    {
        switch(BaseParams.BulletType)
        {
            // End:0x74
            case 1:
                szFireModeClass = "Engine.wInstantFire";
                // End:0xFF
                break;
            // End:0xFC
            case 2:
                switch(BaseParams.ProjMoveType)
                {
                    // End:0xAF
                    case 1:
                        szFireModeClass = "WWeapons.wThrowingFire";
                        // End:0xF9
                        break;
                    // End:0xD3
                    case 2:
                        szFireModeClass = "WWeapons.wRocketFire";
                        // End:0xF9
                        break;
                    // End:0xF6
                    case 3:
                        szFireModeClass = "WWeapons.wFlameFire";
                        // End:0xF9
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                // End:0xFF
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        // End:0x128
        if(szFireModeClass != "")
        {
            FireModeClass[0] = Class<wWeaponFire>(DynamicLoadObject(szFireModeClass, Class'Core.Class'));
        }
        SelectAnimRate = BaseParams.fAnimRate_BringUp;
        PutDownAnimRate = BaseParams.fAnimRate_PutDown;
        PutDownQuickAnimRate = BaseParams.fAnimRate_PutDown_Quick;
        fBreathSeconds = BaseParams.fBreathSpeed_Idle;
        //return;        
    }
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    SelectSound = ResParams.default.sound_Select;
    NullSound = Sound(DynamicLoadObject("Warfare_Sound_Char.etc.nullsound", Class'Engine_Decompressed.Sound'));
    //return;    
}

simulated function SetHands()
{
    local Mesh meshHands;
    local int iBodyItemID, iTeamIndex;

    // End:0x1E
    if(wHands != none)
    {
        wHands.Destroy();
        wHands = none;
    }
    // End:0x140
    if((Instigator != none) && Instigator.PlayerReplicationInfo != none)
    {
        // End:0x8E
        if(Level.GRI.GameClass ~= "WGame.wDeathMatch")
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.SideID;            
        }
        else
        {
            iTeamIndex = Instigator.PlayerReplicationInfo.Team.TeamIndex;
        }
        // End:0xDF
        if(iTeamIndex == 0)
        {
            iBodyItemID = Instigator.PlayerReplicationInfo.iBodyItemID_0;            
        }
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
    else
    {
        meshHands = Level.GameMgr.GetItemResourceMesh(15000, false, 0);
    }
    wHands = Spawn(Class'Engine_Decompressed.wSkinShell', self);
    wHands.SetDrawType(2);
    wHands.LinkMesh(meshHands);
    wHands.SetBase(self);
    wHands.SetOwner(self);
    AttachToBone(wHands, 'XXXX_Dummy');
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
    // End:0x3B
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6B
    if(wRes == none)
    {
        return;
    }
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, false));
    bCanSelectNew = true;
    SetBaseParams(wBase);
    SetResParams(wRes);
    M = 0;
    J0xB4:

    // End:0x109 [Loop If]
    if(M < 3)
    {
        // End:0xFF
        if((FireModeClass[M] != none) && FireMode[M] == none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        M++;
        // [Loop Continue]
        goto J0xB4;
    }
    InitWeaponFires();
    M = 0;
    J0x116:

    // End:0x220 [Loop If]
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
        M++;
        // [Loop Continue]
        goto J0x116;
    }
    // End:0x260
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        MaxLights = byte(Min(4, int(MaxLights)));
    }
    // End:0x282
    if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallViewOffset = default.PlayerViewOffset;
    }
    // End:0x2B2
    if(SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;
    }
    // End:0x2DB
    if(bUseOldWeaponMesh && OldMesh != none)
    {
        bInitOldMesh = true;
        LinkMesh(OldMesh);
    }
    M = 0;
    J0x2E2:

    // End:0x31E [Loop If]
    if(M < 3)
    {
        // End:0x314
        if(FireMode[M] != none)
        {
            FireMode[M].wLoadOut();
        }
        M++;
        // [Loop Continue]
        goto J0x2E2;
    }
    FillToInitialAmmo();
    // End:0x36A
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
    local wPartsGroupParam PartsParam;
    local Vector AimDiff;

    PartsParam = Level.GameMgr.GetAddPartsGroupParam(iAddPartsID);
    // End:0x3D
    if(PartsParam.iAddPartID == -1)
    {
        return;
    }
    // End:0x1CB
    if(PartsParam.iSightID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x1CB
        if(ItemResParam.iItemResourceID != -1)
        {
            ItemParam = Level.GameMgr.GetItemParam(PartsParam.iSightID);
            AimDiff.X = PartsParam.fAimDiffX;
            AimDiff.Y = PartsParam.fAimDiffY;
            AimDiff.Z = PartsParam.fAimDiffZ;
            // End:0x16D
            if(int(ItemParam.eType) == int(16))
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strHaveDotName, AimDiff, PartsParam.iSightID, PartsParam.iAddPartID);                
            }
            else
            {
                // End:0x1CB
                if(int(ItemParam.eType) == int(23))
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strHaveDotName, AimDiff, PartsParam.iSightID, PartsParam.iAddPartID);
                }
            }
        }
    }
    // End:0x35B
    if(PartsParam.iSightID_Sub != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSightID_Sub);
        // End:0x35B
        if(ItemResParam.iItemResourceID != -1)
        {
            ItemParam = Level.GameMgr.GetItemParam(PartsParam.iSightID_Sub);
            AimDiff.X = PartsParam.fAimDiffX;
            AimDiff.Y = PartsParam.fAimDiffY;
            AimDiff.Z = PartsParam.fAimDiffZ;
            // End:0x2FC
            if(int(ItemParam.eType) == int(16))
            {
                AddParts(1, ItemResParam.strRes_1st, ItemResParam.strHaveDotName, AimDiff, PartsParam.iSightID_Sub, PartsParam.iAddPartID, true);                
            }
            else
            {
                // End:0x35B
                if(int(ItemParam.eType) == int(23))
                {
                    AddParts(3, ItemResParam.strRes_1st, ItemResParam.strHaveDotName, AimDiff, PartsParam.iSightID_Sub, PartsParam.iAddPartID, true);
                }
            }
        }
    }
    // End:0x3F4
    if(PartsParam.iSilencerID != 0)
    {
        ItemResParam = Level.GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x3F4
        if(ItemResParam.iItemResourceID != -1)
        {
            AddParts(5, ItemResParam.strRes_1st, "", vect(0.0000000, 0.0000000, 0.0000000), PartsParam.iSilencerID, PartsParam.iAddPartID);
        }
    }
    // End:0x43B
    if(iPainting_Item_ID > 0)
    {
        Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, PartsParam.iAddPartID,, iPainting_Item_ID);        
    }
    else
    {
        // End:0x494
        if(PartsParam.iPaintingID > 0)
        {
            Skins[0] = Level.GameMgr.GetPartsGroupPainting(iWeaponID, PartsParam.iAddPartID,, PartsParam.iPaintingID);            
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

    Instigator = P;
    // End:0x1B8
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
        else
        {
            // End:0xCF
            if(BaseParams.iWeaponID == 50005)
            {
                szWeaponAttachmentName = "WWeapons.wHeliRPGAttachment_R";
            }
        }
        AttachmentClass = Class<InventoryAttachment>(DynamicLoadObject(szWeaponAttachmentName, Class'Core.Class'));
        ThirdPersonActor = Spawn(AttachmentClass, Owner);
        WeaponAttachment(ThirdPersonActor).Weapon = self;
        WeaponAttachment(ThirdPersonActor).iRepWeaponID = BaseParams.iWeaponID;
        WeaponAttachment(ThirdPersonActor).iRepAddPartsID = InventoryClassAddPartsID;
        WeaponAttachment(ThirdPersonActor).iPainting_Item_ID = iPainting_Item_ID;
        WeaponAttachment(ThirdPersonActor).wLoadOut(WeaponAttachment(ThirdPersonActor).iRepWeaponID, WeaponAttachment(ThirdPersonActor).iRepAddPartsID);
        InventoryAttachment(ThirdPersonActor).InitFor(self);        
    }
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    BoneName = P.GetWeaponBoneFor(self);
    // End:0x22D
    if(ThirdPersonActor.AttachmentBone != 'None')
    {
        P.AttachToBone(ThirdPersonActor, ThirdPersonActor.AttachmentBone);        
    }
    else
    {
        // End:0x258
        if(BoneName != 'None')
        {
            P.AttachToBone(ThirdPersonActor, BoneName);            
        }
        else
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

simulated function AddParts(wWeaponAcce.EAcceType Type, string szName, string strHaveDotName, Vector AimDiff, int iItemID, int iPartsGroupID, optional bool bSightSub)
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
    // End:0x249
    if(Parts.Length == i)
    {
        Parts.Length = Parts.Length + 1;
        Parts[i] = Spawn(Class'Engine_Decompressed.wWeaponAcce', self);
        // End:0x1D4
        if((iItemID == -1) && iPartsGroupID == -1)
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID, true);            
        }
        else
        {
            Parts[i].Set(Type, szName, AimDiff, iItemID, iPartsGroupID);
        }
        // End:0x249
        if((Len(strHaveDotName) > 1) && strHaveDotName != szName)
        {
            AddParts(2, strHaveDotName, strHaveDotName, vect(0.0000000, 0.0000000, 0.0000000), -1, -1);
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
    FireModeClass[2]=Class'Engine_Decompressed.wMeleeFire'
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
    IdleAnimRate=1.0000000
    RestAnimRate=1.0000000
    RunAnimRate=1.0000000
    SprintAnimRate=1.0000000
    SelectAnimRate=1.3636000
    PutDownAnimRate=1.3636000
    PutDownQuickAnimRate=1.0000000
    AIRating=0.5000000
    CurrentRating=0.5000000
    bCanThrow=true
    bNoAmmoInstances=true
    OldDrawScale=1.0000000
    OldCenteredOffsetY=-10.0000000
    OldCenteredRoll=2000
    MessageNoAmmo=" has no ammo"
    DisplayFOV=60.0000000
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
    PickupClass=Class'Engine_Decompressed.wWeaponPickup'
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