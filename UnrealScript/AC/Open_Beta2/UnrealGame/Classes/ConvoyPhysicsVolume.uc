class ConvoyPhysicsVolume extends PhysicsVolume;

simulated event PawnEnteredVolume(Pawn Other)
{
    // End:0x33
    if(int(Other.Role) == int(ROLE_Authority))
    {
        Other.Died(none, Class'UnrealGame_Decompressed.ConvoyGibbed', Location);
    }
    // End:0x61
    if(PainTimer == none)
    {
        PainTimer = Spawn(Class'Engine.VolumeTimer', self);
        PainTimer.TimerRate = 0.1000000;
    }
    //return;    
}

simulated function TimerPop(VolumeTimer t)
{
    local Actor A;
    local int i;

    // End:0x227
    foreach DynamicActors(Class'Engine.Actor', A)
    {
        // End:0x226
        if(!A.bNoDelete && A.PhysicsVolume == self)
        {
            // End:0x98
            if((int(A.Role) == int(ROLE_Authority)) && Pawn(A) != none)
            {
                Pawn(A).ChunkUp(A.Rotation, Class'Engine.Gibbed'.default.GibPerterbation);
                // End:0x226
                continue;
            }
            // End:0x202
            if((A.Base == none) && int(A.Physics) == int(0))
            {
                // End:0x193
                if(Emitter(A) != none)
                {
                    A.SetPhysics(6);
                    A.Velocity = ZoneVelocity;
                    A.LifeSpan = FMin(A.LifeSpan, 2.0000000);
                    i = 0;
                    J0x124:

                    // End:0x190 [Loop If]
                    if(i < Emitter(A).Emitters.Length)
                    {
                        // End:0x186
                        if(Emitter(A).Emitters[i] != none)
                        {
                            Emitter(A).Emitters[i].AddVelocityFromOwner = true;
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x124;
                    }                    
                }
                else
                {
                    // End:0x1FF
                    if(wEmitter(A) != none)
                    {
                        A.SetPhysics(6);
                        A.Velocity = ZoneVelocity;
                        A.LifeSpan = FMin(A.LifeSpan, 2.0000000);
                        wEmitter(A).mPosRelative = true;
                    }
                }
                // End:0x226
                continue;
            }
            A.LifeSpan = FMin(A.LifeSpan, 2.0000000);
        }        
    }    
    t.Destroy();
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    //return;    
}

simulated event PostTouch(Actor Other)
{
    // End:0x0D
    if(Other == none)
    {
        return;
    }
    Other.LifeSpan = FMin(Other.LifeSpan, 2.0000000);
    // End:0x62
    if(int(Other.Physics) == int(6))
    {
        Other.Velocity += ZoneVelocity;        
    }
    else
    {
        Other.SetPhysics(2);
        Other.Velocity = ZoneVelocity;
        Other.Velocity.Z = 200.0000000;
    }
    //return;    
}

simulated event Touch(Actor Other)
{
    Other.LifeSpan = FMin(Other.LifeSpan, 2.0000000);
    // End:0x5A
    if(Pickup(Other) != none)
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
        return;
    }
    // End:0x6C
    if(Pawn(Other) != none)
    {
        return;
    }
    // End:0x8E
    if(Other.IsA('BioGlob'))
    {
        Other.Destroy();
        return;
    }
    // End:0xFC
    if(int(Other.Physics) == int(6))
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
        // End:0xF9
        if(PainTimer == none)
        {
            PainTimer = Spawn(Class'Engine.VolumeTimer', self);
            PainTimer.TimerRate = 0.1000000;
        }        
    }
    else
    {
        // End:0x166
        if(((Other.Base == none) && Other.IsA('Emitter')) && int(Other.Physics) == int(0))
        {
            Other.SetPhysics(6);
            Other.Velocity = ZoneVelocity;            
        }
        else
        {
            // End:0x1D1
            if(int(Other.Physics) == int(2))
            {
                PendingTouch = Other.PendingTouch;
                Other.PendingTouch = self;
                // End:0x1D1
                if(PainTimer == none)
                {
                    PainTimer = Spawn(Class'Engine.VolumeTimer', self);
                    PainTimer.TimerRate = 0.1000000;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bNoDecals=true
    RemoteRole=2
}