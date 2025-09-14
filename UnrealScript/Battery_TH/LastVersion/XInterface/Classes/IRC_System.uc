class IRC_System extends IRC_Page
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
    else
    {
        ConnectButton.Caption = ConnectText;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIPanel UtilPanel;
    local int i, j;

    // End:0x10D
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
        SetTimer(1.0000000, true);
        UpdateConnectCaption();
        Log(((string(ServerHistory.Length) $ " Servers ") $ string(ChannelHistory.Length)) $ " Channels");
        i = 0;
        J0x16C:

        // End:0x1A0 [Loop If]
        if(i < ServerHistory.Length)
        {
            ServerCombo.AddItem(ServerHistory[i]);
            i++;
            // [Loop Continue]
            goto J0x16C;
        }
        // End:0x1C2
        if(ServerHistory.Length > 0)
        {
            ServerCombo.SetText(ServerHistory[0]);
        }
        // End:0x224
        if(ChannelHistory.Length == 0)
        {
            i = 0;
            J0x1D5:

            // End:0x224 [Loop If]
            if(i < DefaultChannels.Length)
            {
                j = ChannelHistory.Length + 1;
                ChannelHistory.Length = j;
                ChannelHistory[j - 1] = DefaultChannels[i];
                i++;
                // [Loop Continue]
                goto J0x1D5;
            }
        }
        i = 0;
        J0x22B:

        // End:0x25F [Loop If]
        if(i < ChannelHistory.Length)
        {
            ChannelCombo.AddItem(ChannelHistory[i]);
            i++;
            // [Loop Continue]
            goto J0x22B;
        }
        // End:0x281
        if(ChannelHistory.Length > 0)
        {
            ChannelCombo.SetText(ChannelHistory[0]);
        }
        bSysInitialised = true;
    }
    //return;    
}

function int FindServerHistoryIndex(string ServerName)
{
    local int iX, i;

    iX = -1;
    i = 0;
    J0x12:

    // End:0x5D [Loop If]
    if((i < ServerHistory.Length) && iX == -1)
    {
        // End:0x53
        if(ServerHistory[i] ~= ServerName)
        {
            iX = i;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return iX;
    //return;    
}

function int FindChannelHistoryIndex(string ChannelName)
{
    local int iX, i;

    iX = -1;
    i = 0;
    J0x12:

    // End:0x5D [Loop If]
    if((i < ChannelHistory.Length) && iX == -1)
    {
        // End:0x53
        if(ChannelHistory[i] ~= ChannelName)
        {
            iX = i;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return iX;
    //return;    
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
    else
    {
        Connect();
        // End:0xE3
        if(bConnected)
        {
            ServerName = ServerCombo.Edit.GetText();
            i = FindServerHistoryIndex(ServerName);
            // End:0xE3
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
    //return;    
}

function bool JoinChannelClick(GUIComponent Sender)
{
    local int i;
    local string ChannelName;

    // End:0x1E
    if((Sender != JoinChannelButton) || !bConnected)
    {
        return true;
    }
    JoinChannel(ChannelCombo.Edit.GetText());
    ChannelName = ChannelCombo.Edit.GetText();
    i = FindChannelHistoryIndex(ChannelName);
    // End:0xED
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
    //return;    
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
    //return;    
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

function SetCurrentChannelPage(IRC_Channel ChannelPage)
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
    // End:0x37
    if(((idx < -1) || idx > (Channels.Length - 1)) || idx == CurChannel)
    {
        return;
    }
    PrevChannel = CurChannel;
    CurChannel = idx;
    // End:0x9E
    if(CurChannel == -1)
    {
        // End:0x9B
        if(IRCPage.ChannelTabs.ActiveTab != MyButton)
        {
            IRCPage.ChannelTabs.ActivateTab(MyButton, true);
        }        
    }
    else
    {
        // End:0xFB
        if(IRCPage.ChannelTabs.ActiveTab != Channels[CurChannel].MyButton)
        {
            IRCPage.ChannelTabs.ActivateTab(Channels[CurChannel].MyButton, true);
        }
    }
    //return;    
}

function IRC_Page GetActivePage()
{
    // End:0x1B
    if(CurChannel != -1)
    {
        return Channels[CurChannel];
    }
    return self;
    //return;    
}

function ProcessInput(string Text)
{
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
            Link.SendCommandText(Mid(Text, 1));
        }
    }
    //return;    
}

function IRC_Channel FindChannelWindow(string Channel)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
            // [Explicit Continue]
            goto J0x5F;
        }
        // End:0x5F
        if(Channels[i].ChannelName ~= Channel)
        {
            return Channels[i];
        }
        J0x5F:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function int FindChannelIndex(string Channel)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
            // [Explicit Continue]
            goto J0x59;
        }
        // End:0x59
        if(Channels[i].ChannelName ~= Channel)
        {
            return i;
        }
        J0x59:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function IRC_Private FindPrivateWindow(string Nick)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6E [Loop If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == false)
        {
            // [Explicit Continue]
            goto J0x64;
        }
        // End:0x64
        if(Channels[i].ChannelName ~= Nick)
        {
            return IRC_Private(Channels[i]);
        }
        J0x64:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return CreatePrivChannel(Nick);
    //return;    
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
    // End:0x9F
    if(PC.PlayerReplicationInfo != none)
    {
        // End:0x9C
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
    else
    {
        NickName = PlayerOwner().GetUrlOption("Name");
        OldPlayerName = NickName;
        // End:0xDA
        if(FullName == "")
        {
            FullName = NickName;
        }
        SaveConfig();
    }
    // End:0x14B
    if(UserIdent == "")
    {
        UserIdent = "u";
        i = 0;
        J0xF9:

        // End:0x126 [Loop If]
        if(i < 7)
        {
            UserIdent = UserIdent $ Chr(Rand(10) + 48);
            i++;
            // [Loop Continue]
            goto J0xF9;
        }
        Log("Created new UserIdent: " $ UserIdent);
        SaveConfig();
    }
    Link = PlayerOwner().GetEntryLevel().Spawn(Class'XInterface_Decompressed.IRCLink');
    Link.Connect(self, ServerCombo.Edit.GetText(), NickName, UserIdent, FullName, "");
    bConnected = true;
    UpdateConnectCaption();
    //return;    
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
    else
    {
        SetCurrentChannel(FindChannelIndex(ChannelName));
    }
    //return;    
}

function PartCurrentChannel()
{
    // End:0x11
    if(CurChannel == -1)
    {
        return;
    }
    // End:0x7A
    if(Channels[CurChannel].IsA('IRC_Private'))
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[CurChannel].MyButton.Caption);
        Channels.Remove(CurChannel, 1);
        SetCurrentChannel(-1);        
    }
    else
    {
        PartChannel(Channels[CurChannel].ChannelName);
    }
    //return;    
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
    //return;    
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

    // End:0x94 [Loop If]
    if(i < Channels.Length)
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[i].MyButton.Caption);
        i++;
        // [Loop Continue]
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
    //return;    
}

function NotifyQuitUnreal()
{
    // End:0x34
    if(Link != none)
    {
        Link.DisconnectReason = "Exit Game";
        Link.DestroyLink();
    }
    //return;    
}

function SystemText(string Text)
{
    // End:0xAE
    if((Text != "You have been marked as being away") && Text != "You are no longer marked as being away")
    {
        TextDisplay.AddText((MakeColorCode(IRCTextColor)) $ (ColorizeLinks(Text)));
        // End:0xAE
        if(!MyButton.bActive)
        {
            MyButton.bForceFlash = true;
        }
    }
    //return;    
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
    //return;    
}

function PrivateText(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateText(Nick, Text);
    //return;    
}

function IRC_Private CreatePrivChannel(string Nick, optional bool bMakeActive)
{
    local export editinline IRC_Private priv;

    priv = IRC_Private(IRCPage.ChannelTabs.AddTab(Nick, "xinterface.IRC_Private"));
    Channels[Channels.Length] = priv;
    priv.SystemPage = self;
    priv.IsPrivate = true;
    priv.ChannelName = Nick;
    // End:0x9F
    if(bMakeActive)
    {
        SetCurrentChannel(Channels.Length - 1);
    }
    return priv;
    //return;    
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
    //return;    
}

function PrivateAction(string Nick, string Text)
{
    FindPrivateWindow(Nick).PrivateAction(Nick, Text);
    //return;    
}

function JoinedChannel(string Channel, optional string Nick)
{
    local export editinline IRC_Channel NewCh, W;

    Log("JoinedChannel " $ Channel, 'IRC');
    // End:0xC0
    if(Nick == "")
    {
        NewCh = IRC_Channel(IRCPage.ChannelTabs.AddTab(Channel, "xinterface.IRC_Channel"));
        Channels[Channels.Length] = NewCh;
        NewCh.SystemPage = self;
        NewCh.IsPrivate = false;
        NewCh.ChannelName = Channel;
        SetCurrentChannel(Channels.Length - 1);
    }
    // End:0xD7
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
    //return;    
}

function RemoveChannel(string Channel)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x60 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x35
        if(Channels[i].IsPrivate == true)
        {
            // [Explicit Continue]
            goto J0x56;
        }
        // End:0x56
        if(Channels[i].ChannelName ~= Channel)
        {
            // [Explicit Break]
            goto J0x60;
        }
        J0x56:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x60:

    // End:0xBC
    if(i < Channels.Length)
    {
        IRCPage.ChannelTabs.RemoveTab(Channels[i].MyButton.Caption);
        Channels.Remove(i, 1);
        SetCurrentChannel(-1);
    }
    //return;    
}

function KickUser(string Channel, string KickedNick, string Kicker, string Reason)
{
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x30
    if(W != none)
    {
        W.UserInChannel(Nick);
    }
    //return;    
}

function PartedChannel(string Channel, optional string Nick)
{
    local export editinline IRC_Channel W;

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

    // End:0xAE [Loop If]
    if(i < Channels.Length)
    {
        // End:0xA4
        if(Channels[i].FindNick(OldNick) || Channels[i].ChannelName ~= OldNick)
        {
            Channels[i].ChangedNick(OldNick, NewNick);
        }
        i++;
        // [Loop Continue]
        goto J0x38;
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
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

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
    local export editinline IRC_Channel W;

    W = FindChannelWindow(Channel);
    // End:0x5A
    if(W != none)
    {
        Log((("Topic (Channel: " $ Channel) $ ") : ") $ NewTopic);
        W.ChangeTopic(NewTopic);
    }
    //return;    
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
    else
    {
        SystemText(((Nick @ IsAwayText) $ ": ") $ Message);
    }
    //return;    
}

function IRCVisible()
{
    // End:0x2B
    if(bAway)
    {
        // End:0x23
        if(bConnected)
        {
            Link.SetAway("");
        }
        bAway = false;
    }
    //return;    
}

function IRCClosed()
{
    CheckAway();
    //return;    
}

function NotifyAfterLevelChange()
{
    CheckAway();
    //return;    
}

function bool InGame()
{
    // End:0x19
    if(!Controller.bActive)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function UpdateAway()
{
    local string URL, AwayString;

    // End:0xAE
    if(bConnected)
    {
        // End:0x30
        if(!InGame())
        {
            Link.SetAway("");
            bAway = false;            
        }
        else
        {
            URL = PlayerOwner().Level.GetAddressURL();
            // End:0x80
            if(InStr(URL, ":") > 0)
            {
                AwayString = (PlayerOwner().GetURLProtocol() $ "://") $ URL;                
            }
            else
            {
                AwayString = "local game";
            }
            Link.SetAway(AwayString);
            bAway = true;
        }
    }
    //return;    
}

function CheckAway()
{
    local string URL;

    // End:0xAA
    if(bConnected)
    {
        bAway = true;
        URL = PlayerOwner().Level.GetAddressURL();
        // End:0x6A
        if(InStr(URL, ":") > 0)
        {
            Link.SetAway((PlayerOwner().GetURLProtocol() $ "://") $ URL);            
        }
        else
        {
            // End:0x91
            if(InGame())
            {
                Link.SetAway("local game");                
            }
            else
            {
                Link.SetAway("in menus");
            }
        }
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

defaultproperties
{
    NotInAChannelText="Not in a channel!"
    KickedFromText="You were kicked from"
    ByText="by"
    IsAwayText="is away"
    ConnectText="CONNECT"
    DisconnectText="DISCONNECT"
    // Reference: GUILabel'XInterface_Decompressed.IRC_System.MyServerLabel'
    begin object name="MyServerLabel" class=XInterface_Decompressed.GUILabel
        Caption="Server"
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.1000000
        WinLeft=0.0300000
        WinWidth=0.2000000
        WinHeight=0.3000000
    end object
    ServerLabel=MyServerLabel
    // Reference: GUIButton'XInterface_Decompressed.IRC_System.MyConnectButton'
    begin object name="MyConnectButton" class=XInterface_Decompressed.GUIButton
        WinTop=0.1000000
        WinLeft=0.5600000
        WinWidth=0.2000000
        WinHeight=0.3000000
        OnClick=IRC_System.ConnectClick
        OnKeyEvent=MyConnectButton.InternalOnKeyEvent
    end object
    ConnectButton=MyConnectButton
    // Reference: GUIComboBox'XInterface_Decompressed.IRC_System.MyServerCombo'
    begin object name="MyServerCombo" class=XInterface_Decompressed.GUIComboBox
        WinTop=0.1000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.3000000
        OnKeyEvent=MyServerCombo.InternalOnKeyEvent
    end object
    ServerCombo=MyServerCombo
    // Reference: GUIButton'XInterface_Decompressed.IRC_System.MyRemoveServerButton'
    begin object name="MyRemoveServerButton" class=XInterface_Decompressed.GUIButton
        Caption="REMOVE SERVER"
        WinTop=0.1000000
        WinLeft=0.7700000
        WinWidth=0.2000000
        WinHeight=0.3000000
        OnClick=IRC_System.RemoveServerClick
        OnKeyEvent=MyRemoveServerButton.InternalOnKeyEvent
    end object
    RemoveServerButton=MyRemoveServerButton
    // Reference: GUILabel'XInterface_Decompressed.IRC_System.MyChannelLabel'
    begin object name="MyChannelLabel" class=XInterface_Decompressed.GUILabel
        Caption="Channel"
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.5000000
        WinLeft=0.0300000
        WinWidth=0.2000000
        WinHeight=0.3000000
    end object
    ChannelLabel=MyChannelLabel
    // Reference: GUIButton'XInterface_Decompressed.IRC_System.MyJoinChannelButton'
    begin object name="MyJoinChannelButton" class=XInterface_Decompressed.GUIButton
        Caption="JOIN CHANNEL"
        WinTop=0.5000000
        WinLeft=0.5600000
        WinWidth=0.2000000
        WinHeight=0.3000000
        OnClick=IRC_System.JoinChannelClick
        OnKeyEvent=MyJoinChannelButton.InternalOnKeyEvent
    end object
    JoinChannelButton=MyJoinChannelButton
    // Reference: GUIComboBox'XInterface_Decompressed.IRC_System.MyChannelCombo'
    begin object name="MyChannelCombo" class=XInterface_Decompressed.GUIComboBox
        WinTop=0.5000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.3000000
        OnKeyEvent=MyChannelCombo.InternalOnKeyEvent
    end object
    ChannelCombo=MyChannelCombo
    // Reference: GUIButton'XInterface_Decompressed.IRC_System.MyRemoveChannelButton'
    begin object name="MyRemoveChannelButton" class=XInterface_Decompressed.GUIButton
        Caption="REMOVE CHANNEL"
        WinTop=0.5000000
        WinLeft=0.7700000
        WinWidth=0.2000000
        WinHeight=0.3000000
        OnClick=IRC_System.RemoveChannelClick
        OnKeyEvent=MyRemoveChannelButton.InternalOnKeyEvent
    end object
    RemoveChannelButton=MyRemoveChannelButton
    CurChannel=-1
    PrevChannel=-1
}