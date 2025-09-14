/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_Jump.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_Jump extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

enum JumpType
{
    JUMP_Normal,
    JUMP_Double,
    JUMP_DodgeLeft,
    JUMP_DodgeRight
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
            // End:0xdf
            break;
        // End:0x98
        case 1:
            C.Pawn.DoJump(false);
            C.bPendingDoubleJump = true;
            C.bNotifyApex = true;
            // End:0xdf
            break;
        // End:0xba
        case 2:
            C.Pawn.Dodge(1);
            // End:0xdf
            break;
        // End:0xdc
        case 2:
            C.Pawn.Dodge(2);
            // End:0xdf
            break;
        // End:0xffff
        default:
            return false;
    }
}

defaultproperties
{
    ActionString="??"
}