class Action_PLAYAMBIENTSOUND extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Sound AmbientSound;
var(Action) byte SoundVolume;
var(Action) byte SoundPitch;
var(Action) float SoundRadius;

function bool InitActionFor(ScriptedController C)
{
    // End:0x7F
    if(AmbientSound != none)
    {
        C.SequenceScript.AmbientSound = AmbientSound;
        C.SequenceScript.SoundVolume = SoundVolume;
        C.SequenceScript.SoundPitch = SoundPitch;
        C.SequenceScript.SoundRadius = SoundRadius;
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(AmbientSound);
    //return;    
}

defaultproperties
{
    SoundVolume=128
    SoundPitch=64
    SoundRadius=64.0000000
    ActionString="?? ???? ??????"
}