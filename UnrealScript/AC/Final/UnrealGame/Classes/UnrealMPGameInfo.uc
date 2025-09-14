class UnrealMPGameInfo extends GameInfo
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
var Class<ScoreBoard> LocalStatsScreenClass;
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
    if((Error == "") && FailCode == "")
    {
        // End:0x69
        if(!bMSUplinkSet)
        {
            // End:0x60
            foreach AllActors(Class'IpDrv.MasterServerUplink', MSU)
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
    //return;    
}

event PlayerController Login(string Portal, string Options, out string Error)
{
    local PlayerController PC;

    PC = super.Login(Portal, Options, Error);
    // End:0xB1
    if(PC != none)
    {
        // End:0xB1
        if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
        {
            PC.VoiceReplicationInfo = VoiceReplicationInfo;
            // End:0xB1
            if((int(Level.NetMode) == int(NM_ListenServer)) && Level.GetLocalPlayerController() == PC)
            {
                PC.InitializeVoiceChat();
            }
        }
    }
    return PC;
    //return;    
}

function InitVoiceReplicationInfo()
{
    local Class<VoiceChatReplicationInfo> VRIClass;
    local int i;

    // End:0x36
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_Client))
    {
        return;
    }
    // End:0x73
    if(VoiceReplicationInfoType != "")
    {
        VRIClass = Class<VoiceChatReplicationInfo>(DynamicLoadObject(VoiceReplicationInfoType, Class'Core.Class'));
        // End:0x73
        if(VRIClass != none)
        {
            VoiceReplicationInfoClass = VRIClass;
        }
    }
    // End:0x99
    if((VoiceReplicationInfoClass != none) && VoiceReplicationInfo == none)
    {
        VoiceReplicationInfo = Spawn(VoiceReplicationInfoClass);
    }
    super.InitVoiceReplicationInfo();
    VoiceReplicationInfo.bPrivateChat = bAllowPrivateChat;
    i = VoiceReplicationInfo.GetChannelIndex(DefaultVoiceChannel);
    // End:0x10C
    if((i != -1) && i != VoiceReplicationInfo.DefaultChannel)
    {
        VoiceReplicationInfo.DefaultChannel = i;
    }
    //return;    
}

function InitMaplistHandler()
{
    local Class<MaplistManagerBase> MaplistManagerClass;

    // End:0x0D
    if(MaplistHandler != none)
    {
        return;
    }
    // End:0x34
    if(MaplistHandlerType != "")
    {
        MaplistManagerClass = Class<MaplistManagerBase>(DynamicLoadObject(MaplistHandlerType, Class'Core.Class'));
    }
    // End:0x4A
    if(MaplistManagerClass == none)
    {
        MaplistManagerClass = MaplistHandlerClass;
    }
    // End:0x63
    if(MaplistManagerClass != none)
    {
        MaplistHandler = Spawn(MaplistManagerClass);
    }
    //return;    
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
        // End:0xFE
        if(NewChannel == none)
        {
            Log((("ChangeVoiceChannel - invalid channel index requested! (" $ string(PRI)) @ string(NewChannelIndex)) $ ")", 'VoiceChat');
            return;
        }
        NewChannel.AddMember(PRI);
    }
    OldChannel = VoiceReplicationInfo.GetChannelAt(OldChannelIndex);
    // End:0x14B
    if(OldChannel != none)
    {
        OldChannel.RemoveMember(PRI);
    }
    //return;    
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    // End:0x24
    if(GameStats != none)
    {
        GameStats.SpecialEvent(Who, Desc);
    }
    //return;    
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, Class<DamageType> Damage)
{
    local TeamPlayerReplicationInfo TPRI;

    TPRI = TeamPlayerReplicationInfo(Victim);
    // End:0x5B
    if(TPRI != none)
    {
        // End:0x47
        if((Killer == none) || Killer == Victim)
        {
            TPRI.Suicides++;
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
    // End:0xC7
    if(GameStats != none)
    {
        GameStats.KillEvent(KillType, Killer, Victim, Damage);
    }
    //return;    
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
    // End:0xB8
    if((((GEvent ~= "flag_taken") || GEvent ~= "flag_pickup") || GEvent ~= "bomb_taken") || GEvent ~= "Bomb_pickup")
    {
        TPRI.FlagTouches++;
        return;
    }
    // End:0xE3
    if(GEvent ~= "flag_returned")
    {
        TPRI.FlagReturns++;
        return;
    }
    //return;    
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.ScoreEvent(Who, Points, Desc);
    }
    //return;    
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    // End:0x29
    if(GameStats != none)
    {
        GameStats.TeamScoreEvent(Team, Points, Desc);
    }
    //return;    
}

function int GetNumPlayers()
{
    // End:0x29
    if(NumPlayers > 0)
    {
        return Max(NumPlayers, Min(NumPlayers + NumBots, MaxPlayers - 1));
    }
    return NumPlayers;
    //return;    
}

function bool ShouldRespawn(Pickup Other)
{
    return false;
    //return;    
}

function float SpawnWait(AIController B)
{
    // End:0x21
    if(B.PlayerReplicationInfo.bOutOfLives)
    {
        return 999.0000000;
    }
    // End:0x6A
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x4C
        if(NumBots < 4)
        {
            return 0.0000000;
        }
        return (0.5000000 * FMax(2.0000000, float(NumBots - 4))) * FRand();
    }
    // End:0x79
    if(bPlayersVsBots)
    {
        return 0.0000000;
    }
    return FRand();
    //return;    
}

function bool TooManyBots(Controller botToRemove)
{
    return (int(Level.NetMode) != int(NM_Standalone)) && (NumBots + NumPlayers) > MinPlayers;
    //return;    
}

function RestartGame()
{
    // End:0x0B
    if(bGameRestarted)
    {
        return;
    }
    // End:0x2C
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
    //return;    
}

static function Texture GetRandomTeamSymbol(int Base)
{
    return none;
    //return;    
}

function ObjectiveDisabled(GameObjective DisabledObjective)
{
    //return;    
}

function FindNewObjectives(GameObjective DisabledObjective)
{
    //return;    
}

function GameObject GetGameObject(name GameObjectName)
{
    //return;    
}

function ScoreGameObject(Controller C, GameObject Go)
{
    //return;    
}

function ChangeLoadOut(PlayerController P, string LoadoutName)
{
    //return;    
}

function ForceAddBot()
{
    //return;    
}

function bool CanShowPathTo(PlayerController P, int TeamNum)
{
    //return;    
}

function ShowPathTo(PlayerController P, int TeamNum)
{
    //return;    
}

function int AdjustDestroyObjectiveDamage(int Damage, Controller instigatedBy, GameObjective Go)
{
    return Damage;
    //return;    
}

function bool CanDisableObjective(GameObjective Go)
{
    return true;
    //return;    
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
    local byte bAllowPickup;

    // End:0x39
    if((GameRulesModifiers != none) && GameRulesModifiers.OverridePickupQuery(Other, Item, bAllowPickup))
    {
        return int(bAllowPickup) == 1;
    }
    // End:0x74
    if((UnrealPawn(Other) != none) && !UnrealPawn(Other).IsInLoadout(Item.InventoryType))
    {
        return false;
    }
    // End:0x8D
    if(Other.Inventory == none)
    {
        return true;        
    }
    else
    {
        return !Other.Inventory.HandlePickupQuery(Item);
    }
    //return;    
}

function InitPlacedBot(Controller C, RosterEntry R)
{
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "MinPlayers", string(MinPlayers));
    AddServerDetail(ServerState, "EndTimeDelay", string(EndTimeDelay));
    //return;    
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
    else
    {
        default.MPGIPropsDisplayText[0] = default.MPBotText;
        default.MPGIPropDescText[0] = default.MPBotDesc;
        default.BotModeText = GenerateBotOptions(false);
    }
    //return;    
}

static function string GenerateBotOptions(bool bSinglePlayer)
{
    local string Option;
    local byte Value;

    // End:0x8C
    if(bSinglePlayer)
    {
        Value = byte(int(default.BotMode) & 12);
        Option = (string(Value) $ ";") $ default.BotOptions[0];
        Option $= (((";" $ string(int(Value) | 1)) $ ";") $ default.BotOptions[1]);
        Option $= (((";" $ string(int(Value) | 2)) $ ";") $ default.BotOptions[2]);        
    }
    else
    {
        Value = byte(int(default.BotMode) & 3);
        Option = (string(int(Value) | 4) $ ";") $ default.BotOptions[0];
        Option $= (((";" $ string(int(Value) | 8)) $ ";") $ default.BotOptions[2]);
        // End:0x11D
        if(default.bTeamGame)
        {
            Option $= (((";" $ string(int(Value) | 16)) $ ";") $ default.BotOptions[3]);
        }
    }
    return Option;
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.BotsGroup, "MinPlayers", default.MPGIPropsDisplayText[i++], 0, 0, "Text", "3;0:32");
    PlayInfo.AddSetting(default.GameGroup, "EndTimeDelay", default.MPGIPropsDisplayText[i++], 1, 1, "Text",,,, true);
    PlayInfo.AddSetting(default.BotsGroup, "BotMode", default.MPGIPropsDisplayText[i++], 30, 1, "Select", default.BotModeText);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowPrivateChat", default.MPGIPropsDisplayText[i++], 254, 1, "Check",, "Xv", true, true);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1E
        case "MinPlayers":
            return default.MPGIPropDescText[0];
        // End:0x37
        case "EndTimeDelay":
            return default.MPGIPropDescText[1];
        // End:0x4C
        case "BotMode":
            return default.MPGIPropDescText[2];
        // End:0x6B
        case "bAllowPrivateChat":
            return default.MPGIPropDescText[3];
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function int MultiMinPlayers()
{
    return MinPlayers;
    //return;    
}

defaultproperties
{
    BotMode=5
    EndTimeDelay=4.0000000
    BotRatio=1.0000000
    bAllowPrivateChat=true
    LocalStatsScreenClass=Class'UnrealGame_Decompressed.DMStatsScreen'
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
    VoiceReplicationInfoClass=Class'UnrealGame_Decompressed.UnrealVoiceReplicationInfo'
}