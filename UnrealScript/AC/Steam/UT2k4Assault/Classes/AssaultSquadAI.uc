/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\AssaultSquadAI.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:17
 *
 *******************************************************************************/
class AssaultSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Pawn FocusPawn;
var bool bVehicleEntriesInitialized;
var array<Trigger_ASUseAndRespawn> EntryTriggers;

function Reset()
{
    super.Reset();
    FocusPawn = none;
}

function bool ShouldSuppressEnemy(Bot B)
{
    return VSize(B.Pawn.Location - B.FocalPoint) > float(300) && Level.TimeSeconds - B.LastSeenTime < float(8);
}

simulated function string GetOrderStringFor(TeamPlayerReplicationInfo PRI)
{
    // End:0x56
    if(LeaderPRI != none && !LeaderPRI.bBot)
    {
        // End:0x39
        if(PRI.bHolding)
        {
            return HoldString;
        }
        return SupportString @ LeaderPRI.PlayerName @ SupportStringTrailer;
    }
    // End:0x75
    if(bFreelance || SquadObjective == none)
    {
        return FreelanceString;
    }
    // End:0x127
    else
    {
        GetOrders();
        // End:0xd1
        if(CurrentOrders == 'Defend')
        {
            // End:0xba
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
}

function bool NeverBail(Pawn P)
{
    // End:0x16
    if(Team.Size == 1)
    {
        return false;
    }
    // End:0x41
    if(Team.Size == 2 && P.bStationary)
    {
        return false;
    }
    return true;
}

function float MaxVehicleDist(Pawn P)
{
    // End:0x16
    if(GetOrders() != 'Attack')
    {
        return 3000.0;
    }
    // End:0x27
    if(SquadObjective == none)
    {
        return 8000.0;
    }
    return FMin(8000.0, VSize(P.Location - SquadObjective.Location));
}

function Vehicle GetKeyVehicle(Bot B)
{
    local Vehicle V;

    // End:0x3f
    if(ASGameInfo(Level.Game).KeyVehicle != none)
    {
        return ASGameInfo(Level.Game).KeyVehicle;
    }
    V = Vehicle(SquadLeader.Pawn);
    // End:0x99
    if(V != none && V.bKeyVehicle)
    {
        ASGameInfo(Level.Game).KeyVehicle = V;
    }
    // End:0xd4
    if(V == none || B.Enemy == none || V.bKeyVehicle)
    {
        return V;
    }
    return none;
}

function Vehicle GetLinkVehicle(Bot B)
{
    local Vehicle V;

    // End:0x78
    if(ASGameInfo(Level.Game).KeyVehicle != none && B.SameTeamAs(ASGameInfo(Level.Game).KeyVehicle.Controller))
    {
        return ASGameInfo(Level.Game).KeyVehicle;
    }
    // End:0xe9
    if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex && DestroyVehicleObjective(SquadObjective) != none && DestroyVehicleObjective(SquadObjective).TargetVehicle != none)
    {
        return DestroyVehicleObjective(SquadObjective).TargetVehicle;
    }
    V = Vehicle(SquadLeader.Pawn);
    // End:0x10f
    if(V == none)
    {
        return none;
    }
    // End:0x143
    if(V.bKeyVehicle)
    {
        ASGameInfo(Level.Game).KeyVehicle = V;
    }
    // End:0x18d
    if(B.Enemy == none || Vehicle(SquadLeader.Pawn).bKeyVehicle)
    {
        return Vehicle(SquadLeader.Pawn);
    }
    return none;
}

function BotEnteredVehicle(Bot B)
{
    // End:0x16
    if(PlayerController(SquadLeader) == none)
    {
        PickNewLeader();
    }
    super.BotEnteredVehicle(B);
}

function MergeWith(SquadAI S)
{
    // End:0x45
    if(SquadObjective != S.SquadObjective)
    {
        SquadObjective = S.SquadObjective;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

function PickNewLeader()
{
    local Bot B;

    B = SquadMembers;
    J0x0b:
    // End:0x68 [While If]
    if(B != none)
    {
        // End:0x51
        if(Vehicle(B.Pawn) != none && !B.Pawn.bStationary)
        {
        }
        // End:0x68
        else
        {
            B = B.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
    // End:0xc0
    if(B == none)
    {
        B = SquadMembers;
        J0x7e:
        // End:0xc0 [While If]
        if(B != none)
        {
            // End:0xa9
            if(!B.PlayerReplicationInfo.bOutOfLives)
            {
            }
            // End:0xc0
            else
            {
                B = B.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x7e;
            }
        }
    }
    // End:0x121
    if(SquadLeader != B)
    {
        SquadLeader = B;
        // End:0xef
        if(SquadLeader == none)
        {
            LeaderPRI = none;
        }
        // End:0x108
        else
        {
            LeaderPRI = TeamPlayerReplicationInfo(SquadLeader.PlayerReplicationInfo);
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

function bool AssignSquadResponsibility(Bot B)
{
    local Trigger_ASUseAndRespawn t, Best;
    local float BestDist, newdist;
    local int i;
    local Controller C;
    local class<Pawn> FocusPawnClass;

    // End:0x156
    if(SquadObjective == none || SquadObjective.bDisabled || !SquadObjective.bActive || !UnrealMPGameInfo(Level.Game).CanDisableObjective(SquadObjective))
    {
        Team.AI.FindNewObjectiveFor(self, true);
        // End:0x156
        if(SquadObjective == none || SquadObjective.bDisabled || !SquadObjective.bActive)
        {
            // End:0xf9
            if(PlayerController(SquadLeader) != none && HoldSpot(B.GoalScript) == none)
            {
                // End:0xe8
                if(CheckVehicle(B))
                {
                    return true;
                }
                return TellBotToFollow(B, SquadLeader);
            }
            // End:0x154
            if(B.Enemy == none && !B.Pawn.bStationary)
            {
                // End:0x154
                if(B.FindInventoryGoal(0.0))
                {
                    B.SetAttractionState();
                    return true;
                }
            }
            return false;
        }
    }
    // End:0x26b
    if(Vehicle(B.Pawn) != none && !B.Pawn.bStationary && Vehicle(B.Pawn).bKeyVehicle && SquadObjective.DefenderTeamIndex != Team.TeamIndex)
    {
        // End:0x22a
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
        // End:0x50f
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
            // End:0x434
            else
            {
                // End:0x36c
                if(!bVehicleEntriesInitialized)
                {
                    bVehicleEntriesInitialized = true;
                    // End:0x36b
                    foreach DynamicActors(class'Trigger_ASUseAndRespawn', t)
                    {
                        EntryTriggers[EntryTriggers.Length] = t;                                                
                    }
                }
                i = 0;
                J0x373:
                // End:0x420 [While If]
                if(i < EntryTriggers.Length)
                {
                    t = EntryTriggers[i];
                    // End:0x416
                    if(Level.TimeSeconds > t.LastFailTime)
                    {
                        newdist = VSize(B.Pawn.Location - t.Location);
                        // End:0x416
                        if(Best == none || newdist < BestDist)
                        {
                            Best = t;
                            BestDist = newdist;
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x373;
                }
                B.RouteGoal = Best;
            }
            // End:0x50c
            if(B.RouteGoal != none)
            {
                B.MoveTarget = B.FindPathToward(B.RouteGoal, false);
                // End:0x4db
                if(B.MoveTarget != none)
                {
                    B.GoalString = "Move to vehicle entry trigger " $ string(B.RouteGoal);
                    B.SetAttractionState();
                    return true;
                }
                // End:0x50c
                else
                {
                    Trigger_ASUseAndRespawn(B.RouteGoal).LastFailTime = Level.TimeSeconds + float(10);
                }
            }
        }
        // End:0x695
        else
        {
            // End:0x557
            if(B.Pawn.bThumped && B.Enemy != none && ProximityObjective(SquadObjective) == none)
            {
                return false;
            }
            // End:0x695
            else
            {
                // End:0x695
                if(GetOrders() == 'Defend')
                {
                    // End:0x693
                    if(B.Enemy == none)
                    {
                        i = 0;
                        J0x582:
                        // End:0x5d6 [While If]
                        if(i < 8)
                        {
                            // End:0x5cc
                            if(enemies[i] != none)
                            {
                                SetEnemy(B, enemies[i]);
                                // End:0x5cc
                                if(B.Enemy != none)
                                {
                                }
                                // End:0x5d6
                                else
                                {
                                }
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x582;
                            }
                        }
                        // End:0x693
                        if(B.Enemy == none)
                        {
                            C = Level.ControllerList;
                            J0x5fe:
                            // End:0x693 [While If]
                            if(C != none)
                            {
                                // End:0x67c
                                if(C.Pawn != none && C.bIsPlayer && !C.SameTeamAs(B))
                                {
                                    SetEnemy(B, C.Pawn);
                                    // End:0x67c
                                    if(B.Enemy != none)
                                    {
                                    }
                                    // End:0x693
                                    else
                                    {
                                    }
                                    C = C.nextController;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x5fe;
                                }
                            }
                        }
                    }
                    return false;
                }
            }
        }
    }
    FocusPawnClass = ObjectiveConstraintClass();
    FocusPawn = GetKeyVehicle(B);
    // End:0x989
    if(FocusPawn != none && B.Pawn != FocusPawn && FocusPawnClass != none && ClassIsChildOf(FocusPawn.Class, FocusPawnClass) && !ClassIsChildOf(B.Pawn.Class, FocusPawnClass))
    {
        // End:0x876
        if(GetOrders() == 'Attack')
        {
            // End:0x873
            if(FocusPawn.Controller != none)
            {
                B.GoalString = "Support Key Vehicle";
                // End:0x7ce
                if(B.Pawn.Weapon != none && B.Pawn.Weapon.FocusOnLeader(false))
                {
                    B.FireWeaponAt(B.Focus);
                }
                // End:0x844
                if(B.Pawn.GetVehicleBase() == FocusPawn || VSize(FocusPawn.Location - B.Pawn.Location) < float(800) && VSize(FocusPawn.Velocity) < float(100))
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
        // End:0x989
        else
        {
            // End:0x96f
            if(B.Enemy == none)
            {
                // End:0x920
                if(FocusPawn.Controller == none)
                {
                    B.GoalString = "Attack Key Vehicle";
                    // End:0x8ee
                    if(B.CanAttack(FocusPawn))
                    {
                        B.DoRangedAttackOn(FocusPawn);
                        return true;
                    }
                    B.FindBestPathToward(FocusPawn, false, true);
                    // End:0x91d
                    if(B.StartMoveToward(FocusPawn))
                    {
                        return true;
                    }
                }
                // End:0x952
                else
                {
                    B.GoalString = "Fight Key Vehicle";
                    SetEnemy(B, FocusPawn);
                }
                // End:0x96c
                if(B.Enemy == FocusPawn)
                {
                    return false;
                }
            }
            // End:0x989
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
}

function class<Pawn> ObjectiveConstraintClass()
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
}

function bool MustKeepEnemy(Pawn E)
{
    // End:0x35
    if(E.PlayerReplicationInfo != none && E.PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    // End:0x5b
    if(SquadObjective != none && SquadObjective.NearObjective(E))
    {
        return true;
    }
    // End:0x86
    if(Vehicle(E) != none && Vehicle(E).bKeyVehicle)
    {
        return true;
    }
    return false;
}

function byte PriorityObjective(Bot B)
{
    // End:0x20
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        return 2;
    }
    // End:0x5e
    if(Vehicle(B.Pawn) != none && Vehicle(B.Pawn).bKeyVehicle)
    {
        return 2;
    }
    return 0;
}

function float ModifyThreat(float Current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    local class<Pawn> FocusPawnClass;

    // End:0x51
    if(GetOrders() == 'Defend')
    {
        FocusPawnClass = ObjectiveConstraintClass();
        // End:0x51
        if(FocusPawnClass != none && !ClassIsChildOf(NewThreat.Class, FocusPawnClass))
        {
            return Current - 0.50;
        }
    }
    // End:0x134
    if(bThreatVisible && NewThreat.PlayerReplicationInfo != none && NewThreat.PlayerReplicationInfo.HasFlag != none || Vehicle(NewThreat) != none && Vehicle(NewThreat).bKeyVehicle)
    {
        // End:0x124
        if(VSize(B.Pawn.Location - NewThreat.Location) < float(2500) || B.Pawn.Weapon.bSniping)
        {
            return Current + float(6);
        }
        // End:0x131
        else
        {
            return Current + 1.50;
        }
    }
    // End:0x201
    else
    {
        // End:0x1ac
        if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex && SquadObjective.MyBaseVolume != none && NewThreat.IsInVolume(SquadObjective.MyBaseVolume))
        {
            return Current + 1.50;
        }
        // End:0x201
        else
        {
            // End:0x1ce
            if(NewThreat.IsHumanControlled())
            {
                return Current + 0.50;
            }
            // End:0x201
            else
            {
                // End:0x1fb
                if(NewThreat.bStationary && bThreatVisible)
                {
                    return Current + 0.30;
                }
                // End:0x201
                else
                {
                    return Current;
                }
            }
        }
    }
}

function name GetOrders()
{
    bFreelanceAttack = true;
    return super.GetOrders();
}

function float AssessThreat(Bot B, Pawn NewThreat, bool bThreatVisible)
{
    local float ThreatValue, dist;

    // End:0x54
    if(Vehicle(B.Pawn) == none || !Vehicle(B.Pawn).bKeyVehicle)
    {
        return super.AssessThreat(B, NewThreat, bThreatVisible);
    }
    ThreatValue = 1.0;
    dist = VSize(NewThreat.Location - B.Pawn.Location);
    // End:0x102
    if(dist < float(4000))
    {
        ThreatValue += 0.20;
        // End:0xc8
        if(dist < float(2500))
        {
            ThreatValue += 0.20;
        }
        // End:0xe5
        if(dist < float(1500))
        {
            ThreatValue += 0.20;
        }
        // End:0x102
        if(dist < float(1000))
        {
            ThreatValue += 0.20;
        }
    }
    // End:0x116
    if(bThreatVisible)
    {
        ThreatValue += float(3);
    }
    // End:0x19a
    if(NewThreat != B.Enemy && B.Enemy != none)
    {
        // End:0x15d
        if(!bThreatVisible)
        {
            ThreatValue -= float(5);
        }
        // End:0x18e
        else
        {
            // End:0x18e
            if(Level.TimeSeconds - B.LastSeenTime > float(2))
            {
                ThreatValue += float(1);
            }
        }
        ThreatValue -= 0.50;
    }
    ThreatValue = ModifyThreat(ThreatValue, NewThreat, bThreatVisible, B);
    return ThreatValue;
}

defaultproperties
{
    GatherThreshold=0.0
    MaxSquadSize=3
    bRoamingSquad=true
    bAddTransientCosts=true
}