class BTWindowClanMenuHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strOK2;
var localized string strLabel;
var localized string strLabelHelp[3];
var() automated FloatBox fbLabel;
var() automated FloatBox fbLabelHelp[3];
var export editinline BTOwnerDrawImageHK Label;
var export editinline BTOwnerDrawImageHK LabelHelp[3];
var() automated FloatBox fbButtonCreateClan;
var() automated FloatBox fbButtonFindClan;
var localized string strButtonCreateClan;
var localized string strButtonFindClan;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCreateClan;
var export editinline BTOwnerDrawCaptionButtonHK ButtonFindClan;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    LabelHelp[0] = NewLabelComponent(fbLabelHelp[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelHelp[0].SetFontSizeAll(9);
    LabelHelp[0].CaptionDrawType = 0;
    LabelHelp[0].Caption = strLabelHelp[0];
    LabelHelp[1] = NewLabelComponent(fbLabelHelp[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelHelp[1].SetFontSizeAll(9);
    LabelHelp[1].CaptionDrawType = 0;
    LabelHelp[1].Caption = strLabelHelp[1];
    LabelHelp[2] = NewLabelComponent(fbLabelHelp[2], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelHelp[2].SetFontSizeAll(9);
    LabelHelp[2].CaptionDrawType = 0;
    LabelHelp[2].Caption = strLabelHelp[2];
    ButtonCreateClan = NewButtonComponent(fbButtonCreateClan);
    ButtonCreateClan.SetDefaultButtonImage();
    ButtonCreateClan.Caption = strButtonCreateClan;
    ButtonFindClan = NewButtonComponent(fbButtonFindClan);
    ButtonFindClan.SetDefaultButtonImage();
    ButtonFindClan.Caption = strButtonFindClan;
    ButtonFindClan.__OnClick__Delegate = ButtonFindClan_OnClick;
    ButtonOK.SetDefaultFontColor();
    ButtonCancel.SetDefaultFontColor();
    ButtonCreateClan.SetDefaultFontColor();
    ButtonFindClan.SetDefaultFontColor();
    ButtonOK.SetFontSizeAll(ButtonFindClan.FontSize[0]);
    ButtonCancel.SetFontSizeAll(ButtonFindClan.FontSize[0]);
    //return;    
}

function bool ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    return true;
    //return;    
}

function bool ButtonFindClan_OnClick(GUIComponent Sender)
{
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    return true;
    //return;    
}

function SetClanLookingFor(bool bLookFor)
{
    // End:0x20
    if(bLookFor)
    {
        ButtonOK.Caption = strOK2;        
    }
    else
    {
        ButtonOK.Caption = strOK;
    }
    //return;    
}

function bool OnOK(GUIComponent Sender)
{
    return true;
    //return;    
}

defaultproperties
{
    strOK2="?? ??"
    strLabel="??? ???? ?? ????."
    strLabelHelp[0]="- ??? ??? ?? ?? ?? ???? ???? ?????."
    strLabelHelp[1]="- ???? ?? ??? ?? ? ???? ?? ????? ? ? ??? ?? ? ????."
    strLabelHelp[2]="- ???? ? ???? ?? ???? ?????? ? ? ??? ?? ? ????."
    fbLabel=(X1=275.0000000,Y1=335.0000000,X2=760.0000000,Y2=411.0000000)
    fbLabelHelp[0]=(X1=275.0000000,Y1=366.0000000,X2=760.0000000,Y2=411.0000000)
    fbLabelHelp[1]=(X1=275.0000000,Y1=386.0000000,X2=760.0000000,Y2=411.0000000)
    fbLabelHelp[2]=(X1=275.0000000,Y1=406.0000000,X2=760.0000000,Y2=411.0000000)
    fbButtonCreateClan=(X1=271.0000000,Y1=438.0000000,X2=389.0000000,Y2=471.0000000)
    fbButtonFindClan=(X1=393.0000000,Y1=438.0000000,X2=511.0000000,Y2=471.0000000)
    strButtonCreateClan="?? ???"
    strButtonFindClan="?? ??"
    fbBackgroundImage=(X1=245.0000000,Y1=270.0000000,X2=780.0000000,Y2=496.0000000)
    fbTopLine=(X1=265.0000000,Y1=290.0000000,X2=760.0000000,Y2=316.0000000)
    fbBottomLine=(X1=265.0000000,Y1=367.0000000,X2=760.0000000,Y2=411.0000000)
    fbButtonOK=(X1=515.0000000,Y1=438.0000000,X2=635.0000000,Y2=471.0000000)
    fbButtonCancel=(X1=637.0000000,Y1=438.0000000,X2=760.0000000,Y2=471.0000000)
    strTitle="??"
    strOK="?? ??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}