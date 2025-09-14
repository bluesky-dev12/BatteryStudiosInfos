/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DOMTeamAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:10
 *
 *******************************************************************************/
class DOMTeamAI extends TeamAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var SquadAI PrimaryDefender;

function bool DominationPending()
{
    local GameObjective o;

    o = Objectives;
    J0x0b:
    // End:0x6b [While If]
    if(o != none)
    {
        // End:0x54
        if(o.DefenderTeamIndex == Team.TeamIndex || o.DefenderTeamIndex == 255)
        {
            return false;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return true;
}

function CheckFreelanceObjective(SquadAI S)
{
    local GameObjective o, Best;

    // End:0x4f
    if(S.SquadObjective != none && S.SquadObjective.DefenderTeamIndex != Team.TeamIndex || DominationPending())
    {
        return;
    }
    o = Objectives;
    J0x5a:
    // End:0xc9 [While If]
    if(o != none)
    {
        // End:0xb2
        if(DominationPoint(o) != none && Best == none || Best.DefenderTeamIndex == Team.TeamIndex)
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    // End:0x11e
    if(Best != S.SquadObjective)
    {
        S.SquadObjective = Best;
        NetUpdateTime = Level.TimeSeconds - float(1);
        S.SetFinalStretch(false);
    }
}

function bool StayFreelance(SquadAI S)
{
    // End:0x4f
    if(S.SquadObjective != none && S.SquadObjective.DefenderTeamIndex != Team.TeamIndex || DominationPending())
    {
        return false;
    }
    return S.SquadObjective == none || S.SquadObjective.DefenderTeamIndex == Team.TeamIndex;
}

function bool PutOnDefense(Bot B)
{
    local GameObjective o;

    o = GetLeastDefendedObjective();
    // End:0x51
    if(o != none)
    {
        // End:0x3b
        if(PrimaryDefender == none)
        {
            PrimaryDefender = AddSquadWithLeader(B, o);
        }
        // End:0x4f
        else
        {
            PrimaryDefender.AddBot(B);
        }
        return true;
    }
    return false;
}

function FindNewObjectiveFor(SquadAI S, bool bForceUpdate)
{
    local GameObjective o;

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
    // End:0x91
    else
    {
        // End:0x67
        if(S.SquadObjective != none)
        {
            o = S.SquadObjective;
        }
        // End:0x91
        else
        {
            // End:0x91
            if(S.GetOrders() == 'Attack')
            {
                o = GetPriorityAttackObjectiveFor(S);
            }
        }
    }
    // End:0xa8
    if(o == none)
    {
        o = GetLeastDefendedObjective();
    }
    S.SetObjective(o, bForceUpdate);
}

function GameObjective GetLeastDefendedObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0xf1 [While If]
    if(o != none)
    {
        // End:0xda
        if(DominationPoint(o) != none && DominationPoint(o).CheckPrimaryTeam(byte(Team.TeamIndex)) && Best == none || Best.DefensePriority < o.DefensePriority || Best.DefensePriority == o.DefensePriority && Best.GetNumDefenders() < o.GetNumDefenders())
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0xa5 [While If]
    if(o != none)
    {
        // End:0x8e
        if(DominationPoint(o) != none && !DominationPoint(o).CheckPrimaryTeam(byte(Team.TeamIndex)) && Best == none || Best.DefenderTeamIndex == Team.TeamIndex)
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function GameObjective GetPriorityFreelanceObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0x7a [While If]
    if(o != none)
    {
        // End:0x63
        if(DominationPoint(o) != none && Best == none || Best.DefenderTeamIndex == Team.TeamIndex)
        {
            Best = o;
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function SetBotOrders(Bot NewBot, RosterEntry R)
{
    // End:0x21
    if(Team.Size == 1)
    {
        OrderList[0] = 'Freelance';
    }
    super.SetBotOrders(NewBot, R);
}

function SetOrders(Bot B, name NewOrders, Controller OrderGiver)
{
    local GameObjective o, Best;
    local SquadAI S;
    local float BestDist;
    local TeamPlayerReplicationInfo PRI;
    local byte Picked;

    PRI = TeamPlayerReplicationInfo(B.PlayerReplicationInfo);
    // End:0x52
    if(HoldSpot(B.GoalScript) != none)
    {
        PRI.bHolding = false;
        B.FreeScript();
    }
    // End:0x1ec
    if(NewOrders == 'HOLD' && PlayerController(OrderGiver) != none)
    {
        BestDist = 2000.0;
        o = Objectives;
        J0x89:
        // End:0x138 [While If]
        if(o != none)
        {
            // End:0x121
            if(VSize(PlayerController(OrderGiver).ViewTarget.Location - o.Location) < BestDist && OrderGiver.LineOfSightTo(o))
            {
                Best = o;
                BestDist = VSize(PlayerController(OrderGiver).ViewTarget.Location - o.Location);
            }
            o = o.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x89;
        }
        // End:0x1ec
        if(Best != none)
        {
            // End:0x1ec
            if(B.Squad.SquadObjective != Best)
            {
                S = Squads;
                J0x16f:
                // End:0x1da [While If]
                if(S != none)
                {
                    // End:0x1c3
                    if(S.SquadObjective == Best && PlayerController(S.SquadLeader) == none)
                    {
                        S.AddBot(B);
                        return;
                    }
                    S = S.NextSquad;
                    // This is an implied JumpToken; Continue!
                    goto J0x16f;
                }
                AddSquadWithLeader(B, Best);
                return;
            }
        }
    }
    Picked = byte(255);
    // End:0x210
    if(NewOrders == 'Defend')
    {
        Picked = 1;
    }
    // End:0x227
    else
    {
        // End:0x227
        if(NewOrders == 'Attack')
        {
            Picked = 0;
        }
    }
    // End:0x24d
    if(Picked == 255)
    {
        super.SetOrders(B, NewOrders, OrderGiver);
    }
    // End:0x3a1
    else
    {
        // End:0x29b
        if(PrimaryDefender != none && DominationPoint(PrimaryDefender.SquadObjective).PrimaryTeam == Picked)
        {
            PrimaryDefender.AddBot(B);
        }
        // End:0x3a1
        else
        {
            // End:0x2e9
            if(AttackSquad != none && DominationPoint(AttackSquad.SquadObjective).PrimaryTeam == Picked)
            {
                AttackSquad.AddBot(B);
            }
            // End:0x3a1
            else
            {
                o = Objectives;
                J0x2f4:
                // End:0x34c [While If]
                if(o != none)
                {
                    // End:0x335
                    if(DominationPoint(o) != none && DominationPoint(o).PrimaryTeam == Picked)
                    {
                    }
                    // End:0x34c
                    else
                    {
                        o = o.NextObjective;
                        // This is an implied JumpToken; Continue!
                        goto J0x2f4;
                    }
                }
                // End:0x3a1
                if(DominationPoint(o) != none)
                {
                    // End:0x380
                    if(PrimaryDefender == none)
                    {
                        PrimaryDefender = AddSquadWithLeader(B, o);
                    }
                    // End:0x3a1
                    else
                    {
                        // End:0x3a1
                        if(AttackSquad == none)
                        {
                            AttackSquad = AddSquadWithLeader(B, o);
                        }
                    }
                }
            }
        }
    }
}

defaultproperties
{
    SquadType=class'DOMSquadAI'
    OrderList[0]=Attack
    OrderList[1]=Defend
    OrderList[2]=Attack
    OrderList[4]=Defend
    OrderList[6]=Freelance
}