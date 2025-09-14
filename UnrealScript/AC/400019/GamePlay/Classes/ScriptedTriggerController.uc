class ScriptedTriggerController extends ScriptedController;

function InitializeFor(ScriptedTrigger t)
{
    SequenceScript = t;
    ActionNum = 0;
    SequenceScript.SetActions(self);
    GotoState('Scripting');
    //return;    
}

function GameHasEnded()
{
    //return;    
}

function ClientGameEnded()
{
    //return;    
}

function RoundHasEnded()
{
    //return;    
}

function ClientRoundEnded()
{
    //return;    
}

function DestroyPawn()
{
    // End:0x17
    if(Instigator != none)
    {
        Instigator.Destroy();
    }
    //return;    
}

function ClearAnimation()
{
    //return;    
}

function SetNewScript(ScriptedSequence NewScript)
{
    SequenceScript = NewScript;
    ActionNum = 0;
    Focus = none;
    SequenceScript.SetActions(self);
    //return;    
}

state Scripting
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        Instigator = EventInstigator;
        super.Trigger(Other, EventInstigator);
        //return;        
    }

    function LeaveScripting()
    {
        Destroy();
        //return;        
    }
Begin:

    InitForNextAction();
    // End:0x16
    if(bBroken)
    {
        GotoState('Broken');
    }
    // End:0x2F
    if(CurrentAction.TickedAction())
    {
        Enable('Tick');
    }
    stop;                    
}

state Broken
{Begin:

    Warn(((" Trigger Scripted Sequence BROKEN " $ string(SequenceScript)) $ " ACTION ") $ string(CurrentAction));
    stop;                
}
