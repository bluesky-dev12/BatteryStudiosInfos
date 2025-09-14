/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASSentinelController.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:8
 *	States:4
 *
 *******************************************************************************/
class ASSentinelController extends SentinelController;

var float StartSearchTime;
var Rotator LastRotation;

function AnimEnded();
function Awake();
function GoToSleep();
function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x58
    if(FRand() < 0.450 && Enemy != none && Enemy.Controller != none)
    {
        Enemy.Controller.ReceiveWarning(Pawn, -1.0, vector(Rotation));
    }
    return Rotation;
}

function bool IsSpawnCampProtecting()
{
    return ASVehicle_Sentinel(Pawn) != none && ASVehicle_Sentinel(Pawn).bSpawnCampProtection;
}

function float GetScanDelay()
{
    // End:0x0f
    if(IsSpawnCampProtecting())
    {
        return 2.0;
    }
    return 2.0 + float(3) * FRand();
}

function float GetWaitForTargetTime()
{
    // End:0x0f
    if(IsSpawnCampProtecting())
    {
        return 2.0;
    }
    return super(TurretController).GetWaitForTargetTime();
}

function Possess(Pawn aPawn)
{
    super(TurretController).Possess(aPawn);
    // End:0x2a
    if(IsSpawnCampProtecting())
    {
        Skill = 10.0;
        FocusLead = 0.0;
    }
}

auto state Sleeping
{
    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x14
        if(IsTargetRelevant(SeenPlayer))
        {
            Awake();
        }
    }

    function Awake()
    {
        LastRotation = Rotation;
        // End:0x29
        if(ASVehicle_Sentinel(Pawn).Awake())
        {
            GotoState('Opening');
        }
    }

    function ScanRotation()
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, Dir;
        local float BestDist, dist;
        local Rotator pick;

        DesiredRotation.Yaw = Rotation.Yaw + 16384 + Rand(32768);
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x7f
        if(HitActor == none)
        {
            return;
        }
        BestDist = VSize(HitLocation - Pawn.Location);
        pick = DesiredRotation;
        DesiredRotation.Yaw += 32768;
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x112
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x154
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation.Yaw += 16384;
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x1bf
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x201
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation.Yaw += 32768;
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x26c
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x2ae
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation = pick;
    }

Begin:
    // End:0x2e
    if(IsSpawnCampProtecting())
    {
        AcquisitionYawRate *= float(100);
        Pawn.PeripheralVision = -1.0;
        Awake();
    }
    ScanRotation();
    FocalPoint = Pawn.Location + float(1000) * vector(DesiredRotation);
    Sleep(2.0 + float(3) * FRand());
    goto 'Begin';
}

state Opening
{
    function AnimEnded()
    {
        GotoState('Searching');
    }

}

state Closing
{
    function AnimEnded()
    {
        GotoState('Sleeping');
    }

Begin:
    DesiredRotation = Rotation;
    DesiredRotation.Pitch = 0;
    FocalPoint = Pawn.Location + float(1000) * vector(DesiredRotation);
    Sleep(0.50);
    ASVehicle_Sentinel(Pawn).GoToSleep();
    stop;
}

state Searching
{
    function BeginState()
    {
        super.BeginState();
        StartSearchTime = Level.TimeSeconds;
    }

    function GoToSleep()
    {
        GotoState('Closing');
    }

Begin:
    // End:0x34
    if(!IsSpawnCampProtecting() && Level.TimeSeconds > StartSearchTime + float(10))
    {
        GoToSleep();
    }
    // End:0x6f
    else
    {
        ScanRotation();
        FocalPoint = Pawn.Location + float(1000) * vector(DesiredRotation);
        Sleep(GetScanDelay());
        goto 'Begin';
    }
    stop;        
}
