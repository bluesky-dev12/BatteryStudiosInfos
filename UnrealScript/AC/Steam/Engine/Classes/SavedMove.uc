/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SavedMove.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:6
 *
 *******************************************************************************/
class SavedMove extends Info
    dependson(Info)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

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
    TimeStamp = 0.0;
    Delta = 0.0;
    DoubleClickMove = 0;
    Acceleration = vect(0.0, 0.0, 0.0);
    StartVelocity = vect(0.0, 0.0, 0.0);
    bRun = false;
    bDuck = false;
    bProne = false;
    bPressedJump = false;
    bDoubleJump = false;
}

final function PostUpdate(PlayerController P)
{
    bDoubleJump = P.bDoubleJump || bDoubleJump;
    // End:0xda
    if(P.Pawn != none)
    {
        SavedLocation = P.Pawn.Location;
        SavedVelocity = P.Pawn.Velocity;
        EndBase = P.Pawn.Base;
        // End:0xda
        if(EndBase != none && !EndBase.bWorldGeometry)
        {
            SavedRelativeLocation = P.Pawn.Location - EndBase.Location;
        }
    }
    SetRotation(P.Rotation);
}

final function bool IsJumpMove()
{
    return bPressedJump || bDoubleJump || DoubleClickMove != 0 && DoubleClickMove != 5 && DoubleClickMove != 6;
}

function Vector GetStartLocation()
{
    // End:0x38
    if(Vehicle(StartBase) != none || Mover(StartBase) != none)
    {
        return StartBase.Location + StartRelativeLocation;
    }
    return StartLocation;
}

final function SetInitialPosition(Pawn P)
{
    SavedPhysics = P.Physics;
    StartLocation = P.Location;
    StartVelocity = P.Velocity;
    StartBase = P.Base;
    StartFloor = P.Floor;
    // End:0xa9
    if(StartBase != none && !StartBase.bWorldGeometry)
    {
        StartRelativeLocation = P.Location - StartBase.Location;
    }
}

final function SetMoveFor(PlayerController P, float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir InDoubleClick)
{
    Delta = DeltaTime;
    // End:0x34
    if(VSize(NewAccel) > float(3072))
    {
        NewAccel = float(3072) * Normal(NewAccel);
    }
    // End:0x5c
    if(P.Pawn != none)
    {
        SetInitialPosition(P.Pawn);
    }
    Acceleration = NewAccel;
    DoubleClickMove = InDoubleClick;
    bRun = P.bRun > 0;
    bDuck = P.bDuck > 0;
    bProne = P.bProne > 0;
    bPressedJump = P.bPressedJump;
    bDoubleJump = P.bDoubleJump;
    TimeStamp = Level.TimeSeconds;
}
