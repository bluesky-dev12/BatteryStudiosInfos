class Action_USE extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    local Actor A;
    local Vehicle DrivenVehicle;

    C.bChangingPawns = true;
    DrivenVehicle = Vehicle(C.Pawn);
    // End:0x58
    if(DrivenVehicle != none)
    {
        DrivenVehicle.KDriverLeave(false);
        C.bChangingPawns = false;
        return false;
    }
    // End:0xB1
    foreach C.Pawn.VisibleCollidingActors(Class'Engine.Vehicle', DrivenVehicle, 500.0000000)
    {
        DrivenVehicle.UsedBy(C.Pawn);
        C.bChangingPawns = false;        
        return false;        
    }    
    // End:0xF2
    foreach C.Pawn.TouchingActors(Class'Engine.Actor', A)
    {
        A.UsedBy(C.Pawn);        
    }    
    // End:0x13F
    if(C.Pawn.Base != none)
    {
        C.Pawn.Base.UsedBy(C.Pawn);
    }
    C.bChangingPawns = false;
    return false;
    //return;    
}
