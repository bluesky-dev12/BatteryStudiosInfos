/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_USE.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Action_USE extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

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
    // End:0xb1
    foreach C.Pawn.VisibleCollidingActors(class'Vehicle', DrivenVehicle, 500.0)
    {
        DrivenVehicle.UsedBy(C.Pawn);
        C.bChangingPawns = false;        
    }
    return false;        
    // End:0xf2
    foreach C.Pawn.TouchingActors(class'Actor', A)
    {
        A.UsedBy(C.Pawn);                
    }
    // End:0x13f
    if(C.Pawn.Base != none)
    {
        C.Pawn.Base.UsedBy(C.Pawn);
    }
    C.bChangingPawns = false;
    return false;
}
