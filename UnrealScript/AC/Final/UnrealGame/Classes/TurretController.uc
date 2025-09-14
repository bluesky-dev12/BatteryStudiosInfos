class TurretController extends AIController;

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x58
    if(((FRand() < 0.2000000) && Enemy != none) && Enemy.Controller != none)
    {
        Enemy.Controller.ReceiveWarning(Pawn, -1.0000000, Vector(Rotation));
    }
    return Rotation;
    //return;    
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    // End:0x3D
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        Skill = 6.0000000;
        FocusLead = 0.0000420;        
    }
    else
    {
        Skill = Level.Game.GameDifficulty;
        // End:0x8A
        if(Skill > float(3))
        {
            FocusLead = (0.0700000 * FMin(Skill, 7.0000000)) / float(10000);
        }
    }
    //return;    
}

simulated function int GetTeamNum()
{
    // End:0x26
    if(Vehicle(Pawn) != none)
    {
        return int(Vehicle(Pawn).Team);
    }
    return super(Controller).GetTeamNum();
    //return;    
}

function bool IsTargetRelevant(Pawn Target)
{
    // End:0x90
    if(((((Target != none) && Target.Controller != none) && !SameTeamAs(Target.Controller)) && Target.Health > 0) && VSize(Target.Location - Pawn.Location) < (Pawn.SightRadius * 1.2500000))
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsTurretFiring()
{
    // End:0x33
    if((Pawn.Weapon != none) && Pawn.Weapon.IsFiring())
    {
        return true;
    }
    return false;
    //return;    
}

function float GetWaitForTargetTime()
{
    return 3.0000000 + (float(5) * FRand());
    //return;    
}

auto state Searching
{
    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x20
        if(IsTargetRelevant(SeenPlayer))
        {
            Enemy = SeenPlayer;
            GotoState('Engaged');
        }
        //return;        
    }

    function ScanRotation()
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, Dir;
        local float BestDist, dist;
        local Rotator pick;

        DesiredRotation.Yaw = 0;
        DesiredRotation.Pitch = (Rotation.Pitch + 16384) + Rand(32768);
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x8B
        if(HitActor == none)
        {
            return;
        }
        BestDist = VSize(HitLocation - Pawn.Location);
        pick = DesiredRotation;
        DesiredRotation.Pitch += 32768;
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x11E
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x160
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation.Pitch += 16384;
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x1CB
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x20D
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation.Pitch += 32768;
        Dir = Vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(2000) * Dir), Pawn.Location, false);
        // End:0x278
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x2BA
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation = pick;
        //return;        
    }

    function BeginState()
    {
        Enemy = none;
        Focus = none;
        StopFiring();
        //return;        
    }
Begin:

    ScanRotation();
    FocalPoint = Pawn.Location + (float(1000) * Vector(DesiredRotation));
    Sleep(2.0000000 + (float(3) * FRand()));
    goto 'Begin';
    stop;                
}

state Engaged
{
    function EnemyNotVisible()
    {
        // End:0x29
        if(IsTargetRelevant(Enemy))
        {
            Focus = none;
            FocalPoint = LastSeenPos;
            GotoState('WaitForTarget');
            return;
        }
        GotoState('Searching');
        //return;        
    }

    function BeginState()
    {
        Focus = Enemy.GetAimTarget();
        Target = Enemy;
        bFire = 1;
        // End:0x55
        if(Pawn.Weapon != none)
        {
            Pawn.Weapon.BotFire(false);
        }
        //return;        
    }
Begin:

    Sleep(1.0000000);
    // End:0x2C
    if(!IsTargetRelevant(Enemy) || !IsTurretFiring())
    {
        GotoState('Searching');
    }
    goto 'Begin';
    stop;        
}

state WaitForTarget
{
    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x20
        if(IsTargetRelevant(SeenPlayer))
        {
            Enemy = SeenPlayer;
            GotoState('Engaged');
        }
        //return;        
    }

    function BeginState()
    {
        Target = Enemy;
        bFire = 1;
        // End:0x40
        if(Pawn.Weapon != none)
        {
            Pawn.Weapon.BotFire(false);
        }
        //return;        
    }
Begin:

    Sleep(GetWaitForTargetTime());
    GotoState('Searching');
    stop;                
}

defaultproperties
{
    bSlowerZAcquire=false
    RotationRate=(Pitch=32768,Yaw=60000,Roll=0)
}