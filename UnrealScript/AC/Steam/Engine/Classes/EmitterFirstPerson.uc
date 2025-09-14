/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\EmitterFirstPerson.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class EmitterFirstPerson extends Emitter
    placeable;

simulated function DestroyIfThirdPerson()
{
    // End:0x58
    if(Owner != none && Owner.IsA('Pawn') && Pawn(Owner).IsLocallyControlled() && !Pawn(Owner).IsFirstPerson())
    {
        Destroy();
    }
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    DestroyIfThirdPerson();
}
