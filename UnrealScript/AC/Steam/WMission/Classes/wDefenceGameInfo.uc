/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wDefenceGameInfo.uc
 * Package Imports:
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:12
 *	Functions:37
 *	States:2
 *
 *******************************************************************************/
class wDefenceGameInfo extends wMSGameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

struct sRoundInfo
{
    var array<int> DelayTime;
    var array<int> RegenLoc;
    var array<int> Grade;
    var array<int> Unit;
};

var sRoundInfo RoundInfo;
var int AddBotCount;
var int DeadBotCount;
var int MaxUnitNum;
var wMapInfo mapInfo;
var int MapID;
var int GameLevel;
var int RoundProgIndex;
var string strBotID;
var array<int> BotGradeList;
var wDefenceObjective DefenceObject;
var int bestScore;

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    // End:0x5e
    if(npcActions.GotoFlag)
    {
        Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(class'wAction_GotoFlag')).Init(DefenceObject);
    }
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = class'wPurposeExplore'.static.Create(wAIBot(Owner));
}

function UpdatePositionLog();
function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    // End:0x5e
    if(bNoReset == true)
    {
        RoundStartTime = RemainingTime;
        wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.RemainingMinute = RemainingTime;
        SetRoundTimeLimit();
    }
    super.InitializeGameInfo(bNoReset, bChangeTeam);
}

function InitRoundInfo()
{
    AddBotCount = 0;
    MaxUnitNum = 9999;
    DeadBotCount = 0;
    RoundProgIndex = 0;
    RoundInfo.DelayTime.Length = 0;
    RoundInfo.RegenLoc.Length = 0;
    RoundInfo.Grade.Length = 0;
    RoundInfo.Unit.Length = 0;
    BotGradeList.Length = 0;
}

function SetRoundInfo()
{
    local int i, j;
    local bool bFind;

    MaxUnitNum = 0;
    i = 0;
    J0x0e:
    // End:0xc1 [While If]
    if(i < RoundInfo.Unit.Length)
    {
        MaxUnitNum += RoundInfo.Unit[i];
        bFind = false;
        j = 0;
        J0x49:
        // End:0x8e [While If]
        if(j < BotGradeList.Length)
        {
            // End:0x84
            if(RoundInfo.Grade[i] == BotGradeList[j])
            {
                bFind = true;
            }
            // End:0x8e
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x49;
            }
        }
        // End:0xb7
        if(bFind == false)
        {
            BotGradeList[BotGradeList.Length] = RoundInfo.Grade[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    CurrentAttackingTeam = 1;
    BTSend.sfReqGetBotID(0, 1);
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1d
    if(N.Class == class'PlayerStart_Defence')
    {
        return true;
    }
    // End:0x1f
    else
    {
        return false;
    }
}

function PostBeginPlay()
{
    local wDefenceObjective DObject;
    local wMatchMaker MM;

    super.PostBeginPlay();
    // End:0x36
    foreach DynamicActors(class'wDefenceObjective', DObject)
    {
        DefenceObject = DObject;
        DefenceObject.__OnTouch__Delegate = OnObjectTouch;                
    }
    MM = Level.GetMatchMaker();
    // End:0x6e
    if(MM != none)
    {
        GameLevel = MM.BotDifficulty - 1;
    }
    // End:0xa5
    if(mapInfo == none)
    {
        mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    }
    MapID = mapInfo.MapID;
    ScoreLimit = Level.GameMgr.GetDefenceGameRoundCount2(GameLevel, MapID);
}

event PostLogin(PlayerController NewPlayer)
{
    super(wTeamGame).PostLogin(NewPlayer);
    NewPlayer.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = true;
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    dblog("[DeathMatch::rfAckGetBotID] Result=" $ string(Result) $ " RequestedAFCount=" $ string(RequestedAFCount) $ " RequestedRSACount=" $ string(RequestedRSACount) $ " AFBotID=" $ string(AFBotID.Length) $ " RSABotID=" $ string(RSABotID.Length));
    strBotID = string(RSABotID[0]);
    return true;
}

function BalanceBots()
{
    local int elapsed, i, Count;
    local wFlyingDefenceBot wFBot;
    local string strBotPawnCalss;

    elapsed = RoundStartTime - RemainingTime;
    Log("[wDefenceGameInfo::BalanceBots] elapsed =" $ string(elapsed));
    J0x48:
    // End:0x38f [While If]
    if(true)
    {
        // End:0x64
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
        }
        // End:0x38f
        else
        {
            // End:0x81
            if(elapsed < RoundInfo.DelayTime[RoundProgIndex])
            {
            }
            // End:0x38f
            else
            {
                Log("[wDefenceGameInfo::BalanceBots] idx=" $ string(RoundProgIndex) $ ", Grad=" $ string(RoundInfo.Grade[RoundProgIndex]) $ ", Unit=" $ string(RoundInfo.Unit[RoundProgIndex]) $ ", Loc=" $ string(RoundInfo.RegenLoc[RoundProgIndex]));
                // End:0x1e8
                if(RoundInfo.Grade[RoundProgIndex] == 910 || RoundInfo.Grade[RoundProgIndex] == 911)
                {
                    Count = RoundInfo.Unit[RoundProgIndex];
                    i = 0;
                    J0x161:
                    // End:0x1e5 [While If]
                    if(i < Count)
                    {
                        wFBot = class'wFlyingDefenceBot'.static.CallFlyingDefenceBot(Level, 1, RoundInfo.Grade[RoundProgIndex], 0);
                        // End:0x1ab
                        if(wFBot == none)
                        {
                        }
                        // End:0x1e5
                        else
                        {
                            wFlyingDefenceBotController(wFBot.Controller).__OnDisappear__Delegate = OnFlyingDefenceBotDisappear;
                            ++ AddBotCount;
                            ++ NumBots;
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x161;
                        }
                    }
                }
                // End:0x335
                else
                {
                    switch(RoundInfo.Grade[RoundProgIndex])
                    {
                        // End:0x202
                        case 901:
                        // End:0x228
                        case 902:
                            strBotPawnCalss = "WGame.wAIDefenceBot";
                            // End:0x2d5
                            break;
                        // End:0x230
                        case 903:
                        // End:0x238
                        case 904:
                        // End:0x240
                        case 905:
                        // End:0x26c
                        case 906:
                            strBotPawnCalss = "WGame.wAIDefenceBot_Gamma";
                            // End:0x2d5
                            break;
                        // End:0x274
                        case 907:
                        // End:0x27c
                        case 908:
                        // End:0x2a6
                        case 909:
                            strBotPawnCalss = "WGame.wAIDefenceBot_Eta";
                            // End:0x2d5
                            break;
                        // End:0x2d2
                        case 912:
                            strBotPawnCalss = "WGame.wAIDefenceBot_Omega";
                            // End:0x2d5
                            break;
                        // End:0xffff
                        default:
                            AddwAIBot(string(RoundInfo.Unit[RoundProgIndex]), "1", strBotPawnCalss, string(RoundInfo.Grade[RoundProgIndex]), strBotID, string(RoundInfo.RegenLoc[RoundProgIndex]));
                            AddBotCount += RoundInfo.Unit[RoundProgIndex];
                        }
                        Log("[wDefenceGameInfo::BalanceBots] AddBotCount=" $ string(AddBotCount) $ ", NumBots=" $ string(NumBots));
                        ++ RoundProgIndex;
                        // This is an implied JumpToken; Continue!
                        goto J0x48;
                    }
                }
            }
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
    local int lp1;
    local wAIBotBase Bot;
    local PlayerStart_Defence S;
    local NavigationPoint respawn;
    local array<PlayerStart_Defence> candidates;

    // End:0x77
    if(Player != none && Player.PlayerReplicationInfo != none)
    {
        // End:0x69
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);
        }
        // End:0x74
        else
        {
            Team = inTeam;
        }
    }
    // End:0x82
    else
    {
        Team = inTeam;
    }
    Team = byte(float(byte(Team + CurrentAttackingTeam)) % float(2));
    Bot = wAIBotBase(Player);
    lp1 = 0;
    J0xbb:
    // End:0x17e [While If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_Defence(EveryPlayerStarts[lp1]);
        // End:0x174
        if(S.eTeamType == Team && !IsRespawnPointFailedRecently(S) && !IsAnyPawnWithinRadius(S))
        {
            // End:0x162
            if(Bot != none)
            {
                // End:0x15f
                if(Bot.RegenLoc == S.RegenLoc)
                {
                    candidates[candidates.Length] = S;
                }
            }
            // End:0x174
            else
            {
                candidates[candidates.Length] = S;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xbb;
    }
    Log("length=" $ string(candidates.Length));
    // End:0x2ec
    if(candidates.Length != 0)
    {
        S = candidates[Rand(candidates.Length)];
        respawn = S;
        // End:0x24a
        if(Bot == none)
        {
            Log("[FindPlayerStart] trying" @ string(S.Name) @ "type=" $ string(GetEnum(enum'ESpawnTeam', S.eTeamType)) $ ",respawn.RegenLoc=" $ string(S.RegenLoc));
        }
        // End:0x2ec
        else
        {
            Log("[FindPlayerStart] trying" @ string(S.Name) @ "type=" $ string(GetEnum(enum'ESpawnTeam', S.eTeamType)) $ ",respawn.RegenLoc=" $ string(S.RegenLoc) $ ",Bot.RegenLoc=" $ string(Bot.RegenLoc));
        }
    }
    return respawn;
}

function BeginRound(optional bool bNoReset)
{
    super.BeginRound(bNoReset);
    InitRoundInfo();
    Level.GameMgr.GetDefenceGamePrams2(GameLevel, MapID, CurrentRound, RoundInfo.DelayTime, RoundInfo.RegenLoc, RoundInfo.Grade, RoundInfo.Unit);
    SetRoundInfo();
    Log("[wDefenceGameInfo::BeginRound] Level=" $ string(GameLevel) $ ", MapID=" $ string(MapID) $ ", CurrentRound=" $ string(CurrentRound) $ ", IndexCount=" $ string(RoundInfo.DelayTime.Length) $ ", MaxUnitNum=" $ string(MaxUnitNum));
}

function ResetLevel(optional bool hiddenAll)
{
    // End:0x1a
    if(CurrentRound < 2)
    {
        super.ResetLevel(hiddenAll);
    }
}

function DestoryPawns()
{
    // End:0x14
    if(CurrentRound < 2)
    {
        super.DestoryPawns();
    }
}

function ProcessRespawn()
{
    // End:0x14
    if(CurrentRound < 2)
    {
        super.ProcessRespawn();
    }
}

function BeginWaitingForStart()
{
    local Controller C;

    // End:0x16
    if(CurrentRound < 2)
    {
        super(GameInfo).BeginWaitingForStart();
        return;
    }
    C = Level.ControllerList;
    J0x2a:
    // End:0xb3 [While If]
    if(C != none)
    {
        // End:0x60
        if(Vehicle(C.Pawn) == none)
        {
            C.ClientOnBeginRound();
        }
        // End:0x9c
        else
        {
            // End:0x9c
            if(PlayerController(C).myHUD != none)
            {
                PlayerController(C).myHUD.CallEvent(, 1002);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
}

function ProcessEndGame();
function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local PlayerController PC;
    local Controller C;

    // End:0x35
    if(Teams[0].Score >= float(ScoreLimit))
    {
        GameReplicationInfo.Winner = Teams[0];
    }
    // End:0x4b
    else
    {
        GameReplicationInfo.Winner = Teams[1];
    }
    C = Level.ControllerList;
    J0x5f:
    // End:0x12b [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x114
        if(PC != none)
        {
            // End:0xc7
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
            // End:0x114
            if(PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner)
            {
                PC.ReceiveMessage_QuestType3(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_MatchEndInBotMode,);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
}

function bool CheckLives(PlayerReplicationInfo Scorer)
{
    return false;
}

function CheckLastMan(int TeamIndex);
function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local Controller C;
    local PlayerController P;

    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0xa0
    if(RoundEndReason == 1)
    {
        C = Level.ControllerList;
        J0x39:
        // End:0xa0 [While If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x89
            if(P != none)
            {
                P.ReceiveMessage_QuestType4(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_RoundEndInBotMode,, CurrentRound);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
    }
}

function bool IsRoundLimitReached()
{
    Log("[wDefenceGameInfo::IsRoundLimitReached] Health=" $ string(DefenceObject.Health) $ ", Score = " $ string(Teams[0].Score));
    return Teams[0].Score >= float(ScoreLimit) || DefenceObject.Health < float(1);
}

function SetRoundWinner(int WinningTeam)
{
    // End:0x7e
    if(WinningTeam == 1)
    {
        Teams[WinningTeam].Score = Teams[0].Score + float(1);
        Teams[WinningTeam].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(WinningTeam, 1.0, "Round Winner");
    }
    // End:0x89
    else
    {
        super.SetRoundWinner(WinningTeam);
    }
}

function RestartPlayer(Controller aPlayer)
{
    super.RestartPlayer(aPlayer);
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAIBotBase Bot;
    local wFlyingDefenceBotController FBot;
    local wAIPawn BotPawn;

    BotPawn = wAIPawn(KilledPawn);
    // End:0x2a
    if(Killer != Killed)
    {
        SpwanBotProjectile(BotPawn);
    }
    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    // End:0x5f
    if(Killer == Killed)
    {
        return;
    }
    // End:0x71
    if(PlayerController(Killer) == none)
    {
        return;
    }
    Bot = wAIBotBase(Killed);
    FBot = wFlyingDefenceBotController(Killed);
    // End:0xad
    if(FBot != none)
    {
        -- NumBots;
        ++ DeadBotCount;
    }
    // End:0xe3
    else
    {
        // End:0xe3
        if(Bot != none)
        {
            Level.AILevel.KillBot(Bot);
            -- NumBots;
            ++ DeadBotCount;
        }
    }
    // End:0x125
    if(bestScore < int(Killer.PlayerReplicationInfo.Score))
    {
        bestScore = int(Killer.PlayerReplicationInfo.Score);
    }
}

function SpwanBotProjectile(wAIPawn Bot)
{
    local Inventory Inv;
    local wWeapon Weapon;
    local wProjectile proj;
    local int Count;

    // End:0x23
    if(Bot == none || Bot.Inventory == none)
    {
        return;
    }
    Inv = Bot.Inventory;
    J0x37:
    // End:0xb1 [While If]
    if(Inv != none)
    {
        // End:0x82
        if(Inv.InventoryGroup == 4 && Inv.IsA('wWeapon'))
        {
            Weapon = wWeapon(Inv);
        }
        // End:0xb1
        else
        {
            ++ Count;
            // End:0x9a
            if(Count > 1000)
            {
                return;
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x37;
        }
    }
    // End:0xbe
    if(Weapon == none)
    {
        return;
    }
    proj = Weapon.Spawn(class'wGrenade',,, Bot.Location);
    proj.fGravMass = Weapon.BaseParams.fBulletGravity;
    // End:0x17b
    if(Bot.Controller != none && Bot.Controller.SkillBase != none && Bot.Controller.SkillBase.bIncExplosion == true)
    {
        proj.bIncExplosion = true;
    }
    // End:0x18c
    else
    {
        proj.bIncExplosion = false;
    }
    proj.iWeaponID = Weapon.BaseParams.iWeaponID;
}

function ObjectiveDisabled(GameObjective DisabledObjective)
{
    Spawn(class'wC4Explosive',,, DefenceObject.Location);
}

function OnObjectTouch(Actor Other)
{
    local Pawn BotPawn;
    local wAIBotBase BotCtrl;
    local wFlyingDefenceBot FlyPawn;
    local wFlyingDefenceBotController FlyBotCtrl;

    BotPawn = Pawn(Other);
    // End:0x94
    if(BotPawn != none)
    {
        BotCtrl = wAIBotBase(BotPawn.Controller);
        // End:0x91
        if(BotCtrl != none)
        {
            TakeDamageToDefenceObject(int(BotCtrl.NPCParam.DamageRate), BotPawn);
            BotPawn.bHidden = true;
            Level.AILevel.KillBot(BotCtrl);
        }
    }
    // End:0x116
    else
    {
        FlyPawn = wFlyingDefenceBot(Other);
        // End:0x116
        if(FlyPawn != none)
        {
            FlyBotCtrl = wFlyingDefenceBotController(FlyPawn.Controller);
            TakeDamageToDefenceObject(int(FlyBotCtrl.NPCParam.DamageRate), FlyPawn);
            FlyPawn.bHidden = true;
            FlyPawn.Controller.GotoState('Dying');
        }
    }
}

function OnFlyingDefenceBotDisappear(wFlyingDefenceBotController FlyingBot)
{
    TakeDamageToDefenceObject(int(FlyingBot.NPCParam.DamageRate), FlyingBot.Pawn);
}

function TakeDamageToDefenceObject(int Damage, Pawn Instigator)
{
    -- NumBots;
    ++ DeadBotCount;
    DefenceObject.TakeDamage(Damage, Instigator, vect(0.0, 0.0, 0.0), vect(0.0, 0.0, 0.0), none);
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    return false;
}

function bool NeedPlayers()
{
    return false;
}

function AnnounceMatchInfo()
{
    local Controller C;
    local Sound startSound;

    startSound = Sound(DynamicLoadObject(string(sndModeName), class'Sound'));
    C = Level.ControllerList;
    J0x31:
    // End:0x80 [While If]
    if(C != none)
    {
        // End:0x69
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ClientPlaySound(startSound);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

exec function DefenceWin()
{
    NumBots = 0;
    CurrentRound = byte(ScoreLimit);
    Teams[0].Score = float(ScoreLimit);
    EndRound(1, none, "Player Win !!!");
}

exec function DefencePass()
{
    local wAIDefencePawn P;

    // End:0x1c
    foreach DynamicActors(class'wAIDefencePawn', P)
    {
        OnObjectTouch(P);                
    }
    DefenceObject.Health = 999.0;
    EndRound(1, none, "Player Win !!!");
}

state MatchInProgress
{
    function ProcessEndRound()
    {
        local int i;
        local wAILevel AILevel;

        // End:0x70
        if(DefenceObject.Health <= float(0))
        {
            EndRound(0, none, "Bot Win !!!");
            Log("[wDefenceGameInfo::ProcessEndRound1] DefenceObject.Health <= 0");
            return;
        }
        // End:0xf3
        if(DeadBotCount >= MaxUnitNum)
        {
            EndRound(1, none, "Player Win !!!");
            Log("[wDefenceGameInfo::ProcessEndRound2] DeadBotCount :" $ string(DeadBotCount) $ ", MaxUnitNum" $ string(MaxUnitNum));
            return;
        }
        // End:0x3ea
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // End:0x1ce
            if(NumBots == 0)
            {
                EndRound(1, none, "Player Win !!!");
                Log("[wDefenceGameInfo::ProcessEndRound3] Round=" $ string(CurrentRound) $ ", ProgIdx=" $ string(RoundProgIndex) $ ", MaxUnitNum=" $ string(MaxUnitNum) $ ", DeadBotCount=" $ string(DeadBotCount) $ ", AddCount=" $ string(AddBotCount));
                return;
            }
            // End:0x3ea
            else
            {
                // End:0x1fe
                if(RoundStartTime - RemainingTime < RoundInfo.DelayTime[RoundInfo.DelayTime.Length - 1] + 60)
                {
                    return;
                }
                AILevel = wAILevel(Level.AILevel);
                i = 0;
                J0x21e:
                // End:0x3ea [While If]
                if(i < AILevel.Bots.Length)
                {
                    // End:0x2df
                    if(AILevel.Bots[i].Pawn == none)
                    {
                        Log("[wDefenceGameInfo::ProcessEndRound] Wrong Bot :" $ string(AILevel.Bots[i]));
                        Level.AILevel.KillBot(AILevel.Bots[i]);
                        -- NumBots;
                        ++ DeadBotCount;
                    }
                    // End:0x3e0
                    if(AILevel.Bots[i].MoveTimer < float(-30))
                    {
                        Log("[wDefenceGameInfo::ProcessEndRound] Wrong Bot :" $ string(AILevel.Bots[i]) $ ", MoveTimer:" $ string(AILevel.Bots[i].MoveTimer));
                        // End:0x3a6
                        if(wAIDefenceBot_Omega(AILevel.Bots[i]) != none)
                        {
                        }
                        // End:0x3e0
                        else
                        {
                            Level.AILevel.KillBot(AILevel.Bots[i]);
                            -- NumBots;
                            ++ DeadBotCount;
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x21e;
                }
            }
        }
    }

}

state MatchOver
{
    function BeginState()
    {
        local array<int> BotID;

        super.BeginState();
        BotID[0] = int(strBotID);
        BTSend.sfReqReturnBotID(BotID);
        Log("[DefenceMatchOver] sfReqReturnBotID " $ string(BotID[0]));
        // End:0x7c
        if(GameReplicationInfo.Winner == Teams[0])
        {
            UpdateBestScorePlayer();
        }
    }

    function UpdateBestScorePlayer()
    {
        local int lp1;
        local Controller C;
        local PlayerController PC;
        local array<PlayerController> PCArray;

        C = Level.ControllerList;
        J0x14:
        // End:0x99 [While If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x82
            if(PC != none)
            {
                // End:0x82
                if(int(PC.PlayerReplicationInfo.Score) == bestScore)
                {
                    PCArray.Length = PCArray.Length + 1;
                    PCArray[PCArray.Length - 1] = PC;
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
        lp1 = 0;
        J0xa0:
        // End:0xe3 [While If]
        if(lp1 < PCArray.Length)
        {
            PCArray[lp1].ReceiveMessage_QuestType3(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_BestScoreInBotMode,);
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xa0;
        }
    }

}

defaultproperties
{
    GiveBotsFakeUID=true
    DefaultMaxLives=0
    sndModeName=Warfare_Sound_Defense_Mode.ui.Missionstart
    bSendBot=true
    ScoreBoardType="XInterface.xScoreBoardDefenceGame"
    HUDType="wMission.wHUD_Defence"
    PlayerControllerClassName="WGame.wDefenceController"
    bHasRespawnRestriction=true
}