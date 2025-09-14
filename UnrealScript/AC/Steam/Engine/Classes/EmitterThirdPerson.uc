/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\EmitterThirdPerson.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class EmitterThirdPerson extends Emitter
    placeable;

simulated function DestroyIfFirstPerson()
{
    // End:0x56
    if(Owner != none && Owner.IsA('Pawn') && Pawn(Owner).IsLocallyControlled() && Pawn(Owner).IsFirstPerson())
    {
        Destroy();
    }
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    DestroyIfFirstPerson();
}
