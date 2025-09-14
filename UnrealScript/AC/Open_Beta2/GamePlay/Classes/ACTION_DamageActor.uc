class ACTION_DamageActor extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name DamageTag;
var(Action) int DamageAmount;
var(Action) Class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x71
    if(DamageTag != 'None')
    {
        // End:0x70
        foreach C.AllActors(Class'Engine.Actor', A, DamageTag)
        {
            A.TakeDamage(DamageAmount, C.Pawn, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);            
        }        
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}