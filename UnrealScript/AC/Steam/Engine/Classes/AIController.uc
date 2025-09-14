/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AIController.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:20
 *
 *******************************************************************************/
class AIController extends Controller
    dependson(LiftExit)
    dependson(AIScript)
    native
    notplaceable;

var bool bHunting;
var bool bAdjustFromWalls;
var bool bPlannedJump;
var AIScript MyScript;
var float Skill;

// Export UAIController::execWaitToSeeEnemy(FFrame&, void* const)
native(510) final latent function WaitToSeeEnemy();
event PreBeginPlay()
{
    super.PreBeginPlay();
    // End:0x11
    if(bDeleteMe)
    {
        return;
    }
    // End:0x43
    if(Level.Game != none)
    {
        Skill += Level.Game.GameDifficulty;
    }
    Skill = FClamp(Skill, 0.0, 3.0);
}

function Reset()
{
    bHunting = false;
    bPlannedJump = false;
    super.Reset();
}

simulated function float RateWeapon(wWeapon W)
{
    return W.GetAIRating() + FRand() * 0.050;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    TriggerScript(Other, EventInstigator);
}

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
    // End:0x40
    if(Pawn.PressingFire() && FRand() < RefireRate)
    {
        Pawn.Weapon.BotFire(bFinishedFire);
        return true;
    }
    StopFiring();
    return false;
}

function bool TriggerScript(Actor Other, Pawn EventInstigator)
{
    // End:0x26
    if(MyScript != none)
    {
        MyScript.Trigger(EventInstigator, Pawn);
        return true;
    }
    return false;
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local int i;
    local string t;

    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawColor.B = byte(255);
    // End:0xea
    if(Pawn != none && MoveTarget != none && Pawn.ReachedDestination(MoveTarget))
    {
        Canvas.DrawText("     Skill " $ string(Skill) $ " NAVIGATION MoveTarget " $ GetItemName(string(MoveTarget)) $ "(REACHED) PendingMover " $ string(PendingMover) $ " MoveTimer " $ string(MoveTimer), false);
    }
    // End:0x16a
    else
    {
        Canvas.DrawText("     Skill " $ string(Skill) $ " NAVIGATION MoveTarget " $ GetItemName(string(MoveTarget)) $ " PendingMover " $ string(PendingMover) $ " MoveTimer " $ string(MoveTimer), false);
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    t = "      Destination " $ string(Destination) $ " Focus " $ GetItemName(string(Focus));
    // End:0x1f5
    if(bPreparingMove)
    {
        t = t $ " (Preparing Move)";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("      RouteGoal " $ GetItemName(string(RouteGoal)) $ " RouteDist " $ string(RouteDist), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    i = 0;
    J0x29e:
    // End:0x331 [While If]
    if(i < 16)
    {
        // End:0x2f6
        if(RouteCache[i] == none)
        {
            // End:0x2f0
            if(i > 5)
            {
                t = t $ "--" $ GetItemName(string(RouteCache[i - 1]));
            }
            // This is an implied JumpToken;
            goto J0x331;
        }
        // End:0x327
        else
        {
            // End:0x327
            if(i < 5)
            {
                t = t $ GetItemName(string(RouteCache[i])) $ "-";
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29e;
    }
    J0x331:
    Canvas.DrawText("RouteCache: " $ t, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function float AdjustDesireFor(Pickup P)
{
    return 0.0;
}

function int GetFacingDirection()
{
    local float strafeMag;
    local Vector Focus2D, Loc2D, Dest2D, Dir, LookDir, Y;

    Focus2D = FocalPoint;
    Focus2D.Z = 0.0;
    Loc2D = Pawn.Location;
    Loc2D.Z = 0.0;
    Dest2D = Destination;
    Dest2D.Z = 0.0;
    LookDir = Normal(Focus2D - Loc2D);
    Dir = Normal(Dest2D - Loc2D);
    strafeMag = LookDir Dot Dir;
    Y = LookDir Cross vect(0.0, 0.0, 1.0);
    // End:0xe6
    if(Y Dot Dest2D - Loc2D < float(0))
    {
        return int(float(49152) + float(16384) * strafeMag);
    }
    // End:0x100
    else
    {
        return int(float(16384) - float(16384) * strafeMag);
    }
}

event AdjustView(float DeltaTime)
{
    local float TargetYaw, TargetPitch;
    local Rotator OldViewRotation, ViewRotation;

    super.AdjustView(DeltaTime);
    // End:0x21
    if(!Pawn.bUpdateEyeheight)
    {
        return;
    }
    ViewRotation = Rotation;
    OldViewRotation = Rotation;
    // End:0x20f
    if(Enemy == none)
    {
        ViewRotation.Roll = 0;
        // End:0x20f
        if(DeltaTime < 0.20)
        {
            OldViewRotation.Yaw = OldViewRotation.Yaw & 65535;
            OldViewRotation.Pitch = OldViewRotation.Pitch & 65535;
            TargetYaw = float(Rotation.Yaw & 65535);
            // End:0x104
            if(Abs(TargetYaw - float(OldViewRotation.Yaw)) > float(32768))
            {
                // End:0xf6
                if(TargetYaw < float(OldViewRotation.Yaw))
                {
                    TargetYaw += float(65536);
                }
                // End:0x104
                else
                {
                    TargetYaw -= float(65536);
                }
            }
            TargetYaw = float(OldViewRotation.Yaw) * float(1) - float(5) * DeltaTime + TargetYaw * float(5) * DeltaTime;
            ViewRotation.Yaw = int(TargetYaw);
            TargetPitch = float(Rotation.Pitch & 65535);
            // End:0x1bd
            if(Abs(TargetPitch - float(OldViewRotation.Pitch)) > float(32768))
            {
                // End:0x1af
                if(TargetPitch < float(OldViewRotation.Pitch))
                {
                    TargetPitch += float(65536);
                }
                // End:0x1bd
                else
                {
                    TargetPitch -= float(65536);
                }
            }
            TargetPitch = float(OldViewRotation.Pitch) * float(1) - float(5) * DeltaTime + TargetPitch * float(5) * DeltaTime;
            ViewRotation.Pitch = int(TargetPitch);
            SetRotation(ViewRotation);
        }
    }
}

function SetOrders(name NewOrders, Controller OrderGiver);
function Actor GetOrderObject()
{
    return none;
}

function name GetOrders()
{
    return 'None';
}

event PrepareForMove(NavigationPoint Goal, ReachSpec Path);
function WaitForMover(Mover M)
{
    // End:0x37
    if(Enemy != none && Level.TimeSeconds - LastSeenTime < 3.0)
    {
        Focus = Enemy;
    }
    PendingMover = M;
    bPreparingMove = true;
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
}

function MoverFinished()
{
    // End:0x2f
    if(PendingMover.myMarker.ProceedWithMove(Pawn))
    {
        PendingMover = none;
        bPreparingMove = false;
    }
}

function UnderLift(Mover M)
{
    local NavigationPoint N;

    bPreparingMove = false;
    PendingMover = none;
    // End:0xbc
    if(MoveTarget == none || MoveTarget.IsA('LiftCenter'))
    {
        N = Level.NavigationPointList;
        J0x44:
        // End:0xbc [While If]
        if(N != none)
        {
            // End:0xa5
            if(N.IsA('LiftExit') && LiftExit(N).LiftTag == M.Tag && actorReachable(N))
            {
                MoveTarget = N;
                return;
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x44;
        }
    }
}

function bool PriorityObjective()
{
    return false;
}

function Startle(Actor A);

defaultproperties
{
    bAdjustFromWalls=true
    bCanOpenDoors=true
    bCanDoSpecial=true
    MinHitWall=-0.50
}