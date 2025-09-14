class JumpDest extends NavigationPoint
    native
    notplaceable
    hidecategories(Lighting,LightColor,Karma,Force);

var bool bOptionalJumpDest;
var() bool bForceDoubleJump;
var int NumUpstreamPaths;
var ReachSpec UpstreamPaths[8];
var Vector NeededJump[8];
var float CalculatedGravityZ[8];

function int GetPathIndex(ReachSpec Path)
{
    local int i;

    // End:0x0D
    if(Path == none)
    {
        return 0;
    }
    i = 0;
    J0x14:

    // End:0x45 [Loop If]
    if(i < 4)
    {
        // End:0x3B
        if(UpstreamPaths[i] == Path)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return 0;
    //return;    
}

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    local int Num;

    // End:0x1C
    if(int(Other.Physics) == int(4))
    {
        return 100;
    }
    // End:0x32
    if(Vehicle(Other) != none)
    {
        return 10000000;
    }
    Num = GetPathIndex(Path);
    // End:0x98
    if(Abs(Other.JumpZ / Other.PhysicsVolume.Gravity.Z) >= Abs(NeededJump[Num].Z / CalculatedGravityZ[Num]))
    {
        return 100;
    }
    return 10000000;
    //return;    
}

function DoJump(Pawn Other)
{
    Other.ShouldCrouch(false);
    Other.ShouldProne(false);
    Other.Controller.MoveTarget = self;
    Other.Controller.Destination = Location;
    Other.bNoJumpAdjust = true;
    // End:0xAA
    if(bForceDoubleJump)
    {
        Other.Velocity = Other.Controller.EAdjustJump(0.0000000, Other.default.GroundSpeed);        
    }
    else
    {
        Other.Velocity = Other.Controller.EAdjustJump(0.0000000, Other.GroundSpeed);
    }
    Other.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Other.SetPhysics(2);
    Other.Controller.SetFall();
    Other.DestinationOffset = CollisionRadius;
    //return;    
}

event bool SuggestMovePreparation(Pawn Other)
{
    local int Num;

    // End:0x16
    if(Other.Controller == none)
    {
        return false;
    }
    Num = GetPathIndex(Other.Controller.CurrentPath);
    // End:0x8D
    if(Abs(Other.JumpZ / Other.PhysicsVolume.Gravity.Z) < Abs(NeededJump[Num].Z / CalculatedGravityZ[Num]))
    {
        return false;
    }
    DoJump(Other);
    return false;
    //return;    
}

defaultproperties
{
    bSpecialForced=true
}