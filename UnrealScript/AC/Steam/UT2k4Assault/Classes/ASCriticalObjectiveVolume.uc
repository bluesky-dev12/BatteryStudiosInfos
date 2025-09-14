/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASCriticalObjectiveVolume.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *	States:4
 *
 *******************************************************************************/
class ASCriticalObjectiveVolume extends Volume;

var Info CheckTimer;
var() class<Pawn> ConstraintPawnClass;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
}

function Destroyed()
{
    // End:0x1e
    if(CheckTimer != none)
    {
        CheckTimer.Destroy();
        CheckTimer = none;
    }
    super(Actor).Destroyed();
}

function bool IsCriticalPawn(Pawn P)
{
    // End:0x1d
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x83
    if(P.Health > 0 && P.Controller != none && P.Controller.GetTeamNum() == 1 - Level.Game.GetDefenderNum())
    {
        return true;
    }
    return false;
}

function bool IsStillCritical()
{
    local Pawn P;
    local GameObjective Go;

    // End:0xec
    foreach TouchingActors(class'Pawn', P)
    {
        // End:0xeb
        if(IsCriticalPawn(P))
        {
            Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
            J0x54:
            // End:0xe8 [While If]
            if(Go != none)
            {
                // End:0xd1
                if(Go.MyBaseVolume == self && Go.IsActive() && Go.DefenseSquad != none)
                {
                    Go.DefenseSquad.Team.AI.CriticalObjectiveWarning(Go, P);
                }
                Go = Go.NextObjective;
                // This is an implied JumpToken; Continue!
                goto J0x54;
            }
            break;
            return true;
        }                
    }
    Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
    J0x123:
    // End:0x169 [While If]
    if(Go != none)
    {
        // End:0x152
        if(Go.MyBaseVolume == self)
        {
            Go.SetCriticalStatus(false);
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x123;
    }
    return false;
}

function Reset()
{
    super(Actor).Reset();
    GotoState('Safe');
}

auto state Safe
{
    event Touch(Actor Other)
    {
        local GameObjective Go;

        // End:0x11a
        if(Other != none && Other.IsA('Pawn') && IsCriticalPawn(Pawn(Other)))
        {
            Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
            J0x6c:
            // End:0x113 [While If]
            if(Go != none)
            {
                // End:0xfc
                if(Go.MyBaseVolume == self && Go.IsActive())
                {
                    Go.SetCriticalStatus(true);
                    // End:0xfc
                    if(Go.DefenseSquad != none)
                    {
                        Go.DefenseSquad.Team.AI.CriticalObjectiveWarning(Go, Pawn(Other));
                    }
                }
                Go = Go.NextObjective;
                // This is an implied JumpToken; Continue!
                goto J0x6c;
            }
            GotoState('Critical');
        }
    }

}

state Critical
{
    function TimerPop(VolumeTimer t)
    {
        // End:0x12
        if(!IsStillCritical())
        {
            GotoState('Safe');
        }
    }

    function BeginState()
    {
        // End:0x1a
        if(CheckTimer == none)
        {
            CheckTimer = Spawn(class'VolumeTimer', self);
        }
    }

}

state ObjectiveDisabled
{
    function BeginState()
    {
        local GameObjective Go;
        local bool bStillCritical;

        Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
        J0x36:
        // End:0x8a [While If]
        if(Go != none)
        {
            // End:0x73
            if(Go.MyBaseVolume == self && !Go.bDisabled)
            {
                bStillCritical = true;
            }
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x36;
        }
        // End:0x9c
        if(bStillCritical)
        {
            GotoState('Critical');
            return;
        }
        GotoState('Disabled');
    }

}

state Disabled
{
    function BeginState()
    {
        // End:0x1e
        if(CheckTimer != none)
        {
            CheckTimer.Destroy();
            CheckTimer = none;
        }
    }

}

defaultproperties
{
    ConstraintPawnClass=Class'Engine.Pawn'
}