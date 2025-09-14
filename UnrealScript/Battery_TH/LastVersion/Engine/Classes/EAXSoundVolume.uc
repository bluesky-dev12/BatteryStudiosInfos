class EAXSoundVolume extends PhysicsVolume
    notplaceable;

simulated event bool PawnEnteredVolume(Pawn P)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x3B
    if(P.IsLocallyControlled())
    {
        TriggerEvent(Event, self, P);        
    }
    else
    {
        // End:0xB7
        if(((PC != none) && PC.IsInState('Spectating') || PC.IsInState('SpectatingGM')) && (P == PC.Pawn) || P == PC.ViewTarget)
        {
            TriggerEvent(Event, self, P);
        }
    }
    return true;
    //return;    
}

simulated event PawnLeavingVolume(Pawn P)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x3B
    if(P.IsLocallyControlled())
    {
        UntriggerEvent(Event, self, P);        
    }
    else
    {
        // End:0xB7
        if(((PC != none) && PC.IsInState('Spectating') || PC.IsInState('SpectatingGM')) && (P == PC.Pawn) || P == PC.ViewTarget)
        {
            UntriggerEvent(Event, self, P);
        }
    }
    //return;    
}

simulated event Touch(Actor Other)
{
    super(Actor).Touch(Other);
    //return;    
}

defaultproperties
{
    RemoteRole=2
}