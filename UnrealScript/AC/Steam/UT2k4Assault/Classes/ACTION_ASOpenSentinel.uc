/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ACTION_ASOpenSentinel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_ASOpenSentinel extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name SentinelTag;

function bool InitActionFor(ScriptedController C)
{
    local ASVehicle_Sentinel Sentinel;

    // End:0x3e
    if(SentinelTag != 'None')
    {
        // End:0x3d
        foreach C.DynamicActors(class'ASVehicle_Sentinel', Sentinel, SentinelTag)
        {
            Sentinel.AwakeSentinel();                        
        }
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(SentinelTag);
}

defaultproperties
{
    ActionString="???? ???"
}