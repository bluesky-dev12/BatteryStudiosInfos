/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4IRC_System.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:36
 *	Functions:80
 *
 *******************************************************************************/
class UT2k4IRC_System extends UT2K4IRC_Page
    dependson(UT2K4IRC_Page)
    dependson(UT2k4Browser_IRC)
    dependson(UT2k4IRC_Channel)
    dependson(UT2k4IRC_Private)
    dependson(UT2K4IRCLink)
    dependson(UT2k4IRC_Panel)
    dependson(UT2k4ServerBrowser)
    config(User)
    editinlinenew
    instanced;

enum EAwayMode
{
    AM_None,
    AM_Server,
    AM_InstantAction,
    AM_Menus
};

var array<export editinline UT2k4IRC_Channel> Channels;
var string LinkClassName;
var UT2K4IRCLink Link;
var export editinline UT2k4Browser_IRC tp_Main;
var export editinline UT2k4IRC_Panel p_IRC;
var string TestIRCString;
var string LastServer;
var int CurChannel;
var int PrevChannel;
var private bool bConnected;
var private bool bAway;
var private bool bSysInitialized;
var config string NewNickMenu;
var() globalconfig string OldPlayerName;
var() globalconfig string NickName;
var() globalconfig string FullName;
var() globalconfig string UserIdent;
var() globalconfig string DefaultChannel;
var config string ChanKeyMenu;
var localized string NotInAChannelText;
var localized string KickedFromText;
var localized string ByText;
var localized string IsAwayText;
var localized string ChooseNewNickText;
var localized string NickInUseText;
var localized string NickInvalidText;
var localized string LeavePrivateText;
var localized string CloseWindowCaption;
var localized string DisconnectCaption;
var localized string ChangeNickCaption;
var localized string InvalidModeText;
var localized string InvalidKickText;
var UT2k4IRC_System.EAwayMode AwayMode;
var delegate<OnConnect> __OnConnect__Delegate;
var delegate<OnDisconnect> __OnDisconnect__Delegate;
var delegate<NewChannelSelected> __NewChannelSelected__Delegate;

delegate OnConnect();
delegate OnDisconnect();
delegate NewChannelSelected(int CurrentChannel);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIComponent C;

    super.InitComponent(MyController, myOwner);
    sp_Main.bDrawSplitter = false;
    p_IRC.UpdateConnectionStatus(IsConnected());
    C = MenuOwner;
    J0x41:
    // End:0x86 [While If]
    if(C != none)
    {
        // End:0x6f
        if(UT2k4Browser_IRC(C) != none)
        {
            tp_Main = UT2k4Browser_IRC(C);
        }
        // End:0x86
        else
        {
            C = C.MenuOwner;
            // This is an implied JumpToken; Continue!
            goto J0x41;
        }
    }
    assert(tp_Main != none);
}

function bool CanShowPanel()
{
    return Controller.bCurMenuInitialized;
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x35
    if(bShow)
    {
        // End:0x2d
        if(bInit)
        {
            sp_Main.SplitterUpdatePositions();
        }
        bInit = false;
    }
}

event Timer()
{
    // End:0x90
    if(bConnected && PlayerOwner() != none && PlayerOwner().PlayerReplicationInfo != none && PlayerOwner().PlayerReplicationInfo.PlayerName != OldPlayerName)
    {
        OldPlayerName = PlayerOwner().PlayerReplicationInfo.PlayerName;
        Link.SetNick(OldPlayerName);
        SystemText("SetNick: " $ OldPlayerName);
    }
}

function bool LeaveAvailable(out string ButtonCaption)
{
    // End:0x20
    if(!ValidChannelIndex(CurChannel))
    {
        ButtonCaption = CloseWindowCaption;
        return false;
    }
    // End:0x69
    else
    {
        // End:0x5c
        if(Channels[CurChannel].IsPrivate)
        {
            ButtonCaption = Repl(LeavePrivateText, "%ChanName%", GetCurrentChannelName());
            return true;
        }
        // End:0x69
        else
        {
            ButtonCaption = CloseWindowCaption;
            return true;
        }
    }
}

function bool DisconnectAvailable(out string ButtonCaption)
{
    ButtonCaption = DisconnectCaption;
    return IsConnected();
}

function bool SetNickAvailable(out string ButtonCaption)
{
    ButtonCaption = ChangeNickCaption;
    return true;
}

function bool InGame()
{
    return !Controller.bActive;
}

function bool InMenus()
{
    // End:0x0b
    if(InGame())
    {
        return false;
    }
    // End:0xb2
    if(UT2k4ServerBrowser(Controller.ActivePage) != none && UT2k4ServerBrowser(Controller.ActivePage).c_Tabs != none && UT2k4ServerBrowser(Controller.ActivePage).c_Tabs.ActiveTab != none && UT2k4Browser_IRC(UT2k4ServerBrowser(Controller.ActivePage).c_Tabs.ActiveTab.MyPanel) != none)
    {
        return false;
    }
    return true;
}

function UpdateIdent()
{
    local int i;

    // End:0x6f
    if(UserIdent == "")
    {
        UserIdent = "u";
        i = 0;
        J0x1c:
        // End:0x45 [While If]
        if(i < 7)
        {
            UserIdent $= Chr(Rand(10) + 48);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
        Log("Created new UserIdent: " $ UserIdent, 'IRC');
        SaveConfig();
    }
}

function bool IsMe(string Test)
{
    return Test ~= NickName;
}

function bool IsConnected()
{
    return bConnected && Link != none;
}

function bool IsAway()
{
    return bAway;
}

function NotifyQuitUnreal()
{
    CloseLink(Link, false, "Exit Game");
}

function ChangeConnectStatus(bool NewStatus)
{
    bConnected = NewStatus;
    p_IRC.UpdateConnectionStatus(bConnected);
    tp_Main.CheckRefreshButton(bConnected);
}

function ChangeAwayStatus(bool NewStatus)
{
    local string URL;

    bAway = NewStatus;
    // End:0x2c
    if(PlayerOwner() == none || PlayerOwner().Level == none)
    {
        return;
    }
    // End:0x16b
    if(IsConnected())
    {
        // End:0x142
        if(IsAway())
        {
            URL = PlayerOwner().Level.GetAddressURL();
            // End:0xcd
            if(InStr(URL, ":") > 0 && AwayMode != 1 || LastServer != URL)
            {
                LastServer = URL;
                Link.SetAway(PlayerOwner().GetURLProtocol() $ "://" $ URL);
                AwayMode = 1;
            }
            // End:0x13f
            else
            {
                // End:0x10e
                if(InGame() && AwayMode != 2)
                {
                    AwayMode = 2;
                    Link.SetAway("local game");
                }
                // End:0x13f
                else
                {
                    // End:0x13f
                    if(AwayMode != 3)
                    {
                        Link.SetAway("in menus");
                        AwayMode = 3;
                    }
                }
            }
        }
        // End:0x16b
        else
        {
            // End:0x16b
            if(AwayMode != 0)
            {
                Link.SetAway("");
                AwayMode = 0;
            }
        }
    }
}

function NewNickPageClosed(bool bCancelled)
{
    local string NewNick;

    // End:0x67
    if(!bCancelled)
    {
        NewNick = Controller.ActivePage.GetDataString();
        // End:0x67
        if(NewNick != "")
        {
            // End:0x57
            if(Link != none)
            {
                Link.SetNick(NewNick);
            }
            // End:0x67
            else
            {
                ChangedNick(NickName, NewNick);
            }
        }
    }
}

function ChanKeyPageClosed(bool bCancelled)
{
    local string JoinReq;

    // End:0x54
    if(!bCancelled)
    {
        JoinReq = Controller.ActivePage.GetDataString();
        // End:0x54
        if(JoinReq != "")
        {
            // End:0x54
            if(Link != none)
            {
                Link.JoinChannel(JoinReq);
            }
        }
    }
}

function bool Connect(string NewServer)
{
    local PlayerController PC;
    local UT2K4IRCLink NewLink;

    PC = PlayerOwner();
    // End:0x17
    if(NewServer == "")
    {
        return false;
    }
    NewLink = CreateNewLink();
    // End:0x30
    if(NewLink == none)
    {
        return false;
    }
    // End:0xaa
    if(PC.PlayerReplicationInfo != none)
    {
        // End:0xa7
        if(PC.PlayerReplicationInfo.PlayerName != OldPlayerName)
        {
            NickName = PC.PlayerReplicationInfo.PlayerName;
            OldPlayerName = NickName;
            // End:0xa4
            if(FullName == "")
            {
                FullName = NickName;
            }
            SaveConfig();
        }
    }
    // End:0xea
    else
    {
        NickName = PC.GetUrlOption("Name");
        OldPlayerName = NickName;
        // End:0xe7
        if(FullName == "")
        {
            FullName = NickName;
        }
        SaveConfig();
    }
    UpdateIdent();
    NewLink.Connect(self, NewServer, NickName, UserIdent, FullName, GetDefaultChannel());
    ChangeConnectStatus(true);
    SetTimer(1.0, true);
    return true;
}

function Disconnect()
{
    CloseLink(Link, false);
}

function CloseLink(UT2K4IRCLink OldLink, bool bSwitchingServers, optional string Reason)
{
    local string ServerName;

    ServerName = OldLink.ServerAddress;
    // End:0x34
    if(Reason == "")
    {
        Reason = "Disconnected";
    }
    // End:0x82
    if(Link != none)
    {
        // End:0x5f
        if(Link != OldLink)
        {
            OldLink.DestroyLink();
            return;
        }
        Link.DisconnectReason = Reason;
        Link.DestroyLink();
    }
    Link = none;
    Channels.Remove(0, Channels.Length);
    OnDisconnect();
    SystemText("Disconnected from server" @ ServerName);
    ChangeConnectStatus(bSwitchingServers);
    SetCurrentChannel(-1);
    KillTimer();
}

function ProcessInput(string Text)
{
    local int i;

    // End:0x2c
    if(CurChannel > -1)
    {
        Channels[CurChannel].ProcessInput(Text);
    }
    // End:0x130
    else
    {
        // End:0x52
        if(Left(Text, 1) != "/")
        {
            SystemText("*** " $ NotInAChannelText);
        }
        // End:0x130
        else
        {
            Text = Mid(Text, 1);
            // End:0xc6
            if(Left(Text, 7) ~= "connect" || Left(Text, 6) ~= "server")
            {
                i = InStr(Text, " ");
                // End:0xc3
                if(i != -1)
                {
                    Connect(Mid(Text, i + 1));
                }
            }
            // End:0x130
            else
            {
                // End:0x111
                if(Left(Text, 4) ~= "echo")
                {
                    i = InStr(Text, " ");
                    // End:0x10e
                    if(i != -1)
                    {
                        SystemText(Mid(Text, i + 1));
                    }
                }
                // End:0x130
                else
                {
                    // End:0x130
                    if(Link != none)
                    {
                        Link.SendCommandText(Text);
                    }
                }
            }
        }
    }
}

function JoinChannel(string ChannelName)
{
    local export editinline UT2k4IRC_Channel P;

    P = FindChannelWindow(ChannelName);
    // End:0x33
    if(P == none)
    {
        Link.JoinChannel(ChannelName);
    }
    // End:0x44
    else
    {
        SetCurrentChannel(FindPublicChannelIndex(ChannelName));
    }
}

function PartCurrentChannel()
{
    // End:0x12
    if(!ValidChannelIndex(CurChannel))
    {
        return;
    }
    PartChannel(Channels[CurChannel].ChannelName);
}

function PartChannel(string ChannelName)
{
    local export editinline UT2k4IRC_Channel P;

    P = FindChannelWindow(ChannelName, true);
    // End:0x51
    if(P != none)
    {
        // End:0x3d
        if(P.IsPrivate)
        {
            RemoveChannel(ChannelName);
        }
        // End:0x51
        else
        {
            Link.PartChannel(ChannelName);
        }
    }
}

function ChangeCurrentNick()
{
    // End:0x3e
    if(Controller.OpenMenu(NewNickMenu, ChooseNewNickText, NickName))
    {
        Controller.ActivePage.__OnClose__Delegate = NewNickPageClosed;
    }
}

function Whois(string Nick)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    Link.SendCommandText("WHOIS" @ Nick);
}

function Op(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("o", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
}

function Deop(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("o", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
}

function Voice(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("v", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
}

function DeVoice(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("v", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
}

function Help(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("h", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
}

function DeHelp(string Nick, string ChannelName)
{
    // End:0x0d
    if(Link == none)
    {
        return;
    }
    SetMode("h", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
}

function Kick(string Nick, string ChannelName, optional string Reason)
{
    // End:0x18
    if(Link == none)
    {
        SystemText(NotInAChannelText);
        return;
    }
    // End:0x4e
    if(Nick == "" || ChannelName == "")
    {
        SystemText(Repl(InvalidKickText, "%Cmd%", "KICK"));
        return;
    }
    Link.SendCommandText("KICK" @ Nick $ Eval(Reason != "", " :" $ Reason, ""));
}

function Ban(string Nick, string ChannelName, optional string Reason)
{
    SetMode("b", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
    Kick(Nick, ChannelName, Reason);
}

function Unban(string Nick, string ChannelName)
{
    SetMode("b", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
}

function SetMode(string modes, string Target, bool On, optional string Extra)
{
    // End:0x18
    if(Link == none)
    {
        SystemText(NotInAChannelText);
        return;
    }
    // End:0x3f
    if(modes == "" || Target == "")
    {
        SystemText(InvalidModeText);
        return;
    }
    // End:0x96
    if(Link != none)
    {
        Link.SendCommandText("MODE" @ Target @ Eval(On, "+", "-") $ modes $ Eval(Extra != "", " " $ Extra, ""));
    }
}

function SystemText(string Text)
{
    // End:0xb9
    if(Text != "You have been marked as being away" && Text != "You are no longer marked as being away")
    {
        InterpretColorCodes(Text);
        lb_TextDisplay.AddText(MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
        // End:0xb9
        if(!MyButton.bActive)
        {
            MyButton.bForceFlash = true;
        }
    }
}

function ChannelText(string Channel, string Nick, string Text)
{
    local export editinline UT2k4IRC_Channel P;

    P = FindChannelWindow(Channel);
    // End:0x35
    if(P != none)
    {
        P.ChannelText(Nick, Text);
    }
}

function PrivateText(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateText(Nick, Text);
}

function ChannelAction(string Channel, string Nick, string Text)
{
    local export editinline UT2k4IRC_Channel P;

    P = FindChannelWindow(Channel);
    // End:0x35
    if(P != none)
    {
        P.ChannelAction(Nick, Text);
    }
}

function PrivateAction(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateAction(Nick, Text);
}

function JoinedChannel(string Channel, optional string Nick)
{
    local export editinline UT2k4IRC_Channel NewCh, W;

    Log(Nick @ "JoinedChannel " $ Channel, 'IRC');
    // End:0x58
    if(Nick == "")
    {
        NewCh = AddChannel(Channel);
        // End:0x58
        if(NewCh != none)
        {
            SetCurrentChannelPage(NewCh);
        }
    }
    // End:0x6f
    if(Nick == "")
    {
        Nick = NickName;
    }
    W = FindChannelWindow(Channel);
    // End:0x9f
    if(W != none)
    {
        W.JoinedChannel(Nick);
    }
}

function PartedChannel(string Channel, optional string Nick)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x2b
    if(Nick == "")
    {
        RemoveChannel(Channel);
    }
    // End:0x4a
    else
    {
        // End:0x4a
        if(W != none)
        {
            W.PartedChannel(Nick);
        }
    }
}

function KickUser(string Channel, string KickedNick, string Kicker, string Reason)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x68
    if(KickedNick == NickName)
    {
        RemoveChannel(Channel);
        SystemText("*** " $ KickedFromText @ Channel @ ByText @ Kicker $ " (" $ Reason $ ")");
    }
    // End:0x91
    else
    {
        // End:0x91
        if(W != none)
        {
            W.KickUser(KickedNick, Kicker, Reason);
        }
    }
}

function UserInChannel(string Channel, string Nick)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x30
    if(W != none)
    {
        W.UserInChannel(Nick);
    }
}

function NotifyNickInUse()
{
    // End:0x57
    if(UT2k4IRC_NewNick(Controller.ActivePage) == none)
    {
        // End:0x57
        if(Controller.OpenMenu(NewNickMenu, NickInUseText, NickName))
        {
            Controller.ActivePage.__OnClose__Delegate = NewNickPageClosed;
        }
    }
}

function NotifyInvalidNick()
{
    // End:0x57
    if(UT2k4IRC_NewNick(Controller.ActivePage) == none)
    {
        // End:0x57
        if(Controller.OpenMenu(NewNickMenu, NickInvalidText, NickName))
        {
            Controller.ActivePage.__OnClose__Delegate = NewNickPageClosed;
        }
    }
}

function NotifyChannelKey(string chan)
{
    // End:0x52
    if(UT2K4IRC_ChanKey(Controller.ActivePage) == none)
    {
        // End:0x52
        if(Controller.OpenMenu(ChanKeyMenu, chan))
        {
            Controller.ActivePage.__OnClose__Delegate = ChanKeyPageClosed;
        }
    }
}

function ChangedNick(string OldNick, string NewNick)
{
    local int i;

    // End:0x3c
    if(OldNick == NickName)
    {
        NickName = NewNick;
        // End:0x39
        if(Link != none)
        {
            Link.NickName = NewNick;
        }
        SaveConfig();
    }
    i = 0;
    J0x43:
    // End:0x99 [While If]
    if(i < Channels.Length)
    {
        // End:0x8f
        if(Channels[i].FindNick(OldNick))
        {
            Channels[i].ChangedNick(OldNick, NewNick);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    // End:0xbd
    if(GetCurrentChannelName() ~= NewNick)
    {
        tp_Main.SetCloseCaption(NewNick);
    }
}

function UserQuit(string Nick, string Reason)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < Channels.Length)
    {
        // End:0x53
        if(Channels[i].FindNick(Nick))
        {
            Channels[i].UserQuit(Nick, Reason);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UserNotice(string Nick, string Text)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < Channels.Length)
    {
        // End:0x53
        if(Channels[i].FindNick(Nick))
        {
            Channels[i].UserNotice(Nick, Text);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ChangeMode(string Channel, string Nick, string Mode)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x35
    if(W != none)
    {
        W.ChangeMode(Nick, Mode);
    }
}

function ChangeOp(string Channel, string Nick, bool bOp)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeOp(Nick, bOp);
    }
}

function ChangeHalfOp(string Channel, string Nick, bool bHalfOp)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeHalfOp(Nick, bHalfOp);
    }
}

function ChangeVoice(string Channel, string Nick, bool bVoice)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeVoice(Nick, bVoice);
    }
}

function ChangeTopic(string Channel, string NewTopic)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x5f
    if(W != none)
    {
        Log("Topic (Channel: " $ Channel $ ") : " $ NewTopic, 'IRC');
        W.ChangeTopic(NewTopic);
    }
}

function CTCP(string Channel, string Nick, string Message)
{
    // End:0x42
    if(Channel == "" || Channel == NickName)
    {
        SystemText("[" $ Nick $ ": " $ Message $ "]");
    }
    // End:0x6f
    else
    {
        SystemText("[" $ Nick $ ":" $ Channel $ " " $ Message $ "]");
    }
}

function UT2K4IRC_Page GetCurrentChannel()
{
    // End:0x1b
    if(CurChannel != -1)
    {
        return Channels[CurChannel];
    }
    return self;
}

function string GetCurrentChannelName()
{
    // End:0x24
    if(CurChannel != -1)
    {
        return Channels[CurChannel].ChannelName;
    }
    return "";
}

function string GetDefaultChannel()
{
    return DefaultChannel;
}

function UT2k4IRC_Channel FindChannelWindow(string Channel, optional bool bIncludePrivate)
{
    local int i;

    i = FindPublicChannelIndex(Channel, bIncludePrivate);
    // End:0x32
    if(i != -1)
    {
        return Channels[i];
    }
    return none;
}

function UT2k4IRC_Private FindPrivateWindow(string Nick)
{
    local int i;

    i = FindPrivateChannelIndex(Nick);
    // End:0x31
    if(i != -1)
    {
        return UT2k4IRC_Private(Channels[i]);
    }
    return UT2k4IRC_Private(AddChannel(Nick, true));
}

function int FindPublicChannelIndex(string ChannelName, optional bool bIncludePrivate)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6a [While If]
    if(i < Channels.Length)
    {
        // End:0x60
        if(Channels[i].ChannelName ~= ChannelName)
        {
            // End:0x60
            if(!Channels[i].IsPrivate || bIncludePrivate)
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindPrivateChannelIndex(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5f [While If]
    if(i < Channels.Length)
    {
        // End:0x55
        if(Channels[i].IsPrivate && ChannelName ~= Channels[i].ChannelName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function SetCurrentChannelPage(UT2k4IRC_Channel ChannelPage)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < Channels.Length)
    {
        // End:0x39
        if(Channels[i] == ChannelPage)
        {
            SetCurrentChannel(i);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetCurrentChannel(int idx)
{
    // End:0x11
    if(idx == CurChannel)
    {
        return;
    }
    idx = Clamp(idx, -1, Channels.Length - 1);
    NewChannelSelected(idx);
}

function UpdateCurrentChannel(int NewCurrent)
{
    PrevChannel = CurChannel;
    CurChannel = NewCurrent;
    // End:0x54
    if(!ValidChannelIndex(CurChannel) || !Channels[CurChannel].IsPrivate)
    {
        tp_Main.SetCloseCaption();
    }
    // End:0x69
    else
    {
        tp_Main.SetCloseCaption(GetCurrentChannelName());
    }
}

function UpdateAway()
{
    // End:0x37
    if(IsConnected())
    {
        // End:0x27
        if(InGame() || InMenus())
        {
            ChangeAwayStatus(true);
        }
        // End:0x37
        else
        {
            // End:0x37
            if(IsAway())
            {
                ChangeAwayStatus(false);
            }
        }
    }
}

function PrintAwayMessage(string Nick, string Message)
{
    local export editinline UT2k4IRC_Private W;

    W = FindPrivateWindow(Nick);
    // End:0x38
    if(W != none)
    {
        W.PrintAwayMessage(Nick, Message);
    }
    // End:0x57
    else
    {
        SystemText(Nick @ IsAwayText $ ": " $ Message);
    }
}

function IRCClosed()
{
    UpdateAway();
}

protected function UT2K4IRCLink CreateNewLink()
{
    local class<UT2K4IRCLink> NewLinkClass;
    local UT2K4IRCLink NewLink;

    // End:0x0b
    if(PlayerOwner() == none)
    {
        return none;
    }
    // End:0x32
    if(LinkClassName != "")
    {
        NewLinkClass = class<UT2K4IRCLink>(DynamicLoadObject(LinkClassName, class'Class'));
    }
    // End:0x52
    if(NewLinkClass != none)
    {
        NewLink = PlayerOwner().Spawn(NewLinkClass);
    }
    return NewLink;
}

function UT2k4IRC_Channel AddChannel(string ChannelName, optional bool bPrivate, optional bool bActivate)
{
    local export editinline UT2k4IRC_Channel NewCh;

    NewCh = tp_Main.AddChannel(ChannelName, bPrivate);
    // End:0x8f
    if(NewCh != none)
    {
        NewCh.tp_System = self;
        NewCh.IsPrivate = bPrivate;
        NewCh.ChannelName = ChannelName;
        Channels[Channels.Length] = NewCh;
        // End:0x8f
        if(bActivate)
        {
            SetCurrentChannel(Channels.Length - 1);
        }
    }
    return NewCh;
}

function bool RemoveChannelAt(int Index)
{
    // End:0x12
    if(!ValidChannelIndex(Index))
    {
        return false;
    }
    // End:0x2c
    if(Index == CurChannel)
    {
        SetCurrentChannel(PrevChannel);
    }
    tp_Main.RemoveChannel(Channels[Index].ChannelName);
    Channels.Remove(Index, 1);
    return true;
}

function RemoveChannel(string Channel)
{
    local int i;

    i = FindPublicChannelIndex(Channel, true);
    // End:0x2c
    if(i != -1)
    {
        RemoveChannelAt(i);
    }
}

function bool ValidChannelIndex(int Index)
{
    // End:0x1f
    if(Index < 0 || Index >= Channels.Length)
    {
        return false;
    }
    return true;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x20
    if(UT2k4IRC_Panel(NewComp) != none)
    {
        p_IRC = UT2k4IRC_Panel(NewComp);
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

defaultproperties
{
    LinkClassName="GUI2K4.UT2K4IRCLink"
    CurChannel=-2
    PrevChannel=-1
    NewNickMenu="GUI2K4.UT2K4IRC_NewNick"
    ChanKeyMenu="GUI2K4.UT2K4IRC_ChanKey"
    NotInAChannelText="??? ????!"
    KickedFromText="?? ???? ???????:"
    ByText="??? ??:"
    IsAwayText=" ?? ??? ??????"
    ChooseNewNickText="??? IRC ???? ?????"
    NickInUseText="?? ???? ??????"
    NickInvalidText="??? ? ?? ??????"
    LeavePrivateText="%ChanName% ?? "
    CloseWindowCaption="?? ???"
    DisconnectCaption="????"
    ChangeNickCaption="??? ??"
    InvalidModeText="MODE?? ??? ? ?? ???? - Syntax: /MODE [#]target [[+|-]modes [Extra Params]]"
    InvalidKickText="%Cmd% ??? ? ?? ???? - Syntax: /%Cmd% #ChannelName Nick :[Reason]"
    begin object name=SplitterA class=GUISplitter
        SplitPosition=0.80
        bFixedSplitter=true
        DefaultPanels[0]="XInterface.GUIScrollTextBox"
        DefaultPanels[1]="GUI2K4.UT2K4IRC_Panel"
        OnCreateComponent=InternalOnCreateComponent
        WinHeight=0.950
        TabOrder=1
    object end
    // Reference: GUISplitter'UT2k4IRC_System.SplitterA'
    sp_Main=SplitterA
    MainSplitterPosition=0.50
}