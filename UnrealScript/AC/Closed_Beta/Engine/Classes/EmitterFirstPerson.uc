class EmitterFirstPerson extends Emitter
    placeable;

simulated function DestroyIfThirdPerson()
{
    // End:0x58
    if((((Owner != none) && Owner.IsA('Pawn')) && Pawn(Owner).IsLocallyControlled()) && !Pawn(Owner).IsFirstPerson())
    {
        Destroy();
    }
    //return;    
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    DestroyIfThirdPerson();
    //return;    
}
