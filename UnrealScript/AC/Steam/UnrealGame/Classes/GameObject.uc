/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\GameObject.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:23
 *	States:3
 *
 *******************************************************************************/
class GameObject extends Decoration
    dependson(DeathMatch)
    abstract;

var bool bHome;
var bool bHeld;
var bool bDisabled;
var bool bLastSecondSave;
var UnrealPawn Holder;
var TeamPlayerReplicationInfo HolderPRI;
var GameObjective HomeBase;
var float TakenTime;
var float MaxDropTime;
var Controller FirstTouch;
var array<Controller> Assists;
var name GameObjBone;
var Vector GameObjOffset;
var Rotator GameObjRot;
var TeamInfo OldTeam;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        bHome, bHeld,
        HolderPRI;

}

function PostBeginPlay()
{
    HomeBase = GameObjective(Owner);
    SetOwner(none);
    super(Actor).PostBeginPlay();
}

function ForceBegin()
{
    super(Actor).ForceBegin();
}

function bool CanBeThrownBy(Pawn P)
{
    return true;
}

function bool CanBePickedUpBy(Pawn P)
{
    return true;
}

function SetHolder(Controller C)
{
    local int i;

    LogTaken(C);
    Holder = UnrealPawn(C.Pawn);
    Holder.DeactivateSpawnProtection();
    HolderPRI = TeamPlayerReplicationInfo(Holder.PlayerReplicationInfo);
    C.PlayerReplicationInfo.HasFlag = self;
    C.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    GotoState('Held');
    C.MoveTimer = -1.0;
    Holder.MakeNoise(2.0);
    // End:0xd2
    if(FirstTouch == none)
    {
        FirstTouch = C;
    }
    i = 0;
    J0xd9:
    // End:0x10a [While If]
    if(i < Assists.Length)
    {
        // End:0x100
        if(Assists[i] == C)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd9;
    }
    Assists.Length = Assists.Length + 1;
    Assists[Assists.Length - 1] = C;
}

function Score()
{
    Disable('Touch');
    SetLocation(HomeBase.Location);
    SetRotation(HomeBase.Rotation);
    CalcSetHome();
    GotoState('home');
}

function Drop(Vector NewVel, optional string sReason)
{
    SetLocation(Holder.Location);
    LogDropped();
    Velocity = NewVel;
    GotoState('dropped');
}

function SendHome()
{
    CalcSetHome();
    GotoState('home');
}

function SendHomeDisabled(float TimeOut);
protected function CalcSetHome()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x5e [While If]
    if(C != none)
    {
        // End:0x47
        if(C.MoveTarget == self)
        {
            C.MoveTimer = -1.0;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    LogReturned();
    FirstTouch = none;
    J0x6b:
    // End:0x82 [While If]
    if(Assists.Length != 0)
    {
        Assists.Remove(0, 1);
        // This is an implied JumpToken; Continue!
        goto J0x6b;
    }
}

function ClearHolder()
{
    local int i;
    local GameReplicationInfo GRI;

    // End:0x0d
    if(Holder == none)
    {
        return;
    }
    // End:0xde
    if(Holder.PlayerReplicationInfo == none)
    {
        GRI = Level.Game.GameReplicationInfo;
        i = 0;
        J0x45:
        // End:0xdb [While If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0xd1
            if(GRI.PRIArray[i].HasFlag == self)
            {
                GRI.PRIArray[i].HasFlag = none;
                GRI.PRIArray[i].NetUpdateTime = Level.TimeSeconds - float(1);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
    }
    // End:0x122
    else
    {
        Holder.PlayerReplicationInfo.HasFlag = none;
        Holder.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    Holder = none;
    HolderPRI = none;
}

protected function SetDisable(bool Disable)
{
    bDisabled = Disable;
    bHidden = Disable;
}

function Actor Position()
{
    // End:0x0f
    if(bHeld)
    {
        return Holder;
    }
    // End:0x1e
    if(bHome)
    {
        return HomeBase;
    }
    return self;
}

function bool IsHome()
{
    return false;
}

function bool ValidHolder(Actor Other)
{
    local Pawn P;

    // End:0x0b
    if(bDisabled)
    {
        return false;
    }
    P = Pawn(Other);
    // End:0x6a
    if(P == none || P.Health <= 0 || !P.bCanPickupInventory || !P.IsPlayerPawn())
    {
        return false;
    }
    // End:0x10c
    if(Bot(P.Controller) != none && Bot(P.Controller).FormerVehicle != none && Bot(P.Controller).FormerVehicle.TeamUseTime > Level.TimeSeconds)
    {
        Bot(P.Controller).FormerVehicle.TeamUseTime = 0.0;
    }
    return true;
}

singular function Touch(Actor Other)
{
    // End:0x12
    if(!ValidHolder(Other))
    {
        return;
    }
    SetHolder(Pawn(Other).Controller);
}

event FellOutOfWorld(Engine.Actor.eKillZType KillType)
{
    SendHome();
}

event NotReachableBy(Pawn P)
{
    // End:0xa8
    if(Physics != 2 && Physics != 6 && Level.Game.NumBots > 0 && !DeathMatch(Level.Game).AllowTransloc() || Bot(P.Controller) == none || Bot(P.Controller).CanUseTranslocator())
    {
        SendHome();
    }
}

function Landed(Vector HitNormall)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xef [While If]
    if(C != none)
    {
        // End:0xd8
        if(C.Pawn != none && Bot(C) != none && C.RouteGoal != self && C.MoveTarget != self && VSize(C.Pawn.Location - Location) < float(1600) && C.LineOfSightTo(self))
        {
            Bot(C).Squad.Retask(Bot(C));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

singular simulated function BaseChange();
function LogTaken(Controller C);
function LogDropped();
function LogReturned();

auto state home
{
    function CheckTouching()
    {
        local int i;

        i = 0;
        J0x07:
        // End:0x56 [While If]
        if(i < Touching.Length)
        {
            // End:0x4c
            if(ValidHolder(Touching[i]))
            {
                SetHolder(Pawn(Touching[i]).Controller);
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }

    function bool IsHome()
    {
        return true;
    }

    function BeginState()
    {
        Log("[GameObject::Home::BeginState]");
        Disable('Touch');
        bHome = true;
        SetLocation(HomeBase.Location);
        SetRotation(HomeBase.Rotation);
        Enable('Touch');
    }

    function EndState()
    {
        bHome = false;
        TakenTime = Level.TimeSeconds;
    }

Begin:
    Sleep(0.050);
    CheckTouching();
}

state Held
{
    function BeginState()
    {
        bOnlyDrawIfAttached = true;
        bHeld = true;
        bCollideWorld = false;
        SetCollision(false, false, false);
        SetLocation(Holder.Location);
        Holder.HoldGameObject(self, GameObjBone);
    }

    function EndState()
    {
        bOnlyDrawIfAttached = false;
        ClearHolder();
        bHeld = false;
        bCollideWorld = true;
        SetCollision(true, false, false);
        SetBase(none);
        SetRelativeLocation(vect(0.0, 0.0, 0.0));
        SetRelativeRotation(rot(0, 0, 0));
    }

}

state dropped
{
    function BeginState()
    {
        SetPhysics(2);
        SetTimer(MaxDropTime, false);
    }

    function EndState()
    {
        SetPhysics(0);
    }

    function Timer();

}

defaultproperties
{
    MaxDropTime=25.0
    GameObjBone=FlagHand
    bAlwaysZeroBoneOffset=true
    bIgnoreVehicles=true
    bUseCylinderCollision=true
}