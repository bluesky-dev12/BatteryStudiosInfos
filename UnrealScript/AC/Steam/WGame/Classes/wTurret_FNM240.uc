/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTurret_FNM240.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:14
 *
 *******************************************************************************/
class wTurret_FNM240 extends wTurret;

var Rotator rOriginalRot;

simulated event PostBeginPlay()
{
    // End:0x88
    if(Level.GetMatchMaker() != none)
    {
        // End:0x88
        if(Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().5 || Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().1)
        {
            Destroy();
            return;
        }
    }
    super.PostBeginPlay();
    dblog("[wTurret_FNM240::PostBeginPlay]");
    Level.Vehicles[Level.Vehicles.Length] = self;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    local Rotator PCRot;

    PC.bSprint = false;
    PC.bRun = 0;
    PCRot = PC.Rotation;
    super.ClientKDriverEnter(PC);
    // End:0xd1
    if(PlayerController(Weapon.Instigator.Controller).ViewTarget != none)
    {
        PlayerController(Weapon.Instigator.Controller).ViewTarget.bHidden = false;
        PlayerController(Weapon.Instigator.Controller).ViewTarget.bNotDrawSelf = true;
    }
    // End:0x109
    else
    {
        // End:0x109
        if(wPawn(PC.ViewTarget) != none)
        {
            wPawn(PC.ViewTarget).bNotDrawSelf = true;
        }
    }
    SetRotateForPlayerView(PCRot);
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(wVehicle).ClientKDriverLeave(PC);
    // End:0x43
    if(wPawn(PC.ViewTarget) != none)
    {
        wPawn(PC.ViewTarget).bNotDrawSelf = false;
    }
}

simulated function MakeFireNoise()
{
    Driver.MakeFireNoise();
}

function SetExitViewRotation(Pawn Driver)
{
    InitBaseRotation();
    Driver.Controller.SetRotation(Driver.Rotation);
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
}

exec function t(int iType)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    switch(iType)
    {
        // End:0x21
        case 0:
            DrivePos = vect(-105.0, 0.0, 17.0);
            // End:0xe0
            break;
        // End:0x3b
        case 1:
            DrivePos = vect(-105.0, 0.0, -17.0);
            // End:0xe0
            break;
        // End:0x56
        case 2:
            DrivePos = vect(-105.0, 17.0, 0.0);
            // End:0xe0
            break;
        // End:0x71
        case 3:
            DrivePos = vect(-105.0, -17.0, 0.0);
            // End:0xe0
            break;
        // End:0x8c
        case 4:
            DrivePos = vect(-105.0, 0.0, 76.0);
            // End:0xe0
            break;
        // End:0xa7
        case 5:
            DrivePos = vect(-105.0, 0.0, -76.0);
            // End:0xe0
            break;
        // End:0xc2
        case 6:
            DrivePos = vect(-105.0, 76.0, 0.0);
            // End:0xe0
            break;
        // End:0xdd
        case 7:
            DrivePos = vect(-105.0, -76.0, 0.0);
            // End:0xe0
            break;
        // End:0xffff
        default:
            // End:0x13c
            if(Driver != none)
            {
                AttachRotation.Yaw = OriginalRotation.Yaw;
                AttachPos = OriginalLocation + DrivePos >> AttachRotation;
                Driver.SetLocation(AttachPos);
                Driver.SetRotation(AttachRotation);
            }
}

exec function TX(int iX)
{
    FPCamPos.X = float(iX);
}

exec function ty(int iY)
{
    FPCamPos.Y = float(iY);
}

exec function TZ(int iZ)
{
    FPCamPos.Z = float(iZ);
}

simulated function Rotator GetViewRotation()
{
    local PlayerController PC;
    local Rotator rReturn;

    // End:0x11
    if(Controller == none)
    {
        return Rotation;
    }
    PC = PlayerController(Controller);
    // End:0x7d
    if(PC != none)
    {
        rReturn = Controller.GetViewRotation() + PC.ShakeRot + PC.wShakeRot + PC.wShockRot;
        return rReturn;
    }
    // End:0x8d
    else
    {
        return Controller.GetViewRotation();
    }
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super(Vehicle).DisplayDebug(Canvas, YL, YPos);
}

defaultproperties
{
    TurretBaseClass=class'wTurret_FNM240_Base'
    TurretSwivelClass=class'wTurret_FNM240_Swivel'
    RotationInertia=0.50
    RotationSpeed=10.0
    CamAbsLocation=(X=-50.0,Y=0.0,Z=20.0)
    CamRelLocation=(X=0.0,Y=0.0,Z=0.0)
    CamDistance=(X=-400.0,Y=0.0,Z=50.0)
    CamRotationInertia=0.010
    DefaultWeaponClassName="wWeapons.wWeapon_Turret_FNM240"
    VehicleProjSpawnOffset=(X=160.0,Y=-15.0,Z=66.0)
    bCHZeroYOffset=true
    bDrawDriverInTP=true
    bAutoTurret=true
    bRemoteControlled=true
    DrivePos=(X=-83.0,Y=-17.0,Z=-17.0)
    ExitPositions=// Object reference not set to an instance of an object.
    
    EntryPosition=(X=-75.0,Y=0.0,Z=0.0)
    EntryRadius=105.0
    FPCamPos=(X=-85.0,Y=0.0,Z=16.0)
    VehiclePositionString="manning a Minigun Turret"
    VehicleNameString="Minigun Turret"
    HealthMax=100.0
    Health=100
    DrawScale=1.0
    SoundRadius=1024.0
    CollisionRadius=0.0
    CollisionHeight=0.0
}