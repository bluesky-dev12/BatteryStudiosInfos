class wTurret_FNM240 extends wTurret;

var Rotator rOriginalRot;

simulated event PostBeginPlay()
{
    // End:0x88
    if(Level.GetMatchMaker() != none)
    {
        // End:0x88
        if((int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().5)) || int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().1))
        {
            Destroy();
            return;
        }
    }
    super.PostBeginPlay();
    dblog("[wTurret_FNM240::PostBeginPlay]");
    Level.Vehicles[Level.Vehicles.Length] = self;
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    local Rotator PCRot;

    PC.bSprint = false;
    PC.bRun = 0;
    PCRot = PC.Rotation;
    super.ClientKDriverEnter(PC);
    // End:0xD1
    if(PlayerController(Weapon.Instigator.Controller).ViewTarget != none)
    {
        PlayerController(Weapon.Instigator.Controller).ViewTarget.bHidden = false;
        PlayerController(Weapon.Instigator.Controller).ViewTarget.bNotDrawSelf = true;        
    }
    else
    {
        // End:0x109
        if(wPawn(PC.ViewTarget) != none)
        {
            wPawn(PC.ViewTarget).bNotDrawSelf = true;
        }
    }
    SetRotateForPlayerView(PCRot);
    //return;    
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(wVehicle).ClientKDriverLeave(PC);
    // End:0x43
    if(wPawn(PC.ViewTarget) != none)
    {
        wPawn(PC.ViewTarget).bNotDrawSelf = false;
    }
    //return;    
}

simulated function MakeFireNoise()
{
    Driver.MakeFireNoise();
    //return;    
}

function SetExitViewRotation(Pawn Driver)
{
    InitBaseRotation();
    Driver.Controller.SetRotation(Driver.Rotation);
    //return;    
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
    //return;    
}

exec function t(int iType)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    switch(iType)
    {
        // End:0x21
        case 0:
            DrivePos = vect(-105.0000000, 0.0000000, 17.0000000);
            // End:0xE0
            break;
        // End:0x3B
        case 1:
            DrivePos = vect(-105.0000000, 0.0000000, -17.0000000);
            // End:0xE0
            break;
        // End:0x56
        case 2:
            DrivePos = vect(-105.0000000, 17.0000000, 0.0000000);
            // End:0xE0
            break;
        // End:0x71
        case 3:
            DrivePos = vect(-105.0000000, -17.0000000, 0.0000000);
            // End:0xE0
            break;
        // End:0x8C
        case 4:
            DrivePos = vect(-105.0000000, 0.0000000, 76.0000000);
            // End:0xE0
            break;
        // End:0xA7
        case 5:
            DrivePos = vect(-105.0000000, 0.0000000, -76.0000000);
            // End:0xE0
            break;
        // End:0xC2
        case 6:
            DrivePos = vect(-105.0000000, 76.0000000, 0.0000000);
            // End:0xE0
            break;
        // End:0xDD
        case 7:
            DrivePos = vect(-105.0000000, -76.0000000, 0.0000000);
            // End:0xE0
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x13C
    if(Driver != none)
    {
        AttachRotation.Yaw = OriginalRotation.Yaw;
        AttachPos = OriginalLocation + (DrivePos >> AttachRotation);
        Driver.SetLocation(AttachPos);
        Driver.SetRotation(AttachRotation);
    }
    //return;    
}

exec function TX(int iX)
{
    FPCamPos.X = float(iX);
    //return;    
}

exec function ty(int iY)
{
    FPCamPos.Y = float(iY);
    //return;    
}

exec function TZ(int iZ)
{
    FPCamPos.Z = float(iZ);
    //return;    
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
    // End:0x7D
    if(PC != none)
    {
        rReturn = ((Controller.GetViewRotation() + PC.ShakeRot) + PC.wShakeRot) + PC.wShockRot;
        return rReturn;        
    }
    else
    {
        return Controller.GetViewRotation();
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super(Vehicle).DisplayDebug(Canvas, YL, YPos);
    //return;    
}

defaultproperties
{
    TurretBaseClass=Class'WGame_Decompressed.wTurret_FNM240_Base'
    TurretSwivelClass=Class'WGame_Decompressed.wTurret_FNM240_Swivel'
    RotationInertia=0.5000000
    RotationSpeed=10.0000000
    CamAbsLocation=(X=-50.0000000,Y=0.0000000,Z=20.0000000)
    CamRelLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    CamDistance=(X=-400.0000000,Y=0.0000000,Z=50.0000000)
    CamRotationInertia=0.0100000
    DefaultWeaponClassName="wWeapons.wWeapon_Turret_FNM240"
    VehicleProjSpawnOffset=(X=160.0000000,Y=-15.0000000,Z=66.0000000)
    bCHZeroYOffset=false
    bDrawDriverInTP=true
    bAutoTurret=false
    bRemoteControlled=false
    DrivePos=(X=-83.0000000,Y=-17.0000000,Z=-17.0000000)
    ExitPositions=/* Array type was not detected. */
    EntryPosition=(X=-75.0000000,Y=0.0000000,Z=0.0000000)
    EntryRadius=105.0000000
    FPCamPos=(X=-85.0000000,Y=0.0000000,Z=16.0000000)
    VehiclePositionString="manning a Minigun Turret"
    VehicleNameString="Minigun Turret"
    HealthMax=100.0000000
    Health=100
    DrawScale=1.0000000
    SoundRadius=1024.0000000
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}