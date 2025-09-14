/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedController.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:16
 *	States:2
 *
 *******************************************************************************/
class ScriptedController extends AIController
    dependson(LatentScriptedAction)
    dependson(Action_PLAYANIM)
    dependson(ScriptedSequence);

var Controller PendingController;
var int ActionNum;
var int AnimsRemaining;
var ScriptedSequence SequenceScript;
var LatentScriptedAction CurrentAction;
var Action_PLAYANIM CurrentAnimation;
var bool bBroken;
var bool bShootTarget;
var bool bShootSpray;
var bool bPendingShoot;
var bool bFakeShot;
var bool bUseScriptFacing;
var bool bPendingDoubleJump;
var bool bFineWeaponControl;
var bool bChangingPawns;
var Actor ScriptedFocus;
var PlayerController MyPlayerController;
var int NumShots;
var name FiringMode;
var int IterationCounter;
var int IterationSectionStart;

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
    return bFineWeaponControl;
}

function SetDoubleJump()
{
    bNotifyApex = true;
    bPendingDoubleJump = true;
}

event NotifyJumpApex()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, HalfHeight, Start;

    // End:0x58
    if(bPendingDoubleJump)
    {
        Pawn.bWantsToCrouch = false;
        Pawn.bWantsToProne = false;
        // End:0x4d
        if(Pawn.CanDoubleJump())
        {
            Pawn.DoDoubleJump(false);
        }
        bPendingDoubleJump = false;
    }
    // End:0x18a
    else
    {
        // End:0x18a
        if(bJumpOverWall)
        {
            Pawn.Acceleration = Destination - Pawn.Location;
            Pawn.Acceleration.Z = 0.0;
            HalfHeight = Pawn.GetCollisionExtent();
            HalfHeight.Z *= 0.50;
            Start = Pawn.Location - Pawn.CollisionHeight * vect(0.0, 0.0, 0.50);
            HitActor = Pawn.Trace(HitLocation, HitNormal, Start + float(8) * Normal(Pawn.Acceleration), Start, true, HalfHeight);
            // End:0x18a
            if(HitActor != none)
            {
                Pawn.bWantsToCrouch = false;
                Pawn.bWantsToProne = false;
                // End:0x18a
                if(Pawn.CanDoubleJump())
                {
                    Pawn.DoDoubleJump(false);
                }
            }
        }
    }
}

function TakeControlOf(Pawn aPawn)
{
    // End:0x2a
    if(Pawn != aPawn)
    {
        aPawn.PossessedBy(self);
        Pawn = aPawn;
    }
    GotoState('Scripting');
}

function SetEnemyReaction(int AlertnessLevel);
function DestroyPawn()
{
    // End:0x17
    if(Pawn != none)
    {
        Pawn.Destroy();
    }
    Destroy();
}

function Pawn GetMyPlayer()
{
    // End:0x4a
    if(MyPlayerController == none || MyPlayerController.Pawn == none)
    {
        // End:0x49
        foreach DynamicActors(class'PlayerController', MyPlayerController)
        {
            // End:0x48
            if(MyPlayerController.Pawn != none)
            {
            }
            // End:0x49
            else
            {
                continue;
            }            
        }
    }
    // End:0x57
    if(MyPlayerController == none)
    {
        return none;
    }
    return MyPlayerController.Pawn;
}

function Pawn GetInstigator()
{
    // End:0x11
    if(Pawn != none)
    {
        return Pawn;
    }
    return Instigator;
}

function Actor GetSoundSource()
{
    // End:0x11
    if(Pawn != none)
    {
        return Pawn;
    }
    return SequenceScript;
}

function bool CheckIfNearPlayer(float Distance)
{
    local Pawn MyPlayer;

    MyPlayer = GetMyPlayer();
    return MyPlayer != none && VSize(Pawn.Location - MyPlayer.Location) < Distance + CollisionRadius + MyPlayer.CollisionRadius && Pawn.PlayerCanSeeMe();
}

function ClearScript()
{
    ActionNum = 0;
    CurrentAction = none;
    CurrentAnimation = none;
    ScriptedFocus = none;
    Pawn.SetSprinting(false);
    Pawn.ShouldCrouch(false);
}

function SetNewScript(ScriptedSequence NewScript)
{
    MyScript = NewScript;
    SequenceScript = NewScript;
    Focus = none;
    ClearScript();
    SetEnemyReaction(3);
    SequenceScript.SetActions(self);
}

function ClearAnimation()
{
    AnimsRemaining = 0;
    bControlAnimations = false;
    CurrentAnimation = none;
    Pawn.PlayWaiting();
}

function int SetFireYaw(int FireYaw)
{
    FireYaw = FireYaw & 65535;
    // End:0xe3
    if(Pawn.Physics != 0 && Pawn.Physics != 13 && Abs(float(FireYaw - Rotation.Yaw & 65535)) > float(8192) && Abs(float(FireYaw - Rotation.Yaw & 65535)) < float(57343))
    {
        // End:0xcc
        if(ClockwiseFrom_IntInt(FireYaw, Rotation.Yaw))
        {
            FireYaw = Rotation.Yaw + 8192;
        }
        // End:0xe3
        else
        {
            FireYaw = Rotation.Yaw - 8192;
        }
    }
    return FireYaw;
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator LookDir;

    // End:0x16
    if(Target == none)
    {
        Target = ScriptedFocus;
    }
    // End:0x46
    if(Target == none)
    {
        Target = Enemy;
        // End:0x46
        if(Target == none)
        {
            return Pawn.Rotation;
        }
    }
    LookDir = rotator(Target.Location - projStart);
    LookDir.Yaw = SetFireYaw(LookDir.Yaw);
    return LookDir;
}

function LeaveScripting();

state Scripting
{
    function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
    {
        super(AIController).DisplayDebug(Canvas, YL, YPos);
        Canvas.DrawText("AIScript " $ string(SequenceScript) $ " ActionNum " $ string(ActionNum), false);
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        CurrentAction.DisplayDebug(Canvas, YL, YPos);
    }

    function UnPossess()
    {
        Pawn.UnPossessed();
        // End:0x4c
        if(Pawn != none && PendingController != none)
        {
            PendingController.bStasis = false;
            PendingController.Possess(Pawn);
        }
        Pawn = none;
        // End:0x61
        if(!bChangingPawns)
        {
            Destroy();
        }
    }

    function LeaveScripting()
    {
        UnPossess();
    }

    function InitForNextAction()
    {
        SequenceScript.SetActions(self);
        // End:0x23
        if(CurrentAction == none)
        {
            LeaveScripting();
            return;
        }
        MyScript = SequenceScript;
        // End:0x3f
        if(CurrentAnimation == none)
        {
            ClearAnimation();
        }
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x18
        if(CurrentAction.CompleteWhenTriggered())
        {
            CompleteAction();
        }
    }

    function Timer()
    {
        // End:0x35
        if(CurrentAction.WaitForPlayer() && CheckIfNearPlayer(CurrentAction.GetDistance()))
        {
            CompleteAction();
        }
        // End:0x4d
        else
        {
            // End:0x4d
            if(CurrentAction.CompleteWhenTimer())
            {
                CompleteAction();
            }
        }
    }

    function AnimEnd(int Channel)
    {
        // End:0x1f
        if(CurrentAction.CompleteOnAnim(Channel))
        {
            CompleteAction();
            return;
        }
        // End:0x56
        if(Channel == 0)
        {
            // End:0x53
            if(CurrentAnimation == none || !CurrentAnimation.PawnPlayBaseAnim(self, false))
            {
                ClearAnimation();
            }
        }
        // End:0x6a
        else
        {
            Pawn.AnimEnd(Channel);
        }
    }

    function LIPSincAnimEnd()
    {
        // End:0x1d
        if(CurrentAction.CompleteOnLIPSincAnim())
        {
            CompleteAction();
            return;
        }
        // End:0x2c
        else
        {
            Pawn.LIPSincAnimEnd();
        }
    }

    function CompleteAction()
    {
        CurrentAction.ActionCompleted();
        ++ ActionNum;
        GotoState('Scripting', 'Begin');
    }

    function SetMoveTarget()
    {
        local Actor NextMoveTarget;

        Focus = ScriptedFocus;
        NextMoveTarget = CurrentAction.GetMoveTargetFor(self);
        // End:0x35
        if(NextMoveTarget == none)
        {
            GotoState('Broken');
            return;
        }
        // End:0x4b
        if(Focus == none)
        {
            Focus = NextMoveTarget;
        }
        MoveTarget = NextMoveTarget;
        // End:0x9f
        if(!actorReachable(MoveTarget))
        {
            MoveTarget = FindPathToward(MoveTarget, false);
            // End:0x85
            if(MoveTarget == none)
            {
                AbortScript();
                return;
            }
            // End:0x9f
            if(Focus == NextMoveTarget)
            {
                Focus = MoveTarget;
            }
        }
    }

    function AbortScript()
    {
        LeaveScripting();
    }

    function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
    {
        // End:0x0b
        if(bFineWeaponControl)
        {
            return true;
        }
        // End:0x30
        if(Pawn.bIgnorePlayFiring)
        {
            Pawn.bIgnorePlayFiring = false;
            return false;
        }
        // End:0x53
        if(NumShots < 0)
        {
            bShootTarget = false;
            bShootSpray = false;
            StopFiring();
            return false;
        }
        // End:0x142
        if(bShootTarget && ScriptedFocus != none && !ScriptedFocus.bDeleteMe)
        {
            Target = ScriptedFocus;
            // End:0x118
            if(!bShootSpray && Pawn.Weapon.RefireRate() < 0.990 && !Pawn.Weapon.CanAttack(Target) || !Pawn.Weapon.BotFire(bFinishedFire, FiringMode))
            {
                Enable('Tick');
                bPendingShoot = true;
                return false;
            }
            // End:0x140
            if(NumShots > 0)
            {
                -- NumShots;
                // End:0x140
                if(NumShots == 0)
                {
                    NumShots = -1;
                }
            }
            return true;
        }
        StopFiring();
        return false;
    }

    function Tick(float DeltaTime)
    {
        // End:0x17
        if(bPendingShoot)
        {
            bPendingShoot = false;
            MayShootTarget();
        }
        // End:0x52
        if(!bPendingShoot && CurrentAction == none || !CurrentAction.StillTicking(self, DeltaTime))
        {
            Disable('Tick');
        }
    }

    function MayShootTarget()
    {
        WeaponFireAgain(0.0, false);
    }

    function EndState()
    {
        bUseScriptFacing = true;
        bFakeShot = false;
    }

Begin:
    InitForNextAction();
    // End:0x16
    if(bBroken)
    {
        GotoState('Broken');
    }
    // End:0x2f
    if(CurrentAction.TickedAction())
    {
        Enable('Tick');
    }
    // End:0x87
    if(!bFineWeaponControl)
    {
        // End:0x60
        if(!bShootTarget)
        {
            bFire = 0;
            bAltFire = 0;
            bMeleeFire = 0;
        }
        // End:0x87
        else
        {
            Pawn.Weapon.RateSelf();
            // End:0x87
            if(bShootSpray)
            {
                MayShootTarget();
            }
        }
    }
    // End:0x140
    if(CurrentAction.MoveToGoal())
    {
        Pawn.SetMovementPhysics();
        WaitForLanding();
KeepMoving:

        SetMoveTarget();
        MayShootTarget();
        // End:0x137
        if(MoveTarget != none && MoveTarget != Pawn)
        {
            MoveToward(MoveTarget, Focus,,, Pawn.bIsSprinting);
            // End:0x137
            if(MoveTarget != CurrentAction.GetMoveTargetFor(self) || !Pawn.ReachedDestination(CurrentAction.GetMoveTargetFor(self)))
            {
                goto 'KeepMoving';
            }
        }
        CompleteAction();
    }
    // End:0x26a
    else
    {
        // End:0x1bd
        if(CurrentAction.TurnToGoal())
        {
            Pawn.SetMovementPhysics();
            Focus = CurrentAction.GetMoveTargetFor(self);
            // End:0x1b1
            if(Focus == none)
            {
                FocalPoint = Pawn.Location + float(1000) * vector(SequenceScript.Rotation);
            }
            FinishRotation();
            CompleteAction();
        }
        // End:0x26a
        else
        {
            Pawn.Acceleration = vect(0.0, 0.0, 0.0);
            Focus = ScriptedFocus;
            // End:0x221
            if(!bUseScriptFacing)
            {
                FocalPoint = Pawn.Location + float(1000) * vector(Pawn.Rotation);
            }
            // End:0x261
            else
            {
                // End:0x261
                if(Focus == none)
                {
                    MayShootAtEnemy();
                    FocalPoint = Pawn.Location + float(1000) * vector(SequenceScript.Rotation);
                }
            }
            FinishRotation();
            MayShootTarget();
        }
    }
}

state Broken
{

Begin:
    Warn(string(Pawn) $ " Scripted Sequence BROKEN " $ string(SequenceScript) $ " ACTION " $ string(CurrentAction));
    Pawn.bPhysicsAnimUpdate = false;
    Pawn.StopAnimating();
    // End:0x94
    if(GetMyPlayer() != none)
    {
        PlayerController(GetMyPlayer().Controller).SetViewTarget(Pawn);
    }
    stop;    
}

defaultproperties
{
    bUseScriptFacing=true
    IterationSectionStart=-1
}