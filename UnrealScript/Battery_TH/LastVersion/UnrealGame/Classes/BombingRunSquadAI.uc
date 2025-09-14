class BombingRunSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float LastSeeFlagCarrier;
var GameObject Bomb;
var GameObjective EnemyBase;
var GameObjective HomeBase;
var GameObjective BombBase;
var float ScoringRand;
var Class<ShootSpot> ShootSpotClass[2];
var Bot SelfPasser;
var Bot PassTarget;

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
    if(B.Pawn != Bomb.Holder)
    {
        return true;
    }
    return (N.LastDetourWeight * B.RouteDist) > float(3);
    //return;    
}

function bool AllowTranslocationBy(Bot B)
{
    return B.Pawn != Bomb.Holder;
    //return;    
}

function bool AllowImpactJumpBy(Bot B)
{
    return B.Pawn != Bomb.Holder;
    //return;    
}

function Actor SetFacingActor(Bot B)
{
    // End:0x23
    if(B.Pawn != Bomb.Holder)
    {
        return none;
    }
    // End:0x96
    if(((B.Enemy == none) || B.Skill < float(4)) || VSize(EnemyBase.Location - B.Pawn.Location) > float(2500))
    {
        return B.MoveTarget;
    }
    // End:0xB5
    if(ShootSpot(B.MoveTarget) != none)
    {
        return EnemyBase;
    }
    return B.MoveTarget;
    //return;    
}

function bool GoPickupBomb(Bot B)
{
    // End:0x24
    if(!Bomb.CanBePickedUpBy(B.Pawn))
    {
        return false;
    }
    // End:0x63
    if(B.Pawn.TouchingActor(Bomb))
    {
        Bomb.Touch(B.Pawn);
        return false;
    }
    // End:0x132
    if(FindPathToObjective(B, Bomb.Position()))
    {
        // End:0x113
        if((Level.TimeSeconds - BombingRunTeamAI(Team.AI).LastGotFlag) > float(15))
        {
            BombingRunTeamAI(Team.AI).LastGotFlag = Level.TimeSeconds;
            B.SendMessage(none, 'Other', B.GetMessageIndex('GOTENEMYFLAG'), 20.0000000, 'Team');
        }
        B.GoalString = "Pick up bomb";
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
    if(((Bomb.Holder != none) && (GetOrders()) != 'Defend') && !SquadLeader.IsA('PlayerController'))
    {
        return Bomb.Holder;
    }
    return SquadLeader.Pawn;
    //return;    
}

function bool PreferShootScore(Bot B)
{
    local TeamInfo EnemyTeam;
    local bool bNeedTouchDown;
    local DeathMatch G;

    // End:0x16
    if(!EnemyBase.bHasShootSpots)
    {
        return false;
    }
    // End:0x55
    if((B.Enemy == none) || (Level.TimeSeconds - B.LastSeenTime) > float(4))
    {
        return false;
    }
    // End:0x9A
    if(Team == Level.GRI.Teams[0])
    {
        EnemyTeam = Level.GRI.Teams[1];        
    }
    else
    {
        EnemyTeam = Level.GRI.Teams[0];
    }
    G = DeathMatch(Level.Game);
    // End:0x143
    if(((G.GoalScore > 0) && Team.Score > float(G.GoalScore - 7)) && Team.Score < float(G.GoalScore - 3))
    {
        bNeedTouchDown = true;        
    }
    else
    {
        // End:0x192
        if(Team.Score > EnemyTeam.Score)
        {
            bNeedTouchDown = Team.Score < (EnemyTeam.Score + float(3));            
        }
        else
        {
            bNeedTouchDown = EnemyTeam.Score > (Team.Score + float(3));
        }
    }
    // End:0x211
    if(bNeedTouchDown)
    {
        // End:0x1F3
        if((G.TimeLimit > 0) && G.RemainingTime < 90)
        {
            return false;
        }
        return EnemyBase.GetDifficulty() < (ScoringRand + 0.3000000);
    }
    // End:0x247
    if(B.Pawn.Weapon.IsA('SuperShockRifle') && FRand() < 0.5000000)
    {
        return true;
    }
    // End:0x283
    if(B.Pawn.Health < 30)
    {
        return EnemyBase.GetDifficulty() < (ScoringRand - 0.3000000);
    }
    return EnemyBase.GetDifficulty() < ScoringRand;
    //return;    
}

function bool TryPassTo(Vector V, Bot CarrierBot, Pawn Recipient)
{
    local Pawn Carrier;

    Carrier = CarrierBot.Pawn;
    // End:0x24B
    if((((((((float(Recipient.Health) + Recipient.ShieldStrength) >= FMin(60.0000000, float(Carrier.Health))) || Recipient.InCurrentCombo()) || Recipient.Controller.Adrenaline == Recipient.Controller.AdrenalineMax) && VSize(Recipient.Location - Carrier.Location) < float(3500)) && (V Dot Normal(Recipient.Location - Carrier.Location)) > 0.5000000) && (((Recipient.IsHumanControlled() || CarrierBot.Focus == CarrierBot.MoveTarget) || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[0]) || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[1]) || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[2]) && Carrier.LineOfSightTo(Recipient))
    {
        PassTarget = Bot(Recipient.Controller);
        Carrier.Weapon.SetAITarget(Recipient);
        CarrierBot.bPlannedShot = true;
        CarrierBot.Target = Recipient;
        Carrier.Weapon.BotFire(false);
        return true;
    }
    return false;
    //return;    
}

function bool OrdersForBombCarrier(Bot B)
{
    local Bot S;
    local Vector V;
    local Controller C;
    local PlayerController PC;
    local bool bPassing, bCanPass, bSelfPass;

    B.TryCombo("wGame.ComboSpeed");
    // End:0x88
    if((B.Enemy != none) && B.Pawn.Health < 60)
    {
        B.SendMessage(none, 'Other', B.GetMessageIndex('NEEDBACKUP'), 25.0000000, 'Team');
    }
    B.bPlannedShot = false;
    SelfPasser = none;
    PassTarget = none;
    // End:0x13A
    if(((VSize(B.Pawn.Location - EnemyBase.Location) > float(3000)) && VSize(B.Pawn.Location - HomeBase.Location) > float(3000)) && !B.Pawn.InCurrentCombo())
    {
        bCanPass = true;
    }
    bSelfPass = (((GameObject(B.PlayerReplicationInfo.HasFlag).CanBeThrownBy(B.Pawn) && bCanPass) && B.TranslocFreq < (Level.TimeSeconds + float(12))) && (B.Skill + B.Tactics) > (float(3) + (float(4) * FRand()))) && (B.Enemy == none) || VSize(B.Pawn.Location - HomeBase.Location) > float(5000);
    // End:0x3E0
    if(bCanPass)
    {
        V = Vector(B.Pawn.Rotation);
        C = Level.ControllerList;
        J0x265:

        // End:0x311 [Loop If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x2F3
            if((((PC != none) && B.SameTeamAs(PC)) && PC.Pawn != none) && TryPassTo(V, B, PC.Pawn))
            {
                bCanPass = false;
                bPassing = true;
                // [Explicit Break]
                goto J0x311;                
            }
            else
            {
                PC = none;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x265;
        }
        J0x311:

        // End:0x3E0
        if(bCanPass)
        {
            S = SquadMembers;
            J0x325:

            // End:0x3E0 [Loop If]
            if(S != none)
            {
                // End:0x3C9
                if(((S.Pawn != none) && (int(S.Pawn.Physics) != int(2)) || S.Pawn.PhysicsVolume.Gravity.Z < float(-900)) && TryPassTo(V, B, S.Pawn))
                {
                    bPassing = true;
                    // [Explicit Break]
                    goto J0x3E0;
                }
                S = S.NextSquadMember;
                // [Loop Continue]
                goto J0x325;
            }
        }
    }
    J0x3E0:

    // End:0x582
    if(!bPassing && PreferShootScore(B))
    {
        // End:0x49E
        if((ShootSpot(B.Pawn.Anchor) != none) && B.Pawn.ReachedDestination(B.Pawn.Anchor))
        {
            B.bPlannedShot = true;
            B.Pawn.Weapon.SetAITarget(EnemyBase);
            B.DoRangedAttackOn(EnemyBase);
            return true;
        }
        // End:0x582
        if(AlternatePath == none)
        {
            B.MoveTarget = B.FindPathTowardNearest(ShootSpotClass[Team.TeamIndex], false);
            // End:0x54B
            if(B.MoveTarget != none)
            {
                // End:0x504
                if(bSelfPass)
                {
                    PassToSelf(B);
                }
                B.GoalString = "Move to shoot spot " $ string(B.RouteGoal);
                B.SetAttractionState();
                return true;
            }
            // End:0x582
            if(B.bSoaking)
            {
                B.SoakStop("NO PATH TO SHOOTSPOT");
            }
        }
    }
    // End:0x5D0
    if(!FindPathToObjective(B, EnemyBase))
    {
        B.GoalString = "No path to enemy base for bomb carrier";
        return false;
    }
    // End:0x653
    if(B.MoveTarget == EnemyBase)
    {
        B.GoalString = "Near enemy Base with bomb!";
        // End:0x650
        if(B.Pawn.ReachedDestination(EnemyBase))
        {
            EnemyBase.Touch(B.Pawn);
        }        
    }
    else
    {
        // End:0x670
        if(bPassing)
        {
            B.bRecommendFastMove = true;            
        }
        else
        {
            // End:0x684
            if(bSelfPass)
            {
                PassToSelf(B);
            }
        }
    }
    return true;
    //return;    
}

function PassToSelf(Bot B)
{
    // End:0x1D1
    if((((B.Pawn.PhysicsVolume.Gravity.Z == B.Pawn.PhysicsVolume.default.Gravity.Z) && B.MoveTarget.Location.Z <= ((B.Pawn.Location.Z + B.Pawn.CollisionHeight) + 35.0000000)) && VSize(B.MoveTarget.Location - B.Pawn.Location) > float(500)) && (Vector(B.Pawn.Rotation) Dot Normal(B.MoveTarget.Location - B.Pawn.Location)) > 0.7000000)
    {
        SelfPasser = B;
        B.Pawn.Weapon.SetAITarget(B.MoveTarget);
        B.bPlannedShot = true;
        B.Target = B.MoveTarget;
        B.Pawn.Weapon.BotFire(false);
    }
    //return;    
}

function bool MustKeepEnemy(Pawn E)
{
    // End:0x3D
    if(((E == Bomb.Holder) && E != none) && E.Health > 0)
    {
        return true;
    }
    return false;
    //return;    
}

function bool OverrideFollowPlayer(Bot B)
{
    // End:0x16
    if(!Bomb.bHome)
    {
        return false;
    }
    // End:0x54
    if(Bomb.HomeBase.BotNearObjective(B))
    {
        return Bomb.HomeBase.TellBotHowToDisable(B);
    }
    return false;
    //return;    
}

function bool CheckSquadObjectives(Bot B)
{
    local bool bSeeBomb, bOnBombHolderTeam;
    local Actor BombPosition, BombCarrierTarget;
    local Controller BombCarrier;

    B.bRecommendFastMove = false;
    // End:0x41
    if(Bomb.Holder == B.Pawn)
    {
        return OrdersForBombCarrier(B);        
    }
    else
    {
        // End:0x5D
        if(Bomb.Holder == none)
        {
            ScoringRand = FRand();
        }
    }
    // End:0x80
    if(Bomb.bHome)
    {
        PassTarget = none;
        SelfPasser = none;        
    }
    else
    {
        // End:0xCF
        if(Bomb.Holder != none)
        {
            PassTarget = none;
            SelfPasser = none;
            bOnBombHolderTeam = B.SameTeamAs(Bomb.Holder.Controller);
        }
    }
    // End:0x14E
    if(((Bomb.bHome || bOnBombHolderTeam) && B.NeedWeapon()) && B.FindInventoryGoal(0.0000000))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    BombPosition = Bomb.Position();
    bSeeBomb = B.LineOfSightTo(BombPosition);
    // End:0x1E8
    if((!bSeeBomb && B.NeedWeapon()) && B.FindInventoryGoal(0.0000000))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    // End:0x81C
    if((bOnBombHolderTeam && (GetOrders()) != 'Defend') && !SquadLeader.IsA('PlayerController') || (SquadLeader == Bomb.Holder.Controller) && B.GetOrders() == 'Follow')
    {
        BombCarrier = Bomb.Holder.Controller;
        // End:0x2A0
        if((SquadLeader != BombCarrier) && IsOnSquad(BombCarrier))
        {
            SetLeader(BombCarrier);
        }
        // End:0x354
        if(((B.Enemy != none) && B.Enemy.LineOfSightTo(BombCarrier.Pawn)) && (B.Skill + B.StrafingAbility) < float(3))
        {
            B.GoalString = "Fight enemy threatening flag carrier";
            B.FightEnemy(true, 0.0000000);
            return true;
        }
        // End:0x497
        if(AIController(BombCarrier) == none)
        {
            // End:0x480
            if(bSeeBomb)
            {
                // End:0x3F3
                if(BombCarrier.Pawn.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
                {
                    // End:0x3F0
                    if(VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(3000))
                    {
                        B.bRecommendFastMove = true;
                        BombCarrierTarget = EnemyBase;
                    }                    
                }
                else
                {
                    // End:0x469
                    if((B.Skill > float(3)) && VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(1500))
                    {
                        B.bRecommendFastMove = true;
                        BombCarrierTarget = EnemyBase;                        
                    }
                    else
                    {
                        BombCarrierTarget = BombCarrier.Pawn;
                    }
                }                
            }
            else
            {
                BombCarrierTarget = BombCarrier.Pawn;
            }            
        }
        else
        {
            // End:0x627
            if((BombCarrier.MoveTarget != none) && BombCarrier.Pawn.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
            {
                // End:0x610
                if((BombCarrier.RouteCache[0] == BombCarrier.MoveTarget) && BombCarrier.RouteCache[1] != none)
                {
                    AddTransientCosts(B, 0.5000000);
                    B.bRecommendFastMove = true;
                    // End:0x587
                    if(VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(1700))
                    {
                        BombCarrierTarget = BombCarrier.RouteGoal;                        
                    }
                    else
                    {
                        // End:0x5F7
                        if(BombCarrier.RouteCache[2] != none)
                        {
                            // End:0x5DD
                            if((BombCarrier.RouteCache[3] != none) && FRand() < 0.7000000)
                            {
                                BombCarrierTarget = BombCarrier.RouteCache[3];                                
                            }
                            else
                            {
                                BombCarrierTarget = BombCarrier.RouteCache[2];
                            }                            
                        }
                        else
                        {
                            BombCarrierTarget = BombCarrier.RouteCache[1];
                        }
                    }                    
                }
                else
                {
                    BombCarrierTarget = BombCarrier.MoveTarget;
                }                
            }
            else
            {
                BombCarrierTarget = BombCarrier.Pawn;
            }
        }
        FindPathToObjective(B, BombCarrierTarget);
        // End:0x7C6
        if((B.MoveTarget == EnemyBase) || B.Pawn.ReachedDestination(BombCarrierTarget))
        {
            // End:0x725
            if(B.Enemy != none)
            {
                B.GoalString = "Fight enemy while waiting for flag carrier";
                // End:0x6FA
                if(B.LostContact(8.0000000))
                {
                    B.LoseEnemy();
                }
                // End:0x725
                if(B.Enemy != none)
                {
                    B.FightEnemy(false, 0.0000000);
                    return true;
                }
            }
            // End:0x78A
            if(!B.bInitLifeMessage)
            {
                B.bInitLifeMessage = true;
                B.SendMessage(BombCarrier.PlayerReplicationInfo, 'Other', B.GetMessageIndex('GOTYOURBACK'), 10.0000000, 'Team');
            }
            B.WanderOrCamp(true);
            B.GoalString = "Back up the flag carrier!";
            return true;
        }
        B.GoalString = (("Find the " $ string(BombCarrierTarget)) $ " - move to ") $ string(B.MoveTarget);
        return B.MoveTarget != none;
    }
    AddTransientCosts(B, 1.0000000);
    // End:0x99B
    if(bSeeBomb)
    {
        // End:0x872
        if(Bomb.Holder == none)
        {
            // End:0x86F
            if(!Bomb.bHome && GoPickupBomb(B))
            {
                return true;
            }            
        }
        else
        {
            // End:0x99B
            if(!bOnBombHolderTeam)
            {
                // End:0x8D9
                if(B.Enemy != Bomb.Holder)
                {
                    FindNewEnemyFor(B, (B.Enemy != none) && B.LineOfSightTo(B.Enemy));
                }
                // End:0x93E
                if((Level.TimeSeconds - LastSeeFlagCarrier) > float(6))
                {
                    LastSeeFlagCarrier = Level.TimeSeconds;
                    B.SendMessage(none, 'Other', B.GetMessageIndex('ENEMYBALLCARRIERHERE'), 10.0000000, 'Team');
                }
                B.GoalString = "Attack enemy bomb carrier";
                // End:0x97C
                if(B.IsSniping())
                {
                    return false;
                }
                return TryToIntercept(B, Bomb.Holder, HomeBase);
            }
        }
    }
    // End:0xA3D
    if(Bomb.bHome)
    {
        // End:0x9F8
        if(BombBase.BotNearObjective(B))
        {
            B.GoalString = "Near bomb base!";
            return FindPathToObjective(B, BombBase);            
        }
        else
        {
            // End:0xA3A
            if((GetOrders()) == 'Attack')
            {
                B.GoalString = "Go to bomb base!";
                return FindPathToObjective(B, BombBase);
            }
        }        
    }
    else
    {
        // End:0xAAF
        if((GetOrders()) == 'Attack')
        {
            B.GoalString = "Go to bomb";
            // End:0xA9E
            if(Bomb.Holder != none)
            {
                return TryToIntercept(B, Bomb.Holder, HomeBase);                
            }
            else
            {
                return FindPathToObjective(B, Bomb);
            }
        }
    }
    return super.CheckSquadObjectives(B);
    //return;    
}

function BombTakenBy(Controller C)
{
    local Bot M;

    // End:0x36
    if(VSize(Bomb.Location - BombBase.Location) < float(500))
    {
        SetAlternatePath(true);        
    }
    else
    {
        // End:0x67
        if((Bot(C) == none) || Bomb.OldTeam != Team)
        {
            SetFinalStretch(true);
        }
    }
    SelfPasser = none;
    PassTarget = none;
    // End:0x8F
    if(SquadLeader != C)
    {
        SetLeader(C);
    }
    M = SquadMembers;
    J0x9A:

    // End:0x11D [Loop If]
    if(M != none)
    {
        // End:0x106
        if((M.MoveTarget == Bomb) || M.MoveTarget == BombBase)
        {
            M.MoveTimer = FMin(M.MoveTimer, 0.0500000 + (0.1500000 * FRand()));
        }
        M = M.NextSquadMember;
        // [Loop Continue]
        goto J0x9A;
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
    // End:0x3C
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        // End:0x39
        if(EnemyBase.BotNearObjective(B))
        {
            return byte(255);
        }
        return 2;
    }
    // End:0x53
    if(Bomb.Holder != none)
    {
        return 1;
    }
    return 0;
    //return;    
}

function float ModifyThreat(float current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    // End:0x15A
    if(((NewThreat.PlayerReplicationInfo != none) && NewThreat.PlayerReplicationInfo.HasFlag != none) && bThreatVisible)
    {
        // End:0xE0
        if(((VSize(NewThreat.Location - HomeBase.Location) > float(5000)) && VSize(NewThreat.Location - B.Pawn.Location) > float(1500)) && UnderFire(NewThreat, B))
        {
            // End:0xD3
            if(NewThreat.IsHumanControlled())
            {
                return current + float(1);
            }
            return current + 0.5000000;
        }
        // End:0x14A
        if((VSize(B.Pawn.Location - NewThreat.Location) < float(1500)) || B.Pawn.Weapon.bSniping)
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
        // End:0x17C
        if(NewThreat.IsHumanControlled())
        {
            return current + 0.4000000;            
        }
        else
        {
            return current;
        }
    }
    //return;    
}

defaultproperties
{
    ShootSpotClass[0]=Class'UnrealGame_Decompressed.BlueShootSpot'
    ShootSpotClass[1]=Class'UnrealGame_Decompressed.RedShootSpot'
    GatherThreshold=0.1000000
    MaxSquadSize=3
}