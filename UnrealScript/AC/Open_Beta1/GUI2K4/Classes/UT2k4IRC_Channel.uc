class UT2k4IRC_Channel extends UT2K4IRC_Page
    config(User)
    editinlinenew
    instanced;

var export editinline UT2k4IRC_System tp_System;
var string ChannelName;
var string ChannelTopic;
var string DefaultListClass;
var localized string OpUserText;
var localized string HelpUserText;
var localized string VoiceUserText;
var localized string ReasonText;
var localized string MessageUserText;
var localized string WhoisUserText;
var localized string DeopUserText;
var localized string DehelpUserText;
var localized string DevoiceUserText;
var localized string KickUserText;
var bool IsPrivate;
var export editinline GUIListBox lb_User;

function ProcessInput(string Text)
{
    // End:0x5A
    if(Left(Text, 4) ~= "/me ")
    {
        ChannelAction(tp_System.NickName, Mid(Text, 4));
        tp_System.Link.SendChannelAction(ChannelName, Mid(Text, 4));        
    }
    else
    {
        // End:0x8D
        if(Left(Text, 1) == "/")
        {
            tp_System.Link.SendCommandText(Mid(Text, 1));            
        }
        else
        {
            // End:0xF4
            if(Text != "")
            {
                ChannelText(tp_System.NickName, Text);
                // End:0xD2
                if(Left(ChannelName, 1) != "#")
                {
                    ChannelName = "#" $ ChannelName;
                }
                tp_System.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
    //return;    
}

function Whois(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Whois(Nick);
    //return;    
}

function Op(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Op(Nick, ChannelName);
    //return;    
}

function Deop(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Deop(Nick, ChannelName);
    //return;    
}

function Voice(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Voice(Nick, ChannelName);
    //return;    
}

function DeVoice(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.DeVoice(Nick, ChannelName);
    //return;    
}

function Help(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Help(Nick, ChannelName);
    //return;    
}

function DeHelp(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.DeHelp(Nick, ChannelName);
    //return;    
}

function Kick(string Nick, optional string Reason)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Kick(Nick, ChannelName, Reason);
    //return;    
}

function Ban(string Nick, optional string Reason)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Ban(Nick, ChannelName, Reason);
    //return;    
}

function Unban(string Nick)
{
    // End:0x0D
    if(tp_System == none)
    {
        return;
    }
    tp_System.Unban(Nick, ChannelName);
    //return;    
}

function UserInChannel(string Nick)
{
    AddUser(Nick);
    //return;    
}

function AddUser(string Nick)
{
    local int i;

    i = GetUser(Nick);
    // End:0x22
    if(i > -1)
    {
        return;
    }
    lb_User.List.Add(Nick);
    //return;    
}

function RemoveUser(string Nick)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1E
    if(i < 0)
    {
        return;
    }
    lb_User.List.RemoveItem(Nick);
    //return;    
}

function ChangeOp(string Nick, bool NewOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1E
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "o", NewOp);
    lb_User.List.Sort();
    //return;    
}

function ChangeHalfOp(string Nick, bool NewHalfOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1E
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "h", NewHalfOp);
    lb_User.List.Sort();
    //return;    
}

function ChangeVoice(string Nick, bool NewVoice)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1E
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "v", NewVoice);
    lb_User.List.Sort();
    //return;    
}

function ChangedNick(string OldNick, string NewNick)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(NowKnownAsText, "%OldName%", OldNick);
    S = Repl(S, "%NewName%", NewNick);
    lb_TextDisplay.AddText(S);
    ChangeNick(OldNick, NewNick);
    // End:0x97
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function ChangeTopic(string NewTopic)
{
    ChannelTopic = NewTopic;
    InterpretColorCodes(NewTopic);
    lb_TextDisplay.AddText(((((MakeColorCode(IRCInfoColor)) $ "*** ") $ NewTopicText) $ ": ") $ NewTopic);
    // End:0x71
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function ChannelText(string Nick, string Text)
{
    // End:0x3A
    if(MyButton.bActive && bIRCTextToSpeechEnabled)
    {
        PlayerOwner().TextToSpeech(StripColorCodes(Text), 1.0000000);
    }
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText((((((MakeColorCode(IRCNickColor)) $ "<") $ Nick) $ "> ") $ (MakeColorCode(IRCTextColor))) $ (ColorizeLinks(Text)));
    // End:0xB0
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function ChannelAction(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(((((MakeColorCode(IRCActionColor)) $ "* ") $ Nick) $ " ") $ Text);
    // End:0x63
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function UserNotice(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(((((MakeColorCode(IRCActionColor)) $ "-") $ Nick) $ "- ") $ Text);
    // End:0x63
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function JoinedChannel(string Nick)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(HasJoinedText, "%Name%", Nick);
    S = Repl(S, "%Chan%", ChannelName);
    InterpretColorCodes(Nick);
    lb_TextDisplay.AddText(S);
    AddUser(Nick);
    // End:0x97
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function PartedChannel(string Nick)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(HasLeftText, "%Name%", Nick);
    S = Repl(S, "%Chan%", ChannelName);
    InterpretColorCodes(Nick);
    lb_TextDisplay.AddText(S);
    RemoveUser(Nick);
    // End:0x97
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function KickUser(string KickedNick, string Kicker, string Reason)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(WasKickedByText, "%Kicked%", KickedNick);
    S = Repl(S, "%Kicker%", Kicker);
    S = Repl(S, "%Reason%", Reason);
    InterpretColorCodes(Reason);
    lb_TextDisplay.AddText(S);
    RemoveUser(KickedNick);
    // End:0xB7
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function UserQuit(string Nick, string Reason)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(QuitText, "%Name%", Nick);
    S = Repl(S, "%Reason%", Reason);
    InterpretColorCodes(Reason);
    lb_TextDisplay.AddText(S);
    RemoveUser(Nick);
    // End:0x99
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function ChangeMode(string Nick, string Mode)
{
    local string S;

    S = MakeColorCode(IRCInfoColor);
    S $= Repl(SetsModeText, "%Name%", Nick);
    S = Repl(S, "%Mode%", Mode);
    lb_TextDisplay.AddText(S);
    // End:0x81
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x8C
    if(lb_User != none)
    {
        lb_User.List.bSorted = true;
        lb_User.List.__OnDrawItem__Delegate = MyOnDrawItem;
        lb_User.List.__CompareItem__Delegate = MyCompareItem;
        lb_User.List.__OnDblClick__Delegate = MyListDblClick;
    }
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x37
    if(bShow && bInit)
    {
        sp_Main.SplitterUpdatePositions();
        bInit = false;
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x32
    if(GUIListBox(NewComp) != none)
    {
        lb_User = GUIListBox(NewComp);
        lb_User.FillOwner();        
    }
    else
    {
        super.InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x23
    if(Sender == sp_Main)
    {
        sp_Main.SplitPosition = MainSplitterPosition;
    }
    //return;    
}

function InternalOnReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x1D
    if(Sender == sp_Main)
    {
        MainSplitterPosition = NewPos;
        SaveConfig();
    }
    //return;    
}

function bool MyListDblClick(GUIComponent Sender)
{
    local string UserName;

    UserName = lb_User.List.Get();
    // End:0x2C
    if(UserName == "")
    {
        return true;
    }
    tp_System.AddChannel(UserName, true, true);
    return true;
    //return;    
}

function int MyCompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
    local string s1, s2;

    // End:0x33
    if(InStr(ElemA.ExtraStrData, "o") != -1)
    {
        s1 = "   " $ ElemA.Item;        
    }
    else
    {
        // End:0x65
        if(InStr(ElemA.ExtraStrData, "h") != -1)
        {
            s1 = "  " $ ElemA.Item;            
        }
        else
        {
            // End:0x96
            if(InStr(ElemA.ExtraStrData, "v") != -1)
            {
                s1 = " " $ ElemA.Item;                
            }
            else
            {
                s1 = ElemA.Item;
            }
        }
    }
    // End:0xD9
    if(InStr(ElemB.ExtraStrData, "o") != -1)
    {
        s2 = "   " $ ElemB.Item;        
    }
    else
    {
        // End:0x10B
        if(InStr(ElemB.ExtraStrData, "h") != -1)
        {
            s2 = "  " $ ElemB.Item;            
        }
        else
        {
            // End:0x13C
            if(InStr(ElemB.ExtraStrData, "v") != -1)
            {
                s2 = " " $ ElemB.Item;                
            }
            else
            {
                s2 = ElemB.Item;
            }
        }
    }
    s1 = Caps(s1);
    s2 = Caps(s2);
    // End:0x17A
    if(s1 > s2)
    {
        return 1;        
    }
    else
    {
        // End:0x192
        if(s1 < s2)
        {
            return -1;            
        }
        else
        {
            return 0;
        }
    }
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local string DrawName, NickName, Flags;
    local export editinline GUIStyles S;

    // End:0x1F
    if(lb_User.List.Style == none)
    {
        return;
    }
    NickName = lb_User.List.GetItemAtIndex(i);
    Flags = lb_User.List.GetExtraAtIndex(i);
    // End:0x8C
    if(InStr(Flags, "o") != -1)
    {
        DrawName = "@" $ NickName;        
    }
    else
    {
        // End:0xB3
        if(InStr(Flags, "h") != -1)
        {
            DrawName = "%" $ NickName;            
        }
        else
        {
            // End:0xDA
            if(InStr(Flags, "v") != -1)
            {
                DrawName = "+" $ NickName;                
            }
            else
            {
                DrawName = NickName;
            }
        }
    }
    // End:0x16C
    if(bSelected && lb_User.List.SelectedStyle != none)
    {
        S = lb_User.List.SelectedStyle;
        S.Draw(Canvas, lb_User.List.MenuState, X, Y, W, H);        
    }
    else
    {
        S = lb_User.List.Style;
    }
    S.DrawText(Canvas, 0, X, Y, W, H, 0, DrawName, lb_User.FontScale);
    //return;    
}

function int GetUser(string Nick)
{
    return lb_User.List.FindIndex(Nick);
    //return;    
}

function string GetFlags(string NickName)
{
    local int i;

    i = GetUser(NickName);
    // End:0x3E
    if(i != -1)
    {
        return lb_User.List.GetExtraAtIndex(i);
    }
    return "";
    //return;    
}

function bool FindNick(string Nick)
{
    // End:0x17
    if((GetUser(Nick)) > -1)
    {
        return true;
    }
    return false;
    //return;    
}

function bool UserIsOp(string NickName)
{
    return InStr(GetFlags(NickName), "o") != -1;
    //return;    
}

function bool UserIsHelper(string NickName)
{
    return InStr(GetFlags(NickName), "h") != -1;
    //return;    
}

function bool UserIsVoice(string NickName)
{
    return InStr(GetFlags(NickName), "v") != -1;
    //return;    
}

function ChangeNick(string OldNick, string NewNick)
{
    local int i;

    i = GetUser(OldNick);
    // End:0x1E
    if(i < 0)
    {
        return;
    }
    lb_User.List.SetItemAtIndex(i, NewNick);
    lb_User.List.Sort();
    //return;    
}

function UserSetFlag(int i, string flag, bool bSet)
{
    local string Flags, S;
    local int FlagPos;

    Flags = lb_User.List.GetExtraAtIndex(i);
    S = Left(flag, 1);
    J0x31:

    // End:0xF4 [Loop If]
    if(S != "")
    {
        // End:0x8A
        if(bSet)
        {
            // End:0x5E
            if(InStr(Flags, S) != -1)
            {
                return;
            }
            lb_User.List.SetExtraAtIndex(i, Flags $ S);            
        }
        else
        {
            FlagPos = InStr(Flags, S);
            // End:0xAD
            if(FlagPos == -1)
            {
                return;
            }
            Flags = Repl(Flags, S, "");
            lb_User.List.SetExtraAtIndex(i, Flags);
        }
        S = Mid(S, 1);
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

function bool ContextMenuOpen(GUIContextMenu Sender)
{
    local string SelectedNick;

    // End:0x34
    if(Sender.ContextItems.Length > 0)
    {
        Sender.ContextItems.Remove(0, Sender.ContextItems.Length);
    }
    // End:0x64
    if((Controller == none) || Controller.ActiveControl != lb_User.List)
    {
        return false;
    }
    SelectedNick = lb_User.List.Get();
    // End:0x9B
    if(tp_System.IsMe(SelectedNick))
    {
        return false;
    }
    AddUserContextOptions(Sender, SelectedNick);
    AddControlContextOptions(Sender, SelectedNick);
    return true;
    //return;    
}

function AddUserContextOptions(GUIContextMenu Menu, string Nick)
{
    Menu.AddItem(MessageUserText);
    Menu.AddItem(WhoisUserText);
    //return;    
}

function AddControlContextOptions(GUIContextMenu Menu, string Nick)
{
    // End:0x35
    if(((Menu == none) || tp_System == none) || !UserIsOp(tp_System.NickName))
    {
        return;
    }
    Menu.AddItem("-");
    // End:0x6C
    if(UserIsOp(Nick))
    {
        Menu.AddItem(DeopUserText);        
    }
    else
    {
        Menu.AddItem(OpUserText);
    }
    // End:0xA5
    if(UserIsHelper(Nick))
    {
        Menu.AddItem(DehelpUserText);        
    }
    else
    {
        Menu.AddItem(HelpUserText);
    }
    // End:0xDE
    if(UserIsVoice(Nick))
    {
        Menu.AddItem(DevoiceUserText);        
    }
    else
    {
        Menu.AddItem(VoiceUserText);
    }
    Menu.AddItem("-");
    Menu.AddItem(KickUserText);
    Menu.AddItem(KickUserText $ "...");
    //return;    
}

function ContextMenuClick(GUIContextMenu Sender, int ClickIndex)
{
    local int AbsIndex;
    local string Nick;

    Nick = lb_User.List.Get();
    AbsIndex = GetAbsoluteIndex(Sender, ClickIndex);
    switch(AbsIndex)
    {
        // End:0x58
        case 0:
            tp_System.AddChannel(Nick, true, true);
            // End:0x13E
            break;
        // End:0x6A
        case 1:
            Whois(Nick);
            // End:0x13E
            break;
        // End:0x7D
        case 2:
            Op(Nick);
            // End:0x13E
            break;
        // End:0x90
        case 3:
            Deop(Nick);
            // End:0x13E
            break;
        // End:0xA3
        case 4:
            Help(Nick);
            // End:0x13E
            break;
        // End:0xB6
        case 5:
            DeHelp(Nick);
            // End:0x13E
            break;
        // End:0xC9
        case 6:
            Voice(Nick);
            // End:0x13E
            break;
        // End:0xDC
        case 7:
            DeVoice(Nick);
            // End:0x13E
            break;
        // End:0xEF
        case 8:
            Kick(Nick);
            // End:0x13E
            break;
        // End:0x13B
        case 9:
            // End:0x138
            if(Controller.OpenMenu(Controller.RequestDataMenu, "", ReasonText))
            {
                Controller.ActivePage.__OnClose__Delegate = KickReasonClose;
            }
            // End:0x13E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function int GetAbsoluteIndex(GUIContextMenu Menu, int Index)
{
    // End:0x39
    if(((Menu == none) || Index < 0) || Index >= Menu.ContextItems.Length)
    {
        return -1;
    }
    // End:0x57
    if((Index == 0) || Index == 1)
    {
        return Index;
    }
    // End:0x7A
    if(Menu.ContextItems[Index] == "-")
    {
        Index++;
    }
    switch(Menu.ContextItems[Index])
    {
        // End:0x9A
        case MessageUserText:
            return 0;
        // End:0xA4
        case WhoisUserText:
            return 1;
        // End:0xAF
        case OpUserText:
            return 2;
        // End:0xBA
        case DeopUserText:
            return 3;
        // End:0xC5
        case HelpUserText:
            return 4;
        // End:0xD0
        case DehelpUserText:
            return 5;
        // End:0xDB
        case VoiceUserText:
            return 6;
        // End:0xE6
        case DevoiceUserText:
            return 7;
        // End:0xF1
        case KickUserText:
            return 8;
        // End:0x103
        case KickUserText $ "...":
            return 9;
        // End:0xFFFF
        default:
            return 1;
            break;
    }
    //return;    
}

function KickReasonClose(bool bCancelled)
{
    // End:0x41
    if(!bCancelled)
    {
        Kick(lb_User.List.Get(), Controller.ActivePage.GetDataString());
    }
    //return;    
}

defaultproperties
{
    OpUserText="Op ???"
    HelpUserText="Helper ???"
    VoiceUserText="??? ???"
    ReasonText="??: "
    MessageUserText="Query ??"
    WhoisUserText="Whois"
    DeopUserText="Op ??"
    DehelpUserText="Helper ??"
    DevoiceUserText="??? ??"
    KickUserText="?? ??"
    // Reference: GUISplitter'GUI2K4_Decompressed.UT2k4IRC_Channel.SplitterA'
    begin object name="SplitterA" class=XInterface.GUISplitter
        SplitOrientation=1
        SplitPosition=0.7500000
        DefaultPanels[0]="XInterface.GUIScrollTextBox"
        DefaultPanels[1]="XInterface.GUIListBox"
        OnReleaseSplitter=UT2k4IRC_Channel.InternalOnReleaseSplitter
        OnCreateComponent=UT2k4IRC_Channel.InternalOnCreateComponent
        IniOption="@Internal"
        WinHeight=0.9500000
        OnLoadINI=UT2k4IRC_Channel.InternalOnLoadINI
    end object
    sp_Main=SplitterA
    MainSplitterPosition=0.7500000
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2k4IRC_Channel.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        OnOpen=UT2k4IRC_Channel.ContextMenuOpen
        OnSelect=UT2k4IRC_Channel.ContextMenuClick
    end object
    ContextMenu=RCMenu
}