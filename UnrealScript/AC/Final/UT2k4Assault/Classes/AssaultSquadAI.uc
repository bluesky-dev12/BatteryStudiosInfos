class AssaultSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Pawn FocusPawn;
var bool bVehicleEntriesInitialized;
var array<Trigger_ASUseAndRespawn> EntryTriggers;

function Reset()
{
    super.Reset();
    FocusPawn = none;
    //return;    
}

function bool ShouldSuppressEnemy(Bot B)
{
    return (VSize(B.Pawn.Location - B.FocalPoint) > float(300)) && (Level.TimeSeconds - B.LastSeenTime) < float(8);
    //return;    
}

simulated function string GetOrderStringFor(TeamPlayerReplicationInfo PRI)
{
    // End:0x56
    if((LeaderPRI != none) && !LeaderPRI.bBot)
    {
        // End:0x39
        if(PRI.bHolding)
        {
            return HoldString;
        }
        return (SupportString @ LeaderPRI.PlayerName) @ SupportStringTrailer;
    }
    // End:0x75
    if(bFreelance || SquadObjective == none)
    {
        return FreelanceString;        
    }
    else
    {
        GetOrders();
        // End:0xD1
        if(CurrentOrders == 'Defend')
        {
            // End:0xBA
            if(SquadObjective.Objective_Info_Defender != SquadObjective.default.Objective_Info_Defender)
            {
                return SquadObjective.Objective_Info_Defender;
            }
            return DefendString @ SquadObjective.GetHumanReadableName();
        }
        // End:0x127
        if(CurrentOrders == 'Attack')
        {
            // End:0x110
            if(SquadObjective.Objective_Info_Attacker != SquadObjective.default.Objective_Info_Attacker)
            {
                return SquadObjective.Objective_Info_Attacker;
            }
            return AttackString @ SquadObjective.GetHumanReadableName();
        }
    }
    return string(CurrentOrders);
    //return;    
}

function bool NeverBail(Pawn P)
{
    // End:0x16
    if(Team.Size == 1)
    {
        return false;
    }
    // End:0x41
    if((Team.Size == 2) && P.bStationary)
    {
        return false;
    }
    return true;
    //return;    
}

function float MaxVehicleDist(Pawn P)
{
    // End:0x16
    if((GetOrders()) != 'Attack')
    {
        return 3000.0000000;
    }
    // End:0x27
    if(SquadObjective == none)
    {
        return 8000.0000000;
    }
    return FMin(8000.0000000, VSize(P.Location - SquadObjective.Location));
    //return;    
}

function Vehicle GetKeyVehicle(Bot B)
{
    local Vehicle V;

    // End:0x3F
    if(ASGameInfo(Level.Game).KeyVehicle != none)
    {
        return ASGameInfo(Level.Game).KeyVehicle;
    }
    V = Vehicle(SquadLeader.Pawn);
    // End:0x99
    if((V != none) && V.bKeyVehicle)
    {
        ASGameInfo(Level.Game).KeyVehicle = V;
    }
    // End:0xD4
    if(((V == none) || B.Enemy == none) || V.bKeyVehicle)
    {
        return V;
    }
    return none;
    //return;    
}

function Vehicle GetLinkVehicle(Bot B)
{
    local Vehicle V;

    // End:0x78
    if((ASGameInfo(Level.Game).KeyVehicle != none) && B.SameTeamAs(ASGameInfo(Level.Game).KeyVehicle.Controller))
    {
        return ASGameInfo(Level.Game).KeyVehicle;
    }
    // End:0xE9
    if((((SquadObjective != none) && int(SquadObjective.DefenderTeamIndex) == Team.TeamIndex) && DestroyVehicleObjective(SquadObjective) != none) && DestroyVehicleObjective(SquadObjective).TargetVehicle != none)
    {
        return DestroyVehicleObjective(SquadObjective).TargetVehicle;
    }
    V = Vehicle(SquadLeader.Pawn);
    // End:0x10F
    if(V == none)
    {
        return none;
    }
    // End:0x143
    if(V.bKeyVehicle)
    {
        ASGameInfo(Level.Game).KeyVehicle = V;
    }
    // End:0x18D
    if((B.Enemy == none) || Vehicle(SquadLeader.Pawn).bKeyVehicle)
    {
        return Vehicle(SquadLeader.Pawn);
    }
    return none;
    //return;    
}

function BotEnteredVehicle(Bot B)
{
    // End:0x16
    if(PlayerController(SquadLeader) == none)
    {
        PickNewLeader();
    }
    super.BotEnteredVehicle(B);
    //return;    
}

function MergeWith(SquadAI S)
{
    // End:0x45
    if(SquadObjective != S.SquadObjective)
    {
        SquadObjective = S.SquadObjective;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    //return;    
}

function PickNewLeader()
{
    local Bot B;

    B = SquadMembers;
    J0x0B:

    // End:0x68 [Loop If]
    if(B != none)
    {
        // End:0x51
        if((Vehicle(B.Pawn) != none) && !B.Pawn.bStationary)
        {
            // [Explicit Break]
            goto J0x68;
        }
        B = B.NextSquadMember;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x68:

    // End:0xC0
    if(B == none)
    {
        B = SquadMembers;
        J0x7E:

        // End:0xC0 [Loop If]
        if(B != none)
        {
            // End:0xA9
            if(!B.PlayerReplicationInfo.bOutOfLives)
            {
                // [Explicit Break]
                goto J0xC0;
            }
            B = B.NextSquadMember;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    J0xC0:

    // End:0x121
    if(SquadLeader != B)
    {
        SquadLeader = B;
        // End:0xEF
        if(SquadLeader == none)
        {
            LeaderPRI = none;            
        }
        else
        {
            LeaderPRI = TeamPlayerReplicationInfo(SquadLeader.PlayerReplicationInfo);
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    //return;    
}

function bool AssignSquadResponsibility(Bot B)
{
    local Trigger_ASUseAndRespawn t, Best;
    local float BestDist, newdist;
    local int i;
    local Controller C;
    local Class<Pawn> FocusPawnClass;

    // End:0x156
    if((((SquadObjective == none) || SquadObjective.bDisabled) || !SquadObjective.bActive) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(SquadObjective))
    {
        Team.AI.FindNewObjectiveFor(self, true);
        // End:0x156
        if(((SquadObjective == none) || SquadObjective.bDisabled) || !SquadObjective.bActive)
        {
            // End:0xF9
            if((PlayerController(SquadLeader) != none) && HoldSpot(B.GoalScript) == none)
            {
                // End:0xE8
                if(CheckVehicle(B))
                {
                    return true;
                }
                return TellBotToFollow(B, SquadLeader);
            }
            // End:0x154
            if((B.Enemy == none) && !B.Pawn.bStationary)
            {
                // End:0x154
                if(B.FindInventoryGoal(0.0000000))
                {
                    B.SetAttractionState();
                    return true;
                }
            }
            return false;
        }
    }
    // End:0x26B
    if((((Vehicle(B.Pawn) != none) && !B.Pawn.bStationary) && Vehicle(B.Pawn).bKeyVehicle) && int(SquadObjective.DefenderTeamIndex) != Team.TeamIndex)
    {
        // End:0x22A
        if(SquadObjective.bDisabled || !SquadObjective.bActive)
        {
            B.GoalString = "Objective already disabled";
            return false;
        }
        B.GoalString = "Disable Objective " $ string(SquadObjective);
        return SquadObjective.TellBotHowToDisable(B);
    }
    // End:0x695
    if(SquadObjective.bMustBoardVehicleFirst)
    {
        // End:0x50F
        if(Vehicle(B.Pawn) == none)
        {
            // End:0x335
            if(Trigger_ASUseAndRespawn(B.RouteGoal) != none)
            {
                // End:0x332
                if(B.Pawn.ReachedDestination(B.RouteGoal))
                {
                    Trigger_ASUseAndRespawn(B.RouteGoal).UsedBy(B.Pawn);
                    B.GoalString = "Getting in vehicle";
                    return super.AssignSquadResponsibility(B);
                }                
            }
            else
            {
                // End:0x36C
                if(!bVehicleEntriesInitialized)
                {
                    bVehicleEntriesInitialized = true;
                    // End:0x36B
                    foreach DynamicActors(Class'UT2k4Assault_Decompressed.Trigger_ASUseAndRespawn', t)
                    {
                        EntryTriggers[EntryTriggers.Length] = t;                        
                    }                    
                }
                i = 0;
                J0x373:

                // End:0x420 [Loop If]
                if(i < EntryTriggers.Length)
                {
                    t = EntryTriggers[i];
                    // End:0x416
                    if(Level.TimeSeconds > t.LastFailTime)
                    {
                        newdist = VSize(B.Pawn.Location - t.Location);
                        // End:0x416
                        if((Best == none) || newdist < BestDist)
                        {
                            Best = t;
                            BestDist = newdist;
                        }
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x373;
                }
                B.RouteGoal = Best;
            }
            // End:0x50C
            if(B.RouteGoal != none)
            {
                B.MoveTarget = B.FindPathToward(B.RouteGoal, false);
                // End:0x4DB
                if(B.MoveTarget != none)
                {
                    B.GoalString = "Move to vehicle entry trigger " $ string(B.RouteGoal);
                    B.SetAttractionState();
                    return true;                    
                }
                else
                {
                    Trigger_ASUseAndRespawn(B.RouteGoal).LastFailTime = Level.TimeSeconds + float(10);
                }
            }            
        }
        else
        {
            // End:0x557
            if((B.Pawn.bThumped && B.Enemy != none) && ProximityObjective(SquadObjective) == none)
            {
                return false;                
            }
            else
            {
                // End:0x695
                if((GetOrders()) == 'Defend')
                {
                    // End:0x693
                    if(B.Enemy == none)
                    {
                        i = 0;
                        J0x582:

                        // End:0x5D6 [Loop If]
                        if(i < 8)
                        {
                            // End:0x5CC
                            if(enemies[i] != none)
                            {
                                SetEnemy(B, enemies[i]);
                                // End:0x5CC
                                if(B.Enemy != none)
                                {
                                    // [Explicit Break]
                                    goto J0x5D6;
                                }
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x582;
                        }
                        J0x5D6:

                        // End:0x693
                        if(B.Enemy == none)
                        {
                            C = Level.ControllerList;
                            J0x5FE:

                            // End:0x693 [Loop If]
                            if(C != none)
                            {
                                // End:0x67C
                                if(((C.Pawn != none) && C.bIsPlayer) && !C.SameTeamAs(B))
                                {
                                    SetEnemy(B, C.Pawn);
                                    // End:0x67C
                                    if(B.Enemy != none)
                                    {
                                        // [Explicit Break]
                                        goto J0x693;
                                    }
                                }
                                C = C.nextController;
                                // [Loop Continue]
                                goto J0x5FE;
                            }
                        }
                    }
                    J0x693:

                    return false;
                }
            }
        }
    }
    FocusPawnClass = ObjectiveConstraintClass();
    FocusPawn = GetKeyVehicle(B);
    // End:0x989
    if(((((FocusPawn != none) && B.Pawn != FocusPawn) && FocusPawnClass != none) && ClassIsChildOf(FocusPawn.Class, FocusPawnClass)) && !ClassIsChildOf(B.Pawn.Class, FocusPawnClass))
    {
        // End:0x876
        if((GetOrders()) == 'Attack')
        {
            // End:0x873
            if(FocusPawn.Controller != none)
            {
                B.GoalString = "Support Key Vehicle";
                // End:0x7CE
                if((B.Pawn.Weapon != none) && B.Pawn.Weapon.FocusOnLeader(false))
                {
                    B.FireWeaponAt(B.Focus);
                }
                // End:0x844
                if((B.Pawn.GetVehicleBase() == FocusPawn) || (VSize(FocusPawn.Location - B.Pawn.Location) < float(800)) && VSize(FocusPawn.Velocity) < float(100))
                {
                    return false;
                }
                B.FindBestPathToward(FocusPawn, false, true);
                // End:0x873
                if(B.StartMoveToward(FocusPawn))
                {
                    return true;
                }
            }            
        }
        else
        {
            // End:0x96F
            if(B.Enemy == none)
            {
                // End:0x920
                if(FocusPawn.Controller == none)
                {
                    B.GoalString = "Attack Key Vehicle";
                    // End:0x8EE
                    if(B.CanAttack(FocusPawn))
                    {
                        B.DoRangedAttackOn(FocusPawn);
                        return true;
                    }
                    B.FindBestPathToward(FocusPawn, false, true);
                    // End:0x91D
                    if(B.StartMoveToward(FocusPawn))
                    {
                        return true;
                    }                    
                }
                else
                {
                    B.GoalString = "Fight Key Vehicle";
                    SetEnemy(B, FocusPawn);
                }
                // End:0x96C
                if(B.Enemy == FocusPawn)
                {
                    return false;
                }                
            }
            else
            {
                // End:0x989
                if(B.Enemy == FocusPawn)
                {
                    return false;
                }
            }
        }
    }
    return super.AssignSquadResponsibility(B);
    //return;    
}

function Class<Pawn> ObjectiveConstraintClass()
{
    // End:0x24
    if(DestroyableObjective(SquadObjective) != none)
    {
        return DestroyableObjective(SquadObjective).ConstraintPawnClass;
    }
    // End:0x48
    if(ProximityObjective(SquadObjective) != none)
    {
        return ProximityObjective(SquadObjective).ConstraintPawnClass;
    }
    return none;
    //return;    
}

function bool MustKeepEnemy(Pawn E)
{
    // End:0x35
    if((E.PlayerReplicationInfo != none) && E.PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    // End:0x5B
    if((SquadObjective != none) && SquadObjective.NearObjective(E))
    {
        return true;
    }
    // End:0x86
    if((Vehicle(E) != none) && Vehicle(E).bKeyVehicle)
    {
        return true;
    }
    return false;
    //return;    
}

function byte PriorityObjective(Bot B)
{
    // End:0x20
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        return 2;
    }
    // End:0x5E
    if((Vehicle(B.Pawn) != none) && Vehicle(B.Pawn).bKeyVehicle)
    {
        return 2;
    }
    return 0;
    //return;    
}

function float ModifyThreat(float current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    local Class<Pawn> FocusPawnClass;

    // End:0x51
    if((GetOrders()) == 'Defend')
    {
        FocusPawnClass = ObjectiveConstraintClass();
        // End:0x51
        if((FocusPawnClass != none) && !ClassIsChildOf(NewThreat.Class, FocusPawnClass))
        {
            return current - 0.5000000;
        }
    }
    // End:0x134
    if((bThreatVisible && NewThreat.PlayerReplicationInfo != none) && (NewThreat.PlayerReplicationInfo.HasFlag != none) || (Vehicle(NewThreat) != none) && Vehicle(NewThreat).bKeyVehicle)
    {
        // End:0x124
        if((VSize(B.Pawn.Location - NewThreat.Location) < float(2500)) || B.Pawn.Weapon.bSniping)
        {
            return current + float(6);            
        }
        else
        {
            return current + 1.5000000;
        }        
    }
    else
    {
        // End:0x1AC
        if((((SquadObjective != none) && int(SquadObjective.DefenderTeamIndex) == Team.TeamIndex) && SquadObjective.MyBaseVolume != none) && NewThreat.IsInVolume(SquadObjective.MyBaseVolume))
        {
            return current + 1.5000000;            
        }
        else
        {
            // End:0x1CE
            if(NewThreat.IsHumanControlled())
            {
                return current + 0.5000000;                
            }
            else
            {
                // End:0x1FB
                if(NewThreat.bStationary && bThreatVisible)
                {
                    return current + 0.3000000;                    
                }
                else
                {
                    return current;
                }
            }
        }
    }
    //return;    
}

function name GetOrders()
{
    bFreelanceAttack = true;
    return super.GetOrders();
    //return;    
}

function float AssessThreat(Bot B, Pawn NewThreat, bool bThreatVisible)
{
    local float ThreatValue, dist;

    // End:0x54
    if((Vehicle(B.Pawn) == none) || !Vehicle(B.Pawn).bKeyVehicle)
    {
        return super.AssessThreat(B, NewThreat, bThreatVisible);
    }
    ThreatValue = 1.0000000;
    dist = VSize(NewThreat.Location - B.Pawn.Location);
    // End:0x102
    if(dist < float(4000))
    {
        ThreatValue += 0.2000000;
        // End:0xC8
        if(dist < float(2500))
        {
            ThreatValue += 0.2000000;
        }
        // End:0xE5
        if(dist < float(1500))
        {
            ThreatValue += 0.2000000;
        }
        // End:0x102
        if(dist < float(1000))
        {
            ThreatValue += 0.2000000;
        }
    }
    // End:0x116
    if(bThreatVisible)
    {
        ThreatValue += float(3);
    }
    // End:0x19A
    if((NewThreat != B.Enemy) && B.Enemy != none)
    {
        // End:0x15D
        if(!bThreatVisible)
        {
            ThreatValue -= float(5);            
        }
        else
        {
            // End:0x18E
            if((Level.TimeSeconds - B.LastSeenTime) > float(2))
            {
                ThreatValue += float(1);
            }
        }
        ThreatValue -= 0.5000000;
    }
    ThreatValue = ModifyThreat(ThreatValue, NewThreat, bThreatVisible, B);
    return ThreatValue;
    //return;    
}

defaultproperties
{
    GatherThreshold=0.0000000
    MaxSquadSize=3
    bRoamingSquad=false
    bAddTransientCosts=true
}