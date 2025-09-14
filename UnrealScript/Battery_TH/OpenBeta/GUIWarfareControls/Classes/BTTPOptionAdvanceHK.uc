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
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x1A2 [Loop If]
    if(i < 1)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AWinPos.X1 + float(100 * i)) + float(i), AWinPos.Y1, (AWinPos.X1 + float(100 * (i + 1))) + float(i), AWinPos.Y1 + float(24));
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetDefaultTabButtonImage();
        ButtonTab[i].SetDefaultTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1 + float(24), AWinPos.X2, AWinPos.Y2);
        // End:0x173
        if(i == 0)
        {
            TPGraphicAdvance = BTTPOptionGraphicAdvanceHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK', fb));
            TPPanel[i] = TPGraphicAdvance;
        }
        TabControl.BindTabButtonAndPanel(ButtonTab[i], TPPanel[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
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
    strButtonTab="???????????????"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPOptionAdvanceHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbButtonTab=(X1=260.0000000,Y1=59.0000000,X2=360.0000000,Y2=83.0000000)
    fbTPPanel=(X1=260.0000000,Y1=83.0000000,X2=763.0000000,Y2=664.0000000)
}