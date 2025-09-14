/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTeamAI.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class ASTeamAI extends TeamAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var SquadAI CurrentDefenseSquad;

function CriticalObjectiveWarning(GameObjective G, Pawn NewEnemy)
{
    local SquadAI S;

    S = Squads;
    J0x0b:
    // End:0x59 [While If]
    if(S != none)
    {
        // End:0x42
        if(S.SquadObjective == G)
        {
            S.CriticalObjectiveWarning(NewEnemy);
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
    local GameObjective o, OldObjective;
    local float BestDist, R;
    local bool bSwitch;
    local SquadAI S;

    o = Objectives;
    J0x0b:
    // End:0x3e [While If]
    if(o != none)
    {
        o.bIsBeingAttacked = false;
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    S = Squads;
    J0x49:
    // End:0xc0 [While If]
    if(S != none)
    {
        // End:0xa9
        if(S != AttackSquad && S.SquadObjective != none && S.Size > 0)
        {
            S.SquadObjective.bIsBeingAttacked = true;
        }
        S = S.NextSquad;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    // End:0xdf
    if(AttackSquad != none)
    {
        PickedObjective = AttackSquad.SquadObjective;
    }
    // End:0x174
    if(PickedObjective == none || PickedObjective.bDisabled || !PickedObjective.bActive || PickedObjective.DefenderTeamIndex == Team.TeamIndex || !UnrealMPGameInfo(Level.Game).CanDisableObjective(PickedObjective))
    {
        OldObjective = PickedObjective;
        PickedObjective = none;
    }
    BestDist = 800.0;
    o = Objectives;
    J0x18a:
    // End:0x430 [While If]
    if(o != none)
    {
        // End:0x419
        if(!o.bDisabled && o.bActive && !o.bIgnoredObjective && o.DefenderTeamIndex != Team.TeamIndex && UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
        {
            // End:0x235
            if(PickedObjective == none)
            {
                bSwitch = true;
            }
            // End:0x3d4
            else
            {
                // End:0x277
                if(OldObjective != none && VSize(o.Location - OldObjective.Location) < BestDist)
                {
                    bSwitch = true;
                }
                // End:0x3d4
                else
                {
                    // End:0x2e2
                    if(o.bIsBeingAttacked)
                    {
                        // End:0x2b7
                        if(!PickedObjective.bIsBeingAttacked || o.bOptionalObjective)
                        {
                            // This is an implied JumpToken;
                            goto J0x419;
                        }
                        // End:0x2df
                        else
                        {
                            // End:0x2df
                            if(PickedObjective.bOptionalObjective || FRand() < 0.350)
                            {
                                bSwitch = true;
                            }
                        }
                    }
                    // End:0x3d4
                    else
                    {
                        // End:0x2ff
                        if(PickedObjective.bIsBeingAttacked)
                        {
                            bSwitch = true;
                        }
                        // End:0x3d4
                        else
                        {
                            R = FRand();
                            // End:0x35c
                            if(PickedObjective.bOptionalObjective)
                            {
                                // End:0x34d
                                if(PickedObjective.DefensePriority >= o.DefensePriority)
                                {
                                    R *= 1.40;
                                }
                                // End:0x359
                                else
                                {
                                    R *= 0.60;
                                }
                            }
                            // End:0x3c1
                            else
                            {
                                // End:0x390
                                if(PickedObjective.DefensePriority > o.DefensePriority)
                                {
                                    R *= 1.40;
                                }
                                // End:0x3c1
                                else
                                {
                                    // End:0x3c1
                                    if(PickedObjective.DefensePriority < o.DefensePriority)
                                    {
                                        R *= 0.70;
                                    }
                                }
                            }
                            bSwitch = R < 0.30;
                        }
                    }
                }
            }
            // End:0x419
            if(bSwitch)
            {
                PickedObjective = o;
                // End:0x419
                if(OldObjective != none)
                {
                    BestDist = VSize(o.Location - OldObjective.Location);
                }
            }
        }
        J0x419:
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x18a;
    }
    return PickedObjective;
}

function GameObjective GetLeastDefendedObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0b:
    // End:0x23f [While If]
    if(o != none)
    {
        // End:0x228
        if(!o.bDisabled && o.bActive && !o.bIgnoredObjective && o.DefenderTeamIndex == Team.TeamIndex && UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
        {
            // End:0xe7
            if(o.DefenseSquad != none && o.DefenseSquad.SquadObjective != o)
            {
                o.DefenseSquad = none;
            }
            // End:0x100
            if(Best == none)
            {
                Best = o;
            }
            // End:0x228
            else
            {
                // End:0x173
                if(o.DefenseSquad == none)
                {
                    // End:0x170
                    if(Best.DefenseSquad != none || !o.bOptionalObjective && Best.DefensePriority > o.DefensePriority)
                    {
                        Best = o;
                    }
                }
                // End:0x228
                else
                {
                    // End:0x195
                    if(Best.DefenseSquad == none)
                    {
                        Best = Best;
                    }
                    // End:0x228
                    else
                    {
                        // End:0x1d6
                        if(o.DefenseSquad.Size < Best.DefenseSquad.Size)
                        {
                            Best = o;
                        }
                        // End:0x228
                        else
                        {
                            // End:0x228
                            if(Best.bOptionalObjective && Best.DefenseSquad.Size >= Best.DefenseSquad.MaxSquadSize)
                            {
                                Best = o;
                            }
                        }
                    }
                }
            }
        }
        o = o.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
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
    // End:0x191
    else
    {
        // End:0x175
        if(NewOrders == 'Follow')
        {
            B.FreeScript();
            PutBotOnSquadLedBy(OrderGiver, B);
        }
        // End:0x191
        else
        {
            // End:0x191
            if(NewOrders == 'Freelance')
            {
                PutOnFreelance(B);
                return;
            }
        }
    }
}

function bool PutOnDefense(Bot B)
{
    local GameObjective o;

    o = GetLeastDefendedObjective();
    // End:0xa1
    if(o != none)
    {
        // End:0x4f
        if(o.DefenseSquad == none)
        {
            o.DefenseSquad = AddSquadWithLeader(B, o);
            return true;
        }
        // End:0xa1
        else
        {
            // End:0xa1
            if(o.DefenseSquad.Size < o.DefenseSquad.MaxSquadSize)
            {
                o.DefenseSquad.AddBot(B);
                return true;
            }
        }
    }
    // End:0xe4
    if(CurrentDefenseSquad == none || CurrentDefenseSquad.Size >= CurrentDefenseSquad.MaxSquadSize)
    {
        CurrentDefenseSquad = AddSquadWithLeader(B, none);
    }
    // End:0xf8
    else
    {
        CurrentDefenseSquad.AddBot(B);
    }
    return true;
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
    // End:0x3e
    if(R != none && R.RecommendSupport())
    {
        NewOrders = 'Follow';
    }
    // End:0x88
    else
    {
        // End:0x7d
        if(Team.TeamIndex == ASGameInfo(Level.Game).CurrentAttackingTeam)
        {
            NewOrders = 'Attack';
        }
        // End:0x88
        else
        {
            NewOrders = 'Defend';
        }
    }
    // End:0xa9
    if(NewOrders == 'Defend' && PutOnDefense(NewBot))
    {
        return;
    }
    // End:0xc5
    if(NewOrders == 'Attack')
    {
        PutOnOffense(NewBot);
        return;
    }
    // End:0x101
    if(NewOrders == 'Follow')
    {
        HumanSquad = AddHumanSquad();
        // End:0x101
        if(HumanSquad != none)
        {
            HumanSquad.AddBot(NewBot);
            return;
        }
    }
    PutOnOffense(NewBot);
}

defaultproperties
{
    SquadType=class'AssaultSquadAI'
}