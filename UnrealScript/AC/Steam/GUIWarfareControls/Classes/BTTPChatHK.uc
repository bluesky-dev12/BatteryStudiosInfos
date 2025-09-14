/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPChatHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:22
 *	Functions:17
 *
 *******************************************************************************/
class BTTPChatHK extends BTTabPanelHK
    editinlinenew
    instanced;

struct ColoredChatText
{
    var int ChatPanel;
    var Color ChatColor;
    var string chatText;
};

var Canvas saveC;
var float StartAniTime;
var float StartAniTimeOffset;
var float SlideAniTime;
var bool bShowChatState;
var bool bShowAni;
var array<FloatBox> fbButtonChatStateArray;
var array<FloatBox> fbSnapShotButtonChatStateArray;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonChatStateArray;
var export editinline BTOwnerDrawCaptionButtonHK ButtonChatState;
var export editinline BTOwnerDrawImageHK BackgroundImage[2];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonChat;
var array<export editinline BTAutoScrollListHK> ASLChat;
var export editinline BTChatEditBoxHK InputBox;
var localized string strChatState[7];
var localized string strAll;
var localized string strWhisper;
var localized string strClan;
var array<ColoredChatText> ccText;
var delegate<ChangeTab_OnClick> __ChangeTab_OnClick__Delegate;
var delegate<OnChageChatMode> __OnChageChatMode__Delegate;

delegate ChangeTab_OnClick(int TabIndex);
delegate OnChageChatMode(int ChatMode);
function AddChatHistoryNoColor(int Panel, string Chat)
{
    // End:0x71
    if(saveC == none)
    {
        ccText.Length = ccText.Length + 1;
        ccText[ccText.Length - 1].ChatPanel = Panel;
        ccText[ccText.Length - 1].ChatColor = self.WhiteColor;
        ccText[ccText.Length - 1].chatText = Chat;
    }
    // End:0x90
    else
    {
        ASLChat[Panel].AddRow(saveC, Chat);
    }
}

function AddChatHistory(int Panel, string Chat, Color tcolor)
{
    // End:0x6c
    if(saveC == none)
    {
        ccText.Length = ccText.Length + 1;
        ccText[ccText.Length - 1].ChatPanel = Panel;
        ccText[ccText.Length - 1].ChatColor = tcolor;
        ccText[ccText.Length - 1].chatText = Chat;
    }
    // End:0x90
    else
    {
        ASLChat[Panel].AddRowColor(saveC, Chat, tcolor);
    }
}

function SetEditText(string Chat)
{
    InputBox.SetText(Chat);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoScrollListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    BackgroundImage[0] = NewLabelComponent(fb, class'BTUIResourcePoolHK'.default.panel_1);
    fb.X1 = AWinPos.X1 + float(2) + float(86);
    fb.Y1 = AWinPos.Y2 - float(24) - float(1);
    fb.X2 = AWinPos.X2 - float(3);
    fb.Y2 = AWinPos.Y2 - float(2) - float(2);
    BackgroundImage[1] = NewLabelComponent(fb, class'BTUIResourcePoolHK'.default.panel_2);
    i = 0;
    J0x130:
    // End:0x518 [While If]
    if(i < 2)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(99 * i) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = AWinPos.X1 + float(99 * i + 1) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.ButtonID = i;
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonChat[i] = serverButton;
        serverACL = new class'BTAutoScrollListHK';
        serverACL.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2) - float(3);
        fb.Y1 = AWinPos.Y1 + float(2) + float(23) + float(4);
        fb.X2 = AWinPos.X2 - float(2) - float(14) - float(1);
        fb.Y2 = AWinPos.Y2 - float(2) - float(25) - float(1);
        serverACL.AWinPos = fb;
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.50;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = AWinPos.X2 - float(2) - float(14);
        fb.Y1 = AWinPos.Y1 + float(2) + float(23);
        fb.X2 = AWinPos.X2 - float(2);
        fb.Y2 = AWinPos.Y2 - float(2) - float(25) - float(1);
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        ASLChat[i] = serverACL;
        ASLChat[i].SelectImage.Image = none;
        TabControl.BindTabButtonAndPanel(ButtonChat[i], ASLChat[i]);
        ButtonChat[i].__OnClick__Delegate = ButttonChat_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x130;
    }
    fb.X1 = AWinPos.X1 + float(2) + float(86) + float(5);
    fb.Y1 = AWinPos.Y2 - float(2) - float(25) + float(4);
    fb.X2 = AWinPos.X2 - float(4);
    fb.Y2 = AWinPos.Y2 - float(2) - float(1);
    InputBox = BTChatEditBoxHK(NewComponent(new class'BTChatEditBoxHK', fb));
    InputBox.bUseAWinPos = true;
    InputBox.bUseAWinPos = true;
    InputBox.bBoundToParent = false;
    InputBox.bScaleToParent = false;
    InputBox.ApplyAWinPos();
    InputBox.MaxTextStrNum = 255;
    InputBox.bLimitDrawSize = true;
    InputBox.LimitDrawWidth = 1815.0;
    ButtonChat[0].Caption = strAll;
    ButtonChat[1].Caption = strClan;
    TabControl.SetVisiblePanel(0);
    ButtonChatState = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(4), AWinPos.Y2 - float(25), AWinPos.X1 + float(4) + float(82), AWinPos.Y2 - float(4)), 0.990);
    i = 0;
    J0x6f2:
    // End:0x72b [While If]
    if(i < 5)
    {
        ButtonChatState.buttonImage[i] = class'BTUIResourcePoolHK'.default.img_chat;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6f2;
    }
    ButtonChatState.Caption = strAll;
    ButtonChatState.__OnClick__Delegate = ButtonChatState_OnClick;
    ButtonChatStateArray.Length = 2;
    fbButtonChatStateArray.Length = 2;
    fbSnapShotButtonChatStateArray.Length = 2;
    i = 0;
    J0x775:
    // End:0x926 [While If]
    if(i < 2)
    {
        ButtonChatStateArray[i] = NewButtonComponent(ButtonChatState.AWinPos, 0.950);
        ButtonChatStateArray[i].SetDefaultMButtonImage();
        ButtonChatStateArray[i].Caption = strChatState[i + 1];
        ButtonChatStateArray[i].ButtonID = i + 1;
        ButtonChatStateArray[i].__OnClick__Delegate = ButtonChatStateArray_OnClick;
        ButtonChatStateArray[i].SetVisibility(false);
        ButtonChatStateArray[i].bAcceptsInput = false;
        fbButtonChatStateArray[i] = ButtonChatState.AWinPos;
        fbButtonChatStateArray[i].Y1 = ButtonChatState.AWinPos.Y1 - ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1 + float(5) * float(i + 1);
        fbButtonChatStateArray[i].Y2 = ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y2 - ButtonChatState.AWinPos.Y1 + float(5) * float(i + 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x775;
    }
    ButtonChatStateArray[0].ButtonID = 1;
    ButtonChatStateArray[1].ButtonID = 2;
    ButtonChatStateArray[0].Caption = strChatState[1];
    ButtonChatStateArray[1].Caption = strChatState[2];
    ButtonChatStateArray[2].DisableMe();
    bShowChatState = false;
    FocusFirst(InputBox);
}

function bool ButttonChat_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TabControl.SetVisiblePanel(btn.ButtonID);
    ChangeTab_OnClick(btn.ButtonID);
    return true;
}

function bool ButtonChatStateArray_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    OnChageChatMode(btn.ButtonID);
    // End:0x31
    if(bShowChatState)
    {
    }
    ButtonChatState_OnClick(none);
    return true;
}

function bool ButtonChatState_OnClick(GUIComponent Sender)
{
    local int i;

    // End:0x14
    if(bShowChatState)
    {
        bShowChatState = false;
    }
    // End:0x1c
    else
    {
        bShowChatState = true;
    }
    // End:0x51
    if(bShowAni)
    {
        StartAniTimeOffset = StartAniTime + SlideAniTime - PlayerOwner().Level.TimeSeconds;
    }
    // End:0x5c
    else
    {
        StartAniTimeOffset = 0.0;
    }
    StartAniTime = PlayerOwner().Level.TimeSeconds;
    bShowAni = true;
    // End:0x13b
    if(bShowChatState)
    {
        i = 0;
        J0x8f:
        // End:0x138 [While If]
        if(i < ButtonChatStateArray.Length)
        {
            ButtonChatStateArray[i].SetVisibility(true);
            ButtonChatStateArray[i].bAcceptsInput = true;
            ButtonChatStateArray[i].SetDefaultMButtonImage();
            ButtonChatStateArray[i].SetDefaultFontColor();
            ButtonChatStateArray[i].AWinPos = ButtonChatState.AWinPos;
            ButtonChatStateArray[i].ApplyAWinPos();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8f;
        }
    }
    // End:0x13b
    else
    {
    }
    return true;
}

function SetChatState(int ChatState)
{
    ButtonChatState.Caption = strChatState[ChatState];
}

function ClearAll()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < ASLChat.Length)
    {
        ASLChat[i].Clear();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function FloatBox FloatBoxAdd(out FloatBox A, out FloatBox B)
{
    local FloatBox temp;

    temp.X1 = A.X1 + B.X1;
    temp.Y1 = A.Y1 + B.Y1;
    temp.X2 = A.X2 + B.X2;
    temp.Y2 = A.Y2 + B.Y2;
    return temp;
}

function FloatBox FloatBoxSubstract(out FloatBox A, out FloatBox B)
{
    local FloatBox temp;

    temp.X1 = A.X1 - B.X1;
    temp.Y1 = A.Y1 - B.Y1;
    temp.X2 = A.X2 - B.X2;
    temp.Y2 = A.Y2 - B.Y2;
    return temp;
}

function FloatBox FloatBoxMultiply(out FloatBox A, float B)
{
    local FloatBox temp;

    temp.X1 = A.X1 * B;
    temp.Y1 = A.Y1 * B;
    temp.X2 = A.X2 * B;
    temp.Y2 = A.Y2 * B;
    return temp;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local float CurrentTime, ElapsedTime, perc;
    local FloatBox fb, fb2;

    saveC = C;
    // End:0x3e4
    if(bShowAni)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds + StartAniTimeOffset;
        ElapsedTime = CurrentTime - StartAniTime;
        // End:0x213
        if(bShowChatState)
        {
            // End:0x15b
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                i = 0;
                J0x79:
                // End:0x158 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x79;
                }
            }
            // End:0x210
            else
            {
                i = 0;
                J0x162:
                // End:0x208 [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    ButtonChatStateArray[i].SetDefaultMButtonImage();
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x162;
                }
                bShowAni = false;
            }
        }
        // End:0x3e4
        else
        {
            // End:0x32f
            if(ElapsedTime < SlideAniTime)
            {
                perc = ElapsedTime / SlideAniTime;
                perc = 1.0 - perc;
                i = 0;
                J0x24d:
                // End:0x32c [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(true);
                    ButtonChatStateArray[i].bAcceptsInput = true;
                    fb = FloatBoxSubstract(fbButtonChatStateArray[i], ButtonChatState.AWinPos);
                    fb2 = FloatBoxMultiply(fb, perc);
                    ButtonChatStateArray[i].SetAlphaValue(perc);
                    ButtonChatStateArray[i].AWinPos = FloatBoxAdd(ButtonChatState.AWinPos, fb2);
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x24d;
                }
            }
            // End:0x3e4
            else
            {
                i = 0;
                J0x336:
                // End:0x3dc [While If]
                if(i < ButtonChatStateArray.Length)
                {
                    ButtonChatStateArray[i].SetVisibility(false);
                    ButtonChatStateArray[i].bAcceptsInput = false;
                    ButtonChatStateArray[i].SetDefaultMButtonImage();
                    ButtonChatStateArray[i].SetDefaultFontColor();
                    ButtonChatStateArray[i].AWinPos = fbButtonChatStateArray[i];
                    ButtonChatStateArray[i].ApplyAWinPos();
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x336;
                }
                bShowAni = false;
            }
        }
    }
    return false;
}

function bool Internal_OnPostDraw(Canvas C)
{
    local int i;

    // End:0x78
    if(saveC != none && ccText.Length > 0)
    {
        i = 0;
        J0x20:
        // End:0x70 [While If]
        if(i < ccText.Length)
        {
            AddChatHistory(ccText[i].ChatPanel, ccText[i].chatText, ccText[i].ChatColor);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x20;
        }
        ccText.Length = 0;
    }
    return false;
}

function Internal_DeActivate()
{
    local bool bInBounds;
    local int i;

    bInBounds = false;
    i = 0;
    J0x0f:
    // End:0x4c [While If]
    if(i < ButtonChatStateArray.Length)
    {
        // End:0x42
        if(ButtonChatStateArray[i].IsInBounds())
        {
            bInBounds = true;
        }
        // End:0x4c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x0f;
        }
    }
    // End:0x6a
    if(bInBounds == false && bShowChatState)
    {
        ButtonChatState_OnClick(none);
    }
}

defaultproperties
{
    SlideAniTime=0.40
    TabControl=mTabControl
    strChatState[0]="Not Available"
    strChatState[1]="All"
    strChatState[2]="Clan"
    strChatState[3]="Whisper"
    strChatState[4]="All"
    strChatState[5]="System"
    strChatState[6]="Team"
    strAll="All"
    strWhisper="Whisper"
    strClan="Clan"
    OnPostDraw=Internal_OnPostDraw
    bBoundToParent=true
    bScaleToParent=true
    OnPreDraw=Internal_OnPreDraw
    OnDeActivate=Internal_DeActivate
}