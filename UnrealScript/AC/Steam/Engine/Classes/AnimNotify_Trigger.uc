/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnimNotify_Trigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_Trigger extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var() name EventName;

event Notify(Actor Owner)
{
    Owner.TriggerEvent(EventName, Owner, Pawn(Owner));
}
