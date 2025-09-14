/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CTFFlag.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:14
 *	States:3
 *
 *******************************************************************************/
class CTFFlag extends GameObject
    dependson(GameObject)
    dependson(UnrealMPGameInfo)
    dependson(UnrealPawn)
    dependson(TeamAI)
    dependson(CTFSquadAI);

var byte TeamNum;
var UnrealTeamInfo Team;
var UnrealPawn OldHolder;
var GameReplicationInfo GRI;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        Team;

}

simulated function UpdateForTeam();
simulated function SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    UpdateForTeam();
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x37
    if(Level.Game != none)
    {
        SetGRI(Level.Game.GameReplicationInfo);
    }
}

function SetHolder(Controller C)
{
    local CTFSquadAI S;

    // End:0x31
    if(Bot(C) != none)
    {
        S = CTFSquadAI(Bot(C).Squad);
    }
    // End:0x7b
    else
    {
        // End:0x7b
        if(PlayerController(C) != none)
        {
            S = CTFSquadAI(UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI.FindHumanSquad());
        }
    }
    // End:0x9a
    if(S != none)
    {
        S.EnemyFlagTakenBy(C);
    }
    super.SetHolder(C);
    C.SendMessage(none, 'Other', C.GetMessageIndex('GOTENEMYFLAG'), 10.0, 'Team');
}

function Drop(Vector NewVel, optional string sReason)
{
    OldHolder = Holder;
    RotationRate.Yaw = Rand(200000) - 100000;
    RotationRate.Pitch = int(float(Rand(int(float(200000) - Abs(float(RotationRate.Yaw))))) - 0.50 * float(200000) - Abs(float(RotationRate.Yaw)));
    Velocity = 0.20 + FRand() * NewVel + float(400) * FRand() * VRand();
    // End:0xb3
    if(PhysicsVolume.bWaterVolume)
    {
        Velocity *= 0.50;
    }
    super.Drop(Velocity);
    // End:0x176
    if(!FastTrace(OldHolder.Location, Location))
    {
        UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
        BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
        SendHome();
        Disable('Touch');
        bHome = true;
        SetLocation(HomeBase.Location);
        SetRotation(HomeBase.Rotation);
        Enable('Touch');
        return;
    }
}

function bool SameTeam(Controller C)
{
    // End:0x30
    if(C == none || C.PlayerReplicationInfo.Team != Team)
    {
        return false;
    }
    return true;
}

function bool ValidHolder(Actor Other)
{
    local Controller C;

    // End:0x12
    if(!super.ValidHolder(Other))
    {
        return false;
    }
    C = Pawn(Other).Controller;
    // End:0x46
    if(SameTeam(C))
    {
        SameTeamTouch(C);
        return false;
    }
    return true;
}

function SameTeamTouch(Controller C);
function Landed(Vector HitNormal)
{
    local Rotator NewRot;

    NewRot = rot(16384, 0, 0);
    NewRot.Yaw = Rotation.Yaw;
    SetRotation(NewRot);
    super.Landed(HitNormal);
}

function LogReturned();
function LogDropped()
{
    // End:0x2c
    if(bLastSecondSave)
    {
        BroadcastLocalizedMessage(class'LastSecondMessage', 1, Holder.PlayerReplicationInfo, none, Team);
    }
    // End:0x4d
    else
    {
        BroadcastLocalizedMessage(MessageClass, 2, Holder.PlayerReplicationInfo, none, Team);
    }
    bLastSecondSave = false;
    UnrealMPGameInfo(Level.Game).GameEvent("flag_dropped", "" $ string(Team.TeamIndex), Holder.PlayerReplicationInfo);
}

function CheckPain();
event FellOutOfWorld(Engine.Actor.eKillZType KillType)
{
    BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
    SendHome();
}

simulated event BaseChange()
{
    super.BaseChange();
    bAlwaysZeroBoneOffset = default.bAlwaysZeroBoneOffset && Vehicle(Base) == none;
}

auto state home
{
    function SameTeamTouch(Controller C)
    {
        local CTFFlag flag;

        // End:0x1f
        if(C.PlayerReplicationInfo.HasFlag == none)
        {
            return;
        }
        flag = CTFFlag(C.PlayerReplicationInfo.HasFlag);
        UnrealMPGameInfo(Level.Game).ScoreGameObject(C, flag);
        flag.Score();
        TriggerEvent(HomeBase.Event, HomeBase, C.Pawn);
        // End:0xcc
        if(Bot(C) != none)
        {
            Bot(C).Squad.SetAlternatePath(true);
        }
    }

    function LogTaken(Controller C)
    {
        BroadcastLocalizedMessage(MessageClass, 6, C.PlayerReplicationInfo, none, Team);
        UnrealMPGameInfo(Level.Game).GameEvent("flag_taken", "" $ string(Team.TeamIndex), C.PlayerReplicationInfo);
    }

    function Timer()
    {
        // End:0xad
        if(VSize(Location - HomeBase.Location) > float(10))
        {
            UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
            BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
            Log(string(self) $ " Home.Timer: had to sendhome", 'Error');
            SendHome();
        }
    }

    function BeginState()
    {
        super.BeginState();
        Level.Game.GameReplicationInfo.FlagState[TeamNum] = 0;
        bHidden = true;
        HomeBase.bHidden = false;
        HomeBase.Timer();
        HomeBase.NetUpdateTime = Level.TimeSeconds - float(1);
        SetTimer(1.0, true);
    }

    function EndState()
    {
        super.EndState();
        bHidden = false;
        HomeBase.bHidden = true;
        HomeBase.PlayAlarm();
        HomeBase.NetUpdateTime = Level.TimeSeconds - float(1);
        SetTimer(0.0, false);
    }

}

state Held
{
    function Timer()
    {
        // End:0x9f
        if(Holder == none)
        {
            Log(string(self) $ " Held.Timer: had to sendhome", 'Error');
            UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
            BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
            CalcSetHome();
            GotoState('home');
        }
    }

    function BeginState()
    {
        Level.Game.GameReplicationInfo.FlagState[TeamNum] = 2;
        super.BeginState();
        SetTimer(10.0, true);
    }

}

state dropped
{
    function SameTeamTouch(Controller C)
    {
        UnrealMPGameInfo(Level.Game).ScoreGameObject(C, self);
        SendHome();
    }

    function LogTaken(Controller C)
    {
        UnrealMPGameInfo(Level.Game).GameEvent("flag_pickup", "" $ string(Team.TeamIndex), C.PlayerReplicationInfo);
        BroadcastLocalizedMessage(MessageClass, 4, C.PlayerReplicationInfo, none, Team);
    }

    function CheckFit()
    {
        local Vector X, Y, Z;

        GetAxes(OldHolder.Rotation, X, Y, Z);
        SetRotation(rotator(float(-1) * X));
        // End:0x1a0
        if(!SetLocation(OldHolder.Location - float(2) * OldHolder.CollisionRadius * X + OldHolder.CollisionHeight * vect(0.0, 0.0, 0.50)) && !SetLocation(OldHolder.Location))
        {
            SetCollisionSize(0.80 * OldHolder.CollisionRadius, FMin(CollisionHeight, 0.80 * OldHolder.CollisionHeight));
            // End:0x1a0
            if(!SetLocation(OldHolder.Location) || !FastTrace(OldHolder.Location, Location))
            {
                UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
                BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
                SendHome();
                Disable('Touch');
                bHome = true;
                SetLocation(HomeBase.Location);
                SetRotation(HomeBase.Rotation);
                Enable('Touch');
                return;
            }
        }
    }

    function CheckPain()
    {
        // End:0x0f
        if(IsInPain())
        {
            Timer();
        }
    }

    function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        CheckPain();
    }

    singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        super(Decoration).PhysicsVolumeChange(NewVolume);
        CheckPain();
    }

    function BeginState()
    {
        Level.Game.GameReplicationInfo.FlagState[TeamNum] = 3;
        super.BeginState();
        bCollideWorld = true;
        SetCollisionSize(0.50 * default.CollisionRadius, CollisionHeight);
        SetCollision(true, false, false);
        CheckFit();
        CheckPain();
        SetTimer(MaxDropTime, false);
    }

    function EndState()
    {
        super.EndState();
        bCollideWorld = false;
        SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
    }

    function Timer()
    {
        BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
        UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
        super.Timer();
    }

}

defaultproperties
{
    bHome=true
    LightType=1
    LightEffect=21
    LightSaturation=128
    LightBrightness=220.0
    LightRadius=6.0
    bStatic=true
    bHidden=true
    bDynamicLight=true
    bStasis=true
    NetPriority=3.0
    DrawScale=0.60
    PrePivot=(X=2.0,Y=0.0,Z=0.50)
    Style=2
    bUnlit=true
    CollisionRadius=48.0
    CollisionHeight=30.0
    bCollideActors=true
    bCollideWorld=true
    bFixedRotationDir=true
    Mass=30.0
    Buoyancy=20.0
    RotationRate=(Pitch=30000,Yaw=0,Roll=30000)
    MessageClass=class'CTFMessage'
}