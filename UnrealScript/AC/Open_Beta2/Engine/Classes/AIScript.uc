class AIScript extends Keypoint
    native
    placeable;

var() Class<AIController> ControllerClass;
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
    else
    {
        C = Spawn(ControllerClass,,, P.Location, P.Rotation);
    }
    C.MyScript = self;
    C.Possess(P);
    //return;    
}

function Actor GetMoveTarget()
{
    // End:0x11
    if(myMarker != none)
    {
        return myMarker;
    }
    return self;
    //return;    
}

function TakeOver(Pawn P)
{
    //return;    
}

defaultproperties
{
    Texture=Texture'Engine_Decompressed.S_AIScript'
    DrawScale=0.5000000
}