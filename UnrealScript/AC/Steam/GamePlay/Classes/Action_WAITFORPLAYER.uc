/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_WAITFORPLAYER.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class Action_WAITFORPLAYER extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) float Distance;

function bool InitActionFor(ScriptedController C)
{
    // End:0x19
    if(C.CheckIfNearPlayer(Distance))
    {
        return false;
    }
    C.CurrentAction = self;
    C.SetTimer(0.10, true);
    return true;
}

function float GetDistance()
{
    return Distance;
}

function bool WaitForPlayer()
{
    return true;
}

defaultproperties
{
    Distance=150.0
    ActionString="????? ?????"
    bValidForTrigger=true
}