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
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1_1;
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
    fbTPOption=(X1=260.0000000,Y1=59.0000000,X2=763.0000000,Y2=664.0000000)
    fbBackgroundImage=(X1=260.0000000,Y1=83.0000000,X2=764.0000000,Y2=708.0000000)
    fbBottomLine=(X1=262.0000000,Y1=663.0000000,X2=762.0000000,Y2=706.0000000)
    fbButtonOK=(X1=388.0000000,Y1=669.0000000,X2=508.0000000,Y2=702.0000000)
    fbButtonCancel=(X1=512.0000000,Y1=669.0000000,X2=632.0000000,Y2=702.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}