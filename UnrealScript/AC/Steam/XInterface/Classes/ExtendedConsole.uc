/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\ExtendedConsole.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:3
 *	Properties:62
 *	Functions:38
 *	States:2
 *
 *******************************************************************************/
class ExtendedConsole extends Console
    dependson(UT2MidGameFont);

enum ESpeechMenuState
{
    SMS_Main,
    SMS_VoiceChat,
    SMS_Ack,
    SMS_FriendFire,
    SMS_Order,
    SMS_Other,
    SMS_Taunt,
    SMS_TauntAnim,
    SMS_PlayerSelect,
    SMS_VoiceChatChannel
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
var Engine.Interactions.EInputKey LetterKeys[10];
var Engine.Interactions.EInputKey NumberKeys[10];
var bool bSpeechMenuUseLetters;
var bool bSpeechMenuUseMouseWheel;
var bool bSpeechMenuLocked;
var int HighlightRow;
var() array<ServerFavorite> Favorites;
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
var delegate<OnChat> __OnChat__Delegate;
var delegate<OnChatMessage> __OnChatMessage__Delegate;
var delegate<OnExecAddFavorite> __OnExecAddFavorite__Delegate;

delegate OnChat(string Msg, int TeamIndex);
function OnStatsClosed(optional bool bCancelled)
{
    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    OnStatsConfigured();
}

function OnStatsConfigured()
{
    ViewportOwner.GUIController.CloseAll(false);
    ViewportOwner.Actor.ClientTravel(LastURL, 0, false);
}

event ConnectFailure(string FailCode, string URL)
{
    local string Error, Server;
    local int i, Index;

    Log("[ExtendedConsole::ConnectFailure]" $ " FailCode=" $ FailCode $ " URL=" $ URL);
    LastURL = URL;
    Server = Left(URL, InStr(URL, "/"));
    i = InStr(FailCode, " ");
    // End:0xb7
    if(i > 0)
    {
        Error = Right(FailCode, Len(FailCode) - i - 1);
        FailCode = Left(FailCode, i);
    }
    Log("Connect Failure: " @ FailCode $ "[" $ Error $ "] (" $ URL $ ")", 'Debug');
    // End:0x1d8
    if(FailCode == "NEEDPW")
    {
        Index = 0;
        J0x110:
        // End:0x19e [While If]
        if(Index < SavedPasswords.Length)
        {
            // End:0x194
            if(SavedPasswords[Index].Server == Server)
            {
                ViewportOwner.Actor.ClearProgressMessages();
                ViewportOwner.Actor.ClientTravel(URL $ "?password=" $ SavedPasswords[Index].Password, 0, false);
                return;
            }
            ++ Index;
            // This is an implied JumpToken; Continue!
            goto J0x110;
        }
        LastConnectedServer = Server;
        // End:0x1d5
        if(ViewportOwner.GUIController.OpenMenu(NeedPasswordMenuClass, URL, FailCode))
        {
            return;
        }
    }
    // End:0x4f7
    else
    {
        // End:0x287
        if(FailCode == "WRONGPW")
        {
            ViewportOwner.Actor.ClearProgressMessages();
            Index = 0;
            J0x20a:
            // End:0x24d [While If]
            if(Index < SavedPasswords.Length)
            {
                // End:0x243
                if(SavedPasswords[Index].Server == Server)
                {
                    SavedPasswords.Remove(Index, 1);
                    SaveConfig();
                }
                ++ Index;
                // This is an implied JumpToken; Continue!
                goto J0x20a;
            }
            LastConnectedServer = Server;
            // End:0x284
            if(ViewportOwner.GUIController.OpenMenu(NeedPasswordMenuClass, URL, FailCode))
            {
                return;
            }
        }
        // End:0x4f7
        else
        {
            // End:0x30b
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
            // End:0x4f7
            else
            {
                // End:0x398
                if(FailCode == "LOCALBAN")
                {
                    ViewportOwner.Actor.ClearProgressMessages();
                    ViewportOwner.GUIController.OpenMenu(class'GameEngine'.default.DisconnectMenuClass, Localize("Errors", "ConnectionFailed", "Engine"), class'AccessControl'.default.IPBanned);
                    return;
                }
                // End:0x4f7
                else
                {
                    // End:0x427
                    if(FailCode == "SESSIONBAN")
                    {
                        ViewportOwner.Actor.ClearProgressMessages();
                        ViewportOwner.GUIController.OpenMenu(class'GameEngine'.default.DisconnectMenuClass, Localize("Errors", "ConnectionFailed", "Engine"), class'AccessControl'.default.SessionBanned);
                        return;
                    }
                    // End:0x4f7
                    else
                    {
                        // End:0x485
                        if(FailCode == "SERVERFULL")
                        {
                            ViewportOwner.Actor.ClearProgressMessages();
                            ViewportOwner.GUIController.OpenMenu(class'GameEngine'.default.DisconnectMenuClass, ServerFullMsg);
                            return;
                        }
                        // End:0x4f7
                        else
                        {
                            // End:0x4de
                            if(FailCode == "CHALLENGE")
                            {
                                ViewportOwner.Actor.ClearProgressMessages();
                                ViewportOwner.Actor.ClientNetworkMessage("FC_Challege", "");
                                return;
                            }
                            // End:0x4f7
                            else
                            {
                                // End:0x4f7
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
    Log("Unhandled connection failure!  FailCode '" $ FailCode @ "'   URL '" $ URL $ "'");
    ViewportOwner.Actor.ProgressCommand("menu:" $ class'GameEngine'.default.DisconnectMenuClass, FailCode, Error);
}

event NotifyLevelChange()
{
    super.NotifyLevelChange();
    // End:0x1f
    if(VoiceChannels.Length > 0)
    {
        VoiceChannels.Remove(0, VoiceChannels.Length);
    }
}

exec function cls()
{
    SBHead = 0;
    Scrollback.Remove(0, Scrollback.Length);
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
    // End:0x20d
    if(FadeTime >= float(0))
    {
        ox = Canvas.CurX;
        oy = Canvas.CurY;
        oFont = Canvas.Font;
        oColor = Canvas.DrawColor;
        Canvas.Font = class'HudBase'.static.GetMediumFontFor(Canvas);
        Alpha = 255.0;
        afade = FadeTime / 1.0 * ViewportOwner.Actor.Level.TimeDilation;
        // End:0x13f
        if(afade < 0.50)
        {
            Alpha *= afade * float(2);
        }
        Canvas.SetDrawColor(64, byte(255), 64, byte(Alpha));
        Canvas.StrLen(PlaybackText, XL, YL);
        Canvas.SetPos(5.0, Canvas.ClipY - YL * 2.50);
        Canvas.DrawText(PlaybackText, false);
        Canvas.CurX = ox;
        Canvas.CurY = oy;
        Canvas.Font = oFont;
        Canvas.DrawColor = oColor;
    }
    // End:0x220
    else
    {
        FadeTime = 0.0;
        bVisible = false;
    }
}

function Chat(coerce string Msg, float MsgLife, PlayerReplicationInfo PRI)
{
    local int Index;

    Message(Msg, MsgLife);
    Index = ChatMessages.Length;
    ChatMessages.Length = Index + 1;
    ChatMessages[Index].Message = Msg;
    // End:0x8d
    if(PRI != none && PRI.Team != none)
    {
        ChatMessages[Index].Team = PRI.Team.TeamIndex;
    }
    // End:0xa0
    else
    {
        ChatMessages[Index].Team = 2;
    }
    // End:0x131
    if(!bTeamChatOnly || PRI == none || PRI.Team == none || PRI.Team == ViewportOwner.Actor.PlayerReplicationInfo.Team)
    {
        OnChat(Msg, ChatMessages[Index].Team);
        OnChatMessage(Msg);
    }
    // End:0x146
    if(ChatMessages.Length > 100)
    {
        ChatMessages.Remove(0, 1);
    }
}

delegate OnChatMessage(string Msg);
event Message(coerce string Msg, float MsgLife)
{
    // End:0x29
    if(Scrollback.Length == MaxScrollbackSize)
    {
        Scrollback.Remove(0, 1);
        SBHead = MaxScrollbackSize - 1;
    }
    // End:0x30
    else
    {
        ++ SBHead;
    }
    Scrollback.Length = Scrollback.Length + 1;
    Scrollback[SBHead] = Msg;
    super.Message(Msg, MsgLife);
}

function GetNewPlaybackSpeed(int Dir)
{
    local float dist, gs;
    local int i, Best;

    gs = ViewportOwner.Actor.Level.TimeDilation;
    dist = 30000.0;
    i = 0;
    J0x38:
    // End:0x93 [While If]
    if(i < DemoPlaybackSpeeds.Length)
    {
        // End:0x89
        if(Abs(gs - DemoPlaybackSpeeds[i]) < dist)
        {
            dist = gs - DemoPlaybackSpeeds[i];
            Best = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    i = Clamp(Best + Dir, 0, DemoPlaybackSpeeds.Length - 1);
    ViewportOwner.Actor.Level.TimeDilation = DemoPlaybackSpeeds[i];
    // End:0x13d
    if(ViewportOwner.Actor.Level.TimeDilation >= 1.10)
    {
        PlaybackText = "" @ string(int(ViewportOwner.Actor.Level.TimeDilation)) $ "x";
    }
    // End:0x18a
    else
    {
        gs = 100.0 / ViewportOwner.Actor.Level.TimeDilation * float(100);
        PlaybackText = "1/" $ string(int(gs)) $ "x";
    }
    FadeTime = 1.0 * ViewportOwner.Actor.Level.TimeDilation;
    bVisible = true;
    FadeClock = ViewportOwner.Actor.Level.TimeSeconds;
}

event bool KeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction Action, float Delta)
{
    // End:0xe6
    if(ViewportOwner.Actor.bDemoOwner)
    {
        // End:0xe6
        if(Action == 3)
        {
            // End:0x47
            if(key == 37)
            {
                GetNewPlaybackSpeed(-1);
            }
            // End:0xe6
            else
            {
                // End:0x5f
                if(key == 39)
                {
                    GetNewPlaybackSpeed(1);
                }
                // End:0xe6
                else
                {
                    // End:0xe6
                    if(key == 38 || key == 40)
                    {
                        ViewportOwner.Actor.Level.TimeDilation = 1.10;
                        PlaybackText = "1x";
                        bVisible = true;
                        FadeTime = 1.0;
                        FadeClock = ViewportOwner.Actor.Level.TimeSeconds;
                    }
                }
            }
        }
    }
    return super.KeyEvent(key, Action, Delta);
}

function PlayConsoleSound(Sound S)
{
    // End:0x42
    if(ViewportOwner == none || ViewportOwner.Actor == none || ViewportOwner.Actor.Pawn == none)
    {
        return;
    }
    ViewportOwner.Actor.ClientPlaySound(S);
}

event NativeConsoleOpen()
{
    ConsoleOpen();
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
}

exec function ConsoleToggle()
{
    Log("console toggle");
    UnPressButtons();
    // End:0x2e
    if(GetStateName() == 'ConsoleVisible')
    {
        ConsoleClose();
    }
    // End:0x34
    else
    {
        ConsoleOpen();
    }
}

delegate OnExecAddFavorite(ServerFavorite Fav);
exec function AddCurrentToFavorites()
{
    local string Address, IPString, portString;
    local int colonPos, portNum;
    local ServerFavorite NewFav;

    // End:0x23
    if(ViewportOwner == none || ViewportOwner.Actor == none)
    {
        return;
    }
    Address = ViewportOwner.Actor.GetServerNetworkAddress();
    // End:0x4f
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
    // End:0xb7
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
        ViewportOwner.Actor.ClientMessage(AddedCurrentHead @ Address @ AddedCurrentTail);
    }
    OnExecAddFavorite(NewFav);
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
    // End:0x5b
    if(Fav.QueryPort == 0)
    {
        Fav.QueryPort = Fav.Port + 1;
    }
    i = 0;
    J0x62:
    // End:0xdf [While If]
    if(i < default.Favorites.Length)
    {
        // End:0xd5
        if(Fav.IP == default.Favorites[i].IP && Fav.Port == default.Favorites[i].Port && Fav.QueryPort == default.Favorites[i].QueryPort)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    return false;
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
    // End:0x5b
    if(NewFav.QueryPort == 0)
    {
        NewFav.QueryPort = NewFav.Port + 1;
    }
    bNew = true;
    i = 0;
    J0x6a:
    // End:0x111 [While If]
    if(i < default.Favorites.Length)
    {
        // End:0x107
        if(NewFav.IP == default.Favorites[i].IP && NewFav.Port == default.Favorites[i].Port && NewFav.QueryPort == default.Favorites[i].QueryPort)
        {
            // End:0xfc
            if(NewFav.ServerName ~= default.Favorites[i].ServerName)
            {
                return false;
            }
            bNew = false;
        }
        // End:0x111
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6a;
        }
    }
    default.Favorites[i] = NewFav;
    StaticSaveConfig();
    return bNew;
}

static function bool RemoveFavorite(string IP, int Port, int QueryPort)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x87 [While If]
    if(i < default.Favorites.Length)
    {
        // End:0x7d
        if(default.Favorites[i].IP == IP && default.Favorites[i].Port == Port && default.Favorites[i].QueryPort == QueryPort)
        {
            default.Favorites.Remove(i, 1);
            StaticSaveConfig();
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

static function GetFavorites(out array<ServerFavorite> List)
{
    List = default.Favorites;
}

static function SaveFavorites()
{
    StaticSaveConfig();
}

exec function SpeechMenuToggle()
{
    return;
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
}

exec function TeamChatOnly()
{
    bTeamChatOnly = !bTeamChatOnly;
}

exec function PlayWaitingGame()
{
    local GUIController GC;

    // End:0x0e
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
}

exec function MusicMenu()
{
    local GUIController C;
    local int i;

    // End:0x9f
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
        // End:0x118
        else
        {
            C.RemoveMenuAt(i, true);
        }
    }
}

exec function DumpPlayInfo(string Group)
{
    local PlayInfo PInfo;

    // End:0x53
    foreach AllObjects(class'PlayInfo', PInfo)
    {
        // End:0x52
        if(PInfo.InfoClasses.Length > 0 && PInfo.Settings.Length > 0)
        {
            PInfo.Dump(Group);
        }
        // End:0x53
        else
        {
            continue;
        }        
    }
}

exec function DumpRecords(string Type)
{
    DumpCacheRecords(Type);
}

private final function AddMessage(string Mesg)
{
    Log(Mesg);
    Message(Mesg, 0.0);
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

    // End:0xe4
    if(CacheType == "" || CacheType ~= "Crosshair")
    {
        class'CacheManager'.static.GetCrosshairList(CRecs);
        AddMessage(" ================ Cached crosshair records ================ ");
        i = 0;
        J0x7f:
        // End:0xdc [While If]
        if(i < CRecs.Length)
        {
            AddMessage(string(CRecs[i].RecordIndex) $ ")" @ CRecs[i].FriendlyName @ string(CRecs[i].CrosshairTexture));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7f;
        }
        AddMessage("");
    }
    // End:0x373
    if(CacheType == "" || CacheType ~= "GameType")
    {
        class'CacheManager'.static.GetGameTypeList(GRecs);
        AddMessage(" ================ Cached gametype records ================ ");
        i = 0;
        J0x161:
        // End:0x36b [While If]
        if(i < GRecs.Length)
        {
            Margin = "";
            J0x179:
            // End:0x19d [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0x179;
            }
            AddMessage(string(GRecs[i].RecordIndex) $ ")" @ GRecs[i].ClassName);
            AddMessage(Margin $ "    Name        :" $ GRecs[i].GameName);
            AddMessage(Margin $ "    Description :" $ GRecs[i].Description);
            AddMessage(Margin $ "    TextName    :" $ GRecs[i].TextName);
            AddMessage(Margin $ "    GameAcronym :" $ GRecs[i].GameAcronym);
            AddMessage(Margin $ "    MapListType :" $ GRecs[i].MapListClassName);
            AddMessage(Margin $ "    MapPrefix   :" $ GRecs[i].MapPrefix);
            AddMessage(Margin $ "    bTeamGame   :" $ string(GRecs[i].bTeamGame));
            AddMessage(Margin $ "    Group       :" $ string(GRecs[i].GameTypeGroup));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x161;
        }
        AddMessage("");
    }
    // End:0x563
    if(CacheType == "" || CacheType ~= "Weapon")
    {
        class'CacheManager'.static.GetWeaponList(WRecs);
        AddMessage(" ================ Cached weapon records ================ ");
        i = 0;
        J0x3ec:
        // End:0x55b [While If]
        if(i < WRecs.Length)
        {
            Margin = "";
            J0x404:
            // End:0x428 [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0x404;
            }
            AddMessage(string(WRecs[i].RecordIndex) $ ")" @ WRecs[i].ClassName);
            AddMessage(Margin $ "    FriendlyName:" $ WRecs[i].FriendlyName);
            AddMessage(Margin $ "    Description :" $ WRecs[i].Description);
            AddMessage(Margin $ "    TextName    :" $ WRecs[i].TextName);
            AddMessage(Margin $ "    PickupClass :" $ WRecs[i].PickupClassName);
            AddMessage(Margin $ "    Attachment  :" $ WRecs[i].AttachmentClassName);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3ec;
        }
        AddMessage("");
    }
    // End:0x82b
    if(CacheType == "" || CacheType ~= "Map")
    {
        class'CacheManager'.static.GetMapList(MRecs);
        AddMessage(" ================ Cached map records ================ ");
        i = 0;
        J0x5d6:
        // End:0x823 [While If]
        if(i < MRecs.Length)
        {
            Margin = "";
            J0x5ee:
            // End:0x612 [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0x5ee;
            }
            AddMessage(string(MRecs[i].RecordIndex) $ ")" @ MRecs[i].MapName);
            AddMessage(Margin $ "    Acronym       :" $ MRecs[i].Acronym);
            AddMessage(Margin $ "    TextName      :" $ MRecs[i].TextName);
            AddMessage(Margin $ "    FriendlyName  :" $ MRecs[i].FriendlyName);
            AddMessage(Margin $ "    Author        :" $ MRecs[i].Author);
            AddMessage(Margin $ "    PlayerCountMin:" $ string(MRecs[i].PlayerCountMin));
            AddMessage(Margin $ "    PlayerCountMax:" $ string(MRecs[i].PlayerCountMax));
            AddMessage(Margin $ "    Description   :" $ MRecs[i].Description);
            AddMessage(Margin $ "    Screenshot    :" $ MRecs[i].ScreenshotRef);
            AddMessage(Margin $ "    ExtraInfo     :" $ MRecs[i].ExtraInfo);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5d6;
        }
        AddMessage("");
    }
    // End:0xa40
    if(CacheType == "" || CacheType ~= "Mutator")
    {
        class'CacheManager'.static.GetMutatorList(MutRecs);
        AddMessage(" ================ Cached mutator records ================ ");
        i = 0;
        J0x8a6:
        // End:0xa38 [While If]
        if(i < MutRecs.Length)
        {
            Margin = "";
            J0x8be:
            // End:0x8e2 [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0x8be;
            }
            AddMessage(string(MutRecs[i].RecordIndex) $ ")" @ MutRecs[i].ClassName);
            AddMessage(Margin $ "    FriendlyName       :" $ MutRecs[i].FriendlyName);
            AddMessage(Margin $ "    Description        :" $ MutRecs[i].Description);
            AddMessage(Margin $ "    GroupName          :" $ MutRecs[i].GroupName);
            AddMessage(Margin $ "    ConfigMenu         :" $ MutRecs[i].ConfigMenuClassName);
            AddMessage(Margin $ "    IconMaterialName   :" $ MutRecs[i].IconMaterialName);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8a6;
        }
        AddMessage("");
    }
    // End:0xbe7
    if(CacheType == "" || CacheType ~= "Announcer")
    {
        class'CacheManager'.static.GetAnnouncerList(ARecs);
        AddMessage(" ================ Cached announcer records ================ ");
        i = 0;
        J0xabf:
        // End:0xbdf [While If]
        if(i < ARecs.Length)
        {
            Margin = "";
            J0xad7:
            // End:0xafb [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0xad7;
            }
            AddMessage(string(ARecs[i].RecordIndex) $ ")" @ ARecs[i].ClassName);
            AddMessage(Margin $ "    FriendlyName       :" $ ARecs[i].FriendlyName);
            AddMessage(Margin $ "    PackageName        :" $ ARecs[i].PackageName);
            AddMessage(Margin $ "    FallbackPackage    :" $ ARecs[i].FallbackPackage);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xabf;
        }
        AddMessage("");
    }
    // End:0xd51
    if(CacheType == "" || CacheType ~= "Vehicle")
    {
        class'CacheManager'.static.GetVehicleList(VRecs);
        AddMessage(" ================ Cached vehicle records ================ ");
        i = 0;
        J0xc62:
        // End:0xd49 [While If]
        if(i < VRecs.Length)
        {
            Margin = "";
            J0xc7a:
            // End:0xc9e [While If]
            if(Len(Margin) < Len(string(i)))
            {
                Margin $= " ";
                // This is an implied JumpToken; Continue!
                goto J0xc7a;
            }
            AddMessage(string(VRecs[i].RecordIndex) $ ")" @ VRecs[i].ClassName);
            AddMessage(Margin $ "    FriendlyName       :" $ VRecs[i].FriendlyName);
            AddMessage(Margin $ "    Description        :" $ VRecs[i].Description);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc62;
        }
        AddMessage("");
    }
}

function bool VoiceChatAllowed()
{
    // End:0x0d
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
    // End:0x6f
    if(ViewportOwner.Actor.Level.NetMode == 1)
    {
        return false;
    }
    // End:0x9c
    if(ViewportOwner.Actor.Level.NetMode == 0)
    {
        return false;
    }
    return true;
}

exec function DLO(string ClassName, string ClassType)
{
    local Class C;
    local Object o;

    // End:0x2a
    if(ClassName == "")
    {
        Log("No class name specified.");
        return;
    }
    // End:0x54
    if(ClassType != "")
    {
        C = class<Object>(DynamicLoadObject(ClassType, class'Class'));
    }
    // End:0x5f
    else
    {
        C = class'Class';
    }
    o = DynamicLoadObject(ClassName, C);
    Log("Result of DLO was " $ string(o));
}

exec function DumpLoadingHints(string Param)
{
    local array<GameRecord> Recs;
    local int i, j;
    local bool bShowAll;
    local class<GameInfo> GameClass;
    local array<string> Hints;

    class'CacheManager'.static.GetGameTypeList(Recs);
    bShowAll = Param == "";
    i = 0;
    J0x28:
    // End:0x108 [While If]
    if(i < Recs.Length)
    {
        GameClass = class<GameInfo>(DynamicLoadObject(Recs[i].ClassName, class'Class'));
        // End:0xfe
        if(GameClass != none)
        {
            Hints = GameClass.static.GetAllLoadHints(!bShowAll);
            // End:0xfe
            if(Hints.Length > 0)
            {
                Log(Recs[i].GameName @ "Loading Hints -");
                j = 0;
                J0xbe:
                // End:0xfa [While If]
                if(j < Hints.Length)
                {
                    Log("  " $ string(j) $ ") " $ Hints[j]);
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xbe;
                }
                Log("");
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

exec function DebugTabOrder()
{
    // End:0x99
    if(GUIController(ViewportOwner.GUIController) != none && GUIController(ViewportOwner.GUIController).ActivePage != none)
    {
        Log("Searching for components with invalid tab order...");
        GUIController(ViewportOwner.GUIController).ActivePage.DebugTabOrder();
    }
}

state ConsoleVisible
{
    function bool KeyType(Engine.Interactions.EInputKey key, optional string Unicode)
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
        // End:0xe8
        if(bCtrl && PC != none)
        {
            // End:0x72
            if(key == 3)
            {
                PC.CopyToClipboard(TypedStr);
                return true;
            }
            // End:0xe8
            else
            {
                // End:0xb5
                if(key == 22)
                {
                    TypedStr $= PC.PasteFromClipboard();
                    TypedStrPos += Len(PC.PasteFromClipboard());
                    return true;
                }
                // End:0xe8
                else
                {
                    // End:0xe8
                    if(key == 24)
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
        if(key >= 32)
        {
            // End:0x135
            if(Unicode != "")
            {
                TypedStr = Left(TypedStr, TypedStrPos) $ Unicode $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            // End:0x169
            else
            {
                TypedStr = Left(TypedStr, TypedStrPos) $ Chr(key) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            ++ TypedStrPos;
            return true;
        }
        return true;
    }

    function bool KeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction Action, float Delta)
    {
        local string temp;
        local int i;

        // End:0xa9
        if(Action == 3)
        {
            // End:0x34
            if(key == ConsoleHotKey)
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
                // End:0x4b
                case 17:
                    bCtrl = false;
                    // End:0xa6
                    break;
                // End:0x5b
                case 18:
                    bAlt = false;
                    // End:0xa6
                    break;
                // End:0x6b
                case 16:
                    bShift = false;
                    // End:0xa6
                    break;
                // End:0xa1
                case 27:
                    // End:0x99
                    if(TypedStr != "")
                    {
                        TypedStr = "";
                        TypedStrPos = 0;
                        HistoryCur = HistoryTop;
                    }
                    // End:0x9f
                    else
                    {
                        ConsoleClose();
                    }
                    return true;
                // End:0xffff
                default:
                    return true;
            }
        }
        // End:0x4cf
        else
        {
            // End:0x4cf
            if(Action == 1)
            {
                bIgnoreKeys = false;
                // End:0xde
                if(key == ConsoleHotKey)
                {
                    bConsoleHotKey = true;
                    return true;
                }
                switch(key)
                {
                    // End:0xf5
                    case 17:
                        bCtrl = true;
                        // End:0x4cf
                        break;
                    // End:0x105
                    case 18:
                        bAlt = true;
                        // End:0x4cf
                        break;
                    // End:0x115
                    case 16:
                        bShift = true;
                        // End:0x4cf
                        break;
                    // End:0x11c
                    case 27:
                        return true;
                    // End:0x1f7
                    case 13:
                        // End:0x1f5
                        if(TypedStr != "")
                        {
                            History[HistoryTop] = TypedStr;
                            HistoryTop = int(float(HistoryTop + 1) % float(16));
                            // End:0x18e
                            if(HistoryBot == -1 || HistoryBot == HistoryTop)
                            {
                                HistoryBot = int(float(HistoryBot + 1) % float(16));
                            }
                            HistoryCur = HistoryTop;
                            temp = TypedStr;
                            TypedStr = "";
                            TypedStrPos = 0;
                            // End:0x1e8
                            if(!ConsoleCommand(temp))
                            {
                                Message(Localize("Errors", "Exec", "Core"), 6.0);
                            }
                            Message("", 6.0);
                        }
                        return true;
                    // End:0x261
                    case 38:
                        // End:0x25f
                        if(HistoryBot >= 0)
                        {
                            // End:0x224
                            if(HistoryCur == HistoryBot)
                            {
                                HistoryCur = HistoryTop;
                            }
                            // End:0x241
                            else
                            {
                                -- HistoryCur;
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
                    // End:0x2c6
                    case 40:
                        // End:0x2c4
                        if(HistoryBot >= 0)
                        {
                            // End:0x28e
                            if(HistoryCur == HistoryTop)
                            {
                                HistoryCur = HistoryBot;
                            }
                            // End:0x2a6
                            else
                            {
                                HistoryCur = int(float(HistoryCur + 1) % float(16));
                            }
                            TypedStr = History[HistoryCur];
                            TypedStrPos = Len(TypedStr);
                        }
                        return true;
                    // End:0x30b
                    case 8:
                        // End:0x309
                        if(TypedStrPos > 0)
                        {
                            TypedStr = Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
                            -- TypedStrPos;
                        }
                        return true;
                    // End:0x34f
                    case 46:
                        // End:0x34d
                        if(TypedStrPos < Len(TypedStr))
                        {
                            TypedStr = Left(TypedStr, TypedStrPos) $ Right(TypedStr, Len(TypedStr) - TypedStrPos - 1);
                        }
                        return true;
                    // End:0x3a9
                    case 37:
                        i = TypedStrPos - 1;
                        // End:0x399
                        if(bCtrl)
                        {
                            J0x36b:
                            // End:0x399 [While If]
                            if(i > 0 && Mid(string(TypedStrPos), i, 1) != " ")
                            {
                                -- i;
                                // This is an implied JumpToken; Continue!
                                goto J0x36b;
                            }
                        }
                        TypedStrPos = Max(0, i);
                        return true;
                    // End:0x40d
                    case 39:
                        i = TypedStrPos + 1;
                        // End:0x3f7
                        if(bCtrl)
                        {
                            J0x3c5:
                            // End:0x3f7 [While If]
                            if(i <= Len(TypedStr) && Mid(TypedStr, i, 1) != " ")
                            {
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x3c5;
                            }
                        }
                        TypedStrPos = Min(Len(TypedStr), i);
                        return true;
                    // End:0x41b
                    case 36:
                        TypedStrPos = 0;
                        return true;
                    // End:0x42f
                    case 35:
                        TypedStrPos = Len(TypedStr);
                        return true;
                    // End:0x434
                    case 33:
                    // End:0x489
                    case 236:
                        // End:0x487
                        if(SBPos < Scrollback.Length - 1)
                        {
                            // End:0x461
                            if(bCtrl)
                            {
                                SBPos += 5;
                            }
                            // End:0x468
                            else
                            {
                                ++ SBPos;
                            }
                            // End:0x487
                            if(SBPos >= Scrollback.Length)
                            {
                                SBPos = Scrollback.Length - 1;
                            }
                        }
                        return true;
                    // End:0x48e
                    case 34:
                    // End:0x4cc
                    case 237:
                        // End:0x4cc
                        if(SBPos > 0)
                        {
                            // End:0x4b3
                            if(bCtrl)
                            {
                                SBPos -= 5;
                            }
                            // End:0x4ba
                            else
                            {
                                -- SBPos;
                            }
                            // End:0x4cc
                            if(SBPos < 0)
                            {
                                SBPos = 0;
                        }
                    }
                    // End:0xffff
                    default:
                    }
                }
                return true;
    }

    function BeginState()
    {
        SBPos = 0;
        bVisible = true;
        bIgnoreKeys = true;
        bConsoleHotKey = false;
        HistoryCur = HistoryTop;
        bCtrl = false;
    }

    function EndState()
    {
        bCtrl = false;
        bConsoleHotKey = false;
    }

    function PostRender(Canvas Canvas)
    {
        local float fw, fh, yclip, Y;
        local int idx;

        Canvas.Font = class'HudBase'.static.GetConsoleFont(Canvas);
        yclip = Canvas.ClipY * 0.50;
        Canvas.StrLen("X", fw, fh);
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        Canvas.SetPos(0.0, yclip - float(5) - fh);
        Canvas.DrawTextClipped("(>" @ Left(TypedStr, TypedStrPos) $ Chr(4) $ Eval(TypedStrPos < Len(TypedStr), Mid(TypedStr, TypedStrPos), "_"), true);
        idx = SBHead - SBPos;
        Y = yclip - Y - float(5) - fh * float(2);
        // End:0x127
        if(Scrollback.Length == 0)
        {
            return;
        }
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        J0x146:
        // End:0x1a9 [While If]
        if(Y > fh && idx >= 0)
        {
            Canvas.SetPos(0.0, Y);
            Canvas.DrawText(Scrollback[idx], false);
            -- idx;
            Y -= fh;
            // This is an implied JumpToken; Continue!
            goto J0x146;
        }
    }

}

state SpeechMenuVisible
{
    exec function SpeechMenuToggle()
    {
        GotoState('None');
    }

    function bool KeyType(Engine.Interactions.EInputKey key, optional string Unicode)
    {
        // End:0x0b
        if(bIgnoreKeys)
        {
            return true;
        }
        return false;
    }

    function SortSMArray()
    {
        local int i, j, tmpInt;
        local string TmpString;

        i = 0;
        J0x07:
        // End:0xd7 [While If]
        if(i < SMArraySize - 1)
        {
            j = i + 1;
            J0x27:
            // End:0xcd [While If]
            if(j < SMArraySize)
            {
                // End:0xc3
                if(SMNameArray[i] > SMNameArray[j])
                {
                    TmpString = SMNameArray[i];
                    SMNameArray[i] = SMNameArray[j];
                    SMNameArray[j] = TmpString;
                    tmpInt = SMIndexArray[i];
                    SMIndexArray[i] = SMIndexArray[j];
                    SMIndexArray[j] = tmpInt;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x27;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }

    function RebuildSMArray()
    {
        SMArraySize = 0;
        SMOffset = 0;
        return;
    }

    function EnterState(ExtendedConsole.ESpeechMenuState NewState, optional bool bNoSound)
    {
        SMState = NewState;
        HighlightRow = 0;
        RebuildSMArray();
        // End:0x2e
        if(!bNoSound)
        {
            PlayConsoleSound(SMAcceptSound);
        }
    }

    function LeaveState()
    {
        PlayConsoleSound(SMDenySound);
        switch(SMState)
        {
            // End:0x20
            case 0:
                CloseSpeechMenu();
                // End:0x4e
                break;
            // End:0x31
            case 8:
                EnterState(4, true);
                // End:0x4e
                break;
            // End:0x42
            case 9:
                EnterState(1, true);
                // End:0x4e
                break;
            // End:0xffff
            default:
                EnterState(0, true);
    }

    function HandleInput(int keyIn)
    {
        local int selectIndex;
        local UnrealPlayer Up;
        local Pawn TauntPawn;
        local VoiceChatReplicationInfo VRI;

        // End:0x1e
        if(keyIn == -1)
        {
            HighlightRow = 0;
            LeaveState();
            return;
        }
        // End:0x132
        if(SMState == 0)
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
                // End:0xa9
                case SMStateName[3]:
                    SMType = 'FRIENDLYFIRE';
                    EnterState(3);
                    // End:0x130
                    break;
                // End:0xca
                case SMStateName[4]:
                    SMType = 'Order';
                    EnterState(4);
                    // End:0x130
                    break;
                // End:0xeb
                case SMStateName[5]:
                    SMType = 'Other';
                    EnterState(5);
                    // End:0x130
                    break;
                // End:0x10c
                case SMStateName[6]:
                    SMType = 'TAUNT';
                    EnterState(6);
                    // End:0x130
                    break;
                // End:0x12d
                case SMStateName[7]:
                    SMType = 'None';
                    EnterState(7);
                    // End:0x130
                    break;
                // End:0xffff
                default:
                    return;
                }
        }
        // End:0x15b
        if(keyIn == 0)
        {
            // End:0x159
            if(SMArraySize - SMOffset > 9)
            {
                SMOffset += 9;
            }
            return;
        }
        // End:0x17e
        if(keyIn == -2)
        {
            SMOffset = Max(SMOffset - 9, 0);
            return;
        }
        selectIndex = SMOffset + keyIn - 1;
        // End:0x1b1
        if(selectIndex < 0 || selectIndex >= SMArraySize)
        {
            return;
        }
        switch(SMState)
        {
            // End:0x1d9
            case 4:
                SMIndex = SMIndexArray[selectIndex];
                EnterState(8);
                // End:0x435
                break;
            // End:0x1fa
            case 1:
                SMIndex = SMIndexArray[selectIndex];
                EnterState(9);
                // End:0x435
                break;
            // End:0x2c8
            case 9:
                VRI = ViewportOwner.Actor.VoiceReplicationInfo;
                // End:0x229
                if(VRI == none)
                {
                    return;
                }
                switch(SMIndex)
                {
                    // End:0x25c
                    case 0:
                        ViewportOwner.Actor.Join(SMNameArray[selectIndex], "");
                        // End:0x2b4
                        break;
                    // End:0x286
                    case 1:
                        ViewportOwner.Actor.Leave(SMNameArray[selectIndex]);
                        // End:0x2b4
                        break;
                    // End:0x2b1
                    case 2:
                        ViewportOwner.Actor.Speak(SMNameArray[selectIndex]);
                        // End:0x2b4
                        break;
                    // End:0xffff
                    default:
                        PlayConsoleSound(SMAcceptSound);
                        CloseSpeechMenu();
                        // End:0x435 Break;
                        break;
            }
            // End:0x34a
            case 8:
                // End:0x309
                if(SMNameArray[selectIndex] == SMAllString)
                {
                    ViewportOwner.Actor.Speech(SMType, SMIndex, "");
                }
                // End:0x336
                else
                {
                    ViewportOwner.Actor.Speech(SMType, SMIndex, SMNameArray[selectIndex]);
                }
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                // End:0x435
                break;
            // End:0x3f7
            case 7:
                Up = UnrealPlayer(ViewportOwner.Actor);
                // End:0x3a6
                if(Vehicle(Up.Pawn) != none)
                {
                    TauntPawn = Vehicle(Up.Pawn).Driver;
                }
                // End:0x3ba
                else
                {
                    TauntPawn = Up.Pawn;
                }
                Up.TAUNT(TauntPawn.TauntAnims[SMIndexArray[selectIndex]]);
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
                // End:0x435
                break;
            // End:0xffff
            default:
                ViewportOwner.Actor.Speech(SMType, SMIndexArray[selectIndex], "");
                PlayConsoleSound(SMAcceptSound);
                CloseSpeechMenu();
    }

    function string NumberToString(int Num)
    {
        local Engine.Interactions.EInputKey key;
        local string S;

        // End:0x1c
        if(Num < 0 || Num > 9)
        {
            return "";
        }
        // End:0x39
        if(bSpeechMenuUseLetters)
        {
            key = LetterKeys[Num];
        }
        // End:0x4a
        else
        {
            key = NumberKeys[Num];
        }
        S = ViewportOwner.Actor.ConsoleCommand("LOCALIZEDKEYNAME" @ string(key));
        return S;
    }

    function DrawNumbers(Canvas Canvas, int NumNums, bool IncZero, bool sizing, out float XMax, out float YMax)
    {
        local int i;
        local float XPos, YPos, XL, YL;

        XPos = Canvas.ClipX * SMOriginX + SMMargin;
        YPos = Canvas.ClipY * SMOriginY + SMMargin;
        Canvas.SetDrawColor(128, byte(255), 128, byte(255));
        i = 0;
        J0x66:
        // End:0x139 [While If]
        if(i < NumNums)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0xbc
            if(!sizing)
            {
                Canvas.DrawText(NumberToString(i + 1) $ "-", false);
            }
            // End:0x123
            else
            {
                Canvas.TextSize(NumberToString(i + 1) $ "-", XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
            YPos += SMLineSpace;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x66;
        }
        // End:0x21d
        if(IncZero)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0x17f
            if(!sizing)
            {
                Canvas.DrawText(NumberToString(0) $ "-", false);
            }
            XPos += SMTab;
            Canvas.SetPos(XPos, YPos);
            // End:0x1c4
            if(!sizing)
            {
                Canvas.DrawText(SMMoreString, false);
            }
            // End:0x21d
            else
            {
                Canvas.TextSize(SMMoreString, XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
        }
    }

    function DrawCurrentArray(Canvas Canvas, bool sizing, out float XMax, out float YMax)
    {
        local int i, stopAt;
        local float XPos, YPos, XL, YL;

        XPos = Canvas.ClipX * SMOriginX + SMMargin + SMTab;
        YPos = Canvas.ClipY * SMOriginY + SMMargin;
        stopAt = Min(SMOffset + 9, SMArraySize);
        i = SMOffset;
        J0x6c:
        // End:0x1f4 [While If]
        if(i < stopAt)
        {
            Canvas.SetPos(XPos, YPos);
            // End:0x17f
            if(!sizing)
            {
                // End:0x145
                if(SMState == 9)
                {
                    // End:0xe2
                    if(IsActiveChannel(SMOffset + i))
                    {
                        Canvas.SetDrawColor(0, byte(255), 0, byte(255));
                    }
                    // End:0x142
                    else
                    {
                        // End:0x123
                        if(SMIndex == 2 && !IsMember(SMOffset + i))
                        {
                            Canvas.SetDrawColor(160, 160, 160, byte(255));
                        }
                        // End:0x142
                        else
                        {
                            Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                        }
                    }
                }
                // End:0x164
                else
                {
                    Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                }
                Canvas.DrawText(SMNameArray[i], false);
            }
            // End:0x1de
            else
            {
                Canvas.TextSize(SMNameArray[i], XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
            }
            YPos += SMLineSpace;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6c;
        }
    }

    function bool IsActiveChannel(int i)
    {
        // End:0x12
        if(SMState != 9)
        {
            return false;
        }
        // End:0x47
        if(ViewportOwner.Actor == none || ViewportOwner.Actor.ActiveRoom == none)
        {
            return false;
        }
        // End:0x65
        if(i < 0 || i > SMArraySize)
        {
            return false;
        }
        // End:0x97
        if(SMIndexArray[i] != ViewportOwner.Actor.ActiveRoom.ChannelIndex)
        {
            return false;
        }
        return true;
    }

    function bool IsMember(int i)
    {
        // End:0x12
        if(SMState != 9)
        {
            return false;
        }
        // End:0x66
        if(ViewportOwner.Actor == none || ViewportOwner.Actor.VoiceReplicationInfo == none || ViewportOwner.Actor.PlayerReplicationInfo == none)
        {
            return false;
        }
        return ViewportOwner.Actor.VoiceReplicationInfo.IsMember(ViewportOwner.Actor.PlayerReplicationInfo, SMIndexArray[i]);
    }

    function int KeyToNumber(Engine.Interactions.EInputKey InKey)
    {
        local int i;

        i = 0;
        J0x07:
        // End:0x67 [While If]
        if(i < 10)
        {
            // End:0x3e
            if(bSpeechMenuUseLetters)
            {
                // End:0x3b
                if(InKey == LetterKeys[i])
                {
                    return i;
                }
            }
            // End:0x5d
            else
            {
                // End:0x5d
                if(InKey == NumberKeys[i])
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

    function bool KeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction Action, float Delta)
    {
        local int Input, NumNums;

        NumNums = Min(SMArraySize - SMOffset, 10);
        // End:0x7c
        if(Action == 1)
        {
            bIgnoreKeys = false;
            // End:0x49
            if(key == 17)
            {
                bCtrl = true;
            }
            // End:0x7c
            else
            {
                // End:0x64
                if(key == 18)
                {
                    bAlt = true;
                }
                // End:0x7c
                else
                {
                    // End:0x7c
                    if(key == 16)
                    {
                        bShift = true;
                    }
                }
            }
        }
        // End:0xfa
        if(Action == 3)
        {
            // End:0xfa
            if(bAlt)
            {
                // End:0xb5
                if(key == 37)
                {
                    HandleInput(-1);
                    return true;
                }
                // End:0xfa
                else
                {
                    // End:0xfa
                    if(key == 39)
                    {
                        Input = HighlightRow + 1;
                        // End:0xe6
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
        // End:0x10c
        if(Action != 1)
        {
            return false;
        }
        // End:0x129
        if(key == 27)
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
        // End:0x1b7
        if(key == 236)
        {
            // End:0x1a1
            if(HighlightRow == 0 && SMOffset > 0)
            {
                HandleInput(-2);
                HighlightRow = 9;
            }
            // End:0x1b2
            else
            {
                HighlightRow = Max(HighlightRow - 1, 0);
            }
            return true;
        }
        // End:0x246
        else
        {
            // End:0x201
            if(key == 237)
            {
                // End:0x1e4
                if(HighlightRow == 9)
                {
                    HandleInput(0);
                    HighlightRow = 0;
                }
                // End:0x1fc
                else
                {
                    HighlightRow = Min(HighlightRow + 1, NumNums - 1);
                }
                return true;
            }
            // End:0x246
            else
            {
                // End:0x246
                if(key == 4)
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
    }

    function Font MyGetSmallFontFor(Canvas Canvas)
    {
        local int i;

        i = 1;
        J0x07:
        // End:0x5e [While If]
        if(i < 8)
        {
            // End:0x54
            if(float(class'HudBase'.default.FontScreenWidthSmall[i]) <= Canvas.ClipX)
            {
                return class'HudBase'.static.LoadFontStatic(i - 1);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
        return class'HudBase'.static.LoadFontStatic(7);
    }

    function PostRender(Canvas Canvas)
    {
        local float XL, YL;
        local int SelLeft, i;
        local float XMax, YMax;

        Canvas.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
        XMax = 0.0;
        YMax = 0.0;
        i = 0;
        J0x4b:
        // End:0xb8 [While If]
        if(i < 10)
        {
            Canvas.TextSize(NumberToString(i) $ "- ", XL, YL);
            XMax = float(Max(int(XMax), int(XL)));
            YMax = float(Max(int(YMax), int(YL)));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
        SMLineSpace = YMax * 1.10;
        SMTab = XMax;
        SelLeft = SMArraySize - SMOffset;
        XMax = 0.0;
        YMax = 0.0;
        DrawNumbers(Canvas, Min(SelLeft, 9), SelLeft > 9, true, XMax, YMax);
        DrawCurrentArray(Canvas, true, XMax, YMax);
        Canvas.TextSize(SMStateName[SMState], XL, YL);
        XMax = float(Max(int(XMax), int(Canvas.ClipX * SMOriginX + SMMargin + XL)));
        YMax = float(Max(int(YMax), int(float(int(Canvas.ClipY * SMOriginY)) - 1.20 * SMLineSpace + YL)));
        DrawNumbers(Canvas, Min(SelLeft, 9), SelLeft > 9, false, XMax, YMax);
        DrawCurrentArray(Canvas, false, XMax, YMax);
        Canvas.SetDrawColor(byte(255), byte(255), 128, byte(255));
        Canvas.SetPos(Canvas.ClipX * SMOriginX + SMMargin, Canvas.ClipY * SMOriginY - 1.20 * SMLineSpace);
        Canvas.DrawText(SMStateName[SMState]);
        // End:0x2bc
        if(SMState == 9)
        {
            DrawMembers(Canvas, XMax, YMax);
        }
    }

    function DrawMembers(Canvas Canvas, float XMax, float YMax)
    {
        local array<int> Members;
        local int i;
        local float XPos, YPos, XL, YL;
        local GameReplicationInfo GRI;
        local string CurrentPlayer;

        GRI = ViewportOwner.Actor.GameReplicationInfo;
        // End:0x2a
        if(GRI == none)
        {
            return;
        }
        // End:0x1d5
        if(HighlightRow >= 0 && HighlightRow < SMArraySize)
        {
            Members = ViewportOwner.Actor.VoiceReplicationInfo.GetChannelMembersAt(SMIndexArray[SMOffset + HighlightRow]);
            Canvas.SetDrawColor(byte(255), byte(255), 175, 220);
            XPos = XMax + SMMargin * Canvas.ClipX * 2.250;
            YPos = Canvas.ClipY * SMOriginY + SMMargin + float(HighlightRow) + 0.10 * SMLineSpace;
            i = 0;
            J0x103:
            // End:0x1d5 [While If]
            if(i < Members.Length)
            {
                CurrentPlayer = GRI.FindPlayerByID(Members[i]).PlayerName;
                Canvas.SetPos(XPos, YPos);
                Canvas.TextSize(CurrentPlayer, XL, YL);
                XMax = float(Max(int(XMax), int(XPos + XL)));
                YMax = float(Max(int(YMax), int(YPos + YL)));
                YPos += SMLineSpace;
                Canvas.DrawText(CurrentPlayer);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x103;
            }
        }
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
    }

    function CloseSpeechMenu()
    {
        // End:0x12
        if(!bSpeechMenuLocked)
        {
            GotoState('None');
        }
    }

    function EndState()
    {
        bVisible = false;
        bCtrl = false;
    }

    event NotifyLevelChange()
    {
        global.NotifyLevelChange();
        GotoState('None');
    }

}

defaultproperties
{
    MaxScrollbackSize=1024
    ConsoleSoundVol=0.30
    AddedCurrentHead="Added servers: "
    AddedCurrentTail="Go to favorites!"
    ServerFullMsg="Server Full"
    SMOriginX=0.010
    SMOriginY=0.30
    SMMargin=0.0150
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
    DemoPlaybackSpeeds=// Object reference not set to an instance of an object.
    
    bDemoJogKeys=true
}