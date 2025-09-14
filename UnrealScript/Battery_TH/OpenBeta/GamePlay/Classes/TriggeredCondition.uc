class TriggeredCondition extends Triggers;

var() bool bToggled;
var() bool bEnabled;
var() bool bTriggerControlled;
var bool bInitialValue;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    bInitialValue = bEnabled;
    //return;    
}

function Reset()
{
    bEnabled = bInitialValue;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x1B
    if(bToggled)
    {
        bEnabled = !bEnabled;        
    }
    else
    {
        bEnabled = !bInitialValue;
    }
    //return;    
}

function UnTrigger(Actor Other, Pawn EventInstigator)
{
    // End:0x16
    if(bTriggerControlled)
    {
        bEnabled = bInitialValue;
    }
    //return;    
}

defaultproperties
{
    bCollideActors=false
}