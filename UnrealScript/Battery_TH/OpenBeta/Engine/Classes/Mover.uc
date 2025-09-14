class Mover extends Actor
    native
    nativereplication
    notplaceable;

enum EMoverEncroachType
{
    ME_StopWhenEncroach,            // 0
    ME_ReturnWhenEncroach,          // 1
    ME_CrushWhenEncroach,           // 2
    ME_IgnoreWhenEncroach           // 3
};

enum EMoverGlideType
{
    MV_MoveByTime,                  // 0
    MV_GlideByTime                  // 1
};

enum EBumpType
{
    BT_PlayerBump,                  // 0
    BT_PawnBump,                    // 1
    BT_AnyBump                      // 2
};

var() Mover.EMoverEncroachType MoverEncroachType;
var() Mover.EMoverGlideType MoverGlideType;
var() Mover.EBumpType BumpType;
var() byte KeyNum;
var byte PrevKeyNum;
var() const byte NumKeys;
var() const byte WorldRaytraceKey;
var() const byte BrushRaytraceKey;
var byte StartKeyNum;
var() float MoveTime;
var() float StayOpenTime;
var() float OtherTime;
var() int EncroachDamage;
var() bool bToggleDirection;
var() bool bTriggerOnceOnly;
var() bool bSlave;
var() bool bUseTriggered;
var() bool bDamageTriggered;
var() bool bDynamicLightMover;
var() bool bUseShortestRotation;
var(ReturnGroup) bool bIsLeader;
var() name PlayerBumpEvent;
var() name BumpEvent;
var Actor SavedTrigger;
var() float DamageThreshold;
var int numTriggerEvents;
var Mover Leader;
var Mover Follower;
var(ReturnGroup) name ReturnGroup;
var() float DelayTime;
var(MoverSounds) Sound OpeningSound;
var(MoverSounds) Sound OpenedSound;
var(MoverSounds) Sound ClosingSound;
var(MoverSounds) Sound ClosedSound;
var(MoverSounds) Sound MoveAmbientSound;
var(MoverSounds) Sound LoopSound;
var(MoverEvents) name OpeningEvent;
var(MoverEvents) name OpenedEvent;
var(MoverEvents) name ClosingEvent;
var(MoverEvents) name ClosedEvent;
var(MoverEvents) name LoopEvent;
var Vector KeyPos[24];
var Rotator KeyRot[24];
var Vector BasePos;
var Vector OldPos;
var Vector OldPrePivot;
var Vector SavedPos;
var Rotator BaseRot;
var Rotator OldRot;
var Rotator SavedRot;
var float PhysAlpha;
var float PhysRate;
var NavigationPoint myMarker;
var bool bOpening;
var bool bDelaying;
var bool bClientPause;
var bool bClosed;
var bool bPlayerOnly;
var(AI) bool bAutoDoor;
var(AI) bool bNoAIRelevance;
var bool bJumpLift;
var() bool bOscillatingLoop;
var byte ClientStop;
var Vector SimOldPos;
var int SimOldRotPitch;
var int SimOldRotYaw;
var int SimOldRotRoll;
var Vector SimInterpolate;
var Vector RealPosition;
var Rotator RealRotation;
var int ClientUpdate;
var byte StoppedPosition;
var int StepDirection;
var array<AntiPortalActor> AntiPortals;
var() name AntiPortalTag;
var bool bResetting;
var bool BACKUP_bHidden;
var name Backup_InitialState;
var() bool bDamageOnceOnly;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        RealPosition, RealRotation, 
        SimInterpolate, SimOldPos, 
        SimOldRotPitch, SimOldRotRoll, 
        SimOldRotYaw, StoppedPosition;
}

function bool SelfTriggered()
{
    return true;
    //return;    
}

function Actor SpecialHandling(Pawn Other)
{
    local Actor A;

    // End:0x3C
    if(myMarker != none)
    {
        A = myMarker.SpecialHandling(Other);
        // End:0x36
        if(A == none)
        {
            return myMarker;
        }
        return A;
    }
    return self;
    //return;    
}

simulated function StartInterpolation()
{
    GotoState('None');
    bInterpolating = true;
    SetPhysics(0);
    //return;    
}

simulated function Timer()
{
    // End:0x2A
    if(Velocity != vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0x28
        if(bClientPause)
        {
            bClientPause = false;
        }
        return;
    }
    // End:0xC9
    if((int(Level.NetMode) == int(NM_Client)) && !bClientAuthoritative)
    {
        // End:0xBE
        if(ClientUpdate == 0)
        {
            // End:0xA4
            if(bClientPause)
            {
                // End:0x86
                if(VSize(RealPosition - Location) > float(3))
                {
                    SetLocation(RealPosition);                    
                }
                else
                {
                    RealPosition = Location;
                }
                SetRotation(RealRotation);
                bClientPause = false;                
            }
            else
            {
                // End:0xBB
                if(RealPosition != Location)
                {
                    bClientPause = true;
                }
            }            
        }
        else
        {
            bClientPause = false;
        }        
    }
    else
    {
        // End:0x106
        if(bCollideActors)
        {
            // End:0xEC
            if(RealRotation != Rotation)
            {
                RealRotation = Rotation;
            }
            // End:0x106
            if(RealPosition != Location)
            {
                RealPosition = Location;
            }
        }
    }
    //return;    
}

final simulated function InterpolateTo(byte NewKeyNum, float Seconds)
{
    local Mover M;

    // End:0x20
    foreach BasedActors(Class'Engine_Decompressed.Mover', M)
    {
        M.BaseStarted();        
    }    
    NewKeyNum = byte(Clamp(int(NewKeyNum), 0, 24 - 1));
    // End:0xAA
    if((int(NewKeyNum) == int(PrevKeyNum)) && int(KeyNum) != int(PrevKeyNum))
    {
        PhysAlpha = 1.0000000 - PhysAlpha;
        OldPos = BasePos + KeyPos[int(KeyNum)];
        OldRot = BaseRot + KeyRot[int(KeyNum)];        
    }
    else
    {
        OldPos = Location;
        OldRot = Rotation;
        PhysAlpha = 0.0000000;
    }
    // End:0xDF
    if(bResetting)
    {
        Seconds = 0.0050000;
    }
    SetPhysics(8);
    bInterpolating = true;
    PrevKeyNum = KeyNum;
    KeyNum = NewKeyNum;
    PhysRate = 1.0000000 / FMax(Seconds, 0.0050000);
    ClientUpdate++;
    SimOldPos = OldPos;
    SimOldRotYaw = OldRot.Yaw;
    SimOldRotPitch = OldRot.Pitch;
    SimOldRotRoll = OldRot.Roll;
    SimInterpolate.X = 100.0000000 * PhysAlpha;
    SimInterpolate.Y = 100.0000000 * FMax(0.0100000, PhysRate);
    SimInterpolate.Z = (256.0000000 * float(PrevKeyNum)) + float(KeyNum);
    NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

final function SetKeyframe(byte NewKeyNum, Vector NewLocation, Rotator NewRotation)
{
    KeyNum = byte(Clamp(int(NewKeyNum), 0, 24 - 1));
    KeyPos[int(KeyNum)] = NewLocation;
    KeyRot[int(KeyNum)] = NewRotation;
    //return;    
}

simulated event KeyFrameReached()
{
    local byte OldKeyNum;
    local Mover M;

    OldKeyNum = PrevKeyNum;
    PrevKeyNum = KeyNum;
    PhysAlpha = 0.0000000;
    ClientUpdate--;
    // End:0x64
    if((int(KeyNum) > 0) && int(KeyNum) < int(OldKeyNum))
    {
        InterpolateTo(byte(int(KeyNum) - 1), MoveTime);        
    }
    else
    {
        // End:0xA9
        if((int(KeyNum) < (int(NumKeys) - 1)) && int(KeyNum) > int(OldKeyNum))
        {
            InterpolateTo(byte(int(KeyNum) + 1), MoveTime);            
        }
        else
        {
            AmbientSound = none;
            NetUpdateTime = Level.TimeSeconds - float(1);
            // End:0xE7
            if(bJumpLift && int(KeyNum) == 1)
            {
                FinishNotify();
            }
            // End:0x14F
            if((ClientUpdate == 0) && (int(Level.NetMode) != int(NM_Client)) || bClientAuthoritative)
            {
                RealPosition = Location;
                RealRotation = Rotation;
                // End:0x14E
                foreach BasedActors(Class'Engine_Decompressed.Mover', M)
                {
                    M.BaseFinished();                    
                }                
            }
        }
    }
    //return;    
}

function FinishNotify()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x6F [Loop If]
    if(C != none)
    {
        // End:0x58
        if((C.Pawn != none) && C.PendingMover == self)
        {
            C.MoverFinished();
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function FinishedClosing()
{
    local Mover M;

    PlaySound(ClosedSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
    TriggerEvent(ClosedEvent, self, Instigator);
    // End:0x57
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    SavedTrigger = none;
    Instigator = none;
    // End:0x7F
    if(myMarker != none)
    {
        myMarker.MoverClosed();
    }
    bClosed = true;
    FinishNotify();
    M = Leader;
    J0x98:

    // End:0xD0 [Loop If]
    if(M != none)
    {
        // End:0xB9
        if(!M.bClosed)
        {
            return;
        }
        M = M.Follower;
        // [Loop Continue]
        goto J0x98;
    }
    UntriggerEvent(OpeningEvent, self, Instigator);
    //return;    
}

function FinishedOpening()
{
    PlaySound(OpenedSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
    TriggerEvent(Event, self, Instigator);
    TriggerEvent(OpenedEvent, self, Instigator);
    // End:0x68
    if(myMarker != none)
    {
        myMarker.MoverOpened();
    }
    FinishNotify();
    //return;    
}

function DoOpen()
{
    bOpening = true;
    bDelaying = false;
    InterpolateTo(1, MoveTime);
    MakeNoise(1.0000000);
    PlaySound(OpeningSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
    AmbientSound = MoveAmbientSound;
    TriggerEvent(OpeningEvent, self, Instigator);
    // End:0x87
    if(Follower != none)
    {
        Follower.DoOpen();
    }
    //return;    
}

function DoClose()
{
    bOpening = false;
    bDelaying = false;
    InterpolateTo(byte(Max(0, int(KeyNum) - 1)), MoveTime);
    MakeNoise(1.0000000);
    PlaySound(ClosingSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
    UntriggerEvent(Event, self, Instigator);
    AmbientSound = MoveAmbientSound;
    TriggerEvent(ClosingEvent, self, Instigator);
    // End:0xA5
    if(Follower != none)
    {
        Follower.DoClose();
    }
    //return;    
}

simulated function BeginPlay()
{
    local AntiPortalActor AntiPortalA;

    // End:0x4B
    if(AntiPortalTag != 'None')
    {
        // End:0x4A
        foreach AllActors(Class'Engine_Decompressed.AntiPortalActor', AntiPortalA, AntiPortalTag)
        {
            AntiPortals.Length = AntiPortals.Length + 1;
            AntiPortals[AntiPortals.Length - 1] = AntiPortalA;            
        }        
    }
    // End:0xAF
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        // End:0x94
        if((int(Level.NetMode) == int(NM_Client)) && bClientAuthoritative)
        {
            SetTimer(4.0000000, true);            
        }
        else
        {
            SetTimer(1.0000000, true);
        }
        // End:0xAF
        if(int(Role) < int(ROLE_Authority))
        {
            return;
        }
    }
    RealPosition = Location;
    RealRotation = Rotation;
    super.BeginPlay();
    KeyNum = byte(Clamp(int(KeyNum), 0, 24 - 1));
    PhysAlpha = 0.0000000;
    StartKeyNum = KeyNum;
    Move((BasePos + KeyPos[int(KeyNum)]) - Location);
    SetRotation(BaseRot + KeyRot[int(KeyNum)]);
    // End:0x148
    if(ReturnGroup == 'None')
    {
        ReturnGroup = Tag;
    }
    Leader = none;
    Follower = none;
    //return;    
}

function PostBeginPlay()
{
    local Mover M;

    RealRotation = Rotation;
    RealPosition = Location;
    Backup_InitialState = InitialState;
    BACKUP_bHidden = bHidden;
    // End:0x7F
    if(!bSlave)
    {
        // End:0x7E
        foreach DynamicActors(Class'Engine_Decompressed.Mover', M, Tag)
        {
            // End:0x7D
            if(M.bSlave)
            {
                M.GotoState('None');
                M.SetBase(self);
            }            
        }        
    }
    // End:0xF8
    if(bIsLeader)
    {
        Leader = self;
        // End:0xF4
        foreach DynamicActors(Class'Engine_Decompressed.Mover', M)
        {
            // End:0xF3
            if((M != self) && M.ReturnGroup == ReturnGroup)
            {
                M.Leader = self;
                M.Follower = Follower;
                Follower = M;
            }            
        }                
    }
    else
    {
        // End:0x144
        if(Leader == none)
        {
            // End:0x13C
            foreach DynamicActors(Class'Engine_Decompressed.Mover', M)
            {
                // End:0x13B
                if((M != self) && M.ReturnGroup == ReturnGroup)
                {                    
                    return;
                }                
            }            
            Leader = self;
        }
    }
    //return;    
}

function SetResetStatus(bool bNewStatus)
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    bHidden = BACKUP_bHidden;
    bResetting = bNewStatus;
    // End:0x53
    if(Follower != none)
    {
        Follower.SetResetStatus(bNewStatus);
    }
    //return;    
}

function Reset()
{
    SetResetStatus(true);
    DoClose();
    SetResetStatus(false);
    EnableTrigger();
    GotoState(Backup_InitialState, 'None');
    //return;    
}

function MakeGroupStop()
{
    bInterpolating = false;
    NetUpdateTime = Level.TimeSeconds - float(1);
    AmbientSound = none;
    GotoState(, 'None');
    // End:0x4A
    if(Follower != none)
    {
        Follower.MakeGroupStop();
    }
    //return;    
}

function MakeGroupReturn()
{
    bInterpolating = false;
    NetUpdateTime = Level.TimeSeconds - float(1);
    AmbientSound = none;
    // End:0x64
    if(bIsLeader || Leader == self)
    {
        // End:0x5C
        if(int(KeyNum) < int(PrevKeyNum))
        {
            GotoState(, 'Open');            
        }
        else
        {
            GotoState(, 'Close');
        }
    }
    // End:0x7E
    if(Follower != none)
    {
        Follower.MakeGroupReturn();
    }
    //return;    
}

function bool EncroachingOn(Actor Other)
{
    local Pawn P;

    // End:0x0D
    if(Other == none)
    {
        return false;
    }
    // End:0x85
    if(((Pawn(Other) != none) && Pawn(Other).Controller == none) || Other.IsA('Decoration'))
    {
        Other.TakeDamage(10000, none, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine_Decompressed.Crushed');
        return false;
    }
    // End:0xD1
    if(Other.IsA('Pickup'))
    {
        // End:0xCF
        if(!Other.bAlwaysRelevant && Other.Owner == none)
        {
            Other.Destroy();
        }
        return false;
    }
    // End:0x11F
    if((Other.IsA('Fragment') || Other.IsA('Gib')) || Other.IsA('Projectile'))
    {
        Other.Destroy();
        return false;
    }
    // End:0x163
    if(EncroachDamage != 0)
    {
        Other.TakeDamage(EncroachDamage, Instigator, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine_Decompressed.Crushed');
    }
    P = Pawn(Other);
    // End:0x231
    if(((P != none) && P.Controller != none) && P.IsPlayerPawn())
    {
        // End:0x1C2
        if(PlayerBumpEvent != 'None')
        {
            Bump(Other);
        }
        // End:0x231
        if((((P != none) && P.Controller != none) && P.Base != self) && P.Controller.PendingMover == self)
        {
            P.Controller.UnderLift(self);
        }
    }
    // End:0x243
    if(Leader == none)
    {
        Leader = self;
    }
    // End:0x267
    if(int(MoverEncroachType) == int(0))
    {
        Leader.MakeGroupStop();
        return true;        
    }
    else
    {
        // End:0x2B3
        if(int(MoverEncroachType) == int(1))
        {
            Leader.MakeGroupReturn();
            // End:0x2AE
            if(Other.IsA('Pawn'))
            {
                Pawn(Other).PlayMoverHitSound();
            }
            return true;            
        }
        else
        {
            // End:0x2DC
            if(int(MoverEncroachType) == int(2))
            {
                Other.KilledBy(Instigator);
                return false;                
            }
            else
            {
                // End:0x2EE
                if(int(MoverEncroachType) == int(3))
                {
                    return false;
                }
            }
        }
    }
    //return;    
}

function Bump(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x93
    if(((((bUseTriggered && P != none) && !P.IsHumanControlled()) && P.IsPlayerPawn()) && !bDelaying) && !bOpening)
    {
        Trigger(P, P);
        P.Controller.WaitForMover(self);
    }
    // End:0xB2
    if((int(BumpType) != int(2)) && P == none)
    {
        return;
    }
    // End:0xDA
    if((int(BumpType) == int(0)) && !P.IsPlayerPawn())
    {
        return;
    }
    // End:0x100
    if((int(BumpType) == int(1)) && P.bAmbientCreature)
    {
        return;
    }
    TriggerEvent(BumpEvent, self, P);
    // End:0x141
    if((P != none) && P.IsPlayerPawn())
    {
        TriggerEvent(PlayerBumpEvent, self, P);
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    // End:0xCD
    if(bDamageTriggered && float(Damage) >= DamageThreshold)
    {
        // End:0x6C
        if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Focus == self)
        {
            instigatedBy.Controller.StopFiring();
        }
        self.Trigger(self, instigatedBy);
        // End:0xCD
        if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
    //return;    
}

function DisableTrigger()
{
    //return;    
}

function EnableTrigger()
{
    //return;    
}

function SetStoppedPosition(byte NewPos)
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    StoppedPosition = NewPos;
    //return;    
}

function MoverLooped()
{
    TriggerEvent(LoopEvent, self, Instigator);
    // End:0x48
    if(LoopSound != none)
    {
        PlaySound(LoopSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
    }
    //return;    
}

function BaseStarted()
{
    //return;    
}

function BaseFinished()
{
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    // End:0x31
    if((int(DrawType) == int(8)) && StaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(StaticMesh);
    }
    //return;    
}

state OpenTimedMover
{
    function bool ShouldReTrigger()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        SetResetStatus(true);
        GotoState(Backup_InitialState, 'Close');
        //return;        
    }

    function BeginState()
    {
        EnableTrigger();
        //return;        
    }
Open:

    // End:0x10
    if(bTriggerOnceOnly)
    {
        Disable('Trigger');
    }
    bClosed = false;
    DisableTrigger();
    // End:0x3B
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    Sleep(StayOpenTime);
    // End:0x67
    if(bTriggerOnceOnly)
    {
        GotoState('WasOpenTimedMover', 'None');
    }
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    EnableTrigger();
    // End:0x99
    if(bResetting)
    {
        SetResetStatus(false);
        GotoState(Backup_InitialState, 'None');
        stop;
    }
    Sleep(StayOpenTime);
    // End:0xBD
    if(ShouldReTrigger())
    {
        SavedTrigger = none;
        GotoState('StandOpenTimed', 'Open');
    }
    stop;            
}

state WasOpenTimedMover
{
    function Reset()
    {
        SetResetStatus(true);
        GotoState(Backup_InitialState, 'Close');
        //return;        
    }
    stop;    
}

state() StandOpenTimed extends OpenTimedMover
{
    function bool ShouldReTrigger()
    {
        local int i;

        i = 0;
        J0x07:

        // End:0x37 [Loop If]
        if(i < Attached.Length)
        {
            // End:0x2D
            if(CanTrigger(Attached[i]))
            {
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x07;
        }
        return false;
        //return;        
    }

    function bool CanTrigger(Actor Other)
    {
        local Pawn P;

        P = Pawn(Other);
        // End:0x2F
        if((int(BumpType) != int(2)) && P == none)
        {
            return false;
        }
        // End:0x57
        if((int(BumpType) == int(0)) && !P.IsPlayerPawn())
        {
            return false;
        }
        // End:0x82
        if((int(BumpType) == int(1)) && Other.Mass < float(10))
        {
            return false;
        }
        TriggerEvent(BumpEvent, self, P);
        return true;
        //return;        
    }

    function Attach(Actor Other)
    {
        // End:0x12
        if(!CanTrigger(Other))
        {
            return;
        }
        SavedTrigger = none;
        GotoState('StandOpenTimed', 'Open');
        //return;        
    }

    function DisableTrigger()
    {
        Disable('Attach');
        //return;        
    }

    function EnableTrigger()
    {
        Enable('Attach');
        //return;        
    }
    stop;    
}

state() BumpOpenTimed extends OpenTimedMover
{
    function Bump(Actor Other)
    {
        // End:0x24
        if((int(BumpType) != int(2)) && Pawn(Other) == none)
        {
            return;
        }
        // End:0x51
        if((int(BumpType) == int(0)) && !Pawn(Other).IsPlayerPawn())
        {
            return;
        }
        // End:0x7C
        if((int(BumpType) == int(1)) && Other.Mass < float(10))
        {
            return;
        }
        global.Bump(Other);
        SavedTrigger = none;
        Instigator = Pawn(Other);
        Instigator.Controller.WaitForMover(self);
        GotoState('BumpOpenTimed', 'Open');
        //return;        
    }

    function DisableTrigger()
    {
        Disable('Bump');
        //return;        
    }

    function EnableTrigger()
    {
        Enable('Bump');
        //return;        
    }
    stop;    
}

state() TriggerOpenTimed extends OpenTimedMover
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x30
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        GotoState('TriggerOpenTimed', 'Open');
        //return;        
    }

    function DisableTrigger()
    {
        Disable('Trigger');
        //return;        
    }

    function EnableTrigger()
    {
        Enable('Trigger');
        //return;        
    }
    stop;    
}

state() LoopMove
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    event Trigger(Actor Other, Pawn EventInstigator)
    {
        Disable('Trigger');
        Enable('UnTrigger');
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x3E
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        bOpening = true;
        PlaySound(OpeningSound, 0);
        AmbientSound = MoveAmbientSound;
        GotoState('LoopMove', 'Running');
        //return;        
    }

    event UnTrigger(Actor Other, Pawn EventInstigator)
    {
        Disable('UnTrigger');
        Enable('Trigger');
        SavedTrigger = Other;
        Instigator = EventInstigator;
        GotoState('LoopMove', 'Stopping');
        //return;        
    }

    event KeyFrameReached()
    {
        //return;        
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
        //return;        
    }
Running:

    FinishInterpolation();
    InterpolateTo(byte(float(byte(int(KeyNum) + 1)) % float(NumKeys)), MoveTime);
    GotoState('LoopMove', 'Running');
Stopping:


    FinishInterpolation();
    FinishedOpening();
    UntriggerEvent(Event, self, Instigator);
    bOpening = false;
    stop;
    stop;        
}

state() TriggerToggle
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x2D
        if(bOpening || bDelaying)
        {
            SetResetStatus(true);
            GotoState('TriggerToggle', 'Close');
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x30
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x61
        if((int(KeyNum) == 0) || int(KeyNum) < int(PrevKeyNum))
        {
            GotoState('TriggerToggle', 'Open');            
        }
        else
        {
            GotoState('TriggerToggle', 'Close');
        }
        //return;        
    }
Open:

    bClosed = false;
    // End:0x25
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x4E
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    stop;
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;            
}

state() TriggerToggleDamageOnceOnly
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x2D
        if(bOpening || bDelaying)
        {
            SetResetStatus(true);
            GotoState('TriggerToggleDamageOnceOnly', 'Close');
        }
        //return;        
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
    {
        // End:0xE0
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x6C
            if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Focus == self)
            {
                instigatedBy.Controller.StopFiring();
            }
            // End:0x88
            if(!bDamageOnceOnly)
            {
                self.Trigger(self, instigatedBy);
            }
            bDamageOnceOnly = true;
            // End:0xE0
            if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x30
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x61
        if((int(KeyNum) == 0) || int(KeyNum) < int(PrevKeyNum))
        {
            GotoState('TriggerToggleDamageOnceOnly', 'Open');            
        }
        else
        {
            GotoState('TriggerToggleDamageOnceOnly', 'Close');
        }
        //return;        
    }
Open:

    bClosed = false;
    // End:0x25
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x4E
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    stop;
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;            
}

state() TriggerToggleInTime extends TriggerToggle
{
    function BeginState()
    {
        super(Object).BeginState();
        //return;        
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
    {
        // End:0x79
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x55
            if(((none == instigatedBy) || none == wGun(instigatedBy.Weapon)) || WeaponType != 9999)
            {
                return;
            }
            // End:0x71
            if(!bDamageOnceOnly)
            {
                self.Trigger(self, instigatedBy);
            }
            bDamageOnceOnly = true;
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x30
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x61
        if((int(KeyNum) == 0) || int(KeyNum) < int(PrevKeyNum))
        {
            GotoState('TriggerToggleInTime', 'Open');            
        }
        else
        {
            GotoState('TriggerToggleInTime', 'Close');
        }
        //return;        
    }
Open:

    bClosed = false;
    // End:0x25
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x4E
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    stop;
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;            
}

state() TriggerToggleMeleeAttack extends TriggerToggle
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
    {
        // End:0x3C
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x3C
            if(DamageType == Class'Engine_Decompressed.wDamageMelee')
            {
                self.Trigger(self, instigatedBy);
            }
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x30
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x61
        if((int(KeyNum) == 0) || int(KeyNum) < int(PrevKeyNum))
        {
            GotoState('TriggerToggleMeleeAttack', 'Open');            
        }
        else
        {
            GotoState('TriggerToggleMeleeAttack', 'Close');
        }
        //return;        
    }
Open:

    bClosed = false;
    // End:0x25
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x4E
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    stop;
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;            
}

state() TriggerToggleLauncher extends TriggerToggle
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
    {
        // End:0x3C
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x3C
            if(DamageType == Class'Engine_Decompressed.wDamageRPG')
            {
                self.Trigger(self, instigatedBy);
            }
        }
        //return;        
    }
    stop;    
}

state() TriggerControl
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x27
        if(numTriggerEvents > 0)
        {
            SetResetStatus(true);
            numTriggerEvents = 0;
            UnTrigger(none, none);
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents++;
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x37
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x4E
        if(!bOpening)
        {
            GotoState('TriggerControl', 'Open');
        }
        //return;        
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents--;
        // End:0x55
        if(numTriggerEvents <= 0)
        {
            numTriggerEvents = 0;
            SavedTrigger = Other;
            Instigator = EventInstigator;
            // End:0x49
            if(SavedTrigger != none)
            {
                SavedTrigger.BeginEvent();
            }
            GotoState('TriggerControl', 'Close');
        }
        //return;        
    }

    function BeginState()
    {
        numTriggerEvents = 0;
        //return;        
    }
Open:

    bClosed = false;
    // End:0x25
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    // End:0x36
    if(!bOpening)
    {
        DoOpen();
    }
    FinishInterpolation();
    FinishedOpening();
    // End:0x59
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    // End:0x69
    if(bTriggerOnceOnly)
    {
        GotoState('WasTriggerControl');
    }
    stop;
Close:


    // End:0x79
    if(bOpening)
    {
        DoClose();
    }
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;            
}

state WasTriggerControl
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('TriggerControl', 'Close');
        //return;        
    }
    stop;    
}

state() TriggerPound
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x27
        if(numTriggerEvents > 0)
        {
            SetResetStatus(true);
            numTriggerEvents = 0;
            UnTrigger(none, none);
        }
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents++;
        SavedTrigger = Other;
        Instigator = EventInstigator;
        GotoState('TriggerPound', 'Open');
        //return;        
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents--;
        // End:0x33
        if(numTriggerEvents <= 0)
        {
            numTriggerEvents = 0;
            SavedTrigger = none;
            Instigator = none;
            GotoState('TriggerPound', 'Close');
        }
        //return;        
    }

    function BeginState()
    {
        numTriggerEvents = 0;
        //return;        
    }
Open:

    // End:0x10
    if(bTriggerOnceOnly)
    {
        Disable('Trigger');
    }
    bClosed = false;
    // End:0x35
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    Sleep(OtherTime);
Close:


    DoClose();
    FinishInterpolation();
    Sleep(StayOpenTime);
    SetResetStatus(false);
    // End:0x6E
    if(bTriggerOnceOnly)
    {
        GotoState('WasTriggerPound');
    }
    // End:0x7F
    if(SavedTrigger != none)
    {
        goto 'Open';
    }
    stop;                    
}

state WasTriggerPound
{
    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('TriggerPound', 'Open');
        //return;        
    }
    stop;    
}

state() TriggerAdvance
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        numTriggerEvents = 0;
        GotoState('TriggerAdvance', 'Close');
        //return;        
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents++;
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x37
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        SetStoppedPosition(0);
        SetPhysics(8);
        AmbientSound = MoveAmbientSound;
        // End:0x66
        if(!bOpening)
        {
            GotoState('TriggerAdvance', 'Open');
        }
        //return;        
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        numTriggerEvents--;
        // End:0x5D
        if(numTriggerEvents <= 0)
        {
            AmbientSound = none;
            numTriggerEvents = 0;
            SavedTrigger = Other;
            Instigator = EventInstigator;
            // End:0x50
            if(SavedTrigger != none)
            {
                SavedTrigger.BeginEvent();
            }
            SetStoppedPosition(1);
            SetPhysics(0);
        }
        //return;        
    }

    function BeginState()
    {
        numTriggerEvents = 0;
        //return;        
    }

    function EndState()
    {
        AmbientSound = none;
        //return;        
    }
Open:

    // End:0x1C
    if(int(Physics) == int(0))
    {
        GotoState('TriggerAdvance', 'None');
    }
    bClosed = false;
    // End:0x41
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    // End:0x5D
    if(int(Physics) == int(0))
    {
        GotoState('TriggerAdvance', 'None');
    }
    SetStoppedPosition(0);
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x8E
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    GotoState('WasTriggerAdvance');
    stop;
Close:


    SetStoppedPosition(0);
    SetPhysics(8);
    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;
    stop;        
}

state WasTriggerAdvance
{
    function bool SelfTriggered()
    {
        return false;
        //return;        
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('TriggerAdvance', 'Close');
        //return;        
    }
    stop;    
}

state() BumpButton
{
    function Bump(Actor Other)
    {
        // End:0x24
        if((int(BumpType) != int(2)) && Pawn(Other) == none)
        {
            return;
        }
        // End:0x51
        if((int(BumpType) == int(0)) && !Pawn(Other).IsPlayerPawn())
        {
            return;
        }
        // End:0x7C
        if((int(BumpType) == int(1)) && Other.Mass < float(10))
        {
            return;
        }
        global.Bump(Other);
        SavedTrigger = Other;
        Instigator = Pawn(Other);
        Instigator.Controller.WaitForMover(self);
        GotoState('BumpButton', 'Open');
        //return;        
    }

    function BeginEvent()
    {
        bSlave = true;
        //return;        
    }

    function EndEvent()
    {
        bSlave = false;
        Instigator = none;
        GotoState('BumpButton', 'Close');
        //return;        
    }
Open:

    // End:0x10
    if(bTriggerOnceOnly)
    {
        Disable('Trigger');
    }
    bClosed = false;
    Disable('Bump');
    // End:0x3C
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x5B
    if(bTriggerOnceOnly)
    {
        GotoState('WasBumpButton');
    }
    // End:0x65
    if(bSlave)
    {
        stop;
    }
Close:


    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    Enable('Bump');
    stop;        
}

state WasBumpButton
{
    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('BumpButton', 'Close');
        //return;        
    }
    stop;    
}

state() ConstantLoop
{
    event KeyFrameReached()
    {
        // End:0x63
        if(bOscillatingLoop)
        {
            // End:0x42
            if((int(KeyNum) == 0) || int(KeyNum) == (int(NumKeys) - 1))
            {
                StepDirection *= float(-1);
                MoverLooped();
            }
            KeyNum += byte(StepDirection);
            InterpolateTo(KeyNum, MoveTime);            
        }
        else
        {
            InterpolateTo(byte(float(byte(int(KeyNum) + 1)) % float(NumKeys)), MoveTime);
            // End:0x9A
            if(int(KeyNum) == 0)
            {
                MoverLooped();
            }
        }
        //return;        
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
        //return;        
    }
Begin:

    InterpolateTo(1, MoveTime);
Running:


    FinishInterpolation();
    GotoState('ConstantLoop', 'Running');
    stop;                
}

state() LeadInOutLooper
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x42
        if(int(NumKeys) < 3)
        {
            Log("LeadInOutLooper detected with <3 movement keys");
            return;
        }
        InterpolateTo(1, MoveTime);
        //return;        
    }

    event KeyFrameReached()
    {
        // End:0x21
        if(int(KeyNum) != 0)
        {
            InterpolateTo(2, MoveTime);
            GotoState('LeadInOutLooping');
        }
        //return;        
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
        //return;        
    }
    stop;    
}

state LeadInOutLooping
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        InterpolateTo(0, MoveTime);
        GotoState('LeadInOutLooper');
        //return;        
    }

    event KeyFrameReached()
    {
        // End:0x63
        if(bOscillatingLoop)
        {
            // End:0x42
            if((int(KeyNum) == 1) || int(KeyNum) == (int(NumKeys) - 1))
            {
                StepDirection *= float(-1);
                MoverLooped();
            }
            KeyNum += byte(StepDirection);
            InterpolateTo(KeyNum, MoveTime);            
        }
        else
        {
            KeyNum++;
            // End:0x8B
            if(int(KeyNum) == int(NumKeys))
            {
                KeyNum = 1;
                MoverLooped();
            }
            InterpolateTo(KeyNum, MoveTime);
        }
        //return;        
    }
    stop;    
}

state() RotatingMover
{
    simulated function BaseStarted()
    {
        local Actor OldBase;

        bFixedRotationDir = true;
        OldBase = Base;
        SetPhysics(5);
        SetBase(OldBase);
        //return;        
    }

    simulated function BaseFinished()
    {
        local Actor OldBase;

        OldBase = Base;
        SetPhysics(0);
        SetBase(OldBase);
        // End:0x5A
        if(bToggleDirection)
        {
            RotationRate.Yaw *= float(-1);
            RotationRate.Pitch *= float(-1);
            RotationRate.Roll *= float(-1);
        }
        //return;        
    }

    simulated function BeginState()
    {
        SetTimer(0.0000000, false);
        //return;        
    }
    stop;    
}

defaultproperties
{
    MoverEncroachType=1
    MoverGlideType=1
    NumKeys=2
    MoveTime=1.0000000
    StayOpenTime=4.0000000
    bToggleDirection=true
    bClosed=true
    StepDirection=1
    bUseDynamicLights=true
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    Physics=8
    RemoteRole=2
    NetUpdateFrequency=1.0000000
    NetPriority=2.7000000
    InitialState="BumpOpenTimed"
    bShadowCast=true
    SoundVolume=228
    TransientSoundVolume=1.0000000
    CollisionRadius=160.0000000
    CollisionHeight=160.0000000
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
    bPathColliding=true
}