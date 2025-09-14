class Goal_Throw extends Goal;

var Actor Target;
var float minDist;
var float MaxDist;
var float MinAngle;
var float MaxAngle;
var Goal_Look GoalLook;
var Vector ViewLocation;

function Goal_Throw Init(wAIBotBase inOwner, Actor inTarget)
{
    InitBase(inOwner);
    Target = inTarget;
    minDist = default.minDist;
    MaxDist = default.MaxDist;
    MinAngle = default.MinAngle;
    MaxAngle = default.MaxAngle;
    GoalLook = none;
    ViewLocation = default.ViewLocation;
    // End:0x6F
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Throw::ClearRefenreces]");
    Target = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    //return;    
}

function Start()
{
    local Vector View;

    // End:0x142
    if(int(GoalStatus) == int(0))
    {
        // End:0x26
        if(Target == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            // End:0x13A
            if(GetViewLocation(Owner.Pawn.Location, Target.Location, ViewLocation))
            {
                // End:0x12F
                if(CanThrowTo(Owner.Level, Owner.Pawn.Location, Target.Location, View, true, true))
                {
                    GoalStatus = 1;
                    AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 2.0000000));
                    AddSubgoal(Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fire')).Init(Owner, none, false, 1));                    
                }
                else
                {
                    GoalStatus = 2;
                }                
            }
            else
            {
                GoalStatus = 2;
            }
        }
    }
    //return;    
}

function SpawnTrail(Vector ViewLocation)
{
    local WillowWhispPath whisp;

    Log((((("[Goal_Throw::SpawnTrail] from=" $ string(Owner.Pawn.Location)) $ " to=") $ string(Target.Location)) $ " view=") $ string(ViewLocation));
    whisp = Owner.Level.Spawn(Class'UnrealGame.WillowWhispPath',,, Owner.Pawn.Location);
    whisp.WayPoints[0] = Owner.Pawn.Location;
    whisp.WayPoints[1] = ViewLocation;
    whisp.WayPoints[2] = Target.Location;
    whisp.NumPoints = 3;
    whisp.bRepeat = true;
    //return;    
}

static function bool CanThrowTo(LevelInfo Level, Vector From, Vector to, out Vector View, bool checkUp, bool checkDown)
{
    local Vector viewLowered;

    // End:0xCA
    if(GetViewLocation(From, to, View))
    {
        viewLowered = View;
        // End:0x70
        if(viewLowered.Z > From.Z)
        {
            viewLowered.Z = From.Z + (0.7000000 * (viewLowered.Z - From.Z));
        }
        View = viewLowered;
        return (!checkUp || Level.FastTrace(View, From)) && !checkDown || Level.FastTrace(to, View);        
    }
    else
    {
        return false;
    }
    //return;    
}

static function bool GetViewLocation(Vector curLocation, Vector fallLocation, out Vector ViewLocation)
{
    local float dist, ratio, Angle, Height;

    dist = VSize(curLocation - fallLocation);
    // End:0x48
    if(dist < default.minDist)
    {
        ViewLocation = curLocation + (0.8000000 * (fallLocation - curLocation));
        return true;        
    }
    else
    {
        // End:0x5C
        if(dist > default.MaxDist)
        {
            return false;            
        }
        else
        {
            ratio = (dist - default.minDist) / (default.MaxDist - default.minDist);
            Angle = default.MinAngle + (ratio * (default.MaxAngle - default.MinAngle));
            Angle = (Angle / 32767.0000000) * 3.1415927;
            Angle += Atan(fallLocation.Z - curLocation.Z, dist);
            Height = dist * Tan(Angle);
            ViewLocation = fallLocation;
            ViewLocation.Z += Height;
            return true;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x11
    if(Target == none)
    {
        return 2;        
    }
    else
    {
        // End:0x2F
        if(true)
        {
            gs = ProcessSubGoals(dt);
            return gs;            
        }
        else
        {
            Owner.dblog(Owner.PlayerReplicationInfo.PlayerName $ " throw fail - CanThrowTo false");
            return 2;
        }
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = ViewLocation;
    return true;
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return "[Goal_Throw]";
    //return;    
}

defaultproperties
{
    minDist=1400.0000000
    MaxDist=3200.0000000
    MaxAngle=6850.0000000
}