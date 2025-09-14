class wNDFGameInfo extends wDefenceGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct stItemInfo
{
    var int nBuyItemID;
    var int nBuyItemPrice;
    var byte nBuyItemIndex;
    var byte nBuyEnableLevel;
};

var array<wFlagObjectiveBase> Flags;
var array<Decoration> DefenceBarricades;
var Decoration NuclearBarricade;
var wFlagObjectiveBase NuclearFlag;
var bool bFixedNumBots;
var int iEnableNumBots;
var stItemInfo myShopInfo[6];

function GetGameSpecificActions(Controller C, wNPCActions npcActions, out array<Object> Actions)
{
    local float fDist, fReachRadius;
    local bool bSellectFlag;
    local wAIBotBase lOwner, Other;
    local wAIDefencePawn dPawn;
    local wAILevel AILevel;
    local wFlagObjectiveBase BestFlag;
    local int lp1;

    // End:0x283
    if(C.Pawn != none)
    {
        lOwner = wAIBot(C);
        AILevel = wAILevel(Level.AILevel);
        dPawn = wAIDefencePawn(lOwner.Pawn);
        BestFlag = GetSellectedFlag(lOwner, dPawn);
        fDist = VSize(BestFlag.Location - dPawn.Location);
        fReachRadius = BestFlag.ReachRadius + dPawn.CollisionRadius;
        // End:0x15C
        if(((npcActions.GotoFlag && !lOwner.IsStopAction) && !lOwner.IsStopGotoFlag1) && !lOwner.IsStopGotoFlag2)
        {
            // End:0x15C
            if(fDist > fReachRadius)
            {
                Actions[Actions.Length] = wAction_GotoFlag(AILevel.PoolAction.AllocateObject(Class'WGame.wAction_GotoFlag')).Init(BestFlag, fReachRadius);
            }
        }
        // End:0x222
        if(npcActions.RemoveBarricade && !lOwner.IsStopAction)
        {
            // End:0x222
            if(fDist <= fReachRadius)
            {
                // End:0x222
                if((wDefenceObjective(BestFlag).OwnerBarricade != none) && false == wDefenceObjective(BestFlag).OwnerBarricade.bHidden)
                {
                    Actions[Actions.Length] = wAction_RemoveBarricade(AILevel.PoolAction.AllocateObject(Class'WGame.wAction_RemoveBarricade')).Init(wDefenceObjective(BestFlag).OwnerBarricade, BestFlag);
                }
            }
        }
        // End:0x283
        if(npcActions.ApproachTarget && !lOwner.IsStopAction)
        {
            Actions[Actions.Length] = wAction_ApproachTarget(AILevel.PoolAction.AllocateObject(Class'WGame.wAction_ApproachTarget')).Init();
        }
    }
    //return;    
}

function wFlagObjectiveBase GetSellectedFlag(wAIBotBase lOwner, wAIDefencePawn dPawn)
{
    local int lp1, lp2, ownerTeam, bestScore, iBotCnt, iBotCnt2;

    local wAIBotBase Other;
    local wAILevel AILevel;
    local wFlagObjectiveBase curFlag, BestFlag;
    local array<float> distsToFlag, distBarricade;
    local array<int> distRanks, distBRanks, Scores;
    local wDefenceObjective tempFlag;

    ownerTeam = lOwner.GetTeamNum();
    AILevel = wAILevel(Level.AILevel);
    lp1 = 0;
    J0x35:

    // End:0x8E [Loop If]
    if(lp1 < Flags.Length)
    {
        distsToFlag[lp1] = VSize(dPawn.Location - Flags[lp1].Location);
        distRanks[lp1] = 0;
        lp1++;
        // [Loop Continue]
        goto J0x35;
    }
    lp1 = 0;
    J0x95:

    // End:0x19D [Loop If]
    if(lp1 < Flags.Length)
    {
        lp2 = lp1 + 1;
        J0xB3:

        // End:0x193 [Loop If]
        if(lp2 < Flags.Length)
        {
            // End:0xEE
            if(distsToFlag[lp1] > distsToFlag[lp2])
            {
                distRanks[lp1]++;                
            }
            else
            {
                distRanks[lp2]++;
            }
            // End:0x142
            if(wDefenceObjective(Flags[lp1]).AttackerCnt > wDefenceObjective(Flags[lp2]).AttackerCnt)
            {
                distRanks[lp1]++;
                // [Explicit Continue]
                goto J0x189;
            }
            // End:0x189
            if(wDefenceObjective(Flags[lp1]).AttackerCnt < wDefenceObjective(Flags[lp2]).AttackerCnt)
            {
                distRanks[lp2]++;
                // [Explicit Continue]
            }
            J0x189:

            lp2++;
            // [Loop Continue]
            goto J0xB3;
        }
        lp1++;
        // [Loop Continue]
        goto J0x95;
    }
    bestScore = -99999;
    lp1 = 0;
    J0x1AF:

    // End:0x2B8 [Loop If]
    if(lp1 < Flags.Length)
    {
        tempFlag = wDefenceObjective(Flags[lp1]);
        // End:0x1E3
        if(none == tempFlag)
        {
            // [Explicit Continue]
            goto J0x2AE;
        }
        // End:0x246
        if(((tempFlag != none) && tempFlag.OwnerBarricade != none) && tempFlag.OwnerBarricade.bHidden)
        {
            Scores[lp1] = -99999;
            tempFlag.bDisabled = true;
            // [Explicit Continue]
            goto J0x2AE;
        }
        curFlag = Flags[lp1];
        Scores[lp1] = -distRanks[lp1] * distRanks[lp1];
        // End:0x2AE
        if(bestScore < Scores[lp1])
        {
            bestScore = Scores[lp1];
            BestFlag = curFlag;
        }
        J0x2AE:

        lp1++;
        // [Loop Continue]
        goto J0x1AF;
    }
    // End:0x2D1
    if(BestFlag == none)
    {
        BestFlag = DefenceObject;        
    }
    // End:0x3A2
    if(wAIDefencePawn(lOwner.Pawn) != none)
    {
        // End:0x38E
        if(wDefenceObjective(dPawn.AttackFlag) != wDefenceObjective(BestFlag))
        {
            // End:0x362
            if((dPawn.AttackFlag != none) && wDefenceObjective(dPawn.AttackFlag).AttackerCnt > 0)
            {
                wDefenceObjective(dPawn.AttackFlag).AttackerCnt--;
            }
            dPawn.AttackFlag = BestFlag;
            wDefenceObjective(BestFlag).AttackerCnt++;            
        }
        else
        {
            BestFlag = dPawn.AttackFlag;
        }
    }
    return BestFlag;
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = Class'WGame.wPurposeExplore'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = Class'WGame.wPurposeAttackTarget'.static.Create(wAIBot(Owner));
    //return;    
}

function UpdatePositionLog()
{
    //return;    
}

function InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
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
    iNumBotsWave = 0;
    iProgressWave = 0;
    fWaveStartTime = 0.0000000;
    fWaveEndTime = 0.0000000;
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
    local wDefenceObjective flag, DObject;
    local wMatchMaker MM;
    local Decoration Deco;

    super.PostBeginPlay();
    Flags.Length = 0;
    Level.AttackFlag.Length = 0;
    DefenceBarricades.Length = 0;
    // End:0x8F
    foreach DynamicActors(Class'WMission_Decompressed.wDefenceObjective', flag)
    {
        Flags[Flags.Length] = flag;
        Level.AttackFlag[Level.AttackFlag.Length] = flag;
        // End:0x8E
        if(!flag.IsA('wAttackObjective'))
        {
            NuclearFlag = flag;
        }        
    }    
    DefenceBarricades.Length = 0;
    // End:0xFE
    foreach DynamicActors(Class'Engine.Decoration', Deco)
    {
        DefenceBarricades[DefenceBarricades.Length] = Deco;
        // End:0xFD
        if((wDefenceObjective(NuclearFlag) != none) && wDefenceObjective(NuclearFlag).Barricade == Deco.Tag)
        {
            NuclearBarricade = Deco;
        }        
    }    
    Level.GRI.GoalScore = self.ScoreLimit;
    //return;    
}

function Actor GetNuclearReactor()
{
    return NuclearBarricade;
    //return;    
}

function bool IsEnableRepair()
{
    local bool bEnable;

    bEnable = NuclearBarricade.Health > 0;
    bEnable = bEnable && NuclearBarricade.Health < NuclearBarricade.MaxHealth;
    return bEnable;
    //return;    
}

function bool SetRepairNuclear(int iValue)
{
    Log((((string(self) $ " [SetRepairNuclear] Health Current: ") $ string(NuclearBarricade.Health)) $ " +iValue:") $ string(iValue));
    NuclearBarricade.Health += iValue;
    // End:0xA8
    if(NuclearBarricade.Health > NuclearBarricade.MaxHealth)
    {
        NuclearBarricade.Health = NuclearBarricade.MaxHealth;
    }
    Log((string(self) $ " [SetRepairNuclear] Health Result : ") $ string(NuclearBarricade.Health));
    return true;
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    super.PostLogin(NewPlayer);
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
    local bool bFlyingBots, bBossBot;

    elapsed = RoundStartTime - RemainingTime;
    Log("[wNDFGameInfo::BalanceBots] elapsed =" $ string(elapsed));
    // End:0x64
    if(iProgressWave > 0)
    {
        fWaveTime = fWaveEndTime - fWaveStartTime;        
    }
    else
    {
        fWaveTime = 0.0000000;
    }
    J0x6F:

    // End:0x2E2 [Loop If]
    if(true)
    {
        // End:0x8B
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // [Explicit Break]
            goto J0x2E2;
        }
        // End:0xB3
        if(float(elapsed) < (float(RoundInfo.DelayTime[RoundProgIndex]) + fWaveTime))
        {
            // [Explicit Break]
            goto J0x2E2;
        }
        // End:0xC1
        if(iNumBotsWave > 0)
        {
            // [Explicit Break]
            goto J0x2E2;
        }
        bFlyingBots = false;
        switch(RoundInfo.Grade[RoundProgIndex])
        {
            // End:0xE3
            case 901:
            // End:0x10F
            case 902:
                strBotPawnCalss = "WGame.wAIDefenceBot_Alpha";
                // End:0x259
                break;
            // End:0x117
            case 903:
            // End:0x11F
            case 904:
            // End:0x127
            case 905:
            // End:0x13A
            case 906:
                bFlyingBots = true;
                // End:0x259
                break;
            // End:0x142
            case 910:
            // End:0x155
            case 911:
                bFlyingBots = true;
                // End:0x259
                break;
            // End:0x17F
            case 907:
                strBotPawnCalss = "WGame.wAIDefenceBot_Eta";
                // End:0x259
                break;
            // End:0x187
            case 908:
            // End:0x1B3
            case 909:
                strBotPawnCalss = "WGame.wAIDefenceBot_Theta";
                // End:0x259
                break;
            // End:0x1DF
            case 912:
                strBotPawnCalss = "WGame.wAIDefenceBot_Omega";
                // End:0x259
                break;
            // End:0x1E7
            case 913:
            // End:0x213
            case 914:
                strBotPawnCalss = "WGame.wAIDefenceBot_Alien";
                // End:0x259
                break;
            // End:0x226
            case 915:
                bBossBot = true;
                // End:0x259
                break;
            // End:0x22A
            case 1:
            // End:0x22F
            case 2:
            // End:0x237
            case 1001:
            // End:0x256
            case 1002:
                strBotPawnCalss = "WGame.wAIBot";
                // End:0x259
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x270
        if(bFlyingBots)
        {
            CallFlyingBot(RoundProgIndex);            
        }
        else
        {
            // End:0x287
            if(bBossBot)
            {
                CallBossBot(RoundProgIndex);                
            }
            else
            {
                CallAIDefencePawn(RoundProgIndex);
            }
        }
        ++RoundProgIndex;
        // End:0x2DF
        if(bFixedNumBots && NumBots >= iEnableNumBots)
        {
            iNumBotsWave = NumBots;
            fWaveStartTime = float(elapsed);
            fWaveEndTime = float(elapsed);
            ++iProgressWave;
        }
        // [Loop Continue]
        goto J0x6F;
    }
    J0x2E2:

    Log((((("End BalanceBots AddBotCount=" $ string(AddBotCount)) $ " BotNums=") $ string(NumBots)) $ " RoundProgIndex=") $ string(RoundProgIndex));
    //return;    
}

function bool SameTeam(Controller A, Controller B)
{
    // End:0x1A
    if((A == none) || B == none)
    {
        return false;
    }
    // End:0x75
    if((A.Pawn != none) && B.Pawn != none)
    {
        return A.Pawn.TeamIndex == B.Pawn.TeamIndex;
    }
    return A.PlayerReplicationInfo.Team.TeamIndex == B.PlayerReplicationInfo.Team.TeamIndex;
    //return;    
}

function CallAIDefencePawn(int InRoundProgIndex)
{
    local int i, Count;
    local wAIDefencePawn wBot;
    local NavigationPoint respawn;
    local Class<wAIDefencePawn> respawnPawn;

    Count = RoundInfo.Unit[InRoundProgIndex];
    i = 0;
    J0x1D:

    // End:0x2E4 [Loop If]
    if(i < Count)
    {
        respawn = FindDefencePawnStart(RoundInfo.RegenLoc[InRoundProgIndex], 1);
        // End:0x81
        if(respawn == none)
        {
            Log("[CallAIDefencePawn] respawnPoint=none");
            // [Explicit Continue]
            goto J0x2DA;
        }
        switch(RoundInfo.Grade[InRoundProgIndex])
        {
            // End:0x9B
            case 901:
            // End:0xDC
            case 902:
                wBot = Class'WGame.wAIDefencePawn'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0xE4
            case 903:
            // End:0xEC
            case 904:
            // End:0xF4
            case 905:
            // End:0x135
            case 906:
                wBot = Class'WGame.wAIDefencePawn_Gamma'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0x13D
            case 910:
            // End:0x148
            case 911:
                // End:0x25F
                break;
            // End:0x189
            case 907:
                wBot = Class'WGame.wAIDefencePawn_Eta'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0x191
            case 908:
            // End:0x1D2
            case 909:
                wBot = Class'WGame.wAIDefencePawn_Theta'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0x213
            case 912:
                wBot = Class'WGame.wAIDefencePawn_Omega'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0x21B
            case 913:
            // End:0x25C
            case 914:
                wBot = Class'WGame.wAIDefencePawn_Alien'.static.Create(Level, respawn.Location, respawn.Rotation);
                // End:0x25F
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x298
        if(wBot == none)
        {
            Log("[CallAIDefencePawn] CallDefenceBot=none");
            // [Explicit Break]
            goto J0x2E4;
        }
        wBot.InitDefencePawn(Level, RoundInfo.Grade[InRoundProgIndex], RoundInfo.RegenLoc[InRoundProgIndex]);
        ++AddBotCount;
        ++NumBots;
        J0x2DA:

        ++i;
        // [Loop Continue]
        goto J0x1D;
    }
    J0x2E4:

    //return;    
}

function NavigationPoint FindDefencePawnStart(int iRegenLoc, byte inTeam)
{
    local byte Team;
    local int lp1;
    local PlayerStart_Defence S;
    local NavigationPoint respawn;
    local array<PlayerStart_Defence> candidates;

    Team = byte(float(byte(int(inTeam) + int(CurrentAttackingTeam))) % float(2));
    lp1 = 0;
    J0x29:

    // End:0xC3 [Loop If]
    if(lp1 < EveryPlayerStarts.Length)
    {
        S = PlayerStart_Defence(EveryPlayerStarts[lp1]);
        // End:0xB9
        if(((int(S.eTeamType) == int(Team)) && !IsRespawnPointFailedRecently(S)) && !IsAnyPawnWithinRadius(S))
        {
            // End:0xB9
            if(iRegenLoc == S.RegenLoc)
            {
                candidates[candidates.Length] = S;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x29;
    }
    Log("length=" $ string(candidates.Length));
    // End:0x186
    if(candidates.Length != 0)
    {
        S = candidates[Rand(candidates.Length)];
        respawn = S;
        Log((((("[FindDefencePawnStart] trying" @ string(S.Name)) @ "type=") $ string(GetEnum(Enum'Core.Object.ESpawnTeam', int(S.eTeamType)))) $ ",respawn.RegenLoc=") $ string(S.RegenLoc));
    }
    return respawn;
    //return;    
}

function CallBossBot(int RoundProgIndex)
{
    local int i, Count;
    local wDefenceBoss wFBot;

    Count = RoundInfo.Unit[RoundProgIndex];
    i = 0;
    J0x1D:

    // End:0x8E [Loop If]
    if(i < Count)
    {
        wFBot = Class'WGame.wDefenceBoss'.static.Create(Level, 1, RoundInfo.Grade[RoundProgIndex], RoundInfo.RegenLoc[RoundProgIndex]);
        // End:0x76
        if(wFBot == none)
        {
            // [Explicit Break]
            goto J0x8E;
        }
        ++AddBotCount;
        ++NumBots;
        ++i;
        // [Loop Continue]
        goto J0x1D;
    }
    J0x8E:

    //return;    
}

function CallFlyingBot(int RoundProgIndex)
{
    local int i, Count;
    local wFlyingDefenceBot wFBot;

    Count = RoundInfo.Unit[RoundProgIndex];
    i = 0;
    J0x1D:

    // End:0xB0 [Loop If]
    if(i < Count)
    {
        wFBot = Class'WGame.wFlyingDefenceBot'.static.CallFlyingDefenceBot(Level, 1, RoundInfo.Grade[RoundProgIndex], RoundInfo.RegenLoc[RoundProgIndex]);
        // End:0x76
        if(wFBot == none)
        {
            // [Explicit Break]
            goto J0xB0;
        }
        wFlyingDefenceBotController(wFBot.Controller).__OnDisappear__Delegate = OnFlyingDefenceBotDisappear;
        ++AddBotCount;
        ++NumBots;
        ++i;
        // [Loop Continue]
        goto J0x1D;
    }
    J0xB0:

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

function bool AddBot(optional string botname)
{
    AddwAIBot("1", "1", "WGame.wAIBot", "1",, string((float(Rand(9999)) % float(3)) + float(1)));
    return true;
    //return;    
}

function BeginRound(optional bool bNoReset)
{
    super.BeginRound(bNoReset);
    bSentEndRound = false;
    // End:0x32
    if(int(CurrentRound) > 1)
    {
        QueueAnnouncerSound(sndBeginRound, 1, byte(255));
    }
    Log((((((((("[wNDFGameInfo::BeginRound] Level=" $ string(GameLevel)) $ ", MapID=") $ string(MapID)) $ ", CurrentRound=") $ string(CurrentRound)) $ ", IndexCount=") $ string(RoundInfo.DelayTime.Length)) $ ", MaxUnitNum=") $ string(MaxUnitNum));
    //return;    
}

function ResetLevel(optional bool hiddenAll)
{
    super.ResetLevel(hiddenAll);
    //return;    
}

function DestoryPawns()
{
    super.DestoryPawns();
    //return;    
}

function ProcessRespawn()
{
    super.ProcessRespawn();
    //return;    
}

function BeginWaitingForStart()
{
    super.BeginWaitingForStart();
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

function byte GetIsAIClear()
{
    local byte Result;

    // End:0x27
    if(Teams[0].Score >= float(ScoreLimit))
    {
        Result = 1;        
    }
    else
    {
        Result = 0;
    }
    return Result;
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

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x10
    if(CheckMaxLives(Scorer))
    {
        return;
    }
    // End:0x36
    if((GameRulesModifiers != none) && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    // End:0x50
    if(!bOverTime && GoalScore == 0)
    {
        return;
    }
    // End:0xB1
    if(((Scorer != none) && Scorer.Team != none) && Scorer.Team.Score >= float(GoalScore))
    {
        EndGame(Scorer, "teamscorelimit");
    }
    // End:0xDD
    if((Scorer != none) && bOverTime)
    {
        EndGame(Scorer, "timelimit");
    }
    //return;    
}

function EndRound(wMSGameInfo.ERER_Reason RoundEndReason, Pawn Instigator, string Reason)
{
    local Controller C;
    local PlayerController P;

    super.EndRound(RoundEndReason, Instigator, Reason);
    // End:0x3D
    if(!bSentEndRound)
    {
        ServerLogEndRound(RoundEndReason, Instigator, Reason);
        bSentEndRound = true;
    }
    //return;    
}

function bool IsRoundLimitReached()
{
    Log((("[wNDFGameInfo::IsRoundLimitReached] NuclearBarricade  Health=" $ string(NuclearBarricade.Health)) $ ", Score = ") $ string(Teams[0].Score));
    return (Teams[0].Score >= float(ScoreLimit)) || NuclearBarricade.Health < 1;
    //return;    
}

function SetRoundWinner(int WinningTeam)
{
    super.SetRoundWinner(WinningTeam);
    //return;    
}

function RestartPlayer(Controller aPlayer)
{
    super.RestartPlayer(aPlayer);
    //return;    
}

function int GetDefenceBotType(Controller C)
{
    // End:0x9E
    if((C != none) && wAIDefencePawn(C.Pawn) != none)
    {
        switch(wAIDefencePawn(C.Pawn).iNpcID)
        {
            // End:0x4E
            case 9001:
                return 1;
            // End:0x59
            case 9002:
                return 2;
            // End:0x64
            case 9007:
                return 3;
            // End:0x6F
            case 9008:
                return 4;
            // End:0x7A
            case 9009:
                return 5;
            // End:0x85
            case 9012:
                return 8;
            // End:0x90
            case 9013:
                return 9;
            // End:0x9B
            case 9014:
                return 10;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        // End:0x127
        if((C != none) && wFlyingDefenceBot(C.Pawn) != none)
        {
            switch(wFlyingDefenceBot(C.Pawn).iNpcID)
            {
                // End:0xED
                case 9003:
                    return 11;
                // End:0xF8
                case 9004:
                    return 12;
                // End:0x103
                case 9005:
                    return 13;
                // End:0x10E
                case 9006:
                    return 14;
                // End:0x119
                case 9010:
                    return 6;
                // End:0x124
                case 9011:
                    return 7;
                // End:0xFFFF
                default:
                    break;
                }
        }
        else
        {
            // End:0x150
            if((C != none) && wDefenceBoss(C.Pawn) != none)
            {
                return 15;
            }
            return 0;
            //return;            
        }
    }
}

function int GetOptionalDeathMessageInfo(Controller Killer, Controller Killed, int IsHeadShot, int IsEnableAim)
{
    local int TempSwitch, BotType;

    TempSwitch = super(GameInfo).GetOptionalDeathMessageInfo(Killer, Killed, IsHeadShot, IsEnableAim);
    TempSwitch = TempSwitch << 4;
    // End:0x83
    if((Killer.IsA('wAIDefenceBot') || Killer.IsA('wFlyingDefenceBotController')) || Killer.IsA('wDefenceBossController'))
    {
        BotType = GetDefenceBotType(Killer);        
    }
    else
    {
        // End:0xD4
        if((Killed.IsA('wAIDefenceBot') || Killed.IsA('wFlyingDefenceBotController')) || Killed.IsA('wDefenceBossController'))
        {
            BotType = GetDefenceBotType(Killed);
        }
    }
    TempSwitch = TempSwitch | BotType;
    return TempSwitch;
    //return;    
}

function ProcessDeathMessage(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x58
    if((Killed.IsA('wAIDefenceBot') && Killer.IsA('wAIDefenceBot')) || Killed.IsA('wFlyingDefenceBotController') && Killer.IsA('wFlyingDefenceBotController'))
    {
        return;
    }
    // End:0x6E
    if(Killed.IsA('wAISentryGunController'))
    {
        return;
    }
    // End:0x234
    if((Killed != none) && !DamageType.default.SkipDeathIncrement)
    {
        Killed.PlayerReplicationInfo.Deaths += float(1);
        Killed.PlayerReplicationInfo.NetUpdateTime = FMin(Killed.PlayerReplicationInfo.NetUpdateTime, Level.TimeSeconds + (0.3000000 * FRand()));
        BroadcastDeathMessage(Killer, Killed, DamageType, CollisionPart, WeaponType);
        // End:0x188
        if((Killer == Killed) || Killer == none)
        {
            // End:0x15B
            if(Killer == none)
            {
                KillEvent("K", none, Killed.PlayerReplicationInfo, DamageType);                
            }
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }            
        }
        else
        {
            // End:0x20A
            if((bTeamGame && Killer.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.Team == Killed.PlayerReplicationInfo.Team)
            {
                KillEvent("TK", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);                
            }
            else
            {
                KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
            }
        }
    }
    //return;    
}

function bool Killed_Special(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    return false;
    //return;    
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAIBotBase Bot;
    local wFlyingDefenceBotController FBot;
    local wAIPawn BotPawn;

    BotPawn = wAIPawn(KilledPawn);
    // End:0x6C
    if((wAIDefencePawn(BotPawn) != none) && wDefenceObjective(wAIDefencePawn(BotPawn).AttackFlag).AttackerCnt > 0)
    {
        wDefenceObjective(wAIDefencePawn(BotPawn).AttackFlag).AttackerCnt--;
    }
    super.Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
    // End:0xB9
    if(KilledPawn.IsA('wDefenceBoss'))
    {
        --NumBots;
        ++DeadBotCount;
        --iNumBotsWave;
    }
    Log((((string(self) $ " NumBots :") $ string(NumBots)) $ ", DeadBotCount:") $ string(DeadBotCount));
    //return;    
}

function int GetCharKillUID(Controller Killer)
{
    local int iUID;

    // End:0x42
    if(((none != wAIDefenceBot(Killer)) || none != wDefenceBossController(Killer)) || none != wFlyingDefenceBotController(Killer))
    {
        iUID = 60000;        
    }
    else
    {
        iUID = Killer.PlayerReplicationInfo.GetUID();
    }
    return iUID;
    //return;    
}

function int GetDeathUID(Controller Killed)
{
    local int iUID;

    // End:0x42
    if(((none != wAIDefenceBot(Killed)) || none != wDefenceBossController(Killed)) || none != wFlyingDefenceBotController(Killed))
    {
        iUID = 60000;        
    }
    else
    {
        iUID = Killed.PlayerReplicationInfo.GetUID();
    }
    return iUID;
    //return;    
}

function int GetChopperCallerID(Controller HeliCopter)
{
    local int iUID;

    // End:0x35
    if(none != wFlyingDefenceBotController(HeliCopter))
    {
        iUID = wFlyingDefenceBot(HeliCopter.Pawn).iNpcID;        
    }
    else
    {
        iUID = HeliCopter.Caller.PlayerReplicationInfo.GetUID();
    }
    return iUID;
    //return;    
}

function bool IsProcessKDLog(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x0D
    if(Killer == none)
    {
        return false;
    }
    // End:0x1A
    if(Killed == none)
    {
        return false;
    }
    // End:0x43
    if(wDefenceController(Killed) != none)
    {
        // End:0x40
        if(Killed.PlayerReplicationInfo == none)
        {
            return false;
        }        
    }
    // End:0x57
    if(DamageType.default.SkipDeathIncrement)
    {
        return false;
    }
    return true;
    //return;    
}

function int ProcessKillMessageMulti(int iArray, Controller ReceiveController, Controller Killer, Controller Other, int KillWeapon)
{
    local int iConKillorHeadShot, addScore, iCode_Message;

    addScore = int(GetAddScore(Killer, Other));
    PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine.wMultiKillMessage', iArray,,,, addScore);
    iConKillorHeadShot = iConKillorHeadShot | 1;
    return iConKillorHeadShot;
    //return;    
}

function float GetAddScore(Controller Killer, Controller Other)
{
    // End:0x62
    if((Other.IsA('wAIDefenceBot') || Other.IsA('wFlyingDefenceBotController')) || Other.IsA('wDefenceBossController'))
    {
        return float(AIController(Other).NPCParam.RewardPoint);        
    }
    else
    {
        return super(GameInfo).GetAddScore(Killer, Other);
    }
    //return;    
}

function SendMessageAddScore(Controller ReceiveController, Controller Killer, Controller Other, int KillWeapon, optional int iConKillorHeadShot)
{
    local int addScore, iCode_Message;

    addScore = int(GetAddScore(Killer, Other));
    // End:0x37
    if((Killer == Other) || Killer == none)
    {        
    }
    else
    {
        // End:0x2CC
        if(Killer.IsA('PlayerController') && addScore != 0)
        {
            // End:0xCF
            if((Other.IsA('wAIDefenceBot') || Other.IsA('wFlyingDefenceBotController')) || Other.IsA('wDefenceBossController'))
            {
                Killer.PlayerReplicationInfo.PointIns += float(AIController(Other).NPCParam.IngamePoint);
            }
            // End:0xFB
            if((iConKillorHeadShot & 1) == 0)
            {
                PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', addScore);
            }
            // End:0x125
            if(((iConKillorHeadShot & 2) == 2) || (iConKillorHeadShot & 1024) == 1024)
            {
                return;
            }
            switch(KillWeapon)
            {
                // End:0x134
                case 5011:
                // End:0x13C
                case 5001:
                // End:0x15B
                case 5003:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    // End:0x2AE
                    break;
                // End:0x163
                case 6002:
                // End:0x16B
                case 6005:
                // End:0x173
                case 50007:
                // End:0x17B
                case 50008:
                // End:0x183
                case 7003:
                // End:0x18B
                case 7001:
                // End:0x193
                case 6000:
                // End:0x1B2
                case 6008:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_FragGrenade;
                    // End:0x2AE
                    break;
                // End:0x1D1
                case 99999:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_Melee;
                    // End:0x2AE
                    break;
                // End:0x1F0
                case 99998:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_StepOn;
                    // End:0x2AE
                    break;
                // End:0x20F
                case 50000:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_Artillery;
                    // End:0x2AE
                    break;
                // End:0x217
                case 5009:
                // End:0x21F
                case 50001:
                // End:0x23E
                case 50002:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_Heli_Killer;
                    // End:0x2AE
                    break;
                // End:0x25D
                case 50006:
                    iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_SpecialETC;
                    // End:0x2AE
                    break;
                // End:0xFFFF
                default:
                    // End:0x297
                    if(PlayerController(ReceiveController).Pawn.bIsAiming)
                    {
                        iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_Normal_Aim;                        
                    }
                    else
                    {
                        iCode_Message = Class'Engine.wSpecialKillMessage'.default.Code_MessageScore_Normal;
                    }
                    // End:0x2AE
                    break;
                    break;
            }
            PlayerController(ReceiveController).ReceiveLocalizedMessage(Class'Engine.wSpecialKillMessage', iCode_Message);
        }
    }
    //return;    
}

function ScoreKill_Suicide(Controller Killer, Controller Other)
{
    // End:0xEA
    if((Other != none) && Other.PlayerReplicationInfo != none)
    {
        Other.PlayerReplicationInfo.fExp = FMax(0.0000000, Other.PlayerReplicationInfo.fExp - GameDecExp);
        Other.PlayerReplicationInfo.Point = FMax(0.0000000, Other.PlayerReplicationInfo.Point - GameDecPoint);
        Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
        ScoreEvent(Other.PlayerReplicationInfo, GameDecScore, "self_frag");
    }
    // End:0x129
    if(((none != wAIDefenceBot(Other)) || none != wDefenceBossController(Other)) || none != wFlyingDefenceBotController(Other))
    {
        self.KDLOG_Initialize();
    }
    //return;    
}

function SetAssistPoint(Controller Killer, Controller Other)
{
    local Controller C;
    local PlayerController PC;
    local AIController Killed;
    local wMatchUserInfo UserInfo;
    local wMatchMaker MM;
    local int lp1, iMessageCode;

    SC.AssistUIDs.Length = 0;
    SC.AssistType.Length = 0;
    Killed = AIController(Other);
    // End:0x1EA
    if((none != Killed) && Killed.NPCParam.BonusPoint > 0)
    {
        C = Level.ControllerList;
        J0x70:

        // End:0x1EA [Loop If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x1D3
            if(((PC != none) && PC.bIsPlayer) && PC != PlayerController(Killer))
            {
                SC.AssistUIDs[SC.AssistUIDs.Length] = PC.PlayerReplicationInfo.GetUID();
                SC.AssistType[SC.AssistType.Length] = byte(Killed.NPCParam.NPCID);
                PC.PlayerReplicationInfo.Score += float(Killed.NPCParam.BonusPoint);
                PC.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
                iMessageCode = Class'Engine.wMessage_Score'.default.Code_GainBonusPoint;
                PC.ReceiveLocalizedMessage(Class'Engine.wMessage_Score', iMessageCode,,,, Killed.NPCParam.BonusPoint);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x70;
        }
    }
    //return;    
}

function SendSeverScoreAndAssist(Controller Killer, Controller Other)
{
    local Controller PC;
    local array<Controller> AssistList;
    local int iTemp, iPlayerID;

    // End:0x28
    if(!Other.Pawn.IsA('wHelicopter'))
    {
        KDLOG_Finalize();        
    }
    else
    {
        iPlayerID = self.GetCharKillUID(Killer);
        KDLOG_Finalize_HeliCopter(iPlayerID, Killer, Other);
    }
    //return;    
}

function KilledBots(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local wAIBotBase Bot;
    local wFlyingDefenceBotController FBot;

    // End:0x12
    if(wAISentryGunController(Killed) != none)
    {
        return;
    }
    // End:0x33
    if(Killer == Killed)
    {
        // End:0x33
        if(wAIDefencePawn_Eta(KilledPawn) == none)
        {
            return;
        }
    }
    // End:0x55
    if(PlayerController(Killer) == none)
    {
        // End:0x55
        if(wAIDefenceBot_Eta(Killer) == none)
        {
            return;
        }
    }
    Bot = wAIBotBase(Killed);
    FBot = wFlyingDefenceBotController(Killed);
    // End:0x98
    if(FBot != none)
    {
        --NumBots;
        ++DeadBotCount;
        --iNumBotsWave;        
    }
    else
    {
        // End:0xD5
        if(Bot != none)
        {
            Level.AILevel.KillBot(Bot);
            --NumBots;
            ++DeadBotCount;
            --iNumBotsWave;
        }
    }
    // End:0x101
    if((iNumBotsWave <= 0) && NumBots <= 0)
    {
        fWaveEndTime = float(RoundStartTime - RemainingTime);
    }
    // End:0x143
    if(bestScore < int(Killer.PlayerReplicationInfo.Score))
    {
        bestScore = int(Killer.PlayerReplicationInfo.Score);
    }
    //return;    
}

function SpwanBotProjectile(wAIPawn Bot)
{
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
    // End:0x1E
    if(BotPawn != none)
    {        
    }
    else
    {
        FlyPawn = wFlyingDefenceBot(Other);
        // End:0xA0
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
    --iNumBotsWave;
    // End:0x41
    if((iNumBotsWave <= 0) && NumBots <= 0)
    {
        fWaveEndTime = float(RoundStartTime - RemainingTime);
    }
    NuclearBarricade.TakeDamage(Damage, Instigator, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
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

    C = Level.ControllerList;
    J0x14:

    // End:0x63 [Loop If]
    if(C != none)
    {
        // End:0x4C
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).FmodClientPlaySound(sndModeName);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function RoundPass(int Round)
{
    local Pawn BotPawn;
    local wAIBotBase BotCtrl;
    local wFlyingDefenceBot FlyPawn;
    local wFlyingDefenceBotController FlyBotCtrl;

    // End:0xCF
    foreach DynamicActors(Class'Engine.Pawn', BotPawn)
    {
        // End:0x70
        if(BotPawn != none)
        {
            BotCtrl = wAIBotBase(BotPawn.Controller);
            // End:0x6D
            if(BotCtrl != none)
            {
                BotPawn.bHidden = true;
                Level.AILevel.KillBot(BotCtrl);
            }
            // End:0xCE
            continue;
        }
        FlyPawn = wFlyingDefenceBot(BotPawn);
        // End:0xCE
        if(FlyPawn != none)
        {
            FlyBotCtrl = wFlyingDefenceBotController(FlyPawn.Controller);
            FlyPawn.bHidden = true;
            FlyPawn.Controller.GotoState('Dying');
        }        
    }    
    EndRound(1, none, "Player Win !!!");
    // End:0x104
    if(Round > 0)
    {
        CurrentRound = byte(Round - 1);
    }
    //return;    
}

function NuclearDamageable()
{
    local int lp1;

    super.NuclearDamageable();
    lp1 = 0;
    J0x0D:

    // End:0x45 [Loop If]
    if(lp1 < DefenceBarricades.Length)
    {
        DefenceBarricades[lp1].bDamageable = !DefenceObjectGod;
        lp1++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType, optional int iWeaponType)
{
    local Controller InstigatorController, InjuredController;

    // End:0x1F
    if(instigatedBy != none)
    {
        InstigatorController = instigatedBy.Controller;
    }
    // End:0x3E
    if(injured != none)
    {
        InjuredController = injured.Controller;
    }
    // End:0x82
    if((InstigatorController != none) && InjuredController != none)
    {
        // End:0x82
        if(!InstigatorController.bIsPlayer && !InjuredController.bIsPlayer)
        {
            return 0;
        }
    }
    // End:0xCF
    if((instigatedBy.IsA('wAIDefencePawn') || instigatedBy.IsA('wFlyingDefenceBot')) || instigatedBy.IsA('wDefenceBoss'))
    {
        Damage *= (GetAddDamageRatio());
    }
    return super(wMSGameInfo).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
    //return;    
}

function float GetAddDamageRatio()
{
    local float fRatio;

    fRatio = 1.0000000;
    switch(Level.GetMatchMaker().BotDifficulty)
    {
        // End:0x37
        case 1:
            fRatio = 1.0000000;
            // End:0x73
            break;
        // End:0x4A
        case 2:
            fRatio = 1.5000000;
            // End:0x73
            break;
        // End:0x5D
        case 3:
            fRatio = 2.0000000;
            // End:0x73
            break;
        // End:0x70
        case 4:
            fRatio = 2.5000000;
            // End:0x73
            break;
        // End:0xFFFF
        default:
            break;
    }
    return fRatio;
    //return;    
}

function float GetAddHealthRatio()
{
    local float fRatio;

    fRatio = 1.0000000;
    switch(Level.GetMatchMaker().BotDifficulty)
    {
        // End:0x37
        case 1:
            fRatio = 1.0000000;
            // End:0x73
            break;
        // End:0x4A
        case 2:
            fRatio = 1.2000000;
            // End:0x73
            break;
        // End:0x5D
        case 3:
            fRatio = 1.5000000;
            // End:0x73
            break;
        // End:0x70
        case 4:
            fRatio = 2.0000000;
            // End:0x73
            break;
        // End:0xFFFF
        default:
            break;
    }
    return fRatio;
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    super(wMSGameInfo).AddDefaultInventory(PlayerPawn);
    // End:0x41
    if(wDefenceController(PlayerPawn.Controller) != none)
    {
        wDefenceController(PlayerPawn.Controller).SetBuyItem();
    }
    //return;    
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
    local byte bAllowPickup;

    // End:0x19
    if(Other.IsA('wAIDefencePawn'))
    {
        return false;        
    }
    else
    {
        return super(UnrealMPGameInfo).PickupQuery(Other, Item);
    }
    //return;    
}

function int GetRoundEndType(wMSGameInfo.ERER_Reason RoundEndReason)
{
    local int attackerCount, defenderCount;

    // End:0x4C
    if((((int(RoundEndReason) == int(2)) || int(RoundEndReason) == int(3)) || int(RoundEndReason) == int(5)) || int(RoundEndReason) == int(6))
    {
        return 2;        
    }
    else
    {
        // End:0x62
        if(int(RoundEndReason) == int(0))
        {
            return 3;            
        }
        else
        {
            // End:0x78
            if(int(RoundEndReason) == int(1))
            {
                return 4;                
            }
            else
            {
                return -1;
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
    local int endType, winTeam, winTeamAD, Players, fEndTime;

    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    Players = CountPlayers();
    winTeam = GetWinTeam(RoundEndReason);
    winTeamAD = GetWinTeamAD(winTeam);
    endType = GetRoundEndType(RoundEndReason);
    fEndTime = Max(0, RoundStartTime - RemainingTime);
    Log((((((((((((((((((string(self) $ "[BTSend.sfReqLogEndEachRound] StartPlayerCount=") $ string(Players)) $ " players=") $ string(Players)) $ " endType=") $ string(endType)) $ " endTime=") $ string(EndTime)) $ " winTeam=") $ string(winTeam)) $ " winTeamAD=") $ string(winTeamAD)) $ " Teams[0].Score=") $ string(Teams[0].Score)) $ " Teams[1].Score=") $ string(Teams[1].Score)) $ " CurrentRound=") $ string(CurrentRound));
    BTSend.sfReqLogEndEachRound(Players, Players, endType, fEndTime, byte(winTeam), byte(winTeamAD), int(Teams[0].Score), int(Teams[1].Score), int(CurrentRound));
    //return;    
}

function InitGameOption(string Options, out string Error)
{
    ScoreLimit = kMM.iGoalRound;
    RoundTimeLimit = Max(0, GetIntOption(Options, "RoundTimeLimit", kMM.iTimeLimit));
    PracticeTimeLimit = Max(0, GetIntOption(Options, "PracticeTimeLimit", PracticeTimeLimit));
    RoundLimit = ScoreLimit;
    MaxRounds = RoundLimit;
    FirstAttackingTeam = byte(Max(-1, GetIntOption(Options, "FirstAttackingTeam", int(FirstAttackingTeam))));
    ResetTimeDelay = Max(0, GetIntOption(Options, "ResetTimeDelay", ResetTimeDelay));
    ReinforcementsFreq = Max(0, GetIntOption(Options, "ReinforcementsFreq", ReinforcementsFreq));
    TimeLimit = 0;
    RemainingTime = ((((RoundTimeLimit + ResetTimeDelay) + 1) * 60) * (MaxRounds + 2)) + PracticeTimeLimit;
    // End:0x164
    if(GameReplicationInfo != none)
    {
        GameReplicationInfo.RemainingTime = RemainingTime;
    }
    //return;    
}

state MatchInProgress
{
    function ProcessEndRound()
    {
        local int i;
        local wAILevel AILevel;

        // End:0x6A
        if(NuclearBarricade.Health <= 0)
        {
            EndRound(0, none, "Bot Win !!!");
            Log("[wNDFGameInfo::ProcessEndRound1] DefenceObject.Health <= 0");
            return;
        }
        // End:0xE9
        if(DeadBotCount >= MaxUnitNum)
        {
            EndRound(1, none, "Player Win !!!");
            Log((("[wNDFGameInfo::ProcessEndRound2] DeadBotCount :" $ string(DeadBotCount)) $ ", MaxUnitNum") $ string(MaxUnitNum));
            return;
        }
        // End:0x491
        if(RoundProgIndex >= RoundInfo.DelayTime.Length)
        {
            // End:0x1C0
            if(NumBots == 0)
            {
                EndRound(1, none, "Player Win !!!");
                Log((((((((("[wNDFGameInfo::ProcessEndRound3] Round=" $ string(CurrentRound)) $ ", ProgIdx=") $ string(RoundProgIndex)) $ ", MaxUnitNum=") $ string(MaxUnitNum)) $ ", DeadBotCount=") $ string(DeadBotCount)) $ ", AddCount=") $ string(AddBotCount));
                return;                
            }
            else
            {
                // End:0x1F0
                if((RoundStartTime - RemainingTime) < (RoundInfo.DelayTime[RoundInfo.DelayTime.Length - 1] + 60))
                {
                    return;
                }
                AILevel = wAILevel(Level.AILevel);
                i = 0;
                J0x210:

                // End:0x491 [Loop If]
                if(i < AILevel.Bots.Length)
                {
                    // End:0x356
                    if(AILevel.Bots[i].Pawn == none)
                    {
                        Log("[wNDFGameInfo::ProcessEndRound4] Wrong Bot :" $ string(AILevel.Bots[i]));
                        Log((("[wNDFGameInfo::ProcessEndRound5] DeadBotCount :" $ string(DeadBotCount)) $ ", MaxUnitNum") $ string(MaxUnitNum));
                        Level.AILevel.KillBot(AILevel.Bots[i]);
                        --NumBots;
                        ++DeadBotCount;
                        --iNumBotsWave;
                        // End:0x356
                        if((iNumBotsWave <= 0) && NumBots <= 0)
                        {
                            fWaveEndTime = float(RoundStartTime - RemainingTime);
                        }
                    }
                    // End:0x487
                    if(AILevel.Bots[i].MoveTimer < float(-120))
                    {
                        Log((("[wNDFGameInfo::ProcessEndRound6] Wrong Bot :" $ string(AILevel.Bots[i])) $ ", MoveTimer:") $ string(AILevel.Bots[i].MoveTimer));
                        // End:0x41A
                        if(wAIDefenceBot_Omega(AILevel.Bots[i]) != none)
                        {
                            // [Explicit Continue]
                            goto J0x487;
                        }
                        Level.AILevel.KillBot(AILevel.Bots[i]);
                        --NumBots;
                        ++DeadBotCount;
                        --iNumBotsWave;
                        // End:0x487
                        if((iNumBotsWave <= 0) && NumBots <= 0)
                        {
                            fWaveEndTime = float(RoundStartTime - RemainingTime);
                        }
                    }
                    J0x487:

                    ++i;
                    // [Loop Continue]
                    goto J0x210;
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
        //return;        
    }

    function UpdateBestScorePlayer()
    {
        super.UpdateBestScorePlayer();
        //return;        
    }
    stop;    
}

defaultproperties
{
    iEnableNumBots=20
    NewRoundSound=""
    sndBeginRound="Warfare_Sound_Defense_Mode/ui/roundstart"
    HUDType="wMission.wHUD_DefenceNew"
    ResetTimeDelay=3
    DeathMessageClass=Class'WGame.wDeathMessage_Defence'
    RespawnTime=5.0000000
}