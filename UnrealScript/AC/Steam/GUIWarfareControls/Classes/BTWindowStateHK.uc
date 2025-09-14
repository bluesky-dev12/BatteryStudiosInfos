/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowStateHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:7
 *
 *******************************************************************************/
class BTWindowStateHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bChangeText;
var FloatBox fbBackgroundImage2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    LabelInfo.CaptionDrawType = 4;
    i = 0;
    J0x28:
    // End:0x55 [While If]
    if(i < 5)
    {
        LabelInfo.FontSize[i] = 10;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.img_panel_small;
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    ButtonOK.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
    ButtonCancel.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
}

function SetData(string Msg)
{
    LabelInfo.Caption = Msg;
    self.UpdateDefaultWindow();
}

function UpdateDefaultWindow()
{
    BackgroundImage.AWinPos = fbBackgroundImage;
    TopLine.AWinPos = fbTopLine;
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    BackgroundImage.ApplyAWinPos();
    TopLine.ApplyAWinPos();
    BottomLine.ApplyAWinPos();
    ButtonOK.ApplyAWinPos();
    ButtonCancel.ApplyAWinPos();
    TopLine.Caption = strTitle;
    ButtonOK.Caption = strOK;
    ButtonCancel.Caption = strCancel;
}

function UpdateRoomLobbyWindow()
{
    LabelInfo.AWinPos = fbBackgroundImage2;
    BackgroundImage.AWinPos = fbBackgroundImage2;
    TopLine.AWinPos = fbTopLine;
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    LabelInfo.ApplyAWinPos();
    BackgroundImage.ApplyAWinPos();
    TopLine.ApplyAWinPos();
    BottomLine.ApplyAWinPos();
    ButtonOK.ApplyAWinPos();
    ButtonCancel.ApplyAWinPos();
    TopLine.Caption = strTitle;
    ButtonOK.Caption = strOK;
    ButtonCancel.Caption = strCancel;
}

static function ShowWindow(GUIController con, string Msg)
{
    con.OpenMenu("GUIWarfareControls.BTWindowStateHK");
    BTWindowStateHK(con.TopPage()).SetData(Msg);
    Log("[BTWindowStateHK::ShowWindow] Msg=" $ Msg);
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float HT, maxW;

    // End:0x142
    if(bChangeText)
    {
        C.BtrTextSize(LabelInfo.Caption, LabelInfo.FontSize[0], maxW, HT);
        maxW = maxW / float(2) - LabelInfo.AWinPos.X2 - LabelInfo.AWinPos.X1 / float(2);
        LabelInfo.AWinPos.X1 = LabelInfo.AWinPos.X1 - maxW;
        LabelInfo.AWinPos.X2 = LabelInfo.AWinPos.X2 + maxW;
        LabelInfo.ApplyAWinPos();
        fbBackgroundImage.X1 = LabelInfo.AWinPos.X1 - float(71);
        fbBackgroundImage.X2 = LabelInfo.AWinPos.X2 + float(71);
        UpdateDefaultWindow();
        bChangeText = false;
    }
    return TimeOutPreDraw(C);
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    return true;
}

defaultproperties
{
    fbBackgroundImage2=(X1=0.0,Y1=53.0,X2=1024.0,Y2=156.0)
    begin object name=mLabelInfo class=BTOwnerDrawImageHK
        AWinPos=(X1=276.0,Y1=369.0,X2=749.0,Y2=400.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowStateHK.mLabelInfo'
    LabelInfo=mLabelInfo
    fbBackgroundImage=(X1=0.0,Y1=329.0,X2=1024.0,Y2=439.0)
    fbTopLine=(X1=265.0,Y1=324.0,X2=759.0,Y2=350.0)
    fbBottomLine=(X1=265.0,Y1=401.0,X2=759.0,Y2=444.0)
    fbButtonOK=(X1=452.0,Y1=407.0,X2=570.0,Y2=438.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
    OnPreDraw=Internal_OnPreDraw
    OnKeyEvent=Internal_OnKeyEvent
}