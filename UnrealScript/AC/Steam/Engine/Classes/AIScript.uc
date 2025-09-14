/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AIScript.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class AIScript extends Keypoint
    native
    placeable;

var() class<AIController> ControllerClass;
var bool bNavigate;
var bool bLoggingEnabled;
var AIMarker myMarker;

function SpawnControllerFor(Pawn P)
{
    local AIController C;

    // End:0x59
    if(ControllerClass == none)
    {
        // End:0x21
        if(P.ControllerClass == none)
        {
            return;
        }
        C = Spawn(P.ControllerClass,,, P.Location, P.Rotation);
    }
    // End:0x85
    else
    {
        C = Spawn(ControllerClass,,, P.Location, P.Rotation);
    }
    C.MyScript = self;
    C.Possess(P);
}

function Actor GetMoveTarget()
{
    // End:0x11
    if(myMarker != none)
    {
        return myMarker;
    }
    return self;
}

function TakeOver(Pawn P);

defaultproperties
{
    Texture=Texture'S_AIScript'
    DrawScale=0.50
}