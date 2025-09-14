/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ConvoyPhysicsVolume.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class ConvoyPhysicsVolume extends PhysicsVolume;

simulated event PawnEnteredVolume(Pawn Other)
{
    // End:0x33
    if(Other.Role == 4)
    {
        Other.Died(none, class'ConvoyGibbed', Location);
    }
    // End:0x61
    if(PainTimer == none)
    {
        PainTimer = Spawn(class'VolumeTimer', self);
        PainTimer.TimerRate = 0.10;
    }
}

simulated function TimerPop(VolumeTimer t)
{
    local Actor A;
    local int i;

    // End:0x227
    foreach DynamicActors(class'Actor', A)
    {
        // End:0x226
        if(!A.bNoDelete && A.PhysicsVolume == self)
        {
            // End:0x98
            if(A.Role == 4 && Pawn(A) != none)
            {
                Pawn(A).ChunkUp(A.Rotation, class'Gibbed'.default.GibPerterbation);
            }
            // End:0x226
            else
            {
                // End:0x202
                if(A.Base == none && A.Physics == 0)
                {
                    // End:0x193
                    if(Emitter(A) != none)
                    {
                        A.SetPhysics(6);
                        A.Velocity = ZoneVelocity;
                        A.LifeSpan = FMin(A.LifeSpan, 2.0);
                        i = 0;
                        J0x124:
                        // End:0x190 [While If]
                        if(i < Emitter(A).Emitters.Length)
                        {
                            // End:0x186
                            if(Emitter(A).Emitters[i] != none)
                            {
                                Emitter(A).Emitters[i].AddVelocityFromOwner = true;
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x124;
                        }
                    }
                    // End:0x1ff
                    else
                    {
                        // End:0x1ff
                        if(wEmitter(A) != none)
                        {
                            A.SetPhysics(6);
                            A.Velocity = ZoneVelocity;
                            A.LifeSpan = FMin(A.LifeSpan, 2.0);
                            wEmitter(A).mPosRelative = true;
                        }
                    }
                }
                // End:0x226
                else
                {
                    A.LifeSpan = FMin(A.LifeSpan, 2.0);
                }
            }
        }                
    }
    t.Destroy();
}

function Trigger(Actor Other, Pawn EventInstigator);
simulated event PostTouch(Actor Other)
{
    // End:0x0d
    if(Other == none)
    {
        return;
    }
    Other.LifeSpan = FMin(Other.LifeSpan, 2.0);
    // End:0x62
    if(Other.Physics == 6)
    {
        Other.Velocity += ZoneVelocity;
    }
    // End:0x9d
    else
    {
        Other.SetPhysics(2);
        Other.Velocity = ZoneVelocity;
        Other.Velocity.Z = 200.0;
    }
}

simulated event Touch(Actor Other)
{
    Other.LifeSpan = FMin(Other.LifeSpan, 2.0);
    // End:0x5a
    if(Pickup(Other) != none)
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
        return;
    }
    // End:0x6c
    if(Pawn(Other) != none)
    {
        return;
    }
    // End:0x8e
    if(Other.IsA('BioGlob'))
    {
        Other.Destroy();
        return;
    }
    // End:0xfc
    if(Other.Physics == 6)
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
        // End:0xf9
        if(PainTimer == none)
        {
            PainTimer = Spawn(class'VolumeTimer', self);
            PainTimer.TimerRate = 0.10;
        }
    }
    // End:0x1d1
    else
    {
        // End:0x166
        if(Other.Base == none && Other.IsA('Emitter') && Other.Physics == 0)
        {
            Other.SetPhysics(6);
            Other.Velocity = ZoneVelocity;
        }
        // End:0x1d1
        else
        {
            // End:0x1d1
            if(Other.Physics == 2)
            {
                PendingTouch = Other.PendingTouch;
                Other.PendingTouch = self;
                // End:0x1d1
                if(PainTimer == none)
                {
                    PainTimer = Spawn(class'VolumeTimer', self);
                    PainTimer.TimerRate = 0.10;
                }
            }
        }
    }
}

defaultproperties
{
    bNoDecals=true
    RemoteRole=2
}