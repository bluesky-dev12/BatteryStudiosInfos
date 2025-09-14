class Volume extends Brush
    native
    notplaceable;

var Actor AssociatedActor;
var() name AssociatedActorTag;
var() int LocationPriority;
var() localized string LocationName;
var() edfindable DecorationList DecoList;

// Export UVolume::execEncompasses(FFrame&, void* const)
native function bool Encompasses(Actor Other)
{
    //native.Other;        
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2F
    if(AssociatedActorTag != 'None')
    {
        // End:0x2E
        foreach AllActors(Class'Engine_Decompressed.Actor', AssociatedActor, AssociatedActorTag)
        {
            // End:0x2E
            break;            
        }        
    }
    // End:0x4A
    if(AssociatedActor != none)
    {
        GotoState('AssociatedTouch');
        InitialState = GetStateName();
    }
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super(Actor).DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText("AssociatedActor " $ string(AssociatedActor), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

state AssociatedTouch
{
    event Touch(Actor Other)
    {
        AssociatedActor.Touch(Other);
        //return;        
    }

    event UnTouch(Actor Other)
    {
        AssociatedActor.UnTouch(Other);
        //return;        
    }

    function BeginState()
    {
        local Actor A;

        // End:0x1C
        foreach TouchingActors(Class'Engine_Decompressed.Actor', A)
        {
            Touch(A);            
        }        
        //return;        
    }
    stop;    
}

defaultproperties
{
    LocationName="???"
    bSkipActorPropertyReplication=true
    bCollideActors=true
}