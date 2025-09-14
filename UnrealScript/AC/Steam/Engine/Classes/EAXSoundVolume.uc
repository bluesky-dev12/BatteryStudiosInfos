/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\EAXSoundVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class EAXSoundVolume extends PhysicsVolume
    notplaceable;

simulated event PawnEnteredVolume(Pawn P)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x3b
    if(P.IsLocallyControlled())
    {
        TriggerEvent(Event, self, P);
    }
    // End:0xb7
    else
    {
        // End:0xb7
        if(PC != none && PC.IsInState('Spectating') || PC.IsInState('SpectatingGM') && P == PC.Pawn || P == PC.ViewTarget)
        {
            TriggerEvent(Event, self, P);
        }
    }
}

simulated event PawnLeavingVolume(Pawn P)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x3b
    if(P.IsLocallyControlled())
    {
        UntriggerEvent(Event, self, P);
    }
    // End:0xb7
    else
    {
        // End:0xb7
        if(PC != none && PC.IsInState('Spectating') || PC.IsInState('SpectatingGM') && P == PC.Pawn || P == PC.ViewTarget)
        {
            UntriggerEvent(Event, self, P);
        }
    }
}

simulated event Touch(Actor Other)
{
    super(Actor).Touch(Other);
}

defaultproperties
{
    RemoteRole=2
}