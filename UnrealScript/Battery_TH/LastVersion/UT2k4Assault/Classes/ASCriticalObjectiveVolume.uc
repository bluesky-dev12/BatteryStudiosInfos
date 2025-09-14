class ASCriticalObjectiveVolume extends Volume;

var Info CheckTimer;
var() Class<Pawn> ConstraintPawnClass;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

function Destroyed()
{
    // End:0x1E
    if(CheckTimer != none)
    {
        CheckTimer.Destroy();
        CheckTimer = none;
    }
    super(Actor).Destroyed();
    //return;    
}

function bool IsCriticalPawn(Pawn P)
{
    // End:0x1D
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x83
    if(((P.Health > 0) && P.Controller != none) && P.Controller.GetTeamNum() == (1 - Level.Game.GetDefenderNum()))
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsStillCritical()
{
    local Pawn P;
    local GameObjective Go;

    // End:0xEC
    foreach TouchingActors(Class'Engine.Pawn', P)
    {
        // End:0xEB
        if(IsCriticalPawn(P))
        {
            Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
            J0x54:

            // End:0xE8 [Loop If]
            if(Go != none)
            {
                // End:0xD1
                if(((Go.MyBaseVolume == self) && Go.IsActive()) && Go.DefenseSquad != none)
                {
                    Go.DefenseSquad.Team.AI.CriticalObjectiveWarning(Go, P);
                }
                Go = Go.NextObjective;
                // [Loop Continue]
                goto J0x54;
            }            
            return true;
        }        
    }    
    Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
    J0x123:

    // End:0x169 [Loop If]
    if(Go != none)
    {
        // End:0x152
        if(Go.MyBaseVolume == self)
        {
            Go.SetCriticalStatus(false);
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x123;
    }
    return false;
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    GotoState('Safe');
    //return;    
}

auto state Safe
{
    event Touch(Actor Other)
    {
        local GameObjective Go;

        // End:0x11A
        if(((Other != none) && Other.IsA('Pawn')) && IsCriticalPawn(Pawn(Other)))
        {
            Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
            J0x6C:

            // End:0x113 [Loop If]
            if(Go != none)
            {
                // End:0xFC
                if((Go.MyBaseVolume == self) && Go.IsActive())
                {
                    Go.SetCriticalStatus(true);
                    // End:0xFC
                    if(Go.DefenseSquad != none)
                    {
                        Go.DefenseSquad.Team.AI.CriticalObjectiveWarning(Go, Pawn(Other));
                    }
                }
                Go = Go.NextObjective;
                // [Loop Continue]
                goto J0x6C;
            }
            GotoState('Critical');
        }
        //return;        
    }
    stop;    
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
        //return;        
    }

    function BeginState()
    {
        // End:0x1A
        if(CheckTimer == none)
        {
            CheckTimer = Spawn(Class'Engine.VolumeTimer', self);
        }
        //return;        
    }
    stop;    
}

state ObjectiveDisabled
{
    function BeginState()
    {
        local GameObjective Go;
        local bool bStillCritical;

        Go = TeamGame(Level.Game).Teams[0].AI.Objectives;
        J0x36:

        // End:0x8A [Loop If]
        if(Go != none)
        {
            // End:0x73
            if((Go.MyBaseVolume == self) && !Go.bDisabled)
            {
                bStillCritical = true;
            }
            Go = Go.NextObjective;
            // [Loop Continue]
            goto J0x36;
        }
        // End:0x9C
        if(bStillCritical)
        {
            GotoState('Critical');
            return;
        }
        GotoState('Disabled');
        //return;        
    }
    stop;    
}

state Disabled
{
    function BeginState()
    {
        // End:0x1E
        if(CheckTimer != none)
        {
            CheckTimer.Destroy();
            CheckTimer = none;
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    ConstraintPawnClass=Class'Engine.Pawn'
}