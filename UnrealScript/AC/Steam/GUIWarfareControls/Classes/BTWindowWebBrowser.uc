/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowWebBrowser.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowWebBrowser extends BTWindowHK
    editinlinenew
    instanced;

var localized string strClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.BillingPopup_Deco_Img;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonOK.Caption = strClose;
    ButtonOK.SetFontSizeAll(9);
    ButtonCancel.SetEnabled(false);
    TopLine.CaptionDrawType = 4;
    TopLine.BackgroundImage.Image = none;
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.CloseWeb("");
    return OnOK(self);
}

static function OpenWebWindow(GUIController Controller, string openURL, int Left, int Top, int Right, int Bottom, optional string Title)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowWebBrowser");
    // End:0x91
    if(Title != "")
    {
        BTWindowWebBrowser(Controller.TopPage()).strTitle = Title;
        BTWindowWebBrowser(Controller.TopPage()).TopLine.Caption = Title;
    }
    BTWindowWebBrowser(Controller.TopPage()).OpenWeb(openURL, Left, Top, Right, Bottom);
}

function OpenWeb(string openURL, int Left, int Top, int Right, int Bottom)
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.super(BTWindowWebBrowser).OpenWeb(openURL, Left, Top, Right, Bottom);
}

function bool AllowOpen(string MenuClass)
{
    return false;
}

defaultproperties
{
    strClose="Close"
    fbBackgroundImage=(X1=21.0,Y1=79.0,X2=1003.0,Y2=681.0)
    fbTopLine=(X1=363.0,Y1=85.0,X2=662.0,Y2=100.0)
    fbButtonOK=(X1=450.0,Y1=628.0,X2=574.0,Y2=665.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseTranslate=true
    FadedOut=Default_FadedOut
}