/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYLOCALSOUND.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_PLAYLOCALSOUND extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Sound Sound;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;

    // End:0x2e
    foreach C.DynamicActors(class'PlayerController', P)
    {
        P.ClientPlaySound(Sound);                
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(Sound);
}

defaultproperties
{
    ActionString="?????? ??????"
}