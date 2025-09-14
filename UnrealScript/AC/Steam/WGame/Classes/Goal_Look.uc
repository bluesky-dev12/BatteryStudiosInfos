/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Look.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class Goal_Look extends Goal;

var Vector LookLocation;
var byte old;
var bool pitchSet;

function Goal_Look Init(wAIBotBase inOwner, Vector inLookLocation)
{
    InitBase(inOwner);
    LookLocation = inLookLocation;
    old = default.old;
    pitchSet = default.pitchSet;
    return self;
}

function Start()
{
    // End:0x56
    if(GoalStatus == 0)
    {
        // End:0x4e
        if(Owner.Pawn == none || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0x56
        else
        {
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x45
    if(old != Owner.Pawn.ViewPitch)
    {
        old = Owner.Pawn.ViewPitch;
    }
    // End:0x4d
    else
    {
        pitchSet = true;
    }
    // End:0x87
    if(Abs(Owner.Pawn.GetDotH(LookLocation)) > 0.950 && pitchSet)
    {
        return 3;
    }
    // End:0x8a
    else
    {
        return 1;
    }
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = LookLocation;
    return true;
}

function End();
function string ToString()
{
    return "[Goal_Look] LookLocation=" $ string(LookLocation) $ " dotH=" $ string(Owner.Pawn.GetDotH(LookLocation));
}
