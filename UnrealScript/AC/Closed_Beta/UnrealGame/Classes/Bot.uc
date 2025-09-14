class Bot extends ScriptedController;

const MAXSTAKEOUTDIST = 2000;
const ENEMYLOCATIONFUZZ = 1200;
const TACTICALHEIGHTADVANTAGE = 320;
const MINSTRAFEDIST = 200;
const MINVIEWDIST = 200;
const AngleConvert = 0.0000958738;

enum EScriptFollow
{
    FOLLOWSCRIPT_IgnoreAllStimuli,  // 0
    FOLLOWSCRIPT_IgnoreEnemies,     // 1
    FOLLOWSCRIPT_StayOnScript,      // 2
    FOLLOWSCRIPT_LeaveScriptForCombat// 3
};

var bool bCanFire;
var bool bStrafeDir;
var bool bLeadTarget;
var bool bChangeDir;
var bool bFrustrated;
var bool bInitLifeMessage;
var bool bReachedGatherPoint;
var bool bFinalStretch;
var bool bJumpy;
var bool bHasTranslocator;
var bool bHasImpactHammer;
var bool bTacticalDoubleJump;
var bool bWasNearObjective;
var bool bPlannedShot;
var bool bHasFired;
var bool bForcedDirection;
var bool bFireSuccess;
var bool bStoppedFiring;
var bool bEnemyIsVisible;
var bool bTranslocatorHop;
var bool bEnemyEngaged;
var bool bMustCharge;
var bool bPursuingFlag;
var bool bJustLanded;
var bool bSingleTestSection;
var bool bRecommendFastMove;
var bool bDodgingForward;
var bool bInstantAck;
var bool bShieldSelf;
var bool bIgnoreEnemyChange;
var bool bHasSuperWeapon;
var Actor TranslocationTarget;
var Actor RealTranslocationTarget;
var Actor ImpactTarget;
var float TranslocFreq;
var float NextTranslocTime;
var name OldMessageType;
var int OldMessageID;
var Vector HidingSpot;
var float Aggressiveness;
var float LastAttractCheck;
var NavigationPoint BlockedPath;
var float AcquireTime;
var float Aggression;
var float LoseEnemyCheckTime;
var Actor StartleActor;
var float StartTacticalTime;
var float LastUnderFire;
var float BaseAlertness;
var float Accuracy;
var float BaseAggressiveness;
var float StrafingAbility;
var float CombatStyle;
var float Tactics;
var float TranslocUse;
var float ReactionTime;
var float Jumpiness;
var Class<wWeapon> FavoriteWeapon;
var string GoalString;
var string SoakString;
var SquadAI Squad;
var Bot NextSquadMember;
var float ReTaskTime;
var UnrealScriptedSequence GoalScript;
var UnrealScriptedSequence EnemyAcquisitionScript;
var Vehicle FormerVehicle;
var Bot.EScriptFollow ScriptedCombat;
var int FormationPosition;
var int ChoosingAttackLevel;
var float ChooseAttackTime;
var int ChooseAttackCounter;
var float EnemyVisibilityTime;
var Pawn VisibleEnemy;
var Pawn OldEnemy;
var float StopStartTime;
var float LastRespawnTime;
var float FailedHuntTime;
var Pawn FailedHuntEnemy;
var float LastSearchTime;
var float LastSearchWeight;
var float CampTime;
var int LastTaunt;
var int NumRandomJumps;
var string ComboNames[4];
var float LastFireAttempt;
var float GatherTime;
var() name OrderNames[16];
var name OldOrders;
var Controller OldOrderGiver;
var Vector LastKnownPosition;
var Vector LastKillerPosition;
var NavigationPoint TestStart;
var int TestPath;
var name TestLabel;

function Destroyed()
{
    Squad.RemoveBot(self);
    // End:0x2A
    if(GoalScript != none)
    {
        GoalScript.FreeScript();
    }
    super(Controller).Destroyed();
    //return;    
}

function PostBeginPlay()
{
    super(Controller).PostBeginPlay();
    SetCombatTimer();
    Aggressiveness = BaseAggressiveness;
    // End:0x3F
    if(UnrealMPGameInfo(Level.Game).bSoaking)
    {
        bSoaking = true;
    }
    //return;    
}

function wWeapon HasSuperWeapon()
{
    local Pawn CheckPawn;
    local Inventory Inv;

    // End:0x0D
    if(!bHasSuperWeapon)
    {
        return none;
    }
    // End:0x39
    if(Vehicle(Pawn) != none)
    {
        CheckPawn = Vehicle(Pawn).Driver;        
    }
    else
    {
        CheckPawn = Pawn;
    }
    // End:0x59
    if(CheckPawn == none)
    {
        bHasSuperWeapon = false;
        return none;
    }
    Inv = CheckPawn.Inventory;
    J0x6D:

    // End:0xE0 [Loop If]
    if(Inv != none)
    {
        // End:0xC9
        if(((wWeapon(Inv) != none) && int(wWeapon(Inv).default.InventoryGroup) == 0) && wWeapon(Inv).HasAmmo())
        {
            return wWeapon(Inv);
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x6D;
    }
    bHasSuperWeapon = false;
    return none;
    //return;    
}

function NotifyAddInventory(Inventory NewItem)
{
    // End:0x0B
    if(bHasSuperWeapon)
    {
        return;
    }
    bHasSuperWeapon = (wWeapon(NewItem) != none) && int(wWeapon(NewItem).default.InventoryGroup) == 0;
    //return;    
}

function bool ShouldKeepShielding()
{
    // End:0x55
    if(((Enemy == none) || HoldObjective(Squad.SquadObjective) == none) || !Pawn.ReachedDestination(Squad.SquadObjective))
    {
        bShieldSelf = false;        
    }
    else
    {
        Pawn.bWantsToCrouch = true;
    }
    return bShieldSelf;
    //return;    
}

event SetupSpecialPathAbilities()
{
    bAllowedToTranslocate = CanUseTranslocator();
    bAllowedToImpactJump = CanImpactJump();
    //return;    
}

event bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
    local Vehicle V;

    // End:0x1B0
    if((Vehicle(Wall) != none) && Vehicle(Pawn) == none)
    {
        // End:0xCB
        if((Wall == RouteGoal) || (Vehicle(RouteGoal) != none) && Wall == Vehicle(RouteGoal).GetVehicleBase())
        {
            V = Vehicle(Wall).FindEntryVehicle(Pawn);
            // End:0xC9
            if(V != none)
            {
                V.UsedBy(Pawn);
                // End:0xC9
                if(Vehicle(Pawn) != none)
                {
                    Squad.BotEnteredVehicle(self);
                    WhatToDoNext(52);
                }
            }
            return true;
        }
        LastBlockingVehicle = Vehicle(Wall);
        // End:0x104
        if((Vehicle(Wall).Controller != none) || FRand() < 0.9000000)
        {
            return false;
        }
        bNotifyApex = true;
        bPendingDoubleJump = true;
        Pawn.SetPhysics(2);
        Pawn.Velocity = Destination - Pawn.Location;
        Pawn.Velocity.Z = 0.0000000;
        Pawn.Velocity = Pawn.GroundSpeed * Normal(Pawn.Velocity);
        Pawn.Velocity.Z = Pawn.JumpZ;
    }
    return false;
    //return;    
}

function GetOutOfVehicle()
{
    // End:0x12
    if(Vehicle(Pawn) == none)
    {
        return;
    }
    Vehicle(Pawn).PlayerStartTime = Level.TimeSeconds + float(20);
    Vehicle(Pawn).KDriverLeave(false);
    //return;    
}

function bool CanDoubleJump(Pawn Other)
{
    return Pawn.bCanDoubleJump || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z;
    //return;    
}

function TryCombo(string ComboName)
{
    // End:0xE4
    if(!Pawn.InCurrentCombo() && !NeedsAdrenaline())
    {
        // End:0x46
        if(ComboName ~= "Random")
        {
            ComboName = ComboNames[Rand(4)];            
        }
        else
        {
            // End:0x70
            if(ComboName ~= "DMRandom")
            {
                ComboName = ComboNames[1 + Rand(4 - 1)];
            }
        }
        ComboName = Level.Game.NewRecommendCombo(ComboName, self);
        Pawn.DoComboName(ComboName);
        // End:0xE4
        if(!Pawn.InCurrentCombo())
        {
            Log("WARNING - bot failed to start combo!");
        }
    }
    //return;    
}

function FearThisSpot(AvoidMarker aSpot)
{
    // End:0x23
    if(Skill > (float(1) + (4.5000000 * FRand())))
    {
        super(Controller).FearThisSpot(aSpot);
    }
    //return;    
}

function Startle(Actor Feared)
{
    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return;
    }
    GoalString = "STARTLED!";
    StartleActor = Feared;
    GotoState('Startled');
    //return;    
}

function SetCombatTimer()
{
    SetTimer(1.2000000 - (0.0900000 * FMin(10.0000000, Skill + ReactionTime)), true);
    //return;    
}

function bool AutoTaunt()
{
    return true;
    //return;    
}

function bool DontReuseTaunt(int t)
{
    // End:0x11
    if(t == LastTaunt)
    {
        return true;
    }
    // End:0x49
    if((t == Level.LastTaunt[0]) || t == Level.LastTaunt[1])
    {
        return true;
    }
    LastTaunt = t;
    Level.LastTaunt[1] = Level.LastTaunt[0];
    Level.LastTaunt[0] = t;
    return false;
    //return;    
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    //return;    
}

function Pawn GetMyPlayer()
{
    // End:0x31
    if(PlayerController(Squad.SquadLeader) != none)
    {
        return Squad.SquadLeader.Pawn;
    }
    return super.GetMyPlayer();
    //return;    
}

function UpdatePawnViewPitch()
{
    // End:0x24
    if(Pawn != none)
    {
        Pawn.SetViewPitch(Rotation.Pitch);
    }
    //return;    
}

simulated function float RateWeapon(wWeapon W)
{
    return W.GetAIRating() + (FRand() * 0.0500000);
    //return;    
}

function bool CanImpactJump()
{
    return ((bHasImpactHammer && Pawn.Health >= 80) && Skill >= float(5)) && Squad.AllowImpactJumpBy(self);
    //return;    
}

function bool CanUseTranslocator()
{
    return ((bHasTranslocator && Skill >= float(2)) && Level.TimeSeconds > NextTranslocTime) && Squad.AllowTranslocationBy(self);
    //return;    
}

function ImpactJump()
{
    local Vector RealDestination;

    Pawn.Weapon.FireHack(0);
    RealDestination = Destination;
    Destination = ImpactTarget.Location;
    bPlannedJump = true;
    Pawn.SetPhysics(2);
    Pawn.Velocity = SuggestFallVelocity(Destination, Pawn.Location, Pawn.JumpZ + float(900), Pawn.GroundSpeed);
    // End:0x109
    if(Pawn.Velocity.Z > float(900))
    {
        Pawn.Velocity.Z = Pawn.Velocity.Z - (0.5000000 * Pawn.JumpZ);
        bNotifyApex = true;
        bPendingDoubleJump = true;
    }
    Destination = RealDestination;
    ImpactTarget = none;
    bPreparingMove = false;
    //return;    
}

function WaitForMover(Mover M)
{
    super(AIController).WaitForMover(M);
    StopStartTime = Level.TimeSeconds;
    //return;    
}

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
    LastFireAttempt = Level.TimeSeconds;
    // End:0x2A
    if(Target == none)
    {
        Target = Enemy;
    }
    // End:0x1E8
    if(Target != none)
    {
        // End:0x136
        if(!Pawn.IsFiring())
        {
            // End:0x12B
            if(((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon) || !NeedToTurn(Target.Location) && Pawn.CanAttack(Target))
            {
                Focus = Target;
                bCanFire = true;
                bStoppedFiring = false;
                // End:0x105
                if(Pawn.Weapon != none)
                {
                    bFireSuccess = Pawn.Weapon.BotFire(bFinishedFire);                    
                }
                else
                {
                    Pawn.ChooseFireAt(Target);
                    bFireSuccess = true;
                }
                return bFireSuccess;                
            }
            else
            {
                bCanFire = false;
            }            
        }
        else
        {
            // End:0x1E8
            if(bCanFire && ShouldFireAgain(RefireRate))
            {
                // End:0x1E8
                if(((Target != none) && Focus == Target) && !Target.bDeleteMe)
                {
                    bStoppedFiring = false;
                    // End:0x1C5
                    if(Pawn.Weapon != none)
                    {
                        bFireSuccess = Pawn.Weapon.BotFire(bFinishedFire);                        
                    }
                    else
                    {
                        Pawn.ChooseFireAt(Target);
                        bFireSuccess = true;
                    }
                    return bFireSuccess;
                }
            }
        }
    }
    StopFiring();
    return false;
    //return;    
}

function bool ShouldFireAgain(float RefireRate)
{
    local DestroyableObjective ObjectiveTarget;

    // End:0x0E
    if(FRand() < RefireRate)
    {
        return true;
    }
    // End:0x57
    if(Pawn.FireOnRelease() && (Pawn.Weapon == none) || !Pawn.Weapon.bMeleeWeapon)
    {
        return false;
    }
    // End:0xAB
    if(Pawn(Target) != none)
    {
        return (Pawn.bStationary || Pawn(Target).bStationary) && Pawn(Target).Health > 0;
    }
    // End:0xD7
    if(ShootTarget(Target) != none)
    {
        ObjectiveTarget = DestroyableObjective(Target.Owner);        
    }
    else
    {
        ObjectiveTarget = DestroyableObjective(Target);
    }
    // End:0x134
    if((((ObjectiveTarget != none) && ObjectiveTarget.DamageCapacity > 0) && ObjectiveTarget.bActive) && !ObjectiveTarget.bDisabled)
    {
        return true;
    }
    return false;
    //return;    
}

function TimedFireWeaponAtEnemy()
{
    // End:0x24
    if((Enemy == none) || FireWeaponAt(Enemy))
    {
        SetCombatTimer();        
    }
    else
    {
        SetTimer(0.1000000, true);
    }
    //return;    
}

function bool FireWeaponAt(Actor A)
{
    // End:0x16
    if(A == none)
    {
        A = Enemy;
    }
    // End:0x34
    if((A == none) || Focus != A)
    {
        return false;
    }
    Target = A;
    // End:0x91
    if(Pawn.Weapon != none)
    {
        // End:0x8E
        if(Pawn.Weapon.HasAmmo())
        {
            return WeaponFireAgain(Pawn.Weapon.RefireRate(), false);
        }        
    }
    else
    {
        return WeaponFireAgain(Pawn.RefireRate(), false);
    }
    return false;
    //return;    
}

function bool CanAttack(Actor Other)
{
    return Pawn.CanAttack(Other);
    //return;    
}

function StopFiring()
{
    // End:0x27
    if((Pawn != none) && Pawn.StopWeaponFiring())
    {
        bStoppedFiring = true;
    }
    bCanFire = false;
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
    //return;    
}

function ChangedWeapon()
{
    // End:0x31
    if(Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(0.0000000);
    }
    //return;    
}

function float WeaponPreference(wWeapon W)
{
    local float WeaponStickiness;

    // End:0x6E
    if((((GoalScript != none) && GoalScript.WeaponPreference != none) && ClassIsChildOf(W.Class, GoalScript.WeaponPreference)) && Pawn.ReachedDestination(GoalScript.GetMoveTarget()))
    {
        return 0.3000000;
    }
    // End:0x91
    if((Target != none) && Pawn(Target) == none)
    {
        return 0.0000000;
    }
    // End:0xDB
    if((FavoriteWeapon != none) && ClassIsChildOf(W.Class, FavoriteWeapon))
    {
        // End:0xD5
        if(W == Pawn.Weapon)
        {
            return 0.3000000;
        }
        return 0.1500000;
    }
    // End:0x185
    if(W == Pawn.Weapon)
    {
        WeaponStickiness = 0.1000000 * W.MinReloadPct;
        // End:0x14C
        if((Pawn.Weapon.AIRating < 0.5000000) || Enemy == none)
        {
            return WeaponStickiness + 0.1000000;            
        }
        else
        {
            // End:0x178
            if(Skill < float(5))
            {
                return (WeaponStickiness + 0.6000000) - (0.1000000 * Skill);                
            }
            else
            {
                return WeaponStickiness + 0.1000000;
            }
        }
    }
    return 0.0000000;
    //return;    
}

function bool ProficientWithWeapon()
{
    local float proficiency;

    // End:0x23
    if((Pawn == none) || Pawn.Weapon == none)
    {
        return false;
    }
    proficiency = Skill;
    // End:0x68
    if((FavoriteWeapon != none) && ClassIsChildOf(Pawn.Weapon.Class, FavoriteWeapon))
    {
        proficiency += float(2);
    }
    return proficiency > (float(2) + (FRand() * float(4)));
    //return;    
}

function bool CanComboMoving()
{
    // End:0x34
    if((Skill >= float(5)) && ClassIsChildOf(Pawn.Weapon.Class, FavoriteWeapon))
    {
        return true;
    }
    // End:0x4C
    if(Skill >= float(7))
    {
        return FRand() < 0.9000000;
    }
    return (Skill - float(3)) > (float(4) * FRand());
    //return;    
}

function bool CanCombo()
{
    // End:0x0B
    if(Stopped())
    {
        return true;
    }
    // End:0x26
    if(int(Pawn.Physics) == int(2))
    {
        return false;
    }
    // End:0x59
    if((Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) || MoveTarget == Enemy)
    {
        return true;
    }
    return CanComboMoving();
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local wWeapon Best[5], moving, temp;
    local bool bFound;
    local int i;
    local Inventory Inv;
    local string S;

    super(AIController).DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Squad.DisplayDebug(Canvas, YL, YPos);
    // End:0xC6
    if(GoalScript != none)
    {
        Canvas.DrawText((((((("     " $ GoalString) $ " goalscript ") $ (GetItemName(string(GoalScript)))) $ " Sniping ") $ string(IsSniping())) $ " ReTaskTime ") $ string(ReTaskTime), false);        
    }
    else
    {
        Canvas.DrawText((("     " $ GoalString) $ " ReTaskTime ") $ string(ReTaskTime), false);
    }
    YPos += (float(2) * YL);
    Canvas.SetPos(4.0000000, YPos);
    // End:0x21C
    if(Enemy != none)
    {
        Canvas.DrawText((((((((("Enemy Dist " $ string(VSize(Enemy.Location - Pawn.Location))) $ " Strength ") $ string(RelativeStrength(Enemy))) $ " Acquired ") $ string(bEnemyAcquired)) $ " LastSeenTime ") $ string(Level.TimeSeconds - LastSeenTime)) $ " AcquireTime ") $ string(Level.TimeSeconds - AcquireTime));
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    Inv = Pawn.Inventory;
    J0x230:

    // End:0x345 [Loop If]
    if(Inv != none)
    {
        // End:0x32E
        if(wWeapon(Inv) != none)
        {
            bFound = false;
            i = 0;
            J0x25A:

            // End:0x2A2 [Loop If]
            if(i < 5)
            {
                // End:0x298
                if(Best[i] == none)
                {
                    bFound = true;
                    Best[i] = wWeapon(Inv);
                    // [Explicit Break]
                    goto J0x2A2;
                }
                i++;
                // [Loop Continue]
                goto J0x25A;
            }
            J0x2A2:

            // End:0x32E
            if(!bFound)
            {
                moving = wWeapon(Inv);
                i = 0;
                J0x2C4:

                // End:0x32E [Loop If]
                if(i < 5)
                {
                    // End:0x324
                    if(Best[i].CurrentRating < moving.CurrentRating)
                    {
                        temp = moving;
                        moving = Best[i];
                        Best[i] = temp;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x2C4;
                }
            }
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x230;
    }
    Canvas.DrawText((((("Weapons Fire last attempt at " $ string(LastFireAttempt)) $ " success ") $ string(bFireSuccess)) $ " stopped firing ") $ string(bStoppedFiring), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    i = 0;
    J0x3DB:

    // End:0x43A [Loop If]
    if(i < 5)
    {
        // End:0x430
        if(Best[i] != none)
        {
            S = (S @ (GetItemName(string(Best[i])))) @ string(Best[i].CurrentRating);
        }
        i++;
        // [Loop Continue]
        goto J0x3DB;
    }
    Canvas.DrawText("Weapons: " $ S, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("PERSONALITY: Alertness " $ string(BaseAlertness)) $ " Accuracy ") $ string(Accuracy)) $ " Favorite Weap ") $ string(FavoriteWeapon));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((((((("    Aggressiveness " $ string(BaseAggressiveness)) $ " CombatStyle ") $ string(CombatStyle)) $ " Strafing ") $ string(StrafingAbility)) $ " Tactics ") $ string(Tactics)) $ " TranslocUse ") $ string(TranslocUse));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function name GetOrders()
{
    // End:0x16
    if(HoldSpot(GoalScript) != none)
    {
        return 'HOLD';
    }
    // End:0x35
    if(PlayerController(Squad.SquadLeader) != none)
    {
        return 'Follow';
    }
    return Squad.GetOrders();
    //return;    
}

function Actor GetOrderObject()
{
    // End:0x28
    if(PlayerController(Squad.SquadLeader) != none)
    {
        return Squad.SquadLeader;
    }
    return Squad.SquadObjective;
    //return;    
}

function YellAt(Pawn Moron)
{
    local float threshold;

    // End:0x27
    if(PlayerController(Moron.Controller) == none)
    {
        threshold = 0.9500000;        
    }
    else
    {
        // End:0x40
        if(Enemy == none)
        {
            threshold = 0.3000000;            
        }
        else
        {
            threshold = 0.7000000;
        }
    }
    // End:0x59
    if(FRand() < threshold)
    {
        return;
    }
    SendMessage(Moron.PlayerReplicationInfo, 'FRIENDLYFIRE', 0, 5.0000000, 'Team');
    //return;    
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
    //return;    
}

function SendMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float wait, name BroadcastType)
{
    // End:0x45
    if(((MessageType == OldMessageType) && int(MessageID) == OldMessageID) && (Level.TimeSeconds - OldMessageTime) < wait)
    {
        return;
    }
    // End:0x7F
    if(Level.Game.bGameEnded || Level.Game.bWaitingToStartMatch)
    {
        return;
    }
    OldMessageID = int(MessageID);
    OldMessageType = MessageType;
    //return;    
}

function SetOrders(name NewOrders, Controller OrderGiver)
{
    // End:0x2C
    if(PlayerReplicationInfo.Team != OrderGiver.PlayerReplicationInfo.Team)
    {
        return;
    }
    Aggressiveness = BaseAggressiveness;
    // End:0x61
    if((NewOrders == 'HOLD') || NewOrders == 'Follow')
    {
        Aggressiveness += float(1);
    }
    // End:0x94
    if(bInstantAck)
    {
        SendMessage(OrderGiver.PlayerReplicationInfo, 'ACK', byte(255), 5.0000000, 'Team');        
    }
    else
    {
        SendMessage(OrderGiver.PlayerReplicationInfo, 'ACK', 0, 5.0000000, 'Team');
    }
    bInstantAck = false;
    UnrealTeamInfo(PlayerReplicationInfo.Team).AI.SetOrders(self, NewOrders, OrderGiver);
    WhatToDoNext(1);
    //return;    
}

function SetTemporaryOrders(name NewOrders, Controller OrderGiver)
{
    // End:0x45
    if(OldOrders == 'None')
    {
        OldOrders = GetOrders();
        OldOrderGiver = Squad.SquadLeader;
        // End:0x45
        if(OldOrderGiver == none)
        {
            OldOrderGiver = OrderGiver;
        }
    }
    SetOrders(NewOrders, OrderGiver);
    //return;    
}

function ClearTemporaryOrders()
{
    // End:0x87
    if(OldOrders != 'None')
    {
        Aggressiveness = BaseAggressiveness;
        // End:0x44
        if((OldOrders == 'HOLD') || OldOrders == 'Follow')
        {
            Aggressiveness += float(1);
        }
        UnrealTeamInfo(PlayerReplicationInfo.Team).AI.SetOrders(self, OldOrders, OldOrderGiver);
        OldOrders = 'None';
        OldOrderGiver = none;
    }
    //return;    
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    // End:0x5E
    if((((ChooseAttackCounter < 2) || ChooseAttackTime != Level.TimeSeconds) && NoiseMaker != none) && Squad.SetEnemy(self, NoiseMaker.Instigator))
    {
        WhatToDoNext(2);
    }
    //return;    
}

event SeePlayer(Pawn SeenPlayer)
{
    // End:0x48
    if(((ChooseAttackCounter < 2) || ChooseAttackTime != Level.TimeSeconds) && Squad.SetEnemy(self, SeenPlayer))
    {
        WhatToDoNext(3);
    }
    // End:0x7E
    if(Enemy == SeenPlayer)
    {
        VisibleEnemy = Enemy;
        EnemyVisibilityTime = Level.TimeSeconds;
        bEnemyIsVisible = true;
    }
    //return;    
}

function SetAttractionState()
{
    // End:0x15
    if(Enemy != none)
    {
        GotoState('Fallback');        
    }
    else
    {
        GotoState('Roaming');
    }
    //return;    
}

function bool ClearShot(Vector TargetLoc, bool bImmediateFire)
{
    local bool bSeeTarget;

    // End:0x32
    if((Enemy == none) || VSize(Enemy.Location - TargetLoc) > float(2000))
    {
        return false;
    }
    bSeeTarget = FastTrace(TargetLoc, Pawn.Location + (Pawn.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0xF6
    if((!bImmediateFire && !bSeeTarget) && Pawn.bIsCrouched)
    {
        bSeeTarget = FastTrace(TargetLoc, Pawn.Location + (((Pawn.default.EyeHeight + Pawn.default.CollisionHeight) - Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000)));
    }
    // End:0x13D
    if(!bSeeTarget || !FastTrace(TargetLoc, Enemy.Location + (Enemy.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000))))
    {
    }
    return false;
    // End:0x1D4
    if((Pawn.Weapon.SplashDamage() && VSize(Pawn.Location - TargetLoc) < Pawn.Weapon.GetDamageRadius()) || !FastTrace(TargetLoc + (vect(0.0000000, 0.0000000, 0.9000000) * Enemy.CollisionHeight), Pawn.Location))
    {
        StopFiring();
        return false;
    }
    return true;
    //return;    
}

function bool CanStakeOut()
{
    local float relstr;

    relstr = RelativeStrength(Enemy);
    // End:0xDA
    if((((bFrustrated || !bEnemyInfoValid) || VSize(Enemy.Location - Pawn.Location) > (0.5000000 * (float(2000) + (((FRand() * relstr) - CombatStyle) * float(2000))))) || (Level.TimeSeconds - FMax(LastSeenTime, AcquireTime)) > (2.5000000 + FMax(-1.0000000, 3.0000000 * (FRand() + (float(2) * (relstr - CombatStyle)))))) || !ClearShot(LastSeenPos, false))
    {
        return false;
    }
    return true;
    //return;    
}

function CheckIfShouldCrouch(Vector StartPosition, Vector TargetPosition, float Probability)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, X, Y, Z, projStart;

    // End:0x7C
    if(((!Pawn.bCanCrouch || !Pawn.bIsCrouched && FRand() > Probability) || Skill < (float(3) * FRand())) || Pawn.Weapon.RecommendSplashDamage())
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    projStart = Pawn.Weapon.GetFireStart(X, Y, Z);
    projStart = (projStart + StartPosition) - Pawn.Location;
    projStart.Z = projStart.Z - (1.8000000 * (Pawn.CollisionHeight - Pawn.CrouchHeight));
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x159
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = true;
        return;
    }
    projStart.Z = projStart.Z + (1.8000000 * (Pawn.default.CollisionHeight - Pawn.CrouchHeight));
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x1D1
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    Pawn.bWantsToCrouch = true;
    //return;    
}

function bool IsSniping()
{
    return ((((GoalScript != none) && GoalScript.bSniping) && Pawn.Weapon != none) && Pawn.Weapon.bSniping) && Pawn.ReachedDestination(GoalScript.GetMoveTarget());
    //return;    
}

function FreeScript()
{
    // End:0x21
    if(GoalScript != none)
    {
        GoalScript.FreeScript();
        GoalScript = none;
    }
    //return;    
}

function bool AssignSquadResponsibility()
{
    // End:0x1A
    if(LastAttractCheck == Level.TimeSeconds)
    {
        return false;
    }
    LastAttractCheck = Level.TimeSeconds;
    return Squad.AssignSquadResponsibility(self);
    //return;    
}

function float RelativeStrength(Pawn Other)
{
    local float compare;
    local int adjustedOther;

    // End:0x44
    if(Pawn == none)
    {
        Warn("Relative strength with no pawn in state " $ string(GetStateName()));
        return 0.0000000;
    }
    adjustedOther = int(0.5000000 * float(Other.Health + Other.default.Health));
    compare = 0.0100000 * float(adjustedOther - Pawn.Health);
    compare = (compare - Pawn.AdjustedStrength()) + Other.AdjustedStrength();
    // End:0x17D
    if(Pawn.Weapon != none)
    {
        compare -= ((0.5000000 * Pawn.DamageScaling) * Pawn.Weapon.CurrentRating);
        // End:0x17D
        if(Pawn.Weapon.AIRating < 0.5000000)
        {
            compare += 0.3000000;
            // End:0x17D
            if((Other.Weapon != none) && Other.Weapon.AIRating > 0.5000000)
            {
                compare += 0.3000000;
            }
        }
    }
    // End:0x1C6
    if(Other.Weapon != none)
    {
        compare += ((0.5000000 * Other.DamageScaling) * Other.Weapon.AIRating);
    }
    // End:0x209
    if(Other.Location.Z > (Pawn.Location.Z + float(320)))
    {
        compare += 0.2000000;        
    }
    else
    {
        // End:0x249
        if(Pawn.Location.Z > (Other.Location.Z + float(320)))
        {
            compare -= 0.1500000;
        }
    }
    return Pawn.ModifyThreat(compare, Other);
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x15
    if(TriggerScript(Other, EventInstigator))
    {
        return;
    }
    // End:0x3C
    if((Other == Pawn) || Pawn.Health <= 0)
    {
        return;
    }
    Squad.SetEnemy(self, EventInstigator);
    //return;    
}

function SetEnemyInfo(bool bNewEnemyVisible)
{
    local Bot B;

    bEnemyEngaged = true;
    // End:0x6C
    if(bNewEnemyVisible)
    {
        AcquireTime = Level.TimeSeconds;
        LastSeenTime = Level.TimeSeconds;
        LastSeenPos = Enemy.Location;
        LastSeeingPos = Pawn.Location;
        bEnemyInfoValid = true;        
    }
    else
    {
        LastSeenTime = -1000.0000000;
        bEnemyInfoValid = false;
        B = Squad.SquadMembers;
        J0x93:

        // End:0xE8 [Loop If]
        if(B != none)
        {
            // End:0xD1
            if(B.Enemy == Enemy)
            {
                AcquireTime = FMax(AcquireTime, B.AcquireTime);
            }
            B = B.NextSquadMember;
            // [Loop Continue]
            goto J0x93;
        }
    }
    //return;    
}

function EnemyChanged(bool bNewEnemyVisible)
{
    bEnemyAcquired = false;
    SetEnemyInfo(bNewEnemyVisible);
    //return;    
}

function BotVoiceMessage(name MessageType, byte MessageID, Controller Sender)
{
    // End:0x4B
    if(!Level.Game.bTeamGame || Sender.PlayerReplicationInfo.Team != PlayerReplicationInfo.Team)
    {
        return;
    }
    // End:0x72
    if(MessageType == 'Order')
    {
        SetOrders(OrderNames[int(MessageID)], Sender);
    }
    //return;    
}

function bool StrafeFromDamage(float Damage, Class<DamageType> DamageType, bool bFindDest)
{
    //return;    
}

function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
    local Vector jumpDir;

    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return false;
    }
    // End:0x78
    if(NewVolume.bWaterVolume)
    {
        bPlannedJump = false;
        // End:0x4E
        if(!Pawn.bCanSwim)
        {
            MoveTimer = -1.0000000;            
        }
        else
        {
            // End:0x75
            if(int(Pawn.Physics) != int(3))
            {
                Pawn.SetPhysics(3);
            }
        }        
    }
    else
    {
        // End:0x16B
        if(int(Pawn.Physics) == int(3))
        {
            // End:0xB4
            if(Pawn.bCanFly)
            {
                Pawn.SetPhysics(4);                
            }
            else
            {
                Pawn.SetPhysics(2);
                // End:0x16B
                if(((Pawn.bCanWalk && (Abs(Pawn.Acceleration.X) + Abs(Pawn.Acceleration.Y)) > float(0)) && Destination.Z >= Pawn.Location.Z) && Pawn.CheckWaterJump(jumpDir))
                {
                    Pawn.JumpOutOfWater(jumpDir);
                    bNotifyApex = true;
                    bPendingDoubleJump = true;
                }
            }
        }
    }
    return false;
    //return;    
}

event MayDodgeToMoveTarget()
{
    local Vector Dir, X, Y, Z, DodgeV, NewDir;

    local float dist, newdist, RealJumpZ;
    local Actor OldMoveTarget;

    // End:0x3B
    if((int(Pawn.Physics) != int(1)) || (FRand() > 0.8500000) && RoadPathNode(MoveTarget) == none)
    {
        return;
    }
    // End:0x6E
    if((bTranslocatorHop || Focus != MoveTarget) && (Skill + Jumpiness) < float(6))
    {
        return;
    }
    // End:0xAD
    if(Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return;
    }
    Dir = MoveTarget.Location - Pawn.Location;
    dist = VSize(Dir);
    OldMoveTarget = MoveTarget;
    // End:0x24B
    if((dist < float(800)) || Dir.Z < float(0))
    {
        // End:0x168
        if((((PathNode(MoveTarget) == none) && PlayerStart(MoveTarget) == none) || MoveTarget != RouteCache[0]) || RouteCache[0] == none)
        {
            // End:0x165
            if(dist < float(800))
            {
                return;
            }            
        }
        else
        {
            // End:0x24B
            if(RouteCache[1] != none)
            {
                // End:0x1BC
                if((Pawn.Location.Z + 35.0000000) < RouteCache[1].Location.Z)
                {
                    // End:0x1BC
                    if(dist < float(800))
                    {
                        return;
                    }
                }
                NewDir = RouteCache[1].Location - Pawn.Location;
                newdist = VSize(NewDir);
                // End:0x238
                if((newdist > float(800)) && CanMakePathTo(RouteCache[1]))
                {
                    dist = newdist;
                    Dir = NewDir;
                    MoveTarget = RouteCache[1];                    
                }
                else
                {
                    // End:0x24B
                    if(dist < float(800))
                    {
                        return;
                    }
                }
            }
        }
    }
    // End:0x265
    if(Focus == OldMoveTarget)
    {
        Focus = MoveTarget;
    }
    Destination = MoveTarget.Location;
    GetAxes(Pawn.Rotation, X, Y, Z);
    // End:0x2FF
    if(Abs(X Dot Dir) > Abs(Y Dot Dir))
    {
        // End:0x2E6
        if((X Dot Dir) > float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 3;            
        }
        else
        {
            UnrealPawn(Pawn).CurrentDir = 4;
        }        
    }
    else
    {
        // End:0x32C
        if((Y Dot Dir) < float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 1;            
        }
        else
        {
            UnrealPawn(Pawn).CurrentDir = 2;
        }
    }
    bPlannedJump = true;
    Pawn.PerformDodge(UnrealPawn(Pawn).CurrentDir, Normal(Dir), vect(0.0000000, 0.0000000, 0.0000000));
    // End:0x3A3
    if(!bTranslocatorHop)
    {
        bNotifyApex = true;
        bPendingDoubleJump = true;
        bDodgingForward = true;
    }
    // End:0x479
    if(Dir.Z < (float(-1) * Pawn.CollisionHeight))
    {
        Pawn.Velocity.Z = 0.0000000;
        RealJumpZ = Pawn.JumpZ;
        DodgeV = UnrealPawn(Pawn).BotDodge(vect(1.0000000, 0.0000000, 0.0000000));
        Pawn.JumpZ = DodgeV.Z;
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, DodgeV.X);
        Pawn.JumpZ = RealJumpZ;
    }
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

event NotifyJumpApex()
{
    local Vector HitLocation, HitNormal, Dir, Extent;
    local Actor HitActor;

    // End:0xC5
    if(bDodgingForward)
    {
        Extent = Pawn.GetCollisionExtent();
        bDodgingForward = false;
        Dir = Pawn.Velocity;
        Dir.Z = 0.0000000;
        HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + (float(140) * Normal(Dir))) + vect(0.0000000, 0.0000000, 32.0000000), Pawn.Location, false, Extent);
        // End:0xBD
        if(HitActor != none)
        {
            bNotifyApex = false;
            bPendingDoubleJump = false;
            return;            
        }
        else
        {
            bPendingDoubleJump = true;
        }
    }
    super.NotifyJumpApex();
    //return;    
}

event NotifyMissedJump()
{
    local NavigationPoint N;
    local Actor OldMoveTarget;
    local Vector Loc2D, NavLoc2D;
    local float BestDist, newdist;

    OldMoveTarget = MoveTarget;
    // End:0x1D
    if(!bHasTranslocator)
    {
        MoveTarget = none;
    }
    // End:0x209
    if(MoveTarget == none)
    {
        // End:0xC1
        if(bHasTranslocator && Skill >= float(2))
        {
            N = Level.NavigationPointList;
            J0x55:

            // End:0xBE [Loop If]
            if(N != none)
            {
                // End:0xA7
                if((VSize(N.Location - Pawn.Location) < float(1500)) && LineOfSightTo(N))
                {
                    MoveTarget = N;
                    // [Explicit Break]
                    goto J0xBE;
                }
                N = N.nextNavigationPoint;
                // [Loop Continue]
                goto J0x55;
            }
            J0xBE:
            
        }
        else
        {
            Loc2D = Pawn.Location;
            Loc2D.Z = 0.0000000;
            N = Level.NavigationPointList;
            J0xF9:

            // End:0x1F1 [Loop If]
            if(N != none)
            {
                // End:0x1DA
                if(N.Location.Z < Pawn.Location.Z)
                {
                    NavLoc2D = N.Location;
                    NavLoc2D.Z = 0.0000000;
                    newdist = VSize(NavLoc2D - Loc2D);
                    // End:0x1DA
                    if(((newdist <= (Pawn.Location.Z - N.Location.Z)) && (MoveTarget == none) || BestDist > newdist) && LineOfSightTo(N))
                    {
                        MoveTarget = N;
                        BestDist = newdist;
                    }
                }
                N = N.nextNavigationPoint;
                // [Loop Continue]
                goto J0xF9;
            }
        }
        // End:0x209
        if(MoveTarget == none)
        {
            MoveTarget = OldMoveTarget;
            return;
        }
    }
    // End:0x286
    if(Pawn.Weapon.IsA('BallLauncher'))
    {
        // End:0x283
        if(PlayerReplicationInfo.HasFlag != none)
        {
            Pawn.Weapon.SetAITarget(MoveTarget);
            bPlannedShot = true;
            Target = MoveTarget;
            Pawn.Weapon.BotFire(false);
        }        
    }
    else
    {
        // End:0x340
        if(bHasTranslocator && Skill >= float(2))
        {
            // End:0x340
            if(!bPreparingMove || TranslocationTarget != MoveTarget)
            {
                bPreparingMove = true;
                TranslocationTarget = MoveTarget;
                RealTranslocationTarget = MoveTarget;
                ImpactTarget = MoveTarget;
                Focus = MoveTarget;
                // End:0x33A
                if(Pawn.Weapon.IsA('Translauncher'))
                {
                    Pawn.PendingWeapon = none;
                    Pawn.Weapon.SetTimer(0.2000000, false);                    
                }
                else
                {
                    SwitchToBestWeapon();
                }
            }
        }
    }
    MoveTimer = 1.0000000;
    //return;    
}

function Reset()
{
    super(AIController).Reset();
    ResetSkill();
    bFrustrated = false;
    bInitLifeMessage = false;
    bReachedGatherPoint = false;
    bFinalStretch = false;
    bHasSuperWeapon = false;
    StartleActor = none;
    GoalScript = none;
    // End:0x54
    if(Pawn == none)
    {
        GotoState('Dead');
    }
    //return;    
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    bPlannedJump = false;
    ResetSkill();
    Pawn.MaxFallSpeed = 1.1000000 * Pawn.default.MaxFallSpeed;
    Pawn.SetMovementPhysics();
    // End:0x73
    if(int(Pawn.Physics) == int(1))
    {
        Pawn.SetPhysics(2);
    }
    Enable('NotifyBump');
    //return;    
}

function InitializeSkill(float InSkill)
{
    Skill = FClamp(InSkill, 0.0000000, 7.0000000);
    ResetSkill();
    //return;    
}

function ResetSkill()
{
    local float AdjustedYaw;

    DeathMatch(Level.Game).TweakSkill(self);
    // End:0x3A
    if(Skill < float(3))
    {
        DodgeToGoalPct = 0.0000000;        
    }
    else
    {
        DodgeToGoalPct = (3.0000000 * Jumpiness) + (Skill / float(6));
    }
    Aggressiveness = BaseAggressiveness;
    // End:0x9E
    if(Pawn != none)
    {
        Pawn.bCanDoubleJump = (Skill >= float(3)) && Pawn.CanMultiJump();
    }
    bLeadTarget = Skill >= float(4);
    SetCombatTimer();
    SetPeripheralVision();
    // End:0xE4
    if((Skill + ReactionTime) > float(7))
    {
        RotationRate.Yaw = 90000;        
    }
    else
    {
        // End:0x127
        if((Skill + ReactionTime) >= float(4))
        {
            RotationRate.Yaw = int(float(7000) + (float(10000) * (Skill + ReactionTime)));            
        }
        else
        {
            RotationRate.Yaw = int(float(30000) + (float(4000) * (Skill + ReactionTime)));
        }
    }
    AdjustedYaw = (0.7500000 + (0.0500000 * ReactionTime)) * float(RotationRate.Yaw);
    AcquisitionYawRate = int(AdjustedYaw);
    SetMaxDesiredSpeed();
    //return;    
}

function SetMaxDesiredSpeed()
{
    // End:0x52
    if(Pawn != none)
    {
        // End:0x30
        if(Skill > float(3))
        {
            Pawn.MaxDesiredSpeed = 1.0000000;            
        }
        else
        {
            Pawn.MaxDesiredSpeed = 0.6000000 + (0.1000000 * Skill);
        }
    }
    //return;    
}

function SetPeripheralVision()
{
    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    // End:0x58
    if(Pawn.bStationary || int(Pawn.Physics) == int(4))
    {
        bSlowerZAcquire = false;
        Pawn.PeripheralVision = -0.7000000;
        return;
    }
    bSlowerZAcquire = true;
    // End:0x85
    if(Skill < float(2))
    {
        Pawn.PeripheralVision = 0.7000000;        
    }
    else
    {
        // End:0xB2
        if(Skill > float(6))
        {
            bSlowerZAcquire = false;
            Pawn.PeripheralVision = -0.2000000;            
        }
        else
        {
            Pawn.PeripheralVision = 1.0000000 - (0.2000000 * Skill);
        }
    }
    Pawn.PeripheralVision = FMin(Pawn.PeripheralVision - BaseAlertness, 0.8000000);
    Pawn.SightRadius = Pawn.default.SightRadius;
    //return;    
}

function SetAlertness(float NewAlertness)
{
    // End:0x58
    if(Pawn.Alertness != NewAlertness)
    {
        Pawn.PeripheralVision += (0.7070000 * (Pawn.Alertness - NewAlertness));
        Pawn.Alertness = NewAlertness;
    }
    //return;    
}

function WasKilledBy(Controller Other)
{
    local Controller C;

    // End:0xAA
    if(Pawn.bUpdateEyeheight)
    {
        C = Level.ControllerList;
        J0x26:

        // End:0xAA [Loop If]
        if(C != none)
        {
            // End:0x93
            if((C.IsA('PlayerController') && PlayerController(C).ViewTarget == Pawn) && PlayerController(C).RealViewTarget == none)
            {
                PlayerController(C).ViewNextBot();
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x26;
        }
    }
    // End:0xE8
    if((Other != none) && Other.Pawn != none)
    {
        LastKillerPosition = Other.Pawn.Location;
    }
    //return;    
}

function WhatToDoNext(byte CallingByte)
{
    // End:0x9A
    if(ChooseAttackTime == Level.TimeSeconds)
    {
        ChooseAttackCounter++;
        // End:0x97
        if(ChooseAttackCounter > 3)
        {
            Log((((((("CHOOSEATTACKSERIAL in state " $ string(GetStateName())) $ " enemy ") $ (GetEnemyName())) $ " old enemy ") $ (GetOldEnemyName())) $ " CALLING BYTE ") $ string(CallingByte));
        }        
    }
    else
    {
        ChooseAttackTime = Level.TimeSeconds;
        ChooseAttackCounter = 0;
    }
    OldEnemy = Enemy;
    ChoosingAttackLevel++;
    ExecuteWhatToDoNext();
    ChoosingAttackLevel--;
    ReTaskTime = 0.0000000;
    //return;    
}

function string GetOldEnemyName()
{
    // End:0x15
    if(OldEnemy == none)
    {
        return "NONE";        
    }
    else
    {
        return OldEnemy.GetHumanReadableName();
    }
    //return;    
}

function string GetEnemyName()
{
    // End:0x15
    if(Enemy == none)
    {
        return "NONE";        
    }
    else
    {
        return Enemy.GetHumanReadableName();
    }
    //return;    
}

function ExecuteWhatToDoNext()
{
    bHasFired = false;
    GoalString = "WhatToDoNext at " $ string(Level.TimeSeconds);
    // End:0x68
    if(Pawn == none)
    {
        Warn((GetHumanReadableName()) $ " WhatToDoNext with no pawn");
        return;        
    }
    else
    {
        // End:0xDF
        if((Pawn.Weapon == none) && Vehicle(Pawn) == none)
        {
            Warn(((((GetHumanReadableName()) $ " WhatToDoNext with no weapon, ") $ string(Pawn)) $ " health ") $ string(Pawn.Health));
        }
    }
    // End:0x1F4
    if(Enemy == none)
    {
        // End:0x1A7
        if(Level.Game.TooManyBots(self))
        {
            // End:0x1A2
            if(Pawn != none)
            {
                // End:0x16F
                if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
                {
                    Vehicle(Pawn).Driver.KilledBy(Vehicle(Pawn).Driver);                    
                }
                else
                {
                    Pawn.Health = 0;
                    Pawn.Died(self, Class'Engine.Suicided', Pawn.Location);
                }
            }
            Destroy();
            return;
        }
        BlockedPath = none;
        bFrustrated = false;
        // End:0x1F4
        if((Target == none) || (Pawn(Target) != none) && Pawn(Target).Health <= 0)
        {
            StopFiring();
        }
    }
    // End:0x20A
    if((ScriptingOverridesAI()) && ShouldPerformScript())
    {
        return;
    }
    // End:0x232
    if(int(Pawn.Physics) == int(0))
    {
        Pawn.SetMovementPhysics();
    }
    // End:0x258
    if((int(Pawn.Physics) == int(2)) && DoWaitForLanding())
    {
        return;
    }
    // End:0x2BB
    if(((StartleActor != none) && !StartleActor.bDeleteMe) && VSize(StartleActor.Location - Pawn.Location) < StartleActor.CollisionRadius)
    {
        Startle(StartleActor);
        return;
    }
    bIgnoreEnemyChange = true;
    // End:0x300
    if((Enemy != none) && (Enemy.Health <= 0) || Enemy.Controller == none)
    {
        LoseEnemy();
    }
    // End:0x31F
    if(Enemy == none)
    {
        Squad.FindNewEnemyFor(self, false);        
    }
    else
    {
        // End:0x383
        if(!Squad.MustKeepEnemy(Enemy) && !EnemyVisible())
        {
            // End:0x36F
            if(Squad.IsDefending(self))
            {
                // End:0x36C
                if(LostContact(4.0000000))
                {
                    LoseEnemy();
                }                
            }
            else
            {
                // End:0x383
                if(LostContact(7.0000000))
                {
                    LoseEnemy();
                }
            }
        }
    }
    bIgnoreEnemyChange = false;
    // End:0x3A9
    if(AssignSquadResponsibility())
    {
        // End:0x3A1
        if(Pawn == none)
        {
            return;
        }
        SwitchToBestWeapon();
        return;
    }
    // End:0x3B4
    if(ShouldPerformScript())
    {
        return;
    }
    // End:0x3C8
    if(Enemy != none)
    {
        ChooseAttackMode();        
    }
    else
    {
        GoalString = "WhatToDoNext Wander or Camp at " $ string(Level.TimeSeconds);
        WanderOrCamp(true);
    }
    SwitchToBestWeapon();
    //return;    
}

function bool DoWaitForLanding()
{
    GotoState('WaitingForLanding');
    return true;
    //return;    
}

function bool EnemyVisible()
{
    // End:0x30
    if((EnemyVisibilityTime == Level.TimeSeconds) && VisibleEnemy == Enemy)
    {
        return bEnemyIsVisible;
    }
    VisibleEnemy = Enemy;
    EnemyVisibilityTime = Level.TimeSeconds;
    bEnemyIsVisible = LineOfSightTo(Enemy);
    return bEnemyIsVisible;
    //return;    
}

function VehicleFightEnemy(bool bCanCharge, float EnemyStrength)
{
    // End:0x5D
    if(Pawn.bStationary || Vehicle(Pawn).bKeyVehicle)
    {
        // End:0x50
        if(!EnemyVisible())
        {
            GoalString = "Stake Out";
            DoStakeOut();            
        }
        else
        {
            DoRangedAttackOn(Enemy);
        }
        return;
    }
    // End:0xEF
    if((!bFrustrated && Pawn.HasWeapon()) && Pawn.TooCloseToAttack(Enemy))
    {
        GoalString = "Retreat";
        // End:0xE7
        if((PlayerReplicationInfo.Team != none) && FRand() < 0.0500000)
        {
            SendMessage(none, 'Other', GetMessageIndex('injured'), 15.0000000, 'Team');
        }
        DoRetreat();
        return;
    }
    // End:0x183
    if(((Enemy == FailedHuntEnemy) && Level.TimeSeconds == FailedHuntTime) || Vehicle(Pawn).bKeyVehicle)
    {
        GoalString = "FAILED HUNT - HANG OUT";
        // End:0x17A
        if(Pawn.HasWeapon() && EnemyVisible())
        {
            DoRangedAttackOn(Enemy);            
        }
        else
        {
            WanderOrCamp(true);
        }
        return;
    }
    // End:0x29B
    if(!EnemyVisible())
    {
        // End:0x1C9
        if(Squad.MustKeepEnemy(Enemy))
        {
            GoalString = "Hunt priority enemy";
            GotoState('Hunting');
            return;
        }
        GoalString = "Enemy not visible";
        // End:0x22C
        if(!bCanCharge || Squad.IsDefending(self) && LostContact(4.0000000))
        {
            GoalString = "Stake Out";
            DoStakeOut();            
        }
        else
        {
            // End:0x286
            if((((Aggression < float(1)) && !LostContact(3.0000000 + (float(2) * FRand()))) || IsSniping()) && CanStakeOut())
            {
                GoalString = "Stake Out2";
                DoStakeOut();                
            }
            else
            {
                GoalString = "Hunt";
                GotoState('Hunting');
            }
        }
        return;
    }
    BlockedPath = none;
    Target = Enemy;
    // End:0x316
    if((Pawn.bCanFly && !Enemy.bCanFly) && FRand() < (0.1700000 * ((Skill + Tactics) - float(1))))
    {
        GoalString = "Do tactical move";
        DoTacticalMove();
        return;
    }
    // End:0x34F
    if(Pawn.RecommendLongRangedAttack())
    {
        GoalString = "Long Ranged Attack";
        DoRangedAttackOn(Enemy);
        return;
    }
    GoalString = "Charge";
    DoCharge();
    //return;    
}

function FightEnemy(bool bCanCharge, float EnemyStrength)
{
    local Vector X, Y, Z;
    local float enemyDist, AdjustedCombatStyle;
    local bool bFarAway, bOldForcedCharge;

    // End:0x66
    if(((Squad == none) || Enemy == none) || Pawn == none)
    {
        Log((((("HERE 3 Squad " $ string(Squad)) $ " Enemy ") $ string(Enemy)) $ " pawn ") $ string(Pawn));
    }
    // End:0x89
    if(Vehicle(Pawn) != none)
    {
        VehicleFightEnemy(bCanCharge, EnemyStrength);
        return;
    }
    // End:0x106
    if((Enemy == FailedHuntEnemy) && Level.TimeSeconds == FailedHuntTime)
    {
        GoalString = "FAILED HUNT - HANG OUT";
        // End:0xE4
        if(EnemyVisible())
        {
            bCanCharge = false;            
        }
        else
        {
            // End:0xFD
            if(FindInventoryGoal(0.0000000))
            {
                SetAttractionState();
                return;                
            }
            else
            {
                WanderOrCamp(true);
                return;
            }
        }
    }
    bOldForcedCharge = bMustCharge;
    bMustCharge = false;
    enemyDist = VSize(Pawn.Location - Enemy.Location);
    AdjustedCombatStyle = CombatStyle + Pawn.Weapon.SuggestAttackStyle();
    Aggression = ((((1.5000000 * FRand()) - 0.8000000) + (float(2) * AdjustedCombatStyle)) - (0.5000000 * EnemyStrength)) + (FRand() * (Normal(Enemy.Velocity - Pawn.Velocity) Dot Normal(Enemy.Location - Pawn.Location)));
    // End:0x218
    if(Enemy.Weapon != none)
    {
        Aggression += (float(2) * Enemy.Weapon.SuggestDefenseStyle());
    }
    // End:0x235
    if(enemyDist > float(2000))
    {
        Aggression += 0.5000000;
    }
    // End:0x346
    if((int(Pawn.Physics) == int(1)) || int(Pawn.Physics) == int(2))
    {
        // End:0x2C0
        if(Pawn.Location.Z > (Enemy.Location.Z + float(320)))
        {
            Aggression = FMax(0.0000000, (Aggression - 1.0000000) + AdjustedCombatStyle);            
        }
        else
        {
            // End:0x2FF
            if((Skill < float(4)) && enemyDist > (0.6500000 * float(2000)))
            {
                bFarAway = true;
                Aggression += 0.5000000;                
            }
            else
            {
                // End:0x346
                if(Pawn.Location.Z < (Enemy.Location.Z - Pawn.CollisionHeight))
                {
                    Aggression += CombatStyle;
                }
            }
        }
    }
    // End:0x49D
    if(!EnemyVisible())
    {
        // End:0x38C
        if(Squad.MustKeepEnemy(Enemy))
        {
            GoalString = "Hunt priority enemy";
            GotoState('Hunting');
            return;
        }
        GoalString = "Enemy not visible";
        // End:0x3D6
        if(!bCanCharge)
        {
            GoalString = "Stake Out - no charge";
            DoStakeOut();            
        }
        else
        {
            // End:0x42E
            if((Squad.IsDefending(self) && LostContact(4.0000000)) && ClearShot(LastSeenPos, false))
            {
                GoalString = "Stake Out " $ string(LastSeenPos);
                DoStakeOut();                
            }
            else
            {
                // End:0x488
                if((((Aggression < float(1)) && !LostContact(3.0000000 + (float(2) * FRand()))) || IsSniping()) && CanStakeOut())
                {
                    GoalString = "Stake Out2";
                    DoStakeOut();                    
                }
                else
                {
                    GoalString = "Hunt";
                    GotoState('Hunting');
                }
            }
        }
        return;
    }
    BlockedPath = none;
    Target = Enemy;
    // End:0x4F6
    if(Pawn.Weapon.bMeleeWeapon || bCanCharge && bOldForcedCharge)
    {
        GoalString = "Charge";
        DoCharge();
        return;
    }
    // End:0x52F
    if(Pawn.RecommendLongRangedAttack())
    {
        GoalString = "Long Ranged Attack";
        DoRangedAttackOn(Enemy);
        return;
    }
    // End:0x58D
    if((((bCanCharge && Skill < float(5)) && bFarAway) && Aggression > float(1)) && FRand() < 0.5000000)
    {
        GoalString = "Charge closer";
        DoCharge();
        return;
    }
    // End:0x608
    if((Pawn.Weapon.RecommendRangedAttack() || IsSniping()) || (FRand() > (0.1700000 * ((Skill + Tactics) - float(1)))) && !DefendMelee(enemyDist))
    {
        GoalString = "Ranged Attack";
        DoRangedAttackOn(Enemy);
        return;
    }
    // End:0x636
    if(bCanCharge)
    {
        // End:0x636
        if(Aggression > float(1))
        {
            GoalString = "Charge 2";
            DoCharge();
            return;
        }
    }
    GoalString = "Do tactical move";
    // End:0x702
    if((!Pawn.Weapon.RecommendSplashDamage() && FRand() < 0.7000000) && ((float(3) * Jumpiness) + (FRand() * Skill)) > float(3))
    {
        GetAxes(Pawn.Rotation, X, Y, Z);
        GoalString = "Try to Duck ";
        // End:0x6F6
        if(FRand() < 0.5000000)
        {
            Y *= float(-1);
            TryToDuck(Y, true);            
        }
        else
        {
            TryToDuck(Y, false);
        }
    }
    DoTacticalMove();
    //return;    
}

function DoRangedAttackOn(Actor A)
{
    Target = A;
    GotoState('RangedAttack');
    //return;    
}

function ChooseAttackMode()
{
    local float EnemyStrength, WeaponRating, RetreatThreshold;

    GoalString = " ChooseAttackMode last seen " $ string(Level.TimeSeconds - LastSeenTime);
    // End:0xA3
    if(((Squad == none) || Enemy == none) || Pawn == none)
    {
        Log((((("HERE 1 Squad " $ string(Squad)) $ " Enemy ") $ string(Enemy)) $ " pawn ") $ string(Pawn));
    }
    EnemyStrength = RelativeStrength(Enemy);
    // End:0xD2
    if(Vehicle(Pawn) != none)
    {
        VehicleFightEnemy(true, EnemyStrength);
        return;
    }
    // End:0x1AD
    if(!bFrustrated && !Squad.MustKeepEnemy(Enemy))
    {
        RetreatThreshold = Aggressiveness;
        // End:0x144
        if(Pawn.Weapon.CurrentRating > 0.5000000)
        {
            RetreatThreshold = (RetreatThreshold + 0.3500000) - (Skill * 0.0500000);
        }
        // End:0x1AD
        if(EnemyStrength > RetreatThreshold)
        {
            GoalString = "Retreat";
            // End:0x1A5
            if((PlayerReplicationInfo.Team != none) && FRand() < 0.0500000)
            {
                SendMessage(none, 'Other', GetMessageIndex('injured'), 15.0000000, 'Team');
            }
            DoRetreat();
            return;
        }
    }
    // End:0x3A2
    if(((int(Squad.PriorityObjective(self)) == 0) && (Skill + Tactics) > float(2)) && (EnemyStrength > -0.3000000) || Pawn.Weapon.AIRating < 0.5000000)
    {
        // End:0x277
        if(Pawn.Weapon.AIRating < 0.5000000)
        {
            // End:0x24E
            if(EnemyStrength > 0.3000000)
            {
                WeaponRating = 0.0000000;                
            }
            else
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(2000);
            }            
        }
        else
        {
            // End:0x2AF
            if(EnemyStrength > 0.3000000)
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(2000);                
            }
            else
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(1000);
            }
        }
        // End:0x3A2
        if(FindInventoryGoal(WeaponRating))
        {
            // End:0x333
            if(InventorySpot(RouteGoal) == none)
            {
                GoalString = "fallback - inventory goal is not pickup but " $ string(RouteGoal);                
            }
            else
            {
                GoalString = (("Fallback to better pickup " $ string(InventorySpot(RouteGoal).markedItem)) $ " hidden ") $ string(InventorySpot(RouteGoal).markedItem.bHidden);
            }
            GotoState('Fallback');
            return;
        }
    }
    GoalString = "ChooseAttackMode FightEnemy";
    FightEnemy(true, EnemyStrength);
    //return;    
}

function bool FindSuperPickup(float MaxDist)
{
    local Actor BestPath;
    local Pickup P;

    // End:0x42
    if(((LastSearchTime == Level.TimeSeconds) || !Pawn.bCanPickupInventory) || Vehicle(Pawn) != none)
    {
        return false;
    }
    // End:0x82
    if((DeathMatch(Level.Game) != none) && !DeathMatch(Level.Game).WantsPickups(self))
    {
        return false;
    }
    LastSearchTime = Level.TimeSeconds;
    LastSearchWeight = -1.0000000;
    BestPath = FindBestSuperPickup(MaxDist);
    // End:0x17F
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        // End:0xEB
        if(Pickup(RouteGoal) != none)
        {
            P = Pickup(RouteGoal);            
        }
        else
        {
            // End:0x114
            if(InventorySpot(RouteGoal) != none)
            {
                P = InventorySpot(RouteGoal).markedItem;
            }
        }
        // End:0x17D
        if(((P != none) && PlayerReplicationInfo.Team != none) && PlayerReplicationInfo.Team.TeamIndex < 4)
        {
            P.TeamOwner[PlayerReplicationInfo.Team.TeamIndex] = self;
        }
        return true;
    }
    return false;
    //return;    
}

function bool FindInventoryGoal(float BestWeight)
{
    local Actor BestPath;

    // End:0x2B
    if((LastSearchTime == Level.TimeSeconds) && LastSearchWeight >= BestWeight)
    {
        return false;
    }
    // End:0x6B
    if((DeathMatch(Level.Game) != none) && !DeathMatch(Level.Game).WantsPickups(self))
    {
        return false;
    }
    // End:0x93
    if(!Pawn.bCanPickupInventory || Vehicle(Pawn) != none)
    {
        return false;
    }
    LastSearchTime = Level.TimeSeconds;
    LastSearchWeight = BestWeight;
    // End:0xDB
    if((Skill > float(3)) && Enemy == none)
    {
        RespawnPredictionTime = 4.0000000;        
    }
    else
    {
        RespawnPredictionTime = 0.0000000;
    }
    BestPath = FindBestInventoryPath(BestWeight);
    // End:0x10C
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        return true;
    }
    return false;
    //return;    
}

function bool PickRetreatDestination()
{
    local Actor BestPath;

    // End:0x10
    if(FindInventoryGoal(0.0000000))
    {
        return true;
    }
    // End:0x71
    if(((RouteGoal == none) || Pawn.Anchor == RouteGoal) || Pawn.ReachedDestination(RouteGoal))
    {
        RouteGoal = FindRandomDest();
        BestPath = RouteCache[0];
        // End:0x71
        if(RouteGoal == none)
        {
            return false;
        }
    }
    // End:0xAB
    if(BestPath == none)
    {
        BestPath = FindPathToward(RouteGoal, Pawn.bCanPickupInventory && Vehicle(Pawn) == none);
    }
    // End:0xC3
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        return true;
    }
    RouteGoal = none;
    return false;
    //return;    
}

event SoakStop(string problem)
{
    local UnrealPlayer PC;

    Log(problem);
    SoakString = problem;
    GoalString = SoakString @ GoalString;
    // End:0x4C
    foreach DynamicActors(Class'UnrealGame_Decompressed.UnrealPlayer', PC)
    {
        PC.SoakPause(Pawn);
        // End:0x4C
        break;        
    }    
    //return;    
}

function bool FindRoamDest()
{
    local Actor BestPath;

    // End:0x1C6
    if(Pawn.FindAnchorFailedTime == Level.TimeSeconds)
    {
        GoalString = "No anchor " $ string(Level.TimeSeconds);
        // End:0x1C4
        if(Pawn.LastValidAnchorTime > float(5))
        {
            // End:0x84
            if(bSoaking)
            {
                SoakStop("NO PATH AVAILABLE!!!");                
            }
            else
            {
                // End:0x13A
                if((NumRandomJumps > 4) || PhysicsVolume.bWaterVolume)
                {
                    Pawn.Health = 0;
                    // End:0x112
                    if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
                    {
                        Vehicle(Pawn).Driver.KilledBy(Vehicle(Pawn).Driver);                        
                    }
                    else
                    {
                        Pawn.Died(self, Class'Engine.Suicided', Pawn.Location);
                    }
                    return true;                    
                }
                else
                {
                    NumRandomJumps++;
                    // End:0x1C4
                    if((Vehicle(Pawn) == none) && int(Pawn.Physics) != int(2))
                    {
                        Pawn.SetPhysics(2);
                        Pawn.Velocity = (0.5000000 * Pawn.GroundSpeed) * VRand();
                        Pawn.Velocity.Z = Pawn.JumpZ;
                    }
                }
            }
        }
        return false;
    }
    NumRandomJumps = 0;
    GoalString = "Find roam dest " $ string(Level.TimeSeconds);
    // End:0x2D2
    if(((RouteGoal == none) || Pawn.Anchor == RouteGoal) || Pawn.ReachedDestination(RouteGoal))
    {
        Squad.SetFreelanceScriptFor(self);
        // End:0x26E
        if(GoalScript != none)
        {
            RouteGoal = GoalScript.GetMoveTarget();
            BestPath = none;            
        }
        else
        {
            RouteGoal = FindRandomDest();
            BestPath = RouteCache[0];
        }
        // End:0x2D2
        if(RouteGoal == none)
        {
            // End:0x2D0
            if(bSoaking && int(Physics) != int(2))
            {
                SoakStop("COULDN'T FIND ROAM DESTINATION");
            }
            return false;
        }
    }
    // End:0x2EC
    if(BestPath == none)
    {
        BestPath = FindPathToward(RouteGoal, false);
    }
    // End:0x30A
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        SetAttractionState();
        return true;
    }
    // End:0x351
    if(bSoaking && int(Physics) != int(2))
    {
        SoakStop("COULDN'T FIND ROAM PATH TO " $ string(RouteGoal));
    }
    RouteGoal = none;
    FreeScript();
    return false;
    //return;    
}

function bool TestDirection(Vector Dir, out Vector pick)
{
    local Vector HitLocation, HitNormal, dist;
    local Actor HitActor;

    pick = Dir * (float(200) + (float(2 * 200) * FRand()));
    HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + pick) + ((1.5000000 * Pawn.CollisionRadius) * Dir), Pawn.Location, false);
    // End:0xCE
    if(HitActor != none)
    {
        pick = HitLocation + (((HitNormal - Dir) * float(2)) * Pawn.CollisionRadius);
        // End:0xCB
        if(!FastTrace(pick, Pawn.Location))
        {
            return false;
        }        
    }
    else
    {
        pick = Pawn.Location + pick;
    }
    dist = pick - Pawn.Location;
    // End:0x12D
    if(int(Pawn.Physics) == int(1))
    {
        dist.Z = 0.0000000;
    }
    return VSize(dist) > float(200);
    //return;    
}

function Restart()
{
    // End:0x29
    if(!bVehicleTransition)
    {
        super(Controller).Restart();
        ResetSkill();
        GotoState('Roaming', 'DoneRoaming');
        ClearTemporaryOrders();
    }
    //return;    
}

function bool CheckPathToGoalAround(Pawn P)
{
    return false;
    //return;    
}

function CancelCampFor(Controller C)
{
    //return;    
}

function ClearPathFor(Controller C)
{
    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return;
    }
    // End:0x2B
    if(AdjustAround(C.Pawn))
    {
        return;
    }
    // End:0x5F
    if(Enemy != none)
    {
        // End:0x5C
        if((EnemyVisible()) && Pawn.bCanStrafe)
        {
            GotoState('TacticalMove');
            return;
        }        
    }
    else
    {
        // End:0xAD
        if((Stopped()) && !Pawn.bStationary)
        {
            DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
        }
    }
    //return;    
}

function bool AdjustAround(Pawn Other)
{
    local float Speed;
    local Vector VelDir, OtherDir, SideDir;

    Speed = VSize(Pawn.Acceleration);
    // End:0x30
    if(Speed < Pawn.PronedSpeed)
    {
        return false;
    }
    VelDir = Pawn.Acceleration / Speed;
    VelDir.Z = 0.0000000;
    OtherDir = Other.Location - Pawn.Location;
    OtherDir.Z = 0.0000000;
    OtherDir = Normal(OtherDir);
    // End:0x14D
    if((VelDir Dot OtherDir) > 0.8000000)
    {
        bAdjusting = true;
        SideDir.X = VelDir.Y;
        SideDir.Y = -1.0000000 * VelDir.X;
        // End:0x10D
        if((SideDir Dot OtherDir) > float(0))
        {
            SideDir *= float(-1);
        }
        AdjustLoc = Pawn.Location + ((1.5000000 * Other.CollisionRadius) * ((0.5000000 * VelDir) + SideDir));
    }
    //return;    
}

function DirectedWander(Vector WanderDir)
{
    GoalString = "DIRECTED WANDER " $ GoalString;
    Pawn.bWantsToCrouch = Pawn.bIsCrouched;
    // End:0x60
    if(TestDirection(WanderDir, Destination))
    {
        GotoState('RestFormation', 'moving');        
    }
    else
    {
        GotoState('RestFormation', 'Begin');
    }
    //return;    
}

event bool NotifyBump(Actor Other)
{
    local Pawn P;
    local Vehicle V;

    // End:0xCB
    if((Vehicle(Other) != none) && Vehicle(Pawn) == none)
    {
        // End:0xCB
        if((Other == RouteGoal) || (Vehicle(RouteGoal) != none) && Other == Vehicle(RouteGoal).GetVehicleBase())
        {
            V = Vehicle(Other).FindEntryVehicle(Pawn);
            // End:0xC9
            if(V != none)
            {
                V.UsedBy(Pawn);
                // End:0xC9
                if(Vehicle(Pawn) != none)
                {
                    Squad.BotEnteredVehicle(self);
                    WhatToDoNext(53);
                }
            }
            return true;
        }
    }
    Disable('NotifyBump');
    P = Pawn(Other);
    // End:0x116
    if(((P == none) || P.Controller == none) || Enemy == P)
    {
        return false;
    }
    // End:0x138
    if(Squad.SetEnemy(self, P))
    {
        WhatToDoNext(4);
        return false;
    }
    // End:0x149
    if(Enemy == P)
    {
        return false;
    }
    // End:0x159
    if(CheckPathToGoalAround(P))
    {
        return false;
    }
    // End:0x17D
    if(!AdjustAround(P))
    {
        CancelCampFor(P.Controller);
    }
    return false;
    //return;    
}

function bool PriorityObjective()
{
    return int(Squad.PriorityObjective(self)) > 0;
    //return;    
}

function SetFall()
{
    // End:0x22
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
        return;
    }
    // End:0x4A
    if(Pawn.bNoJumpAdjust)
    {
        Pawn.bNoJumpAdjust = false;
        return;        
    }
    else
    {
        bPlannedJump = true;
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, Pawn.GroundSpeed);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function bool NotifyLanded(Vector HitNormal)
{
    local Vector Vel2D;

    bInDodgeMove = false;
    bPlannedJump = false;
    bNotifyFallingHitWall = false;
    bDodgingForward = false;
    // End:0x175
    if(MoveTarget != none)
    {
        Vel2D = Pawn.Velocity;
        Vel2D.Z = 0.0000000;
        // End:0xCF
        if((Vel2D Dot (MoveTarget.Location - Pawn.Location)) < float(0))
        {
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0xC1
            if(NavigationPoint(MoveTarget) != none)
            {
                Pawn.Anchor = NavigationPoint(MoveTarget);
            }
            MoveTimer = -1.0000000;            
        }
        else
        {
            // End:0x175
            if((((((RoadPathNode(MoveTarget) != none) && InLatentExecution(503)) && FRand() < 0.8500000) && FRand() < DodgeToGoalPct) && (Pawn.Location.Z + 35.0000000) >= MoveTarget.Location.Z) && VSize(MoveTarget.Location - Pawn.Location) > float(800))
            {
                bNotifyPostLanded = true;
            }
        }
    }
    return false;
    //return;    
}

event NotifyPostLanded()
{
    bNotifyPostLanded = false;
    // End:0x6B
    if((((Pawn != none) && int(Pawn.Physics) == int(1)) && CurrentPath != none) && (CurrentPath.reachFlags & 257) == CurrentPath.reachFlags)
    {
        MayDodgeToMoveTarget();
    }
    //return;    
}

function bool StartMoveToward(Actor o)
{
    // End:0xD4
    if(MoveTarget == none)
    {
        // End:0x46
        if((o == Enemy) && o != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0x9A
        if(bSoaking && int(Pawn.Physics) != int(2))
        {
            SoakStop("COULDN'T FIND ROUTE TO " $ o.GetHumanReadableName());
        }
        GoalString = ((("No path to " $ o.GetHumanReadableName()) @ "(") $ string(o)) $ ")";        
    }
    else
    {
        SetAttractionState();
    }
    return MoveTarget != none;
    //return;    
}

function bool SetRouteToGoal(Actor A)
{
    // End:0x14
    if(Pawn.bStationary)
    {
        return false;
    }
    RouteGoal = A;
    FindBestPathToward(A, false, true);
    return StartMoveToward(A);
    //return;    
}

event bool AllowDetourTo(NavigationPoint N)
{
    return Squad.AllowDetourTo(self, N);
    //return;    
}

function bool FindBestPathToward(Actor A, bool bCheckedReach, bool bAllowDetour)
{
    local Vehicle VBase;

    // End:0x26
    if(!bCheckedReach && actorReachable(A))
    {
        MoveTarget = A;        
    }
    else
    {
        MoveTarget = FindPathToward(A, ((bAllowDetour && Pawn.bCanPickupInventory) && Vehicle(Pawn) == none) && NavigationPoint(A) != none);
    }
    // End:0x82
    if(MoveTarget != none)
    {
        return true;        
    }
    else
    {
        // End:0x21C
        if(Vehicle(Pawn) != none)
        {
            // End:0xD0
            if(int(Pawn.Physics) == int(4))
            {
                // End:0xCD
                if((A == Enemy) && A != none)
                {
                    LoseEnemy();
                }                
            }
            else
            {
                // End:0x21C
                if(!Vehicle(Pawn).bKeyVehicle)
                {
                    // End:0x165
                    if(Pawn.bStationary)
                    {
                        // End:0x150
                        if((Vehicle(Pawn) != none) && Vehicle(Pawn).StronglyRecommended(Squad, Squad.Team.TeamIndex, Squad.SquadObjective))
                        {
                            return false;
                        }
                        VBase = Pawn.GetVehicleBase();
                    }
                    // End:0x21C
                    if((VBase == none) || VBase.Controller == none)
                    {
                        Vehicle(Pawn).VehicleLostTime = Level.TimeSeconds + float(20);
                        DirectionHint = Normal(A.Location - Pawn.Location);
                        Vehicle(Pawn).KDriverLeave(false);
                        MoveTarget = FindPathToward(A, bAllowDetour && NavigationPoint(A) != none);
                        // End:0x21C
                        if(MoveTarget != none)
                        {
                            return true;
                        }
                    }
                }
            }
        }
        // End:0x257
        if((A == Enemy) && A != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0x29E
        if(bSoaking && int(Physics) != int(2))
        {
            SoakStop("COULDN'T FIND BEST PATH TO " $ string(A));
        }
    }
    return false;
    //return;    
}

function bool NeedToTurn(Vector targ)
{
    return Pawn.NeedToTurn(targ);
    //return;    
}

function bool NearWall(float walldist)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewSpot, ViewDist, LookDir;

    LookDir = Vector(Rotation);
    ViewSpot = Pawn.Location + (Pawn.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
    ViewDist = LookDir * walldist;
    HitActor = Trace(HitLocation, HitNormal, ViewSpot + ViewDist, ViewSpot, false);
    // End:0x84
    if(HitActor == none)
    {
        return false;
    }
    ViewDist = Normal(HitNormal Cross vect(0.0000000, 0.0000000, 1.0000000)) * walldist;
    // End:0xC1
    if(FRand() < 0.5000000)
    {
        ViewDist *= float(-1);
    }
    Focus = none;
    // End:0xFC
    if(FastTrace(ViewSpot + ViewDist, ViewSpot))
    {
        FocalPoint = Pawn.Location + ViewDist;
        return true;
    }
    // End:0x130
    if(FastTrace(ViewSpot - ViewDist, ViewSpot))
    {
        FocalPoint = Pawn.Location - ViewDist;
        return true;
    }
    FocalPoint = Pawn.Location - (LookDir * float(300));
    return true;
    //return;    
}

function bool CheckFutureSight(float DeltaTime)
{
    local Vector FutureLoc;

    // End:0x16
    if(Target == none)
    {
        Target = Enemy;
    }
    // End:0x23
    if(Target == none)
    {
        return false;
    }
    // End:0x5A
    if(Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
    {
        FutureLoc = Pawn.Location;        
    }
    else
    {
        FutureLoc = Pawn.Location + ((Pawn.GroundSpeed * Normal(Pawn.Acceleration)) * DeltaTime);
    }
    // End:0xD0
    if(Pawn.Base != none)
    {
        FutureLoc += (Pawn.Base.Velocity * DeltaTime);
    }
    // End:0x108
    if(!FastTrace(FutureLoc, Pawn.Location) && int(Pawn.Physics) != int(2))
    {
        return false;
    }
    // End:0x13A
    if(FastTrace(Target.Location + (Target.Velocity * DeltaTime), FutureLoc))
    {
        return true;
    }
    return false;
    //return;    
}

function float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
    local float aimdist, desireddist, NewAngle;
    local Vector VelDir, AccelDir;

    // End:0x1A
    if(Target.IsA('ONSMortarCamera'))
    {
        return 0.0000000;
    }
    // End:0x52
    if(Pawn(Target) != none)
    {
        // End:0x52
        if(int(Pawn(Target).Visibility) < 2)
        {
            AimError *= 2.5000000;
        }
    }
    AimError = AimError * FMin(5.0000000, 12.0000000 - (float(11) * (Normal(Target.Location - Pawn.Location) Dot Normal((Target.Location + (1.2000000 * Target.Velocity)) - (Pawn.Location + Pawn.Velocity)))));
    // End:0x12A
    if((Pawn(Target) != none) && Pawn(Target).bStationary)
    {
        AimError *= 0.1500000;
        return float(Rand(int(float(2) * AimError))) - AimError;
    }
    // End:0x13F
    if(bDefendMelee)
    {
        AimError *= 0.5000000;
    }
    // End:0x189
    if(Target.Velocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        AimError *= (0.2000000 + (0.1000000 * (float(7) - FMin(7.0000000, Skill))));        
    }
    else
    {
        // End:0x225
        if((Skill + Accuracy) > float(5))
        {
            VelDir = Target.Velocity;
            VelDir.Z = 0.0000000;
            AccelDir = Target.Acceleration;
            AccelDir.Z = 0.0000000;
            // End:0x225
            if((AccelDir == vect(0.0000000, 0.0000000, 0.0000000)) || (Normal(VelDir) Dot Normal(AccelDir)) > 0.9500000)
            {
                AimError *= 0.8000000;
            }
        }
    }
    // End:0x342
    if((Stopped()) && Level.TimeSeconds > StopStartTime)
    {
        // End:0x269
        if((Skill + Accuracy) > float(4))
        {
            AimError *= 0.7500000;
        }
        // End:0x2F3
        if((Pawn.Weapon != none) && Pawn.Weapon.bSniping)
        {
            AimError *= FClamp(((1.5000000 - (0.0800000 * FMin(Skill, 7.0000000))) - (0.8000000 * FRand())) / ((Level.TimeSeconds - StopStartTime) + 0.4000000), 0.3000000, 1.0000000);            
        }
        else
        {
            AimError *= FClamp(((2.0000000 - (0.0800000 * FMin(Skill, 7.0000000))) - FRand()) / ((Level.TimeSeconds - StopStartTime) + 0.4000000), 0.7000000, 1.0000000);
        }
    }
    // End:0x385
    if(!bDefendMelee)
    {
        AimError *= (3.3000000 - (0.3800000 * (FClamp(Skill + Accuracy, 0.0000000, 8.0000000) + (0.5000000 * FRand()))));
    }
    // End:0x3D7
    if(((Skill < float(6)) || FRand() < 0.5000000) && (Level.TimeSeconds - Pawn.LastPainTime) < 0.2000000)
    {
        AimError *= 1.3000000;
    }
    // End:0x42C
    if((int(Pawn.Physics) == int(2)) || int(Target.Physics) == int(2))
    {
        AimError *= (1.6000000 - (0.0400000 * (Skill + Accuracy)));
    }
    // End:0x487
    if(AcquireTime > ((Level.TimeSeconds - 0.5000000) - (0.5000000 * (float(7) - FMin(7.0000000, Skill)))))
    {
        AimError *= 1.5000000;
        // End:0x487
        if(bInstantProj)
        {
            AimError *= 1.5000000;
        }
    }
    AimError = ((2.0000000 * AimError) * FRand()) - AimError;
    // End:0x560
    if(Abs(AimError) > float(700))
    {
        // End:0x4CE
        if(bInstantProj)
        {
            desireddist = 100.0000000;            
        }
        else
        {
            desireddist = 320.0000000;
        }
        desireddist += Target.CollisionRadius;
        aimdist = Tan(0.0000959 * AimError) * TargetDist;
        // End:0x560
        if(Abs(aimdist) > desireddist)
        {
            NewAngle = Atan(desireddist, TargetDist) / 0.0000959;
            // End:0x54E
            if(AimError > float(0))
            {
                AimError = NewAngle;                
            }
            else
            {
                AimError = -1.0000000 * NewAngle;
            }
        }
    }
    return AimError;
    //return;    
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator FireRotation, TargetLook;
    local float FireDist, TargetDist, projSpeed, TravelTime;
    local Actor HitActor;
    local Vector FireSpot, FireDir, TargetVel, HitLocation, HitNormal;

    local int realYaw;
    local bool bDefendMelee, bClean, bLeadTargetNow;

    // End:0x29
    if(FiredAmmunition.ProjectileClass != none)
    {
        projSpeed = FiredAmmunition.ProjectileClass.default.Speed;
    }
    // End:0x50
    if(Target == none)
    {
        Target = Enemy;
        // End:0x50
        if(Target == none)
        {
            return Rotation;
        }
    }
    // End:0x7A
    if(Pawn(Target) != none)
    {
        Target = Pawn(Target).GetAimTarget();
    }
    FireSpot = Target.Location;
    TargetDist = VSize(Target.Location - Pawn.Location);
    // End:0x124
    if(Pawn(Target) == none)
    {
        // End:0xEF
        if(!FiredAmmunition.bTossed)
        {
            return Rotator(Target.Location - projStart);            
        }
        else
        {
            FireDir = AdjustToss(projSpeed, projStart, Target.Location, true);
            SetRotation(Rotator(FireDir));
            return Rotation;
        }
    }
    bLeadTargetNow = FiredAmmunition.bLeadTarget && bLeadTarget;
    bDefendMelee = (Target == Enemy) && DefendMelee(TargetDist);
    AimError = int(AdjustAimError(float(AimError), TargetDist, bDefendMelee, FiredAmmunition.bInstantHit, bLeadTargetNow));
    // End:0x4A5
    if(bLeadTargetNow)
    {
        TargetVel = Target.Velocity;
        TravelTime = TargetDist / projSpeed;
        // End:0x32A
        if(int(Target.Physics) == int(2))
        {
            // End:0x273
            if(Target.PhysicsVolume.Gravity.Z <= Target.PhysicsVolume.default.Gravity.Z)
            {
                TargetVel.Z = FMin(TargetVel.Z + FMax(-400.0000000, Target.PhysicsVolume.Gravity.Z * FMin(1.0000000, TargetDist / projSpeed)), 0.0000000);                
            }
            else
            {
                TargetVel.Z = TargetVel.Z + ((0.5000000 * TravelTime) * Target.PhysicsVolume.Gravity.Z);
                FireSpot = Target.Location + (TravelTime * TargetVel);
                HitActor = Trace(HitLocation, HitNormal, FireSpot, Target.Location, false);
                bLeadTargetNow = false;
                // End:0x32A
                if(HitActor != none)
                {
                    FireSpot = HitLocation + vect(0.0000000, 0.0000000, 2.0000000);
                }
            }
        }
        // End:0x389
        if(bLeadTargetNow)
        {
            FireSpot += ((FMin(1.0000000, 0.7000000 + (0.6000000 * FRand())) * TargetVel) * TravelTime);
            FireSpot.Z = FMin(Target.Location.Z, FireSpot.Z);
        }
        // End:0x441
        if(((int(Target.Physics) != int(2)) && FRand() < 0.5500000) && VSize(FireSpot - projStart) > float(1000))
        {
            TargetLook = Target.Rotation;
            // End:0x405
            if(int(Target.Physics) == int(1))
            {
                TargetLook.Pitch = 0;
            }
            bClean = ((Vector(TargetLook) Dot Normal(Target.Velocity)) >= 0.7100000) && FastTrace(FireSpot, projStart);            
        }
        else
        {
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x4A5
        if(!bClean)
        {
            // End:0x483
            if(FRand() < 0.3000000)
            {
                FireSpot = Target.Location;                
            }
            else
            {
                FireSpot = 0.5000000 * (FireSpot + Target.Location);
            }
        }
    }
    bClean = false;
    // End:0x64D
    if(((FiredAmmunition.bTrySplash && Pawn(Target) != none) && (Skill >= float(4)) || bDefendMelee) && ((int(Target.Physics) == int(2)) && (Pawn.Location.Z + float(80)) >= Target.Location.Z) || ((Pawn.Location.Z + float(19)) >= Target.Location.Z) && bDefendMelee || Skill > ((6.5000000 * FRand()) - 0.5000000))
    {
        HitActor = Trace(HitLocation, HitNormal, FireSpot - (vect(0.0000000, 0.0000000, 1.0000000) * (Target.CollisionHeight + float(6))), FireSpot, false);
        bClean = HitActor == none;
        // End:0x61E
        if(!bClean)
        {
            FireSpot = HitLocation + vect(0.0000000, 0.0000000, 3.0000000);
            bClean = FastTrace(FireSpot, projStart);            
        }
        else
        {
            bClean = (int(Target.Physics) == int(2)) && FastTrace(FireSpot, projStart);
        }
    }
    // End:0x6EC
    if((((Pawn.Weapon != none) && Pawn.Weapon.bSniping) && Stopped()) && Skill > (float(5) + (float(6) * FRand())))
    {
        FireSpot.Z = Target.Location.Z + (0.9000000 * Target.CollisionHeight);
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x729
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x7B5
    if((FiredAmmunition.bTossed && !bClean) && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7AD
        if(HitActor != none)
        {
            bCanFire = false;
            FireSpot += ((float(2) * Target.CollisionHeight) * HitNormal);
        }
        bClean = true;
    }
    // End:0x809
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z + (0.9000000 * Target.CollisionHeight);
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x99B
    if((!bClean && Target == Enemy) && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        // End:0x87E
        if(Pawn.Location.Z >= LastSeenPos.Z)
        {
            FireSpot.Z -= (0.4000000 * Enemy.CollisionHeight);
        }
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x99B
        if(HitActor != none)
        {
            FireSpot = LastSeenPos + ((float(2) * Enemy.CollisionHeight) * HitNormal);
            // End:0x95B
            if(((Pawn.Weapon != none) && Pawn.Weapon.SplashDamage()) && Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x95B
                if(HitActor != none)
                {
                    FireSpot += ((float(2) * Enemy.CollisionHeight) * HitNormal);
                }
            }
            // End:0x99B
            if((Pawn.Weapon != none) && Pawn.Weapon.RefireRate() < 0.9900000)
            {
                bCanFire = false;
            }
        }
    }
    // End:0x9C8
    if(FiredAmmunition.bTossed)
    {
        FireDir = AdjustToss(projSpeed, projStart, FireSpot, true);        
    }
    else
    {
        FireDir = FireSpot - projStart;
        // End:0xA1B
        if(Pawn(Target) != none)
        {
            FireDir = (FireDir + Pawn(Target).GetTargetLocation()) - Target.Location;
        }
    }
    FireRotation = Rotator(FireDir);
    realYaw = FireRotation.Yaw;
    FireRotation.Yaw = SetFireYaw(FireRotation.Yaw + AimError);
    FireDir = Vector(FireRotation);
    FireDist = FMin(VSize(FireSpot - projStart), 400.0000000);
    FireSpot = projStart + (FireDist * FireDir);
    HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
    // End:0xBDA
    if(HitActor != none)
    {
        // End:0xB39
        if(HitNormal.Z < 0.7000000)
        {
            FireRotation.Yaw = SetFireYaw(realYaw - AimError);
            FireDir = Vector(FireRotation);
            FireSpot = projStart + (FireDist * FireDir);
            HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        }
        // End:0xBDA
        if(HitActor != none)
        {
            FireSpot += ((HitNormal * float(2)) * Target.CollisionHeight);
            // End:0xBB9
            if(Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0xBB9
                if(HitActor != none)
                {
                    FireSpot += (Target.CollisionHeight * HitNormal);
                }
            }
            FireDir = Normal(FireSpot - projStart);
            FireRotation = Rotator(FireDir);
        }
    }
    InstantWarnTarget(Target, FiredAmmunition, Vector(FireRotation));
    ShotTarget = Pawn(Target);
    SetRotation(FireRotation);
    return FireRotation;
    //return;    
}

event DelayedWarning()
{
    local Vector X, Y, Z, Dir, LineDist, FuturePos,
	    HitLocation, HitNormal;

    local Actor HitActor;
    local float dist;

    // End:0x3C
    if(((Pawn == none) || WarningProjectile == none) || WarningProjectile.Velocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return;
    }
    // End:0x67
    if(Enemy == none)
    {
        Squad.SetEnemy(self, WarningProjectile.Instigator);
        return;
    }
    Dir = Normal(WarningProjectile.Velocity);
    FuturePos = Pawn.Location + ((Pawn.Velocity * VSize(WarningProjectile.Location - Pawn.Location)) / VSize(WarningProjectile.Velocity));
    LineDist = FuturePos - (WarningProjectile.Location + ((Dir Dot (FuturePos - WarningProjectile.Location)) * Dir));
    dist = VSize(LineDist);
    // End:0x142
    if(dist > (float(230) + Pawn.CollisionRadius))
    {
        return;
    }
    // End:0x218
    if(dist > (1.2000000 * Pawn.CollisionHeight))
    {
        // End:0x17A
        if(WarningProjectile.Damage <= float(40))
        {
            return;
        }
        // End:0x218
        if(((int(WarningProjectile.Physics) == int(6)) && dist > (Pawn.CollisionHeight + float(100))) && !WarningProjectile.IsA('ShockProjectile'))
        {
            HitActor = Trace(HitLocation, HitNormal, WarningProjectile.Location + WarningProjectile.Velocity, WarningProjectile.Location, false);
            // End:0x218
            if(HitActor == none)
            {
                return;
            }
        }
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    X.Z = 0.0000000;
    Dir = WarningProjectile.Location - Pawn.Location;
    Dir.Z = 0.0000000;
    // End:0x297
    if((Normal(Dir) Dot Normal(X)) < 0.7000000)
    {
        return;
    }
    // End:0x2D1
    if((WarningProjectile.Velocity Dot Y) > float(0))
    {
        Y *= float(-1);
        TryToDuck(Y, true);        
    }
    else
    {
        TryToDuck(Y, false);
    }
    //return;    
}

function ReceiveProjectileWarning(Projectile proj)
{
    local float enemyDist, projTime;
    local Vector X, Y, Z, enemyDir;

    LastUnderFire = Level.TimeSeconds;
    // End:0xBC
    if(((((Pawn.Health <= 0) || Skill < float(2)) || Enemy == none) || int(Pawn.Physics) == int(3)) || ((int(Level.NetMode) == int(NM_Standalone)) && PlayerReplicationInfo.HasFlag == none) && (Level.TimeSeconds - Pawn.LastRenderTime) > float(3))
    {
        return;
    }
    enemyDist = VSize(proj.Location - Pawn.Location);
    // End:0x303
    if(proj.Speed > float(0))
    {
        projTime = enemyDist / proj.Speed;
        // End:0x139
        if(projTime < (0.3500000 - (0.0300000 * (Skill + ReactionTime))))
        {
            return;
        }
        // End:0x169
        if(projTime < (float(2) - ((0.2650000 + (FRand() * 0.2000000)) * (Skill + ReactionTime))))
        {
            return;
        }
        // End:0x1B2
        if((WarningProjectile != none) && (VSize(WarningProjectile.Location - Pawn.Location) / WarningProjectile.Speed) < projTime)
        {
            return;
        }
        // End:0x244
        if((projTime < 1.2000000) || WarningProjectile != none)
        {
            GetAxes(Rotation, X, Y, Z);
            enemyDir = proj.Location - Pawn.Location;
            enemyDir.Z = 0.0000000;
            X.Z = 0.0000000;
            // End:0x244
            if((Normal(enemyDir) Dot Normal(X)) < 0.7000000)
            {
                return;
            }
        }
        // End:0x2AA
        if((Skill + ReactionTime) >= float(7))
        {
            WarningDelay = Level.TimeSeconds + FMax(0.0800000, FMax(0.3500000 - ((0.0250000 * (Skill + ReactionTime)) * (float(1) + FRand())), projTime - 0.6500000));            
        }
        else
        {
            WarningDelay = Level.TimeSeconds + FMax(0.0800000, FMax(0.3500000 - ((0.0200000 * (Skill + ReactionTime)) * (float(1) + FRand())), projTime - 0.6500000));
        }
        WarningProjectile = proj;
    }
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    LastUnderFire = Level.TimeSeconds;
    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    //return;    
}

function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
    local float enemyDist, projTime;
    local Vector X, Y, Z, enemyDir;
    local bool bResult;

    LastUnderFire = Level.TimeSeconds;
    // End:0x54
    if((Pawn.bStationary || !Pawn.bCanStrafe) || Pawn.Health <= 0)
    {
        return;
    }
    // End:0x76
    if(Enemy == none)
    {
        Squad.SetEnemy(self, shooter);
        return;
    }
    // End:0xD8
    if((((Skill < float(4)) || int(Pawn.Physics) == int(2)) || int(Pawn.Physics) == int(3)) || FRand() > ((0.2000000 * Skill) - 0.3300000))
    {
        return;
    }
    enemyDist = VSize(shooter.Location - Pawn.Location);
    // End:0x130
    if(((enemyDist > float(2000)) && Vehicle(shooter) == none) && !Stopped())
    {
        return;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    enemyDir = shooter.Location - Pawn.Location;
    enemyDir.Z = 0.0000000;
    X.Z = 0.0000000;
    // End:0x1AF
    if((Normal(enemyDir) Dot Normal(X)) < 0.7000000)
    {
        return;
    }
    // End:0x224
    if((projSpeed > float(0)) && Vehicle(shooter) == none)
    {
        projTime = enemyDist / projSpeed;
        // End:0x224
        if(projTime < (0.1100000 + (0.1500000 * FRand())))
        {
            // End:0x222
            if((Stopped()) && Pawn.MaxRotation == float(0))
            {
                GotoState('TacticalMove');
            }
            return;
        }
    }
    // End:0x266
    if((FRand() * (Skill + float(4))) < float(4))
    {
        // End:0x264
        if((Stopped()) && Pawn.MaxRotation == float(0))
        {
            GotoState('TacticalMove');
        }
        return;
    }
    // End:0x29E
    if((FireDir Dot Y) > float(0))
    {
        Y *= float(-1);
        bResult = TryToDuck(Y, true);        
    }
    else
    {
        bResult = TryToDuck(Y, false);
    }
    // End:0x2EB
    if((bResult && projSpeed > float(0)) && Vehicle(shooter) != none)
    {
        bNotifyApex = true;
        bPendingDoubleJump = true;
    }
    //return;    
}

event NotifyFallingHitWall(Vector HitNormal, Actor HitActor)
{
    bNotifyFallingHitWall = false;
    TryWallDodge(HitNormal, HitActor);
    //return;    
}

event MissedDodge()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, Extent, Vel2D;

    // End:0x4A
    if(Pawn.CanDoubleJump() && Abs(Pawn.Velocity.Z) < float(100))
    {
        Pawn.DoDoubleJump(false);
        bPendingDoubleJump = false;
    }
    Extent = Pawn.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = Pawn.CollisionHeight;
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location - ((float(20) + (float(3) * 35.0000000)) * vect(0.0000000, 0.0000000, 1.0000000)), Pawn.Location, false, Extent);
    Vel2D = Pawn.Velocity;
    Vel2D.Z = 0.0000000;
    // End:0x16F
    if(HitActor != none)
    {
        Pawn.Acceleration = (float(-1) * Pawn.AccelRate) * Normal(Vel2D);
        Pawn.Velocity.X = 0.0000000;
        Pawn.Velocity.Z = 0.0000000;
        return;
    }
    Pawn.Acceleration = Pawn.AccelRate * Normal(Vel2D);
    //return;    
}

function bool TryWallDodge(Vector HitNormal, Actor HitActor)
{
    local Vector X, Y, Z, Dir, TargetDir, NewHitNormal,
	    HitLocation, Extent;

    local float DP;
    local Actor NewHitActor;

    // End:0x44
    if((!Pawn.bCanWallDodge || Abs(HitNormal.Z) > 0.7000000) || !HitActor.bWorldGeometry)
    {
        return false;
    }
    // End:0x73
    if((Pawn.Velocity.Z < float(-150)) && FRand() < 0.4000000)
    {
        return false;
    }
    Extent = Pawn.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = 0.5000000 * Pawn.CollisionHeight;
    NewHitActor = Trace(HitLocation, NewHitNormal, Pawn.Location - (float(32) * HitNormal), Pawn.Location, false, Extent);
    // End:0x105
    if(NewHitActor == none)
    {
        return false;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    Dir = HitNormal;
    Dir.Z = 0.0000000;
    Dir = Normal(Dir);
    // End:0x222
    if(InLatentExecution(503))
    {
        TargetDir = MoveTarget.Location - Pawn.Location;
        TargetDir.Z = 0.0000000;
        TargetDir = Normal(TargetDir);
        DP = HitNormal Dot TargetDir;
        // End:0x222
        if((DP >= float(0)) && VSize(MoveTarget.Location - Pawn.Location) > float(200))
        {
            // End:0x217
            if(DP < 0.7000000)
            {
                Dir = Normal(TargetDir + (HitNormal * (float(1) - DP)));                
            }
            else
            {
                Dir = TargetDir;
            }
        }
    }
    // End:0x289
    if(Abs(X Dot Dir) > Abs(Y Dot Dir))
    {
        // End:0x270
        if((X Dot Dir) > float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 3;            
        }
        else
        {
            UnrealPawn(Pawn).CurrentDir = 4;
        }        
    }
    else
    {
        // End:0x2B6
        if((Y Dot Dir) < float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 1;            
        }
        else
        {
            UnrealPawn(Pawn).CurrentDir = 2;
        }
    }
    bPlannedJump = true;
    Pawn.PerformDodge(UnrealPawn(Pawn).CurrentDir, Dir, Normal(Dir Cross vect(0.0000000, 0.0000000, 1.0000000)));
    return true;
    //return;    
}

function ChangeStrafe()
{
    //return;    
}

function bool TryToDuck(Vector duckDir, bool bReversed)
{
    local Vector HitLocation, HitNormal, Extent, Start;
    local Actor HitActor;
    local bool bSuccess, bDuckLeft, bWallHit, bChangeStrafe;
    local float minDist, dist;

    // End:0x22
    if(Vehicle(Pawn) != none)
    {
        return Pawn.Dodge(0);
    }
    // End:0x36
    if(Pawn.bStationary)
    {
        return false;
    }
    // End:0x61
    if((Stopped()) && Pawn.MaxRotation == float(0))
    {
        GotoState('TacticalMove');        
    }
    else
    {
        // End:0x7A
        if(FRand() < 0.6000000)
        {
            bChangeStrafe = IsStrafing();
        }
    }
    // End:0x101
    if((((Skill < float(3)) || Pawn.PhysicsVolume.bWaterVolume) || int(Pawn.Physics) == int(2)) || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return false;
    }
    // End:0x144
    if((Pawn.bIsCrouched || Pawn.bWantsToCrouch) || int(Pawn.Physics) != int(1))
    {
        return false;
    }
    duckDir.Z = 0.0000000;
    duckDir *= float(335);
    bDuckLeft = bReversed;
    Extent = Pawn.GetCollisionExtent();
    Start = Pawn.Location + vect(0.0000000, 0.0000000, 25.0000000);
    HitActor = Trace(HitLocation, HitNormal, Start + duckDir, Start, false, Extent);
    minDist = 150.0000000;
    dist = VSize(HitLocation - Pawn.Location);
    // End:0x292
    if((HitActor == none) || dist > float(150))
    {
        // End:0x231
        if(HitActor == none)
        {
            HitLocation = Start + duckDir;
        }
        HitActor = Trace(HitLocation, HitNormal, HitLocation - (35.0000000 * vect(0.0000000, 0.0000000, 2.5000000)), HitLocation, false, Extent);
        bSuccess = (HitActor != none) && HitNormal.Z >= 0.7000000;        
    }
    else
    {
        bWallHit = Pawn.bCanWallDodge && (Skill + (float(2) * Jumpiness)) > float(5);
        minDist = (30.0000000 + minDist) - dist;
    }
    // End:0x3E6
    if(!bSuccess)
    {
        bDuckLeft = !bDuckLeft;
        duckDir *= float(-1);
        HitActor = Trace(HitLocation, HitNormal, Start + duckDir, Start, false, Extent);
        bSuccess = (HitActor == none) || VSize(HitLocation - Pawn.Location) > minDist;
        // End:0x3E6
        if(bSuccess)
        {
            // End:0x388
            if(HitActor == none)
            {
                HitLocation = Start + duckDir;
            }
            HitActor = Trace(HitLocation, HitNormal, HitLocation - (35.0000000 * vect(0.0000000, 0.0000000, 2.5000000)), HitLocation, false, Extent);
            bSuccess = (HitActor != none) && HitNormal.Z >= 0.7000000;
        }
    }
    // End:0x402
    if(!bSuccess)
    {
        // End:0x400
        if(bChangeStrafe)
        {
            ChangeStrafe();
        }
        return false;
    }
    // End:0x443
    if(Pawn.bCanWallDodge && (Skill + (float(2) * Jumpiness)) > (float(3) + (float(3) * FRand())))
    {
        bNotifyFallingHitWall = true;
    }
    // End:0x466
    if(bNotifyFallingHitWall && bWallHit)
    {
        bDuckLeft = !bDuckLeft;
    }
    // End:0x488
    if(bDuckLeft)
    {
        UnrealPawn(Pawn).CurrentDir = 1;        
    }
    else
    {
        UnrealPawn(Pawn).CurrentDir = 2;
    }
    bInDodgeMove = true;
    DodgeLandZ = Pawn.Location.Z;
    Pawn.Dodge(UnrealPawn(Pawn).CurrentDir);
    return true;
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    Squad.NotifyKilled(Killer, Killed, KilledPawn);
    //return;    
}

function Actor FaceMoveTarget()
{
    // End:0x26
    if((MoveTarget != Enemy) && MoveTarget != Target)
    {
        StopFiring();
    }
    return MoveTarget;
    //return;    
}

function bool ShouldStrafeTo(Actor WayPoint)
{
    local NavigationPoint N;

    // End:0x2D
    if((Vehicle(Pawn) != none) && !Vehicle(Pawn).bFollowLookDir)
    {
        return true;
    }
    // End:0x44
    if((Skill + StrafingAbility) < float(3))
    {
        return false;
    }
    // End:0xA5
    if(WayPoint == Enemy)
    {
        // End:0x86
        if((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon)
        {
            return false;
        }
        return (Skill + StrafingAbility) > ((float(5) * FRand()) - float(1));        
    }
    else
    {
        // End:0x11F
        if(Pickup(WayPoint) == none)
        {
            N = NavigationPoint(WayPoint);
            // End:0xE6
            if((N == none) || N.bNeverUseStrafing)
            {
                return false;
            }
            // End:0xFD
            if(N.FearCost > 200)
            {
                return true;
            }
            // End:0x11F
            if(N.bAlwaysUseStrafing && FRand() < 0.8000000)
            {
                return true;
            }
        }
    }
    // End:0x184
    if((Pawn(WayPoint) != none) || (Squad.SquadLeader != none) && WayPoint == Squad.SquadLeader.MoveTarget)
    {
        return (Skill + StrafingAbility) > ((float(5) * FRand()) - float(1));
    }
    // End:0x1A4
    if((Skill + StrafingAbility) < ((float(6) * FRand()) - float(1)))
    {
        return false;
    }
    // End:0x1C6
    if(!bFinalStretch && Enemy == none)
    {
        return FRand() < 0.4000000;
    }
    // End:0x1E6
    if((Level.TimeSeconds - LastUnderFire) < float(2))
    {
        return true;
    }
    // End:0x206
    if((Enemy != none) && EnemyVisible())
    {
        return FRand() < 0.8500000;
    }
    return FRand() < 0.6000000;
    //return;    
}

function Actor AlternateTranslocDest()
{
    // End:0x34
    if(((PathNode(MoveTarget) == none) || MoveTarget != RouteCache[0]) || RouteCache[0] == none)
    {
        return none;
    }
    // End:0xCF
    if(((PathNode(RouteCache[1]) == none) && InventorySpot(RouteCache[1]) == none) && GameObjective(RouteCache[1]) == none)
    {
        // End:0xCD
        if((((FRand() < 0.5000000) && GameObject(RouteGoal) != none) && VSize(RouteGoal.Location - Pawn.Location) < float(2000)) && LineOfSightTo(RouteGoal))
        {
            return RouteGoal;
        }
        return none;
    }
    // End:0x147
    if((((FRand() < 0.3000000) && GameObjective(RouteCache[1]) == none) && ((PathNode(RouteCache[2]) != none) || InventorySpot(RouteCache[2]) != none) || GameObjective(RouteCache[2]) != none) && LineOfSightTo(RouteCache[2]))
    {
        return RouteCache[2];
    }
    // End:0x15C
    if(LineOfSightTo(RouteCache[1]))
    {
        return RouteCache[1];
    }
    return none;
    //return;    
}

function Actor FaceActor(float StrafingModifier)
{
    local float RelativeDir, dist, minDist;
    local Actor SquadFace, N;
    local bool bEnemyNotEngaged, bTranslocTactics, bCatchup;

    // End:0x5F
    if((((DestroyableObjective(Focus) != none) && Focus == Squad.SquadObjective) && Squad.GetOrders() == 'Attack') && Pawn.IsFiring())
    {
        return Focus;
    }
    bTranslocatorHop = false;
    SquadFace = Squad.SetFacingActor(self);
    // End:0x8E
    if(SquadFace != none)
    {
        return SquadFace;
    }
    // End:0xE1
    if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
    {
        // End:0xDB
        if(Vehicle(Focus) != none)
        {
            FireWeaponAt(Focus);
        }
        return Focus;
    }
    // End:0x518
    if(CanUseTranslocator())
    {
        bEnemyNotEngaged = (Enemy == none) || (Level.TimeSeconds - LastSeenTime) > float(1);
        bCatchup = ((Pawn(RouteGoal) != none) && !SameTeamAs(Pawn(RouteGoal).Controller)) || GameObject(RouteGoal) != none;
        // End:0x1AF
        if(bEnemyNotEngaged)
        {
            // End:0x196
            if(bCatchup)
            {
                bTranslocTactics = (Skill + Tactics) > (float(2) + (float(2) * FRand()));                
            }
            else
            {
                bTranslocTactics = (Skill + Tactics) > float(4);
            }
        }
        bTranslocTactics = bTranslocTactics || (Skill + Tactics) > (2.5000000 + (float(3) * FRand()));
        // End:0x518
        if((((((bTranslocTactics && TranslocUse > FRand()) && Vehicle(Pawn) == none) && TranslocFreq < ((Level.TimeSeconds + float(6)) + (float(9) * FRand()))) && (NavigationPoint(MoveTarget) != none) || GameObject(MoveTarget) != none) && LiftCenter(MoveTarget) == none) && (((bEnemyNotEngaged || bRecommendFastMove) || GameObject(MoveTarget) != none) || VSize(Enemy.Location - Pawn.Location) > (float(1200) * (float(1) + FRand()))) || (bCatchup && FRand() < 0.6500000) && !LineOfSightTo(RouteGoal) || GameObject(RouteGoal) != none)
        {
            bRecommendFastMove = false;
            bTranslocatorHop = true;
            TranslocationTarget = MoveTarget;
            RealTranslocationTarget = TranslocationTarget;
            Focus = MoveTarget;
            dist = VSize(Pawn.Location - MoveTarget.Location);
            minDist = 300.0000000 + (float(40) * FMax(0.0000000, TranslocFreq - Level.TimeSeconds));
            // End:0x428
            if(((GameObject(RouteGoal) != none) && VSize(Pawn.Location - RouteGoal.Location) < (float(1000) + (float(1200) * FRand()))) && LineOfSightTo(RouteGoal))
            {
                TranslocationTarget = RouteGoal;
                RealTranslocationTarget = TranslocationTarget;
                dist = VSize(Pawn.Location - TranslocationTarget.Location);
                Focus = RouteGoal;                
            }
            else
            {
                // End:0x4A8
                if(((minDist + float(200)) + (float(1000) * FRand())) > dist)
                {
                    N = AlternateTranslocDest();
                    // End:0x4A8
                    if(N != none)
                    {
                        TranslocationTarget = N;
                        RealTranslocationTarget = TranslocationTarget;
                        dist = VSize(Pawn.Location - TranslocationTarget.Location);
                        Focus = N;
                    }
                }
            }
            // End:0x50C
            if((dist < minDist) || (dist < (minDist + float(150))) && !Pawn.Weapon.IsA('Translauncher'))
            {
                TranslocationTarget = none;
                RealTranslocationTarget = TranslocationTarget;
                bTranslocatorHop = false;                
            }
            else
            {
                SwitchToBestWeapon();
                return Focus;
            }
        }
    }
    bRecommendFastMove = false;
    // End:0x59C
    if(((!Pawn.bCanStrafe && (Vehicle(Pawn) == none) || !Vehicle(Pawn).bSeparateTurretFocus) || Enemy == none) || (Level.TimeSeconds - LastSeenTime) > (float(6) - StrafingModifier))
    {
        return FaceMoveTarget();
    }
    // End:0x634
    if((((MoveTarget == Enemy) || Vehicle(Pawn) != none) || ((Skill + StrafingAbility) >= float(6)) && !Pawn.Weapon.bMeleeWeapon) || VSize(MoveTarget.Location - Pawn.Location) < (float(4) * Pawn.CollisionRadius))
    {
        return Enemy;
    }
    // End:0x660
    if((Level.TimeSeconds - LastSeenTime) > (float(4) - StrafingModifier))
    {
        return FaceMoveTarget();
    }
    // End:0x687
    if((Skill > 2.5000000) && GameObject(MoveTarget) != none)
    {
        return Enemy;
    }
    RelativeDir = Normal((Enemy.Location - Pawn.Location) - (vect(0.0000000, 0.0000000, 1.0000000) * (Enemy.Location.Z - Pawn.Location.Z))) Dot Normal((MoveTarget.Location - Pawn.Location) - (vect(0.0000000, 0.0000000, 1.0000000) * (MoveTarget.Location.Z - Pawn.Location.Z)));
    // End:0x756
    if(RelativeDir > 0.8500000)
    {
        return Enemy;
    }
    // End:0x7A9
    if(((RelativeDir > 0.3000000) && Bot(Enemy.Controller) != none) && MoveTarget == Enemy.Controller.MoveTarget)
    {
        return Enemy;
    }
    // End:0x7C9
    if((Skill + StrafingAbility) < (float(2) + FRand()))
    {
        return FaceMoveTarget();
    }
    // End:0x850
    if(((((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon) && RelativeDir < 0.3000000) || (Skill + StrafingAbility) < ((float(5) + StrafingModifier) * FRand())) || ((0.4000000 * RelativeDir) + 0.8000000) < FRand())
    {
        return FaceMoveTarget();
    }
    return Enemy;
    //return;    
}

function WanderOrCamp(bool bMayCrouch)
{
    Pawn.bWantsToCrouch = bMayCrouch && Pawn.bIsCrouched || FRand() < 0.7500000;
    GotoState('RestFormation');
    //return;    
}

function bool NeedWeapon()
{
    local Inventory Inv;

    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return false;
    }
    // End:0x4E
    if(Pawn.Weapon.AIRating > 0.5000000)
    {
        return !Pawn.Weapon.HasAmmo();
    }
    Inv = Pawn.Inventory;
    J0x62:

    // End:0xCE [Loop If]
    if(Inv != none)
    {
        // End:0xB7
        if(((wWeapon(Inv) != none) && wWeapon(Inv).AIRating > 0.5000000) && wWeapon(Inv).HasAmmo())
        {
            return false;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x62;
    }
    return true;
    //return;    
}

event float Desireability(Pickup P)
{
    // End:0x28
    if(!Pawn.IsInLoadout(P.InventoryType))
    {
        return -1.0000000;
    }
    return P.BotDesireability(Pawn);
    //return;    
}

event float SuperDesireability(Pickup P)
{
    // End:0x16
    if(!SuperPickupNotSpokenFor(P))
    {
        return 0.0000000;
    }
    return P.BotDesireability(Pawn);
    //return;    
}

function bool SuperPickupNotSpokenFor(Pickup P)
{
    local Bot CurrentOwner;

    // End:0x16
    if(PlayerReplicationInfo.Team == none)
    {
        return true;
    }
    CurrentOwner = Bot(P.TeamOwner[PlayerReplicationInfo.Team.TeamIndex]);
    // End:0x119
    if((((CurrentOwner == none) || CurrentOwner == self) || CurrentOwner.Pawn == none) || (((CurrentOwner.RouteGoal != P.myMarker) && CurrentOwner.RouteGoal != P) && CurrentOwner.MoveTarget != P) && CurrentOwner.RouteGoal != P.myMarker)
    {
        P.TeamOwner[PlayerReplicationInfo.Team.TeamIndex] = none;
        return true;
    }
    // End:0x171
    if(((Squad.GetOrders() == 'Defend') || CurrentOwner.MoveTarget == P) || CurrentOwner.MoveTarget == P.myMarker)
    {
        return false;
    }
    // End:0x187
    if(PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    // End:0x1AC
    if(CurrentOwner.RouteCache[1] == P.myMarker)
    {
        return false;
    }
    // End:0x1D0
    if(CurrentOwner.Squad.GetOrders() == 'Defend')
    {
        return true;
    }
    return false;
    //return;    
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x45
    if(((Pawn.Health > 0) && Damage > float(0)) && Squad.SetEnemy(self, Other))
    {
        WhatToDoNext(5);
    }
    //return;    
}

function bool IsRetreating()
{
    return false;
    //return;    
}

function bool Formation()
{
    return false;
    //return;    
}

event RecoverFromBadStateCode()
{
    bBadStateCode = false;
    CampTime = 0.5000000;
    GotoState('RestFormation', 'TauntWait');
    //return;    
}

function Celebrate()
{
    Pawn.PlayVictoryAnimation();
    //return;    
}

function ForceGiveWeapon()
{
    local Vector TossVel, LeaderVel;

    // End:0x63
    if((((Pawn == none) || Pawn.Weapon == none) || Squad.SquadLeader.Pawn == none) || !LineOfSightTo(Squad.SquadLeader.Pawn))
    {
        return;
    }
    // End:0x155
    if(Pawn.CanThrowWeapon())
    {
        TossVel = Vector(Pawn.Rotation);
        TossVel.Z = 0.0000000;
        TossVel = Normal(TossVel);
        LeaderVel = Normal(Squad.SquadLeader.Pawn.Location - Pawn.Location);
        // End:0x101
        if((TossVel Dot LeaderVel) > 0.7000000)
        {
            TossVel = LeaderVel;
        }
        TossVel = (TossVel * ((Pawn.Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 200.0000000);
        Pawn.TossWeapon(TossVel);
        SwitchToBestWeapon();
    }
    //return;    
}

function ForceCelebrate()
{
    local bool bRealCrouch;

    Pawn.bWantsToCrouch = false;
    bRealCrouch = Pawn.bCanCrouch;
    Pawn.bCanCrouch = false;
    // End:0x9D
    if(Enemy == none)
    {
        CampTime = 3.0000000;
        GotoState('RestFormation', 'TauntWait');
        // End:0x9D
        if(Squad.SquadLeader.Pawn != none)
        {
            FocalPoint = Squad.SquadLeader.Pawn.Location;
        }
    }
    StopFiring();
    Celebrate();
    Pawn.bCanCrouch = bRealCrouch;
    //return;    
}

function float GetDesiredOffset()
{
    // End:0x3D
    if((Squad.SquadLeader == none) || MoveTarget != Squad.SquadLeader.Pawn)
    {
        return 0.0000000;
    }
    return Squad.GetRestingFormation().FormationSize * 0.5000000;
    //return;    
}

function bool LostContact(float MaxTime)
{
    // End:0x0D
    if(Enemy == none)
    {
        return true;
    }
    // End:0x3C
    if(int(Enemy.Visibility) < 2)
    {
        MaxTime = FMax(2.0000000, MaxTime - float(2));
    }
    // End:0x64
    if((Level.TimeSeconds - FMax(LastSeenTime, AcquireTime)) > MaxTime)
    {
        return true;
    }
    return false;
    //return;    
}

function bool LoseEnemy()
{
    // End:0x0D
    if(Enemy == none)
    {
        return true;
    }
    // End:0x5A
    if(((Enemy.Health > 0) && Enemy.Controller != none) && LoseEnemyCheckTime > (Level.TimeSeconds - 0.2000000))
    {
        return false;
    }
    LoseEnemyCheckTime = Level.TimeSeconds;
    // End:0x8B
    if(Squad.LostEnemy(self))
    {
        bFrustrated = false;
        return true;
    }
    return false;
    //return;    
}

function DoStakeOut()
{
    GotoState('StakeOut');
    //return;    
}

function DoCharge()
{
    // End:0x19
    if(Vehicle(Pawn) != none)
    {
        GotoState('VehicleCharging');
        return;
    }
    // End:0x53
    if(Enemy.PhysicsVolume.bWaterVolume)
    {
        // End:0x50
        if(!Pawn.bCanSwim)
        {
            DoTacticalMove();
            return;
        }        
    }
    else
    {
        // End:0x85
        if(!Pawn.bCanFly && !Pawn.bCanWalk)
        {
            DoTacticalMove();
            return;
        }
    }
    GotoState('Charging');
    //return;    
}

function DoTacticalMove()
{
    // End:0x56
    if(!Pawn.bCanStrafe || Pawn.MaxRotation != float(0))
    {
        // End:0x4C
        if(Pawn.HasWeapon())
        {
            DoRangedAttackOn(Enemy);            
        }
        else
        {
            WanderOrCamp(true);
        }        
    }
    else
    {
        GotoState('TacticalMove');
    }
    //return;    
}

function DoRetreat()
{
    // End:0x1C
    if(Squad.PickRetreatDestination(self))
    {
        GotoState('Retreating');
        return;
    }
    // End:0xAF
    if(EnemyVisible())
    {
        GoalString = "No retreat because frustrated";
        bFrustrated = true;
        // End:0x8D
        if((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon)
        {
            GotoState('Charging');            
        }
        else
        {
            // End:0xA7
            if(Vehicle(Pawn) != none)
            {
                GotoState('VehicleCharging');                
            }
            else
            {
                DoTacticalMove();
            }
        }
        return;
    }
    GoalString = "Stakeout because no retreat dest";
    DoStakeOut();
    //return;    
}

function bool DefendMelee(float dist)
{
    return ((Enemy.Weapon != none) && Enemy.Weapon.bMeleeWeapon) && dist < float(1000);
    //return;    
}

function bool IsStrafing()
{
    return false;
    //return;    
}

function bool IsHunting()
{
    return false;
    //return;    
}

function bool FindViewSpot()
{
    return false;
    //return;    
}

function bool Stopped()
{
    return bPreparingMove;
    //return;    
}

function bool IsShootingObjective()
{
    return false;
    //return;    
}

function SetEnemyReaction(int AlertnessLevel)
{
    ScriptedCombat = 3;
    Enable('HearNoise');
    Enable('SeePlayer');
    Enable('SeeMonster');
    Enable('NotifyBump');
    //return;    
}

function SetNewScript(ScriptedSequence NewScript)
{
    super.SetNewScript(NewScript);
    GoalScript = UnrealScriptedSequence(NewScript);
    // End:0x59
    if(GoalScript != none)
    {
        // End:0x52
        if(FRand() < GoalScript.EnemyAcquisitionScriptProbability)
        {
            EnemyAcquisitionScript = GoalScript.EnemyAcquisitionScript;            
        }
        else
        {
            EnemyAcquisitionScript = none;
        }
    }
    //return;    
}

function bool ScriptingOverridesAI()
{
    return false;
    //return;    
}

function bool ShouldPerformScript()
{
    // End:0x5F
    if(GoalScript != none)
    {
        // End:0x37
        if((Enemy != none) && int(ScriptedCombat) == int(3))
        {
            SequenceScript = none;
            ClearScript();
            return false;
        }
        // End:0x51
        if(SequenceScript != GoalScript)
        {
            SetNewScript(GoalScript);
        }
        GotoState('Scripting', 'Begin');
        return true;
    }
    return false;
    //return;    
}

state NoGoal
{
    function EnemyChanged(bool bNewEnemyVisible)
    {
        // End:0x36
        if(EnemyAcquisitionScript != none)
        {
            bEnemyAcquired = false;
            SetEnemyInfo(bNewEnemyVisible);
            EnemyAcquisitionScript.TakeOver(Pawn);            
        }
        else
        {
            global.EnemyChanged(bNewEnemyVisible);
        }
        //return;        
    }
    stop;    
}

state RestFormation extends NoGoal
{
    ignores PickDestination, MonitoredPawnAlert, EndState, BeginState, Timer, Formation, 
	    CancelCampFor;

    function CancelCampFor(Controller C)
    {
        DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
        //return;        
    }

    function bool Formation()
    {
        return true;
        //return;        
    }

    function Timer()
    {
        // End:0x4A
        if((Pawn.Weapon != none) && Pawn.Weapon.ShouldFireWithoutTarget())
        {
            Pawn.Weapon.BotFire(false);
        }
        SetCombatTimer();
        Enable('NotifyBump');
        //return;        
    }

    function BeginState()
    {
        Enemy = none;
        Pawn.bCanJump = false;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.SetSprinting(true);
        MinHitWall += 0.1500000;
        SwitchToBestWeapon();
        //return;        
    }

    function EndState()
    {
        MonitoredPawn = none;
        Squad.GetRestingFormation().LeaveFormation(self);
        MinHitWall -= 0.1500000;
        // End:0x91
        if(Pawn != none)
        {
            Pawn.bStopAtLedges = false;
            Pawn.bAvoidLedges = false;
            Pawn.SetSprinting(false);
            // End:0x91
            if(Pawn.JumpZ > float(0))
            {
                Pawn.bCanJump = true;
            }
        }
        //return;        
    }

    event MonitoredPawnAlert()
    {
        WhatToDoNext(6);
        //return;        
    }

    function PickDestination()
    {
        FormationPosition = Squad.GetRestingFormation().RecommendPositionFor(self);
        Destination = Squad.GetRestingFormation().GetLocationFor(FormationPosition, self);
        //return;        
    }
Begin:

    WaitForLanding();
    // End:0x1B
    if(Pawn.bStationary)
    {
        goto 'Pausing';
    }
    // End:0xD8
    if((Vehicle(Pawn) != none) && !Vehicle(Pawn).bTurnInPlace || Pawn.FindAnchorFailedTime != Level.TimeSeconds)
    {
        // End:0xD2
        if(((Squad.SquadLeader == self) || Squad.SquadLeader.Pawn == none) || Pawn.GetVehicleBase() == Squad.SquadLeader.Pawn)
        {
            goto 'Camping';            
        }
        else
        {
            goto 'Pausing';
        }
    }
    PickDestination();
moving:


    // End:0xF6
    if(Pawn.bStationary)
    {
        goto 'Pausing';
    }
    // End:0x1B3
    if((Vehicle(Pawn) != none) && !Vehicle(Pawn).bTurnInPlace || Pawn.FindAnchorFailedTime != Level.TimeSeconds)
    {
        // End:0x1AD
        if(((Squad.SquadLeader == self) || Squad.SquadLeader.Pawn == none) || Pawn.GetVehicleBase() == Squad.SquadLeader.Pawn)
        {
            goto 'Camping';            
        }
        else
        {
            goto 'Pausing';
        }
    }
    // End:0x20A
    if((Vehicle(Pawn) != none) && Pawn.GetVehicleBase() != none)
    {
        StartMonitoring(Pawn.GetVehicleBase(), Squad.GetRestingFormation().FormationSize);        
    }
    else
    {
        // End:0x2A2
        if(((Squad.SquadLeader != self) && Squad.SquadLeader.Pawn != none) && Squad.FormationCenter() == Squad.SquadLeader.Pawn)
        {
            StartMonitoring(Squad.SquadLeader.Pawn, Squad.GetRestingFormation().FormationSize);            
        }
        else
        {
            MonitoredPawn = none;
        }
    }
    MoveTo(Destination,, true);
    WaitForLanding();
Pausing:


    // End:0x341
    if(!Squad.NearFormationCenter(Pawn))
    {
        Focus = none;
        FocalPoint = Squad.GetRestingFormation().GetViewPointFor(self, FormationPosition);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x331
        if(Pawn.bStationary)
        {
            Sleep(2.0000000);
        }
        Sleep(0.5000000);
        WhatToDoNext(7);
    }
Camping:


    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Focus = none;
    FocalPoint = Squad.GetRestingFormation().GetViewPointFor(self, FormationPosition);
    NearWall(200.0000000);
    FinishRotation();
    // End:0x3EE
    if((Vehicle(Pawn) != none) && Pawn.GetVehicleBase() != none)
    {
        StartMonitoring(Pawn.GetVehicleBase(), Squad.GetRestingFormation().FormationSize);        
    }
    else
    {
        // End:0x470
        if((Squad.SquadLeader.Pawn != none) && Squad.FormationCenter() == Squad.SquadLeader.Pawn)
        {
            StartMonitoring(Squad.SquadLeader.Pawn, Squad.GetRestingFormation().FormationSize);            
        }
        else
        {
            MonitoredPawn = none;
        }
    }
    Sleep(3.0000000 + FRand());
    WaitForLanding();
    // End:0x4C3
    if(!Squad.WaitAtThisPosition(Pawn))
    {
        // End:0x4BB
        if(Squad.WanderNearLeader(self))
        {
            SetAttractionState();            
        }
        else
        {
            WhatToDoNext(8);
        }
    }
    // End:0x4D5
    if(FRand() < 0.6000000)
    {
        goto 'Camping';
    }
    goto 'Begin';
ShortWait:


    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x55A
    if((Vehicle(Pawn) == none) || Vehicle(Pawn).bTurnInPlace)
    {
        Focus = none;
        FocalPoint = Squad.GetRestingFormation().GetViewPointFor(self, FormationPosition);
        NearWall(200.0000000);
        FinishRotation();
    }
TauntWait:


    Sleep(CampTime);
    WaitForLanding();
    WhatToDoNext(9);
    stop;            
}

state Startled
{
    ignores BeginState, Startle;

    function Startle(Actor Feared)
    {
        GoalString = "STARTLED!";
        StartleActor = Feared;
        BeginState();
        //return;        
    }

    function BeginState()
    {
        Pawn.Acceleration = Pawn.Location - StartleActor.Location;
        Pawn.Acceleration.Z = 0.0000000;
        Pawn.bIsSprinting = false;
        Pawn.bWantsToCrouch = false;
        // End:0x99
        if(Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
        {
            Pawn.Acceleration = VRand();
        }
        Pawn.Acceleration = Pawn.AccelRate * Normal(Pawn.Acceleration);
        //return;        
    }
Begin:

    Sleep(0.5000000);
    WhatToDoNext(11);
    goto 'Begin';
    stop;        
}

state MoveToGoal
{
    function bool CheckPathToGoalAround(Pawn P)
    {
        // End:0x43
        if(((MoveTarget == none) || Bot(P.Controller) == none) || !SameTeamAs(P.Controller))
        {
            return false;
        }
        // End:0x6F
        if(Bot(P.Controller).Squad.ClearPathFor(self))
        {
            return true;
        }
        return false;
        //return;        
    }

    function Timer()
    {
        SetCombatTimer();
        Enable('NotifyBump');
        //return;        
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
        //return;        
    }
    stop;    
}

state MoveToGoalNoEnemy extends MoveToGoal
{
    function EnemyChanged(bool bNewEnemyVisible)
    {
        // End:0x36
        if(EnemyAcquisitionScript != none)
        {
            bEnemyAcquired = false;
            SetEnemyInfo(bNewEnemyVisible);
            EnemyAcquisitionScript.TakeOver(Pawn);            
        }
        else
        {
            global.EnemyChanged(bNewEnemyVisible);
        }
        //return;        
    }
    stop;    
}

state MoveToGoalWithEnemy extends MoveToGoal
{
    function Timer()
    {
        TimedFireWeaponAtEnemy();
        //return;        
    }
    stop;    
}

state Roaming extends MoveToGoalNoEnemy
{
    ignores MayFall;

    function MayFall()
    {
        Pawn.bCanJump = (MoveTarget != none) && (int(MoveTarget.Physics) != int(2)) || !MoveTarget.IsA('Pickup');
        //return;        
    }
Begin:

    SwitchToBestWeapon();
    WaitForLanding();
    // End:0xF3
    if(((Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none) && int(Squad.PriorityObjective(self)) == 0) && Vehicle(Pawn) == none)
    {
        MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 5.0000000);
        // End:0xF3
        if((Pickup(MoveTarget) != none) && !Pickup(MoveTarget).ReadyToPickup(0.0000000))
        {
            CampTime = MoveTarget.LatentFloat;
            GoalString = "Short wait for inventory " $ string(MoveTarget);
            GotoState('RestFormation', 'ShortWait');
        }
    }
    MoveToward(MoveTarget, FaceActor(1.0000000), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
DoneRoaming:


    WaitForLanding();
    WhatToDoNext(12);
    // End:0x144
    if(bSoaking)
    {
        SoakStop("STUCK IN ROAMING!");
    }
    stop;                
}

state Fallback extends MoveToGoalWithEnemy
{
    function bool FireWeaponAt(Actor A)
    {
        // End:0xB7
        if((((((A == Enemy) && Pawn.Weapon != none) && Pawn.Weapon.AIRating < 0.5000000) && (Level.TimeSeconds - Pawn.SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime) && int(Squad.PriorityObjective(self)) == 0) && InventorySpot(RouteGoal) != none)
        {
            return false;
        }
        return global.FireWeaponAt(A);
        //return;        
    }

    function bool IsRetreating()
    {
        return (Pawn.Acceleration Dot (Pawn.Location - Enemy.Location)) > float(0);
        //return;        
    }

    event bool NotifyBump(Actor Other)
    {
        local Pawn P;
        local Vehicle V;

        // End:0xCB
        if((Vehicle(Other) != none) && Vehicle(Pawn) == none)
        {
            // End:0xCB
            if((Other == RouteGoal) || (Vehicle(RouteGoal) != none) && Other == Vehicle(RouteGoal).GetVehicleBase())
            {
                V = Vehicle(RouteGoal).FindEntryVehicle(Pawn);
                // End:0xC9
                if(V != none)
                {
                    V.UsedBy(Pawn);
                    // End:0xC9
                    if(Vehicle(Pawn) != none)
                    {
                        Squad.BotEnteredVehicle(self);
                        WhatToDoNext(54);
                    }
                }
                return true;
            }
        }
        Disable('NotifyBump');
        // End:0x117
        if(MoveTarget == Other)
        {
            // End:0x115
            if((MoveTarget == Enemy) && Pawn.HasWeapon())
            {
                TimedFireWeaponAtEnemy();
                DoRangedAttackOn(Enemy);
            }
            return false;
        }
        P = Pawn(Other);
        // End:0x14A
        if((P == none) || P.Controller == none)
        {
            return false;
        }
        // End:0x1F8
        if(((!SameTeamAs(P.Controller) && MoveTarget == RouteCache[0]) && RouteCache[1] != none) && P.ReachedDestination(MoveTarget))
        {
            MoveTimer = (VSize(RouteCache[1].Location - Pawn.Location) / (Pawn.GroundSpeed * Pawn.DesiredSpeed)) + float(1);
            MoveTarget = RouteCache[1];
        }
        Squad.SetEnemy(self, P);
        // End:0x22D
        if(Enemy == Other)
        {
            Focus = Enemy;
            TimedFireWeaponAtEnemy();
        }
        // End:0x23D
        if(CheckPathToGoalAround(P))
        {
            return false;
        }
        AdjustAround(P);
        return false;
        //return;        
    }

    function MayFall()
    {
        Pawn.bCanJump = (MoveTarget != none) && (int(MoveTarget.Physics) != int(2)) || !MoveTarget.IsA('Pickup');
        //return;        
    }

    function EnemyNotVisible()
    {
        // End:0x2C
        if(Squad.FindNewEnemyFor(self, false) || Enemy == none)
        {
            WhatToDoNext(13);            
        }
        else
        {
            Enable('SeePlayer');
            Disable('EnemyNotVisible');
        }
        //return;        
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        bEnemyAcquired = false;
        SetEnemyInfo(bNewEnemyVisible);
        // End:0x2B
        if(bNewEnemyVisible)
        {
            Disable('SeePlayer');
            Enable('EnemyNotVisible');
        }
        //return;        
    }
Begin:

    WaitForLanding();
moving:


    // End:0x59
    if((Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none) && Vehicle(Pawn) == none)
    {
        MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 0.0000000);
    }
    MoveToward(MoveTarget, FaceActor(1.0000000), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
    WhatToDoNext(14);
    // End:0xA8
    if(bSoaking)
    {
        SoakStop("STUCK IN FALLBACK!");
    }
    GoalString = GoalString $ " STUCK IN FALLBACK!";
    stop;        
}

state Retreating extends Fallback
{
    function bool IsRetreating()
    {
        return true;
        //return;        
    }

    function Actor FaceActor(float StrafingModifier)
    {
        return global.FaceActor(2.0000000);
        //return;        
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
        //return;        
    }
    stop;    
}

state Charging extends MoveToGoalWithEnemy
{
    ignores EndState, EnemyNotVisible, Timer, NotifyBump, NotifyTakeHit, TryStrafe, 
	    StrafeFromDamage, TryToDuck, MayFall;

    function MayFall()
    {
        // End:0x11
        if(MoveTarget != Enemy)
        {
            return;
        }
        Pawn.bCanJump = actorReachable(Enemy);
        // End:0x48
        if(!Pawn.bCanJump)
        {
            MoveTimer = -1.0000000;
        }
        //return;        
    }

    function bool TryToDuck(Vector duckDir, bool bReversed)
    {
        // End:0x16
        if(!Pawn.bCanStrafe)
        {
            return false;
        }
        // End:0x34
        if(FRand() < 0.6000000)
        {
            return global.TryToDuck(duckDir, bReversed);
        }
        // End:0x4F
        if(MoveTarget == Enemy)
        {
            return TryStrafe(duckDir);
        }
        //return;        
    }

    function bool StrafeFromDamage(float Damage, Class<DamageType> DamageType, bool bFindDest)
    {
        local Vector SideDir;

        // End:0x2E
        if((FRand() * Damage) < ((0.1500000 * CombatStyle) * float(Pawn.Health)))
        {
            return false;
        }
        // End:0x3B
        if(!bFindDest)
        {
            return true;
        }
        SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
        // End:0x9D
        if((Pawn.Velocity Dot SideDir) > float(0))
        {
            SideDir *= float(-1);
        }
        return TryStrafe(SideDir);
        //return;        
    }

    function bool TryStrafe(Vector SideDir)
    {
        local Vector Extent, HitLocation, HitNormal;
        local Actor HitActor;

        Extent = Pawn.GetCollisionExtent();
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(200) * SideDir), Pawn.Location, false, Extent);
        // End:0xB2
        if(HitActor != none)
        {
            SideDir *= float(-1);
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(200) * SideDir), Pawn.Location, false, Extent);
        }
        // End:0xBF
        if(HitActor != none)
        {
            return false;
        }
        // End:0x14A
        if(int(Pawn.Physics) == int(1))
        {
            HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + (float(200) * SideDir)) - (35.0000000 * vect(0.0000000, 0.0000000, 1.0000000)), Pawn.Location + (float(200) * SideDir), false, Extent);
            // End:0x14A
            if(HitActor == none)
            {
                return false;
            }
        }
        Destination = Pawn.Location + (float(2 * 200) * SideDir);
        GotoState('TacticalMove', 'DoStrafeMove');
        return true;
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        local float pick;
        local Vector SideDir;
        local bool bWasOnGround;

        super(Bot).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        LastUnderFire = Level.TimeSeconds;
        bWasOnGround = int(Pawn.Physics) == int(1);
        // End:0x6B
        if(Pawn.Health <= 0)
        {
            return;
        }
        // End:0x86
        if(StrafeFromDamage(float(Damage), DamageType, true))
        {
            return;            
        }
        else
        {
            // End:0x16F
            if((bWasOnGround && MoveTarget == Enemy) && int(Pawn.Physics) == int(2))
            {
                pick = 1.0000000;
                // End:0xDA
                if(bStrafeDir)
                {
                    pick = -1.0000000;
                }
                SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
                SideDir.Z = 0.0000000;
                Pawn.Velocity += (((pick * Pawn.GroundSpeed) * 0.7000000) * SideDir);
                // End:0x16F
                if(FRand() < 0.2000000)
                {
                    bStrafeDir = !bStrafeDir;
                }
            }
        }
        //return;        
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x6D
        if((((Other == Enemy) && Pawn.Weapon != none) && !Pawn.Weapon.bMeleeWeapon) && FRand() > (0.4000000 + (0.1000000 * Skill)))
        {
            DoRangedAttackOn(Enemy);
            return false;
        }
        return global.NotifyBump(Other);
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        TimedFireWeaponAtEnemy();
        //return;        
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
Begin:

    // End:0x3B
    if(int(Pawn.Physics) == int(2))
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4E
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
    // End:0x66
    if(!FindBestPathToward(Enemy, false, true))
    {
        DoTacticalMove();
    }
moving:


    // End:0x8C
    if(Pawn.Weapon.bMeleeWeapon)
    {
        FireWeaponAt(Enemy);
    }
    MoveToward(MoveTarget, FaceActor(1.0000000),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0xD6
    if(bSoaking)
    {
        SoakStop("STUCK IN CHARGING!");
    }
    stop;        
}

state VehicleCharging extends MoveToGoalWithEnemy
{
    ignores EnemyNotVisible, FindDestination, Timer;

    function Timer()
    {
        Target = Enemy;
        TimedFireWeaponAtEnemy();
        //return;        
    }

    function FindDestination()
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, Cross;

        // End:0x21
        if(MoveTarget == none)
        {
            Destination = Pawn.Location;
            return;
        }
        Destination = Pawn.Location + (float(5000) * Normal(Pawn.Location - MoveTarget.Location));
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x94
        if(HitActor == none)
        {
            return;
        }
        Cross = Normal((Destination - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
        Destination = Destination + (float(1000) * Cross);
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x10F
        if(HitActor == none)
        {
            return;
        }
        Destination = Destination - (float(2000) * Cross);
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x15E
        if(HitActor == none)
        {
            return;
        }
        Destination = (Destination + (float(1000) * Cross)) - (float(3000) * Normal(Pawn.Location - MoveTarget.Location));
        //return;        
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
        //return;        
    }
Begin:

    // End:0x3B
    if(int(Pawn.Physics) == int(2))
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4E
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
    // End:0xC4
    if(int(Pawn.Physics) == int(4))
    {
        // End:0xB6
        if(VSize(Enemy.Location - Pawn.Location) < float(1200))
        {
            FindDestination();
            MoveTo(Destination, none, false);
            // End:0xB6
            if(Enemy == none)
            {
                WhatToDoNext(91);
            }
        }
        MoveTarget = Enemy;        
    }
    else
    {
        // End:0xF9
        if(!FindBestPathToward(Enemy, false, true))
        {
            // End:0xF2
            if(Pawn.HasWeapon())
            {
                GotoState('RangedAttack');                
            }
            else
            {
                WanderOrCamp(true);
            }
        }
    }
    J0xF9:

    FireWeaponAt(Enemy);
    MoveToward(MoveTarget, FaceActor(1.0000000),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0x155
    if(bSoaking)
    {
        SoakStop("STUCK IN VEHICLECHARGING!");
    }
    stop;            
}

state TacticalMove
{
    ignores EndState, BeginState, NotifyJumpApex, EngageDirection, PickDestination, ChangeStrafe, 
	    PawnIsInPain, EnemyNotVisible, Timer, NotifyHitWall, SetFall, 
	    IsStrafing;

    function bool IsStrafing()
    {
        return true;
        //return;        
    }

    function SetFall()
    {
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Destination = Pawn.Location;
        global.SetFall();
        //return;        
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        local Vehicle V;

        // End:0xCD
        if((Vehicle(Wall) != none) && Vehicle(Pawn) == none)
        {
            // End:0xCB
            if((Wall == RouteGoal) || (Vehicle(RouteGoal) != none) && Wall == Vehicle(RouteGoal).GetVehicleBase())
            {
                V = Vehicle(Wall).FindEntryVehicle(Pawn);
                // End:0xC9
                if(V != none)
                {
                    V.UsedBy(Pawn);
                    // End:0xC9
                    if(Vehicle(Pawn) != none)
                    {
                        Squad.BotEnteredVehicle(self);
                        WhatToDoNext(55);
                    }
                }
                return true;
            }
            return false;
        }
        // End:0xF8
        if(int(Pawn.Physics) == int(2))
        {
            NotifyFallingHitWall(HitNormal, Wall);
            return false;
        }
        // End:0x10D
        if(Enemy == none)
        {
            WhatToDoNext(18);
            return false;
        }
        // End:0x169
        if((bChangeDir || FRand() < 0.5000000) || ((Enemy.Location - Pawn.Location) Dot HitNormal) < float(0))
        {
            Focus = Enemy;
            WhatToDoNext(19);            
        }
        else
        {
            bChangeDir = true;
            Destination = Pawn.Location - ((HitNormal * FRand()) * float(500));
        }
        return true;
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        // End:0x33
        if((Enemy != none) && !bNotifyApex)
        {
            TimedFireWeaponAtEnemy();            
        }
        else
        {
            SetCombatTimer();
        }
        //return;        
    }

    function EnemyNotVisible()
    {
        StopFiring();
        // End:0x4B
        if(Aggressiveness > (RelativeStrength(Enemy)))
        {
            // End:0x43
            if(FastTrace(Enemy.Location, LastSeeingPos))
            {
                GotoState('TacticalMove', 'RecoverEnemy');                
            }
            else
            {
                WhatToDoNext(20);
            }
        }
        Disable('EnemyNotVisible');
        //return;        
    }

    function PawnIsInPain(PhysicsVolume PainVolume)
    {
        Destination = Pawn.Location - (float(200) * Normal(Pawn.Velocity));
        //return;        
    }

    function ChangeStrafe()
    {
        local Vector Dir;

        Dir = Vector(Pawn.Rotation);
        Destination = Destination + (float(2) * ((Pawn.Location - Destination) + (Dir * ((Destination - Pawn.Location) Dot Dir))));
        //return;        
    }

    function PickDestination()
    {
        local Vector pickdir, enemyDir, enemyPart, Y, LookDir;

        local float strafeSize;
        local bool bFollowingPlayer;

        // End:0x42
        if(Pawn == none)
        {
            Warn(string(self) $ " Tactical move pick destination with no pawn");
            return;
        }
        bChangeDir = false;
        // End:0xCE
        if((Pawn.PhysicsVolume.bWaterVolume && !Pawn.bCanSwim) && Pawn.bCanFly)
        {
            Destination = Pawn.Location + (float(75) * (VRand() + vect(0.0000000, 0.0000000, 1.0000000)));
            Destination.Z += float(100);
            return;
        }
        enemyDir = Normal(Enemy.Location - Pawn.Location);
        Y = enemyDir Cross vect(0.0000000, 0.0000000, 1.0000000);
        // End:0x14A
        if(int(Pawn.Physics) == int(1))
        {
            Y.Z = 0.0000000;
            enemyDir.Z = 0.0000000;            
        }
        else
        {
            enemyDir.Z = FMax(0.0000000, enemyDir.Z);
        }
        bFollowingPlayer = ((PlayerController(Squad.SquadLeader) != none) && Squad.SquadLeader.Pawn != none) && VSize(Pawn.Location - Squad.SquadLeader.Pawn.Location) < float(1600);
        strafeSize = FClamp((((2.0000000 * Aggression) + float(1)) * FRand()) - 0.6500000, -0.7000000, 0.7000000);
        // End:0x244
        if(Squad.MustKeepEnemy(Enemy))
        {
            strafeSize = FMax((0.4000000 * FRand()) - 0.2000000, strafeSize);
        }
        enemyPart = enemyDir * strafeSize;
        strafeSize = FMax(0.0000000, 1.0000000 - Abs(strafeSize));
        pickdir = strafeSize * Y;
        // End:0x29A
        if(bStrafeDir)
        {
            pickdir *= float(-1);
        }
        // End:0x381
        if(bFollowingPlayer)
        {
            LookDir = Vector(Squad.SquadLeader.Rotation);
            // End:0x381
            if((LookDir Dot ((Pawn.Location + ((enemyPart + pickdir) * float(200))) - Squad.SquadLeader.Pawn.Location)) > FMax(0.0000000, LookDir Dot ((Pawn.Location + ((enemyPart - pickdir) * float(200))) - Squad.SquadLeader.Pawn.Location)))
            {
                bStrafeDir = !bStrafeDir;
                pickdir *= float(-1);
            }
        }
        bStrafeDir = !bStrafeDir;
        // End:0x3A8
        if(EngageDirection(enemyPart + pickdir, false))
        {
            return;
        }
        // End:0x3C0
        if(EngageDirection(enemyPart - pickdir, false))
        {
            return;
        }
        bForcedDirection = true;
        StartTacticalTime = Level.TimeSeconds;
        EngageDirection(enemyPart + pickdir, true);
        //return;        
    }

    function bool EngageDirection(Vector StrafeDir, bool bForced)
    {
        local Actor HitActor;
        local Vector HitLocation, collspec, MinDest, HitNormal;
        local bool bWantJump;

        MinDest = Pawn.Location + (float(200) * StrafeDir);
        // End:0x3AA
        if(!bForced)
        {
            collspec = Pawn.GetCollisionExtent();
            collspec.Z = FMax(6.0000000, Pawn.CollisionHeight - 35.0000000);
            bWantJump = ((((Vehicle(Pawn) == none) && int(Pawn.Physics) != int(2)) && (FRand() < ((0.0500000 * Skill) + (0.6000000 * Jumpiness))) || Pawn.Weapon.SplashJump() && ProficientWithWeapon()) && (Enemy.Location.Z - Enemy.CollisionHeight) <= ((Pawn.Location.Z + 35.0000000) - Pawn.CollisionHeight)) && !NeedToTurn(Enemy.Location);
            HitActor = Trace(HitLocation, HitNormal, MinDest, Pawn.Location, false, collspec);
            // End:0x1AD
            if((HitActor != none) && !bWantJump || !Pawn.bCanWallDodge)
            {
                return false;
            }
            // End:0x262
            if(int(Pawn.Physics) == int(1))
            {
                collspec.X = FMin(14.0000000, 0.5000000 * Pawn.CollisionRadius);
                collspec.Y = collspec.X;
                HitActor = Trace(HitLocation, HitNormal, MinDest - ((float(3) * 35.0000000) * vect(0.0000000, 0.0000000, 1.0000000)), MinDest, false, collspec);
                // End:0x262
                if(HitActor == none)
                {
                    HitNormal = float(-1) * StrafeDir;
                    return false;
                }
            }
            // End:0x3AA
            if(bWantJump)
            {
                // End:0x28C
                if(Pawn.Weapon.SplashJump())
                {
                    StopFiring();
                }
                bNotifyApex = true;
                bTacticalDoubleJump = true;
                bPlannedJump = true;
                DodgeLandZ = Pawn.Location.Z;
                bInDodgeMove = true;
                Pawn.SetPhysics(2);
                Pawn.Velocity = SuggestFallVelocity(MinDest, Pawn.Location, 1.5000000 * Pawn.JumpZ, Pawn.GroundSpeed);
                Pawn.Velocity.Z = Pawn.JumpZ;
                Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                // End:0x39D
                if(Pawn.bCanWallDodge && (Skill + (float(2) * Jumpiness)) > (float(3) + (float(3) * FRand())))
                {
                    bNotifyFallingHitWall = true;
                }
                Destination = MinDest;
                return true;
            }
        }
        Destination = MinDest + (StrafeDir * ((0.5000000 * float(200)) + FMin(VSize(Enemy.Location - Pawn.Location), 200.0000000 * (FRand() + FRand()))));
        return true;
        //return;        
    }

    event NotifyJumpApex()
    {
        // End:0x59
        if(((bTacticalDoubleJump && !bPendingDoubleJump) && FRand() < 0.4000000) && Skill > (float(2) + (float(5) * FRand())))
        {
            bTacticalDoubleJump = false;
            bNotifyApex = true;
            bPendingDoubleJump = true;            
        }
        else
        {
            // End:0x76
            if(Pawn.CanAttack(Enemy))
            {
                TimedFireWeaponAtEnemy();
            }
        }
        global.NotifyJumpApex();
        //return;        
    }

    function BeginState()
    {
        bForcedDirection = false;
        // End:0x38
        if(Skill < float(4))
        {
            Pawn.MaxDesiredSpeed = 0.4000000 + (0.0800000 * Skill);
        }
        MinHitWall += 0.1500000;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.bCanJump = false;
        bAdjustFromWalls = false;
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
        //return;        
    }

    function EndState()
    {
        // End:0x13
        if(!bPendingDoubleJump)
        {
            bNotifyApex = false;
        }
        bAdjustFromWalls = true;
        // End:0x28
        if(Pawn == none)
        {
            return;
        }
        SetMaxDesiredSpeed();
        Pawn.bAvoidLedges = false;
        Pawn.bStopAtLedges = false;
        MinHitWall -= 0.1500000;
        // End:0x83
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
TacticalTick:

    Sleep(0.0200000);
Begin:


    // End:0x21
    if(Enemy == none)
    {
        Sleep(0.0100000);
        goto 'FinishedStrafe';
    }
    // End:0x5C
    if(int(Pawn.Physics) == int(2))
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x6D
    if(Enemy == none)
    {
        goto 'FinishedStrafe';
    }
    PickDestination();
DoMove:


    // End:0xB5
    if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
    {
        MoveTo(Destination, Focus);        
    }
    else
    {
        // End:0xDA
        if(!Pawn.bCanStrafe)
        {
            StopFiring();
            MoveTo(Destination);            
        }
        else
        {
DoStrafeMove:


            MoveTo(Destination, Enemy);
        }
    }
    // End:0x183
    if(bForcedDirection && (Level.TimeSeconds - StartTacticalTime) < 0.2000000)
    {
        // End:0x14F
        if(!Pawn.HasWeapon() || Skill > (float(2) + (float(3) * FRand())))
        {
            bMustCharge = true;
            WhatToDoNext(51);
        }
        GoalString = "RangedAttack from failed tactical";
        DoRangedAttackOn(Enemy);
    }
    // End:0x1EF
    if((((Enemy == none) || EnemyVisible()) || !FastTrace(Enemy.Location, LastSeeingPos)) || (Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon)
    {
        goto 'FinishedStrafe';
    }
RecoverEnemy:


    GoalString = "Recover Enemy";
    HidingSpot = Pawn.Location;
    StopFiring();
    Sleep(0.1000000 + (0.2000000 * FRand()));
    Destination = LastSeeingPos + ((float(4) * Pawn.CollisionRadius) * Normal(LastSeeingPos - Pawn.Location));
    MoveTo(Destination, Enemy);
    // End:0x36C
    if(FireWeaponAt(Enemy))
    {
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x2E4
        if((Pawn.Weapon != none) && Pawn.Weapon.SplashDamage())
        {
            StopFiring();
            Sleep(0.0500000);            
        }
        else
        {
            Sleep((0.1000000 + (0.3000000 * FRand())) + (0.0600000 * (float(7) - FMin(7.0000000, Skill))));
        }
        // End:0x36C
        if((FRand() + 0.3000000) > Aggression)
        {
            Enable('EnemyNotVisible');
            Destination = HidingSpot + ((float(4) * Pawn.CollisionRadius) * Normal(HidingSpot - Pawn.Location));
            goto 'DoMove';
        }
    }
FinishedStrafe:


    WhatToDoNext(21);
    // End:0x39C
    if(bSoaking)
    {
        SoakStop("STUCK IN TACTICAL MOVE!");
    }
    stop;                
}

state Hunting extends MoveToGoalWithEnemy
{
    ignores EndState, BeginState, FindViewSpot, PickDestination, Timer, SeePlayer, 
	    NotifyTakeHit, MayFall, IsHunting;

    function bool IsHunting()
    {
        return true;
        //return;        
    }

    function MayFall()
    {
        Pawn.bCanJump = ((MoveTarget == none) || int(MoveTarget.Physics) != int(2)) || !MoveTarget.IsA('Pickup');
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        LastUnderFire = Level.TimeSeconds;
        super(Bot).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x61
        if((Pawn.Health > 0) && Damage > 0)
        {
            bFrustrated = true;
        }
        //return;        
    }

    function SeePlayer(Pawn SeenPlayer)
    {
        // End:0x53
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            BlockedPath = none;
            Focus = Enemy;
            WhatToDoNext(22);            
        }
        else
        {
            global.SeePlayer(SeenPlayer);
        }
        //return;        
    }

    function Timer()
    {
        SetCombatTimer();
        StopFiring();
        //return;        
    }

    function PickDestination()
    {
        local Vector nextSpot, ViewSpot, Dir;
        local float posZ;
        local bool bCanSeeLastSeen;
        local int i;

        // End:0x31
        if((Enemy == none) || Enemy.Health <= 0)
        {
            LoseEnemy();
            WhatToDoNext(23);
            return;
        }
        // End:0x58
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        // End:0xE4
        if(actorReachable(Enemy))
        {
            BlockedPath = none;
            // End:0xC7
            if(((LostContact(5.0000000)) && ((Enemy.Location - Pawn.Location) Dot Vector(Pawn.Rotation)) < float(0)) && LoseEnemy())
            {
                WhatToDoNext(24);
                return;
            }
            Destination = Enemy.Location;
            MoveTarget = none;
            return;
        }
        ViewSpot = Pawn.Location + (Pawn.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
        bCanSeeLastSeen = bEnemyInfoValid && FastTrace(LastSeenPos, ViewSpot);
        // End:0x25F
        if(Squad.BeDevious())
        {
            // End:0x240
            if(BlockedPath == none)
            {
                // End:0x1DA
                if(FindPathToward(Enemy, false) != none)
                {
                    i = 0;
                    J0x169:

                    // End:0x1D7 [Loop If]
                    if(i < 16)
                    {
                        // End:0x191
                        if(NavigationPoint(RouteCache[i]) == none)
                        {
                            // [Explicit Break]
                            goto J0x1D7;
                            // [Explicit Continue]
                            goto J0x1CD;
                        }
                        // End:0x1CD
                        if(Enemy.Controller.LineOfSightTo(RouteCache[i]))
                        {
                            BlockedPath = NavigationPoint(RouteCache[i]);
                            // [Explicit Break]
                            goto J0x1D7;
                        }
                        J0x1CD:

                        i++;
                        // [Loop Continue]
                        goto J0x169;
                    }
                    J0x1D7:
                    
                }
                else
                {
                    // End:0x209
                    if(CanStakeOut())
                    {
                        GoalString = "Stakeout from hunt";
                        GotoState('StakeOut');
                        return;                        
                    }
                    else
                    {
                        // End:0x21F
                        if(LoseEnemy())
                        {
                            WhatToDoNext(25);
                            return;                            
                        }
                        else
                        {
                            GoalString = "Retreat from hunt";
                            DoRetreat();
                            return;
                        }
                    }
                }
            }
            // End:0x25F
            if(BlockedPath != none)
            {
                BlockedPath.TransientCost = 1500;
            }
        }
        // End:0x271
        if(FindBestPathToward(Enemy, true, true))
        {
            return;
        }
        // End:0x2B9
        if(bSoaking && int(Physics) != int(2))
        {
            SoakStop("COULDN'T FIND PATH TO ENEMY " $ string(Enemy));
        }
        MoveTarget = none;
        // End:0x2E0
        if(!bEnemyInfoValid && LoseEnemy())
        {
            WhatToDoNext(26);
            return;
        }
        Destination = LastSeeingPos;
        bEnemyInfoValid = false;
        // End:0x345
        if(FastTrace(Enemy.Location, ViewSpot) && VSize(Pawn.Location - Destination) > Pawn.CollisionRadius)
        {
            SeePlayer(Enemy);
            return;
        }
        posZ = (LastSeenPos.Z + Pawn.CollisionHeight) - Enemy.CollisionHeight;
        nextSpot = LastSeenPos - (Normal(Enemy.Velocity) * Pawn.CollisionRadius);
        nextSpot.Z = posZ;
        // End:0x3D0
        if(FastTrace(nextSpot, ViewSpot))
        {
            Destination = nextSpot;            
        }
        else
        {
            // End:0x451
            if(bCanSeeLastSeen)
            {
                Dir = Pawn.Location - LastSeenPos;
                Dir.Z = 0.0000000;
                // End:0x443
                if(VSize(Dir) < Pawn.CollisionRadius)
                {
                    GoalString = "Stakeout 3 from hunt";
                    GotoState('StakeOut');
                    return;
                }
                Destination = LastSeenPos;                
            }
            else
            {
                Destination = LastSeenPos;
                // End:0x519
                if(!FastTrace(LastSeenPos, ViewSpot))
                {
                    // End:0x4BE
                    if(PickWallAdjust(Normal(LastSeenPos - ViewSpot)) || FindViewSpot())
                    {
                        // End:0x4AF
                        if(int(Pawn.Physics) == int(2))
                        {
                            SetFall();                            
                        }
                        else
                        {
                            GotoState('Hunting', 'AdjustFromWall');
                        }                        
                    }
                    else
                    {
                        // End:0x4F4
                        if((int(Pawn.Physics) == int(4)) && LoseEnemy())
                        {
                            WhatToDoNext(byte(411));
                            return;                            
                        }
                        else
                        {
                            GoalString = "Stakeout 2 from hunt";
                            GotoState('StakeOut');
                            return;
                        }
                    }
                }
            }
        }
        //return;        
    }

    function bool FindViewSpot()
    {
        local Vector X, Y, Z;
        local bool bAlwaysTry;

        // End:0x0D
        if(Enemy == none)
        {
            return false;
        }
        GetAxes(Rotation, X, Y, Z);
        bAlwaysTry = bFrustrated;
        bFrustrated = false;
        // End:0xAB
        if(FastTrace(Enemy.Location, Pawn.Location + ((float(2) * Y) * Pawn.CollisionRadius)))
        {
            Destination = Pawn.Location + ((2.5000000 * Y) * Pawn.CollisionRadius);
            return true;
        }
        // End:0x11E
        if(FastTrace(Enemy.Location, Pawn.Location - ((float(2) * Y) * Pawn.CollisionRadius)))
        {
            Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);
            return true;
        }
        // End:0x19C
        if(bAlwaysTry)
        {
            // End:0x168
            if(FRand() < 0.5000000)
            {
                Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);                
            }
            else
            {
                Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);
            }
            return true;
        }
        return false;
        //return;        
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
AdjustFromWall:

    MoveTo(Destination, MoveTarget);
Begin:


    WaitForLanding();
    // End:0x26
    if(CanSee(Enemy))
    {
        SeePlayer(Enemy);
    }
    PickDestination();
SpecialNavig:


    // End:0x42
    if(MoveTarget == none)
    {
        MoveTo(Destination);        
    }
    else
    {
        MoveToward(MoveTarget, FaceActor(10.0000000),, (FRand() < 0.7500000) && ShouldStrafeTo(MoveTarget));
    }
    WhatToDoNext(27);
    // End:0x99
    if(bSoaking)
    {
        SoakStop("STUCK IN HUNTING!");
    }
    stop;            
}

state StakeOut
{
    ignores EndState, BeginState, SetFocus, FindNewStakeOutDir, AdjustAim, Timer, 
	    NotifyTakeHit, DoStakeOut, SeePlayer, Stopped, CanAttack;

    function bool CanAttack(Actor Other)
    {
        return true;
        //return;        
    }

    function bool Stopped()
    {
        return true;
        //return;        
    }

    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x99
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            // End:0x8E
            if(((Pawn.Weapon == none) || !Pawn.Weapon.FocusOnLeader(false)) && FRand() < 0.5000000)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);            
        }
        else
        {
            // End:0xEF
            if(Squad.SetEnemy(self, SeenPlayer))
            {
                // End:0xE7
                if(Enemy == SeenPlayer)
                {
                    VisibleEnemy = Enemy;
                    EnemyVisibilityTime = Level.TimeSeconds;
                    bEnemyIsVisible = true;
                }
                WhatToDoNext(29);
            }
        }
        //return;        
    }

    function DoStakeOut()
    {
        SetFocus();
        // End:0x73
        if((FRand() < 0.3000000) || !FastTrace(FocalPoint + (vect(0.0000000, 0.0000000, 0.9000000) * Enemy.CollisionHeight), Pawn.Location + (vect(0.0000000, 0.0000000, 0.8000000) * Pawn.CollisionHeight)))
        {
            FindNewStakeOutDir();
        }
        GotoState('StakeOut', 'Begin');
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x78
        if((Pawn.Health > 0) && Damage > 0)
        {
            bFrustrated = true;
            // End:0x70
            if(instigatedBy == Enemy)
            {
                AcquireTime = Level.TimeSeconds;
            }
            WhatToDoNext(30);
        }
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        SetCombatTimer();
        //return;        
    }

    function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
    {
        local Vector FireSpot;
        local Actor HitActor;
        local Vector HitLocation, HitNormal;

        FireSpot = FocalPoint;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7E
        if(HitActor != none)
        {
            // End:0x61
            if(Enemy != none)
            {
                FireSpot += ((float(2) * Enemy.CollisionHeight) * HitNormal);
            }
            // End:0x7E
            if(!FastTrace(FireSpot, projStart))
            {
                FireSpot = FocalPoint;
            }
        }
        SetRotation(Rotator(FireSpot - projStart));
        return Rotation;
        //return;        
    }

    function FindNewStakeOutDir()
    {
        local NavigationPoint N, Best;
        local Vector Dir, enemyDir;
        local float dist, BestVal, val;

        enemyDir = Normal(Enemy.Location - Pawn.Location);
        N = Level.NavigationPointList;
        J0x3A:

        // End:0x11D [Loop If]
        if(N != none)
        {
            Dir = N.Location - Pawn.Location;
            dist = VSize(Dir);
            // End:0x106
            if((dist < float(2000)) && dist > float(200))
            {
                val = (enemyDir Dot Dir) / dist;
                // End:0xD4
                if(Level.Game.bTeamGame)
                {
                    val += FRand();
                }
                // End:0x106
                if((val > BestVal) && LineOfSightTo(N))
                {
                    BestVal = val;
                    Best = N;
                }
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x3A;
        }
        // End:0x162
        if(Best != none)
        {
            FocalPoint = Best.Location + ((0.5000000 * Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000));
        }
        //return;        
    }

    function SetFocus()
    {
        // End:0x40
        if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
        {
            Focus = Focus;            
        }
        else
        {
            // End:0x57
            if(bEnemyInfoValid)
            {
                FocalPoint = LastSeenPos;                
            }
            else
            {
                FocalPoint = Enemy.Location;
            }
        }
        //return;        
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.bCanJump = false;
        SetFocus();
        // End:0x99
        if((!bEnemyInfoValid || !ClearShot(FocalPoint, false)) || ((Level.TimeSeconds - LastSeenTime) > float(6)) && FRand() < 0.5000000)
        {
            FindNewStakeOutDir();
        }
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
Begin:

    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Focus = none;
    // End:0x60
    if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
    {
        Focus = Focus;
    }
    CheckIfShouldCrouch(Pawn.Location, FocalPoint, 1.0000000);
    FinishRotation();
    // End:0xC1
    if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
    {
        FireWeaponAt(Focus);        
    }
    else
    {
        // End:0x128
        if((((Pawn.Weapon != none) && !Pawn.Weapon.bMeleeWeapon) && Squad.ShouldSuppressEnemy(self)) && ClearShot(FocalPoint, true))
        {
            FireWeaponAt(Enemy);            
        }
        else
        {
            // End:0x146
            if(Vehicle(Pawn) != none)
            {
                FireWeaponAt(Enemy);                
            }
            else
            {
                StopFiring();
            }
        }
    }
    Sleep(1.0000000 + FRand());
    // End:0x236
    if((Pawn.bIsCrouched && !FastTrace(FocalPoint, Pawn.Location + (Pawn.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)))) && FastTrace(FocalPoint, Pawn.Location + (((Pawn.default.EyeHeight + Pawn.default.CollisionHeight) - Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000))))
    {
        Pawn.bWantsToCrouch = false;
        Sleep(0.1500000 + ((0.0500000 * (float(1) + FRand())) * (float(10) - Skill)));
    }
    WhatToDoNext(31);
    // End:0x261
    if(bSoaking)
    {
        SoakStop("STUCK IN STAKEOUT!");
    }
    stop;            
}

state RangedAttack
{
    ignores BeginState, DoRangedAttackOn, Timer, EnemyNotVisible, StopFiring, CancelCampFor, 
	    IsShootingObjective, Stopped;

    function bool Stopped()
    {
        return true;
        //return;        
    }

    function bool IsShootingObjective()
    {
        return (Target != none) && (Target == Squad.SquadObjective) || Target.Owner == Squad.SquadObjective;
        //return;        
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
        //return;        
    }

    function StopFiring()
    {
        // End:0x35
        if(((Pawn != none) && Pawn.RecommendLongRangedAttack()) && Pawn.IsFiring())
        {
            return;
        }
        global.StopFiring();
        // End:0x7B
        if(bHasFired)
        {
            // End:0x6B
            if(IsSniping())
            {
                Pawn.bWantsToCrouch = Skill > float(2);                
            }
            else
            {
                bHasFired = false;
                WhatToDoNext(32);
            }
        }
        //return;        
    }

    function EnemyNotVisible()
    {
        // End:0x2D
        if((Target == Enemy) && !Pawn.RecommendLongRangedAttack())
        {
            WhatToDoNext(33);
        }
        //return;        
    }

    function Timer()
    {
        // End:0x48
        if((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon)
        {
            SetCombatTimer();
            StopFiring();
            WhatToDoNext(34);            
        }
        else
        {
            // End:0x60
            if(Target == Enemy)
            {
                TimedFireWeaponAtEnemy();                
            }
            else
            {
                FireWeaponAt(Target);
            }
        }
        //return;        
    }

    function DoRangedAttackOn(Actor A)
    {
        // End:0x40
        if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
        {
            Target = Focus;            
        }
        else
        {
            Target = A;
        }
        GotoState('RangedAttack');
        //return;        
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        // End:0x69
        if((int(Pawn.Physics) != int(4)) || Pawn.MinFlySpeed == float(0))
        {
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        }
        // End:0xC4
        if(Vehicle(Pawn) != none)
        {
            Vehicle(Pawn).Steering = 0.0000000;
            Vehicle(Pawn).Throttle = 0.0000000;
            Vehicle(Pawn).Rise = 0.0000000;
        }
        // End:0x104
        if((Pawn.Weapon != none) && Pawn.Weapon.FocusOnLeader(false))
        {
            Target = Focus;            
        }
        else
        {
            // End:0x11A
            if(Target == none)
            {
                Target = Enemy;
            }
        }
        // End:0x14C
        if(Target == none)
        {
            Log((GetHumanReadableName()) $ " no target in ranged attack");
        }
        //return;        
    }
Begin:

    bHasFired = false;
    // End:0x3F
    if((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon)
    {
        SwitchToBestWeapon();
    }
    GoalString = GoalString @ "Ranged attack";
    Focus = Target;
    Sleep(0.0000000);
    // End:0x86
    if(Target == none)
    {
        WhatToDoNext(byte(335));
    }
    // End:0xB8
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0000000);
    }
    // End:0xDD
    if(NeedToTurn(Target.Location))
    {
        Focus = Target;
        FinishRotation();
    }
    bHasFired = true;
    // End:0xFD
    if(Target == Enemy)
    {
        TimedFireWeaponAtEnemy();        
    }
    else
    {
        FireWeaponAt(Target);
    }
    Sleep(0.1000000);
    // End:0x191
    if((((Pawn.Weapon != none) && Pawn.Weapon.bMeleeWeapon) || Target == none) || (((Target != Enemy) && GameObjective(Target) == none) && Enemy != none) && EnemyVisible())
    {
        WhatToDoNext(35);
    }
    // End:0x1C3
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0000000);
    }
    Focus = Target;
    Sleep(FMax(Pawn.RangedAttackTime(), 0.2000000 + (((0.5000000 + (0.5000000 * FRand())) * 0.4000000) * (float(7) - Skill))));
    WhatToDoNext(36);
    // End:0x23C
    if(bSoaking)
    {
        SoakStop("STUCK IN RANGEDATTACK!");
    }
    stop;                
}

state ShieldSelf
{
    ignores BeginState, StopFiring, CancelCampFor, Stopped;

    function bool Stopped()
    {
        return true;
        //return;        
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
        //return;        
    }

    function StopFiring()
    {
        //return;        
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        // End:0x32
        if(Target == none)
        {
            Target = Enemy;
        }
        // End:0x62
        if(Target == none)
        {
            Log((GetHumanReadableName()) $ " no target in shield self");
        }
        //return;        
    }
Begin:

    bHasFired = false;
    SwitchToBestWeapon();
    TimedFireWeaponAtEnemy();
    Focus = Target;
    Sleep(0.0000000);
    // End:0x4C
    if(NeedToTurn(Target.Location))
    {
        Focus = Target;
        FinishRotation();
    }
KeepShielding:


    FireWeaponAt(Target);
    // End:0x74
    if(Pawn.IsFiring())
    {
        Sleep(0.5000000);        
    }
    else
    {
        Sleep(0.1000000);
    }
    bHasFired = true;
    // End:0x93
    if(ShouldKeepShielding())
    {
        goto 'KeepShielding';
    }
    WhatToDoNext(136);
    // End:0xC0
    if(bSoaking)
    {
        SoakStop("STUCK IN SHIELDSELF!");
    }
    stop;                
}

state Dead
{
    ignores BeginState, Timer, WanderOrCamp, EnemyChanged, SetAttractionState, SetRouteToGoal, 
	    Celebrate, WhatToDoNext, DoRangedAttackOn, DelayedWarning;

    event DelayedWarning()
    {
        //return;        
    }

    function DoRangedAttackOn(Actor A)
    {
        //return;        
    }

    function WhatToDoNext(byte CallingByte)
    {
        //return;        
    }

    function Celebrate()
    {
        Log(string(self) $ " Celebrate while dead");
        //return;        
    }

    function bool SetRouteToGoal(Actor A)
    {
        Log(string(self) $ " SetRouteToGoal while dead");
        return true;
        //return;        
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while dead");
        //return;        
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while dead");
        //return;        
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while dead");
        //return;        
    }

    function Timer()
    {
        //return;        
    }

    function BeginState()
    {
        // End:0x21
        if(Level.Game.TooManyBots(self))
        {
            Destroy();
            return;
        }
        // End:0x44
        if((GoalScript != none) && HoldSpot(GoalScript) == none)
        {
            FreeScript();
        }
        // End:0x86
        if(NavigationPoint(MoveTarget) != none)
        {
            NavigationPoint(MoveTarget).FearCost = (2 * NavigationPoint(MoveTarget).FearCost) + 600;
        }
        Enemy = none;
        StopFiring();
        FormerVehicle = none;
        bFrustrated = false;
        BlockedPath = none;
        bInitLifeMessage = false;
        bPlannedJump = false;
        bInDodgeMove = false;
        bReachedGatherPoint = false;
        bFinalStretch = false;
        bWasNearObjective = false;
        bPreparingMove = false;
        bEnemyEngaged = false;
        bPursuingFlag = false;
        bHasSuperWeapon = false;
        RouteGoal = none;
        MoveTarget = none;
        //return;        
    }
Begin:

    // End:0x22
    if(Level.Game.bGameEnded)
    {
        GotoState('GameEnded');
    }
    Sleep(0.2000000);
TryAgain:


    // End:0x49
    if(UnrealMPGameInfo(Level.Game) == none)
    {
        Destroy();        
    }
    else
    {
        Sleep(0.2500000 + UnrealMPGameInfo(Level.Game).SpawnWait(self));
        LastRespawnTime = Level.TimeSeconds;
        Level.Game.RestartPlayer(self);
        goto 'TryAgain';
    }
    J0xA4:

    Sleep(0.7500000 + FRand());
    Level.Game.RestartPlayer(self);
    goto 'TryAgain';
    stop;                    
}

state FindAir
{
    ignores EndState, BeginState, PickDestination, EnemyNotVisible, Timer, NotifyHitWall, 
	    NotifyHeadVolumeChange;

    function bool NotifyHeadVolumeChange(PhysicsVolume newHeadVolume)
    {
        global.NotifyHeadVolumeChange(newHeadVolume);
        // End:0x27
        if(!newHeadVolume.bWaterVolume)
        {
            WhatToDoNext(37);
        }
        return false;
        //return;        
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        Destination = float(200) * (Normal(Destination - Pawn.Location) + HitNormal);
        return true;
        //return;        
    }

    function Timer()
    {
        // End:0x1F
        if((Enemy != none) && EnemyVisible())
        {
            TimedFireWeaponAtEnemy();            
        }
        else
        {
            SetCombatTimer();
        }
        //return;        
    }

    function EnemyNotVisible()
    {
        //return;        
    }

    function PickDestination(bool bNoCharge)
    {
        Destination = VRand();
        Destination.Z = 1.0000000;
        Destination = Pawn.Location + (float(200) * Destination);
        //return;        
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = false;
        bAdjustFromWalls = false;
        //return;        
    }

    function EndState()
    {
        bAdjustFromWalls = true;
        //return;        
    }
Begin:

    PickDestination(false);
DoMove:


    // End:0x1D
    if(Enemy == none)
    {
        MoveTo(Destination);        
    }
    else
    {
        MoveTo(Destination, Enemy);
    }
    WhatToDoNext(38);
    stop;        
}

state GameEnded
{
    ignores BeginState, Timer, WanderOrCamp, EnemyChanged, SetAttractionState, Celebrate, 
	    WhatToDoNext, SwitchToBestWeapon, DelayedWarning;

    event DelayedWarning()
    {
        //return;        
    }

    function SwitchToBestWeapon()
    {
        //return;        
    }

    function WhatToDoNext(byte CallingByte)
    {
        Log((string(self) $ " WhatToDoNext while gameended CALLED BY ") $ string(CallingByte));
        //return;        
    }

    function Celebrate()
    {
        Log(string(self) $ " Celebrate while gameended");
        //return;        
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while gameended");
        //return;        
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while gameended");
        //return;        
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while gameended");
        //return;        
    }

    function Timer()
    {
        // End:0xCF
        if(DeathMatch(Level.Game) != none)
        {
            // End:0x5E
            if((DeathMatch(Level.Game).EndGameFocus == Pawn) && Pawn != none)
            {
                Pawn.PlayVictoryAnimation();                
            }
            else
            {
                // End:0xCF
                if((TeamGame(Level.Game) != none) && TeamGame(Level.Game).bPlayersVsBots)
                {
                    // End:0xCF
                    if(!TeamGame(Level.Game).PickEndGameTauntFor(self))
                    {
                        SetTimer(1.0000000 + (float(5) * FRand()), false);
                    }
                }
            }
        }
        //return;        
    }

    function BeginState()
    {
        super(Object).BeginState();
        SetTimer(3.0000000, false);
        //return;        
    }
    stop;    
}

state Scripting
{
    ignores MayShootAtEnemy, SetMoveTarget, AbortScript, CancelCampFor, ClearPathFor, EndState, 
	    LeaveScripting, CompleteAction, Timer, UnPossess, Restart;

    function Restart()
    {
        //return;        
    }

    function UnPossess()
    {
        global.UnPossess();
        //return;        
    }

    function Timer()
    {
        super.Timer();
        Enable('NotifyBump');
        //return;        
    }

    function CompleteAction()
    {
        ActionNum++;
        WhatToDoNext(39);
        //return;        
    }

    function LeaveScripting()
    {
        // End:0x32
        if((SequenceScript == GoalScript) && HoldSpot(GoalScript) == none)
        {
            FreeScript();
            global.WhatToDoNext(40);            
        }
        else
        {
            WanderOrCamp(true);
        }
        //return;        
    }

    function EndState()
    {
        super.EndState();
        SetCombatTimer();
        // End:0x4C
        if((Pawn != none) && Pawn.Health > 0)
        {
            Pawn.bPhysicsAnimUpdate = Pawn.default.bPhysicsAnimUpdate;
        }
        //return;        
    }

    function ClearPathFor(Controller C)
    {
        CancelCampFor(C);
        //return;        
    }

    function CancelCampFor(Controller C)
    {
        // End:0x4F
        if(Pawn.Velocity == vect(0.0000000, 0.0000000, 0.0000000))
        {
            DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
        }
        //return;        
    }

    function AbortScript()
    {
        // End:0x27
        if((SequenceScript == GoalScript) && HoldSpot(GoalScript) == none)
        {
            FreeScript();
        }
        WanderOrCamp(true);
        //return;        
    }

    function SetMoveTarget()
    {
        super.SetMoveTarget();
        // End:0x32
        if(Pawn.ReachedDestination(MoveTarget))
        {
            ActionNum++;
            GotoState('Scripting', 'Begin');
            return;
        }
        // End:0x56
        if((Enemy != none) && int(ScriptedCombat) == int(2))
        {
            GotoState('Fallback');
        }
        //return;        
    }

    function MayShootAtEnemy()
    {
        // End:0x22
        if(Enemy != none)
        {
            Target = Enemy;
            GotoState('Scripting', 'ScriptedRangedAttack');
        }
        //return;        
    }
ScriptedRangedAttack:

    GoalString = "Scripted Ranged Attack";
    Focus = Enemy;
    WaitToSeeEnemy();
    // End:0x42
    if(Target != none)
    {
        FireWeaponAt(Target);
    }
    stop;        
}

state WaitingForLanding
{
    function bool DoWaitForLanding()
    {
        // End:0x0B
        if(bJustLanded)
        {
            return false;
        }
        BeginState();
        return true;
        //return;        
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        bJustLanded = true;
        super(Controller).NotifyLanded(HitNormal);
        return false;
        //return;        
    }

    function Timer()
    {
        // End:0x18
        if(Focus == Enemy)
        {
            TimedFireWeaponAtEnemy();            
        }
        else
        {
            SetCombatTimer();
        }
        //return;        
    }

    function BeginState()
    {
        bJustLanded = false;
        // End:0x3C
        if((MoveTarget != none) && (Enemy == none) || Focus != Enemy)
        {
            FaceActor(1.5000000);
        }
        // End:0x5E
        if((Enemy == none) || Focus != Enemy)
        {
            StopFiring();
        }
        //return;        
    }
Begin:

    // End:0x23
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        WhatToDoNext(150);
    }
    // End:0xEB
    if(Pawn.PhysicsVolume.Gravity.Z > (0.9000000 * Pawn.PhysicsVolume.default.Gravity.Z))
    {
        // End:0xC2
        if((MoveTarget == none) || MoveTarget.Location.Z > Pawn.Location.Z)
        {
            NotifyMissedJump();
            // End:0xBF
            if(MoveTarget != none)
            {
                MoveToward(MoveTarget, Focus,, true);
            }            
        }
        else
        {
            // End:0xDD
            if(int(Physics) != int(2))
            {
                WhatToDoNext(151);                
            }
            else
            {
                Sleep(0.5000000);
                goto 'Begin';
            }
        }
    }
    WaitForLanding();
    WhatToDoNext(50);
    stop;        
}

state Testing
{
    ignores BeginState, EndState, SetLowGrav, FindNextJumpTarget, FindNextMoveTarget, Timer, 
	    AvoidCertainDeath, WanderOrCamp, EnemyChanged, SetAttractionState, Celebrate, 
	    WhatToDoNext;

    function WhatToDoNext(byte CallingByte)
    {
        //return;        
    }

    function Celebrate()
    {
        Log(string(self) $ " Celebrate while dead");
        //return;        
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while dead");
        //return;        
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while dead");
        //return;        
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while dead");
        //return;        
    }

    function bool AvoidCertainDeath()
    {
        Pawn.SetLocation(TestStart.Location);
        MoveTimer = -1.0000000;
        return true;
        //return;        
    }

    function Timer()
    {
        //return;        
    }

    function FindNextMoveTarget()
    {
        local NavigationPoint N;
        local bool bFoundStart;
        local int i;

        bFoundStart = TestStart == none;
        Pawn.Health = 100;
        N = Level.NavigationPointList;
        J0x34:

        // End:0x25D [Loop If]
        if(N != none)
        {
            // End:0x56
            if(N == TestStart)
            {
                bFoundStart = true;
            }
            // End:0x230
            if(bFoundStart && TestPath < N.PathList.Length)
            {
                i = TestPath;
                J0x85:

                // End:0x230 [Loop If]
                if(i < N.PathList.Length)
                {
                    // End:0x226
                    if((JumpSpot(N.PathList[i].End) != none) && N.PathList[i].bForced)
                    {
                        Log((("Test translocation from " $ string(N)) $ " to ") $ string(N.PathList[i].End));
                        Pawn.SetLocation(N.Location + ((Pawn.CollisionHeight - N.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000)));
                        Pawn.Anchor = N;
                        TestStart = N;
                        TestPath = i + 1;
                        MoveTarget = N.PathList[i].End;
                        JumpSpot(N.PathList[i].End).bOnlyTranslocator = true;
                        ClientSetRotation(Rotator(MoveTarget.Location - Pawn.Location));
                        return;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x85;
                }
            }
            // End:0x246
            if(N == TestStart)
            {
                TestPath = 0;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x34;
        }
        TestStart = none;
        TestPath = 0;
        // End:0x283
        if(bSingleTestSection)
        {
            GotoState('Testing', 'AllFinished');            
        }
        else
        {
            GotoState('Testing', 'Finished');
        }
        //return;        
    }

    function FindNextJumpTarget()
    {
        local NavigationPoint N;
        local bool bFoundStart;
        local int i;

        bFoundStart = TestStart == none;
        Pawn.Health = 100;
        N = Level.NavigationPointList;
        J0x34:

        // End:0x2E7 [Loop If]
        if(N != none)
        {
            // End:0x56
            if(N == TestStart)
            {
                bFoundStart = true;
            }
            // End:0x2BA
            if((bFoundStart && JumpPad(N) == none) && TestPath < N.PathList.Length)
            {
                i = TestPath;
                J0x97:

                // End:0x2BA [Loop If]
                if(i < N.PathList.Length)
                {
                    // End:0x2B0
                    if((JumpSpot(N.PathList[i].End) != none) && N.PathList[i].bForced)
                    {
                        JumpSpot(N.PathList[i].End).bOnlyTranslocator = JumpSpot(N.PathList[i].End).bRealOnlyTranslocator;
                        // End:0x2B0
                        if(JumpSpot(N.PathList[i].End).SpecialCost(Pawn, N.PathList[i]) < 1000000)
                        {
                            Log((((("Test " $ GoalString) $ " from ") $ string(N)) $ " to ") $ string(N.PathList[i].End));
                            Pawn.SetLocation(N.Location + ((Pawn.CollisionHeight - N.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000)));
                            Pawn.Anchor = N;
                            TestStart = N;
                            TestPath = i + 1;
                            MoveTarget = N.PathList[i].End;
                            ClientSetRotation(Rotator(MoveTarget.Location - Pawn.Location));
                            return;
                        }
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x97;
                }
            }
            // End:0x2D0
            if(N == TestStart)
            {
                TestPath = 0;
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x34;
        }
        TestStart = none;
        TestPath = 0;
        // End:0x30D
        if(bSingleTestSection)
        {
            GotoState('Testing', 'AllFinished');            
        }
        else
        {
            GotoState('Testing', TestLabel);
        }
        //return;        
    }

    function SetLowGrav(bool bSet)
    {
        local PhysicsVolume V;

        // End:0x4C
        if(bSet)
        {
            // End:0x48
            foreach AllActors(Class'Engine.PhysicsVolume', V)
            {
                V.Gravity.Z = FMax(V.Gravity.Z, -300.0000000);                
            }                        
        }
        else
        {
            // End:0x84
            foreach AllActors(Class'Engine.PhysicsVolume', V)
            {
                V.Gravity.Z = V.default.Gravity.Z;                
            }            
        }
        //return;        
    }

    function EndState()
    {
        Log(string(self) $ " leaving test state");
        //return;        
    }

    function BeginState()
    {
        bHasImpactHammer = false;
        bAllowedToImpactJump = false;
        Log(string(self) $ " entering test state");
        SetTimer(0.0000000, false);
        Skill = 7.0000000;
        //return;        
    }
Begin:

    // End:0x76
    if(Pawn.Weapon == none)
    {
        Pawn.PendingWeapon = wWeapon(Pawn.FindInventoryType(Class<Inventory>(DynamicLoadObject("XWeapons.Translauncher", Class'Core.Class'))));
        Pawn.ChangedWeapon();
        Sleep(0.5000000);
    }
    bAllowedToTranslocate = true;
    bHasTranslocator = true;
    GoalString = "TRANSLOCATING";
    FindNextMoveTarget();
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MoveToward(MoveTarget);
    // End:0xFE
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));        
    }
    else
    {
        // End:0x14E
        if(Pawn.Health < 100)
        {
            Log(("TOOK DAMAGE " $ string(100 - Pawn.Health)) $ " but succeeded");            
        }
        else
        {
            Log("Success!");
        }
    }
    goto 'Begin';
Finished:


    // End:0x19E
    if(!bAllowedToImpactJump)
    {
        Pawn.GiveWeapon("XWeapons.ShieldGun");
        bAllowedToImpactJump = true;
        Sleep(0.5000000);
    }
    TestLabel = 'FinishedJumping';
    bAllowedToTranslocate = false;
    bHasImpactHammer = true;
    bHasTranslocator = false;
    Pawn.bCanDoubleJump = true;
    GoalString = "DOUBLE/IMPACT JUMPING";
    FindNextJumpTarget();
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MoveToward(MoveTarget);
    // End:0x252
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));        
    }
    else
    {
        // End:0x2A2
        if(Pawn.Health < 100)
        {
            Log(("TOOK DAMAGE " $ string(100 - Pawn.Health)) $ " but succeeded");            
        }
        else
        {
            Log("Success!");
        }
    }
    goto 'Finished';
FinishedJumping:


    Pawn.bCanDoubleJump = true;
    Pawn.Health = 100;
    bHasImpactHammer = false;
    bAllowedToTranslocate = false;
    bHasTranslocator = false;
    bAllowedToImpactJump = false;
    TestLabel = 'FinishedComboJumping';
    Pawn.JumpZ = Pawn.default.JumpZ * 1.5000000;
    Pawn.GroundSpeed = Pawn.default.GroundSpeed * 1.4000000;
    GoalString = "COMBO JUMPING";
    FindNextJumpTarget();
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MoveToward(MoveTarget);
    // End:0x3C1
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));        
    }
    else
    {
        // End:0x411
        if(Pawn.Health < 100)
        {
            Log(("TOOK DAMAGE " $ string(100 - Pawn.Health)) $ " but succeeded");            
        }
        else
        {
            Log("Success!");
        }
    }
    goto 'FinishedJumping';
FinishedComboJumping:


    Pawn.bCanDoubleJump = true;
    TestLabel = 'AllFinished';
    bHasImpactHammer = false;
    bAllowedToTranslocate = false;
    bHasTranslocator = false;
    bAllowedToImpactJump = false;
    SetLowGrav(true);
    Pawn.GroundSpeed = Pawn.default.GroundSpeed;
    Pawn.JumpZ = Pawn.default.JumpZ;
    GoalString = "LOWGRAV JUMPING";
    FindNextJumpTarget();
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MoveToward(MoveTarget);
    // End:0x51A
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));        
    }
    else
    {
        // End:0x56A
        if(Pawn.Health < 100)
        {
            Log(("TOOK DAMAGE " $ string(100 - Pawn.Health)) $ " but succeeded");            
        }
        else
        {
            Log("Success!");
        }
    }
    goto 'FinishedComboJumping';
AllFinished:


    SetLowGrav(false);
    bSingleTestSection = false;
    Pawn.PlayVictoryAnimation();
    stop;        
}

defaultproperties
{
    bLeadTarget=true
    Aggressiveness=0.4000000
    LastAttractCheck=-10000.0000000
    BaseAggressiveness=0.4000000
    CombatStyle=0.2000000
    TranslocUse=1.0000000
    ScriptedCombat=3
    LastSearchTime=-10000.0000000
    ComboNames[0]="wGame.ComboSpeed"
    ComboNames[1]="wGame.ComboBerserk"
    ComboNames[2]="wGame.ComboDefensive"
    ComboNames[3]="wGame.ComboInvis"
    OrderNames[0]="Defend"
    OrderNames[1]="HOLD"
    OrderNames[2]="Attack"
    OrderNames[3]="Follow"
    OrderNames[4]="Freelance"
    OrderNames[10]="Attack"
    OrderNames[11]="Defend"
    OrderNames[12]="Defend"
    OrderNames[13]="Attack"
    OrderNames[14]="Attack"
    FovAngle=85.0000000
    bIsPlayer=true
    OldMessageTime=-100.0000000
    PlayerReplicationInfoClass=Class'UnrealGame_Decompressed.TeamPlayerReplicationInfo'
}