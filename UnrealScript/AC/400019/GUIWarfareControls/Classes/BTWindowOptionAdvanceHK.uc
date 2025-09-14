class BTWindowOptionAdvanceHK extends BTWindowHK
    editinlinenew
    instanced;

var FloatBox fbTPOption;
var export editinline BTTPOptionAdvanceHK TPOption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    __NFUN_270__("[BTWindowOptionAdvanceHK::InitComponent]");
    Log("[BTWindowOptionAdvanceHK::InitComponent]");
    super.InitComponent(MyController, myOwner);
    TPOption = BTTPOptionAdvanceHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionAdvanceHK', fbTPOption));
    TopLine.SetVisibility(false);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Panel_BG;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    Controller.PushPage();
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local wMatchMaker MM;
    local PlayerController PC;

    __NFUN_270__("[BTWindowOptionAdvanceHK::ButtonOK_OnClick]");
    Log("[BTWindowOptionAdvanceHK::ButtonOK_OnClick]");
    TPOption.SaveData();
    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    // End:0xC3
    if((MM != none) && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    FadeOut(false, true);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    __NFUN_270__("[BTWindowOptionAdvanceHK::ButtonCancel_OnClick]");
    Log("[BTWindowOptionAdvanceHK::ButtonCancel_OnClick]");
    TPOption.ResetData();
    FadeOut(false, true);
    return true;
    //return;    
}

defaultproperties
{
    fbTPOption=(X1=242.0000000,Y1=141.0000000,X2=760.0000000,Y2=605.0000000)
    fbBackgroundImage=(X1=237.0000000,Y1=77.0000000,X2=786.0000000,Y2=677.0000000)
    fbButtonOK=(X1=387.0000000,Y1=625.0000000,X2=511.0000000,Y2=662.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=625.0000000,X2=637.0000000,Y2=662.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}