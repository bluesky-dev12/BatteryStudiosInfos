/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TurretController.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:6
 *	States:3
 *
 *******************************************************************************/
class TurretController extends AIController;

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x58
    if(FRand() < 0.20 && Enemy != none && Enemy.Controller != none)
    {
        Enemy.Controller.ReceiveWarning(Pawn, -1.0, vector(Rotation));
    }
    return Rotation;
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    // End:0x3d
    if(Level.NetMode != 0)
    {
        Skill = 6.0;
        FocusLead = 0.0000420;
    }
    // End:0x8a
    else
    {
        Skill = Level.Game.GameDifficulty;
        // End:0x8a
        if(Skill > float(3))
        {
            FocusLead = 0.070 * FMin(Skill, 7.0) / float(10000);
        }
    }
}

simulated function int GetTeamNum()
{
    // End:0x26
    if(Vehicle(Pawn) != none)
    {
        return Vehicle(Pawn).Team;
    }
    return super(Controller).GetTeamNum();
}

function bool IsTargetRelevant(Pawn Target)
{
    // End:0x90
    if(Target != none && Target.Controller != none && !SameTeamAs(Target.Controller) && Target.Health > 0 && VSize(Target.Location - Pawn.Location) < Pawn.SightRadius * 1.250)
    {
        return true;
    }
    return false;
}

function bool IsTurretFiring()
{
    // End:0x33
    if(Pawn.Weapon != none && Pawn.Weapon.IsFiring())
    {
        return true;
    }
    return false;
}

function float GetWaitForTargetTime()
{
    return 3.0 + float(5) * FRand();
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
    }

    function ScanRotation()
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, Dir;
        local float BestDist, dist;
        local Rotator pick;

        DesiredRotation.Yaw = 0;
        DesiredRotation.Pitch = Rotation.Pitch + 16384 + Rand(32768);
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x8b
        if(HitActor == none)
        {
            return;
        }
        BestDist = VSize(HitLocation - Pawn.Location);
        pick = DesiredRotation;
        DesiredRotation.Pitch += 32768;
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x11e
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
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x1cb
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x20d
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation.Pitch += 32768;
        Dir = vector(DesiredRotation);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(2000) * Dir, Pawn.Location, false);
        // End:0x278
        if(HitActor == none)
        {
            return;
        }
        dist = VSize(HitLocation - Pawn.Location);
        // End:0x2ba
        if(dist > BestDist)
        {
            BestDist = dist;
            pick = DesiredRotation;
        }
        DesiredRotation = pick;
    }

    function BeginState()
    {
        Enemy = none;
        Focus = none;
        StopFiring();
    }

Begin:
    ScanRotation();
    FocalPoint = Pawn.Location + float(1000) * vector(DesiredRotation);
    Sleep(2.0 + float(3) * FRand());
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
    }

Begin:
    Sleep(1.0);
    // End:0x2c
    if(!IsTargetRelevant(Enemy) || !IsTurretFiring())
    {
        GotoState('Searching');
    }
    goto 'Begin';
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
    }

Begin:
    Sleep(GetWaitForTargetTime());
    GotoState('Searching');
    stop;    
}

defaultproperties
{
    bSlowerZAcquire=true
    RotationRate=(Pitch=32768,Yaw=60000,Roll=0)
}