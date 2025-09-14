/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteFooter.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:8
 *
 *******************************************************************************/
class MapVoteFooter extends GUIFooter
    editinlinenew
    instanced;

var() noexport array<string> RecallQueue;
var() noexport int RecallIdx;
var() noexport int idxLastChatMsg;
var() noexport float LastMsgTime;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Chat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Chat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Accept;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Submit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Close;
var delegate<OnSubmit> __OnSubmit__Delegate;
var delegate<OnAccept> __OnAccept__Delegate;
var delegate<OnSendChat> __OnSendChat__Delegate;

delegate OnSubmit();
delegate OnAccept();
delegate bool OnSendChat(string Text)
{
    // End:0xb8
    if(Text != "")
    {
        // End:0x50
        if(RecallQueue.Length == 0 || RecallQueue[RecallQueue.Length - 1] != Text)
        {
            RecallIdx = RecallQueue.Length;
            RecallQueue[RecallIdx] = Text;
        }
        // End:0x7e
        if(Left(Text, 4) ~= "cmd ")
        {
            PlayerOwner().ConsoleCommand(Mid(Text, 4));
        }
        // End:0xb8
        else
        {
            // End:0xa6
            if(Left(Text, 1) == ".")
            {
                PlayerOwner().TeamSay(Mid(Text, 1));
            }
            // End:0xb8
            else
            {
                PlayerOwner().Say(Text);
            }
        }
    }
    return true;
}

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    local string str;
    local ExtendedConsole C;

    super(GUIMultiComponent).InitComponent(InController, inOwner);
    lb_Chat.MyScrollText.SetContent("");
    lb_Chat.MyScrollText.FontScale = 0;
    C = ExtendedConsole(Controller.ViewportOwner.Console);
    // End:0x11b
    if(C != none)
    {
        C.__OnChatMessage__Delegate = ReceiveChat;
        // End:0x11b
        if(C.bTyping)
        {
            str = C.TypedStr;
            C.TypingClose();
            // End:0xe0
            if(Left(str, 4) ~= "say ")
            {
                str = Mid(str, 4);
            }
            // End:0x107
            else
            {
                // End:0x107
                if(Left(str, 8) ~= "teamsay ")
                {
                    str = Mid(str, 8);
                }
            }
            ed_Chat.SetText(str);
        }
    }
    sb_Background.ManageComponent(lb_Chat);
    __OnDraw__Delegate = MyOnDraw;
}

function bool MyOnDraw(Canvas C)
{
    local float L, t, W, XL, YL;

    local XInterface.GUI.eFontScale fs;

    t = sb_Background.ActualTop() + sb_Background.ActualHeight();
    L = sb_Background.ActualLeft() + sb_Background.ActualWidth() - sb_Background.ImageOffset[3];
    b_Close.Style.TextSize(C, 0, b_Close.Caption, XL, YL, fs);
    W = XL;
    b_Submit.Style.TextSize(C, 0, b_Close.Caption, XL, YL, fs);
    // End:0xf0
    if(XL > W)
    {
        W = XL;
    }
    b_Accept.Style.TextSize(C, 0, b_Close.Caption, XL, YL, fs);
    // End:0x146
    if(XL > W)
    {
        W = XL;
    }
    W = W * float(3);
    W = ActualWidth(W);
    L -= W;
    b_Close.WinWidth = W;
    b_Close.WinTop = t;
    b_Close.WinLeft = L;
    L -= W;
    b_Submit.WinWidth = W;
    b_Submit.WinTop = t;
    b_Submit.WinLeft = L;
    L -= W;
    b_Accept.WinWidth = W;
    b_Accept.WinTop = t;
    b_Accept.WinLeft = L;
    ed_Chat.WinLeft = sb_Background.ActualLeft() + sb_Background.ImageOffset[0];
    ed_Chat.WinWidth = L - ed_Chat.WinLeft;
    ed_Chat.WinHeight = 25.0;
    ed_Chat.WinTop = t;
    return false;
}

function ReceiveChat(string Msg)
{
    lb_Chat.AddText(Msg);
    lb_Chat.MyScrollText.End();
    // End:0x7e
    if(lb_Chat.MyScrollText.ItemCount > 10)
    {
        lb_Chat.MyScrollText.Remove(0, lb_Chat.MyScrollText.ItemCount - 10);
    }
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x51
    if(State == 3 && key == 13)
    {
        // End:0x4c
        if(OnSendChat(ed_Chat.GetText()))
        {
            ed_Chat.SetComponentValue("", true);
        }
        return true;
    }
    // End:0xed
    else
    {
        // End:0xed
        if(State == 1 && RecallQueue.Length > 0)
        {
            // End:0xaa
            if(key == 38)
            {
                ed_Chat.SetText(RecallQueue[RecallIdx]);
                RecallIdx = Max(0, RecallIdx - 1);
                return true;
            }
            // End:0xed
            else
            {
                // End:0xed
                if(key == 40)
                {
                    ed_Chat.SetText(RecallQueue[RecallIdx]);
                    RecallIdx = Min(RecallQueue.Length - 1, RecallIdx + 1);
                    return true;
                }
            }
        }
    }
    return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_Close)
    {
        Controller.CloseMenu(true);
        return true;
    }
    // End:0x3c
    if(Sender == b_Submit)
    {
        OnSubmit();
        return true;
    }
    // End:0x57
    if(Sender == b_Accept)
    {
        OnAccept();
        return true;
    }
}

defaultproperties
{
    begin object name=MapvoteFooterBackground class=AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.010
        RightPadding=0.010
        WinHeight=0.820
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'MapVoteFooter.MapvoteFooterBackground'
    sb_Background=MapvoteFooterBackground
    begin object name=ChatScrollBox class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.223580
        WinLeft=0.0438450
        WinWidth=0.918970
        WinHeight=0.5825340
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'MapVoteFooter.ChatScrollBox'
    lb_Chat=ChatScrollBox
    begin object name=ChatEditBox class=moEditBox
        CaptionWidth=0.150
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.8685980
        WinLeft=0.0072350
        WinWidth=0.7002430
        WinHeight=0.1066090
        TabOrder=0
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: moEditBox'MapVoteFooter.ChatEditBox'
    ed_Chat=ChatEditBox
    begin object name=AcceptButton class=GUIButton
        Caption="Accept"
        Hint="Click once you are satisfied with all settings and wish to offer no further modifications"
        WinTop=0.9061730
        WinLeft=0.5625770
        WinWidth=0.1915540
        WinHeight=0.0711450
        TabOrder=1
        bVisible=true
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MapVoteFooter.AcceptButton'
    b_Accept=AcceptButton
    begin object name=SubmitButton class=GUIButton
        Caption="???"
        WinTop=0.8496250
        WinLeft=0.7049310
        WinWidth=0.1600750
        WinHeight=0.1654030
        TabOrder=1
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MapVoteFooter.SubmitButton'
    b_Submit=SubmitButton
    begin object name=CloseButton class=GUIButton
        Caption="????"
        WinTop=0.8496250
        WinLeft=0.8618950
        WinWidth=0.1377440
        WinHeight=0.1654030
        TabOrder=1
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MapVoteFooter.CloseButton'
    b_Close=CloseButton
    StyleName="BindBox"
    bNeverFocus=true
}