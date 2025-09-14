/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Volume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *	States:1
 *
 *******************************************************************************/
class Volume extends Brush
    dependson(Brush)
    native
    notplaceable;

var Actor AssociatedActor;
var() name AssociatedActorTag;
var() int LocationPriority;
var() localized string LocationName;
var() edfindable DecorationList DecoList;

// Export UVolume::execEncompasses(FFrame&, void* const)
native function bool Encompasses(Actor Other);
function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2f
    if(AssociatedActorTag != 'None')
    {
        // End:0x2e
        foreach AllActors(class'Actor', AssociatedActor, AssociatedActorTag)
        {
            // End:0x2e
            break;                        
        }
    }
    // End:0x4a
    if(AssociatedActor != none)
    {
        GotoState('AssociatedTouch');
        InitialState = GetStateName();
    }
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super(Actor).DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText("AssociatedActor " $ string(AssociatedActor), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

state AssociatedTouch
{
    event Touch(Actor Other)
    {
        AssociatedActor.Touch(Other);
    }

    event UnTouch(Actor Other)
    {
        AssociatedActor.UnTouch(Other);
    }

    function BeginState()
    {
        local Actor A;

        // End:0x1c
        foreach TouchingActors(class'Actor', A)
        {
            Touch(A);                        
        }
    }

}

defaultproperties
{
    LocationName="Unspecified"
    bSkipActorPropertyReplication=true
    bCollideActors=true
}