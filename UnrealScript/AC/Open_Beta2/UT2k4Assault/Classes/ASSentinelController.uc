class ASSentinelController extends SentinelController;

var float StartSearchTime;
var Rotator LastRotation;

function AnimEnded()
{
    //return;    
}

function Awake()
{
    //return;    
}

function GoToSleep()
{
    //return;    
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x58
    if(((FRand() < 0.4500000) && Enemy != none) && Enemy.Controller != none)
    {
        Enemy.Controller.ReceiveWarning(Pawn, -1.0000000, Vector(Rotation));
    }
    return Rotation;
    //return;    
}

function bool IsSpawnCampProtecting()
{
    return (ASVehicle_Sentinel(Pawn) != none) && ASVehicle_Sentinel(Pawn).bSpawnCampProtection;
    //return;    
}

function float GetScanDelay()
{
    // End:0x0F
    if(IsSpawnCampProtecting())
    {
        return 2.0000000;
    }
    return 2.0000000 + (float(3) * FRand());
    //return;    
}

function float GetWaitForTargetTime()
{
    // End:0x0F
    if(IsSpawnCampProtecting())
    {
        return 2.0000000;
    }
    return super(TurretController).GetWaitForTargetTime();
    //return;    
}

function Possess(Pawn aPawn)
{
    super(TurretController).Possess(aPawn);
    // End:0x2A
    if(IsSpawnCampProtecting())
    {
        Skill = 10.0000000;
        FocusLead = 0.0000000;
    }
    //return;    
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
        //return;        
    }

    function Awake()
    {
        LastRotation = Rotation;
        // End:0x29
        if(ASVehicle_Sentinel(Pawn).Awake())
        {
            GotoState('Opening');
        }
        //return;        
    }

    function ScanRotation()
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, Dir;
        local float BestDist, dist;
        local Rotator pick;

        DesiredRotation.Yaw = (Rotation.Yaw + 16384) + Rand(32768);
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x7F
        if(HitActor == none)
        {
            return;
        }
        BestDist = VSize(HitLocation - Pawn.Location);
        pick = DesiredRotation;
        DesiredRotation.Yaw += 32768;
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
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
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x1BF
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
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x26C
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x2AE
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation = pick;
        //return;        
    }
Begin:

    // End:0x2E
    if(IsSpawnCampProtecting())
    {
        AcquisitionYawRate *= float(100);
        Pawn.PeripheralVision = -1.0000000;
        Awake();
    }
    ScanRotation();
    FocalPoint = Pawn.Location + (float(1000) * Vector(DesiredRotation));
    Sleep(2.0000000 + (float(3) * FRand()));
    goto 'Begin';
    stop;        
}

state Opening
{
    function AnimEnded()
    {
        GotoState('Searching');
        //return;        
    }
    stop;    
}

state Closing
{
    function AnimEnded()
    {
        GotoState('Sleeping');
        //return;        
    }
Begin:

    DesiredRotation = Rotation;
    DesiredRotation.Pitch = 0;
    FocalPoint = Pawn.Location + (float(1000) * Vector(DesiredRotation));
    Sleep(0.5000000);
    ASVehicle_Sentinel(Pawn).GoToSleep();
    stop;            
}

state Searching
{
    function BeginState()
    {
        super.BeginState();
        StartSearchTime = Level.TimeSeconds;
        //return;        
    }

    function GoToSleep()
    {
        GotoState('Closing');
        //return;        
    }
Begin:

    // End:0x34
    if(!IsSpawnCampProtecting() && Level.TimeSeconds > (StartSearchTime + float(10)))
    {
        GoToSleep();        
    }
    else
    {
        ScanRotation();
        FocalPoint = Pawn.Location + (float(1000) * Vector(DesiredRotation));
        Sleep(GetScanDelay());
        goto 'Begin';
    }
    stop;                    
}
