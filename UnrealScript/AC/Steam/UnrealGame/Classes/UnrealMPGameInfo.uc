/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealMPGameInfo.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:24
 *	Functions:34
 *
 *******************************************************************************/
class UnrealMPGameInfo extends GameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    hidedropdown;

const MPPROPNUM = 4;

var byte BotMode;
var int MinPlayers;
var float EndTimeDelay;
var float BotRatio;
var bool bPreloadAllSkins;
var string DefaultVoiceChannel;
var bool bAllowPrivateChat;
var bool bTeamScoreRounds;
var bool bSoaking;
var bool bPlayersVsBots;
var float EndTime;
var SpecialVehicleObjective SpecialVehicleObjectives;
var class<ScoreBoard> LocalStatsScreenClass;
var() string VoiceReplicationInfoType;
var localized string MPGIPropsDisplayText[4];
var localized string MPGIPropDescText[4];
var localized string BotModeText;
var localized string SPBotText;
var localized string MPBotText;
var localized string SPBotDesc;
var localized string MPBotDesc;
var localized string BotOptions[4];
var MasterServerUplink MSUplink;
var bool bMSUplinkSet;

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode)
{
    local MasterServerUplink MSU;

    super.PreLogin(Options, Address, PlayerID, Error, FailCode);
    // End:0x90
    if(Error == "" && FailCode == "")
    {
        // End:0x69
        if(!bMSUplinkSet)
        {
            // End:0x60
            foreach AllActors(class'MasterServerUplink', MSU)
            {
                MSUplink = MSU;                                
            }
            bMSUplinkSet = true;
        }
        // End:0x90
        if(bMSUplinkSet && MSUplink != none)
        {
            MSUplink.ForceGameStateRefresh(5);
        }
    }
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;

    PC = super.Login(Portal, Options, Error);
    // End:0xb1
    if(PC != none)
    {
        // End:0xb1
        if(Level.NetMode == 1 || Level.NetMode == 2)
        {
            PC.VoiceReplicationInfo = VoiceReplicationInfo;
            // End:0xb1
            if(Level.NetMode == 2 && Level.GetLocalPlayerController() == PC)
            {
                PC.InitializeVoiceChat();
            }
        }
    }
    return PC;
}

function InitVoiceReplicationInfo()
{
    local class<VoiceChatReplicationInfo> VRIClass;
    local int i;

    // End:0x36
    if(Level.NetMode == 0 || Level.NetMode == 3)
    {
        return;
    }
    // End:0x73
    if(VoiceReplicationInfoType != "")
    {
        VRIClass = class<VoiceChatReplicationInfo>(DynamicLoadObject(VoiceReplicationInfoType, class'Class'));
        // End:0x73
        if(VRIClass != none)
        {
            VoiceReplicationInfoClass = VRIClass;
        }
    }
    // End:0x99
    if(VoiceReplicationInfoClass != none && VoiceReplicationInfo == none)
    {
        VoiceReplicationInfo = Spawn(VoiceReplicationInfoClass);
    }
    super.InitVoiceReplicationInfo();
    VoiceReplicationInfo.bPrivateChat = bAllowPrivateChat;
    i = VoiceReplicationInfo.GetChannelIndex(DefaultVoiceChannel);
    // End:0x10c
    if(i != -1 && i != VoiceReplicationInfo.DefaultChannel)
    {
        VoiceReplicationInfo.DefaultChannel = i;
    }
}

function InitMaplistHandler()
{
    local class<MaplistManagerBase> MaplistManagerClass;

    // End:0x0d
    if(MaplistHandler != none)
    {
        return;
    }
    // End:0x34
    if(MaplistHandlerType != "")
    {
        MaplistManagerClass = class<MaplistManagerBase>(DynamicLoadObject(MaplistHandlerType, class'Class'));
    }
    // End:0x4a
    if(MaplistManagerClass == none)
    {
        MaplistManagerClass = MaplistHandlerClass;
    }
    // End:0x63
    if(MaplistManagerClass != none)
    {
        MaplistHandler = Spawn(MaplistManagerClass);
    }
}

function ChangeVoiceChannel(PlayerReplicationInfo PRI, int NewChannelIndex, int OldChannelIndex)
{
    local VoiceChatRoom NewChannel, OldChannel;

    // End:0x32
    if(PRI == none)
    {
        Log("ChangeVoiceChannel - no PRI!", 'VoiceChat');
        return;
    }
    // End:0x75
    if(VoiceReplicationInfo == none)
    {
        Log("ChangeVoiceChannel - no VoiceReplicationInfo!", 'VoiceChat');
        return;
    }
    // End:0x112
    if(NewChannelIndex >= 0)
    {
        NewChannel = VoiceReplicationInfo.GetChannelAt(NewChannelIndex);
        // End:0xfe
        if(NewChannel == none)
        {
            Log("ChangeVoiceChannel - invalid channel index requested! (" $ string(PRI) @ string(NewChannelIndex) $ ")", 'VoiceChat');
            return;
        }
        NewChannel.AddMember(PRI);
    }
    OldChannel = VoiceReplicationInfo.GetChannelAt(OldChannelIndex);
    // End:0x14b
    if(OldChannel != none)
    {
        OldChannel.RemoveMember(PRI);
    }
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    // End:0x24
    if(GameStats != none)
    {
        GameStats.SpecialEvent(Who, Desc);
    }
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, class<DamageType> Damage)
{
    local TeamPlayerReplicationInfo TPRI;

    TPRI = TeamPlayerReplicationInfo(Victim);
    // End:0x5b
    if(TPRI != none)
    {
        // End:0x47
        if(Killer == none || Killer == Victim)
        {
            ++ TPRI.Suicides;
        }
        TPRI.AddWeaponDeath(Damage);
    }
    TPRI = TeamPlayerReplicationInfo(Killer);
    // End:0x99
    if(TPRI != none)
    {
        // End:0x99
        if(TPRI != Victim)
        {
            TPRI.AddWeaponKill(Damage);
        }
    }
    // End:0xc7
    if(GameStats != none)
    {
        GameStats.KillEvent(KillType, Killer, Victim, Damage);
    }
}

function GameEvent(string GEvent, string Desc, PlayerReplicationInfo Who)
{
    local TeamPlayerReplicationInfo TPRI;

    // End:0x29
    if(GameStats != none)
    {
        GameStats.GameEvent(GEvent, Desc, Who);
    }
    TPRI = TeamPlayerReplicationInfo(Who);
    // End:0x46
    if(TPRI == none)
    {
        return;
    }
    // End:0xb8
    if(GEvent ~= "flag_taken" || GEvent ~= "flag_pickup" || GEvent ~= "bomb_taken" || GEvent ~= "Bomb_pickup")
    {
        ++ TPRI.FlagTouches;
        return;
    }
    // End:0xe3
    if(GEvent ~= "flag_returned")
    {
        ++ TPRI.FlagReturns;
        return;
    }
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.ScoreEvent(Who, Points, Desc);
    }
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.TeamScoreEvent(Team, Points, Desc);
    }
}

function int GetNumPlayers()
{
    // End:0x29
    if(NumPlayers > 0)
    {
        return Max(NumPlayers, Min(NumPlayers + NumBots, MaxPlayers - 1));
    }
    return NumPlayers;
}

function bool ShouldRespawn(Pickup Other)
{
    return false;
}

function float SpawnWait(AIController B)
{
    // End:0x21
    if(B.PlayerReplicationInfo.bOutOfLives)
    {
        return 999.0;
    }
    // End:0x6a
    if(Level.NetMode == 0)
    {
        // End:0x4c
        if(NumBots < 4)
        {
            return 0.0;
        }
        return 0.50 * FMax(2.0, float(NumBots - 4)) * FRand();
    }
    // End:0x79
    if(bPlayersVsBots)
    {
        return 0.0;
    }
    return FRand();
}

function bool TooManyBots(Controller botToRemove)
{
    return Level.NetMode != 0 && NumBots + NumPlayers > MinPlayers;
}

function RestartGame()
{
    // End:0x0b
    if(bGameRestarted)
    {
        return;
    }
    // End:0x2c
    if(CurrentGameProfile != none)
    {
        CurrentGameProfile.ContinueSinglePlayerGame(Level);
        return;
    }
    // End:0x46
    if(EndTime > Level.TimeSeconds)
    {
        return;
    }
    super.RestartGame();
}

static function Texture GetRandomTeamSymbol(int Base)
{
    return none;
}

function ObjectiveDisabled(GameObjective DisabledObjective);
function FindNewObjectives(GameObjective DisabledObjective);
function GameObject GetGameObject(name GameObjectName);
function ScoreGameObject(Controller C, GameObject Go);
function ChangeLoadOut(PlayerController P, string LoadoutName);
function ForceAddBot();
function bool CanShowPathTo(PlayerController P, int TeamNum);
function ShowPathTo(PlayerController P, int TeamNum);
function int AdjustDestroyObjectiveDamage(int Damage, Controller instigatedBy, GameObjective Go)
{
    return Damage;
}

function bool CanDisableObjective(GameObjective Go)
{
    return true;
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
    local byte bAllowPickup;

    // End:0x39
    if(GameRulesModifiers != none && GameRulesModifiers.OverridePickupQuery(Other, Item, bAllowPickup))
    {
        return bAllowPickup == 1;
    }
    // End:0x74
    if(UnrealPawn(Other) != none && !UnrealPawn(Other).IsInLoadout(Item.InventoryType))
    {
        return false;
    }
    // End:0x8d
    if(Other.Inventory == none)
    {
        return true;
    }
    // End:0xad
    else
    {
        return !Other.Inventory.HandlePickupQuery(Item);
    }
}

function InitPlacedBot(Controller C, RosterEntry R);
function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "MinPlayers", string(MinPlayers));
    AddServerDetail(ServerState, "EndTimeDelay", string(EndTimeDelay));
}

static function AdjustBotInterface(bool bSinglePlayer)
{
    // End:0x33
    if(bSinglePlayer)
    {
        default.MPGIPropsDisplayText[0] = default.SPBotText;
        default.MPGIPropDescText[0] = default.SPBotDesc;
        default.BotModeText = GenerateBotOptions(true);
    }
    // End:0x5a
    else
    {
        default.MPGIPropsDisplayText[0] = default.MPBotText;
        default.MPGIPropDescText[0] = default.MPBotDesc;
        default.BotModeText = GenerateBotOptions(false);
    }
}

static function string GenerateBotOptions(bool bSinglePlayer)
{
    local string Option;
    local byte Value;

    // End:0x8c
    if(bSinglePlayer)
    {
        Value = byte(default.BotMode & 12);
        Option = string(Value) $ ";" $ default.BotOptions[0];
        Option $= ";" $ string(Value | 1) $ ";" $ default.BotOptions[1];
        Option $= ";" $ string(Value | 2) $ ";" $ default.BotOptions[2];
    }
    // End:0x11d
    else
    {
        Value = byte(default.BotMode & 3);
        Option = string(Value | 4) $ ";" $ default.BotOptions[0];
        Option $= ";" $ string(Value | 8) $ ";" $ default.BotOptions[2];
        // End:0x11d
        if(default.bTeamGame)
        {
            Option $= ";" $ string(Value | 16) $ ";" $ default.BotOptions[3];
        }
    }
    return Option;
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.BotsGroup, "MinPlayers", default.MPGIPropsDisplayText[++ i], 0, 0, "Text", "3;0:32");
    PlayInfo.AddSetting(default.GameGroup, "EndTimeDelay", default.MPGIPropsDisplayText[++ i], 1, 1, "Text",,,, true);
    PlayInfo.AddSetting(default.BotsGroup, "BotMode", default.MPGIPropsDisplayText[++ i], 30, 1, "Select", default.BotModeText);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowPrivateChat", default.MPGIPropsDisplayText[++ i], 254, 1, "Check",, "Xv", true, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1e
        case "MinPlayers":
            return default.MPGIPropDescText[0];
        // End:0x37
        case "EndTimeDelay":
            return default.MPGIPropDescText[1];
        // End:0x4c
        case "BotMode":
            return default.MPGIPropDescText[2];
        // End:0x6b
        case "bAllowPrivateChat":
            return default.MPGIPropDescText[3];
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function int MultiMinPlayers()
{
    return MinPlayers;
}

defaultproperties
{
    BotMode=5
    EndTimeDelay=4.0
    BotRatio=1.0
    bAllowPrivateChat=true
    LocalStatsScreenClass=class'DMStatsScreen'
    MPGIPropsDisplayText[0]="?? ????"
    MPGIPropsDisplayText[1]="??? ????"
    MPGIPropsDisplayText[2]="? ?? ??"
    MPGIPropsDisplayText[3]="??? ?? ??"
    MPGIPropDescText[0]="?? ??? ?? ???? ?? ??? ?? ??? ? ?? ?? ??? ????."
    MPGIPropDescText[1]="??? ???? ?? ??? ???? ???? ?? ??? ?????."
    MPGIPropDescText[2]="???? ? ???? ??? ?????."
    MPGIPropDescText[3]="?? ??? ?????? ??? ??? ??? ?? ?? ??? ?????"
    BotModeText="0;??? ??;1;? ??? ??;2;? ?? ??"
    SPBotText="? ??"
    MPBotText="?? ????"
    SPBotDesc="??? ??? ? ??? ?????."
    MPBotDesc="?? ????? ???? ?? ??? ?? ??? ?? ???? ??? ?? ??? ??? ? ????."
    BotOptions[0]="?? ???"
    BotOptions[1]="? ??? ??"
    BotOptions[2]="? ?? ??"
    BotOptions[3]="???? VS ?"
    PlayerControllerClassName="UnrealGame.UnrealPlayer"
    VoiceReplicationInfoClass=class'UnrealVoiceReplicationInfo'
}