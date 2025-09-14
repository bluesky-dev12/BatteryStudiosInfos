/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LadderVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
class LadderVolume extends PhysicsVolume
    native
    notplaceable;

var() name ClimbingAnimation;
var() name TopAnimation;
var() Rotator WallDir;
var Vector LookDir;
var Vector ClimbDir;
var const Ladder LadderList;
var() bool bNoPhysicalLadder;
var() bool bAutoPath;
var() bool bAllowLadderStrafing;
var Pawn PendingClimber;

simulated function PostBeginPlay()
{
    local Ladder L, M;
    local Vector Dir;

    super.PostBeginPlay();
    LookDir = vector(WallDir);
    // End:0x139
    if(!bAutoPath && LookDir.Z != float(0))
    {
        ClimbDir = vect(0.0, 0.0, 1.0);
        L = LadderList;
        J0x50:
        // End:0x102 [While If]
        if(L != none)
        {
            M = LadderList;
            J0x66:
            // End:0xeb [While If]
            if(M != none)
            {
                // End:0xd4
                if(M != L)
                {
                    Dir = Normal(M.Location - L.Location);
                    // End:0xc8
                    if(Dir Dot ClimbDir < float(0))
                    {
                        Dir *= float(-1);
                    }
                    ClimbDir += Dir;
                }
                M = M.LadderList;
                // This is an implied JumpToken; Continue!
                goto J0x66;
            }
            L = L.LadderList;
            // This is an implied JumpToken; Continue!
            goto J0x50;
        }
        ClimbDir = Normal(ClimbDir);
        // End:0x139
        if(ClimbDir Dot vect(0.0, 0.0, 1.0) < float(0))
        {
            ClimbDir *= float(-1);
        }
    }
}

function bool InUse(Pawn Ignored)
{
    local Pawn StillClimbing;

    // End:0x4b
    foreach TouchingActors(class'Pawn', StillClimbing)
    {
        // End:0x4a
        if(StillClimbing != Ignored && StillClimbing.bCollideActors && StillClimbing.bBlockActors)
        {
            break;
            return true;
        }                
    }
    // End:0xef
    if(PendingClimber != none)
    {
        // End:0xef
        if(PendingClimber.Controller == none || !PendingClimber.bCollideActors || !PendingClimber.bBlockActors || Ladder(PendingClimber.Controller.MoveTarget) == none || Ladder(PendingClimber.Controller.MoveTarget).MyLadder != self)
        {
            PendingClimber = none;
        }
    }
    return PendingClimber != none && PendingClimber != Ignored;
}

simulated event PawnEnteredVolume(Pawn P)
{
    local Rotator PawnRot;

    super.PawnEnteredVolume(P);
    // End:0x21
    if(!P.CanGrabLadder())
    {
        return;
    }
    PawnRot = P.Rotation;
    PawnRot.Pitch = 0;
    // End:0xab
    if(vector(PawnRot) Dot LookDir > 0.90 || AIController(P.Controller) != none && Ladder(P.Controller.MoveTarget) != none)
    {
        P.ClimbLadder(self);
    }
    // End:0xe2
    else
    {
        // End:0xe2
        if(!P.bDeleteMe && P.Controller != none)
        {
            Spawn(class'PotentialClimbWatcher', P);
        }
    }
}

simulated event PawnLeavingVolume(Pawn P)
{
    local Controller C;

    // End:0x16
    if(P.OnLadder != self)
    {
        return;
    }
    super.PawnLeavingVolume(P);
    P.OnLadder = none;
    P.EndClimbLadder(self);
    // End:0x57
    if(P == PendingClimber)
    {
        PendingClimber = none;
    }
    // End:0x115
    if(!InUse(P))
    {
        C = Level.ControllerList;
        J0x7b:
        // End:0x115 [While If]
        if(C != none)
        {
            // End:0xfe
            if(C.bPreparingMove && Ladder(C.MoveTarget) != none && Ladder(C.MoveTarget).MyLadder == self)
            {
                C.bPreparingMove = false;
                PendingClimber = C.Pawn;
                return;
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x7b;
        }
    }
}

simulated event PhysicsChangedFor(Actor Other)
{
    // End:0x77
    if(Other.Physics == 2 || Other.Physics == 11 || Other.bDeleteMe || Pawn(Other) == none || Pawn(Other).Controller == none)
    {
        return;
    }
    Spawn(class'PotentialClimbWatcher', Other);
}

defaultproperties
{
    ClimbDir=(X=0.0,Y=0.0,Z=1.0)
    bAutoPath=true
    RemoteRole=2
}