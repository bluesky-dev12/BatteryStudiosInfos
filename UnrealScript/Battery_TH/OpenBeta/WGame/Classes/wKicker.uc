class wKicker extends Triggers;

var() Vector KickVelocity;
var() name KickedClasses;
var() bool bKillVelocity;
var() bool bRandomize;

simulated function Touch(Actor Other)
{
    local Actor A;

    // End:0x18
    if(!Other.IsA(KickedClasses))
    {
        return;
    }
    PendingTouch = Other.PendingTouch;
    Other.PendingTouch = self;
    // End:0x84
    if(Event != 'None')
    {
        // End:0x83
        foreach AllActors(Class'Engine.Actor', A, Event)
        {
            A.Trigger(Other, Other.Instigator);            
        }        
    }
    //return;    
}

simulated function PostTouch(Actor Other)
{
    local bool bWasFalling;
    local Vector Push;
    local float PMag;

    bWasFalling = int(Other.Physics) == int(2);
    // End:0x46
    if(bKillVelocity)
    {
        Push = float(-1) * Other.Velocity;        
    }
    else
    {
        Push.Z = -1.0000000 * Other.Velocity.Z;
    }
    // End:0xAB
    if(bRandomize)
    {
        PMag = VSize(KickVelocity);
        Push += (PMag * Normal(KickVelocity + ((0.5000000 * PMag) * VRand())));        
    }
    else
    {
        Push += KickVelocity;
    }
    // End:0xFC
    if(Other.IsA('Bot'))
    {
        // End:0xE8
        if(bWasFalling)
        {
            Pawn(Other).JumpOffPawn();
        }
        Bot(Other).SetFall();
    }
    Other.SetPhysics(2);
    Other.Velocity += Push;
    //return;    
}

defaultproperties
{
    KickedClasses="Pawn"
    RemoteRole=2
    bDirectional=true
}