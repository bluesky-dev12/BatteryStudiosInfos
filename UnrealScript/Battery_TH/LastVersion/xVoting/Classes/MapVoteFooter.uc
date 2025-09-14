class MapVoteFooter extends GUIFooter
    editinlinenew
    instanced;

var() noexport array<string> RecallQueue;
var() noexport int RecallIdx;
var() noexport int idxLastChatMsg;
var() noexport float LastMsgTime;
var() automated GUISectionBackground sb_Background;
var() automated GUIScrollTextBox lb_Chat;
var() automated moEditBox ed_Chat;
var() automated GUIButton b_Accept;
var() automated GUIButton b_Submit;
var() automated GUIButton b_Close;
//var delegate<OnSubmit> __OnSubmit__Delegate;
//var delegate<OnAccept> __OnAccept__Delegate;
//var delegate<OnSendChat> __OnSendChat__Delegate;

delegate OnSubmit()
{
    //return;    
}

delegate OnAccept()
{
    //return;    
}

delegate bool OnSendChat(string Text)
{
    // End:0xB8
    if(Text != "")
    {
        // End:0x50
        if((RecallQueue.Length == 0) || RecallQueue[RecallQueue.Length - 1] != Text)
        {
            RecallIdx = RecallQueue.Length;
            RecallQueue[RecallIdx] = Text;
        }
        // End:0x7E
        if(Left(Text, 4) ~= "cmd ")
        {
            PlayerOwner().ConsoleCommand(Mid(Text, 4));            
        }
        else
        {
            // End:0xA6
            if(Left(Text, 1) == ".")
            {
                PlayerOwner().TeamSay(Mid(Text, 1));                
            }
            else
            {
                PlayerOwner().Say(Text);
            }
        }
    }
    return true;
    //return;    
}

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    local string str;
    local ExtendedConsole C;

    super(GUIMultiComponent).InitComponent(InController, inOwner);
    lb_Chat.MyScrollText.SetContent("");
    lb_Chat.MyScrollText.FontScale = 0;
    C = ExtendedConsole(Controller.ViewportOwner.Console);
    // End:0x11B
    if(C != none)
    {
        C.__OnChatMessage__Delegate = ReceiveChat;
        // End:0x11B
        if(C.bTyping)
        {
            str = C.TypedStr;
            C.TypingClose();
            // End:0xE0
            if(Left(str, 4) ~= "say ")
            {
                str = Mid(str, 4);                
            }
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
    //return;    
}

function bool MyOnDraw(Canvas C)
{
    local float L, t, W, XL, YL;

    local GUI.eFontScale fs;

    t = sb_Background.ActualTop() + sb_Background.ActualHeight();
    L = (sb_Background.ActualLeft() + sb_Background.ActualWidth()) - sb_Background.ImageOffset[3];
    b_Close.Style.TextSize(C, 0, b_Close.Caption, XL, YL, fs);
    W = XL;
    b_Submit.Style.TextSize(C, 0, b_Close.Caption, XL, YL, fs);
    // End:0xF0
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
    ed_Chat.WinHeight = 25.0000000;
    ed_Chat.WinTop = t;
    return false;
    //return;    
}

function ReceiveChat(string Msg)
{
    lb_Chat.AddText(Msg);
    lb_Chat.MyScrollText.End();
    // End:0x7E
    if(lb_Chat.MyScrollText.ItemCount > 10)
    {
        lb_Chat.MyScrollText.Remove(0, lb_Chat.MyScrollText.ItemCount - 10);
    }
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x51
    if((int(State) == 3) && int(key) == 13)
    {
        // End:0x4C
        if(OnSendChat(ed_Chat.GetText()))
        {
            ed_Chat.SetComponentValue("", true);
        }
        return true;        
    }
    else
    {
        // End:0xED
        if((int(State) == 1) && RecallQueue.Length > 0)
        {
            // End:0xAA
            if(int(key) == 38)
            {
                ed_Chat.SetText(RecallQueue[RecallIdx]);
                RecallIdx = Max(0, RecallIdx - 1);
                return true;                
            }
            else
            {
                // End:0xED
                if(int(key) == 40)
                {
                    ed_Chat.SetText(RecallQueue[RecallIdx]);
                    RecallIdx = Min(RecallQueue.Length - 1, RecallIdx + 1);
                    return true;
                }
            }
        }
    }
    return false;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_Close)
    {
        Controller.CloseMenu(true);
        return true;
    }
    // End:0x3C
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
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'xVoting_Decompressed.MapVoteFooter.MapvoteFooterBackground'
    begin object name="MapvoteFooterBackground" class=GUI2K4.AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.0100000
        RightPadding=0.0100000
        WinHeight=0.8200000
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=MapvoteFooterBackground.InternalPreDraw
    end object
    sb_Background=MapvoteFooterBackground
    // Reference: GUIScrollTextBox'xVoting_Decompressed.MapVoteFooter.ChatScrollBox'
    begin object name="ChatScrollBox" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        bVisibleWhenEmpty=true
        OnCreateComponent=ChatScrollBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.2235800
        WinLeft=0.0438450
        WinWidth=0.9189700
        WinHeight=0.5825340
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    lb_Chat=ChatScrollBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteFooter.ChatEditBox'
    begin object name="ChatEditBox" class=XInterface.moEditBox
        CaptionWidth=0.1500000
        Caption="???"
        OnCreateComponent=ChatEditBox.InternalOnCreateComponent
        WinTop=0.8685980
        WinLeft=0.0072350
        WinWidth=0.7002430
        WinHeight=0.1066090
        TabOrder=0
        OnKeyEvent=MapVoteFooter.InternalOnKeyEvent
    end object
    ed_Chat=ChatEditBox
    // Reference: GUIButton'xVoting_Decompressed.MapVoteFooter.AcceptButton'
    begin object name="AcceptButton" class=XInterface.GUIButton
        Caption="Accept"
        Hint="Click once you are satisfied with all settings and wish to offer no further modifications"
        WinTop=0.9061730
        WinLeft=0.5625770
        WinWidth=0.1915540
        WinHeight=0.0711450
        TabOrder=1
        bVisible=false
        bStandardized=true
        OnClick=MapVoteFooter.InternalOnClick
        OnKeyEvent=AcceptButton.InternalOnKeyEvent
    end object
    b_Accept=AcceptButton
    // Reference: GUIButton'xVoting_Decompressed.MapVoteFooter.SubmitButton'
    begin object name="SubmitButton" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.8496250
        WinLeft=0.7049310
        WinWidth=0.1600750
        WinHeight=0.1654030
        TabOrder=1
        bStandardized=true
        OnClick=MapVoteFooter.InternalOnClick
        OnKeyEvent=SubmitButton.InternalOnKeyEvent
    end object
    b_Submit=SubmitButton
    // Reference: GUIButton'xVoting_Decompressed.MapVoteFooter.CloseButton'
    begin object name="CloseButton" class=XInterface.GUIButton
        Caption="????"
        WinTop=0.8496250
        WinLeft=0.8618950
        WinWidth=0.1377440
        WinHeight=0.1654030
        TabOrder=1
        bStandardized=true
        OnClick=MapVoteFooter.InternalOnClick
        OnKeyEvent=CloseButton.InternalOnKeyEvent
    end object
    b_Close=CloseButton
    StyleName="BindBox"
    bNeverFocus=false
}