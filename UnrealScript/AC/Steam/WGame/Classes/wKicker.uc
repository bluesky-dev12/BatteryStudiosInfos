/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wKicker.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
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
        foreach AllActors(class'Actor', A, Event)
        {
            A.Trigger(Other, Other.Instigator);                        
        }
    }
}

simulated function PostTouch(Actor Other)
{
    local bool bWasFalling;
    local Vector Push;
    local float PMag;

    bWasFalling = Other.Physics == 2;
    // End:0x46
    if(bKillVelocity)
    {
        Push = float(-1) * Other.Velocity;
    }
    // End:0x6b
    else
    {
        Push.Z = -1.0 * Other.Velocity.Z;
    }
    // End:0xab
    if(bRandomize)
    {
        PMag = VSize(KickVelocity);
        Push += PMag * Normal(KickVelocity + 0.50 * PMag * VRand());
    }
    // End:0xb7
    else
    {
        Push += KickVelocity;
    }
    // End:0xfc
    if(Other.IsA('Bot'))
    {
        // End:0xe8
        if(bWasFalling)
        {
            Pawn(Other).JumpOffPawn();
        }
        Bot(Other).SetFall();
    }
    Other.SetPhysics(2);
    Other.Velocity += Push;
}

defaultproperties
{
    KickedClasses=Pawn
    RemoteRole=2
    bDirectional=true
}