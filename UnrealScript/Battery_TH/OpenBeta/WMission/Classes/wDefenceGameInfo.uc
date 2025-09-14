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
var int DefenceObjHealth;
var int AddBotCount;
var int DeadBotCount;
var int MaxUnitNum;
var int MapID;
var int RoundProgIndex;
var array<int> BotGradeList;
var wDefenceObjective DefenceObject;

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    // End:0x5E
    if(npcActions.GotoFlag)
    {
        Actions[Actions.Length] = wAction_GotoFlag(wAILevel(Level.AILevel).PoolAction.AllocateObject(Class'WGame.wAction_GotoFlag')).Init(DefenceObject);
    }
    //return;    
}

function InitGameReplicationInfo()
{
    super.InitGameReplicationInfo();
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
    local wMapInfo mapInfo;
    local wDefenceObjective DObject;

    super.PostBeginPlay();
    // End:0x36
    foreach DynamicActors(Class'WMission_Decompressed.wDefenceObjective', DObject)
    {
        DefenceObject = DObject;
        DefenceObject.__OnTouch__Delegate = OnFlagTouch;        
    }    
    mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    MapID = mapInfo.MapID;
    ScoreLimit = Level.GameMgr.GetDefenceGameRoundCount(MapID);
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    super(wTeamGame).PostLogin(NewPlayer);
    NewPlayer.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = true;
    //return;    
}

function BalanceBots()
{
    local int elapsed, i, idx, Count;
    local wFlyingDefenceBot wFBot;
    local string strBotPawnCalss;

    elapsed = RoundStartTime - RemainingTime;
    Log("[wDefenceGameInfo::BalanceBots] elapsed =" $ string(elapsed));
    J0x48:

    // End:0x38D [Loop If]
    if(true)
    {
        // End:0x64
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // [Explicit Break]
            goto J0x38D;
        }
        // End:0x81
        if(elapsed < RoundInfo.DelayTime[RoundProgIndex])
        {
            // [Explicit Break]
            goto J0x38D;
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
                case 9003:
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
            AddwAIBot(string(RoundInfo.Unit[RoundProgIndex]), "1", strBotPawnCalss, string(RoundInfo.Grade[RoundProgIndex]), "0", string(RoundInfo.RegenLoc[RoundProgIndex]));
            AddBotCount += RoundInfo.Unit[RoundProgIndex];
        }
        Log((("[wDefenceGameInfo::BalanceBots] AddBotCount=" $ string(AddBotCount)) $ ", NumBots=") $ string(NumBots));
        ++RoundProgIndex;
        // [Loop Continue]
        goto J0x48;
    }
    J0x38D:

    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local byte Team;
    local int lp1;
    local wMSGameReplicationInfo MSGRI;
    local wAIBotBase Bot;
    local PlayerStart_Defence S;
    local NavigationPoint respawn;
    local array<PlayerStart_Defence> candidates;

    MSGRI = wMSGameReplicationInfo(GameReplicationInfo);
    // End:0x87
    if((Player != none) && Player.PlayerReplicationInfo != none)
    {
        // End:0x79
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
    J0xCB:

    // End:0x18E [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_Defence(EveryPlayerStarts[lp1]);
        // End:0x184
        if(((int(S.eTeamType) == int(Team)) && !IsRespawnPointFailedRecently(S)) && !IsAnyPawnWithinRadius(S))
        {
            // End:0x172
            if(Bot != none)
            {
                // End:0x16F
                if(Bot.RegenLoc == S.RegenLoc)
                {
                    candidates[candidates.Length] = S;
                }
                // [Explicit Continue]
                goto J0x184;
            }
            candidates[candidates.Length] = S;
        }
        J0x184:

        lp1++;
        // [Loop Continue]
        goto J0xCB;
    }
    Log("length=" $ string(candidates.Length));
    // End:0x270
    if(candidates.Length != 0)
    {
        S = candidates[Rand(candidates.Length)];
        respawn = S;
        Log((((((("[FindPlayerStart] trying" @ string(S.Name)) @ "type=") $ string(GetEnum(Enum'Core.Object.ESpawnTeam', int(S.eTeamType)))) $ ",respawn.RegenLoc=") $ string(S.RegenLoc)) $ ",Bot.RegenLoc=") $ string(Bot.RegenLoc));
    }
    return respawn;
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    local int i;
    local PlayerController PC;

    super.BeginRound(bNoReset);
    InitRoundInfo();
    Level.GameMgr.GetDefenceGamePrams(MapID, int(CurrentRound), RoundInfo.DelayTime, RoundInfo.RegenLoc, RoundInfo.Grade, RoundInfo.Unit);
    SetRoundInfo();
    Log((((((("[wDefenceGameInfo::BeginRound] MapID=" $ string(MapID)) $ ", CurrentRound=") $ string(CurrentRound)) $ ", IndexCount=") $ string(RoundInfo.DelayTime.Length)) $ ", MaxUnitNum=") $ string(MaxUnitNum));
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

    // End:0x5B [Loop If]
    if(C != none)
    {
        C.ClientOnBeginRound();
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
    if(Teams[0].Score == float(ScoreLimit))
    {
        GameReplicationInfo.Winner = Teams[0];        
    }
    else
    {
        GameReplicationInfo.Winner = Teams[1];
    }
    C = Level.ControllerList;
    J0x5F:

    // End:0xDE [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0xC7
        if(PC != none)
        {
            // End:0xC7
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = PC.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
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

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
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
            NumBots--;
            DeadBotCount++;
        }
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
    local int i;

    Spawn(Class'Engine.wC4Explosive',,, DefenceObject.Location);
    //return;    
}

function OnFlagTouch(Actor Other)
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
        // End:0xDD
        if(DeadBotCount >= MaxUnitNum)
        {
            EndRound(1, none, "Player Win !!!");
            Log("[wDefenceGameInfo::ProcessEndRound2] DeadBotCount >= nBotMaxNum");
            return;
        }
        // End:0x2DA
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // End:0x1B8
            if(NumBots == 0)
            {
                EndRound(1, none, "Player Win !!!");
                Log((((((((("[wDefenceGameInfo::ProcessEndRound3] Round=" $ string(CurrentRound)) $ ", ProgIdx=") $ string(RoundProgIndex)) $ ", MaxUnitNum=") $ string(MaxUnitNum)) $ ", DeadBotCount=") $ string(DeadBotCount)) $ ", AddCount=") $ string(AddBotCount));
                return;                
            }
            else
            {
                // End:0x1E8
                if((RoundStartTime - RemainingTime) < (RoundInfo.DelayTime[RoundInfo.DelayTime.Length - 1] + 5))
                {
                    return;
                }
                AILevel = wAILevel(Level.AILevel);
                i = 0;
                J0x208:

                // End:0x250 [Loop If]
                if(i < AILevel.Bots.Length)
                {
                    // End:0x246
                    if(AILevel.Bots[i].Pawn != none)
                    {
                        return;
                    }
                    ++i;
                    // [Loop Continue]
                    goto J0x208;
                }
                // End:0x267
                if(Level.Helicopters.Length > 0)
                {
                    return;
                }
                Log("[wDefenceGameInfo::ProcessEndRound] None BotPawn Num : " $ string(AILevel.Bots.Length));
                AILevel.KillBots(AILevel.Bots.Length);
                NumBots = 0;
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    GiveBotsFakeUID=true
    DefaultMaxLives=0
    bSendBot=false
    HUDType="wMission.wHUD_Defence"
    bHasRespawnRestriction=false
}