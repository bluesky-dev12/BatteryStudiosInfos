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
    J0x0D:

    // End:0x4F [Loop If]
    if(M < 2)
    {
        // End:0x45
        if(FireModeClass[M] != none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        M++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    wLoadOut(int(weaponID), 0);
    super(Actor).PostNetBeginPlay();
    //return;    
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    ResParams = wRes;
    ShellCaseEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell_3rd, Class'Core.Class'));
    ClipEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, Class'Core.Class'));
    // End:0xAD
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        // End:0xAD
        if(wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(ShellCaseEmitter, 'shell');
        }
    }
    // End:0x106
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass);
        // End:0x106
        if(wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(ClipEmitter, 'shell');
        }
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
    SetBaseParams(wBase);
    SetResParams(wRes);
    M = 0;
    J0xAC:

    // End:0xEE [Loop If]
    if(M < 2)
    {
        // End:0xE4
        if(FireModeClass[M] != none)
        {
            FireMode[M] = new (self) FireModeClass[M];
        }
        M++;
        // [Loop Continue]
        goto J0xAC;
    }
    InitWeaponFires();
    M = 0;
    J0xFB:

    // End:0x205 [Loop If]
    if(M < 3)
    {
        // End:0x1FB
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
        goto J0xFB;
    }
    // End:0x245
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        MaxLights = byte(Min(4, int(MaxLights)));
    }
    // End:0x267
    if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallViewOffset = default.PlayerViewOffset;
    }
    // End:0x297
    if(SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
    {
        SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;
    }
    // End:0x2C0
    if(bUseOldWeaponMesh && OldMesh != none)
    {
        bInitOldMesh = true;
        LinkMesh(OldMesh);
    }
    M = 0;
    J0x2C7:

    // End:0x318 [Loop If]
    if(M < 3)
    {
        // End:0x30E
        if(FireMode[M] != none)
        {
            FireMode[M].wLoadOut();
            FireMode[M].InitEffects();
        }
        M++;
        // [Loop Continue]
        goto J0x2C7;
    }
    FillToInitialAmmo();
    // End:0x364
    if(FireMode[0] != none)
    {
        FireMode[0].Load = float(FireMode[0].AmmoPerFire);
        FireMode[0].HoldTime = 0.0000000;
    }
    AddPartsGroup(iID, iAddPartsID);
    ClientWeaponSet(true);
    SetAddPartsParams();
    fCallTime = 1.0000000 / BaseParams.fOverHeat_Down;
    //return;    
}

simulated function PawnUnpossessed()
{
    // End:0x5F
    if((Instigator != none) && PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).DesiredFOV = PlayerController(Instigator.Controller).DefaultFOV;
    }
    //return;    
}

function byte BestMode()
{
    return 0;
    //return;    
}

simulated function bool HasAmmo()
{
    return true;
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    local float fFOV;

    super.BringUp();
    ClientState = 4;
    // End:0x9A
    if((Instigator != none) && PlayerController(Instigator.Controller) != none)
    {
        fFOV = BaseParams.fZoomFOV;
        // End:0x78
        if(fFOV < float(20))
        {
            fFOV = PlayerController(Instigator.Controller).DefaultFOV;
        }
        PlayerController(Instigator.Controller).SetFOV(fFOV);
    }
    //return;    
}

function OverHeatUp()
{
    // End:0x7F
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
    //return;    
}

function OverHeatDown()
{
    local float fAddTime, fTemp;

    fAddTime = 0.5000000;
    fTemp = (Level.TimeSeconds - fLastFireTime) - fAddTime;
    // End:0xBE
    if(BaseParams.bOverHeat && fTemp > fCallTime)
    {
        // End:0x6B
        if(fAccumulationOverHeat > 0.0000000)
        {
            fAccumulationOverHeat -= 1.0000000;
        }
        // End:0x85
        if(fAccumulationOverHeat < 0.0000000)
        {
            fAccumulationOverHeat = 0.0000000;
        }
        // End:0xA5
        if(fAccumulationOverHeat <= fOverHeatMin)
        {
            bHoldFire = false;
            SetTimer(fCallTime, false);
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    //return;    
}

event Timer()
{
    OverHeatDown();
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    SetRotation(wTurret_FNM240(Instigator).GetViewRotation());
    ApplyOffset();
    SetLocation(wTurret_FNM240(Instigator).Location + wTurret_FNM240(Instigator).CalcDrawOffset(self));
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    //return;    
}

defaultproperties
{
    fOverHeatMin=50.0000000
    fOverHeatMax=100.0000000
    weaponID=5005.0000000
    FireModeClass=Class'WWeapons_Decompressed.wTurret_FNM240_Fire'
    bCanThrow=false
    bNoInstagibReplace=true
    Priority=1
    szWeaponAttachmentName="WWeapons.wTurretAttachmet"
    szFireModeClass="wTurret_FNM240_Fire"
    PickupClass=none
    AttachmentClass=Class'WWeapons_Decompressed.wTurretAttachmet'
    ItemName="Turret FNM240 weapon"
}