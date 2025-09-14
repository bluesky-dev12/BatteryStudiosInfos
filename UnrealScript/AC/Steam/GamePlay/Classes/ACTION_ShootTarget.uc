/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_ShootTarget.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_ShootTarget extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) int NumShots;
var(Action) name FiringMode;
var(Action) bool bSpray;

function bool InitActionFor(ScriptedController C)
{
    C.NumShots = NumShots;
    C.FiringMode = FiringMode;
    C.bShootTarget = true;
    C.bShootSpray = bSpray;
    return false;
}

defaultproperties
{
    ActionString="??? ?????"
}