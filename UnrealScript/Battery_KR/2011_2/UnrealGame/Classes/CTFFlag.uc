class CTFFlag extends GameObject;

var byte TeamNum;
var UnrealTeamInfo Team;
var UnrealPawn OldHolder;
var GameReplicationInfo GRI;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Team;
}

simulated function UpdateForTeam()
{
    //return;    
}

simulated function SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    UpdateForTeam();
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x37
    if(Level.Game != none)
    {
        SetGRI(Level.Game.GameReplicationInfo);
    }
    //return;    
}

function SetHolder(Controller C)
{
    local CTFSquadAI S;

    // End:0x31
    if(Bot(C) != none)
    {
        S = CTFSquadAI(Bot(C).Squad);        
    }
    else
    {
        // End:0x7B
        if(PlayerController(C) != none)
        {
            S = CTFSquadAI(UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI.FindHumanSquad());
        }
    }
    // End:0x9A
    if(S != none)
    {
        S.EnemyFlagTakenBy(C);
    }
    super.SetHolder(C);
    C.SendMessage(none, 'Other', C.GetMessageIndex('GOTENEMYFLAG'), 10.0000000, 'Team');
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    OldHolder = Holder;
    RotationRate.Yaw = Rand(200000) - 100000;
    RotationRate.Pitch = int(float(Rand(int(float(200000) - Abs(float(RotationRate.Yaw))))) - (0.5000000 * (float(200000) - Abs(float(RotationRate.Yaw)))));
    Velocity = (0.2000000 + FRand()) * (NewVel + ((float(400) * FRand()) * VRand()));
    // End:0xB3
    if(PhysicsVolume.bWaterVolume)
    {
        Velocity *= 0.5000000;
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
    //return;    
}

function bool SameTeam(Controller C)
{
    // End:0x30
    if((C == none) || C.PlayerReplicationInfo.Team != Team)
    {
        return false;
    }
    return true;
    //return;    
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
    //return;    
}

function SameTeamTouch(Controller C)
{
    //return;    
}

function Landed(Vector HitNormal)
{
    local Rotator NewRot;

    NewRot = rot(16384, 0, 0);
    NewRot.Yaw = Rotation.Yaw;
    SetRotation(NewRot);
    super.Landed(HitNormal);
    //return;    
}

function LogReturned()
{
    //return;    
}

function LogDropped()
{
    // End:0x2C
    if(bLastSecondSave)
    {
        BroadcastLocalizedMessage(Class'UnrealGame_Decompressed.LastSecondMessage', 1, Holder.PlayerReplicationInfo, none, Team);        
    }
    else
    {
        BroadcastLocalizedMessage(MessageClass, 2, Holder.PlayerReplicationInfo, none, Team);
    }
    bLastSecondSave = false;
    UnrealMPGameInfo(Level.Game).GameEvent("flag_dropped", "" $ string(Team.TeamIndex), Holder.PlayerReplicationInfo);
    //return;    
}

function CheckPain()
{
    //return;    
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
    BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
    SendHome();
    //return;    
}

simulated event BaseChange()
{
    super.BaseChange();
    bAlwaysZeroBoneOffset = default.bAlwaysZeroBoneOffset && Vehicle(Base) == none;
    //return;    
}

auto state home
{
    function SameTeamTouch(Controller C)
    {
        local CTFFlag flag;

        // End:0x1F
        if(C.PlayerReplicationInfo.HasFlag == none)
        {
            return;
        }
        flag = CTFFlag(C.PlayerReplicationInfo.HasFlag);
        UnrealMPGameInfo(Level.Game).ScoreGameObject(C, flag);
        flag.Score();
        TriggerEvent(HomeBase.Event, HomeBase, C.Pawn);
        // End:0xCC
        if(Bot(C) != none)
        {
            Bot(C).Squad.SetAlternatePath(true);
        }
        //return;        
    }

    function LogTaken(Controller C)
    {
        BroadcastLocalizedMessage(MessageClass, 6, C.PlayerReplicationInfo, none, Team);
        UnrealMPGameInfo(Level.Game).GameEvent("flag_taken", "" $ string(Team.TeamIndex), C.PlayerReplicationInfo);
        //return;        
    }

    function Timer()
    {
        // End:0xAD
        if(VSize(Location - HomeBase.Location) > float(10))
        {
            UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
            BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
            Log(string(self) $ " Home.Timer: had to sendhome", 'Error');
            SendHome();
        }
        //return;        
    }

    function BeginState()
    {
        super.BeginState();
        Level.Game.GameReplicationInfo.FlagState[int(TeamNum)] = 0;
        bHidden = true;
        HomeBase.bHidden = false;
        HomeBase.Timer();
        HomeBase.NetUpdateTime = Level.TimeSeconds - float(1);
        SetTimer(1.0000000, true);
        //return;        
    }

    function EndState()
    {
        super.EndState();
        bHidden = false;
        HomeBase.bHidden = true;
        HomeBase.PlayAlarm();
        HomeBase.NetUpdateTime = Level.TimeSeconds - float(1);
        SetTimer(0.0000000, false);
        //return;        
    }
    stop;    
}

state Held
{
    function Timer()
    {
        // End:0x9F
        if(Holder == none)
        {
            Log(string(self) $ " Held.Timer: had to sendhome", 'Error');
            UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
            BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
            CalcSetHome();
            GotoState('home');
        }
        //return;        
    }

    function BeginState()
    {
        Level.Game.GameReplicationInfo.FlagState[int(TeamNum)] = 2;
        super.BeginState();
        SetTimer(10.0000000, true);
        //return;        
    }
    stop;    
}

state dropped
{
    function SameTeamTouch(Controller C)
    {
        UnrealMPGameInfo(Level.Game).ScoreGameObject(C, self);
        SendHome();
        //return;        
    }

    function LogTaken(Controller C)
    {
        UnrealMPGameInfo(Level.Game).GameEvent("flag_pickup", "" $ string(Team.TeamIndex), C.PlayerReplicationInfo);
        BroadcastLocalizedMessage(MessageClass, 4, C.PlayerReplicationInfo, none, Team);
        //return;        
    }

    function CheckFit()
    {
        local Vector X, Y, Z;

        GetAxes(OldHolder.Rotation, X, Y, Z);
        SetRotation(Rotator(float(-1) * X));
        // End:0x1A0
        if(!SetLocation((OldHolder.Location - ((float(2) * OldHolder.CollisionRadius) * X)) + (OldHolder.CollisionHeight * vect(0.0000000, 0.0000000, 0.5000000))) && !SetLocation(OldHolder.Location))
        {
            SetCollisionSize(0.8000000 * OldHolder.CollisionRadius, FMin(CollisionHeight, 0.8000000 * OldHolder.CollisionHeight));
            // End:0x1A0
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
        //return;        
    }

    function CheckPain()
    {
        // End:0x0F
        if(IsInPain())
        {
            Timer();
        }
        //return;        
    }

    function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
    {
        CheckPain();
        //return;        
    }

    singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        super(Decoration).PhysicsVolumeChange(NewVolume);
        CheckPain();
        //return;        
    }

    function BeginState()
    {
        Level.Game.GameReplicationInfo.FlagState[int(TeamNum)] = 3;
        super.BeginState();
        bCollideWorld = true;
        SetCollisionSize(0.5000000 * default.CollisionRadius, CollisionHeight);
        SetCollision(true, false, false);
        CheckFit();
        CheckPain();
        SetTimer(MaxDropTime, false);
        //return;        
    }

    function EndState()
    {
        super.EndState();
        bCollideWorld = false;
        SetCollisionSize(default.CollisionRadius, default.CollisionHeight);
        //return;        
    }

    function Timer()
    {
        BroadcastLocalizedMessage(MessageClass, 3, none, none, Team);
        UnrealMPGameInfo(Level.Game).GameEvent("flag_returned_timeout", "" $ string(Team.TeamIndex), none);
        super.Timer();
        //return;        
    }
    stop;    
}

defaultproperties
{
    bHome=true
    LightType=1
    LightEffect=21
    LightSaturation=128
    LightBrightness=220.0000000
    LightRadius=6.0000000
    bStatic=false
    bHidden=true
    bDynamicLight=true
    bStasis=false
    NetPriority=3.0000000
    DrawScale=0.6000000
    PrePivot=(X=2.0000000,Y=0.0000000,Z=0.5000000)
    Style=2
    bUnlit=true
    CollisionRadius=48.0000000
    CollisionHeight=30.0000000
    bCollideActors=true
    bCollideWorld=true
    bFixedRotationDir=true
    Mass=30.0000000
    Buoyancy=20.0000000
    RotationRate=(Pitch=30000,Yaw=0,Roll=30000)
    MessageClass=Class'UnrealGame_Decompressed.CTFMessage'
}