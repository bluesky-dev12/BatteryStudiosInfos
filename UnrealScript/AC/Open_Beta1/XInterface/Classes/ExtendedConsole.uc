class ExtendedConsole extends Console;

enum ESpeechMenuState
{
    SMS_Main,                       // 0
    SMS_VoiceChat,                  // 1
    SMS_Ack,                        // 2
    SMS_FriendFire,                 // 3
    SMS_Order,                      // 4
    SMS_Other,                      // 5
    SMS_Taunt,                      // 6
    SMS_TauntAnim,                  // 7
    SMS_PlayerSelect,               // 8
    SMS_VoiceChatChannel            // 9
};

struct StoredPassword
{
    var string Server;
    var string Password;
};

struct ServerFavorite
{
    var() int ServerID;
    var() string IP;
    var() int Port;
    var() int QueryPort;
    var() string ServerName;
};

struct ChatStruct
{
    var string Message;
    var int Team;
};

var int MaxScrollbackSize;
var array<string> Scrollback;
var int SBHead;
var int SBPos;
var bool bCtrl;
var bool bAlt;
var bool bShift;
var bool bConsoleHotKey;
var float ConsoleSoundVol;
var localized string AddedCurrentHead;
var localized string AddedCurrentTail;
var localized string ServerFullMsg;
var float SMLineSpace;
var ExtendedConsole.ESpeechMenuState SMState;
var name SMType;
var int SMIndex;
var string SMCallsign;
var int SMOffset;
var string SMNameArray[48];
var int SMIndexArray[48];
var int SMArraySize;
var float SMOriginX;
var float SMOriginY;
var float SMMargin;
var float SMTab;
var localized string SMStateName[10];
var localized string SMChannelOptions[3];
var array<VoiceChatRoom> VoiceChannels;
var localized string SMAllString;
var localized string SMMoreString;
var Sound SMOpenSound;
var Sound SMAcceptSound;
var Sound SMDenySound;
var Interactions.EInputKey LetterKeys[10];
var Interactions.EInputKey NumberKeys[10];
var bool bSpeechMenuUseLetters;
var bool bSpeechMenuUseMouseWheel;
var bool bSpeechMenuLocked;
var int HighlightRow;
var() protected array<ServerFavorite> Favorites;
var array<StoredPassword> SavedPasswords;
var string PasswordPromptMenu;
var string LastConnectedServer;
var string LastURL;
var array<ChatStruct> ChatMessages;
var string ChatMenuClass;
var export editinline transient GUIPage ChatMenu;
var bool bTeamChatOnly;
var export editinline transient UT2MusicManager MusicManager;
var string StatsPromptMenuClass;
var string MusicManagerClassName;
var string WaitingGameClassName;
var string NeedPasswordMenuClass;
var string ServerInfoMenu;
var float FadeClock;
var float FadeTime;
var array<float> DemoPlaybackSpeeds;
var string PlaybackText;
var bool bDemoJogKeys;
//var delegate<OnChat> __OnChat__Delegate;
//var delegate<OnChatMessage> __OnChatMessage__Delegate;
//var delegate<OnExecAddFavorite> __OnExecAddFavorite__Delegate;

delegate OnChat(string Msg, int TeamIndex)
{
    //return;    
}

function OnStatsClosed(optional bool bCancelled)
{
    // End:0x0B
    if(bCancelled)
    {
        return;
    }
    OnStatsConfigured();
    //return;    
}

function OnStatsConfigured()
{
    ViewportOwner.GUIController.CloseAll(false);
    ViewportOwner.Actor.ClientTravel(LastURL, 0, false);
    //return;    
}

event ConnectFailure(string FailCode, string URL)
{
    local string Error, Server;
    local int i, Index;

    Log(((("[ExtendedConsole::ConnectFailure]" $ " FailCode=") $ FailCode) $ " URL=") $ URL);
    LastURL = URL;
    Server = Left(URL, InStr(URL, "/"));
    i = InStr(FailCode, " ");
    // End:0xB7
    if(i > 0)
    {
        Error = Right(FailCode, (Len(FailCode) - i) - 1);
        FailCode = Left(FailCode, i);
    }
    Log(((((("Connect Failure: " @ FailCode) $ "[") $ Error) $ "] (") $ URL) $ ")", 'Debug');
    // End:0x1D8
    if(FailCode == "NEEDPW")
    {
        Index = 0;
        J0x110:

        // End:0x19E [Loop If]
        if(Index < SavedPasswords.Length)
        {
            // End:0x194
            if(SavedPasswords[Index].Server == Server)
            {
                ViewportOwner.Actor.ClearProgressMessages();
                ViewportOwner.Actor.ClientTravel((URL $ "?password=") $ SavedPasswords[Index].Password, 0, false);
                return;
            }
            Index++;
            // [Loop Continue]
            goto J0x110;
        }
        LastConnectedServer = Server;
        // End:0x1D5
        if(ViewportOwner.GUIController.OpenMenu(NeedPasswordMenuClass, URL, FailCode))
        {
            return;
        }        
    }
    else
    {
        // End:0x287
        if(FailCode == "WRONGPW")
        {
            ViewportOwner.Actor.ClearProgressMessages();
            Index = 0;
            J0x20A:

            // End:0x24D [Loop If]
            if(Index < SavedPasswords.Length)
            {
                // End:0x243
                if(SavedPasswords[Index].Server == Server)
                {
                    SavedPasswords.Remove(Index, 1);
                    SaveConfig();
                }
                Index++;
                // [Loop Continue]
                goto J0x20A;
            }
            LastConnectedServer = Server;
            // End:0x284
            if(ViewportOwner.GUIController.OpenMenu(NeedPasswordMenuClass, URL, FailCode))
            {
                return;
            }            
        }
        else
        {
            // End:0x30B
            if(FailCode == "NEEDSTATS")
            {
                ViewportOwner.Actor.ClearProgressMessages();
                // End:0x308
                if(ViewportOwner.GUIController.OpenMenu(StatsPromptMenuClass, "", FailCode))
                {
                    GUIController(ViewportOwner.GUIController).ActivePage.__OnReOpen__Delegate = OnStatsConfigured;
                    return;
                }                
            }
            else
            {
                // End:0x398
                if(FailCode == "LOCALBAN")
                {
                    ViewportOwner.Actor.ClearProgressMessages();
                    ViewportOwner.GUIController.OpenMenu(Class'Engine.GameEngine'.default.DisconnectMenuClass, Localize("Errors", "ConnectionFailed", "Engine"), Class'Engine.AccessControl'.default.IPBanned);
                    return;                    
                }
                else
                {
                    // End:0x427
                    if(FailCode == "SESSIONBAN")
                    {
                        ViewportOwner.Actor.ClearProgressMessages();
                        ViewportOwner.GUIController.OpenMenu(Class'Engine.GameEngine'.default.DisconnectMenuClass, Localize("Errors", "ConnectionFailed", "Engine"), Class'Engine.AccessControl'.default.SessionBanned);
                        return;                        
                    }
                    else
                    {
                        // End:0x485
                        if(FailCode == "SERVERFULL")
                        {
                            ViewportOwner.Actor.ClearProgressMessages();
                            ViewportOwner.GUIController.OpenMenu(Class'Engine.GameEngine'.default.DisconnectMenuClass, ServerFullMsg);
                            return;                            
                        }
                        else
                        {
                            // End:0x4DE
                            if(FailCode == "CHALLENGE")
                            {
                                ViewportOwner.Actor.ClearProgressMessages();
                                ViewportOwner.Actor.ClientNetworkMessage("FC_Challege", "");
                                return;                                
                            }
                            else
                            {
                                // End:0x4F7
                                if(FailCode == "LOGIN")
                                {
                                    FailCode = "";
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Log(((("Unhandled connection failure!  FailCode '" $ FailCode) @ "'   URL '") $ URL) $ "'");
    ViewportOwner.Actor.ProgressCommand("menu:" $ Class'Engine.GameEngine'.default.DisconnectMenuClass, FailCode, Error);
    //return;    
}

event NotifyLevelChange()
{
    super.NotifyLevelChange();
    // End:0x1F
    if(VoiceChannels.Length > 0)
    {
        VoiceChannels.Remove(0, VoiceChannels.Length);
    }
    //return;    
}

exec function cls()
{
    SBHead = 0;
    Scrollback.Remove(0, Scrollback.Length);
    //return;    
}

function PostRender(Canvas Canvas)
{
    local float Delta, ox, oy, XL, YL;

    local Font oFont;
    local Color oColor;
    local float Alpha, afade;

    Delta = ViewportOwner.Actor.Level.TimeSeconds - FadeClock;
    FadeClock = ViewportOwner.Actor.Level.TimeSeconds;
    FadeTime -= Delta;
    // End:0x20D
    if(FadeTime >= float(0))
    {
        ox = Canvas.CurX;
        oy = Canvas.CurY;
        oFont = Canvas.Font;
        oColor = Canvas.DrawColor;
        Canvas.Font = Class'XInterface_Decompressed.HudBase'.static.GetMediumFontFor(Canvas);
        Alpha = 255.0000000;
        afade = FadeTime / (1.0000000 * ViewportOwner.Actor.Level.TimeDilation);
        // End:0x13F
        if(afade < 0.5000000)
        {
            Alpha *= (afade * float(2));
        }
        Canvas.SetDrawColor(64, byte(255), 64, byte(Alpha));
        Canvas.StrLen(PlaybackText, XL, YL);
        Canvas.SetPos(5.0000000, Canvas.ClipY - (YL * 2.5000000));
        Canvas.DrawText(PlaybackText, false);
        Canvas.CurX = ox;
        Canvas.CurY = oy;
        Canvas.Font = oFont;
        Canvas.DrawColor = oColor;        
    }
    else
    {
        FadeTime = 0.0000000;
        bVisible = false;
    }
    //return;    
}

function Chat(coerce string Msg, float MsgLife, PlayerReplicationInfo PRI)
{
    local int Index;

    Message(Msg, MsgLife);
    Index = ChatMessages.Length;
    ChatMessages.Length = Index + 1;
    ChatMessages[Index].Message = Msg;
    // End:0x8D
    if((PRI != none) && PRI.Team != none)
    {
        ChatMessages[Index].Team = PRI.Team.TeamIndex;        
    }
    else
    {
        ChatMessages[Index].Team = 2;
    }
    // End:0x131
    if(((!bTeamChatOnly || PRI == none) || PRI.Team == none) || PRI.Team == ViewportOwner.Actor.PlayerReplicationInfo.Team)
    {
        OnChat(Msg, ChatMessages[Index].Team);
        OnChatMessage(Msg);
    }
    // End:0x146
    if(ChatMessages.Length > 100)
    {
        ChatMessages.Remove(0, 1);
    }
    //return;    
}

delegate OnChatMessage(string Msg)
{
    //return;    
}

event Message(coerce string Msg, float MsgLife)
{
    // End:0x29
    if(Scrollback.Length == MaxScrollbackSize)
    {
        Scrollback.Remove(0, 1);
        SBHead = MaxScrollbackSize - 1;        
    }
    else
    {
        SBHead++;
    }
    Scrollback.Length = Scrollback.Length + 1;
    Scrollback[SBHead] = Msg;
    super.Message(Msg, MsgLife);
    //return;    
}

function GetNewPlaybackSpeed(int Dir)
{
    local float dist, gs;
    local int i, Best;

    gs = ViewportOwner.Actor.Level.TimeDilation;
    dist = 30000.0000000;
    i = 0;
    J0x38:

    // End:0x93 [Loop If]
    if(i < DemoPlaybackSpeeds.Length)
    {
        // End:0x89
        if(Abs(gs - DemoPlaybackSpeeds[i]) < dist)
        {
            dist = gs - DemoPlaybackSpeeds[i];
            Best = i;
        }
        i++;
        // [Loop Continue]
        goto J0x38;
    }
    i = Clamp(Best + Dir, 0, DemoPlaybackSpeeds.Length - 1);
    ViewportOwner.Actor.Level.TimeDilation = DemoPlaybackSpeeds[i];
    // End:0x13D
    if(ViewportOwner.Actor.Level.TimeDilation >= 1.1000000)
    {
        PlaybackText = ("" @ string(int(ViewportOwner.Actor.Level.TimeDilation))) $ "x";        
    }
    else
    {
        gs = 100.0000000 / (ViewportOwner.Actor.Level.TimeDilation * float(100));
        PlaybackText = ("1/" $ string(int(gs))) $ "x";
    }
    FadeTime = 1.0000000 * ViewportOwner.Actor.Level.TimeDilation;
    bVisible = true;
    FadeClock = ViewportOwner.Actor.Level.TimeSeconds;
    //return;    
}

event bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
{
    // End:0xE6
    if(ViewportOwner.Actor.bDemoOwner)
    {
        // End:0xE6
        if(int(Action) == int(3))
        {
            // End:0x47
            if(int(key) == 37)
            {
                GetNewPlaybackSpeed(-1);                
            }
            else
            {
                // End:0x5F
                if(int(key) == 39)
                {
                    GetNewPlaybackSpeed(1);                    
                }
                else
                {
                    // End:0xE6
                    if((int(key) == 38) || int(key) == 40)
                    {
                        ViewportOwner.Actor.Level.TimeDilation = 1.1000000;
                        PlaybackText = "1x";
                        bVisible = true;
                        FadeTime = 1.0000000;
                        FadeClock = ViewportOwner.Actor.Level.TimeSeconds;
                    }
                }
            }
        }
    }
    return super.KeyEvent(key, Action, Delta);
    //return;    
}

function PlayConsoleSound(Sound S)
{
    // End:0x42
    if(((ViewportOwner == none) || ViewportOwner.Actor == none) || ViewportOwner.Actor.Pawn == none)
    {
        return;
    }
    ViewportOwner.Actor.ClientPlaySound(S);
    //return;    
}

event NativeConsoleOpen()
{
    ConsoleOpen();
    //return;    
}

exec function ConsoleOpen()
{
    UnPressButtons();
    TypedStr = "";
    TypedStrPos = 0;
    bCtrl = false;
    bAlt = false;
    bShift = false;
    GotoState('ConsoleVisible');
    PlayConsoleSound(SMOpenSound);
    //return;    
}

exec function ConsoleClose()
{
    TypedStr = "";
    TypedStrPos = 0;
    bCtrl = false;
    bAlt = false;
    bShift = false;
    // End:0x46
    if(GetStateName() == 'ConsoleVisible')
    {
        PlayConsoleSound(SMDenySound);
        GotoState('None');
    }
    //return;    
}

exec function ConsoleToggle()
{
    Log("console toggle");
    UnPressButtons();
    // End:0x2E
    if(GetStateName() == 'ConsoleVisible')
    {
        ConsoleClose();        
    }
    else
    {
        ConsoleOpen();
    }
    //return;    
}

delegate OnExecAddFavorite(ServerFavorite Fav)
{
    //return;    
}

exec function AddCurrentToFavorites()
{
    local string Address, IPString, portString;
    local int colonPos, portNum;
    local ServerFavorite NewFav;

    // End:0x23
    if((ViewportOwner == none) || ViewportOwner.Actor == none)
    {
        return;
    }
    Address = ViewportOwner.Actor.GetServerNetworkAddress();
    // End:0x4F
    if(Address == "")
    {
        return;
    }
    colonPos = InStr(Address, ":");
    // End:0x83
    if(colonPos < 0)
    {
        IPString = Address;
        portNum = 7777;        
    }
    else
    {
        IPString = Left(Address, colonPos);
        portString = Mid(Address, colonPos + 1);
        portNum = int(portString);
    }
    NewFav.IP = IPString;
    NewFav.Port = portNum;
    NewFav.QueryPort = portNum + 1;
    // End:0x123
    if(AddFavorite(NewFav))
    {
        ViewportOwner.Actor.ClientMessage((AddedCurrentHead @ Address) @ AddedCurrentTail);
    }
    OnExecAddFavorite(NewFav);
    //return;    
}

static function bool InFavorites(ServerFavorite Fav)
{
    local int i;

    // End:0x13
    if(Fav.IP == "")
    {
        return false;
    }
    // End:0x33
    if(Fav.Port == 0)
    {
        Fav.Port = 7777;
    }
    // End:0x5B
    if(Fav.QueryPort == 0)
    {
        Fav.QueryPort = Fav.Port + 1;
    }
    i = 0;
    J0x62:

    // End:0xDF [Loop If]
    if(i < default.Favorites.Length)
    {
        // End:0xD5
        if(((Fav.IP == default.Favorites[i].IP) && Fav.Port == default.Favorites[i].Port) && Fav.QueryPort == default.Favorites[i].QueryPort)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    return false;
    //return;    
}

static function bool AddFavorite(ServerFavorite NewFav)
{
    local int i;
    local bool bNew;

    // End:0x13
    if(NewFav.IP == "")
    {
        return false;
    }
    // End:0x33
    if(NewFav.Port == 0)
    {
        NewFav.Port = 7777;
    }
    // End:0x5B
    if(NewFav.QueryPort == 0)
    {
        NewFav.QueryPort = NewFav.Port + 1;
    }
    bNew = true;
    i = 0;
    J0x6A:

    // End:0x111 [Loop If]
    if(i < default.Favorites.Length)
    {
        // End:0x107
        if(((NewFav.IP == default.Favorites[i].IP) && NewFav.Port == default.Favorites[i].Port) && NewFav.QueryPort == default.Favorites[i].QueryPort)
        {
            // End:0xFC
            if(NewFav.ServerName ~= default.Favorites[i].ServerName)
            {
                return false;
            }
            bNew = false;
            // [Explicit Break]
            goto J0x111;
        }
        i++;
        // [Loop Continue]
        goto J0x6A;
    }
    J0x111:

    default.Favorites[i] = NewFav;
    StaticSaveConfig();
    return bNew;
    //return;    
}

static function bool RemoveFavorite(string IP, int Port, int QueryPort)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x87 [Loop If]
    if(i < default.Favorites.Length)
    {
        // End:0x7D
        if(((default.Favorites[i].IP == IP) && default.Favorites[i].Port == Port) && default.Favorites[i].QueryPort == QueryPort)
        {
            default.Favorites.Remove(i, 1);
            StaticSaveConfig();
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

static function GetFavorites(out array<ServerFavorite> List)
{
    List = default.Favorites;
    //return;    
}

static function SaveFavorites()
{
    StaticSaveConfig();
    //return;    
}

exec function SpeechMenuToggle()
{
    return;
    //return;    
}

exec function IngameChat()
{
    local GUIController GC;

    GC = GUIController(ViewportOwner.GUIController);
    // End:0x44
    if(GC.OpenMenu(ChatMenuClass))
    {
        ChatMenu = GC.ActivePage;
    }
    //return;    
}

exec function ServerInfo()
{
    local GUIController GC;

    GC = GUIController(ViewportOwner.GUIController);
    // End:0x26
    if(GC == none)
    {
        return;
    }
    GC.OpenMenu(ServerInfoMenu);
    //return;    
}

exec function TeamChatOnly()
{
    bTeamChatOnly = !bTeamChatOnly;
    //return;    
}

exec function PlayWaitingGame()
{
    local GUIController GC;

    // End:0x0E
    if(WaitingGameClassName == "")
    {
        return;
    }
    GC = GUIController(ViewportOwner.GUIController);
    // End:0x46
    if(GC != none)
    {
        GC.OpenMenu(WaitingGameClassName);
    }
    //return;    
}

exec function MusicMenu()
{
    local GUIController C;
    local int i;

    // End:0x9F
    if(MusicManagerClassName == "")
    {
        Log("No music player menu configured.  Please check the MusicManagerClassName line of the [XInterface.ExtendedConsole] section of the Battery.ini.");
        return;
    }
    C = GUIController(ViewportOwner.GUIController);
    // End:0x118
    if(C != none)
    {
        i = C.FindMenuIndexByName(MusicManagerClassName);
        // End:0x103
        if(i == -1)
        {
            C.OpenMenu(MusicManagerClassName);            
        }
        else
        {
            C.RemoveMenuAt(i, true);
        }
    }
    //return;    
}

exec function DumpPlayInfo(string Group)
{
    local PlayInfo PInfo;

    // End:0x53
    foreach AllObjects(Class'Engine.PlayInfo', PInfo)
    {
        // End:0x52
        if((PInfo.InfoClasses.Length > 0) && PInfo.Settings.Length > 0)
        {
            PInfo.Dump(Group);
            // End:0x53
            break;
        }        
    }    
    //return;    
}

exec function DumpRecords(string Type)
{
    DumpCacheRecords(Type);
    //return;    
}

private final function AddMessage(string Mesg)
{
    Log(Mesg);
    Message(Mesg, 0.0000000);
    //return;    
}

final function DumpCacheRecords(optional string CacheType)
{
    local int i;
    local string Margin;
    local array<CrosshairRecord> CRecs;
    local array<WeaponRecord> WRecs;
    local array<MapRecord> MRecs;
    local array<MutatorRecord> MutRecs;
    local array<GameRecord> GRecs;
    local array<AnnouncerRecord> ARecs;
    local array<VehicleRecord> VRecs;

    // End:0xE4
    if((CacheType == "") || CacheType ~= "Crosshair")
    {
        Class'Engine.CacheManager'.static.GetCrosshairList(CRecs);
        AddMessage(" ================ Cached crosshair records ================ ");
        i = 0;
        J0x7F:

        // End:0xDC [Loop If]
        if(i < CRecs.Length)
        {
            AddMessage(((string(CRecs[i].RecordIndex) $ ")") @ CRecs[i].FriendlyName) @ string(CRecs[i].CrosshairTexture));
            i++;
            // [Loop Continue]
            goto J0x7F;
        }
        AddMessage("");
    }
    // End:0x373
    if((CacheType == "") || CacheType ~= "GameType")
    {
        Class'Engine.CacheManager'.static.GetGameTypeList(GRecs);
        AddMessage(" ================ Cached gametype records ================ ");
        i = 0;
        J0x161:

        // End:0x36B [Loop If]
        if(i < GRecs.Length)
        {
            Margin = "";
            J0x179:

            // End:0x19D [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0x179;
            }
            AddMessage((string(GRecs[i].RecordIndex) $ ")") @ GRecs[i].ClassName);
            AddMessage((Margin $ "    Name        :") $ GRecs[i].GameName);
            AddMessage((Margin $ "    Description :") $ GRecs[i].Description);
            AddMessage((Margin $ "    TextName    :") $ GRecs[i].TextName);
            AddMessage((Margin $ "    GameAcronym :") $ GRecs[i].GameAcronym);
            AddMessage((Margin $ "    MapListType :") $ GRecs[i].MapListClassName);
            AddMessage((Margin $ "    MapPrefix   :") $ GRecs[i].MapPrefix);
            AddMessage((Margin $ "    bTeamGame   :") $ string(GRecs[i].bTeamGame));
            AddMessage((Margin $ "    Group       :") $ string(GRecs[i].GameTypeGroup));
            i++;
            // [Loop Continue]
            goto J0x161;
        }
        AddMessage("");
    }
    // End:0x563
    if((CacheType == "") || CacheType ~= "Weapon")
    {
        Class'Engine.CacheManager'.static.GetWeaponList(WRecs);
        AddMessage(" ================ Cached weapon records ================ ");
        i = 0;
        J0x3EC:

        // End:0x55B [Loop If]
        if(i < WRecs.Length)
        {
            Margin = "";
            J0x404:

            // End:0x428 [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0x404;
            }
            AddMessage((string(WRecs[i].RecordIndex) $ ")") @ WRecs[i].ClassName);
            AddMessage((Margin $ "    FriendlyName:") $ WRecs[i].FriendlyName);
            AddMessage((Margin $ "    Description :") $ WRecs[i].Description);
            AddMessage((Margin $ "    TextName    :") $ WRecs[i].TextName);
            AddMessage((Margin $ "    PickupClass :") $ WRecs[i].PickupClassName);
            AddMessage((Margin $ "    Attachment  :") $ WRecs[i].AttachmentClassName);
            i++;
            // [Loop Continue]
            goto J0x3EC;
        }
        AddMessage("");
    }
    // End:0x82B
    if((CacheType == "") || CacheType ~= "Map")
    {
        Class'Engine.CacheManager'.static.GetMapList(MRecs);
        AddMessage(" ================ Cached map records ================ ");
        i = 0;
        J0x5D6:

        // End:0x823 [Loop If]
        if(i < MRecs.Length)
        {
            Margin = "";
            J0x5EE:

            // End:0x612 [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0x5EE;
            }
            AddMessage((string(MRecs[i].RecordIndex) $ ")") @ MRecs[i].MapName);
            AddMessage((Margin $ "    Acronym       :") $ MRecs[i].Acronym);
            AddMessage((Margin $ "    TextName      :") $ MRecs[i].TextName);
            AddMessage((Margin $ "    FriendlyName  :") $ MRecs[i].FriendlyName);
            AddMessage((Margin $ "    Author        :") $ MRecs[i].Author);
            AddMessage((Margin $ "    PlayerCountMin:") $ string(MRecs[i].PlayerCountMin));
            AddMessage((Margin $ "    PlayerCountMax:") $ string(MRecs[i].PlayerCountMax));
            AddMessage((Margin $ "    Description   :") $ MRecs[i].Description);
            AddMessage((Margin $ "    Screenshot    :") $ MRecs[i].ScreenshotRef);
            AddMessage((Margin $ "    ExtraInfo     :") $ MRecs[i].ExtraInfo);
            i++;
            // [Loop Continue]
            goto J0x5D6;
        }
        AddMessage("");
    }
    // End:0xA40
    if((CacheType == "") || CacheType ~= "Mutator")
    {
        Class'Engine.CacheManager'.static.GetMutatorList(MutRecs);
        AddMessage(" ================ Cached mutator records ================ ");
        i = 0;
        J0x8A6:

        // End:0xA38 [Loop If]
        if(i < MutRecs.Length)
        {
            Margin = "";
            J0x8BE:

            // End:0x8E2 [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0x8BE;
            }
            AddMessage((string(MutRecs[i].RecordIndex) $ ")") @ MutRecs[i].ClassName);
            AddMessage((Margin $ "    FriendlyName       :") $ MutRecs[i].FriendlyName);
            AddMessage((Margin $ "    Description        :") $ MutRecs[i].Description);
            AddMessage((Margin $ "    GroupName          :") $ MutRecs[i].GroupName);
            AddMessage((Margin $ "    ConfigMenu         :") $ MutRecs[i].ConfigMenuClassName);
            AddMessage((Margin $ "    IconMaterialName   :") $ MutRecs[i].IconMaterialName);
            i++;
            // [Loop Continue]
            goto J0x8A6;
        }
        AddMessage("");
    }
    // End:0xBE7
    if((CacheType == "") || CacheType ~= "Announcer")
    {
        Class'Engine.CacheManager'.static.GetAnnouncerList(ARecs);
        AddMessage(" ================ Cached announcer records ================ ");
        i = 0;
        J0xABF:

        // End:0xBDF [Loop If]
        if(i < ARecs.Length)
        {
            Margin = "";
            J0xAD7:

            // End:0xAFB [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0xAD7;
            }
            AddMessage((string(ARecs[i].RecordIndex) $ ")") @ ARecs[i].ClassName);
            AddMessage((Margin $ "    FriendlyName       :") $ ARecs[i].FriendlyName);
            AddMessage((Margin $ "    PackageName        :") $ ARecs[i].PackageName);
            AddMessage((Margin $ "    FallbackPackage    :") $ ARecs[i].FallbackPackage);
            i++;
            // [Loop Continue]
            goto J0xABF;
        }
        AddMessage("");
    }
    // End:0xD51
    if((CacheType == "") || CacheType ~= "Vehicle")
    {
        Class'Engine.CacheManager'.static.GetVehicleList(VRecs);
        AddMessage(" ================ Cached vehicle records ================ ");
        i = 0;
        J0xC62:

        // End:0xD49 [Loop If]
        if(i < VRecs.Length)
        {
            Margin = "";
            J0xC7A:

            // End:0xC9E [Loop If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // [Loop Continue]
                goto J0xC7A;
            }
            AddMessage((string(VRecs[i].RecordIndex) $ ")") @ VRecs[i].ClassName);
            AddMessage((Margin $ "    FriendlyName       :") $ VRecs[i].FriendlyName);
            AddMessage((Margin $ "    Description        :") $ VRecs[i].Description);
            i++;
            // [Loop Continue]
            goto J0xC62;
        }
        AddMessage("");
    }
    //return;    
}

function bool VoiceChatAllowed()
{
    // End:0x0D
    if(ViewportOwner == none)
    {
        return false;
    }
    // End:0x23
    if(ViewportOwner.Actor == none)
    {
        return false;
    }
    // End:0x42
    if(ViewportOwner.Actor.Level == none)
    {
        return false;
    }
    // End:0x6F
    if(int(ViewportOwner.Actor.Level.NetMode) == int(NM_DedicatedServer))
    {
        return false;
    }
    // End:0x9C
    if(int(ViewportOwner.Actor.Level.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    return true;
    //return;    
}

exec function DLO(string ClassName, string ClassType)
{
    local Class C;
    local Object o;

    // End:0x2A
    if(ClassName == "")
    {
        Log("No class name specified.");
        return;
    }
    // End:0x54
    if(ClassType != "")
    {
        C = Class<Object>(DynamicLoadObject(ClassType, Class'Core.Class'));        
    }
    else
    {
        C = Class'Core.Class';
    }
    o = DynamicLoadObject(ClassName, C);
    Log("Result of DLO was " $ string(o));
    //return;    
}

exec function DumpLoadingHints(string Param)
{
    local array<GameRecord> Recs;
    local int i, j;
    local bool bShowAll;
    local Class<GameInfo> GameClass;
    local array<string> Hints;

    Class'Engine.CacheManager'.static.GetGameTypeList(Recs);
    bShowAll = Param == "";
    i = 0;
    J0x28:

    // End:0x108 [Loop If]
    if(i < Recs.Length)
    {
        GameClass = Class<GameInfo>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
        // End:0xFE
        if(GameClass != none)
        {
            Hints = GameClass.static.GetAllLoadHints(!bShowAll);
            // End:0xFE
            if(Hints.Length > 0)
            {
                Log(Recs[i].GameName @ "Loading Hints -");
                j = 0;
                J0xBE:

                // End:0xFA [Loop If]
                if(j < Hints.Length)
                {
                    Log((("  " $ string(j)) $ ") ") $ Hints[j]);
                    j++;
                    // [Loop Continue]
                    goto J0xBE;
                }
                Log("");
            }
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function DebugTabOrder()
{
    // End:0x99
    if((GUIController(ViewportOwner.GUIController) != none) && GUIController(ViewportOwner.GUIController).ActivePage != none)
    {
        Log("Searching for components with invalid tab order...");
        GUIController(ViewportOwner.GUIController).ActivePage.DebugTabOrder();
    }
    //return;    
}

state ConsoleVisible
{
    function bool KeyType(Interactions.EInputKey key, optional string Unicode)
    {
        local PlayerController PC;

        // End:0x16
        if(bIgnoreKeys || bConsoleHotKey)
        {
            return true;
        }
        // End:0x35
        if(ViewportOwner != none)
        {
            PC = ViewportOwner.Actor;
        }
        // End:0xE8
        if(bCtrl && PC != none)
        {
            // End:0x72
            if(int(key) == 3)
            {
                PC.CopyToClipboard(TypedStr);
                return true;                
            }
            else
            {
                // End:0xB5
                if(int(key) == 22)
                {
                    TypedStr $= PC.PasteFromClipboard();
                    TypedStrPos += Len(PC.PasteFromClipboard());
                    return true;                    
                }
                else
                {
                    // End:0xE8
                    if(int(key) == 24)
                    {
                        PC.CopyToClipboard(TypedStr);
                        TypedStr = "";
                        TypedStrPos = 0;
                        return true;
                    }
                }
            }
        }
        // End:0x172
        if(int(key) >= 32)
        {
            // End:0x135
            if(Unicode != "")
            {
                TypedStr = (Left(TypedStr, TypedStrPos) $ Unicode) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);                
            }
            else
            {
                TypedStr = (Left(TypedStr, TypedStrPos) $ Chr(int(key))) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            TypedStrPos++;
            return true;
        }
        return true;
        //return;        
    }

    function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
    {
        local string temp;
        local int i;

        // End:0xA9
        if(int(Action) == int(3))
        {
            // End:0x34
            if(int(key) == int(ConsoleHotKey))
            {
                // End:0x32
                if(bConsoleHotKey)
                {
                    ConsoleClose();
                }
                return true;
            }
            switch(key)
            {
                // End:0x4B
                case 17:
                    bCtrl = false;
                    // End:0xA6
                    break;
                // End:0x5B
                case 18:
                    bAlt = false;
                    // End:0xA6
                    break;
                // End:0x6B
                case 16:
                    bShift = false;
                    // End:0xA6
                    break;
                // End:0xA1
                case 27:
                    // End:0x99
                    if(TypedStr != "")
                    {
                        TypedStr = "";
                        TypedStrPos = 0;
                        HistoryCur = HistoryTop;                        
                    }
                    else
                    {
                        ConsoleClose();
                    }
                    return true;
                // End:0xFFFF
                default:
                    return true;
                    break;
            }            
        }
        else
        {
            // End:0x4CF
            if(int(Action) == int(1))
            {
                bIgnoreKeys = false;
                // End:0xDE
                if(int(key) == int(ConsoleHotKey))
                {
                    bConsoleHotKey = true;
                    return true;
                }
                switch(key)
                {
                    // End:0xF5
                    case 17:
                        bCtrl = true;
                        // End:0x4CF
                        break;
                    // End:0x105
                    case 18:
                        bAlt = true;
                        // End:0x4CF
                        break;
                    // End:0x115
                    case 16:
                        bShift = true;
                        // End:0x4CF
                        break;
                    // End:0x11C
                    case 27:
                        return true;
                    // End:0x1F7
                    case 13:
                        // End:0x1F5
                        if(TypedStr != "")
                        {
                            History[HistoryTop] = TypedStr;
                            HistoryTop = int(float(HistoryTop + 1) % float(16));
                            // End:0x18E
                            if((HistoryBot == -1) || HistoryBot == HistoryTop)
                            {
                                HistoryBot = int(float(HistoryBot + 1) % float(16));
                            }
                            HistoryCur = HistoryTop;
                            temp = TypedStr;
                            TypedStr = "";
                            TypedStrPos = 0;
                            // End:0x1E8
                            if(!ConsoleCommand(temp))
                            {
                                Message(Localize("Errors", "Exec", "Core"), 6.0000000);
                            }
                            Message("", 6.0000000);
                        }
                        return true;
                    // End:0x261
                    case 38:
                        // End:0x25F
                        if(HistoryBot >= 0)
                        {
                            // End:0x224
                            if(HistoryCur == HistoryBot)
                            {
                                HistoryCur = HistoryTop;                                
                            }
                            else
                            {
                                HistoryCur--;
                                // End:0x241
                                if(HistoryCur < 0)
                                {
                                    HistoryCur = 16 - 1;
                                }
                            }
                            TypedStr = History[HistoryCur];
                            TypedStrPos = Len(TypedStr);
                        }
                        return true;
                    // End:0x2C6
                    case 40:
                        // End:0x2C4
                        if(HistoryBot >= 0)
                        {
                            // End:0x28E
                            if(HistoryCur == HistoryTop)
                            {
                                HistoryCur = HistoryBot;                                
                            }
                            else
                            {
                                HistoryCur = int(float(HistoryCur + 1) % float(16));
                            }
                            TypedStr = History[HistoryCur];
                            TypedStrPos = Len(TypedStr);
                        }
                        return true;
                    // End:0x30B
                    case 8:
                        // End:0x309
                        if(TypedStrPos > 0)
                        {
                            TypedStr = Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
                            TypedStrPos--;
                        }
                        return true;
                    // End:0x34F
                    case 46:
                        // End:0x34D
                        if(TypedStrPos < Len(TypedStr))
                        {
                            TypedStr = Left(TypedStr, TypedStrPos) $ Right(TypedStr, (Len(TypedStr) - TypedStrPos) - 1);
                        }
                        return true;
                    // End:0x3A9
                    case 37:
                        i = TypedStrPos - 1;
                        // End:0x399
                        if(bCtrl)
                        {
                            J0x36B:

                            // End:0x399 [Loop If]
                            if((i > 0) && Mid(string(TypedStrPos), i, 1) != " ")
                            {
                                i--;
                                // [Loop Continue]
                                goto J0x36B;
                            }
                        }
                        TypedStrPos = Max(0, i);
                        return true;
                    // End:0x40D
                    case 39:
                        i = TypedStrPos + 1;
                        // End:0x3F7
                        if(bCtrl)
                        {
                            J0x3C5:

                            // End:0x3F7 [Loop If]
                            if((i <= Len(TypedStr)) && Mid(TypedStr, i, 1) != " ")
                            {
                                i++;
                                // [Loop Continue]
                                goto J0x3C5;
                            }
                        }
                        TypedStrPos = Min(Len(TypedStr), i);
                        return true;
                    // End:0x41B
                    case 36:
                        TypedStrPos = 0;
                        return true;
                    // End:0x42F
                    case 35:
                        TypedStrPos = Len(TypedStr);
                        return true;
                    // End:0x434
                    case 33:
                    // End:0x489
                    case 236:
                        // End:0x487
                        if(SBPos < (Scrollback.Length - 1))
                        {
                            // End:0x461
                            if(bCtrl)
                            {
                                SBPos += 5;                                
                            }
                            else
                            {
                                SBPos++;
                            }
                            // End:0x487
                            if(SBPos >= Scrollback.Length)
                            {
                                SBPos = Scrollback.Length - 1;
                            }
                        }
                        return true;
                    // End:0x48E
                    case 34:
                    // End:0x4CC
                    case 237:
                        // End:0x4CC
                        if(SBPos > 0)
                        {
                            // End:0x4B3
                            if(bCtrl)
                            {
                                SBPos -= 5;                                
                            }
                            else
                            {
                                SBPos--;
                            }
                            // End:0x4CC
                            if(SBPos < 0)
                            {
                                SBPos = 0;
                            }
                        }
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }
            return true;
            //return;            
        }
    }

    function BeginState()
    {
        SBPos = 0;
        bVisible = true;
        bIgnoreKeys = true;
        bConsoleHotKey = false;
        HistoryCur = HistoryTop;
        bCtrl = false;
        //return;        
    }

    function EndState()
    {
        bCtrl = false;
        bConsoleHotKey = false;
        //return;        
    }

    function PostRender(Canvas Canvas)
    {
        local float fw, fh, yclip, Y;
        local int idx;

        Canvas.Font = Class'XInterface_Decompressed.HudBase'.static.GetConsoleFont(Canvas);
        yclip = Canvas.ClipY * 0.5000000;
        Canvas.StrLen("X", fw, fh);
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        Canvas.SetPos(0.0000000, (yclip - float(5)) - fh);
        Canvas.DrawTextClipped((("(>" @ Left(TypedStr, TypedStrPos)) $ Chr(4)) $ Eval(TypedStrPos < Len(TypedStr), Mid(TypedStr, TypedStrPos), "_"), true);
        idx = SBHead - SBPos;
        Y = ((yclip - Y) - float(5)) - (fh * float(2));
        // End:0x127
        if(Scrollback.Length == 0)
        {
            return;
        }
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        J0x146:

        // End:0x1A9 [Loop If]
        if((Y > fh) && idx >= 0)
        {
            Canvas.SetPos(0.0000000, Y);
            Canvas.DrawText(Scrollback[idx], false);
            idx--;
            Y -= fh;
            // [Loop Continue]
            goto J0x146;
        }
        //return;        
    }
    stop;    
}

state SpeechMenuVisible
{
    exec function SpeechMenuToggle()
    {
        GotoState('None');
        //return;        
    }

    function bool KeyType(Interactions.EInputKey key, optional string Unicode)
    {
        // End:0x0B
        if(bIgnoreKeys)
        {
            return true;
        }
        return false;
        //return;        
    }

    function SortSMArray()
    {
        local int i, j, tmpInt;
        local string TmpString;

        i = 0;
        J0x07:

        // End:0xD7 [Loop If]
        if(i < (SMArraySize - 1))
        {
            j = i + 1;
            J0x27:

            // End:0xCD [Loop If]
            if(j < SMArraySize)
            {
                // End:0xC3
                if(SMNameArray[i] > SMNameArray[j])
                {
                    TmpString = SMNameArray[i];
                    SMNameArray[i] = SMNameArray[j];
                    SMNameArray[j] = TmpString;
                    tmpInt = SMIndexArray[i];
                    SMIndexArray[i] = SMIndexArray[j];
                    SMIndexArray[j] = tmpInt;
                }
                j++;
                // [Loop Continue]
                goto J0x27;
            }
            i++;
            // [Loop Continue]
            goto J0x07;
        }
        //return;        
    }

    function RebuildSMArray()
    {
        SMArraySize = 0;
        SMOffset = 0;
        return;
        //return;        
    }

    function EnterState(ExtendedConsole.ESpeechMenuState NewState, optional bool bNoSound)
    {
        SMState = NewState;
        HighlightRow = 0;
        RebuildSMArray();
        // End:0x2E
        if(!bNoSound)
        {
            PlayConsoleSound(SMAcceptSound);
        }
        //return;        
    }

    function LeaveState()
    {
        PlayConsoleSound(SMDenySound);
        switch(SMState)
        {
            // End:0x20
            case 0:
                CloseSpeechMenu();
                // End:0x4E
                break;
            // End:0x31
            case 8:
                EnterState(4, true);
                // End:0x4E
                break;
            // End:0x42
            case 9:
                EnterState(1, true);
                // End:0x4E
                break;
            // End:0xFFFF
            default:
                EnterState(0, true);
                break;
        }
        //return;        
    }

    function HandleInput(int keyIn)
    {
        local int selectIndex;
        local UnrealPlayer Up;
        local Pawn TauntPawn;
        local VoiceChatReplicationInfo VRI;

        // End:0x1E
        if(keyIn == -1)
        {
            HighlightRow = 0;
            LeaveState();
            return;
        }
        // End:0x132
        if(int(SMState) == int(0))
        {
            switch(SMNameArray[keyIn - 1])
            {
                // End:0x67
                case SMStateName[1]:
                    SMType = 'None';
                    // End:0x64
                    if(VoiceChatAllowed())
                    {
                        EnterState(1);
                    }
                    // End:0x130
                    break;
                // End:0x88
                case SMStateName[2]:
                    SMType = 'ACK';
                    EnterState(2);
                    // End:0x130
                    break;
                // End:0xA9
                case SMStateName[3]:
                    SMType = 'FRIENDLYFIRE';
                    EnterState(3);
                    // End:0x130
                    break;
                // End:0xCA
                case SMStateName[4]:
                    SMType = 'Order';
                    EnterState(4);
                    // End:0x130
                    break;
                // End:0xEB
                case SMStateName[5]:
                    SMType = 'Other';
                    EnterState(5);
                    // End:0x130
                    break;
                // End:0x10C
                case SMStateName[6]:
                    SMType = 'TAUNT';
                    EnterState(6);
                    // End:0x130
                    break;
                // End:0x12D
                case SMStateName[7]:
                    SMType = 'None';
                    EnterState(7);
                    // End:0x130
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            return;
        }
        // End:0x15B
        if(keyIn == 0)
        {
            // End:0x159
            if((SMArraySize - SMOffset) > 9)
            {
                SMOffset += 9;
            }
            return;
        }
        // End:0x17E
        if(keyIn == -2)
        {
            SMOffset = Max(SMOffset - 9, 0);
            return;
        }
        selectIndex = (SMOffset + keyIn) - 1;
        // End:0x1B1
        if((selectIndex < 0) || selectIndex >= SMArraySize)
        {
            return;
        }
        switch(SMState)
        {
            // End:0x1D9
            case 4:
                SMIndex = SMIndexArray[selectIndex];
                EnterState(8);
                // End:0x435
                break;
            // End:0x1FA
            case 1:
                SMIndex = SMIndexArray[selectIndex];
                EnterState(9);
                // End:0x435
                break;
            // End:0x2C8
            case 9:
                VRI = ViewportOwner.Actor.VoiceReplicationInfo;
                // End:0x229
                if(VRI == none)
                {
                    return;
                }
                switch(SMIndex)
                {
                    // End:0x25C
                    case 0:
                        ViewportOwner.Actor.Join(SMNameArray[selectIndex], "");
                        // End:0x2B4
                        break;
                    // End:0x286
                    case 1:
                        ViewportOwner.Actor.Leave(SMNameArray[selectIndex]);
                        // End:0x2B4
                        break;
                    // End:0x2B1
                    case 2:
                        ViewportOwner.Actor.Speak(SMNameArray[selectIndex]);
                        // End:0x2B4
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                // End:0x435
                break;
            // End:0x34A
            case 8:
                // End:0x309
                if(SMNameArray[selectIndex] == SMAllString)
                {
                    ViewportOwner.Actor.Speech(SMType, SMIndex, "");                    
                }
                else
                {
                    ViewportOwner.Actor.Speech(SMType, SMIndex, SMNameArray[selectIndex]);
                }
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                // End:0x435
                break;
            // End:0x3F7
            case 7:
                Up = UnrealPlayer(ViewportOwner.Actor);
                // End:0x3A6
                if(Vehicle(Up.Pawn) != none)
                {
                    TauntPawn = Vehicle(Up.Pawn).Driver;                    
                }
                else
                {
                    TauntPawn = Up.Pawn;
                }
                Up.TAUNT(TauntPawn.TauntAnims[SMIndexArray[selectIndex]]);
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                // End:0x435
                break;
            // End:0xFFFF
            default:
                ViewportOwner.Actor.Speech(SMType, SMIndexArray[selectIndex], "");
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                break;
        }
        //return;        
    }

    function string NumberToString(int Num)
    {
        local Interactions.EInputKey key;
        local string S;

        // End:0x1C
        if((Num < 0) || Num > 9)
        {
            return "";
        }
        // End:0x39
        if(bSpeechMenuUseLetters)
        {
            key = LetterKeys[Num];            
        }
        else
        {
            key = NumberKeys[Num];
        }
        S = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(int(key)));
        return S;
        //return;        
    }

    function DrawNumbers(Canvas Canvas, int NumNums, bool IncZero, bool sizing, out float XMax, out float YMax)
    {
        local int i;
        local float XPos, YPos, XL, YL;

        XPos = Canvas.ClipX * (SMOriginX + SMMargin);
        YPos = Canvas.ClipY * (SMOriginY + SMMargin);
        Canvas.SetDrawColor(128, byte(255), 128, byte(255));
        i = 0;
        J0x66:

        // End:0x139 [Loop If]
        if(i < NumNums)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0xBC
            if(!sizing)
            {
                Canvas.DrawText((NumberToString(i + 1)) $ "-", false);                
            }
            else
            {
                Canvas.TextSize((NumberToString(i + 1)) $ "-", XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
            YPos += SMLineSpace;
            i++;
            // [Loop Continue]
            goto J0x66;
        }
        // End:0x21D
        if(IncZero)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0x17F
            if(!sizing)
            {
                Canvas.DrawText((NumberToString(0)) $ "-", false);
            }
            XPos += SMTab;
            Canvas.SetPos(XPos, YPos);
            // End:0x1C4
            if(!sizing)
            {
                Canvas.DrawText(SMMoreString, false);                
            }
            else
            {
                Canvas.TextSize(SMMoreString, XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
        }
        //return;        
    }

    function DrawCurrentArray(Canvas Canvas, bool sizing, out float XMax, out float YMax)
    {
        local int i, stopAt;
        local float XPos, YPos, XL, YL;

        XPos = (Canvas.ClipX * (SMOriginX + SMMargin)) + SMTab;
        YPos = Canvas.ClipY * (SMOriginY + SMMargin);
        stopAt = Min(SMOffset + 9, SMArraySize);
        i = SMOffset;
        J0x6C:

        // End:0x1F4 [Loop If]
        if(i < stopAt)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0x17F
            if(!sizing)
            {
                // End:0x145
                if(int(SMState) == int(9))
                {
                    // End:0xE2
                    if(IsActiveChannel(SMOffset + i))
                    {
                        Canvas.SetDrawColor(0, byte(255), 0, byte(255));                        
                    }
                    else
                    {
                        // End:0x123
                        if((SMIndex == 2) && !IsMember(SMOffset + i))
                        {
                            Canvas.SetDrawColor(160, 160, 160, byte(255));                            
                        }
                        else
                        {
                            Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                        }
                    }                    
                }
                else
                {
                    Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                }
                Canvas.DrawText(SMNameArray[i], false);                
            }
            else
            {
                Canvas.TextSize(SMNameArray[i], XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
            YPos += SMLineSpace;
            i++;
            // [Loop Continue]
            goto J0x6C;
        }
        //return;        
    }

    function bool IsActiveChannel(int i)
    {
        // End:0x12
        if(int(SMState) != int(9))
        {
            return false;
        }
        // End:0x47
        if((ViewportOwner.Actor == none) || ViewportOwner.Actor.ActiveRoom == none)
        {
            return false;
        }
        // End:0x65
        if((i < 0) || i > SMArraySize)
        {
            return false;
        }
        // End:0x97
        if(SMIndexArray[i] != ViewportOwner.Actor.ActiveRoom.ChannelIndex)
        {
            return false;
        }
        return true;
        //return;        
    }

    function bool IsMember(int i)
    {
        // End:0x12
        if(int(SMState) != int(9))
        {
            return false;
        }
        // End:0x66
        if(((ViewportOwner.Actor == none) || ViewportOwner.Actor.VoiceReplicationInfo == none) || ViewportOwner.Actor.PlayerReplicationInfo == none)
        {
            return false;
        }
        return ViewportOwner.Actor.VoiceReplicationInfo.IsMember(ViewportOwner.Actor.PlayerReplicationInfo, SMIndexArray[i]);
        //return;        
    }

    function int KeyToNumber(Interactions.EInputKey InKey)
    {
        local int i;

        i = 0;
        J0x07:

        // End:0x67 [Loop If]
        if(i < 10)
        {
            // End:0x3E
            if(bSpeechMenuUseLetters)
            {
                // End:0x3B
                if(int(InKey) == int(LetterKeys[i]))
                {
                    return i;
                }
                // [Explicit Continue]
                goto J0x5D;
            }
            // End:0x5D
            if(int(InKey) == int(NumberKeys[i]))
            {
                return i;
            }
            J0x5D:

            i++;
            // [Loop Continue]
            goto J0x07;
        }
        return -1;
        //return;        
    }

    function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
    {
        local int Input, NumNums;

        NumNums = Min(SMArraySize - SMOffset, 10);
        // End:0x7C
        if(int(Action) == int(1))
        {
            bIgnoreKeys = false;
            // End:0x49
            if(int(key) == int(17))
            {
                bCtrl = true;                
            }
            else
            {
                // End:0x64
                if(int(key) == int(18))
                {
                    bAlt = true;                    
                }
                else
                {
                    // End:0x7C
                    if(int(key) == int(16))
                    {
                        bShift = true;
                    }
                }
            }
        }
        // End:0xFA
        if(int(Action) == int(3))
        {
            // End:0xFA
            if(bAlt)
            {
                // End:0xB5
                if(int(key) == int(37))
                {
                    HandleInput(-1);
                    return true;                    
                }
                else
                {
                    // End:0xFA
                    if(int(key) == int(39))
                    {
                        Input = HighlightRow + 1;
                        // End:0xE6
                        if(Input == 10)
                        {
                            Input = 0;
                        }
                        HighlightRow = 0;
                        HandleInput(Input);
                        return true;
                    }
                }
            }
        }
        // End:0x10C
        if(int(Action) != int(1))
        {
            return false;
        }
        // End:0x129
        if(int(key) == int(27))
        {
            HandleInput(-1);
            return true;
        }
        Input = KeyToNumber(key);
        // End:0x156
        if(Input != -1)
        {
            HandleInput(Input);
            return true;
        }
        // End:0x163
        if(!bSpeechMenuUseMouseWheel)
        {
            return false;
        }
        // End:0x1B7
        if(int(key) == int(236))
        {
            // End:0x1A1
            if((HighlightRow == 0) && SMOffset > 0)
            {
                HandleInput(-2);
                HighlightRow = 9;                
            }
            else
            {
                HighlightRow = Max(HighlightRow - 1, 0);
            }
            return true;            
        }
        else
        {
            // End:0x201
            if(int(key) == int(237))
            {
                // End:0x1E4
                if(HighlightRow == 9)
                {
                    HandleInput(0);
                    HighlightRow = 0;                    
                }
                else
                {
                    HighlightRow = Min(HighlightRow + 1, NumNums - 1);
                }
                return true;                
            }
            else
            {
                // End:0x246
                if(int(key) == int(4))
                {
                    Input = HighlightRow + 1;
                    // End:0x232
                    if(Input == 10)
                    {
                        Input = 0;
                    }
                    HighlightRow = 0;
                    HandleInput(Input);
                    return true;
                }
            }
        }
        return false;
        //return;        
    }

    function Font MyGetSmallFontFor(Canvas Canvas)
    {
        local int i;

        i = 1;
        J0x07:

        // End:0x5E [Loop If]
        if(i < 8)
        {
            // End:0x54
            if(float(Class'XInterface_Decompressed.HudBase'.default.FontScreenWidthSmall[i]) <= Canvas.ClipX)
            {
                return Class'XInterface_Decompressed.HudBase'.static.LoadFontStatic(i - 1);
            }
            i++;
            // [Loop Continue]
            goto J0x07;
        }
        return Class'XInterface_Decompressed.HudBase'.static.LoadFontStatic(7);
        //return;        
    }

    function PostRender(Canvas Canvas)
    {
        local float XL, YL;
        local int SelLeft, i;
        local float XMax, YMax;

        Canvas.Font = Class'XInterface_Decompressed.UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
        XMax = 0.0000000;
        YMax = 0.0000000;
        i = 0;
        J0x4B:

        // End:0xB8 [Loop If]
        if(i < 10)
        {
            Canvas.TextSize((NumberToString(i)) $ "- ", XL, YL);
            XMax = float(Max(int(XMax), int(XL)));
            YMax = float(Max(int(YMax), int(YL)));
            i++;
            // [Loop Continue]
            goto J0x4B;
        }
        SMLineSpace = YMax * 1.1000000;
        SMTab = XMax;
        SelLeft = SMArraySize - SMOffset;
        XMax = 0.0000000;
        YMax = 0.0000000;
        DrawNumbers(Canvas, Min(SelLeft, 9), SelLeft > 9, true, XMax, YMax);
        DrawCurrentArray(Canvas, true, XMax, YMax);
        Canvas.TextSize(SMStateName[int(SMState)], XL, YL);
        XMax = float(Max(int(XMax), int((Canvas.ClipX * (SMOriginX + SMMargin)) + XL)));
        YMax = float(Max(int(YMax), int((float(int(Canvas.ClipY * SMOriginY)) - (1.2000000 * SMLineSpace)) + YL)));
        DrawNumbers(Canvas, Min(SelLeft, 9), SelLeft > 9, false, XMax, YMax);
        DrawCurrentArray(Canvas, false, XMax, YMax);
        Canvas.SetDrawColor(byte(255), byte(255), 128, byte(255));
        Canvas.SetPos(Canvas.ClipX * (SMOriginX + SMMargin), (Canvas.ClipY * SMOriginY) - (1.2000000 * SMLineSpace));
        Canvas.DrawText(SMStateName[int(SMState)]);
        // End:0x2BC
        if(int(SMState) == int(9))
        {
            DrawMembers(Canvas, XMax, YMax);
        }
        //return;        
    }

    function DrawMembers(Canvas Canvas, float XMax, float YMax)
    {
        local array<int> Members;
        local int i;
        local float XPos, YPos, XL, YL;
        local GameReplicationInfo GRI;
        local string CurrentPlayer;

        GRI = ViewportOwner.Actor.GameReplicationInfo;
        // End:0x2A
        if(GRI == none)
        {
            return;
        }
        // End:0x1D5
        if((HighlightRow >= 0) && HighlightRow < SMArraySize)
        {
            Members = ViewportOwner.Actor.VoiceReplicationInfo.GetChannelMembersAt(SMIndexArray[SMOffset + HighlightRow]);
            Canvas.SetDrawColor(byte(255), byte(255), 175, 220);
            XPos = XMax + ((SMMargin * Canvas.ClipX) * 2.2500000);
            YPos = (Canvas.ClipY * (SMOriginY + SMMargin)) + ((float(HighlightRow) + 0.1000000) * SMLineSpace);
            i = 0;
            J0x103:

            // End:0x1D5 [Loop If]
            if(i < Members.Length)
            {
                CurrentPlayer = GRI.FindPlayerByID(Members[i]).PlayerName;
                Canvas.SetPos(XPos, YPos);
                Canvas.TextSize(CurrentPlayer, XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
                YPos += SMLineSpace;
                Canvas.DrawText(CurrentPlayer);
                i++;
                // [Loop Continue]
                goto J0x103;
            }
        }
        //return;        
    }

    function BeginState()
    {
        bVisible = true;
        bIgnoreKeys = true;
        bCtrl = false;
        HighlightRow = 0;
        EnterState(0, true);
        SMCallsign = "";
        PlayConsoleSound(SMOpenSound);
        //return;        
    }

    function CloseSpeechMenu()
    {
        // End:0x12
        if(!bSpeechMenuLocked)
        {
            GotoState('None');
        }
        //return;        
    }

    function EndState()
    {
        bVisible = false;
        bCtrl = false;
        //return;        
    }

    event NotifyLevelChange()
    {
        global.NotifyLevelChange();
        GotoState('None');
        //return;        
    }
    stop;    
}

defaultproperties
{
    MaxScrollbackSize=1024
    ConsoleSoundVol=0.3000000
    AddedCurrentHead="Added servers: "
    AddedCurrentTail="Go to favorites!"
    ServerFullMsg="Server Full"
    SMOriginX=0.0100000
    SMOriginY=0.3000000
    SMMargin=0.0150000
    SMStateName[0]="Speech Menu"
    SMStateName[1]="Voice Chat"
    SMStateName[2]="OK"
    SMStateName[3]="Friendly Fire"
    SMStateName[4]="Command"
    SMStateName[5]="Command"
    SMStateName[6]="Taunt"
    SMStateName[7]="Taunt Animation"
    SMStateName[8]="Player Selection"
    SMChannelOptions[0]="Join"
    SMChannelOptions[1]="Exit"
    SMChannelOptions[2]="Talk"
    SMAllString="[All]"
    SMMoreString="[Add]"
    LetterKeys[0]=81
    LetterKeys[1]=87
    LetterKeys[2]=69
    LetterKeys[3]=82
    LetterKeys[4]=65
    LetterKeys[5]=83
    LetterKeys[6]=68
    LetterKeys[7]=70
    LetterKeys[8]=90
    LetterKeys[9]=88
    NumberKeys[0]=48
    NumberKeys[1]=49
    NumberKeys[2]=50
    NumberKeys[3]=51
    NumberKeys[4]=52
    NumberKeys[5]=53
    NumberKeys[6]=54
    NumberKeys[7]=55
    NumberKeys[8]=56
    NumberKeys[9]=57
    bSpeechMenuUseMouseWheel=true
    ChatMenuClass="GUI2K4.UT2K4InGameChat"
    StatsPromptMenuClass="GUI2K4.UT2K4StatsPrompt"
    MusicManagerClassName="GUI2K4.StreamPlayer"
    NeedPasswordMenuClass="GUI2K4.UT2K4GetPassword"
    ServerInfoMenu="GUI2K4.UT2K4ServerInfo"
    DemoPlaybackSpeeds[0]=0.2500000
    DemoPlaybackSpeeds[1]=0.5000000
    DemoPlaybackSpeeds[2]=1.1000000
    DemoPlaybackSpeeds[3]=2.0000000
    DemoPlaybackSpeeds[4]=4.0000000
    bDemoJogKeys=true
}