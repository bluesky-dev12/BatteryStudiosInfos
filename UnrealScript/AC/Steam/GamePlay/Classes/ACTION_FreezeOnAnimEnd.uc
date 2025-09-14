/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_FreezeOnAnimEnd.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class ACTION_FreezeOnAnimEnd extends Action_PLAYANIM
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    C.CurrentAnimation = self;
    return true;
}

function SetCurrentAnimationFor(ScriptedController C)
{
    C.CurrentAnimation = self;
}

function bool PawnPlayBaseAnim(ScriptedController C, bool bFirstPlay)
{
    // End:0x5d
    if(C.Pawn != none)
    {
        C.Pawn.bPhysicsAnimUpdate = false;
        C.Pawn.StopAnimating();
        C.Pawn.SetPhysics(0);
    }
    return true;
}
