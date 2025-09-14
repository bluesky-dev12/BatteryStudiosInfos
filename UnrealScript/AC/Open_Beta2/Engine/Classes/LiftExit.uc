class LiftExit extends NavigationPoint
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() name LiftTag;
var Mover MyLift;
var() byte SuggestedKeyFrame;
var byte KeyFrame;
var(LiftJump) bool bLiftJumpExit;
var(LiftJump) bool bNoDoubleJump;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x58
    if(bLiftJumpExit && MyLift != none)
    {
        // End:0x47
        if(Level.Game.GameDifficulty < float(4))
        {
            ExtraCost = 10000000;
        }
        MyLift.bJumpLift = true;
    }
    //return;    
}

function bool CanBeReachedFromLiftBy(Pawn Other)
{
    local float RealJumpZ;

    // End:0x1EE
    if(bLiftJumpExit)
    {
        // End:0x3F
        if((MyLift.Velocity.Z < float(100)) || int(MyLift.KeyNum) == 0)
        {
            return false;
        }
        RealJumpZ = Other.JumpZ;
        // End:0x82
        if(!bNoDoubleJump)
        {
            Other.JumpZ = Other.JumpZ * 1.5000000;
        }
        Other.JumpZ += MyLift.Velocity.Z;
        Other.ShouldCrouch(false);
        Other.ShouldProne(false);
        Other.Controller.MoveTarget = self;
        Other.Controller.Destination = Location;
        Other.bNoJumpAdjust = true;
        Other.Velocity = SuggestFallVelocity(Location + vect(0.0000000, 0.0000000, 100.0000000), Other.Location, Other.JumpZ, Other.GroundSpeed);
        Other.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Other.SetPhysics(2);
        Other.Controller.SetFall();
        Other.DestinationOffset = CollisionRadius;
        Other.JumpZ = RealJumpZ;
        // End:0x1EC
        if(!bNoDoubleJump)
        {
            Other.Controller.SetDoubleJump();
        }
        return true;
    }
    return (Location.Z < (Other.Location.Z + Other.CollisionHeight)) && Other.LineOfSightTo(self);
    //return;    
}

event bool SuggestMovePreparation(Pawn Other)
{
    local Controller C;

    // End:0x23
    if((MyLift == none) || Other.Controller == none)
    {
        return false;
    }
    // End:0x9A
    if(int(Other.Physics) == int(4))
    {
        // End:0x98
        if(Other.AirSpeed > float(0))
        {
            Other.Controller.MoveTimer = 2.0000000 + (VSize(Location - Other.Location) / Other.AirSpeed);
        }
        return false;
    }
    // End:0x16F
    if((Other.Base == MyLift) || ((LiftCenter(Other.Anchor) != none) && LiftCenter(Other.Anchor).MyLift == MyLift) && Other.ReachedDestination(Other.Anchor))
    {
        // End:0x127
        if(CanBeReachedFromLiftBy(Other))
        {
            return false;
        }
        Other.DesiredRotation = Rotator(Location - Other.Location);
        Other.Controller.WaitForMover(MyLift);
        return true;        
    }
    else
    {
        C = Level.ControllerList;
        J0x183:

        // End:0x258 [Loop If]
        if(C != none)
        {
            // End:0x241
            if((((C.Pawn != none) && C.PendingMover == MyLift) && C.SameTeamAs(Other.Controller)) && C.Pawn.ReachedDestination(self))
            {
                Other.DesiredRotation = Rotator(Location - Other.Location);
                Other.Controller.WaitForMover(MyLift);
                return true;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x183;
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    SuggestedKeyFrame=255
    bNeverUseStrafing=true
    bForceNoStrafing=true
    bSpecialMove=true
    Texture=Texture'Engine_Decompressed.S_LiftExit'
}