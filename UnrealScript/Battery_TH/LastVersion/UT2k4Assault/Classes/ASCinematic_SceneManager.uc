class ASCinematic_SceneManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() name CameraTag;
var() name EventSceneStarted;
var() name EventSceneEnded;
var ASCinematic_Camera Camera;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2F
    if(CameraTag != 'None')
    {
        // End:0x2E
        foreach AllActors(Class'UT2k4Assault_Decompressed.ASCinematic_Camera', Camera, CameraTag)
        {
            // End:0x2E
            break;            
        }        
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    PlayScene();
    //return;    
}

function PlayScene()
{
    Level.Game.SceneStarted(none, self);
    Camera.SetView(self);
    TriggerEvent(EventSceneStarted, self, none);
    //return;    
}

event ShotEnded(ASCinematic_Camera cam)
{
    // End:0x89
    if(((cam != none) && cam.NextCamera != none) && cam.NextCamera != Camera)
    {
        // End:0x72
        if(cam.NextCamera.bActive)
        {
            cam.NextCamera.SetView(self);            
        }
        else
        {
            ShotEnded(cam.NextCamera);
        }        
    }
    else
    {
        SceneEnded();
    }
    //return;    
}

event SceneEnded()
{
    Level.Game.SceneEnded(none, self);
    TriggerEvent(EventSceneEnded, self, none);
    //return;    
}

defaultproperties
{
    bNoDelete=true
    Texture=Texture'Engine.S_SceneManager'
}