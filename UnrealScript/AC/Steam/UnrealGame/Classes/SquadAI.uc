/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\SquadAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:27
 *	Functions:75
 *	States:1
 *
 *******************************************************************************/
class SquadAI extends ReplicationInfo
    dependson(UnrealTeamInfo)
    dependson(TeamAI)
    dependson(UnrealPawn)
    dependson(HoldSpot)
    dependson(UnrealScriptedSequence)
    dependson(DestroyableObjective)
    dependson(SpecialVehicleObjective)
    dependson(UnrealMPGameInfo)
    dependson(TeamPlayerReplicationInfo)
    dependson(AssaultPath)
    dependson(RestingFormation)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var UnrealTeamInfo Team;
var Controller SquadLeader;
var TeamPlayerReplicationInfo LeaderPRI;
var SquadAI NextSquad;
var GameObjective SquadObjective;
var int Size;
var AssaultPath AlternatePath;
var name AlternatePathTag;
var Bot SquadMembers;
var float GatherThreshold;
var localized string SupportString;
var localized string DefendString;
var localized string AttackString;
var localized string HoldString;
var localized string FreelanceString;
var localized string SupportStringTrailer;
var name CurrentOrders;
var Pawn enemies[8];
var int MaxSquadSize;
var bool bFreelance;
var bool bFreelanceAttack;
var bool bFreelanceDefend;
var bool bRoamingSquad;
var bool bAddTransientCosts;
var UnrealScriptedSequence FreelanceScripts;
var RestingFormation RestingFormation;
var class<RestingFormation> RestingFormationClass;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        LeaderPRI, SquadObjective,
        CurrentOrders, bFreelance;

}

function Reset()
{
    local int i;

    super(Actor).Reset();
    NetUpdateTime = Level.TimeSeconds - float(1);
    SquadObjective = none;
    AlternatePath = none;
    i = 0;
    J0x34:
    // End:0x57 [While If]
    if(i < 8)
    {
        enemies[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x34;
    }
}

function AssignCombo(Bot B)
{
    // End:0x6a
    if(B.Enemy != none && B.EnemyVisible())
    {
        // End:0x53
        if(CurrentOrders == 'Defend')
        {
            B.TryCombo("DMRandom");
        }
        // End:0x6a
        else
        {
            B.TryCombo("Random");
        }
    }
}

function CriticalObjectiveWarning(Pawn NewEnemy)
{
    local Bot M;

    // End:0x12
    if(!ValidEnemy(NewEnemy))
    {
        return;
    }
    AddEnemy(NewEnemy);
    // End:0x2f
    if(!MustKeepEnemy(NewEnemy))
    {
        return;
    }
    M = SquadMembers;
    J0x3a:
    // End:0x7c [While If]
    if(M != none)
    {
        // End:0x65
        if(M.Enemy == none)
        {
            FindNewEnemyFor(M, false);
        }
        M = M.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
}

function bool ShouldSuppressEnemy(Bot B)
{
    return FRand() < 0.70 && VSize(B.Enemy.Location - B.FocalPoint) < float(350) && Level.TimeSeconds - B.LastSeenTime < float(4);
}

function bool AllowDetourTo(Bot B, NavigationPoint N)
{
    return true;
}

function RestingFormation GetRestingFormation()
{
    // End:0x1a
    if(RestingFormation == none)
    {
        RestingFormation = Spawn(RestingFormationClass, self);
    }
    return RestingFormation;
}

function Destroyed()
{
    // End:0x24
    if(Team != none)
    {
        Team.AI.RemoveSquad(self);
    }
    // End:0x3b
    if(RestingFormation != none)
    {
        RestingFormation.Destroy();
    }
    super(Actor).Destroyed();
}

function bool AllowTranslocationBy(Bot B)
{
    return true;
}

function bool AllowImpactJumpBy(Bot B)
{
    return true;
}

function Actor SetFacingActor(Bot B)
{
    return none;
}

function Vehicle GetKeyVehicle(Bot B)
{
    // End:0x1b
    if(Vehicle(SquadLeader.Pawn) == none)
    {
        return none;
    }
    // End:0x4f
    if(Vehicle(SquadLeader.Pawn).bKeyVehicle)
    {
        return Vehicle(SquadLeader.Pawn);
    }
    return none;
}

function Vehicle GetLinkVehicle(Bot B)
{
    // End:0x1b
    if(Vehicle(SquadLeader.Pawn) == none)
    {
        return none;
    }
    // End:0x65
    if(B.Enemy == none || Vehicle(SquadLeader.Pawn).bKeyVehicle)
    {
        return Vehicle(SquadLeader.Pawn);
    }
    return none;
}

function Rotator GetFacingRotation()
{
    local Rotator Rot;

    // End:0x22
    if(SquadObjective == none)
    {
        Rot = SquadLeader.Rotation;
    }
    // End:0xb2
    else
    {
        // End:0x5a
        if(SquadObjective.DefenderTeamIndex == Team.TeamIndex)
        {
            Rot.Yaw = Rand(65536);
        }
        // End:0xb2
        else
        {
            // End:0xa0
            if(SquadLeader.Pawn != none)
            {
                Rot = rotator(SquadObjective.Location - SquadLeader.Pawn.Location);
            }
            // End:0xb2
            else
            {
                Rot.Yaw = Rand(65536);
            }
        }
    }
    Rot.Pitch = 0;
    Rot.Roll = 0;
    return Rot;
}

function Actor FormationCenter()
{
    // End:0x36
    if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex)
    {
        return SquadObjective;
    }
    return SquadLeader.Pawn;
}

function bool MergeEnemiesFrom(SquadAI S)
{
    local int i;
    local bool bNew, bAdd;

    // End:0x0d
    if(S == none)
    {
        return false;
    }
    i = 0;
    J0x14:
    // End:0x7d [While If]
    if(i < 8)
    {
        // End:0x5b
        if(S.enemies[i] != none)
        {
            bAdd = AddEnemy(S.enemies[i]);
        }
        bNew = bNew || bAdd;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return bNew;
}

function bool LostEnemy(Bot B)
{
    local Pawn Lost;
    local bool bFound;
    local Bot M;

    // End:0x6e
    if(B.Enemy.Health <= 0 || B.Enemy.Controller == none)
    {
        B.Enemy = none;
        RemoveEnemy(B.Enemy);
        FindNewEnemyFor(B, false);
        return true;
    }
    // End:0x87
    if(MustKeepEnemy(B.Enemy))
    {
        return false;
    }
    Lost = B.Enemy;
    B.Enemy = none;
    M = SquadMembers;
    J0xb6:
    // End:0x127 [While If]
    if(M != none)
    {
        // End:0x110
        if(M != B && M.Enemy == Lost && !M.LostContact(5.0))
        {
            bFound = true;
        }
        // End:0x127
        else
        {
            M = M.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0xb6;
        }
    }
    // End:0x147
    if(bFound)
    {
        B.Enemy = Lost;
    }
    // End:0x15e
    else
    {
        RemoveEnemy(Lost);
        FindNewEnemyFor(B, false);
    }
    return B.Enemy != Lost;
}

function bool MustKeepEnemy(Pawn E)
{
    return false;
}

function bool AddEnemy(Pawn NewEnemy)
{
    local int i;
    local Bot M;
    local bool bCurrentEnemy;

    i = 0;
    J0x07:
    // End:0x34 [While If]
    if(i < 8)
    {
        // End:0x2a
        if(enemies[i] == NewEnemy)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x3b:
    // End:0x75 [While If]
    if(i < 8)
    {
        // End:0x6b
        if(enemies[i] == none)
        {
            enemies[i] = NewEnemy;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    i = 0;
    J0x7c:
    // End:0x10e [While If]
    if(i < 8)
    {
        bCurrentEnemy = false;
        M = SquadMembers;
        J0x9b:
        // End:0xe6 [While If]
        if(M != none)
        {
            // End:0xcf
            if(M.Enemy == enemies[i])
            {
                bCurrentEnemy = true;
            }
            // End:0xe6
            else
            {
                M = M.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x9b;
            }
        }
        // End:0x104
        if(!bCurrentEnemy)
        {
            enemies[i] = NewEnemy;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
    return false;
}

function bool ValidEnemy(Pawn NewEnemy)
{
    return NewEnemy != none && !NewEnemy.bAmbientCreature && NewEnemy.Health > 0 && NewEnemy.Controller != none && !FriendlyToward(NewEnemy);
}

function bool SetEnemy(Bot B, Pawn NewEnemy)
{
    local Bot M;
    local bool bResult;

    // End:0x2c
    if(NewEnemy == B.Enemy || !ValidEnemy(NewEnemy))
    {
        return false;
    }
    // End:0x3e
    if(!AddEnemy(NewEnemy))
    {
        return false;
    }
    // End:0xd2
    if(MustKeepEnemy(NewEnemy))
    {
        M = SquadMembers;
        J0x57:
        // End:0xd2 [While If]
        if(M != none)
        {
            // End:0xbb
            if(M != B && M.Enemy != NewEnemy)
            {
                FindNewEnemyFor(M, M.Enemy != none && M.EnemyVisible());
            }
            M = M.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x57;
        }
    }
    bResult = FindNewEnemyFor(B, B.Enemy != none && B.EnemyVisible());
    // End:0x149
    if(bResult && B.Enemy == NewEnemy)
    {
        B.AcquireTime = Level.TimeSeconds;
    }
    return bResult;
}

function byte PriorityObjective(Bot B)
{
    return 0;
}

function bool IsOnSquad(Controller C)
{
    // End:0x27
    if(Bot(C) != none)
    {
        return Bot(C).Squad == self;
    }
    return C == SquadLeader;
}

function RemoveEnemy(Pawn E)
{
    local Bot B;
    local int i;

    i = 0;
    J0x07:
    // End:0x3f [While If]
    if(i < 8)
    {
        // End:0x35
        if(enemies[i] == E)
        {
            enemies[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x5c
    if(Level.Game.bGameEnded)
    {
        return;
    }
    B = SquadMembers;
    J0x67:
    // End:0x172 [While If]
    if(B != none)
    {
        // End:0x15b
        if(B.Enemy == E)
        {
            B.Enemy = none;
            FindNewEnemyFor(B, false);
            // End:0x15b
            if(B.Pawn != none && B.Enemy == none && !B.bIgnoreEnemyChange)
            {
                // End:0x14a
                if(B.InLatentExecution(B.503) && NavigationPoint(B.MoveTarget) != none && !B.bPreparingMove)
                {
                    B.GotoState('Roaming');
                }
                // End:0x15b
                else
                {
                    B.WhatToDoNext(42);
                }
            }
        }
        B = B.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    local Bot B;

    // End:0x0d
    if(Killed == none)
    {
        return;
    }
    // End:0xe9
    if(Team != none && Killed.PlayerReplicationInfo != none && Killed.PlayerReplicationInfo.Team == Team)
    {
        // End:0xe7
        if(IsOnSquad(Killed))
        {
            B = SquadMembers;
            J0x6a:
            // End:0xe7 [While If]
            if(B != none)
            {
                // End:0xd0
                if(B != Killed && B.LineOfSightTo(KilledPawn))
                {
                    B.SendMessage(none, 'Other', B.GetMessageIndex('MANDOWN'), 10.0, 'Team');
                }
                // End:0xe7
                else
                {
                    B = B.NextSquadMember;
                    // This is an implied JumpToken; Continue!
                    goto J0x6a;
                }
            }
        }
        return;
    }
    RemoveEnemy(KilledPawn);
    B = Bot(Killer);
    // End:0x184
    if(B != none && B.Squad == self && B.Enemy == none && B.Pawn != none && AllowTaunt(B))
    {
        B.Target = KilledPawn;
        B.Celebrate();
    }
}

function bool FindNewEnemyFor(Bot B, bool bSeeEnemy)
{
    local int i;
    local Pawn BestEnemy, OldEnemy;
    local bool bSeeNew;
    local float BestThreat, NewThreat;

    // End:0x16
    if(B.Pawn == none)
    {
        return true;
    }
    // End:0x59
    if(B.Enemy != none && MustKeepEnemy(B.Enemy) && B.EnemyVisible())
    {
        return false;
    }
    BestEnemy = B.Enemy;
    OldEnemy = B.Enemy;
    // End:0x112
    if(BestEnemy != none)
    {
        // End:0xd0
        if(BestEnemy.Health < 0 || BestEnemy.Controller == none)
        {
            B.Enemy = none;
            BestEnemy = none;
        }
        // End:0x112
        else
        {
            // End:0xf6
            if(ModifyThreat(0.0, BestEnemy, bSeeEnemy, B) > float(5))
            {
                return false;
            }
            BestThreat = AssessThreat(B, BestEnemy, bSeeEnemy);
        }
    }
    i = 0;
    J0x119:
    // End:0x2ca [While If]
    if(i < 8)
    {
        // End:0x2b3
        if(enemies[i] != none && enemies[i].Health > 0 && enemies[i].Controller != none)
        {
            // End:0x1c7
            if(BestEnemy == none)
            {
                BestEnemy = enemies[i];
                bSeeEnemy = B.CanSee(enemies[i]);
                BestThreat = AssessThreat(B, BestEnemy, bSeeEnemy);
            }
            // End:0x2b0
            else
            {
                // End:0x2b0
                if(enemies[i] != BestEnemy)
                {
                    // End:0x238
                    if(VSize(enemies[i].Location - B.Pawn.Location) < float(1500))
                    {
                        bSeeNew = B.LineOfSightTo(enemies[i]);
                    }
                    // End:0x256
                    else
                    {
                        bSeeNew = B.CanSee(enemies[i]);
                    }
                    NewThreat = AssessThreat(B, enemies[i], bSeeNew);
                    // End:0x2b0
                    if(NewThreat > BestThreat)
                    {
                        BestEnemy = enemies[i];
                        BestThreat = NewThreat;
                        bSeeEnemy = bSeeNew;
                    }
                }
            }
        }
        // End:0x2c0
        else
        {
            enemies[i] = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x119;
    }
    B.Enemy = BestEnemy;
    // End:0x323
    if(B.Enemy != OldEnemy && B.Enemy != none)
    {
        B.EnemyChanged(bSeeEnemy);
        return true;
    }
    return false;
}

function float ModifyThreat(float Current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
    return Current;
}

function bool UnderFire(Pawn NewThreat, Bot Ignored)
{
    local Bot B;

    B = SquadMembers;
    J0x0b:
    // End:0x115 [While If]
    if(B != none)
    {
        // End:0xfe
        if(B != Ignored && B.Pawn != none && B.Enemy == NewThreat && B.Focus == NewThreat && VSize(Ignored.Pawn.Location - NewThreat.Location + NewThreat.Velocity) > VSize(B.Pawn.Location - NewThreat.Location + NewThreat.Velocity) && B.EnemyVisible())
        {
            return true;
        }
        B = B.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return false;
}

function float AssessThreat(Bot B, Pawn NewThreat, bool bThreatVisible)
{
    local float ThreatValue, NewStrength, dist;

    NewStrength = B.RelativeStrength(NewThreat);
    ThreatValue = FClamp(NewStrength, 0.0, 1.0);
    dist = VSize(NewThreat.Location - B.Pawn.Location);
    // End:0xd4
    if(dist < float(2000))
    {
        ThreatValue += 0.20;
        // End:0x9a
        if(dist < float(1500))
        {
            ThreatValue += 0.20;
        }
        // End:0xb7
        if(dist < float(1000))
        {
            ThreatValue += 0.20;
        }
        // End:0xd4
        if(dist < float(500))
        {
            ThreatValue += 0.20;
        }
    }
    // End:0xe7
    if(bThreatVisible)
    {
        ThreatValue += float(1);
    }
    // End:0x223
    if(NewThreat != B.Enemy && B.Enemy != none)
    {
        // End:0x12e
        if(!bThreatVisible)
        {
            ThreatValue -= float(5);
        }
        // End:0x15f
        else
        {
            // End:0x15f
            if(Level.TimeSeconds - B.LastSeenTime > float(2))
            {
                ThreatValue += float(1);
            }
        }
        // End:0x1ae
        if(dist > 0.70 * VSize(B.Enemy.Location - B.Pawn.Location))
        {
            ThreatValue -= 0.250;
        }
        ThreatValue -= 0.20;
        // End:0x223
        if(B.IsHunting() && NewStrength < 0.20 && Level.TimeSeconds - FMax(B.LastSeenTime, B.AcquireTime) < 2.50)
        {
            ThreatValue -= 0.30;
        }
    }
    ThreatValue = ModifyThreat(ThreatValue, NewThreat, bThreatVisible, B);
    // End:0x262
    if(NewThreat.IsHumanControlled())
    {
        ThreatValue += 0.250;
    }
    return ThreatValue;
}

function bool ShouldDeferTo(Controller C)
{
    return C == SquadLeader;
}

function bool WaitAtThisPosition(Pawn P)
{
    // End:0x4a
    if(Bot(P.Controller).NeedWeapon() || PlayerController(SquadLeader) == none || SquadLeader.Pawn == none)
    {
        return false;
    }
    return CloseToLeader(P);
}

function bool WanderNearLeader(Bot B)
{
    // End:0x72
    if(Vehicle(B.Pawn) != none || B.NeedWeapon() || PlayerController(SquadLeader) == none || SquadLeader.Pawn == none || !CloseToLeader(B.Pawn))
    {
        return false;
    }
    // End:0x8b
    if(B.FindInventoryGoal(0.00050))
    {
        return true;
    }
}

function bool NearFormationCenter(Pawn P)
{
    local Actor center;

    center = FormationCenter();
    // End:0x19
    if(center == none)
    {
        return true;
    }
    // End:0x52
    if(center == SquadLeader.Pawn)
    {
        // End:0x50
        if(PlayerController(SquadLeader) != none)
        {
            return CloseToLeader(P);
        }
        // End:0x52
        else
        {
            return false;
        }
    }
    // End:0x88
    if(VSize(center.Location - P.Location) > GetRestingFormation().FormationSize)
    {
        return false;
    }
    return P.Controller.LineOfSightTo(center);
}

function bool CloseToLeader(Pawn P)
{
    local float dist;

    // End:0x23
    if(P == none || SquadLeader.Pawn == none)
    {
        return true;
    }
    // End:0x7b
    if(Vehicle(P) == none)
    {
        // End:0x78
        if(Vehicle(SquadLeader.Pawn) != none && Vehicle(SquadLeader.Pawn).OpenPositionFor(P) != none)
        {
            return false;
        }
    }
    // End:0xa8
    else
    {
        // End:0xa8
        if(PlayerController(SquadLeader) != none && Vehicle(SquadLeader.Pawn) == none)
        {
            return false;
        }
    }
    // End:0xf0
    if(P.GetVehicleBase() == SquadLeader.Pawn || SquadLeader.Pawn.GetVehicleBase() == P)
    {
        return true;
    }
    // End:0x151
    if(P.Base != none && SquadLeader.Pawn.Base != none && SquadLeader.Pawn.Base != P.Base)
    {
        return false;
    }
    dist = VSize(P.Location - SquadLeader.Pawn.Location);
    // End:0x19b
    if(dist > GetRestingFormation().FormationSize)
    {
        return false;
    }
    // End:0x1d3
    if(PhysicsVolume.bWaterVolume)
    {
        // End:0x1d0
        if(VSize(SquadLeader.Pawn.Velocity) > float(0))
        {
            return false;
        }
    }
    // End:0x20a
    else
    {
        // End:0x20a
        if(VSize(SquadLeader.Pawn.Velocity) > SquadLeader.Pawn.PronedSpeed)
        {
            return false;
        }
    }
    return P.Controller.LineOfSightTo(SquadLeader.Pawn);
}

function MergeWith(SquadAI S)
{
    local Bot B, Prev;

    // End:0x0d
    if(S == self)
    {
        return;
    }
    B = SquadMembers;
    J0x18:
    // End:0x64 [While If]
    if(B != none)
    {
        // End:0x42
        if(Prev != none)
        {
            S.AddBot(Prev);
        }
        Prev = B;
        B = B.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    // End:0x83
    if(Prev != none)
    {
        S.AddBot(Prev);
    }
    Destroy();
}

function Initialize(UnrealTeamInfo t, GameObjective o, Controller C)
{
    Team = t;
    SetLeader(C);
    SetObjective(o, false);
}

function SetAlternatePath(bool bResetSquad)
{
    local AssaultPath List[16];
    local int i, Num;
    local AssaultPath A;
    local float sum, R;
    local Bot S;

    AlternatePath = none;
    AlternatePathTag = 'None';
    // End:0x6a
    if(bResetSquad)
    {
        S = SquadMembers;
        J0x26:
        // End:0x6a [While If]
        if(S != none)
        {
            S.bFinalStretch = false;
            S.bReachedGatherPoint = false;
            S = S.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x26;
        }
    }
    A = SquadObjective.AlternatePaths;
    J0x7e:
    // End:0x103 [While If]
    if(A != none)
    {
        // End:0xec
        if(A.bEnabled && A.bFirstPath && !A.bReturnOnly)
        {
            List[Num] = A;
            ++ Num;
            // End:0xec
            if(Num > 15)
            {
            }
            // End:0x103
            else
            {
            }
            A = A.NextPath;
            // This is an implied JumpToken; Continue!
            goto J0x7e;
        }
    }
    // End:0x1ff
    if(Num > 0)
    {
        i = 0;
        J0x115:
        // End:0x149 [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x115;
        }
        R = FRand() * sum;
        sum = 0.0;
        i = 0;
        J0x16a:
        // End:0x1db [While If]
        if(i < Num)
        {
            sum += List[i].Priority;
            // End:0x1d1
            if(R <= sum)
            {
                AlternatePath = List[i];
                AlternatePathTag = List[i].PickTag();
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x16a;
        }
        AlternatePath = List[0];
        AlternatePathTag = List[0].PickTag();
    }
}

function bool TryToIntercept(Bot B, Pawn P, Actor RouteGoal)
{
    // End:0x6f
    if(P == B.Enemy && B.Pawn.RecommendLongRangedAttack() && P != none && B.LineOfSightTo(P))
    {
        B.FightEnemy(false, 0.0);
        return true;
    }
    // End:0xc6
    if(P == none || NavigationPoint(RouteGoal) == none || B.Skill + B.Tactics < float(4))
    {
        return FindPathToObjective(B, P);
    }
    B.MoveTarget = none;
    // End:0x1ad
    if(B.actorReachable(P))
    {
        B.GoalString = "almost to " $ string(P);
        // End:0x136
        if(B.Enemy != P)
        {
            SetEnemy(B, P);
        }
        // End:0x164
        if(B.Enemy != none)
        {
            B.FightEnemy(true, 0.0);
            return true;
        }
        // End:0x1ad
        else
        {
            Log("Not attacking intercepted enemy!");
            B.MoveTarget = P;
            B.SetAttractionState();
            return true;
        }
    }
    B.MoveTarget = B.FindPathToIntercept(P, RouteGoal, true);
    // End:0x23f
    if(B.MoveTarget == none)
    {
        // End:0x23c
        if(P == B.Enemy)
        {
            B.FailedHuntEnemy = B.Enemy;
            B.FailedHuntTime = Level.TimeSeconds;
        }
    }
    // End:0x26a
    else
    {
        // End:0x26a
        if(B.Pawn.ReachedDestination(B.MoveTarget))
        {
            return false;
        }
    }
    return B.StartMoveToward(P);
}

function bool FindPathToObjective(Bot B, Actor o)
{
    local Bot S;
    local float N, GatherWaitTime;
    local Vehicle V;

    // End:0x106
    if(B.Pawn.bStationary)
    {
        V = B.Pawn.GetVehicleBase();
        // End:0x6a
        if(V == none)
        {
            V = Vehicle(B.Pawn);
            // End:0x6a
            if(V == none)
            {
                return false;
            }
        }
        // End:0x104
        if(DestroyableObjective(o) == none && SquadObjective.VehiclePath != none && V.ReachedDestination(SquadObjective.VehiclePath))
        {
            Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(12);
            Vehicle(B.Pawn).KDriverLeave(false);
        }
        // End:0x106
        else
        {
            return false;
        }
    }
    // End:0x14b
    if(o == none)
    {
        o = SquadObjective;
        // End:0x14b
        if(o == none)
        {
            B.GoalString = "No SquadObjective";
            return false;
        }
    }
    // End:0x335
    if(o == SquadObjective && Vehicle(B.Pawn) != none && SquadObjective.VehiclePath != none)
    {
        // End:0x321
        if(DestroyableObjective(SquadObjective) == none && B.Pawn.ReachedDestination(SquadObjective.VehiclePath))
        {
            // End:0x2cf
            if(Vehicle(B.Pawn).bKeyVehicle)
            {
                // End:0x287
                if(Team.Size == Vehicle(B.Pawn).NumPassengers())
                {
                    Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(14);
                    Vehicle(B.Pawn).bKeyVehicle = false;
                    Vehicle(B.Pawn).KDriverLeave(false);
                }
                // End:0x2cc
                else
                {
                    // End:0x2b5
                    if(B.Enemy != none)
                    {
                        B.FightEnemy(false, 0.0);
                        return true;
                    }
                    // End:0x2cc
                    else
                    {
                        B.GotoState('RestFormation', 'Pausing');
                        return true;
                    }
                }
            }
            // End:0x31e
            else
            {
                Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(14);
                Vehicle(B.Pawn).KDriverLeave(false);
            }
        }
        // End:0x335
        else
        {
            o = SquadObjective.VehiclePath;
        }
    }
    // End:0x386
    if(B.bFinalStretch || o != SquadObjective || SquadObjective.BotNearObjective(B))
    {
        return B.SetRouteToGoal(o);
    }
    // End:0x3b2
    if(AlternatePath == none || AlternatePath.AssociatedObjective != SquadObjective)
    {
        SetAlternatePath(false);
    }
    // End:0x3d2
    if(AlternatePath == none)
    {
        return B.SetRouteToGoal(o);
    }
    B.MoveTarget = none;
    // End:0x4a4
    if(B.actorReachable(o))
    {
        // End:0x435
        if(B.Pawn.ReachedDestination(o))
        {
            o.Touch(B.Pawn);
            return false;
        }
        B.RouteGoal = o;
        B.RouteCache[0] = none;
        B.GoalString = "almost at " $ string(o);
        B.MoveTarget = o;
        B.SetAttractionState();
        return true;
    }
    // End:0x81a
    if(B.bReachedGatherPoint || B.Pawn.ReachedDestination(AlternatePath))
    {
        B.GoalString = "Find path to " $ string(o) $ " now near " $ string(AlternatePath);
        B.MoveTarget = AlternatePath;
        // End:0x56c
        if(!B.bReachedGatherPoint)
        {
            B.bReachedGatherPoint = true;
            B.GatherTime = Level.TimeSeconds;
        }
        // End:0x5a2
        if(B.Enemy != none && B.EnemyVisible())
        {
            GatherWaitTime = 3.0;
        }
        // End:0x5ad
        else
        {
            GatherWaitTime = 8.0;
        }
        // End:0x5f4
        if(Level.TimeSeconds - B.GatherTime > GatherWaitTime || GatherThreshold < float(1))
        {
            N = float(Size);
        }
        // End:0x667
        else
        {
            S = SquadMembers;
            J0x5ff:
            // End:0x667 [While If]
            if(S != none)
            {
                // End:0x650
                if(S.Pawn != none && S.bReachedGatherPoint || S.bFinalStretch)
                {
                    N += float(1);
                }
                S = S.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x5ff;
            }
        }
        // End:0x77e
        if(AlternatePath.bNoGrouping || N / float(Size) >= GatherThreshold || GatherThreshold < float(1))
        {
            S = SquadMembers;
            J0x6ad:
            // End:0x6e0 [While If]
            if(S != none)
            {
                S.bReachedGatherPoint = false;
                S = S.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x6ad;
            }
            AlternatePath = AlternatePath.FindNextPath(AlternatePathTag);
            // End:0x750
            if(AlternatePath == none)
            {
                B.GoalString = "Final stretch to " $ string(o);
                SetFinalStretch(true);
                B.FindBestPathToward(o, true, true);
            }
            // End:0x766
            else
            {
                B.FindBestPathToward(AlternatePath, true, true);
            }
            return B.StartMoveToward(o);
        }
        // End:0x7e3
        else
        {
            // End:0x7e3
            if(B.Enemy != none)
            {
                // End:0x7b8
                if(B.LostContact(7.0))
                {
                    B.LoseEnemy();
                }
                // End:0x7e3
                if(B.Enemy != none)
                {
                    B.FightEnemy(false, 0.0);
                    return true;
                }
            }
        }
        B.GoalString = "Waiting for Squad";
        B.WanderOrCamp(true);
        return true;
    }
    // End:0x975
    else
    {
        B.GoalString = "Find path to " $ string(o) $ " through " $ string(AlternatePath);
        // End:0x92f
        if(!B.FindBestPathToward(AlternatePath, true, true))
        {
            B.GoalString = "Find path to " $ string(o) $ " no path to alternate path";
            // End:0x919
            if(B.bSoaking && Physics != 2)
            {
                B.SoakStop("COULDN'T FIND PATH TO ALTERNATEPATH " $ string(AlternatePath));
            }
            B.FindBestPathToward(o, true, true);
        }
        // End:0x975
        if(B.MoveTarget == AlternatePath)
        {
            B.GatherTime = Level.TimeSeconds;
            B.bReachedGatherPoint = true;
        }
    }
    return B.StartMoveToward(o);
}

function SetFinalStretch(bool bValue)
{
    local Bot S;

    S = SquadMembers;
    J0x0b:
    // End:0x43 [While If]
    if(S != none)
    {
        S.bFinalStretch = bValue;
        S = S.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function SetLeader(Controller C)
{
    SquadLeader = C;
    // End:0x55
    if(LeaderPRI != C.PlayerReplicationInfo)
    {
        LeaderPRI = TeamPlayerReplicationInfo(C.PlayerReplicationInfo);
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    // End:0x75
    if(Bot(C) != none)
    {
        AddBot(Bot(C));
    }
}

function RemovePlayer(PlayerController P)
{
    local GameObjective NewObjective;

    // End:0x11
    if(SquadLeader != P)
    {
        return;
    }
    // End:0x21
    if(SquadMembers == none)
    {
        Destroy();
        return;
    }
    NewObjective = Team.AI.GetPriorityAttackObjectiveFor(self);
    // End:0x73
    if(NewObjective != SquadObjective)
    {
        SquadObjective = NewObjective;
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
    PickNewLeader();
}

function RemoveBot(Bot B)
{
    local Bot Prev;

    // End:0x16
    if(B.Squad != self)
    {
        return;
    }
    B.Squad = none;
    -- Size;
    // End:0x63
    if(SquadMembers == B)
    {
        SquadMembers = B.NextSquadMember;
        // End:0x60
        if(SquadMembers == none)
        {
            Destroy();
            return;
        }
    }
    // End:0xc8
    else
    {
        Prev = SquadMembers;
        J0x6e:
        // End:0xc8 [While If]
        if(Prev != none)
        {
            // End:0xb1
            if(Prev.NextSquadMember == B)
            {
                Prev.NextSquadMember = B.NextSquadMember;
            }
            // End:0xc8
            else
            {
                Prev = Prev.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x6e;
            }
        }
    }
    // End:0xdd
    if(SquadLeader == B)
    {
        PickNewLeader();
    }
}

function AddBot(Bot B)
{
    // End:0x16
    if(B.Squad == self)
    {
        return;
    }
    // End:0x47
    if(B.Squad != none)
    {
        B.Squad.RemoveBot(B);
    }
    ++ Size;
    B.NextSquadMember = SquadMembers;
    SquadMembers = B;
    B.Squad = self;
    // End:0xb4
    if(TeamPlayerReplicationInfo(B.PlayerReplicationInfo) != none)
    {
        TeamPlayerReplicationInfo(B.PlayerReplicationInfo).Squad = self;
    }
}

function SwitchBots(Bot MyBot, Bot OtherBot)
{
    local SquadAI OtherSquad;

    OtherSquad = OtherBot.Squad;
    // End:0x3d
    if(Size == 1)
    {
        SquadMembers = none;
        MyBot.Squad = none;
        Size = 0;
    }
    OtherSquad.AddBot(MyBot);
    AddBot(OtherBot);
    // End:0x6d
    if(Size == 1)
    {
        PickNewLeader();
    }
}

function SetDefenseScriptFor(Bot B)
{
    local UnrealScriptedSequence S;

    // End:0x171
    if(B.GoalScript != none && SquadObjective.OwnsDefenseScript(B.GoalScript) && !B.GoalScript.bNotInVehicle || Vehicle(B.Pawn) == none)
    {
        // End:0xbd
        if(!B.bEnemyEngaged && !B.Pawn.ReachedDestination(B.GoalScript.GetMoveTarget()))
        {
            return;
        }
        B.bEnemyEngaged = B.Enemy != none;
        // End:0x171
        if(!B.GoalScript.bRoamingScript && B.bEnemyEngaged || B.GoalScript.bDontChangeScripts || FRand() < 0.850 && B.Pawn.ReachedDestination(B.GoalScript.GetMoveTarget()))
        {
            return;
        }
    }
    // End:0x1ae
    if(B.GoalScript != none)
    {
        B.GoalScript.bAvoid = true;
        B.FreeScript();
    }
    S = SquadObjective.DefenseScripts;
    J0x1c2:
    // End:0x21d [While If]
    if(S != none)
    {
        // End:0x206
        if(S.HigherPriorityThan(B.GoalScript, B))
        {
            B.GoalScript = S;
        }
        S = S.NextScript;
        // This is an implied JumpToken; Continue!
        goto J0x1c2;
    }
    // End:0x24e
    if(B.GoalScript != none)
    {
        B.GoalScript.CurrentUser = B;
    }
}

function SetFreelanceScriptFor(Bot B)
{
    local UnrealScriptedSequence S;

    // End:0x95
    if(B.GoalScript != none && !B.GoalScript.bRoamingScript && B.GoalScript.bDontChangeScripts || FRand() < 0.80 && B.Pawn.ReachedDestination(B.GoalScript.GetMoveTarget()))
    {
        return;
    }
    // End:0xd2
    if(B.GoalScript != none)
    {
        B.GoalScript.bAvoid = true;
        B.FreeScript();
    }
    // End:0x123
    if(FreelanceScripts == none)
    {
        // End:0x122
        foreach AllActors(class'UnrealScriptedSequence', S)
        {
            // End:0x121
            if(S.bFreelance && S.bFirstScript)
            {
                FreelanceScripts = S;
            }
            // End:0x122
            else
            {
                continue;
            }            
        }
    }
    S = FreelanceScripts;
    J0x12e:
    // End:0x189 [While If]
    if(S != none)
    {
        // End:0x172
        if(S.HigherPriorityThan(B.GoalScript, B))
        {
            B.GoalScript = S;
        }
        S = S.NextScript;
        // This is an implied JumpToken; Continue!
        goto J0x12e;
    }
    // End:0x1ba
    if(B.GoalScript != none)
    {
        B.GoalScript.CurrentUser = B;
    }
}

function SetObjective(GameObjective o, bool bForceUpdate)
{
    local Bot M;

    // End:0x75
    if(SquadObjective == o)
    {
        // End:0x1c
        if(SquadObjective == none)
        {
            return;
        }
        // End:0x65
        if(SquadObjective.DefenderTeamIndex == Team.TeamIndex && SquadObjective.DefenseSquad == none)
        {
            SquadObjective.DefenseSquad = self;
        }
        // End:0x72
        if(!bForceUpdate)
        {
            return;
        }
    }
    // End:0x14a
    else
    {
        // End:0xcb
        if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex && SquadObjective.DefenseSquad == self)
        {
            SquadObjective.DefenseSquad = none;
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
        SquadObjective = o;
        // End:0x14a
        if(SquadObjective != none)
        {
            // End:0x143
            if(SquadObjective.DefenderTeamIndex == Team.TeamIndex && SquadObjective.DefenseSquad == none)
            {
                SquadObjective.DefenseSquad = self;
            }
            SetAlternatePath(true);
        }
    }
    M = SquadMembers;
    J0x155:
    // End:0x196 [While If]
    if(M != none)
    {
        // End:0x17f
        if(M.Pawn != none)
        {
            Retask(M);
        }
        M = M.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x155;
    }
}

function Retask(Bot B)
{
    // End:0xbe
    if(Vehicle(B.Pawn) != none && B.Pawn.bStationary && Vehicle(B.Pawn).GetVehicleBase() == none)
    {
        Vehicle(B.Pawn).KDriverLeave(false);
        B.bPreparingMove = false;
        B.MoveTarget = none;
        B.RouteGoal = none;
        B.WhatToDoNext(65);
    }
    // End:0x1e2
    else
    {
        // End:0x1ac
        if(B.InLatentExecution(B.503))
        {
            // End:0x115
            if(B.bPreparingMove)
            {
                B.bPreparingMove = false;
                B.WhatToDoNext(63);
            }
            // End:0x1a9
            else
            {
                // End:0x157
                if(B.Pawn.Physics == 2 && JumpSpot(B.MoveTarget) != none)
                {
                    return;
                }
                // End:0x1a9
                else
                {
                    // End:0x1a9
                    if(B.MoveTimer > 0.30 && Vehicle(B.Pawn) == none)
                    {
                        B.MoveTimer = 0.050 + 0.150 * FRand();
                    }
                }
            }
        }
        // End:0x1e2
        else
        {
            B.ReTaskTime = Level.TimeSeconds + 0.050 + 0.150 * FRand();
            GotoState('Retasking');
        }
    }
}

function name GetOrders()
{
    local name NewOrders;

    // End:0x1e
    if(PlayerController(SquadLeader) != none)
    {
        NewOrders = 'Human';
    }
    // End:0x98
    else
    {
        // End:0x4f
        if(bFreelance && !bFreelanceAttack && !bFreelanceDefend)
        {
            NewOrders = 'Freelance';
        }
        // End:0x98
        else
        {
            // End:0x8d
            if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex)
            {
                NewOrders = 'Defend';
            }
            // End:0x98
            else
            {
                NewOrders = 'Attack';
            }
        }
    }
    // End:0xcb
    if(NewOrders != CurrentOrders)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        CurrentOrders = NewOrders;
    }
    return CurrentOrders;
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
    // End:0xc7
    else
    {
        GetOrders();
        // End:0xa1
        if(CurrentOrders == 'Defend')
        {
            return DefendString @ SquadObjective.GetHumanReadableName();
        }
        // End:0xc7
        if(CurrentOrders == 'Attack')
        {
            return AttackString @ SquadObjective.GetHumanReadableName();
        }
    }
    return string(CurrentOrders);
}

simulated function string GetShortOrderStringFor(TeamPlayerReplicationInfo PRI)
{
    // End:0x3f
    if(LeaderPRI != none && !LeaderPRI.bBot)
    {
        // End:0x39
        if(PRI.bHolding)
        {
            return HoldString;
        }
        return SupportString;
    }
    // End:0x5e
    if(bFreelance || SquadObjective == none)
    {
        return FreelanceString;
    }
    // End:0x8e
    else
    {
        GetOrders();
        // End:0x79
        if(CurrentOrders == 'Defend')
        {
            return DefendString;
        }
        // End:0x8e
        if(CurrentOrders == 'Attack')
        {
            return AttackString;
        }
    }
    return string(CurrentOrders);
}

function int GetSize()
{
    // End:0x1c
    if(PlayerController(SquadLeader) != none)
    {
        return Size + 1;
    }
    // End:0x22
    else
    {
        return Size;
    }
}

function PickNewLeader()
{
    local Bot B;

    B = SquadMembers;
    J0x0b:
    // End:0xa2 [While If]
    if(B != none)
    {
        // End:0x8b
        if(!B.PlayerReplicationInfo.bOutOfLives && B.Pawn == none || !B.Pawn.bStationary || B.Pawn.GetVehicleBase() == none)
        {
        }
        // End:0xa2
        else
        {
            B = B.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
    // End:0xfa
    if(B == none)
    {
        B = SquadMembers;
        J0xb8:
        // End:0xfa [While If]
        if(B != none)
        {
            // End:0xe3
            if(!B.PlayerReplicationInfo.bOutOfLives)
            {
            }
            // End:0xfa
            else
            {
                B = B.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0xb8;
            }
        }
    }
    // End:0x15b
    if(SquadLeader != B)
    {
        SquadLeader = B;
        // End:0x129
        if(SquadLeader == none)
        {
            LeaderPRI = none;
        }
        // End:0x142
        else
        {
            LeaderPRI = TeamPlayerReplicationInfo(SquadLeader.PlayerReplicationInfo);
        }
        NetUpdateTime = Level.TimeSeconds - float(1);
    }
}

function bool TellBotToFollow(Bot B, Controller C)
{
    local Pawn Leader;
    local GameObjective o, Best;
    local float newdist, BestDist;

    // End:0x30
    if(C == none || C.bDeleteMe)
    {
        PickNewLeader();
        C = SquadLeader;
    }
    // End:0x41
    if(B == C)
    {
        return false;
    }
    B.GoalString = "Follow Leader";
    Leader = C.Pawn;
    // End:0x80
    if(Leader == none)
    {
        return false;
    }
    // End:0x338
    if(CloseToLeader(B.Pawn))
    {
        // End:0xfc
        if(!B.bInitLifeMessage)
        {
            B.bInitLifeMessage = true;
            B.SendMessage(SquadLeader.PlayerReplicationInfo, 'Other', B.GetMessageIndex('GOTYOURBACK'), 10.0, 'Team');
        }
        // End:0x2d8
        if(B.Enemy == none)
        {
            o = Team.AI.Objectives;
            J0x12d:
            // End:0x220 [While If]
            if(o != none)
            {
                // End:0x209
                if(!o.bDisabled && DestroyableObjective(o) != none && Best == none || Best.DefensePriority < o.DefensePriority)
                {
                    newdist = VSize(B.Pawn.Location - o.Location);
                    // End:0x209
                    if(Best == none || newdist < BestDist && B.LineOfSightTo(o))
                    {
                        Best = o;
                        BestDist = newdist;
                    }
                }
                o = o.NextObjective;
                // This is an implied JumpToken; Continue!
                goto J0x12d;
            }
            // End:0x29b
            if(Best != none)
            {
                // End:0x26a
                if(Best.DefenderTeamIndex != Team.TeamIndex)
                {
                    // End:0x267
                    if(Best.TellBotHowToDisable(B))
                    {
                        return true;
                    }
                }
                // End:0x29b
                else
                {
                    // End:0x29b
                    if(BestDist < float(1600) && DestroyableObjective(Best).TellBotHowToHeal(B))
                    {
                        return true;
                    }
                }
            }
            // End:0x2c3
            if(B.FindInventoryGoal(0.00040))
            {
                B.SetAttractionState();
                return true;
            }
            B.WanderOrCamp(true);
            return true;
        }
        // End:0x333
        else
        {
            // End:0x333
            if(B.Pawn.Weapon != none && B.Pawn.Weapon.FocusOnLeader(false))
            {
                B.FightEnemy(false, 0.0);
                return true;
            }
        }
        return false;
    }
    // End:0x379
    else
    {
        // End:0x354
        if(B.SetRouteToGoal(Leader))
        {
            return true;
        }
        // End:0x379
        else
        {
            B.GoalString = "Can't reach leader";
            return false;
        }
    }
}

function bool AllowTaunt(Bot B)
{
    return FRand() < 0.50;
}

function AddTransientCosts(Bot B, float f)
{
    local Bot S;

    S = SquadMembers;
    J0x0b:
    // End:0xa6 [While If]
    if(S != none)
    {
        // End:0x8f
        if(S != B && NavigationPoint(S.MoveTarget) != none && S.InLatentExecution(S.503))
        {
            NavigationPoint(S.MoveTarget).TransientCost = int(float(1000) * f);
        }
        S = S.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function bool AssignSquadResponsibility(Bot B)
{
    // End:0x3d
    if(GetOrders() == 'Defend' && !B.Pawn.bStationary)
    {
        SetDefenseScriptFor(B);
    }
    // End:0x7b
    else
    {
        // End:0x7b
        if(B.GoalScript != none && HoldSpot(B.GoalScript) == none)
        {
            B.FreeScript();
        }
    }
    AssignCombo(B);
    // End:0x9f
    if(bAddTransientCosts)
    {
        AddTransientCosts(B, 1.0);
    }
    // End:0xaf
    if(CheckSquadObjectives(B))
    {
        return true;
    }
    // End:0x146
    if(B.Enemy == none && !B.Pawn.bStationary)
    {
        // End:0x10a
        if(B.FindInventoryGoal(0.0))
        {
            B.SetAttractionState();
            return true;
        }
        // End:0x146
        if(B == SquadLeader && bRoamingSquad || GetOrders() == 'Freelance')
        {
            return B.FindRoamDest();
        }
    }
    return false;
}

function float MaxVehicleDist(Pawn P)
{
    return 3000.0;
}

function bool NeverBail(Pawn P)
{
    return Vehicle(P) != none && Vehicle(P).bKeyVehicle;
}

function BotEnteredVehicle(Bot B)
{
    // End:0x87
    if(PlayerController(SquadLeader) != none)
    {
        // End:0x84
        if(SquadLeader.Pawn != none && B.Pawn.GetVehicleBase() == SquadLeader.Pawn)
        {
            B.SendMessage(none, 'Other', B.GetMessageIndex('INPOSITION'), 10.0, 'Team');
        }
    }
    // End:0xc8
    else
    {
        // End:0xc8
        if(B.Pawn.bStationary && B.Pawn.GetVehicleBase() != none)
        {
            PickNewLeader();
        }
    }
}

function bool CheckVehicle(Bot B)
{
    local Actor BestPath, BestEntry;
    local Vehicle SquadVehicle, V, MainVehicle;
    local float newdist, BestDist, NewRating, BestRating, BaseRadius;

    local Bot S;
    local PlayerController PC;
    local bool bSkip;

    // End:0xdf
    if(Vehicle(B.Pawn) == none && Vehicle(B.RouteGoal) != none && NavigationPoint(B.MoveTarget) != none)
    {
        // End:0xdf
        if(VSize(B.Pawn.Location - B.RouteGoal.Location) < B.Pawn.CollisionRadius + Vehicle(B.RouteGoal).EntryRadius * 1.50)
        {
            B.MoveTarget = B.RouteGoal;
        }
    }
    // End:0x4f7
    if(Vehicle(B.Pawn) == none && Vehicle(B.MoveTarget) != none)
    {
        // End:0x1ba
        if(Vehicle(B.MoveTarget).PlayerStartTime > Level.TimeSeconds)
        {
            PC = Level.GetLocalPlayerController();
            bSkip = PC != none && PC.PlayerReplicationInfo.Team == Team && PC.Pawn != none && Vehicle(PC.Pawn) == none;
        }
        // End:0x1f6
        if(!bSkip)
        {
            V = Vehicle(B.MoveTarget).FindEntryVehicle(B.Pawn);
        }
        // End:0x4f7
        if(V != none)
        {
            // End:0x40e
            if(!V.bKeyVehicle && float(V.Health) < V.HealthMax && B.Enemy == none || !B.EnemyVisible() && B.CanAttack(V))
            {
                // End:0x2ce
                if(V.GetTeamNum() != Team.TeamIndex)
                {
                    V.UsedBy(B.Pawn);
                    V.KDriverLeave(false);
                }
                // End:0x40e
                if(V.TeamLink(Team.TeamIndex))
                {
                    // End:0x378
                    if(B.Pawn.Weapon != none && B.Pawn.Weapon.CanHeal(V))
                    {
                        B.GoalString = "Heal " $ string(V);
                        B.DoRangedAttackOn(V.GetAimTarget());
                        return true;
                    }
                    // End:0x40e
                    else
                    {
                        B.SwitchToBestWeapon();
                        // End:0x40e
                        if(B.Pawn.PendingWeapon != none && B.Pawn.PendingWeapon.CanHeal(V))
                        {
                            B.GoalString = "Heal " $ string(V);
                            B.DoRangedAttackOn(V.GetAimTarget());
                            return true;
                        }
                    }
                }
            }
            // End:0x444
            if(V.GetVehicleBase() != none)
            {
                BaseRadius = V.GetVehicleBase().CollisionRadius;
            }
            // End:0x458
            else
            {
                BaseRadius = V.CollisionRadius;
            }
            // End:0x4f7
            if(VSize(B.Pawn.Location - V.Location) < B.Pawn.CollisionRadius + BaseRadius + V.EntryRadius)
            {
                V.UsedBy(B.Pawn);
                // End:0x4f5
                if(Vehicle(B.Pawn) != none)
                {
                    BotEnteredVehicle(B);
                }
                return false;
            }
        }
    }
    // End:0x51a
    if(B.LastSearchTime == Level.TimeSeconds)
    {
        return false;
    }
    // End:0x7bc
    if(Vehicle(B.Pawn) != none)
    {
        // End:0x6a4
        if(!NeverBail(B.Pawn))
        {
            // End:0x5c5
            if(Vehicle(B.Pawn).StuckCount > 3)
            {
                Vehicle(B.Pawn).VehicleLostTime = Level.TimeSeconds + float(20);
                Vehicle(B.Pawn).KDriverLeave(false);
                return false;
            }
            // End:0x6a4
            else
            {
                // End:0x6a4
                if(float(B.Pawn.Health) < B.Pawn.HealthMax * 0.1250 && !B.Pawn.bStationary && B.Skill + B.Tactics > float(4) + float(7) * FRand())
                {
                    Vehicle(B.Pawn).VehicleLostTime = Level.TimeSeconds + float(10);
                    Vehicle(B.Pawn).KDriverLeave(false);
                    return false;
                }
            }
        }
        V = B.Pawn.GetVehicleBase();
        // End:0x77c
        if(V != none && !V.bKeyVehicle)
        {
            // End:0x77c
            if(V.Driver == none && SquadLeader == B || SquadLeader.RouteGoal == none || SquadLeader.RouteGoal != V && !SquadLeader.RouteGoal.IsJoinedTo(V))
            {
                Vehicle(B.Pawn).KDriverLeave(false);
                return false;
            }
        }
        // End:0x7ba
        if(!B.Pawn.bStationary && PriorityObjective(B) == 0)
        {
            return CheckSpecialVehicleObjectives(B);
        }
        return false;
    }
    // End:0x7e7
    if(SpecialVehicleObjective(B.RouteGoal) != none && CheckSpecialVehicleObjectives(B))
    {
        return true;
    }
    // End:0x898
    if(Vehicle(SquadLeader.Pawn) != none && VSize(SquadLeader.Pawn.Location - B.Pawn.Location) < float(4000))
    {
        SquadVehicle = Vehicle(SquadLeader.Pawn).OpenPositionFor(B.Pawn);
        // End:0x895
        if(SquadVehicle != none)
        {
            MainVehicle = Vehicle(SquadLeader.Pawn);
        }
    }
    // End:0x8aa
    else
    {
        // End:0x8aa
        if(PlayerController(SquadLeader) != none)
        {
            return false;
        }
    }
    BestDist = MaxVehicleDist(B.Pawn);
    // End:0x992
    if(SquadVehicle == none)
    {
        S = SquadMembers;
        J0x8da:
        // End:0x992 [While If]
        if(S != none)
        {
            // End:0x97b
            if(Vehicle(S.Pawn) != none && VSize(S.Pawn.Location - B.Pawn.Location) < BestDist)
            {
                SquadVehicle = Vehicle(S.Pawn).OpenPositionFor(B.Pawn);
                // End:0x97b
                if(SquadVehicle != none)
                {
                }
                // End:0x992
                else
                {
                }
                S = S.NextSquadMember;
                // This is an implied JumpToken; Continue!
                goto J0x8da;
            }
        }
    }
    // End:0xa6d
    if(SquadVehicle == none && Vehicle(SquadLeader.RouteGoal) != none && !Vehicle(SquadLeader.RouteGoal).Occupied() && Vehicle(SquadLeader.RouteGoal).IndependentVehicle() && VSize(SquadLeader.RouteGoal.Location - B.Pawn.Location) < BestDist)
    {
        SquadVehicle = Vehicle(SquadLeader.RouteGoal).OpenPositionFor(B.Pawn);
    }
    // End:0xb24
    if(SquadVehicle == none && Vehicle(B.RouteGoal) != none && !Vehicle(B.RouteGoal).Occupied() && Vehicle(B.RouteGoal).IndependentVehicle() && !Vehicle(B.RouteGoal).ChangedReservation(B.Pawn))
    {
        SquadVehicle = Vehicle(B.RouteGoal);
    }
    // End:0xbcd
    if(SquadVehicle != none && SquadVehicle.PlayerStartTime > Level.TimeSeconds)
    {
        PC = Level.GetLocalPlayerController();
        // End:0xbcd
        if(PC != none && PC.PlayerReplicationInfo.Team == Team && PC.Pawn != none && Vehicle(PC.Pawn) == none)
        {
            SquadVehicle = none;
        }
    }
    // End:0xd57
    if(SquadVehicle == none)
    {
        GetOrders();
        V = Level.Game.VehicleList;
        J0xbfb:
        // End:0xd57 [While If]
        if(V != none)
        {
            newdist = VSize(B.Pawn.Location - V.Location);
            // End:0xd40
            if(newdist < BestDist)
            {
                NewRating = VehicleDesireability(V, B);
                // End:0xd40
                if(NewRating > float(0))
                {
                    NewRating += BestDist / newdist * 0.010;
                    // End:0xd40
                    if(NewRating > BestRating && V.bTeamLocked || V.StronglyRecommended(self, Team.TeamIndex, SquadObjective) || V.FastTrace(V.Location, B.Pawn.Location + B.Pawn.CollisionHeight * vect(0.0, 0.0, 1.0)))
                    {
                        SquadVehicle = V;
                        BestRating = NewRating;
                    }
                }
            }
            V = V.NextVehicle;
            // This is an implied JumpToken; Continue!
            goto J0xbfb;
        }
    }
    // End:0xd64
    if(SquadVehicle == none)
    {
        return false;
    }
    BestEntry = SquadVehicle.GetMoveTargetFor(B.Pawn);
    // End:0xdc6
    if(B.Pawn.ReachedDestination(BestEntry))
    {
        SquadVehicle.UsedBy(B.Pawn);
        return false;
    }
    // End:0xe51
    if(B.actorReachable(BestEntry))
    {
        B.RouteGoal = SquadVehicle;
        B.MoveTarget = BestEntry;
        SquadVehicle.SetReservation(B);
        B.GoalString = "Go to vehicle 1 " $ string(BestEntry);
        B.SetAttractionState();
        return true;
    }
    BestPath = B.FindPathToward(BestEntry, B.Pawn.bCanPickupInventory && Vehicle(B.Pawn) == none);
    // End:0xf1d
    if(BestPath != none)
    {
        B.RouteGoal = SquadVehicle;
        SquadVehicle.SetReservation(B);
        B.MoveTarget = BestPath;
        B.GoalString = "Go to vehicle 2 " $ string(BestPath);
        B.SetAttractionState();
        return true;
    }
    // End:0xfdf
    if(VSize(BestEntry.Location - B.Pawn.Location) < float(1200) && B.LineOfSightTo(BestEntry))
    {
        B.RouteGoal = SquadVehicle;
        SquadVehicle.SetReservation(B);
        B.MoveTarget = BestEntry;
        B.GoalString = "Go to vehicle 3 " $ string(BestEntry);
        B.SetAttractionState();
        return true;
    }
    return false;
}

function float VehicleDesireability(Vehicle V, Bot B)
{
    local float Result;

    // End:0x39
    if(!V.bCanCarryFlag && B.PlayerReplicationInfo.HasFlag != none)
    {
        return 0.0;
    }
    // End:0x5f
    if(CurrentOrders == 'Defend' != V.bDefensive)
    {
        return 0.0;
    }
    // End:0xb9
    if(float(V.Health) < V.HealthMax * 0.1250 && B.Enemy != none && B.EnemyVisible())
    {
        return 0.0;
    }
    Result = V.BotDesireability(self, Team.TeamIndex, SquadObjective);
    // End:0x11e
    if(V.SpokenFor(B))
    {
        return Result * V.NewReservationCostMultiplier(B.Pawn);
    }
    return Result;
}

function bool CheckSpecialVehicleObjectives(Bot B)
{
    local UnrealMPGameInfo G;
    local SpecialVehicleObjective o, Best;

    G = UnrealMPGameInfo(Level.Game);
    // End:0x26
    if(G == none)
    {
        return false;
    }
    Best = SpecialVehicleObjective(B.RouteGoal);
    // End:0x205
    if(Best != none)
    {
        // End:0x147
        if(Vehicle(B.Pawn) == none)
        {
            // End:0x142
            if(Best.bEnabled && !B.Pawn.ReachedDestination(Best.AssociatedActor) && B.FindBestPathToward(Best.AssociatedActor, false, true))
            {
                B.RouteGoal = Best;
                B.GoalString = "Reached SpecialVehicleObjective, now heading for " $ string(B.RouteGoal);
                B.SetAttractionState();
                return true;
            }
            // End:0x144
            else
            {
                return false;
            }
        }
        // End:0x205
        else
        {
            // End:0x205
            if(!Best.IsAccessibleTo(B.Pawn) || Vehicle(B.Pawn).bKeyVehicle)
            {
                // End:0x1fe
                if(Team != none && Team.TeamIndex < 4 && Best.TeamOwner[Team.TeamIndex] == B.Pawn)
                {
                    Best.TeamOwner[Team.TeamIndex] = none;
                }
                Best = none;
            }
        }
    }
    // End:0x314
    if(Best == none && Vehicle(B.Pawn) == none || !Vehicle(B.Pawn).bKeyVehicle)
    {
        o = G.SpecialVehicleObjectives;
        J0x263:
        // End:0x314 [While If]
        if(o != none)
        {
            // End:0x2fd
            if(o.IsAccessibleTo(B.Pawn) && Team == none || Team.TeamIndex >= 4 || o.TeamOwner[Team.TeamIndex] == none && Best == none || FRand() < 0.50)
            {
                Best = o;
            }
            o = o.NextSpecialVehicleObjective;
            // This is an implied JumpToken; Continue!
            goto J0x263;
        }
    }
    // End:0x551
    if(Best != none)
    {
        // End:0x3f8
        if(B.Pawn.ReachedDestination(Best))
        {
            Vehicle(B.Pawn).KDriverLeave(false);
            // End:0x3f8
            if(B.FindBestPathToward(Best.AssociatedActor, false, true))
            {
                B.RouteGoal = Best;
                B.GoalString = "Reached SpecialVehicleObjective, now heading for " $ string(Best.AssociatedActor);
                B.SetAttractionState();
                return true;
            }
        }
        // End:0x48a
        if(B.actorReachable(Best))
        {
            B.RouteGoal = Best;
            B.MoveTarget = Best;
            B.GoalString = "Head for reachable SpecialVehicleObjective " $ string(Best);
            B.SetAttractionState();
            return true;
        }
        B.MoveTarget = B.FindPathToward(Best, B.Pawn.bCanPickupInventory && Vehicle(B.Pawn) == none);
        // End:0x551
        if(B.MoveTarget != none)
        {
            B.RouteGoal = Best;
            B.GoalString = "Head for SpecialVehicleObjective " $ string(Best);
            B.SetAttractionState();
            return true;
        }
    }
    return false;
}

function bool OverrideFollowPlayer(Bot B)
{
    local GameObjective PickedObjective;

    PickedObjective = Team.AI.GetPriorityAttackObjectiveFor(self);
    // End:0x2c
    if(PickedObjective == none)
    {
        return false;
    }
    // End:0xad
    if(PickedObjective.BotNearObjective(B))
    {
        // End:0x98
        if(PickedObjective.DefenderTeamIndex == Team.TeamIndex)
        {
            // End:0x93
            if(DestroyableObjective(PickedObjective) != none)
            {
                return DestroyableObjective(PickedObjective).TellBotHowToHeal(B);
            }
            // End:0x95
            else
            {
                return false;
            }
        }
        // End:0xad
        else
        {
            return PickedObjective.TellBotHowToDisable(B);
        }
    }
    // End:0xd2
    if(PickedObjective.DefenderTeamIndex == Team.TeamIndex)
    {
        return false;
    }
    // End:0x10d
    if(DestroyableObjective(PickedObjective) != none && B.LineOfSightTo(PickedObjective))
    {
        return PickedObjective.TellBotHowToDisable(B);
    }
    return false;
}

function bool CheckSquadObjectives(Bot B)
{
    local Actor DesiredPosition;
    local bool bInPosition, bMovingToSuperPickup;
    local float SuperDist;

    // End:0x2b
    if(HoldSpot(B.GoalScript) == none && CheckVehicle(B))
    {
        return true;
    }
    // End:0x41
    if(B.Pawn == none)
    {
        return true;
    }
    // End:0xa1
    if(B.NeedWeapon() && B.FindInventoryGoal(0.0))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    // End:0x101
    if(PlayerController(SquadLeader) != none && SquadLeader.Pawn != none)
    {
        // End:0x101
        if(HoldSpot(B.GoalScript) == none)
        {
            // End:0xf0
            if(OverrideFollowPlayer(B))
            {
                return true;
            }
            return TellBotToFollow(B, SquadLeader);
        }
    }
    // End:0x111
    if(ShouldDestroyTranslocator(B))
    {
        return true;
    }
    // End:0x209
    if(B.Pawn.bStationary && Vehicle(B.Pawn) != none)
    {
        // End:0x1b0
        if(HoldSpot(B.GoalScript) != none)
        {
            // End:0x1ad
            if(HoldSpot(B.GoalScript).HoldVehicle != B.Pawn)
            {
                Vehicle(B.Pawn).KDriverLeave(false);
            }
        }
        // End:0x209
        else
        {
            // End:0x209
            if(Vehicle(B.Pawn).StronglyRecommended(self, Team.TeamIndex, SquadObjective))
            {
                // End:0x207
                if(B.GoalScript != none)
                {
                    B.FreeScript();
                }
                return false;
            }
        }
    }
    // End:0x528
    if(B.Pawn.bCanPickupInventory && B.Skill > float(1) && HoldSpot(B.GoalScript) == none && Vehicle(B.Pawn) == none)
    {
        // End:0x293
        if(PriorityObjective(B) > 0)
        {
            SuperDist = 800.0;
        }
        // End:0x2f0
        else
        {
            // End:0x2b1
            if(GetOrders() == 'Attack')
            {
                SuperDist = 3000.0;
            }
            // End:0x2f0
            else
            {
                // End:0x2e5
                if(GetOrders() == 'Defend' && B.Enemy != none)
                {
                    SuperDist = 1200.0;
                }
                // End:0x2f0
                else
                {
                    SuperDist = 3200.0;
                }
            }
        }
        bMovingToSuperPickup = InventorySpot(B.RouteGoal) != none && InventorySpot(B.RouteGoal).bSuperPickup && B.RouteDist < 1.10 * SuperDist && InventorySpot(B.RouteGoal).markedItem != none && InventorySpot(B.RouteGoal).markedItem.ReadyToPickup(2.0) && B.Desireability(InventorySpot(B.RouteGoal).markedItem) > float(0);
        // End:0x528
        if(bMovingToSuperPickup && B.FindBestPathToward(B.RouteGoal, false, true) || Team.AI.SuperPickupAvailable(B) && B.Pawn.Anchor != none && B.Pawn.ReachedDestination(B.Pawn.Anchor) && B.FindSuperPickup(SuperDist))
        {
            // End:0x4d5
            if(Level.TimeSeconds - B.Pawn.SpawnTime > float(5))
            {
                B.bFinalStretch = true;
            }
            B.GoalString = "Get super pickup " $ string(InventorySpot(B.RouteGoal).markedItem);
            B.SetAttractionState();
            return true;
        }
    }
    // End:0x696
    if(B.GoalScript != none)
    {
        DesiredPosition = B.GoalScript.GetMoveTarget();
        bInPosition = B.Pawn == DesiredPosition || B.Pawn.ReachedDestination(DesiredPosition);
        // End:0x63f
        if(bInPosition && Vehicle(DesiredPosition) != none)
        {
            // End:0x604
            if(Vehicle(B.Pawn) != none && B.Pawn != DesiredPosition)
            {
                Vehicle(B.Pawn).KDriverLeave(false);
            }
            // End:0x63f
            if(Vehicle(B.Pawn) == none)
            {
                Vehicle(DesiredPosition).UsedBy(B.Pawn);
            }
        }
        // End:0x679
        if(bInPosition && B.GoalScript.bRoamingScript && GetOrders() == 'Freelance')
        {
            return false;
        }
        // End:0x693
        if(!bInPosition)
        {
            B.ClearScript();
        }
    }
    // End:0x7dd
    else
    {
        // End:0x6b5
        if(SquadObjective == none)
        {
            return TellBotToFollow(B, SquadLeader);
        }
        // End:0x7dd
        else
        {
            // End:0x6ca
            if(GetOrders() == 'Freelance')
            {
                return false;
            }
            // End:0x7dd
            else
            {
                // End:0x783
                if(SquadObjective.DefenderTeamIndex != Team.TeamIndex)
                {
                    // End:0x742
                    if(SquadObjective.bDisabled || !SquadObjective.bActive)
                    {
                        B.GoalString = "Objective already disabled";
                        return false;
                    }
                    B.GoalString = "Disable Objective " $ string(SquadObjective);
                    return SquadObjective.TellBotHowToDisable(B);
                }
                DesiredPosition = SquadObjective;
                bInPosition = VSize(SquadObjective.Location - B.Pawn.Location) < float(1200) && B.LineOfSightTo(SquadObjective);
            }
        }
    }
    // End:0x905
    if(B.Enemy != none)
    {
        // End:0x848
        if(B.GoalScript != none && B.GoalScript.bRoamingScript)
        {
            B.GoalString = "Attack enemy freely";
            return false;
        }
        // End:0x86e
        if(B.LostContact(5.0))
        {
            B.LoseEnemy();
        }
        // End:0x905
        if(B.Enemy != none)
        {
            // End:0x905
            if(B.EnemyVisible() || Level.TimeSeconds - B.LastSeenTime < float(3) && SquadObjective == none || !SquadObjective.TeamLink(Team.TeamIndex))
            {
                B.FightEnemy(false, 0.0);
                return true;
            }
        }
    }
    // End:0xa6c
    if(bInPosition)
    {
        B.GoalString = "Near " $ string(DesiredPosition);
        // End:0x985
        if(!B.bInitLifeMessage)
        {
            B.bInitLifeMessage = true;
            B.SendMessage(none, 'Other', B.GetMessageIndex('INPOSITION'), 10.0, 'Team');
        }
        // End:0x9c2
        if(B.GoalScript != none)
        {
            B.GoalScript.TakeOver(B.Pawn);
        }
        // End:0xa6a
        else
        {
            // End:0x9f2
            if(DestroyableObjective(SquadObjective) != none && DestroyableObjective(SquadObjective).TellBotHowToHeal(B))
            {
                return true;
            }
            // End:0xa5a
            if(B.Enemy != none && B.EnemyVisible() || Level.TimeSeconds - B.LastSeenTime < float(3))
            {
                B.FightEnemy(false, 0.0);
                return true;
            }
            B.WanderOrCamp(true);
        }
        return true;
    }
    // End:0xa89
    if(B.Pawn.bStationary)
    {
        return false;
    }
    B.GoalString = "Follow path to " $ string(DesiredPosition);
    B.FindBestPathToward(DesiredPosition, false, true);
    // End:0xae1
    if(B.StartMoveToward(DesiredPosition))
    {
        return true;
    }
    // End:0xca0
    if(B.GoalScript != none && DesiredPosition == B.GoalScript)
    {
        // End:0xbc7
        if(B.Pawn.Anchor != none && B.Pawn.ReachedDestination(B.Pawn.Anchor))
        {
            Log(B.PlayerReplicationInfo.PlayerName $ " had no path to " $ string(B.GoalScript) $ " from " $ string(B.Pawn.Anchor));
        }
        // End:0xc06
        else
        {
            Log(B.PlayerReplicationInfo.PlayerName $ " had no path to " $ string(B.GoalScript));
        }
        B.GoalScript.bAvoid = true;
        B.FreeScript();
        // End:0xca0
        if(SquadObjective != none && VSize(B.Pawn.Location - SquadObjective.Location) > float(1200))
        {
            B.FindBestPathToward(SquadObjective, false, true);
            // End:0xca0
            if(B.StartMoveToward(SquadObjective))
            {
                return true;
            }
        }
    }
    return false;
}

function bool ShouldDestroyTranslocator(Bot B)
{
    local UnrealMPGameInfo G;

    // End:0x4a
    if(Vehicle(B.Pawn) != none || B.Enemy != none || B.Skill < float(2))
    {
        return false;
    }
    G = UnrealMPGameInfo(Level.Game);
    // End:0x70
    if(G == none)
    {
        return false;
    }
    return false;
}

function float BotSuitability(Bot B)
{
    // End:0x1f
    if(class<UnrealPawn>(B.PawnClass) == none)
    {
        return 0.0;
    }
    // End:0x53
    if(GetOrders() == 'Defend')
    {
        return 1.0 - class<UnrealPawn>(B.PawnClass).default.AttackSuitability;
    }
    return class<UnrealPawn>(B.PawnClass).default.AttackSuitability;
}

function Bot PickBotToReassign()
{
    local Bot B, Best;
    local float val, BestVal, Suitability, BestSuitability;

    B = SquadMembers;
    J0x0b:
    // End:0x104 [While If]
    if(B != none)
    {
        // End:0xed
        if(!B.PlayerReplicationInfo.bOutOfLives)
        {
            val = VSize(B.Pawn.Location - SquadObjective.Location);
            // End:0x7d
            if(B == SquadLeader)
            {
                val -= 10000000.0;
            }
            Suitability = BotSuitability(B);
            // End:0xed
            if(Best == none || Suitability > BestSuitability || Suitability == BestSuitability && val > BestVal)
            {
                Best = B;
                BestVal = val;
                BestSuitability = Suitability;
            }
        }
        B = B.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return Best;
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string enemyList;
    local int i;

    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x8c
    if(SquadObjective == none)
    {
        Canvas.DrawText("     ORDERS " $ string(GetOrders()) $ " on " $ GetItemName(string(self)) $ " no objective. Leader " $ SquadLeader.GetHumanReadableName(), false);
    }
    // End:0x100
    else
    {
        Canvas.DrawText("     ORDERS " $ string(GetOrders()) $ " on " $ GetItemName(string(self)) $ " objective " $ GetItemName(string(SquadObjective)) $ ". Leader " $ SquadLeader.GetHumanReadableName(), false);
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    enemyList = "     Enemies: ";
    i = 0;
    J0x142:
    // End:0x18b [While If]
    if(i < 8)
    {
        // End:0x181
        if(enemies[i] != none)
        {
            enemyList = enemyList @ enemies[i].GetHumanReadableName();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x142;
    }
    Canvas.DrawText(enemyList, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function bool BeDevious()
{
    return false;
}

function bool PickRetreatDestination(Bot B)
{
    return B.PickRetreatDestination();
}

function bool ClearPathFor(Controller C)
{
    local Bot B;
    local bool bForceDefer;
    local Vector Dir;
    local float DirZ;

    bForceDefer = ShouldDeferTo(C);
    B = SquadMembers;
    J0x1d:
    // End:0x15a [While If]
    if(B != none)
    {
        // End:0x143
        if(B != C && B.Pawn != none)
        {
            Dir = B.Pawn.Location - C.Pawn.Location;
            DirZ = Dir.Z;
            Dir.Z = 0.0;
            // End:0x143
            if(Abs(Dir.Z) < B.Pawn.CollisionHeight + C.Pawn.CollisionHeight && VSize(Dir) < float(8) * B.Pawn.CollisionRadius)
            {
                // End:0x12f
                if(bForceDefer)
                {
                    B.ClearPathFor(C);
                }
                // End:0x143
                else
                {
                    B.CancelCampFor(C);
                }
            }
        }
        B = B.NextSquadMember;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return bForceDefer;
}

function bool IsDefending(Bot B)
{
    // End:0x12
    if(GetOrders() == 'Defend')
    {
        return true;
    }
    return B.GoalScript != none;
}

function bool CautiousAdvance(Bot B)
{
    return false;
}

function bool FriendlyToward(Pawn Other)
{
    // End:0x0d
    if(Team == none)
    {
        return false;
    }
    return Team.AI.FriendlyToward(Other);
}

state Retasking
{
    function Tick(float DeltaTime)
    {
        local Bot M;
        local bool bStillTicking;

        M = SquadMembers;
        J0x0b:
        // End:0x96 [While If]
        if(M != none)
        {
            // End:0x7f
            if(M.Pawn != none && M.ReTaskTime > float(0))
            {
                // End:0x77
                if(Level.TimeSeconds > M.ReTaskTime)
                {
                    M.WhatToDoNext(43);
                }
                // End:0x7f
                else
                {
                    bStillTicking = true;
                }
            }
            M = M.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
        // End:0xa8
        if(!bStillTicking)
        {
            GotoState('None');
        }
    }

}

defaultproperties
{
    GatherThreshold=0.60
    SupportString="??"
    DefendString="??"
    AttackString="??"
    HoldString="????"
    FreelanceString="?? ??"
    MaxSquadSize=2
    bRoamingSquad=true
    RestingFormationClass=class'RestingFormation'
    NetUpdateFrequency=1.0
}