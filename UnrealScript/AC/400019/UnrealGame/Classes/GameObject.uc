class GameObject extends Decoration
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        HolderPRI, bHeld, 
        bHome;
}

function PostBeginPlay()
{
    HomeBase = GameObjective(Owner);
    SetOwner(none);
    super(Actor).PostBeginPlay();
    //return;    
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    //return;    
}

function bool CanBeThrownBy(Pawn P)
{
    return true;
    //return;    
}

function bool CanBePickedUpBy(Pawn P)
{
    return true;
    //return;    
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
    C.MoveTimer = -1.0000000;
    Holder.MakeNoise(2.0000000);
    // End:0xD2
    if(FirstTouch == none)
    {
        FirstTouch = C;
    }
    i = 0;
    J0xD9:

    // End:0x10A [Loop If]
    if(i < Assists.Length)
    {
        // End:0x100
        if(Assists[i] == C)
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0xD9;
    }
    Assists.Length = Assists.Length + 1;
    Assists[Assists.Length - 1] = C;
    //return;    
}

function Score()
{
    Disable('Touch');
    SetLocation(HomeBase.Location);
    SetRotation(HomeBase.Rotation);
    CalcSetHome();
    GotoState('home');
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    SetLocation(Holder.Location);
    LogDropped();
    Velocity = NewVel;
    GotoState('dropped');
    //return;    
}

function SendHome()
{
    CalcSetHome();
    GotoState('home');
    //return;    
}

function SendHomeDisabled(float TimeOut)
{
    //return;    
}

protected function CalcSetHome()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x5E [Loop If]
    if(C != none)
    {
        // End:0x47
        if(C.MoveTarget == self)
        {
            C.MoveTimer = -1.0000000;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    LogReturned();
    FirstTouch = none;
    J0x6B:

    // End:0x82 [Loop If]
    if(Assists.Length != 0)
    {
        Assists.Remove(0, 1);
        // [Loop Continue]
        goto J0x6B;
    }
    //return;    
}

function ClearHolder()
{
    local int i;
    local GameReplicationInfo GRI;

    // End:0x0D
    if(Holder == none)
    {
        return;
    }
    // End:0xDE
    if(Holder.PlayerReplicationInfo == none)
    {
        GRI = Level.Game.GameReplicationInfo;
        i = 0;
        J0x45:

        // End:0xDB [Loop If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0xD1
            if(GRI.PRIArray[i].HasFlag == self)
            {
                GRI.PRIArray[i].HasFlag = none;
                GRI.PRIArray[i].NetUpdateTime = Level.TimeSeconds - float(1);
            }
            i++;
            // [Loop Continue]
            goto J0x45;
        }        
    }
    else
    {
        Holder.PlayerReplicationInfo.HasFlag = none;
        Holder.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    Holder = none;
    HolderPRI = none;
    //return;    
}

protected function SetDisable(bool Disable)
{
    bDisabled = Disable;
    bHidden = Disable;
    //return;    
}

function Actor Position()
{
    // End:0x0F
    if(bHeld)
    {
        return Holder;
    }
    // End:0x1E
    if(bHome)
    {
        return HomeBase;
    }
    return self;
    //return;    
}

function bool IsHome()
{
    return false;
    //return;    
}

function bool ValidHolder(Actor Other)
{
    local Pawn P;

    // End:0x0B
    if(bDisabled)
    {
        return false;
    }
    P = Pawn(Other);
    // End:0x6A
    if((((P == none) || P.Health <= 0) || !P.bCanPickupInventory) || !P.IsPlayerPawn())
    {
        return false;
    }
    // End:0x10C
    if(((Bot(P.Controller) != none) && Bot(P.Controller).FormerVehicle != none) && Bot(P.Controller).FormerVehicle.TeamUseTime > Level.TimeSeconds)
    {
        Bot(P.Controller).FormerVehicle.TeamUseTime = 0.0000000;
    }
    return true;
    //return;    
}

singular function Touch(Actor Other)
{
    // End:0x12
    if(!ValidHolder(Other))
    {
        return;
    }
    SetHolder(Pawn(Other).Controller);
    //return;    
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
    SendHome();
    //return;    
}

event NotReachableBy(Pawn P)
{
    // End:0xA8
    if((((int(Physics) != int(2)) && int(Physics) != int(6)) && Level.Game.NumBots > 0) && (!DeathMatch(Level.Game).AllowTransloc() || Bot(P.Controller) == none) || Bot(P.Controller).CanUseTranslocator())
    {
        SendHome();
    }
    //return;    
}

function Landed(Vector HitNormall)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xEF [Loop If]
    if(C != none)
    {
        // End:0xD8
        if((((((C.Pawn != none) && Bot(C) != none) && C.RouteGoal != self) && C.MoveTarget != self) && VSize(C.Pawn.Location - Location) < float(1600)) && C.LineOfSightTo(self))
        {
            Bot(C).Squad.Retask(Bot(C));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

singular simulated function BaseChange()
{
    //return;    
}

function LogTaken(Controller C)
{
    //return;    
}

function LogDropped()
{
    //return;    
}

function LogReturned()
{
    //return;    
}

auto state home
{
    function CheckTouching()
    {
        local int i;

        i = 0;
        J0x07:

        // End:0x56 [Loop If]
        if(i < Touching.Length)
        {
            // End:0x4C
            if(ValidHolder(Touching[i]))
            {
                SetHolder(Pawn(Touching[i]).Controller);
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x07;
        }
        //return;        
    }

    function bool IsHome()
    {
        return true;
        //return;        
    }

    function BeginState()
    {
        Log("[GameObject::Home::BeginState]");
        Disable('Touch');
        bHome = true;
        SetLocation(HomeBase.Location);
        SetRotation(HomeBase.Rotation);
        Enable('Touch');
        //return;        
    }

    function EndState()
    {
        bHome = false;
        TakenTime = Level.TimeSeconds;
        //return;        
    }
Begin:

    Sleep(0.0500000);
    CheckTouching();
    stop;        
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
        //return;        
    }

    function EndState()
    {
        bOnlyDrawIfAttached = false;
        ClearHolder();
        bHeld = false;
        bCollideWorld = true;
        SetCollision(true, false, false);
        SetBase(none);
        SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
        SetRelativeRotation(rot(0, 0, 0));
        //return;        
    }
    stop;    
}

state dropped
{
    function BeginState()
    {
        SetPhysics(2);
        SetTimer(MaxDropTime, false);
        //return;        
    }

    function EndState()
    {
        SetPhysics(0);
        //return;        
    }

    function Timer()
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    MaxDropTime=25.0000000
    GameObjBone="FlagHand"
    bAlwaysZeroBoneOffset=true
    bIgnoreVehicles=true
    bUseCylinderCollision=true
}