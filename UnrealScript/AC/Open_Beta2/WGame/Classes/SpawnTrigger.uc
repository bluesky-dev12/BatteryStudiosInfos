class SpawnTrigger extends Triggers;

var() Class<Actor> SpawnClass;

event Trigger(Actor Other, Pawn EventInstigator)
{
    Spawn(SpawnClass,,, Location);
    //return;    
}

defaultproperties
{
    SpawnClass=Class'Engine.wC4Explosive'
}