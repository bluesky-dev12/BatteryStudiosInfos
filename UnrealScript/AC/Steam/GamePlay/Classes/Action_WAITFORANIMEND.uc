/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_WAITFORANIMEND.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class Action_WAITFORANIMEND extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) int Channel;

function bool CompleteOnAnim(int Num)
{
    return Channel == Num;
}

defaultproperties
{
    ActionString="animend? ?????"
    bValidForTrigger=true
}