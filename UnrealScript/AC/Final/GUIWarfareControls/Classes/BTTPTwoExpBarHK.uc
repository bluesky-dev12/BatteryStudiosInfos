class BTTPTwoExpBarHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTExpBarHK expbar[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super.InitComponent(MyController, myOwner);
    expbar[0] = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    expbar[1] = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
    //return;    
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    expbar[0].AWinPos = AWinPos;
    expbar[0].AWinPos.X2 = float(halfwidth - 5);
    expbar[0].ApplyAWinPos();
    expbar[1].AWinPos = AWinPos;
    expbar[1].AWinPos.X1 = float(halfwidth + 5);
    expbar[1].ApplyAWinPos();
    //return;    
}
