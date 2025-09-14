/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowOptionAdvanceHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowOptionAdvanceHK extends BTWindowHK
    editinlinenew
    instanced;

var FloatBox fbTPOption;
var export editinline BTTPOptionAdvanceHK TPOption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    UnresolvedNativeFunction_97("[BTWindowOptionAdvanceHK::InitComponent]");
    Log("[BTWindowOptionAdvanceHK::InitComponent]");
    super.InitComponent(MyController, myOwner);
    TPOption = BTTPOptionAdvanceHK(NewComponent(new class'BTTPOptionAdvanceHK', fbTPOption));
    TopLine.SetVisibility(false);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Option_Panel_BG;
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    Controller.PushPage();
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local wMatchMaker MM;
    local PlayerController PC;

    UnresolvedNativeFunction_97("[BTWindowOptionAdvanceHK::ButtonOK_OnClick]");
    Log("[BTWindowOptionAdvanceHK::ButtonOK_OnClick]");
    TPOption.SaveData();
    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    // End:0xc3
    if(MM != none && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    FadeOut(false, true);
    return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    UnresolvedNativeFunction_97("[BTWindowOptionAdvanceHK::ButtonCancel_OnClick]");
    Log("[BTWindowOptionAdvanceHK::ButtonCancel_OnClick]");
    TPOption.ResetData();
    FadeOut(false, true);
    return true;
}

defaultproperties
{
    fbTPOption=(X1=242.0,Y1=141.0,X2=760.0,Y2=605.0)
    fbBackgroundImage=(X1=237.0,Y1=77.0,X2=786.0,Y2=677.0)
    fbButtonOK=(X1=387.0,Y1=625.0,X2=511.0,Y2=662.0)
    fbButtonCancel=(X1=513.0,Y1=625.0,X2=637.0,Y2=662.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}