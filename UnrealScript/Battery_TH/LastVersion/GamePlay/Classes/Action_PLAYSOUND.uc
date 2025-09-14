class Action_PLAYSOUND extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Sound Sound;
var(Action) float Volume;
var(Action) float Pitch;
var(Action) bool bAttenuate;

function bool InitActionFor(ScriptedController C)
{
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(Sound);
    //return;    
}

defaultproperties
{
    Volume=1.0000000
    Pitch=1.0000000
    bAttenuate=true
    ActionString="???? ??????"
}