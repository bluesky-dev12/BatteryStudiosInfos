/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\CameraTextureClient.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class CameraTextureClient extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() ScriptedTexture DestTexture;
var() name CameraTag;
var() float RefreshRate;
var() float FOV;
var Actor CameraActor;

simulated function PostBeginPlay()
{
    local Actor CameraActorIt;

    // End:0x24
    foreach AllActors(class'Actor', CameraActorIt, CameraTag)
    {
        CameraActor = CameraActorIt;
        // End:0x24
        break;                
    }
    // End:0x57
    if(DestTexture != none)
    {
        DestTexture.Client = self;
        SetTimer(1.0 / RefreshRate, true);
        Enable('Timer');
    }
}

simulated function Timer()
{
    ++ DestTexture.Revision;
}

simulated event RenderTexture(ScriptedTexture Tex)
{
    // End:0x60
    if(CameraActor != none)
    {
        Tex.DrawPortal(0, 0, Tex.USize, Tex.VSize, CameraActor, CameraActor.Location, CameraActor.Rotation, int(FOV));
    }
}

defaultproperties
{
    RefreshRate=60.0
    FOV=60.0
    bNoDelete=true
    bAlwaysRelevant=true
}