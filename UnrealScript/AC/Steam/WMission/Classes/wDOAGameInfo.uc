/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wDOAGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:20
 *
 *******************************************************************************/
class wDOAGameInfo extends wMSGameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var string VoiceOurTeamPlantedBomb;
var string VoiceEnemyPlantedBomb;
var string sndModeExplain_Attack;
var string sndModeExplain_Defend;
var int StartPlayerCount;
var bool bSentEndRound;

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
}

function BeginRound(optional bool bNoReset)
{
    bForceRespawn = false;
    super.BeginRound(bNoReset);
    // End:0x20
    if(bNoReset)
    {
    }
    // End:0x20
    else
    {
    }
    StartPlayerCount = CountPlayers();
    bSentEndRound = false;
    RemainingTimeWhenObjectIsSet = DefuseTimeLimit;
    AnnounceBeginRound();
}

function AnnounceBeginRound()
{
    deleAnnounceMatchInfo();
}

function int CountPlayersByTeam(int Team)
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x38
    foreach DynamicActors(class'PlayerController', PC)
    {
        // End:0x37
        if(PC.GetTeamNum() == Team)
        {
            ++ Count;
        }                
    }
    return Count;
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    local int attackerCount, defenderCount;

    attackerCount = CountPlayersByTeam(CurrentAttackingTeam);
    defenderCount = CountPlayersByTeam(1 - CurrentAttackingTeam);
    // End:0x75
    if(RoundEndReason == 2 || RoundEndReason == 3 || RoundEndReason == 5 || RoundEndReason == 6)
    {
        return 2;
    }
    // End:0xc5
    else
    {
        // End:0x8b
        if(RoundEndReason == 0)
        {
            return 3;
        }
        // End:0xc5
        else
        {
            // End:0xa1
            if(RoundEndReason == 1)
            {
                return 4;
            }
            // End:0xc5
            else
            {
                // End:0xbf
                if(attackerCount == 0 || defenderCount == 0)
                {
                    return 11;
                }
                // End:0xc5
                else
                {
                    return -1;
                }
            }
        }
    }
}

function int GetWinTeam(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x15
    if(RoundEndReason == 5)
    {
        return 0;
    }
    // End:0x62
    else
    {
        // End:0x2a
        if(RoundEndReason == 6)
        {
            return 1;
        }
        // End:0x62
        else
        {
            // End:0x57
            if(RoundEndReason == 0 || RoundEndReason == 2)
            {
                return CurrentAttackingTeam;
            }
            // End:0x62
            else
            {
                return 1 - CurrentAttackingTeam;
            }
        }
    }
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x16
    if(winTeam == CurrentAttackingTeam)
    {
        return 1;
    }
    // End:0x19
    else
    {
        return 2;
    }
}

function ServerLogEndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int endType, winTeam, winTeamAD, Players, fEndTime, iCurrentTime;

    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    endType = GetRoundEndType(RoundEndReason);
    // End:0x79
    if(RoundEndReason == 0)
    {
        fEndTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet + DefuseTimeLimit;
    }
    // End:0x1e2
    else
    {
        // End:0x158
        if(RoundEndReason == 1)
        {
            iCurrentTime = Max(0, wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + wMSGameReplicationInfo(GameReplicationInfo).RemainingTime);
            fEndTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet + DefuseTimeLimit - iCurrentTime;
            // End:0x155
            if(fEndTime < 0)
            {
                Log(string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// iCurrentTime: " $ string(iCurrentTime));
            }
        }
        // End:0x1e2
        else
        {
            fEndTime = RoundStartTime - RemainingTime;
            // End:0x1e2
            if(fEndTime < 0)
            {
                Log(string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// RoundStartTime: " $ string(RoundStartTime) $ " / RemainingTime:" $ string(RemainingTime));
            }
        }
    }
    // End:0x2b5
    if(fEndTime < 0)
    {
        Log(string(self) $ "[ServerLogEndRound] === endTime < 0 === /// RoundEndReason : " $ string(RoundEndReason) $ "/ RoundTimeLimit" $ string(wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit) $ "/ RemainingTimeWhenObjectIsSet : " $ string(RemainingTimeWhenObjectIsSet) $ "/ DefuseTimeLimit: " $ string(DefuseTimeLimit));
    }
    Log(string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=" $ string(StartPlayerCount) $ " players=" $ string(Players) $ " endType=" $ string(endType) $ " endTime=" $ string(EndTime) $ " winTeam=" $ string(winTeam) $ " winTeamAD=" $ string(winTeamAD) $ " Teams[0].Score=" $ string(Teams[0].Score) $ " Teams[1].Score=" $ string(Teams[1].Score) $ " CurrentRound=" $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(StartPlayerCount, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), CurrentRound);
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x4c
    if(Living.Team.TeamIndex == 0)
    {
        EndRound(5, none, "MaxLive - Winner - ERER_Team0_Win");
    }
    // End:0x78
    else
    {
        EndRound(6, none, "MaxLive - Winner - ERER_Team1_Win");
    }
    return true;
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0x3d
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    local Controller C;
    local int AFLiveNum, RSALiveNum;

    AFLiveNum = 0;
    RSALiveNum = 0;
    C = Level.ControllerList;
    J0x22:
    // End:0x100 [While If]
    if(C != none)
    {
        // End:0xe9
        if(C.PlayerReplicationInfo != none && C.bIsPlayer && !C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator && !C.PlayerReplicationInfo.IsDead)
        {
            // End:0xe2
            if(C.PlayerReplicationInfo.Team.TeamIndex == 0)
            {
                ++ AFLiveNum;
            }
            // End:0xe9
            else
            {
                ++ RSALiveNum;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    // End:0x118
    if(AFLiveNum == RSALiveNum)
    {
        TieOnTimeOver();
    }
    // End:0x182
    else
    {
        // End:0x156
        if(AFLiveNum > RSALiveNum)
        {
            EndRound(5, none, "MaxLive - Winner - ERER_Team0_Win");
        }
        // End:0x182
        else
        {
            EndRound(6, none, "MaxLive - Winner - ERER_Team1_Win");
        }
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

function AnnounceMatchInfo_DOA();
function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local float numPlayersFactor;

    numPlayersFactor = float(GameReplicationInfo.MaxPlayersDuringGame) / 16.0;
    C = Level.ControllerList;
    J0x31:
    // End:0x12e [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += float(CurrentRound) * 7.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        PRI.Point += float(CurrentRound) * 7.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        // End:0x117
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += PRI.Team.Score * 8.0 * GetResultPointRatio_Intervention(PRI) * numPlayersFactor;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local int PlayerCount;

    PlayerCount = 0;
    C = Level.ControllerList;
    J0x1b:
    // End:0x6a [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x53
        if(C.bIsPlayer)
        {
            ++ PlayerCount;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
    C = Level.ControllerList;
    J0x7e:
    // End:0x10e [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0xf7
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += 30.0 * float(PlayerCount) / 16.0;
            PRI.Point += float(10);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    super(GameInfo).SetPRI4Intervention(PRI);
    PRI.RoundWhenIntervented = CurrentRound;
}

function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    // End:0x55
    if(Class == class'wDOAGameInfo')
    {
        // End:0x2c
        if(PRI.RoundWhenIntervented == 0)
        {
            return 1.0;
        }
        // End:0x52
        else
        {
            return float(CurrentRound - PRI.RoundWhenIntervented - 1) / float(CurrentRound);
        }
    }
    // End:0x61
    else
    {
        return super(GameInfo).GetResultPointRatio_Intervention(PRI);
    }
}

function AnnounceWinningTeam();
function AnnounceAlmostWinningTeam();
function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x5f
    if(wMSPlayerReplicationInfo(PlayerPawn.Controller.PlayerReplicationInfo).PawnOverrideClass == "")
    {
        // End:0x5f
        if(UnrealPawn(PlayerPawn) != none)
        {
            UnrealPawn(PlayerPawn).AddDefaultInventoryDOA();
            PlayerPawn.AddDefaultSkills();
        }
    }
    SetPlayerDefaults(PlayerPawn);
    PlayerPawn.Controller.PlayerReplicationInfo.bPickupWeaponDOA = false;
}

defaultproperties
{
    sndModeExplain_Attack="v_sd_destroy_R"
    sndModeExplain_Defend="v_sd_guard_R"
    ChangeAttackTeamRound=20
    sndModeName=.Mode_DOA.v_doa_R
    sndModeExplain=None
    deleAnnounceMatchInfo=AnnounceMatchInfo_DOA
    bAllowVehicles=true
    HUDType="wMission.wHUD_DOA"
    GameAddExp=25.0
    GameAssistExp=8.0
    GamePenaltyExp=25.0
    GameAddPoint=10.0
    GameAssistPoint=3.0
    GamePenaltyPoint=10.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    GameAddMultiKillPoint=// Object reference not set to an instance of an object.
    
}