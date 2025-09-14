/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombFlag.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:16
 *	States:4
 *
 *******************************************************************************/
class wBombFlag extends GameObject;

var() string BombLauncherClassName;
var() class<wWeapon> PrevWeaponClass;
var() Pawn PassTarget;
var() float ThrowSpeed;
var() float Elasticity;
var() Sound ImpactSound;
var() float ThrowerTouchDelay;
var() float ThrowerTime;
var() Vector InitialDir;
var() float SeekInterval;
var() transient float SeekAccum;
var Material TeamShader[2];
var byte TeamHue[2];
var bool bThrownBomb;
var bool bBallDrainsTransloc;
var Material SecondRepSkin;
var wEmitter TossTrail;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        bBallDrainsTransloc, SecondRepSkin;

}

function Destroyed()
{
    // End:0x17
    if(TossTrail != none)
    {
        TossTrail.Destroy();
    }
    super(Decoration).Destroyed();
}

simulated event PostNetReceive()
{
    Skins[2] = SecondRepSkin;
}

function ClearHolder()
{
    // End:0x0d
    if(Holder == none)
    {
        return;
    }
    // End:0x65
    if(Holder.PlayerReplicationInfo != none)
    {
        Holder.PlayerReplicationInfo.HasFlag = none;
        Holder.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    // End:0xa8
    if(Holder.PendingWeapon != none && Holder.PendingWeapon.IsA('BallLauncher'))
    {
        Holder.PendingWeapon = none;
    }
    // End:0x109
    if(Holder.Weapon != none && Holder.Controller != none && Holder.Weapon.IsA('BallLauncher'))
    {
        Holder.Controller.ClientSwitchToBestWeapon();
    }
    Holder = none;
    HolderPRI = none;
}

function SetHolder(Controller C)
{
    local class<wWeapon> BombLauncherClass;
    local wWeapon W;
    local BombingRunSquadAI S;
    local Inventory Inv;
    local Pawn P;

    // End:0x31
    if(Bot(C) != none)
    {
        S = BombingRunSquadAI(Bot(C).Squad);
    }
    // End:0xd4
    else
    {
        // End:0xd4
        if(PlayerController(C) != none && UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI != none)
        {
            S = BombingRunSquadAI(UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI.FindHumanSquad());
            // End:0xd4
            if(S != none && S.SquadLeader != C)
            {
                S = none;
            }
        }
    }
    // End:0xf3
    if(S != none)
    {
        S.BombTakenBy(C);
    }
    super.SetHolder(C);
    Instigator = Holder;
    bThrownBomb = false;
    Level.Game.GameReplicationInfo.FlagTarget = none;
    BombLauncherClass = class<wWeapon>(DynamicLoadObject(BombLauncherClassName, class'Class'));
    PrevWeaponClass = C.Pawn.Weapon.Class;
    // End:0x18b
    if(ClassIsChildOf(PrevWeaponClass, BombLauncherClass))
    {
        PrevWeaponClass = none;
    }
    P = C.Pawn;
    // End:0x1ac
    if(P == none)
    {
        return;
    }
    Inv = P.Inventory;
    J0x1c0:
    // End:0x1fe [While If]
    if(Inv != none)
    {
        // End:0x1e7
        if(ClassIsChildOf(Inv.Class, BombLauncherClass))
        {
        }
        // End:0x1fe
        else
        {
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x1c0;
        }
    }
    // End:0x27f
    if(Inv == none)
    {
        W = Spawn(BombLauncherClass,,, P.Location);
        // End:0x26b
        if(W == none)
        {
            Log(string(self) @ "could not spawn a launcher for player" @ string(P));
            return;
        }
        W.GiveTo(P);
    }
    C.ClientSetWeapon(BombLauncherClass);
}

function SetThrow(Vector Start)
{
    Instigator = Holder;
    ThrowerTime = Level.TimeSeconds;
    bThrownBomb = true;
    SetLocation(Start);
}

function Throw(Vector Start, Vector Dir)
{
    SetThrow(Start);
    Drop(Dir);
    // End:0x30
    if(PassTarget != none)
    {
        Enable('Tick');
        SetPhysics(6);
    }
    // End:0x37
    else
    {
        Disable('Tick');
    }
    // End:0x67
    if(PassTarget == none)
    {
        Level.Game.GameReplicationInfo.FlagTarget = none;
    }
    // End:0x96
    else
    {
        Level.Game.GameReplicationInfo.FlagTarget = PassTarget.PlayerReplicationInfo;
    }
    // End:0xb0
    if(TossTrail == none)
    {
        TossTrail = Spawn(class'BombTrail', self);
    }
    TossTrail.SetBase(self);
    TossTrail.SetRelativeLocation(vect(0.0, 0.0, 0.0));
    // End:0x1de
    if(PassTarget != none && PassTarget != Instigator)
    {
        // End:0x17e
        if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            TossTrail.mColorRange[0].G = 0;
            TossTrail.mColorRange[1].B = 0;
            TossTrail.mColorRange[0].B = 0;
            TossTrail.mColorRange[1].G = 0;
        }
        // End:0x1de
        else
        {
            TossTrail.mColorRange[0].G = 0;
            TossTrail.mColorRange[1].R = 0;
            TossTrail.mColorRange[0].R = 0;
            TossTrail.mColorRange[1].G = 0;
        }
    }
}

function bool CanBePickedUpBy(Pawn P)
{
    return P != Instigator || Level.TimeSeconds - ThrowerTime >= ThrowerTouchDelay - VSize(Location - P.Location) / float(440);
}

function bool ValidHolder(Actor Other)
{
    local Pawn P;
    local Vector RefNormal;

    // End:0x32
    if(Other == Instigator && Level.TimeSeconds - ThrowerTime < ThrowerTouchDelay)
    {
        return false;
    }
    P = Pawn(Other);
    // End:0xe5
    if(P != none && P.Weapon != none)
    {
        // End:0xe5
        if(P.Weapon.CheckReflect(Location, RefNormal, 0))
        {
            P.Weapon.DoReflectEffect(10);
            Velocity = Elasticity * 2.50 * Velocity Dot RefNormal * RefNormal * -2.0 + Velocity;
            RandSpin(30000.0);
            return false;
        }
    }
    return super.ValidHolder(Other);
}

function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Pitch = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Roll = int(spinRate * float(2) * FRand() - spinRate);
    bFixedRotationDir = true;
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    Velocity = Elasticity * Velocity Dot HitNormal * HitNormal * -2.0 + Velocity;
    RandSpin(30000.0);
    PlaySound(ImpactSound, 1);
    // End:0x8b
    if(VSize(Velocity) < float(20) && HitNormal.Z >= 0.70 && Wall.bWorldGeometry)
    {
        Landed(HitNormal);
    }
    // End:0xb5
    else
    {
        // End:0xb5
        if(VSize(Velocity) < float(300))
        {
            // End:0xb5
            if(TossTrail != none)
            {
                TossTrail.Destroy();
            }
        }
    }
}

function Landed(Vector HitNormal)
{
    // End:0x17
    if(TossTrail != none)
    {
        TossTrail.Destroy();
    }
    Velocity = vect(0.0, 0.0, 0.0);
    // End:0x3a
    if(Holder == none)
    {
        SetPhysics(5);
    }
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x49
    if(Momentum != vect(0.0, 0.0, 0.0) && !bHome && Holder == none)
    {
        SetPhysics(2);
        Velocity += Momentum / Mass;
    }
}

function LogDropped()
{
    local TeamInfo t;

    // End:0x0d
    if(Holder == none)
    {
        return;
    }
    // End:0x142
    if(Holder.Health <= 0)
    {
        // End:0xf5
        if(Holder.PlayerReplicationInfo != none)
        {
            // End:0xb2
            if(bLastSecondSave)
            {
                // End:0x8b
                if(Holder.PlayerReplicationInfo.Team.TeamIndex == 0)
                {
                    t = TeamGame(Level.Game).Teams[1];
                }
                // End:0xaf
                else
                {
                    t = TeamGame(Level.Game).Teams[0];
                }
            }
            // End:0xf5
            else
            {
                t = TeamGame(Level.Game).Teams[Holder.PlayerReplicationInfo.Team.TeamIndex];
            }
        }
        // End:0x121
        if(bLastSecondSave)
        {
            BroadcastLocalizedMessage(class'LastSecondMessage', 0, Holder.PlayerReplicationInfo, none, t);
        }
        // End:0x142
        else
        {
            BroadcastLocalizedMessage(MessageClass, 2, Holder.PlayerReplicationInfo, none, t);
        }
    }
    UnrealMPGameInfo(Level.Game).GameEvent("bomb_dropped", "255", Holder.PlayerReplicationInfo);
}

function LogReturned()
{
    // End:0x2d
    if(Level.Game.ResetCountDown == 0)
    {
        BroadcastLocalizedMessage(MessageClass, 3, none, none, none);
    }
}

function SendHomeDisabled(float TimeOut)
{
    // End:0x17
    if(TossTrail != none)
    {
        TossTrail.Destroy();
    }
    CalcSetHome();
    GotoState('HomeDisabled');
}

function bool CanBeThrownBy(Pawn P)
{
    return !bBallDrainsTransloc || P.Health < 45;
}

auto state home
{
    function LogTaken(Controller C)
    {
        OldTeam = C.PlayerReplicationInfo.Team;
        BroadcastLocalizedMessage(MessageClass, 6, C.PlayerReplicationInfo, none, C.PlayerReplicationInfo.Team);
        UnrealMPGameInfo(Level.Game).GameEvent("bomb_taken", "255", C.PlayerReplicationInfo);
    }

    function BeginState()
    {
        // End:0x17
        if(TossTrail != none)
        {
            TossTrail.Destroy();
        }
        Skins[2] = default.Skins[2];
        SecondRepSkin = Skins[2];
        super.BeginState();
        SetPhysics(5);
        Level.Game.GameReplicationInfo.FlagState[0] = 0;
        Level.Game.GameReplicationInfo.FlagState[1] = 0;
    }

}

state HomeDisabled
{
    function bool IsHome()
    {
        return true;
    }

    function BeginState()
    {
        // End:0x17
        if(TossTrail != none)
        {
            TossTrail.Destroy();
        }
        Skins[2] = default.Skins[2];
        SecondRepSkin = Skins[2];
        SetDisable(true);
        Level.Game.GameReplicationInfo.FlagState[0] = 0;
        Level.Game.GameReplicationInfo.FlagState[1] = 0;
        bHome = true;
        SetLocation(HomeBase.Location);
        SetRotation(HomeBase.Rotation);
        SetCollision(false, false, false);
        bHidden = true;
    }

    function EndState()
    {
        SetDisable(false);
        bHome = false;
        SetCollision(true, false, false);
        bHidden = false;
    }

}

state Held
{
    function BeginState()
    {
        // End:0x17
        if(TossTrail != none)
        {
            TossTrail.Destroy();
        }
        Level.Game.GameReplicationInfo.FlagState[Holder.PlayerReplicationInfo.Team.TeamIndex] = 1;
        // End:0xa9
        if(Holder.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            Level.Game.GameReplicationInfo.FlagState[1] = 2;
        }
        // End:0xce
        else
        {
            Level.Game.GameReplicationInfo.FlagState[0] = 2;
        }
        super.BeginState();
        bDynamicLight = false;
        LightType = 0;
        Skins[0] = TeamShader[Holder.PlayerReplicationInfo.Team.TeamIndex];
        RepSkin = Skins[0];
        Skins[2] = RepSkin;
        SecondRepSkin = Skins[2];
        SetDrawScale(1.0);
    }

    function EndState()
    {
        super.EndState();
        bDynamicLight = true;
        LightType = 1;
        Skins[0] = default.Skins[0];
        RepSkin = Skins[0];
        SetStaticMesh(default.StaticMesh);
        SetDrawScale(default.DrawScale);
    }

}

state dropped
{
    function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
    {
        // End:0x63
        if(PassTarget != none && Acceleration Dot HitNormal < float(0) || Velocity Dot PassTarget.Location - Location < float(0))
        {
            Disable('Tick');
            // End:0x63
            if(Physics == 6)
            {
                SetPhysics(2);
            }
        }
        global.HitWall(HitNormal, Wall, HitMaterial);
    }

    function Tick(float Delta)
    {
        local Vector Dir;
        local float Z;

        SeekAccum += Delta;
        // End:0x165
        if(SeekAccum >= SeekInterval)
        {
            SeekAccum -= SeekInterval;
            // End:0x149
            if(PassTarget != none && PassTarget != Instigator)
            {
                Dir = Normal(PassTarget.Location + vect(0.0, 0.0, 1.0) * PassTarget.CollisionHeight * 0.50 - Location);
                Acceleration = 1.250 * ThrowSpeed * Dir;
                // End:0x102
                if(VSize(Location - PassTarget.Location) < float(250))
                {
                    Velocity = Velocity + float(10) * Acceleration * Delta;
                    // End:0x102
                    if(Dir Dot Normal(Velocity) < 0.90)
                    {
                        Acceleration *= 0.40;
                    }
                }
                SetRotation(rotator(Acceleration));
                // End:0x146
                if(Level.TimeSeconds - ThrowerTime > float(4))
                {
                    Disable('Tick');
                    // End:0x146
                    if(Physics == 6)
                    {
                        SetPhysics(2);
                    }
                }
            }
            // End:0x165
            else
            {
                Disable('Tick');
                // End:0x165
                if(Physics == 6)
                {
                    SetPhysics(2);
                }
            }
        }
        // End:0x197
        if(Physics == 6)
        {
            Velocity = Velocity + float(10) * Acceleration * Delta;
        }
        // End:0x211
        else
        {
            Disable('Tick');
            Acceleration = vect(0.0, 0.0, 0.0);
            Z = Velocity.Z;
            Velocity.Z = 0.0;
            // End:0x211
            if(VSize(Velocity) > float(800))
            {
                Velocity = float(800) * Normal(Velocity);
                Velocity.Z = FMin(100.0, Z);
            }
        }
    }

    function Landed(Vector HitNormal)
    {
        // End:0x34
        if(Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
        }
        Velocity = vect(0.0, 0.0, 0.0);
        Acceleration = vect(0.0, 0.0, 0.0);
        SetPhysics(5);
        // End:0x92
        if(Location.Z < Region.Zone.KillZ || IsInPain())
        {
            Timer();
        }
    }

    function LogTaken(Controller C)
    {
        // End:0x54
        if(C.PlayerReplicationInfo.Team != OldTeam)
        {
            BroadcastLocalizedMessage(MessageClass, 4, C.PlayerReplicationInfo, none, C.PlayerReplicationInfo.Team);
        }
        OldTeam = C.PlayerReplicationInfo.Team;
        UnrealMPGameInfo(Level.Game).GameEvent("bomb_pickup", "255", C.PlayerReplicationInfo);
    }

    function Timer()
    {
        UnrealMPGameInfo(Level.Game).GameEvent("bomb_returned_timeout", "255", none);
        super.Timer();
    }

    function BeginState()
    {
        // End:0x5a
        if(PassTarget == none || PassTarget == Instigator && Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
            SetPhysics(2);
        }
        // End:0x6f
        else
        {
            // End:0x6f
            if(Physics != 6)
            {
                SetPhysics(2);
            }
        }
        SetTimer(MaxDropTime, false);
        SetPhysics(2);
        Level.Game.GameReplicationInfo.FlagState[0] = 3;
        Level.Game.GameReplicationInfo.FlagState[1] = 3;
    }

    function EndState()
    {
        PassTarget = none;
        // End:0x3b
        if(Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
        }
        super.EndState();
    }

}

defaultproperties
{
    BombLauncherClassName="XWeapons.BallLauncher"
    ThrowSpeed=1300.0
    Elasticity=0.40
    ThrowerTouchDelay=1.0
    SeekInterval=0.050
    TeamHue[1]=170
    bHome=true
    GameObjBone=spine
    LightType=1
    LightEffect=21
    LightHue=40
    LightBrightness=255.0
    LightRadius=6.0
    DrawType=8
    bStatic=true
    bDynamicLight=true
    bStasis=true
    Physics=5
    NetUpdateFrequency=100.0
    NetPriority=3.0
    DrawScale=1.50
    PrePivot=(X=2.0,Y=0.0,Z=0.50)
    Style=2
    bUnlit=true
    SoundRadius=250.0
    CollisionRadius=24.0
    CollisionHeight=20.0
    bCollideActors=true
    bCollideWorld=true
    bProjTarget=true
    bBounce=true
    bFixedRotationDir=true
    Buoyancy=20.0
    RotationRate=(Pitch=0,Yaw=30000,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=30000,Roll=0)
    MessageClass=class'wBombMessage'
}