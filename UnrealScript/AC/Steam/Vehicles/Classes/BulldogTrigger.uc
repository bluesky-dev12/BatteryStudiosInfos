/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\BulldogTrigger.uc
 * Package Imports:
 *	Vehicles
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BulldogTrigger extends ScriptedSequence
    dependson(Bulldog);

var float BTReTriggerDelay;
var float TriggerTime;
var bool bCarFlipTrigger;

function Touch(Actor Other)
{
    local wPawn User;

    User = wPawn(Other);
    // End:0x33
    if(User == none || User.Controller == none)
    {
        return;
    }
    // End:0x97
    if(User.Controller.RouteGoal == self || User.Controller.MoveTarget == self && AIController(User.Controller) != none)
    {
        UsedBy(User);
        return;
    }
    // End:0xd9
    if(BTReTriggerDelay > float(0))
    {
        // End:0xc5
        if(Level.TimeSeconds - TriggerTime < BTReTriggerDelay)
        {
            return;
        }
        TriggerTime = Level.TimeSeconds;
    }
    // End:0xfc
    if(!bCarFlipTrigger)
    {
        User.ReceiveLocalizedMessage(class'BulldogMessage', 0);
    }
    // End:0x112
    else
    {
        User.ReceiveLocalizedMessage(class'BulldogMessage', 3);
    }
}

function UsedBy(Pawn User)
{
    // End:0x25
    if(bCarFlipTrigger)
    {
        Bulldog(Owner).StartFlip(User);
    }
    // End:0x3e
    else
    {
        Bulldog(Owner).TryToDrive(User);
    }
}

defaultproperties
{
    BTReTriggerDelay=0.10
    bStatic=true
    bOnlyAffectPawns=true
    bCollideWhenPlacing=true
    bHardAttach=true
    CollisionRadius=80.0
    CollisionHeight=400.0
}