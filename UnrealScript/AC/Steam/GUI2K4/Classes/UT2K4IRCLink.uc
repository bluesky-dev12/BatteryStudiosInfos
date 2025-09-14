/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4IRCLink.uc
 * Package Imports:
 *	GUI2K4
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:19
 *	Functions:23
 *	States:2
 *
 *******************************************************************************/
class UT2K4IRCLink extends BufferedTCPLink
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    transient;

struct CommandAlias
{
    var() string AliasText;
    var() string RealCommand;
};

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
var export editinline UT2k4IRC_System SystemPage;
var string DisconnectReason;
var string VersionString;
var config array<CommandAlias> Shortcuts;
var transient float SinceLastLevCheck;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Disable('Tick');
}

function CloseMe()
{
    // End:0x1f
    if(SystemPage != none)
    {
        SystemPage.CloseLink(self, false);
    }
    // End:0x25
    else
    {
        DestroyLink();
    }
}

function Connect(UT2k4IRC_System InSystemPage, string InServer, string InNickName, string InUserIdent, string InFullName, string InDefaultChannel)
{
    local int i;

    Log("UT2K4IRCLink Connect:" @ InServer @ InNickName @ InUserIdent @ InFullName @ InDefaultChannel, 'IRC');
    SystemPage = InSystemPage;
    NickName = InNickName;
    FullName = InFullName;
    UserIdent = InUserIdent;
    DefaultChannel = InDefaultChannel;
    i = InStr(InServer, ":");
    // End:0xb0
    if(i == -1)
    {
        ServerAddress = InServer;
        serverPort = 6667;
    }
    // End:0xd9
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
    // End:0x4c
    if(ServerIPAddr.Addr == 0)
    {
        // End:0x4a
        if(SystemPage != none)
        {
            SystemPage.SystemText(InvalidAddressText);
            CloseMe();
        }
        return;
    }
    Log("Battery UT2K4IRCLink: Server is " $ ServerAddress $ ":" $ string(ServerIPAddr.Port), 'IRC');
    // End:0xc2
    if(BindPort() == 0)
    {
        // End:0xc0
        if(SystemPage != none)
        {
            SystemPage.SystemText(ErrorBindingText);
            CloseMe();
        }
        return;
    }
    Open(ServerIPAddr);
}

event Closed()
{
    CloseMe();
}

function ResolveFailed()
{
    // End:0x25
    if(SystemPage != none)
    {
        SystemPage.SystemText(ResolveFailedText);
        CloseMe();
    }
}

event Timer()
{
    // End:0x47
    if(SystemPage != none)
    {
        SystemPage.SystemText(TimeOutError);
        CloseMe();
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

function SendCommandText(string Cmd)
{
    local int i;
    local string Text, temp;

    Divide(Cmd, " ", Cmd, Text);
    ReplaceCommandAlias(Cmd);
    switch(Cmd)
    {
        // End:0x32
        case "PRIVMSG":
        // End:0x3d
        case "NOTICE":
        // End:0xa4
        case "KILL":
            // End:0x55
            if(Text == "")
            {
            }
            // End:0x1e8
            else
            {
                Text = ChopLeft(Text);
                // End:0xa1
                if(Divide(Text, " ", temp, Text))
                {
                    temp @= ":" $ ChopLeft(Text);
                    Text = temp;
                }
                // This is an implied JumpToken;
                goto J0x1e8;
        // End:0xb0
        case "CTCP":
        // End:0x1e8
        break;
    // End:0x169
    case "KICK":
        // End:0xc8
        if(Text == "")
        {
        }
        // End:0x1e8
        else
        {
            Text = ChopLeft(Text);
            // End:0x14a
            if(Divide(Text, " ", temp, Text))
            {
                i = InStr(Text, " ");
                // End:0x125
                if(i != -1)
                {
                    temp @= ":" $ Text;
                }
                // End:0x13f
                else
                {
                    // End:0x13f
                    if(Text != "")
                    {
                        temp @= Text;
                    }
                }
                Text = temp;
            }
            Text = SystemPage.GetCurrentChannelName() @ Text;
            // This is an implied JumpToken;
            goto J0x1e8;
    // End:0x198
    case "QUIT":
    // End:0x195
    if(Text != "")
    {
        Text = " :" $ ChopLeft(Text);
    }
    // End:0x1e8
    break;
// End:0x1ae
case "JOIN":
    JoinChannel(Text);
    return;
// End:0x1e5
case "PART":
    // End:0x1d8
    if(Text == "")
    {
        Text = SystemPage.GetCurrentChannelName();
    }
    PartChannel(Text);
    return;
// End:0xffff
default:
}
}
// End:0x21f
if(Cmd != "")
{
    SendBufferedData(Cmd $ Eval(Text != "", " " $ Text, "") $ CRLF);
}
}

function ReplaceCommandAlias(out string Text)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < Shortcuts.Length)
    {
        // End:0x49
        if(Shortcuts[i].AliasText ~= Text)
        {
            Text = Shortcuts[i].RealCommand;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SendBufferedData(string Text)
{
    ReplaceText(Text, "$*", "");
    ReplaceText(Text, "#*", "");
    super.SendBufferedData(Text);
}

function SendChannelText(string Channel, string Text)
{
    // End:0x21
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    SendBufferedData("PRIVMSG " $ Channel $ " :" $ Text $ CRLF);
}

function SendChannelAction(string Channel, string Text)
{
    // End:0x21
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    // End:0x41
    if(Left(Channel, 1) != "#")
    {
        Channel = "#" $ Channel;
    }
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
    Log("UT2K4IRCLink: JoinChannel: " $ Channel, 'IRC');
    // End:0x4c
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    // End:0x6c
    if(Left(Channel, 1) != "#")
    {
        Channel = "#" $ Channel;
    }
    SendBufferedData("JOIN " $ Channel $ CRLF);
}

function PartChannel(string Channel)
{
    // End:0x21
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    // End:0x41
    if(Left(Channel, 1) != "#")
    {
        Channel = "#" $ Channel;
    }
    SendBufferedData("PART " $ Channel $ CRLF);
}

function SetNick(string NewNick)
{
    // End:0x0e
    if(NewNick == "")
    {
        return;
    }
    // End:0x24
    if(NewNick ~= "chanserv")
    {
        return;
    }
    // End:0x33
    if(NewNick ~= "q")
    {
        return;
    }
    // End:0x49
    if(NewNick ~= "nickserv")
    {
        return;
    }
    SendCommandText("NICK " $ NewNick);
}

function SetAway(string AwayText)
{
    SendBufferedData("AWAY :" $ AwayText $ CRLF);
}

function DestroyLink()
{
    SystemPage = none;
    SetTimer(0.0, false);
    // End:0x3e
    if(IsConnected())
    {
        SendText("QUIT :" $ DisconnectReason $ CRLF);
        Close();
    }
    // End:0x41
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

        Log("LoggingIn: " $ Line, 'IRC');
        temp = ParseDelimited(Line, " ", 2);
        // End:0x72
        if(ParseDelimited(Line, " ", 1) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        // End:0xc2
        if(temp == "433")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
            SetTimer(0.0, false);
            SystemPage.NotifyNickInUse();
        }
        // End:0x15f
        else
        {
            // End:0x112
            if(temp == "432")
            {
                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
                SetTimer(0.0, false);
                SystemPage.NotifyInvalidNick();
            }
            // End:0x15f
            else
            {
                // End:0x15f
                if(SystemPage.IsDigit(temp))
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
        // End:0x44
        if(ParseDelimited(Text, " ", 1) ~= "NICK")
        {
            SystemPage.ChangedNick(NickName, Chop(ParseDelimited(Text, " ", 2)));
        }
        global.SendCommandText(Text);
    }

Begin:
    // End:0x5b
    if(SystemPage.Link != none && SystemPage.Link != self)
    {
        SystemPage.CloseLink(SystemPage.Link, true);
        SystemPage.Link = self;
    }
    // End:0x7f
    else
    {
        // End:0x7f
        if(SystemPage.Link == none)
        {
            SystemPage.Link = self;
        }
    }
    SendBufferedData("USER " $ UserIdent $ " localhost " $ ServerAddress $ " :" $ FullName $ CRLF);
    SendBufferedData("NICK " $ NickName $ CRLF);
    stop;    
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
        // End:0x6f
        if(ParseDelimited(Line, " ", 1) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        switch(Command)
        {
            // End:0xda
            case "JOIN":
                temp = ParseDelimited(Line, ":!", 2);
                // End:0xad
                if(temp ~= NickName)
                {
                    temp = "";
                }
                SystemPage.JoinedChannel(Chop(ParseDelimited(Line, " ", 3)), temp);
                // End:0xb28
                break;
            // End:0x13e
            case "PART":
                temp = ParseDelimited(Line, ":!", 2);
                // End:0x111
                if(temp ~= NickName)
                {
                    temp = "";
                }
                SystemPage.PartedChannel(Chop(ParseDelimited(Line, " ", 3)), temp);
                // End:0xb28
                break;
            // End:0x180
            case "NICK":
                SystemPage.ChangedNick(ParseDelimited(Line, ":!", 2), Chop(ParseDelimited(Line, " ", 3)));
                // End:0xb28
                break;
            // End:0x1c3
            case "QUIT":
                SystemPage.UserQuit(ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 3, true)));
                // End:0xb28
                break;
            // End:0x315
            case "353":
                Temp2 = ParseDelimited(Line, "#", 2);
                Temp2 = ParseDelimited(Temp2, " :", 1);
                temp = ParseDelimited(Line, ":", 3, true);
                J0x20e:
                // End:0x312 [While If]
                if(temp != "")
                {
                    Temp3 = ParseDelimited(temp, " ", 1);
                    SystemPage.UserInChannel("#" $ Temp2, RemoveNickPrefix(Temp3));
                    // End:0x28b
                    if(Left(Temp3, 1) == "@")
                    {
                        SystemPage.ChangeOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                    }
                    // End:0x2f8
                    else
                    {
                        // End:0x2c3
                        if(Left(Temp3, 1) == "%")
                        {
                            SystemPage.ChangeHalfOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                        }
                        // End:0x2f8
                        else
                        {
                            // End:0x2f8
                            if(Left(Temp3, 1) == "+")
                            {
                                SystemPage.ChangeVoice("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                            }
                        }
                    }
                    temp = ParseDelimited(temp, " ", 2, true);
                    // This is an implied JumpToken; Continue!
                    goto J0x20e;
                }
                // End:0xb28
                break;
            // End:0x31d
            case "333":
            // End:0x325
            case "366":
            // End:0x330
            case "331":
                // End:0xb28
                break;
            // End:0x38d
            case "332":
                temp = Chop(ParseDelimited(Line, " ", 4));
                Temp2 = Chop(ParseDelimited(Line, " ", 5, true));
                SystemPage.ChangeTopic(temp, Temp2);
                // End:0xb28
                break;
            // End:0x398
            case "341":
                // End:0xb28
                break;
            // End:0x3df
            case "301":
                SystemPage.PrintAwayMessage(Chop(ParseDelimited(Line, " ", 4)), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                // End:0xb28
                break;
            // End:0x4f3
            case "NOTICE":
                temp = ParseDelimited(Line, ": ", 2);
                Temp2 = ParseDelimited(Line, ":! ", 2);
                // End:0x4ca
                if(InStr(temp, "!") != -1 && InStr(Temp2, ".") == -1)
                {
                    temp = ChopLeft(ParseDelimited(Line, " ", 4, true));
                    // End:0x4ae
                    if(Asc(Left(temp, 1)) == 1 && Asc(Right(temp, 1)) == 1)
                    {
                        SystemPage.CTCP("", Temp2, Mid(temp, 1, Len(temp) - 2));
                    }
                    // End:0x4c7
                    else
                    {
                        SystemPage.UserNotice(Temp2, temp);
                    }
                }
                // End:0x4f0
                else
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                }
                // End:0xb28
                break;
            // End:0x6ad
            case "MODE":
                temp = Chop(ParseDelimited(Line, " ", 4));
                Temp3 = Chop(ParseDelimited(Line, " ", 3));
                i = 5;
                bAddModifier = true;
                J0x544:
                // End:0x66e [While If]
                if(temp != "")
                {
                    Temp2 = Left(temp, 1);
                    // End:0x573
                    if(Temp2 == "+")
                    {
                        bAddModifier = true;
                    }
                    // End:0x588
                    if(Temp2 == "-")
                    {
                        bAddModifier = false;
                    }
                    // End:0x5cf
                    if(Temp2 == "o")
                    {
                        SystemPage.ChangeOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        ++ i;
                    }
                    // End:0x616
                    if(Temp2 == "h")
                    {
                        SystemPage.ChangeHalfOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        ++ i;
                    }
                    // End:0x65d
                    if(Temp2 == "v")
                    {
                        SystemPage.ChangeVoice(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        ++ i;
                    }
                    temp = Mid(temp, 1);
                    // This is an implied JumpToken; Continue!
                    goto J0x544;
                }
                SystemPage.ChangeMode(Temp3, ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 4, true)));
                // End:0xb28
                break;
            // End:0x71c
            case "KICK":
                SystemPage.KickUser(Chop(ParseDelimited(Line, " ", 3)), Chop(ParseDelimited(Line, " ", 4)), ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                // End:0xb28
                break;
            // End:0x763
            case "INVITE":
                SystemPage.SystemText(ParseDelimited(Line, ":!", 2) @ InviteString @ ParseDelimited(Line, ":", 3));
                // End:0xb28
                break;
            // End:0xa0c
            case "PRIVMSG":
                temp = Chop(ParseDelimited(Line, " ", 3));
                Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                // End:0x886
                if(Mid(Temp2, 1, 7) == "ACTION " && Asc(Left(Temp2, 1)) == 1 && Asc(Right(Temp2, 1)) == 1)
                {
                    Temp2 = Mid(Temp2, 8);
                    Temp2 = Left(Temp2, Len(Temp2) - 1);
                    // End:0x85e
                    if(temp != "" && InStr("&#@", Left(temp, 1)) != -1)
                    {
                        SystemPage.ChannelAction(temp, ParseDelimited(Line, ":!", 2), Temp2);
                    }
                    // End:0x883
                    else
                    {
                        SystemPage.PrivateAction(ParseDelimited(Line, ":!", 2), Temp2);
                    }
                }
                // End:0xa09
                else
                {
                    // End:0x990
                    if(Asc(Left(Temp2, 1)) == 1 && Asc(Right(Temp2, 1)) == 1)
                    {
                        Temp2 = Mid(Temp2, 1, Len(Temp2) - 2);
                        switch(Temp2)
                        {
                            // End:0x95d
                            case "VERSION":
                                SendBufferedData("NOTICE " $ ParseDelimited(Line, ":!", 2) $ " :" $ Chr(1) $ "VERSION " $ VersionString $ Level.EngineVersion $ Chr(1) $ CRLF);
                                SystemPage.CTCP(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                // End:0x98d
                                break;
                            // End:0xffff
                            default:
                                SystemPage.CTCP(temp, ParseDelimited(Line, ":!", 2), Temp2);
                                // End:0x98d Break;
                                break;
                        }
                    }
                    // End:0xa09
                    else
                    {
                        // End:0x9e4
                        if(temp != "" && InStr("&#@", Left(temp, 1)) != -1)
                        {
                            SystemPage.ChannelText(temp, ParseDelimited(Line, ":!", 2), Temp2);
                        }
                        // End:0xa09
                        else
                        {
                            SystemPage.PrivateText(ParseDelimited(Line, ":!", 2), Temp2);
                        }
                    }
                }
                // End:0xb28
                break;
            // End:0xa6b
            case "TOPIC":
                temp = Chop(ParseDelimited(Line, " ", 3));
                Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                SystemPage.ChangeTopic(temp, Temp2);
                // End:0xb28
                break;
            // End:0xa73
            case "305":
            // End:0xa7e
            case "306":
                // End:0xb28
                break;
            // End:0xae5
            case "475":
                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                SystemPage.NotifyChannelKey(Chop(ParseDelimited(ChopLeft(ParseDelimited(Line, " ", 4, true)), ":", 1)));
                // End:0xb28
                break;
            // End:0xffff
            default:
                // End:0xb25
                if(SystemPage.IsDigit(Command))
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                }
                // End:0xb28 Break;
                break;
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
    InvalidAddressText="??? ?? ??, ?? ?? ?."
    ErrorBindingText="?? ?? ??? ??, ?? ?? ?."
    ResolveFailedText="?? ?? ?? ??, ?? ?? ?."
    ConnectedText="???????."
    ConnectingToText="?? ????"
    TimeOutError="?? ?? ?? ??."
    InviteString="?? ??? ???????"
    DisconnectReason="Disconnected"
    VersionString="Battery IRC Client version "
    Shortcuts=// Object reference not set to an instance of an object.
    
}