class ACTION_PlayLIPSinc extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name LIPSincAnimName;
var(Action) float Volume;
var(Action) float Radius;
var(Action) float Pitch;

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.PlayLIPSincAnim(LIPSincAnimName, Volume, Radius, Pitch);
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString;
    //return;    
}

defaultproperties
{
    Volume=1.0000000
    Radius=80.0000000
    Pitch=1.0000000
    ActionString="Play LIPSinc"
}