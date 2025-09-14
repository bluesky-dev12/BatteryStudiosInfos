class AnimNotify_EjectShell_Recham extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local Pawn P;

    P = Pawn(Owner);
    // End:0x1D
    if(P == none)
    {
        return;
    }
    P.MakeShellEffect_Rechamber();
    //return;    
}
