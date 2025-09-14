/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelTestHK2.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BTLabelTestHK2 extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

function Internal_OnRendered(Canvas C)
{
    local Color Col;
    local int i;

    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.butt_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    C.DrawColor = C.MakeColor(byte(255), 200, 200, 200);
    Col = C.MakeColor(50, 50, 100, 200);
    class'BTCustomDrawHK'.static.DrawString(C, "ABCDEFGhijk12345^&*([}", 1, 15.0, AWinPos.X1, AWinPos.Y1 + float(30), AWinPos.X2, AWinPos.Y2, Col, 0, true);
    i = 0;
    J0xfe:
    // End:0x194 [While If]
    if(i <= 11)
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(i) @ "ABCDEFGhijk12345^&*([}", 1, 15.0, AWinPos.X1, AWinPos.Y1 + float(30 * i + 2), AWinPos.X2, AWinPos.Y2, Col, i, false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xfe;
    }
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}