/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYAMBIENTSOUND.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class Action_PLAYAMBIENTSOUND extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Sound AmbientSound;
var(Action) byte SoundVolume;
var(Action) byte SoundPitch;
var(Action) float SoundRadius;

function bool InitActionFor(ScriptedController C)
{
    // End:0x7f
    if(AmbientSound != none)
    {
        C.SequenceScript.AmbientSound = AmbientSound;
        C.SequenceScript.SoundVolume = SoundVolume;
        C.SequenceScript.SoundPitch = SoundPitch;
        C.SequenceScript.SoundRadius = SoundRadius;
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(AmbientSound);
}

defaultproperties
{
    SoundVolume=128
    SoundPitch=64
    SoundRadius=64.0
    ActionString="?? ???? ??????"
}