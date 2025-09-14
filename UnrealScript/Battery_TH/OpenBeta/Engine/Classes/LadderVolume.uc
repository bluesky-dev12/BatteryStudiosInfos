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
    LookDir = Vector(WallDir);
    // End:0x139
    if(!bAutoPath && LookDir.Z != float(0))
    {
        ClimbDir = vect(0.0000000, 0.0000000, 1.0000000);
        L = LadderList;
        J0x50:

        // End:0x102 [Loop If]
        if(L != none)
        {
            M = LadderList;
            J0x66:

            // End:0xEB [Loop If]
            if(M != none)
            {
                // End:0xD4
                if(M != L)
                {
                    Dir = Normal(M.Location - L.Location);
                    // End:0xC8
                    if((Dir Dot ClimbDir) < float(0))
                    {
                        Dir *= float(-1);
                    }
                    ClimbDir += Dir;
                }
                M = M.LadderList;
                // [Loop Continue]
                goto J0x66;
            }
            L = L.LadderList;
            // [Loop Continue]
            goto J0x50;
        }
        ClimbDir = Normal(ClimbDir);
        // End:0x139
        if((ClimbDir Dot vect(0.0000000, 0.0000000, 1.0000000)) < float(0))
        {
            ClimbDir *= float(-1);
        }
    }
    //return;    
}

function bool InUse(Pawn Ignored)
{
    local Pawn StillClimbing;

    // End:0x4B
    foreach TouchingActors(Class'Engine_Decompressed.Pawn', StillClimbing)
    {
        // End:0x4A
        if(((StillClimbing != Ignored) && StillClimbing.bCollideActors) && StillClimbing.bBlockActors)
        {            
            return true;
        }        
    }    
    // End:0xEF
    if(PendingClimber != none)
    {
        // End:0xEF
        if(((((PendingClimber.Controller == none) || !PendingClimber.bCollideActors) || !PendingClimber.bBlockActors) || Ladder(PendingClimber.Controller.MoveTarget) == none) || Ladder(PendingClimber.Controller.MoveTarget).MyLadder != self)
        {
            PendingClimber = none;
        }
    }
    return (PendingClimber != none) && PendingClimber != Ignored;
    //return;    
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
    // End:0xAB
    if(((Vector(PawnRot) Dot LookDir) > 0.9000000) || (AIController(P.Controller) != none) && Ladder(P.Controller.MoveTarget) != none)
    {
        P.ClimbLadder(self);        
    }
    else
    {
        // End:0xE2
        if(!P.bDeleteMe && P.Controller != none)
        {
            Spawn(Class'Engine_Decompressed.PotentialClimbWatcher', P);
        }
    }
    //return;    
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
        J0x7B:

        // End:0x115 [Loop If]
        if(C != none)
        {
            // End:0xFE
            if((C.bPreparingMove && Ladder(C.MoveTarget) != none) && Ladder(C.MoveTarget).MyLadder == self)
            {
                C.bPreparingMove = false;
                PendingClimber = C.Pawn;
                return;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x7B;
        }
    }
    //return;    
}

simulated event PhysicsChangedFor(Actor Other)
{
    // End:0x77
    if(((((int(Other.Physics) == int(2)) || int(Other.Physics) == int(11)) || Other.bDeleteMe) || Pawn(Other) == none) || Pawn(Other).Controller == none)
    {
        return;
    }
    Spawn(Class'Engine_Decompressed.PotentialClimbWatcher', Other);
    //return;    
}

defaultproperties
{
    ClimbDir=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    bAutoPath=true
    RemoteRole=2
}