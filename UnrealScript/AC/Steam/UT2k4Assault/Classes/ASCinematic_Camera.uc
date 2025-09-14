/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASCinematic_Camera.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class ASCinematic_Camera extends Actor
    dependson(ASCinematic_SceneManager)
    placeable;

var() float ShotLength;
var() name EventViewingCamera;
var() name NextCameraTag;
var ASCinematic_Camera NextCamera;
var() bool bInitiallyActive;
var bool bActive;
var ASCinematic_SceneManager ASCSM;

function PostBeginPlay()
{
    super.PostBeginPlay();
    bActive = bInitiallyActive;
    // End:0x3c
    if(NextCameraTag != 'None')
    {
        // End:0x3b
        foreach AllActors(class'ASCinematic_Camera', NextCamera, NextCameraTag)
        {
            // End:0x3b
            break;                        
        }
    }
    // End:0x54
    if(ShotLength == float(0))
    {
        ShotLength = 2.0;
    }
}

function ViewFixedObjective(PlayerController PC, GameObjective Go)
{
    PC.ClientSetFixedCamera(true);
    PC.ClientSetViewTarget_Q(self);
    PC.SetViewTarget(self);
}

function SetView(ASCinematic_SceneManager SM)
{
    local Controller C, NextC;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0xbf [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xb1
        if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            PC = PlayerController(C);
            // End:0xb1
            if(PC != none)
            {
                PC.ClientSetFixedCamera(true);
                PC.ClientSetViewTarget_P(self);
                PC.SetViewTarget(self);
            }
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    TriggerEvent(EventViewingCamera, self, none);
    // End:0xeb
    if(SM != none)
    {
        SetTimer(ShotLength, false);
        ASCSM = SM;
    }
}

function Timer()
{
    ASCSM.ShotEnded(self);
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bActive = !bActive;
}

function Reset()
{
    super.Reset();
    bActive = bInitiallyActive;
}

defaultproperties
{
    ShotLength=2.0
    bInitiallyActive=true
    bHidden=true
    bNoDelete=true
    RemoteRole=0
    Texture=Texture'Engine.Proj_Icon'
}