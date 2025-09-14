/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYMUSIC.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class Action_PLAYMUSIC extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) string Song;
var(Action) Engine.Actor.EMusicTransition Transition;
var(Action) bool bAffectAllPlayers;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;
    local Controller A;

    // End:0x7d
    if(bAffectAllPlayers)
    {
        A = C.Level.ControllerList;
        J0x26:
        // End:0x7a [While If]
        if(A != none)
        {
            // End:0x63
            if(A.IsA('PlayerController'))
            {
                PlayerController(A).ClientSetMusic(Song, Transition);
            }
            A = A.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x26;
        }
    }
    // End:0xc6
    else
    {
        P = PlayerController(C.GetInstigator().Controller);
        // End:0xad
        if(P == none)
        {
            return false;
        }
        P.ClientSetMusic(Song, Transition);
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ Song;
}

defaultproperties
{
    Transition=3
    bAffectAllPlayers=true
    ActionString="??? ??????"
}