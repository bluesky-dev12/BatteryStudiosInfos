/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\RedirectionTrigger.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class RedirectionTrigger extends Triggers;

var() name RedirectionEvent;

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Pawn P;

    // End:0x44
    foreach DynamicActors(class'Pawn', P, Event)
    {
        // End:0x43
        if(P.Health > 0)
        {
            P.TriggerEvent(RedirectionEvent, self, P);
        }                
    }
}

defaultproperties
{
    bCollideActors=true
}