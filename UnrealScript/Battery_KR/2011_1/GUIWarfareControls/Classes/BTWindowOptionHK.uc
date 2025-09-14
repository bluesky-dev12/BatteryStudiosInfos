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
    __NFUN_270__("[BTWindowOptionHK::InitComponent]");
    Log("[BTWindowOptionHK::InitComponent]");
    Controller.LogMenuStack();
    TPOption = BTTPOptionHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionHK', fbTPOption));
    TopLine.SetVisibility(false);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1_1;
    ButtonReset = NewButtonComponent(fbButtonReset);
    ButtonReset.SetDefaultButtonImage();
    ButtonReset.SetDefaultFontColor();
    ButtonReset.Caption = strReset;
    ButtonReset.__OnClick__Delegate = ButtonReset_OnClick;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local PlayerController PC;
    local bool isShowLangChangeMsg;
    local wMatchMaker MM;

    __NFUN_270__("[BTWindowOptionHK::ButtonOK_OnClick]");
    Log("[BTWindowOptionHK::ButtonOK_OnClick]");
    PC = PlayerOwner();
    TPOption.SaveData();
    // End:0x83
    if(PC != none)
    {
        PC.UpdateOption();
    }
    MM = PC.Level.GetMatchMaker();
    // End:0xCF
    if((MM != none) && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    // End:0x379
    if(TPOption.TPGraphic.bInGameResolutionChanged || TPOption.TPETC.bVoiceLangChanged)
    {
        // End:0x15A
        if((TPOption.TPETC.bVoiceLangChanged == true) && PC.Level.GetMatchMaker().InGamePlaying == true)
        {
            isShowLangChangeMsg = true;            
        }
        else
        {
            // End:0x1CD
            if(((TPOption.TPETC.bVoiceLangChanged == true) && PC.Level.GetMatchMaker().InGamePlaying == false) && TPOption.TPETC.bVoiceLangChanged == false)
            {
                isShowLangChangeMsg = false;                
            }
            else
            {
                isShowLangChangeMsg = false;
            }
        }
        // End:0x242
        if((TPOption.TPGraphic.bInGameResolutionChanged == true) && isShowLangChangeMsg == false)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowInfoHK'.static.ShowWindow(Controller, "", strUIChangeOption);
            BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;            
        }
        else
        {
            // End:0x2AF
            if((TPOption.TPGraphic.bInGameResolutionChanged == false) && isShowLangChangeMsg == true)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowInfoHK'.static.ShowWindow(Controller, "", strVoiceLangChangeMsg);
                BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;                
            }
            else
            {
                // End:0x32F
                if((TPOption.TPGraphic.bInGameResolutionChanged == true) && isShowLangChangeMsg == true)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowInfoHK'.static.ShowWindow(Controller, "", ((strUIChangeOption $ strAnd) $ " ") $ strVoiceLangChangeMsg);
                    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;                    
                }
                else
                {
                    // End:0x376
                    if((TPOption.TPGraphic.bInGameResolutionChanged == false) && isShowLangChangeMsg == false)
                    {
                        Controller.TopPage().FadeOut(false, true);
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x43B
        if((PC.Level.GetMatchMaker().bIsOwner && PC.Level.GetMatchMaker().InGamePlaying) && TPOption.TPGraphic.bChangeResolution || TPOption.TPGraphic.bChangeGraphicOption)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 70);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = ButtonInUI_OnOK;            
        }
        else
        {
            Controller.TopPage().FadeOut(false, true);
        }
    }
    return true;
    //return;    
}

function bool ButtonInUI_OnOK(GUIComponent Sender)
{
    __NFUN_270__("[BTWindowOptionHK::ButtonInUI_OnOK]");
    Log("[BTWindowOptionHK::ButtonInUI_OnOK]");
    Log("ButtonInUI_OnOK Window OnOK Start");
    Controller.CloseMenu(false);
    Controller.TopPage().FadeOut(false, true);
    Log("ButtonInUI_OnOK Window OnOK End");
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    __NFUN_270__("[BTWindowOptionHK::ButtonCancel_OnClick]");
    Log("[BTWindowOptionHK::ButtonCancel_OnClick]");
    TPOption.ResetData();
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool ButtonReset_OnClick(GUIComponent Sender)
{
    __NFUN_270__("[BTWindowOptionHK::ButtonReset_OnClick]");
    Log("[BTWindowOptionHK::ButtonReset_OnClick]");
    TPOption.DefaultResetData();
    return true;
    //return;    
}

function Default_FadedOut()
{
    local wMatchMaker MM;

    Log("### Graphic OPTION CHANGE !!!! END !!!! ####");
    MM = PlayerOwner().Level.GetMatchMaker();
    // End:0x91
    if(((MM != none) && MM.InGamePlaying) && MM.bChangingHost == false)
    {
        MM.SetTcpTimeOutInGame();
    }
    Controller.CloseMenuPage(self);
    //return;    
}

defaultproperties
{
    strUIChangeOption="??? ???? ????? ?????."
    strReset="???"
    strVoiceLangChangeMsg="?? ??? ?? ?? ??? ??????. ?? ??? ??? ? ?????."
    strAnd="??"
    fbButtonReset=(X1=328.0000000,Y1=669.0000000,X2=448.0000000,Y2=702.0000000)
    fbTPOption=(X1=260.0000000,Y1=59.0000000,X2=763.0000000,Y2=664.0000000)
    fbBackgroundImage=(X1=260.0000000,Y1=83.0000000,X2=764.0000000,Y2=708.0000000)
    fbBottomLine=(X1=262.0000000,Y1=663.0000000,X2=762.0000000,Y2=706.0000000)
    fbButtonOK=(X1=452.0000000,Y1=669.0000000,X2=572.0000000,Y2=702.0000000)
    fbButtonCancel=(X1=576.0000000,Y1=669.0000000,X2=695.0000000,Y2=702.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    FadedOut=BTWindowOptionHK.Default_FadedOut
}