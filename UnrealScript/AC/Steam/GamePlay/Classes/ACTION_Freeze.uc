/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_Freeze.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_Freeze extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    // End:0x5d
    if(C.Pawn != none)
    {
        C.Pawn.bPhysicsAnimUpdate = false;
        C.Pawn.StopAnimating();
        C.Pawn.SetPhysics(0);
    }
    C.CurrentAction = self;
    return true;
}

defaultproperties
{
    ActionString="??"
}