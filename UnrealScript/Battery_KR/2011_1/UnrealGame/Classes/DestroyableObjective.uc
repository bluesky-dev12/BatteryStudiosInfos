class DestroyableObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

enum EConstraintInstigator
{
    CI_All,                         // 0
    CI_PawnClass                    // 1
};

var() DestroyableObjective.EConstraintInstigator ConstraintInstigator;
var() Class<Pawn> ConstraintPawnClass;
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
    // Pos:0x000
    reliable if(bReplicateHealth && int(Role) == int(ROLE_Authority))
        Health;

    // Pos:0x018
    reliable if(((bMonitorUnderAttack && int(Role) == int(ROLE_Authority)) && bReplicateObjective) && bNetDirty)
        bIsUnderAttack;
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x46
    if(AIShootOffset != vect(0.0000000, 0.0000000, 0.0000000))
    {
        ShootTarget = Spawn(Class'UnrealGame_Decompressed.ShootTarget', self,, Location + AIShootOffset);
        ShootTarget.SetBase(self);
    }
    Reset();
    //return;    
}

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    return 0;
    //return;    
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
    //return;    
}

function Destroyed()
{
    // End:0x1E
    if(UnderAttackTimer != none)
    {
        UnderAttackTimer.Destroy();
        UnderAttackTimer = none;
    }
    super(Actor).Destroyed();
    //return;    
}

simulated function bool TeamLink(int TeamNum)
{
    return (LinkHealMult > float(0)) && int(DefenderTeamIndex) == TeamNum;
    //return;    
}

function Actor GetShootTarget()
{
    // End:0x11
    if(ShootTarget != none)
    {
        return ShootTarget;
    }
    return self;
    //return;    
}

function bool KillEnemyFirst(Bot B)
{
    return false;
    //return;    
}

function bool LegitimateTargetOf(Bot B)
{
    // End:0x38
    if((int(ConstraintInstigator) == int(1)) && !ClassIsChildOf(B.Pawn.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x5D
    if(((DamageCapacity > 0) && bActive) && !bDisabled)
    {
        return true;
    }
    return false;
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    local int i;
    local float Best, Next;
    local Vector Dir;
    local NavigationPoint BestPath;
    local bool bResult;

    // End:0x38
    if((int(ConstraintInstigator) == int(1)) && !ClassIsChildOf(B.Pawn.Class, ConstraintPawnClass))
    {
        return false;
    }
    // End:0x486
    if((int(B.Pawn.Physics) == int(4)) && B.Pawn.MinFlySpeed > float(0))
    {
        // End:0x26A
        if((VehiclePath != none) && B.Pawn.ReachedDestination(VehiclePath))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.0500000 * B.Pawn.MinFlySpeed);
            B.Pawn.bThumped = true;
            Dir = Normal(B.Pawn.Velocity);
            i = 0;
            J0x137:

            // End:0x23A [Loop If]
            if(i < VehiclePath.PathList.Length)
            {
                // End:0x1AE
                if(BestPath == none)
                {
                    BestPath = VehiclePath.PathList[i].End;
                    Best = Dir Dot Normal(BestPath.Location - VehiclePath.Location);
                    // [Explicit Continue]
                    goto J0x230;
                }
                Next = Dir Dot Normal(VehiclePath.PathList[i].End.Location - VehiclePath.Location);
                // End:0x230
                if(Next > Best)
                {
                    Best = Next;
                    BestPath = VehiclePath.PathList[i].End;
                }
                J0x230:

                i++;
                // [Loop Continue]
                goto J0x137;
            }
            // End:0x26A
            if(BestPath != none)
            {
                B.MoveTarget = BestPath;
                B.SetAttractionState();
                return true;
            }
        }
        // End:0x3A0
        if(B.CanAttack(GetShootTarget()))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.0500000 * B.Pawn.MinFlySpeed);
            B.Focus = self;
            B.FireWeaponAt(self);
            B.GoalString = "Attack Objective";
            // End:0x39E
            if(!B.Squad.FindPathToObjective(B, self))
            {
                B.DoRangedAttackOn(GetShootTarget());
                B.Pawn.Acceleration = B.Pawn.AccelRate * Normal(Location - B.Pawn.Location);                
            }
            else
            {
                return true;
            }
        }
        bResult = super.TellBotHowToDisable(B);
        // End:0x44D
        if((bResult && FlyingPathNode(B.MoveTarget) != none) && B.MoveTarget.CollisionRadius < float(1000))
        {
            B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.0500000 * B.Pawn.MinFlySpeed);            
        }
        else
        {
            B.Pawn.AirSpeed = B.Pawn.default.AirSpeed;
        }
        return bResult;        
    }
    else
    {
        // End:0x53C
        if(!B.Pawn.bStationary && B.Pawn.TooCloseToAttack(GetShootTarget()))
        {
            B.GoalString = "Back off from objective";
            B.RouteGoal = B.FindRandomDest();
            B.MoveTarget = B.RouteCache[0];
            B.SetAttractionState();
            return true;            
        }
        else
        {
            // End:0x59C
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
    //return;    
}

function bool NearObjective(Pawn P)
{
    // End:0x1A
    if(P.CanAttack(GetShootTarget()))
    {
        return true;
    }
    return super.NearObjective(P);
    //return;    
}

function bool TellBotHowToHeal(Bot B)
{
    local Vehicle OldVehicle;

    // End:0x2D
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
    // End:0x13E
    if(((Vehicle(B.Pawn) != none) && !Vehicle(B.Pawn).bKeyVehicle) && (B.Enemy == none) || !B.EnemyVisible() && (Level.TimeSeconds - B.LastSeenTime) > float(3))
    {
        OldVehicle = Vehicle(B.Pawn);
        Vehicle(B.Pawn).KDriverLeave(false);
    }
    // End:0x256
    if((B.Pawn.Weapon != none) && B.Pawn.Weapon.CanHeal(self))
    {
        // End:0x221
        if(!B.Pawn.CanAttack(GetShootTarget()))
        {
            B.GoalString = ("Can't shoot" @ string(self)) @ "(obstructed)";
            B.RouteGoal = B.FindRandomDest();
            B.MoveTarget = B.RouteCache[0];
            B.SetAttractionState();
            return true;
        }
        B.GoalString = "Heal " $ string(self);
        B.DoRangedAttackOn(GetShootTarget());
        return true;        
    }
    else
    {
        B.SwitchToBestWeapon();
        // End:0x37A
        if((B.Pawn.PendingWeapon != none) && B.Pawn.PendingWeapon.CanHeal(self))
        {
            // End:0x348
            if(!B.Pawn.CanAttack(GetShootTarget()))
            {
                B.GoalString = ("Can't shoot" @ string(self)) @ "(obstructed)";
                B.RouteGoal = B.FindRandomDest();
                B.MoveTarget = B.RouteCache[0];
                B.SetAttractionState();
                return true;
            }
            B.GoalString = "Heal " $ string(self);
            B.DoRangedAttackOn(GetShootTarget());
            return true;
        }
        // End:0x3D4
        if(B.FindInventoryGoal(0.0005000))
        {
            B.GoalString = "Find weapon or ammo to heal " $ string(self);
            B.SetAttractionState();
            return true;
        }
    }
    // End:0x3FC
    if(OldVehicle != none)
    {
        OldVehicle.UsedBy(B.Pawn);
    }
    return false;
    //return;    
}

function Reset()
{
    Health = DamageCapacity;
    AccumulatedDamage = 0;
    bProjTarget = true;
    bIsUnderAttack = false;
    SetCollision(true, bBlockActors);
    // End:0x4A
    if(UnderAttackTimer != none)
    {
        UnderAttackTimer.Destroy();
        UnderAttackTimer = none;
    }
    super.Reset();
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    local float DamagePct, HealthTaken;
    local Controller InstigatorController;
    local Pawn CurrentInstigator;

    // End:0x4A
    if(((!bActive || bDisabled) || Damage <= 0) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
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
    // End:0xDE
    if(((instigatedBy == none) || instigatedBy.Controller == none) && DelayedDamageInstigatorController != none)
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
        // End:0x12E
        if(instigatedBy.HasUDamage())
        {
            Damage *= float(2);
        }
        Damage *= instigatedBy.DamageScaling;
    }
    // End:0x17F
    if((int(ConstraintInstigator) == int(1)) && (instigatedBy == none) || !ClassIsChildOf(instigatedBy.Class, ConstraintPawnClass))
    {
        return;
    }
    // End:0x1E0
    if(!bCanDefenderDamage && ((instigatedBy != none) && instigatedBy.GetTeamNum() == int(DefenderTeamIndex)) || (InstigatorController != none) && InstigatorController.GetTeamNum() == int(DefenderTeamIndex))
    {
        return;
    }
    Damage = UnrealMPGameInfo(Level.Game).AdjustDestroyObjectiveDamage(Damage, InstigatorController, self);
    NetUpdateTime = Level.TimeSeconds - float(1);
    AccumulatedDamage += Damage;
    // End:0x267
    if((DamageEventThreshold > 0) && AccumulatedDamage >= DamageEventThreshold)
    {
        TriggerEvent(TakeDamageEvent, self, instigatedBy);
        AccumulatedDamage = 0;
    }
    HealthTaken = float(Min(Damage, Health));
    Health -= Damage;
    // End:0x311
    if((((DefenseSquad != none) && CurrentInstigator != none) && CurrentInstigator.Controller != none) && (Level.TimeSeconds - LastWarnTime) > 0.5000000)
    {
        LastWarnTime = Level.TimeSeconds;
        DefenseSquad.Team.AI.CriticalObjectiveWarning(self, CurrentInstigator);
    }
    DamagePct = HealthTaken / float(DamageCapacity);
    // End:0x362
    if((instigatedBy != none) && instigatedBy.Controller != none)
    {
        AddScorer(instigatedBy.Controller, DamagePct);        
    }
    else
    {
        // End:0x37D
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
    else
    {
        // End:0x3DB
        if(bMonitorUnderAttack)
        {
            bIsUnderAttack = true;
            LastDamageTime = Level.TimeSeconds;
            CheckPlayCriticalAlarm();
            // End:0x3DB
            if(UnderAttackTimer == none)
            {
                UnderAttackTimer = Spawn(Class'Engine.VolumeTimer', self);
            }
        }
    }
    //return;    
}

function AwardAssaultScore(int Score)
{
    ShareScore(Score, "Objective_Completed");
    //return;    
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
    // End:0x6C
    if((((((!bActive || bDisabled) || Health <= 0) || Health >= DamageCapacity) || Amount <= 0) || Healer == none) || !TeamLink(Healer.GetTeamNum()))
    {
        return false;
    }
    Health = Min(int(float(Health) + (float(Amount) * LinkHealMult)), DamageCapacity);
    NetUpdateTime = Level.TimeSeconds - float(1);
    return true;
    //return;    
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3D
    if((!bActive || bDisabled) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
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
    //return;    
}

function TimerPop(VolumeTimer t)
{
    // End:0x55
    if(bIsUnderAttack && Level.TimeSeconds > (LastDamageTime + float(4)))
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
    //return;    
}

simulated function bool IsCritical()
{
    return (IsActive()) && bIsCritical || bIsUnderAttack;
    //return;    
}

simulated function float GetObjectiveProgress()
{
    // End:0x0F
    if(bDisabled)
    {
        return 0.0000000;
    }
    return float(Health) / float(DamageCapacity);
    //return;    
}

defaultproperties
{
    ConstraintPawnClass=Class'Engine.Pawn'
    DamageCapacity=100
    VehicleDamageScaling=1.0000000
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
    bSpecialForced=false
    bStatic=false
    bAlwaysRelevant=true
    bCanBeDamaged=true
    bCollideActors=true
    bProjTarget=true
}