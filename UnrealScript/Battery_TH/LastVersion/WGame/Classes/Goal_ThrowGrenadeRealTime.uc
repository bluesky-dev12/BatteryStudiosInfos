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
    //return;    
}

function ClearReferences()
{
    Log("[Goal_ThrowGrenadeRealTime::ClearRefenreces]");
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
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 1.0000000);
            AddSubgoal(Goal2);            
        }
        else
        {
            Goal1 = Goal_SwitchAndThrow(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchAndThrow')).Init(Owner, Target, 4);
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
        // End:0xDA
        if(int(gs) != int(1))
        {
            Goal1 = none;
            AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, 1));
            Goal2 = Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 0.5000000);
            AddSubgoal(Goal2);
            return 1;            
        }
        else
        {
            return gs;
        }
    }
    Log("[Goal_ThrowGrenadeRealTime::ActualWork] SOMETHING WRONG!!!!!!!!!!!!!!!");
    //return;    
}

function NavigationPoint GetTarget()
{
    local int lp1, lp2, enemyInfluencesLength;
    local NavigationPoint curEnemyInf, nav;
    local array<NavigationPoint> enemyInfluences;
    local Vector fromEye, toEye, loc, View;
    local float dist, minDist, MaxDist;
    local Pawn P;

    fromEye = Owner.Pawn.Location;
    fromEye.Z += float(233);
    minDist = Class'WGame_Decompressed.Goal_Throw'.default.minDist + (0.8000000 * (Class'WGame_Decompressed.Goal_Throw'.default.MaxDist - Class'WGame_Decompressed.Goal_Throw'.default.minDist));
    MaxDist = Class'WGame_Decompressed.Goal_Throw'.default.MaxDist;
    // End:0x325
    if(FRand() < 0.2500000)
    {
        lp1 = 0;
        J0x8F:

        // End:0x323 [Loop If]
        if(lp1 < Owner.Level.PawnList.Length)
        {
            P = Owner.Level.PawnList[lp1];
            // End:0x319
            if((P.Health > 0) && !Owner.Level.Game.SameTeam(Owner, P.Controller))
            {
                dist = VSize(Owner.Pawn.Location - loc);
                // End:0x319
                if((minDist <= dist) && dist <= MaxDist)
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
                            lp2 = -1;
                            J0x1F4:

                            // End:0x319 [Loop If]
                            if(lp2 < nav.PathList.Length)
                            {
                                // End:0x233
                                if(lp2 == -1)
                                {
                                    loc = P.Location;                                    
                                }
                                else
                                {
                                    loc = nav.PathList[lp2].End.Location;
                                }
                                dist = VSize(Owner.Pawn.Location - loc);
                                // End:0x30F
                                if((minDist <= dist) && dist <= MaxDist)
                                {
                                    // End:0x30F
                                    if(Class'WGame_Decompressed.Goal_Throw'.static.CanThrowTo(Owner.Level, Owner.Pawn.Location, loc, View, true, true))
                                    {
                                        return Owner.Level.GetClosestNavigationPoint(P.Location);
                                    }
                                }
                                lp2++;
                                // [Loop Continue]
                                goto J0x1F4;
                            }
                        }
                    }
                }
            }
            lp1++;
            // [Loop Continue]
            goto J0x8F;
        }
        return none;
    }
    // End:0x4EE
    if(Owner.Level.Game.bTeamGame)
    {
        // End:0x39B
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
        lp1 = 0;
        J0x3DC:

        // End:0x4EE [Loop If]
        if(lp1 < enemyInfluencesLength)
        {
            curEnemyInf = enemyInfluences[lp1];
            dist = VSize(curEnemyInf.Location - Owner.Pawn.Location);
            // End:0x4E4
            if(dist > minDist)
            {
                // End:0x447
                if(Rand(3) > 0)
                {
                    // [Explicit Continue]
                    goto J0x4E4;
                }
                toEye = curEnemyInf.Location;
                toEye.Z += float(233);
                // End:0x4E4
                if((Owner.Level.FastTrace(toEye, fromEye) == false) && Class'WGame_Decompressed.Goal_Throw'.static.CanThrowTo(Owner.Level, Owner.Pawn.Location, curEnemyInf.Location, View, true, true))
                {
                    return curEnemyInf;
                }
            }
            J0x4E4:

            lp1++;
            // [Loop Continue]
            goto J0x3DC;
        }
    }
    return none;
    //return;    
}

function string ToString()
{
    return "[Goal_ThrowGrenadeRealTime]";
    //return;    
}
