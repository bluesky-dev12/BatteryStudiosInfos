class KarmaBoostVolume extends PhysicsVolume;

var() array< Class<Actor> > AffectedClasses;
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
        J0x1D:

        // End:0x63 [Loop If]
        if(i < AffectedClasses.Length)
        {
            // End:0x59
            if(Other.Class == AffectedClasses[i])
            {
                TryBoost(Other);
                // [Explicit Break]
                goto J0x63;
            }
            i++;
            // [Loop Continue]
            goto J0x1D;
        }
    }
    J0x63:

    //return;    
}

simulated event UnTouch(Actor Other)
{
    super.UnTouch(Other);
    Gravity = default.Gravity;
    //return;    
}

simulated function TryBoost(Actor Other)
{
    local float EntryAngle;

    EntryAngle = Normal(Other.Velocity) Dot Vector(Rotation);
    // End:0x39
    if(EntryAngle > EntryAngleFactor)
    {
        ActivateBoost(Other);
    }
    //return;    
}

simulated function ActivateBoost(Actor Other)
{
    // End:0x30
    if(bBoostRelative)
    {
        Gravity = default.Gravity + (BoostForce * Normal(Other.Velocity));        
    }
    else
    {
        Gravity = default.Gravity + (BoostForce * Vector(Rotation));
    }
    //return;    
}

defaultproperties
{
    EntryAngleFactor=0.7000000
    bDirectional=true
}