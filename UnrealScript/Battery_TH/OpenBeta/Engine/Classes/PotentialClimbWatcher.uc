class PotentialClimbWatcher extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function Tick(float DeltaTime)
{
    local Rotator PawnRot;
    local LadderVolume L;
    local bool bFound;

    // End:0x3F
    if(((Owner == none) || Owner.bDeleteMe) || !Pawn(Owner).CanGrabLadder())
    {
        Destroy();
        return;
    }
    PawnRot = Owner.Rotation;
    PawnRot.Pitch = 0;
    // End:0xDB
    foreach Owner.TouchingActors(Class'Engine_Decompressed.LadderVolume', L)
    {
        // End:0xDA
        if(L.Encompasses(Owner))
        {
            // End:0xD2
            if((Vector(PawnRot) Dot L.LookDir) > 0.9000000)
            {
                Pawn(Owner).ClimbLadder(L);
                Destroy();                
                return;
                // End:0xDA
                continue;
            }
            bFound = true;
        }        
    }    
    // End:0xEA
    if(!bFound)
    {
        Destroy();
    }
    //return;    
}
