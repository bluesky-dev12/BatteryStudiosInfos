class Trigger extends Triggers
    native
    placeable;

enum ETriggerType
{
    TT_PlayerProximity,             // 0
    TT_PawnProximity,               // 1
    TT_ClassProximity,              // 2
    TT_AnyProximity,                // 3
    TT_Shoot,                       // 4
    TT_HumanPlayerProximity,        // 5
    TT_LivePlayerProximity          // 6
};

var() Trigger.ETriggerType TriggerType;
var() localized string Message;
var() localized int UniqueID;
var() bool bTriggerOnceOnly;
var() bool bInitiallyActive;
var() Class<Actor> ClassProximityType;
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
    // End:0x2C
    if(bInitiallyActive && int(TriggerType) == int(6))
    {
        UntriggerEvent(Event, self, P);
    }
    //return;    
}

function bool SelfTriggered()
{
    return bInitiallyActive;
    //return;    
}

function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x77
    if(((((int(TriggerType) == int(0)) || int(TriggerType) == int(1)) || int(TriggerType) == int(5)) || int(TriggerType) == int(6)) || (int(TriggerType) == int(2)) && ClassIsChildOf(ClassProximityType, Class'Engine.Pawn'))
    {
        OnlyAffectPawns(true);
    }
    //return;    
}

function PostBeginPlay()
{
    // End:0x11
    if(!bInitiallyActive)
    {
        FindTriggerActor();
    }
    // End:0x39
    if(int(TriggerType) == int(4))
    {
        bHidden = false;
        bProjTarget = true;
        SetDrawType(0);
    }
    bSavedInitialActive = bInitiallyActive;
    bSavedInitialCollision = bCollideActors;
    super(Actor).PostBeginPlay();
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bInitiallyActive = bSavedInitialActive;
    SetCollision(bSavedInitialCollision, bBlockActors);
    //return;    
}

function FindTriggerActor()
{
    local Actor A;

    TriggerActor = none;
    TriggerActor2 = none;
    // End:0x5E
    foreach AllActors(Class'Engine.Actor', A)
    {
        // End:0x5D
        if(A.Event == Tag)
        {
            // End:0x4F
            if(TriggerActor == none)
            {
                TriggerActor = A;
                // End:0x5D
                continue;
            }
            TriggerActor2 = A;            
            return;
        }        
    }    
    //return;    
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
    if((int(TriggerType) == int(5)) && !Other.IsHumanControlled())
    {
        return none;
    }
    // End:0x68
    if((int(TriggerType) == int(0)) && !Other.IsPlayerPawn())
    {
        return none;
    }
    // End:0xF2
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
        // End:0xEC
        if((TriggerActor2 != none) && VSize(TriggerActor2.Location - Other.Location) < VSize(TriggerActor.Location - Other.Location))
        {
            return TriggerActor2;            
        }
        else
        {
            return TriggerActor;
        }
    }
    // End:0x128
    if(int(TriggerType) == int(4))
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
        foreach TouchingActors(Class'Engine.Actor', A)
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
    //return;    
}

function CheckTouchList()
{
    local Actor A;

    // End:0x1C
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        Touch(A);        
    }    
    //return;    
}

function bool IsRelevant(Actor Other)
{
    local Actor Inst;

    Inst = FindInstigator(Other);
    // End:0x1E
    if(!bInitiallyActive)
    {
        return false;
    }
    switch(TriggerType)
    {
        // End:0x51
        case 5:
            return (Pawn(Other) != none) && Pawn(Other).IsHumanControlled();
        // End:0x96
        case 0:
            return (Pawn(Other) != none) && Pawn(Other).IsPlayerPawn() || Pawn(Other).WasPlayerPawn();
        // End:0xC2
        case 6:
            return (Pawn(Other) != none) && Pawn(Other).IsPlayerPawn();
        // End:0xEF
        case 1:
            return (Pawn(Other) != none) && Pawn(Other).CanTrigger(self);
        // End:0x138
        case 2:
            return ClassIsChildOf(Other.Class, ClassProximityType) && !ClassIsChildOf(ClassProximityType, Class'Engine.Vehicle') || Pawn(Inst).IsPlayerPawn();
        // End:0x13F
        case 3:
            return true;
        // End:0x171
        case 4:
            return (Projectile(Other) != none) && Projectile(Other).Damage >= DamageThreshold;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

function Actor FindInstigator(Actor Other)
{
    // End:0x40
    if((Vehicle(Other) != none) && Vehicle(Other).Controller == none)
    {
        return Vehicle(Other).GetInstigator();
    }
    return Other;
    //return;    
}

function Touch(Actor Other)
{
    local int i;

    // End:0x1BA
    if(IsRelevant(Other))
    {
        Other = FindInstigator(Other);
        // End:0x61
        if(ReTriggerDelay > float(0))
        {
            // End:0x4D
            if((Level.TimeSeconds - TriggerTime) < ReTriggerDelay)
            {
                return;
            }
            TriggerTime = Level.TimeSeconds;
        }
        TriggerEvent(Event, self, Other.Instigator);
        // End:0x112
        if((Pawn(Other) != none) && Pawn(Other).Controller != none)
        {
            i = 0;
            J0xAD:

            // End:0x112 [Loop If]
            if(i < 4)
            {
                // End:0x108
                if(Pawn(Other).Controller.GoalList[i] == self)
                {
                    Pawn(Other).Controller.GoalList[i] = none;
                    // [Explicit Break]
                    goto J0x112;
                }
                i++;
                // [Loop Continue]
                goto J0xAD;
            }
        }
        J0x112:

        // End:0x194
        if((Message != "") && Other.Instigator != none)
        {
            // End:0x177
            if(Level.GetMatchMaker().BotTutorial)
            {
                Other.Instigator.ClientMessage(string('OnNextQuest'), 'TutorialEvent');                
            }
            else
            {
                Other.Instigator.ClientMessage(Message);
            }
        }
        // End:0x1A4
        if(bTriggerOnceOnly)
        {
            SetCollision(false);            
        }
        else
        {
            // End:0x1BA
            if(RepeatTriggerTime > float(0))
            {
                SetTimer(RepeatTriggerTime, false);
            }
        }
    }
    //return;    
}

function Timer()
{
    local bool bKeepTiming;
    local Actor A;

    bKeepTiming = false;
    // End:0x3A
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        // End:0x39
        if(IsRelevant(A))
        {
            bKeepTiming = true;
            Touch(A);
        }        
    }    
    // End:0x4D
    if(bKeepTiming)
    {
        SetTimer(RepeatTriggerTime, false);
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x114
    if(((bInitiallyActive && int(TriggerType) == int(4)) && float(Damage) >= DamageThreshold) && instigatedBy != none)
    {
        // End:0x7D
        if(ReTriggerDelay > float(0))
        {
            // End:0x69
            if((Level.TimeSeconds - TriggerTime) < ReTriggerDelay)
            {
                return;
            }
            TriggerTime = Level.TimeSeconds;
        }
        TriggerEvent(Event, self, instigatedBy);
        // End:0xB7
        if(Message != "")
        {
            instigatedBy.Instigator.ClientMessage(Message);
        }
        // End:0xC4
        if(bTriggerOnceOnly)
        {
            SetCollision(false);
        }
        // End:0x114
        if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
    //return;    
}

function UnTouch(Actor Other)
{
    // End:0x28
    if(IsRelevant(Other))
    {
        UntriggerEvent(Event, self, Other.Instigator);
    }
    //return;    
}

state() NormalTrigger
{    stop;    
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
        //return;        
    }
    stop;    
}

state() OtherTriggerToggles
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        bInitiallyActive = !bInitiallyActive;
        // End:0x1E
        if(bInitiallyActive)
        {
            CheckTouchList();
        }
        //return;        
    }
    stop;    
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
        //return;        
    }
    stop;    
}

state() OtherTriggerTurnsOff
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        bInitiallyActive = false;
        //return;        
    }
    stop;    
}

state() OtherTriggerDamageGR
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local string strDamageType;

        // End:0x166
        if(((bInitiallyActive && int(TriggerType) == int(4)) && float(Damage) >= DamageThreshold) && instigatedBy != none)
        {
            strDamageType = string(DamageType);
            // End:0x8B
            if((DamageType == Class'Engine.wDamageGR') || strDamageType ~= "WWeapons_Res.wWeaponRes_FragGrenade")
            {                
            }
            else
            {
                return;
            }
            // End:0xCF
            if(ReTriggerDelay > float(0))
            {
                // End:0xBB
                if((Level.TimeSeconds - TriggerTime) < ReTriggerDelay)
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
            if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
        //return;        
    }
    stop;    
}

state() OtherTriggerDamageRocket
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        local string strDamageType;

        // End:0x15E
        if(((bInitiallyActive && int(TriggerType) == int(4)) && float(Damage) >= DamageThreshold) && instigatedBy != none)
        {
            strDamageType = string(DamageType);
            // End:0x83
            if((DamageType == Class'Engine.wDamageRPG') || strDamageType ~= "WWeapons_Res.wWeaponRes_ATR")
            {                
            }
            else
            {
                return;
            }
            // End:0xC7
            if(ReTriggerDelay > float(0))
            {
                // End:0xB3
                if((Level.TimeSeconds - TriggerTime) < ReTriggerDelay)
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
            // End:0x10E
            if(bTriggerOnceOnly)
            {
                SetCollision(false);
            }
            // End:0x15E
            if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
            {
                instigatedBy.Controller.StopFiring();
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bInitiallyActive=true
    InitialState="NormalTrigger"
    Texture=Texture'Engine.S_Trigger'
}