/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TeamAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:33
 *
 *******************************************************************************/
class TeamAI extends Info
    dependson(HoldSpot)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var UnrealTeamInfo Team;
var UnrealTeamInfo EnemyTeam;
var int NumSupportingPlayer;
var GameObjective Objectives;
var GameObjective PickedObjective;
var SquadAI Squads;
var SquadAI AttackSquad;
var SquadAI FreelanceSquad;
var class<SquadAI> SquadType;
var int OrderOffset;
var name OrderList[8];
var Pickup SuperPickups[16];
var int NumSuperPickups;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetTimer(5.0, true);
}

function Timer()
{
    ReAssessStrategy();
}

function CriticalObjectiveWarning(GameObjective G, Pawn NewEnemy);
function CallForBall(Pawn Recipient);
function bool SuperPickupAvailable(Bot B)
{
    local int i;
    local Pickup P;

    // End:0x56
    if(NumSuperPickups == 0)
    {
        // End:0x55
        foreach DynamicActors(class'Pickup', P)
        {
            // End:0x54
            if(P.IsSuperItem())
            {
                SuperPickups[NumSuperPickups] = P;
                ++ NumSuperPickups;
                // End:0x54
                if(NumSuperPickups == 16)
                {
                }
                // End:0x55
                else
                {
                }
                continue;
            }            
        }
    }
    // End:0x6e
    if(NumSuperPickups <= 0)
    {
        NumSuperPickups = -1;
        return false;
    }
    i = 0;
    J0x75:
    // End:0xdf [While If]
    if(i < NumSuperPickups)
    {
        // End:0xd5
        if(SuperPickups[i] != none && SuperPickups[i].ReadyToPickup(0.0) && B.SuperPickupNotSpokenFor(SuperPickups[i]))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    // End:0xed
    if(NumSuperPickups < 16)
    {
        return false;
    }
    // End:0x12a
    foreach DynamicActors(class'Pickup', P)
    {
        // End:0x129
        if(P.IsSuperItem())
        {
            // End:0x129
            if(P.ReadyToPickup(2.0))
            {
                break;
                return true;
            }
        }                
    }
    return false;
}

function Reset()
{
    super(Actor).Reset();
    PickedObjective = none;
}

function ClearEnemies()
{
    local SquadAI S;
    local int i;
    local Bot M;

    Reset();
    S = Squads;
    J0x11:
    // End:0xa4 [While If]
    if(S != none)
    {
        i = 0;
        J0x23:
        // End:0x48 [While If]
        if(i < 8)
        {
            S.Reset();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x23;
        }
        M = S.SquadMembers;
        J0x5c:
        // End:0x8d [While If]
        if(M != none)
        {
            M.Reset();
            M = M.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x5c;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
}

function SquadAI GetSquadLedBy(Controller C)
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x4b [While If]
    if(S != none)
    {
        // End:0x34
        if(S.SquadLeader == C)
        {
            return S;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return none;
}

function ReAssessStrategy()
{
    local GameObjective o;
    local int PlusDiff, MinusDiff;

    // End:0x0d
    if(FreelanceSquad == none)
    {
        return;
    }
    // End:0x66
    if(Level.Game.TimeLimit > 0)
    {
        PlusDiff = 0;
        MinusDiff = 2;
        // End:0x63
        if(DeathMatch(Level.Game).RemainingTime < 180)
        {
            MinusDiff = 0;
        }
    }
    // End:0x76
    else
    {
        PlusDiff = 2;
        MinusDiff = 2;
    }
    FreelanceSquad.bFreelanceAttack = false;
    FreelanceSquad.bFreelanceDefend = false;
    // End:0xe2
    if(Team.Score > EnemyTeam.Score + float(PlusDiff))
    {
        FreelanceSquad.bFreelanceDefend = true;
        o = GetLeastDefendedObjective();
    }
    // End:0x13d
    else
    {
        // End:0x131
        if(Team.Score < EnemyTeam.Score - float(MinusDiff))
        {
            FreelanceSquad.bFreelanceAttack = true;
            o = GetPriorityAttackObjectiveFor(FreelanceSquad);
        }
        // End:0x13d
        else
        {
            o = GetPriorityFreelanceObjective();
        }
    }
    // End:0x177
    if(o != none && o != FreelanceSquad.SquadObjective)
    {
        FreelanceSquad.SetObjective(o, true);
    }
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x4b [While If]
    if(S != none)
    {
        S.NotifyKilled(Killer, Killed, KilledPawn);
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function FindNewObjectives(GameObjective DisabledObjective)
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x51 [While If]
    if(S != none)
    {
        // End:0x3a
        if(S.SquadObjective == DisabledObjective)
        {
            FindNewObjectiveFor(S, true);
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function FindNewObjectiveFor(SquadAI S, bool bForceUpdate)
{
    local GameObjective o, temp;

    // End:0x1b
    if(PlayerController(S.SquadLeader) != none)
    {
        return;
    }
    // End:0x3c
    if(S.bFreelance)
    {
        o = GetPriorityFreelanceObjective();
    }
    // End:0x66
    else
    {
        // End:0x66
        if(S.GetOrders() == 'Attack')
        {
            o = GetPriorityAttackObjectiveFor(S);
        }
    }
    // End:0x11f
    if(o == none)
    {
        o = GetLeastDefendedObjective();
        // End:0x11f
        if(o != none && o.DefenseSquad != none)
        {
            // End:0xd9
            if(S.GetOrders() == 'Attack')
            {
                S.MergeWith(o.DefenseSquad);
                return;
            }
            // End:0x11f
            else
            {
                temp = o;
                o = GetPriorityAttackObjectiveFor(S);
                // End:0x11f
                if(o == none)
                {
                    S.MergeWith(temp.DefenseSquad);
                    return;
                }
            }
        }
    }
    // End:0x16a
    if(o == none && S.bFreelance || S.GetOrders() == 'Defend')
    {
        o = GetPriorityAttackObjectiveFor(S);
    }
    S.SetObjective(o, bForceUpdate);
}

function RemoveSquad(SquadAI Squad)
{
    local SquadAI S;

    // End:0x25
    if(Squad == Squads)
    {
        Squads = Squads.NextSquad;
        return;
    }
    S = Squads;
    J0x30:
    // End:0x92 [While If]
    if(S != none)
    {
        // End:0x7b
        if(S.NextSquad == Squad)
        {
            S.NextSquad = S.NextSquad.NextSquad;
            return;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
}

function bool OnThisTeam(Pawn Other)
{
    // End:0x33
    if(Other.PlayerReplicationInfo != none)
    {
        return Other.PlayerReplicationInfo.Team == Team;
    }
    // End:0x69
    if(Vehicle(Other) != none)
    {
        return Vehicle(Other).Team == Team.TeamIndex;
    }
    return false;
}

function SquadAI FindSquadOf(Controller C)
{
    local SquadAI S;

    // End:0x24
    if(Bot(C) != none)
    {
        return Bot(C).Squad;
    }
    S = Squads;
    J0x2f:
    // End:0x6f [While If]
    if(S != none)
    {
        // End:0x58
        if(S.SquadLeader == C)
        {
            return S;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    return none;
}

function bool FriendlyToward(Pawn Other)
{
    return OnThisTeam(Other);
}

function SetObjectiveLists()
{
    local GameObjective o;

    // End:0x31
    foreach AllActors(class'GameObjective', o)
    {
        // End:0x30
        if(o.bFirstObjective)
        {
            Objectives = o;
        }
        // End:0x31
        else
        {
            continue;
        }        
    }
}

function SquadAI FindHumanSquad()
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x50 [While If]
    if(S != none)
    {
        // End:0x39
        if(S.SquadLeader.IsA('PlayerController'))
        {
            return S;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function SquadAI AddHumanSquad()
{
    local SquadAI S;
    local Controller P;

    S = FindHumanSquad();
    // End:0x1d
    if(S != none)
    {
        return S;
    }
    P = Level.ControllerList;
    J0x31:
    // End:0xb6 [While If]
    if(P != none)
    {
        // End:0x9f
        if(P.IsA('PlayerController') && P.PlayerReplicationInfo.Team == Team && !P.PlayerReplicationInfo.bOnlySpectator)
        {
            return AddSquadWithLeader(P, none);
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

function PutBotOnSquadLedBy(Controller C, Bot B)
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x48 [While If]
    if(S != none)
    {
        // End:0x31
        if(S.SquadLeader == C)
        {
        }
        // End:0x48
        else
        {
            S = S.NextSquad;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
    // End:0x77
    if(S == none && PlayerController(C) != none)
    {
        S = AddSquadWithLeader(C, none);
    }
    // End:0x96
    if(S != none)
    {
        S.AddBot(B);
    }
}

function SquadAI AddSquadWithLeader(Controller C, GameObjective o)
{
    local SquadAI S;

    S = Spawn(SquadType);
    S.Initialize(Team, o, C);
    S.NextSquad = Squads;
    Squads = S;
    return S;
}

function GameObjective GetLeastDefendedObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0x105 [While If]
    if(o != none)
    {
        // End:0xee
        if(!o.bDisabled && o.bActive && o.DefenderTeamIndex == Team.TeamIndex && Best == none || Best.DefensePriority < o.DefensePriority || Best.DefensePriority == o.DefensePriority && Best.GetNumDefenders() > o.GetNumDefenders())
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function GameObjective GetMostDefendedObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0x105 [While If]
    if(o != none)
    {
        // End:0xee
        if(!o.bDisabled && o.bActive && o.DefenderTeamIndex == Team.TeamIndex && Best == none || Best.DefensePriority < o.DefensePriority || Best.DefensePriority == o.DefensePriority && Best.GetNumDefenders() < o.GetNumDefenders())
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function GameObjective GetPriorityAttackObjective()
{
    return GetPriorityAttackObjectiveFor(none);
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
    local GameObjective o;

    // End:0x26
    if(PickedObjective != none && PickedObjective.bDisabled)
    {
        PickedObjective = none;
    }
    // End:0x11f
    if(PickedObjective == none)
    {
        o = Objectives;
        J0x3c:
        // End:0x11f [While If]
        if(o != none)
        {
            // End:0x108
            if(!o.bDisabled && o.bActive && o.DefenderTeamIndex != Team.TeamIndex && PickedObjective == none || PickedObjective.DefensePriority < o.DefensePriority || PickedObjective.DefensePriority == o.DefensePriority && FRand() < 0.30)
            {
                PickedObjective = o;
            }
            o = o.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x3c;
        }
    }
    return PickedObjective;
}

function GameObjective GetPriorityFreelanceObjective()
{
    return GetPriorityAttackObjectiveFor(none);
}

function bool PutOnDefense(Bot B)
{
    local GameObjective o;

    o = GetLeastDefendedObjective();
    // End:0x6c
    if(o != none)
    {
        // End:0x4d
        if(o.DefenseSquad == none)
        {
            o.DefenseSquad = AddSquadWithLeader(B, o);
        }
        // End:0x6a
        else
        {
            o.DefenseSquad.AddBot(B);
        }
        return true;
    }
    return false;
}

function PutOnOffense(Bot B)
{
    // End:0x49
    if(AttackSquad == none || AttackSquad.Size >= AttackSquad.MaxSquadSize)
    {
        AttackSquad = AddSquadWithLeader(B, GetPriorityAttackObjectiveFor(none));
    }
    // End:0x5d
    else
    {
        AttackSquad.AddBot(B);
    }
}

function PutOnFreelance(Bot B)
{
    // End:0x48
    if(FreelanceSquad == none || FreelanceSquad.Size >= FreelanceSquad.MaxSquadSize)
    {
        FreelanceSquad = AddSquadWithLeader(B, GetPriorityFreelanceObjective());
    }
    // End:0x5c
    else
    {
        FreelanceSquad.AddBot(B);
    }
    // End:0x9a
    if(!FreelanceSquad.bFreelance)
    {
        FreelanceSquad.bFreelance = true;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

function SetBotOrders(Bot NewBot, RosterEntry R)
{
    local SquadAI HumanSquad;
    local name NewOrders;

    // End:0x11
    if(Objectives == none)
    {
        SetObjectiveLists();
    }
    // End:0x70
    if(R == none || R.NoRecommendation())
    {
        // End:0x4b
        if(Team.Size == 0)
        {
            OrderOffset = 0;
        }
        NewOrders = OrderList[int(float(OrderOffset) % float(8))];
        ++ OrderOffset;
    }
    // End:0xdb
    else
    {
        // End:0x90
        if(R.RecommendDefense())
        {
            NewOrders = 'Defend';
        }
        // End:0xdb
        else
        {
            // End:0xb0
            if(R.RecommendAttack())
            {
                NewOrders = 'Attack';
            }
            // End:0xdb
            else
            {
                // End:0xd0
                if(R.RecommendSupport())
                {
                    NewOrders = 'Follow';
                }
                // End:0xdb
                else
                {
                    NewOrders = 'Freelance';
                }
            }
        }
    }
    // End:0xfc
    if(NewOrders == 'Defend' && PutOnDefense(NewBot))
    {
        return;
    }
    // End:0x118
    if(NewOrders == 'Freelance')
    {
        PutOnFreelance(NewBot);
        return;
    }
    // End:0x134
    if(NewOrders == 'Attack')
    {
        PutOnOffense(NewBot);
        return;
    }
    // End:0x170
    if(NewOrders == 'Follow')
    {
        HumanSquad = AddHumanSquad();
        // End:0x170
        if(HumanSquad != none)
        {
            HumanSquad.AddBot(NewBot);
            return;
        }
    }
    PutOnOffense(NewBot);
}

function SetOrders(Bot B, name NewOrders, Controller OrderGiver)
{
    local TeamPlayerReplicationInfo PRI;

    PRI = TeamPlayerReplicationInfo(B.PlayerReplicationInfo);
    // End:0x52
    if(HoldSpot(B.GoalScript) != none)
    {
        PRI.bHolding = false;
        B.FreeScript();
    }
    // End:0x144
    if(NewOrders == 'HOLD')
    {
        PRI.bHolding = true;
        PutBotOnSquadLedBy(OrderGiver, B);
        B.GoalScript = PlayerController(OrderGiver).ViewTarget.Spawn(class'HoldSpot');
        // End:0x103
        if(Vehicle(PlayerController(OrderGiver).ViewTarget) != none)
        {
            HoldSpot(B.GoalScript).HoldVehicle = Vehicle(PlayerController(OrderGiver).ViewTarget);
        }
        // End:0x141
        if(PlayerController(OrderGiver).ViewTarget.Physics == 11)
        {
            B.GoalScript.SetPhysics(11);
        }
    }
    // End:0x1cb
    else
    {
        // End:0x161
        if(NewOrders == 'Defend')
        {
            PutOnDefense(B);
        }
        // End:0x1cb
        else
        {
            // End:0x17e
            if(NewOrders == 'Attack')
            {
                PutOnOffense(B);
            }
            // End:0x1cb
            else
            {
                // End:0x1af
                if(NewOrders == 'Follow')
                {
                    B.FreeScript();
                    PutBotOnSquadLedBy(OrderGiver, B);
                }
                // End:0x1cb
                else
                {
                    // End:0x1cb
                    if(NewOrders == 'Freelance')
                    {
                        PutOnFreelance(B);
                        return;
                    }
                }
            }
        }
    }
}

function CallForHelp(Bot B);
function RemoveFromTeam(Controller Other)
{
    local SquadAI S;

    // End:0x59
    if(PlayerController(Other) != none)
    {
        S = Squads;
        J0x1b:
        // End:0x56 [While If]
        if(S != none)
        {
            S.RemovePlayer(PlayerController(Other));
            S = S.NextSquad;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    // End:0xaf
    else
    {
        // End:0xaf
        if(Bot(Other) != none)
        {
            S = Squads;
            J0x74:
            // End:0xaf [While If]
            if(S != none)
            {
                S.RemoveBot(Bot(Other));
                S = S.NextSquad;
                // This is an implied JumpToken; Continue!
                goto J0x74;
            }
        }
    }
}

defaultproperties
{
    SquadType=class'SquadAI'
    OrderList[0]=Follow
    OrderList[1]=Attack
    OrderList[2]=Defend
    OrderList[3]=Freelance
    OrderList[4]=Follow
    OrderList[5]=Attack
    OrderList[6]=Defend
    OrderList[7]=Freelance
}