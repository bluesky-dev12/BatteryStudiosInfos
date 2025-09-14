/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowSelfIntroductionChangeHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowSelfIntroductionChangeHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[2];
var export editinline BTOwnerDrawImageHK Label[2];
var export editinline BTMultiLineEditBoxHK SelfIntroduction;

function SetData(string SelfIntro)
{
    self.SelfIntroduction.SetText(SelfIntro);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x8f [While If]
    if(i < 2)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    Label[0].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    Label[1].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    Label[1].SetFontSizeAll(8);
    SelfIntroduction = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbLabel[0], -4, -6)));
    SelfIntroduction.SetVisibleLineCount(7);
    SelfIntroduction.MaxTextStrNum = 100;
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[1]="- Self Intro can only be seen by your clan members."
    fbLabel[0]=(X1=273.0,Y1=302.0,X2=752.0,Y2=432.0)
    fbLabel[1]=(X1=273.0,Y1=438.0,X2=760.0,Y2=500.0)
    fbBackgroundImage=(X1=245.0,Y1=248.0,X2=780.0,Y2=520.0)
    fbTopLine=(X1=265.0,Y1=268.0,X2=760.0,Y2=295.0)
    fbBottomLine=(X1=265.0,Y1=456.0,X2=760.0,Y2=500.0)
    fbButtonOK=(X1=391.0,Y1=462.0,X2=511.0,Y2=495.0)
    fbButtonCancel=(X1=515.0,Y1=462.0,X2=634.0,Y2=495.0)
    strTitle="Change Intro"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}