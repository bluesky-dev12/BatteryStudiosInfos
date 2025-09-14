class Action_PLAYMUSIC extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string Song;
var(Action) Actor.EMusicTransition Transition;
var(Action) bool bAffectAllPlayers;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;
    local Controller A;

    // End:0x7D
    if(bAffectAllPlayers)
    {
        A = C.Level.ControllerList;
        J0x26:

        // End:0x7A [Loop If]
        if(A != none)
        {
            // End:0x63
            if(A.IsA('PlayerController'))
            {
                PlayerController(A).ClientSetMusic(Song, Transition);
            }
            A = A.nextController;
            // [Loop Continue]
            goto J0x26;
        }        
    }
    else
    {
        P = PlayerController(C.GetInstigator().Controller);
        // End:0xAD
        if(P == none)
        {
            return false;
        }
        P.ClientSetMusic(Song, Transition);
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ Song;
    //return;    
}

defaultproperties
{
    Transition=3
    bAffectAllPlayers=true
    ActionString="??? ??????"
}