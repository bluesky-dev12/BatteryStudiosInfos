class Action_KILLINSTIGATOR extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() Class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    C.GetInstigator().Died(none, DamageType, C.Instigator.Location);
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(DamageType);
    //return;    
}

defaultproperties
{
    DamageType=Class'Engine.Crushed'
    ActionString="???? ????"
}