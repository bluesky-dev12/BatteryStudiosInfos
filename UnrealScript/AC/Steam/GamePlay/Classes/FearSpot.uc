/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\FearSpot.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class FearSpot extends AvoidMarker;

var() bool bInitiallyActive;

function Touch(Actor Other)
{
    // End:0x54
    if(bInitiallyActive && Pawn(Other) != none && Pawn(Other).Controller != none)
    {
        Pawn(Other).Controller.FearThisSpot(self);
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bInitiallyActive = !bInitiallyActive;
}

defaultproperties
{
    CollisionRadius=200.0
}