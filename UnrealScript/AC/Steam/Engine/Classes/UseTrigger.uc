/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\UseTrigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class UseTrigger extends Triggers
    placeable;

var() localized string Message;

function bool SelfTriggered()
{
    return true;
}

function UsedBy(Pawn User)
{
    TriggerEvent(Event, self, User);
}

function Touch(Actor Other)
{
    // End:0x63
    if(Pawn(Other) != none)
    {
        // End:0x35
        if(Message != "")
        {
            Pawn(Other).ClientMessage(Message);
        }
        // End:0x63
        if(AIController(Pawn(Other).Controller) != none)
        {
            UsedBy(Pawn(Other));
        }
    }
}
