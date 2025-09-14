class BTTPTwoColumnLabelHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawTextArrayHK Label[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super.InitComponent(MyController, myOwner);
    Label[0] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    Label[1] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
    //return;    
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    Label[0].AWinPos = AWinPos;
    Label[0].AWinPos.X2 = float(halfwidth - 5);
    Label[0].ApplyAWinPos();
    Label[1].AWinPos = AWinPos;
    Label[1].AWinPos.X1 = float(halfwidth + 5);
    Label[1].ApplyAWinPos();
    //return;    
}
