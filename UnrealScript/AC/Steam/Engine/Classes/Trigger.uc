/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Trigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:14
 *	Functions:14
 *	States:7
 *
 *******************************************************************************/
class Trigger extends Triggers
    native
    placeable;

enum ETriggerType
{
    TT_PlayerProximity,
    TT_PawnProximity,
    TT_ClassProximity,
    TT_AnyProximity,
    TT_Shoot,
    TT_HumanPlayerProximity,
    TT_LivePlayerProximity
};

var() Trigger.ETriggerType TriggerType;
var() localized string Message;
var() localized int UniqueID;
var() bool bTriggerOnceOnly;
var() bool bInitiallyActive;
var() class<Actor> ClassProximityType;
var() float RepeatTriggerTime;
var() float ReTriggerDelay;
var float TriggerTime;
var() float DamageThreshold;
var Actor TriggerActor;
var Actor TriggerActor2;
var bool bSavedInitialCollision;
var bool bSavedInitialActive;

function PlayerToucherDied(Pawn P)
{
    // End:0x2c
    if(bInitiallyActive && TriggerType == 6)
    {
        UntriggerEvent(Event, self, P);
    }
}

function bool SelfTriggered()
{
    return bInitiallyActive;
}

function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x77
    if(TriggerType == 0 || TriggerType == 1 || TriggerType == 5 || TriggerType == 6 || TriggerType == 2 && ClassIsChildOf(ClassProximityType, class'Pawn'))
    {
        OnlyAffectPawns(true);
    }
}

function PostBeginPlay()
{
    // End:0x11
    if(!bInitiallyActive)
    {
        FindTriggerActor();
    }
    // End:0x39
    if(TriggerType == 4)
    {
        bHidden = false;
        bProjTarget = true;
        SetDrawType(0);
    }
    bSavedInitialActive = bInitiallyActive;
    bSavedInitialCollision = bCollideActors;
    super(Actor).PostBeginPlay();
}

function Reset()
{
    super(Actor).Reset();
    bInitiallyActive = bSavedInitialActive;
    SetCollision(bSavedInitialCollision, bBlockActors);
}

function FindTriggerActor()
{
    local Actor A;

    TriggerActor = none;
    TriggerActor2 = none;
    // End:0x5e
    foreach AllActors(class'Actor', A)
    {
        // End:0x5d
        if(A.Event == Tag)
        {
            // End:0x4f
            if(TriggerActor == none)
            {
                TriggerActor = A;
            }
            // End:0x5d
            else
            {
                TriggerActor2 = A;
                break;
                return;
            }
        }                
    }
}

function Actor SpecialHandling(Pawn Other)
{
    local Actor A;

    // End:0x18
    if(bTriggerOnceOnly && !bCollideActors)
    {
        return none;
    }
    // End:0x40
    if(TriggerType == 5 && !Other.IsHumanControlled())
    {
        return none;
    }
    // End:0x68
    if(TriggerType == 0 && !Other.IsPlayerPawn())
    {
        return none;
    }
    // End:0xf2
    if(!bInitiallyActive)
    {
        // End:0x84
        if(TriggerActor == none)
        {
            FindTriggerActor();
        }
        // End:0x91
        if(TriggerActor == none)
        {
            return none;
        }
        // End:0xec
        if(TriggerActor2 != none && VSize(TriggerActor2.Location - Other.Location) < VSize(TriggerActor.Location - Other.Location))
        {
            return TriggerActor2;
        }
        // End:0xf2
        else
        {
            return TriggerActor;
        }
    }
    // End:0x128
    if(TriggerType == 4)
    {
        // End:0x126
        if(Other.CanAttack(self))
        {
            return Other.ShootSpecial(self);
        }
        return self;
    }
    // End:0x164
    if(IsRelevant(Other))
    {
        // End:0x161
        foreach TouchingActors(class'Actor', A)
        {
            // End:0x160
            if(A == Other)
            {
                Touch(Other);
            }                        
        }
        return self;
    }
    return self;
}

function CheckTouchList()
{
    local Actor A;

    // End:0x1c
    foreach TouchingActors(class'Actor', A)
    {
        Touch(A);                
    }
}

function bool IsRelevant(Actor Other)
{
    local Actor Inst;

    Inst = FindInstigator(Other);
    // End:0x1e
    if(!bInitiallyActive)
    {
        return false;
    }
    switch(TriggerType)
    {
        // End:0x51
        case 5:
            return Pawn(Other) != none && Pawn(Other).IsHumanControlled();
        // End:0x96
        case 0:
            return Pawn(Other) != none && Pawn(Other).IsPlayerPawn() || Pawn(Other).WasPlayerPawn();
        // End:0xc2
        case 6:
            return Pawn(Other) != none && Pawn(Other).IsPlayerPawn();
        // End:0xef
        case 1:
            return Pawn(Other) != none && Pawn(Other).CanTrigger(self);
        // End:0x138
        case 2:
            return ClassIsChildOf(Other.Class, ClassProximityType) && !ClassIsChildOf(ClassProximityType, class'Vehicle') || Pawn(Inst).IsPlayerPawn();
        // End:0x13f
        case 3:
            return true;
        // End:0x171
        case 4:
            return Projectile(Other) != none && Projectile(Other).Damage >= DamageThreshold;
        // End:0xffff
        default:
}

function Actor FindInstigator(Actor Other)
{
    // End:0x40
    if(Vehicle(Other) != none && Vehicle(Other).Controller == none)
    {
        return Vehicle(Other).GetInstigator();
    }
    return Other;
}

function Touch(Actor Other)
{
    local int i;

    // End:0x1ba
    if(IsRelevant(Other))
    {
        Other = FindInstigator(Other);
        // End:0x61
        if(ReTriggerDelay > float(0))
        {
            // End:0x4d
            if(Level.TimeSeconds - TriggerTime < ReTriggerDelay)
            {
                return;
            }
            TriggerTime = Level.TimeSeconds;
        }
        TriggerEvent(Event, self, Other.Instigator);
        // End:0x112
        if(Pawn(Other) != none && Pawn(Other).Controller != none)
        {
            i = 0;
            J0xad:
            // End:0x112 [While If]
            if(i < 4)
            {
                // End:0x108
                if(Pawn(Other).Controller.GoalList[i] == self)
                {
                    Pawn(Other).Controller.GoalList[i] = none;
                }
                // End:0x112
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xad;
                }
            }
        }
        // End:0x194
        if(Message != "" && Other.Instigator != none)
        {
            // End:0x177
            if(Level.GetMatchMaker().BotTutorial)
            {
                Other.Instigator.ClientMessage(string('OnNextQuest'), 'TutorialEvent');
            }
            // End:0x194
            else
            {
                Other.Instigator.ClientMessage(Message);
            }
        }
        // End:0x1a4
        if(bTriggerOnceOnly)
        {
            SetCollision(false);
        }
        // End:0x1ba
        else
        {
            // End:0x1ba
            if(RepeatTriggerTime > float(0))
            {
                SetTimer(RepeatTriggerTime, false);
            }
        }
    }
}

function Timer()
{
    local bool bKeepTiming;
    local Actor A;

    bKeepTiming = false;
    // End:0x3a
    foreach TouchingActors(class'Actor', A)
    {
        // End:0x39
        if(IsRelevant(A))
        {
            bKeepTiming = true;
            Touch(A);
        }                
    }
    // End:0x4d
    if(bKeepTiming)
    {
        SetTimer(RepeatTriggerTime, false);
    }
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x114
    if(bInitiallyActive && TriggerType == 4 && float(Damage) >= DamageThreshold && instigatedBy != none)
    {
        // End:0x7d
        if(ReTriggerDelay > float(0))
        {
            // End:0x69
            if(Level.TimeSeconds - TriggerTime < ReTriggerDelay)
            {
                return;
            }
            TriggerTime = Level.TimeSeconds;
        }
        TriggerEvent(Event, self, instigatedBy);
        // End:0xb7
        if(Message != "")
        {
            instigatedBy.Instigator.ClientMessage(Message);
        }
        // End:0xc4
        if(bTriggerOnceOnly)
        {
            SetCollision(false);
        }
        // End:0x114
        if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
}

function UnTouch(Actor Other)
{
    // End:0x28
    if(IsRelevant(Other))
    {
        UntriggerEvent(Event, self, Other.Instigator);
    }
}

state() NormalTrigger
{

}

state() OtherTriggerOnEvent
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x27
        if(bInitiallyActive)
        {
            TriggerEvent(Event, self, EventInstigator);
            // End:0x27
            if(bTriggerOnceOnly)
            {
                SetCollision(false);
            }
        }
    }

}

state() OtherTriggerToggles
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        bInitiallyActive = !bInitiallyActive;
        // End:0x1e
        if(bInitiallyActive)
        {
            CheckTouchList();
        }
    }

}

state() OtherTriggerTurnsOn
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        local bool bWasActive;

        bWasActive = bInitiallyActive;
        bInitiallyActive = true;
        // End:0x26
        if(!bWasActive)
        {
            CheckTouchList();
        }
    }

}

state() OtherTriggerTurnsOff
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        bInitiallyActive = false;
    }

}

state() OtherTriggerDamageGR
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local string strDamageType;

        // End:0x166
        if(bInitiallyActive && TriggerType == 4 && float(Damage) >= DamageThreshold && instigatedBy != none)
        {
            strDamageType = string(DamageType);
            // End:0x8b
            if(DamageType == class'wDamageGR' || strDamageType ~= "WWeapons_Res.wWeaponRes_FragGrenade")
            {
            }
            // End:0x8d
            else
            {
                return;
            }
            // End:0xcf
            if(ReTriggerDelay > float(0))
            {
                // End:0xbb
                if(Level.TimeSeconds - TriggerTime < ReTriggerDelay)
                {
                    return;
                }
                TriggerTime = Level.TimeSeconds;
            }
            TriggerEvent(Event, self, instigatedBy);
            // End:0x109
            if(Message != "")
            {
                instigatedBy.Instigator.ClientMessage(Message);
            }
            // End:0x116
            if(bTriggerOnceOnly)
            {
                SetCollision(false);
            }
            // End:0x166
            if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
    }

}

state() OtherTriggerDamageRocket
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local string strDamageType;

        // End:0x15e
        if(bInitiallyActive && TriggerType == 4 && float(Damage) >= DamageThreshold && instigatedBy != none)
        {
            strDamageType = string(DamageType);
            // End:0x83
            if(DamageType == class'wDamageRPG' || strDamageType ~= "WWeapons_Res.wWeaponRes_ATR")
            {
            }
            // End:0x85
            else
            {
                return;
            }
            // End:0xc7
            if(ReTriggerDelay > float(0))
            {
                // End:0xb3
                if(Level.TimeSeconds - TriggerTime < ReTriggerDelay)
                {
                    return;
                }
                TriggerTime = Level.TimeSeconds;
            }
            TriggerEvent(Event, self, instigatedBy);
            // End:0x101
            if(Message != "")
            {
                instigatedBy.Instigator.ClientMessage(Message);
            }
            // End:0x10e
            if(bTriggerOnceOnly)
            {
                SetCollision(false);
            }
            // End:0x15e
            if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
    }

}

defaultproperties
{
    bInitiallyActive=true
    InitialState=NormalTrigger
    Texture=Texture'S_Trigger'
}