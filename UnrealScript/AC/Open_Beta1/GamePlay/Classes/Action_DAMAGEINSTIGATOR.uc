class Action_DAMAGEINSTIGATOR extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) int Damage;
var(Action) Class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Pawn Damaged;

    Damaged = C.GetInstigator();
    Damaged.TakeDamage(Damage, Damaged, Damaged.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
    return false;
    //return;    
}

function string GetActionString()
{
    return (ActionString @ string(DamageType)) @ string(Damage);
    //return;    
}

defaultproperties
{
    Damage=10
    DamageType=Class'Engine.Crushed'
    ActionString="???? ????"
}