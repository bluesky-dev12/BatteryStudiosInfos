/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\JumpPad.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class JumpPad extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var Vector JumpVelocity;
var Vector BACKUP_JumpVelocity;
var Actor JumpTarget;
var() float JumpZModifier;
var() Sound JumpSound;

function PostBeginPlay()
{
    local NavigationPoint N;

    super.PostBeginPlay();
    // End:0x50
    foreach AllActors(class'NavigationPoint', N)
    {
        // End:0x4f
        if(N != self && NearSpot(N.Location))
        {
            N.ExtraCost += 1000;
        }                
    }
    // End:0xa0
    if(JumpVelocity != JumpVelocity)
    {
        Log(string(self) $ " has illegal jump velocity " $ string(JumpVelocity));
        JumpVelocity = vect(0.0, 0.0, 0.0);
    }
    BACKUP_JumpVelocity = JumpVelocity;
}

function Reset()
{
    JumpVelocity = BACKUP_JumpVelocity;
}

event Touch(Actor Other)
{
    // End:0x3f
    if(Pawn(Other) == none || Other.Physics == 0 || Vehicle(Other) != none)
    {
        return;
    }
    PendingTouch = Other.PendingTouch;
    Other.PendingTouch = self;
}

event PostTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x60
    if(P == none || P.Physics == 0 || Vehicle(Other) != none || P.DrivenVehicle != none)
    {
        return;
    }
    // End:0x106
    if(AIController(P.Controller) != none)
    {
        P.Controller.MoveTarget = JumpTarget;
        P.Controller.Focus = JumpTarget;
        // End:0xe9
        if(P.Physics != 4)
        {
            P.Controller.MoveTimer = 2.0;
        }
        P.DestinationOffset = JumpTarget.CollisionRadius;
    }
    // End:0x12d
    if(P.Physics == 1)
    {
        P.SetPhysics(2);
    }
    P.Velocity = JumpVelocity;
    P.Acceleration = vect(0.0, 0.0, 0.0);
    // End:0x179
    if(JumpSound != none)
    {
        P.PlaySound(JumpSound);
    }
}

defaultproperties
{
    JumpVelocity=(X=0.0,Y=0.0,Z=1200.0)
    JumpZModifier=1.0
    bDestinationOnly=true
    bCollideActors=true
}