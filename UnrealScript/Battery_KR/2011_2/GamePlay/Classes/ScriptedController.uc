class ScriptedController extends AIController;

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
    //return;    
}

function SetDoubleJump()
{
    bNotifyApex = true;
    bPendingDoubleJump = true;
    //return;    
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
        // End:0x4D
        if(Pawn.CanDoubleJump())
        {
            Pawn.DoDoubleJump(false);
        }
        bPendingDoubleJump = false;        
    }
    else
    {
        // End:0x18A
        if(bJumpOverWall)
        {
            Pawn.Acceleration = Destination - Pawn.Location;
            Pawn.Acceleration.Z = 0.0000000;
            HalfHeight = Pawn.GetCollisionExtent();
            HalfHeight.Z *= 0.5000000;
            Start = Pawn.Location - (Pawn.CollisionHeight * vect(0.0000000, 0.0000000, 0.5000000));
            HitActor = Pawn.Trace(HitLocation, HitNormal, Start + (float(8) * Normal(Pawn.Acceleration)), Start, true, HalfHeight);
            // End:0x18A
            if(HitActor != none)
            {
                Pawn.bWantsToCrouch = false;
                Pawn.bWantsToProne = false;
                // End:0x18A
                if(Pawn.CanDoubleJump())
                {
                    Pawn.DoDoubleJump(false);
                }
            }
        }
    }
    //return;    
}

function TakeControlOf(Pawn aPawn)
{
    // End:0x2A
    if(Pawn != aPawn)
    {
        aPawn.PossessedBy(self);
        Pawn = aPawn;
    }
    GotoState('Scripting');
    //return;    
}

function SetEnemyReaction(int AlertnessLevel)
{
    //return;    
}

function DestroyPawn()
{
    // End:0x17
    if(Pawn != none)
    {
        Pawn.Destroy();
    }
    Destroy();
    //return;    
}

function Pawn GetMyPlayer()
{
    // End:0x4A
    if((MyPlayerController == none) || MyPlayerController.Pawn == none)
    {
        // End:0x49
        foreach DynamicActors(Class'Engine.PlayerController', MyPlayerController)
        {
            // End:0x48
            if(MyPlayerController.Pawn != none)
            {
                // End:0x49
                break;
            }            
        }        
    }
    // End:0x57
    if(MyPlayerController == none)
    {
        return none;
    }
    return MyPlayerController.Pawn;
    //return;    
}

function Pawn GetInstigator()
{
    // End:0x11
    if(Pawn != none)
    {
        return Pawn;
    }
    return Instigator;
    //return;    
}

function Actor GetSoundSource()
{
    // End:0x11
    if(Pawn != none)
    {
        return Pawn;
    }
    return SequenceScript;
    //return;    
}

function bool CheckIfNearPlayer(float Distance)
{
    local Pawn MyPlayer;

    MyPlayer = GetMyPlayer();
    return ((MyPlayer != none) && VSize(Pawn.Location - MyPlayer.Location) < ((Distance + CollisionRadius) + MyPlayer.CollisionRadius)) && Pawn.PlayerCanSeeMe();
    //return;    
}

function ClearScript()
{
    ActionNum = 0;
    CurrentAction = none;
    CurrentAnimation = none;
    ScriptedFocus = none;
    Pawn.SetSprinting(false);
    Pawn.ShouldCrouch(false);
    //return;    
}

function SetNewScript(ScriptedSequence NewScript)
{
    MyScript = NewScript;
    SequenceScript = NewScript;
    Focus = none;
    ClearScript();
    SetEnemyReaction(3);
    SequenceScript.SetActions(self);
    //return;    
}

function ClearAnimation()
{
    AnimsRemaining = 0;
    bControlAnimations = false;
    CurrentAnimation = none;
    Pawn.PlayWaiting();
    //return;    
}

function int SetFireYaw(int FireYaw)
{
    FireYaw = FireYaw & 65535;
    // End:0xE3
    if((((int(Pawn.Physics) != int(0)) && int(Pawn.Physics) != int(13)) && Abs(float(FireYaw - (Rotation.Yaw & 65535))) > float(8192)) && Abs(float(FireYaw - (Rotation.Yaw & 65535))) < float(57343))
    {
        // End:0xCC
        if(ClockwiseFrom_IntInt(FireYaw, Rotation.Yaw))
        {
            FireYaw = Rotation.Yaw + 8192;            
        }
        else
        {
            FireYaw = Rotation.Yaw - 8192;
        }
    }
    return FireYaw;
    //return;    
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
    LookDir = Rotator(Target.Location - projStart);
    LookDir.Yaw = SetFireYaw(LookDir.Yaw);
    return LookDir;
    //return;    
}

function LeaveScripting()
{
    //return;    
}

state Scripting
{
    function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
    {
        super(AIController).DisplayDebug(Canvas, YL, YPos);
        Canvas.DrawText((("AIScript " $ string(SequenceScript)) $ " ActionNum ") $ string(ActionNum), false);
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        CurrentAction.DisplayDebug(Canvas, YL, YPos);
        //return;        
    }

    function UnPossess()
    {
        Pawn.UnPossessed();
        // End:0x4C
        if((Pawn != none) && PendingController != none)
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
        //return;        
    }

    function LeaveScripting()
    {
        UnPossess();
        //return;        
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
        // End:0x3F
        if(CurrentAnimation == none)
        {
            ClearAnimation();
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x18
        if(CurrentAction.CompleteWhenTriggered())
        {
            CompleteAction();
        }
        //return;        
    }

    function Timer()
    {
        // End:0x35
        if(CurrentAction.WaitForPlayer() && CheckIfNearPlayer(CurrentAction.GetDistance()))
        {
            CompleteAction();            
        }
        else
        {
            // End:0x4D
            if(CurrentAction.CompleteWhenTimer())
            {
                CompleteAction();
            }
        }
        //return;        
    }

    function AnimEnd(int Channel)
    {
        // End:0x1F
        if(CurrentAction.CompleteOnAnim(Channel))
        {
            CompleteAction();
            return;
        }
        // End:0x56
        if(Channel == 0)
        {
            // End:0x53
            if((CurrentAnimation == none) || !CurrentAnimation.PawnPlayBaseAnim(self, false))
            {
                ClearAnimation();
            }            
        }
        else
        {
            Pawn.AnimEnd(Channel);
        }
        //return;        
    }

    function LIPSincAnimEnd()
    {
        // End:0x1D
        if(CurrentAction.CompleteOnLIPSincAnim())
        {
            CompleteAction();
            return;            
        }
        else
        {
            Pawn.LIPSincAnimEnd();
        }
        //return;        
    }

    function CompleteAction()
    {
        CurrentAction.ActionCompleted();
        ActionNum++;
        GotoState('Scripting', 'Begin');
        //return;        
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
        // End:0x4B
        if(Focus == none)
        {
            Focus = NextMoveTarget;
        }
        MoveTarget = NextMoveTarget;
        // End:0x9F
        if(!actorReachable(MoveTarget))
        {
            MoveTarget = FindPathToward(MoveTarget, false);
            // End:0x85
            if(MoveTarget == none)
            {
                AbortScript();
                return;
            }
            // End:0x9F
            if(Focus == NextMoveTarget)
            {
                Focus = MoveTarget;
            }
        }
        //return;        
    }

    function AbortScript()
    {
        LeaveScripting();
        //return;        
    }

    function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
    {
        // End:0x0B
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
        if((bShootTarget && ScriptedFocus != none) && !ScriptedFocus.bDeleteMe)
        {
            Target = ScriptedFocus;
            // End:0x118
            if((!bShootSpray && (Pawn.Weapon.RefireRate() < 0.9900000) && !Pawn.Weapon.CanAttack(Target)) || !Pawn.Weapon.BotFire(bFinishedFire, FiringMode))
            {
                Enable('Tick');
                bPendingShoot = true;
                return false;
            }
            // End:0x140
            if(NumShots > 0)
            {
                NumShots--;
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
        //return;        
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
        if(!bPendingShoot && (CurrentAction == none) || !CurrentAction.StillTicking(self, DeltaTime))
        {
            Disable('Tick');
        }
        //return;        
    }

    function MayShootTarget()
    {
        WeaponFireAgain(0.0000000, false);
        //return;        
    }

    function EndState()
    {
        bUseScriptFacing = true;
        bFakeShot = false;
        //return;        
    }
Begin:

    InitForNextAction();
    // End:0x16
    if(bBroken)
    {
        GotoState('Broken');
    }
    // End:0x2F
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
        if((MoveTarget != none) && MoveTarget != Pawn)
        {
            MoveToward(MoveTarget, Focus,,, Pawn.bIsSprinting);
            // End:0x137
            if((MoveTarget != CurrentAction.GetMoveTargetFor(self)) || !Pawn.ReachedDestination(CurrentAction.GetMoveTargetFor(self)))
            {
                goto 'KeepMoving';
            }
        }
        CompleteAction();        
    }
    else
    {
        // End:0x1BD
        if(CurrentAction.TurnToGoal())
        {
            Pawn.SetMovementPhysics();
            Focus = CurrentAction.GetMoveTargetFor(self);
            // End:0x1B1
            if(Focus == none)
            {
                FocalPoint = Pawn.Location + (float(1000) * Vector(SequenceScript.Rotation));
            }
            FinishRotation();
            CompleteAction();            
        }
        else
        {
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            Focus = ScriptedFocus;
            // End:0x221
            if(!bUseScriptFacing)
            {
                FocalPoint = Pawn.Location + (float(1000) * Vector(Pawn.Rotation));                
            }
            else
            {
                // End:0x261
                if(Focus == none)
                {
                    MayShootAtEnemy();
                    FocalPoint = Pawn.Location + (float(1000) * Vector(SequenceScript.Rotation));
                }
            }
            FinishRotation();
            MayShootTarget();
        }
    }
    stop;        
}

state Broken
{Begin:

    Warn((((string(Pawn) $ " Scripted Sequence BROKEN ") $ string(SequenceScript)) $ " ACTION ") $ string(CurrentAction));
    Pawn.bPhysicsAnimUpdate = false;
    Pawn.StopAnimating();
    // End:0x94
    if((GetMyPlayer()) != none)
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