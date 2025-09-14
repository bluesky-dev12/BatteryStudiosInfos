class EmitterThirdPerson extends Emitter
    placeable;

simulated function DestroyIfFirstPerson()
{
    // End:0x56
    if((((Owner != none) && Owner.IsA('Pawn')) && Pawn(Owner).IsLocallyControlled()) && Pawn(Owner).IsFirstPerson())
    {
        Destroy();
    }
    //return;    
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    DestroyIfFirstPerson();
    //return;    
}
