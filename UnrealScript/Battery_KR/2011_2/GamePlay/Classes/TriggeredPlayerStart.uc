class TriggeredPlayerStart extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force);

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
    //return;    
}

defaultproperties
{
    bStatic=false
}