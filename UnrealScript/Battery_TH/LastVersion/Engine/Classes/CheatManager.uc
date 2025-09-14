class CheatManager extends Object within PlayerController
    native;

var Rotator LockedRotation;
var bool bCheatsEnabled;

exec function ReviewJumpSpots(name TestLabel)
{
    // End:0x1D
    if(TestLabel == 'Transloc')
    {
        TestLabel = 'Begin';        
    }
    else
    {
        // End:0x3A
        if(TestLabel == 'Jump')
        {
            TestLabel = 'Finished';            
        }
        else
        {
            // End:0x57
            if(TestLabel == 'Combo')
            {
                TestLabel = 'FinishedJumping';                
            }
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
    //return;    
}

exec function ListDynamicActors()
{
    local Actor A;
    local int i;

    // End:0x33
    foreach Outer.DynamicActors(Class'Engine.Actor', A)
    {
        i++;
        Log(string(i) @ string(A));        
    }    
    Log("Num dynamic actors: " $ string(i));
    //return;    
}

exec function Pause(bool bPause)
{
    Outer.Level.Game.SetPause(bPause, Outer);
    Outer.Level.PauseDelay = Outer.Level.TimeSeconds;
    //return;    
}

exec function FreezeFrame(float Delay)
{
    Outer.Level.Game.SetPause(true, Outer);
    Outer.Level.PauseDelay = Outer.Level.TimeSeconds + Delay;
    //return;    
}

exec function WriteToLog(string Param)
{
    Log("NOW!" $ Eval(Param != "", (" '" $ Param) $ "'", ""));
    //return;    
}

exec function SetFlash(float f)
{
    Outer.FlashScale.X = f;
    //return;    
}

exec function SetFogR(float f)
{
    Outer.FlashFog.X = f;
    //return;    
}

exec function SetFogG(float f)
{
    Outer.FlashFog.Y = f;
    //return;    
}

exec function SetFogB(float f)
{
    Outer.FlashFog.Z = f;
    //return;    
}

exec function KillViewedActor()
{
    // End:0xB0
    if(Outer.ViewTarget != none)
    {
        // End:0x74
        if((Pawn(Outer.ViewTarget) != none) && Pawn(Outer.ViewTarget).Controller != none)
        {
            Pawn(Outer.ViewTarget).Controller.Destroy();
        }
        Outer.ViewTarget.Destroy();
        Outer.SetViewTarget(none);
        ReportCheat("KillViewedActor");
    }
    //return;    
}

exec function LogScriptedSequences()
{
    local AIScript S;

    // End:0x3B
    foreach Outer.AllActors(Class'Engine.AIScript', S)
    {
        S.bLoggingEnabled = !S.bLoggingEnabled;        
    }    
    //return;    
}

exec function Teleport()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation;

    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    HitActor = Outer.Trace(HitLocation, HitNormal, Outer.ViewTarget.Location + (float(10000) * Vector(Outer.Rotation)), Outer.ViewTarget.Location, true);
    // End:0xB9
    if(HitActor == none)
    {
        HitLocation = Outer.ViewTarget.Location + (float(10000) * Vector(Outer.Rotation));        
    }
    else
    {
        HitLocation = HitLocation + (Outer.ViewTarget.CollisionRadius * HitNormal);
    }
    Outer.ViewTarget.SetLocation(HitLocation);
    ReportCheat("Teleport");
    //return;    
}

exec function ChangeSize(float f)
{
    // End:0x9D
    if(Outer.Pawn.SetCollisionSize(Outer.Pawn.default.CollisionRadius * f, Outer.Pawn.default.CollisionHeight * f))
    {
        Outer.Pawn.SetDrawScale(f);
        Outer.Pawn.SetLocation(Outer.Pawn.Location);
    }
    //return;    
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
    else
    {
        Outer.SetViewTarget(Outer.Pawn);
    }
    Outer.bCameraPositionLocked = !Outer.bCameraPositionLocked;
    Outer.bBehindView = Outer.bCameraPositionLocked;
    Outer.bFreeCamera = false;
    //return;    
}

exec function SetCameraDist(float f)
{
    Outer.CameraDist = FMax(f, 2.0000000);
    //return;    
}

exec function EndPath()
{
    //return;    
}

exec function FreeCamera(bool B)
{
    Outer.bFreeCamera = B;
    Outer.bBehindView = B;
    //return;    
}

exec function CauseEvent(name EventName)
{
    Outer.TriggerEvent(EventName, Outer.Pawn, Outer.Pawn);
    //return;    
}

exec function Amphibious()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.UnderWaterTime = 999999.0000000;
    ReportCheat("Amphibious");
    //return;    
}

exec function Fly()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x90
    if((Outer.Pawn != none) && Outer.Pawn.CheatFly())
    {
        Outer.ClientMessage("You feel much lighter");
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');
        ReportCheat("Fly");
    }
    //return;    
}

exec function Walk()
{
    Outer.bCheatFlying = false;
    // End:0x5F
    if((Outer.Pawn != none) && Outer.Pawn.CheatWalk())
    {
        Outer.ClientReStart(Outer.Pawn);
    }
    //return;    
}

exec function Ghost()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x8E
    if((Outer.Pawn != none) && Outer.Pawn.CheatGhost())
    {
        Outer.ClientMessage("You feel ethereal");
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');
        ReportCheat("Ghost");
    }
    //return;    
}

exec function AllAmmo()
{
    local Inventory Inv;

    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Inv = Outer.Pawn.Inventory;
    J0x2A:

    // End:0x70 [Loop If]
    if(Inv != none)
    {
        // End:0x59
        if(wWeapon(Inv) != none)
        {
            wWeapon(Inv).SuperMaxOutAmmo();
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x2A;
    }
    Outer.AwardAdrenaline(999.0000000);
    ReportCheat("AllAmmo");
    //return;    
}

exec function Invisible(bool B)
{
    // End:0x0D
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
    else
    {
        Outer.Pawn.Visibility = Outer.Pawn.default.Visibility;
    }
    ReportCheat("Invisible");
    //return;    
}

exec function Phil()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x5C
    if(!Outer.bGodMode)
    {
        Outer.bGodMode = true;
        Outer.ClientMessage("phil == god");
        ReportCheat("God");        
    }
    else
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("you're not phil!");
    }
    //return;    
}

exec function God()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x4F
    if(Outer.bGodMode)
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("God mode off");
        return;
    }
    Outer.bGodMode = true;
    Outer.ClientMessage("God Mode on");
    ReportCheat("God");
    //return;    
}

exec function SloMo(float t)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    doSlomo(t);
    //return;    
}

function doSlomo(float t)
{
    Outer.Level.Game.SetGameSpeed(t);
    Outer.Level.Game.SaveConfig();
    Outer.Level.Game.GameReplicationInfo.SaveConfig();
    ReportCheat("SloMo");
    //return;    
}

exec function SetJumpZ(float f)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.JumpZ = f;
    ReportCheat("SetJumpZ");
    //return;    
}

exec function SetJumpLandDrop(float f)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.wMyParam.Land_Dropspeed_Rate = f;
    ReportCheat("SetSpeedLandDrop");
    //return;    
}

exec function SetGravity(float f)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.PhysicsVolume.Gravity.Z = f;
    ReportCheat("SetGravity");
    //return;    
}

exec function SetPriction(float f)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.PhysicsVolume.GroundFriction = f;
    ReportCheat("SetGroundFriction");
    //return;    
}

exec function SetSpeed(float f)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Pawn.GroundSpeed = Outer.Pawn.default.GroundSpeed * f;
    Outer.Pawn.WaterSpeed = Outer.Pawn.default.WaterSpeed * f;
    ReportCheat("SetSpeed");
    //return;    
}

exec function KillPawns()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.KillAllPawns(Class'Engine.Pawn');
    ReportCheat("KillPawns");
    //return;    
}

exec function Avatar(string ClassName)
{
    local Class<Actor> NewClass;
    local Pawn P;

    NewClass = Class<Actor>(DynamicLoadObject(ClassName, Class'Core.Class'));
    // End:0xD6
    if(NewClass != none)
    {
        // End:0xD5
        foreach Outer.DynamicActors(Class'Engine.Pawn', P)
        {
            // End:0xD4
            if((P.Class == NewClass) && P != Outer.Pawn)
            {
                // End:0xBD
                if(Outer.Pawn.Controller != none)
                {
                    Outer.Pawn.Controller.PawnDied(Outer.Pawn);
                }
                Outer.Possess(P);
                // End:0xD5
                break;
            }            
        }        
    }
    //return;    
}

exec function Summon(string ClassName)
{
    local Class<Actor> NewClass;
    local Vector SpawnLoc;

    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Log("Fabricate " $ ClassName);
    NewClass = Class<Actor>(DynamicLoadObject(ClassName, Class'Core.Class'));
    // End:0xD5
    if(NewClass != none)
    {
        // End:0x7C
        if(Outer.Pawn != none)
        {
            SpawnLoc = Outer.Pawn.Location;            
        }
        else
        {
            SpawnLoc = Outer.Location;
        }
        Outer.Spawn(NewClass,,, (SpawnLoc + (float(72) * Vector(Outer.Rotation))) + (vect(0.0000000, 0.0000000, 1.0000000) * float(15)));
    }
    ReportCheat("Summon");
    //return;    
}

exec function PlayersOnly()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
    ReportCheat("PlayersOnly");
    //return;    
}

exec function FreezeAll()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
    Outer.Level.bFreezeKarma = Outer.Level.bPlayersOnly;
    ReportCheat("FreezeAll");
    //return;    
}

exec function ClearAllDebugLines()
{
    local Actor A;

    // End:0x29
    foreach Outer.AllActors(Class'Engine.Actor', A)
    {
        A.ClearStayingDebugLines();        
    }    
    //return;    
}

exec function CheatView(Class<Actor> aClass, optional bool bQuiet)
{
    ViewClass(aClass, bQuiet, true);
    //return;    
}

exec function RememberSpot()
{
    // End:0x3D
    if(Outer.Pawn != none)
    {
        Outer.Destination = Outer.Pawn.Location;        
    }
    else
    {
        Outer.Destination = Outer.Location;
    }
    //return;    
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
    //return;    
}

exec function ViewPlayer(string S)
{
    local Controller P;

    P = Outer.Level.ControllerList;
    J0x1D:

    // End:0x77 [Loop If]
    if(P != none)
    {
        // End:0x60
        if(P.bIsPlayer && P.PlayerReplicationInfo.PlayerName ~= S)
        {
            // [Explicit Break]
            goto J0x77;
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x1D;
    }
    J0x77:

    // End:0xE3
    if(P.Pawn != none)
    {
        Outer.ClientMessage(Outer.ViewingFrom @ P.PlayerReplicationInfo.PlayerName, 'Event');
        Outer.SetViewTarget(P.Pawn);
    }
    Outer.bBehindView = Outer.ViewTarget != Outer.Pawn;
    // End:0x13B
    if(Outer.bBehindView)
    {
        Outer.ViewTarget.BecomeViewTarget();
    }
    //return;    
}

exec function ViewActor(name ActorName)
{
    local Actor A;

    // End:0x5A
    foreach Outer.AllActors(Class'Engine.Actor', A)
    {
        // End:0x59
        if(A.Name == ActorName)
        {
            Outer.SetViewTarget(A);
            Outer.bBehindView = true;            
            return;
        }        
    }    
    //return;    
}

exec function ViewFlag()
{
    local Controller C;

    C = Outer.Level.ControllerList;
    J0x1D:

    // End:0xA7 [Loop If]
    if(C != none)
    {
        // End:0x90
        if((C.IsA('AIController') && C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none)
        {
            Outer.SetViewTarget(C.Pawn);
            return;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

exec function VH()
{
    Outer.ConsoleCommand("ViewClass wHelicopter");
    //return;    
}

exec function VHD()
{
    Outer.ConsoleCommand("ViewClass wHelicopter");
    Outer.ConsoleCommand("showdebug");
    //return;    
}

exec function VAI()
{
    ViewNext('wAIBot');
    //return;    
}

exec function ViewBot()
{
    ViewNext('Bot');
    //return;    
}

function ViewNext(name nameController)
{
    local Actor first;
    local bool bFound;
    local Controller C;

    Outer.bViewBot = true;
    C = Outer.Level.ControllerList;
    J0x2E:

    // End:0xC7 [Loop If]
    if(C != none)
    {
        // End:0xB0
        if(C.IsA(nameController) && C.Pawn != none)
        {
            // End:0x90
            if(bFound || first == none)
            {
                first = C;
                // End:0x90
                if(bFound)
                {
                    // [Explicit Break]
                    goto J0xC7;
                }
            }
            // End:0xB0
            if(C == Outer.RealViewTarget)
            {
                bFound = true;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x2E;
    }
    J0xC7:

    // End:0x121
    if(first != none)
    {
        Outer.SetViewTarget(first);
        Outer.bBehindView = true;
        Outer.ViewTarget.BecomeViewTarget();
        Outer.FixFOV();        
    }
    else
    {
        ViewSelf(true);
    }
    //return;    
}

exec function ViewTurret()
{
    local Actor first;
    local bool bFound;
    local Controller C;

    Outer.bViewBot = true;
    C = Outer.Level.ControllerList;
    J0x2E:

    // End:0xF1 [Loop If]
    if(C != none)
    {
        // End:0xDA
        if((C.IsA('AIController') && C.Pawn != none) && !C.IsA('Bot'))
        {
            // End:0xB1
            if(bFound || first == none)
            {
                first = C.Pawn;
                // End:0xB1
                if(bFound)
                {
                    // [Explicit Break]
                    goto J0xF1;
                }
            }
            // End:0xDA
            if(C.Pawn == Outer.ViewTarget)
            {
                bFound = true;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x2E;
    }
    J0xF1:

    // End:0x14B
    if(first != none)
    {
        Outer.SetViewTarget(first);
        Outer.bBehindView = true;
        Outer.ViewTarget.BecomeViewTarget();
        Outer.FixFOV();        
    }
    else
    {
        ViewSelf(true);
    }
    //return;    
}

exec function ViewClass(Class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
    local Actor Other, first;
    local bool bFound;

    // End:0x54
    if((!bCheat && Outer.Level.Game != none) && !Outer.Level.Game.bCanViewOthers)
    {
        return;
    }
    first = none;
    // End:0xC2
    foreach Outer.AllActors(aClass, Other)
    {
        // End:0xA1
        if(bFound || first == none)
        {
            first = Other;
            // End:0xA1
            if(bFound)
            {
                // End:0xC2
                break;
            }
        }
        // End:0xC1
        if(Other == Outer.ViewTarget)
        {
            bFound = true;
        }        
    }    
    // End:0x1BF
    if(first != none)
    {
        // End:0x14A
        if(!bQuiet)
        {
            // End:0x11F
            if(Pawn(first) != none)
            {
                Outer.ClientMessage(Outer.ViewingFrom @ first.GetHumanReadableName(), 'Event');                
            }
            else
            {
                Outer.ClientMessage(Outer.ViewingFrom @ string(first), 'Event');
            }
        }
        Outer.SetViewTarget(first);
        Outer.bBehindView = Outer.ViewTarget != Outer;
        // End:0x1AD
        if(Outer.bBehindView)
        {
            Outer.ViewTarget.BecomeViewTarget();
        }
        Outer.FixFOV();        
    }
    else
    {
        ViewSelf(bQuiet);
    }
    //return;    
}

exec function Loaded()
{
    local Inventory Inv;

    // End:0x0D
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
        J0x4A:

        // End:0x90 [Loop If]
        if(Inv != none)
        {
            // End:0x79
            if(wWeapon(Inv) != none)
            {
                wWeapon(Inv).Loaded();
            }
            Inv = Inv.Inventory;
            // [Loop Continue]
            goto J0x4A;
        }
    }
    ReportCheat("Loaded");
    //return;    
}

exec function AllWeapons()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x3E
    if((Outer.Pawn == none) || Vehicle(Outer.Pawn) != none)
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
    //return;    
}

exec function SkipMatch()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x47
    if((int(Outer.Level.NetMode) != int(NM_Standalone)) || Outer.Pawn == none)
    {
        return;
    }
    ReportCheat("SkipMatch");
    // End:0xBF
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.CheatSkipMatch(Outer.Level.Game);
    }
    //return;    
}

exec function JumpMatch(int ladderrung)
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    // End:0x47
    if((int(Outer.Level.NetMode) != int(NM_Standalone)) || Outer.Pawn == none)
    {
        return;
    }
    // End:0x54
    if(ladderrung < 0)
    {
        return;
    }
    ReportCheat("JumpMatch");
    // End:0xD1
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.CheatJumpMatch(Outer.Level.Game, ladderrung);
    }
    //return;    
}

exec function WinMatch()
{
    // End:0x0D
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
    else
    {
        Outer.PlayerReplicationInfo.Score = float(Outer.Level.Game.GoalScore);
    }
    Outer.Level.Game.CheckScore(Outer.PlayerReplicationInfo);
    //return;    
}

exec function EnableCheats()
{
    bCheatsEnabled = !bCheatsEnabled;
    // End:0x3A
    if(bCheatsEnabled)
    {
        Outer.ClientMessage("Cheats enabled");        
    }
    else
    {
        Outer.ClientMessage("Cheats unenabled");
    }
    //return;    
}

function bool areCheatsEnabled()
{
    // End:0xD5
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        // End:0xCE
        if(!bCheatsEnabled)
        {
            Outer.ClientMessage("Cheats are NOT enabled, to enable cheats type: EnableCheats");
            Outer.ClientMessage("Enabling cheats prevents you from unlocking the bonus characters");
        }
        return bCheatsEnabled;
    }
    return true;
    //return;    
}

function ReportCheat(optional string cheat)
{
    // End:0x5A
    if(Outer.Level.Game.CurrentGameProfile != none)
    {
        Outer.Level.Game.CurrentGameProfile.ReportCheat(Outer, cheat);
    }
    //return;    
}

exec function WeakObjectives()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("WeakObjectives");
    Outer.Level.Game.WeakObjectives();
    //return;    
}

exec function DisableNextObjective()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("DisableNextObjective");
    Outer.Level.Game.DisableNextObjective();
    //return;    
}

exec function ruler()
{
    local NavigationPoint N;

    // End:0x4B
    foreach Outer.AllActors(Class'Engine.NavigationPoint', N)
    {
        // End:0x4A
        if(N.IsA('ONSPowerCore'))
        {
            N.Bump(Outer.Pawn);
        }        
    }    
    //return;    
}

exec function ShowAllPlayers()
{
    // End:0x0D
    if(!areCheatsEnabled())
    {
        return;
    }
    ReportCheat("ShowAllPlayers");
    Outer.bShowAllPlayers = !Outer.bShowAllPlayers;
    //return;    
}
