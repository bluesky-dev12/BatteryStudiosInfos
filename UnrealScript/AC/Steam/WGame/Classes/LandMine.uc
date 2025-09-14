/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\LandMine.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class LandMine extends Triggers;

var() Vector ChuckVelocity;
var() class<DamageType> DamageType;
var() Sound BlowupSound;

function Touch(Actor Other)
{
    // End:0x2b
    if(Pawn(Other) != none)
    {
        Other.PendingTouch = self;
        PendingTouch = Other;
    }
}

function PostTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x67
    if(P != none)
    {
        PlaySound(BlowupSound,, 3.0 * TransientSoundVolume);
        P.AddVelocity(ChuckVelocity);
        P.Died(none, DamageType, P.Location);
    }
}

defaultproperties
{
    ChuckVelocity=(X=0.0,Y=0.0,Z=1000.0)
    DamageType=Class'Engine.DamageType'
    CollisionRadius=100.0
    CollisionHeight=50.0
}