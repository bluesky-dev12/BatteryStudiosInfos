class ACTION_HealActor extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name HealTag;
var(Action) int HealAmount;
var(Action) Class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x4D
    if(HealTag != 'None')
    {
        // End:0x4C
        foreach C.AllActors(Class'Engine.Actor', A, HealTag)
        {
            A.HealDamage(HealAmount, C, DamageType);            
        }        
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}