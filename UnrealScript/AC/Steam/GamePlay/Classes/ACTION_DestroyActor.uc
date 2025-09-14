/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_DestroyActor.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_DestroyActor extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name DestroyTag;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x3b
    if(DestroyTag != 'None')
    {
        // End:0x3a
        foreach C.AllActors(class'Actor', A, DestroyTag)
        {
            A.Destroy();                        
        }
    }
    return false;
}

defaultproperties
{
    ActionString="???? ?????"
}