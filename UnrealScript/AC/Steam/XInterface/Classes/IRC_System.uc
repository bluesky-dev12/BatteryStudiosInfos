/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRC_System.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:30
 *	Functions:49
 *
 *******************************************************************************/
class IRC_System extends IRC_Page
    dependson(IRC_Page)
    dependson(IRCLink)
    dependson(IRC_Private)
    dependson(IRC_Channel)
    dependson(Browser_IRC)
    dependson(GUITabControl)
    dependson(GUIScrollTextBox)
    dependson(GUIComboBox)
    dependson(GUISplitter)
    config(User)
    editinlinenew
    instanced;

var export editinline Browser_IRC IRCPage;
var IRCLink Link;
var array<export editinline IRC_Channel> Channels;
var string TestIRCString;
var config string NickName;
var config string FullName;
var config string OldPlayerName;
var config string UserIdent;
var config array<string> ServerHistory;
var config array<string> ChannelHistory;
var localized array<localized string> DefaultChannels;
var bool bConnected;
var bool bAway;
var bool bSysInitialised;
var localized string NotInAChannelText;
var localized string KickedFromText;
var localized string ByText;
var localized string IsAwayText;
var localized string ConnectText;
var localized string DisconnectText;
var export editinline GUILabel ServerLabel;
var export editinline GUIButton ConnectButton;
var export editinline GUIComboBox ServerCombo;
var export editinline GUIButton RemoveServerButton;
var export editinline GUILabel ChannelLabel;
var export editinline GUIButton JoinChannelButton;
var export editinline GUIComboBox ChannelCombo;
var export editinline GUIButton RemoveChannelButton;
var int CurChannel;
var int PrevChannel;

function UpdateConnectCaption()
{
    // End:0x20
    if(bConnected)
    {
        ConnectButton.Caption = DisconnectText;
    }
    // End:0x34
    else
    {
        ConnectButton.Caption = ConnectText;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIPanel UtilPanel;
    local int i, j;

    // End:0x10d
    if(!bSysInitialised)
    {
        GUISplitter(Controls[1]).bDrawSplitter = false;
        UtilPanel = GUIPanel(GUISplitter(Controls[1]).Controls[1]);
        UtilPanel.Controls.Length = 8;
        UtilPanel.Controls[0] = ConnectButton;
        UtilPanel.Controls[1] = ServerCombo;
        UtilPanel.Controls[2] = RemoveServerButton;
        UtilPanel.Controls[3] = ServerLabel;
        UtilPanel.Controls[4] = JoinChannelButton;
        UtilPanel.Controls[5] = ChannelCombo;
        UtilPanel.Controls[6] = RemoveChannelButton;
        UtilPanel.Controls[7] = ChannelLabel;
    }
    super.InitComponent(MyController, myOwner);
    // End:0x289
    if(!bSysInitialised)
    {
        SetTimer(1.0, true);
        UpdateConnectCaption();
        Log(string(ServerHistory.Length) $ " Servers " $ string(ChannelHistory.Length) $ " Channels");
        i = 0;
        J0x16c:
        // End:0x1a0 [While If]
        if(i < ServerHistory.Length)
        {
            ServerCombo.AddItem(ServerHistory[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x16c;
        }
        // End:0x1c2
        if(ServerHistory.Length > 0)
        {
            ServerCombo.SetText(ServerHistory[0]);
        }
        // End:0x224
        if(ChannelHistory.Length == 0)
        {
            i = 0;
            J0x1d5:
            // End:0x224 [While If]
            if(i < DefaultChannels.Length)
            {
                j = ChannelHistory.Length + 1;
                ChannelHistory.Length = j;
                ChannelHistory[j - 1] = DefaultChannels[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1d5;
            }
        }
        i = 0;
        J0x22b:
        // End:0x25f [While If]
        if(i < ChannelHistory.Length)
        {
            ChannelCombo.AddItem(ChannelHistory[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x22b;
        }
        // End:0x281
        if(ChannelHistory.Length > 0)
        {
            ChannelCombo.SetText(ChannelHistory[0]);
        }
        bSysInitialised = true;
    }
}

function int FindServerHistoryIndex(string ServerName)
{
    local int iX, i;

    iX = -1;
    i = 0;
    J0x12:
    // End:0x5d [While If]
    if(i < ServerHistory.Length && iX == -1)
    {
        // End:0x53
        if(ServerHistory[i] ~= ServerName)
        {
            iX = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return iX;
}

function int FindChannelHistoryIndex(string ChannelName)
{
    local int iX, i;

    iX = -1;
    i = 0;
    J0x12:
    // End:0x5d [While If]
    if(i < ChannelHistory.Length && iX == -1)
    {
        // End:0x53
        if(ChannelHistory[i] ~= ChannelName)
        {
            iX = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return iX;
}

function bool ConnectClick(GUIComponent Sender)
{
    local int i;
    local string ServerName;

    // End:0x11
    if(Sender != ConnectButton)
    {
        return true;
    }
    // End:0x23
    if(bConnected)
    {
        Disconnect();
    }
    // End:0xe3
    else
    {
        Connect();
        // End:0xe3
        if(bConnected)
        {
            ServerName = ServerCombo.Edit.GetText();
            i = FindServerHistoryIndex(ServerName);
            // End:0xe3
            if(i == -1)
            {
                i = ServerHistory.Length + 1;
                ServerHistory.Length = i;
                ServerHistory[i - 1] = ServerName;
                SaveConfig();
                ServerCombo.AddItem(ServerName);
                ServerCombo.SetText(ServerName);
                ServerCombo.List.Top = 0;
            }
        }
    }
    return true;
}

function bool JoinChannelClick(GUIComponent Sender)
{
    local int i;
    local string ChannelName;

    // End:0x1e
    if(Sender != JoinChannelButton || !bConnected)
    {
        return true;
    }
    JoinChannel(ChannelCombo.Edit.GetText());
    ChannelName = ChannelCombo.Edit.GetText();
    i = FindChannelHistoryIndex(ChannelName);
    // End:0xed
    if(i == -1)
    {
        i = ChannelHistory.Length + 1;
        ChannelHistory.Length = i;
        ChannelHistory[i - 1] = ChannelName;
        SaveConfig();
        ChannelCombo.AddItem(ChannelName);
        ChannelCombo.SetText(ChannelName);
        ChannelCombo.List.Top = 0;
    }
    return true;
}

function bool RemoveServerClick(GUIComponent Sender)
{
    local string ServerName;
    local int i;

    ServerName = ServerCombo.Edit.GetText();
    i = FindServerHistoryIndex(ServerName);
    // End:0x84
    if(i != -1)
    {
        ServerHistory.Remove(i, 1);
        SaveConfig();
        ServerCombo.RemoveItem(i, 1);
        // End:0x84
        if(ServerHistory.Length > 0)
        {
            ServerCombo.SetText(ServerHistory[0]);
        }
    }
    return true;
}

function bool RemoveChannelClick(GUIComponent Sender)
{
    local string ChannelName;
    local int i;

    ChannelName = ChannelCombo.Edit.GetText();
    i = FindChannelHistoryIndex(ChannelName);
    // End:0x84
    if(i != -1)
    {
        ChannelHistory.Remove(i, 1);
        SaveConfig();
        ChannelCombo.RemoveItem(i, 1);
        // End:0x84
        if(ChannelHistory.Length > 0)
        {
            ChannelCombo.SetText(ChannelHistory[0]);
        }
    }
    return true;
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

function SetCurrentChannelPage(IRC_Channel ChannelPage)
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
    // End:0x37
    if(idx < -1 || idx > Channels.Length - 1 || idx == CurChannel)
    {
        return;
    }
    PrevChannel = CurChannel;
    CurChannel = idx;
    // End:0x9e
    if(CurChannel == -1)
    {
        // End:0x9b
        if(IRCPage.ChannelTabs.ActiveTab != MyButton)
        {
            IRCPage.ChannelTabs.ActivateTab(MyButton, true);
        }
    }
    // End:0xfb
    else
    {
        // End:0xfb
        if(IRCPage.ChannelTabs.ActiveTab != Channels[CurChannel].MyButton)
        {
            IRCPage.ChannelTabs.ActivateTab(Channels[CurChannel].MyButton, true);
        }
    }
}

function IRC_Page GetActivePage()
{
    // End:0x1b
    if(CurChannel != -1)
    {
        return Channels[CurChannel];
    }
    return self;
}

function ProcessInput(string Text)
{
    // End:0x2c
    if(CurChannel > -1)
    {
        Channels[CurChannel].ProcessInput(Text);
    }
    // End:0x69
    else
    {
        // End:0x52
        if(Left(Text, 1) != "/")
        {
            SystemText("*** " $ NotInAChannelText);
        }
        // End:0x69
        else
        {
            Link.SendCommandText(Mid(Text, 1));
        }
    }
}

function IRC_Channel FindChannelWindow(string Channel)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x69 [While If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
        }
        // End:0x5f
        else
        {
            // End:0x5f
            if(Channels[i].ChannelName ~= Channel)
            {
                return Channels[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function int FindChannelIndex(string Channel)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x63 [While If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
        }
        // End:0x59
        else
        {
            // End:0x59
            if(Channels[i].ChannelName ~= Channel)
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

function IRC_Private FindPrivateWindow(string Nick)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6e [While If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == false)
        {
        }
        // End:0x64
        else
        {
            // End:0x64
            if(Channels[i].ChannelName ~= Nick)
            {
                return IRC_Private(Channels[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return CreatePrivChannel(Nick);
}

function Connect()
{
    local int i;
    local PlayerController PC;

    // End:0x11
    if(Link != none)
    {
        Disconnect();
    }
    PC = PlayerOwner();
    assert(PC != none);
    // End:0x9f
    if(PC.PlayerReplicationInfo != none)
    {
        // End:0x9c
        if(PC.PlayerReplicationInfo.PlayerName != OldPlayerName)
        {
            NickName = PC.PlayerReplicationInfo.PlayerName;
            OldPlayerName = NickName;
            // End:0x99
            if(FullName == "")
            {
                FullName = NickName;
            }
            SaveConfig();
        }
    }
    // End:0xdd
    else
    {
        NickName = PlayerOwner().GetUrlOption("Name");
        OldPlayerName = NickName;
        // End:0xda
        if(FullName == "")
        {
            FullName = NickName;
        }
        SaveConfig();
    }
    // End:0x14b
    if(UserIdent == "")
    {
        UserIdent = "u";
        i = 0;
        J0xf9:
        // End:0x126 [While If]
        if(i < 7)
        {
            UserIdent = UserIdent $ Chr(Rand(10) + 48);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf9;
        }
        Log("Created new UserIdent: " $ UserIdent);
        SaveConfig();
    }
    Link = PlayerOwner().GetEntryLevel().Spawn(class'IRCLink');
    Link.Connect(self, ServerCombo.Edit.GetText(), NickName, UserIdent, FullName, "");
    bConnected = true;
    UpdateConnectCaption();
}

function JoinChannel(string ChannelName)
{
    local export editinline IRC_Channel P;

    P = FindChannelWindow(ChannelName);
    // End:0x33
    if(P == none)
    {
        Link.JoinChannel(ChannelName);
    }
    // End:0x44
    else
    {
        SetCurrentChannel(FindChannelIndex(ChannelName));
    }
}

function PartCurrentChannel()
{
    // End:0x11
    if(CurChannel == -1)
    {
        return;
    }
    // End:0x7a
    if(Channels[CurChannel].IsA('IRC_Private'))
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[CurChannel].MyButton.Caption);
        Channels.Remove(CurChannel, 1);
        SetCurrentChannel(-1);
    }
    // End:0x94
    else
    {
        PartChannel(Channels[CurChannel].ChannelName);
    }
}

function PartChannel(string ChannelName)
{
    local export editinline IRC_Channel P;

    P = FindChannelWindow(ChannelName);
    // End:0x30
    if(P != none)
    {
        Link.PartChannel(ChannelName);
    }
}

function Disconnect()
{
    local int i;

    // End:0x37
    if(Link != none)
    {
        Link.DisconnectReason = "Disconnected";
        Link.DestroyLink();
    }
    Link = none;
    i = 0;
    J0x45:
    // End:0x94 [While If]
    if(i < Channels.Length)
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[i].MyButton.Caption);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    Channels.Length = 0;
    CurChannel = -1;
    SystemText("Server disconnected");
    bConnected = false;
    // End:0x113
    if(IRCPage.ChannelTabs.ActiveTab != self.MyButton)
    {
        IRCPage.ChannelTabs.ActivateTab(self.MyButton, true);
    }
    UpdateConnectCaption();
}

function NotifyQuitUnreal()
{
    // End:0x34
    if(Link != none)
    {
        Link.DisconnectReason = "Exit Game";
        Link.DestroyLink();
    }
}

function SystemText(string Text)
{
    // End:0xae
    if(Text != "You have been marked as being away" && Text != "You are no longer marked as being away")
    {
        TextDisplay.AddText(MakeColorCode(IRCTextColor) $ ColorizeLinks(Text));
        // End:0xae
        if(!MyButton.bActive)
        {
            MyButton.bForceFlash = true;
        }
    }
}

function ChannelText(string Channel, string Nick, string Text)
{
    local export editinline IRC_Channel P;

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

function IRC_Private CreatePrivChannel(string Nick, optional bool bMakeActive)
{
    local export editinline IRC_Private priv;

    priv = IRC_Private(IRCPage.ChannelTabs.AddTab(Nick, "xinterface.IRC_Private"));
    Channels[Channels.Length] = priv;
    priv.SystemPage = self;
    priv.IsPrivate = true;
    priv.ChannelName = Nick;
    // End:0x9f
    if(bMakeActive)
    {
        SetCurrentChannel(Channels.Length - 1);
    }
    return priv;
}

function ChannelAction(string Channel, string Nick, string Text)
{
    local export editinline IRC_Channel P;

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
    local export editinline IRC_Channel NewCh, W;

    Log("JoinedChannel " $ Channel, 'IRC');
    // End:0xc0
    if(Nick == "")
    {
        NewCh = IRC_Channel(IRCPage.ChannelTabs.AddTab(Channel, "xinterface.IRC_Channel"));
        Channels[Channels.Length] = NewCh;
        NewCh.SystemPage = self;
        NewCh.IsPrivate = false;
        NewCh.ChannelName = Channel;
        SetCurrentChannel(Channels.Length - 1);
    }
    // End:0xd7
    if(Nick == "")
    {
        Nick = NickName;
    }
    W = FindChannelWindow(Channel);
    // End:0x107
    if(W != none)
    {
        W.JoinedChannel(Nick);
    }
}

function RemoveChannel(string Channel)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x60 [While If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
        }
        // End:0x56
        else
        {
            // End:0x56
            if(Channels[i].ChannelName ~= Channel)
            {
            }
            // End:0x60
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    // End:0xbc
    if(i < Channels.Length)
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[i].MyButton.Caption);
        Channels.Remove(i, 1);
        SetCurrentChannel(-1);
    }
}

function KickUser(string Channel, string KickedNick, string Kicker, string Reason)
{
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x30
    if(W != none)
    {
        W.UserInChannel(Nick);
    }
}

function PartedChannel(string Channel, optional string Nick)
{
    local export editinline IRC_Channel W;

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

function ChangedNick(string OldNick, string NewNick)
{
    local int i;

    // End:0x31
    if(OldNick == NickName)
    {
        NickName = NewNick;
        Link.NickName = NewNick;
        SaveConfig();
    }
    i = 0;
    J0x38:
    // End:0xae [While If]
    if(i < Channels.Length)
    {
        // End:0xa4
        if(Channels[i].FindNick(OldNick) || Channels[i].ChannelName ~= OldNick)
        {
            Channels[i].ChangedNick(OldNick, NewNick);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x38;
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
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x35
    if(W != none)
    {
        W.ChangeMode(Nick, Mode);
    }
}

function ChangeOp(string Channel, string Nick, bool bOp)
{
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeOp(Nick, bOp);
    }
}

function ChangeHalfOp(string Channel, string Nick, bool bHalfOp)
{
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeHalfOp(Nick, bHalfOp);
    }
}

function ChangeVoice(string Channel, string Nick, bool bVoice)
{
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x36
    if(W != none)
    {
        W.ChangeVoice(Nick, bVoice);
    }
}

function ChangeTopic(string Channel, string NewTopic)
{
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x5a
    if(W != none)
    {
        Log("Topic (Channel: " $ Channel $ ") : " $ NewTopic);
        W.ChangeTopic(NewTopic);
    }
}

function IsAway(string Nick, string Message)
{
    local export editinline IRC_Private W;

    W = FindPrivateWindow(Nick);
    // End:0x38
    if(W != none)
    {
        W.IsAway(Nick, Message);
    }
    // End:0x57
    else
    {
        SystemText(Nick @ IsAwayText $ ": " $ Message);
    }
}

function IRCVisible()
{
    // End:0x2b
    if(bAway)
    {
        // End:0x23
        if(bConnected)
        {
            Link.SetAway("");
        }
        bAway = false;
    }
}

function IRCClosed()
{
    CheckAway();
}

function NotifyAfterLevelChange()
{
    CheckAway();
}

function bool InGame()
{
    // End:0x19
    if(!Controller.bActive)
    {
        return true;
    }
    // End:0x1b
    else
    {
        return false;
    }
}

function UpdateAway()
{
    local string URL, AwayString;

    // End:0xae
    if(bConnected)
    {
        // End:0x30
        if(!InGame())
        {
            Link.SetAway("");
            bAway = false;
        }
        // End:0xae
        else
        {
            URL = PlayerOwner().Level.GetAddressURL();
            // End:0x80
            if(InStr(URL, ":") > 0)
            {
                AwayString = PlayerOwner().GetURLProtocol() $ "://" $ URL;
            }
            // End:0x92
            else
            {
                AwayString = "local game";
            }
            Link.SetAway(AwayString);
            bAway = true;
        }
    }
}

function CheckAway()
{
    local string URL;

    // End:0xaa
    if(bConnected)
    {
        bAway = true;
        URL = PlayerOwner().Level.GetAddressURL();
        // End:0x6a
        if(InStr(URL, ":") > 0)
        {
            Link.SetAway(PlayerOwner().GetURLProtocol() $ "://" $ URL);
        }
        // End:0xaa
        else
        {
            // End:0x91
            if(InGame())
            {
                Link.SetAway("local game");
            }
            // End:0xaa
            else
            {
                Link.SetAway("in menus");
            }
        }
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

defaultproperties
{
    NotInAChannelText="  is not in the channel!"
    KickedFromText="You were kicked from channel: "
    ByText="You were kicked by: "
    IsAwayText="  is currently idle."
    ConnectText="Connecting?"
    DisconnectText="Connection terminating."
    begin object name=MyServerLabel class=GUILabel
        Caption="Server"
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.10
        WinLeft=0.030
        WinWidth=0.20
        WinHeight=0.30
    object end
    // Reference: GUILabel'IRC_System.MyServerLabel'
    ServerLabel=MyServerLabel
    begin object name=MyConnectButton class=GUIButton
        WinTop=0.10
        WinLeft=0.560
        WinWidth=0.20
        WinHeight=0.30
        OnClick=ConnectClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'IRC_System.MyConnectButton'
    ConnectButton=MyConnectButton
    begin object name=MyServerCombo class=GUIComboBox
        WinTop=0.10
        WinLeft=0.150
        WinWidth=0.40
        WinHeight=0.30
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'IRC_System.MyServerCombo'
    ServerCombo=MyServerCombo
    begin object name=MyRemoveServerButton class=GUIButton
        Caption="Remove Server"
        WinTop=0.10
        WinLeft=0.770
        WinWidth=0.20
        WinHeight=0.30
        OnClick=RemoveServerClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'IRC_System.MyRemoveServerButton'
    RemoveServerButton=MyRemoveServerButton
    begin object name=MyChannelLabel class=GUILabel
        Caption="Channel"
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.50
        WinLeft=0.030
        WinWidth=0.20
        WinHeight=0.30
    object end
    // Reference: GUILabel'IRC_System.MyChannelLabel'
    ChannelLabel=MyChannelLabel
    begin object name=MyJoinChannelButton class=GUIButton
        Caption="Join Channel"
        WinTop=0.50
        WinLeft=0.560
        WinWidth=0.20
        WinHeight=0.30
        OnClick=JoinChannelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'IRC_System.MyJoinChannelButton'
    JoinChannelButton=MyJoinChannelButton
    begin object name=MyChannelCombo class=GUIComboBox
        WinTop=0.50
        WinLeft=0.150
        WinWidth=0.40
        WinHeight=0.30
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'IRC_System.MyChannelCombo'
    ChannelCombo=MyChannelCombo
    begin object name=MyRemoveChannelButton class=GUIButton
        Caption="Remove Channel"
        WinTop=0.50
        WinLeft=0.770
        WinWidth=0.20
        WinHeight=0.30
        OnClick=RemoveChannelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'IRC_System.MyRemoveChannelButton'
    RemoveChannelButton=MyRemoveChannelButton
    CurChannel=-1
    PrevChannel=-1
}