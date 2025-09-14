/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wWeapon_Turret_FNM240.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:14
 *
 *******************************************************************************/
class wWeapon_Turret_FNM240 extends wGun;

var const float fOverHeatMin;
var const float fOverHeatMax;
var float fCallTime;
var float fLastFireTime;
var float weaponID;

simulated function PostBeginPlay()
{
    local int M;

    super(Actor).PostBeginPlay();
    M = 0;
    J0x0d:
    // End:0x4f [While If]
    if(M < 2)
    {
        // End:0x45
        if(FireModeClass[M] != none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

simulated event PostNetBeginPlay()
{
    wLoadOut(int(weaponID), 0);
    super(Actor).PostNetBeginPlay();
}

simulated function SetResParams(class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    SelectSound = ResParams.default.sound_Select;
    ShellCaseEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell_3rd, class'Class'));
    ClipEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, class'Class'));
    // End:0xc1
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        // End:0xc1
        if(wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(ShellCaseEmitter, 'shell');
        }
    }
    // End:0x11a
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass);
        // End:0x11a
        if(wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(ClipEmitter, 'shell');
        }
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
    SetBaseParams(wBase);
    SetResParams(wRes);
    M = 0;
    J0xac:
    // End:0xee [While If]
    if(M < 2)
    {
        // End:0xe4
        if(FireModeClass[M] != none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0xac;
    }
    InitWeaponFires();
    M = 0;
    J0xfb:
    // End:0x205 [While If]
    if(M < 3)
    {
        // End:0x1fb
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
        goto J0xfb;
    }
    // End:0x245
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        MaxLights = byte(Min(4, MaxLights));
    }
    // End:0x267
    if(SmallViewOffset == vect(0.0, 0.0, 0.0))
    {
        SmallViewOffset = default.PlayerViewOffset;
    }
    // End:0x297
    if(SmallEffectOffset == vect(0.0, 0.0, 0.0))
    {
        SmallEffectOffset = EffectOffset + default.PlayerViewOffset - SmallViewOffset;
    }
    // End:0x2c0
    if(bUseOldWeaponMesh && OldMesh != none)
    {
        bInitOldMesh = true;
        LinkMesh(OldMesh);
    }
    M = 0;
    J0x2c7:
    // End:0x318 [While If]
    if(M < 3)
    {
        // End:0x30e
        if(FireMode[M] != none)
        {
            FireMode[M].wLoadOut();
            FireMode[M].InitEffects();
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x2c7;
    }
    FillToInitialAmmo();
    // End:0x364
    if(FireMode[0] != none)
    {
        FireMode[0].Load = float(FireMode[0].AmmoPerFire);
        FireMode[0].HoldTime = 0.0;
    }
    AddPartsGroup(iID, iAddPartsID);
    ClientWeaponSet(true);
    SetAddPartsParams();
    fCallTime = 1.0 / BaseParams.fOverHeat_Down;
}

function AttachToPawn(Pawn P)
{
    local name BoneName;

    Instigator = P;
    // End:0xd1
    if(ThirdPersonActor == none)
    {
        AttachmentClass = class<InventoryAttachment>(DynamicLoadObject(szWeaponAttachmentName, class'Class'));
        ThirdPersonActor = Spawn(AttachmentClass, Owner);
        WeaponAttachment(ThirdPersonActor).iRepWeaponID = BaseParams.iWeaponID;
        WeaponAttachment(ThirdPersonActor).iRepAddPartsID = InventoryClassAddPartsID;
        WeaponAttachment(ThirdPersonActor).wLoadOut(WeaponAttachment(ThirdPersonActor).iRepWeaponID, WeaponAttachment(ThirdPersonActor).iRepAddPartsID);
        InventoryAttachment(ThirdPersonActor).InitFor(self);
    }
    // End:0xf3
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    BoneName = P.GetWeaponBoneFor(self);
    // End:0x146
    if(ThirdPersonActor.AttachmentBone != 'None')
    {
        P.AttachToBone(ThirdPersonActor, ThirdPersonActor.AttachmentBone);
    }
    // End:0x171
    else
    {
        // End:0x171
        if(BoneName != 'None')
        {
            P.AttachToBone(ThirdPersonActor, BoneName);
        }
        // End:0x171
        else
        {
        }
    }
    // End:0x1ab
    if(BoneName == 'None')
    {
        ThirdPersonActor.SetLocation(P.Location);
        ThirdPersonActor.SetBase(P);
    }
}

simulated function PawnUnpossessed()
{
    // End:0x5f
    if(Instigator != none && PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).DesiredFOV = PlayerController(Instigator.Controller).DefaultFOV;
    }
}

function byte BestMode()
{
    return 0;
}

simulated function bool HasAmmo()
{
    return true;
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    local float fFOV;

    super.BringUp();
    ClientState = 4;
    // End:0x9a
    if(Instigator != none && PlayerController(Instigator.Controller) != none)
    {
        fFOV = BaseParams.fZoomFOV;
        // End:0x78
        if(fFOV < float(20))
        {
            fFOV = PlayerController(Instigator.Controller).DefaultFOV;
        }
        PlayerController(Instigator.Controller).SetFOV(fFOV);
    }
}

function OverHeatUp()
{
    // End:0x7f
    if(BaseParams.bOverHeat)
    {
        // End:0x32
        if(!bHoldFire)
        {
            fAccumulationOverHeat += BaseParams.fOverHeat_Up;
        }
        // End:0x49
        if(fAccumulationOverHeat >= fOverHeatMax)
        {
            bHoldFire = true;
        }
        SetTimer(fCallTime, true);
        fLastFireTime = Level.TimeSeconds;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

function OverHeatDown()
{
    local float fAddTime, fTemp;

    fAddTime = 0.50;
    fTemp = Level.TimeSeconds - fLastFireTime - fAddTime;
    // End:0xbe
    if(BaseParams.bOverHeat && fTemp > fCallTime)
    {
        // End:0x6b
        if(fAccumulationOverHeat > 0.0)
        {
            fAccumulationOverHeat -= 1.0;
        }
        // End:0x85
        if(fAccumulationOverHeat < 0.0)
        {
            fAccumulationOverHeat = 0.0;
        }
        // End:0xa5
        if(fAccumulationOverHeat <= fOverHeatMin)
        {
            bHoldFire = false;
            SetTimer(fCallTime, false);
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

event Timer()
{
    OverHeatDown();
}

simulated event RenderOverlays(Canvas Canvas)
{
    SetRotation(wTurret_FNM240(Instigator).GetViewRotation());
    ApplyOffset();
    SetLocation(wTurret_FNM240(Instigator).Location + wTurret_FNM240(Instigator).CalcDrawOffset(self));
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
}

defaultproperties
{
    fOverHeatMin=50.0
    fOverHeatMax=100.0
    weaponID=5005.0
    FireModeClass=class'wTurret_FNM240_Fire'
    bCanThrow=true
    bNoInstagibReplace=true
    Priority=1
    szWeaponAttachmentName="WWeapons.wTurretAttachmet"
    szFireModeClass="wTurret_FNM240_Fire"
    PickupClass=none
    AttachmentClass=class'wTurretAttachmet'
    ItemName="Turret FNM240 weapon"
}