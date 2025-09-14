class LandMine extends Triggers;

var() Vector ChuckVelocity;
var() Class<DamageType> DamageType;
var() Sound BlowupSound;

function Touch(Actor Other)
{
    // End:0x2B
    if(Pawn(Other) != none)
    {
        Other.PendingTouch = self;
        PendingTouch = Other;
    }
    //return;    
}

function PostTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x67
    if(P != none)
    {
        PlaySound(BlowupSound,, 3.0000000 * TransientSoundVolume);
        P.AddVelocity(ChuckVelocity);
        P.Died(none, DamageType, P.Location);
    }
    //return;    
}

defaultproperties
{
    ChuckVelocity=(X=0.0000000,Y=0.0000000,Z=1000.0000000)
    DamageType=Class'Engine.DamageType'
    CollisionRadius=100.0000000
    CollisionHeight=50.0000000
}