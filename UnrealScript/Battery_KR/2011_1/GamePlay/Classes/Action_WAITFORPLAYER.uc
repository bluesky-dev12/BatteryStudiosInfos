class Action_WAITFORPLAYER extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) float Distance;

function bool InitActionFor(ScriptedController C)
{
    // End:0x19
    if(C.CheckIfNearPlayer(Distance))
    {
        return false;
    }
    C.CurrentAction = self;
    C.SetTimer(0.1000000, true);
    return true;
    //return;    
}

function float GetDistance()
{
    return Distance;
    //return;    
}

function bool WaitForPlayer()
{
    return true;
    //return;    
}

defaultproperties
{
    Distance=150.0000000
    ActionString="????? ?????"
    bValidForTrigger=false
}