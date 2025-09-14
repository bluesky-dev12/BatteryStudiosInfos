/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SceneManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:2
 *	Properties:27
 *	Functions:6
 *
 *******************************************************************************/
class SceneManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    config()
    placeable;

enum EAffect
{
    AFFECT_ViewportCamera,
    AFFECT_Actor
};

struct Orientation
{
    var() Core.Object.ECamOrientation CamOrientation;
    var() Actor LookAt;
    var() Actor DollyWith;
    var() float EaseIntime;
    var() int bReversePitch;
    var() int bReverseYaw;
    var() int bReverseRoll;
    var transient pointer MA;
    var float PctInStart;
    var float PctInEnd;
    var float PctInDuration;
    var Rotator StartingRotation;
};

struct Interpolator
{
    var() int bDone;
    var() float _value;
    var() float _remainingTime;
    var() float _totalTime;
    var() float _speed;
    var() float _acceleration;
};

var() export editinline array<export editinline MatAction> Actions;
var() config SceneManager.EAffect Affect;
var() Actor AffectedActor;
var() bool bLooping;
var() bool bCinematicView;
var() name PlayerScriptTag;
var() name NextSceneTag;
var() name EventStart;
var() name EventEnd;
var() bool bHideHUD;
var transient float PctSceneComplete;
var transient MatAction CurrentAction;
var transient float SceneSpeed;
var transient float TotalSceneTime;
var transient Actor Viewer;
var transient Pawn OldPawn;
var transient bool bIsRunning;
var transient bool bIsSceneStarted;
var transient float CurrentTime;
var transient array<Vector> SampleLocations;
var transient array<MatSubAction> SubActions;
var transient Orientation CamOrientation;
var transient Orientation PrevOrientation;
var transient Interpolator RotInterpolator;
var transient Vector CameraShake;
var transient Vector DollyOffset;
var transient bool bAbortCinematic;

// Export USceneManager::execGetTotalSceneTime(FFrame&, void* const)
native function float GetTotalSceneTime();
// Export USceneManager::execAbortScene(FFrame&, void* const)
native function AbortScene();
simulated function BeginPlay()
{
    super(Actor).BeginPlay();
    // End:0x4d
    if(Affect == 1 && AffectedActor == none)
    {
        Log("SceneManager : Affected actor is NULL!");
    }
    TotalSceneTime = GetTotalSceneTime();
    bIsRunning = false;
    bIsSceneStarted = false;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bIsRunning = true;
    bIsSceneStarted = false;
    Disable('Trigger');
}

event SceneStarted()
{
    local Controller P;
    local AIScript S;

    Viewer = none;
    // End:0x25
    if(Affect == 1)
    {
        Viewer = AffectedActor;
    }
    // End:0x183
    else
    {
        P = Level.ControllerList;
        J0x39:
        // End:0x183 [While If]
        if(P != none)
        {
            // End:0x16c
            if(P.IsA('PlayerController'))
            {
                Viewer = P;
                OldPawn = PlayerController(Viewer).Pawn;
                // End:0x11b
                if(OldPawn != none)
                {
                    OldPawn.Velocity = vect(0.0, 0.0, 0.0);
                    OldPawn.Acceleration = vect(0.0, 0.0, 0.0);
                    PlayerController(Viewer).UnPossess();
                    // End:0x11b
                    if(PlayerScriptTag != 'None')
                    {
                        // End:0xfb
                        foreach DynamicActors(class'AIScript', S, PlayerScriptTag)
                        {
                            // End:0xfb
                            break;                                                        
                        }
                        // End:0x11b
                        if(S != none)
                        {
                            S.TakeOver(OldPawn);
                        }
                    }
                }
                PlayerController(Viewer).bViewingMatineeCinematic = true;
                PlayerController(Viewer).StartInterpolation();
                PlayerController(Viewer).myHUD.bHideHUD = bHideHUD;
            }
            // End:0x183
            else
            {
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x39;
            }
        }
    }
    Viewer.StartInterpolation();
    TriggerEvent(EventStart, self, none);
    Level.Game.SceneStarted(self, none);
}

event SceneEnded()
{
    bIsSceneStarted = false;
    // End:0x97
    if(Affect == 0)
    {
        // End:0x97
        if(PlayerController(Viewer) != none)
        {
            // End:0x4c
            if(OldPawn != none)
            {
                PlayerController(Viewer).Possess(OldPawn);
            }
            PlayerController(Viewer).bViewingMatineeCinematic = false;
            PlayerController(Viewer).bInterpolating = false;
            PlayerController(Viewer).myHUD.bHideHUD = false;
        }
    }
    Viewer.FinishedInterpolation();
    Enable('Trigger');
    TriggerEvent(EventEnd, self, none);
    Level.Game.SceneEnded(self, none);
}

defaultproperties
{
    bHideHUD=true
    Texture=Texture'S_SceneManager'
}