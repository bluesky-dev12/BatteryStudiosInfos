/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_PlayLIPSinc.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_PlayLIPSinc extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name LIPSincAnimName;
var(Action) float Volume;
var(Action) float Radius;
var(Action) float Pitch;

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.PlayLIPSincAnim(LIPSincAnimName, Volume, Radius, Pitch);
    return false;
}

function string GetActionString()
{
    return ActionString;
}

defaultproperties
{
    Volume=1.0
    Radius=80.0
    Pitch=1.0
    ActionString="Play LIPSinc"
}