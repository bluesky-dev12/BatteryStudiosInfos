class wDOMGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<int> Codes_AllyCapturing;
var array<int> Codes_EnemyCapturing;
var array<int> Codes_AllyCaptured;
var array<int> Codes_EnemyCaptured;
var int FlagScoreInterval;
var int FlagScore;
var array<wFlagObjectiveBase> Flags;
var array<float> afTakerXCoord;
var array<float> afTakerYCoord;
var array<float> afTakerZCoord;
var array<int> aiTakerPos;
var array<int> aiTakerWeapon;
var array<int> aiTakerWeaponPart;
var array<int> aiTakerRange;

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    local int lp1, lp2, ownerTeam, bestScore;
    local wAIBotBase lOwner, Other;
    local wAILevel AILevel;
    local wFlagObjectiveBase curFlag, BestFlag;
    local array<float> distsToFlag;
    local array<int> distRanks, Scores;

    // End:0x3DD
    if(C.Pawn != none)
    {
        lOwner = wAIBot(C);
        ownerTeam = lOwner.GetTeamNum();
        AILevel = wAILevel(Level.AILevel);
        lp1 = 0;
        J0x59:

        // End:0xBB [Loop If]
        if(lp1 < Flags.Length)
        {
            distsToFlag[lp1] = VSize(lOwner.Pawn.Location - Flags[lp1].Location);
            distRanks[lp1] = 0;
            lp1++;
            // [Loop Continue]
            goto J0x59;
        }
        lp1 = 0;
        J0xC2:

        // End:0x13C [Loop If]
        if(lp1 < Flags.Length)
        {
            lp2 = lp1 + 1;
            J0xE0:

            // End:0x132 [Loop If]
            if(lp2 < Flags.Length)
            {
                // End:0x11B
                if(distsToFlag[lp1] > distsToFlag[lp2])
                {
                    distRanks[lp1]++;
                    // [Explicit Continue]
                    goto J0x128;
                }
                distRanks[lp2]++;
                J0x128:

                lp2++;
                // [Loop Continue]
                goto J0xE0;
            }
            lp1++;
            // [Loop Continue]
            goto J0xC2;
        }
        // End:0x152
        if(ownerTeam == 0)
        {
            ownerTeam = ownerTeam;
        }
        bestScore = -99999;
        lp1 = 0;
        J0x164:

        // End:0x321 [Loop If]
        if(lp1 < Flags.Length)
        {
            curFlag = Flags[lp1];
            Scores[lp1] = -distRanks[lp1] * distRanks[lp1];
            // End:0x216
            if(curFlag.iActiveTeam == ownerTeam)
            {
                // End:0x207
                if((curFlag.iCapturingTeam != -1) && curFlag.iCapturingTeam != ownerTeam)
                {
                    Scores[lp1] += 2;                    
                }
                else
                {
                    Scores[lp1] -= 4;
                }
            }
            lp2 = 0;
            J0x21D:

            // End:0x2E6 [Loop If]
            if(lp2 < AILevel.Bots.Length)
            {
                Other = AILevel.Bots[lp2];
                // End:0x2DC
                if((Other != lOwner) && Other.GetTeamNum() == ownerTeam)
                {
                    // End:0x2AC
                    if(curFlag == Other.FutureState.FlagDest)
                    {
                        Scores[lp1] -= 1;
                        // [Explicit Continue]
                        goto J0x2DC;
                    }
                    // End:0x2DC
                    if(curFlag == Other.FutureState.FlagCapturing)
                    {
                        Scores[lp1] -= 2;
                    }
                }
                J0x2DC:

                lp2++;
                // [Loop Continue]
                goto J0x21D;
            }
            // End:0x317
            if(bestScore < Scores[lp1])
            {
                bestScore = Scores[lp1];
                BestFlag = curFlag;
            }
            lp1++;
            // [Loop Continue]
            goto J0x164;
        }
        // End:0x37F
        if(npcActions.GotoFlag)
        {
            Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_GotoFlag')).Init(BestFlag);
        }
        // End:0x3DD
        if(npcActions.CaptureFlag)
        {
            Actions[Actions.Length] = wAction_CaptureFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_CaptureFlag')).Init(BestFlag);
        }
    }
    //return;    
}

function Actor GetNearFlag(Actor A)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x6D [Loop If]
    if(lp1 < Flags.Length)
    {
        // End:0x63
        if(VSize(Flags[lp1].Location - A.Location) < (Class'WMission_Decompressed.wFlagObjective'.default.CollisionRadius * 0.7500000))
        {
            return Flags[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function ChangeHostExtraWork()
{
    local wFlagObjective F;

    // End:0x20
    foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', F)
    {
        F.RecoverCapturing();        
    }    
    //return;    
}

function ContinueMatch()
{
    super(DeathMatch).ContinueMatch();
    //return;    
}

function CheckEndGameAfterRoundTimeOver()
{
    // End:0x3B
    if(Teams[0].Score > Teams[1].Score)
    {
        EndDOMGame(0, none, "TimeLimit");        
    }
    else
    {
        // End:0x73
        if(Teams[1].Score > Teams[0].Score)
        {
            EndDOMGame(1, none, "TimeLimit");
        }
    }
    //return;    
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(FlagScore);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
    FlagState_UpdateDomScore(int(Teams[0].Score), int(Teams[1].Score));
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    // End:0x3F
    if(Teams[0].Score == Teams[1].Score)
    {
        EndDOMGame(-1, none, "Draw Game");        
    }
    else
    {
        // End:0x7F
        if(Teams[0].Score > Teams[1].Score)
        {
            EndDOMGame(0, none, "TeamScoreLimit");            
        }
        else
        {
            // End:0xBC
            if(Teams[0].Score < Teams[1].Score)
            {
                EndDOMGame(1, none, "TeamScoreLimit");
            }
        }
    }
    //return;    
}

function OnRoundTimeOverWithoutObjectPlanted()
{
    //return;    
}

function EndDOMGame(int iWinningTeam, Pawn Instigator, string Reason)
{
    local PlayerReplicationInfo PRI;

    // End:0x1A
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log((((("wDOMGameInfo::EndDOMGame - Reason : " @ Reason) $ " / Teams[0].Score : ") $ string(Teams[0].Score)) $ " / Teams[1].Score : ") $ string(Teams[1].Score));
    // End:0xC0
    if(Instigator != none)
    {
        PRI = Instigator.PlayerReplicationInfo;
    }
    // End:0x125
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = (wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime) + RemainingTime;        
    }
    else
    {
        // End:0x13F
        if(iWinningTeam != -1)
        {
            AnnounceScore(iWinningTeam);
        }
    }
    TriggerEvent('EndDOMGame', self, Instigator);
    // End:0x16E
    if(EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    Log("EndDOMGame->EndGame - roundlimit : " $ Reason);
    EndGame(none, Reason);
    // End:0x1C3
    if(bGameEnded)
    {
        SetGameEndType(Reason);
        GotoState('MatchOver');
    }
    //return;    
}

function RespawnPlayer(Controller C, optional bool bClearSpecials)
{
    local string PawnOverrideClass;
    local Vehicle DrivenVehicle;

    // End:0x48
    if(C.Pawn != none)
    {
        DrivenVehicle = Vehicle(C.Pawn);
        // End:0x48
        if(DrivenVehicle != none)
        {
            DrivenVehicle.KDriverLeave(true);
        }
    }
    C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
    PawnOverrideClass = wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass;
    // End:0xE1
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x13B
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x25C
    if(C.Pawn != none)
    {
        // End:0x16C
        if(C.Pawn.Weapon == none)
        {
        }
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x25C
        if((Bot(C) != none) && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x2AD
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1D
    if(N.Class == Class'Engine.PlayerStart_DOM')
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function array<NavigationPoint> GetRespawnPointsForFlag(wFlagObjective flag)
{
    local array<NavigationPoint> candidates;
    local int lp1;
    local PlayerStart_DOM S;
    local int FlagType;

    Log((("[wDOMGameInfo::GetRespawnPointsForFlag] name=" $ string(flag.Name)) @ "Tag=") $ string(flag.Tag));
    // End:0x156
    if(flag != none)
    {
        FlagType = Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndex(flag);
        lp1 = 0;
        J0x89:

        // End:0x156 [Loop If]
        if(lp1 < EveryPlayerStarts.Length)
        {
            S = PlayerStart_DOM(EveryPlayerStarts[lp1]);
            // End:0x14C
            if((((S != none) && IsAppropriateRespawnPoint(S, 0)) && !IsRespawnPointFailedRecently(S)) && int(S.eApplyFlagType) == FlagType)
            {
                candidates[candidates.Length] = S;
                Log(((("  " $ "name=") $ string(S.Name)) @ "FlagType=") $ string(S.eApplyFlagType));
            }
            lp1++;
            // [Loop Continue]
            goto J0x89;
        }
    }
    return candidates;
    //return;    
}

function array<NavigationPoint> GetRespawnPointsFlagNeutral(bool checkFail)
{
    local array<NavigationPoint> candidates;
    local int lp1;
    local PlayerStart_DOM S;
    local wFlagObjective flag;

    Log("[wDOMGameInfo::GetRespawnPointsFlagNeutral]");
    lp1 = 0;
    J0x36:

    // End:0x1EA [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_DOM(EveryPlayerStarts[lp1]);
        // End:0x1E0
        if(((S != none) && IsAppropriateRespawnPoint(S, 0)) && !checkFail || !IsRespawnPointFailedRecently(S))
        {
            flag = GetFlagObjectiveByType(S.eApplyFlagType);
            // End:0x1E0
            if((int(S.eApplyFlagType) == 3) || (flag.iActiveTeam == -1) && flag.fCaptureProgress == 0.0000000)
            {
                candidates[candidates.Length] = S;
                Log(((("  " $ "name=") $ string(S.Name)) @ "FlagType=") $ string(S.eApplyFlagType));
                // End:0x1E0
                if(flag != none)
                {
                    Log(((((((("    " $ "flag=") $ string(flag.Name)) @ "tag=") $ string(flag.Tag)) @ "iActiveTeam=") $ string(flag.iActiveTeam)) @ "fCaptureProgress=") $ string(flag.fCaptureProgress));
                }
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x36;
    }
    return candidates;
    //return;    
}

function wFlagObjective GetFlagObjectiveByType(byte FlagType)
{
    local wFlagObjective flag;

    // End:0x38
    foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', flag)
    {
        // End:0x37
        if(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndex(flag) == int(FlagType))
        {            
            return flag;
        }        
    }    
    return none;
    //return;    
}

function array<byte> GetShuffledFlags()
{
    local int FLAGS_MIX_COUNT;
    local array<byte> flagTypes;
    local int lp1;
    local byte tempFlag;
    local int A, B;

    FLAGS_MIX_COUNT = 5;
    flagTypes[0] = 0;
    flagTypes[1] = 1;
    flagTypes[2] = 2;
    lp1 = 0;
    J0x2E:

    // End:0xAB [Loop If]
    if(lp1 < FLAGS_MIX_COUNT)
    {
        A = Rand(flagTypes.Length);
        B = Rand(flagTypes.Length);
        // End:0xA1
        if(A != B)
        {
            tempFlag = flagTypes[A];
            flagTypes[A] = flagTypes[B];
            flagTypes[B] = tempFlag;
        }
        lp1++;
        // [Loop Continue]
        goto J0x2E;
    }
    return flagTypes;
    //return;    
}

function bool IsSDRespawnTime()
{
    return (float(GameReplicationInfo.ElapsedTime) < SDRespawnTime) || Level.GetMatchMaker().IsSDRespawn();
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint N, BestStart;
    local byte Team, t;
    local float BestRating, NewRating;
    local Teleporter Tel;
    local byte curFlagType;
    local array<byte> flagTypes;
    local wFlagObjective flag;
    local int lp1;
    local NavigationPoint respawnPoint;
    local array<NavigationPoint> candidates;
    local array<float> candidateDists;
    local Pawn pickedAlly;

    // End:0x6B
    if(((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);        
    }
    else
    {
        Team = inTeam;
    }
    // End:0x3DF
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        // End:0xAA
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(Team);            
        }
        else
        {
            Log("@-------------------");
            Log((("[wDOMGameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds)) $ " for ") $ Player.PlayerReplicationInfo.PlayerName);
            bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
            flagTypes = GetShuffledFlags();
            lp1 = 0;
            J0x158:

            // End:0x28D [Loop If]
            if(lp1 < flagTypes.Length)
            {
                Log("Trying Flag: " $ string(curFlagType));
                curFlagType = flagTypes[lp1];
                flag = GetFlagObjectiveByType(curFlagType);
                // End:0x283
                if((flag.iActiveTeam == int(Team)) && flag.fCaptureProgress == 0.0000000)
                {
                    candidates = GetRespawnPointsForFlag(flag);
                    SortNavigationPoints(flag, candidates, candidateDists);
                    respawnPoint = GetRespawnPointRatingEnemy(false, candidates, Team);
                    // End:0x283
                    if(respawnPoint != none)
                    {
                        // End:0x280
                        if(bLeaveRespawnLogInChat)
                        {
                            Level.GetLocalPlayerController().myHUD.AddTextMessage("Flag" @ string(flag.Tag), Class'Engine.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                        }
                        // [Explicit Break]
                        goto J0x28D;
                    }
                }
                lp1++;
                // [Loop Continue]
                goto J0x158;
            }
            J0x28D:

            // End:0x3A5
            if(respawnPoint == none)
            {
                Log("can't respawn near flags");
                // End:0x382
                if(IsAnyAllyAlive(Team))
                {
                    // End:0x319
                    if(bLeaveRespawnLogInChat)
                    {
                        Level.GetLocalPlayerController().myHUD.AddTextMessage("Try Near Ally", Class'Engine.GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                    }
                    pickedAlly = PickAlly(Team);
                    candidates = GetRespawnPointsFlagNeutral(true);
                    SortNavigationPoints(pickedAlly, candidates, candidateDists);
                    // End:0x36B
                    if(candidates.Length > 5)
                    {
                        candidates.Remove(5, candidates.Length - 5);
                    }
                    respawnPoint = GetRespawnPointRatingEnemy(true, candidates, Team);
                }
                // End:0x3A5
                if(respawnPoint == none)
                {
                    respawnPoint = GetSafetestRespawnPoint(Team, GetRespawnPointsFlagNeutral(false));
                }
            }
            // End:0x3C6
            if(respawnPoint == none)
            {
                respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
            }
            LogFinalRespawnPoint(respawnPoint, Team);
            return respawnPoint;
        }        
    }
    else
    {
        // End:0x3FA
        if(Player != none)
        {
            Player.StartSpot = none;
        }
        // End:0x43A
        if(GameRulesModifiers != none)
        {
            N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
            // End:0x43A
            if(N != none)
            {
                return N;
            }
        }
        // End:0x479
        if(incomingName != "")
        {
            // End:0x478
            foreach AllActors(Class'Engine.Teleporter', Tel)
            {
                // End:0x477
                if(string(Tel.Tag) ~= incomingName)
                {                    
                    return Tel;
                }                
            }            
        }
        N = Level.NavigationPointList;
        J0x48D:

        // End:0x4EF [Loop If]
        if(N != none)
        {
            NewRating = RatePlayerStart(N, Team, Player);
            // End:0x4D8
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x48D;
        }
        // End:0x655
        if(PlayerStart(BestStart) == none)
        {
            Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
            Log(((((" Player:" @ Player.GetHumanReadableName()) @ "Team:") @ string(Team)) @ "Player.Event:") @ string(Player.Event));
            BestRating = -100000000.0000000;
            // End:0x654
            foreach AllActors(Class'Engine.NavigationPoint', N)
            {
                // End:0x5DE
                if(PlayerStart(N) != none)
                {
                    t = PlayerStart(N).TeamNumber;                    
                }
                else
                {
                    t = Team;
                }
                NewRating = RatePlayerStart(N, t, Player);
                // End:0x61F
                if(InventorySpot(N) != none)
                {
                    NewRating -= float(50);
                }
                NewRating += (float(20) * FRand());
                // End:0x653
                if(NewRating > BestRating)
                {
                    BestRating = NewRating;
                    BestStart = N;
                }                
            }            
        }
        // End:0x674
        if(Player != none)
        {
            Player.Event = 'None';
        }
        return BestStart;
    }
    //return;    
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart_DOM P;
    local float Score, NextDist;
    local Controller OtherPlayer;
    local GameObjective Go;

    P = PlayerStart_DOM(N);
    // End:0x37
    if((P == none) || !P.bEnabled)
    {
        return -10000000.0000000;
    }
    Score = 1000000.0000000;
    Score += (FMax(float(NumPlayers + NumBots) * 0.4000000, 2.0000000) * VSize(P.Location - Player.Location));
    OtherPlayer = Level.ControllerList;
    J0x9B:

    // End:0x1DA [Loop If]
    if(OtherPlayer != none)
    {
        // End:0x1C3
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x13D
            if(NextDist < (OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight))
            {
                return -1000000.0000000;
            }
            // End:0x167
            if(OtherPlayer.GetTeamNum() == int(Team))
            {
                Score -= NextDist;                
            }
            else
            {
                // End:0x1A3
                if(FastTrace(P.Location, OtherPlayer.Pawn.Location))
                {
                    Score -= float(200000);                    
                }
                else
                {
                    Score -= FMax(30000.0000000 - (float(10) * NextDist), 0.0000000);
                }
            }
        }
        OtherPlayer = OtherPlayer.nextController;
        // [Loop Continue]
        goto J0x9B;
    }
    Score -= float(Rand(10000 * ((NumPlayers + NumBots) / 16)));
    Go = Teams[0].AI.Objectives;
    J0x21B:

    // End:0x331 [Loop If]
    if(Go != none)
    {
        // End:0x31A
        if(((Go.IsA('wFlagObjective') && int(wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress) == int(Go.ObjectivePriority)) && !Go.bDisabled) && !Go.bOptionalObjective)
        {
            NextDist = VSize(Go.Location - P.Location);
            // End:0x2FA
            if(wFlagObjective(Go).iActiveTeam == int(Team))
            {
                Score += FMax(10000.0000000 - (float(10) * NextDist), 3000.0000000);                
            }
            else
            {
                Score -= FMax(50000.0000000 - (float(10) * NextDist), 0.0000000);
            }
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x21B;
    }
    return FMax(Score, 5.0000000);
    //return;    
}

function bool IsAllFlagCaptured()
{
    local wFlagObjective F;
    local int iTempTeam;

    iTempTeam = -99;
    // End:0x72
    foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', F)
    {
        // End:0x71
        if(!F.bDisabled)
        {
            // End:0x56
            if(iTempTeam == -99)
            {
                iTempTeam = F.iActiveTeam;
                continue;                
            }
            // End:0x71
            if(iTempTeam != F.iActiveTeam)
            {                
                return false;
            }
        }        
    }    
    return true;
    //return;    
}

function AnnounceAllFlagCaptured(byte byTeam)
{
    TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedAll);
    TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_AlmostOverLead);
    TeamReceiveLocalizedMessage(byte(int(1) - int(byTeam)), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedAll);
    TeamReceiveLocalizedMessage(byte(int(1) - int(byTeam)), Class'Engine.wMessage_BGM', Class'Engine.wMessage_BGM'.default.Code_AlmostOverFallBehind);
    //return;    
}

function InitializeCodes()
{
    // End:0x118
    if(Codes_AllyCapturing.Length == 0)
    {
        Codes_AllyCapturing[0] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingA;
        Codes_AllyCapturing[1] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingB;
        Codes_AllyCapturing[2] = Class'Engine.wMessage_Game'.default.Code_DOMAllyCapturingC;
        Codes_AllyCaptured[0] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedA;
        Codes_AllyCaptured[1] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedB;
        Codes_AllyCaptured[2] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedC;
        Codes_EnemyCapturing[0] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingA;
        Codes_EnemyCapturing[1] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingB;
        Codes_EnemyCapturing[2] = Class'Engine.wMessage_Game'.default.Code_DOMEnemyCapturingC;
        Codes_EnemyCaptured[0] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedA;
        Codes_EnemyCaptured[1] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedB;
        Codes_EnemyCaptured[2] = Class'Engine.wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedC;
    }
    //return;    
}

function AnnounceFlagCapture(byte byState, byte byTeam, byte byFlagIndex)
{
    InitializeCodes();
    // End:0x5A
    if(int(byState) == 0)
    {
        TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_Game', Codes_AllyCapturing[int(byFlagIndex)]);
        TeamReceiveLocalizedMessage(byte(int(1) - int(byTeam)), Class'Engine.wMessage_Game', Codes_EnemyCapturing[int(byFlagIndex)]);        
    }
    else
    {
        // End:0xAB
        if(int(byState) == 1)
        {
            TeamReceiveLocalizedMessage(byTeam, Class'Engine.wMessage_Game_ImpSystem', Codes_AllyCaptured[int(byFlagIndex)]);
            TeamReceiveLocalizedMessage(byte(int(1) - int(byTeam)), Class'Engine.wMessage_Game_ImpSystem', Codes_EnemyCaptured[int(byFlagIndex)]);
        }
    }
    //return;    
}

function AnnounceFlagState(byte byState, byte byTeam, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    AnnounceFlagCapture(byState, byTeam, byFlagIndex);
    // End:0x54
    if((int(byState) == 1) && IsAllFlagCaptured())
    {
        AnnounceAllFlagCaptured(byTeam);
    }
    //return;    
}

function FlagState_TakePoint(array<int> TakerUID, name FlagTag)
{
    local byte byFlagIndex;
    local int i;

    byFlagIndex = byte(Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    i = 0;
    J0x23:

    // End:0x9B [Loop If]
    if(i < TakerUID.Length)
    {
        clog((("[wSDGameInfo::sfReqGamePlay_TakeAPoint] PlayerID=" $ string(TakerUID[i])) $ "/FlagTag:") $ string(byFlagIndex));
        i++;
        // [Loop Continue]
        goto J0x23;
    }
    Log("[wSDGameInfo::sfReqGamePlay_TakeAPoint]");
    // End:0x10D
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_TakeAPoint(TakerUID, byFlagIndex, afTakerXCoord, afTakerYCoord, afTakerZCoord, aiTakerPos, aiTakerWeapon, aiTakerWeaponPart, aiTakerRange);
    }
    ClearTakerInfo();
    //return;    
}

function FlagState_UpdateDomScore(int AFScore, int RSAScore)
{
    Log((("[wSDGameInfo::sfReqGamePlay_UpdateDomScore]  AF Score:" $ string(AFScore)) $ "/ RSA Score:") $ string(RSAScore));
    // End:0x80
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
    }
    //return;    
}

function TakerInfo(Pawn TakerPawn, Vector FlagLocation)
{
    afTakerXCoord[afTakerXCoord.Length] = TakerPawn.Location.X;
    afTakerYCoord[afTakerYCoord.Length] = TakerPawn.Location.Y;
    afTakerZCoord[afTakerZCoord.Length] = TakerPawn.Location.Z;
    aiTakerPos[aiTakerPos.Length] = TakerPawn.GetPostureIndex();
    aiTakerWeapon[aiTakerWeapon.Length] = TakerPawn.Weapon.BaseParams.iWeaponID;
    aiTakerWeaponPart[aiTakerWeaponPart.Length] = TakerPawn.Weapon.Parts[0].PartsGroupID;
    aiTakerRange[aiTakerRange.Length] = int(VSize(TakerPawn.Location - FlagLocation));
    //return;    
}

function ClearTakerInfo()
{
    afTakerXCoord.Length = 0;
    afTakerYCoord.Length = 0;
    afTakerZCoord.Length = 0;
    aiTakerPos.Length = 0;
    aiTakerWeapon.Length = 0;
    aiTakerWeaponPart.Length = 0;
    aiTakerRange.Length = 0;
    //return;    
}

function PlayEndOfMatchMessage()
{
    super(TeamGame).PlayEndOfMatchMessage();
    //return;    
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:

    // End:0x136 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.Exp += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.5000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((TeamInfo(GameReplicationInfo.Winner).Score / 3.3000000) * (GetResultPointRatio_Intervention(PRI)));
        // End:0x11F
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.Exp += ((float(Min(ScoreLimit, int(TeamInfo(GameReplicationInfo.Winner).Score))) / 5.0000000) * (GetResultPointRatio_Intervention(PRI)));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function int GetTotalPlayedTime()
{
    return RoundTimeLimit * 60;
    //return;    
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    //return;    
}

function StartMatch()
{
    local Pawn P;
    local wFlagObjective F;

    Log("[wDOMGameInfo::StartMatch] bChangedHost=" $ string(Level.Game.bChangedHost));
    super.StartMatch();
    Flags.Length = 0;
    // End:0x79
    foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', F)
    {
        Flags[Flags.Length] = F;        
    }    
    // End:0xD6
    if(Level.Game.bChangedHost)
    {
        // End:0xD5
        foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', F)
        {
            // End:0xD3
            foreach F.TouchingActors(Class'Engine.Pawn', P)
            {
                F.Touch(P);                
            }                        
        }        
    }
    //return;    
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    local int lp1;

    outNumFlags = Flags.Length;
    outNumCapturedFlagsByTeam1 = 0;
    outNumCapturedFlagsByTeam2 = 0;
    lp1 = 0;
    J0x21:

    // End:0x82 [Loop If]
    if(lp1 < Flags.Length)
    {
        // End:0x55
        if(Flags[lp1].iActiveTeam == 1)
        {
            outNumCapturedFlagsByTeam1++;
            // [Explicit Continue]
            goto J0x78;
        }
        // End:0x78
        if(Flags[lp1].iActiveTeam == 2)
        {
            outNumCapturedFlagsByTeam2 = 2;
        }
        J0x78:

        lp1++;
        // [Loop Continue]
        goto J0x21;
    }
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundDOMAllyCaptured, Class'Engine.Sound');
    DynamicLoadObject(Class'Engine.wMessage_Game'.default.SoundDOMEnemyCaptured, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedAll, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedAll, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturingC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturingC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMAllyCapturedC, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedA, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedB, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceDOMEnemyCapturedC, Class'Engine.Sound');
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = Class'WGame.wPurposeAttackTargetDOM'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = Class'WGame.wPurposeCaptureFlag'.static.Create(wAIBot(Owner));
    //return;    
}

state MatchInProgress
{
    function Timer()
    {
        local wFlagObjective F;

        // End:0x73
        if((float(RemainingTime) % float(FlagScoreInterval)) == float(0))
        {
            // End:0x6C
            foreach DynamicActors(Class'WMission_Decompressed.wFlagObjective', F)
            {
                // End:0x6B
                if((F.iActiveTeam != -1) && F.iActiveTeam < 2)
                {
                    AddTeamScore(F.iActiveTeam);
                }                
            }            
            AnnounceWinningTeam();
        }
        // End:0xB0
        if((Teams[0].Score == float(ScoreLimit)) && Teams[1].Score == float(ScoreLimit))
        {            
        }
        else
        {
            // End:0xE7
            if(Teams[0].Score >= float(ScoreLimit))
            {
                EndDOMGame(0, none, "TeamScoreLimit");                
            }
            else
            {
                // End:0x11B
                if(Teams[1].Score >= float(ScoreLimit))
                {
                    EndDOMGame(1, none, "TeamScoreLimit");
                }
            }
        }
        super.Timer();
        //return;        
    }
    stop;    
}

state MatchOver
{
    function EndDOMGame(int iWinningTeam, Pawn Instigator, string Reason)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    FlagScoreInterval=5
    FlagScore=1
    RoundTimeLimit=15
    ScoreLimit=200
    sndChangeAttackTeam=""
    sndLastMan=""
    sndRoundWin=""
    sndRoundLose=""
    DefaultMaxLives=0
    sndModeName=".Mode_Dom.v_dom_R"
    sndModeExplain=".Mode_Dom.v_dom_all_01_R"
    HUDType="wMission.wHUD_Domination"
    GameName="Domination"
    GameAddExp=13.0000000
    GameAssistExp=4.0000000
    GamePenaltyExp=13.0000000
    GameAddPoint=4.0000000
    GameAssistPoint=1.0000000
    GamePenaltyPoint=4.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    bHasRespawnRestriction=false
}