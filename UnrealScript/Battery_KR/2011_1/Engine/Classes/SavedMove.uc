class SavedMove extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var SavedMove NextMove;
var float TimeStamp;
var float Delta;
var bool bRun;
var bool bDuck;
var bool bProne;
var bool bPressedJump;
var bool bDoubleJump;
var Actor.EDoubleClickDir DoubleClickMove;
var Actor.EPhysics SavedPhysics;
var Vector StartLocation;
var Vector StartRelativeLocation;
var Vector StartVelocity;
var Vector StartFloor;
var Vector SavedLocation;
var Vector SavedVelocity;
var Vector SavedRelativeLocation;
var Actor StartBase;
var Actor EndBase;

final function Clear()
{
    TimeStamp = 0.0000000;
    Delta = 0.0000000;
    DoubleClickMove = 0;
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    StartVelocity = vect(0.0000000, 0.0000000, 0.0000000);
    bRun = false;
    bDuck = false;
    bProne = false;
    bPressedJump = false;
    bDoubleJump = false;
    //return;    
}

final function PostUpdate(PlayerController P)
{
    bDoubleJump = P.bDoubleJump || bDoubleJump;
    // End:0xDA
    if(P.Pawn != none)
    {
        SavedLocation = P.Pawn.Location;
        SavedVelocity = P.Pawn.Velocity;
        EndBase = P.Pawn.Base;
        // End:0xDA
        if((EndBase != none) && !EndBase.bWorldGeometry)
        {
            SavedRelativeLocation = P.Pawn.Location - EndBase.Location;
        }
    }
    SetRotation(P.Rotation);
    //return;    
}

final function bool IsJumpMove()
{
    return (bPressedJump || bDoubleJump) || ((int(DoubleClickMove) != int(0)) && int(DoubleClickMove) != int(5)) && int(DoubleClickMove) != int(6);
    //return;    
}

function Vector GetStartLocation()
{
    // End:0x38
    if((Vehicle(StartBase) != none) || Mover(StartBase) != none)
    {
        return StartBase.Location + StartRelativeLocation;
    }
    return StartLocation;
    //return;    
}

final function SetInitialPosition(Pawn P)
{
    SavedPhysics = P.Physics;
    StartLocation = P.Location;
    StartVelocity = P.Velocity;
    StartBase = P.Base;
    StartFloor = P.Floor;
    // End:0xA9
    if((StartBase != none) && !StartBase.bWorldGeometry)
    {
        StartRelativeLocation = P.Location - StartBase.Location;
    }
    //return;    
}

final function SetMoveFor(PlayerController P, float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir InDoubleClick)
{
    Delta = DeltaTime;
    // End:0x34
    if(VSize(NewAccel) > float(3072))
    {
        NewAccel = float(3072) * Normal(NewAccel);
    }
    // End:0x5C
    if(P.Pawn != none)
    {
        SetInitialPosition(P.Pawn);
    }
    Acceleration = NewAccel;
    DoubleClickMove = InDoubleClick;
    bRun = int(P.bRun) > 0;
    bDuck = int(P.bDuck) > 0;
    bProne = int(P.bProne) > 0;
    bPressedJump = P.bPressedJump;
    bDoubleJump = P.bDoubleJump;
    TimeStamp = Level.TimeSeconds;
    //return;    
}
