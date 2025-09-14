class wMSCinematic_Camera extends Actor
    placeable;

var() float ShotLength;
var() name EventViewingCamera;
var() name NextCameraTag;
var wMSCinematic_Camera NextCamera;
var() bool bInitiallyActive;
var bool bActive;
var wMSCinematic_SceneManager ASCSM;

function PostBeginPlay()
{
    super.PostBeginPlay();
    bActive = bInitiallyActive;
    // End:0x3C
    if(NextCameraTag != 'None')
    {
        // End:0x3B
        foreach AllActors(Class'WMission_Decompressed.wMSCinematic_Camera', NextCamera, NextCameraTag)
        {
            // End:0x3B
            break;            
        }        
    }
    // End:0x54
    if(ShotLength == float(0))
    {
        ShotLength = 2.0000000;
    }
    //return;    
}

function ViewFixedObjective(PlayerController PC, GameObjective Go)
{
    PC.ClientSetFixedCamera(true);
    PC.ClientSetViewTarget_I(self);
    PC.SetViewTarget(self);
    //return;    
}

function SetView(wMSCinematic_SceneManager SM)
{
    local Controller C, NextC;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0xBF [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xB1
        if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            PC = PlayerController(C);
            // End:0xB1
            if(PC != none)
            {
                PC.ClientSetFixedCamera(true);
                PC.ClientSetViewTarget_J(self);
                PC.SetViewTarget(self);
            }
        }
        C = NextC;
        // [Loop Continue]
        goto J0x14;
    }
    TriggerEvent(EventViewingCamera, self, none);
    // End:0xEB
    if(SM != none)
    {
        SetTimer(ShotLength, false);
        ASCSM = SM;
    }
    //return;    
}

function Timer()
{
    ASCSM.ShotEnded(self);
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bActive = !bActive;
    //return;    
}

function Reset()
{
    super.Reset();
    bActive = bInitiallyActive;
    //return;    
}

defaultproperties
{
    ShotLength=2.0000000
    bInitiallyActive=true
    bHidden=true
    bNoDelete=true
    RemoteRole=0
    Texture=Texture'Engine.Proj_Icon'
}