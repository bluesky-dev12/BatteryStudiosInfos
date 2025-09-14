class SceneManager extends Info
    native
    config
    placeable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EAffect
{
    AFFECT_ViewportCamera,          // 0
    AFFECT_Actor                    // 1
};

struct Orientation
{
    var() Object.ECamOrientation CamOrientation;
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
    // End:0x4D
    if((int(Affect) == int(1)) && AffectedActor == none)
    {
        Log("SceneManager : Affected actor is NULL!");
    }
    TotalSceneTime = GetTotalSceneTime();
    bIsRunning = false;
    bIsSceneStarted = false;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bIsRunning = true;
    bIsSceneStarted = false;
    Disable('Trigger');
    //return;    
}

event SceneStarted()
{
    local Controller P;
    local AIScript S;

    Viewer = none;
    // End:0x25
    if(int(Affect) == int(1))
    {
        Viewer = AffectedActor;        
    }
    else
    {
        P = Level.ControllerList;
        J0x39:

        // End:0x183 [Loop If]
        if(P != none)
        {
            // End:0x16C
            if(P.IsA('PlayerController'))
            {
                Viewer = P;
                OldPawn = PlayerController(Viewer).Pawn;
                // End:0x11B
                if(OldPawn != none)
                {
                    OldPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    OldPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    PlayerController(Viewer).UnPossess();
                    // End:0x11B
                    if(PlayerScriptTag != 'None')
                    {
                        // End:0xFB
                        foreach DynamicActors(Class'Engine_Decompressed.AIScript', S, PlayerScriptTag)
                        {
                            // End:0xFB
                            break;                            
                        }                        
                        // End:0x11B
                        if(S != none)
                        {
                            S.TakeOver(OldPawn);
                        }
                    }
                }
                PlayerController(Viewer).bViewingMatineeCinematic = true;
                PlayerController(Viewer).StartInterpolation();
                PlayerController(Viewer).myHUD.bHideHUD = bHideHUD;
                // [Explicit Break]
                goto J0x183;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x39;
        }
    }
    J0x183:

    Viewer.StartInterpolation();
    TriggerEvent(EventStart, self, none);
    Level.Game.SceneStarted(self, none);
    //return;    
}

event SceneEnded()
{
    bIsSceneStarted = false;
    // End:0x97
    if(int(Affect) == int(0))
    {
        // End:0x97
        if(PlayerController(Viewer) != none)
        {
            // End:0x4C
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
    //return;    
}

defaultproperties
{
    bHideHUD=true
    Texture=Texture'Engine_Decompressed.S_SceneManager'
}