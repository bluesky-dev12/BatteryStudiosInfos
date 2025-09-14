/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Mover.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:3
 *	Properties:79
 *	Functions:28
 *	States:24
 *
 *******************************************************************************/
class Mover extends Actor
    native
    nativereplication
    notplaceable;

enum EMoverEncroachType
{
    ME_StopWhenEncroach,
    ME_ReturnWhenEncroach,
    ME_CrushWhenEncroach,
    ME_IgnoreWhenEncroach
};

enum EMoverGlideType
{
    MV_MoveByTime,
    MV_GlideByTime
};

enum EBumpType
{
    BT_PlayerBump,
    BT_PawnBump,
    BT_AnyBump
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
    // Pos:0x00
    reliable if(Role == 4)
        SimOldPos, SimOldRotPitch,
        SimOldRotYaw, SimOldRotRoll,
        SimInterpolate, RealPosition,
        RealRotation, StoppedPosition;

}

function bool SelfTriggered()
{
    return true;
}

function Actor SpecialHandling(Pawn Other)
{
    local Actor A;

    // End:0x3c
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
}

simulated function StartInterpolation()
{
    GotoState('None');
    bInterpolating = true;
    SetPhysics(0);
}

simulated function Timer()
{
    // End:0x2a
    if(Velocity != vect(0.0, 0.0, 0.0))
    {
        // End:0x28
        if(bClientPause)
        {
            bClientPause = false;
        }
        return;
    }
    // End:0xc9
    if(Level.NetMode == 3 && !bClientAuthoritative)
    {
        // End:0xbe
        if(ClientUpdate == 0)
        {
            // End:0xa4
            if(bClientPause)
            {
                // End:0x86
                if(VSize(RealPosition - Location) > float(3))
                {
                    SetLocation(RealPosition);
                }
                // End:0x91
                else
                {
                    RealPosition = Location;
                }
                SetRotation(RealRotation);
                bClientPause = false;
            }
            // End:0xbb
            else
            {
                // End:0xbb
                if(RealPosition != Location)
                {
                    bClientPause = true;
                }
            }
        }
        // End:0xc6
        else
        {
            bClientPause = false;
        }
    }
    // End:0x106
    else
    {
        // End:0x106
        if(bCollideActors)
        {
            // End:0xec
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
}

final simulated function InterpolateTo(byte NewKeyNum, float Seconds)
{
    local Mover M;

    // End:0x20
    foreach BasedActors(class'Mover', M)
    {
        M.BaseStarted();                
    }
    NewKeyNum = byte(Clamp(NewKeyNum, 0, 24 - 1));
    // End:0xaa
    if(NewKeyNum == PrevKeyNum && KeyNum != PrevKeyNum)
    {
        PhysAlpha = 1.0 - PhysAlpha;
        OldPos = BasePos + KeyPos[KeyNum];
        OldRot = BaseRot + KeyRot[KeyNum];
    }
    // End:0xcb
    else
    {
        OldPos = Location;
        OldRot = Rotation;
        PhysAlpha = 0.0;
    }
    // End:0xdf
    if(bResetting)
    {
        Seconds = 0.0050;
    }
    SetPhysics(8);
    bInterpolating = true;
    PrevKeyNum = KeyNum;
    KeyNum = NewKeyNum;
    PhysRate = 1.0 / FMax(Seconds, 0.0050);
    ++ ClientUpdate;
    SimOldPos = OldPos;
    SimOldRotYaw = OldRot.Yaw;
    SimOldRotPitch = OldRot.Pitch;
    SimOldRotRoll = OldRot.Roll;
    SimInterpolate.X = 100.0 * PhysAlpha;
    SimInterpolate.Y = 100.0 * FMax(0.010, PhysRate);
    SimInterpolate.Z = 256.0 * float(PrevKeyNum) + float(KeyNum);
    NetUpdateTime = Level.TimeSeconds - float(1);
}

final function SetKeyframe(byte NewKeyNum, Vector NewLocation, Rotator NewRotation)
{
    KeyNum = byte(Clamp(NewKeyNum, 0, 24 - 1));
    KeyPos[KeyNum] = NewLocation;
    KeyRot[KeyNum] = NewRotation;
}

simulated event KeyFrameReached()
{
    local byte OldKeyNum;
    local Mover M;

    OldKeyNum = PrevKeyNum;
    PrevKeyNum = KeyNum;
    PhysAlpha = 0.0;
    -- ClientUpdate;
    // End:0x64
    if(KeyNum > 0 && KeyNum < OldKeyNum)
    {
        InterpolateTo(byte(KeyNum - 1), MoveTime);
    }
    // End:0x14f
    else
    {
        // End:0xa9
        if(KeyNum < NumKeys - 1 && KeyNum > OldKeyNum)
        {
            InterpolateTo(byte(KeyNum + 1), MoveTime);
        }
        // End:0x14f
        else
        {
            AmbientSound = none;
            NetUpdateTime = Level.TimeSeconds - float(1);
            // End:0xe7
            if(bJumpLift && KeyNum == 1)
            {
                FinishNotify();
            }
            // End:0x14f
            if(ClientUpdate == 0 && Level.NetMode != 3 || bClientAuthoritative)
            {
                RealPosition = Location;
                RealRotation = Rotation;
                // End:0x14e
                foreach BasedActors(class'Mover', M)
                {
                    M.BaseFinished();                                        
                }
            }
        }
    }
}

function FinishNotify()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x6f [While If]
    if(C != none)
    {
        // End:0x58
        if(C.Pawn != none && C.PendingMover == self)
        {
            C.MoverFinished();
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function FinishedClosing()
{
    local Mover M;

    PlaySound(ClosedSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
    TriggerEvent(ClosedEvent, self, Instigator);
    // End:0x57
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    SavedTrigger = none;
    Instigator = none;
    // End:0x7f
    if(myMarker != none)
    {
        myMarker.MoverClosed();
    }
    bClosed = true;
    FinishNotify();
    M = Leader;
    J0x98:
    // End:0xd0 [While If]
    if(M != none)
    {
        // End:0xb9
        if(!M.bClosed)
        {
            return;
        }
        M = M.Follower;
        // This is an implied JumpToken; Continue!
        goto J0x98;
    }
    UntriggerEvent(OpeningEvent, self, Instigator);
}

function FinishedOpening()
{
    PlaySound(OpenedSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
    TriggerEvent(Event, self, Instigator);
    TriggerEvent(OpenedEvent, self, Instigator);
    // End:0x68
    if(myMarker != none)
    {
        myMarker.MoverOpened();
    }
    FinishNotify();
}

function DoOpen()
{
    bOpening = true;
    bDelaying = false;
    InterpolateTo(1, MoveTime);
    MakeNoise(1.0);
    PlaySound(OpeningSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
    AmbientSound = MoveAmbientSound;
    TriggerEvent(OpeningEvent, self, Instigator);
    // End:0x87
    if(Follower != none)
    {
        Follower.DoOpen();
    }
}

function DoClose()
{
    bOpening = false;
    bDelaying = false;
    InterpolateTo(byte(Max(0, KeyNum - 1)), MoveTime);
    MakeNoise(1.0);
    PlaySound(ClosingSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
    UntriggerEvent(Event, self, Instigator);
    AmbientSound = MoveAmbientSound;
    TriggerEvent(ClosingEvent, self, Instigator);
    // End:0xa5
    if(Follower != none)
    {
        Follower.DoClose();
    }
}

simulated function BeginPlay()
{
    local AntiPortalActor AntiPortalA;

    // End:0x4b
    if(AntiPortalTag != 'None')
    {
        // End:0x4a
        foreach AllActors(class'AntiPortalActor', AntiPortalA, AntiPortalTag)
        {
            AntiPortals.Length = AntiPortals.Length + 1;
            AntiPortals[AntiPortals.Length - 1] = AntiPortalA;                        
        }
    }
    // End:0xaf
    if(Level.NetMode != 0)
    {
        // End:0x94
        if(Level.NetMode == 3 && bClientAuthoritative)
        {
            SetTimer(4.0, true);
        }
        // End:0x9d
        else
        {
            SetTimer(1.0, true);
        }
        // End:0xaf
        if(Role < 4)
        {
            return;
        }
    }
    RealPosition = Location;
    RealRotation = Rotation;
    super.BeginPlay();
    KeyNum = byte(Clamp(KeyNum, 0, 24 - 1));
    PhysAlpha = 0.0;
    StartKeyNum = KeyNum;
    Move(BasePos + KeyPos[KeyNum] - Location);
    SetRotation(BaseRot + KeyRot[KeyNum]);
    // End:0x148
    if(ReturnGroup == 'None')
    {
        ReturnGroup = Tag;
    }
    Leader = none;
    Follower = none;
}

function PostBeginPlay()
{
    local Mover M;

    RealRotation = Rotation;
    RealPosition = Location;
    Backup_InitialState = InitialState;
    BACKUP_bHidden = bHidden;
    // End:0x7f
    if(!bSlave)
    {
        // End:0x7e
        foreach DynamicActors(class'Mover', M, Tag)
        {
            // End:0x7d
            if(M.bSlave)
            {
                M.GotoState('None');
                M.SetBase(self);
            }                        
        }
    }
    // End:0xf8
    if(bIsLeader)
    {
        Leader = self;
        // End:0xf4
        foreach DynamicActors(class'Mover', M)
        {
            // End:0xf3
            if(M != self && M.ReturnGroup == ReturnGroup)
            {
                M.Leader = self;
                M.Follower = Follower;
                Follower = M;
            }                        
        }
    }
    // End:0x144
    else
    {
        // End:0x144
        if(Leader == none)
        {
            // End:0x13c
            foreach DynamicActors(class'Mover', M)
            {
                // End:0x13b
                if(M != self && M.ReturnGroup == ReturnGroup)
                {
                    break;
                    return;
                }                                
            }
            Leader = self;
        }
    }
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
}

function Reset()
{
    SetResetStatus(true);
    DoClose();
    SetResetStatus(false);
    EnableTrigger();
    GotoState(Backup_InitialState, 'None');
}

function MakeGroupStop()
{
    bInterpolating = false;
    NetUpdateTime = Level.TimeSeconds - float(1);
    AmbientSound = none;
    GotoState(, 'None');
    // End:0x4a
    if(Follower != none)
    {
        Follower.MakeGroupStop();
    }
}

function MakeGroupReturn()
{
    bInterpolating = false;
    NetUpdateTime = Level.TimeSeconds - float(1);
    AmbientSound = none;
    // End:0x64
    if(bIsLeader || Leader == self)
    {
        // End:0x5c
        if(KeyNum < PrevKeyNum)
        {
            GotoState(, 'Open');
        }
        // End:0x64
        else
        {
            GotoState(, 'Close');
        }
    }
    // End:0x7e
    if(Follower != none)
    {
        Follower.MakeGroupReturn();
    }
}

function bool EncroachingOn(Actor Other)
{
    local Pawn P;

    // End:0x0d
    if(Other == none)
    {
        return false;
    }
    // End:0x85
    if(Pawn(Other) != none && Pawn(Other).Controller == none || Other.IsA('Decoration'))
    {
        Other.TakeDamage(10000, none, Other.Location, vect(0.0, 0.0, 0.0), class'Crushed');
        return false;
    }
    // End:0xd1
    if(Other.IsA('Pickup'))
    {
        // End:0xcf
        if(!Other.bAlwaysRelevant && Other.Owner == none)
        {
            Other.Destroy();
        }
        return false;
    }
    // End:0x11f
    if(Other.IsA('Fragment') || Other.IsA('Gib') || Other.IsA('Projectile'))
    {
        Other.Destroy();
        return false;
    }
    // End:0x163
    if(EncroachDamage != 0)
    {
        Other.TakeDamage(EncroachDamage, Instigator, Other.Location, vect(0.0, 0.0, 0.0), class'Crushed');
    }
    P = Pawn(Other);
    // End:0x231
    if(P != none && P.Controller != none && P.IsPlayerPawn())
    {
        // End:0x1c2
        if(PlayerBumpEvent != 'None')
        {
            Bump(Other);
        }
        // End:0x231
        if(P != none && P.Controller != none && P.Base != self && P.Controller.PendingMover == self)
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
    if(MoverEncroachType == 0)
    {
        Leader.MakeGroupStop();
        return true;
    }
    // End:0x2ee
    else
    {
        // End:0x2b3
        if(MoverEncroachType == 1)
        {
            Leader.MakeGroupReturn();
            // End:0x2ae
            if(Other.IsA('Pawn'))
            {
                Pawn(Other).PlayMoverHitSound();
            }
            return true;
        }
        // End:0x2ee
        else
        {
            // End:0x2dc
            if(MoverEncroachType == 2)
            {
                Other.KilledBy(Instigator);
                return false;
            }
            // End:0x2ee
            else
            {
                // End:0x2ee
                if(MoverEncroachType == 3)
                {
                    return false;
                }
            }
        }
    }
}

function Bump(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x93
    if(bUseTriggered && P != none && !P.IsHumanControlled() && P.IsPlayerPawn() && !bDelaying && !bOpening)
    {
        Trigger(P, P);
        P.Controller.WaitForMover(self);
    }
    // End:0xb2
    if(BumpType != 2 && P == none)
    {
        return;
    }
    // End:0xda
    if(BumpType == 0 && !P.IsPlayerPawn())
    {
        return;
    }
    // End:0x100
    if(BumpType == 1 && P.bAmbientCreature)
    {
        return;
    }
    TriggerEvent(BumpEvent, self, P);
    // End:0x141
    if(P != none && P.IsPlayerPawn())
    {
        TriggerEvent(PlayerBumpEvent, self, P);
    }
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0xcd
    if(bDamageTriggered && float(Damage) >= DamageThreshold)
    {
        // End:0x6c
        if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Focus == self)
        {
            instigatedBy.Controller.StopFiring();
        }
        self.Trigger(self, instigatedBy);
        // End:0xcd
        if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
}

function DisableTrigger();
function EnableTrigger();
function SetStoppedPosition(byte NewPos)
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    StoppedPosition = NewPos;
}

function MoverLooped()
{
    TriggerEvent(LoopEvent, self, Instigator);
    // End:0x48
    if(LoopSound != none)
    {
        PlaySound(LoopSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
    }
}

function BaseStarted();
function BaseFinished();
simulated function UpdatePrecacheStaticMeshes()
{
    // End:0x31
    if(DrawType == 8 && StaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(StaticMesh);
    }
}

state OpenTimedMover
{
    function bool ShouldReTrigger()
    {
        return false;
    }

    function Reset()
    {
        SetResetStatus(true);
        GotoState(Backup_InitialState, 'Close');
    }

    function BeginState()
    {
        EnableTrigger();
    }

Open:
    // End:0x10
    if(bTriggerOnceOnly)
    {
        Disable('Trigger');
    }
    bClosed = false;
    DisableTrigger();
    // End:0x3b
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
    // End:0xbd
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
    }

}

state() StandOpenTimed extends OpenTimedMover
{
    function bool ShouldReTrigger()
    {
        local int i;

        i = 0;
        J0x07:
        // End:0x37 [While If]
        if(i < Attached.Length)
        {
            // End:0x2d
            if(CanTrigger(Attached[i]))
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
        return false;
    }

    function bool CanTrigger(Actor Other)
    {
        local Pawn P;

        P = Pawn(Other);
        // End:0x2f
        if(BumpType != 2 && P == none)
        {
            return false;
        }
        // End:0x57
        if(BumpType == 0 && !P.IsPlayerPawn())
        {
            return false;
        }
        // End:0x82
        if(BumpType == 1 && Other.Mass < float(10))
        {
            return false;
        }
        TriggerEvent(BumpEvent, self, P);
        return true;
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
    }

    function DisableTrigger()
    {
        Disable('Attach');
    }

    function EnableTrigger()
    {
        Enable('Attach');
    }

}

state() BumpOpenTimed extends OpenTimedMover
{
    function Bump(Actor Other)
    {
        // End:0x24
        if(BumpType != 2 && Pawn(Other) == none)
        {
            return;
        }
        // End:0x51
        if(BumpType == 0 && !Pawn(Other).IsPlayerPawn())
        {
            return;
        }
        // End:0x7c
        if(BumpType == 1 && Other.Mass < float(10))
        {
            return;
        }
        global.Bump(Other);
        SavedTrigger = none;
        Instigator = Pawn(Other);
        Instigator.Controller.WaitForMover(self);
        GotoState('BumpOpenTimed', 'Open');
    }

    function DisableTrigger()
    {
        Disable('Bump');
    }

    function EnableTrigger()
    {
        Enable('Bump');
    }

}

state() TriggerOpenTimed extends OpenTimedMover
{
    function bool SelfTriggered()
    {
        return false;
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
    }

    function DisableTrigger()
    {
        Disable('Trigger');
    }

    function EnableTrigger()
    {
        Enable('Trigger');
    }

}

state() LoopMove
{
    function bool SelfTriggered()
    {
        return false;
    }

    event Trigger(Actor Other, Pawn EventInstigator)
    {
        Disable('Trigger');
        Enable('UnTrigger');
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x3e
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        bOpening = true;
        PlaySound(OpeningSound, 0);
        AmbientSound = MoveAmbientSound;
        GotoState('LoopMove', 'Running');
    }

    event UnTrigger(Actor Other, Pawn EventInstigator)
    {
        Disable('UnTrigger');
        Enable('Trigger');
        SavedTrigger = Other;
        Instigator = EventInstigator;
        GotoState('LoopMove', 'Stopping');
    }

    event KeyFrameReached();
    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
    }

Running:
    FinishInterpolation();
    InterpolateTo(byte(float(byte(KeyNum + 1)) % float(NumKeys)), MoveTime);
    GotoState('LoopMove', 'Running');
Stopping:

    FinishInterpolation();
    FinishedOpening();
    UntriggerEvent(Event, self, Instigator);
    bOpening = false;
    stop;
}

state() TriggerToggle
{
    function bool SelfTriggered()
    {
        return false;
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x2d
        if(bOpening || bDelaying)
        {
            SetResetStatus(true);
            GotoState('TriggerToggle', 'Close');
        }
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
        if(KeyNum == 0 || KeyNum < PrevKeyNum)
        {
            GotoState('TriggerToggle', 'Open');
        }
        // End:0x6d
        else
        {
            GotoState('TriggerToggle', 'Close');
        }
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
    // End:0x4e
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
Close:

    stop;
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
    }

    function Reset()
    {
        super(Actor).Reset();
        // End:0x2d
        if(bOpening || bDelaying)
        {
            SetResetStatus(true);
            GotoState('TriggerToggleDamageOnceOnly', 'Close');
        }
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0xe0
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x6c
            if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Focus == self)
            {
                instigatedBy.Controller.StopFiring();
            }
            // End:0x88
            if(!bDamageOnceOnly)
            {
                self.Trigger(self, instigatedBy);
            }
            bDamageOnceOnly = true;
            // End:0xe0
            if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
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
        if(KeyNum == 0 || KeyNum < PrevKeyNum)
        {
            GotoState('TriggerToggleDamageOnceOnly', 'Open');
        }
        // End:0x6d
        else
        {
            GotoState('TriggerToggleDamageOnceOnly', 'Close');
        }
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
    // End:0x4e
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
Close:

    stop;
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
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0x79
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x55
            if(none == instigatedBy || none == wGun(instigatedBy.Weapon) || WeaponType != 9999)
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
        if(KeyNum == 0 || KeyNum < PrevKeyNum)
        {
            GotoState('TriggerToggleInTime', 'Open');
        }
        // End:0x6d
        else
        {
            GotoState('TriggerToggleInTime', 'Close');
        }
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
    // End:0x4e
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
Close:

    stop;
    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;
}

state() TriggerToggleMeleeAttack extends TriggerToggle
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0x3c
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x3c
            if(DamageType == class'wDamageMelee')
            {
                self.Trigger(self, instigatedBy);
            }
        }
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
        if(KeyNum == 0 || KeyNum < PrevKeyNum)
        {
            GotoState('TriggerToggleMeleeAttack', 'Open');
        }
        // End:0x6d
        else
        {
            GotoState('TriggerToggleMeleeAttack', 'Close');
        }
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
    // End:0x4e
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
Close:

    stop;
    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;
}

state() TriggerToggleLauncher extends TriggerToggle
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0x3c
        if(bDamageTriggered && float(Damage) >= DamageThreshold)
        {
            // End:0x3c
            if(DamageType == class'wDamageRPG')
            {
                self.Trigger(self, instigatedBy);
            }
        }
    }

}

state() TriggerControl
{
    function bool SelfTriggered()
    {
        return false;
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
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        ++ numTriggerEvents;
        SavedTrigger = Other;
        Instigator = EventInstigator;
        // End:0x37
        if(SavedTrigger != none)
        {
            SavedTrigger.BeginEvent();
        }
        // End:0x4e
        if(!bOpening)
        {
            GotoState('TriggerControl', 'Open');
        }
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        -- numTriggerEvents;
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
    }

    function BeginState()
    {
        numTriggerEvents = 0;
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
Close:

    stop;
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
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('TriggerControl', 'Close');
    }

}

state() TriggerPound
{
    function bool SelfTriggered()
    {
        return false;
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
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        ++ numTriggerEvents;
        SavedTrigger = Other;
        Instigator = EventInstigator;
        GotoState('TriggerPound', 'Open');
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        -- numTriggerEvents;
        // End:0x33
        if(numTriggerEvents <= 0)
        {
            numTriggerEvents = 0;
            SavedTrigger = none;
            Instigator = none;
            GotoState('TriggerPound', 'Close');
        }
    }

    function BeginState()
    {
        numTriggerEvents = 0;
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
    // End:0x6e
    if(bTriggerOnceOnly)
    {
        GotoState('WasTriggerPound');
    }
    // End:0x7f
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
    }

}

state() TriggerAdvance
{
    function bool SelfTriggered()
    {
        return false;
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        numTriggerEvents = 0;
        GotoState('TriggerAdvance', 'Close');
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        ++ numTriggerEvents;
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
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        -- numTriggerEvents;
        // End:0x5d
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
    }

    function BeginState()
    {
        numTriggerEvents = 0;
    }

    function EndState()
    {
        AmbientSound = none;
    }

Open:
    // End:0x1c
    if(Physics == 0)
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
    // End:0x5d
    if(Physics == 0)
    {
        GotoState('TriggerAdvance', 'None');
    }
    SetStoppedPosition(0);
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x8e
    if(SavedTrigger != none)
    {
        SavedTrigger.EndEvent();
    }
    GotoState('WasTriggerAdvance');
Close:

    stop;
    SetStoppedPosition(0);
    SetPhysics(8);
    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    stop;
}

state WasTriggerAdvance
{
    function bool SelfTriggered()
    {
        return false;
    }

    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('TriggerAdvance', 'Close');
    }

}

state() BumpButton
{
    function Bump(Actor Other)
    {
        // End:0x24
        if(BumpType != 2 && Pawn(Other) == none)
        {
            return;
        }
        // End:0x51
        if(BumpType == 0 && !Pawn(Other).IsPlayerPawn())
        {
            return;
        }
        // End:0x7c
        if(BumpType == 1 && Other.Mass < float(10))
        {
            return;
        }
        global.Bump(Other);
        SavedTrigger = Other;
        Instigator = Pawn(Other);
        Instigator.Controller.WaitForMover(self);
        GotoState('BumpButton', 'Open');
    }

    function BeginEvent()
    {
        bSlave = true;
    }

    function EndEvent()
    {
        bSlave = false;
        Instigator = none;
        GotoState('BumpButton', 'Close');
    }

Open:
    // End:0x10
    if(bTriggerOnceOnly)
    {
        Disable('Trigger');
    }
    bClosed = false;
    Disable('Bump');
    // End:0x3c
    if(DelayTime > float(0))
    {
        bDelaying = true;
        Sleep(DelayTime);
    }
    DoOpen();
    FinishInterpolation();
    FinishedOpening();
    // End:0x5b
    if(bTriggerOnceOnly)
    {
        GotoState('WasBumpButton');
    }
    // End:0x65
    if(bSlave)
    {
Close:

        stop;
    }
    DoClose();
    FinishInterpolation();
    FinishedClosing();
    SetResetStatus(false);
    Enable('Bump');
}

state WasBumpButton
{
    function Reset()
    {
        super(Actor).Reset();
        SetResetStatus(true);
        GotoState('BumpButton', 'Close');
    }

}

state() ConstantLoop
{
    event KeyFrameReached()
    {
        // End:0x63
        if(bOscillatingLoop)
        {
            // End:0x42
            if(KeyNum == 0 || KeyNum == NumKeys - 1)
            {
                StepDirection *= float(-1);
                MoverLooped();
            }
            KeyNum += byte(StepDirection);
            InterpolateTo(KeyNum, MoveTime);
        }
        // End:0x9a
        else
        {
            InterpolateTo(byte(float(byte(KeyNum + 1)) % float(NumKeys)), MoveTime);
            // End:0x9a
            if(KeyNum == 0)
            {
                MoverLooped();
            }
        }
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
    }

Begin:
    InterpolateTo(1, MoveTime);
Running:

    FinishInterpolation();
    GotoState('ConstantLoop', 'Running');
    stop;    
}

state() ConstantLoopToggleVisibility
{
    event KeyFrameReached()
    {
        // End:0x63
        if(bOscillatingLoop)
        {
            // End:0x42
            if(KeyNum == 0 || KeyNum == NumKeys - 1)
            {
                StepDirection *= float(-1);
                MoverLooped();
            }
            KeyNum += byte(StepDirection);
            InterpolateTo(KeyNum, MoveTime);
        }
        // End:0x9a
        else
        {
            InterpolateTo(byte(float(byte(KeyNum + 1)) % float(NumKeys)), MoveTime);
            // End:0x9a
            if(KeyNum == 0)
            {
                MoverLooped();
            }
        }
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        bHidden = !bHidden;
        // End:0x27
        if(bHidden)
        {
            GotoState('ConstantLoopToggleVisibility', 'Close');
        }
        // End:0x33
        else
        {
            GotoState('ConstantLoopToggleVisibility', 'Running');
        }
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
    }

Begin:
    InterpolateTo(1, MoveTime);
Running:

    FinishInterpolation();
    GotoState('ConstantLoopToggleVisibility', 'Running');
    stop;    
}

state() LeadInOutLooper
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x42
        if(NumKeys < 3)
        {
            Log("LeadInOutLooper detected with <3 movement keys");
            return;
        }
        InterpolateTo(1, MoveTime);
    }

    event KeyFrameReached()
    {
        // End:0x21
        if(KeyNum != 0)
        {
            InterpolateTo(2, MoveTime);
            GotoState('LeadInOutLooping');
        }
    }

    function BeginState()
    {
        bOpening = false;
        bDelaying = false;
    }

}

state LeadInOutLooping
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        InterpolateTo(0, MoveTime);
        GotoState('LeadInOutLooper');
    }

    event KeyFrameReached()
    {
        // End:0x63
        if(bOscillatingLoop)
        {
            // End:0x42
            if(KeyNum == 1 || KeyNum == NumKeys - 1)
            {
                StepDirection *= float(-1);
                MoverLooped();
            }
            KeyNum += byte(StepDirection);
            InterpolateTo(KeyNum, MoveTime);
        }
        // End:0x9b
        else
        {
            ++ KeyNum;
            // End:0x8b
            if(KeyNum == NumKeys)
            {
                KeyNum = 1;
                MoverLooped();
            }
            InterpolateTo(KeyNum, MoveTime);
        }
    }

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
    }

    simulated function BaseFinished()
    {
        local Actor OldBase;

        OldBase = Base;
        SetPhysics(0);
        SetBase(OldBase);
        // End:0x5a
        if(bToggleDirection)
        {
            RotationRate.Yaw *= float(-1);
            RotationRate.Pitch *= float(-1);
            RotationRate.Roll *= float(-1);
        }
    }

    simulated function BeginState()
    {
        SetTimer(0.0, false);
    }

}

defaultproperties
{
    MoverEncroachType=1
    MoverGlideType=1
    NumKeys=2
    MoveTime=1.0
    StayOpenTime=4.0
    bToggleDirection=true
    bClosed=true
    StepDirection=1
    bUseDynamicLights=true
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    Physics=8
    RemoteRole=2
    NetUpdateFrequency=1.0
    NetPriority=2.70
    InitialState=BumpOpenTimed
    bShadowCast=true
    SoundVolume=228
    TransientSoundVolume=1.0
    CollisionRadius=160.0
    CollisionHeight=160.0
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
    bPathColliding=true
}