class BTTPTwoComboBoxHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTComboBoxHK ComboBox[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super(GUIPanel).InitComponent(MyController, myOwner);
    ComboBox[0] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ComboBox[1] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
    //return;    
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    ComboBox[0].AWinPos = AWinPos;
    ComboBox[0].AWinPos.X2 = float(halfwidth - 5);
    ComboBox[0].ApplyAWinPos();
    ComboBox[1].AWinPos = AWinPos;
    ComboBox[1].AWinPos.X1 = float(halfwidth + 5);
    ComboBox[1].ApplyAWinPos();
    //return;    
}
