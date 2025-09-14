class wBombFlag extends GameObject;

var() string BombLauncherClassName;
var() Class<wWeapon> PrevWeaponClass;
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        SecondRepSkin, bBallDrainsTransloc;
}

function Destroyed()
{
    // End:0x17
    if(TossTrail != none)
    {
        TossTrail.Destroy();
    }
    super(Decoration).Destroyed();
    //return;    
}

simulated event PostNetReceive()
{
    Skins[2] = SecondRepSkin;
    //return;    
}

function ClearHolder()
{
    // End:0x0D
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
    // End:0xA8
    if((Holder.PendingWeapon != none) && Holder.PendingWeapon.IsA('BallLauncher'))
    {
        Holder.PendingWeapon = none;
    }
    // End:0x109
    if(((Holder.Weapon != none) && Holder.Controller != none) && Holder.Weapon.IsA('BallLauncher'))
    {
        Holder.Controller.ClientSwitchToBestWeapon();
    }
    Holder = none;
    HolderPRI = none;
    //return;    
}

function SetHolder(Controller C)
{
    local Class<wWeapon> BombLauncherClass;
    local wWeapon W;
    local BombingRunSquadAI S;
    local Inventory Inv;
    local Pawn P;

    // End:0x31
    if(Bot(C) != none)
    {
        S = BombingRunSquadAI(Bot(C).Squad);        
    }
    else
    {
        // End:0xD4
        if((PlayerController(C) != none) && UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI != none)
        {
            S = BombingRunSquadAI(UnrealTeamInfo(C.PlayerReplicationInfo.Team).AI.FindHumanSquad());
            // End:0xD4
            if((S != none) && S.SquadLeader != C)
            {
                S = none;
            }
        }
    }
    // End:0xF3
    if(S != none)
    {
        S.BombTakenBy(C);
    }
    super.SetHolder(C);
    Instigator = Holder;
    bThrownBomb = false;
    Level.Game.GameReplicationInfo.FlagTarget = none;
    BombLauncherClass = Class<wWeapon>(DynamicLoadObject(BombLauncherClassName, Class'Core.Class'));
    PrevWeaponClass = C.Pawn.Weapon.Class;
    // End:0x18B
    if(ClassIsChildOf(PrevWeaponClass, BombLauncherClass))
    {
        PrevWeaponClass = none;
    }
    P = C.Pawn;
    // End:0x1AC
    if(P == none)
    {
        return;
    }
    Inv = P.Inventory;
    J0x1C0:

    // End:0x1FE [Loop If]
    if(Inv != none)
    {
        // End:0x1E7
        if(ClassIsChildOf(Inv.Class, BombLauncherClass))
        {
            // [Explicit Break]
            goto J0x1FE;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x1C0;
    }
    J0x1FE:

    // End:0x27F
    if(Inv == none)
    {
        W = Spawn(BombLauncherClass,,, P.Location);
        // End:0x26B
        if(W == none)
        {
            Log((string(self) @ "could not spawn a launcher for player") @ string(P));
            return;
        }
        W.GiveTo(P);
    }
    C.ClientSetWeapon(BombLauncherClass);
    //return;    
}

function SetThrow(Vector Start)
{
    Instigator = Holder;
    ThrowerTime = Level.TimeSeconds;
    bThrownBomb = true;
    SetLocation(Start);
    //return;    
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
    else
    {
        Disable('Tick');
    }
    // End:0x67
    if(PassTarget == none)
    {
        Level.Game.GameReplicationInfo.FlagTarget = none;        
    }
    else
    {
        Level.Game.GameReplicationInfo.FlagTarget = PassTarget.PlayerReplicationInfo;
    }
    // End:0xB0
    if(TossTrail == none)
    {
        TossTrail = Spawn(Class'WGame_Decompressed.BombTrail', self);
    }
    TossTrail.SetBase(self);
    TossTrail.SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
    // End:0x1DE
    if((PassTarget != none) && PassTarget != Instigator)
    {
        // End:0x17E
        if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            TossTrail.mColorRange[0].G = 0;
            TossTrail.mColorRange[1].B = 0;
            TossTrail.mColorRange[0].B = 0;
            TossTrail.mColorRange[1].G = 0;            
        }
        else
        {
            TossTrail.mColorRange[0].G = 0;
            TossTrail.mColorRange[1].R = 0;
            TossTrail.mColorRange[0].R = 0;
            TossTrail.mColorRange[1].G = 0;
        }
    }
    //return;    
}

function bool CanBePickedUpBy(Pawn P)
{
    return (P != Instigator) || (Level.TimeSeconds - ThrowerTime) >= (ThrowerTouchDelay - (VSize(Location - P.Location) / float(440)));
    //return;    
}

function bool ValidHolder(Actor Other)
{
    local Pawn P;
    local Vector RefNormal;

    // End:0x32
    if((Other == Instigator) && (Level.TimeSeconds - ThrowerTime) < ThrowerTouchDelay)
    {
        return false;
    }
    P = Pawn(Other);
    // End:0xE5
    if((P != none) && P.Weapon != none)
    {
        // End:0xE5
        if(P.Weapon.CheckReflect(Location, RefNormal, 0))
        {
            P.Weapon.DoReflectEffect(10);
            Velocity = (Elasticity * 2.5000000) * ((((Velocity Dot RefNormal) * RefNormal) * -2.0000000) + Velocity);
            RandSpin(30000.0000000);
            return false;
        }
    }
    return super.ValidHolder(Other);
    //return;    
}

function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
    bFixedRotationDir = true;
    //return;    
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    Velocity = Elasticity * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
    RandSpin(30000.0000000);
    PlaySound(ImpactSound, 1);
    // End:0x8B
    if(((VSize(Velocity) < float(20)) && HitNormal.Z >= 0.7000000) && Wall.bWorldGeometry)
    {
        Landed(HitNormal);        
    }
    else
    {
        // End:0xB5
        if(VSize(Velocity) < float(300))
        {
            // End:0xB5
            if(TossTrail != none)
            {
                TossTrail.Destroy();
            }
        }
    }
    //return;    
}

function Landed(Vector HitNormal)
{
    // End:0x17
    if(TossTrail != none)
    {
        TossTrail.Destroy();
    }
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x3A
    if(Holder == none)
    {
        SetPhysics(5);
    }
    //return;    
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    // End:0x49
    if(((Momentum != vect(0.0000000, 0.0000000, 0.0000000)) && !bHome) && Holder == none)
    {
        SetPhysics(2);
        Velocity += (Momentum / Mass);
    }
    //return;    
}

function LogDropped()
{
    local TeamInfo t;

    // End:0x0D
    if(Holder == none)
    {
        return;
    }
    // End:0x142
    if(Holder.Health <= 0)
    {
        // End:0xF5
        if(Holder.PlayerReplicationInfo != none)
        {
            // End:0xB2
            if(bLastSecondSave)
            {
                // End:0x8B
                if(Holder.PlayerReplicationInfo.Team.TeamIndex == 0)
                {
                    t = TeamGame(Level.Game).Teams[1];                    
                }
                else
                {
                    t = TeamGame(Level.Game).Teams[0];
                }                
            }
            else
            {
                t = TeamGame(Level.Game).Teams[Holder.PlayerReplicationInfo.Team.TeamIndex];
            }
        }
        // End:0x121
        if(bLastSecondSave)
        {
            BroadcastLocalizedMessage(Class'UnrealGame.LastSecondMessage', 0, Holder.PlayerReplicationInfo, none, t);            
        }
        else
        {
            BroadcastLocalizedMessage(MessageClass, 2, Holder.PlayerReplicationInfo, none, t);
        }
    }
    UnrealMPGameInfo(Level.Game).GameEvent("bomb_dropped", "255", Holder.PlayerReplicationInfo);
    //return;    
}

function LogReturned()
{
    // End:0x2D
    if(Level.Game.ResetCountDown == 0)
    {
        BroadcastLocalizedMessage(MessageClass, 3, none, none, none);
    }
    //return;    
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
    //return;    
}

function bool CanBeThrownBy(Pawn P)
{
    return !bBallDrainsTransloc || P.Health < 45;
    //return;    
}

auto state home
{
    function LogTaken(Controller C)
    {
        OldTeam = C.PlayerReplicationInfo.Team;
        BroadcastLocalizedMessage(MessageClass, 6, C.PlayerReplicationInfo, none, C.PlayerReplicationInfo.Team);
        UnrealMPGameInfo(Level.Game).GameEvent("bomb_taken", "255", C.PlayerReplicationInfo);
        //return;        
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
        //return;        
    }
    stop;    
}

state HomeDisabled
{
    function bool IsHome()
    {
        return true;
        //return;        
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
        //return;        
    }

    function EndState()
    {
        SetDisable(false);
        bHome = false;
        SetCollision(true, false, false);
        bHidden = false;
        //return;        
    }
    stop;    
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
        // End:0xA9
        if(Holder.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            Level.Game.GameReplicationInfo.FlagState[1] = 2;            
        }
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
        SetDrawScale(1.0000000);
        //return;        
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
        //return;        
    }
    stop;    
}

state dropped
{
    function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
    {
        // End:0x63
        if((PassTarget != none) && ((Acceleration Dot HitNormal) < float(0)) || (Velocity Dot (PassTarget.Location - Location)) < float(0))
        {
            Disable('Tick');
            // End:0x63
            if(int(Physics) == int(6))
            {
                SetPhysics(2);
            }
        }
        global.HitWall(HitNormal, Wall, HitMaterial);
        //return;        
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
            if((PassTarget != none) && PassTarget != Instigator)
            {
                Dir = Normal((PassTarget.Location + ((vect(0.0000000, 0.0000000, 1.0000000) * PassTarget.CollisionHeight) * 0.5000000)) - Location);
                Acceleration = (1.2500000 * ThrowSpeed) * Dir;
                // End:0x102
                if(VSize(Location - PassTarget.Location) < float(250))
                {
                    Velocity = Velocity + ((float(10) * Acceleration) * Delta);
                    // End:0x102
                    if((Dir Dot Normal(Velocity)) < 0.9000000)
                    {
                        Acceleration *= 0.4000000;
                    }
                }
                SetRotation(Rotator(Acceleration));
                // End:0x146
                if((Level.TimeSeconds - ThrowerTime) > float(4))
                {
                    Disable('Tick');
                    // End:0x146
                    if(int(Physics) == int(6))
                    {
                        SetPhysics(2);
                    }
                }                
            }
            else
            {
                Disable('Tick');
                // End:0x165
                if(int(Physics) == int(6))
                {
                    SetPhysics(2);
                }
            }
        }
        // End:0x197
        if(int(Physics) == int(6))
        {
            Velocity = Velocity + ((float(10) * Acceleration) * Delta);            
        }
        else
        {
            Disable('Tick');
            Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            Z = Velocity.Z;
            Velocity.Z = 0.0000000;
            // End:0x211
            if(VSize(Velocity) > float(800))
            {
                Velocity = float(800) * Normal(Velocity);
                Velocity.Z = FMin(100.0000000, Z);
            }
        }
        //return;        
    }

    function Landed(Vector HitNormal)
    {
        // End:0x34
        if(Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
        }
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        SetPhysics(5);
        // End:0x92
        if((Location.Z < Region.Zone.KillZ) || IsInPain())
        {
            Timer();
        }
        //return;        
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
        //return;        
    }

    function Timer()
    {
        UnrealMPGameInfo(Level.Game).GameEvent("bomb_returned_timeout", "255", none);
        super.Timer();
        //return;        
    }

    function BeginState()
    {
        // End:0x5A
        if(((PassTarget == none) || PassTarget == Instigator) && Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
            SetPhysics(2);            
        }
        else
        {
            // End:0x6F
            if(int(Physics) != int(6))
            {
                SetPhysics(2);
            }
        }
        SetTimer(MaxDropTime, false);
        SetPhysics(2);
        Level.Game.GameReplicationInfo.FlagState[0] = 3;
        Level.Game.GameReplicationInfo.FlagState[1] = 3;
        //return;        
    }

    function EndState()
    {
        PassTarget = none;
        // End:0x3B
        if(Skins[2] != default.Skins[2])
        {
            Skins[2] = default.Skins[2];
            SecondRepSkin = Skins[2];
        }
        super.EndState();
        //return;        
    }
    stop;    
}

defaultproperties
{
    BombLauncherClassName="XWeapons.BallLauncher"
    ThrowSpeed=1300.0000000
    Elasticity=0.4000000
    ThrowerTouchDelay=1.0000000
    SeekInterval=0.0500000
    TeamHue[1]=170
    bHome=true
    GameObjBone="spine"
    LightType=1
    LightEffect=21
    LightHue=40
    LightBrightness=255.0000000
    LightRadius=6.0000000
    DrawType=8
    bStatic=false
    bDynamicLight=true
    bStasis=false
    Physics=5
    NetUpdateFrequency=100.0000000
    NetPriority=3.0000000
    DrawScale=1.5000000
    PrePivot=(X=2.0000000,Y=0.0000000,Z=0.5000000)
    Style=2
    bUnlit=true
    SoundRadius=250.0000000
    CollisionRadius=24.0000000
    CollisionHeight=20.0000000
    bCollideActors=true
    bCollideWorld=true
    bProjTarget=true
    bBounce=true
    bFixedRotationDir=true
    Buoyancy=20.0000000
    RotationRate=(Pitch=0,Yaw=30000,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=30000,Roll=0)
    MessageClass=Class'WGame_Decompressed.wBombMessage'
}