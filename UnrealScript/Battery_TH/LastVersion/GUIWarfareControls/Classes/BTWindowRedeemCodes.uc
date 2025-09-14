class BTWindowRedeemCodes extends BTWindowHK
    editinlinenew
    instanced;

var FloatBox fbEditRedeemCodes[8];
var FloatBox fbLabelInfo[2];
var export editinline BTEditBoxHK EditRedeemCodes[8];
var export editinline BTOwnerDrawImageHK LabelInfo[2];
var() automated BTOwnerDrawCaptionButtonHK ButtonPaste;
var FloatBox fbButtonPaste;
var localized string strRedeemCodeTitle;
var localized string strRedeemCodeInfo[2];
var localized string strPaste;
//var delegate<deleSendCodes> __deleSendCodes__Delegate;

delegate deleSendCodes(string codes)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Coupon_Bg_Img;
    strTitle = strRedeemCodeTitle;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strTitle;
    TopLine.BackgroundImage.Image = none;
    TopLine.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    LabelInfo[i].SetFontSizeAll(11);
    i = 0;
    J0xAE:

    // End:0x161 [Loop If]
    if(i < 2)
    {
        LabelInfo[i] = NewLabelComponent(fbLabelInfo[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelInfo[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN());
        LabelInfo[i].Caption = strRedeemCodeInfo[i];
        LabelInfo[i].CaptionDrawType = 4;
        LabelInfo[i].SetFontSizeAll(9);
        ++i;
        // [Loop Continue]
        goto J0xAE;
    }
    i = 0;
    J0x168:

    // End:0x32D [Loop If]
    if(i < 8)
    {
        fbEditRedeemCodes[i] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(192.0000000 + float(i * 69), 344.0000000, 254.0000000 + float(i * 69), 359.0000000);
        fbEditRedeemCodes[i].X1 += float(6);
        fbEditRedeemCodes[i].Y1 += float(3);
        fbEditRedeemCodes[i].X2 -= float(6);
        fbEditRedeemCodes[i].Y2 -= float(3);
        EditRedeemCodes[i] = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fbEditRedeemCodes[i]));
        EditRedeemCodes[i].bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Coupon_oversquare_Img;
        EditRedeemCodes[i].bUseAWinPos = true;
        EditRedeemCodes[i].MaxTextStrNum = 4;
        EditRedeemCodes[i].TabOrder = i;
        EditRedeemCodes[i].useCaps = true;
        EditRedeemCodes[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
        EditRedeemCodes[i].SetFontSizeAll(10);
        // End:0x323
        if(i < 7)
        {
            EditRedeemCodes[i].__OnMaxTextStrNum__Delegate = Internal_OnMaxTextStrNum;
        }
        ++i;
        // [Loop Continue]
        goto J0x168;
    }
    EditRedeemCodes[0].FocusFirst(none);
    ButtonPaste = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonPaste.bUseAWinPos = true;
    ButtonPaste.AWinPos = fbButtonPaste;
    ButtonPaste.ApplyAWinPos();
    ButtonPaste.Caption = strPaste;
    ButtonPaste.SetDefaultButtonImage();
    ButtonPaste.SetDefaultFontColor();
    ButtonPaste.SetFontSizeAll(8);
    ButtonPaste.CaptionDrawType = 4;
    ButtonPaste.Caption = strPaste;
    ButtonPaste.__OnClick__Delegate = ButtonPaste_OnClick;
    ButtonPaste.OnClickSound = 0;
    ButtonPaste.InitComponent(MyController, self);
    AppendComponent(ButtonPaste);
    ButtonOK.bTabStop = false;
    ButtonCancel.bTabStop = false;
    self.__OnOK__Delegate = InternalOnOK;
    //return;    
}

static function bool ShowWindowRedeemCodes(GUIController con)
{
    local BtrDouble blockDoubleTime;
    local BtrTime blockTime;
    local wGameManager GameMgr;
    local bool bOpen;
    local string blockMsg;
    local Object tempObj;

    GameMgr = con.ViewportOwner.Actor.Level.GameMgr;
    blockDoubleTime = GameMgr.GetLeftEventTime(1020);
    // End:0xE0
    if((blockDoubleTime.dummy_1_DO_NOT_USE != 0) || blockDoubleTime.dummy_2_DO_NOT_USE != 0)
    {
        tempObj = new Class'Core.Object';
        tempObj.BtrDoubleToBtrTime(blockDoubleTime, blockTime);
        blockMsg = Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.GetFormatString(859, string(blockTime.Minute + 1));
        Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowErrorMsg(con, blockMsg);
        bOpen = false;        
    }
    else
    {
        con.OpenMenu("GUIWarfareControls.BTWindowRedeemCodes");
        bOpen = true;
    }
    return bOpen;
    //return;    
}

function bool deleOnChat(GUIComponent Sender, string Text)
{
    SendCodes();
    return true;
    //return;    
}

function bool InternalOnOK(GUIComponent Sender)
{
    SendCodes();
    return true;
    //return;    
}

function SendCodes()
{
    local int codesLen, i;
    local string codes;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0x69 [Loop If]
    if(i < 8)
    {
        codes $= EditRedeemCodes[i].TextStr;
        ++i;
        // [Loop Continue]
        goto J0x36;
    }
    codesLen = Len(codes);
    // End:0x9C
    if(codesLen >= 32)
    {
        deleSendCodes(codes);
        FadeOut(false, true);        
    }
    else
    {
        Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 856);
    }
    //return;    
}

function Internal_OnMaxTextStrNum(GUIComponent Sender)
{
    NextControl(Sender);
    //return;    
}

function bool ButtonPaste_OnClick(GUIComponent Sender)
{
    local string strClipboard;
    local int i;

    strClipboard = PlayerOwner().PasteFromClipboard();
    i = 0;
    J0x1A:

    // End:0x57 [Loop If]
    if(i < 8)
    {
        EditRedeemCodes[i].SetText(Mid(strClipboard, i * 4, 4));
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    return true;
    //return;    
}

defaultproperties
{
    fbLabelInfo[0]=(X1=239.0000000,Y1=281.0000000,X2=786.0000000,Y2=294.0000000)
    fbLabelInfo[1]=(X1=239.0000000,Y1=297.0000000,X2=786.0000000,Y2=310.0000000)
    fbButtonPaste=(X1=748.0000000,Y1=338.0000000,X2=834.0000000,Y2=366.0000000)
    fbBackgroundImage=(X1=143.0000000,Y1=243.0000000,X2=881.0000000,Y2=445.0000000)
    fbTopLine=(X1=362.0000000,Y1=249.0000000,X2=662.0000000,Y2=264.0000000)
    fbButtonOK=(X1=387.0000000,Y1=392.0000000,X2=511.0000000,Y2=429.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=392.0000000,X2=637.0000000,Y2=429.0000000)
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
}