/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PotentialClimbWatcher.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PotentialClimbWatcher extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

simulated function Tick(float DeltaTime)
{
    local Rotator PawnRot;
    local LadderVolume L;
    local bool bFound;

    // End:0x3f
    if(Owner == none || Owner.bDeleteMe || !Pawn(Owner).CanGrabLadder())
    {
        Destroy();
        return;
    }
    PawnRot = Owner.Rotation;
    PawnRot.Pitch = 0;
    // End:0xdb
    foreach Owner.TouchingActors(class'LadderVolume', L)
    {
        // End:0xda
        if(L.Encompasses(Owner))
        {
            // End:0xd2
            if(vector(PawnRot) Dot L.LookDir > 0.90)
            {
                Pawn(Owner).ClimbLadder(L);
                Destroy();
                break;
                return;
            }
            // End:0xda
            else
            {
                bFound = true;
            }
        }                
    }
    // End:0xea
    if(!bFound)
    {
        Destroy();
    }
}
