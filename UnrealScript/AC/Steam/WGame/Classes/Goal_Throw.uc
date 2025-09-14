/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Throw.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:11
 *
 *******************************************************************************/
class Goal_Throw extends Goal
    dependson(Goal_Fire);

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
    // End:0x6f
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    return self;
}

function ClearReferences()
{
    Log("[Goal_Throw::ClearRefenreces]");
    Target = none;
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
}

function Start()
{
    local Vector View;

    // End:0x142
    if(GoalStatus == 0)
    {
        // End:0x26
        if(Target == none)
        {
            GoalStatus = 2;
        }
        // End:0x142
        else
        {
            // End:0x13a
            if(GetViewLocation(Owner.Pawn.Location, Target.Location, ViewLocation))
            {
                // End:0x12f
                if(CanThrowTo(Owner.Level, Owner.Pawn.Location, Target.Location, View, true, true))
                {
                    GoalStatus = 1;
                    AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 2.0));
                    AddSubgoal(Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Fire')).Init(Owner, none, false, 1));
                }
                // End:0x137
                else
                {
                    GoalStatus = 2;
                }
            }
            // End:0x142
            else
            {
                GoalStatus = 2;
            }
        }
    }
}

function SpawnTrail(Vector ViewLocation)
{
    local WillowWhispPath whisp;

    Log("[Goal_Throw::SpawnTrail] from=" $ string(Owner.Pawn.Location) $ " to=" $ string(Target.Location) $ " view=" $ string(ViewLocation));
    whisp = Owner.Level.Spawn(class'WillowWhispPath',,, Owner.Pawn.Location);
    whisp.WayPoints[0] = Owner.Pawn.Location;
    whisp.WayPoints[1] = ViewLocation;
    whisp.WayPoints[2] = Target.Location;
    whisp.NumPoints = 3;
    whisp.bRepeat = true;
}

static function bool CanThrowTo(LevelInfo Level, Vector From, Vector to, out Vector View, bool checkUp, bool checkDown)
{
    local Vector viewLowered;

    // End:0xca
    if(GetViewLocation(From, to, View))
    {
        viewLowered = View;
        // End:0x70
        if(viewLowered.Z > From.Z)
        {
            viewLowered.Z = From.Z + 0.70 * viewLowered.Z - From.Z;
        }
        View = viewLowered;
        return !checkUp || Level.FastTrace(View, From) && !checkDown || Level.FastTrace(to, View);
    }
    // End:0xcc
    else
    {
        return false;
    }
}

static function bool GetViewLocation(Vector curLocation, Vector fallLocation, out Vector ViewLocation)
{
    local float dist, ratio, Angle, Height;

    dist = VSize(curLocation - fallLocation);
    // End:0x48
    if(dist < default.minDist)
    {
        ViewLocation = curLocation + 0.80 * fallLocation - curLocation;
        return true;
    }
    // End:0x10b
    else
    {
        // End:0x5c
        if(dist > default.MaxDist)
        {
            return false;
        }
        // End:0x10b
        else
        {
            ratio = dist - default.minDist / default.MaxDist - default.minDist;
            Angle = default.MinAngle + ratio * default.MaxAngle - default.MinAngle;
            Angle = Angle / 32767.0 * 3.1415930;
            Angle += Atan(fallLocation.Z - curLocation.Z, dist);
            Height = dist * Tan(Angle);
            ViewLocation = fallLocation;
            ViewLocation.Z += Height;
            return true;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x11
    if(Target == none)
    {
        return 2;
    }
    // End:0x7a
    else
    {
        // End:0x2f
        if(true)
        {
            gs = ProcessSubGoals(dt);
            return gs;
        }
        // End:0x7a
        else
        {
            Owner.dblog(Owner.PlayerReplicationInfo.PlayerName $ " throw fail - CanThrowTo false");
            return 2;
        }
    }
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = ViewLocation;
    return true;
}

function End();
function string ToString()
{
    return "[Goal_Throw]";
}

defaultproperties
{
    minDist=1400.0
    MaxDist=3200.0
    MaxAngle=6850.0
}