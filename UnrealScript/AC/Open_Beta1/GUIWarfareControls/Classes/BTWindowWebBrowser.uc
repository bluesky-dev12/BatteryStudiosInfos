class BTWindowWebBrowser extends BTWindowHK
    editinlinenew
    instanced;

var localized string strClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.BillingPopup_Deco_Img;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonOK.Caption = strClose;
    ButtonOK.SetFontSizeAll(9);
    ButtonCancel.SetEnabled(false);
    TopLine.CaptionDrawType = 4;
    TopLine.BackgroundImage.Image = none;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.CloseWeb("");
    return OnOK(self);
    //return;    
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
    //return;    
}

function OpenWeb(string openURL, int Left, int Top, int Right, int Bottom)
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.super(BTWindowWebBrowser).OpenWeb(openURL, Left, Top, Right, Bottom);
    //return;    
}

function bool AllowOpen(string MenuClass)
{
    return false;
    //return;    
}

defaultproperties
{
    strClose="Close"
    fbBackgroundImage=(X1=21.0000000,Y1=79.0000000,X2=1003.0000000,Y2=681.0000000)
    fbTopLine=(X1=363.0000000,Y1=85.0000000,X2=662.0000000,Y2=100.0000000)
    fbButtonOK=(X1=450.0000000,Y1=628.0000000,X2=574.0000000,Y2=665.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseTranslate=false
    FadedOut=BTWindowWebBrowser.Default_FadedOut
}