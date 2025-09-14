class wDOAGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string VoiceOurTeamPlantedBomb;
var string VoiceEnemyPlantedBomb;
var string sndModeExplain_Attack;
var string sndModeExplain_Defend;
var int StartPlayerCount;
var bool bSentEndRound;

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    bForceRespawn = false;
    super.BeginRound(bNoReset);
    // End:0x20
    if(bNoReset)
    {        
    }
    StartPlayerCount = CountPlayers();
    bSentEndRound = false;
    RemainingTimeWhenObjectIsSet = DefuseTimeLimit;
    AnnounceBeginRound();
    //return;    
}

function AnnounceBeginRound()
{
    deleAnnounceMatchInfo();
    //return;    
}

function int CountPlayersByTeam(int Team)
{
    local PlayerController PC;
    local int Count;

    Count = 0;
    // End:0x38
    foreach DynamicActors(Class'Engine.PlayerController', PC)
    {
        // End:0x37
        if(PC.GetTeamNum() == Team)
        {
            Count++;
        }        
    }    
    return Count;
    //return;    
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    local int attackerCount, defenderCount;

    attackerCount = CountPlayersByTeam(int(CurrentAttackingTeam));
    defenderCount = CountPlayersByTeam(1 - int(CurrentAttackingTeam));
    // End:0x75
    if((((int(RoundEndReason) == int(2)) || int(RoundEndReason) == int(3)) || int(RoundEndReason) == int(5)) || int(RoundEndReason) == int(6))
    {
        return 2;        
    }
    else
    {
        // End:0x8B
        if(int(RoundEndReason) == int(0))
        {
            return 3;            
        }
        else
        {
            // End:0xA1
            if(int(RoundEndReason) == int(1))
            {
                return 4;                
            }
            else
            {
                // End:0xBF
                if((attackerCount == 0) || defenderCount == 0)
                {
                    return 11;                    
                }
                else
                {
                    return -1;
                }
            }
        }
    }
    //return;    
}

function int GetWinTeam(wMSGameInfo.ERER_Reason RoundEndReason)
{
    // End:0x15
    if(int(RoundEndReason) == int(5))
    {
        return 0;        
    }
    else
    {
        // End:0x2A
        if(int(RoundEndReason) == int(6))
        {
            return 1;            
        }
        else
        {
            // End:0x57
            if((int(RoundEndReason) == int(0)) || int(RoundEndReason) == int(2))
            {
                return int(CurrentAttackingTeam);                
            }
            else
            {
                return 1 - int(CurrentAttackingTeam);
            }
        }
    }
    //return;    
}

function int GetWinTeamAD(int winTeam)
{
    // End:0x16
    if(winTeam == int(CurrentAttackingTeam))
    {
        return 1;        
    }
    else
    {
        return 2;
    }
    //return;    
}

function ServerLogEndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local int endType, winTeam, winTeamAD, Players, fEndTime, iCurrentTime;

    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    endType = GetRoundEndType(RoundEndReason);
    // End:0x79
    if(int(RoundEndReason) == int(0))
    {
        fEndTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet) + DefuseTimeLimit;        
    }
    else
    {
        // End:0x158
        if(int(RoundEndReason) == int(1))
        {
            iCurrentTime = Max(0, (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + wMSGameReplicationInfo(GameReplicationInfo).RemainingTime);
            fEndTime = ((wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - RemainingTimeWhenObjectIsSet) + DefuseTimeLimit) - iCurrentTime;
            // End:0x155
            if(fEndTime < 0)
            {
                Log((string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// iCurrentTime: ") $ string(iCurrentTime));
            }            
        }
        else
        {
            fEndTime = RoundStartTime - RemainingTime;
            // End:0x1E2
            if(fEndTime < 0)
            {
                Log((((string(self) $ "[ServerLogEndRound] === endTime < 0 ===  /// RoundStartTime: ") $ string(RoundStartTime)) $ " / RemainingTime:") $ string(RemainingTime));
            }
        }
    }
    // End:0x2B5
    if(fEndTime < 0)
    {
        Log((((((((string(self) $ "[ServerLogEndRound] === endTime < 0 === /// RoundEndReason : ") $ string(RoundEndReason)) $ "/ RoundTimeLimit") $ string(wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit)) $ "/ RemainingTimeWhenObjectIsSet : ") $ string(RemainingTimeWhenObjectIsSet)) $ "/ DefuseTimeLimit: ") $ string(DefuseTimeLimit));
    }
    Log((((((((((((((((((string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=") $ string(StartPlayerCount)) $ " players=") $ string(Players)) $ " endType=") $ string(endType)) $ " endTime=") $ string(EndTime)) $ " winTeam=") $ string(winTeam)) $ " winTeamAD=") $ string(winTeamAD)) $ " Teams[0].Score=") $ string(Teams[0].Score)) $ " Teams[1].Score=") $ string(Teams[1].Score)) $ " CurrentRound=") $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(StartPlayerCount, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), int(CurrentRound));
    //return;    
}

function bool EndGameByTeamNoneLeft(PlayerReplicationInfo Living)
{
    // End:0x4C
    if(Living.Team.TeamIndex == 0)
    {
        EndRound(5, none, "MaxLive - Winner - ERER_Team0_Win");        
    }
    else
    {
        EndRound(6, none, "MaxLive - Winner - ERER_Team1_Win");
    }
    return true;
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0x3D
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    local Controller C;
    local int AFLiveNum, RSALiveNum;

    AFLiveNum = 0;
    RSALiveNum = 0;
    C = Level.ControllerList;
    J0x22:

    // End:0x100 [Loop If]
    if(C != none)
    {
        // End:0xE9
        if(((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator) && !C.PlayerReplicationInfo.IsDead)
        {
            // End:0xE2
            if(C.PlayerReplicationInfo.Team.TeamIndex == 0)
            {
                AFLiveNum++;                
            }
            else
            {
                RSALiveNum++;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x22;
    }
    // End:0x118
    if(AFLiveNum == RSALiveNum)
    {
        TieOnTimeOver();        
    }
    else
    {
        // End:0x156
        if(AFLiveNum > RSALiveNum)
        {
            EndRound(5, none, "MaxLive - Winner - ERER_Team0_Win");            
        }
        else
        {
            EndRound(6, none, "MaxLive - Winner - ERER_Team1_Win");
        }
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

function AnnounceMatchInfo_DOA()
{
    //return;    
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local float numPlayersFactor;

    numPlayersFactor = float(GameReplicationInfo.MaxPlayersDuringGame) / 16.0000000;
    C = Level.ControllerList;
    J0x31:

    // End:0x12E [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += (((float(CurrentRound) * 7.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        PRI.Point += (((float(CurrentRound) * 7.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        // End:0x117
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += (((PRI.Team.Score * 8.0000000) * (GetResultPointRatio_Intervention(PRI))) * numPlayersFactor);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

function CalcRoundResultPoints(int ScoringTeam)
{
    local Controller C;
    local PlayerReplicationInfo PRI;
    local int PlayerCount;

    PlayerCount = 0;
    C = Level.ControllerList;
    J0x1B:

    // End:0x6A [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0x53
        if(C.bIsPlayer)
        {
            PlayerCount++;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    C = Level.ControllerList;
    J0x7E:

    // End:0x10E [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        // End:0xF7
        if(PRI.Team.TeamIndex == ScoringTeam)
        {
            PRI.fExp += ((30.0000000 * float(PlayerCount)) / 16.0000000);
            PRI.Point += float(10);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x7E;
    }
    //return;    
}

function SetPRI4Intervention(PlayerReplicationInfo PRI)
{
    super(GameInfo).SetPRI4Intervention(PRI);
    PRI.RoundWhenIntervented = int(CurrentRound);
    //return;    
}

function float GetResultPointRatio_Intervention(PlayerReplicationInfo PRI)
{
    // End:0x55
    if(Class == Class'WMission_Decompressed.wDOAGameInfo')
    {
        // End:0x2C
        if(PRI.RoundWhenIntervented == 0)
        {
            return 1.0000000;            
        }
        else
        {
            return float(int(CurrentRound) - (PRI.RoundWhenIntervented - 1)) / float(CurrentRound);
        }        
    }
    else
    {
        return super(GameInfo).GetResultPointRatio_Intervention(PRI);
    }
    //return;    
}

function AnnounceWinningTeam()
{
    //return;    
}

function AnnounceAlmostWinningTeam()
{
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    // End:0x5F
    if(wMSPlayerReplicationInfo(PlayerPawn.Controller.PlayerReplicationInfo).PawnOverrideClass == "")
    {
        // End:0x5F
        if(UnrealPawn(PlayerPawn) != none)
        {
            UnrealPawn(PlayerPawn).AddDefaultInventoryDOA();
            PlayerPawn.AddDefaultSkills();
        }
    }
    SetPlayerDefaults(PlayerPawn);
    PlayerPawn.Controller.PlayerReplicationInfo.bPickupWeaponDOA = false;
    //return;    
}

defaultproperties
{
    sndModeExplain_Attack="v_sd_destroy_R"
    sndModeExplain_Defend="v_sd_guard_R"
    ChangeAttackTeamRound=20
    sndModeName=".Mode_DOA.v_doa_R"
    sndModeExplain="None"
    deleAnnounceMatchInfo=wDOAGameInfo.AnnounceMatchInfo_DOA
    bAllowVehicles=false
    HUDType="wMission.wHUD_DOA"
    GameAddExp=25.0000000
    GameAssistExp=8.0000000
    GamePenaltyExp=25.0000000
    GameAddPoint=10.0000000
    GameAssistPoint=3.0000000
    GamePenaltyPoint=10.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    GameAddMultiKillPoint=/* Array type was not detected. */
}