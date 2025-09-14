class BTWindowStateHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bChangeText;
var FloatBox fbBackgroundImage2;
var() automated BTOwnerDrawImageHK LabelInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    LabelInfo.CaptionDrawType = 4;
    i = 0;
    J0x28:

    // End:0x55 [Loop If]
    if(i < 5)
    {
        LabelInfo.FontSize[i] = 10;
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_panel_small;
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    ButtonOK.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
    ButtonCancel.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    //return;    
}

function SetData(string Msg)
{
    LabelInfo.Caption = Msg;
    self.UpdateDefaultWindow();
    //return;    
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
    //return;    
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
    //return;    
}

static function ShowWindow(GUIController con, string Msg)
{
    con.OpenMenu("GUIWarfareControls.BTWindowStateHK");
    BTWindowStateHK(con.TopPage()).SetData(Msg);
    Log("[BTWindowStateHK::ShowWindow] Msg=" $ Msg);
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float HT, maxW;

    // End:0x142
    if(bChangeText)
    {
        C.BtrTextSize(LabelInfo.Caption, LabelInfo.FontSize[0], maxW, HT);
        maxW = (maxW / float(2)) - ((LabelInfo.AWinPos.X2 - LabelInfo.AWinPos.X1) / float(2));
        LabelInfo.AWinPos.X1 = LabelInfo.AWinPos.X1 - maxW;
        LabelInfo.AWinPos.X2 = LabelInfo.AWinPos.X2 + maxW;
        LabelInfo.ApplyAWinPos();
        fbBackgroundImage.X1 = LabelInfo.AWinPos.X1 - float(71);
        fbBackgroundImage.X2 = LabelInfo.AWinPos.X2 + float(71);
        UpdateDefaultWindow();
        bChangeText = false;
    }
    return TimeOutPreDraw(C);
    //return;    
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    return true;
    //return;    
}

defaultproperties
{
    fbBackgroundImage2=(X1=0.0000000,Y1=53.0000000,X2=1024.0000000,Y2=156.0000000)
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowStateHK.mLabelInfo'
    begin object name="mLabelInfo" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=276.0000000,Y1=369.0000000,X2=749.0000000,Y2=400.0000000)
        OnRendered=mLabelInfo.Internal_OnRendered
    end object
    LabelInfo=mLabelInfo
    fbBackgroundImage=(X1=0.0000000,Y1=329.0000000,X2=1024.0000000,Y2=439.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=759.0000000,Y2=350.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=759.0000000,Y2=444.0000000)
    fbButtonOK=(X1=452.0000000,Y1=407.0000000,X2=570.0000000,Y2=438.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
    OnPreDraw=BTWindowStateHK.Internal_OnPreDraw
    OnKeyEvent=BTWindowStateHK.Internal_OnKeyEvent
}