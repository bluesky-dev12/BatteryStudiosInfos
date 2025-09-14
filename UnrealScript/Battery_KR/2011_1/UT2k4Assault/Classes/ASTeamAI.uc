class ASTeamAI extends TeamAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var SquadAI CurrentDefenseSquad;

function CriticalObjectiveWarning(GameObjective G, Pawn NewEnemy)
{
    local SquadAI S;

    S = Squads;
    J0x0B:

    // End:0x59 [Loop If]
    if(S != none)
    {
        // End:0x42
        if(S.SquadObjective == G)
        {
            S.CriticalObjectiveWarning(NewEnemy);
        }
        S = S.NextSquad;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
    local GameObjective o, OldObjective;
    local float BestDist, R;
    local bool bSwitch;
    local SquadAI S;

    o = Objectives;
    J0x0B:

    // End:0x3E [Loop If]
    if(o != none)
    {
        o.bIsBeingAttacked = false;
        o = o.NextObjective;
        // [Loop Continue]
        goto J0x0B;
    }
    S = Squads;
    J0x49:

    // End:0xC0 [Loop If]
    if(S != none)
    {
        // End:0xA9
        if(((S != AttackSquad) && S.SquadObjective != none) && S.Size > 0)
        {
            S.SquadObjective.bIsBeingAttacked = true;
        }
        S = S.NextSquad;
        // [Loop Continue]
        goto J0x49;
    }
    // End:0xDF
    if(AttackSquad != none)
    {
        PickedObjective = AttackSquad.SquadObjective;
    }
    // End:0x174
    if(((((PickedObjective == none) || PickedObjective.bDisabled) || !PickedObjective.bActive) || int(PickedObjective.DefenderTeamIndex) == Team.TeamIndex) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(PickedObjective))
    {
        OldObjective = PickedObjective;
        PickedObjective = none;
    }
    BestDist = 800.0000000;
    o = Objectives;
    J0x18A:

    // End:0x430 [Loop If]
    if(o != none)
    {
        // End:0x419
        if((((!o.bDisabled && o.bActive) && !o.bIgnoredObjective) && int(o.DefenderTeamIndex) != Team.TeamIndex) && UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
        {
            // End:0x235
            if(PickedObjective == none)
            {
                bSwitch = true;                
            }
            else
            {
                // End:0x277
                if((OldObjective != none) && VSize(o.Location - OldObjective.Location) < BestDist)
                {
                    bSwitch = true;                    
                }
                else
                {
                    // End:0x2E2
                    if(o.bIsBeingAttacked)
                    {
                        // End:0x2B7
                        if(!PickedObjective.bIsBeingAttacked || o.bOptionalObjective)
                        {
                            goto J0x419;                            
                        }
                        else
                        {
                            // End:0x2DF
                            if(PickedObjective.bOptionalObjective || FRand() < 0.3500000)
                            {
                                bSwitch = true;
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x2FF
                        if(PickedObjective.bIsBeingAttacked)
                        {
                            bSwitch = true;                            
                        }
                        else
                        {
                            R = FRand();
                            // End:0x35C
                            if(PickedObjective.bOptionalObjective)
                            {
                                // End:0x34D
                                if(int(PickedObjective.DefensePriority) >= int(o.DefensePriority))
                                {
                                    R *= 1.4000000;                                    
                                }
                                else
                                {
                                    R *= 0.6000000;
                                }                                
                            }
                            else
                            {
                                // End:0x390
                                if(int(PickedObjective.DefensePriority) > int(o.DefensePriority))
                                {
                                    R *= 1.4000000;                                    
                                }
                                else
                                {
                                    // End:0x3C1
                                    if(int(PickedObjective.DefensePriority) < int(o.DefensePriority))
                                    {
                                        R *= 0.7000000;
                                    }
                                }
                            }
                            bSwitch = R < 0.3000000;
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
        // [Loop Continue]
        goto J0x18A;
    }
    return PickedObjective;
    //return;    
}

function GameObjective GetLeastDefendedObjective()
{
    local GameObjective o, Best;

    o = Objectives;
    J0x0B:

    // End:0x23F [Loop If]
    if(o != none)
    {
        // End:0x228
        if((((!o.bDisabled && o.bActive) && !o.bIgnoredObjective) && int(o.DefenderTeamIndex) == Team.TeamIndex) && UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
        {
            // End:0xE7
            if((o.DefenseSquad != none) && o.DefenseSquad.SquadObjective != o)
            {
                o.DefenseSquad = none;
            }
            // End:0x100
            if(Best == none)
            {
                Best = o;                
            }
            else
            {
                // End:0x173
                if(o.DefenseSquad == none)
                {
                    // End:0x170
                    if((Best.DefenseSquad != none) || !o.bOptionalObjective && int(Best.DefensePriority) > int(o.DefensePriority))
                    {
                        Best = o;
                    }                    
                }
                else
                {
                    // End:0x195
                    if(Best.DefenseSquad == none)
                    {
                        Best = Best;                        
                    }
                    else
                    {
                        // End:0x1D6
                        if(o.DefenseSquad.Size < Best.DefenseSquad.Size)
                        {
                            Best = o;                            
                        }
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
        // [Loop Continue]
        goto J0x0B;
    }
    return Best;
    //return;    
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
        B.GoalScript = PlayerController(OrderGiver).ViewTarget.Spawn(Class'UnrealGame.HoldSpot');
        // End:0x103
        if(Vehicle(PlayerController(OrderGiver).ViewTarget) != none)
        {
            HoldSpot(B.GoalScript).HoldVehicle = Vehicle(PlayerController(OrderGiver).ViewTarget);
        }
        // End:0x141
        if(int(PlayerController(OrderGiver).ViewTarget.Physics) == int(11))
        {
            B.GoalScript.SetPhysics(11);
        }        
    }
    else
    {
        // End:0x175
        if(NewOrders == 'Follow')
        {
            B.FreeScript();
            PutBotOnSquadLedBy(OrderGiver, B);            
        }
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
    //return;    
}

function bool PutOnDefense(Bot B)
{
    local GameObjective o;

    o = GetLeastDefendedObjective();
    // End:0xA1
    if(o != none)
    {
        // End:0x4F
        if(o.DefenseSquad == none)
        {
            o.DefenseSquad = AddSquadWithLeader(B, o);
            return true;            
        }
        else
        {
            // End:0xA1
            if(o.DefenseSquad.Size < o.DefenseSquad.MaxSquadSize)
            {
                o.DefenseSquad.AddBot(B);
                return true;
            }
        }
    }
    // End:0xE4
    if((CurrentDefenseSquad == none) || CurrentDefenseSquad.Size >= CurrentDefenseSquad.MaxSquadSize)
    {
        CurrentDefenseSquad = AddSquadWithLeader(B, none);        
    }
    else
    {
        CurrentDefenseSquad.AddBot(B);
    }
    return true;
    //return;    
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
    // End:0x3E
    if((R != none) && R.RecommendSupport())
    {
        NewOrders = 'Follow';        
    }
    else
    {
        // End:0x7D
        if(Team.TeamIndex == int(ASGameInfo(Level.Game).CurrentAttackingTeam))
        {
            NewOrders = 'Attack';            
        }
        else
        {
            NewOrders = 'Defend';
        }
    }
    // End:0xA9
    if((NewOrders == 'Defend') && PutOnDefense(NewBot))
    {
        return;
    }
    // End:0xC5
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
    //return;    
}

defaultproperties
{
    SquadType=Class'UT2k4Assault_Decompressed.AssaultSquadAI'
}