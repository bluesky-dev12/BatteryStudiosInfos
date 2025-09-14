/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\KarmaBoostVolume.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class KarmaBoostVolume extends PhysicsVolume;

var() array< class<Actor> > AffectedClasses;
var() float EntryAngleFactor;
var() float BoostForce;
var() bool bBoostRelative;

simulated event Touch(Actor Other)
{
    local int i;

    super.Touch(Other);
    // End:0x63
    if(Other != none)
    {
        i = 0;
        J0x1d:
        // End:0x63 [While If]
        if(i < AffectedClasses.Length)
        {
            // End:0x59
            if(Other.Class == AffectedClasses[i])
            {
                TryBoost(Other);
            }
            // End:0x63
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1d;
            }
        }
    }
}

simulated event UnTouch(Actor Other)
{
    super.UnTouch(Other);
    Gravity = default.Gravity;
}

simulated function TryBoost(Actor Other)
{
    local float EntryAngle;

    EntryAngle = Normal(Other.Velocity) Dot vector(Rotation);
    // End:0x39
    if(EntryAngle > EntryAngleFactor)
    {
        ActivateBoost(Other);
    }
}

simulated function ActivateBoost(Actor Other)
{
    // End:0x30
    if(bBoostRelative)
    {
        Gravity = default.Gravity + BoostForce * Normal(Other.Velocity);
    }
    // End:0x4b
    else
    {
        Gravity = default.Gravity + BoostForce * vector(Rotation);
    }
}

defaultproperties
{
    EntryAngleFactor=0.70
    bDirectional=true
}