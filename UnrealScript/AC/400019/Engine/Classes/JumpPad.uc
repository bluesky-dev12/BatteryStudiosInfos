class JumpPad extends NavigationPoint
    native
    notplaceable
    hidecategories(Lighting,LightColor,Karma,Force);

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
    foreach AllActors(Class'Engine.NavigationPoint', N)
    {
        // End:0x4F
        if((N != self) && NearSpot(N.Location))
        {
            N.ExtraCost += 1000;
        }        
    }    
    // End:0xA0
    if(JumpVelocity != JumpVelocity)
    {
        Log((string(self) $ " has illegal jump velocity ") $ string(JumpVelocity));
        JumpVelocity = vect(0.0000000, 0.0000000, 0.0000000);
    }
    BACKUP_JumpVelocity = JumpVelocity;
    //return;    
}

function Reset()
{
    JumpVelocity = BACKUP_JumpVelocity;
    //return;    
}

event Touch(Actor Other)
{
    // End:0x3F
    if(((Pawn(Other) == none) || int(Other.Physics) == int(0)) || Vehicle(Other) != none)
    {
        return;
    }
    PendingTouch = Other.PendingTouch;
    Other.PendingTouch = self;
    //return;    
}

event PostTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x60
    if((((P == none) || int(P.Physics) == int(0)) || Vehicle(Other) != none) || P.DrivenVehicle != none)
    {
        return;
    }
    // End:0x106
    if(AIController(P.Controller) != none)
    {
        P.Controller.MoveTarget = JumpTarget;
        P.Controller.Focus = JumpTarget;
        // End:0xE9
        if(int(P.Physics) != int(4))
        {
            P.Controller.MoveTimer = 2.0000000;
        }
        P.DestinationOffset = JumpTarget.CollisionRadius;
    }
    // End:0x12D
    if(int(P.Physics) == int(1))
    {
        P.SetPhysics(2);
    }
    P.Velocity = JumpVelocity;
    P.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

defaultproperties
{
    JumpVelocity=(X=0.0000000,Y=0.0000000,Z=1200.0000000)
    JumpZModifier=1.0000000
    bDestinationOnly=true
    bCollideActors=true
}