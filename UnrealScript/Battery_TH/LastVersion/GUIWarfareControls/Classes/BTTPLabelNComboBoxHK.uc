class BTTPLabelNComboBoxHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK Label;
var export editinline BTComboBoxHK ComboBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super(GUIPanel).InitComponent(MyController, myOwner);
    Label = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    Label.SetFontDrawType(3);
    ComboBox = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
    //return;    
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    Label.AWinPos = AWinPos;
    Label.AWinPos.X2 = float(halfwidth - 5);
    Label.ApplyAWinPos();
    ComboBox.AWinPos = AWinPos;
    ComboBox.AWinPos.X1 = float(halfwidth + 5);
    ComboBox.ApplyAWinPos();
    //return;    
}
