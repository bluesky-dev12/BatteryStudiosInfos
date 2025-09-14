class ACTION_Jump extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum JumpType
{
    JUMP_Normal,                    // 0
    JUMP_Double,                    // 1
    JUMP_DodgeLeft,                 // 2
    JUMP_DodgeRight                 // 3
};

var(Action) ACTION_Jump.JumpType JumpAction;

function bool InitActionFor(ScriptedController C)
{
    // End:0x16
    if(C.Pawn == none)
    {
        return false;
    }
    C.Pawn.SetPhysics(1);
    switch(JumpAction)
    {
        // End:0x55
        case 0:
            C.Pawn.DoJump(false);
            // End:0xDF
            break;
        // End:0x98
        case 1:
            C.Pawn.DoJump(false);
            C.bPendingDoubleJump = true;
            C.bNotifyApex = true;
            // End:0xDF
            break;
        // End:0xBA
        case 2:
            C.Pawn.Dodge(1);
            // End:0xDF
            break;
        // End:0xDC
        case 2:
            C.Pawn.Dodge(2);
            // End:0xDF
            break;
        // End:0xFFFF
        default:
            break;
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="??"
}