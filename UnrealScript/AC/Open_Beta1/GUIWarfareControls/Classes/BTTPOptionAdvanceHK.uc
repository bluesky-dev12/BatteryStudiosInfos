class BTTPOptionAdvanceHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTab[2];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[2];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[2];
var export editinline BTTPOptionGraphicAdvanceHK TPGraphicAdvance;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ButtonTab[0] = NewButtonComponent(fbButtonTab[0]);
    ButtonTab[0].SetDefaultTabButtonImage();
    ButtonTab[0].SetDefaultTabButtonFontColor();
    ButtonTab[0].Caption = strButtonTab[0];
    TPGraphicAdvance = BTTPOptionGraphicAdvanceHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK', fb));
    TPPanel[0] = TPGraphicAdvance;
    TabControl.BindTabButtonAndPanel(ButtonTab[0], TPPanel[0]);
    TabControl.SetVisiblePanel(0);
    //return;    
}

function SaveData()
{
    TPGraphicAdvance.SaveData();
    //return;    
}

function ResetData()
{
    TPGraphicAdvance.ResetData();
    //return;    
}

defaultproperties
{
    strButtonTab="Advanced"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPOptionAdvanceHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbButtonTab=(X1=252.0000000,Y1=87.0000000,X2=355.0000000,Y2=115.0000000)
    fbTPPanel=(X1=260.0000000,Y1=83.0000000,X2=763.0000000,Y2=664.0000000)
}