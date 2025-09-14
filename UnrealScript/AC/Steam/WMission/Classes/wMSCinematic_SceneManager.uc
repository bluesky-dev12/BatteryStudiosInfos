/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMSCinematic_SceneManager.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class wMSCinematic_SceneManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() name CameraTag;
var() name EventSceneStarted;
var() name EventSceneEnded;
var wMSCinematic_Camera Camera;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2f
    if(CameraTag != 'None')
    {
        // End:0x2e
        foreach AllActors(class'wMSCinematic_Camera', Camera, CameraTag)
        {
            // End:0x2e
            break;                        
        }
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    PlayScene();
}

function PlayScene()
{
    Level.Game.SceneStarted(none, self);
    Camera.SetView(self);
    TriggerEvent(EventSceneStarted, self, none);
}

event ShotEnded(wMSCinematic_Camera cam)
{
    // End:0x89
    if(cam != none && cam.NextCamera != none && cam.NextCamera != Camera)
    {
        // End:0x72
        if(cam.NextCamera.bActive)
        {
            cam.NextCamera.SetView(self);
        }
        // End:0x86
        else
        {
            ShotEnded(cam.NextCamera);
        }
    }
    // End:0x8f
    else
    {
        SceneEnded();
    }
}

event SceneEnded()
{
    Level.Game.SceneEnded(none, self);
    TriggerEvent(EventSceneEnded, self, none);
}

defaultproperties
{
    bNoDelete=true
    Texture=Texture'Engine.S_SceneManager'
}