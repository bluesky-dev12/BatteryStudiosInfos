/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowRedeemCodes.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:8
 *
 *******************************************************************************/
class BTWindowRedeemCodes extends BTWindowHK
    editinlinenew
    instanced;

var FloatBox fbEditRedeemCodes[8];
var FloatBox fbLabelInfo[2];
var export editinline BTEditBoxHK EditRedeemCodes[8];
var export editinline BTOwnerDrawImageHK LabelInfo[2];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonPaste;
var FloatBox fbButtonPaste;
var localized string strRedeemCodeTitle;
var localized string strRedeemCodeInfo[2];
var localized string strPaste;
var delegate<deleSendCodes> __deleSendCodes__Delegate;

delegate deleSendCodes(string codes);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Coupon_Bg_Img;
    strTitle = strRedeemCodeTitle;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strTitle;
    TopLine.BackgroundImage.Image = none;
    TopLine.SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    LabelInfo[i].SetFontSizeAll(11);
    i = 0;
    J0xae:
    // End:0x161 [While If]
    if(i < 2)
    {
        LabelInfo[i] = NewLabelComponent(fbLabelInfo[i], class'BTUIResourcePoolHK'.default.empty);
        LabelInfo[i].SetFontColorAll(class'BTUIColorPoolHK'.static.newButtonN());
        LabelInfo[i].Caption = strRedeemCodeInfo[i];
        LabelInfo[i].CaptionDrawType = 4;
        LabelInfo[i].SetFontSizeAll(9);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xae;
    }
    i = 0;
    J0x168:
    // End:0x32d [While If]
    if(i < 8)
    {
        fbEditRedeemCodes[i] = class'BTCustomDrawHK'.static.MakeFloatBox(192.0 + float(i * 69), 344.0, 254.0 + float(i * 69), 359.0);
        fbEditRedeemCodes[i].X1 += float(6);
        fbEditRedeemCodes[i].Y1 += float(3);
        fbEditRedeemCodes[i].X2 -= float(6);
        fbEditRedeemCodes[i].Y2 -= float(3);
        EditRedeemCodes[i] = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fbEditRedeemCodes[i]));
        EditRedeemCodes[i].bgImg = class'BTUIResourcePoolHK'.default.Coupon_oversquare_Img;
        EditRedeemCodes[i].bUseAWinPos = true;
        EditRedeemCodes[i].MaxTextStrNum = 4;
        EditRedeemCodes[i].TabOrder = i;
        EditRedeemCodes[i].useCaps = true;
        EditRedeemCodes[i].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
        EditRedeemCodes[i].SetFontSizeAll(10);
        // End:0x323
        if(i < 7)
        {
            EditRedeemCodes[i].__OnMaxTextStrNum__Delegate = Internal_OnMaxTextStrNum;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x168;
    }
    EditRedeemCodes[0].FocusFirst(none);
    ButtonPaste = new class'BTOwnerDrawCaptionButtonHK';
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
    // End:0xe0
    if(blockDoubleTime.dummy_1_DO_NOT_USE != 0 || blockDoubleTime.dummy_2_DO_NOT_USE != 0)
    {
        tempObj = new class'Object';
        tempObj.BtrDoubleToBtrTime(blockDoubleTime, blockTime);
        blockMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(859, string(blockTime.Minute + 1));
        class'BTWindowErrorDefineHK'.static.ShowErrorMsg(con, blockMsg);
        bOpen = false;
    }
    // End:0x11f
    else
    {
        con.OpenMenu("GUIWarfareControls.BTWindowRedeemCodes");
        bOpen = true;
    }
    return bOpen;
}

function bool deleOnChat(GUIComponent Sender, string Text)
{
    SendCodes();
    return true;
}

function bool InternalOnOK(GUIComponent Sender)
{
    SendCodes();
    return true;
}

function SendCodes()
{
    local int codesLen, i;
    local string codes;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0x69 [While If]
    if(i < 8)
    {
        codes $= EditRedeemCodes[i].TextStr;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    codesLen = Len(codes);
    // End:0x9c
    if(codesLen >= 32)
    {
        deleSendCodes(codes);
        FadeOut(false, true);
    }
    // End:0xb5
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, 856);
    }
}

function Internal_OnMaxTextStrNum(GUIComponent Sender)
{
    NextControl(Sender);
}

function bool ButtonPaste_OnClick(GUIComponent Sender)
{
    local string strClipboard;
    local int i;

    strClipboard = PlayerOwner().PasteFromClipboard();
    i = 0;
    J0x1a:
    // End:0x57 [While If]
    if(i < 8)
    {
        EditRedeemCodes[i].SetText(Mid(strClipboard, i * 4, 4));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
    return true;
}

defaultproperties
{
    fbLabelInfo[0]=(X1=239.0,Y1=281.0,X2=786.0,Y2=294.0)
    fbLabelInfo[1]=(X1=239.0,Y1=297.0,X2=786.0,Y2=310.0)
    fbButtonPaste=(X1=748.0,Y1=338.0,X2=834.0,Y2=366.0)
    strRedeemCodeInfo[0]="To redeem your code,"
    strRedeemCodeInfo[1]="enter it in the fields below and click the [OK] button."
    strPaste="Paste"
    fbBackgroundImage=(X1=143.0,Y1=243.0,X2=881.0,Y2=445.0)
    fbTopLine=(X1=362.0,Y1=249.0,X2=662.0,Y2=264.0)
    fbButtonOK=(X1=387.0,Y1=392.0,X2=511.0,Y2=429.0)
    fbButtonCancel=(X1=513.0,Y1=392.0,X2=637.0,Y2=429.0)
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
}