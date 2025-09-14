/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4IRC_Channel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:49
 *
 *******************************************************************************/
class UT2k4IRC_Channel extends UT2K4IRC_Page
    dependson(UT2K4IRC_Page)
    dependson(UT2K4IRCLink)
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
    // End:0x5a
    if(Left(Text, 4) ~= "/me ")
    {
        ChannelAction(tp_System.NickName, Mid(Text, 4));
        tp_System.Link.SendChannelAction(ChannelName, Mid(Text, 4));
    }
    // End:0xf4
    else
    {
        // End:0x8d
        if(Left(Text, 1) == "/")
        {
            tp_System.Link.SendCommandText(Mid(Text, 1));
        }
        // End:0xf4
        else
        {
            // End:0xf4
            if(Text != "")
            {
                ChannelText(tp_System.NickName, Text);
                // End:0xd2
                if(Left(ChannelName, 1) != "#")
                {
                    ChannelName = "#" $ ChannelName;
                }
                tp_System.Link.SendChannelText(ChannelName, Text);
            }
        }
    }
}

function Whois(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Whois(Nick);
}

function Op(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Op(Nick, ChannelName);
}

function Deop(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Deop(Nick, ChannelName);
}

function Voice(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Voice(Nick, ChannelName);
}

function DeVoice(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.DeVoice(Nick, ChannelName);
}

function Help(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Help(Nick, ChannelName);
}

function DeHelp(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.DeHelp(Nick, ChannelName);
}

function Kick(string Nick, optional string Reason)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Kick(Nick, ChannelName, Reason);
}

function Ban(string Nick, optional string Reason)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Ban(Nick, ChannelName, Reason);
}

function Unban(string Nick)
{
    // End:0x0d
    if(tp_System == none)
    {
        return;
    }
    tp_System.Unban(Nick, ChannelName);
}

function UserInChannel(string Nick)
{
    AddUser(Nick);
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
}

function RemoveUser(string Nick)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    lb_User.List.RemoveItem(Nick);
}

function ChangeOp(string Nick, bool NewOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "o", NewOp);
    lb_User.List.Sort();
}

function ChangeHalfOp(string Nick, bool NewHalfOp)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "h", NewHalfOp);
    lb_User.List.Sort();
}

function ChangeVoice(string Nick, bool NewVoice)
{
    local int i;

    i = GetUser(Nick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    UserSetFlag(i, "v", NewVoice);
    lb_User.List.Sort();
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
}

function ChangeTopic(string NewTopic)
{
    ChannelTopic = NewTopic;
    InterpretColorCodes(NewTopic);
    lb_TextDisplay.AddText(MakeColorCode(IRCInfoColor) $ "*** " $ NewTopicText $ ": " $ NewTopic);
    // End:0x71
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ChannelText(string Nick, string Text)
{
    // End:0x3a
    if(MyButton.bActive && bIRCTextToSpeechEnabled)
    {
        PlayerOwner().TextToSpeech(StripColorCodes(Text), 1.0);
    }
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(MakeColorCode(IRCNickColor) $ "<" $ Nick $ "> " $ MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
    // End:0xb0
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function ChannelAction(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "* " $ Nick $ " " $ Text);
    // End:0x63
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
}

function UserNotice(string Nick, string Text)
{
    InterpretColorCodes(Text);
    lb_TextDisplay.AddText(MakeColorCode(IRCActionColor) $ "-" $ Nick $ "- " $ Text);
    // End:0x63
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
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
    // End:0xb7
    if(!MyButton.bActive)
    {
        MyButton.bForceFlash = true;
    }
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
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x8c
    if(lb_User != none)
    {
        lb_User.List.bSorted = true;
        lb_User.List.__OnDrawItem__Delegate = MyOnDrawItem;
        lb_User.List.__CompareItem__Delegate = MyCompareItem;
        lb_User.List.__OnDblClick__Delegate = MyListDblClick;
    }
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
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x32
    if(GUIListBox(NewComp) != none)
    {
        lb_User = GUIListBox(NewComp);
        lb_User.FillOwner();
    }
    // End:0x42
    else
    {
        super.InternalOnCreateComponent(NewComp, Sender);
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x23
    if(Sender == sp_Main)
    {
        sp_Main.SplitPosition = MainSplitterPosition;
    }
}

function InternalOnReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x1d
    if(Sender == sp_Main)
    {
        MainSplitterPosition = NewPos;
        SaveConfig();
    }
}

function bool MyListDblClick(GUIComponent Sender)
{
    local string UserName;

    UserName = lb_User.List.Get();
    // End:0x2c
    if(UserName == "")
    {
        return true;
    }
    tp_System.AddChannel(UserName, true, true);
    return true;
}

function int MyCompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
    local string s1, s2;

    // End:0x33
    if(InStr(ElemA.ExtraStrData, "o") != -1)
    {
        s1 = "   " $ ElemA.Item;
    }
    // End:0xa6
    else
    {
        // End:0x65
        if(InStr(ElemA.ExtraStrData, "h") != -1)
        {
            s1 = "  " $ ElemA.Item;
        }
        // End:0xa6
        else
        {
            // End:0x96
            if(InStr(ElemA.ExtraStrData, "v") != -1)
            {
                s1 = " " $ ElemA.Item;
            }
            // End:0xa6
            else
            {
                s1 = ElemA.Item;
            }
        }
    }
    // End:0xd9
    if(InStr(ElemB.ExtraStrData, "o") != -1)
    {
        s2 = "   " $ ElemB.Item;
    }
    // End:0x14c
    else
    {
        // End:0x10b
        if(InStr(ElemB.ExtraStrData, "h") != -1)
        {
            s2 = "  " $ ElemB.Item;
        }
        // End:0x14c
        else
        {
            // End:0x13c
            if(InStr(ElemB.ExtraStrData, "v") != -1)
            {
                s2 = " " $ ElemB.Item;
            }
            // End:0x14c
            else
            {
                s2 = ElemB.Item;
            }
        }
    }
    s1 = Caps(s1);
    s2 = Caps(s2);
    // End:0x17a
    if(s1 > s2)
    {
        return 1;
    }
    // End:0x194
    else
    {
        // End:0x192
        if(s1 < s2)
        {
            return -1;
        }
        // End:0x194
        else
        {
            return 0;
        }
    }
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local string DrawName, NickName, Flags;
    local export editinline GUIStyles S;

    // End:0x1f
    if(lb_User.List.Style == none)
    {
        return;
    }
    NickName = lb_User.List.GetItemAtIndex(i);
    Flags = lb_User.List.GetExtraAtIndex(i);
    // End:0x8c
    if(InStr(Flags, "o") != -1)
    {
        DrawName = "@" $ NickName;
    }
    // End:0xe5
    else
    {
        // End:0xb3
        if(InStr(Flags, "h") != -1)
        {
            DrawName = "%" $ NickName;
        }
        // End:0xe5
        else
        {
            // End:0xda
            if(InStr(Flags, "v") != -1)
            {
                DrawName = "+" $ NickName;
            }
            // End:0xe5
            else
            {
                DrawName = NickName;
            }
        }
    }
    // End:0x16c
    if(bSelected && lb_User.List.SelectedStyle != none)
    {
        S = lb_User.List.SelectedStyle;
        S.Draw(Canvas, lb_User.List.MenuState, X, Y, W, H);
    }
    // End:0x189
    else
    {
        S = lb_User.List.Style;
    }
    S.DrawText(Canvas, 0, X, Y, W, H, 0, DrawName, lb_User.FontScale);
}

function int GetUser(string Nick)
{
    return lb_User.List.FindIndex(Nick);
}

function string GetFlags(string NickName)
{
    local int i;

    i = GetUser(NickName);
    // End:0x3e
    if(i != -1)
    {
        return lb_User.List.GetExtraAtIndex(i);
    }
    return "";
}

function bool FindNick(string Nick)
{
    // End:0x17
    if(GetUser(Nick) > -1)
    {
        return true;
    }
    return false;
}

function bool UserIsOp(string NickName)
{
    return InStr(GetFlags(NickName), "o") != -1;
}

function bool UserIsHelper(string NickName)
{
    return InStr(GetFlags(NickName), "h") != -1;
}

function bool UserIsVoice(string NickName)
{
    return InStr(GetFlags(NickName), "v") != -1;
}

function ChangeNick(string OldNick, string NewNick)
{
    local int i;

    i = GetUser(OldNick);
    // End:0x1e
    if(i < 0)
    {
        return;
    }
    lb_User.List.SetItemAtIndex(i, NewNick);
    lb_User.List.Sort();
}

function UserSetFlag(int i, string flag, bool bSet)
{
    local string Flags, S;
    local int FlagPos;

    Flags = lb_User.List.GetExtraAtIndex(i);
    S = Left(flag, 1);
    J0x31:
    // End:0xf4 [While If]
    if(S != "")
    {
        // End:0x8a
        if(bSet)
        {
            // End:0x5e
            if(InStr(Flags, S) != -1)
            {
                return;
            }
            lb_User.List.SetExtraAtIndex(i, Flags $ S);
        }
        // End:0xe3
        else
        {
            FlagPos = InStr(Flags, S);
            // End:0xad
            if(FlagPos == -1)
            {
                return;
            }
            Flags = Repl(Flags, S, "");
            lb_User.List.SetExtraAtIndex(i, Flags);
        }
        S = Mid(S, 1);
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
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
    if(Controller == none || Controller.ActiveControl != lb_User.List)
    {
        return false;
    }
    SelectedNick = lb_User.List.Get();
    // End:0x9b
    if(tp_System.IsMe(SelectedNick))
    {
        return false;
    }
    AddUserContextOptions(Sender, SelectedNick);
    AddControlContextOptions(Sender, SelectedNick);
    return true;
}

function AddUserContextOptions(GUIContextMenu Menu, string Nick)
{
    Menu.AddItem(MessageUserText);
    Menu.AddItem(WhoisUserText);
}

function AddControlContextOptions(GUIContextMenu Menu, string Nick)
{
    // End:0x35
    if(Menu == none || tp_System == none || !UserIsOp(tp_System.NickName))
    {
        return;
    }
    Menu.AddItem("-");
    // End:0x6c
    if(UserIsOp(Nick))
    {
        Menu.AddItem(DeopUserText);
    }
    // End:0x80
    else
    {
        Menu.AddItem(OpUserText);
    }
    // End:0xa5
    if(UserIsHelper(Nick))
    {
        Menu.AddItem(DehelpUserText);
    }
    // End:0xb9
    else
    {
        Menu.AddItem(HelpUserText);
    }
    // End:0xde
    if(UserIsVoice(Nick))
    {
        Menu.AddItem(DevoiceUserText);
    }
    // End:0xf2
    else
    {
        Menu.AddItem(VoiceUserText);
    }
    Menu.AddItem("-");
    Menu.AddItem(KickUserText);
    Menu.AddItem(KickUserText $ "...");
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
            // End:0x13e
            break;
        // End:0x6a
        case 1:
            Whois(Nick);
            // End:0x13e
            break;
        // End:0x7d
        case 2:
            Op(Nick);
            // End:0x13e
            break;
        // End:0x90
        case 3:
            Deop(Nick);
            // End:0x13e
            break;
        // End:0xa3
        case 4:
            Help(Nick);
            // End:0x13e
            break;
        // End:0xb6
        case 5:
            DeHelp(Nick);
            // End:0x13e
            break;
        // End:0xc9
        case 6:
            Voice(Nick);
            // End:0x13e
            break;
        // End:0xdc
        case 7:
            DeVoice(Nick);
            // End:0x13e
            break;
        // End:0xef
        case 8:
            Kick(Nick);
            // End:0x13e
            break;
        // End:0x13b
        case 9:
            // End:0x138
            if(Controller.OpenMenu(Controller.RequestDataMenu, "", ReasonText))
            {
                Controller.ActivePage.__OnClose__Delegate = KickReasonClose;
            }
            // End:0x13e
            break;
        // End:0xffff
        default:
}

function int GetAbsoluteIndex(GUIContextMenu Menu, int Index)
{
    // End:0x39
    if(Menu == none || Index < 0 || Index >= Menu.ContextItems.Length)
    {
        return -1;
    }
    // End:0x57
    if(Index == 0 || Index == 1)
    {
        return Index;
    }
    // End:0x7a
    if(Menu.ContextItems[Index] == "-")
    {
        ++ Index;
    }
    switch(Menu.ContextItems[Index])
    {
        // End:0x9a
        case MessageUserText:
            return 0;
        // End:0xa4
        case WhoisUserText:
            return 1;
        // End:0xaf
        case OpUserText:
            return 2;
        // End:0xba
        case DeopUserText:
            return 3;
        // End:0xc5
        case HelpUserText:
            return 4;
        // End:0xd0
        case DehelpUserText:
            return 5;
        // End:0xdb
        case VoiceUserText:
            return 6;
        // End:0xe6
        case DevoiceUserText:
            return 7;
        // End:0xf1
        case KickUserText:
            return 8;
        // End:0x103
        case KickUserText $ "...":
            return 9;
        // End:0xffff
        default:
            return 1;
    }
}

function KickReasonClose(bool bCancelled)
{
    // End:0x41
    if(!bCancelled)
    {
        Kick(lb_User.List.Get(), Controller.ActivePage.GetDataString());
    }
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
    begin object name=SplitterA class=GUISplitter
        SplitOrientation=1
        SplitPosition=0.750
        DefaultPanels[0]="XInterface.GUIScrollTextBox"
        DefaultPanels[1]="XInterface.GUIListBox"
        OnReleaseSplitter=InternalOnReleaseSplitter
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        WinHeight=0.950
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: GUISplitter'UT2k4IRC_Channel.SplitterA'
    sp_Main=SplitterA
    MainSplitterPosition=0.750
    begin object name=RCMenu class=GUIContextMenu
        OnOpen=ContextMenuOpen
        OnSelect=ContextMenuClick
    object end
    // Reference: GUIContextMenu'UT2k4IRC_Channel.RCMenu'
    ContextMenu=RCMenu
}