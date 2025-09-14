class BTWindowSelfIntroductionChangeHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[2];
var() automated FloatBox fbLabel[2];
var export editinline BTOwnerDrawImageHK Label[2];
var export editinline BTMultiLineEditBoxHK SelfIntroduction;

function SetData(string SelfIntro)
{
    self.SelfIntroduction.SetText(SelfIntro);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x8F [Loop If]
    if(i < 2)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Label[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    Label[1].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[1].SetFontSizeAll(8);
    SelfIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbLabel[0], -4, -6)));
    SelfIntroduction.SetVisibleLineCount(7);
    SelfIntroduction.MaxTextStrNum = 100;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[1]="- Self Intro can only be seen by your clan members."
    fbLabel[0]=(X1=273.0000000,Y1=302.0000000,X2=752.0000000,Y2=432.0000000)
    fbLabel[1]=(X1=273.0000000,Y1=438.0000000,X2=760.0000000,Y2=500.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=248.0000000,X2=780.0000000,Y2=520.0000000)
    fbTopLine=(X1=265.0000000,Y1=268.0000000,X2=760.0000000,Y2=295.0000000)
    fbBottomLine=(X1=265.0000000,Y1=456.0000000,X2=760.0000000,Y2=500.0000000)
    fbButtonOK=(X1=391.0000000,Y1=462.0000000,X2=511.0000000,Y2=495.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=462.0000000,X2=634.0000000,Y2=495.0000000)
    strTitle="Change Intro"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowSelfIntroductionChangeHK.Internal_OnOpen
}