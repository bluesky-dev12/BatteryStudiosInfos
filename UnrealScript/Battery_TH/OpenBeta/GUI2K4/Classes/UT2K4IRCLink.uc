class UT2K4IRCLink extends BufferedTCPLink
    transient
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct CommandAlias
{
    var() string AliasText;
    var() string RealCommand;
};

var IpAddr ServerIPAddr;
var string ServerAddress;
var int ServerPort;
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
    //return;    
}

function CloseMe()
{
    // End:0x1F
    if(SystemPage != none)
    {
        SystemPage.CloseLink(self, false);        
    }
    else
    {
        DestroyLink();
    }
    //return;    
}

function Connect(UT2k4IRC_System InSystemPage, string InServer, string InNickName, string InUserIdent, string InFullName, string InDefaultChannel)
{
    local int i;

    Log((((("UT2K4IRCLink Connect:" @ InServer) @ InNickName) @ InUserIdent) @ InFullName) @ InDefaultChannel, 'IRC');
    SystemPage = InSystemPage;
    NickName = InNickName;
    FullName = InFullName;
    UserIdent = InUserIdent;
    DefaultChannel = InDefaultChannel;
    i = InStr(InServer, ":");
    // End:0xB0
    if(i == -1)
    {
        ServerAddress = InServer;
        ServerPort = 6667;        
    }
    else
    {
        ServerAddress = Left(InServer, i);
        ServerPort = int(Mid(InServer, i + 1));
    }
    ResetBuffer();
    ServerIPAddr.Port = ServerPort;
    SetTimer(20.0000000, false);
    SystemPage.SystemText(ConnectingToText @ ServerAddress);
    Resolve(ServerAddress);
    //return;    
}

function string ChopLeft(string Text)
{
    J0x00:
    // End:0x38 [Loop If]
    if((Text != "") && InStr(": !", Left(Text, 1)) != -1)
    {
        Text = Mid(Text, 1);
        // [Loop Continue]
        goto J0x00;
    }
    return Text;
    //return;    
}

function string RemoveNickPrefix(string Nick)
{
    J0x00:
    // End:0x39 [Loop If]
    if((Nick != "") && InStr(":@+%", Left(Nick, 1)) != -1)
    {
        Nick = Mid(Nick, 1);
        // [Loop Continue]
        goto J0x00;
    }
    return Nick;
    //return;    
}

function string Chop(string Text)
{
    J0x00:
    // End:0x38 [Loop If]
    if((Text != "") && InStr(": !", Left(Text, 1)) != -1)
    {
        Text = Mid(Text, 1);
        // [Loop Continue]
        goto J0x00;
    }
    J0x38:

    // End:0x79 [Loop If]
    if((Text != "") && InStr(": !", Right(Text, 1)) != -1)
    {
        Text = Left(Text, Len(Text) - 1);
        // [Loop Continue]
        goto J0x38;
    }
    return Text;
    //return;    
}

function Resolved(IpAddr Addr)
{
    ServerIPAddr.Addr = Addr.Addr;
    // End:0x4C
    if(ServerIPAddr.Addr == 0)
    {
        // End:0x4A
        if(SystemPage != none)
        {
            SystemPage.SystemText(InvalidAddressText);
            CloseMe();
        }
        return;
    }
    Log((("Battery UT2K4IRCLink: Server is " $ ServerAddress) $ ":") $ string(ServerIPAddr.Port), 'IRC');
    // End:0xC2
    if((BindPort()) == 0)
    {
        // End:0xC0
        if(SystemPage != none)
        {
            SystemPage.SystemText(ErrorBindingText);
            CloseMe();
        }
        return;
    }
    Open(ServerIPAddr);
    //return;    
}

event Closed()
{
    CloseMe();
    //return;    
}

function ResolveFailed()
{
    // End:0x25
    if(SystemPage != none)
    {
        SystemPage.SystemText(ResolveFailedText);
        CloseMe();
    }
    //return;    
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
    //return;    
}

event Opened()
{
    SetTimer(0.0000000, false);
    // End:0x28
    if(SystemPage != none)
    {
        SystemPage.SystemText(ConnectedText);
    }
    Enable('Tick');
    GotoState('LoggingIn');
    //return;    
}

function Tick(float DeltaTime)
{
    local string Line;

    DoBufferQueueIO();
    // End:0x1F
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
            // End:0x6B
            if(SystemPage != none)
            {
                SystemPage.UpdateAway();
            }
            SinceLastLevCheck = 0.0000000;
        }
    }
    //return;    
}

function SendCommandText(string Cmd)
{
    local int i;
    local string Text, Temp;

    Divide(Cmd, " ", Cmd, Text);
    ReplaceCommandAlias(Cmd);
    switch(Cmd)
    {
        // End:0x32
        case "PRIVMSG":
        // End:0x3D
        case "NOTICE":
        // End:0xA4
        case "KILL":
            // End:0x55
            if(Text == "")
            {
                // [Explicit Continue]
                goto J0x1E8;
            }
            Text = ChopLeft(Text);
            // End:0xA1
            if(Divide(Text, " ", Temp, Text))
            {
                Temp @= (":" $ (ChopLeft(Text)));
                Text = Temp;
            }
            // End:0x1E8
            break;
        // End:0xB0
        case "CTCP":
            // End:0x1E8
            break;
        // End:0x169
        case "KICK":
            // End:0xC8
            if(Text == "")
            {
                // [Explicit Continue]
                goto J0x1E8;
            }
            Text = ChopLeft(Text);
            // End:0x14A
            if(Divide(Text, " ", Temp, Text))
            {
                i = InStr(Text, " ");
                // End:0x125
                if(i != -1)
                {
                    Temp @= (":" $ Text);                    
                }
                else
                {
                    // End:0x13F
                    if(Text != "")
                    {
                        Temp @= Text;
                    }
                }
                Text = Temp;
            }
            Text = SystemPage.GetCurrentChannelName() @ Text;
            // End:0x1E8
            break;
        // End:0x198
        case "QUIT":
            // End:0x195
            if(Text != "")
            {
                Text = " :" $ (ChopLeft(Text));
            }
            // End:0x1E8
            break;
        // End:0x1AE
        case "JOIN":
            JoinChannel(Text);
            return;
        // End:0x1E5
        case "PART":
            // End:0x1D8
            if(Text == "")
            {
                Text = SystemPage.GetCurrentChannelName();
            }
            PartChannel(Text);
            return;
        // End:0xFFFF
        default:
            break;
    }
    J0x1E8:

    // End:0x21F
    if(Cmd != "")
    {
        SendBufferedData((Cmd $ Eval(Text != "", " " $ Text, "")) $ CRLF);
    }
    //return;    
}

function ReplaceCommandAlias(out string Text)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < Shortcuts.Length)
    {
        // End:0x49
        if(Shortcuts[i].AliasText ~= Text)
        {
            Text = Shortcuts[i].RealCommand;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SendBufferedData(string Text)
{
    ReplaceText(Text, "$*", "");
    ReplaceText(Text, "#*", "");
    super.SendBufferedData(Text);
    //return;    
}

function SendChannelText(string Channel, string Text)
{
    // End:0x21
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    SendBufferedData(((("PRIVMSG " $ Channel) $ " :") $ Text) $ CRLF);
    //return;    
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
    SendBufferedData((((((("PRIVMSG " $ Channel) $ " :") $ Chr(1)) $ "ACTION ") $ Text) $ Chr(1)) $ CRLF);
    //return;    
}

function ProcessInput(string Line)
{
    // End:0x34
    if(Left(Line, 5) == "PING ")
    {
        SendBufferedData(("PONG " $ Mid(Line, 5)) $ CRLF);
    }
    //return;    
}

function JoinChannel(string Channel)
{
    Log("UT2K4IRCLink: JoinChannel: " $ Channel, 'IRC');
    // End:0x4C
    if(Channel == "")
    {
        Channel = SystemPage.GetCurrentChannelName();
    }
    // End:0x6C
    if(Left(Channel, 1) != "#")
    {
        Channel = "#" $ Channel;
    }
    SendBufferedData(("JOIN " $ Channel) $ CRLF);
    //return;    
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
    SendBufferedData(("PART " $ Channel) $ CRLF);
    //return;    
}

function SetNick(string NewNick)
{
    // End:0x0E
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
    //return;    
}

function SetAway(string AwayText)
{
    SendBufferedData(("AWAY :" $ AwayText) $ CRLF);
    //return;    
}

function DestroyLink()
{
    SystemPage = none;
    SetTimer(0.0000000, false);
    // End:0x3E
    if(IsConnected())
    {
        SendText(("QUIT :" $ DisconnectReason) $ CRLF);
        Close();        
    }
    else
    {
        Destroy();
    }
    //return;    
}

state LoggingIn
{
    function Timer()
    {
        SendBufferedData(("NICK " $ NickName) $ CRLF);
        SetTimer(1.0000000, false);
        //return;        
    }

    function ProcessInput(string Line)
    {
        local string Temp;

        Log("LoggingIn: " $ Line, 'IRC');
        Temp = ParseDelimited(Line, " ", 2);
        // End:0x72
        if((ParseDelimited(Line, " ", 1)) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        // End:0xC2
        if(Temp == "433")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
            SetTimer(0.0000000, false);
            SystemPage.NotifyNickInUse();            
        }
        else
        {
            // End:0x112
            if(Temp == "432")
            {
                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
                SetTimer(0.0000000, false);
                SystemPage.NotifyInvalidNick();                
            }
            else
            {
                // End:0x15F
                if(SystemPage.IsDigit(Temp))
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 3, true)));
                    SetTimer(0.0000000, false);
                    GotoState('LoggedIn');
                }
            }
        }
        global.ProcessInput(Line);
        //return;        
    }

    function SendCommandText(string Text)
    {
        // End:0x44
        if((ParseDelimited(Text, " ", 1)) ~= "NICK")
        {
            SystemPage.ChangedNick(NickName, Chop(ParseDelimited(Text, " ", 2)));
        }
        global.SendCommandText(Text);
        //return;        
    }
Begin:

    // End:0x5B
    if((SystemPage.Link != none) && SystemPage.Link != self)
    {
        SystemPage.CloseLink(SystemPage.Link, true);
        SystemPage.Link = self;        
    }
    else
    {
        // End:0x7F
        if(SystemPage.Link == none)
        {
            SystemPage.Link = self;
        }
    }
    SendBufferedData(((((("USER " $ UserIdent) $ " localhost ") $ ServerAddress) $ " :") $ FullName) $ CRLF);
    SendBufferedData(("NICK " $ NickName) $ CRLF);
    stop;                
}

state LoggedIn
{
    function ProcessInput(string Line)
    {
        local string Temp, Temp2, Temp3;
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
        // End:0x6F
        if((ParseDelimited(Line, " ", 1)) == "ERROR")
        {
            SystemPage.SystemText(ChopLeft(ParseDelimited(Line, ":", 2, true)));
        }
        switch(Command)
        {
            // End:0xDA
            case "JOIN":
                Temp = ParseDelimited(Line, ":!", 2);
                // End:0xAD
                if(Temp ~= NickName)
                {
                    Temp = "";
                }
                SystemPage.JoinedChannel(Chop(ParseDelimited(Line, " ", 3)), Temp);
                // End:0xB28
                break;
            // End:0x13E
            case "PART":
                Temp = ParseDelimited(Line, ":!", 2);
                // End:0x111
                if(Temp ~= NickName)
                {
                    Temp = "";
                }
                SystemPage.PartedChannel(Chop(ParseDelimited(Line, " ", 3)), Temp);
                // End:0xB28
                break;
            // End:0x180
            case "NICK":
                SystemPage.ChangedNick(ParseDelimited(Line, ":!", 2), Chop(ParseDelimited(Line, " ", 3)));
                // End:0xB28
                break;
            // End:0x1C3
            case "QUIT":
                SystemPage.UserQuit(ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 3, true)));
                // End:0xB28
                break;
            // End:0x315
            case "353":
                Temp2 = ParseDelimited(Line, "#", 2);
                Temp2 = ParseDelimited(Temp2, " :", 1);
                Temp = ParseDelimited(Line, ":", 3, true);
                J0x20E:

                // End:0x312 [Loop If]
                if(Temp != "")
                {
                    Temp3 = ParseDelimited(Temp, " ", 1);
                    SystemPage.UserInChannel("#" $ Temp2, RemoveNickPrefix(Temp3));
                    // End:0x28B
                    if(Left(Temp3, 1) == "@")
                    {
                        SystemPage.ChangeOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);                        
                    }
                    else
                    {
                        // End:0x2C3
                        if(Left(Temp3, 1) == "%")
                        {
                            SystemPage.ChangeHalfOp("#" $ Temp2, RemoveNickPrefix(Temp3), true);                            
                        }
                        else
                        {
                            // End:0x2F8
                            if(Left(Temp3, 1) == "+")
                            {
                                SystemPage.ChangeVoice("#" $ Temp2, RemoveNickPrefix(Temp3), true);
                            }
                        }
                    }
                    Temp = ParseDelimited(Temp, " ", 2, true);
                    // [Loop Continue]
                    goto J0x20E;
                }
                // End:0xB28
                break;
            // End:0x31D
            case "333":
            // End:0x325
            case "366":
            // End:0x330
            case "331":
                // End:0xB28
                break;
            // End:0x38D
            case "332":
                Temp = Chop(ParseDelimited(Line, " ", 4));
                Temp2 = Chop(ParseDelimited(Line, " ", 5, true));
                SystemPage.ChangeTopic(Temp, Temp2);
                // End:0xB28
                break;
            // End:0x398
            case "341":
                // End:0xB28
                break;
            // End:0x3DF
            case "301":
                SystemPage.PrintAwayMessage(Chop(ParseDelimited(Line, " ", 4)), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                // End:0xB28
                break;
            // End:0x4F3
            case "NOTICE":
                Temp = ParseDelimited(Line, ": ", 2);
                Temp2 = ParseDelimited(Line, ":! ", 2);
                // End:0x4CA
                if((InStr(Temp, "!") != -1) && InStr(Temp2, ".") == -1)
                {
                    Temp = ChopLeft(ParseDelimited(Line, " ", 4, true));
                    // End:0x4AE
                    if((Asc(Left(Temp, 1)) == 1) && Asc(Right(Temp, 1)) == 1)
                    {
                        SystemPage.CTCP("", Temp2, Mid(Temp, 1, Len(Temp) - 2));                        
                    }
                    else
                    {
                        SystemPage.UserNotice(Temp2, Temp);
                    }                    
                }
                else
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                }
                // End:0xB28
                break;
            // End:0x6AD
            case "MODE":
                Temp = Chop(ParseDelimited(Line, " ", 4));
                Temp3 = Chop(ParseDelimited(Line, " ", 3));
                i = 5;
                bAddModifier = true;
                J0x544:

                // End:0x66E [Loop If]
                if(Temp != "")
                {
                    Temp2 = Left(Temp, 1);
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
                    // End:0x5CF
                    if(Temp2 == "o")
                    {
                        SystemPage.ChangeOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        i++;
                    }
                    // End:0x616
                    if(Temp2 == "h")
                    {
                        SystemPage.ChangeHalfOp(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        i++;
                    }
                    // End:0x65D
                    if(Temp2 == "v")
                    {
                        SystemPage.ChangeVoice(Temp3, Chop(ParseDelimited(Line, " ", i)), bAddModifier);
                        i++;
                    }
                    Temp = Mid(Temp, 1);
                    // [Loop Continue]
                    goto J0x544;
                }
                SystemPage.ChangeMode(Temp3, ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, " ", 4, true)));
                // End:0xB28
                break;
            // End:0x71C
            case "KICK":
                SystemPage.KickUser(Chop(ParseDelimited(Line, " ", 3)), Chop(ParseDelimited(Line, " ", 4)), ParseDelimited(Line, ":!", 2), ChopLeft(ParseDelimited(Line, ":", 3, true)));
                // End:0xB28
                break;
            // End:0x763
            case "INVITE":
                SystemPage.SystemText(((ParseDelimited(Line, ":!", 2)) @ InviteString) @ (ParseDelimited(Line, ":", 3)));
                // End:0xB28
                break;
            // End:0xA0C
            case "PRIVMSG":
                Temp = Chop(ParseDelimited(Line, " ", 3));
                Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                // End:0x886
                if(((Mid(Temp2, 1, 7) == "ACTION ") && Asc(Left(Temp2, 1)) == 1) && Asc(Right(Temp2, 1)) == 1)
                {
                    Temp2 = Mid(Temp2, 8);
                    Temp2 = Left(Temp2, Len(Temp2) - 1);
                    // End:0x85E
                    if((Temp != "") && InStr("&#@", Left(Temp, 1)) != -1)
                    {
                        SystemPage.ChannelAction(Temp, ParseDelimited(Line, ":!", 2), Temp2);                        
                    }
                    else
                    {
                        SystemPage.PrivateAction(ParseDelimited(Line, ":!", 2), Temp2);
                    }                    
                }
                else
                {
                    // End:0x990
                    if((Asc(Left(Temp2, 1)) == 1) && Asc(Right(Temp2, 1)) == 1)
                    {
                        Temp2 = Mid(Temp2, 1, Len(Temp2) - 2);
                        switch(Temp2)
                        {
                            // End:0x95D
                            case "VERSION":
                                SendBufferedData(((((((("NOTICE " $ (ParseDelimited(Line, ":!", 2))) $ " :") $ Chr(1)) $ "VERSION ") $ VersionString) $ Level.EngineVersion) $ Chr(1)) $ CRLF);
                                SystemPage.CTCP(Temp, ParseDelimited(Line, ":!", 2), Temp2);
                                // End:0x98D
                                break;
                            // End:0xFFFF
                            default:
                                SystemPage.CTCP(Temp, ParseDelimited(Line, ":!", 2), Temp2);
                                // End:0x98D
                                break;
                                break;
                        }                        
                    }
                    else
                    {
                        // End:0x9E4
                        if((Temp != "") && InStr("&#@", Left(Temp, 1)) != -1)
                        {
                            SystemPage.ChannelText(Temp, ParseDelimited(Line, ":!", 2), Temp2);                            
                        }
                        else
                        {
                            SystemPage.PrivateText(ParseDelimited(Line, ":!", 2), Temp2);
                        }
                    }
                }
                // End:0xB28
                break;
            // End:0xA6B
            case "TOPIC":
                Temp = Chop(ParseDelimited(Line, " ", 3));
                Temp2 = ChopLeft(ParseDelimited(Line, " ", 4, true));
                SystemPage.ChangeTopic(Temp, Temp2);
                // End:0xB28
                break;
            // End:0xA73
            case "305":
            // End:0xA7E
            case "306":
                // End:0xB28
                break;
            // End:0xAE5
            case "475":
                SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                SystemPage.NotifyChannelKey(Chop(ParseDelimited(ChopLeft(ParseDelimited(Line, " ", 4, true)), ":", 1)));
                // End:0xB28
                break;
            // End:0xFFFF
            default:
                // End:0xB25
                if(SystemPage.IsDigit(Command))
                {
                    SystemPage.SystemText(ChopLeft(ParseDelimited(Line, " ", 4, true)));
                }
                // End:0xB28
                break;
                break;
        }
        //return;        
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
    Shortcuts[0]=(AliasText="MSG",RealCommand="PRIVMSG")
    Shortcuts[1]=(AliasText="LEAVE",RealCommand="PART")
    Shortcuts[2]=(AliasText="J",RealCommand="JOIN")
    Shortcuts[3]=(AliasText="P",RealCommand="PART")
    Shortcuts[4]=(AliasText="N",RealCommand="NICK")
}