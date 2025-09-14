/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedTriggerController.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:8
 *	States:2
 *
 *******************************************************************************/
class ScriptedTriggerController extends ScriptedController;

function InitializeFor(ScriptedTrigger t)
{
    SequenceScript = t;
    ActionNum = 0;
    SequenceScript.SetActions(self);
    GotoState('Scripting');
}

function GameHasEnded();
function ClientGameEnded();
function RoundHasEnded();
function ClientRoundEnded();
function DestroyPawn()
{
    // End:0x17
    if(Instigator != none)
    {
        Instigator.Destroy();
    }
}

function ClearAnimation();
function SetNewScript(ScriptedSequence NewScript)
{
    SequenceScript = NewScript;
    ActionNum = 0;
    Focus = none;
    SequenceScript.SetActions(self);
}

state Scripting
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        Instigator = EventInstigator;
        super.Trigger(Other, EventInstigator);
    }

    function LeaveScripting()
    {
        Destroy();
    }

Begin:
    InitForNextAction();
    // End:0x16
    if(bBroken)
    {
        GotoState('Broken');
    }
    // End:0x2f
    if(CurrentAction.TickedAction())
    {
        Enable('Tick');
    }
    stop;        
}

state Broken
{

Begin:
    Warn(" Trigger Scripted Sequence BROKEN " $ string(SequenceScript) $ " ACTION " $ string(CurrentAction));
    stop;    
}
