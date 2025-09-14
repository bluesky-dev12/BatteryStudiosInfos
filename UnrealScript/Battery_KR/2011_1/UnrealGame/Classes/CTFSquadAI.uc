class CTFSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float LastSeeFlagCarrier;
var CTFFlag FriendlyFlag;
var CTFFlag EnemyFlag;
var AssaultPath ReturnPath;
var name ReturnPathTag;
var NavigationPoint HidePath;

function AssignCombo(Bot B)
{
    // End:0x1B
    if((GetOrders()) != 'Attack')
    {
        super.AssignCombo(B);
    }
    //return;    
}

function bool AllowDetourTo(Bot B, NavigationPoint N)
{
    // End:0x23
    if(B.PlayerReplicationInfo.HasFlag != EnemyFlag)
    {
        return true;
    }
    // End:0x5C
    if((B.RouteGoal != FriendlyFlag.HomeBase) || !FriendlyFlag.bHome)
    {
        return true;
    }
    return (N.LastDetourWeight * B.RouteDist) > float(2);
    //return;    
}

function bool FindPathToObjective(Bot B, Actor o)
{
    // End:0x170
    if((((Vehicle(B.Pawn) != none) && (CTFFlag(o) != none) || CTFBase(o) != none) && VSize(B.Pawn.Location - o.Location) < float(1000)) && B.LineOfSightTo(o))
    {
        B.FormerVehicle = Vehicle(B.Pawn);
        Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
        Vehicle(B.Pawn).KDriverLeave(false);
        // End:0x170
        if(((Vehicle(B.Pawn) == none) && int(B.Pawn.Physics) == int(2)) && B.DoWaitForLanding())
        {
            B.Pawn.Velocity.Z = 0.0000000;
            return true;
        }
    }
    // End:0x1BC
    if((B.PlayerReplicationInfo.HasFlag != EnemyFlag) || o != FriendlyFlag.HomeBase)
    {
        return super.FindPathToObjective(B, o);
    }
    // End:0x21A
    if((B.bFinalStretch || ReturnPath == none) || (o == SquadObjective) && SquadObjective.BotNearObjective(B))
    {
        return B.SetRouteToGoal(o);
    }
    B.MoveTarget = none;
    // End:0x3A7
    if(B.actorReachable(o))
    {
        // End:0x2D8
        if(((Vehicle(B.Pawn) != none) && (B.Pawn.Location.Z - o.Location.Z) < float(500)) && (CTFFlag(o) != none) || CTFBase(o) != none)
        {
            Vehicle(B.Pawn).KDriverLeave(false);
        }
        // End:0x317
        if(B.Pawn.ReachedDestination(o))
        {
            o.Touch(B.Pawn);
            return false;
        }
        B.RouteGoal = o;
        B.RouteCache[0] = none;
        B.GoalString = (B.GoalString @ "almost at ") $ string(o);
        B.MoveTarget = o;
        B.bFinalStretch = true;
        B.SetAttractionState();
        return true;
    }
    // End:0x491
    if(B.Pawn.ReachedDestination(ReturnPath))
    {
        B.GoalString = (((B.GoalString @ "Find path to ") $ string(o)) $ " now near ") $ string(ReturnPath);
        B.MoveTarget = ReturnPath;
        ReturnPath = ReturnPath.FindPreviousPath(ReturnPathTag);
        // End:0x478
        if(ReturnPath == none)
        {
            B.bFinalStretch = true;
            B.FindBestPathToward(o, true, true);            
        }
        else
        {
            B.FindBestPathToward(ReturnPath, true, true);
        }        
    }
    else
    {
        B.GoalString = (((B.GoalString @ "Find path to ") $ string(o)) $ " through ") $ string(ReturnPath);
        // End:0x5BF
        if(!B.FindBestPathToward(ReturnPath, true, true))
        {
            B.GoalString = ((B.GoalString @ "Find path to ") $ string(o)) $ " no path to ReturnPath";
            // End:0x5A9
            if(B.bSoaking && int(Physics) != int(2))
            {
                B.SoakStop("COULDN'T FIND PATH TO RETURNPATH " $ string(ReturnPath));
            }
            B.FindBestPathToward(o, true, true);
        }
    }
    return B.StartMoveToward(o);
    //return;    
}

function bool AllowTranslocationBy(Bot B)
{
    return B.Pawn != EnemyFlag.Holder;
    //return;    
}

function bool GoPickupFlag(Bot B)
{
    // End:0xCD
    if(FindPathToObjective(B, FriendlyFlag))
    {
        // End:0xA6
        if((Level.TimeSeconds - CTFTeamAI(Team.AI).LastGotFlag) > float(6))
        {
            CTFTeamAI(Team.AI).LastGotFlag = Level.TimeSeconds;
            B.SendMessage(none, 'Other', B.GetMessageIndex('GOTOURFLAG'), 20.0000000, 'Team');
        }
        B.GoalString = "Pickup friendly flag";
        return true;
    }
    return false;
    //return;    
}

function Actor FormationCenter()
{
    // End:0x36
    if((SquadObjective != none) && int(SquadObjective.DefenderTeamIndex) == Team.TeamIndex)
    {
        return SquadObjective;
    }
    // End:0x83
    if(((EnemyFlag.Holder != none) && (GetOrders()) != 'Defend') && !SquadLeader.IsA('PlayerController'))
    {
        return EnemyFlag.Holder;
    }
    return SquadLeader.Pawn;
    //return;    
}

function bool VisibleToEnemiesOf(Actor A, Bot B)
{
    // End:0x6B
    if((B.Enemy != none) && FastTrace(A.Location, B.Enemy.Location + (B.Enemy.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))))
    {
        return true;
    }
    return false;
    //return;    
}

function NavigationPoint FindHidePathFor(Bot B)
{
    local NavigationPoint N;
    local InventorySpot Best;
    local float NewD, BestD;
    local int MyTeamNum, EnemyTeamNum;

    MyTeamNum = Team.TeamIndex;
    // End:0x26
    if(MyTeamNum == 0)
    {
        EnemyTeamNum = 1;
    }
    N = Level.NavigationPointList;
    J0x3A:

    // End:0x2EA [Loop If]
    if(N != none)
    {
        // End:0x2D3
        if(((InventorySpot(N) != none) && int(N.BaseVisible[EnemyTeamNum]) == 0) && N.BaseDist[MyTeamNum] < FMin(2400.0000000, 0.7000000 * N.BaseDist[EnemyTeamNum]))
        {
            // End:0x145
            if(Best == none)
            {
                // End:0x142
                if(!VisibleToEnemiesOf(N, B))
                {
                    Best = InventorySpot(N);
                    // End:0x142
                    if((Best.markedItem != none) && Best.markedItem.ReadyToPickup(3.0000000))
                    {
                        BestD = Best.markedItem.BotDesireability(B.Pawn);
                    }
                }                
            }
            else
            {
                // End:0x221
                if(((Best.markedItem == none) || !Best.markedItem.ReadyToPickup(3.0000000)) && InventorySpot(N).markedItem != none)
                {
                    // End:0x21E
                    if((InventorySpot(N).markedItem.ReadyToPickup(3.0000000) || FRand() < 0.5000000) && !VisibleToEnemiesOf(N, B))
                    {
                        Best = InventorySpot(N);
                        BestD = Best.markedItem.BotDesireability(B.Pawn);
                    }                    
                }
                else
                {
                    // End:0x2D3
                    if((InventorySpot(N).markedItem != none) && InventorySpot(N).markedItem.ReadyToPickup(3.0000000))
                    {
                        NewD = InventorySpot(N).markedItem.BotDesireability(B.Pawn);
                        // End:0x2D3
                        if((NewD > BestD) && !VisibleToEnemiesOf(N, B))
                        {
                            Best = InventorySpot(N);
                            BestD = NewD;
                        }
                    }
                }
            }
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x3A;
    }
    return Best;
    //return;    
}

function bool CheckVehicle(Bot B)
{
    // End:0x57
    if((EnemyFlag.Holder == none) && VSize(B.Pawn.Location - EnemyFlag.Position().Location) < float(1600))
    {
        return false;
    }
    // End:0xB6
    if((B.PlayerReplicationInfo.HasFlag != none) && VSize(B.Pawn.Location - FriendlyFlag.HomeBase.Location) < float(1600))
    {
        return false;
    }
    return super.CheckVehicle(B);
    //return;    
}

function bool OrdersForFlagCarrier(Bot B)
{
    // End:0x3D
    if(CheckVehicle(B))
    {
        B.GoalString = "Go to vehicle";
        B.SetAttractionState();
        return true;
    }
    // End:0x83
    if(B.Pawn.Health < 40)
    {
        B.TryCombo("wGame.ComboDefensive");        
    }
    else
    {
        B.TryCombo("wGame.ComboSpeed");
    }
    // End:0x3C3
    if(!FriendlyFlag.bHome)
    {
        // End:0x274
        if(Team.Size == 1)
        {
            // End:0x108
            if(B.NeedWeapon() && B.FindInventoryGoal(0.0000000))
            {
                B.SetAttractionState();
                return true;
            }
            // End:0x131
            if(FriendlyFlag.Holder == none)
            {
                // End:0x12C
                if(GoPickupFlag(B))
                {
                    return true;
                }
                return false;                
            }
            else
            {
                // End:0x1CB
                if(((B.Enemy != none) && B.Enemy.PlayerReplicationInfo != none) && B.Enemy.PlayerReplicationInfo.HasFlag != FriendlyFlag)
                {
                    FindNewEnemyFor(B, (B.Enemy != none) && B.LineOfSightTo(B.Enemy));
                }
                // End:0x1FD
                if((Level.TimeSeconds - LastSeeFlagCarrier) > float(6))
                {
                    LastSeeFlagCarrier = Level.TimeSeconds;
                }
                B.GoalString = "Attack enemy flag carrier";
                // End:0x23B
                if(B.IsSniping())
                {
                    return false;
                }
                B.bPursuingFlag = true;
                return TryToIntercept(B, FriendlyFlag.Holder, EnemyFlag.HomeBase);
            }
        }
        // End:0x2EF
        if((((FriendlyFlag.Holder == none) && B.LineOfSightTo(FriendlyFlag.Position())) && VSize(B.Pawn.Location - FriendlyFlag.Location) < 1500.0000000) && GoPickupFlag(B))
        {
            return true;
        }
        // End:0x3C0
        if(HidePath != none)
        {
            // End:0x3A7
            if(B.Pawn.ReachedDestination(HidePath))
            {
                // End:0x3A4
                if(((B.Enemy == none) || (Level.TimeSeconds - B.LastSeenTime) > float(7)) && FRand() < 0.7000000)
                {
                    HidePath = none;
                    // End:0x393
                    if(B.Enemy == none)
                    {
                        B.WanderOrCamp(true);                        
                    }
                    else
                    {
                        B.DoStakeOut();
                    }
                    return true;
                }                
            }
            else
            {
                // End:0x3C0
                if(B.SetRouteToGoal(HidePath))
                {
                    return true;
                }
            }
        }        
    }
    else
    {
        B.bPursuingFlag = false;
    }
    HidePath = none;
    // End:0x521
    if((B.Skill > float(2)) && Vehicle(B.Pawn) == none)
    {
        // End:0x521
        if(((((!FriendlyFlag.bHome || VSize(FriendlyFlag.HomeBase.Location - B.Pawn.Location) > float(2000)) && Team.AI.SuperPickupAvailable(B)) && B.Pawn.Anchor != none) && B.Pawn.ReachedDestination(B.Pawn.Anchor)) && B.FindSuperPickup(800.0000000))
        {
            B.GoalString = "Get super pickup";
            B.SetAttractionState();
            return true;
        }
    }
    // End:0x588
    if((B.Enemy != none) && B.Pawn.Health < 60)
    {
        B.SendMessage(none, 'Other', B.GetMessageIndex('NEEDBACKUP'), 25.0000000, 'Team');
    }
    B.GoalString = "Return to Base with enemy flag!";
    // End:0x60E
    if(!FindPathToObjective(B, FriendlyFlag.HomeBase))
    {
        B.GoalString = "No path to home base for flag carrier";
        return false;
    }
    // End:0x779
    if(B.MoveTarget == FriendlyFlag.HomeBase)
    {
        B.GoalString = "Near my Base with enemy flag!";
        // End:0x717
        if(!FriendlyFlag.bHome)
        {
            B.SendMessage(none, 'Other', B.GetMessageIndex('NEEDOURFLAG'), 25.0000000, 'Team');
            B.GoalString = "NEED OUR FLAG BACK!";
            // End:0x6EF
            if(B.Skill > float(1))
            {
                HidePath = FindHidePathFor(B);
            }
            // End:0x715
            if((HidePath != none) && B.SetRouteToGoal(HidePath))
            {
                return true;
            }
            return false;
        }
        // End:0x779
        if(VSize(B.Pawn.Location - FriendlyFlag.Location) < FriendlyFlag.HomeBase.CollisionRadius)
        {
            FriendlyFlag.Touch(B.Pawn);
        }
    }
    return true;
    //return;    
}

function bool MustKeepEnemy(Pawn E)
{
    // End:0x5C
    if((((E != none) && E.PlayerReplicationInfo != none) && E.PlayerReplicationInfo.HasFlag == FriendlyFlag) && E.Health > 0)
    {
        return true;
    }
    return false;
    //return;    
}

function bool NearEnemyBase(Bot B)
{
    // End:0xD2
    if(((B.Pawn.Region.Zone == EnemyFlag.HomeBase.Region.Zone) && B.Pawn.Region.Zone != FriendlyFlag.HomeBase.Region.Zone) && FriendlyFlag.bHome || B.Pawn.Region.Zone != FriendlyFlag.Position().Region.Zone)
    {
        return true;
    }
    return EnemyFlag.HomeBase.BotNearObjective(B);
    //return;    
}

function bool NearHomeBase(Bot B)
{
    // End:0x7E
    if((B.Pawn.Region.Zone == FriendlyFlag.HomeBase.Region.Zone) && B.Pawn.Region.Zone != EnemyFlag.HomeBase.Region.Zone)
    {
        return true;
    }
    // End:0x113
    if((!FriendlyFlag.bHome && B.Pawn.Region.Zone == FriendlyFlag.Position().Region.Zone) && FriendlyFlag.HomeBase.Region.Zone != EnemyFlag.HomeBase.Region.Zone)
    {
        return true;
    }
    return FriendlyFlag.HomeBase.BotNearObjective(B);
    //return;    
}

function bool FlagNearBase()
{
    // End:0x3C
    if((Level.TimeSeconds - FriendlyFlag.TakenTime) < FriendlyFlag.HomeBase.BaseExitTime)
    {
        return true;
    }
    // End:0xBB
    if((FriendlyFlag.Position().Region.Zone == FriendlyFlag.HomeBase.Region.Zone) && FriendlyFlag.HomeBase.Region.Zone != EnemyFlag.HomeBase.Region.Zone)
    {
        return true;
    }
    return VSize(FriendlyFlag.Position().Location - FriendlyFlag.HomeBase.Location) < FriendlyFlag.HomeBase.BaseRadius;
    //return;    
}

function bool OverrideFollowPlayer(Bot B)
{
    // End:0x16
    if(!EnemyFlag.bHome)
    {
        return false;
    }
    // End:0x54
    if(EnemyFlag.HomeBase.BotNearObjective(B))
    {
        return EnemyFlag.HomeBase.TellBotHowToDisable(B);
    }
    return false;
    //return;    
}

function bool CheckSquadObjectives(Bot B)
{
    local bool bSeeFlag;
    local Actor FlagCarrierTarget;
    local Controller FlagCarrier;

    // End:0x2D
    if(B.PlayerReplicationInfo.HasFlag == EnemyFlag)
    {
        return OrdersForFlagCarrier(B);
    }
    AddTransientCosts(B, 1.0000000);
    // End:0x571
    if(!FriendlyFlag.bHome)
    {
        bSeeFlag = B.LineOfSightTo(FriendlyFlag.Position());
        // End:0x15F
        if(Team.Size == 1)
        {
            // End:0xC3
            if(B.NeedWeapon() && B.FindInventoryGoal(0.0000000))
            {
                B.SetAttractionState();
                return true;
            }
            // End:0x15F
            if((FriendlyFlag.Holder != none) || VSize(B.Pawn.Location - FriendlyFlag.Position().Location) > VSize(B.Pawn.Location - EnemyFlag.Position().Location))
            {
                return FindPathToObjective(B, EnemyFlag.Position());
            }
        }
        // End:0x305
        if(bSeeFlag)
        {
            // End:0x18F
            if(FriendlyFlag.Holder == none)
            {
                // End:0x18C
                if(GoPickupFlag(B))
                {
                    return true;
                }                
            }
            else
            {
                // End:0x229
                if((B.Enemy == none) || (B.Enemy.PlayerReplicationInfo != none) && B.Enemy.PlayerReplicationInfo.HasFlag != FriendlyFlag)
                {
                    FindNewEnemyFor(B, (B.Enemy != none) && B.LineOfSightTo(B.Enemy));
                }
                // End:0x28E
                if((Level.TimeSeconds - LastSeeFlagCarrier) > float(6))
                {
                    LastSeeFlagCarrier = Level.TimeSeconds;
                    B.SendMessage(none, 'Other', B.GetMessageIndex('ENEMYFLAGCARRIERHERE'), 10.0000000, 'Team');
                }
                B.GoalString = "Attack enemy flag carrier";
                // End:0x2CC
                if(B.IsSniping())
                {
                    return false;
                }
                B.bPursuingFlag = true;
                return TryToIntercept(B, FriendlyFlag.Holder, EnemyFlag.HomeBase);
            }
        }
        // End:0x490
        if((GetOrders()) == 'Attack')
        {
            // End:0x458
            if((((B.bPursuingFlag || bSeeFlag) || B.LastRespawnTime > FriendlyFlag.TakenTime) || NearHomeBase(B)) || ((Level.TimeSeconds - FriendlyFlag.TakenTime) > FriendlyFlag.HomeBase.BaseExitTime) && !NearEnemyBase(B))
            {
                B.bPursuingFlag = true;
                B.GoalString = "Go after enemy holding flag rather than attacking";
                // End:0x445
                if(FriendlyFlag.Holder != none)
                {
                    return TryToIntercept(B, FriendlyFlag.Holder, EnemyFlag.HomeBase);                    
                }
                else
                {
                    // End:0x455
                    if(GoPickupFlag(B))
                    {
                        return true;
                    }
                }                
            }
            else
            {
                // End:0x48D
                if(B.bReachedGatherPoint)
                {
                    B.GatherTime = Level.TimeSeconds - float(10);
                }
            }            
        }
        else
        {
            // End:0x571
            if(((PlayerController(SquadLeader) == none) && !B.IsSniping()) && (((CurrentOrders != 'Defend') || bSeeFlag) || B.bPursuingFlag) || FlagNearBase())
            {
                B.bPursuingFlag = true;
                B.GoalString = "Go find my flag";
                // End:0x561
                if(FriendlyFlag.Holder != none)
                {
                    return TryToIntercept(B, FriendlyFlag.Holder, EnemyFlag.HomeBase);                    
                }
                else
                {
                    // End:0x571
                    if(GoPickupFlag(B))
                    {
                        return true;
                    }
                }
            }
        }
    }
    B.bPursuingFlag = false;
    // End:0x6BF
    if((((SquadObjective == EnemyFlag.HomeBase) && B.Enemy != none) && FriendlyFlag.HomeBase.BotNearObjective(B)) && (Level.TimeSeconds - B.LastSeenTime) < float(3))
    {
        // End:0x660
        if((!EnemyFlag.bHome && EnemyFlag.Holder == none) && B.LineOfSightTo(EnemyFlag.Position()))
        {
            return FindPathToObjective(B, EnemyFlag.Position());
        }
        B.SendMessage(none, 'Other', B.GetMessageIndex('Incoming'), 15.0000000, 'Team');
        B.GoalString = "Intercept incoming enemy!";
        return false;
    }
    // End:0x748
    if(EnemyFlag.Holder == none)
    {
        // End:0x745
        if(!EnemyFlag.bHome || EnemyFlag.HomeBase.BotNearObjective(B))
        {
            B.GoalString = "Near enemy flag!";
            return FindPathToObjective(B, EnemyFlag.Position());
        }        
    }
    else
    {
        // End:0xD71
        if(((GetOrders()) != 'Defend') && !SquadLeader.IsA('PlayerController'))
        {
            FlagCarrier = EnemyFlag.Holder.Controller;
            // End:0x7DD
            if((FlagCarrier == none) && EnemyFlag.Holder.DrivenVehicle != none)
            {
                FlagCarrier = EnemyFlag.Holder.DrivenVehicle.Controller;
            }
            // End:0x807
            if((SquadLeader != FlagCarrier) && IsOnSquad(FlagCarrier))
            {
                SetLeader(FlagCarrier);
            }
            // End:0x892
            if((B.Enemy != none) && B.Enemy.LineOfSightTo(FlagCarrier.Pawn))
            {
                B.GoalString = "Fight enemy threatening flag carrier";
                B.FightEnemy(true, 0.0000000);
                return true;
            }
            // End:0x9A2
            if((((FlagCarrier.MoveTarget == FriendlyFlag.HomeBase) || FlagCarrier.RouteCache[1] == FriendlyFlag.HomeBase) && B.Enemy != none) && B.LineOfSightTo(FriendlyFlag.HomeBase))
            {
                B.GoalString = "Fight enemy while waiting for flag carrier to score";
                // End:0x977
                if(B.LostContact(7.0000000))
                {
                    B.LoseEnemy();
                }
                // End:0x9A2
                if(B.Enemy != none)
                {
                    B.FightEnemy(false, 0.0000000);
                    return true;
                }
            }
            // End:0xA55
            if(((AIController(FlagCarrier) != none) && FlagCarrier.MoveTarget != none) && FlagCarrier.InLatentExecution(FlagCarrier.503))
            {
                // End:0xA3E
                if((FlagCarrier.RouteCache[0] == FlagCarrier.MoveTarget) && FlagCarrier.RouteCache[1] != none)
                {
                    FlagCarrierTarget = FlagCarrier.RouteCache[1];                    
                }
                else
                {
                    FlagCarrierTarget = FlagCarrier.MoveTarget;
                }                
            }
            else
            {
                FlagCarrierTarget = FlagCarrier.Pawn;
            }
            FindPathToObjective(B, FlagCarrierTarget);
            // End:0xD1C
            if((B.MoveTarget == FlagCarrierTarget) || B.MoveTarget == FlagCarrier.MoveTarget)
            {
                // End:0xB54
                if(B.Enemy != none)
                {
                    B.GoalString = "Fight enemy while waiting for flag carrier";
                    // End:0xB29
                    if(B.LostContact(7.0000000))
                    {
                        B.LoseEnemy();
                    }
                    // End:0xB54
                    if(B.Enemy != none)
                    {
                        B.FightEnemy(false, 0.0000000);
                        return true;
                    }
                }
                // End:0xBC2
                if(!B.bInitLifeMessage)
                {
                    B.bInitLifeMessage = true;
                    B.SendMessage(EnemyFlag.Holder.PlayerReplicationInfo, 'Other', B.GetMessageIndex('GOTYOURBACK'), 10.0000000, 'Team');
                }
                // End:0xC4D
                if((B.MoveTarget == FlagCarrier.Pawn) && (VSize(B.Pawn.Location - FlagCarrier.Pawn.Location) < float(250)) || FlagCarrier.Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
                {
                    return false;
                }
                // End:0xD1C
                if(((B.Pawn.ReachedDestination(FlagCarrierTarget) || FlagCarrier.Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) || FlagCarrier.MoveTarget == FriendlyFlag.HomeBase) || FlagCarrier.RouteCache[1] == FriendlyFlag.HomeBase)
                {
                    B.WanderOrCamp(true);
                    B.GoalString = "Back up the flag carrier!";
                    return true;
                }
            }
            B.GoalString = "Find the flag carrier - move to " $ string(B.MoveTarget);
            return B.MoveTarget != none;
        }
    }
    return super.CheckSquadObjectives(B);
    //return;    
}

function EnemyFlagTakenBy(Controller C)
{
    local Bot M;
    local AssaultPath List[16];
    local int i, Num;
    local AssaultPath A;
    local float sum, R;

    // End:0x225
    if(Bot(C) != none)
    {
        ReturnPath = none;
        ReturnPathTag = 'None';
        // End:0x20F
        if(EnemyFlag.IsHome())
        {
            // End:0x58
            if(FRand() < 0.2000000)
            {
                Bot(C).bFinalStretch = true;
                return;
            }
            Bot(C).bFinalStretch = false;
            A = EnemyFlag.HomeBase.AlternatePaths;
            J0x8B:

            // End:0x110 [Loop If]
            if(A != none)
            {
                // End:0xF9
                if((A.bEnabled && A.bLastPath) && !A.bNoReturn)
                {
                    List[Num] = A;
                    Num++;
                    // End:0xF9
                    if(Num > 15)
                    {
                        // [Explicit Break]
                        goto J0x110;
                    }
                }
                A = A.NextPath;
                // [Loop Continue]
                goto J0x8B;
            }
            J0x110:

            // End:0x20C
            if(Num > 0)
            {
                i = 0;
                J0x122:

                // End:0x156 [Loop If]
                if(i < Num)
                {
                    sum += List[i].Priority;
                    i++;
                    // [Loop Continue]
                    goto J0x122;
                }
                R = FRand() * sum;
                sum = 0.0000000;
                i = 0;
                J0x177:

                // End:0x1E8 [Loop If]
                if(i < Num)
                {
                    sum += List[i].Priority;
                    // End:0x1DE
                    if(R <= sum)
                    {
                        ReturnPath = List[i];
                        ReturnPathTag = List[i].PickTag();
                        return;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x177;
                }
                ReturnPath = List[0];
                ReturnPathTag = List[0].PickTag();
            }            
        }
        else
        {
            Bot(C).bFinalStretch = true;
        }
    }
    // End:0x251
    if((PlayerController(SquadLeader) == none) && SquadLeader != C)
    {
        SetLeader(C);
    }
    M = SquadMembers;
    J0x25C:

    // End:0x2E8 [Loop If]
    if(M != none)
    {
        // End:0x2D1
        if((M.MoveTarget == EnemyFlag) || M.MoveTarget == EnemyFlag.HomeBase)
        {
            M.MoveTimer = FMin(M.MoveTimer, 0.0500000 + (0.1500000 * FRand()));
        }
        M = M.NextSquadMember;
        // [Loop Continue]
        goto J0x25C;
    }
    //return;    
}

function bool AllowTaunt(Bot B)
{
    return (FRand() < 0.5000000) && int(PriorityObjective(B)) < 1;
    //return;    
}

function bool ShouldDeferTo(Controller C)
{
    // End:0x1F
    if(C.PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    return super.ShouldDeferTo(C);
    //return;    
}

function byte PriorityObjective(Bot B)
{
    // End:0x45
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        // End:0x42
        if(FriendlyFlag.HomeBase.BotNearObjective(B))
        {
            return byte(255);
        }
        return 2;
    }
    // End:0x5C
    if(FriendlyFlag.Holder != none)
    {
        return 1;
    }
    return 0;
    //return;    
}

function float ModifyThreat(float Current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    // End:0x10E
    if(((NewThreat.PlayerReplicationInfo != none) && NewThreat.PlayerReplicationInfo.HasFlag != none) && bThreatVisible)
    {
        // End:0xFE
        if(((VSize(B.Pawn.Location - NewThreat.Location) < float(1500)) || (B.Pawn.Weapon != none) && B.Pawn.Weapon.bSniping) || VSize(NewThreat.Location - EnemyFlag.HomeBase.Location) < float(2000))
        {
            return Current + float(6);            
        }
        else
        {
            return Current + 1.5000000;
        }        
    }
    else
    {
        // End:0x130
        if(NewThreat.IsHumanControlled())
        {
            return Current + 0.5000000;            
        }
        else
        {
            return Current;
        }
    }
    //return;    
}

defaultproperties
{
    MaxSquadSize=3
}