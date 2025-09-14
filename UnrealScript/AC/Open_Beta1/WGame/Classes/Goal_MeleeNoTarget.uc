class Goal_MeleeNoTarget extends Goal;

var float FireCheckInterval;
var float elapsed;
var float FailTime;
var int MeleeCount;

function Goal_MeleeNoTarget Init(wAIBotBase inOwner, int inMeleeCount)
{
    InitBase(inOwner);
    FireCheckInterval = default.FireCheckInterval;
    elapsed = default.elapsed;
    FailTime = default.FailTime;
    MeleeCount = inMeleeCount;
    return self;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    //return;    
}

function Start()
{
    // End:0x8E
    if(int(GoalStatus) == int(0))
    {
        // End:0x38
        if(Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            GoalStatus = 1;
            AddSubgoal(Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_LookAround')).Init(Owner, float(MeleeCount) * 1.0000000));
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    ProcessSubGoals(dt);
    elapsed += dt;
    FireCheckInterval -= dt;
    // End:0x9A
    if(FireCheckInterval < float(0))
    {
        FireCheckInterval = default.FireCheckInterval;
        Owner.Pawn.Weapon.FireMode[2].ModeDoFire();
        // End:0x9A
        if(int(Owner.Pawn.Weapon.MeleeState) == int(1))
        {
            MeleeCount--;
        }
    }
    // End:0xAB
    if(MeleeCount <= 0)
    {
        return 3;        
    }
    else
    {
        return 1;
    }
    //return;    
}

function string ToString()
{
    return "[Goal_MeleeNoTarget] MeleeCount=" $ string(MeleeCount);
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.3500000
}