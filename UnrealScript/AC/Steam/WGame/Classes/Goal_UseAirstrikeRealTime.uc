/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_UseAirstrikeRealTime.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class Goal_UseAirstrikeRealTime extends Goal;

var NavigationPoint Target;
var Goal Goal1;
var Goal Goal2;

function Goal_UseAirstrikeRealTime Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    Target = none;
    Goal1 = none;
    Goal2 = none;
    return self;
}

function ClearReferences()
{
    Log("[Goal_UseAirstrikeRealTime::ClearRefenreces]");
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
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 3.0);
            AddSubgoal(Goal2);
        }
        // End:0xcc
        else
        {
            Goal1 = Goal_SwitchAndFire(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchAndFire')).Init(Owner, 7, Target);
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
    // End:0x9e
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0x98
        if(gs != 1)
        {
            Goal1 = none;
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 3.0);
            AddSubgoal(Goal2);
            return 1;
        }
        // End:0x9e
        else
        {
            return gs;
        }
    }
    Log("[Goal_SwitchAndFire::ActualWork] SOMETHING WRONG!!!!!!!!!!!!!!!");
}

function NavigationPoint GetTarget()
{
    local int lp1;
    local float minDist, dist;
    local NavigationPoint myNav, curEnemyInf;
    local int enemyInfluencesLength;
    local array<NavigationPoint> enemyInfluences;

    myNav = Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location);
    minDist = 3000.0;
    // End:0xf3
    if(Owner.Level.Game.bTeamGame)
    {
        // End:0xb6
        if(Owner.GetTeamNum() == 0)
        {
            enemyInfluences = Owner.AILevel.Influence1;
            enemyInfluencesLength = Owner.AILevel.Influence1Length;
        }
        // End:0xf0
        else
        {
            enemyInfluences = Owner.AILevel.Influence0;
            enemyInfluencesLength = Owner.AILevel.Influence0Length;
        }
    }
    // End:0x12d
    else
    {
        enemyInfluences = Owner.AILevel.AllNavs;
        enemyInfluencesLength = Owner.AILevel.AllNavsLength;
    }
    lp1 = 0;
    J0x134:
    // End:0x1c7 [While If]
    if(lp1 < enemyInfluencesLength)
    {
        curEnemyInf = enemyInfluences[lp1];
        // End:0x1bd
        if(Owner.Level.IsVisible(myNav, curEnemyInf))
        {
            dist = VSize(curEnemyInf.Location - Owner.Pawn.Location);
            // End:0x1bd
            if(dist > minDist)
            {
                return curEnemyInf;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x134;
    }
    return none;
}

function string ToString()
{
    return "[Goal_SwitchAndFire]";
}
