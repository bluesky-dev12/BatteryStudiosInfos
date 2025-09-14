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
    foreach AllActors(Class'Engine.Actor', CameraActorIt, CameraTag)
    {
        CameraActor = CameraActorIt;
        // End:0x24
        break;        
    }    
    // End:0x57
    if(DestTexture != none)
    {
        DestTexture.Client = self;
        SetTimer(1.0000000 / RefreshRate, true);
        Enable('Timer');
    }
    //return;    
}

simulated function Timer()
{
    DestTexture.Revision++;
    //return;    
}

simulated event RenderTexture(ScriptedTexture Tex)
{
    // End:0x60
    if(CameraActor != none)
    {
        Tex.DrawPortal(0, 0, Tex.USize, Tex.VSize, CameraActor, CameraActor.Location, CameraActor.Rotation, int(FOV));
    }
    //return;    
}

defaultproperties
{
    RefreshRate=60.0000000
    FOV=60.0000000
    bNoDelete=true
    bAlwaysRelevant=true
}