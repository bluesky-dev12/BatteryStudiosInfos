/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_ThrowGrenadeRealTime.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class Goal_ThrowGrenadeRealTime extends Goal;

var NavigationPoint Target;
var Goal Goal1;
var Goal Goal2;

function Goal_ThrowGrenadeRealTime Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    Target = none;
    Goal1 = none;
    Goal2 = none;
    return self;
}

function ClearReferences()
{
    Log("[Goal_ThrowGrenadeRealTime::ClearRefenreces]");
    Target = none;
    Goal1.ClearReferences();
    Goal2.ClearReferences();
    Goal1 = none;
    Goal2 = none;
}

function Start()
{
    // End:0xd4
    if(GoalStatus == 0)
    {
        Target = GetTarget();
        // End:0x7a
        if(Target == none)
        {
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 1.0);
            AddSubgoal(Goal2);
        }
        // End:0xcc
        else
        {
            Goal1 = Goal_SwitchAndThrow(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchAndThrow')).Init(Owner, Target, 4);
            AddSubgoal(Goal1);
        }
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x1a
    if(Goal1 == none)
    {
        return ProcessSubGoals(dt);
    }
    // End:0xe0
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0xda
        if(gs != 1)
        {
            Goal1 = none;
            AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, 1));
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 0.50);
            AddSubgoal(Goal2);
            return 1;
        }
        // End:0xe0
        else
        {
            return gs;
        }
    }
    Log("[Goal_ThrowGrenadeRealTime::ActualWork] SOMETHING WRONG!!!!!!!!!!!!!!!");
}

function NavigationPoint GetTarget()
{
    local int lp1, enemyInfluencesLength;
    local NavigationPoint curEnemyInf, nav;
    local array<NavigationPoint> enemyInfluences;
    local Vector fromEye, toEye, loc, View;
    local float dist, minDist, MaxDist;
    local Pawn P;

    fromEye = Owner.Pawn.Location;
    fromEye.Z += float(233);
    minDist = class'Goal_Throw'.default.minDist + 0.80 * class'Goal_Throw'.default.MaxDist - class'Goal_Throw'.default.minDist;
    MaxDist = class'Goal_Throw'.default.MaxDist;
    // End:0x325
    if(FRand() < 0.250)
    {
        lp1 = 0;
        J0x8f:
        // End:0x323 [While If]
        if(lp1 < Owner.Level.PawnList.Length)
        {
            P = Owner.Level.PawnList[lp1];
            // End:0x319
            if(P.Health > 0 && !Owner.Level.Game.SameTeam(Owner, P.Controller))
            {
                dist = VSize(Owner.Pawn.Location - loc);
                // End:0x319
                if(minDist <= dist && dist <= MaxDist)
                {
                    toEye = P.Location;
                    toEye.Z += float(233);
                    // End:0x319
                    if(Owner.Level.FastTrace(toEye, fromEye) == false)
                    {
                        nav = Owner.Level.GetClosestNavigationPoint(P.Location);
                        // End:0x319
                        if(nav != none)
                        {
                            lp1 = -1;
                            J0x1f4:
                            // End:0x319 [While If]
                            if(lp1 < nav.PathList.Length)
                            {
                                // End:0x233
                                if(lp1 == -1)
                                {
                                    loc = P.Location;
                                }
                                // End:0x25f
                                else
                                {
                                    loc = nav.PathList[lp1].End.Location;
                                }
                                dist = VSize(Owner.Pawn.Location - loc);
                                // End:0x30f
                                if(minDist <= dist && dist <= MaxDist)
                                {
                                    // End:0x30f
                                    if(class'Goal_Throw'.static.CanThrowTo(Owner.Level, Owner.Pawn.Location, loc, View, true, true))
                                    {
                                        return Owner.Level.GetClosestNavigationPoint(P.Location);
                                    }
                                }
                                ++ lp1;
                                // This is an implied JumpToken; Continue!
                                goto J0x1f4;
                            }
                        }
                    }
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x8f;
        }
        return none;
    }
    // End:0x4ee
    if(Owner.Level.Game.bTeamGame)
    {
        // End:0x39b
        if(Owner.GetTeamNum() == 0)
        {
            enemyInfluences = Owner.AILevel.Influence1;
            enemyInfluencesLength = Owner.AILevel.Influence1Length;
        }
        // End:0x3d5
        else
        {
            enemyInfluences = Owner.AILevel.Influence0;
            enemyInfluencesLength = Owner.AILevel.Influence0Length;
        }
        lp1 = 0;
        J0x3dc:
        // End:0x4ee [While If]
        if(lp1 < enemyInfluencesLength)
        {
            curEnemyInf = enemyInfluences[lp1];
            dist = VSize(curEnemyInf.Location - Owner.Pawn.Location);
            // End:0x4e4
            if(dist > minDist)
            {
                // End:0x447
                if(Rand(3) > 0)
                {
                }
                // End:0x4e4
                else
                {
                    toEye = curEnemyInf.Location;
                    toEye.Z += float(233);
                    // End:0x4e4
                    if(Owner.Level.FastTrace(toEye, fromEye) == false && class'Goal_Throw'.static.CanThrowTo(Owner.Level, Owner.Pawn.Location, curEnemyInf.Location, View, true, true))
                    {
                        return curEnemyInf;
                    }
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x3dc;
        }
    }
    return none;
}

function string ToString()
{
    return "[Goal_ThrowGrenadeRealTime]";
}
