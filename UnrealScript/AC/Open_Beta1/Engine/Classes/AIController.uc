class AIController extends Controller
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
    Skill = FClamp(Skill, 0.0000000, 3.0000000);
    //return;    
}

function Reset()
{
    bHunting = false;
    bPlannedJump = false;
    super.Reset();
    //return;    
}

simulated function float RateWeapon(wWeapon W)
{
    return W.GetAIRating() + (FRand() * 0.0500000);
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    TriggerScript(Other, EventInstigator);
    //return;    
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
    //return;    
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
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local int i;
    local string t;

    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawColor.B = byte(255);
    // End:0xEA
    if(((Pawn != none) && MoveTarget != none) && Pawn.ReachedDestination(MoveTarget))
    {
        Canvas.DrawText((((((("     Skill " $ string(Skill)) $ " NAVIGATION MoveTarget ") $ (GetItemName(string(MoveTarget)))) $ "(REACHED) PendingMover ") $ string(PendingMover)) $ " MoveTimer ") $ string(MoveTimer), false);        
    }
    else
    {
        Canvas.DrawText((((((("     Skill " $ string(Skill)) $ " NAVIGATION MoveTarget ") $ (GetItemName(string(MoveTarget)))) $ " PendingMover ") $ string(PendingMover)) $ " MoveTimer ") $ string(MoveTimer), false);
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    t = (("      Destination " $ string(Destination)) $ " Focus ") $ (GetItemName(string(Focus)));
    // End:0x1F5
    if(bPreparingMove)
    {
        t = t $ " (Preparing Move)";
    }
    Canvas.DrawText(t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("      RouteGoal " $ (GetItemName(string(RouteGoal)))) $ " RouteDist ") $ string(RouteDist), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    i = 0;
    J0x29E:

    // End:0x331 [Loop If]
    if(i < 16)
    {
        // End:0x2F6
        if(RouteCache[i] == none)
        {
            // End:0x2F0
            if(i > 5)
            {
                t = (t $ "--") $ (GetItemName(string(RouteCache[i - 1])));
            }
            // [Explicit Break]
            goto J0x331;
            // [Explicit Continue]
            goto J0x327;
        }
        // End:0x327
        if(i < 5)
        {
            t = (t $ (GetItemName(string(RouteCache[i])))) $ "-";
        }
        J0x327:

        i++;
        // [Loop Continue]
        goto J0x29E;
    }
    J0x331:

    Canvas.DrawText("RouteCache: " $ t, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function float AdjustDesireFor(Pickup P)
{
    return 0.0000000;
    //return;    
}

function int GetFacingDirection()
{
    local float strafeMag;
    local Vector Focus2D, Loc2D, Dest2D, Dir, LookDir, Y;

    Focus2D = FocalPoint;
    Focus2D.Z = 0.0000000;
    Loc2D = Pawn.Location;
    Loc2D.Z = 0.0000000;
    Dest2D = Destination;
    Dest2D.Z = 0.0000000;
    LookDir = Normal(Focus2D - Loc2D);
    Dir = Normal(Dest2D - Loc2D);
    strafeMag = LookDir Dot Dir;
    Y = LookDir Cross vect(0.0000000, 0.0000000, 1.0000000);
    // End:0xE6
    if((Y Dot (Dest2D - Loc2D)) < float(0))
    {
        return int(float(49152) + (float(16384) * strafeMag));        
    }
    else
    {
        return int(float(16384) - (float(16384) * strafeMag));
    }
    //return;    
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
    // End:0x20F
    if(Enemy == none)
    {
        ViewRotation.Roll = 0;
        // End:0x20F
        if(DeltaTime < 0.2000000)
        {
            OldViewRotation.Yaw = OldViewRotation.Yaw & 65535;
            OldViewRotation.Pitch = OldViewRotation.Pitch & 65535;
            TargetYaw = float(Rotation.Yaw & 65535);
            // End:0x104
            if(Abs(TargetYaw - float(OldViewRotation.Yaw)) > float(32768))
            {
                // End:0xF6
                if(TargetYaw < float(OldViewRotation.Yaw))
                {
                    TargetYaw += float(65536);                    
                }
                else
                {
                    TargetYaw -= float(65536);
                }
            }
            TargetYaw = (float(OldViewRotation.Yaw) * (float(1) - (float(5) * DeltaTime))) + ((TargetYaw * float(5)) * DeltaTime);
            ViewRotation.Yaw = int(TargetYaw);
            TargetPitch = float(Rotation.Pitch & 65535);
            // End:0x1BD
            if(Abs(TargetPitch - float(OldViewRotation.Pitch)) > float(32768))
            {
                // End:0x1AF
                if(TargetPitch < float(OldViewRotation.Pitch))
                {
                    TargetPitch += float(65536);                    
                }
                else
                {
                    TargetPitch -= float(65536);
                }
            }
            TargetPitch = (float(OldViewRotation.Pitch) * (float(1) - (float(5) * DeltaTime))) + ((TargetPitch * float(5)) * DeltaTime);
            ViewRotation.Pitch = int(TargetPitch);
            SetRotation(ViewRotation);
        }
    }
    //return;    
}

function SetOrders(name NewOrders, Controller OrderGiver)
{
    //return;    
}

function Actor GetOrderObject()
{
    return none;
    //return;    
}

function name GetOrders()
{
    return 'None';
    //return;    
}

event PrepareForMove(NavigationPoint Goal, ReachSpec Path)
{
    //return;    
}

function WaitForMover(Mover M)
{
    // End:0x37
    if((Enemy != none) && (Level.TimeSeconds - LastSeenTime) < 3.0000000)
    {
        Focus = Enemy;
    }
    PendingMover = M;
    bPreparingMove = true;
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function MoverFinished()
{
    // End:0x2F
    if(PendingMover.myMarker.ProceedWithMove(Pawn))
    {
        PendingMover = none;
        bPreparingMove = false;
    }
    //return;    
}

function UnderLift(Mover M)
{
    local NavigationPoint N;

    bPreparingMove = false;
    PendingMover = none;
    // End:0xBC
    if((MoveTarget == none) || MoveTarget.IsA('LiftCenter'))
    {
        N = Level.NavigationPointList;
        J0x44:

        // End:0xBC [Loop If]
        if(N != none)
        {
            // End:0xA5
            if((N.IsA('LiftExit') && LiftExit(N).LiftTag == M.Tag) && actorReachable(N))
            {
                MoveTarget = N;
                return;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x44;
        }
    }
    //return;    
}

function bool PriorityObjective()
{
    return false;
    //return;    
}

function Startle(Actor A)
{
    //return;    
}

defaultproperties
{
    bAdjustFromWalls=true
    bCanOpenDoors=true
    bCanDoSpecial=true
    MinHitWall=-0.5000000
}