/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowClanMenuHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowClanMenuHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strOK2;
var localized string strLabel;
var localized string strLabelHelp[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelHelp[3];
var export editinline BTOwnerDrawImageHK Label;
var export editinline BTOwnerDrawImageHK LabelHelp[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonCreateClan;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonFindClan;
var localized string strButtonCreateClan;
var localized string strButtonFindClan;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCreateClan;
var export editinline BTOwnerDrawCaptionButtonHK ButtonFindClan;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, class'BTUIResourcePoolHK'.default.empty);
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    LabelHelp[0] = NewLabelComponent(fbLabelHelp[0], class'BTUIResourcePoolHK'.default.empty);
    LabelHelp[0].SetFontSizeAll(9);
    LabelHelp[0].CaptionDrawType = 0;
    LabelHelp[0].Caption = strLabelHelp[0];
    LabelHelp[1] = NewLabelComponent(fbLabelHelp[1], class'BTUIResourcePoolHK'.default.empty);
    LabelHelp[1].SetFontSizeAll(9);
    LabelHelp[1].CaptionDrawType = 0;
    LabelHelp[1].Caption = strLabelHelp[1];
    LabelHelp[2] = NewLabelComponent(fbLabelHelp[2], class'BTUIResourcePoolHK'.default.empty);
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
}

function bool ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    return true;
}

function bool ButtonFindClan_OnClick(GUIComponent Sender)
{
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    return true;
}

function SetClanLookingFor(bool bLookFor)
{
    // End:0x20
    if(bLookFor)
    {
        ButtonOK.Caption = strOK2;
    }
    // End:0x34
    else
    {
        ButtonOK.Caption = strOK;
    }
}

function bool OnOK(GUIComponent Sender)
{
    return true;
}

defaultproperties
{
    strOK2="Cancel Find Clan"
    strLabel="You are not in a clan."
    strLabelHelp[0]="- You gain more EXP and Points from battles just by joining a clan."
    strLabelHelp[1]="- Each clan member can earn bonus rewards by playing with the clan master or officers."
    strLabelHelp[2]="- The clan master and officers earn bonus rewards by playing with clan members."
    fbLabel=(X1=275.0,Y1=335.0,X2=760.0,Y2=411.0)
    fbLabelHelp[0]=(X1=275.0,Y1=366.0,X2=760.0,Y2=411.0)
    fbLabelHelp[1]=(X1=275.0,Y1=386.0,X2=760.0,Y2=411.0)
    fbLabelHelp[2]=(X1=275.0,Y1=406.0,X2=760.0,Y2=411.0)
    fbButtonCreateClan=(X1=271.0,Y1=438.0,X2=389.0,Y2=471.0)
    fbButtonFindClan=(X1=393.0,Y1=438.0,X2=511.0,Y2=471.0)
    strButtonCreateClan="Create Clan"
    strButtonFindClan="Clan Search"
    fbBackgroundImage=(X1=245.0,Y1=270.0,X2=780.0,Y2=496.0)
    fbTopLine=(X1=265.0,Y1=290.0,X2=760.0,Y2=316.0)
    fbBottomLine=(X1=265.0,Y1=367.0,X2=760.0,Y2=411.0)
    fbButtonOK=(X1=515.0,Y1=438.0,X2=635.0,Y2=471.0)
    fbButtonCancel=(X1=637.0,Y1=438.0,X2=760.0,Y2=471.0)
    strTitle="Clan"
    strOK="Find Clan"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}