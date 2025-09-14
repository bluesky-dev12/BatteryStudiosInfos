class ACTION_Freeze extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    // End:0x5D
    if(C.Pawn != none)
    {
        C.Pawn.bPhysicsAnimUpdate = false;
        C.Pawn.StopAnimating();
        C.Pawn.SetPhysics(0);
    }
    C.CurrentAction = self;
    return true;
    //return;    
}

defaultproperties
{
    ActionString="??"
}