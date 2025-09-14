/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRCLink.uc
 * Package Imports:
 *	XInterface
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:20
 *	States:2
 *
 *******************************************************************************/
class IRCLink extends BufferedTCPLink
    dependson(IRC_NewNick)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    transient;

var IpAddr ServerIPAddr;
var string ServerAddress;
var int serverPort;
var string NickName;
var string UserIdent;
var string FullName;
var string DefaultChannel;
var localized string InvalidAddressText;
var localized string ErrorBindingText;
var localized string ResolveFailedText;
var localized string ConnectedText;
var localized string ConnectingToText;
var localized string TimeOutError;
var localized string InviteString;
var localized string NickInUseText;
var localized string NickInvalidText;
var export editinline IRC_System SystemPage;
var string DisconnectReason;
var string VersionString;
var transient float SinceLastLevCheck;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Disable('Tick');
}

function Connect(IRC_System InSystemPage, string InServer, string InNickName, string InUserIdent, string InFullName, string InDefaultChannel)
{
    local int i;

    Log("IRCLink Connect:" $ InServer $ InNickName $ InUserIdent $ InFullName $ InDefaultChannel, 'IRC');
    SystemPage = InSystemPage;
    NickName = InNickName;
    FullName = InFullName;
    UserIdent = InUserIdent;
    DefaultChannel = InDefaultChannel;
    i = InStr(InServer, ":");
    // End:0xab
    if(i == -1)
    {
        ServerAddress = InServer;
        serverPort = 6667;
    }
    // End:0xd4
    else
    {
        ServerAddress = Left(InServer, i);
        serverPort = int(Mid(InServer, i + 1));
    }
    ResetBuffer();
    ServerIPAddr.Port = serverPort;
    SetTimer(20.0, false);
    SystemPage.SystemText(ConnectingToText @ ServerAddress);
    Resolve(ServerAddress);
}

function string ChopLeft(string Text)
{
    // End:0x38 [While If]
    if(Text != "" && InStr(": !", Left(Text, 1)) != -1)
    {
        J0x00:
        Text = Mid(Text, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return Text;
}

function string RemoveNickPrefix(string Nick)
{
    // End:0x39 [While If]
    if(Nick != "" && InStr(":@+%", Left(Nick, 1)) != -1)
    {
        J0x00:
        Nick = Mid(Nick, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return Nick;
}

function string Chop(string Text)
{
    // End:0x38 [While If]
    if(Text != "" && InStr(": !", Left(Text, 1)) != -1)
    {
        J0x00:
        Text = Mid(Text, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    J0x38:
    // End:0x79 [While If]
    if(Text != "" && InStr(": !", Right(Text, 1)) != -1)
    {
        Text = Left(Text, Len(Text) - 1);
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return Text;
}

function Resolved(IpAddr Addr)
{
    ServerIPAddr.Addr = Addr.Addr;
    // End:0x55
    if(ServerIPAddr.Addr == 0)
    {
        // End:0x53
        if(SystemPage != none)
        {
            SystemPage.SystemText(InvalidAddressText);
            SystemPage.Disconnect();
        }
        return;
    }
    Log("Battery IRCLink: Server is " $ ServerAddress $ ":" $ string(ServerIPAddr.Port), 'IRC');
    // End:0xcf
    if(BindPort() == 0)
    {
        // End:0xcd
        if(SystemPage != none)
        {
            SystemPage.SystemText(ErrorBindingText);
            SystemPage.Disconnect();
        }
        return;
    }
    Open(ServerIPAddr);
}

event Closed()
{
    // End:0x1a
    if(SystemPage != none)
    {
        SystemPage.Disconnect();
    }
}

function ResolveFailed()
{
    // End:0x2e
    if(SystemPage != none)
    {
        SystemPage.SystemText(ResolveFailedText);
        SystemPage.Disconnect();
    }
}

event Timer()
{
    // End:0x50
    if(SystemPage != none)
    {
        SystemPage.SystemText(TimeOutError);
        SystemPage.Disconnect();
        Log("Failed to resolve " $ ServerAddress, 'IRC');
    }
    return;
}

event Opened()
{
    SetTimer(0.0, false);
    // End:0x28
    if(SystemPage != none)
    {
        SystemPage.SystemText(ConnectedText);
    }
    Enable('Tick');
    GotoState('LoggingIn');
}

function Tick(float DeltaTime)
{
    local string Line;

    DoBufferQueueIO();
    // End:0x1f
    if(ReadBufferedLine(Line))
    {
        ProcessInput(Line);
    }
    super(Actor).Tick(DeltaTime);
    // End:0x76
    if(GetStateName() == 'LoggedIn')
    {
        SinceLastLevCheck += DeltaTime;
        // End:0x76
        if(SinceLastLevCheck > float(5))
        {
            // End:0x6b
            if(SystemPage != none)
            {
                SystemPage.UpdateAway();
            }
            SinceLastLevCheck = 0.0;
        }
    }
}

function SendCommandText(string Text)
{
    local int i, j;
    local string Cmd, temp, Temp2;

    // End:0x2f
    if(Left(Text, 4) ~= "MSG ")
    {
        Text = "PRIVMSG " $ Mid(Text, 4);
    }
    // End:0x5d
    if(Left(Text, 6) ~= "LEAVE ")
    {
        Text = "PART " $ Mid(Text, 6);
    }
    i = InStr(Text, " ");
    // End:0x2cc
    if(i != -1)
    {
        Cmd = Caps(Left(Text, i));
        Text = Cmd $ Mid(Text, i);
        switch(Cmd)
        {
            // End:0xbc
            case "PRIVMSG":
            // End:0xc7
            case "NOTICE":
            // End:0x143
            case "KILL":
                temp = ChopLeft(Mid(Text, i + 1));
                i = InStr(temp, " ");
                // End:0x140
                if(i != -1)
                {
                    Text = Cmd @ Left(temp, i) $ " :" $ ChopLeft(Mid(temp, i + 1));
                }
                // End:0x2c9
                break;
            // End:0x1ce
            case "CTCP":
                temp = ChopLeft(Mid(Text, i + 1));
                i = InStr(temp, " ");
                // End:0x1cb
                if(i != -1)
                {
                    Text = "PRIVMSG " $ Left(temp, i) $ " :" $ Chr(1) $ ChopLeft(Mid(temp, i + 1)) $ Chr(1);
                }
                // End:0x2c9
                break;
            // End:0x292
            case "KICK":
                temp = ChopLeft(Mid(Text, i + 1));
                i = InStr(temp, " ");
                // End:0x28f
                if(i != -1)
                {
                    Temp2 = ChopLeft(Mid(temp, i + 1));
                    j = InStr(Temp2, " ");
                    // End:0x28f
                    if(j != -1)
                    {
                        Text = Cmd @ Left(temp, i) @ Left(Temp2, j) $ " :" $ ChopLeft(Mid(Temp2, j + 1));
                    }
                }
                // End:0x2c9
                break;
            // End:0x2c6
            case "QUIT":
                Text = Cmd $ " :" $ ChopLeft(Mid(Text, i + 1));
                // End:0x2c9
                break;
            // End:0xffff
            default:
                // End:0x2d9 Break;
                break;
            }
    }
    Text = Caps(Text);
    SendBufferedData(Text $ CRLF);
}

function SendChannelText(string Channel, string Text)
{
    SendBufferedData("PRIVMSG " $ Channel $ " :" $ Text $ CRLF);
}

function SendChannelAction(string Channel, string Text)
{
    SendBufferedData("PRIVMSG " $ Channel $ " :" $ Chr(1) $ "ACTION " $ Text $ Chr(1) $ CRLF);
}

function ProcessInput(string Line)
{
    // End:0x34
    if(Left(Line, 5) == "PING ")
    {
        SendBufferedData("PONG " $ Mid(Line, 5) $ CRLF);
    }
}

function JoinChannel(string Channel)
{
    Log("IRCLink: JoinChannel: " $ Channel, 'IRC');
    // End:0x51
    if(Left(Channel, 1) == "#")
    {
        SendBufferedData("JOIN " $ Channel $ CRLF);
    }
}

function PartChannel(string Channel)
{
    // End:0x2b
    if(Left(Channel, 1) == "#")
    {
        SendBufferedData("PART " $ Channel $ CRLF);
    }
}

function SetNick(string NewNick)
{
    SendBufferedData("NICK " $ NewNick $ CRLF);
}

function SetAway(string AwayText)
{
    SendBufferedData("AWAY :" $ AwayText $ CRLF);
}

function DestroyLink()
{
    SystemPage = none;
    // End:0x35
    if(IsConnected())
    {
        SendText("QUIT :" $ DisconnectReason $ CRLF);
        Close();
    }
    // End:0x38
    else
    {
        Destroy();
    }
}

state LoggingIn
{
    function Timer()
    {
        SendBufferedData("NICK " $ NickName $ CRLF);
        SetTimer(1.0, false);
    }

    function ProcessInput(string Line)
    {
        local string temp;
        local export editinline IRC_NewNick NewNickDialog;

        Log("LoggingIn: " $ Line, 'IRC');
        temp = ParseDelimited(Line, " ", 2);
        // End:0x72
        if(ParseDelimited(Line, " ", 1) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        // End:0x15d
        if(temp == "433")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
            SetTimer(0.0, false);
            // End:0x15a
            if(IRC_NewNick(SystemPage.Controller.TopPage()) == none)
            {
                // End:0x15a
                if(SystemPage.Controller.OpenMenu("xinterface.IRC_NewNick"))
                {
                    NewNickDialog = IRC_NewNick(SystemPage.Controller.TopPage());
                    NewNickDialog.NewNickPrompt.Caption = NickInUseText;
                    NewNickDialog.SystemPage = SystemPage;
                }
            }
        }
        // End:0x28b
        else
        {
            // End:0x248
            if(temp == "432")
            {
                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
                SetTimer(0.0, false);
                // End:0x245
                if(IRC_NewNick(SystemPage.Controller.TopPage()) == none)
                {
                    // End:0x245
                    if(SystemPage.Controller.OpenMenu("xinterface.IRC_NewNick"))
                    {
                        NewNickDialog = IRC_NewNick(SystemPage.Controller.TopPage());
                        NewNickDialog.NewNickPrompt.Caption = NickInvalidText;
                        NewNickDialog.SystemPage = SystemPage;
                    }
                }
            }
            // End:0x28b
            else
            {
                // End:0x28b
                if(int(temp) != 0)
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
                    SetTimer(0.0, false);
                    GotoState('LoggedIn');
                }
            }
        }
        global.ProcessInput(Line);
    }

    function SendCommandText(string Text)
    {
        global.SendCommandText(Text);
        // End:0x4f
        if(ParseDelimited(Text, " ", 1) ~= "NICK")
        {
            SystemPage.ChangedNick(NickName, Chop(ParseDelimited(Text, " ", 2)));
        }
    }

Begin:
    SendBufferedData("USER " $ UserIdent $ " localhost " $ ServerAddress $ " :" $ FullName $ CRLF);
    SendBufferedData("NICK " $ NickName $ CRLF);
    SetTimer(1.0, false);
}

state LoggedIn
{
    function ProcessInput(string Line)
    {
        local string temp, Temp2, Temp3;
        local bool bAddModifier;
        local int i;
        local string Command;

        global.ProcessInput(Line);
        // End:0x18
        if(SystemPage == none)
        {
            return;
        }
        Command = ParseDelimited(Line, " ", 2);
        // End:0x72
        if(ParseDelimited(Line, " ", 1) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        // End:0xb16
        else
        {
            // End:0xdd
            if(Command == "JOIN")
            {
                temp = ParseDelimited(Line, ":!", 2);
                // End:0xb0
                if(temp ~= NickName)
                {
                    temp = "";
                }
                SystemPage.JoinedChannel(Chop(ParseDelimited(Line, " ", 3)), temp);
            }
            // End:0xb16
            else
            {
                // End:0x148
                if(Command == "PART")
                {
                    temp = ParseDelimited(Line, ":!", 2);
                    // End:0x11b
                    if(temp ~= NickName)
                    {
                        temp = "";
                    }
                    SystemPage.PartedChannel(Chop(ParseDelimited(Line, " ", 3)), temp);
                }
                // End:0xb16
                else
                {
                    // End:0x191
                    if(Command == "NICK")
                    {
                        SystemPage.ChangedNick(ParseDelimited(Line, ":!", 2), Chop(ParseDelimited(Line, " ", 3)));
                    }
                    // End:0xb16
                    else
                    {
                        // End:0x1db
                        if(Command == "QUIT")
                        {
                            SystemPage.UserQuit(ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 3, true)));
                        }
                        // End:0xb16
                        else
                        {
                            // End:0x334
                            if(Command == "353")
                            {
                                Temp2 = ParseDelimited(Line, "#", 2);
                                Temp2 = ParseDelimited(Temp2, " :", 1);
                                temp = ParseDelimited(Line, ":", 3, true);
                                J0x22d:
                                // End:0x331 [While If]
                                if(temp != "")
                                {
                                    Temp3 = ParseDelimited(temp, " ", 1);
                                    SystemPage.UserInChannel("#" $ Temp2, RemoveNickPrefix(Temp3));
                                    // End:0x2aa
                                    if(Left(Temp3, 1) == "@")
                                    {
                                        SystemPage.ChangeOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                                    }
                                    // End:0x317
                                    else
                                    {
                                        // End:0x2e2
                                        if(Left(Temp3, 1) == "%")
                                        {
                                            SystemPage.ChangeHalfOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                                        }
                                        // End:0x317
                                        else
                                        {
                                            // End:0x317
                                            if(Left(Temp3, 1) == "+")
                                            {
                                                SystemPage.ChangeVoice("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                                            }
                                        }
                                    }
                                    temp = ParseDelimited(temp, " ", 2, true);
                                    // This is an implied JumpToken; Continue!
                                    goto J0x22d;
                                }
                            }
                            // End:0xb16
                            else
                            {
                                // End:0x346
                                if(Command == "333")
                                {
                                }
                                // End:0xb16
                                else
                                {
                                    // End:0x358
                                    if(Command == "366")
                                    {
                                    }
                                    // End:0xb16
                                    else
                                    {
                                        // End:0x36a
                                        if(Command == "331")
                                        {
                                        }
                                        // End:0xb16
                                        else
                                        {
                                            // End:0x3cd
                                            if(Command == "332")
                                            {
                                                temp = Chop(ParseDelimited(Line, " ", 4));
                                                Temp2 = Chop(ParseDelimited(Line, " ", 5));
                                                SystemPage.ChangeTopic(temp, Temp2);
                                            }
                                            // End:0xb16
                                            else
                                            {
                                                // End:0x3df
                                                if(Command == "341")
                                                {
                                                }
                                                // End:0xb16
                                                else
                                                {
                                                    // End:0x42d
                                                    if(Command == "301")
                                                    {
                                                        SystemPage.IsAway(Chop(ParseDelimited(Line, " ", 4)), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                                                    }
                                                    // End:0xb16
                                                    else
                                                    {
                                                        // End:0x548
                                                        if(Command == "NOTICE")
                                                        {
                                                            temp = ParseDelimited(Line, ": ", 2);
                                                            Temp2 = ParseDelimited(Line, ":! ", 2);
                                                            // End:0x51f
                                                            if(InStr(temp, "!") != -1 && InStr(Temp2, ".") == -1)
                                                            {
                                                                temp = ChopLeft(ParseDelimited(Line, " ", 4, true));
                                                                // End:0x503
                                                                if(Asc(Left(temp, 1)) == 1 && Asc(Right(temp, 1)) == 1)
                                                                {
                                                                    SystemPage.CTCP("", Temp2, Mid(temp, 1, Len(temp) - 2));
                                                                }
                                                                // End:0x51c
                                                                else
                                                                {
                                                                    SystemPage.UserNotice(Temp2, temp);
                                                                }
                                                            }
                                                            // End:0x545
                                                            else
                                                            {
                                                                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                                                            }
                                                        }
                                                        // End:0xb16
                                                        else
                                                        {
                                                            // End:0x57e
                                                            if(int(Command) != 0)
                                                            {
                                                                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                                                            }
                                                            // End:0xb16
                                                            else
                                                            {
                                                                // End:0x73f
                                                                if(Command == "MODE")
                                                                {
                                                                    temp = Chop(ParseDelimited(Line, " ", 4));
                                                                    Temp3 = Chop(ParseDelimited(Line, " ", 3));
                                                                    i = 5;
                                                                    bAddModifier = true;
                                                                    J0x5d6:
                                                                    // End:0x700 [While If]
                                                                    if(temp != "")
                                                                    {
                                                                        Temp2 = Left(temp, 1);
                                                                        // End:0x605
                                                                        if(Temp2 == "+")
                                                                        {
                                                                            bAddModifier = true;
                                                                        }
                                                                        // End:0x61a
                                                                        if(Temp2 == "-")
                                                                        {
                                                                            bAddModifier = false;
                                                                        }
                                                                        // End:0x661
                                                                        if(Temp2 == "o")
                                                                        {
                                                                            SystemPage.ChangeOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                                                                            ++ i;
                                                                        }
                                                                        // End:0x6a8
                                                                        if(Temp2 == "h")
                                                                        {
                                                                            SystemPage.ChangeHalfOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                                                                            ++ i;
                                                                        }
                                                                        // End:0x6ef
                                                                        if(Temp2 == "v")
                                                                        {
                                                                            SystemPage.ChangeVoice(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                                                                            ++ i;
                                                                        }
                                                                        temp = Mid(temp, 1);
                                                                        // This is an implied JumpToken; Continue!
                                                                        goto J0x5d6;
                                                                    }
                                                                    SystemPage.ChangeMode(Temp3, ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 4, true)));
                                                                }
                                                                // End:0xb16
                                                                else
                                                                {
                                                                    // End:0x7b5
                                                                    if(Command == "KICK")
                                                                    {
                                                                        SystemPage.KickUser(Chop(ParseDelimited(Line, " ", 3)), Chop(ParseDelimited(Line, " ", 4)), ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                                                                    }
                                                                    // End:0xb16
                                                                    else
                                                                    {
                                                                        // End:0x803
                                                                        if(Command == "INVITE")
                                                                        {
                                                                            SystemPage.SystemText(ParseDelimited(Line, ":!", 2) @ InviteString @ ParseDelimited(Line, ":", 3));
                                                                        }
                                                                        // End:0xb16
                                                                        else
                                                                        {
                                                                            // End:0xab3
                                                                            if(Command == "PRIVMSG")
                                                                            {
                                                                                temp = Chop(ParseDelimited(Line, " ", 3));
                                                                                Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                                                                                // End:0x92d
                                                                                if(Mid(Temp2, 1, 7) == "ACTION " && Asc(Left(Temp2, 1)) == 1 && Asc(Right(Temp2, 1)) == 1)
                                                                                {
                                                                                    Temp2 = Mid(Temp2, 8);
                                                                                    Temp2 = Left(Temp2, Len(Temp2) - 1);
                                                                                    // End:0x905
                                                                                    if(temp != "" && InStr("&#@", Left(temp, 1)) != -1)
                                                                                    {
                                                                                        SystemPage.ChannelAction(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                                                                    }
                                                                                    // End:0x92a
                                                                                    else
                                                                                    {
                                                                                        SystemPage.PrivateAction(ParseDelimited(Line, ":!", 2), Temp2);
                                                                                    }
                                                                                }
                                                                                // End:0xab0
                                                                                else
                                                                                {
                                                                                    // End:0xa37
                                                                                    if(Asc(Left(Temp2, 1)) == 1 && Asc(Right(Temp2, 1)) == 1)
                                                                                    {
                                                                                        Temp2 = Mid(Temp2, 1, Len(Temp2) - 2);
                                                                                        switch(Temp2)
                                                                                        {
                                                                                            // End:0xa04
                                                                                            case "VERSION":
                                                                                                SendBufferedData("NOTICE " $ ParseDelimited(Line, ":!", 2) $ " :" $ Chr(1) $ "VERSION " $ VersionString $ Level.EngineVersion $ Chr(1) $ CRLF);
                                                                                                SystemPage.CTCP(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                                                                                // End:0xa34
                                                                                                break;
                                                                                            // End:0xffff
                                                                                            default:
                                                                                                SystemPage.CTCP(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                                                                                // End:0xa34 Break;
                                                                                                break;
                                                                                        }
                                                                                    }
                                                                                    // End:0xab0
                                                                                    else
                                                                                    {
                                                                                        // End:0xa8b
                                                                                        if(temp != "" && InStr("&#@", Left(temp, 1)) != -1)
                                                                                        {
                                                                                            SystemPage.ChannelText(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                                                                        }
                                                                                        // End:0xab0
                                                                                        else
                                                                                        {
                                                                                            SystemPage.PrivateText(ParseDelimited(Line, ":!", 2), Temp2);
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            // End:0xb16
                                                                            else
                                                                            {
                                                                                // End:0xb16
                                                                                if(Command == "TOPIC")
                                                                                {
                                                                                    temp = Chop(ParseDelimited(Line, " ", 3));
                                                                                    Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                                                                                    SystemPage.ChangeTopic(temp, Temp2);
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

Begin:
    // End:0x17
    if(DefaultChannel != "")
    {
        JoinChannel(DefaultChannel);
    }
    stop;        
}

defaultproperties
{
    InvalidAddressText="Incorrect server address. Terminating."
    ErrorBindingText="Local port connection error. Terminating."
    ResolveFailedText="Server address confirmation failed. Terminating."
    ConnectedText="Connected."
    ConnectingToText="Connecting?"
    TimeOutError="Server connection timed out."
    InviteString=" sent you an invite."
    NickInUseText="Name Unavailable"
    NickInvalidText="You cannot use this name."
    DisconnectReason="Disconnected"
    VersionString="Battery IRC Client version "
}