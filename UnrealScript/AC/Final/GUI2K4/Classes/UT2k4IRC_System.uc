class UT2k4IRC_System extends UT2K4IRC_Page
    config(User)
    editinlinenew
    instanced;

enum EAwayMode
{
    AM_None,                        // 0
    AM_Server,                      // 1
    AM_InstantAction,               // 2
    AM_Menus                        // 3
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
//var delegate<OnConnect> __OnConnect__Delegate;
//var delegate<OnDisconnect> __OnDisconnect__Delegate;
//var delegate<NewChannelSelected> __NewChannelSelected__Delegate;

delegate OnConnect()
{
    //return;    
}

delegate OnDisconnect()
{
    //return;    
}

delegate NewChannelSelected(int CurrentChannel)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIComponent C;

    super.InitComponent(MyController, myOwner);
    sp_Main.bDrawSplitter = false;
    p_IRC.UpdateConnectionStatus(IsConnected());
    C = MenuOwner;
    J0x41:

    // End:0x86 [Loop If]
    if(C != none)
    {
        // End:0x6F
        if(UT2k4Browser_IRC(C) != none)
        {
            tp_Main = UT2k4Browser_IRC(C);
            // [Explicit Break]
            goto J0x86;
        }
        C = C.MenuOwner;
        // [Loop Continue]
        goto J0x41;
    }
    J0x86:

    assert(tp_Main != none);
    //return;    
}

function bool CanShowPanel()
{
    return Controller.bCurMenuInitialized;
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x35
    if(bShow)
    {
        // End:0x2D
        if(bInit)
        {
            sp_Main.SplitterUpdatePositions();
        }
        bInit = false;
    }
    //return;    
}

event Timer()
{
    // End:0x90
    if(((bConnected && PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none) && PlayerOwner().PlayerReplicationInfo.PlayerName != OldPlayerName)
    {
        OldPlayerName = PlayerOwner().PlayerReplicationInfo.PlayerName;
        Link.SetNick(OldPlayerName);
        SystemText("SetNick: " $ OldPlayerName);
    }
    //return;    
}

function bool LeaveAvailable(out string ButtonCaption)
{
    // End:0x20
    if(!ValidChannelIndex(CurChannel))
    {
        ButtonCaption = CloseWindowCaption;
        return false;        
    }
    else
    {
        // End:0x5C
        if(Channels[CurChannel].IsPrivate)
        {
            ButtonCaption = Repl(LeavePrivateText, "%ChanName%", GetCurrentChannelName());
            return true;            
        }
        else
        {
            ButtonCaption = CloseWindowCaption;
            return true;
        }
    }
    //return;    
}

function bool DisconnectAvailable(out string ButtonCaption)
{
    ButtonCaption = DisconnectCaption;
    return IsConnected();
    //return;    
}

function bool SetNickAvailable(out string ButtonCaption)
{
    ButtonCaption = ChangeNickCaption;
    return true;
    //return;    
}

function bool InGame()
{
    return !Controller.bActive;
    //return;    
}

function bool InMenus()
{
    // End:0x0B
    if(InGame())
    {
        return false;
    }
    // End:0xB2
    if((((UT2k4ServerBrowser(Controller.ActivePage) != none) && UT2k4ServerBrowser(Controller.ActivePage).c_Tabs != none) && UT2k4ServerBrowser(Controller.ActivePage).c_Tabs.ActiveTab != none) && UT2k4Browser_IRC(UT2k4ServerBrowser(Controller.ActivePage).c_Tabs.ActiveTab.MyPanel) != none)
    {
        return false;
    }
    return true;
    //return;    
}

function UpdateIdent()
{
    local int i;

    // End:0x6F
    if(UserIdent == "")
    {
        UserIdent = "u";
        i = 0;
        J0x1C:

        // End:0x45 [Loop If]
        if(i < 7)
        {
            UserIdent $= Chr(Rand(10) + 48);
            i++;
            // [Loop Continue]
            goto J0x1C;
        }
        Log("Created new UserIdent: " $ UserIdent, 'IRC');
        SaveConfig();
    }
    //return;    
}

function bool IsMe(string test)
{
    return test ~= NickName;
    //return;    
}

function bool IsConnected()
{
    return bConnected && Link != none;
    //return;    
}

function bool IsAway()
{
    return bAway;
    //return;    
}

function NotifyQuitUnreal()
{
    CloseLink(Link, false, "Exit Game");
    //return;    
}

function ChangeConnectStatus(bool NewStatus)
{
    bConnected = NewStatus;
    p_IRC.UpdateConnectionStatus(bConnected);
    tp_Main.CheckRefreshButton(bConnected);
    //return;    
}

function ChangeAwayStatus(bool NewStatus)
{
    local string URL;

    bAway = NewStatus;
    // End:0x2C
    if((PlayerOwner() == none) || PlayerOwner().Level == none)
    {
        return;
    }
    // End:0x16B
    if(IsConnected())
    {
        // End:0x142
        if(IsAway())
        {
            URL = PlayerOwner().Level.GetAddressURL();
            // End:0xCD
            if((InStr(URL, ":") > 0) && (int(AwayMode) != int(1)) || LastServer != URL)
            {
                LastServer = URL;
                Link.SetAway((PlayerOwner().GetURLProtocol() $ "://") $ URL);
                AwayMode = 1;                
            }
            else
            {
                // End:0x10E
                if((InGame()) && int(AwayMode) != int(2))
                {
                    AwayMode = 2;
                    Link.SetAway("local game");                    
                }
                else
                {
                    // End:0x13F
                    if(int(AwayMode) != int(3))
                    {
                        Link.SetAway("in menus");
                        AwayMode = 3;
                    }
                }
            }            
        }
        else
        {
            // End:0x16B
            if(int(AwayMode) != int(0))
            {
                Link.SetAway("");
                AwayMode = 0;
            }
        }
    }
    //return;    
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
            else
            {
                ChangedNick(NickName, NewNick);
            }
        }
    }
    //return;    
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
    //return;    
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
    // End:0xAA
    if(PC.PlayerReplicationInfo != none)
    {
        // End:0xA7
        if(PC.PlayerReplicationInfo.PlayerName != OldPlayerName)
        {
            NickName = PC.PlayerReplicationInfo.PlayerName;
            OldPlayerName = NickName;
            // End:0xA4
            if(FullName == "")
            {
                FullName = NickName;
            }
            SaveConfig();
        }        
    }
    else
    {
        NickName = PC.GetUrlOption("Name");
        OldPlayerName = NickName;
        // End:0xE7
        if(FullName == "")
        {
            FullName = NickName;
        }
        SaveConfig();
    }
    UpdateIdent();
    NewLink.Connect(self, NewServer, NickName, UserIdent, FullName, GetDefaultChannel());
    ChangeConnectStatus(true);
    SetTimer(1.0000000, true);
    return true;
    //return;    
}

function Disconnect()
{
    CloseLink(Link, false);
    //return;    
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
        // End:0x5F
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
    //return;    
}

function ProcessInput(string Text)
{
    local int i;

    // End:0x2C
    if(CurChannel > -1)
    {
        Channels[CurChannel].ProcessInput(Text);        
    }
    else
    {
        // End:0x52
        if(Left(Text, 1) != "/")
        {
            SystemText("*** " $ NotInAChannelText);            
        }
        else
        {
            Text = Mid(Text, 1);
            // End:0xC6
            if((Left(Text, 7) ~= "connect") || Left(Text, 6) ~= "server")
            {
                i = InStr(Text, " ");
                // End:0xC3
                if(i != -1)
                {
                    Connect(Mid(Text, i + 1));
                }                
            }
            else
            {
                // End:0x111
                if(Left(Text, 4) ~= "echo")
                {
                    i = InStr(Text, " ");
                    // End:0x10E
                    if(i != -1)
                    {
                        SystemText(Mid(Text, i + 1));
                    }                    
                }
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
    //return;    
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
    else
    {
        SetCurrentChannel(FindPublicChannelIndex(ChannelName));
    }
    //return;    
}

function PartCurrentChannel()
{
    // End:0x12
    if(!ValidChannelIndex(CurChannel))
    {
        return;
    }
    PartChannel(Channels[CurChannel].ChannelName);
    //return;    
}

function PartChannel(string ChannelName)
{
    local export editinline UT2k4IRC_Channel P;

    P = FindChannelWindow(ChannelName, true);
    // End:0x51
    if(P != none)
    {
        // End:0x3D
        if(P.IsPrivate)
        {
            RemoveChannel(ChannelName);            
        }
        else
        {
            Link.PartChannel(ChannelName);
        }
    }
    //return;    
}

function ChangeCurrentNick()
{
    // End:0x3E
    if(Controller.OpenMenu(NewNickMenu, ChooseNewNickText, NickName))
    {
        Controller.ActivePage.__OnClose__Delegate = NewNickPageClosed;
    }
    //return;    
}

function Whois(string Nick)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    Link.SendCommandText("WHOIS" @ Nick);
    //return;    
}

function Op(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("o", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
    //return;    
}

function Deop(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("o", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
    //return;    
}

function Voice(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("v", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
    //return;    
}

function DeVoice(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("v", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
    //return;    
}

function Help(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("h", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
    //return;    
}

function DeHelp(string Nick, string ChannelName)
{
    // End:0x0D
    if(Link == none)
    {
        return;
    }
    SetMode("h", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
    //return;    
}

function Kick(string Nick, string ChannelName, optional string Reason)
{
    // End:0x18
    if(Link == none)
    {
        SystemText(NotInAChannelText);
        return;
    }
    // End:0x4E
    if((Nick == "") || ChannelName == "")
    {
        SystemText(Repl(InvalidKickText, "%Cmd%", "KICK"));
        return;
    }
    Link.SendCommandText(("KICK" @ Nick) $ Eval(Reason != "", " :" $ Reason, ""));
    //return;    
}

function Ban(string Nick, string ChannelName, optional string Reason)
{
    SetMode("b", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), true, Nick);
    Kick(Nick, ChannelName, Reason);
    //return;    
}

function Unban(string Nick, string ChannelName)
{
    SetMode("b", Eval(Left(ChannelName, 1) == "#", ChannelName, "#" $ ChannelName), false, Nick);
    //return;    
}

function SetMode(string modes, string Target, bool On, optional string Extra)
{
    // End:0x18
    if(Link == none)
    {
        SystemText(NotInAChannelText);
        return;
    }
    // End:0x3F
    if((modes == "") || Target == "")
    {
        SystemText(InvalidModeText);
        return;
    }
    // End:0x96
    if(Link != none)
    {
        Link.SendCommandText(((("MODE" @ Target) @ Eval(On, "+", "-")) $ modes) $ Eval(Extra != "", " " $ Extra, ""));
    }
    //return;    
}

function SystemText(string Text)
{
    // End:0xB9
    if((Text != "You have been marked as being away") && Text != "You are no longer marked as being away")
    {
        InterpretColorCodes(Text);
        lb_TextDisplay.AddText((MakeColorCode(IRCTextColor)) $ (ColorizeLinks(Text)));
        // End:0xB9
        if(!MyButton.bActive)
        {
            MyButton.bForceFlash = true;
        }
    }
    //return;    
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
    //return;    
}

function PrivateText(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateText(Nick, Text);
    //return;    
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
    //return;    
}

function PrivateAction(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateAction(Nick, Text);
    //return;    
}

function JoinedChannel(string Channel, optional string Nick)
{
    local export editinline UT2k4IRC_Channel NewCh, W;

    Log((Nick @ "JoinedChannel ") $ Channel, 'IRC');
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
    // End:0x6F
    if(Nick == "")
    {
        Nick = NickName;
    }
    W = FindChannelWindow(Channel);
    // End:0x9F
    if(W != none)
    {
        W.JoinedChannel(Nick);
    }
    //return;    
}

function PartedChannel(string Channel, optional string Nick)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x2B
    if(Nick == "")
    {
        RemoveChannel(Channel);        
    }
    else
    {
        // End:0x4A
        if(W != none)
        {
            W.PartedChannel(Nick);
        }
    }
    //return;    
}

function KickUser(string Channel, string KickedNick, string Kicker, string Reason)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x68
    if(KickedNick == NickName)
    {
        RemoveChannel(Channel);
        SystemText((((((("*** " $ KickedFromText) @ Channel) @ ByText) @ Kicker) $ " (") $ Reason) $ ")");        
    }
    else
    {
        // End:0x91
        if(W != none)
        {
            W.KickUser(KickedNick, Kicker, Reason);
        }
    }
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
}

function ChangedNick(string OldNick, string NewNick)
{
    local int i;

    // End:0x3C
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

    // End:0x99 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x8F
        if(Channels[i].FindNick(OldNick))
        {
            Channels[i].ChangedNick(OldNick, NewNick);
        }
        i++;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0xBD
    if((GetCurrentChannelName()) ~= NewNick)
    {
        tp_Main.SetCloseCaption(NewNick);
    }
    //return;    
}

function UserQuit(string Nick, string Reason)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < Channels.Length)
    {
        // End:0x53
        if(Channels[i].FindNick(Nick))
        {
            Channels[i].UserQuit(Nick, Reason);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UserNotice(string Nick, string Text)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < Channels.Length)
    {
        // End:0x53
        if(Channels[i].FindNick(Nick))
        {
            Channels[i].UserNotice(Nick, Text);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
}

function ChangeTopic(string Channel, string NewTopic)
{
    local export editinline UT2k4IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x5F
    if(W != none)
    {
        Log((("Topic (Channel: " $ Channel) $ ") : ") $ NewTopic, 'IRC');
        W.ChangeTopic(NewTopic);
    }
    //return;    
}

function CTCP(string Channel, string Nick, string Message)
{
    // End:0x42
    if((Channel == "") || Channel == NickName)
    {
        SystemText(((("[" $ Nick) $ ": ") $ Message) $ "]");        
    }
    else
    {
        SystemText(((((("[" $ Nick) $ ":") $ Channel) $ " ") $ Message) $ "]");
    }
    //return;    
}

function UT2K4IRC_Page GetCurrentChannel()
{
    // End:0x1B
    if(CurChannel != -1)
    {
        return Channels[CurChannel];
    }
    return self;
    //return;    
}

function string GetCurrentChannelName()
{
    // End:0x24
    if(CurChannel != -1)
    {
        return Channels[CurChannel].ChannelName;
    }
    return "";
    //return;    
}

function string GetDefaultChannel()
{
    return DefaultChannel;
    //return;    
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
    //return;    
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
    //return;    
}

function int FindPublicChannelIndex(string ChannelName, optional bool bIncludePrivate)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6A [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindPrivateChannelIndex(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5F [Loop If]
    if(i < Channels.Length)
    {
        // End:0x55
        if(Channels[i].IsPrivate && ChannelName ~= Channels[i].ChannelName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function SetCurrentChannelPage(UT2k4IRC_Channel ChannelPage)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x39
        if(Channels[i] == ChannelPage)
        {
            SetCurrentChannel(i);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    //return;    
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
    else
    {
        tp_Main.SetCloseCaption(GetCurrentChannelName());
    }
    //return;    
}

function UpdateAway()
{
    // End:0x37
    if(IsConnected())
    {
        // End:0x27
        if((InGame()) || InMenus())
        {
            ChangeAwayStatus(true);            
        }
        else
        {
            // End:0x37
            if(IsAway())
            {
                ChangeAwayStatus(false);
            }
        }
    }
    //return;    
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
    else
    {
        SystemText(((Nick @ IsAwayText) $ ": ") $ Message);
    }
    //return;    
}

function IRCClosed()
{
    UpdateAway();
    //return;    
}

protected function UT2K4IRCLink CreateNewLink()
{
    local Class<UT2K4IRCLink> NewLinkClass;
    local UT2K4IRCLink NewLink;

    // End:0x0B
    if(PlayerOwner() == none)
    {
        return none;
    }
    // End:0x32
    if(LinkClassName != "")
    {
        NewLinkClass = Class<UT2K4IRCLink>(DynamicLoadObject(LinkClassName, Class'Core.Class'));
    }
    // End:0x52
    if(NewLinkClass != none)
    {
        NewLink = PlayerOwner().Spawn(NewLinkClass);
    }
    return NewLink;
    //return;    
}

function UT2k4IRC_Channel AddChannel(string ChannelName, optional bool bPrivate, optional bool bActivate)
{
    local export editinline UT2k4IRC_Channel NewCh;

    NewCh = tp_Main.AddChannel(ChannelName, bPrivate);
    // End:0x8F
    if(NewCh != none)
    {
        NewCh.tp_System = self;
        NewCh.IsPrivate = bPrivate;
        NewCh.ChannelName = ChannelName;
        Channels[Channels.Length] = NewCh;
        // End:0x8F
        if(bActivate)
        {
            SetCurrentChannel(Channels.Length - 1);
        }
    }
    return NewCh;
    //return;    
}

function bool RemoveChannelAt(int Index)
{
    // End:0x12
    if(!ValidChannelIndex(Index))
    {
        return false;
    }
    // End:0x2C
    if(Index == CurChannel)
    {
        SetCurrentChannel(PrevChannel);
    }
    tp_Main.RemoveChannel(Channels[Index].ChannelName);
    Channels.Remove(Index, 1);
    return true;
    //return;    
}

function RemoveChannel(string Channel)
{
    local int i;

    i = FindPublicChannelIndex(Channel, true);
    // End:0x2C
    if(i != -1)
    {
        RemoveChannelAt(i);
    }
    //return;    
}

function bool ValidChannelIndex(int Index)
{
    // End:0x1F
    if((Index < 0) || Index >= Channels.Length)
    {
        return false;
    }
    return true;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x20
    if(UT2k4IRC_Panel(NewComp) != none)
    {
        p_IRC = UT2k4IRC_Panel(NewComp);
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
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
    // Reference: GUISplitter'GUI2K4_Decompressed.UT2k4IRC_System.SplitterA'
    begin object name="SplitterA" class=XInterface.GUISplitter
        SplitPosition=0.8000000
        bFixedSplitter=true
        DefaultPanels[0]="XInterface.GUIScrollTextBox"
        DefaultPanels[1]="GUI2K4.UT2K4IRC_Panel"
        OnCreateComponent=UT2k4IRC_System.InternalOnCreateComponent
        WinHeight=0.9500000
        TabOrder=1
    end object
    sp_Main=SplitterA
    MainSplitterPosition=0.5000000
}