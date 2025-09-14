/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\AnimNotify_EjectShell_Recham.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_EjectShell_Recham extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

simulated event Notify(Actor Owner)
{
    local Pawn P;

    P = Pawn(Owner);
    // End:0x1d
    if(P == none)
    {
        return;
    }
    P.MakeShellEffect_Rechamber();
}
