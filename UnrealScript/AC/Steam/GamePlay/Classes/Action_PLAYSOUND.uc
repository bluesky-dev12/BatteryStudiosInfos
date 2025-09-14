/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYSOUND.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class Action_PLAYSOUND extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Sound Sound;
var(Action) float Volume;
var(Action) float Pitch;
var(Action) bool bAttenuate;

function bool InitActionFor(ScriptedController C)
{
    // End:0x3a
    if(Sound != none)
    {
        C.GetSoundSource().PlaySound(Sound, 3, Volume, true,, Pitch, bAttenuate);
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(Sound);
}

defaultproperties
{
    Volume=1.0
    Pitch=1.0
    bAttenuate=true
    ActionString="???? ??????"
}