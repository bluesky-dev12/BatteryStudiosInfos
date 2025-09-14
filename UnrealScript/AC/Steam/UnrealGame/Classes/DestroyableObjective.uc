/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DestroyableObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:18
 *	Functions:19
 *
 *******************************************************************************/
class DestroyableObjective extends GameObjective
    dependson(ShootTarget)
    hidecategories(Lighting,LightColor,Karma,Force);

enum EConstraintInstigator
{
    CI_All,
    CI_PawnClass
};

var() DestroyableObjective.EConstraintInstigator ConstraintInstigator;
var() class<Pawn> ConstraintPawnClass;
var() int DamageCapacity;
var() name TakeDamageEvent;
var() int DamageEventThreshold;
var int AccumulatedDamage;
var int Health;
var float LinkHealMult;
var() float VehicleDamageScaling;
var() Vector AIShootOffset;
var ShootTarget ShootTarget;
var() bool bCanDefenderDamage;
var bool bReplicateHealth;
var bool bMonitorUnderAttack;
var bool bIsUnderAttack;
var VolumeTimer UnderAttackTimer;
var float LastDamageTime;
var float LastWarnTime;

replication
{
    // Pos:0x00
    reliable if(bReplicateHealth && Role == 4)
        Health;

    // Pos:0x18
    reliable if(bMonitorUnderAttack && Role == 4 && bReplicateObjective && bNetDirty)
        bIsUnderAttack;

}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x46
    if(AIShootOffset != vect(0.0, 0.0, 0.0))
    {
        ShootTarget = Spawn(class'ShootTarget', self,, Location + AIShootOffset);
        ShootTarget.SetBase(self);
    }
    Reset();
}

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    return 0;
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
}

function Destroyed()
{
    // End:0x1e
    if(UnderAttackTimer != none)
    {
        UnderAttackTimer.Destroy();
        UnderAttackTimer = none;
    }
    super(Actor).Destroyed();
}

simulated function bool TeamLink(int TeamNum)
{
    return LinkHealMult > float(0) && DefenderTeamIndex == TeamNum;
}

function Actor GetShootTarget()
{
    // End:0x11
    if(ShootTarget != none)
    {
        return ShootTarget;
    }
    return self;
}

function bool KillEnemyFirst(Bot B)
{
    return false;
}

function bool LegitimateTargetOf(Bot B)
{
    // End:0x38
    if(ConstraintInstigator == 1 && !ClassIsChildOf(B.Pawn.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x5d
    if(DamageCapacity > 0 && bActive && !bDisabled)
    {
        return true;
    }
    return false;
}

function bool TellBotHowToDisable(Bot B)
{
    local int i;
    local float Best, Next;
    local Vector Dir;
    local NavigationPoint BestPath;
    local bool bResult;

    // End:0x38
    if(ConstraintInstigator == 1 && !ClassIsChildOf(B.Pawn.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x486
    if(B.Pawn.Physics == 4 && B.Pawn.MinFlySpeed > float(0))
    {
        // End:0x26a
        if(VehiclePath != none && B.Pawn.ReachedDestination(VehiclePath))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.050 * B.Pawn.MinFlySpeed);
            B.Pawn.bThumped = true;
            Dir = Normal(B.Pawn.Velocity);
            i = 0;
            J0x137:
            // End:0x23a [While If]
            if(i < VehiclePath.PathList.Length)
            {
                // End:0x1ae
                if(BestPath == none)
                {
                    BestPath = VehiclePath.PathList[i].End;
                    Best = Dir Dot Normal(BestPath.Location - VehiclePath.Location);
                }
                // End:0x230
                else
                {
                    Next = Dir Dot Normal(VehiclePath.PathList[i].End.Location - VehiclePath.Location);
                    // End:0x230
                    if(Next > Best)
                    {
                        Best = Next;
                        BestPath = VehiclePath.PathList[i].End;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x137;
            }
            // End:0x26a
            if(BestPath != none)
            {
                B.MoveTarget = BestPath;
                B.SetAttractionState();
                return true;
            }
        }
        // End:0x3a0
        if(B.CanAttack(GetShootTarget()))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.050 * B.Pawn.MinFlySpeed);
            B.Focus = self;
            B.FireWeaponAt(self);
            B.GoalString = "Attack Objective";
            // End:0x39e
            if(!B.Squad.FindPathToObjective(B, self))
            {
                B.DoRangedAttackOn(GetShootTarget());
                B.Pawn.Acceleration = B.Pawn.AccelRate * Normal(Location - B.Pawn.Location);
            }
            // End:0x3a0
            else
            {
                return true;
            }
        }
        bResult = super.TellBotHowToDisable(B);
        // End:0x44d
        if(bResult && FlyingPathNode(B.MoveTarget) != none && B.MoveTarget.CollisionRadius < float(1000))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.050 * B.Pawn.MinFlySpeed);
        }
        // End:0x47c
        else
        {
            B.Pawn.AirSpeed = B.Pawn.default.AirSpeed;
        }
        return bResult;
    }
    // End:0x59c
    else
    {
        // End:0x53c
        if(!B.Pawn.bStationary && B.Pawn.TooCloseToAttack(GetShootTarget()))
        {
            B.GoalString = "Back off from objective";
            B.RouteGoal = B.FindRandomDest();
            B.MoveTarget = B.RouteCache[0];
            B.SetAttractionState();
            return true;
        }
        // End:0x59c
        else
        {
            // End:0x59c
            if(B.CanAttack(GetShootTarget()))
            {
                // End:0x564
                if(KillEnemyFirst(B))
                {
                    return false;
                }
                B.GoalString = "Attack Objective";
                B.DoRangedAttackOn(GetShootTarget());
                return true;
            }
        }
    }
    return super.TellBotHowToDisable(B);
}

function bool NearObjective(Pawn P)
{
    // End:0x1a
    if(P.CanAttack(GetShootTarget()))
    {
        return true;
    }
    return super.NearObjective(P);
}

function bool TellBotHowToHeal(Bot B)
{
    local Vehicle OldVehicle;

    // End:0x2d
    if(!TeamLink(B.GetTeamNum()) || Health >= DamageCapacity)
    {
        return false;
    }
    // End:0x75
    if(B.Squad.SquadObjective == none)
    {
        // End:0x65
        if(Vehicle(B.Pawn) != none)
        {
            return false;
        }
        B.DoRangedAttackOn(self);
    }
    // End:0x13e
    if(Vehicle(B.Pawn) != none && !Vehicle(B.Pawn).bKeyVehicle && B.Enemy == none || !B.EnemyVisible() && Level.TimeSeconds - B.LastSeenTime > float(3))
    {
        OldVehicle = Vehicle(B.Pawn);
        Vehicle(B.Pawn).KDriverLeave(false);
    }
    // End:0x256
    if(B.Pawn.Weapon != none && B.Pawn.Weapon.CanHeal(self))
    {
        // End:0x221
        if(!B.Pawn.CanAttack(GetShootTarget()))
        {
            B.GoalString = "Can't shoot" @ string(self) @ "(obstructed)";
            B.RouteGoal = B.FindRandomDest();
            B.MoveTarget = B.RouteCache[0];
            B.SetAttractionState();
            return true;
        }
        B.GoalString = "Heal " $ string(self);
        B.DoRangedAttackOn(GetShootTarget());
        return true;
    }
    // End:0x3d4
    else
    {
        B.SwitchToBestWeapon();
        // End:0x37a
        if(B.Pawn.PendingWeapon != none && B.Pawn.PendingWeapon.CanHeal(self))
        {
            // End:0x348
            if(!B.Pawn.CanAttack(GetShootTarget()))
            {
                B.GoalString = "Can't shoot" @ string(self) @ "(obstructed)";
                B.RouteGoal = B.FindRandomDest();
                B.MoveTarget = B.RouteCache[0];
                B.SetAttractionState();
                return true;
            }
            B.GoalString = "Heal " $ string(self);
            B.DoRangedAttackOn(GetShootTarget());
            return true;
        }
        // End:0x3d4
        if(B.FindInventoryGoal(0.00050))
        {
            B.GoalString = "Find weapon or ammo to heal " $ string(self);
            B.SetAttractionState();
            return true;
        }
    }
    // End:0x3fc
    if(OldVehicle != none)
    {
        OldVehicle.UsedBy(B.Pawn);
    }
    return false;
}

function Reset()
{
    Health = DamageCapacity;
    AccumulatedDamage = 0;
    bProjTarget = true;
    bIsUnderAttack = false;
    SetCollision(true, bBlockActors);
    // End:0x4a
    if(UnderAttackTimer != none)
    {
        UnderAttackTimer.Destroy();
        UnderAttackTimer = none;
    }
    super.Reset();
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local float DamagePct, HealthTaken;
    local Controller InstigatorController;
    local Pawn CurrentInstigator;

    // End:0x4a
    if(!bActive || bDisabled || Damage <= 0 || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    CurrentInstigator = instigatedBy;
    // End:0x71
    if(Vehicle(instigatedBy) != none)
    {
        Damage *= VehicleDamageScaling;
    }
    // End:0x91
    if(DamageType != none)
    {
        Damage *= DamageType.default.VehicleDamageScaling;
    }
    // End:0xde
    if(instigatedBy == none || instigatedBy.Controller == none && DelayedDamageInstigatorController != none)
    {
        instigatedBy = DelayedDamageInstigatorController.Pawn;
        InstigatorController = DelayedDamageInstigatorController;
    }
    // End:0x143
    if(instigatedBy != none)
    {
        // End:0x111
        if(instigatedBy.Controller != none)
        {
            InstigatorController = instigatedBy.Controller;
        }
        // End:0x12e
        if(instigatedBy.HasUDamage())
        {
            Damage *= float(2);
        }
        Damage *= instigatedBy.DamageScaling;
    }
    // End:0x17f
    if(ConstraintInstigator == 1 && instigatedBy == none || !ClassIsChildOf(instigatedBy.Class, ConstraintPawnClass))
    {
        return;
    }
    // End:0x1e0
    if(!bCanDefenderDamage && instigatedBy != none && instigatedBy.GetTeamNum() == DefenderTeamIndex || InstigatorController != none && InstigatorController.GetTeamNum() == DefenderTeamIndex)
    {
        return;
    }
    Damage = UnrealMPGameInfo(Level.Game).AdjustDestroyObjectiveDamage(Damage, InstigatorController, self);
    NetUpdateTime = Level.TimeSeconds - float(1);
    AccumulatedDamage += Damage;
    // End:0x267
    if(DamageEventThreshold > 0 && AccumulatedDamage >= DamageEventThreshold)
    {
        TriggerEvent(TakeDamageEvent, self, instigatedBy);
        AccumulatedDamage = 0;
    }
    HealthTaken = float(Min(Damage, Health));
    Health -= Damage;
    // End:0x311
    if(DefenseSquad != none && CurrentInstigator != none && CurrentInstigator.Controller != none && Level.TimeSeconds - LastWarnTime > 0.50)
    {
        LastWarnTime = Level.TimeSeconds;
        DefenseSquad.Team.AI.CriticalObjectiveWarning(self, CurrentInstigator);
    }
    DamagePct = HealthTaken / float(DamageCapacity);
    // End:0x362
    if(instigatedBy != none && instigatedBy.Controller != none)
    {
        AddScorer(instigatedBy.Controller, DamagePct);
    }
    // End:0x37d
    else
    {
        // End:0x37d
        if(DelayedDamageInstigatorController != none)
        {
            AddScorer(DelayedDamageInstigatorController, DamagePct);
        }
    }
    // End:0x396
    if(Health < 1)
    {
        DisableObjective(instigatedBy);
    }
    // End:0x3db
    else
    {
        // End:0x3db
        if(bMonitorUnderAttack)
        {
            bIsUnderAttack = true;
            LastDamageTime = Level.TimeSeconds;
            CheckPlayCriticalAlarm();
            // End:0x3db
            if(UnderAttackTimer == none)
            {
                UnderAttackTimer = Spawn(class'VolumeTimer', self);
            }
        }
    }
}

function AwardAssaultScore(int Score)
{
    ShareScore(Score, "Objective_Completed");
}

function bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType)
{
    // End:0x6c
    if(!bActive || bDisabled || Health <= 0 || Health >= DamageCapacity || Amount <= 0 || Healer == none || !TeamLink(Healer.GetTeamNum()))
    {
        return false;
    }
    Health = Min(int(float(Health) + float(Amount) * LinkHealMult), DamageCapacity);
    NetUpdateTime = Level.TimeSeconds - float(1);
    return true;
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3d
    if(!bActive || bDisabled || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    SetCollision(false, bBlockActors);
    bProjTarget = false;
    bIsUnderAttack = false;
    // End:0x75
    if(UnderAttackTimer != none)
    {
        UnderAttackTimer.Destroy();
        UnderAttackTimer = none;
    }
    super.DisableObjective(Instigator);
}

function TimerPop(VolumeTimer t)
{
    // End:0x55
    if(bIsUnderAttack && Level.TimeSeconds > LastDamageTime + float(4))
    {
        bIsUnderAttack = false;
        CheckPlayCriticalAlarm();
        // End:0x55
        if(UnderAttackTimer != none)
        {
            UnderAttackTimer.Destroy();
            UnderAttackTimer = none;
        }
    }
}

simulated function bool IsCritical()
{
    return IsActive() && bIsCritical || bIsUnderAttack;
}

simulated function float GetObjectiveProgress()
{
    // End:0x0f
    if(bDisabled)
    {
        return 0.0;
    }
    return float(Health) / float(DamageCapacity);
}

defaultproperties
{
    ConstraintPawnClass=Class'Engine.Pawn'
    DamageCapacity=100
    VehicleDamageScaling=1.0
    bReplicateHealth=true
    bMonitorUnderAttack=true
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="??? ??"
    ObjectiveDescription="???? ???? ?????"
    Objective_Info_Attacker="??? ????"
    Objective_Info_Defender="??? ????"
    bNotBased=true
    bDestinationOnly=true
    bSpecialForced=true
    bStatic=true
    bAlwaysRelevant=true
    bCanBeDamaged=true
    bCollideActors=true
    bProjTarget=true
}