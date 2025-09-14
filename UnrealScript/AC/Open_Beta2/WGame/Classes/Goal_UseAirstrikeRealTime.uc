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
    //return;    
}

function ClearReferences()
{
    Log("[Goal_UseAirstrikeRealTime::ClearRefenreces]");
    Target = none;
    Goal1.ClearReferences();
    Goal2.ClearReferences();
    Goal1 = none;
    Goal2 = none;
    //return;    
}

function Start()
{
    // End:0xD4
    if(int(GoalStatus) == int(0))
    {
        Target = GetTarget();
        // End:0x7A
        if(Target == none)
        {
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 3.0000000);
            AddSubgoal(Goal2);            
        }
        else
        {
            Goal1 = Goal_SwitchAndFire(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchAndFire')).Init(Owner, 7, Target);
            AddSubgoal(Goal1);
        }
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x1A
    if(Goal1 == none)
    {
        return ProcessSubGoals(dt);        
    }
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0x98
        if(int(gs) != int(1))
        {
            Goal1 = none;
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 3.0000000);
            AddSubgoal(Goal2);
            return 1;            
        }
        else
        {
            return gs;
        }
    }
    Log("[Goal_SwitchAndFire::ActualWork] SOMETHING WRONG!!!!!!!!!!!!!!!");
    //return;    
}

function NavigationPoint GetTarget()
{
    local int lp1;
    local float minDist, dist;
    local NavigationPoint myNav, curEnemyInf;
    local int enemyInfluencesLength;
    local array<NavigationPoint> enemyInfluences;

    myNav = Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location);
    minDist = 3000.0000000;
    // End:0xF3
    if(Owner.Level.Game.bTeamGame)
    {
        // End:0xB6
        if(Owner.GetTeamNum() == 0)
        {
            enemyInfluences = Owner.AILevel.Influence1;
            enemyInfluencesLength = Owner.AILevel.Influence1Length;            
        }
        else
        {
            enemyInfluences = Owner.AILevel.Influence0;
            enemyInfluencesLength = Owner.AILevel.Influence0Length;
        }        
    }
    else
    {
        enemyInfluences = Owner.AILevel.AllNavs;
        enemyInfluencesLength = Owner.AILevel.AllNavsLength;
    }
    lp1 = 0;
    J0x134:

    // End:0x1C7 [Loop If]
    if(lp1 < enemyInfluencesLength)
    {
        curEnemyInf = enemyInfluences[lp1];
        // End:0x1BD
        if(Owner.Level.IsVisible(myNav, curEnemyInf))
        {
            dist = VSize(curEnemyInf.Location - Owner.Pawn.Location);
            // End:0x1BD
            if(dist > minDist)
            {
                return curEnemyInf;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x134;
    }
    return none;
    //return;    
}

function string ToString()
{
    return "[Goal_SwitchAndFire]";
    //return;    
}
