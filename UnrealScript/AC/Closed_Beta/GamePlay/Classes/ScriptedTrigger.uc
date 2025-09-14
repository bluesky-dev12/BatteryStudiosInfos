class ScriptedTrigger extends ScriptedSequence;

var ScriptedTriggerController TriggerController;

function PostBeginPlay()
{
    super.PostBeginPlay();
    TriggerController = Spawn(Class'GamePlay_Decompressed.ScriptedTriggerController');
    // End:0x32
    if(TriggerController != none)
    {
        TriggerController.InitializeFor(self);        
    }
    else
    {
        Log("ScriptedTrigger::PostBeginPlay - Couldn't Spawn ScriptedTriggerController");
    }
    //return;    
}

function name NextNeededEvent()
{
    local int i, Start;

    // End:0x1F
    if(TriggerController != none)
    {
        Start = TriggerController.ActionNum;
    }
    i = Start;
    J0x2A:

    // End:0x74 [Loop If]
    if(i < Actions.Length)
    {
        // End:0x6A
        if(Action_WAITFOREVENT(Actions[i]) != none)
        {
            return Action_WAITFOREVENT(Actions[i]).ExternalEvent;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    return 'None';
    //return;    
}

function bool TriggersEvent(name E)
{
    local int i, Start;

    // End:0x1F
    if(TriggerController != none)
    {
        Start = TriggerController.ActionNum;
    }
    i = Start;
    J0x2A:

    // End:0x81 [Loop If]
    if(i < Actions.Length)
    {
        // End:0x77
        if((Action_TRIGGEREVENT(Actions[i]) != none) && Action_TRIGGEREVENT(Actions[i]).Event == E)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    return false;
    //return;    
}

function bool ValidAction(int N)
{
    return Actions[N].bValidForTrigger;
    //return;    
}

function Reset()
{
    super.Reset();
    // End:0x1F
    if(TriggerController == none)
    {
        TriggerController = Spawn(Class'GamePlay_Decompressed.ScriptedTriggerController');
    }
    // End:0x3A
    if(TriggerController != none)
    {
        TriggerController.InitializeFor(self);
    }
    //return;    
}

defaultproperties
{
    bNavigate=false
    Texture=Texture'GamePlay_Decompressed.S_SpecialEvent'
}