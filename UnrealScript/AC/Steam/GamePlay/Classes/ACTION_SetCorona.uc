/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_SetCorona.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_SetCorona extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) bool bCorona;
var(Action) name HideActorTag;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x45
    if(HideActorTag != 'None')
    {
        // End:0x44
        foreach C.AllActors(class'Actor', A, HideActorTag)
        {
            A.bCorona = bCorona;                        
        }
    }
    return false;
}
