/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTChatEditBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTChatEditBoxHK extends BTEditBoxHK
    editinlinenew
    instanced;

function bool CheckKeyInputCondition(string st)
{
    // End:0x20
    if(Asc(st) == 8 || Asc(st) == 27)
    {
        return true;
    }
    return false;
}

function bool CheckPastedTextCondition(string Text)
{
    return false;
}
