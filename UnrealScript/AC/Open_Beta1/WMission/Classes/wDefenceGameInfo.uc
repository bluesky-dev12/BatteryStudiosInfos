class wDefenceGameInfo extends wMSGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    // End:0x5E
    if(npcActions.GotoFlag)
    {
        Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_GotoFlag')).Init(DefenceObject);
    }
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = Class'WGame.wPurposeExplore'.static.Create(wAIBot(Owner));
    //return;    
}

function UpdatePositionLog()
{
    //return;    
}

function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
    // End:0x5E
    if(bNoReset == true)
    {
        RoundStartTime = RemainingTime;
        wMSGameReplicationInfo(GameReplicationInfo).RoundStartTime = RemainingTime;
        GameReplicationInfo.RemainingTime = RemainingTime;
        GameReplicationInfo.RemainingMinute = RemainingTime;
        SetRoundTimeLimit();
    }
    super.InitializeGameInfo(bNoReset, bChangeTeam);
    //return;    
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
    //return;    
}

function SetRoundInfo()
{
    local int i, j;
    local bool bFind;

    MaxUnitNum = 0;
    i = 0;
    J0x0E:

    // End:0xC1 [Loop If]
    if(i < RoundInfo.Unit.Length)
    {
        MaxUnitNum += RoundInfo.Unit[i];
        bFind = false;
        j = 0;
        J0x49:

        // End:0x8E [Loop If]
        if(j < BotGradeList.Length)
        {
            // End:0x84
            if(RoundInfo.Grade[i] == BotGradeList[j])
            {
                bFind = true;
                // [Explicit Break]
                goto J0x8E;
            }
            ++j;
            // [Loop Continue]
            goto J0x49;
        }
        J0x8E:

        // End:0xB7
        if(bFind == false)
        {
            BotGradeList[BotGradeList.Length] = RoundInfo.Grade[i];
        }
        ++i;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    CurrentAttackingTeam = 1;
    BTSend.sfReqGetBotID(0, 1);
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x1D
    if(N.Class == Class'Engine.PlayerStart_Defence')
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function PostBeginPlay()
{
    local wDefenceObjective DObject;
    local wMatchMaker MM;

    super.PostBeginPlay();
    // End:0x36
    foreach DynamicActors(Class'WMission_Decompressed.wDefenceObjective', DObject)
    {
        DefenceObject = DObject;
        DefenceObject.__OnTouch__Delegate = OnObjectTouch;        
    }    
    MM = Level.GetMatchMaker();
    // End:0x6E
    if(MM != none)
    {
        GameLevel = MM.BotDifficulty - 1;
    }
    // End:0xA5
    if(mapInfo == none)
    {
        mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    }
    MapID = mapInfo.MapID;
    ScoreLimit = Level.GameMgr.GetDefenceGameRoundCount2(GameLevel, MapID);
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    super(wTeamGame).PostLogin(NewPlayer);
    NewPlayer.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = true;
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    dblog((((((((("[DeathMatch::rfAckGetBotID] Result=" $ string(Result)) $ " RequestedAFCount=") $ string(RequestedAFCount)) $ " RequestedRSACount=") $ string(RequestedRSACount)) $ " AFBotID=") $ string(AFBotID.Length)) $ " RSABotID=") $ string(RSABotID.Length));
    strBotID = string(RSABotID[0]);
    return true;
    //return;    
}

function BalanceBots()
{
    local int elapsed, i, Count;
    local wFlyingDefenceBot wFBot;
    local string strBotPawnCalss;

    elapsed = RoundStartTime - RemainingTime;
    Log("[wDefenceGameInfo::BalanceBots] elapsed =" $ string(elapsed));
    J0x48:

    // End:0x38F [Loop If]
    if(true)
    {
        // End:0x64
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // [Explicit Break]
            goto J0x38F;
        }
        // End:0x81
        if(elapsed < RoundInfo.DelayTime[RoundProgIndex])
        {
            // [Explicit Break]
            goto J0x38F;
        }
        Log((((((("[wDefenceGameInfo::BalanceBots] idx=" $ string(RoundProgIndex)) $ ", Grad=") $ string(RoundInfo.Grade[RoundProgIndex])) $ ", Unit=") $ string(RoundInfo.Unit[RoundProgIndex])) $ ", Loc=") $ string(RoundInfo.RegenLoc[RoundProgIndex]));
        // End:0x1E8
        if((RoundInfo.Grade[RoundProgIndex] == 910) || RoundInfo.Grade[RoundProgIndex] == 911)
        {
            Count = RoundInfo.Unit[RoundProgIndex];
            i = 0;
            J0x161:

            // End:0x1E5 [Loop If]
            if(i < Count)
            {
                wFBot = Class'WGame.wFlyingDefenceBot'.static.CallFlyingDefenceBot(Level, 1, RoundInfo.Grade[RoundProgIndex], 0);
                // End:0x1AB
                if(wFBot == none)
                {
                    // [Explicit Break]
                    goto J0x1E5;
                }
                wFlyingDefenceBotController(wFBot.Controller).__OnDisappear__Delegate = OnFlyingDefenceBotDisappear;
                ++AddBotCount;
                ++NumBots;
                ++i;
                // [Loop Continue]
                goto J0x161;
            }
            J0x1E5:
            
        }
        else
        {
            switch(RoundInfo.Grade[RoundProgIndex])
            {
                // End:0x202
                case 901:
                // End:0x228
                case 902:
                    strBotPawnCalss = "WGame.wAIDefenceBot";
                    // End:0x2D5
                    break;
                // End:0x230
                case 903:
                // End:0x238
                case 904:
                // End:0x240
                case 905:
                // End:0x26C
                case 906:
                    strBotPawnCalss = "WGame.wAIDefenceBot_Gamma";
                    // End:0x2D5
                    break;
                // End:0x274
                case 907:
                // End:0x27C
                case 908:
                // End:0x2A6
                case 909:
                    strBotPawnCalss = "WGame.wAIDefenceBot_Eta";
                    // End:0x2D5
                    break;
                // End:0x2D2
                case 912:
                    strBotPawnCalss = "WGame.wAIDefenceBot_Omega";
                    // End:0x2D5
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            AddwAIBot(string(RoundInfo.Unit[RoundProgIndex]), "1", strBotPawnCalss, string(RoundInfo.Grade[RoundProgIndex]), strBotID, string(RoundInfo.RegenLoc[RoundProgIndex]));
            AddBotCount += RoundInfo.Unit[RoundProgIndex];
        }
        Log((("[wDefenceGameInfo::BalanceBots] AddBotCount=" $ string(AddBotCount)) $ ", NumBots=") $ string(NumBots));
        ++RoundProgIndex;
        // [Loop Continue]
        goto J0x48;
    }
    J0x38F:

    //return;    
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
    if((Player != none) && Player.PlayerReplicationInfo != none)
    {
        // End:0x69
        if(Player.PlayerReplicationInfo.Team != none)
        {
            Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);            
        }
        else
        {
            Team = inTeam;
        }        
    }
    else
    {
        Team = inTeam;
    }
    Team = byte(float(byte(int(Team) + int(CurrentAttackingTeam))) % float(2));
    Bot = wAIBotBase(Player);
    lp1 = 0;
    J0xBB:

    // End:0x17E [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_Defence(EveryPlayerStarts[lp1]);
        // End:0x174
        if(((int(S.eTeamType) == int(Team)) && !IsRespawnPointFailedRecently(S)) && !IsAnyPawnWithinRadius(S))
        {
            // End:0x162
            if(Bot != none)
            {
                // End:0x15F
                if(Bot.RegenLoc == S.RegenLoc)
                {
                    candidates[candidates.Length] = S;
                }
                // [Explicit Continue]
                goto J0x174;
            }
            candidates[candidates.Length] = S;
        }
        J0x174:

        lp1++;
        // [Loop Continue]
        goto J0xBB;
    }
    Log("length=" $ string(candidates.Length));
    // End:0x2EC
    if(candidates.Length != 0)
    {
        S = candidates[Rand(candidates.Length)];
        respawn = S;
        // End:0x24A
        if(Bot == none)
        {
            Log((((("[FindPlayerStart] trying" @ string(S.Name)) @ "type=") $ string(GetEnum(Enum'Core.Object.ESpawnTeam', int(S.eTeamType)))) $ ",respawn.RegenLoc=") $ string(S.RegenLoc));            
        }
        else
        {
            Log((((((("[FindPlayerStart] trying" @ string(S.Name)) @ "type=") $ string(GetEnum(Enum'Core.Object.ESpawnTeam', int(S.eTeamType)))) $ ",respawn.RegenLoc=") $ string(S.RegenLoc)) $ ",Bot.RegenLoc=") $ string(Bot.RegenLoc));
        }
    }
    return respawn;
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    super.BeginRound(bNoReset);
    InitRoundInfo();
    Level.GameMgr.GetDefenceGamePrams2(GameLevel, MapID, int(CurrentRound), RoundInfo.DelayTime, RoundInfo.RegenLoc, RoundInfo.Grade, RoundInfo.Unit);
    SetRoundInfo();
    Log((((((((("[wDefenceGameInfo::BeginRound] Level=" $ string(GameLevel)) $ ", MapID=") $ string(MapID)) $ ", CurrentRound=") $ string(CurrentRound)) $ ", IndexCount=") $ string(RoundInfo.DelayTime.Length)) $ ", MaxUnitNum=") $ string(MaxUnitNum));
    //return;    
}

function ResetLevel(optional bool hiddenAll)
{
    // End:0x1A
    if(int(CurrentRound) < 2)
    {
        super.ResetLevel(hiddenAll);
    }
    //return;    
}

function DestoryPawns()
{
    // End:0x14
    if(int(CurrentRound) < 2)
    {
        super.DestoryPawns();
    }
    //return;    
}

function ProcessRespawn()
{
    // End:0x14
    if(int(CurrentRound) < 2)
    {
        super.ProcessRespawn();
    }
    //return;    
}

function BeginWaitingForStart()
{
    local Controller C;

    // End:0x16
    if(int(CurrentRound) < 2)
    {
        super(GameInfo).BeginWaitingForStart();
        return;
    }
    C = Level.ControllerList;
    J0x2A:

    // End:0xB3 [Loop If]
    if(C != none)
    {
        // End:0x60
        if(Vehicle(C.Pawn) == none)
        {
            C.ClientOnBeginRound();            
        }
        else
        {
            // End:0x9C
            if(PlayerController(C).myHUD != none)
            {
                PlayerController(C).myHUD.CallEvent(, 1002);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

function ProcessEndGame()
{
    //return;    
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local PlayerController PC;
    local Controller C;

    // End:0x35
    if(Teams[0].Score >= float(ScoreLimit))
    {
        GameReplicationInfo.Winner = Teams[0];        
    }
    else
    {
        GameReplicationInfo.Winner = Teams[1];
    }
    C = Level.ControllerList;
    J0x5F:

    // End:0x12B [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x114
        if(PC != none)
        {
            // End:0xC7
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
            // End:0x114
            if(PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner)
            {
                PC.ReceiveMessage_QuestType3(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_MatchEndInBotMode);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x5F;
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
    //return;    
}

function bool CheckLives(PlayerReplicationInfo Scorer)
{
    return false;
    //return;    
}

function CheckLastMan(int TeamIndex)
{
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local Controller C;
    local PlayerController P;

    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0xA0
    if(int(RoundEndReason) == int(1))
    {
        C = Level.ControllerList;
        J0x39:

        // End:0xA0 [Loop If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x89
            if(P != none)
            {
                P.ReceiveMessage_QuestType4(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_RoundEndInBotMode,, int(CurrentRound));
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x39;
        }
    }
    //return;    
}

function bool IsRoundLimitReached()
{
    Log((("[wDefenceGameInfo::IsRoundLimitReached] Health=" $ string(DefenceObject.Health)) $ ", Score = ") $ string(Teams[0].Score));
    return (Teams[0].Score >= float(ScoreLimit)) || DefenceObject.Health < float(1);
    //return;    
}

function SetRoundWinner(int WinningTeam)
{
    // End:0x7E
    if(WinningTeam == 1)
    {
        Teams[WinningTeam].Score = Teams[0].Score + float(1);
        Teams[WinningTeam].NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(WinningTeam, 1.0000000, "Round Winner");        
    }
    else
    {
        super.SetRoundWinner(WinningTeam);
    }
    //return;    
}

function RestartPlayer(Controller aPlayer)
{
    super.RestartPlayer(aPlayer);
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAIBotBase Bot;
    local wFlyingDefenceBotController FBot;
    local wAIPawn BotPawn;

    BotPawn = wAIPawn(KilledPawn);
    // End:0x2A
    if(Killer != Killed)
    {
        SpwanBotProjectile(BotPawn);
    }
    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    // End:0x5F
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
    // End:0xAD
    if(FBot != none)
    {
        --NumBots;
        ++DeadBotCount;        
    }
    else
    {
        // End:0xE3
        if(Bot != none)
        {
            Level.AILevel.KillBot(Bot);
            --NumBots;
            ++DeadBotCount;
        }
    }
    // End:0x125
    if(bestScore < int(Killer.PlayerReplicationInfo.Score))
    {
        bestScore = int(Killer.PlayerReplicationInfo.Score);
    }
    //return;    
}

function SpwanBotProjectile(wAIPawn Bot)
{
    local Inventory Inv;
    local wWeapon Weapon;
    local wProjectile proj;
    local int Count;

    // End:0x23
    if((Bot == none) || Bot.Inventory == none)
    {
        return;
    }
    Inv = Bot.Inventory;
    J0x37:

    // End:0xB1 [Loop If]
    if(Inv != none)
    {
        // End:0x82
        if((int(Inv.InventoryGroup) == 4) && Inv.IsA('wWeapon'))
        {
            Weapon = wWeapon(Inv);
            // [Explicit Break]
            goto J0xB1;
        }
        Count++;
        // End:0x9A
        if(Count > 1000)
        {
            return;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x37;
    }
    J0xB1:

    // End:0xBE
    if(Weapon == none)
    {
        return;
    }
    proj = Weapon.Spawn(Class'WWeapons.wGrenade',,, Bot.Location);
    proj.fGravMass = Weapon.BaseParams.fBulletGravity;
    // End:0x17B
    if(((Bot.Controller != none) && Bot.Controller.SkillBase != none) && Bot.Controller.SkillBase.bIncExplosion == true)
    {
        proj.bIncExplosion = true;        
    }
    else
    {
        proj.bIncExplosion = false;
    }
    proj.iWeaponID = Weapon.BaseParams.iWeaponID;
    //return;    
}

function ObjectiveDisabled(GameObjective DisabledObjective)
{
    Spawn(Class'Engine.wC4Explosive',,, DefenceObject.Location);
    //return;    
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
    //return;    
}

function OnFlyingDefenceBotDisappear(wFlyingDefenceBotController FlyingBot)
{
    TakeDamageToDefenceObject(int(FlyingBot.NPCParam.DamageRate), FlyingBot.Pawn);
    //return;    
}

function TakeDamageToDefenceObject(int Damage, Pawn Instigator)
{
    --NumBots;
    ++DeadBotCount;
    DefenceObject.TakeDamage(Damage, Instigator, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
    //return;    
}

function bool ProcessSwitchTeam(bool bNoReset)
{
    return false;
    //return;    
}

function bool NeedPlayers()
{
    return false;
    //return;    
}

function AnnounceMatchInfo()
{
    local Controller C;
    local Sound startSound;

    startSound = Sound(DynamicLoadObject(string(sndModeName), Class'Engine.Sound'));
    C = Level.ControllerList;
    J0x31:

    // End:0x80 [Loop If]
    if(C != none)
    {
        // End:0x69
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).ClientPlaySound(startSound);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

exec function DefenceWin()
{
    NumBots = 0;
    CurrentRound = byte(ScoreLimit);
    Teams[0].Score = float(ScoreLimit);
    EndRound(1, none, "Player Win !!!");
    //return;    
}

exec function DefencePass()
{
    local wAIDefencePawn P;

    // End:0x1C
    foreach DynamicActors(Class'WGame.wAIDefencePawn', P)
    {
        OnObjectTouch(P);        
    }    
    DefenceObject.Health = 999.0000000;
    EndRound(1, none, "Player Win !!!");
    //return;    
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
        // End:0xF3
        if(DeadBotCount >= MaxUnitNum)
        {
            EndRound(1, none, "Player Win !!!");
            Log((("[wDefenceGameInfo::ProcessEndRound2] DeadBotCount :" $ string(DeadBotCount)) $ ", MaxUnitNum") $ string(MaxUnitNum));
            return;
        }
        // End:0x3EA
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // End:0x1CE
            if(NumBots == 0)
            {
                EndRound(1, none, "Player Win !!!");
                Log((((((((("[wDefenceGameInfo::ProcessEndRound3] Round=" $ string(CurrentRound)) $ ", ProgIdx=") $ string(RoundProgIndex)) $ ", MaxUnitNum=") $ string(MaxUnitNum)) $ ", DeadBotCount=") $ string(DeadBotCount)) $ ", AddCount=") $ string(AddBotCount));
                return;                
            }
            else
            {
                // End:0x1FE
                if((RoundStartTime - RemainingTime) < (RoundInfo.DelayTime[RoundInfo.DelayTime.Length - 1] + 60))
                {
                    return;
                }
                AILevel = wAILevel(Level.AILevel);
                i = 0;
                J0x21E:

                // End:0x3EA [Loop If]
                if(i < AILevel.Bots.Length)
                {
                    // End:0x2DF
                    if(AILevel.Bots[i].Pawn == none)
                    {
                        Log("[wDefenceGameInfo::ProcessEndRound] Wrong Bot :" $ string(AILevel.Bots[i]));
                        Level.AILevel.KillBot(AILevel.Bots[i]);
                        --NumBots;
                        ++DeadBotCount;
                    }
                    // End:0x3E0
                    if(AILevel.Bots[i].MoveTimer < float(-30))
                    {
                        Log((("[wDefenceGameInfo::ProcessEndRound] Wrong Bot :" $ string(AILevel.Bots[i])) $ ", MoveTimer:") $ string(AILevel.Bots[i].MoveTimer));
                        // End:0x3A6
                        if(wAIDefenceBot_Omega(AILevel.Bots[i]) != none)
                        {
                            // [Explicit Continue]
                            goto J0x3E0;
                        }
                        Level.AILevel.KillBot(AILevel.Bots[i]);
                        --NumBots;
                        ++DeadBotCount;
                    }
                    J0x3E0:

                    ++i;
                    // [Loop Continue]
                    goto J0x21E;
                }
            }
        }
        //return;        
    }
    stop;    
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
        // End:0x7C
        if(GameReplicationInfo.Winner == Teams[0])
        {
            UpdateBestScorePlayer();
        }
        //return;        
    }

    function UpdateBestScorePlayer()
    {
        local int lp1;
        local Controller C;
        local PlayerController PC;
        local array<PlayerController> PCArray;

        C = Level.ControllerList;
        J0x14:

        // End:0x99 [Loop If]
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
            // [Loop Continue]
            goto J0x14;
        }
        lp1 = 0;
        J0xA0:

        // End:0xE3 [Loop If]
        if(lp1 < PCArray.Length)
        {
            PCArray[lp1].ReceiveMessage_QuestType3(Class'Engine.wMessage_Quest', Class'Engine.wMessage_Quest'.default.Code_Quest_BestScoreInBotMode);
            ++lp1;
            // [Loop Continue]
            goto J0xA0;
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    GiveBotsFakeUID=true
    DefaultMaxLives=0
    sndModeName="Warfare_Sound_Defense_Mode.ui.Missionstart"
    bSendBot=false
    ScoreBoardType="XInterface.xScoreBoardDefenceGame"
    HUDType="wMission.wHUD_Defence"
    PlayerControllerClassName="WGame.wDefenceController"
    bHasRespawnRestriction=false
}