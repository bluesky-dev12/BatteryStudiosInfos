class FearSpot extends AvoidMarker;

var() bool bInitiallyActive;

function Touch(Actor Other)
{
    // End:0x54
    if((bInitiallyActive && Pawn(Other) != none) && Pawn(Other).Controller != none)
    {
        Pawn(Other).Controller.FearThisSpot(self);
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bInitiallyActive = !bInitiallyActive;
    //return;    
}

defaultproperties
{
    CollisionRadius=200.0000000
}