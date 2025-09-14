/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TeamGame.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:39
 *	Functions:67
 *	States:1
 *
 *******************************************************************************/
class TeamGame extends DeathMatch
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

const TGPROPNUM = 5;

var bool bBalanceTeams;
var bool bPlayersBalanceTeams;
var bool bAllowNonTeamChat;
var bool bScoreTeamKills;
var bool bSpawnInTeamArea;
var bool bScoreVictimsTarget;
var float FriendlyFireScale;
var int MaxTeamSize;
var float TeammateBoost;
var UnrealTeamInfo Teams[2];
var string BlueTeamName;
var string RedTeamName;
var class<TeamAI> TeamAIType[2];
var string PathWhisps[2];
var localized string NearString;
var localized string BareHanded;
var name CaptureSoundName[2];
var name TakeLeadName[2];
var name IncreaseLeadName[2];
var localized string TGPropsDisplayText[5];
var localized string TGPropDescText[5];
var(LoadingHints) private localized array<localized string> TGHints;
var() float ADR_Goal;
var() float ADR_Return;
var() float ADR_Control;
var Texture TempSymbols[2];
var float LastEndGameTauntTime;
var localized string EndGameComments[10];
var localized string EndGameTaunts[10];
var localized string EndGameVictoryRemarks[10];
var localized string EndGameLossRemarks[10];
var localized string EndGameResponses[10];
var byte EndGameCommented[10];
var byte EndGameRemark[10];
var int LastEndGameComment;
var int LastEndGameRemark;
var int LastEndGameResponse;
var int iCurWinningTeam;
var bool bAnnouncedAlmostWinningTeam;

function PostBeginPlay()
{
    local int i;

    // End:0x54
    if(InitialBots > 0)
    {
        Teams[0] = GetRedTeam(int(0.50 * float(InitialBots) + float(1)));
        Teams[1] = GetBlueTeam(int(0.50 * float(InitialBots) + float(1)));
    }
    // End:0x72
    else
    {
        Teams[0] = GetRedTeam(0);
        Teams[1] = GetBlueTeam(0);
    }
    i = 0;
    J0x79:
    // End:0x115 [While If]
    if(i < 2)
    {
        Teams[i].TeamIndex = i;
        Teams[i].AI = Spawn(TeamAIType[i]);
        Teams[i].AI.Team = Teams[i];
        GameReplicationInfo.Teams[i] = Teams[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
    Teams[0].AI.EnemyTeam = Teams[1];
    Teams[1].AI.EnemyTeam = Teams[0];
    Teams[0].AI.SetObjectiveLists();
    Teams[1].AI.SetObjectiveLists();
    super.PostBeginPlay();
}

event SetGrammar()
{
    LoadSRGrammar("TDM");
}

function class<WaitView> GetWaitViewClass(byte Team)
{
    // End:0x16
    if(Team == 0)
    {
        return class'WaitViewAF';
    }
    // End:0x1c
    else
    {
        return class'WaitViewRSA';
    }
}

function array<int> GetTeamScores()
{
    local array<int> TeamScores;

    TeamScores[0] = int(Teams[0].Score);
    TeamScores[1] = int(Teams[1].Score);
    return TeamScores;
}

function StartMatch()
{
    local int lp1, tempScore;

    // End:0x90
    if(bChangedHost)
    {
        lp1 = 0;
        J0x10:
        // End:0x90 [While If]
        if(lp1 < 2)
        {
            tempScore = int(GameReplicationInfo.Teams[lp1].Score);
            GameReplicationInfo.Teams[lp1] = Teams[lp1];
            GameReplicationInfo.Teams[lp1].Score = float(tempScore);
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    super.StartMatch();
}

function int ParseOrder(string OrderString)
{
    switch(OrderString)
    {
        // End:0x12
        case "DEFEND":
        // End:0x23
        case "TAKE ALPHA":
            return 0;
        // End:0x2e
        case "ATTACK":
        // End:0x40
        case "TAKE BRAVO":
            return 2;
        // End:0x4d
        case "COVER":
            return 3;
        // End:0x58
        case "HOLD":
            return 1;
        // End:0x69
        case "FREELANCE":
            return 4;
        // End:0x79
        case "GIMME":
            return 256;
        // End:0x88
        case "JUMP":
            return 257;
        // End:0x99
        case "STATUS":
            return 258;
        // End:0xa9
        case "TAUNT":
            return 259;
        // End:0xbb
        case "SUICIDE":
            return 260;
        // End:0xffff
        default:
}

function bool ApplyOrder(PlayerController Sender, int RecipientID, int OrderID)
{
    local Controller P;

    // End:0x6d7
    if(OrderID > 255)
    {
        // End:0x16d
        if(OrderID == 260)
        {
            // End:0x168
            if(Level.NetMode == 0)
            {
                P = Level.ControllerList;
                J0x48:
                // End:0x168 [While If]
                if(P != none)
                {
                    // End:0x151
                    if(Bot(P) != none && Bot(P).Pawn != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team && RecipientID == -1 || RecipientID == P.PlayerReplicationInfo.TeamID)
                    {
                        Bot(P).Pawn.KilledBy(Bot(P).Pawn);
                        // End:0x151
                        if(RecipientID == P.PlayerReplicationInfo.TeamID)
                        {
                        }
                        // End:0x168
                        else
                        {
                        }
                        P = P.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0x48;
                    }
                }
            }
            return true;
        }
        // End:0x6d4
        else
        {
            // End:0x299
            if(OrderID == 259)
            {
                P = Level.ControllerList;
                J0x190:
                // End:0x294 [While If]
                if(P != none)
                {
                    // End:0x27d
                    if(Bot(P) != none && Bot(P).Pawn != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team && RecipientID == -1 || RecipientID == P.PlayerReplicationInfo.TeamID)
                    {
                        Bot(P).ForceCelebrate();
                        // End:0x27d
                        if(RecipientID == P.PlayerReplicationInfo.TeamID)
                        {
                        }
                        // End:0x294
                        else
                        {
                        }
                        P = P.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0x190;
                    }
                }
                return true;
            }
            // End:0x6d4
            else
            {
                // End:0x3f1
                if(OrderID == 256)
                {
                    // End:0x2d4
                    if(Level.NetMode != 0 && RecipientID == -1)
                    {
                        return true;
                    }
                    P = Level.ControllerList;
                    J0x2e8:
                    // End:0x3ec [While If]
                    if(P != none)
                    {
                        // End:0x3d5
                        if(Bot(P) != none && Bot(P).Pawn != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team && RecipientID == -1 || RecipientID == P.PlayerReplicationInfo.TeamID)
                        {
                            Bot(P).ForceGiveWeapon();
                            // End:0x3d5
                            if(RecipientID == P.PlayerReplicationInfo.TeamID)
                            {
                            }
                            // End:0x3ec
                            else
                            {
                            }
                            P = P.nextController;
                            // This is an implied JumpToken; Continue!
                            goto J0x2e8;
                        }
                    }
                    return true;
                }
                // End:0x6d4
                else
                {
                    // End:0x572
                    if(OrderID == 257)
                    {
                        // End:0x42c
                        if(Level.NetMode != 0 && RecipientID == -1)
                        {
                            return true;
                        }
                        P = Level.ControllerList;
                        J0x440:
                        // End:0x56d [While If]
                        if(P != none)
                        {
                            // End:0x556
                            if(Bot(P) != none && Bot(P).Pawn != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team && RecipientID == -1 || RecipientID == P.PlayerReplicationInfo.TeamID)
                            {
                                Bot(P).Pawn.bWantsToCrouch = false;
                                Bot(P).Pawn.DoJump(false);
                                // End:0x556
                                if(RecipientID == P.PlayerReplicationInfo.TeamID)
                                {
                                }
                                // End:0x56d
                                else
                                {
                                }
                                P = P.nextController;
                                // This is an implied JumpToken; Continue!
                                goto J0x440;
                            }
                        }
                        return true;
                    }
                    // End:0x6d4
                    else
                    {
                        // End:0x6d2
                        if(OrderID == 258)
                        {
                            P = Level.ControllerList;
                            J0x595:
                            // End:0x6cd [While If]
                            if(P != none)
                            {
                                // End:0x6b6
                                if(Bot(P) != none && Bot(P).Pawn != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team && RecipientID == -1 || RecipientID == P.PlayerReplicationInfo.TeamID)
                                {
                                    Bot(P).SendMessage(Sender.PlayerReplicationInfo, 'Other', byte(GetStatus(Sender, Bot(P))), 0.0, 'Team');
                                    // End:0x6b6
                                    if(RecipientID == P.PlayerReplicationInfo.TeamID)
                                    {
                                    }
                                    // End:0x6cd
                                    else
                                    {
                                    }
                                    P = P.nextController;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x595;
                                }
                            }
                            return true;
                        }
                        // End:0x6d4
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
    // End:0x820
    else
    {
        P = Level.ControllerList;
        J0x6eb:
        // End:0x820 [While If]
        if(P != none)
        {
            // End:0x809
            if(Bot(P) != none && P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team)
            {
                Bot(P).bInstantAck = true;
                // End:0x799
                if(RecipientID == -1)
                {
                    P.BotVoiceMessage('Order', byte(OrderID), Sender);
                }
                // End:0x7f3
                else
                {
                    // End:0x7f3
                    if(RecipientID == P.PlayerReplicationInfo.TeamID)
                    {
                        P.BotVoiceMessage('Order', byte(OrderID), Sender);
                        Bot(P).bInstantAck = false;
                    }
                    // End:0x820
                    else
                    {
                    }
                    Bot(P).bInstantAck = false;
                }
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x6eb;
            }
        }
    }
    return true;
}

function int ParseRecipient(string Recipient)
{
    local int RecipientID, i;

    // End:0x1a
    if(Recipient == "")
    {
        RecipientID = -2;
    }
    // End:0x83
    else
    {
        // End:0x38
        if(Recipient == "TEAM")
        {
            RecipientID = -1;
        }
        // End:0x83
        else
        {
            RecipientID = -2;
            i = 0;
            J0x4a:
            // End:0x83 [While If]
            if(i < 15)
            {
                // End:0x79
                if(Recipient ~= CallSigns[i])
                {
                    RecipientID = i;
                }
                // End:0x83
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4a;
                }
            }
        }
    }
    return RecipientID;
}

function ParseRecipients(out int RecipientIDs[3], out int NumRecipients, out string OrderString)
{
    local string Recipient, rest;
    local int RecipientID;
    local bool Done;

    RecipientIDs[0] = -2;
    RecipientIDs[1] = -2;
    RecipientIDs[2] = -2;
    NumRecipients = 0;
    Done = false;
    // End:0x52
    if(!Divide(OrderString, " ", Recipient, rest))
    {
        return;
    }
    RecipientID = ParseRecipient(Recipient);
    // End:0xb5
    if(RecipientID != -2)
    {
        OrderString = rest;
        Done = !Divide(OrderString, " ", Recipient, rest);
        RecipientIDs[NumRecipients] = RecipientID;
        ++ NumRecipients;
    }
    // End:0xbd
    else
    {
        Done = true;
    }
    // End:0x52
    if(NumRecipients == 3 || Done)
    	goto J0x52;
}

function ParseVoiceCommand(PlayerController Sender, string RecognizedString)
{
    local int RecipientIDs[3], NumRecipients, OrderID, i;
    local string OrderString;

    // End:0x0d
    if(Sender == none)
    {
        return;
    }
    OrderString = RecognizedString;
    ParseRecipients(RecipientIDs, NumRecipients, OrderString);
    // End:0x3a
    if(NumRecipients == 0)
    {
        return;
    }
    OrderID = ParseOrder(OrderString);
    i = 0;
    J0x52:
    // End:0x86 [While If]
    if(i < NumRecipients)
    {
        ApplyOrder(Sender, RecipientIDs[i], OrderID);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x52;
    }
}

function int GetStatus(PlayerController Sender, Bot B)
{
    local name BotOrders;
    local int i, Count;

    BotOrders = B.GetOrders();
    // End:0x5c
    if(B.Pawn == none)
    {
        // End:0x59
        if(BotOrders == 'Defend' && B.Squad.Size == 1)
        {
            return 0;
        }
    }
    // End:0x454
    else
    {
        // End:0xa0
        if(B.PlayerReplicationInfo.HasFlag != none)
        {
            // End:0x9a
            if(B.Pawn.Health < 50)
            {
                return 13;
            }
            return 2;
        }
        // End:0x454
        else
        {
            // End:0xef
            if(B.Enemy == none)
            {
                // End:0xc6
                if(BotOrders == 'Defend')
                {
                    return 11;
                }
                // End:0xec
                if(BotOrders == 'Attack' && B.bReachedGatherPoint)
                {
                    return 9;
                }
            }
            // End:0x454
            else
            {
                // End:0x37e
                if(B.EnemyVisible())
                {
                    // End:0x14d
                    if(B.Enemy.PlayerReplicationInfo != none && B.Enemy.PlayerReplicationInfo.HasFlag != none)
                    {
                        return BallCarrierMessage();
                    }
                    // End:0x285
                    if(BotOrders == 'Defend' && B.GoalScript != none && VSize(B.GoalScript.Location - B.Pawn.Location) < float(1500) || B.Squad.SquadObjective.BotNearObjective(B))
                    {
                        i = 0;
                        J0x1e4:
                        // End:0x252 [While If]
                        if(i < 8)
                        {
                            // End:0x248
                            if(B.Squad.enemies[i] != none && B.Squad.enemies[i].Health > 0)
                            {
                                ++ Count;
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x1e4;
                        }
                        // End:0x282
                        if(Count > 2)
                        {
                            // End:0x27f
                            if(B.Pawn.Health < 60)
                            {
                                return 21;
                            }
                            return 22;
                        }
                        return 20;
                    }
                    // End:0x37b
                    if(BotOrders != 'Follow' || B.Squad.SquadLeader != Sender)
                    {
                        i = 0;
                        J0x2be:
                        // End:0x32c [While If]
                        if(i < 8)
                        {
                            // End:0x322
                            if(B.Squad.enemies[i] != none && B.Squad.enemies[i].Health > 0)
                            {
                                ++ Count;
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x2be;
                        }
                        // End:0x37b
                        if(Count > 1)
                        {
                            // End:0x37b
                            if(B.Pawn.Health < 60)
                            {
                                // End:0x378
                                if(BotOrders == 'Attack' || BotOrders == 'Freelance')
                                {
                                    return 13;
                                }
                                return 21;
                            }
                        }
                    }
                }
                // End:0x454
                else
                {
                    // End:0x3a2
                    if(B.Pawn.Health < 50)
                    {
                        return 13;
                    }
                    // End:0x454
                    else
                    {
                        // End:0x454
                        if(BotOrders == 'Defend' && B.Squad.SquadObjective != none && B.GoalScript != none && VSize(B.GoalScript.Location - B.Pawn.Location) < float(1500) || B.Squad.SquadObjective.BotNearObjective(B))
                        {
                            return 20;
                        }
                    }
                }
            }
        }
    }
    // End:0x491
    if(BotOrders == 'HOLD' && B.Pawn.ReachedDestination(B.GoalScript))
    {
        return 9;
    }
    // End:0x51f
    if(BotOrders == 'Follow' && B.Squad.SquadLeader == Sender && B.Squad.SquadLeader.Pawn != none && B.LineOfSightTo(B.Squad.SquadLeader.Pawn))
    {
        return 3;
    }
    // End:0x531
    if(BotOrders == 'Defend')
    {
        return 26;
    }
    // End:0x558
    if(BotOrders == 'Attack')
    {
        // End:0x555
        if(B.bFinalStretch)
        {
            return 10;
        }
        return 27;
    }
    return 11;
}

function int BallCarrierMessage()
{
    return 12;
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

simulated function UpdateAnnouncements();
function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
    local Controller C;
    local PlayerReplicationInfo Living;
    local bool bNoneLeft;
    local int lp1;

    // End:0x1fb
    if(MaxLives > 0)
    {
        // End:0x37
        if(Scorer != none && !Scorer.bOutOfLives)
        {
            Living = Scorer;
        }
        bNoneLeft = true;
        C = Level.ControllerList;
        J0x53:
        // End:0x14c [While If]
        if(C != none)
        {
            // End:0x135
            if(C.PlayerReplicationInfo != none && C.bIsPlayer && !C.PlayerReplicationInfo.bOutOfLives && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                // End:0xe6
                if(Living == none)
                {
                    Living = C.PlayerReplicationInfo;
                }
                // End:0x135
                else
                {
                    // End:0x135
                    if(C.PlayerReplicationInfo != Living && C.PlayerReplicationInfo.Team != Living.Team)
                    {
                        bNoneLeft = false;
                    }
                    // End:0x14c
                    else
                    {
                    }
                }
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x53;
            }
        }
        // End:0x1ba
        if(Living != none && bNoneLeft)
        {
            lp1 = 0;
            J0x169:
            // End:0x1ba [While If]
            if(lp1 < AddBotQueue.Length)
            {
                // End:0x1b0
                if(AddBotQueue[lp1].Team != Living.Team.TeamIndex)
                {
                    bNoneLeft = false;
                }
                // End:0x1ba
                else
                {
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x169;
                }
            }
        }
        // End:0x1fb
        if(bNoneLeft)
        {
            // End:0x1e5
            if(Living != none)
            {
                EndGame(Living, "LastMan");
            }
            // End:0x1f9
            else
            {
                EndGame(Scorer, "LastMan");
            }
            return true;
        }
    }
    return false;
}

function TeamInfo OtherTeam(TeamInfo Requester)
{
    // End:0x19
    if(Requester == Teams[0])
    {
        return Teams[1];
    }
    return Teams[0];
}

function OverrideInitialBots()
{
    InitialBots = Teams[0].OverrideInitialBots(InitialBots, Teams[1]);
}

function PreLoadNamedBot(string botname)
{
    local int first, Second;

    Second = 1;
    // End:0x48
    if(StandalonePlayer != none && StandalonePlayer.PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        first = 1;
        Second = 0;
    }
    // End:0x97
    if(1 + Teams[first].Roster.Length < Teams[Second].Roster.Length)
    {
        Teams[first].AddNamedBot(botname);
    }
    // End:0xb1
    else
    {
        Teams[Second].AddNamedBot(botname);
    }
}

function PreLoadBot()
{
    // End:0x3c
    if(float(Teams[0].Roster.Length) < 0.50 * float(InitialBots) + float(1))
    {
        Teams[0].AddRandomPlayer();
    }
    // End:0x78
    if(float(Teams[1].Roster.Length) < 0.50 * float(InitialBots) + float(1))
    {
        Teams[1].AddRandomPlayer();
    }
}

function UnrealTeamInfo GetBlueTeam(int TeamBots)
{
    local class<UnrealTeamInfo> RosterClass;
    local UnrealTeamInfo Roster;

    // End:0x51
    if(CurrentGameProfile != none)
    {
        RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, class'Class'));
        Roster = Spawn(RosterClass);
        Roster.FillPlayerTeam(CurrentGameProfile);
        return Roster;
    }
    // End:0x96
    else
    {
        // End:0x7b
        if(BlueTeamName != "")
        {
            RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(BlueTeamName, class'Class'));
        }
        // End:0x96
        else
        {
            RosterClass = class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, class'Class'));
        }
    }
    Roster = Spawn(RosterClass);
    Roster.Initialize(TeamBots);
    return Roster;
}

function UnrealTeamInfo GetRedTeam(int TeamBots)
{
    EnemyRosterName = RedTeamName;
    return GetBotTeam(TeamBots);
}

event InitGame(string Options, out string Error)
{
    local string InOpt;
    local class<TeamAI> InType;
    local string RedSymbolName, BlueSymbolName;
    local Texture NewSymbol;

    super.InitGame(Options, Error);
    InOpt = ParseOption(Options, "RedTeamAI");
    // End:0x6b
    if(InOpt != "")
    {
        InType = class<TeamAI>(DynamicLoadObject(InOpt, class'Class'));
        // End:0x6b
        if(InType != none)
        {
            TeamAIType[0] = InType;
        }
    }
    InOpt = ParseOption(Options, "BlueTeamAI");
    // End:0xc7
    if(InOpt != "")
    {
        InType = class<TeamAI>(DynamicLoadObject(InOpt, class'Class'));
        // End:0xc7
        if(InType != none)
        {
            TeamAIType[1] = InType;
        }
    }
    RedTeamName = ParseOption(Options, "RedTeam");
    BlueTeamName = ParseOption(Options, "BlueTeam");
    // End:0x13f
    if(RedTeamName != "")
    {
        bCustomBots = true;
        // End:0x13c
        if(BlueTeamName == "")
        {
            BlueTeamName = "wGame.TeamBlueConfigured";
        }
    }
    // End:0x172
    else
    {
        // End:0x172
        if(BlueTeamName != "")
        {
            bCustomBots = true;
            RedTeamName = "wGame.TeamRedConfigured";
        }
    }
    RedSymbolName = ParseOption(Options, "RedTeamSymbol");
    BlueSymbolName = ParseOption(Options, "BlueTeamSymbol");
    // End:0x1f2
    if(RedSymbolName != "")
    {
        NewSymbol = Texture(DynamicLoadObject(RedSymbolName, class'Texture'));
        // End:0x1f2
        if(NewSymbol != none)
        {
            TempSymbols[0] = NewSymbol;
        }
    }
    // End:0x231
    if(BlueSymbolName != "")
    {
        NewSymbol = Texture(DynamicLoadObject(BlueSymbolName, class'Texture'));
        // End:0x231
        if(NewSymbol != none)
        {
            TempSymbols[1] = NewSymbol;
        }
    }
    InOpt = ParseOption(Options, "FF");
    // End:0x266
    if(InOpt != "")
    {
        FriendlyFireScale = FMin(1.0, float(InOpt));
    }
    // End:0x27c
    if(CurrentGameProfile != none)
    {
        FriendlyFireScale = 0.0;
    }
    InOpt = ParseOption(Options, "FriendlyFireScale");
    // End:0x2c0
    if(InOpt != "")
    {
        FriendlyFireScale = FMin(1.0, float(InOpt));
    }
    // End:0x2d6
    if(CurrentGameProfile != none)
    {
        FriendlyFireScale = 0.0;
    }
    InOpt = ParseOption(Options, "BalanceTeams");
    // End:0x31c
    if(InOpt != "")
    {
        bBalanceTeams = bool(InOpt);
        bPlayersBalanceTeams = bBalanceTeams;
    }
}

function InitTeamSymbols()
{
    super.InitTeamSymbols();
}

function int GetMinPlayers()
{
    local int LevelMinPlayers;

    LevelMinPlayers = super.GetMinPlayers();
    // End:0x26
    if(LevelMinPlayers & 1 != 0)
    {
        return LevelMinPlayers + 1;
    }
    // End:0x2c
    else
    {
        return LevelMinPlayers;
    }
}

function bool CanShowPathTo(PlayerController P, int TeamNum)
{
    return true;
}

function ShowPathTo(PlayerController P, int TeamNum)
{
    local GameObjective G, Best;
    local class<WillowWhisp> WWclass;

    G = Teams[0].AI.Objectives;
    J0x1f:
    // End:0x8c [While If]
    if(G != none)
    {
        // End:0x75
        if(G.BetterObjectiveThan(Best, byte(TeamNum), byte(P.PlayerReplicationInfo.Team.TeamIndex)))
        {
            Best = G;
        }
        G = G.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    // End:0xf7
    if(Best != none && P.FindPathToward(Best, false) != none)
    {
        WWclass = class<WillowWhisp>(DynamicLoadObject(PathWhisps[TeamNum], class'Class'));
        Spawn(WWclass, P,, P.Pawn.Location);
    }
}

function RestartPlayer(Controller aPlayer)
{
    local TeamInfo BotTeam, OtherTeam;

    Log("[TeamGame::RestartPlayer] name=" $ aPlayer.PlayerReplicationInfo.PlayerName);
    // End:0x154
    if(!bPlayersVsBots || Level.NetMode == 0 && bBalanceTeams && Bot(aPlayer) != none && !bCustomBots || Level.NetMode != 0)
    {
        BotTeam = aPlayer.PlayerReplicationInfo.Team;
        // End:0xe5
        if(BotTeam == Teams[0])
        {
            OtherTeam = Teams[1];
        }
        // End:0xf2
        else
        {
            OtherTeam = Teams[0];
        }
        // End:0x154
        if(OtherTeam.Size < BotTeam.Size - 1)
        {
            Log("[wMSGameInfo::RestartPlayer] balance destroy");
            aPlayer.Destroy();
            return;
        }
    }
    super.RestartPlayer(aPlayer);
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    super(GameInfo).NotifyKilled(Killer, Killed, KilledPawn);
    Teams[0].AI.NotifyKilled(Killer, Killed, KilledPawn);
    Teams[1].AI.NotifyKilled(Killer, Killed, KilledPawn);
}

function IncrementGoalsScored(PlayerReplicationInfo PRI)
{
    PRI.GoalsScored += 1;
    // End:0x65
    if(PRI.GoalsScored == 3 && UnrealPlayer(PRI.Owner) != none)
    {
        UnrealPlayer(PRI.Owner).ClientDelayedAnnouncementNamed('HatTrick', 30);
    }
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local Controller P;
    local bool bLastMan;

    // End:0xa4
    if(bOverTime)
    {
        // End:0x1d
        if(NumBots + NumPlayers == 0)
        {
            return true;
        }
        bLastMan = true;
        P = Level.ControllerList;
        J0x39:
        // End:0x99 [While If]
        if(P != none)
        {
            // End:0x82
            if(P.PlayerReplicationInfo != none && !P.PlayerReplicationInfo.bOutOfLives)
            {
                bLastMan = false;
            }
            // End:0x99
            else
            {
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x39;
            }
        }
        // End:0xa4
        if(bLastMan)
        {
            return true;
        }
    }
    bLastMan = Reason ~= "LastMan";
    // End:0xf5
    if(!bLastMan && GameRulesModifiers != none && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x153
    if(bTeamScoreRounds)
    {
        // End:0x150
        if(Winner != none)
        {
            Winner.Team.Score += float(1);
            Winner.Team.NetUpdateTime = Level.TimeSeconds - float(1);
        }
    }
    // End:0x1a0
    else
    {
        // End:0x1a0
        if(!bLastMan && Teams[1].Score == Teams[0].Score)
        {
            // End:0x19e
            if(!bOverTimeBroadcast)
            {
                TieOnTimeOver();
                bOverTimeBroadcast = true;
            }
            return false;
        }
    }
    // End:0x1c9
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;
    }
    // End:0x21d
    else
    {
        // End:0x207
        if(Teams[1].Score > Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[1];
        }
        // End:0x21d
        else
        {
            GameReplicationInfo.Winner = Teams[0];
        }
    }
    // End:0x2eb
    if(Winner == none)
    {
        P = Level.ControllerList;
        J0x23c:
        // End:0x2eb [While If]
        if(P != none)
        {
            // End:0x2d4
            if(P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team == GameReplicationInfo.Winner && Winner == none || P.PlayerReplicationInfo.Score > Winner.Score)
            {
                Winner = P.PlayerReplicationInfo;
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x23c;
        }
    }
    EndTime = Level.TimeSeconds + EndTimeDelay;
    return true;
}

function SetEndGameFocus(PlayerReplicationInfo Winner)
{
    local Controller P;
    local PlayerController Player;

    // End:0x2d
    if(Winner != none)
    {
        EndGameFocus = Controller(Winner.Owner).Pawn;
    }
    // End:0x49
    if(EndGameFocus != none)
    {
        EndGameFocus.bAlwaysRelevant = true;
    }
    P = Level.ControllerList;
    J0x5d:
    // End:0x18c [While If]
    if(P != none)
    {
        Player = PlayerController(P);
        // End:0x166
        if(Player != none)
        {
            // End:0xd2
            if(!Player.PlayerReplicationInfo.bOnlySpectator)
            {
                PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
            }
            Player.ClientSetBehindView(true);
            // End:0x115
            if(EndGameFocus != none)
            {
                Player.ClientSetViewTarget_G(EndGameFocus);
                Player.SetViewTarget(EndGameFocus);
            }
            Player.ClientGameEnded();
            // End:0x166
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
        }
        P.GameHasEnded();
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
    // End:0x0d
    if(ViewTarget == none)
    {
        return false;
    }
    // End:0x2a
    if(Viewer.PlayerReplicationInfo.bAdminSpecator)
    {
        return true;
    }
    // End:0x80
    if(bOnlySpectator)
    {
        // End:0x7e
        if(Controller(ViewTarget) != none)
        {
            return Controller(ViewTarget).PlayerReplicationInfo != none && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
        }
        return true;
    }
    // End:0x105
    if(Controller(ViewTarget) != none)
    {
        return Controller(ViewTarget).PlayerReplicationInfo != none && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator && Controller(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;
    }
    return Pawn(ViewTarget) != none && Pawn(ViewTarget).IsPlayerPawn() && Pawn(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "BalanceTeams", string(bBalanceTeams));
    AddServerDetail(ServerState, "PlayersBalanceTeams", string(bPlayersBalanceTeams));
    AddServerDetail(ServerState, "FriendlyFireScale", string(int(FriendlyFireScale * float(100))) $ "%");
}

function UnrealTeamInfo GetBotTeam(optional int TeamBots)
{
    local int first, Second;

    Log("TeamGame::GetBotTeam");
    // End:0x44
    if(bPlayersVsBots && Level.NetMode != 0)
    {
        return Teams[0];
    }
    // End:0xcb
    if(Level.NetMode == 0 || !bBalanceTeams)
    {
        // End:0xa7
        if(Teams[0].AllBotsSpawned())
        {
            bBalanceTeams = false;
            // End:0xa4
            if(!Teams[1].AllBotsSpawned())
            {
                return Teams[1];
            }
        }
        // End:0xcb
        else
        {
            // End:0xcb
            if(Teams[1].AllBotsSpawned())
            {
                bBalanceTeams = false;
                return Teams[0];
            }
        }
    }
    Second = 1;
    // End:0x132
    if(StandalonePlayer != none && StandalonePlayer.PlayerReplicationInfo.Team != none && StandalonePlayer.PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        first = 1;
        Second = 0;
    }
    // End:0x17b
    if(Teams[first].Size < Teams[Second].Size)
    {
        Log("TeamFirst");
        return Teams[first];
    }
    // End:0x195
    else
    {
        Log("TeamSecond");
        return Teams[Second];
    }
}

function UnrealTeamInfo GetBotTeam2(bool forceTeam, int Team)
{
    // End:0x18
    if(forceTeam)
    {
        return Teams[Team];
    }
    // End:0x1f
    else
    {
        return GetBotTeam();
    }
}

function UnrealTeamInfo FindTeamFor(Controller C)
{
    // End:0x33
    if(Teams[0].BelongsOnTeam(C.Pawn.Class))
    {
        return Teams[0];
    }
    // End:0x66
    if(Teams[1].BelongsOnTeam(C.Pawn.Class))
    {
        return Teams[1];
    }
    return GetBotTeam();
}

function byte PickTeam(byte Num, Controller C)
{
    local UnrealTeamInfo SmallTeam, BigTeam, NewTeam;
    local Controller B;
    local int BigTeamBots, SmallTeamBots;

    return Num;
    // End:0x40
    if(bPlayersVsBots && Level.NetMode != 0)
    {
        // End:0x3d
        if(PlayerController(C) != none)
        {
            return 1;
        }
        return 0;
    }
    SmallTeam = Teams[0];
    BigTeam = Teams[1];
    // End:0x95
    if(SmallTeam.Size > BigTeam.Size)
    {
        SmallTeam = Teams[1];
        BigTeam = Teams[0];
    }
    // End:0xb6
    if(Num < 2)
    {
        NewTeam = Teams[Num];
    }
    // End:0xcf
    if(NewTeam == none)
    {
        NewTeam = SmallTeam;
    }
    // End:0x2e9
    else
    {
        // End:0x2e9
        if(bPlayersBalanceTeams && Level.NetMode != 0 && PlayerController(C) != none)
        {
            // End:0x134
            if(SmallTeam.Size < BigTeam.Size)
            {
                NewTeam = SmallTeam;
            }
            // End:0x2e9
            else
            {
                B = Level.ControllerList;
                J0x148:
                // End:0x1ee [While If]
                if(B != none)
                {
                    // End:0x1d7
                    if(B.PlayerReplicationInfo != none && B.PlayerReplicationInfo.bBot)
                    {
                        // End:0x1af
                        if(B.PlayerReplicationInfo.Team == BigTeam)
                        {
                            ++ BigTeamBots;
                        }
                        // End:0x1d7
                        else
                        {
                            // End:0x1d7
                            if(B.PlayerReplicationInfo.Team == SmallTeam)
                            {
                                ++ SmallTeamBots;
                            }
                        }
                    }
                    B = B.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x148;
                }
                // End:0x28c
                if(BigTeamBots > 0)
                {
                    // End:0x236
                    if(SmallTeam.Size - SmallTeamBots < BigTeam.Size - BigTeamBots)
                    {
                        NewTeam = SmallTeam;
                    }
                    // End:0x289
                    else
                    {
                        // End:0x273
                        if(BigTeam.Size - BigTeamBots < SmallTeam.Size - SmallTeamBots)
                        {
                            NewTeam = BigTeam;
                        }
                        // End:0x289
                        else
                        {
                            // End:0x289
                            if(SmallTeamBots == 0)
                            {
                                NewTeam = BigTeam;
                            }
                        }
                    }
                }
                // End:0x2e9
                else
                {
                    // End:0x2a5
                    if(SmallTeamBots > 0)
                    {
                        NewTeam = SmallTeam;
                    }
                    // End:0x2e9
                    else
                    {
                        // End:0x2e9
                        if(UnrealTeamInfo(C.PlayerReplicationInfo.Team) != none)
                        {
                            NewTeam = UnrealTeamInfo(C.PlayerReplicationInfo.Team);
                        }
                    }
                }
            }
        }
    }
    return byte(NewTeam.TeamIndex);
}

function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
{
    local UnrealTeamInfo NewTeam;

    // End:0x1f
    if(bMustJoinBeforeStart && GameReplicationInfo.bMatchHasBegun)
    {
        return false;
    }
    // End:0x4a
    if(CurrentGameProfile != none)
    {
        // End:0x4a
        if(!CurrentGameProfile.CanChangeTeam(Other, Num))
        {
            return false;
        }
    }
    // End:0x96
    if(Other.IsA('PlayerController') && Other.PlayerReplicationInfo.bOnlySpectator)
    {
        Other.PlayerReplicationInfo.Team = none;
        return true;
    }
    NewTeam = Teams[PickTeam(byte(Num), Other)];
    // End:0xd9
    if(Other.PlayerReplicationInfo.Team == NewTeam)
    {
        return false;
    }
    Other.StartSpot = none;
    // End:0x12c
    if(Other.PlayerReplicationInfo.Team != none)
    {
        Other.PlayerReplicationInfo.Team.RemoveFromTeam(Other);
    }
    // End:0x189
    if(NewTeam.AddToTeam(Other))
    {
        // End:0x189
        if(bNewTeam && PlayerController(Other) != none)
        {
            GameEvent("TeamChange", "" $ string(Num), Other.PlayerReplicationInfo);
        }
    }
    return true;
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
    local PlayerStart P;

    P = PlayerStart(N);
    // End:0x21
    if(P == none)
    {
        return -10000000.0;
    }
    // End:0x4e
    if(bSpawnInTeamArea && Team != P.TeamNumber)
    {
        return -9000000.0;
    }
    return super.RatePlayerStart(N, Team, Player);
}

function CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x10
    if(CheckMaxLives(Scorer))
    {
        return;
    }
    // End:0x36
    if(GameRulesModifiers != none && GameRulesModifiers.CheckScore(Scorer))
    {
        return;
    }
    // End:0x50
    if(!bOverTime && GoalScore == 0)
    {
        return;
    }
    // End:0xb1
    if(Scorer != none && Scorer.Team != none && Scorer.Team.Score >= float(GoalScore))
    {
        EndGame(Scorer, "teamscorelimit");
    }
    // End:0xdd
    if(Scorer != none && bOverTime)
    {
        EndGame(Scorer, "timelimit");
    }
    AnnounceWinningTeam();
}

function AnnounceWinningTeam()
{
    local byte byWinningTeam;

    // End:0x2a
    if(Teams[0].Score == Teams[1].Score)
    {
        return;
    }
    // End:0xc6
    else
    {
        // End:0x5a
        if(Teams[0].Score > Teams[1].Score)
        {
            byWinningTeam = 0;
        }
        // End:0x62
        else
        {
            byWinningTeam = 1;
        }
        // End:0xc6
        if(byWinningTeam != iCurWinningTeam)
        {
            TeamReceiveLocalizedMessage(byWinningTeam, class'wMessage_Game', class'wMessage_Game'.default.Code_TakingLead);
            TeamReceiveLocalizedMessage(byte(1 - byWinningTeam), class'wMessage_Game', class'wMessage_Game'.default.Code_FallingBehind);
            iCurWinningTeam = byWinningTeam;
        }
    }
}

function AnnounceEndingWinningTeam()
{
    local byte byWinningTeam;

    // End:0x2a
    if(Teams[0].Score == Teams[1].Score)
    {
        return;
    }
    // End:0xa8
    else
    {
        // End:0x5a
        if(Teams[0].Score > Teams[1].Score)
        {
            byWinningTeam = 0;
        }
        // End:0x62
        else
        {
            byWinningTeam = 1;
        }
        TeamReceiveLocalizedMessage(byWinningTeam, class'wMessage_Game', class'wMessage_Game'.default.Code_EndingWinning);
        TeamReceiveLocalizedMessage(byte(1 - byWinningTeam), class'wMessage_Game', class'wMessage_Game'.default.Code_EndingLosing);
    }
}

function AnnounceAlmostWinningTeam()
{
    local byte byWinningTeam;

    // End:0x5a
    if(Teams[0].Score == Teams[1].Score)
    {
        AllReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_EndingLosing);
        AllReceiveLocalizedMessage(class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverFallBehind);
    }
    // End:0x11e
    else
    {
        // End:0x8a
        if(Teams[0].Score > Teams[1].Score)
        {
            byWinningTeam = 0;
        }
        // End:0x92
        else
        {
            byWinningTeam = 1;
        }
        TeamReceiveLocalizedMessage(byWinningTeam, class'wMessage_Game', class'wMessage_Game'.default.Code_EndingWinning);
        TeamReceiveLocalizedMessage(byte(1 - byWinningTeam), class'wMessage_Game', class'wMessage_Game'.default.Code_EndingLosing);
        TeamReceiveLocalizedMessage(byWinningTeam, class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverLead);
        TeamReceiveLocalizedMessage(byte(1 - byWinningTeam), class'wMessage_BGM', class'wMessage_BGM'.default.Code_AlmostOverFallBehind);
    }
}

function bool CriticalPlayer(Controller Other)
{
    // End:0x26
    if(GameRulesModifiers != none && GameRulesModifiers.CriticalPlayer(Other))
    {
        return true;
    }
    // End:0x5b
    if(Other.PlayerReplicationInfo != none && Other.PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    return false;
}

function Pawn FindVictimsTarget(Controller Other)
{
    local Vector Start, X, Y, Z;
    local float dist, Aim;
    local Actor Target;

    // End:0x42
    if(Other == none || Other.Pawn == none || Other.Pawn.Weapon == none)
    {
        return none;
    }
    GetAxes(Other.Pawn.GetViewRotation(), X, Y, Z);
    Start = Other.Pawn.Location + Other.Pawn.CalcDrawOffset(Other.Pawn.Weapon);
    Aim = 0.970;
    Target = Other.PickTarget(Aim, dist, X, Start, 4000.0);
    return Pawn(Target);
}

function bool NearGoal(Controller C)
{
    return false;
}

function ScoreKill(Controller Killer, Controller Other)
{
    local int iOpposeTeam;

    iOpposeTeam = -1;
    // End:0x6f
    if(Killer == none || Killer == Other || Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team)
    {
        super.ScoreKill(Killer, Other);
    }
    // End:0x93
    else
    {
        // End:0x93
        if(GameRulesModifiers != none)
        {
            GameRulesModifiers.ScoreKill(Killer, Other);
        }
    }
    // End:0x1a5
    if(!bScoreTeamKills)
    {
        // End:0x184
        if(Other.bIsPlayer && Killer != none && Killer.bIsPlayer && Killer != Other && Killer.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team)
        {
            Killer.PlayerReplicationInfo.Score -= GameDecScore;
            Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            ScoreEvent(Killer.PlayerReplicationInfo, GameDecScore, "team_frag");
        }
        // End:0x1a3
        if(MaxLives > 0)
        {
            CheckScore(Killer.PlayerReplicationInfo);
        }
        return;
    }
    // End:0x58d
    if(true)
    {
        // End:0x2b3
        if(Killer == none)
        {
            // End:0x1e4
            if(Other.PlayerReplicationInfo.Team.TeamIndex == 0)
            {
                iOpposeTeam = 1;
            }
            // End:0x1eb
            else
            {
                iOpposeTeam = 0;
            }
            PlayerController(Other.Pawn.Controller).GameReplicationInfo.Teams[iOpposeTeam].Score += GetAddScore(Killer, Other);
            PlayerController(Other.Pawn.Controller).GameReplicationInfo.Teams[iOpposeTeam].NetUpdateTime = Level.TimeSeconds - float(1);
            TeamScoreEvent(iOpposeTeam, GetAddScore(Killer, Other), "tdm_frag");
        }
        // End:0x58d
        else
        {
            // End:0x37e
            if(Killer == Other)
            {
                Other.PlayerReplicationInfo.Team.Score = FMax(0.0, Other.PlayerReplicationInfo.Team.Score - GameDecScore);
                Other.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
                TeamScoreEvent(Killer.PlayerReplicationInfo.Team.TeamIndex, GameDecScore, "team_frag");
            }
            // End:0x58d
            else
            {
                // End:0x47e
                if(Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team)
                {
                    Killer.PlayerReplicationInfo.Team.Score += GetAddScore(Killer, Other);
                    Killer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
                    TeamScoreEvent(Killer.PlayerReplicationInfo.Team.TeamIndex, GetAddScore(Killer, Other), "tdm_frag");
                    // End:0x47b
                    if(Killer.Pawn != none)
                    {
                        SetTeamAssistPoint(Killer, Other);
                    }
                }
                // End:0x58d
                else
                {
                    // End:0x58d
                    if(FriendlyFireScale > float(0))
                    {
                        Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
                        Killer.PlayerReplicationInfo.Score -= GameDecScore;
                        Killer.PlayerReplicationInfo.Team.Score = FMax(0.0, Killer.PlayerReplicationInfo.Team.Score - GameDecScore);
                        Killer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
                        TeamScoreEvent(Killer.PlayerReplicationInfo.Team.TeamIndex, GameDecScore, "team_frag");
                    }
                }
            }
        }
    }
    // End:0x5b7
    if(Killer != none && bScoreTeamKills)
    {
        CheckScore(Killer.PlayerReplicationInfo);
    }
}

function SetTeamAssistPoint(Controller Killer, Controller Other)
{
    local array<Controller> AssistList;
    local int iTemp, AssisterUID, iMessageCode;
    local float fAssistScore;
    local byte byAssistType;

    // End:0x40
    if(Other.Pawn != none)
    {
        AssistList = Other.Pawn.GetAssistList(Killer.Pawn);
    }
    // End:0x76
    if(Other.IsA('wHelicopterController'))
    {
        fAssistScore = 6.0;
        iMessageCode = class'wMessage_Score'.default.Code_MessageScore_Assist_Special;
    }
    // End:0x95
    else
    {
        fAssistScore = GameAssistScore;
        iMessageCode = class'wMessage_Score'.default.Code_MessageScore_Assist;
    }
    iTemp = 0;
    J0x9c:
    // End:0x224 [While If]
    if(iTemp < AssistList.Length)
    {
        // End:0xe8
        if(AssistList[iTemp].PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team)
        {
        }
        // End:0x21a
        else
        {
            // End:0x100
            if(Killer == AssistList[iTemp])
            {
            }
            // End:0x21a
            else
            {
                AssisterUID = AssistList[iTemp].PlayerReplicationInfo.GetUID();
                Log(string(self) $ "/ AssisterUID : " $ string(AssisterUID));
                // End:0x181
                if(iMessageCode == class'wMessage_Score'.default.Code_MessageScore_Assist)
                {
                    iMessageCode = Other.Pawn.GetAssistScore(AssisterUID);
                }
                fAssistScore = float(GetAssistScore(byAssistType, iMessageCode));
                AssistList[iTemp].PlayerReplicationInfo.Team.Score += fAssistScore;
                AssistList[iTemp].PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
                CheckScore(AssistList[iTemp].PlayerReplicationInfo);
            }
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x9c;
    }
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
{
    local int InjuredTeam, InstigatorTeam;
    local Controller InstigatorController;

    // End:0x1f
    if(instigatedBy != none)
    {
        InstigatorController = instigatedBy.Controller;
    }
    InjuredTeam = injured.GetTeamNum();
    // End:0xe9
    if(InstigatorController == none)
    {
        // End:0x6b
        if(DamageType.default.bDelayedDamage)
        {
            InstigatorController = injured.GetDelayedInstigatorController(instigatedBy);
        }
        // End:0xe9
        if(InstigatorController == none)
        {
            // End:0xbf
            if(string(DamageType) ~= "WWeapons_Res.wWeaponRes_Artillery")
            {
                // End:0xbf
                if(Level.AirStrikeTeamIndex == InjuredTeam)
                {
                    return 0;
                }
            }
            return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
        }
    }
    // End:0x114
    if(instigatedBy.IsA('wHelicopter'))
    {
        InstigatorTeam = instigatedBy.TeamIndex;
    }
    // End:0x129
    else
    {
        InstigatorTeam = InstigatorController.GetTeamNum();
    }
    // End:0x3ab
    if(InstigatorController != injured.Controller || instigatedBy.IsA('wHelicopter'))
    {
        // End:0x3a8
        if(InjuredTeam != 255 && InstigatorTeam != 255)
        {
            // End:0x304
            if(InjuredTeam == InstigatorTeam)
            {
                // End:0x1ae
                if(class<WeaponDamageType>(DamageType) != none || class<VehicleDamageType>(DamageType) != none)
                {
                    Momentum *= TeammateBoost;
                }
                // End:0x20b
                if(Bot(injured.Controller) != none && InstigatorController.Pawn != none)
                {
                    Bot(injured.Controller).YellAt(InstigatorController.Pawn);
                }
                // End:0x27c
                else
                {
                    // End:0x27c
                    if(PlayerController(injured.Controller) != none && injured.Controller.AutoTaunt())
                    {
                        injured.Controller.SendMessage(InstigatorController.PlayerReplicationInfo, 'FRIENDLYFIRE', byte(Rand(3)), 5.0, 'Team');
                    }
                }
                // End:0x2f5
                if(FriendlyFireScale == 0.0 || Vehicle(injured) != none && Vehicle(injured).bNoFriendlyFire)
                {
                    // End:0x2f3
                    if(GameRulesModifiers != none)
                    {
                        return GameRulesModifiers.NetDamage(Damage, 0, injured, instigatedBy, HitLocation, Momentum, DamageType);
                    }
                    // End:0x2f5
                    else
                    {
                        return 0;
                    }
                }
                Damage *= FriendlyFireScale;
            }
            // End:0x3a8
            else
            {
                // End:0x3a8
                if(!injured.IsHumanControlled() && injured.Controller != none && injured.PlayerReplicationInfo != none && injured.PlayerReplicationInfo.HasFlag != none)
                {
                    injured.Controller.SendMessage(none, 'Other', injured.Controller.GetMessageIndex('injured'), 15.0, 'Team');
                }
            }
        }
    }
    // End:0x3f6
    else
    {
        // End:0x3f6
        if(string(DamageType) ~= "WWeapons_Res.wWeaponRes_Artillery" && InstigatorController == injured.Controller)
        {
            return 0;
        }
    }
    return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
}

function bool SameTeam(Controller A, Controller B)
{
    // End:0x1a
    if(A == none || B == none)
    {
        return false;
    }
    return A.PlayerReplicationInfo.Team.TeamIndex == B.PlayerReplicationInfo.Team.TeamIndex;
}

function bool TooManyBots(Controller botToRemove)
{
    // End:0x40
    if(Level.NetMode != 0 && bPlayersVsBots)
    {
        return NumBots > Min(16, int(BotRatio * float(NumPlayers)));
    }
    // End:0xe7
    if(botToRemove.PlayerReplicationInfo != none && botToRemove.PlayerReplicationInfo.Team != none)
    {
        // End:0xc0
        if(botToRemove.PlayerReplicationInfo.Team == Teams[0])
        {
            // End:0xbd
            if(Teams[0].Size < Teams[1].Size)
            {
                return false;
            }
        }
        // End:0xe7
        else
        {
            // End:0xe7
            if(Teams[1].Size < Teams[0].Size)
            {
                return false;
            }
        }
    }
    return super.TooManyBots(botToRemove);
}

function PlayEndOfMatchMessage()
{
    local byte byWinnerTeam;

    // End:0x30
    if(Teams[0].Score > Teams[1].Score)
    {
        byWinnerTeam = 0;
    }
    // End:0x38
    else
    {
        byWinnerTeam = 1;
    }
    TeamReceiveLocalizedMessage(byWinnerTeam, class'wMessage_Game', class'wMessage_Game'.default.Code_Win);
    TeamReceiveLocalizedMessage(byte(1 - byWinnerTeam), class'wMessage_Game', class'wMessage_Game'.default.Code_Lose);
}

static function string ParseChatPercVar(Mutator BaseMutator, Controller Who, string Cmd)
{
    local float minDist, currDist, currInvDist, BestInvDist;
    local Actor Closest;
    local string near, where, locName;
    local InventorySpot S, BestInv;
    local GameObjective Go;
    local NavigationPoint N;

    // End:0x1a
    if(Who.Pawn == none)
    {
        return Cmd;
    }
    // End:0x4d
    if(Cmd ~= "%H")
    {
        return string(Who.Pawn.Health) $ " Health";
    }
    // End:0xdd
    if(Cmd ~= "%W")
    {
        // End:0x9d
        if(Who.Pawn.Weapon != none)
        {
            return Who.Pawn.Weapon.GetHumanReadableName();
        }
        // End:0xdd
        else
        {
            // End:0xd7
            if(Vehicle(Who.Pawn) != none)
            {
                return Vehicle(Who.Pawn).GetVehiclePositionString();
            }
            // End:0xdd
            else
            {
                return default.BareHanded;
            }
        }
    }
    // End:0xef
    if(Cmd == "%%")
    {
        return "%";
    }
    // End:0x3b1
    if(Cmd ~= "%L")
    {
        minDist = 10000000.0;
        BestInvDist = 2000.0;
        N = Who.Level.NavigationPointList;
        J0x130:
        // End:0x249 [While If]
        if(N != none)
        {
            S = InventorySpot(N);
            // End:0x1c3
            if(S != none && S.markedItem != none)
            {
                currInvDist = VSize(S.Location - Who.Pawn.Location);
                // End:0x1c0
                if(currInvDist < BestInvDist)
                {
                    BestInvDist = currInvDist;
                    BestInv = S;
                }
            }
            // End:0x232
            else
            {
                Go = GameObjective(N);
                // End:0x232
                if(Go != none)
                {
                    currDist = VSize(Go.Location - Who.Pawn.Location);
                    // End:0x232
                    if(currDist < minDist)
                    {
                        minDist = currDist;
                        Closest = Go;
                    }
                }
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x130;
        }
        // End:0x2aa
        if(minDist > float(2048) && BestInvDist < minDist && BestInv != none)
        {
            Closest = BestInv.markedItem;
            near = BestInv.markedItem.GetHumanReadableName();
        }
        // End:0x2f3
        if(Who != none && Who.PlayerReplicationInfo != none)
        {
            locName = "(" $ Who.PlayerReplicationInfo.GetLocationName() $ ")";
        }
        // End:0x3b1
        if(Closest != none)
        {
            // End:0x334
            if(GameObjective(Closest) != none)
            {
                return default.NearString @ GameObjective(Closest).GetHumanReadableName() @ locName;
            }
            // End:0x3b1
            else
            {
                where = Who.Level.Game.FindTeamDesignation(PlayerController(Who).GameReplicationInfo, Closest);
                // End:0x396
                if(where == "")
                {
                    return default.NearString @ near @ locName;
                }
                // End:0x3b1
                else
                {
                    return default.NearString @ where @ near @ locName;
                }
            }
        }
    }
    return super(GameInfo).ParseChatPercVar(BaseMutator, Who, Cmd);
}

static function string FindTeamDesignation(GameReplicationInfo GRI, Actor A)
{
    // End:0x50
    if(GRI == none || GRI.Teams[0].HomeBase == none || GRI.Teams[1].HomeBase == none)
    {
        return "";
    }
    // End:0xe0
    if(VSize(A.Location - GRI.Teams[0].HomeBase.Location) < VSize(A.Location - GRI.Teams[1].HomeBase.Location))
    {
        return GRI.Teams[0].GetHumanReadableName() $ " ";
    }
    // End:0x100
    else
    {
        return GRI.Teams[1].GetHumanReadableName() $ " ";
    }
}

static function string ParseMessageString(Mutator BaseMutator, Controller Who, string Message)
{
    local string OutMsg, Cmd;
    local int pos, i;

    OutMsg = "";
    pos = InStr(Message, "%");
    J0x18:
    // End:0xea [While If]
    if(pos > -1)
    {
        // End:0x64
        if(pos > 0)
        {
            OutMsg = OutMsg $ Left(Message, pos);
            Message = Mid(Message, pos);
            pos = 0;
        }
        i = Len(Message);
        Cmd = Mid(Message, pos, 2);
        // End:0xad
        if(i - 2 > 0)
        {
            Message = Right(Message, i - 2);
        }
        // End:0xb5
        else
        {
            Message = "";
        }
        OutMsg = OutMsg $ ParseChatPercVar(BaseMutator, Who, Cmd);
        pos = InStr(Message, "%");
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    // End:0x108
    if(Message != "")
    {
        OutMsg = OutMsg $ Message;
    }
    return OutMsg;
}

function FindNewObjectives(GameObjective DisabledObjective)
{
    Teams[0].AI.FindNewObjectives(DisabledObjective);
    Teams[1].AI.FindNewObjectives(DisabledObjective);
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.BotsGroup, "bBalanceTeams", default.TGPropsDisplayText[++ i], 0, 2, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bPlayersBalanceTeams", default.TGPropsDisplayText[++ i], 0, 1, "Check",,, true);
    PlayInfo.AddSetting(default.GameGroup, "FriendlyFireScale", default.TGPropsDisplayText[++ i], 20, 1, "Text", "8;0.0:1.0",,, true);
    PlayInfo.AddSetting(default.ChatGroup, "bAllowNonTeamChat", default.TGPropsDisplayText[++ i], 60, 1, "Check",, "Xv", true, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x21
        case "bBalanceTeams":
            return default.TGPropDescText[0];
        // End:0x42
        case "bPlayersBalanceTeams":
            return default.TGPropDescText[1];
        // End:0x61
        case "FriendlyFireScale":
            return default.TGPropDescText[2];
        // End:0x80
        case "bAllowNonTeamChat":
            return default.TGPropDescText[3];
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x24
    if(InStr(PropertyName, "bColoredDMSkins") != -1)
    {
        return false;
    }
    return super.AcceptPlayInfoProperty(PropertyName);
}

function AnnounceScore(int ScoringTeam)
{
    local Controller C;
    local name ScoreSound;
    local int OtherTeam;

    // End:0x15
    if(ScoringTeam == 1)
    {
        OtherTeam = 0;
    }
    // End:0x1c
    else
    {
        OtherTeam = 1;
    }
    // End:0x62
    if(Teams[ScoringTeam].Score == Teams[OtherTeam].Score + float(1))
    {
        ScoreSound = TakeLeadName[ScoringTeam];
    }
    // End:0xba
    else
    {
        // End:0xa9
        if(Teams[ScoringTeam].Score == Teams[OtherTeam].Score + float(2))
        {
            ScoreSound = IncreaseLeadName[ScoringTeam];
        }
        // End:0xba
        else
        {
            ScoreSound = CaptureSoundName[ScoringTeam];
        }
    }
    C = Level.ControllerList;
    J0xce:
    // End:0x122 [While If]
    if(C != none)
    {
        // End:0x10b
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).PlayStatusAnnouncement(string(ScoreSound), 1, true);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xce;
    }
}

function InitVoiceReplicationInfo()
{
    super(UnrealMPGameInfo).InitVoiceReplicationInfo();
    // End:0x40
    if(VoiceReplicationInfo != none && TeamVoiceReplicationInfo(VoiceReplicationInfo) != none)
    {
        TeamVoiceReplicationInfo(VoiceReplicationInfo).bTeamChatOnly = !bAllowNonTeamChat;
    }
}

event PostLogin(PlayerController NewPlayer)
{
    super.PostLogin(NewPlayer);
    // End:0x6e
    if(NewPlayer.PlayerReplicationInfo.Team != none)
    {
        GameEvent("TeamChange", "" $ string(NewPlayer.PlayerReplicationInfo.Team.TeamIndex), NewPlayer.PlayerReplicationInfo);
    }
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.TGHints.Length == 0)
    {
        Hints = super.GetAllLoadHints();
    }
    i = 0;
    J0x2c:
    // End:0x5e [While If]
    if(i < default.TGHints.Length)
    {
        Hints[Hints.Length] = default.TGHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

function WeakObjectives()
{
    local GameObjective Go;

    Go = Teams[0].AI.Objectives;
    J0x1f:
    // End:0x6a [While If]
    if(Go != none)
    {
        // End:0x53
        if(Go.IsA('DestroyableObjective'))
        {
            DestroyableObjective(Go).Health = 1;
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function bool PickEndGameTauntFor(Bot B)
{
    // End:0x21
    if(Level.TimeSeconds - LastEndGameTauntTime < 1.50)
    {
        return false;
    }
    // End:0x40
    if(B.PlayerReplicationInfo.Team == none)
    {
        return false;
    }
    // End:0x78
    if(B.PlayerReplicationInfo.Team != GameReplicationInfo.Winner)
    {
        EndGameCommentFor(B);
    }
    // End:0x83
    else
    {
        EndGameTauntFor(B);
    }
    LastEndGameTauntTime = Level.TimeSeconds;
    return true;
}

function EndGameCommentFor(Bot B)
{
    local Controller C, Best;
    local string S;

    // End:0x12a
    if(FRand() < 0.40)
    {
        LastEndGameRemark = Rand(10);
        // End:0x125
        if(EndGameRemark[LastEndGameRemark] == 0)
        {
            S = EndGameLossRemarks[LastEndGameRemark];
            LastEndGameComment = -1;
            EndGameRemark[LastEndGameRemark] = 1;
            // End:0x122
            if(LastEndGameRemark == 0)
            {
                C = Level.ControllerList;
                J0x72:
                // End:0xf1 [While If]
                if(C != none)
                {
                    // End:0xda
                    if(PlayerController(C) != none && Best == none || C.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)
                    {
                        Best = C;
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x72;
                }
                // End:0xfe
                if(Best == none)
                {
                    return;
                }
                S = Best.PlayerReplicationInfo.PlayerName @ S;
            }
        }
        // End:0x127
        else
        {
            return;
        }
    }
    // End:0x195
    else
    {
        // End:0x154
        if(LastEndGameComment == -1)
        {
            LastEndGameComment = 10;
            S = EndGameResponses[Rand(10)];
        }
        // End:0x195
        else
        {
            LastEndGameComment = Rand(10);
            // End:0x193
            if(EndGameCommented[LastEndGameComment] == 0)
            {
                EndGameCommented[LastEndGameComment] = 1;
                S = EndGameComments[LastEndGameComment];
            }
            // End:0x195
            else
            {
                return;
            }
        }
    }
    Broadcast(B, S, 'Say');
}

function EndGameTauntFor(Bot B)
{
    local string S;

    // End:0x5b
    if(FRand() < 0.40)
    {
        LastEndGameRemark = Rand(10);
        // End:0x56
        if(EndGameRemark[LastEndGameRemark] == 0)
        {
            S = EndGameVictoryRemarks[LastEndGameRemark];
            LastEndGameComment = -1;
            EndGameRemark[LastEndGameRemark] = 1;
        }
        // End:0x58
        else
        {
            return;
        }
    }
    // End:0xc6
    else
    {
        // End:0x85
        if(LastEndGameComment == -1)
        {
            LastEndGameComment = 10;
            S = EndGameResponses[Rand(10)];
        }
        // End:0xc6
        else
        {
            LastEndGameComment = Rand(10);
            // End:0xc4
            if(EndGameCommented[LastEndGameComment] == 0)
            {
                EndGameCommented[LastEndGameComment] = 1;
                S = EndGameTaunts[LastEndGameComment];
            }
            // End:0xc6
            else
            {
                return;
            }
        }
    }
    Broadcast(B, S, 'Say');
}

state MatchInProgress
{
    function Timer()
    {
        super.Timer();
        // End:0x2e
        if(!bAnnouncedAlmostWinningTeam && GetTimeSecondsLeft() <= 60)
        {
            bAnnouncedAlmostWinningTeam = true;
            AnnounceAlmostWinningTeam();
        }
    }

}

defaultproperties
{
    bBalanceTeams=true
    bPlayersBalanceTeams=true
    bScoreTeamKills=true
    MaxTeamSize=32
    TeammateBoost=0.30
    TeamAIType[0]=class'TeamAI'
    TeamAIType[1]=class'TeamAI'
    PathWhisps[0]="XEffects.RedWhisp"
    PathWhisps[1]="XEffects.BlueWhisp"
    NearString="??"
    BareHanded="????"
    CaptureSoundName[0]=Red_Team_Scores
    CaptureSoundName[1]=Blue_Team_Scores
    TakeLeadName[0]=Red_Team_takes_the_lead
    TakeLeadName[1]=Blue_Team_takes_the_lead
    IncreaseLeadName[0]=Red_Team_increases_their_lead
    IncreaseLeadName[1]=Blue_Team_increases_their_lead
    TGPropsDisplayText[0]="? ? ???"
    TGPropsDisplayText[1]="???? ? ???"
    TGPropsDisplayText[2]="???? ??? ??? ??"
    TGPropsDisplayText[3]="?? ?? ??? ??"
    TGPropsDisplayText[4]="?? ? ??"
    TGPropDescText[0]="??? ??? ?? ?? ?? ????? ?? ?? ????."
    TGPropDescText[1]="????? ?? ?? ?? ??? ?? ?? ?????."
    TGPropDescText[2]="?? ?? ????? ???? ??? ??? ?? ? ??? ?????."
    TGPropDescText[3]="??? ????? ?? ??? ???? ??? ? ???? ??? ????."
    TGPropDescText[4]="? ? ????? ????? ?????."
    TGHints=// Object reference not set to an instance of an object.
    
    ADR_Goal=25.0
    ADR_Return=5.0
    ADR_Control=2.0
    EndGameComments[0]="lllllllamas"
    EndGameComments[1]="bye"
    EndGameComments[2]="gg"
    EndGameComments[3]="gg"
    EndGameComments[4]="gg everyone"
    EndGameComments[5]="Teams"
    EndGameComments[6]="omg"
    EndGameComments[7]="dammit!"
    EndGameComments[8]="my team sux0rs"
    EndGameComments[9]="gg"
    EndGameTaunts[0]="woot"
    EndGameTaunts[1]="DENIED!"
    EndGameTaunts[2]="gg everyone"
    EndGameTaunts[3]="gg"
    EndGameTaunts[4]="gg"
    EndGameTaunts[5]="PANTS!"
    EndGameTaunts[6]="owned"
    EndGameTaunts[7]="Booyah!"
    EndGameTaunts[8]="W00T!"
    EndGameTaunts[9]="oh yeah!"
    EndGameVictoryRemarks[0]="Take that to the bank, punks!"
    EndGameVictoryRemarks[1]="omg, so owned."
    EndGameVictoryRemarks[2]="Our Victory, Your Defeat"
    EndGameVictoryRemarks[3]="You know, practice might help"
    EndGameVictoryRemarks[4]="You suckas got served"
    EndGameVictoryRemarks[5]="That was pathetic"
    EndGameVictoryRemarks[6]="Ya mamma!"
    EndGameVictoryRemarks[7]="pwned!"
    EndGameVictoryRemarks[8]="u r teh suk"
    EndGameVictoryRemarks[9]="Humans need better AI"
    EndGameLossRemarks[0]="was using an aimbot"
    EndGameLossRemarks[1]="Take a screenshot, this won?t happen again."
    EndGameLossRemarks[2]="crappy map"
    EndGameLossRemarks[3]="this server sux"
    EndGameLossRemarks[4]="Campers."
    EndGameLossRemarks[5]="Omg wtf wallhacking mofos"
    EndGameLossRemarks[6]="Where's Malcolm when you need him?"
    EndGameLossRemarks[7]="my team sux"
    EndGameLossRemarks[8]="OMG Epic plz fix kthxbye"
    EndGameLossRemarks[9]="Vwvwvwvwvwvwvwvwvwvwvwvzxcjjj"
    EndGameResponses[0]=":)"
    EndGameResponses[1]=";)"
    EndGameResponses[2]="haha"
    EndGameResponses[3]="LOL"
    EndGameResponses[4]="lol"
    EndGameResponses[5]="ROFL"
    EndGameResponses[6]="rofl"
    EndGameResponses[7]="werd"
    EndGameResponses[8]="ahaha"
    EndGameResponses[9]="omg"
    iCurWinningTeam=-1
    bMustHaveMultiplePlayers=true
    NumRounds=5
    EndMessageWait=3
    SinglePlayerWait=2
    bCanChangeSkin=true
    bTeamGame=true
    ScoreBoardType="XInterface.ScoreBoardTeamDeathMatch"
    BeaconName="Team"
    GoalScore=60
    VoiceReplicationInfoClass=class'TeamVoiceReplicationInfo'
    Description="? ????: ???? ??? ???? ?? ? ?? ???? ????. ?? ?? ??? ??? ?? ????."
}