/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wDOMGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:36
 *	States:2
 *
 *******************************************************************************/
class wDOMGameInfo extends wMSGameInfo
    dependson(wMSCinematic_SceneManager)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

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

    // End:0x3dd
    if(C.Pawn != none)
    {
        lOwner = wAIBot(C);
        ownerTeam = lOwner.GetTeamNum();
        AILevel = wAILevel(Level.AILevel);
        lp1 = 0;
        J0x59:
        // End:0xbb [While If]
        if(lp1 < Flags.Length)
        {
            distsToFlag[lp1] = VSize(lOwner.Pawn.Location - Flags[lp1].Location);
            distRanks[lp1] = 0;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x59;
        }
        lp1 = 0;
        J0xc2:
        // End:0x13c [While If]
        if(lp1 < Flags.Length)
        {
            lp2 = lp1 + 1;
            J0xe0:
            // End:0x132 [While If]
            if(lp2 < Flags.Length)
            {
                // End:0x11b
                if(distsToFlag[lp1] > distsToFlag[lp2])
                {
                    ++ distRanks[lp1];
                }
                // End:0x128
                else
                {
                    ++ distRanks[lp2];
                }
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0xe0;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xc2;
        }
        // End:0x152
        if(ownerTeam == 0)
        {
            ownerTeam = ownerTeam;
        }
        bestScore = -99999;
        lp1 = 0;
        J0x164:
        // End:0x321 [While If]
        if(lp1 < Flags.Length)
        {
            curFlag = Flags[lp1];
            Scores[lp1] = -distRanks[lp1] * distRanks[lp1];
            // End:0x216
            if(curFlag.iActiveTeam == ownerTeam)
            {
                // End:0x207
                if(curFlag.iCapturingTeam != -1 && curFlag.iCapturingTeam != ownerTeam)
                {
                    Scores[lp1] += 2;
                }
                // End:0x216
                else
                {
                    Scores[lp1] -= 4;
                }
            }
            lp2 = 0;
            J0x21d:
            // End:0x2e6 [While If]
            if(lp2 < AILevel.Bots.Length)
            {
                Other = AILevel.Bots[lp2];
                // End:0x2dc
                if(Other != lOwner && Other.GetTeamNum() == ownerTeam)
                {
                    // End:0x2ac
                    if(curFlag == Other.FutureState.FlagDest)
                    {
                        Scores[lp1] -= 1;
                    }
                    // End:0x2dc
                    else
                    {
                        // End:0x2dc
                        if(curFlag == Other.FutureState.FlagCapturing)
                        {
                            Scores[lp1] -= 2;
                        }
                    }
                }
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x21d;
            }
            // End:0x317
            if(bestScore < Scores[lp1])
            {
                bestScore = Scores[lp1];
                BestFlag = curFlag;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x164;
        }
        // End:0x37f
        if(npcActions.GotoFlag)
        {
            Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(class'wAction_GotoFlag')).Init(BestFlag);
        }
        // End:0x3dd
        if(npcActions.CaptureFlag)
        {
            Actions[Actions.Length] = wAction_CaptureFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(class'wAction_CaptureFlag')).Init(BestFlag);
        }
    }
}

function Actor GetNearFlag(Actor A)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x6d [While If]
    if(lp1 < Flags.Length)
    {
        // End:0x63
        if(VSize(Flags[lp1].Location - A.Location) < class'wFlagObjective'.default.CollisionRadius * 0.750)
        {
            return Flags[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function ChangeHostExtraWork()
{
    local wFlagObjective f;

    // End:0x20
    foreach DynamicActors(class'wFlagObjective', f)
    {
        f.RecoverCapturing();                
    }
}

function ContinueMatch()
{
    super(DeathMatch).ContinueMatch();
}

function CheckEndGameAfterRoundTimeOver()
{
    // End:0x3b
    if(Teams[0].Score > Teams[1].Score)
    {
        EndDOMGame(0, none, "TimeLimit");
    }
    // End:0x73
    else
    {
        // End:0x73
        if(Teams[1].Score > Teams[0].Score)
        {
            EndDOMGame(1, none, "TimeLimit");
        }
    }
}

function AddTeamScore(int iTeamIndex)
{
    Teams[iTeamIndex].Score += float(FlagScore);
    Teams[iTeamIndex].NetUpdateTime = Level.TimeSeconds - float(1);
    FlagState_UpdateDomScore(int(Teams[0].Score), int(Teams[1].Score));
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    // End:0x3f
    if(Teams[0].Score == Teams[1].Score)
    {
        EndDOMGame(-1, none, "Draw Game");
    }
    // End:0xbc
    else
    {
        // End:0x7f
        if(Teams[0].Score > Teams[1].Score)
        {
            EndDOMGame(0, none, "TeamScoreLimit");
        }
        // End:0xbc
        else
        {
            // End:0xbc
            if(Teams[0].Score < Teams[1].Score)
            {
                EndDOMGame(1, none, "TeamScoreLimit");
            }
        }
    }
}

function OnRoundTimeOverWithoutObjectPlanted();
function EndDOMGame(int iWinningTeam, Pawn Instigator, string Reason)
{
    local PlayerReplicationInfo PRI;

    // End:0x1a
    if(!IsPlaying() || ResetCountDown > 0)
    {
        return;
    }
    Log("wDOMGameInfo::EndDOMGame - Reason : " @ Reason $ " / Teams[0].Score : " $ string(Teams[0].Score) $ " / Teams[1].Score : " $ string(Teams[1].Score));
    // End:0xc0
    if(Instigator != none)
    {
        PRI = Instigator.PlayerReplicationInfo;
    }
    // End:0x125
    if(IsPracticeRound())
    {
        wMSGameReplicationInfo(GameReplicationInfo).RoundWinner = 1;
        wMSGameReplicationInfo(GameReplicationInfo).RoundOverTime = wMSGameReplicationInfo(GameReplicationInfo).RoundTimeLimit - wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime + RemainingTime;
    }
    // End:0x13f
    else
    {
        // End:0x13f
        if(iWinningTeam != -1)
        {
            AnnounceScore(iWinningTeam);
        }
    }
    TriggerEvent('EndDOMGame', self, Instigator);
    // End:0x16e
    if(EndCinematic != none)
    {
        EndCinematic.Trigger(self, none);
        return;
    }
    Log("EndDOMGame->EndGame - roundlimit : " $ Reason);
    EndGame(none, Reason);
    // End:0x1c3
    if(bGameEnded)
    {
        SetGameEndType(Reason);
        GotoState('MatchOver');
    }
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
    // End:0xe1
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wMSPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x13b
    if(C.StartSpot != none)
    {
        C.SetLocation(C.StartSpot.Location);
        C.SetRotation(C.StartSpot.Rotation);
    }
    // End:0x25c
    if(C.Pawn != none)
    {
        // End:0x16c
        if(C.Pawn.Weapon == none)
        {
        }
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(C.StartSpot.Location);
        C.Pawn.SetRotation(C.StartSpot.Rotation);
        C.Pawn.Velocity = vect(0.0, 0.0, 0.0);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x25c
        if(Bot(C) != none && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x2ad
    if(C.StartSpot != none)
    {
        C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
    }
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1d
    if(N.Class == class'PlayerStart_DOM')
    {
        return true;
    }
    // End:0x1f
    else
    {
        return false;
    }
}

function array<NavigationPoint> GetRespawnPointsForFlag(wFlagObjective flag)
{
    local array<NavigationPoint> candidates;
    local int lp1;
    local PlayerStart_DOM S;
    local int FlagType;

    Log("[wDOMGameInfo::GetRespawnPointsForFlag] name=" $ string(flag.Name) @ "Tag=" $ string(flag.Tag));
    // End:0x156
    if(flag != none)
    {
        FlagType = class'wHUD_Mission'.static.GetGameObjectIndex(flag);
        lp1 = 0;
        J0x89:
        // End:0x156 [While If]
        if(lp1 < EveryPlayerStarts.Length)
        {
            S = PlayerStart_DOM(EveryPlayerStarts[lp1]);
            // End:0x14c
            if(S != none && IsAppropriateRespawnPoint(S, 0) && !IsRespawnPointFailedRecently(S) && S.eApplyFlagType == FlagType)
            {
                candidates[candidates.Length] = S;
                Log("  " $ "name=" $ string(S.Name) @ "FlagType=" $ string(S.eApplyFlagType));
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x89;
        }
    }
    return candidates;
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
    // End:0x1ea [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_DOM(EveryPlayerStarts[lp1]);
        // End:0x1e0
        if(S != none && IsAppropriateRespawnPoint(S, 0) && !checkFail || !IsRespawnPointFailedRecently(S))
        {
            flag = GetFlagObjectiveByType(S.eApplyFlagType);
            // End:0x1e0
            if(S.eApplyFlagType == 3 || flag.iActiveTeam == -1 && flag.fCaptureProgress == 0.0)
            {
                candidates[candidates.Length] = S;
                Log("  " $ "name=" $ string(S.Name) @ "FlagType=" $ string(S.eApplyFlagType));
                // End:0x1e0
                if(flag != none)
                {
                    Log("    " $ "flag=" $ string(flag.Name) @ "tag=" $ string(flag.Tag) @ "iActiveTeam=" $ string(flag.iActiveTeam) @ "fCaptureProgress=" $ string(flag.fCaptureProgress));
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return candidates;
}

function wFlagObjective GetFlagObjectiveByType(byte FlagType)
{
    local wFlagObjective flag;

    // End:0x38
    foreach DynamicActors(class'wFlagObjective', flag)
    {
        // End:0x37
        if(class'wHUD_Mission'.static.GetGameObjectIndex(flag) == FlagType)
        {
            break;
            return flag;
        }                
    }
    return none;
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
    J0x2e:
    // End:0xab [While If]
    if(lp1 < FLAGS_MIX_COUNT)
    {
        A = Rand(flagTypes.Length);
        B = Rand(flagTypes.Length);
        // End:0xa1
        if(A != B)
        {
            tempFlag = flagTypes[A];
            flagTypes[A] = flagTypes[B];
            flagTypes[B] = tempFlag;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
    return flagTypes;
}

function bool IsSDRespawnTime()
{
    return float(GameReplicationInfo.ElapsedTime) < SDRespawnTime || Level.GetMatchMaker().IsSDRespawn();
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

    // End:0x6b
    if(Player != none && Player.PlayerReplicationInfo != none && Player.PlayerReplicationInfo.Team != none)
    {
        Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
    }
    // End:0x76
    else
    {
        Team = inTeam;
    }
    // End:0x3df
    if(Level.GetMatchMaker().TR_bNewRespawn)
    {
        // End:0xaa
        if(IsSDRespawnTime())
        {
            return FindPlayerStart_SD(Team);
        }
        // End:0x3dc
        else
        {
            Log("@-------------------");
            Log("[wDOMGameInfo::FindPlayerStart] at " $ string(Level.TimeSeconds) $ " for " $ Player.PlayerReplicationInfo.PlayerName);
            bLeaveRespawnLogInChat = bLeaveRespawnLogInChatReal && Player == Level.GetLocalPlayerController();
            flagTypes = GetShuffledFlags();
            lp1 = 0;
            J0x158:
            // End:0x28d [While If]
            if(lp1 < flagTypes.Length)
            {
                Log("Trying Flag: " $ string(curFlagType));
                curFlagType = flagTypes[lp1];
                flag = GetFlagObjectiveByType(curFlagType);
                // End:0x283
                if(flag.iActiveTeam == Team && flag.fCaptureProgress == 0.0)
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
                            Level.GetLocalPlayerController().myHUD.AddTextMessage("Flag" @ string(flag.Tag), class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                        }
                    }
                    // End:0x28d
                    else
                    {
                    }
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x158;
                }
            }
            // End:0x3a5
            if(respawnPoint == none)
            {
                Log("can't respawn near flags");
                // End:0x382
                if(IsAnyAllyAlive(Team))
                {
                    // End:0x319
                    if(bLeaveRespawnLogInChat)
                    {
                        Level.GetLocalPlayerController().myHUD.AddTextMessage("Try Near Ally", class'GameMessage', Level.GetLocalPlayerController().PlayerReplicationInfo);
                    }
                    pickedAlly = PickAlly(Team);
                    candidates = GetRespawnPointsFlagNeutral(true);
                    SortNavigationPoints(pickedAlly, candidates, candidateDists);
                    // End:0x36b
                    if(candidates.Length > 5)
                    {
                        candidates.Remove(5, candidates.Length - 5);
                    }
                    respawnPoint = GetRespawnPointRatingEnemy(true, candidates, Team);
                }
                // End:0x3a5
                if(respawnPoint == none)
                {
                    respawnPoint = GetSafetestRespawnPoint(Team, GetRespawnPointsFlagNeutral(false));
                }
            }
            // End:0x3c6
            if(respawnPoint == none)
            {
                respawnPoint = GetSafetestRespawnPoint(Team, EveryPlayerStarts);
            }
            LogFinalRespawnPoint(respawnPoint, Team);
            return respawnPoint;
        }
    }
    // End:0x67a
    else
    {
        // End:0x3fa
        if(Player != none)
        {
            Player.StartSpot = none;
        }
        // End:0x43a
        if(GameRulesModifiers != none)
        {
            N = GameRulesModifiers.FindPlayerStart(Player, inTeam, incomingName);
            // End:0x43a
            if(N != none)
            {
                return N;
            }
        }
        // End:0x479
        if(incomingName != "")
        {
            // End:0x478
            foreach AllActors(class'Teleporter', Tel)
            {
                // End:0x477
                if(string(Tel.Tag) ~= incomingName)
                {
                    break;
                    return Tel;
                }                                
            }
        }
        N = Level.NavigationPointList;
        J0x48d:
        // End:0x4ef [While If]
        if(N != none)
        {
            NewRating = RatePlayerStart(N, Team, Player);
            // End:0x4d8
            if(NewRating > BestRating)
            {
                BestRating = NewRating;
                BestStart = N;
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x48d;
        }
        // End:0x655
        if(PlayerStart(BestStart) == none)
        {
            Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
            Log(" Player:" @ Player.GetHumanReadableName() @ "Team:" @ string(Team) @ "Player.Event:" @ string(Player.Event));
            BestRating = -100000000.0;
            // End:0x654
            foreach AllActors(class'NavigationPoint', N)
            {
                // End:0x5de
                if(PlayerStart(N) != none)
                {
                    t = PlayerStart(N).TeamNumber;
                }
                // End:0x5e9
                else
                {
                    t = Team;
                }
                NewRating = RatePlayerStart(N, t, Player);
                // End:0x61f
                if(InventorySpot(N) != none)
                {
                    NewRating -= float(50);
                }
                NewRating += float(20) * FRand();
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
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart_DOM P;
    local float Score, NextDist;
    local Controller OtherPlayer;
    local GameObjective Go;

    P = PlayerStart_DOM(N);
    // End:0x37
    if(P == none || !P.bEnabled)
    {
        return -10000000.0;
    }
    Score = 1000000.0;
    Score += FMax(float(NumPlayers + NumBots) * 0.40, 2.0) * VSize(P.Location - Player.Location);
    OtherPlayer = Level.ControllerList;
    J0x9b:
    // End:0x1da [While If]
    if(OtherPlayer != none)
    {
        // End:0x1c3
        if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
        {
            NextDist = VSize(OtherPlayer.Pawn.Location - P.Location);
            // End:0x13d
            if(NextDist < OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight)
            {
                return -1000000.0;
            }
            // End:0x167
            if(OtherPlayer.GetTeamNum() == Team)
            {
                Score -= NextDist;
            }
            // End:0x1c3
            else
            {
                // End:0x1a3
                if(FastTrace(P.Location, OtherPlayer.Pawn.Location))
                {
                    Score -= float(200000);
                }
                // End:0x1c3
                else
                {
                    Score -= FMax(30000.0 - float(10) * NextDist, 0.0);
                }
            }
        }
        OtherPlayer = OtherPlayer.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x9b;
    }
    Score -= float(Rand(10000 * NumPlayers + NumBots / 16));
    Go = Teams[0].AI.Objectives;
    J0x21b:
    // End:0x331 [While If]
    if(Go != none)
    {
        // End:0x31a
        if(Go.IsA('wFlagObjective') && wMSGameReplicationInfo(GameReplicationInfo).ObjectiveProgress == Go.ObjectivePriority && !Go.bDisabled && !Go.bOptionalObjective)
        {
            NextDist = VSize(Go.Location - P.Location);
            // End:0x2fa
            if(wFlagObjective(Go).iActiveTeam == Team)
            {
                Score += FMax(10000.0 - float(10) * NextDist, 3000.0);
            }
            // End:0x31a
            else
            {
                Score -= FMax(50000.0 - float(10) * NextDist, 0.0);
            }
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x21b;
    }
    return FMax(Score, 5.0);
}

function bool IsAllFlagCaptured()
{
    local wFlagObjective f;
    local int iTempTeam;

    iTempTeam = -99;
    // End:0x72
    foreach DynamicActors(class'wFlagObjective', f)
    {
        // End:0x71
        if(!f.bDisabled)
        {
            // End:0x56
            if(iTempTeam == -99)
            {
                iTempTeam = f.iActiveTeam;
                continue;
            }
            // End:0x72
            else
            {
                // End:0x71
                if(iTempTeam != f.iActiveTeam)
                {
                    break;
                    return false;
                }
            }
            continue;
        }        
    }
    return true;
}

function AnnounceAllFlagCaptured(byte byTeam)
{
    TeamReceiveLocalizedMessage(byTeam, class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedAll);
    TeamReceiveLocalizedMessage(byTeam, class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverLead);
    TeamReceiveLocalizedMessage(byte(1 - byTeam), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedAll);
    TeamReceiveLocalizedMessage(byte(1 - byTeam), class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverFallBehind);
}

function InitializeCodes()
{
    // End:0x118
    if(Codes_AllyCapturing.Length == 0)
    {
        Codes_AllyCapturing[0] = class'wMessage_Game'.default.Code_DOMAllyCapturingA;
        Codes_AllyCapturing[1] = class'wMessage_Game'.default.Code_DOMAllyCapturingB;
        Codes_AllyCapturing[2] = class'wMessage_Game'.default.Code_DOMAllyCapturingC;
        Codes_AllyCaptured[0] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedA;
        Codes_AllyCaptured[1] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedB;
        Codes_AllyCaptured[2] = class'wMessage_Game_ImpSystem'.default.Code_DOMAllyCapturedC;
        Codes_EnemyCapturing[0] = class'wMessage_Game'.default.Code_DOMEnemyCapturingA;
        Codes_EnemyCapturing[1] = class'wMessage_Game'.default.Code_DOMEnemyCapturingB;
        Codes_EnemyCapturing[2] = class'wMessage_Game'.default.Code_DOMEnemyCapturingC;
        Codes_EnemyCaptured[0] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedA;
        Codes_EnemyCaptured[1] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedB;
        Codes_EnemyCaptured[2] = class'wMessage_Game_ImpSystem'.default.Code_DOMEnemyCapturedC;
    }
}

function AnnounceFlagCapture(byte byState, byte byTeam, byte byFlagIndex)
{
    InitializeCodes();
    // End:0x5a
    if(byState == 0)
    {
        TeamReceiveLocalizedMessage(byTeam, class'wMessage_Game', Codes_AllyCapturing[byFlagIndex]);
        TeamReceiveLocalizedMessage(byte(1 - byTeam), class'wMessage_Game', Codes_EnemyCapturing[byFlagIndex]);
    }
    // End:0xab
    else
    {
        // End:0xab
        if(byState == 1)
        {
            TeamReceiveLocalizedMessage(byTeam, class'wMessage_Game_ImpSystem', Codes_AllyCaptured[byFlagIndex]);
            TeamReceiveLocalizedMessage(byte(1 - byTeam), class'wMessage_Game_ImpSystem', Codes_EnemyCaptured[byFlagIndex]);
        }
    }
}

function AnnounceFlagState(byte byState, byte byTeam, name FlagTag)
{
    local byte byFlagIndex;

    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    AnnounceFlagCapture(byState, byTeam, byFlagIndex);
    // End:0x54
    if(byState == 1 && IsAllFlagCaptured())
    {
        AnnounceAllFlagCaptured(byTeam);
    }
}

function FlagState_TakePoint(array<int> TakerUID, name FlagTag)
{
    local byte byFlagIndex;
    local int i;

    byFlagIndex = byte(class'wHUD_Mission'.static.GetGameObjectIndexByTag(FlagTag));
    i = 0;
    J0x23:
    // End:0x9b [While If]
    if(i < TakerUID.Length)
    {
        clog("[wSDGameInfo::sfReqGamePlay_TakeAPoint] PlayerID=" $ string(TakerUID[i]) $ "/FlagTag:" $ string(byFlagIndex));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
    Log("[wSDGameInfo::sfReqGamePlay_TakeAPoint]");
    // End:0x10d
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_TakeAPoint(TakerUID, byFlagIndex, afTakerXCoord, afTakerYCoord, afTakerZCoord, aiTakerPos, aiTakerWeapon, aiTakerWeaponPart, aiTakerRange);
    }
    ClearTakerInfo();
}

function FlagState_UpdateDomScore(int AFScore, int RSAScore)
{
    Log("[wSDGameInfo::sfReqGamePlay_UpdateDomScore]  AF Score:" $ string(AFScore) $ "/ RSA Score:" $ string(RSAScore));
    // End:0x80
    if(BTSend != none)
    {
        BTSend.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
    }
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
}

function PlayEndOfMatchMessage()
{
    super(TeamGame).PlayEndOfMatchMessage();
}

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:
    // End:0x136 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += TeamInfo(GameReplicationInfo.Winner).Score / 3.50 * GetResultPointRatio_Intervention(PRI);
        PRI.Point += TeamInfo(GameReplicationInfo.Winner).Score / 3.30 * GetResultPointRatio_Intervention(PRI);
        // End:0x11f
        if(PRI.Team == GameReplicationInfo.Winner)
        {
            PRI.fExp += float(Min(ScoreLimit, int(TeamInfo(GameReplicationInfo.Winner).Score))) / 5.0 * GetResultPointRatio_Intervention(PRI);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function int GetTotalPlayedTime()
{
    return RoundTimeLimit * 60;
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
}

function CheckLastMan(int TeamIndex);
function StartMatch()
{
    local Pawn P;
    local wFlagObjective f;

    Log("[wDOMGameInfo::StartMatch] bChangedHost=" $ string(Level.Game.bChangedHost));
    super.StartMatch();
    Flags.Length = 0;
    // End:0x79
    foreach DynamicActors(class'wFlagObjective', f)
    {
        Flags[Flags.Length] = f;                
    }
    // End:0xd6
    if(Level.Game.bChangedHost)
    {
        // End:0xd5
        foreach DynamicActors(class'wFlagObjective', f)
        {
            // End:0xd3
            foreach f.TouchingActors(class'Pawn', P)
            {
                f.Touch(P);                                
            }                        
        }
    }
}

function GetFlagsInfo(out int outNumFlags, out int outNumCapturedFlagsByTeam1, out int outNumCapturedFlagsByTeam2)
{
    local int lp1;

    outNumFlags = Flags.Length;
    outNumCapturedFlagsByTeam1 = 0;
    outNumCapturedFlagsByTeam2 = 0;
    lp1 = 0;
    J0x21:
    // End:0x82 [While If]
    if(lp1 < Flags.Length)
    {
        // End:0x55
        if(Flags[lp1].iActiveTeam == 1)
        {
            ++ outNumCapturedFlagsByTeam1;
        }
        // End:0x78
        else
        {
            // End:0x78
            if(Flags[lp1].iActiveTeam == 2)
            {
                outNumCapturedFlagsByTeam2 = 2;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject(class'wMessage_Game'.default.SoundDOMAllyCaptured, class'Sound');
    DynamicLoadObject(class'wMessage_Game'.default.SoundDOMEnemyCaptured, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedAll, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedAll, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturingC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturingC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMAllyCapturedC, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedA, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedB, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceDOMEnemyCapturedC, class'Sound');
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = class'wPurposeAttackTargetDOM'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = class'wPurposeCaptureFlag'.static.Create(wAIBot(Owner));
}

state MatchInProgress
{
    function Timer()
    {
        local wFlagObjective f;

        // End:0x73
        if(float(RemainingTime) % float(FlagScoreInterval) == float(0))
        {
            // End:0x6c
            foreach DynamicActors(class'wFlagObjective', f)
            {
                // End:0x6b
                if(f.iActiveTeam != -1 && f.iActiveTeam < 2)
                {
                    AddTeamScore(f.iActiveTeam);
                }                                
            }
            AnnounceWinningTeam();
        }
        // End:0xb0
        if(Teams[0].Score == float(ScoreLimit) && Teams[1].Score == float(ScoreLimit))
        {
        }
        // End:0x11b
        else
        {
            // End:0xe7
            if(Teams[0].Score >= float(ScoreLimit))
            {
                EndDOMGame(0, none, "TeamScoreLimit");
            }
            // End:0x11b
            else
            {
                // End:0x11b
                if(Teams[1].Score >= float(ScoreLimit))
                {
                    EndDOMGame(1, none, "TeamScoreLimit");
                }
            }
        }
        super.Timer();
    }

}

state MatchOver
{
    function EndDOMGame(int iWinningTeam, Pawn Instigator, string Reason);

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
    sndModeName=.Mode_Dom.v_dom_R
    sndModeExplain=.Mode_Dom.v_dom_all_01_R
    HUDType="wMission.wHUD_Domination"
    GameName="Domination"
    GameAddExp=13.0
    GameAssistExp=4.0
    GamePenaltyExp=13.0
    GameAddPoint=4.0
    GameAssistPoint=1.0
    GamePenaltyPoint=4.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    bHasRespawnRestriction=true
}