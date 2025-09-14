class BTLabelTestHK2 extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

function Internal_OnRendered(Canvas C)
{
    local Color Col;
    local int i;

    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    C.DrawColor = C.MakeColor(byte(255), 200, 200, 200);
    Col = C.MakeColor(50, 50, 100, 200);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "ABCDEFGhijk12345^&*([}", 1, 15.0000000, AWinPos.X1, AWinPos.Y1 + float(30), AWinPos.X2, AWinPos.Y2, Col, 0, true);
    i = 0;
    J0xFE:

    // End:0x194 [Loop If]
    if(i <= 7)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(i) @ "ABCDEFGhijk12345^&*([}", 1, 15.0000000, AWinPos.X1, AWinPos.Y1 + float(30 * (i + 2)), AWinPos.X2, AWinPos.Y2, Col, i, false);
        i++;
        // [Loop Continue]
        goto J0xFE;
    }
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelTestHK2.Internal_OnRendered
}