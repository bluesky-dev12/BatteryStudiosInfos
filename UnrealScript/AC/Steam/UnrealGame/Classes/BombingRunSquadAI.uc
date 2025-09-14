/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\BombingRunSquadAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:19
 *
 *******************************************************************************/
class BombingRunSquadAI extends SquadAI
    dependson(BombingRunTeamAI)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float LastSeeFlagCarrier;
var GameObject Bomb;
var GameObjective EnemyBase;
var GameObjective HomeBase;
var GameObjective BombBase;
var float ScoringRand;
var class<ShootSpot> ShootSpotClass[2];
var Bot SelfPasser;
var Bot PassTarget;

function AssignCombo(Bot B)
{
    // End:0x1b
    if(GetOrders() != 'Attack')
    {
        super.AssignCombo(B);
    }
}

function bool AllowDetourTo(Bot B, NavigationPoint N)
{
    // End:0x23
    if(B.Pawn != Bomb.Holder)
    {
        return true;
    }
    return N.LastDetourWeight * B.RouteDist > float(3);
}

function bool AllowTranslocationBy(Bot B)
{
    return B.Pawn != Bomb.Holder;
}

function bool AllowImpactJumpBy(Bot B)
{
    return B.Pawn != Bomb.Holder;
}

function Actor SetFacingActor(Bot B)
{
    // End:0x23
    if(B.Pawn != Bomb.Holder)
    {
        return none;
    }
    // End:0x96
    if(B.Enemy == none || B.Skill < float(4) || VSize(EnemyBase.Location - B.Pawn.Location) > float(2500))
    {
        return B.MoveTarget;
    }
    // End:0xb5
    if(ShootSpot(B.MoveTarget) != none)
    {
        return EnemyBase;
    }
    return B.MoveTarget;
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
        if(Level.TimeSeconds - BombingRunTeamAI(Team.AI).LastGotFlag > float(15))
        {
            BombingRunTeamAI(Team.AI).LastGotFlag = Level.TimeSeconds;
            B.SendMessage(none, 'Other', B.GetMessageIndex('GOTENEMYFLAG'), 20.0, 'Team');
        }
        B.GoalString = "Pick up bomb";
        return true;
    }
    return false;
}

function Actor FormationCenter()
{
    // End:0x36
    if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex)
    {
        return SquadObjective;
    }
    // End:0x83
    if(Bomb.Holder != none && GetOrders() != 'Defend' && !SquadLeader.IsA('PlayerController'))
    {
        return Bomb.Holder;
    }
    return SquadLeader.Pawn;
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
    if(B.Enemy == none || Level.TimeSeconds - B.LastSeenTime > float(4))
    {
        return false;
    }
    // End:0x9a
    if(Team == Level.GRI.Teams[0])
    {
        EnemyTeam = Level.GRI.Teams[1];
    }
    // End:0xb9
    else
    {
        EnemyTeam = Level.GRI.Teams[0];
    }
    G = DeathMatch(Level.Game);
    // End:0x143
    if(G.GoalScore > 0 && Team.Score > float(G.GoalScore - 7) && Team.Score < float(G.GoalScore - 3))
    {
        bNeedTouchDown = true;
    }
    // End:0x1bd
    else
    {
        // End:0x192
        if(Team.Score > EnemyTeam.Score)
        {
            bNeedTouchDown = Team.Score < EnemyTeam.Score + float(3);
        }
        // End:0x1bd
        else
        {
            bNeedTouchDown = EnemyTeam.Score > Team.Score + float(3);
        }
    }
    // End:0x211
    if(bNeedTouchDown)
    {
        // End:0x1f3
        if(G.TimeLimit > 0 && G.RemainingTime < 90)
        {
            return false;
        }
        return EnemyBase.GetDifficulty() < ScoringRand + 0.30;
    }
    // End:0x247
    if(B.Pawn.Weapon.IsA('SuperShockRifle') && FRand() < 0.50)
    {
        return true;
    }
    // End:0x283
    if(B.Pawn.Health < 30)
    {
        return EnemyBase.GetDifficulty() < ScoringRand - 0.30;
    }
    return EnemyBase.GetDifficulty() < ScoringRand;
}

function bool TryPassTo(Vector V, Bot CarrierBot, Pawn Recipient)
{
    local Pawn Carrier;

    Carrier = CarrierBot.Pawn;
    // End:0x24b
    if(float(Recipient.Health) + Recipient.ShieldStrength >= FMin(60.0, float(Carrier.Health)) || Recipient.InCurrentCombo() || Recipient.Controller.Adrenaline == Recipient.Controller.AdrenalineMax && VSize(Recipient.Location - Carrier.Location) < float(3500) && V Dot Normal(Recipient.Location - Carrier.Location) > 0.50 && Recipient.IsHumanControlled() || CarrierBot.Focus == CarrierBot.MoveTarget || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[0] || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[1] || Recipient.Controller.MoveTarget == CarrierBot.RouteCache[2] && Carrier.LineOfSightTo(Recipient))
    {
        PassTarget = Bot(Recipient.Controller);
        Carrier.Weapon.SetAITarget(Recipient);
        CarrierBot.bPlannedShot = true;
        CarrierBot.Target = Recipient;
        Carrier.Weapon.BotFire(false);
        return true;
    }
    return false;
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
    if(B.Enemy != none && B.Pawn.Health < 60)
    {
        B.SendMessage(none, 'Other', B.GetMessageIndex('NEEDBACKUP'), 25.0, 'Team');
    }
    B.bPlannedShot = false;
    SelfPasser = none;
    PassTarget = none;
    // End:0x13a
    if(VSize(B.Pawn.Location - EnemyBase.Location) > float(3000) && VSize(B.Pawn.Location - HomeBase.Location) > float(3000) && !B.Pawn.InCurrentCombo())
    {
        bCanPass = true;
    }
    bSelfPass = GameObject(B.PlayerReplicationInfo.HasFlag).CanBeThrownBy(B.Pawn) && bCanPass && B.TranslocFreq < Level.TimeSeconds + float(12) && B.Skill + B.Tactics > float(3) + float(4) * FRand() && B.Enemy == none || VSize(B.Pawn.Location - HomeBase.Location) > float(5000);
    // End:0x3e0
    if(bCanPass)
    {
        V = vector(B.Pawn.Rotation);
        C = Level.ControllerList;
        J0x265:
        // End:0x311 [While If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0x2f3
            if(PC != none && B.SameTeamAs(PC) && PC.Pawn != none && TryPassTo(V, B, PC.Pawn))
            {
                bCanPass = false;
                bPassing = true;
                // This is an implied JumpToken;
                goto J0x311;
            }
            // End:0x2fa
            else
            {
                PC = none;
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x265;
        }
        J0x311:
        // End:0x3e0
        if(bCanPass)
        {
            S = SquadMembers;
            J0x325:
            // End:0x3e0 [While If]
            if(S != none)
            {
                // End:0x3c9
                if(S.Pawn != none && S.Pawn.Physics != 2 || S.Pawn.PhysicsVolume.Gravity.Z < float(-900) && TryPassTo(V, B, S.Pawn))
                {
                    bPassing = true;
                }
                // End:0x3e0
                else
                {
                    S = S.NextSquadMember;
                    // This is an implied JumpToken; Continue!
                    goto J0x325;
                }
            }
        }
    }
    // End:0x582
    if(!bPassing && PreferShootScore(B))
    {
        // End:0x49e
        if(ShootSpot(B.Pawn.Anchor) != none && B.Pawn.ReachedDestination(B.Pawn.Anchor))
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
            // End:0x54b
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
    // End:0x5d0
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
    // End:0x684
    else
    {
        // End:0x670
        if(bPassing)
        {
            B.bRecommendFastMove = true;
        }
        // End:0x684
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
}

function PassToSelf(Bot B)
{
    // End:0x1d1
    if(B.Pawn.PhysicsVolume.Gravity.Z == B.Pawn.PhysicsVolume.default.Gravity.Z && B.MoveTarget.Location.Z <= B.Pawn.Location.Z + B.Pawn.CollisionHeight + 35.0 && VSize(B.MoveTarget.Location - B.Pawn.Location) > float(500) && vector(B.Pawn.Rotation) Dot Normal(B.MoveTarget.Location - B.Pawn.Location) > 0.70)
    {
        SelfPasser = B;
        B.Pawn.Weapon.SetAITarget(B.MoveTarget);
        B.bPlannedShot = true;
        B.Target = B.MoveTarget;
        B.Pawn.Weapon.BotFire(false);
    }
}

function bool MustKeepEnemy(Pawn E)
{
    // End:0x3d
    if(E == Bomb.Holder && E != none && E.Health > 0)
    {
        return true;
    }
    return false;
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
    // End:0x5d
    else
    {
        // End:0x5d
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
    // End:0xcf
    else
    {
        // End:0xcf
        if(Bomb.Holder != none)
        {
            PassTarget = none;
            SelfPasser = none;
            bOnBombHolderTeam = B.SameTeamAs(Bomb.Holder.Controller);
        }
    }
    // End:0x14e
    if(Bomb.bHome || bOnBombHolderTeam && B.NeedWeapon() && B.FindInventoryGoal(0.0))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    BombPosition = Bomb.Position();
    bSeeBomb = B.LineOfSightTo(BombPosition);
    // End:0x1e8
    if(!bSeeBomb && B.NeedWeapon() && B.FindInventoryGoal(0.0))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    // End:0x81c
    if(bOnBombHolderTeam && GetOrders() != 'Defend' && !SquadLeader.IsA('PlayerController') || SquadLeader == Bomb.Holder.Controller && B.GetOrders() == 'Follow')
    {
        BombCarrier = Bomb.Holder.Controller;
        // End:0x2a0
        if(SquadLeader != BombCarrier && IsOnSquad(BombCarrier))
        {
            SetLeader(BombCarrier);
        }
        // End:0x354
        if(B.Enemy != none && B.Enemy.LineOfSightTo(BombCarrier.Pawn) && B.Skill + B.StrafingAbility < float(3))
        {
            B.GoalString = "Fight enemy threatening flag carrier";
            B.FightEnemy(true, 0.0);
            return true;
        }
        // End:0x497
        if(AIController(BombCarrier) == none)
        {
            // End:0x480
            if(bSeeBomb)
            {
                // End:0x3f3
                if(BombCarrier.Pawn.Velocity != vect(0.0, 0.0, 0.0))
                {
                    // End:0x3f0
                    if(VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(3000))
                    {
                        B.bRecommendFastMove = true;
                        BombCarrierTarget = EnemyBase;
                    }
                }
                // End:0x47d
                else
                {
                    // End:0x469
                    if(B.Skill > float(3) && VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(1500))
                    {
                        B.bRecommendFastMove = true;
                        BombCarrierTarget = EnemyBase;
                    }
                    // End:0x47d
                    else
                    {
                        BombCarrierTarget = BombCarrier.Pawn;
                    }
                }
            }
            // End:0x494
            else
            {
                BombCarrierTarget = BombCarrier.Pawn;
            }
        }
        // End:0x63b
        else
        {
            // End:0x627
            if(BombCarrier.MoveTarget != none && BombCarrier.Pawn.Velocity != vect(0.0, 0.0, 0.0))
            {
                // End:0x610
                if(BombCarrier.RouteCache[0] == BombCarrier.MoveTarget && BombCarrier.RouteCache[1] != none)
                {
                    AddTransientCosts(B, 0.50);
                    B.bRecommendFastMove = true;
                    // End:0x587
                    if(VSize(BombCarrier.Pawn.Location - B.Pawn.Location) < float(1700))
                    {
                        BombCarrierTarget = BombCarrier.RouteGoal;
                    }
                    // End:0x60d
                    else
                    {
                        // End:0x5f7
                        if(BombCarrier.RouteCache[2] != none)
                        {
                            // End:0x5dd
                            if(BombCarrier.RouteCache[3] != none && FRand() < 0.70)
                            {
                                BombCarrierTarget = BombCarrier.RouteCache[3];
                            }
                            // End:0x5f4
                            else
                            {
                                BombCarrierTarget = BombCarrier.RouteCache[2];
                            }
                        }
                        // End:0x60d
                        else
                        {
                            BombCarrierTarget = BombCarrier.RouteCache[1];
                        }
                    }
                }
                // End:0x624
                else
                {
                    BombCarrierTarget = BombCarrier.MoveTarget;
                }
            }
            // End:0x63b
            else
            {
                BombCarrierTarget = BombCarrier.Pawn;
            }
        }
        FindPathToObjective(B, BombCarrierTarget);
        // End:0x7c6
        if(B.MoveTarget == EnemyBase || B.Pawn.ReachedDestination(BombCarrierTarget))
        {
            // End:0x725
            if(B.Enemy != none)
            {
                B.GoalString = "Fight enemy while waiting for flag carrier";
                // End:0x6fa
                if(B.LostContact(8.0))
                {
                    B.LoseEnemy();
                }
                // End:0x725
                if(B.Enemy != none)
                {
                    B.FightEnemy(false, 0.0);
                    return true;
                }
            }
            // End:0x78a
            if(!B.bInitLifeMessage)
            {
                B.bInitLifeMessage = true;
                B.SendMessage(BombCarrier.PlayerReplicationInfo, 'Other', B.GetMessageIndex('GOTYOURBACK'), 10.0, 'Team');
            }
            B.WanderOrCamp(true);
            B.GoalString = "Back up the flag carrier!";
            return true;
        }
        B.GoalString = "Find the " $ string(BombCarrierTarget) $ " - move to " $ string(B.MoveTarget);
        return B.MoveTarget != none;
    }
    AddTransientCosts(B, 1.0);
    // End:0x99b
    if(bSeeBomb)
    {
        // End:0x872
        if(Bomb.Holder == none)
        {
            // End:0x86f
            if(!Bomb.bHome && GoPickupBomb(B))
            {
                return true;
            }
        }
        // End:0x99b
        else
        {
            // End:0x99b
            if(!bOnBombHolderTeam)
            {
                // End:0x8d9
                if(B.Enemy != Bomb.Holder)
                {
                    FindNewEnemyFor(B, B.Enemy != none && B.LineOfSightTo(B.Enemy));
                }
                // End:0x93e
                if(Level.TimeSeconds - LastSeeFlagCarrier > float(6))
                {
                    LastSeeFlagCarrier = Level.TimeSeconds;
                    B.SendMessage(none, 'Other', B.GetMessageIndex('ENEMYBALLCARRIERHERE'), 10.0, 'Team');
                }
                B.GoalString = "Attack enemy bomb carrier";
                // End:0x97c
                if(B.IsSniping())
                {
                    return false;
                }
                return TryToIntercept(B, Bomb.Holder, HomeBase);
            }
        }
    }
    // End:0xa3d
    if(Bomb.bHome)
    {
        // End:0x9f8
        if(BombBase.BotNearObjective(B))
        {
            B.GoalString = "Near bomb base!";
            return FindPathToObjective(B, BombBase);
        }
        // End:0xa3a
        else
        {
            // End:0xa3a
            if(GetOrders() == 'Attack')
            {
                B.GoalString = "Go to bomb base!";
                return FindPathToObjective(B, BombBase);
            }
        }
    }
    // End:0xaaf
    else
    {
        // End:0xaaf
        if(GetOrders() == 'Attack')
        {
            B.GoalString = "Go to bomb";
            // End:0xa9e
            if(Bomb.Holder != none)
            {
                return TryToIntercept(B, Bomb.Holder, HomeBase);
            }
            // End:0xaaf
            else
            {
                return FindPathToObjective(B, Bomb);
            }
        }
    }
    return super.CheckSquadObjectives(B);
}

function BombTakenBy(Controller C)
{
    local Bot M;

    // End:0x36
    if(VSize(Bomb.Location - BombBase.Location) < float(500))
    {
        SetAlternatePath(true);
    }
    // End:0x67
    else
    {
        // End:0x67
        if(Bot(C) == none || Bomb.OldTeam != Team)
        {
            SetFinalStretch(true);
        }
    }
    SelfPasser = none;
    PassTarget = none;
    // End:0x8f
    if(SquadLeader != C)
    {
        SetLeader(C);
    }
    M = SquadMembers;
    J0x9a:
    // End:0x11d [While If]
    if(M != none)
    {
        // End:0x106
        if(M.MoveTarget == Bomb || M.MoveTarget == BombBase)
        {
            M.MoveTimer = FMin(M.MoveTimer, 0.050 + 0.150 * FRand());
        }
        M = M.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x9a;
    }
}

function bool AllowTaunt(Bot B)
{
    return FRand() < 0.50 && PriorityObjective(B) < 1;
}

function bool ShouldDeferTo(Controller C)
{
    // End:0x1f
    if(C.PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    return super.ShouldDeferTo(C);
}

function byte PriorityObjective(Bot B)
{
    // End:0x3c
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
}

function float ModifyThreat(float Current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    // End:0x15a
    if(NewThreat.PlayerReplicationInfo != none && NewThreat.PlayerReplicationInfo.HasFlag != none && bThreatVisible)
    {
        // End:0xe0
        if(VSize(NewThreat.Location - HomeBase.Location) > float(5000) && VSize(NewThreat.Location - B.Pawn.Location) > float(1500) && UnderFire(NewThreat, B))
        {
            // End:0xd3
            if(NewThreat.IsHumanControlled())
            {
                return Current + float(1);
            }
            return Current + 0.50;
        }
        // End:0x14a
        if(VSize(B.Pawn.Location - NewThreat.Location) < float(1500) || B.Pawn.Weapon.bSniping)
        {
            return Current + float(6);
        }
        // End:0x157
        else
        {
            return Current + 1.50;
        }
    }
    // End:0x182
    else
    {
        // End:0x17c
        if(NewThreat.IsHumanControlled())
        {
            return Current + 0.40;
        }
        // End:0x182
        else
        {
            return Current;
        }
    }
}

defaultproperties
{
    ShootSpotClass[0]=class'BlueShootSpot'
    ShootSpotClass[1]=class'RedShootSpot'
    GatherThreshold=0.10
    MaxSquadSize=3
}