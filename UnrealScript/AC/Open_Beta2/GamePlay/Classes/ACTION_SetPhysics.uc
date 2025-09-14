class ACTION_SetPhysics extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Actor.EPhysics NewPhysicsMode;

function bool InitActionFor(ScriptedController C)
{
    C.GetInstigator().SetPhysics(NewPhysicsMode);
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(NewPhysicsMode);
    //return;    
}

defaultproperties
{
    ActionString="Physics? ???? ????? "
}