/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\VolumeTrigger.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class VolumeTrigger extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Volume V;

    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x41
    foreach AllActors(class'Volume', V, Event)
    {
        V.Trigger(Other, EventInstigator);                
    }
}

defaultproperties
{
    bCollideActors=true
}