class BulldogTrigger extends ScriptedSequence;

var float BTReTriggerDelay;
var float TriggerTime;
var bool bCarFlipTrigger;

function Touch(Actor Other)
{
    local wPawn User;

    User = wPawn(Other);
    // End:0x33
    if((User == none) || User.Controller == none)
    {
        return;
    }
    // End:0x97
    if(((User.Controller.RouteGoal == self) || User.Controller.MoveTarget == self) && AIController(User.Controller) != none)
    {
        UsedBy(User);
        return;
    }
    // End:0xD9
    if(BTReTriggerDelay > float(0))
    {
        // End:0xC5
        if((Level.TimeSeconds - TriggerTime) < BTReTriggerDelay)
        {
            return;
        }
        TriggerTime = Level.TimeSeconds;
    }
    // End:0xFC
    if(!bCarFlipTrigger)
    {
        User.ReceiveLocalizedMessage(Class'Vehicles_Decompressed.BulldogMessage', 0);        
    }
    else
    {
        User.ReceiveLocalizedMessage(Class'Vehicles_Decompressed.BulldogMessage', 3);
    }
    //return;    
}

function UsedBy(Pawn User)
{
    // End:0x25
    if(bCarFlipTrigger)
    {
        Bulldog(Owner).StartFlip(User);        
    }
    else
    {
        Bulldog(Owner).TryToDrive(User);
    }
    //return;    
}

defaultproperties
{
    BTReTriggerDelay=0.1000000
    bStatic=false
    bOnlyAffectPawns=true
    bCollideWhenPlacing=false
    bHardAttach=true
    CollisionRadius=80.0000000
    CollisionHeight=400.0000000
}