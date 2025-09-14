/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedTrigger.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class ScriptedTrigger extends ScriptedSequence;

var ScriptedTriggerController TriggerController;

function PostBeginPlay()
{
    super.PostBeginPlay();
    TriggerController = Spawn(class'ScriptedTriggerController');
    // End:0x32
    if(TriggerController != none)
    {
        TriggerController.InitializeFor(self);
    }
    // End:0x7f
    else
    {
        Log("ScriptedTrigger::PostBeginPlay - Couldn't Spawn ScriptedTriggerController");
    }
}

function name NextNeededEvent()
{
    local int i, Start;

    // End:0x1f
    if(TriggerController != none)
    {
        Start = TriggerController.ActionNum;
    }
    i = Start;
    J0x2a:
    // End:0x74 [While If]
    if(i < Actions.Length)
    {
        // End:0x6a
        if(Action_WAITFOREVENT(Actions[i]) != none)
        {
            return Action_WAITFOREVENT(Actions[i]).ExternalEvent;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return 'None';
}

function bool TriggersEvent(name E)
{
    local int i, Start;

    // End:0x1f
    if(TriggerController != none)
    {
        Start = TriggerController.ActionNum;
    }
    i = Start;
    J0x2a:
    // End:0x81 [While If]
    if(i < Actions.Length)
    {
        // End:0x77
        if(Action_TRIGGEREVENT(Actions[i]) != none && Action_TRIGGEREVENT(Actions[i]).Event == E)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return false;
}

function bool ValidAction(int N)
{
    return Actions[N].bValidForTrigger;
}

function Reset()
{
    super.Reset();
    // End:0x1f
    if(TriggerController == none)
    {
        TriggerController = Spawn(class'ScriptedTriggerController');
    }
    // End:0x3a
    if(TriggerController != none)
    {
        TriggerController.InitializeFor(self);
    }
}

defaultproperties
{
    bNavigate=true
    Texture=Texture'S_SpecialEvent'
}