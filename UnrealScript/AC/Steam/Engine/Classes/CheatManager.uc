/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CheatManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:64
 *
 *******************************************************************************/
class CheatManager extends Object within PlayerController
    native;

var Rotator LockedRotation;
var bool bCheatsEnabled;

exec function ReviewJumpSpots(name TestLabel)
{
    // End:0x1d
    if(TestLabel == 'Transloc')
    {
        TestLabel = 'Begin';
    }
    // End:0x71
    else
    {
        // End:0x3a
        if(TestLabel == 'Jump')
        {
            TestLabel = 'Finished';
        }
        // End:0x71
        else
        {
            // End:0x57
            if(TestLabel == 'Combo')
            {
                TestLabel = 'FinishedJumping';
            }
            // End:0x71
            else
            {
                // End:0x71
                if(TestLabel == 'LowGrav')
                {
                    TestLabel = 'FinishedComboJumping';
                }
            }
        }
    }
    Log("TestLabel is " $ string(TestLabel));
    Outer.Level.Game.ReviewJumpSpots(TestLabel);
}

exec function ListDynamicActors()
{
    local Actor A;
    local int i;

    // End:0x33
    foreach Outer.DynamicActors(class'Actor', A)
    {
        ++ i;
        Log(string(i) @ string(A));                
    }
    Log("Num dynamic actors: " $ string(i));
}

exec function Pause(bool bPause)
{
    Outer.Level.Game.SetPause(bPause, Outer);
    Outer.Level.PauseDelay = Outer.Level.TimeSeconds;
}

exec function FreezeFrame(float Delay)
{
    Outer.Level.Game.SetPause(true, Outer);
    Outer.Level.PauseDelay = Outer.Level.TimeSeconds + Delay;
}

exec function WriteToLog(string Param)
{
    Log("NOW!" $ Eval(Param != "", " '" $ Param $ "'", ""));
}

exec function SetFlash(float f)
{
    Outer.FlashScale.X = f;
}

exec function SetFogR(float f)
{
    Outer.FlashFog.X = f;
}

exec function SetFogG(float f)
{
    Outer.FlashFog.Y = f;
}

exec function SetFogB(float f)
{
    Outer.FlashFog.Z = f;
}

exec function KillViewedActor()
{
    // End:0xb0
    if(Outer.ViewTarget != none)
    {
        // End:0x74
        if(Pawn(Outer.ViewTarget) != none && Pawn(Outer.ViewTarget).Controller != none)
        {
            Pawn(Outer.ViewTarget).Controller.Destroy();
        }
        Outer.ViewTarget.Destroy();
        Outer.SetViewTarget(none);
        ReportCheat("KillViewedActor");
    }
}

exec function LogScriptedSequences()
{
    local AIScript S;

    // End:0x3b
    foreach Outer.AllActors(class'AIScript', S)
    {
        S.bLoggingEnabled = !S.bLoggingEnabled;                
    }
}

exec function Teleport()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation;

    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    HitActor = Outer.Trace(HitLocation, HitNormal, Outer.ViewTarget.Location + float(10000) * vector(Outer.Rotation), Outer.ViewTarget.Location, true);
    // End:0xb9
    if(HitActor == none)
    {
        HitLocation = Outer.ViewTarget.Location + float(10000) * vector(Outer.Rotation);
    }
    // End:0xe4
    else
    {
        HitLocation = HitLocation + Outer.ViewTarget.CollisionRadius * HitNormal;
    }
    Outer.ViewTarget.SetLocation(HitLocation);
    ReportCheat("Teleport");
}

exec function ChangeSize(float f)
{
    // End:0x9d
    if(Outer.Pawn.SetCollisionSize(Outer.Pawn.default.CollisionRadius * f, Outer.Pawn.default.CollisionHeight * f))
    {
        Outer.Pawn.SetDrawScale(f);
        Outer.Pawn.SetLocation(Outer.Pawn.Location);
    }
}

exec function LockCamera()
{
    local Vector LockedLocation;
    local Rotator LockedRot;
    local Actor LockedActor;

    // End:0x65
    if(!Outer.bCameraPositionLocked)
    {
        Outer.PlayerCalcView(LockedActor, LockedLocation, LockedRot);
        Outer.SetLocation(LockedLocation);
        LockedRotation = LockedRot;
        Outer.SetViewTarget(Outer);
    }
    // End:0x82
    else
    {
        Outer.SetViewTarget(Outer.Pawn);
    }
    Outer.bCameraPositionLocked = !Outer.bCameraPositionLocked;
    Outer.bBehindView = Outer.bCameraPositionLocked;
    Outer.bFreeCamera = false;
}

exec function SetCameraDist(float f)
{
    Outer.CameraDist = FMax(f, 2.0);
}

exec function EndPath();
exec function FreeCamera(bool B)
{
    Outer.bFreeCamera = B;
    Outer.bBehindView = B;
}

exec function CauseEvent(name EventName)
{
    Outer.TriggerEvent(EventName, Outer.Pawn, Outer.Pawn);
}

exec function Amphibious()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.UnderWaterTime = 999999.0;
    ReportCheat("Amphibious");
}

exec function Fly()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x90
    if(Outer.Pawn != none && Outer.Pawn.CheatFly())
    {
        Outer.ClientMessage("You feel much lighter");
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');
        ReportCheat("Fly");
    }
}

exec function Walk()
{
    Outer.bCheatFlying = false;
    // End:0x5f
    if(Outer.Pawn != none && Outer.Pawn.CheatWalk())
    {
        Outer.ClientReStart(Outer.Pawn);
    }
}

exec function Ghost()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x8e
    if(Outer.Pawn != none && Outer.Pawn.CheatGhost())
    {
        Outer.ClientMessage("You feel ethereal");
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');
        ReportCheat("Ghost");
    }
}

exec function AllAmmo()
{
    local Inventory Inv;

    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Inv = Outer.Pawn.Inventory;
    J0x2a:
    // End:0x70 [While If]
    if(Inv != none)
    {
        // End:0x59
        if(wWeapon(Inv) != none)
        {
            wWeapon(Inv).SuperMaxOutAmmo();
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    Outer.AwardAdrenaline(999.0);
    ReportCheat("AllAmmo");
}

exec function Invisible(bool B)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.bHidden = B;
    // End:0x52
    if(B)
    {
        Outer.Pawn.Visibility = 0;
    }
    // End:0x81
    else
    {
        Outer.Pawn.Visibility = Outer.Pawn.default.Visibility;
    }
    ReportCheat("Invisible");
}

exec function Phil()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x5c
    if(!Outer.bGodMode)
    {
        Outer.bGodMode = true;
        Outer.ClientMessage("phil == god");
        ReportCheat("God");
    }
    // End:0x8e
    else
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("you're not phil!");
    }
}

exec function God()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x4f
    if(Outer.bGodMode)
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("God mode off");
        return;
    }
    Outer.bGodMode = true;
    Outer.ClientMessage("God Mode on");
    ReportCheat("God");
}

exec function SloMo(float t)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    doSlomo(t);
}

function doSlomo(float t)
{
    Outer.Level.Game.SetGameSpeed(t);
    Outer.Level.Game.SaveConfig();
    Outer.Level.Game.GameReplicationInfo.SaveConfig();
    ReportCheat("SloMo");
}

exec function SetJumpZ(float f)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.JumpZ = f;
    ReportCheat("SetJumpZ");
}

exec function SetJumpLandDrop(float f)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.wMyParam.Land_Dropspeed_Rate = f;
    ReportCheat("SetSpeedLandDrop");
}

exec function SetGravity(float f)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.PhysicsVolume.Gravity.Z = f;
    ReportCheat("SetGravity");
}

exec function SetPriction(float f)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.PhysicsVolume.GroundFriction = f;
    ReportCheat("SetGroundFriction");
}

exec function SetSpeed(float f)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.GroundSpeed = Outer.Pawn.default.GroundSpeed * f;
    Outer.Pawn.WaterSpeed = Outer.Pawn.default.WaterSpeed * f;
    ReportCheat("SetSpeed");
}

exec function KillPawns()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.KillAllPawns(class'Pawn');
    ReportCheat("KillPawns");
}

exec function Avatar(string ClassName)
{
    local class<Actor> NewClass;
    local Pawn P;

    NewClass = class<Actor>(DynamicLoadObject(ClassName, class'Class'));
    // End:0xd6
    if(NewClass != none)
    {
        // End:0xd5
        foreach Outer.DynamicActors(class'Pawn', P)
        {
            // End:0xd4
            if(P.Class == NewClass && P != Outer.Pawn)
            {
                // End:0xbd
                if(Outer.Pawn.Controller != none)
                {
                    Outer.Pawn.Controller.PawnDied(Outer.Pawn);
                }
                Outer.Possess(P);
            }
            // End:0xd5
            else
            {
                continue;
            }            
        }
    }
}

exec function Summon(string ClassName)
{
    local class<Actor> NewClass;
    local Vector SpawnLoc;

    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Log("Fabricate " $ ClassName);
    NewClass = class<Actor>(DynamicLoadObject(ClassName, class'Class'));
    // End:0xd5
    if(NewClass != none)
    {
        // End:0x7c
        if(Outer.Pawn != none)
        {
            SpawnLoc = Outer.Pawn.Location;
        }
        // End:0x90
        else
        {
            SpawnLoc = Outer.Location;
        }
        Outer.Spawn(NewClass,,, SpawnLoc + float(72) * vector(Outer.Rotation) + vect(0.0, 0.0, 1.0) * float(15));
    }
    ReportCheat("Summon");
}

exec function PlayersOnly()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
    ReportCheat("PlayersOnly");
}

exec function FreezeAll()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
    Outer.Level.bFreezeKarma = Outer.Level.bPlayersOnly;
    ReportCheat("FreezeAll");
}

exec function ClearAllDebugLines()
{
    local Actor A;

    // End:0x29
    foreach Outer.AllActors(class'Actor', A)
    {
        A.ClearStayingDebugLines();                
    }
}

exec function CheatView(class<Actor> aClass, optional bool bQuiet)
{
    ViewClass(aClass, bQuiet, true);
}

exec function RememberSpot()
{
    // End:0x3d
    if(Outer.Pawn != none)
    {
        Outer.Destination = Outer.Pawn.Location;
    }
    // End:0x5a
    else
    {
        Outer.Destination = Outer.Location;
    }
}

exec function ViewSelf(optional bool bQuiet)
{
    Outer.bBehindView = false;
    Outer.bViewBot = false;
    // End:0x56
    if(Outer.Pawn != none)
    {
        Outer.SetViewTarget(Outer.Pawn);
    }
    // End:0x6a
    else
    {
        Outer.SetViewTarget(Outer);
    }
    // End:0x97
    if(!bQuiet)
    {
        Outer.ClientMessage(Outer.OwnCamera, 'Event');
    }
    Outer.FixFOV();
}

exec function ViewPlayer(string S)
{
    local Controller P;

    P = Outer.Level.ControllerList;
    J0x1d:
    // End:0x77 [While If]
    if(P != none)
    {
        // End:0x60
        if(P.bIsPlayer && P.PlayerReplicationInfo.PlayerName ~= S)
        {
        }
        // End:0x77
        else
        {
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
    }
    // End:0xe3
    if(P.Pawn != none)
    {
        Outer.ClientMessage(Outer.ViewingFrom @ P.PlayerReplicationInfo.PlayerName, 'Event');
        Outer.SetViewTarget(P.Pawn);
    }
    Outer.bBehindView = Outer.ViewTarget != Outer.Pawn;
    // End:0x13b
    if(Outer.bBehindView)
    {
        Outer.ViewTarget.BecomeViewTarget();
    }
}

exec function ViewActor(name ActorName)
{
    local Actor A;

    // End:0x5a
    foreach Outer.AllActors(class'Actor', A)
    {
        // End:0x59
        if(A.Name == ActorName)
        {
            Outer.SetViewTarget(A);
            Outer.bBehindView = true;
            break;
            return;
        }                
    }
}

exec function ViewFlag()
{
    local Controller C;

    C = Outer.Level.ControllerList;
    J0x1d:
    // End:0xa7 [While If]
    if(C != none)
    {
        // End:0x90
        if(C.IsA('AIController') && C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.HasFlag != none)
        {
            Outer.SetViewTarget(C.Pawn);
            return;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
}

exec function VH()
{
    Outer.ConsoleCommand("ViewClass wHelicopter");
}

exec function VHD()
{
    Outer.ConsoleCommand("ViewClass wHelicopter");
    Outer.ConsoleCommand("showdebug");
}

exec function VAI()
{
    ViewNext('wAIBot');
}

exec function ViewBot()
{
    ViewNext('Bot');
}

function ViewNext(name nameController)
{
    local Actor first;
    local bool bFound;
    local Controller C;

    Outer.bViewBot = true;
    C = Outer.Level.ControllerList;
    J0x2e:
    // End:0xc7 [While If]
    if(C != none)
    {
        // End:0xb0
        if(C.IsA(nameController) && C.Pawn != none)
        {
            // End:0x90
            if(bFound || first == none)
            {
                first = C;
                // End:0x90
                if(bFound)
                {
                }
                // End:0xc7
                else
                {
                }
                // End:0xb0
                if(C == Outer.RealViewTarget)
                {
                    bFound = true;
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
    }
    // End:0x121
    if(first != none)
    {
        Outer.SetViewTarget(first);
        Outer.bBehindView = true;
        Outer.ViewTarget.BecomeViewTarget();
        Outer.FixFOV();
    }
    // End:0x128
    else
    {
        ViewSelf(true);
    }
}

exec function ViewTurret()
{
    local Actor first;
    local bool bFound;
    local Controller C;

    Outer.bViewBot = true;
    C = Outer.Level.ControllerList;
    J0x2e:
    // End:0xf1 [While If]
    if(C != none)
    {
        // End:0xda
        if(C.IsA('AIController') && C.Pawn != none && !C.IsA('Bot'))
        {
            // End:0xb1
            if(bFound || first == none)
            {
                first = C.Pawn;
                // End:0xb1
                if(bFound)
                {
                }
                // End:0xf1
                else
                {
                }
                // End:0xda
                if(C.Pawn == Outer.ViewTarget)
                {
                    bFound = true;
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
    }
    // End:0x14b
    if(first != none)
    {
        Outer.SetViewTarget(first);
        Outer.bBehindView = true;
        Outer.ViewTarget.BecomeViewTarget();
        Outer.FixFOV();
    }
    // End:0x152
    else
    {
        ViewSelf(true);
    }
}

exec function ViewClass(class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
    local Actor Other, first;
    local bool bFound;

    // End:0x54
    if(!bCheat && Outer.Level.Game != none && !Outer.Level.Game.bCanViewOthers)
    {
        return;
    }
    first = none;
    // End:0xc2
    foreach Outer.AllActors(aClass, Other)
    {
        // End:0xa1
        if(bFound || first == none)
        {
            first = Other;
            // End:0xa1
            if(bFound)
            {
            }
            // End:0xc2
            else
            {
            }
            // End:0xc1
            if(Other == Outer.ViewTarget)
            {
                bFound = true;
            }
            continue;
        }        
    }
    // End:0x1bf
    if(first != none)
    {
        // End:0x14a
        if(!bQuiet)
        {
            // End:0x11f
            if(Pawn(first) != none)
            {
                Outer.ClientMessage(Outer.ViewingFrom @ first.GetHumanReadableName(), 'Event');
            }
            // End:0x14a
            else
            {
                Outer.ClientMessage(Outer.ViewingFrom @ string(first), 'Event');
            }
        }
        Outer.SetViewTarget(first);
        Outer.bBehindView = Outer.ViewTarget != Outer;
        // End:0x1ad
        if(Outer.bBehindView)
        {
            Outer.ViewTarget.BecomeViewTarget();
        }
        Outer.FixFOV();
    }
    // End:0x1cb
    else
    {
        ViewSelf(bQuiet);
    }
}

exec function Loaded()
{
    local Inventory Inv;

    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    AllWeapons();
    AllAmmo();
    // End:0x90
    if(Outer.Pawn != none)
    {
        Inv = Outer.Pawn.Inventory;
        J0x4a:
        // End:0x90 [While If]
        if(Inv != none)
        {
            // End:0x79
            if(wWeapon(Inv) != none)
            {
                wWeapon(Inv).Loaded();
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x4a;
        }
    }
    ReportCheat("Loaded");
}

exec function AllWeapons()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x3e
    if(Outer.Pawn == none || Vehicle(Outer.Pawn) != none)
    {
        return;
    }
    Outer.Pawn.GiveWeapon("XWeapons.AssaultRifle");
    Outer.Pawn.GiveWeapon("XWeapons.RocketLauncher");
    Outer.Pawn.GiveWeapon("XWeapons.ShockRifle");
    Outer.Pawn.GiveWeapon("XWeapons.ShieldGun");
    Outer.Pawn.GiveWeapon("XWeapons.LinkGun");
    Outer.Pawn.GiveWeapon("XWeapons.SniperRifle");
    Outer.Pawn.GiveWeapon("XWeapons.FlakCannon");
    Outer.Pawn.GiveWeapon("XWeapons.MiniGun");
    Outer.Pawn.GiveWeapon("XWeapons.TransLauncher");
    Outer.Pawn.GiveWeapon("XWeapons.Painter");
    Outer.Pawn.GiveWeapon("XWeapons.BioRifle");
    Outer.Pawn.GiveWeapon("XWeapons.Redeemer");
    Outer.Pawn.GiveWeapon("UTClassic.ClassicSniperRifle");
    Outer.Pawn.GiveWeapon("Onslaught.ONSGrenadeLauncher");
    Outer.Pawn.GiveWeapon("Onslaught.ONSAVRiL");
    Outer.Pawn.GiveWeapon("Onslaught.ONSMineLayer");
    Outer.Pawn.GiveWeapon("OnslaughtFull.ONSPainter");
    ReportCheat("AllWeapons");
}

exec function SkipMatch()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x47
    if(Outer.Level.NetMode != 0 || Outer.Pawn == none)
    {
        return;
    }
    ReportCheat("SkipMatch");
    // End:0xbf
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.CheatSkipMatch(Outer.Level.Game);
    }
}

exec function JumpMatch(int ladderrung)
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x47
    if(Outer.Level.NetMode != 0 || Outer.Pawn == none)
    {
        return;
    }
    // End:0x54
    if(ladderrung < 0)
    {
        return;
    }
    ReportCheat("JumpMatch");
    // End:0xd1
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.CheatJumpMatch(Outer.Level.Game, ladderrung);
    }
}

exec function WinMatch()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("WinMatch");
    // End:0x80
    if(Outer.PlayerReplicationInfo.Team != none)
    {
        Outer.PlayerReplicationInfo.Team.Score = float(Outer.Level.Game.GoalScore);
    }
    // End:0xba
    else
    {
        Outer.PlayerReplicationInfo.Score = float(Outer.Level.Game.GoalScore);
    }
    Outer.Level.Game.CheckScore(Outer.PlayerReplicationInfo);
}

exec function EnableCheats()
{
    bCheatsEnabled = !bCheatsEnabled;
    // End:0x3a
    if(bCheatsEnabled)
    {
        Outer.ClientMessage("Cheats enabled");
    }
    // End:0x5b
    else
    {
        Outer.ClientMessage("Cheats unenabled");
    }
}

function bool areCheatsEnabled()
{
    // End:0xd5
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        // End:0xce
        if(!bCheatsEnabled)
        {
            Outer.ClientMessage("Cheats are NOT enabled, to enable cheats type: EnableCheats");
            Outer.ClientMessage("Enabling cheats prevents you from unlocking the bonus characters");
        }
        return bCheatsEnabled;
    }
    return true;
}

function ReportCheat(optional string cheat)
{
    // End:0x5a
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.ReportCheat(Outer, cheat);
    }
}

exec function WeakObjectives()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("WeakObjectives");
    Outer.Level.Game.WeakObjectives();
}

exec function DisableNextObjective()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("DisableNextObjective");
    Outer.Level.Game.DisableNextObjective();
}

exec function ruler()
{
    local NavigationPoint N;

    // End:0x4b
    foreach Outer.AllActors(class'NavigationPoint', N)
    {
        // End:0x4a
        if(N.IsA('ONSPowerCore'))
        {
            N.Bump(Outer.Pawn);
        }                
    }
}

exec function ShowAllPlayers()
{
    // End:0x0d
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("ShowAllPlayers");
    Outer.bShowAllPlayers = !Outer.bShowAllPlayers;
}
