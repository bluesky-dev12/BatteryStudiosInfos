/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowOptionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:6
 *
 *******************************************************************************/
class BTWindowOptionHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strUIChangeOption;
var localized string strReset;
var localized string strVoiceLangChangeMsg;
var localized string strAnd;
var FloatBox fbButtonReset;
var export editinline BTOwnerDrawCaptionButtonHK ButtonReset;
var FloatBox fbTPOption;
var export editinline BTTPOptionHK TPOption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    UnresolvedNativeFunction_97("[BTWindowOptionHK::InitComponent]");
    Log("[BTWindowOptionHK::InitComponent]");
    Controller.LogMenuStack();
    TPOption = BTTPOptionHK(NewComponent(new class'BTTPOptionHK', fbTPOption));
    TopLine.SetVisibility(false);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Option_Panel_BG;
    ButtonReset = NewButtonComponent(fbButtonReset);
    ButtonReset.SetDefaultOptionInitButtonImage();
    ButtonReset.Caption = strReset;
    ButtonReset.SetFontSizeAll(9);
    ButtonReset.__OnClick__Delegate = ButtonReset_OnClick;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonOK.SetFontSizeAll(9);
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    ButtonCancel.SetFontSizeAll(9);
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local PlayerController PC;
    local bool isShowLangChangeMsg;
    local wMatchMaker MM;

    UnresolvedNativeFunction_97("[BTWindowOptionHK::ButtonOK_OnClick]");
    Log("[BTWindowOptionHK::ButtonOK_OnClick]");
    PC = PlayerOwner();
    TPOption.SaveData();
    // End:0x83
    if(PC != none)
    {
        PC.UpdateOption();
    }
    MM = PC.Level.GetMatchMaker();
    // End:0xcf
    if(MM != none && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    // End:0x379
    if(TPOption.TPGraphic.bInGameResolutionChanged || TPOption.TPETC.bVoiceLangChanged)
    {
        // End:0x15a
        if(TPOption.TPETC.bVoiceLangChanged == true && PC.Level.GetMatchMaker().InGamePlaying == true)
        {
            isShowLangChangeMsg = true;
        }
        // End:0x1d5
        else
        {
            // End:0x1cd
            if(TPOption.TPETC.bVoiceLangChanged == true && PC.Level.GetMatchMaker().InGamePlaying == false && TPOption.TPETC.bVoiceLangChanged == false)
            {
                isShowLangChangeMsg = false;
            }
            // End:0x1d5
            else
            {
                isShowLangChangeMsg = false;
            }
        }
        // End:0x242
        if(TPOption.TPGraphic.bInGameResolutionChanged == true && isShowLangChangeMsg == false)
        {
            class'BTWindowInfoHK'.static.ShowWindow(Controller, "", strUIChangeOption);
            BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;
        }
        // End:0x376
        else
        {
            // End:0x2af
            if(TPOption.TPGraphic.bInGameResolutionChanged == false && isShowLangChangeMsg == true)
            {
                class'BTWindowInfoHK'.static.ShowWindow(Controller, "", strVoiceLangChangeMsg);
                BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;
            }
            // End:0x376
            else
            {
                // End:0x32f
                if(TPOption.TPGraphic.bInGameResolutionChanged == true && isShowLangChangeMsg == true)
                {
                    class'BTWindowInfoHK'.static.ShowWindow(Controller, "", strUIChangeOption $ strAnd $ " " $ strVoiceLangChangeMsg);
                    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;
                }
                // End:0x376
                else
                {
                    // End:0x376
                    if(TPOption.TPGraphic.bInGameResolutionChanged == false && isShowLangChangeMsg == false)
                    {
                        Controller.TopPage().FadeOut(false, true);
                    }
                }
            }
        }
    }
    // End:0x456
    else
    {
        // End:0x43b
        if(PC.Level.GetMatchMaker().bIsOwner && PC.Level.GetMatchMaker().InGamePlaying && TPOption.TPGraphic.bChangeResolution || TPOption.TPGraphic.bChangeGraphicOption)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 70);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;
        }
        // End:0x456
        else
        {
            Controller.TopPage().FadeOut(false, true);
        }
    }
    return true;
}

function bool ButtonInUI_OnOK(GUIComponent Sender)
{
    UnresolvedNativeFunction_97("[BTWindowOptionHK::ButtonInUI_OnOK]");
    Log("[BTWindowOptionHK::ButtonInUI_OnOK]");
    Log("ButtonInUI_OnOK Window OnOK Start");
    Controller.CloseMenu(false);
    Controller.TopPage().FadeOut(false, true);
    Log("ButtonInUI_OnOK Window OnOK End");
    return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    UnresolvedNativeFunction_97("[BTWindowOptionHK::ButtonCancel_OnClick]");
    Log("[BTWindowOptionHK::ButtonCancel_OnClick]");
    TPOption.ResetData();
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool ButtonReset_OnClick(GUIComponent Sender)
{
    UnresolvedNativeFunction_97("[BTWindowOptionHK::ButtonReset_OnClick]");
    Log("[BTWindowOptionHK::ButtonReset_OnClick]");
    TPOption.DefaultResetData();
    return true;
}

function Default_FadedOut()
{
    local wMatchMaker MM;

    Log("### Graphic OPTION CHANGE !!!! END !!!! ####");
    MM = PlayerOwner().Level.GetMatchMaker();
    // End:0x91
    if(MM != none && MM.InGamePlaying && MM.bChangingHost == false)
    {
        MM.SetTcpTimeOutInGame();
    }
    Controller.CloseMenuPage(self);
}

defaultproperties
{
    strUIChangeOption="The new resolution will take effect during the next battle."
    strReset="Reset"
    strVoiceLangChangeMsg="The speech language cannot be changed in the middle of a game. The new language will take effect when the next game starts."
    strAnd="Also"
    fbButtonReset=(X1=324.0,Y1=625.0,X2=448.0,Y2=662.0)
    fbTPOption=(X1=242.0,Y1=141.0,X2=760.0,Y2=605.0)
    fbBackgroundImage=(X1=237.0,Y1=77.0,X2=786.0,Y2=677.0)
    fbButtonOK=(X1=450.0,Y1=625.0,X2=574.0,Y2=662.0)
    fbButtonCancel=(X1=576.0,Y1=625.0,X2=700.0,Y2=662.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    FadedOut=Default_FadedOut
}