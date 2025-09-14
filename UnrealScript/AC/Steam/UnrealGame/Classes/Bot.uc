/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\Bot.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:6
 *	Enums:1
 *	Properties:94
 *	Functions:149
 *	States:22
 *
 *******************************************************************************/
class Bot extends ScriptedController
    dependson(JumpSpot)
    dependson(UnrealScriptedSequence)
    dependson(DeathMatch)
    dependson(TeamGame)
    dependson(UnrealMPGameInfo)
    dependson(SquadAI)
    dependson(RestingFormation)
    dependson(UnrealPawn)
    dependson(UnrealTeamInfo)
    dependson(UnrealPlayer)
    dependson(TeamAI)
    dependson(DestroyableObjective);

const MAXSTAKEOUTDIST = 2000;
const ENEMYLOCATIONFUZZ = 1200;
const TACTICALHEIGHTADVANTAGE = 320;
const MINSTRAFEDIST = 200;
const MINVIEWDIST = 200;
const AngleConvert = 0.0000958738;

enum EScriptFollow
{
    FOLLOWSCRIPT_IgnoreAllStimuli,
    FOLLOWSCRIPT_IgnoreEnemies,
    FOLLOWSCRIPT_StayOnScript,
    FOLLOWSCRIPT_LeaveScriptForCombat
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
var class<wWeapon> FavoriteWeapon;
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
    // End:0x2a
    if(GoalScript != none)
    {
        GoalScript.FreeScript();
    }
    super(Controller).Destroyed();
}

function PostBeginPlay()
{
    super(Controller).PostBeginPlay();
    SetCombatTimer();
    Aggressiveness = BaseAggressiveness;
    // End:0x3f
    if(UnrealMPGameInfo(Level.Game).bSoaking)
    {
        bSoaking = true;
    }
}

function wWeapon HasSuperWeapon()
{
    local Pawn CheckPawn;
    local Inventory Inv;

    // End:0x0d
    if(!bHasSuperWeapon)
    {
        return none;
    }
    // End:0x39
    if(Vehicle(Pawn) != none)
    {
        CheckPawn = Vehicle(Pawn).Driver;
    }
    // End:0x44
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
    J0x6d:
    // End:0xe0 [While If]
    if(Inv != none)
    {
        // End:0xc9
        if(wWeapon(Inv) != none && wWeapon(Inv).default.InventoryGroup == 0 && wWeapon(Inv).HasAmmo())
        {
            return wWeapon(Inv);
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x6d;
    }
    bHasSuperWeapon = false;
    return none;
}

function NotifyAddInventory(Inventory NewItem)
{
    // End:0x0b
    if(bHasSuperWeapon)
    {
        return;
    }
    bHasSuperWeapon = wWeapon(NewItem) != none && wWeapon(NewItem).default.InventoryGroup == 0;
}

function bool ShouldKeepShielding()
{
    // End:0x55
    if(Enemy == none || HoldObjective(Squad.SquadObjective) == none || !Pawn.ReachedDestination(Squad.SquadObjective))
    {
        bShieldSelf = false;
    }
    // End:0x66
    else
    {
        Pawn.bWantsToCrouch = true;
    }
    return bShieldSelf;
}

event SetupSpecialPathAbilities()
{
    bAllowedToTranslocate = CanUseTranslocator();
    bAllowedToImpactJump = CanImpactJump();
}

event bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
    local Vehicle V;

    // End:0x1b0
    if(Vehicle(Wall) != none && Vehicle(Pawn) == none)
    {
        // End:0xcb
        if(Wall == RouteGoal || Vehicle(RouteGoal) != none && Wall == Vehicle(RouteGoal).GetVehicleBase())
        {
            V = Vehicle(Wall).FindEntryVehicle(Pawn);
            // End:0xc9
            if(V != none)
            {
                V.UsedBy(Pawn);
                // End:0xc9
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
        if(Vehicle(Wall).Controller != none || FRand() < 0.90)
        {
            return false;
        }
        bNotifyApex = true;
        bPendingDoubleJump = true;
        Pawn.SetPhysics(2);
        Pawn.Velocity = Destination - Pawn.Location;
        Pawn.Velocity.Z = 0.0;
        Pawn.Velocity = Pawn.GroundSpeed * Normal(Pawn.Velocity);
        Pawn.Velocity.Z = Pawn.JumpZ;
    }
    return false;
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
}

function bool CanDoubleJump(Pawn Other)
{
    return Pawn.bCanDoubleJump || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z;
}

function TryCombo(string ComboName)
{
    // End:0xe4
    if(!Pawn.InCurrentCombo() && !NeedsAdrenaline())
    {
        // End:0x46
        if(ComboName ~= "Random")
        {
            ComboName = ComboNames[Rand(4)];
        }
        // End:0x70
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
        // End:0xe4
        if(!Pawn.InCurrentCombo())
        {
            Log("WARNING - bot failed to start combo!");
        }
    }
}

function FearThisSpot(AvoidMarker aSpot)
{
    // End:0x23
    if(Skill > float(1) + 4.50 * FRand())
    {
        super(Controller).FearThisSpot(aSpot);
    }
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
}

function SetCombatTimer()
{
    SetTimer(1.20 - 0.090 * FMin(10.0, Skill + ReactionTime), true);
}

function bool AutoTaunt()
{
    return true;
}

function bool DontReuseTaunt(int t)
{
    // End:0x11
    if(t == LastTaunt)
    {
        return true;
    }
    // End:0x49
    if(t == Level.LastTaunt[0] || t == Level.LastTaunt[1])
    {
        return true;
    }
    LastTaunt = t;
    Level.LastTaunt[1] = Level.LastTaunt[0];
    Level.LastTaunt[0] = t;
    return false;
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
}

function Pawn GetMyPlayer()
{
    // End:0x31
    if(PlayerController(Squad.SquadLeader) != none)
    {
        return Squad.SquadLeader.Pawn;
    }
    return super.GetMyPlayer();
}

function UpdatePawnViewPitch()
{
    // End:0x24
    if(Pawn != none)
    {
        Pawn.SetViewPitch(Rotation.Pitch);
    }
}

simulated function float RateWeapon(wWeapon W)
{
    return W.GetAIRating() + FRand() * 0.050;
}

function bool CanImpactJump()
{
    return bHasImpactHammer && Pawn.Health >= 80 && Skill >= float(5) && Squad.AllowImpactJumpBy(self);
}

function bool CanUseTranslocator()
{
    return bHasTranslocator && Skill >= float(2) && Level.TimeSeconds > NextTranslocTime && Squad.AllowTranslocationBy(self);
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
        Pawn.Velocity.Z = Pawn.Velocity.Z - 0.50 * Pawn.JumpZ;
        bNotifyApex = true;
        bPendingDoubleJump = true;
    }
    Destination = RealDestination;
    ImpactTarget = none;
    bPreparingMove = false;
}

function WaitForMover(Mover M)
{
    super(AIController).WaitForMover(M);
    StopStartTime = Level.TimeSeconds;
}

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
    LastFireAttempt = Level.TimeSeconds;
    // End:0x2a
    if(Target == none)
    {
        Target = Enemy;
    }
    // End:0x1e8
    if(Target != none)
    {
        // End:0x136
        if(!Pawn.IsFiring())
        {
            // End:0x12b
            if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon || !NeedToTurn(Target.Location) && Pawn.CanAttack(Target))
            {
                Focus = Target;
                bCanFire = true;
                bStoppedFiring = false;
                // End:0x105
                if(Pawn.Weapon != none)
                {
                    bFireSuccess = Pawn.Weapon.BotFire(bFinishedFire);
                }
                // End:0x121
                else
                {
                    Pawn.ChooseFireAt(Target);
                    bFireSuccess = true;
                }
                return bFireSuccess;
            }
            // End:0x133
            else
            {
                bCanFire = false;
            }
        }
        // End:0x1e8
        else
        {
            // End:0x1e8
            if(bCanFire && ShouldFireAgain(RefireRate))
            {
                // End:0x1e8
                if(Target != none && Focus == Target && !Target.bDeleteMe)
                {
                    bStoppedFiring = false;
                    // End:0x1c5
                    if(Pawn.Weapon != none)
                    {
                        bFireSuccess = Pawn.Weapon.BotFire(bFinishedFire);
                    }
                    // End:0x1e1
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
}

function bool ShouldFireAgain(float RefireRate)
{
    local DestroyableObjective ObjectiveTarget;

    // End:0x0e
    if(FRand() < RefireRate)
    {
        return true;
    }
    // End:0x57
    if(Pawn.FireOnRelease() && Pawn.Weapon == none || !Pawn.Weapon.bMeleeWeapon)
    {
        return false;
    }
    // End:0xab
    if(Pawn(Target) != none)
    {
        return Pawn.bStationary || Pawn(Target).bStationary && Pawn(Target).Health > 0;
    }
    // End:0xd7
    if(ShootTarget(Target) != none)
    {
        ObjectiveTarget = DestroyableObjective(Target.Owner);
    }
    // End:0xe7
    else
    {
        ObjectiveTarget = DestroyableObjective(Target);
    }
    // End:0x134
    if(ObjectiveTarget != none && ObjectiveTarget.DamageCapacity > 0 && ObjectiveTarget.bActive && !ObjectiveTarget.bDisabled)
    {
        return true;
    }
    return false;
}

function TimedFireWeaponAtEnemy()
{
    // End:0x24
    if(Enemy == none || FireWeaponAt(Enemy))
    {
        SetCombatTimer();
    }
    // End:0x2d
    else
    {
        SetTimer(0.10, true);
    }
}

function bool FireWeaponAt(Actor A)
{
    // End:0x16
    if(A == none)
    {
        A = Enemy;
    }
    // End:0x34
    if(A == none || Focus != A)
    {
        return false;
    }
    Target = A;
    // End:0x91
    if(Pawn.Weapon != none)
    {
        // End:0x8e
        if(Pawn.Weapon.HasAmmo())
        {
            return WeaponFireAgain(Pawn.Weapon.RefireRate(), false);
        }
    }
    // End:0xa8
    else
    {
        return WeaponFireAgain(Pawn.RefireRate(), false);
    }
    return false;
}

function bool CanAttack(Actor Other)
{
    return Pawn.CanAttack(Other);
}

function StopFiring()
{
    // End:0x27
    if(Pawn != none && Pawn.StopWeaponFiring())
    {
        bStoppedFiring = true;
    }
    bCanFire = false;
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
}

function ChangedWeapon()
{
    // End:0x31
    if(Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(0.0);
    }
}

function float WeaponPreference(wWeapon W)
{
    local float WeaponStickiness;

    // End:0x6e
    if(GoalScript != none && GoalScript.WeaponPreference != none && ClassIsChildOf(W.Class, GoalScript.WeaponPreference) && Pawn.ReachedDestination(GoalScript.GetMoveTarget()))
    {
        return 0.30;
    }
    // End:0x91
    if(Target != none && Pawn(Target) == none)
    {
        return 0.0;
    }
    // End:0xdb
    if(FavoriteWeapon != none && ClassIsChildOf(W.Class, FavoriteWeapon))
    {
        // End:0xd5
        if(W == Pawn.Weapon)
        {
            return 0.30;
        }
        return 0.150;
    }
    // End:0x185
    if(W == Pawn.Weapon)
    {
        WeaponStickiness = 0.10 * W.MinReloadPct;
        // End:0x14c
        if(Pawn.Weapon.AIRating < 0.50 || Enemy == none)
        {
            return WeaponStickiness + 0.10;
        }
        // End:0x185
        else
        {
            // End:0x178
            if(Skill < float(5))
            {
                return WeaponStickiness + 0.60 - 0.10 * Skill;
            }
            // End:0x185
            else
            {
                return WeaponStickiness + 0.10;
            }
        }
    }
    return 0.0;
}

function bool ProficientWithWeapon()
{
    local float proficiency;

    // End:0x23
    if(Pawn == none || Pawn.Weapon == none)
    {
        return false;
    }
    proficiency = Skill;
    // End:0x68
    if(FavoriteWeapon != none && ClassIsChildOf(Pawn.Weapon.Class, FavoriteWeapon))
    {
        proficiency += float(2);
    }
    return proficiency > float(2) + FRand() * float(4);
}

function bool CanComboMoving()
{
    // End:0x34
    if(Skill >= float(5) && ClassIsChildOf(Pawn.Weapon.Class, FavoriteWeapon))
    {
        return true;
    }
    // End:0x4c
    if(Skill >= float(7))
    {
        return FRand() < 0.90;
    }
    return Skill - float(3) > float(4) * FRand();
}

function bool CanCombo()
{
    // End:0x0b
    if(Stopped())
    {
        return true;
    }
    // End:0x26
    if(Pawn.Physics == 2)
    {
        return false;
    }
    // End:0x59
    if(Pawn.Acceleration == vect(0.0, 0.0, 0.0) || MoveTarget == Enemy)
    {
        return true;
    }
    return CanComboMoving();
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
    // End:0xc6
    if(GoalScript != none)
    {
        Canvas.DrawText("     " $ GoalString $ " goalscript " $ GetItemName(string(GoalScript)) $ " Sniping " $ string(IsSniping()) $ " ReTaskTime " $ string(ReTaskTime), false);
    }
    // End:0xfa
    else
    {
        Canvas.DrawText("     " $ GoalString $ " ReTaskTime " $ string(ReTaskTime), false);
    }
    YPos += float(2) * YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x21c
    if(Enemy != none)
    {
        Canvas.DrawText("Enemy Dist " $ string(VSize(Enemy.Location - Pawn.Location)) $ " Strength " $ string(RelativeStrength(Enemy)) $ " Acquired " $ string(bEnemyAcquired) $ " LastSeenTime " $ string(Level.TimeSeconds - LastSeenTime) $ " AcquireTime " $ string(Level.TimeSeconds - AcquireTime));
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    Inv = Pawn.Inventory;
    J0x230:
    // End:0x345 [While If]
    if(Inv != none)
    {
        // End:0x32e
        if(wWeapon(Inv) != none)
        {
            bFound = false;
            i = 0;
            J0x25a:
            // End:0x2a2 [While If]
            if(i < 5)
            {
                // End:0x298
                if(Best[i] == none)
                {
                    bFound = true;
                    Best[i] = wWeapon(Inv);
                }
                // End:0x2a2
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x25a;
                }
            }
            // End:0x32e
            if(!bFound)
            {
                moving = wWeapon(Inv);
                i = 0;
                J0x2c4:
                // End:0x32e [While If]
                if(i < 5)
                {
                    // End:0x324
                    if(Best[i].CurrentRating < moving.CurrentRating)
                    {
                        temp = moving;
                        moving = Best[i];
                        Best[i] = temp;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x2c4;
                }
            }
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x230;
    }
    Canvas.DrawText("Weapons Fire last attempt at " $ string(LastFireAttempt) $ " success " $ string(bFireSuccess) $ " stopped firing " $ string(bStoppedFiring), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    i = 0;
    J0x3db:
    // End:0x43a [While If]
    if(i < 5)
    {
        // End:0x430
        if(Best[i] != none)
        {
            S = S @ GetItemName(string(Best[i])) @ string(Best[i].CurrentRating);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3db;
    }
    Canvas.DrawText("Weapons: " $ S, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("PERSONALITY: Alertness " $ string(BaseAlertness) $ " Accuracy " $ string(Accuracy) $ " Favorite Weap " $ string(FavoriteWeapon));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("    Aggressiveness " $ string(BaseAggressiveness) $ " CombatStyle " $ string(CombatStyle) $ " Strafing " $ string(StrafingAbility) $ " Tactics " $ string(Tactics) $ " TranslocUse " $ string(TranslocUse));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
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
}

function Actor GetOrderObject()
{
    // End:0x28
    if(PlayerController(Squad.SquadLeader) != none)
    {
        return Squad.SquadLeader;
    }
    return Squad.SquadObjective;
}

function YellAt(Pawn Moron)
{
    local float threshold;

    // End:0x27
    if(PlayerController(Moron.Controller) == none)
    {
        threshold = 0.950;
    }
    // End:0x4b
    else
    {
        // End:0x40
        if(Enemy == none)
        {
            threshold = 0.30;
        }
        // End:0x4b
        else
        {
            threshold = 0.70;
        }
    }
    // End:0x59
    if(FRand() < threshold)
    {
        return;
    }
    SendMessage(Moron.PlayerReplicationInfo, 'FRIENDLYFIRE', 0, 5.0, 'Team');
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
}

function SendMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float wait, name BroadcastType)
{
    // End:0x45
    if(MessageType == OldMessageType && MessageID == OldMessageID && Level.TimeSeconds - OldMessageTime < wait)
    {
        return;
    }
    // End:0x7f
    if(Level.Game.bGameEnded || Level.Game.bWaitingToStartMatch)
    {
        return;
    }
    OldMessageID = MessageID;
    OldMessageType = MessageType;
}

function SetOrders(name NewOrders, Controller OrderGiver)
{
    // End:0x2c
    if(PlayerReplicationInfo.Team != OrderGiver.PlayerReplicationInfo.Team)
    {
        return;
    }
    Aggressiveness = BaseAggressiveness;
    // End:0x61
    if(NewOrders == 'HOLD' || NewOrders == 'Follow')
    {
        Aggressiveness += float(1);
    }
    // End:0x94
    if(bInstantAck)
    {
        SendMessage(OrderGiver.PlayerReplicationInfo, 'ACK', byte(255), 5.0, 'Team');
    }
    // End:0xb9
    else
    {
        SendMessage(OrderGiver.PlayerReplicationInfo, 'ACK', 0, 5.0, 'Team');
    }
    bInstantAck = false;
    UnrealTeamInfo(PlayerReplicationInfo.Team).AI.SetOrders(self, NewOrders, OrderGiver);
    WhatToDoNext(1);
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
}

function ClearTemporaryOrders()
{
    // End:0x87
    if(OldOrders != 'None')
    {
        Aggressiveness = BaseAggressiveness;
        // End:0x44
        if(OldOrders == 'HOLD' || OldOrders == 'Follow')
        {
            Aggressiveness += float(1);
        }
        UnrealTeamInfo(PlayerReplicationInfo.Team).AI.SetOrders(self, OldOrders, OldOrderGiver);
        OldOrders = 'None';
        OldOrderGiver = none;
    }
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    // End:0x5e
    if(ChooseAttackCounter < 2 || ChooseAttackTime != Level.TimeSeconds && NoiseMaker != none && Squad.SetEnemy(self, NoiseMaker.Instigator))
    {
        WhatToDoNext(2);
    }
}

event SeePlayer(Pawn SeenPlayer)
{
    // End:0x48
    if(ChooseAttackCounter < 2 || ChooseAttackTime != Level.TimeSeconds && Squad.SetEnemy(self, SeenPlayer))
    {
        WhatToDoNext(3);
    }
    // End:0x7e
    if(Enemy == SeenPlayer)
    {
        VisibleEnemy = Enemy;
        EnemyVisibilityTime = Level.TimeSeconds;
        bEnemyIsVisible = true;
    }
}

function SetAttractionState()
{
    // End:0x15
    if(Enemy != none)
    {
        GotoState('Fallback');
    }
    // End:0x1c
    else
    {
        GotoState('Roaming');
    }
}

function bool ClearShot(Vector TargetLoc, bool bImmediateFire)
{
    local bool bSeeTarget;

    // End:0x32
    if(Enemy == none || VSize(Enemy.Location - TargetLoc) > float(2000))
    {
        return false;
    }
    bSeeTarget = FastTrace(TargetLoc, Pawn.Location + Pawn.EyeHeight * vect(0.0, 0.0, 1.0));
    // End:0xf6
    if(!bImmediateFire && !bSeeTarget && Pawn.bIsCrouched)
    {
        bSeeTarget = FastTrace(TargetLoc, Pawn.Location + Pawn.default.EyeHeight + Pawn.default.CollisionHeight - Pawn.CollisionHeight * vect(0.0, 0.0, 1.0));
    }
    // End:0x13d
    if(!bSeeTarget || !FastTrace(TargetLoc, Enemy.Location + Enemy.BaseEyeHeight * vect(0.0, 0.0, 1.0)))
    {
    }
    return false;
    // End:0x1d4
    if(Pawn.Weapon.SplashDamage() && VSize(Pawn.Location - TargetLoc) < Pawn.Weapon.GetDamageRadius() || !FastTrace(TargetLoc + vect(0.0, 0.0, 0.90) * Enemy.CollisionHeight, Pawn.Location))
    {
        StopFiring();
        return false;
    }
    return true;
}

function bool CanStakeOut()
{
    local float relstr;

    relstr = RelativeStrength(Enemy);
    // End:0xda
    if(bFrustrated || !bEnemyInfoValid || VSize(Enemy.Location - Pawn.Location) > 0.50 * float(2000) + FRand() * relstr - CombatStyle * float(2000) || Level.TimeSeconds - FMax(LastSeenTime, AcquireTime) > 2.50 + FMax(-1.0, 3.0 * FRand() + float(2) * relstr - CombatStyle) || !ClearShot(LastSeenPos, false))
    {
        return false;
    }
    return true;
}

function CheckIfShouldCrouch(Vector StartPosition, Vector TargetPosition, float Probability)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, X, Y, Z, projStart;

    // End:0x7c
    if(!Pawn.bCanCrouch || !Pawn.bIsCrouched && FRand() > Probability || Skill < float(3) * FRand() || Pawn.Weapon.RecommendSplashDamage())
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    projStart = Pawn.Weapon.GetFireStart(X, Y, Z);
    projStart = projStart + StartPosition - Pawn.Location;
    projStart.Z = projStart.Z - 1.80 * Pawn.CollisionHeight - Pawn.CrouchHeight;
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x159
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = true;
        return;
    }
    projStart.Z = projStart.Z + 1.80 * Pawn.default.CollisionHeight - Pawn.CrouchHeight;
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x1d1
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    Pawn.bWantsToCrouch = true;
}

function bool IsSniping()
{
    return GoalScript != none && GoalScript.bSniping && Pawn.Weapon != none && Pawn.Weapon.bSniping && Pawn.ReachedDestination(GoalScript.GetMoveTarget());
}

function FreeScript()
{
    // End:0x21
    if(GoalScript != none)
    {
        GoalScript.FreeScript();
        GoalScript = none;
    }
}

function bool AssignSquadResponsibility()
{
    // End:0x1a
    if(LastAttractCheck == Level.TimeSeconds)
    {
        return false;
    }
    LastAttractCheck = Level.TimeSeconds;
    return Squad.AssignSquadResponsibility(self);
}

function float RelativeStrength(Pawn Other)
{
    local float compare;
    local int adjustedOther;

    // End:0x44
    if(Pawn == none)
    {
        Warn("Relative strength with no pawn in state " $ string(GetStateName()));
        return 0.0;
    }
    adjustedOther = int(0.50 * float(Other.Health + Other.default.Health));
    compare = 0.010 * float(adjustedOther - Pawn.Health);
    compare = compare - Pawn.AdjustedStrength() + Other.AdjustedStrength();
    // End:0x17d
    if(Pawn.Weapon != none)
    {
        compare -= 0.50 * Pawn.DamageScaling * Pawn.Weapon.CurrentRating;
        // End:0x17d
        if(Pawn.Weapon.AIRating < 0.50)
        {
            compare += 0.30;
            // End:0x17d
            if(Other.Weapon != none && Other.Weapon.AIRating > 0.50)
            {
                compare += 0.30;
            }
        }
    }
    // End:0x1c6
    if(Other.Weapon != none)
    {
        compare += 0.50 * Other.DamageScaling * Other.Weapon.AIRating;
    }
    // End:0x209
    if(Other.Location.Z > Pawn.Location.Z + float(320))
    {
        compare += 0.20;
    }
    // End:0x249
    else
    {
        // End:0x249
        if(Pawn.Location.Z > Other.Location.Z + float(320))
        {
            compare -= 0.150;
        }
    }
    return Pawn.ModifyThreat(compare, Other);
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x15
    if(TriggerScript(Other, EventInstigator))
    {
        return;
    }
    // End:0x3c
    if(Other == Pawn || Pawn.Health <= 0)
    {
        return;
    }
    Squad.SetEnemy(self, EventInstigator);
}

function SetEnemyInfo(bool bNewEnemyVisible)
{
    local Bot B;

    bEnemyEngaged = true;
    // End:0x6c
    if(bNewEnemyVisible)
    {
        AcquireTime = Level.TimeSeconds;
        LastSeenTime = Level.TimeSeconds;
        LastSeenPos = Enemy.Location;
        LastSeeingPos = Pawn.Location;
        bEnemyInfoValid = true;
    }
    // End:0xe8
    else
    {
        LastSeenTime = -1000.0;
        bEnemyInfoValid = false;
        B = Squad.SquadMembers;
        J0x93:
        // End:0xe8 [While If]
        if(B != none)
        {
            // End:0xd1
            if(B.Enemy == Enemy)
            {
                AcquireTime = FMax(AcquireTime, B.AcquireTime);
            }
            B = B.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x93;
        }
    }
}

function EnemyChanged(bool bNewEnemyVisible)
{
    bEnemyAcquired = false;
    SetEnemyInfo(bNewEnemyVisible);
}

function BotVoiceMessage(name MessageType, byte MessageID, Controller Sender)
{
    // End:0x4b
    if(!Level.Game.bTeamGame || Sender.PlayerReplicationInfo.Team != PlayerReplicationInfo.Team)
    {
        return;
    }
    // End:0x72
    if(MessageType == 'Order')
    {
        SetOrders(OrderNames[MessageID], Sender);
    }
}

function bool StrafeFromDamage(float Damage, class<DamageType> DamageType, bool bFindDest);
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
        // End:0x4e
        if(!Pawn.bCanSwim)
        {
            MoveTimer = -1.0;
        }
        // End:0x75
        else
        {
            // End:0x75
            if(Pawn.Physics != 3)
            {
                Pawn.SetPhysics(3);
            }
        }
    }
    // End:0x16b
    else
    {
        // End:0x16b
        if(Pawn.Physics == 3)
        {
            // End:0xb4
            if(Pawn.bCanFly)
            {
                Pawn.SetPhysics(4);
            }
            // End:0x16b
            else
            {
                Pawn.SetPhysics(2);
                // End:0x16b
                if(Pawn.bCanWalk && Abs(Pawn.Acceleration.X) + Abs(Pawn.Acceleration.Y) > float(0) && Destination.Z >= Pawn.Location.Z && Pawn.CheckWaterJump(jumpDir))
                {
                    Pawn.JumpOutOfWater(jumpDir);
                    bNotifyApex = true;
                    bPendingDoubleJump = true;
                }
            }
        }
    }
    return false;
}

event MayDodgeToMoveTarget()
{
    local Vector Dir, X, Y, Z, DodgeV, NewDir;

    local float dist, newdist, RealJumpZ;
    local Actor OldMoveTarget;

    // End:0x3b
    if(Pawn.Physics != 1 || FRand() > 0.850 && RoadPathNode(MoveTarget) == none)
    {
        return;
    }
    // End:0x6e
    if(bTranslocatorHop || Focus != MoveTarget && Skill + Jumpiness < float(6))
    {
        return;
    }
    // End:0xad
    if(Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return;
    }
    Dir = MoveTarget.Location - Pawn.Location;
    dist = VSize(Dir);
    OldMoveTarget = MoveTarget;
    // End:0x24b
    if(dist < float(800) || Dir.Z < float(0))
    {
        // End:0x168
        if(PathNode(MoveTarget) == none && PlayerStart(MoveTarget) == none || MoveTarget != RouteCache[0] || RouteCache[0] == none)
        {
            // End:0x165
            if(dist < float(800))
            {
                return;
            }
        }
        // End:0x24b
        else
        {
            // End:0x24b
            if(RouteCache[1] != none)
            {
                // End:0x1bc
                if(Pawn.Location.Z + 35.0 < RouteCache[1].Location.Z)
                {
                    // End:0x1bc
                    if(dist < float(800))
                    {
                        return;
                    }
                }
                NewDir = RouteCache[1].Location - Pawn.Location;
                newdist = VSize(NewDir);
                // End:0x238
                if(newdist > float(800) && CanMakePathTo(RouteCache[1]))
                {
                    dist = newdist;
                    Dir = NewDir;
                    MoveTarget = RouteCache[1];
                }
                // End:0x24b
                else
                {
                    // End:0x24b
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
    // End:0x2ff
    if(Abs(X Dot Dir) > Abs(Y Dot Dir))
    {
        // End:0x2e6
        if(X Dot Dir > float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 3;
        }
        // End:0x2fc
        else
        {
            UnrealPawn(Pawn).CurrentDir = 4;
        }
    }
    // End:0x342
    else
    {
        // End:0x32c
        if(Y Dot Dir < float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 1;
        }
        // End:0x342
        else
        {
            UnrealPawn(Pawn).CurrentDir = 2;
        }
    }
    bPlannedJump = true;
    Pawn.PerformDodge(UnrealPawn(Pawn).CurrentDir, Normal(Dir), vect(0.0, 0.0, 0.0));
    // End:0x3a3
    if(!bTranslocatorHop)
    {
        bNotifyApex = true;
        bPendingDoubleJump = true;
        bDodgingForward = true;
    }
    // End:0x479
    if(Dir.Z < float(-1) * Pawn.CollisionHeight)
    {
        Pawn.Velocity.Z = 0.0;
        RealJumpZ = Pawn.JumpZ;
        DodgeV = UnrealPawn(Pawn).BotDodge(vect(1.0, 0.0, 0.0));
        Pawn.JumpZ = DodgeV.Z;
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, DodgeV.X);
        Pawn.JumpZ = RealJumpZ;
    }
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
}

event NotifyJumpApex()
{
    local Vector HitLocation, HitNormal, Dir, Extent;
    local Actor HitActor;

    // End:0xc5
    if(bDodgingForward)
    {
        Extent = Pawn.GetCollisionExtent();
        bDodgingForward = false;
        Dir = Pawn.Velocity;
        Dir.Z = 0.0;
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(140) * Normal(Dir) + vect(0.0, 0.0, 32.0), Pawn.Location, false, Extent);
        // End:0xbd
        if(HitActor != none)
        {
            bNotifyApex = false;
            bPendingDoubleJump = false;
            return;
        }
        // End:0xc5
        else
        {
            bPendingDoubleJump = true;
        }
    }
    super.NotifyJumpApex();
}

event NotifyMissedJump()
{
    local NavigationPoint N;
    local Actor OldMoveTarget;
    local Vector Loc2D, NavLoc2D;
    local float BestDist, newdist;

    OldMoveTarget = MoveTarget;
    // End:0x1d
    if(!bHasTranslocator)
    {
        MoveTarget = none;
    }
    // End:0x209
    if(MoveTarget == none)
    {
        // End:0xc1
        if(bHasTranslocator && Skill >= float(2))
        {
            N = Level.NavigationPointList;
            J0x55:
            // End:0xbe [While If]
            if(N != none)
            {
                // End:0xa7
                if(VSize(N.Location - Pawn.Location) < float(1500) && LineOfSightTo(N))
                {
                    MoveTarget = N;
                }
                // End:0xbe
                else
                {
                    N = N.nextNavigationPoint;
                    // This is an implied JumpToken; Continue!
                    goto J0x55;
                }
            }
        }
        // End:0x1f1
        else
        {
            Loc2D = Pawn.Location;
            Loc2D.Z = 0.0;
            N = Level.NavigationPointList;
            J0xf9:
            // End:0x1f1 [While If]
            if(N != none)
            {
                // End:0x1da
                if(N.Location.Z < Pawn.Location.Z)
                {
                    NavLoc2D = N.Location;
                    NavLoc2D.Z = 0.0;
                    newdist = VSize(NavLoc2D - Loc2D);
                    // End:0x1da
                    if(newdist <= Pawn.Location.Z - N.Location.Z && MoveTarget == none || BestDist > newdist && LineOfSightTo(N))
                    {
                        MoveTarget = N;
                        BestDist = newdist;
                    }
                }
                N = N.nextNavigationPoint;
                // This is an implied JumpToken; Continue!
                goto J0xf9;
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
    // End:0x340
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
                // End:0x33a
                if(Pawn.Weapon.IsA('Translauncher'))
                {
                    Pawn.PendingWeapon = none;
                    Pawn.Weapon.SetTimer(0.20, false);
                }
                // End:0x340
                else
                {
                    SwitchToBestWeapon();
                }
            }
        }
    }
    MoveTimer = 1.0;
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
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    bPlannedJump = false;
    ResetSkill();
    Pawn.MaxFallSpeed = 1.10 * Pawn.default.MaxFallSpeed;
    Pawn.SetMovementPhysics();
    // End:0x73
    if(Pawn.Physics == 1)
    {
        Pawn.SetPhysics(2);
    }
    Enable('NotifyBump');
}

function InitializeSkill(float InSkill)
{
    Skill = FClamp(InSkill, 0.0, 7.0);
    ResetSkill();
}

function ResetSkill()
{
    local float AdjustedYaw;

    DeathMatch(Level.Game).TweakSkill(self);
    // End:0x3a
    if(Skill < float(3))
    {
        DodgeToGoalPct = 0.0;
    }
    // End:0x59
    else
    {
        DodgeToGoalPct = 3.0 * Jumpiness + Skill / float(6);
    }
    Aggressiveness = BaseAggressiveness;
    // End:0x9e
    if(Pawn != none)
    {
        Pawn.bCanDoubleJump = Skill >= float(3) && Pawn.CanMultiJump();
    }
    bLeadTarget = Skill >= float(4);
    SetCombatTimer();
    SetPeripheralVision();
    // End:0xe4
    if(Skill + ReactionTime > float(7))
    {
        RotationRate.Yaw = 90000;
    }
    // End:0x152
    else
    {
        // End:0x127
        if(Skill + ReactionTime >= float(4))
        {
            RotationRate.Yaw = int(float(7000) + float(10000) * Skill + ReactionTime);
        }
        // End:0x152
        else
        {
            RotationRate.Yaw = int(float(30000) + float(4000) * Skill + ReactionTime);
        }
    }
    AdjustedYaw = 0.750 + 0.050 * ReactionTime * float(RotationRate.Yaw);
    AcquisitionYawRate = int(AdjustedYaw);
    SetMaxDesiredSpeed();
}

function SetMaxDesiredSpeed()
{
    // End:0x52
    if(Pawn != none)
    {
        // End:0x30
        if(Skill > float(3))
        {
            Pawn.MaxDesiredSpeed = 1.0;
        }
        // End:0x52
        else
        {
            Pawn.MaxDesiredSpeed = 0.60 + 0.10 * Skill;
        }
    }
}

function SetPeripheralVision()
{
    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    // End:0x58
    if(Pawn.bStationary || Pawn.Physics == 4)
    {
        bSlowerZAcquire = false;
        Pawn.PeripheralVision = -0.70;
        return;
    }
    bSlowerZAcquire = true;
    // End:0x85
    if(Skill < float(2))
    {
        Pawn.PeripheralVision = 0.70;
    }
    // End:0xd4
    else
    {
        // End:0xb2
        if(Skill > float(6))
        {
            bSlowerZAcquire = false;
            Pawn.PeripheralVision = -0.20;
        }
        // End:0xd4
        else
        {
            Pawn.PeripheralVision = 1.0 - 0.20 * Skill;
        }
    }
    Pawn.PeripheralVision = FMin(Pawn.PeripheralVision - BaseAlertness, 0.80);
    Pawn.SightRadius = Pawn.default.SightRadius;
}

function SetAlertness(float NewAlertness)
{
    // End:0x58
    if(Pawn.Alertness != NewAlertness)
    {
        Pawn.PeripheralVision += 0.7070 * Pawn.Alertness - NewAlertness;
        Pawn.Alertness = NewAlertness;
    }
}

function WasKilledBy(Controller Other)
{
    local Controller C;

    // End:0xaa
    if(Pawn.bUpdateEyeheight)
    {
        C = Level.ControllerList;
        J0x26:
        // End:0xaa [While If]
        if(C != none)
        {
            // End:0x93
            if(C.IsA('PlayerController') && PlayerController(C).ViewTarget == Pawn && PlayerController(C).RealViewTarget == none)
            {
                PlayerController(C).ViewNextBot();
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x26;
        }
    }
    // End:0xe8
    if(Other != none && Other.Pawn != none)
    {
        LastKillerPosition = Other.Pawn.Location;
    }
}

function WhatToDoNext(byte CallingByte)
{
    // End:0x9a
    if(ChooseAttackTime == Level.TimeSeconds)
    {
        ++ ChooseAttackCounter;
        // End:0x97
        if(ChooseAttackCounter > 3)
        {
            Log("CHOOSEATTACKSERIAL in state " $ string(GetStateName()) $ " enemy " $ GetEnemyName() $ " old enemy " $ GetOldEnemyName() $ " CALLING BYTE " $ string(CallingByte));
        }
    }
    // End:0xb5
    else
    {
        ChooseAttackTime = Level.TimeSeconds;
        ChooseAttackCounter = 0;
    }
    OldEnemy = Enemy;
    ++ ChoosingAttackLevel;
    ExecuteWhatToDoNext();
    -- ChoosingAttackLevel;
    ReTaskTime = 0.0;
}

function string GetOldEnemyName()
{
    // End:0x15
    if(OldEnemy == none)
    {
        return "NONE";
    }
    // End:0x25
    else
    {
        return OldEnemy.GetHumanReadableName();
    }
}

function string GetEnemyName()
{
    // End:0x15
    if(Enemy == none)
    {
        return "NONE";
    }
    // End:0x25
    else
    {
        return Enemy.GetHumanReadableName();
    }
}

function ExecuteWhatToDoNext()
{
    bHasFired = false;
    GoalString = "WhatToDoNext at " $ string(Level.TimeSeconds);
    // End:0x68
    if(Pawn == none)
    {
        Warn(GetHumanReadableName() $ " WhatToDoNext with no pawn");
        return;
    }
    // End:0xdf
    else
    {
        // End:0xdf
        if(Pawn.Weapon == none && Vehicle(Pawn) == none)
        {
            Warn(GetHumanReadableName() $ " WhatToDoNext with no weapon, " $ string(Pawn) $ " health " $ string(Pawn.Health));
        }
    }
    // End:0x1f4
    if(Enemy == none)
    {
        // End:0x1a7
        if(Level.Game.TooManyBots(self))
        {
            // End:0x1a2
            if(Pawn != none)
            {
                // End:0x16f
                if(Vehicle(Pawn) != none && Vehicle(Pawn).Driver != none)
                {
                    Vehicle(Pawn).Driver.KilledBy(Vehicle(Pawn).Driver);
                }
                // End:0x1a2
                else
                {
                    Pawn.Health = 0;
                    Pawn.Died(self, class'Suicided', Pawn.Location);
                }
            }
            Destroy();
            return;
        }
        BlockedPath = none;
        bFrustrated = false;
        // End:0x1f4
        if(Target == none || Pawn(Target) != none && Pawn(Target).Health <= 0)
        {
            StopFiring();
        }
    }
    // End:0x20a
    if(ScriptingOverridesAI() && ShouldPerformScript())
    {
        return;
    }
    // End:0x232
    if(Pawn.Physics == 0)
    {
        Pawn.SetMovementPhysics();
    }
    // End:0x258
    if(Pawn.Physics == 2 && DoWaitForLanding())
    {
        return;
    }
    // End:0x2bb
    if(StartleActor != none && !StartleActor.bDeleteMe && VSize(StartleActor.Location - Pawn.Location) < StartleActor.CollisionRadius)
    {
        Startle(StartleActor);
        return;
    }
    bIgnoreEnemyChange = true;
    // End:0x300
    if(Enemy != none && Enemy.Health <= 0 || Enemy.Controller == none)
    {
        LoseEnemy();
    }
    // End:0x31f
    if(Enemy == none)
    {
        Squad.FindNewEnemyFor(self, false);
    }
    // End:0x383
    else
    {
        // End:0x383
        if(!Squad.MustKeepEnemy(Enemy) && !EnemyVisible())
        {
            // End:0x36f
            if(Squad.IsDefending(self))
            {
                // End:0x36c
                if(LostContact(4.0))
                {
                    LoseEnemy();
                }
            }
            // End:0x383
            else
            {
                // End:0x383
                if(LostContact(7.0))
                {
                    LoseEnemy();
                }
            }
        }
    }
    bIgnoreEnemyChange = false;
    // End:0x3a9
    if(AssignSquadResponsibility())
    {
        // End:0x3a1
        if(Pawn == none)
        {
            return;
        }
        SwitchToBestWeapon();
        return;
    }
    // End:0x3b4
    if(ShouldPerformScript())
    {
        return;
    }
    // End:0x3c8
    if(Enemy != none)
    {
        ChooseAttackMode();
    }
    // End:0x408
    else
    {
        GoalString = "WhatToDoNext Wander or Camp at " $ string(Level.TimeSeconds);
        WanderOrCamp(true);
    }
    SwitchToBestWeapon();
}

function bool DoWaitForLanding()
{
    GotoState('WaitingForLanding');
    return true;
}

function bool EnemyVisible()
{
    // End:0x30
    if(EnemyVisibilityTime == Level.TimeSeconds && VisibleEnemy == Enemy)
    {
        return bEnemyIsVisible;
    }
    VisibleEnemy = Enemy;
    EnemyVisibilityTime = Level.TimeSeconds;
    bEnemyIsVisible = LineOfSightTo(Enemy);
    return bEnemyIsVisible;
}

function VehicleFightEnemy(bool bCanCharge, float EnemyStrength)
{
    // End:0x5d
    if(Pawn.bStationary || Vehicle(Pawn).bKeyVehicle)
    {
        // End:0x50
        if(!EnemyVisible())
        {
            GoalString = "Stake Out";
            DoStakeOut();
        }
        // End:0x5b
        else
        {
            DoRangedAttackOn(Enemy);
        }
        return;
    }
    // End:0xef
    if(!bFrustrated && Pawn.HasWeapon() && Pawn.TooCloseToAttack(Enemy))
    {
        GoalString = "Retreat";
        // End:0xe7
        if(PlayerReplicationInfo.Team != none && FRand() < 0.050)
        {
            SendMessage(none, 'Other', GetMessageIndex('injured'), 15.0, 'Team');
        }
        DoRetreat();
        return;
    }
    // End:0x183
    if(Enemy == FailedHuntEnemy && Level.TimeSeconds == FailedHuntTime || Vehicle(Pawn).bKeyVehicle)
    {
        GoalString = "FAILED HUNT - HANG OUT";
        // End:0x17a
        if(Pawn.HasWeapon() && EnemyVisible())
        {
            DoRangedAttackOn(Enemy);
        }
        // End:0x181
        else
        {
            WanderOrCamp(true);
        }
        return;
    }
    // End:0x29b
    if(!EnemyVisible())
    {
        // End:0x1c9
        if(Squad.MustKeepEnemy(Enemy))
        {
            GoalString = "Hunt priority enemy";
            GotoState('Hunting');
            return;
        }
        GoalString = "Enemy not visible";
        // End:0x22c
        if(!bCanCharge || Squad.IsDefending(self) && LostContact(4.0))
        {
            GoalString = "Stake Out";
            DoStakeOut();
        }
        // End:0x299
        else
        {
            // End:0x286
            if(Aggression < float(1) && !LostContact(3.0 + float(2) * FRand()) || IsSniping() && CanStakeOut())
            {
                GoalString = "Stake Out2";
                DoStakeOut();
            }
            // End:0x299
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
    if(Pawn.bCanFly && !Enemy.bCanFly && FRand() < 0.170 * Skill + Tactics - float(1))
    {
        GoalString = "Do tactical move";
        DoTacticalMove();
        return;
    }
    // End:0x34f
    if(Pawn.RecommendLongRangedAttack())
    {
        GoalString = "Long Ranged Attack";
        DoRangedAttackOn(Enemy);
        return;
    }
    GoalString = "Charge";
    DoCharge();
}

function FightEnemy(bool bCanCharge, float EnemyStrength)
{
    local Vector X, Y, Z;
    local float enemyDist, AdjustedCombatStyle;
    local bool bFarAway, bOldForcedCharge;

    // End:0x66
    if(Squad == none || Enemy == none || Pawn == none)
    {
        Log("HERE 3 Squad " $ string(Squad) $ " Enemy " $ string(Enemy) $ " pawn " $ string(Pawn));
    }
    // End:0x89
    if(Vehicle(Pawn) != none)
    {
        VehicleFightEnemy(bCanCharge, EnemyStrength);
        return;
    }
    // End:0x106
    if(Enemy == FailedHuntEnemy && Level.TimeSeconds == FailedHuntTime)
    {
        GoalString = "FAILED HUNT - HANG OUT";
        // End:0xe4
        if(EnemyVisible())
        {
            bCanCharge = false;
        }
        // End:0x106
        else
        {
            // End:0xfd
            if(FindInventoryGoal(0.0))
            {
                SetAttractionState();
                return;
            }
            // End:0x106
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
    Aggression = 1.50 * FRand() - 0.80 + float(2) * AdjustedCombatStyle - 0.50 * EnemyStrength + FRand() * Normal(Enemy.Velocity - Pawn.Velocity) Dot Normal(Enemy.Location - Pawn.Location);
    // End:0x218
    if(Enemy.Weapon != none)
    {
        Aggression += float(2) * Enemy.Weapon.SuggestDefenseStyle();
    }
    // End:0x235
    if(enemyDist > float(2000))
    {
        Aggression += 0.50;
    }
    // End:0x346
    if(Pawn.Physics == 1 || Pawn.Physics == 2)
    {
        // End:0x2c0
        if(Pawn.Location.Z > Enemy.Location.Z + float(320))
        {
            Aggression = FMax(0.0, Aggression - 1.0 + AdjustedCombatStyle);
        }
        // End:0x346
        else
        {
            // End:0x2ff
            if(Skill < float(4) && enemyDist > 0.650 * float(2000))
            {
                bFarAway = true;
                Aggression += 0.50;
            }
            // End:0x346
            else
            {
                // End:0x346
                if(Pawn.Location.Z < Enemy.Location.Z - Pawn.CollisionHeight)
                {
                    Aggression += CombatStyle;
                }
            }
        }
    }
    // End:0x49d
    if(!EnemyVisible())
    {
        // End:0x38c
        if(Squad.MustKeepEnemy(Enemy))
        {
            GoalString = "Hunt priority enemy";
            GotoState('Hunting');
            return;
        }
        GoalString = "Enemy not visible";
        // End:0x3d6
        if(!bCanCharge)
        {
            GoalString = "Stake Out - no charge";
            DoStakeOut();
        }
        // End:0x49b
        else
        {
            // End:0x42e
            if(Squad.IsDefending(self) && LostContact(4.0) && ClearShot(LastSeenPos, false))
            {
                GoalString = "Stake Out " $ string(LastSeenPos);
                DoStakeOut();
            }
            // End:0x49b
            else
            {
                // End:0x488
                if(Aggression < float(1) && !LostContact(3.0 + float(2) * FRand()) || IsSniping() && CanStakeOut())
                {
                    GoalString = "Stake Out2";
                    DoStakeOut();
                }
                // End:0x49b
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
    // End:0x4f6
    if(Pawn.Weapon.bMeleeWeapon || bCanCharge && bOldForcedCharge)
    {
        GoalString = "Charge";
        DoCharge();
        return;
    }
    // End:0x52f
    if(Pawn.RecommendLongRangedAttack())
    {
        GoalString = "Long Ranged Attack";
        DoRangedAttackOn(Enemy);
        return;
    }
    // End:0x58d
    if(bCanCharge && Skill < float(5) && bFarAway && Aggression > float(1) && FRand() < 0.50)
    {
        GoalString = "Charge closer";
        DoCharge();
        return;
    }
    // End:0x608
    if(Pawn.Weapon.RecommendRangedAttack() || IsSniping() || FRand() > 0.170 * Skill + Tactics - float(1) && !DefendMelee(enemyDist))
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
    if(!Pawn.Weapon.RecommendSplashDamage() && FRand() < 0.70 && float(3) * Jumpiness + FRand() * Skill > float(3))
    {
        GetAxes(Pawn.Rotation, X, Y, Z);
        GoalString = "Try to Duck ";
        // End:0x6f6
        if(FRand() < 0.50)
        {
            Y *= float(-1);
            TryToDuck(Y, true);
        }
        // End:0x702
        else
        {
            TryToDuck(Y, false);
        }
    }
    DoTacticalMove();
}

function DoRangedAttackOn(Actor A)
{
    Target = A;
    GotoState('RangedAttack');
}

function ChooseAttackMode()
{
    local float EnemyStrength, WeaponRating, RetreatThreshold;

    GoalString = " ChooseAttackMode last seen " $ string(Level.TimeSeconds - LastSeenTime);
    // End:0xa3
    if(Squad == none || Enemy == none || Pawn == none)
    {
        Log("HERE 1 Squad " $ string(Squad) $ " Enemy " $ string(Enemy) $ " pawn " $ string(Pawn));
    }
    EnemyStrength = RelativeStrength(Enemy);
    // End:0xd2
    if(Vehicle(Pawn) != none)
    {
        VehicleFightEnemy(true, EnemyStrength);
        return;
    }
    // End:0x1ad
    if(!bFrustrated && !Squad.MustKeepEnemy(Enemy))
    {
        RetreatThreshold = Aggressiveness;
        // End:0x144
        if(Pawn.Weapon.CurrentRating > 0.50)
        {
            RetreatThreshold = RetreatThreshold + 0.350 - Skill * 0.050;
        }
        // End:0x1ad
        if(EnemyStrength > RetreatThreshold)
        {
            GoalString = "Retreat";
            // End:0x1a5
            if(PlayerReplicationInfo.Team != none && FRand() < 0.050)
            {
                SendMessage(none, 'Other', GetMessageIndex('injured'), 15.0, 'Team');
            }
            DoRetreat();
            return;
        }
    }
    // End:0x3a2
    if(Squad.PriorityObjective(self) == 0 && Skill + Tactics > float(2) && EnemyStrength > -0.30 || Pawn.Weapon.AIRating < 0.50)
    {
        // End:0x277
        if(Pawn.Weapon.AIRating < 0.50)
        {
            // End:0x24e
            if(EnemyStrength > 0.30)
            {
                WeaponRating = 0.0;
            }
            // End:0x274
            else
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(2000);
            }
        }
        // End:0x2d5
        else
        {
            // End:0x2af
            if(EnemyStrength > 0.30)
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(2000);
            }
            // End:0x2d5
            else
            {
                WeaponRating = Pawn.Weapon.CurrentRating / float(1000);
            }
        }
        // End:0x3a2
        if(FindInventoryGoal(WeaponRating))
        {
            // End:0x333
            if(InventorySpot(RouteGoal) == none)
            {
                GoalString = "fallback - inventory goal is not pickup but " $ string(RouteGoal);
            }
            // End:0x399
            else
            {
                GoalString = "Fallback to better pickup " $ string(InventorySpot(RouteGoal).markedItem) $ " hidden " $ string(InventorySpot(RouteGoal).markedItem.bHidden);
            }
            GotoState('Fallback');
            return;
        }
    }
    GoalString = "ChooseAttackMode FightEnemy";
    FightEnemy(true, EnemyStrength);
}

function bool FindSuperPickup(float MaxDist)
{
    local Actor BestPath;
    local Pickup P;

    // End:0x42
    if(LastSearchTime == Level.TimeSeconds || !Pawn.bCanPickupInventory || Vehicle(Pawn) != none)
    {
        return false;
    }
    // End:0x82
    if(DeathMatch(Level.Game) != none && !DeathMatch(Level.Game).WantsPickups(self))
    {
        return false;
    }
    LastSearchTime = Level.TimeSeconds;
    LastSearchWeight = -1.0;
    BestPath = FindBestSuperPickup(MaxDist);
    // End:0x17f
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        // End:0xeb
        if(Pickup(RouteGoal) != none)
        {
            P = Pickup(RouteGoal);
        }
        // End:0x114
        else
        {
            // End:0x114
            if(InventorySpot(RouteGoal) != none)
            {
                P = InventorySpot(RouteGoal).markedItem;
            }
        }
        // End:0x17d
        if(P != none && PlayerReplicationInfo.Team != none && PlayerReplicationInfo.Team.TeamIndex < 4)
        {
            P.TeamOwner[PlayerReplicationInfo.Team.TeamIndex] = self;
        }
        return true;
    }
    return false;
}

function bool FindInventoryGoal(float BestWeight)
{
    local Actor BestPath;

    // End:0x2b
    if(LastSearchTime == Level.TimeSeconds && LastSearchWeight >= BestWeight)
    {
        return false;
    }
    // End:0x6b
    if(DeathMatch(Level.Game) != none && !DeathMatch(Level.Game).WantsPickups(self))
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
    // End:0xdb
    if(Skill > float(3) && Enemy == none)
    {
        RespawnPredictionTime = 4.0;
    }
    // End:0xe6
    else
    {
        RespawnPredictionTime = 0.0;
    }
    BestPath = FindBestInventoryPath(BestWeight);
    // End:0x10c
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        return true;
    }
    return false;
}

function bool PickRetreatDestination()
{
    local Actor BestPath;

    // End:0x10
    if(FindInventoryGoal(0.0))
    {
        return true;
    }
    // End:0x71
    if(RouteGoal == none || Pawn.Anchor == RouteGoal || Pawn.ReachedDestination(RouteGoal))
    {
        RouteGoal = FindRandomDest();
        BestPath = RouteCache[0];
        // End:0x71
        if(RouteGoal == none)
        {
            return false;
        }
    }
    // End:0xab
    if(BestPath == none)
    {
        BestPath = FindPathToward(RouteGoal, Pawn.bCanPickupInventory && Vehicle(Pawn) == none);
    }
    // End:0xc3
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        return true;
    }
    RouteGoal = none;
    return false;
}

event SoakStop(string problem)
{
    local UnrealPlayer PC;

    Log(problem);
    SoakString = problem;
    GoalString = SoakString @ GoalString;
    // End:0x4c
    foreach DynamicActors(class'UnrealPlayer', PC)
    {
        PC.SoakPause(Pawn);
        // End:0x4c
        break;                
    }
}

function bool FindRoamDest()
{
    local Actor BestPath;

    // End:0x1c6
    if(Pawn.FindAnchorFailedTime == Level.TimeSeconds)
    {
        GoalString = "No anchor " $ string(Level.TimeSeconds);
        // End:0x1c4
        if(Pawn.LastValidAnchorTime > float(5))
        {
            // End:0x84
            if(bSoaking)
            {
                SoakStop("NO PATH AVAILABLE!!!");
            }
            // End:0x1c4
            else
            {
                // End:0x13a
                if(NumRandomJumps > 4 || PhysicsVolume.bWaterVolume)
                {
                    Pawn.Health = 0;
                    // End:0x112
                    if(Vehicle(Pawn) != none && Vehicle(Pawn).Driver != none)
                    {
                        Vehicle(Pawn).Driver.KilledBy(Vehicle(Pawn).Driver);
                    }
                    // End:0x135
                    else
                    {
                        Pawn.Died(self, class'Suicided', Pawn.Location);
                    }
                    return true;
                }
                // End:0x1c4
                else
                {
                    ++ NumRandomJumps;
                    // End:0x1c4
                    if(Vehicle(Pawn) == none && Pawn.Physics != 2)
                    {
                        Pawn.SetPhysics(2);
                        Pawn.Velocity = 0.50 * Pawn.GroundSpeed * VRand();
                        Pawn.Velocity.Z = Pawn.JumpZ;
                    }
                }
            }
        }
        return false;
    }
    NumRandomJumps = 0;
    GoalString = "Find roam dest " $ string(Level.TimeSeconds);
    // End:0x2d2
    if(RouteGoal == none || Pawn.Anchor == RouteGoal || Pawn.ReachedDestination(RouteGoal))
    {
        Squad.SetFreelanceScriptFor(self);
        // End:0x26e
        if(GoalScript != none)
        {
            RouteGoal = GoalScript.GetMoveTarget();
            BestPath = none;
        }
        // End:0x284
        else
        {
            RouteGoal = FindRandomDest();
            BestPath = RouteCache[0];
        }
        // End:0x2d2
        if(RouteGoal == none)
        {
            // End:0x2d0
            if(bSoaking && Physics != 2)
            {
                SoakStop("COULDN'T FIND ROAM DESTINATION");
            }
            return false;
        }
    }
    // End:0x2ec
    if(BestPath == none)
    {
        BestPath = FindPathToward(RouteGoal, false);
    }
    // End:0x30a
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        SetAttractionState();
        return true;
    }
    // End:0x351
    if(bSoaking && Physics != 2)
    {
        SoakStop("COULDN'T FIND ROAM PATH TO " $ string(RouteGoal));
    }
    RouteGoal = none;
    FreeScript();
    return false;
}

function bool TestDirection(Vector Dir, out Vector pick)
{
    local Vector HitLocation, HitNormal, dist;
    local Actor HitActor;

    pick = Dir * float(200) + float(2 * 200) * FRand();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location + pick + 1.50 * Pawn.CollisionRadius * Dir, Pawn.Location, false);
    // End:0xce
    if(HitActor != none)
    {
        pick = HitLocation + HitNormal - Dir * float(2) * Pawn.CollisionRadius;
        // End:0xcb
        if(!FastTrace(pick, Pawn.Location))
        {
            return false;
        }
    }
    // End:0xe9
    else
    {
        pick = Pawn.Location + pick;
    }
    dist = pick - Pawn.Location;
    // End:0x12d
    if(Pawn.Physics == 1)
    {
        dist.Z = 0.0;
    }
    return VSize(dist) > float(200);
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
}

function bool CheckPathToGoalAround(Pawn P)
{
    return false;
}

function CancelCampFor(Controller C);
function ClearPathFor(Controller C)
{
    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return;
    }
    // End:0x2b
    if(AdjustAround(C.Pawn))
    {
        return;
    }
    // End:0x5f
    if(Enemy != none)
    {
        // End:0x5c
        if(EnemyVisible() && Pawn.bCanStrafe)
        {
            GotoState('TacticalMove');
            return;
        }
    }
    // End:0xad
    else
    {
        // End:0xad
        if(Stopped() && !Pawn.bStationary)
        {
            DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
        }
    }
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
    VelDir.Z = 0.0;
    OtherDir = Other.Location - Pawn.Location;
    OtherDir.Z = 0.0;
    OtherDir = Normal(OtherDir);
    // End:0x14d
    if(VelDir Dot OtherDir > 0.80)
    {
        bAdjusting = true;
        SideDir.X = VelDir.Y;
        SideDir.Y = -1.0 * VelDir.X;
        // End:0x10d
        if(SideDir Dot OtherDir > float(0))
        {
            SideDir *= float(-1);
        }
        AdjustLoc = Pawn.Location + 1.50 * Other.CollisionRadius * 0.50 * VelDir + SideDir;
    }
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
    // End:0x6c
    else
    {
        GotoState('RestFormation', 'Begin');
    }
}

event bool NotifyBump(Actor Other)
{
    local Pawn P;
    local Vehicle V;

    // End:0xcb
    if(Vehicle(Other) != none && Vehicle(Pawn) == none)
    {
        // End:0xcb
        if(Other == RouteGoal || Vehicle(RouteGoal) != none && Other == Vehicle(RouteGoal).GetVehicleBase())
        {
            V = Vehicle(Other).FindEntryVehicle(Pawn);
            // End:0xc9
            if(V != none)
            {
                V.UsedBy(Pawn);
                // End:0xc9
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
    if(P == none || P.Controller == none || Enemy == P)
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
    // End:0x17d
    if(!AdjustAround(P))
    {
        CancelCampFor(P.Controller);
    }
    return false;
}

function bool PriorityObjective()
{
    return Squad.PriorityObjective(self) > 0;
}

function SetFall()
{
    // End:0x22
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
        return;
    }
    // End:0x4a
    if(Pawn.bNoJumpAdjust)
    {
        Pawn.bNoJumpAdjust = false;
        return;
    }
    // End:0xa1
    else
    {
        bPlannedJump = true;
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, Pawn.GroundSpeed);
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    }
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
        Vel2D.Z = 0.0;
        // End:0xcf
        if(Vel2D Dot MoveTarget.Location - Pawn.Location < float(0))
        {
            Pawn.Acceleration = vect(0.0, 0.0, 0.0);
            // End:0xc1
            if(NavigationPoint(MoveTarget) != none)
            {
                Pawn.Anchor = NavigationPoint(MoveTarget);
            }
            MoveTimer = -1.0;
        }
        // End:0x175
        else
        {
            // End:0x175
            if(RoadPathNode(MoveTarget) != none && InLatentExecution(503) && FRand() < 0.850 && FRand() < DodgeToGoalPct && Pawn.Location.Z + 35.0 >= MoveTarget.Location.Z && VSize(MoveTarget.Location - Pawn.Location) > float(800))
            {
                bNotifyPostLanded = true;
            }
        }
    }
    return false;
}

event NotifyPostLanded()
{
    bNotifyPostLanded = false;
    // End:0x6b
    if(Pawn != none && Pawn.Physics == 1 && CurrentPath != none && CurrentPath.reachFlags & 257 == CurrentPath.reachFlags)
    {
        MayDodgeToMoveTarget();
    }
}

function bool StartMoveToward(Actor o)
{
    // End:0xd4
    if(MoveTarget == none)
    {
        // End:0x46
        if(o == Enemy && o != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0x9a
        if(bSoaking && Pawn.Physics != 2)
        {
            SoakStop("COULDN'T FIND ROUTE TO " $ o.GetHumanReadableName());
        }
        GoalString = "No path to " $ o.GetHumanReadableName() @ "(" $ string(o) $ ")";
    }
    // End:0xda
    else
    {
        SetAttractionState();
    }
    return MoveTarget != none;
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
}

event bool AllowDetourTo(NavigationPoint N)
{
    return Squad.AllowDetourTo(self, N);
}

function bool FindBestPathToward(Actor A, bool bCheckedReach, bool bAllowDetour)
{
    local Vehicle VBase;

    // End:0x26
    if(!bCheckedReach && actorReachable(A))
    {
        MoveTarget = A;
    }
    // End:0x72
    else
    {
        MoveTarget = FindPathToward(A, bAllowDetour && Pawn.bCanPickupInventory && Vehicle(Pawn) == none && NavigationPoint(A) != none);
    }
    // End:0x82
    if(MoveTarget != none)
    {
        return true;
    }
    // End:0x29e
    else
    {
        // End:0x21c
        if(Vehicle(Pawn) != none)
        {
            // End:0xd0
            if(Pawn.Physics == 4)
            {
                // End:0xcd
                if(A == Enemy && A != none)
                {
                    LoseEnemy();
                }
            }
            // End:0x21c
            else
            {
                // End:0x21c
                if(!Vehicle(Pawn).bKeyVehicle)
                {
                    // End:0x165
                    if(Pawn.bStationary)
                    {
                        // End:0x150
                        if(Vehicle(Pawn) != none && Vehicle(Pawn).StronglyRecommended(Squad, Squad.Team.TeamIndex, Squad.SquadObjective))
                        {
                            return false;
                        }
                        VBase = Pawn.GetVehicleBase();
                    }
                    // End:0x21c
                    if(VBase == none || VBase.Controller == none)
                    {
                        Vehicle(Pawn).VehicleLostTime = Level.TimeSeconds + float(20);
                        DirectionHint = Normal(A.Location - Pawn.Location);
                        Vehicle(Pawn).KDriverLeave(false);
                        MoveTarget = FindPathToward(A, bAllowDetour && NavigationPoint(A) != none);
                        // End:0x21c
                        if(MoveTarget != none)
                        {
                            return true;
                        }
                    }
                }
            }
        }
        // End:0x257
        if(A == Enemy && A != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0x29e
        if(bSoaking && Physics != 2)
        {
            SoakStop("COULDN'T FIND BEST PATH TO " $ string(A));
        }
    }
    return false;
}

function bool NeedToTurn(Vector targ)
{
    return Pawn.NeedToTurn(targ);
}

function bool NearWall(float walldist)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewSpot, ViewDist, LookDir;

    LookDir = vector(Rotation);
    ViewSpot = Pawn.Location + Pawn.BaseEyeHeight * vect(0.0, 0.0, 1.0);
    ViewDist = LookDir * walldist;
    HitActor = Trace(HitLocation, HitNormal, ViewSpot + ViewDist, ViewSpot, false);
    // End:0x84
    if(HitActor == none)
    {
        return false;
    }
    ViewDist = Normal(HitNormal Cross vect(0.0, 0.0, 1.0)) * walldist;
    // End:0xc1
    if(FRand() < 0.50)
    {
        ViewDist *= float(-1);
    }
    Focus = none;
    // End:0xfc
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
    FocalPoint = Pawn.Location - LookDir * float(300);
    return true;
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
    // End:0x5a
    if(Pawn.Acceleration == vect(0.0, 0.0, 0.0))
    {
        FutureLoc = Pawn.Location;
    }
    // End:0x97
    else
    {
        FutureLoc = Pawn.Location + Pawn.GroundSpeed * Normal(Pawn.Acceleration) * DeltaTime;
    }
    // End:0xd0
    if(Pawn.Base != none)
    {
        FutureLoc += Pawn.Base.Velocity * DeltaTime;
    }
    // End:0x108
    if(!FastTrace(FutureLoc, Pawn.Location) && Pawn.Physics != 2)
    {
        return false;
    }
    // End:0x13a
    if(FastTrace(Target.Location + Target.Velocity * DeltaTime, FutureLoc))
    {
        return true;
    }
    return false;
}

function float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
    local float aimdist, desireddist, NewAngle;
    local Vector VelDir, AccelDir;

    // End:0x1a
    if(Target.IsA('ONSMortarCamera'))
    {
        return 0.0;
    }
    // End:0x52
    if(Pawn(Target) != none)
    {
        // End:0x52
        if(Pawn(Target).Visibility < 2)
        {
            AimError *= 2.50;
        }
    }
    AimError = AimError * FMin(5.0, 12.0 - float(11) * Normal(Target.Location - Pawn.Location) Dot Normal(Target.Location + 1.20 * Target.Velocity - Pawn.Location + Pawn.Velocity));
    // End:0x12a
    if(Pawn(Target) != none && Pawn(Target).bStationary)
    {
        AimError *= 0.150;
        return float(Rand(int(float(2) * AimError))) - AimError;
    }
    // End:0x13f
    if(bDefendMelee)
    {
        AimError *= 0.50;
    }
    // End:0x189
    if(Target.Velocity == vect(0.0, 0.0, 0.0))
    {
        AimError *= 0.20 + 0.10 * float(7) - FMin(7.0, Skill);
    }
    // End:0x225
    else
    {
        // End:0x225
        if(Skill + Accuracy > float(5))
        {
            VelDir = Target.Velocity;
            VelDir.Z = 0.0;
            AccelDir = Target.Acceleration;
            AccelDir.Z = 0.0;
            // End:0x225
            if(AccelDir == vect(0.0, 0.0, 0.0) || Normal(VelDir) Dot Normal(AccelDir) > 0.950)
            {
                AimError *= 0.80;
            }
        }
    }
    // End:0x342
    if(Stopped() && Level.TimeSeconds > StopStartTime)
    {
        // End:0x269
        if(Skill + Accuracy > float(4))
        {
            AimError *= 0.750;
        }
        // End:0x2f3
        if(Pawn.Weapon != none && Pawn.Weapon.bSniping)
        {
            AimError *= FClamp(1.50 - 0.080 * FMin(Skill, 7.0) - 0.80 * FRand() / Level.TimeSeconds - StopStartTime + 0.40, 0.30, 1.0);
        }
        // End:0x342
        else
        {
            AimError *= FClamp(2.0 - 0.080 * FMin(Skill, 7.0) - FRand() / Level.TimeSeconds - StopStartTime + 0.40, 0.70, 1.0);
        }
    }
    // End:0x385
    if(!bDefendMelee)
    {
        AimError *= 3.30 - 0.380 * FClamp(Skill + Accuracy, 0.0, 8.0) + 0.50 * FRand();
    }
    // End:0x3d7
    if(Skill < float(6) || FRand() < 0.50 && Level.TimeSeconds - Pawn.LastPainTime < 0.20)
    {
        AimError *= 1.30;
    }
    // End:0x42c
    if(Pawn.Physics == 2 || Target.Physics == 2)
    {
        AimError *= 1.60 - 0.040 * Skill + Accuracy;
    }
    // End:0x487
    if(AcquireTime > Level.TimeSeconds - 0.50 - 0.50 * float(7) - FMin(7.0, Skill))
    {
        AimError *= 1.50;
        // End:0x487
        if(bInstantProj)
        {
            AimError *= 1.50;
        }
    }
    AimError = 2.0 * AimError * FRand() - AimError;
    // End:0x560
    if(Abs(AimError) > float(700))
    {
        // End:0x4ce
        if(bInstantProj)
        {
            desireddist = 100.0;
        }
        // End:0x4d9
        else
        {
            desireddist = 320.0;
        }
        desireddist += Target.CollisionRadius;
        aimdist = Tan(0.0000960 * AimError) * TargetDist;
        // End:0x560
        if(Abs(aimdist) > desireddist)
        {
            NewAngle = Atan(desireddist, TargetDist) / 0.0000960;
            // End:0x54e
            if(AimError > float(0))
            {
                AimError = NewAngle;
            }
            // End:0x560
            else
            {
                AimError = -1.0 * NewAngle;
            }
        }
    }
    return AimError;
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
    // End:0x7a
    if(Pawn(Target) != none)
    {
        Target = Pawn(Target).GetAimTarget();
    }
    FireSpot = Target.Location;
    TargetDist = VSize(Target.Location - Pawn.Location);
    // End:0x124
    if(Pawn(Target) == none)
    {
        // End:0xef
        if(!FiredAmmunition.bTossed)
        {
            return rotator(Target.Location - projStart);
        }
        // End:0x124
        else
        {
            FireDir = AdjustToss(projSpeed, projStart, Target.Location, true);
            SetRotation(rotator(FireDir));
            return Rotation;
        }
    }
    bLeadTargetNow = FiredAmmunition.bLeadTarget && bLeadTarget;
    bDefendMelee = Target == Enemy && DefendMelee(TargetDist);
    AimError = int(AdjustAimError(float(AimError), TargetDist, bDefendMelee, FiredAmmunition.bInstantHit, bLeadTargetNow));
    // End:0x4a5
    if(bLeadTargetNow)
    {
        TargetVel = Target.Velocity;
        TravelTime = TargetDist / projSpeed;
        // End:0x32a
        if(Target.Physics == 2)
        {
            // End:0x273
            if(Target.PhysicsVolume.Gravity.Z <= Target.PhysicsVolume.default.Gravity.Z)
            {
                TargetVel.Z = FMin(TargetVel.Z + FMax(-400.0, Target.PhysicsVolume.Gravity.Z * FMin(1.0, TargetDist / projSpeed)), 0.0);
            }
            // End:0x32a
            else
            {
                TargetVel.Z = TargetVel.Z + 0.50 * TravelTime * Target.PhysicsVolume.Gravity.Z;
                FireSpot = Target.Location + TravelTime * TargetVel;
                HitActor = Trace(HitLocation, HitNormal, FireSpot, Target.Location, false);
                bLeadTargetNow = false;
                // End:0x32a
                if(HitActor != none)
                {
                    FireSpot = HitLocation + vect(0.0, 0.0, 2.0);
                }
            }
        }
        // End:0x389
        if(bLeadTargetNow)
        {
            FireSpot += FMin(1.0, 0.70 + 0.60 * FRand()) * TargetVel * TravelTime;
            FireSpot.Z = FMin(Target.Location.Z, FireSpot.Z);
        }
        // End:0x441
        if(Target.Physics != 2 && FRand() < 0.550 && VSize(FireSpot - projStart) > float(1000))
        {
            TargetLook = Target.Rotation;
            // End:0x405
            if(Target.Physics == 1)
            {
                TargetLook.Pitch = 0;
            }
            bClean = vector(TargetLook) Dot Normal(Target.Velocity) >= 0.710 && FastTrace(FireSpot, projStart);
        }
        // End:0x455
        else
        {
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x4a5
        if(!bClean)
        {
            // End:0x483
            if(FRand() < 0.30)
            {
                FireSpot = Target.Location;
            }
            // End:0x4a5
            else
            {
                FireSpot = 0.50 * FireSpot + Target.Location;
            }
        }
    }
    bClean = false;
    // End:0x64d
    if(FiredAmmunition.bTrySplash && Pawn(Target) != none && Skill >= float(4) || bDefendMelee && Target.Physics == 2 && Pawn.Location.Z + float(80) >= Target.Location.Z || Pawn.Location.Z + float(19) >= Target.Location.Z && bDefendMelee || Skill > 6.50 * FRand() - 0.50)
    {
        HitActor = Trace(HitLocation, HitNormal, FireSpot - vect(0.0, 0.0, 1.0) * Target.CollisionHeight + float(6), FireSpot, false);
        bClean = HitActor == none;
        // End:0x61e
        if(!bClean)
        {
            FireSpot = HitLocation + vect(0.0, 0.0, 3.0);
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x64d
        else
        {
            bClean = Target.Physics == 2 && FastTrace(FireSpot, projStart);
        }
    }
    // End:0x6ec
    if(Pawn.Weapon != none && Pawn.Weapon.bSniping && Stopped() && Skill > float(5) + float(6) * FRand())
    {
        FireSpot.Z = Target.Location.Z + 0.90 * Target.CollisionHeight;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x729
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x7b5
    if(FiredAmmunition.bTossed && !bClean && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7ad
        if(HitActor != none)
        {
            bCanFire = false;
            FireSpot += float(2) * Target.CollisionHeight * HitNormal;
        }
        bClean = true;
    }
    // End:0x809
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z + 0.90 * Target.CollisionHeight;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x99b
    if(!bClean && Target == Enemy && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        // End:0x87e
        if(Pawn.Location.Z >= LastSeenPos.Z)
        {
            FireSpot.Z -= 0.40 * Enemy.CollisionHeight;
        }
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x99b
        if(HitActor != none)
        {
            FireSpot = LastSeenPos + float(2) * Enemy.CollisionHeight * HitNormal;
            // End:0x95b
            if(Pawn.Weapon != none && Pawn.Weapon.SplashDamage() && Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x95b
                if(HitActor != none)
                {
                    FireSpot += float(2) * Enemy.CollisionHeight * HitNormal;
                }
            }
            // End:0x99b
            if(Pawn.Weapon != none && Pawn.Weapon.RefireRate() < 0.990)
            {
                bCanFire = false;
            }
        }
    }
    // End:0x9c8
    if(FiredAmmunition.bTossed)
    {
        FireDir = AdjustToss(projSpeed, projStart, FireSpot, true);
    }
    // End:0xa1b
    else
    {
        FireDir = FireSpot - projStart;
        // End:0xa1b
        if(Pawn(Target) != none)
        {
            FireDir = FireDir + Pawn(Target).GetTargetLocation() - Target.Location;
        }
    }
    FireRotation = rotator(FireDir);
    realYaw = FireRotation.Yaw;
    FireRotation.Yaw = SetFireYaw(FireRotation.Yaw + AimError);
    FireDir = vector(FireRotation);
    FireDist = FMin(VSize(FireSpot - projStart), 400.0);
    FireSpot = projStart + FireDist * FireDir;
    HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
    // End:0xbda
    if(HitActor != none)
    {
        // End:0xb39
        if(HitNormal.Z < 0.70)
        {
            FireRotation.Yaw = SetFireYaw(realYaw - AimError);
            FireDir = vector(FireRotation);
            FireSpot = projStart + FireDist * FireDir;
            HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        }
        // End:0xbda
        if(HitActor != none)
        {
            FireSpot += HitNormal * float(2) * Target.CollisionHeight;
            // End:0xbb9
            if(Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0xbb9
                if(HitActor != none)
                {
                    FireSpot += Target.CollisionHeight * HitNormal;
                }
            }
            FireDir = Normal(FireSpot - projStart);
            FireRotation = rotator(FireDir);
        }
    }
    InstantWarnTarget(Target, FiredAmmunition, vector(FireRotation));
    ShotTarget = Pawn(Target);
    SetRotation(FireRotation);
    return FireRotation;
}

event DelayedWarning()
{
    local Vector X, Y, Z, Dir, LineDist, FuturePos,
	    HitLocation, HitNormal;

    local Actor HitActor;
    local float dist;

    // End:0x3c
    if(Pawn == none || WarningProjectile == none || WarningProjectile.Velocity == vect(0.0, 0.0, 0.0))
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
    FuturePos = Pawn.Location + Pawn.Velocity * VSize(WarningProjectile.Location - Pawn.Location) / VSize(WarningProjectile.Velocity);
    LineDist = FuturePos - WarningProjectile.Location + Dir Dot FuturePos - WarningProjectile.Location * Dir;
    dist = VSize(LineDist);
    // End:0x142
    if(dist > float(230) + Pawn.CollisionRadius)
    {
        return;
    }
    // End:0x218
    if(dist > 1.20 * Pawn.CollisionHeight)
    {
        // End:0x17a
        if(WarningProjectile.Damage <= float(40))
        {
            return;
        }
        // End:0x218
        if(WarningProjectile.Physics == 6 && dist > Pawn.CollisionHeight + float(100) && !WarningProjectile.IsA('ShockProjectile'))
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
    X.Z = 0.0;
    Dir = WarningProjectile.Location - Pawn.Location;
    Dir.Z = 0.0;
    // End:0x297
    if(Normal(Dir) Dot Normal(X) < 0.70)
    {
        return;
    }
    // End:0x2d1
    if(WarningProjectile.Velocity Dot Y > float(0))
    {
        Y *= float(-1);
        TryToDuck(Y, true);
    }
    // End:0x2dd
    else
    {
        TryToDuck(Y, false);
    }
}

function ReceiveProjectileWarning(Projectile proj)
{
    local float enemyDist, projTime;
    local Vector X, Y, Z, enemyDir;

    LastUnderFire = Level.TimeSeconds;
    // End:0xbc
    if(Pawn.Health <= 0 || Skill < float(2) || Enemy == none || Pawn.Physics == 3 || Level.NetMode == 0 && PlayerReplicationInfo.HasFlag == none && Level.TimeSeconds - Pawn.LastRenderTime > float(3))
    {
        return;
    }
    enemyDist = VSize(proj.Location - Pawn.Location);
    // End:0x303
    if(proj.Speed > float(0))
    {
        projTime = enemyDist / proj.Speed;
        // End:0x139
        if(projTime < 0.350 - 0.030 * Skill + ReactionTime)
        {
            return;
        }
        // End:0x169
        if(projTime < float(2) - 0.2650 + FRand() * 0.20 * Skill + ReactionTime)
        {
            return;
        }
        // End:0x1b2
        if(WarningProjectile != none && VSize(WarningProjectile.Location - Pawn.Location) / WarningProjectile.Speed < projTime)
        {
            return;
        }
        // End:0x244
        if(projTime < 1.20 || WarningProjectile != none)
        {
            GetAxes(Rotation, X, Y, Z);
            enemyDir = proj.Location - Pawn.Location;
            enemyDir.Z = 0.0;
            X.Z = 0.0;
            // End:0x244
            if(Normal(enemyDir) Dot Normal(X) < 0.70)
            {
                return;
            }
        }
        // End:0x2aa
        if(Skill + ReactionTime >= float(7))
        {
            WarningDelay = Level.TimeSeconds + FMax(0.080, FMax(0.350 - 0.0250 * Skill + ReactionTime * float(1) + FRand(), projTime - 0.650));
        }
        // End:0x2f8
        else
        {
            WarningDelay = Level.TimeSeconds + FMax(0.080, FMax(0.350 - 0.020 * Skill + ReactionTime * float(1) + FRand(), projTime - 0.650));
        }
        WarningProjectile = proj;
    }
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    LastUnderFire = Level.TimeSeconds;
    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
}

function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
    local float enemyDist, projTime;
    local Vector X, Y, Z, enemyDir;
    local bool bResult;

    LastUnderFire = Level.TimeSeconds;
    // End:0x54
    if(Pawn.bStationary || !Pawn.bCanStrafe || Pawn.Health <= 0)
    {
        return;
    }
    // End:0x76
    if(Enemy == none)
    {
        Squad.SetEnemy(self, shooter);
        return;
    }
    // End:0xd8
    if(Skill < float(4) || Pawn.Physics == 2 || Pawn.Physics == 3 || FRand() > 0.20 * Skill - 0.330)
    {
        return;
    }
    enemyDist = VSize(shooter.Location - Pawn.Location);
    // End:0x130
    if(enemyDist > float(2000) && Vehicle(shooter) == none && !Stopped())
    {
        return;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    enemyDir = shooter.Location - Pawn.Location;
    enemyDir.Z = 0.0;
    X.Z = 0.0;
    // End:0x1af
    if(Normal(enemyDir) Dot Normal(X) < 0.70)
    {
        return;
    }
    // End:0x224
    if(projSpeed > float(0) && Vehicle(shooter) == none)
    {
        projTime = enemyDist / projSpeed;
        // End:0x224
        if(projTime < 0.110 + 0.150 * FRand())
        {
            // End:0x222
            if(Stopped() && Pawn.MaxRotation == float(0))
            {
                GotoState('TacticalMove');
            }
            return;
        }
    }
    // End:0x266
    if(FRand() * Skill + float(4) < float(4))
    {
        // End:0x264
        if(Stopped() && Pawn.MaxRotation == float(0))
        {
            GotoState('TacticalMove');
        }
        return;
    }
    // End:0x29e
    if(FireDir Dot Y > float(0))
    {
        Y *= float(-1);
        bResult = TryToDuck(Y, true);
    }
    // End:0x2b1
    else
    {
        bResult = TryToDuck(Y, false);
    }
    // End:0x2eb
    if(bResult && projSpeed > float(0) && Vehicle(shooter) != none)
    {
        bNotifyApex = true;
        bPendingDoubleJump = true;
    }
}

event NotifyFallingHitWall(Vector HitNormal, Actor HitActor)
{
    bNotifyFallingHitWall = false;
    TryWallDodge(HitNormal, HitActor);
}

event MissedDodge()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, Extent, Vel2D;

    // End:0x4a
    if(Pawn.CanDoubleJump() && Abs(Pawn.Velocity.Z) < float(100))
    {
        Pawn.DoDoubleJump(false);
        bPendingDoubleJump = false;
    }
    Extent = Pawn.CollisionRadius * vect(1.0, 1.0, 0.0);
    Extent.Z = Pawn.CollisionHeight;
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location - float(20) + float(3) * 35.0 * vect(0.0, 0.0, 1.0), Pawn.Location, false, Extent);
    Vel2D = Pawn.Velocity;
    Vel2D.Z = 0.0;
    // End:0x16f
    if(HitActor != none)
    {
        Pawn.Acceleration = float(-1) * Pawn.AccelRate * Normal(Vel2D);
        Pawn.Velocity.X = 0.0;
        Pawn.Velocity.Z = 0.0;
        return;
    }
    Pawn.Acceleration = Pawn.AccelRate * Normal(Vel2D);
}

function bool TryWallDodge(Vector HitNormal, Actor HitActor)
{
    local Vector X, Y, Z, Dir, TargetDir, NewHitNormal,
	    HitLocation, Extent;

    local float DP;
    local Actor NewHitActor;

    // End:0x44
    if(!Pawn.bCanWallDodge || Abs(HitNormal.Z) > 0.70 || !HitActor.bWorldGeometry)
    {
        return false;
    }
    // End:0x73
    if(Pawn.Velocity.Z < float(-150) && FRand() < 0.40)
    {
        return false;
    }
    Extent = Pawn.CollisionRadius * vect(1.0, 1.0, 0.0);
    Extent.Z = 0.50 * Pawn.CollisionHeight;
    NewHitActor = Trace(HitLocation, NewHitNormal, Pawn.Location - float(32) * HitNormal, Pawn.Location, false, Extent);
    // End:0x105
    if(NewHitActor == none)
    {
        return false;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    Dir = HitNormal;
    Dir.Z = 0.0;
    Dir = Normal(Dir);
    // End:0x222
    if(InLatentExecution(503))
    {
        TargetDir = MoveTarget.Location - Pawn.Location;
        TargetDir.Z = 0.0;
        TargetDir = Normal(TargetDir);
        DP = HitNormal Dot TargetDir;
        // End:0x222
        if(DP >= float(0) && VSize(MoveTarget.Location - Pawn.Location) > float(200))
        {
            // End:0x217
            if(DP < 0.70)
            {
                Dir = Normal(TargetDir + HitNormal * float(1) - DP);
            }
            // End:0x222
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
        if(X Dot Dir > float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 3;
        }
        // End:0x286
        else
        {
            UnrealPawn(Pawn).CurrentDir = 4;
        }
    }
    // End:0x2cc
    else
    {
        // End:0x2b6
        if(Y Dot Dir < float(0))
        {
            UnrealPawn(Pawn).CurrentDir = 1;
        }
        // End:0x2cc
        else
        {
            UnrealPawn(Pawn).CurrentDir = 2;
        }
    }
    bPlannedJump = true;
    Pawn.PerformDodge(UnrealPawn(Pawn).CurrentDir, Dir, Normal(Dir Cross vect(0.0, 0.0, 1.0)));
    return true;
}

function ChangeStrafe();
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
    if(Stopped() && Pawn.MaxRotation == float(0))
    {
        GotoState('TacticalMove');
    }
    // End:0x7a
    else
    {
        // End:0x7a
        if(FRand() < 0.60)
        {
            bChangeStrafe = IsStrafing();
        }
    }
    // End:0x101
    if(Skill < float(3) || Pawn.PhysicsVolume.bWaterVolume || Pawn.Physics == 2 || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return false;
    }
    // End:0x144
    if(Pawn.bIsCrouched || Pawn.bWantsToCrouch || Pawn.Physics != 1)
    {
        return false;
    }
    duckDir.Z = 0.0;
    duckDir *= float(335);
    bDuckLeft = bReversed;
    Extent = Pawn.GetCollisionExtent();
    Start = Pawn.Location + vect(0.0, 0.0, 25.0);
    HitActor = Trace(HitLocation, HitNormal, Start + duckDir, Start, false, Extent);
    minDist = 150.0;
    dist = VSize(HitLocation - Pawn.Location);
    // End:0x292
    if(HitActor == none || dist > float(150))
    {
        // End:0x231
        if(HitActor == none)
        {
            HitLocation = Start + duckDir;
        }
        HitActor = Trace(HitLocation, HitNormal, HitLocation - 35.0 * vect(0.0, 0.0, 2.50), HitLocation, false, Extent);
        bSuccess = HitActor != none && HitNormal.Z >= 0.70;
    }
    // End:0x2de
    else
    {
        bWallHit = Pawn.bCanWallDodge && Skill + float(2) * Jumpiness > float(5);
        minDist = 30.0 + minDist - dist;
    }
    // End:0x3e6
    if(!bSuccess)
    {
        bDuckLeft = !bDuckLeft;
        duckDir *= float(-1);
        HitActor = Trace(HitLocation, HitNormal, Start + duckDir, Start, false, Extent);
        bSuccess = HitActor == none || VSize(HitLocation - Pawn.Location) > minDist;
        // End:0x3e6
        if(bSuccess)
        {
            // End:0x388
            if(HitActor == none)
            {
                HitLocation = Start + duckDir;
            }
            HitActor = Trace(HitLocation, HitNormal, HitLocation - 35.0 * vect(0.0, 0.0, 2.50), HitLocation, false, Extent);
            bSuccess = HitActor != none && HitNormal.Z >= 0.70;
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
    if(Pawn.bCanWallDodge && Skill + float(2) * Jumpiness > float(3) + float(3) * FRand())
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
    // End:0x49e
    else
    {
        UnrealPawn(Pawn).CurrentDir = 2;
    }
    bInDodgeMove = true;
    DodgeLandZ = Pawn.Location.Z;
    Pawn.Dodge(UnrealPawn(Pawn).CurrentDir);
    return true;
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    Squad.NotifyKilled(Killer, Killed, KilledPawn);
}

function Actor FaceMoveTarget()
{
    // End:0x26
    if(MoveTarget != Enemy && MoveTarget != Target)
    {
        StopFiring();
    }
    return MoveTarget;
}

function bool ShouldStrafeTo(Actor WayPoint)
{
    local NavigationPoint N;

    // End:0x2d
    if(Vehicle(Pawn) != none && !Vehicle(Pawn).bFollowLookDir)
    {
        return true;
    }
    // End:0x44
    if(Skill + StrafingAbility < float(3))
    {
        return false;
    }
    // End:0xa5
    if(WayPoint == Enemy)
    {
        // End:0x86
        if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon)
        {
            return false;
        }
        return Skill + StrafingAbility > float(5) * FRand() - float(1);
    }
    // End:0x11f
    else
    {
        // End:0x11f
        if(Pickup(WayPoint) == none)
        {
            N = NavigationPoint(WayPoint);
            // End:0xe6
            if(N == none || N.bNeverUseStrafing)
            {
                return false;
            }
            // End:0xfd
            if(N.FearCost > 200)
            {
                return true;
            }
            // End:0x11f
            if(N.bAlwaysUseStrafing && FRand() < 0.80)
            {
                return true;
            }
        }
    }
    // End:0x184
    if(Pawn(WayPoint) != none || Squad.SquadLeader != none && WayPoint == Squad.SquadLeader.MoveTarget)
    {
        return Skill + StrafingAbility > float(5) * FRand() - float(1);
    }
    // End:0x1a4
    if(Skill + StrafingAbility < float(6) * FRand() - float(1))
    {
        return false;
    }
    // End:0x1c6
    if(!bFinalStretch && Enemy == none)
    {
        return FRand() < 0.40;
    }
    // End:0x1e6
    if(Level.TimeSeconds - LastUnderFire < float(2))
    {
        return true;
    }
    // End:0x206
    if(Enemy != none && EnemyVisible())
    {
        return FRand() < 0.850;
    }
    return FRand() < 0.60;
}

function Actor AlternateTranslocDest()
{
    // End:0x34
    if(PathNode(MoveTarget) == none || MoveTarget != RouteCache[0] || RouteCache[0] == none)
    {
        return none;
    }
    // End:0xcf
    if(PathNode(RouteCache[1]) == none && InventorySpot(RouteCache[1]) == none && GameObjective(RouteCache[1]) == none)
    {
        // End:0xcd
        if(FRand() < 0.50 && GameObject(RouteGoal) != none && VSize(RouteGoal.Location - Pawn.Location) < float(2000) && LineOfSightTo(RouteGoal))
        {
            return RouteGoal;
        }
        return none;
    }
    // End:0x147
    if(FRand() < 0.30 && GameObjective(RouteCache[1]) == none && PathNode(RouteCache[2]) != none || InventorySpot(RouteCache[2]) != none || GameObjective(RouteCache[2]) != none && LineOfSightTo(RouteCache[2]))
    {
        return RouteCache[2];
    }
    // End:0x15c
    if(LineOfSightTo(RouteCache[1]))
    {
        return RouteCache[1];
    }
    return none;
}

function Actor FaceActor(float StrafingModifier)
{
    local float RelativeDir, dist, minDist;
    local Actor SquadFace, N;
    local bool bEnemyNotEngaged, bTranslocTactics, bCatchup;

    // End:0x5f
    if(DestroyableObjective(Focus) != none && Focus == Squad.SquadObjective && Squad.GetOrders() == 'Attack' && Pawn.IsFiring())
    {
        return Focus;
    }
    bTranslocatorHop = false;
    SquadFace = Squad.SetFacingActor(self);
    // End:0x8e
    if(SquadFace != none)
    {
        return SquadFace;
    }
    // End:0xe1
    if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
    {
        // End:0xdb
        if(Vehicle(Focus) != none)
        {
            FireWeaponAt(Focus);
        }
        return Focus;
    }
    // End:0x518
    if(CanUseTranslocator())
    {
        bEnemyNotEngaged = Enemy == none || Level.TimeSeconds - LastSeenTime > float(1);
        bCatchup = Pawn(RouteGoal) != none && !SameTeamAs(Pawn(RouteGoal).Controller) || GameObject(RouteGoal) != none;
        // End:0x1af
        if(bEnemyNotEngaged)
        {
            // End:0x196
            if(bCatchup)
            {
                bTranslocTactics = Skill + Tactics > float(2) + float(2) * FRand();
            }
            // End:0x1af
            else
            {
                bTranslocTactics = Skill + Tactics > float(4);
            }
        }
        bTranslocTactics = bTranslocTactics || Skill + Tactics > 2.50 + float(3) * FRand();
        // End:0x518
        if(bTranslocTactics && TranslocUse > FRand() && Vehicle(Pawn) == none && TranslocFreq < Level.TimeSeconds + float(6) + float(9) * FRand() && NavigationPoint(MoveTarget) != none || GameObject(MoveTarget) != none && LiftCenter(MoveTarget) == none && bEnemyNotEngaged || bRecommendFastMove || GameObject(MoveTarget) != none || VSize(Enemy.Location - Pawn.Location) > float(1200) * float(1) + FRand() || bCatchup && FRand() < 0.650 && !LineOfSightTo(RouteGoal) || GameObject(RouteGoal) != none)
        {
            bRecommendFastMove = false;
            bTranslocatorHop = true;
            TranslocationTarget = MoveTarget;
            RealTranslocationTarget = TranslocationTarget;
            Focus = MoveTarget;
            dist = VSize(Pawn.Location - MoveTarget.Location);
            minDist = 300.0 + float(40) * FMax(0.0, TranslocFreq - Level.TimeSeconds);
            // End:0x428
            if(GameObject(RouteGoal) != none && VSize(Pawn.Location - RouteGoal.Location) < float(1000) + float(1200) * FRand() && LineOfSightTo(RouteGoal))
            {
                TranslocationTarget = RouteGoal;
                RealTranslocationTarget = TranslocationTarget;
                dist = VSize(Pawn.Location - TranslocationTarget.Location);
                Focus = RouteGoal;
            }
            // End:0x4a8
            else
            {
                // End:0x4a8
                if(minDist + float(200) + float(1000) * FRand() > dist)
                {
                    N = AlternateTranslocDest();
                    // End:0x4a8
                    if(N != none)
                    {
                        TranslocationTarget = N;
                        RealTranslocationTarget = TranslocationTarget;
                        dist = VSize(Pawn.Location - TranslocationTarget.Location);
                        Focus = N;
                    }
                }
            }
            // End:0x50c
            if(dist < minDist || dist < minDist + float(150) && !Pawn.Weapon.IsA('Translauncher'))
            {
                TranslocationTarget = none;
                RealTranslocationTarget = TranslocationTarget;
                bTranslocatorHop = false;
            }
            // End:0x518
            else
            {
                SwitchToBestWeapon();
                return Focus;
            }
        }
    }
    bRecommendFastMove = false;
    // End:0x59c
    if(!Pawn.bCanStrafe && Vehicle(Pawn) == none || !Vehicle(Pawn).bSeparateTurretFocus || Enemy == none || Level.TimeSeconds - LastSeenTime > float(6) - StrafingModifier)
    {
        return FaceMoveTarget();
    }
    // End:0x634
    if(MoveTarget == Enemy || Vehicle(Pawn) != none || Skill + StrafingAbility >= float(6) && !Pawn.Weapon.bMeleeWeapon || VSize(MoveTarget.Location - Pawn.Location) < float(4) * Pawn.CollisionRadius)
    {
        return Enemy;
    }
    // End:0x660
    if(Level.TimeSeconds - LastSeenTime > float(4) - StrafingModifier)
    {
        return FaceMoveTarget();
    }
    // End:0x687
    if(Skill > 2.50 && GameObject(MoveTarget) != none)
    {
        return Enemy;
    }
    RelativeDir = Normal(Enemy.Location - Pawn.Location - vect(0.0, 0.0, 1.0) * Enemy.Location.Z - Pawn.Location.Z) Dot Normal(MoveTarget.Location - Pawn.Location - vect(0.0, 0.0, 1.0) * MoveTarget.Location.Z - Pawn.Location.Z);
    // End:0x756
    if(RelativeDir > 0.850)
    {
        return Enemy;
    }
    // End:0x7a9
    if(RelativeDir > 0.30 && Bot(Enemy.Controller) != none && MoveTarget == Enemy.Controller.MoveTarget)
    {
        return Enemy;
    }
    // End:0x7c9
    if(Skill + StrafingAbility < float(2) + FRand())
    {
        return FaceMoveTarget();
    }
    // End:0x850
    if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon && RelativeDir < 0.30 || Skill + StrafingAbility < float(5) + StrafingModifier * FRand() || 0.40 * RelativeDir + 0.80 < FRand())
    {
        return FaceMoveTarget();
    }
    return Enemy;
}

function WanderOrCamp(bool bMayCrouch)
{
    Pawn.bWantsToCrouch = bMayCrouch && Pawn.bIsCrouched || FRand() < 0.750;
    GotoState('RestFormation');
}

function bool NeedWeapon()
{
    local Inventory Inv;

    // End:0x12
    if(Vehicle(Pawn) != none)
    {
        return false;
    }
    // End:0x4e
    if(Pawn.Weapon.AIRating > 0.50)
    {
        return !Pawn.Weapon.HasAmmo();
    }
    Inv = Pawn.Inventory;
    J0x62:
    // End:0xce [While If]
    if(Inv != none)
    {
        // End:0xb7
        if(wWeapon(Inv) != none && wWeapon(Inv).AIRating > 0.50 && wWeapon(Inv).HasAmmo())
        {
            return false;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    return true;
}

event float Desireability(Pickup P)
{
    // End:0x28
    if(!Pawn.IsInLoadout(P.InventoryType))
    {
        return -1.0;
    }
    return P.BotDesireability(Pawn);
}

event float SuperDesireability(Pickup P)
{
    // End:0x16
    if(!SuperPickupNotSpokenFor(P))
    {
        return 0.0;
    }
    return P.BotDesireability(Pawn);
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
    if(CurrentOwner == none || CurrentOwner == self || CurrentOwner.Pawn == none || CurrentOwner.RouteGoal != P.myMarker && CurrentOwner.RouteGoal != P && CurrentOwner.MoveTarget != P && CurrentOwner.RouteGoal != P.myMarker)
    {
        P.TeamOwner[PlayerReplicationInfo.Team.TeamIndex] = none;
        return true;
    }
    // End:0x171
    if(Squad.GetOrders() == 'Defend' || CurrentOwner.MoveTarget == P || CurrentOwner.MoveTarget == P.myMarker)
    {
        return false;
    }
    // End:0x187
    if(PlayerReplicationInfo.HasFlag != none)
    {
        return true;
    }
    // End:0x1ac
    if(CurrentOwner.RouteCache[1] == P.myMarker)
    {
        return false;
    }
    // End:0x1d0
    if(CurrentOwner.Squad.GetOrders() == 'Defend')
    {
        return true;
    }
    return false;
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x45
    if(Pawn.Health > 0 && Damage > float(0) && Squad.SetEnemy(self, Other))
    {
        WhatToDoNext(5);
    }
}

function bool IsRetreating()
{
    return false;
}

function bool Formation()
{
    return false;
}

event RecoverFromBadStateCode()
{
    bBadStateCode = false;
    CampTime = 0.50;
    GotoState('RestFormation', 'TauntWait');
}

function Celebrate()
{
    Pawn.PlayVictoryAnimation();
}

function ForceGiveWeapon()
{
    local Vector TossVel, LeaderVel;

    // End:0x63
    if(Pawn == none || Pawn.Weapon == none || Squad.SquadLeader.Pawn == none || !LineOfSightTo(Squad.SquadLeader.Pawn))
    {
        return;
    }
    // End:0x155
    if(Pawn.CanThrowWeapon())
    {
        TossVel = vector(Pawn.Rotation);
        TossVel.Z = 0.0;
        TossVel = Normal(TossVel);
        LeaderVel = Normal(Squad.SquadLeader.Pawn.Location - Pawn.Location);
        // End:0x101
        if(TossVel Dot LeaderVel > 0.70)
        {
            TossVel = LeaderVel;
        }
        TossVel = TossVel * Pawn.Velocity Dot TossVel + float(500) + vect(0.0, 0.0, 200.0);
        Pawn.TossWeapon(TossVel);
        SwitchToBestWeapon();
    }
}

function ForceCelebrate()
{
    local bool bRealCrouch;

    Pawn.bWantsToCrouch = false;
    bRealCrouch = Pawn.bCanCrouch;
    Pawn.bCanCrouch = false;
    // End:0x9d
    if(Enemy == none)
    {
        CampTime = 3.0;
        GotoState('RestFormation', 'TauntWait');
        // End:0x9d
        if(Squad.SquadLeader.Pawn != none)
        {
            FocalPoint = Squad.SquadLeader.Pawn.Location;
        }
    }
    StopFiring();
    Celebrate();
    Pawn.bCanCrouch = bRealCrouch;
}

function float GetDesiredOffset()
{
    // End:0x3d
    if(Squad.SquadLeader == none || MoveTarget != Squad.SquadLeader.Pawn)
    {
        return 0.0;
    }
    return Squad.GetRestingFormation().FormationSize * 0.50;
}

function bool LostContact(float MaxTime)
{
    // End:0x0d
    if(Enemy == none)
    {
        return true;
    }
    // End:0x3c
    if(Enemy.Visibility < 2)
    {
        MaxTime = FMax(2.0, MaxTime - float(2));
    }
    // End:0x64
    if(Level.TimeSeconds - FMax(LastSeenTime, AcquireTime) > MaxTime)
    {
        return true;
    }
    return false;
}

function bool LoseEnemy()
{
    // End:0x0d
    if(Enemy == none)
    {
        return true;
    }
    // End:0x5a
    if(Enemy.Health > 0 && Enemy.Controller != none && LoseEnemyCheckTime > Level.TimeSeconds - 0.20)
    {
        return false;
    }
    LoseEnemyCheckTime = Level.TimeSeconds;
    // End:0x8b
    if(Squad.LostEnemy(self))
    {
        bFrustrated = false;
        return true;
    }
    return false;
}

function DoStakeOut()
{
    GotoState('StakeOut');
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
    // End:0x85
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
}

function DoTacticalMove()
{
    // End:0x56
    if(!Pawn.bCanStrafe || Pawn.MaxRotation != float(0))
    {
        // End:0x4c
        if(Pawn.HasWeapon())
        {
            DoRangedAttackOn(Enemy);
        }
        // End:0x53
        else
        {
            WanderOrCamp(true);
        }
    }
    // End:0x5d
    else
    {
        GotoState('TacticalMove');
    }
}

function DoRetreat()
{
    // End:0x1c
    if(Squad.PickRetreatDestination(self))
    {
        GotoState('Retreating');
        return;
    }
    // End:0xaf
    if(EnemyVisible())
    {
        GoalString = "No retreat because frustrated";
        bFrustrated = true;
        // End:0x8d
        if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon)
        {
            GotoState('Charging');
        }
        // End:0xad
        else
        {
            // End:0xa7
            if(Vehicle(Pawn) != none)
            {
                GotoState('VehicleCharging');
            }
            // End:0xad
            else
            {
                DoTacticalMove();
            }
        }
        return;
    }
    GoalString = "Stakeout because no retreat dest";
    DoStakeOut();
}

function bool DefendMelee(float dist)
{
    return Enemy.Weapon != none && Enemy.Weapon.bMeleeWeapon && dist < float(1000);
}

function bool IsStrafing()
{
    return false;
}

function bool IsHunting()
{
    return false;
}

function bool FindViewSpot()
{
    return false;
}

function bool Stopped()
{
    return bPreparingMove;
}

function bool IsShootingObjective()
{
    return false;
}

function SetEnemyReaction(int AlertnessLevel)
{
    ScriptedCombat = 3;
    Enable('HearNoise');
    Enable('SeePlayer');
    Enable('SeeMonster');
    Enable('NotifyBump');
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
        // End:0x59
        else
        {
            EnemyAcquisitionScript = none;
        }
    }
}

function bool ScriptingOverridesAI()
{
    return false;
}

function bool ShouldPerformScript()
{
    // End:0x5f
    if(GoalScript != none)
    {
        // End:0x37
        if(Enemy != none && ScriptedCombat == 3)
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
        // End:0x42
        else
        {
            global.EnemyChanged(bNewEnemyVisible);
        }
    }

}

state RestFormation extends NoGoal
{
    function CancelCampFor(Controller C)
    {
        DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
    }

    function bool Formation()
    {
        return true;
    }

    function Timer()
    {
        // End:0x4a
        if(Pawn.Weapon != none && Pawn.Weapon.ShouldFireWithoutTarget())
        {
            Pawn.Weapon.BotFire(false);
        }
        SetCombatTimer();
        Enable('NotifyBump');
    }

    function BeginState()
    {
        Enemy = none;
        Pawn.bCanJump = false;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.SetSprinting(true);
        MinHitWall += 0.150;
        SwitchToBestWeapon();
    }

    function EndState()
    {
        MonitoredPawn = none;
        Squad.GetRestingFormation().LeaveFormation(self);
        MinHitWall -= 0.150;
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
    }

    event MonitoredPawnAlert()
    {
        WhatToDoNext(6);
    }

    function PickDestination()
    {
        FormationPosition = Squad.GetRestingFormation().RecommendPositionFor(self);
        Destination = Squad.GetRestingFormation().GetLocationFor(FormationPosition, self);
    }

Begin:
    WaitForLanding();
    // End:0x1b
    if(Pawn.bStationary)
    {
        goto 'Pausing';
    }
    // End:0xd8
    if(Vehicle(Pawn) != none && !Vehicle(Pawn).bTurnInPlace || Pawn.FindAnchorFailedTime != Level.TimeSeconds)
    {
        // End:0xd2
        if(Squad.SquadLeader == self || Squad.SquadLeader.Pawn == none || Pawn.GetVehicleBase() == Squad.SquadLeader.Pawn)
        {
            goto 'Camping';
        }
        // End:0xd8
        else
        {
            goto 'Pausing';
        }
    }
    PickDestination();
moving:

    // End:0xf6
    if(Pawn.bStationary)
    {
        goto 'Pausing';
    }
    // End:0x1b3
    if(Vehicle(Pawn) != none && !Vehicle(Pawn).bTurnInPlace || Pawn.FindAnchorFailedTime != Level.TimeSeconds)
    {
        // End:0x1ad
        if(Squad.SquadLeader == self || Squad.SquadLeader.Pawn == none || Pawn.GetVehicleBase() == Squad.SquadLeader.Pawn)
        {
            goto 'Camping';
        }
        // End:0x1b3
        else
        {
            goto 'Pausing';
        }
    }
    // End:0x20a
    if(Vehicle(Pawn) != none && Pawn.GetVehicleBase() != none)
    {
        StartMonitoring(Pawn.GetVehicleBase(), Squad.GetRestingFormation().FormationSize);
    }
    // End:0x2a9
    else
    {
        // End:0x2a2
        if(Squad.SquadLeader != self && Squad.SquadLeader.Pawn != none && Squad.FormationCenter() == Squad.SquadLeader.Pawn)
        {
            StartMonitoring(Squad.SquadLeader.Pawn, Squad.GetRestingFormation().FormationSize);
        }
        // End:0x2a9
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
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        // End:0x331
        if(Pawn.bStationary)
        {
            Sleep(2.0);
        }
        Sleep(0.50);
        WhatToDoNext(7);
    }
Camping:

    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    Focus = none;
    FocalPoint = Squad.GetRestingFormation().GetViewPointFor(self, FormationPosition);
    NearWall(200.0);
    FinishRotation();
    // End:0x3ee
    if(Vehicle(Pawn) != none && Pawn.GetVehicleBase() != none)
    {
        StartMonitoring(Pawn.GetVehicleBase(), Squad.GetRestingFormation().FormationSize);
    }
    // End:0x477
    else
    {
        // End:0x470
        if(Squad.SquadLeader.Pawn != none && Squad.FormationCenter() == Squad.SquadLeader.Pawn)
        {
            StartMonitoring(Squad.SquadLeader.Pawn, Squad.GetRestingFormation().FormationSize);
        }
        // End:0x477
        else
        {
            MonitoredPawn = none;
        }
    }
    Sleep(3.0 + FRand());
    WaitForLanding();
    // End:0x4c3
    if(!Squad.WaitAtThisPosition(Pawn))
    {
        // End:0x4bb
        if(Squad.WanderNearLeader(self))
        {
            SetAttractionState();
        }
        // End:0x4c3
        else
        {
            WhatToDoNext(8);
        }
    }
    // End:0x4d5
    if(FRand() < 0.60)
    {
        goto 'Camping';
    }
    goto 'Begin';
ShortWait:

    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    // End:0x55a
    if(Vehicle(Pawn) == none || Vehicle(Pawn).bTurnInPlace)
    {
        Focus = none;
        FocalPoint = Squad.GetRestingFormation().GetViewPointFor(self, FormationPosition);
        NearWall(200.0);
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
    function Startle(Actor Feared)
    {
        GoalString = "STARTLED!";
        StartleActor = Feared;
        BeginState();
    }

    function BeginState()
    {
        Pawn.Acceleration = Pawn.Location - StartleActor.Location;
        Pawn.Acceleration.Z = 0.0;
        Pawn.bIsSprinting = false;
        Pawn.bWantsToCrouch = false;
        // End:0x99
        if(Pawn.Acceleration == vect(0.0, 0.0, 0.0))
        {
            Pawn.Acceleration = VRand();
        }
        Pawn.Acceleration = Pawn.AccelRate * Normal(Pawn.Acceleration);
    }

Begin:
    Sleep(0.50);
    WhatToDoNext(11);
    goto 'Begin';
}

state MoveToGoal
{
    function bool CheckPathToGoalAround(Pawn P)
    {
        // End:0x43
        if(MoveTarget == none || Bot(P.Controller) == none || !SameTeamAs(P.Controller))
        {
            return false;
        }
        // End:0x6f
        if(Bot(P.Controller).Squad.ClearPathFor(self))
        {
            return true;
        }
        return false;
    }

    function Timer()
    {
        SetCombatTimer();
        Enable('NotifyBump');
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
    }

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
        // End:0x42
        else
        {
            global.EnemyChanged(bNewEnemyVisible);
        }
    }

}

state MoveToGoalWithEnemy extends MoveToGoal
{
    function Timer()
    {
        TimedFireWeaponAtEnemy();
    }

}

state Roaming extends MoveToGoalNoEnemy
{
    function MayFall()
    {
        Pawn.bCanJump = MoveTarget != none && MoveTarget.Physics != 2 || !MoveTarget.IsA('Pickup');
    }

Begin:
    SwitchToBestWeapon();
    WaitForLanding();
    // End:0xf3
    if(Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none && Squad.PriorityObjective(self) == 0 && Vehicle(Pawn) == none)
    {
        MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 5.0);
        // End:0xf3
        if(Pickup(MoveTarget) != none && !Pickup(MoveTarget).ReadyToPickup(0.0))
        {
            CampTime = MoveTarget.LatentFloat;
            GoalString = "Short wait for inventory " $ string(MoveTarget);
            GotoState('RestFormation', 'ShortWait');
        }
    }
    MoveToward(MoveTarget, FaceActor(1.0), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
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
        // End:0xb7
        if(A == Enemy && Pawn.Weapon != none && Pawn.Weapon.AIRating < 0.50 && Level.TimeSeconds - Pawn.SpawnTime < DeathMatch(Level.Game).SpawnProtectionTime && Squad.PriorityObjective(self) == 0 && InventorySpot(RouteGoal) != none)
        {
            return false;
        }
        return global.FireWeaponAt(A);
    }

    function bool IsRetreating()
    {
        return Pawn.Acceleration Dot Pawn.Location - Enemy.Location > float(0);
    }

    event bool NotifyBump(Actor Other)
    {
        local Pawn P;
        local Vehicle V;

        // End:0xcb
        if(Vehicle(Other) != none && Vehicle(Pawn) == none)
        {
            // End:0xcb
            if(Other == RouteGoal || Vehicle(RouteGoal) != none && Other == Vehicle(RouteGoal).GetVehicleBase())
            {
                V = Vehicle(RouteGoal).FindEntryVehicle(Pawn);
                // End:0xc9
                if(V != none)
                {
                    V.UsedBy(Pawn);
                    // End:0xc9
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
            if(MoveTarget == Enemy && Pawn.HasWeapon())
            {
                TimedFireWeaponAtEnemy();
                DoRangedAttackOn(Enemy);
            }
            return false;
        }
        P = Pawn(Other);
        // End:0x14a
        if(P == none || P.Controller == none)
        {
            return false;
        }
        // End:0x1f8
        if(!SameTeamAs(P.Controller) && MoveTarget == RouteCache[0] && RouteCache[1] != none && P.ReachedDestination(MoveTarget))
        {
            MoveTimer = VSize(RouteCache[1].Location - Pawn.Location) / Pawn.GroundSpeed * Pawn.DesiredSpeed + float(1);
            MoveTarget = RouteCache[1];
        }
        Squad.SetEnemy(self, P);
        // End:0x22d
        if(Enemy == Other)
        {
            Focus = Enemy;
            TimedFireWeaponAtEnemy();
        }
        // End:0x23d
        if(CheckPathToGoalAround(P))
        {
            return false;
        }
        AdjustAround(P);
        return false;
    }

    function MayFall()
    {
        Pawn.bCanJump = MoveTarget != none && MoveTarget.Physics != 2 || !MoveTarget.IsA('Pickup');
    }

    function EnemyNotVisible()
    {
        // End:0x2c
        if(Squad.FindNewEnemyFor(self, false) || Enemy == none)
        {
            WhatToDoNext(13);
        }
        // End:0x3a
        else
        {
            Enable('SeePlayer');
            Disable('EnemyNotVisible');
        }
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        bEnemyAcquired = false;
        SetEnemyInfo(bNewEnemyVisible);
        // End:0x2b
        if(bNewEnemyVisible)
        {
            Disable('SeePlayer');
            Enable('EnemyNotVisible');
        }
    }

Begin:
    WaitForLanding();
moving:

    // End:0x59
    if(Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none && Vehicle(Pawn) == none)
    {
        MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 0.0);
    }
    MoveToward(MoveTarget, FaceActor(1.0), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
    WhatToDoNext(14);
    // End:0xa8
    if(bSoaking)
    {
        SoakStop("STUCK IN FALLBACK!");
    }
    GoalString = GoalString $ " STUCK IN FALLBACK!";
}

state Retreating extends Fallback
{
    function bool IsRetreating()
    {
        return true;
    }

    function Actor FaceActor(float StrafingModifier)
    {
        return global.FaceActor(2.0);
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
    }

}

state Charging extends MoveToGoalWithEnemy
{
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
            MoveTimer = -1.0;
        }
    }

    function bool TryToDuck(Vector duckDir, bool bReversed)
    {
        // End:0x16
        if(!Pawn.bCanStrafe)
        {
            return false;
        }
        // End:0x34
        if(FRand() < 0.60)
        {
            return global.TryToDuck(duckDir, bReversed);
        }
        // End:0x4f
        if(MoveTarget == Enemy)
        {
            return TryStrafe(duckDir);
        }
    }

    function bool StrafeFromDamage(float Damage, class<DamageType> DamageType, bool bFindDest)
    {
        local Vector SideDir;

        // End:0x2e
        if(FRand() * Damage < 0.150 * CombatStyle * float(Pawn.Health))
        {
            return false;
        }
        // End:0x3b
        if(!bFindDest)
        {
            return true;
        }
        SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0, 0.0, 1.0));
        // End:0x9d
        if(Pawn.Velocity Dot SideDir > float(0))
        {
            SideDir *= float(-1);
        }
        return TryStrafe(SideDir);
    }

    function bool TryStrafe(Vector SideDir)
    {
        local Vector Extent, HitLocation, HitNormal;
        local Actor HitActor;

        Extent = Pawn.GetCollisionExtent();
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir, Pawn.Location, false, Extent);
        // End:0xb2
        if(HitActor != none)
        {
            SideDir *= float(-1);
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir, Pawn.Location, false, Extent);
        }
        // End:0xbf
        if(HitActor != none)
        {
            return false;
        }
        // End:0x14a
        if(Pawn.Physics == 1)
        {
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir - 35.0 * vect(0.0, 0.0, 1.0), Pawn.Location + float(200) * SideDir, false, Extent);
            // End:0x14a
            if(HitActor == none)
            {
                return false;
            }
        }
        Destination = Pawn.Location + float(2 * 200) * SideDir;
        GotoState('TacticalMove', 'DoStrafeMove');
        return true;
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        local float pick;
        local Vector SideDir;
        local bool bWasOnGround;

        super(Bot).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        LastUnderFire = Level.TimeSeconds;
        bWasOnGround = Pawn.Physics == 1;
        // End:0x6b
        if(Pawn.Health <= 0)
        {
            return;
        }
        // End:0x86
        if(StrafeFromDamage(float(Damage), DamageType, true))
        {
            return;
        }
        // End:0x16f
        else
        {
            // End:0x16f
            if(bWasOnGround && MoveTarget == Enemy && Pawn.Physics == 2)
            {
                pick = 1.0;
                // End:0xda
                if(bStrafeDir)
                {
                    pick = -1.0;
                }
                SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0, 0.0, 1.0));
                SideDir.Z = 0.0;
                Pawn.Velocity += pick * Pawn.GroundSpeed * 0.70 * SideDir;
                // End:0x16f
                if(FRand() < 0.20)
                {
                    bStrafeDir = !bStrafeDir;
                }
            }
        }
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x6d
        if(Other == Enemy && Pawn.Weapon != none && !Pawn.Weapon.bMeleeWeapon && FRand() > 0.40 + 0.10 * Skill)
        {
            DoRangedAttackOn(Enemy);
            return false;
        }
        return global.NotifyBump(Other);
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        TimedFireWeaponAtEnemy();
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

Begin:
    // End:0x3b
    if(Pawn.Physics == 2)
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4e
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

    // End:0x8c
    if(Pawn.Weapon.bMeleeWeapon)
    {
        FireWeaponAt(Enemy);
    }
    MoveToward(MoveTarget, FaceActor(1.0),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0xd6
    if(bSoaking)
    {
        SoakStop("STUCK IN CHARGING!");
    }
}

state VehicleCharging extends MoveToGoalWithEnemy
{
    function Timer()
    {
        Target = Enemy;
        TimedFireWeaponAtEnemy();
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
        Destination = Pawn.Location + float(5000) * Normal(Pawn.Location - MoveTarget.Location);
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x94
        if(HitActor == none)
        {
            return;
        }
        Cross = Normal(Destination - Pawn.Location Cross vect(0.0, 0.0, 1.0));
        Destination = Destination + float(1000) * Cross;
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x10f
        if(HitActor == none)
        {
            return;
        }
        Destination = Destination - float(2000) * Cross;
        HitActor = Trace(HitLocation, HitNormal, Destination, Pawn.Location, false);
        // End:0x15e
        if(HitActor == none)
        {
            return;
        }
        Destination = Destination + float(1000) * Cross - float(3000) * Normal(Pawn.Location - MoveTarget.Location);
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
    }

Begin:
    // End:0x3b
    if(Pawn.Physics == 2)
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4e
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
    // End:0xc4
    if(Pawn.Physics == 4)
    {
        // End:0xb6
        if(VSize(Enemy.Location - Pawn.Location) < float(1200))
        {
            FindDestination();
            MoveTo(Destination, none, false);
            // End:0xb6
            if(Enemy == none)
            {
                WhatToDoNext(91);
            }
        }
        MoveTarget = Enemy;
    }
    // End:0xf9
    else
    {
        // End:0xf9
        if(!FindBestPathToward(Enemy, false, true))
        {
            // End:0xf2
            if(Pawn.HasWeapon())
            {
                GotoState('RangedAttack');
            }
            // End:0xf9
            else
            {
                WanderOrCamp(true);
            }
        }
    }
    FireWeaponAt(Enemy);
    MoveToward(MoveTarget, FaceActor(1.0),, ShouldStrafeTo(MoveTarget));
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
    function bool IsStrafing()
    {
        return true;
    }

    function SetFall()
    {
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        Destination = Pawn.Location;
        global.SetFall();
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        local Vehicle V;

        // End:0xcd
        if(Vehicle(Wall) != none && Vehicle(Pawn) == none)
        {
            // End:0xcb
            if(Wall == RouteGoal || Vehicle(RouteGoal) != none && Wall == Vehicle(RouteGoal).GetVehicleBase())
            {
                V = Vehicle(Wall).FindEntryVehicle(Pawn);
                // End:0xc9
                if(V != none)
                {
                    V.UsedBy(Pawn);
                    // End:0xc9
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
        // End:0xf8
        if(Pawn.Physics == 2)
        {
            NotifyFallingHitWall(HitNormal, Wall);
            return false;
        }
        // End:0x10d
        if(Enemy == none)
        {
            WhatToDoNext(18);
            return false;
        }
        // End:0x169
        if(bChangeDir || FRand() < 0.50 || Enemy.Location - Pawn.Location Dot HitNormal < float(0))
        {
            Focus = Enemy;
            WhatToDoNext(19);
        }
        // End:0x199
        else
        {
            bChangeDir = true;
            Destination = Pawn.Location - HitNormal * FRand() * float(500);
        }
        return true;
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        // End:0x33
        if(Enemy != none && !bNotifyApex)
        {
            TimedFireWeaponAtEnemy();
        }
        // End:0x39
        else
        {
            SetCombatTimer();
        }
    }

    function EnemyNotVisible()
    {
        StopFiring();
        // End:0x4b
        if(Aggressiveness > RelativeStrength(Enemy))
        {
            // End:0x43
            if(FastTrace(Enemy.Location, LastSeeingPos))
            {
                GotoState('TacticalMove', 'RecoverEnemy');
            }
            // End:0x4b
            else
            {
                WhatToDoNext(20);
            }
        }
        Disable('EnemyNotVisible');
    }

    function PawnIsInPain(PhysicsVolume PainVolume)
    {
        Destination = Pawn.Location - float(200) * Normal(Pawn.Velocity);
    }

    function ChangeStrafe()
    {
        local Vector Dir;

        Dir = vector(Pawn.Rotation);
        Destination = Destination + float(2) * Pawn.Location - Destination + Dir * Destination - Pawn.Location Dot Dir;
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
        // End:0xce
        if(Pawn.PhysicsVolume.bWaterVolume && !Pawn.bCanSwim && Pawn.bCanFly)
        {
            Destination = Pawn.Location + float(75) * VRand() + vect(0.0, 0.0, 1.0);
            Destination.Z += float(100);
            return;
        }
        enemyDir = Normal(Enemy.Location - Pawn.Location);
        Y = enemyDir Cross vect(0.0, 0.0, 1.0);
        // End:0x14a
        if(Pawn.Physics == 1)
        {
            Y.Z = 0.0;
            enemyDir.Z = 0.0;
        }
        // End:0x166
        else
        {
            enemyDir.Z = FMax(0.0, enemyDir.Z);
        }
        bFollowingPlayer = PlayerController(Squad.SquadLeader) != none && Squad.SquadLeader.Pawn != none && VSize(Pawn.Location - Squad.SquadLeader.Pawn.Location) < float(1600);
        strafeSize = FClamp(2.0 * Aggression + float(1) * FRand() - 0.650, -0.70, 0.70);
        // End:0x244
        if(Squad.MustKeepEnemy(Enemy))
        {
            strafeSize = FMax(0.40 * FRand() - 0.20, strafeSize);
        }
        enemyPart = enemyDir * strafeSize;
        strafeSize = FMax(0.0, 1.0 - Abs(strafeSize));
        pickdir = strafeSize * Y;
        // End:0x29a
        if(bStrafeDir)
        {
            pickdir *= float(-1);
        }
        // End:0x381
        if(bFollowingPlayer)
        {
            LookDir = vector(Squad.SquadLeader.Rotation);
            // End:0x381
            if(LookDir Dot Pawn.Location + enemyPart + pickdir * float(200) - Squad.SquadLeader.Pawn.Location > FMax(0.0, LookDir Dot Pawn.Location + enemyPart - pickdir * float(200) - Squad.SquadLeader.Pawn.Location))
            {
                bStrafeDir = !bStrafeDir;
                pickdir *= float(-1);
            }
        }
        bStrafeDir = !bStrafeDir;
        // End:0x3a8
        if(EngageDirection(enemyPart + pickdir, false))
        {
            return;
        }
        // End:0x3c0
        if(EngageDirection(enemyPart - pickdir, false))
        {
            return;
        }
        bForcedDirection = true;
        StartTacticalTime = Level.TimeSeconds;
        EngageDirection(enemyPart + pickdir, true);
    }

    function bool EngageDirection(Vector StrafeDir, bool bForced)
    {
        local Actor HitActor;
        local Vector HitLocation, collspec, MinDest, HitNormal;
        local bool bWantJump;

        MinDest = Pawn.Location + float(200) * StrafeDir;
        // End:0x3aa
        if(!bForced)
        {
            collspec = Pawn.GetCollisionExtent();
            collspec.Z = FMax(6.0, Pawn.CollisionHeight - 35.0);
            bWantJump = Vehicle(Pawn) == none && Pawn.Physics != 2 && FRand() < 0.050 * Skill + 0.60 * Jumpiness || Pawn.Weapon.SplashJump() && ProficientWithWeapon() && Enemy.Location.Z - Enemy.CollisionHeight <= Pawn.Location.Z + 35.0 - Pawn.CollisionHeight && !NeedToTurn(Enemy.Location);
            HitActor = Trace(HitLocation, HitNormal, MinDest, Pawn.Location, false, collspec);
            // End:0x1ad
            if(HitActor != none && !bWantJump || !Pawn.bCanWallDodge)
            {
                return false;
            }
            // End:0x262
            if(Pawn.Physics == 1)
            {
                collspec.X = FMin(14.0, 0.50 * Pawn.CollisionRadius);
                collspec.Y = collspec.X;
                HitActor = Trace(HitLocation, HitNormal, MinDest - float(3) * 35.0 * vect(0.0, 0.0, 1.0), MinDest, false, collspec);
                // End:0x262
                if(HitActor == none)
                {
                    HitNormal = float(-1) * StrafeDir;
                    return false;
                }
            }
            // End:0x3aa
            if(bWantJump)
            {
                // End:0x28c
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
                Pawn.Velocity = SuggestFallVelocity(MinDest, Pawn.Location, 1.50 * Pawn.JumpZ, Pawn.GroundSpeed);
                Pawn.Velocity.Z = Pawn.JumpZ;
                Pawn.Acceleration = vect(0.0, 0.0, 0.0);
                // End:0x39d
                if(Pawn.bCanWallDodge && Skill + float(2) * Jumpiness > float(3) + float(3) * FRand())
                {
                    bNotifyFallingHitWall = true;
                }
                Destination = MinDest;
                return true;
            }
        }
        Destination = MinDest + StrafeDir * 0.50 * float(200) + FMin(VSize(Enemy.Location - Pawn.Location), 200.0 * FRand() + FRand());
        return true;
    }

    event NotifyJumpApex()
    {
        // End:0x59
        if(bTacticalDoubleJump && !bPendingDoubleJump && FRand() < 0.40 && Skill > float(2) + float(5) * FRand())
        {
            bTacticalDoubleJump = false;
            bNotifyApex = true;
            bPendingDoubleJump = true;
        }
        // End:0x76
        else
        {
            // End:0x76
            if(Pawn.CanAttack(Enemy))
            {
                TimedFireWeaponAtEnemy();
            }
        }
        global.NotifyJumpApex();
    }

    function BeginState()
    {
        bForcedDirection = false;
        // End:0x38
        if(Skill < float(4))
        {
            Pawn.MaxDesiredSpeed = 0.40 + 0.080 * Skill;
        }
        MinHitWall += 0.150;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.bCanJump = false;
        bAdjustFromWalls = false;
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
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
        MinHitWall -= 0.150;
        // End:0x83
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

TacticalTick:
    Sleep(0.020);
Begin:

    // End:0x21
    if(Enemy == none)
    {
        Sleep(0.010);
        goto 'FinishedStrafe';
    }
    // End:0x5c
    if(Pawn.Physics == 2)
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x6d
    if(Enemy == none)
    {
        goto 'FinishedStrafe';
    }
    PickDestination();
DoMove:

    // End:0xb5
    if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
    {
        MoveTo(Destination, Focus);
    }
    // End:0xe7
    else
    {
        // End:0xda
        if(!Pawn.bCanStrafe)
        {
            StopFiring();
            MoveTo(Destination);
DoStrafeMove:

        }
        // End:0xe7
        else
        {
            MoveTo(Destination, Enemy);
        }
    }
    // End:0x183
    if(bForcedDirection && Level.TimeSeconds - StartTacticalTime < 0.20)
    {
        // End:0x14f
        if(!Pawn.HasWeapon() || Skill > float(2) + float(3) * FRand())
        {
            bMustCharge = true;
            WhatToDoNext(51);
        }
        GoalString = "RangedAttack from failed tactical";
        DoRangedAttackOn(Enemy);
    }
    // End:0x1ef
    if(Enemy == none || EnemyVisible() || !FastTrace(Enemy.Location, LastSeeingPos) || Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon)
    {
        goto 'FinishedStrafe';
    }
RecoverEnemy:

    GoalString = "Recover Enemy";
    HidingSpot = Pawn.Location;
    StopFiring();
    Sleep(0.10 + 0.20 * FRand());
    Destination = LastSeeingPos + float(4) * Pawn.CollisionRadius * Normal(LastSeeingPos - Pawn.Location);
    MoveTo(Destination, Enemy);
    // End:0x36c
    if(FireWeaponAt(Enemy))
    {
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        // End:0x2e4
        if(Pawn.Weapon != none && Pawn.Weapon.SplashDamage())
        {
            StopFiring();
            Sleep(0.050);
        }
        // End:0x312
        else
        {
            Sleep(0.10 + 0.30 * FRand() + 0.060 * float(7) - FMin(7.0, Skill));
        }
        // End:0x36c
        if(FRand() + 0.30 > Aggression)
        {
            Enable('EnemyNotVisible');
            Destination = HidingSpot + float(4) * Pawn.CollisionRadius * Normal(HidingSpot - Pawn.Location);
            goto 'DoMove';
        }
    }
FinishedStrafe:

    WhatToDoNext(21);
    // End:0x39c
    if(bSoaking)
    {
        SoakStop("STUCK IN TACTICAL MOVE!");
    }
    stop;    
}

state Hunting extends MoveToGoalWithEnemy
{
    function bool IsHunting()
    {
        return true;
    }

    function MayFall()
    {
        Pawn.bCanJump = MoveTarget == none || MoveTarget.Physics != 2 || !MoveTarget.IsA('Pickup');
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        LastUnderFire = Level.TimeSeconds;
        super(Bot).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x61
        if(Pawn.Health > 0 && Damage > 0)
        {
            bFrustrated = true;
        }
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
        // End:0x5e
        else
        {
            global.SeePlayer(SeenPlayer);
        }
    }

    function Timer()
    {
        SetCombatTimer();
        StopFiring();
    }

    function PickDestination()
    {
        local Vector nextSpot, ViewSpot, Dir;
        local float posZ;
        local bool bCanSeeLastSeen;
        local int i;

        // End:0x31
        if(Enemy == none || Enemy.Health <= 0)
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
        // End:0xe4
        if(actorReachable(Enemy))
        {
            BlockedPath = none;
            // End:0xc7
            if(LostContact(5.0) && Enemy.Location - Pawn.Location Dot vector(Pawn.Rotation) < float(0) && LoseEnemy())
            {
                WhatToDoNext(24);
                return;
            }
            Destination = Enemy.Location;
            MoveTarget = none;
            return;
        }
        ViewSpot = Pawn.Location + Pawn.BaseEyeHeight * vect(0.0, 0.0, 1.0);
        bCanSeeLastSeen = bEnemyInfoValid && FastTrace(LastSeenPos, ViewSpot);
        // End:0x25f
        if(Squad.BeDevious())
        {
            // End:0x240
            if(BlockedPath == none)
            {
                // End:0x1da
                if(FindPathToward(Enemy, false) != none)
                {
                    i = 0;
                    J0x169:
                    // End:0x1d7 [While If]
                    if(i < 16)
                    {
                        // End:0x191
                        if(NavigationPoint(RouteCache[i]) == none)
                        {
                            // This is an implied JumpToken;
                            goto J0x1d7;
                        }
                        // End:0x1cd
                        else
                        {
                            // End:0x1cd
                            if(Enemy.Controller.LineOfSightTo(RouteCache[i]))
                            {
                                BlockedPath = NavigationPoint(RouteCache[i]);
                            }
                            // End:0x1d7
                            else
                            {
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x169;
                        }
                    }
                }
                // End:0x240
                else
                {
                    // End:0x209
                    if(CanStakeOut())
                    {
                        GoalString = "Stakeout from hunt";
                        GotoState('StakeOut');
                        return;
                    }
                    // End:0x240
                    else
                    {
                        // End:0x21f
                        if(LoseEnemy())
                        {
                            WhatToDoNext(25);
                            return;
                        }
                        // End:0x240
                        else
                        {
                            GoalString = "Retreat from hunt";
                            DoRetreat();
                            return;
                        }
                    }
                }
            }
            // End:0x25f
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
        // End:0x2b9
        if(bSoaking && Physics != 2)
        {
            SoakStop("COULDN'T FIND PATH TO ENEMY " $ string(Enemy));
        }
        MoveTarget = none;
        // End:0x2e0
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
        posZ = LastSeenPos.Z + Pawn.CollisionHeight - Enemy.CollisionHeight;
        nextSpot = LastSeenPos - Normal(Enemy.Velocity) * Pawn.CollisionRadius;
        nextSpot.Z = posZ;
        // End:0x3d0
        if(FastTrace(nextSpot, ViewSpot))
        {
            Destination = nextSpot;
        }
        // End:0x519
        else
        {
            // End:0x451
            if(bCanSeeLastSeen)
            {
                Dir = Pawn.Location - LastSeenPos;
                Dir.Z = 0.0;
                // End:0x443
                if(VSize(Dir) < Pawn.CollisionRadius)
                {
                    GoalString = "Stakeout 3 from hunt";
                    GotoState('StakeOut');
                    return;
                }
                Destination = LastSeenPos;
            }
            // End:0x519
            else
            {
                Destination = LastSeenPos;
                // End:0x519
                if(!FastTrace(LastSeenPos, ViewSpot))
                {
                    // End:0x4be
                    if(PickWallAdjust(Normal(LastSeenPos - ViewSpot)) || FindViewSpot())
                    {
                        // End:0x4af
                        if(Pawn.Physics == 2)
                        {
                            SetFall();
                        }
                        // End:0x4bb
                        else
                        {
                            GotoState('Hunting', 'AdjustFromWall');
                        }
                    }
                    // End:0x519
                    else
                    {
                        // End:0x4f4
                        if(Pawn.Physics == 4 && LoseEnemy())
                        {
                            WhatToDoNext(byte(411));
                            return;
                        }
                        // End:0x519
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
    }

    function bool FindViewSpot()
    {
        local Vector X, Y, Z;
        local bool bAlwaysTry;

        // End:0x0d
        if(Enemy == none)
        {
            return false;
        }
        GetAxes(Rotation, X, Y, Z);
        bAlwaysTry = bFrustrated;
        bFrustrated = false;
        // End:0xab
        if(FastTrace(Enemy.Location, Pawn.Location + float(2) * Y * Pawn.CollisionRadius))
        {
            Destination = Pawn.Location + 2.50 * Y * Pawn.CollisionRadius;
            return true;
        }
        // End:0x11e
        if(FastTrace(Enemy.Location, Pawn.Location - float(2) * Y * Pawn.CollisionRadius))
        {
            Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
            return true;
        }
        // End:0x19c
        if(bAlwaysTry)
        {
            // End:0x168
            if(FRand() < 0.50)
            {
                Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
            }
            // End:0x19a
            else
            {
                Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
            }
            return true;
        }
        return false;
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = Squad.CautiousAdvance(self);
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
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
    // End:0x6f
    else
    {
        MoveToward(MoveTarget, FaceActor(10.0),, FRand() < 0.750 && ShouldStrafeTo(MoveTarget));
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
    function bool CanAttack(Actor Other)
    {
        return true;
    }

    function bool Stopped()
    {
        return true;
    }

    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x99
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            // End:0x8e
            if(Pawn.Weapon == none || !Pawn.Weapon.FocusOnLeader(false) && FRand() < 0.50)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);
        }
        // End:0xef
        else
        {
            // End:0xef
            if(Squad.SetEnemy(self, SeenPlayer))
            {
                // End:0xe7
                if(Enemy == SeenPlayer)
                {
                    VisibleEnemy = Enemy;
                    EnemyVisibilityTime = Level.TimeSeconds;
                    bEnemyIsVisible = true;
                }
                WhatToDoNext(29);
            }
        }
    }

    function DoStakeOut()
    {
        SetFocus();
        // End:0x73
        if(FRand() < 0.30 || !FastTrace(FocalPoint + vect(0.0, 0.0, 0.90) * Enemy.CollisionHeight, Pawn.Location + vect(0.0, 0.0, 0.80) * Pawn.CollisionHeight))
        {
            FindNewStakeOutDir();
        }
        GotoState('StakeOut', 'Begin');
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x78
        if(Pawn.Health > 0 && Damage > 0)
        {
            bFrustrated = true;
            // End:0x70
            if(instigatedBy == Enemy)
            {
                AcquireTime = Level.TimeSeconds;
            }
            WhatToDoNext(30);
        }
    }

    function Timer()
    {
        Enable('NotifyBump');
        SetCombatTimer();
    }

    function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
    {
        local Vector FireSpot;
        local Actor HitActor;
        local Vector HitLocation, HitNormal;

        FireSpot = FocalPoint;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7e
        if(HitActor != none)
        {
            // End:0x61
            if(Enemy != none)
            {
                FireSpot += float(2) * Enemy.CollisionHeight * HitNormal;
            }
            // End:0x7e
            if(!FastTrace(FireSpot, projStart))
            {
                FireSpot = FocalPoint;
            }
        }
        SetRotation(rotator(FireSpot - projStart));
        return Rotation;
    }

    function FindNewStakeOutDir()
    {
        local NavigationPoint N, Best;
        local Vector Dir, enemyDir;
        local float dist, BestVal, val;

        enemyDir = Normal(Enemy.Location - Pawn.Location);
        N = Level.NavigationPointList;
        J0x3a:
        // End:0x11d [While If]
        if(N != none)
        {
            Dir = N.Location - Pawn.Location;
            dist = VSize(Dir);
            // End:0x106
            if(dist < float(2000) && dist > float(200))
            {
                val = enemyDir Dot Dir / dist;
                // End:0xd4
                if(Level.Game.bTeamGame)
                {
                    val += FRand();
                }
                // End:0x106
                if(val > BestVal && LineOfSightTo(N))
                {
                    BestVal = val;
                    Best = N;
                }
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
        // End:0x162
        if(Best != none)
        {
            FocalPoint = Best.Location + 0.50 * Pawn.CollisionHeight * vect(0.0, 0.0, 1.0);
        }
    }

    function SetFocus()
    {
        // End:0x40
        if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
        {
            Focus = Focus;
        }
        // End:0x6b
        else
        {
            // End:0x57
            if(bEnemyInfoValid)
            {
                FocalPoint = LastSeenPos;
            }
            // End:0x6b
            else
            {
                FocalPoint = Enemy.Location;
            }
        }
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        Pawn.bCanJump = false;
        SetFocus();
        // End:0x99
        if(!bEnemyInfoValid || !ClearShot(FocalPoint, false) || Level.TimeSeconds - LastSeenTime > float(6) && FRand() < 0.50)
        {
            FindNewStakeOutDir();
        }
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

Begin:
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    Focus = none;
    // End:0x60
    if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
    {
        Focus = Focus;
    }
    CheckIfShouldCrouch(Pawn.Location, FocalPoint, 1.0);
    FinishRotation();
    // End:0xc1
    if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
    {
        FireWeaponAt(Focus);
    }
    // End:0x14c
    else
    {
        // End:0x128
        if(Pawn.Weapon != none && !Pawn.Weapon.bMeleeWeapon && Squad.ShouldSuppressEnemy(self) && ClearShot(FocalPoint, true))
        {
            FireWeaponAt(Enemy);
        }
        // End:0x14c
        else
        {
            // End:0x146
            if(Vehicle(Pawn) != none)
            {
                FireWeaponAt(Enemy);
            }
            // End:0x14c
            else
            {
                StopFiring();
            }
        }
    }
    Sleep(1.0 + FRand());
    // End:0x236
    if(Pawn.bIsCrouched && !FastTrace(FocalPoint, Pawn.Location + Pawn.EyeHeight * vect(0.0, 0.0, 1.0)) && FastTrace(FocalPoint, Pawn.Location + Pawn.default.EyeHeight + Pawn.default.CollisionHeight - Pawn.CollisionHeight * vect(0.0, 0.0, 1.0)))
    {
        Pawn.bWantsToCrouch = false;
        Sleep(0.150 + 0.050 * float(1) + FRand() * float(10) - Skill);
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
    function bool Stopped()
    {
        return true;
    }

    function bool IsShootingObjective()
    {
        return Target != none && Target == Squad.SquadObjective || Target.Owner == Squad.SquadObjective;
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
    }

    function StopFiring()
    {
        // End:0x35
        if(Pawn != none && Pawn.RecommendLongRangedAttack() && Pawn.IsFiring())
        {
            return;
        }
        global.StopFiring();
        // End:0x7b
        if(bHasFired)
        {
            // End:0x6b
            if(IsSniping())
            {
                Pawn.bWantsToCrouch = Skill > float(2);
            }
            // End:0x7b
            else
            {
                bHasFired = false;
                WhatToDoNext(32);
            }
        }
    }

    function EnemyNotVisible()
    {
        // End:0x2d
        if(Target == Enemy && !Pawn.RecommendLongRangedAttack())
        {
            WhatToDoNext(33);
        }
    }

    function Timer()
    {
        // End:0x48
        if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon)
        {
            SetCombatTimer();
            StopFiring();
            WhatToDoNext(34);
        }
        // End:0x6b
        else
        {
            // End:0x60
            if(Target == Enemy)
            {
                TimedFireWeaponAtEnemy();
            }
            // End:0x6b
            else
            {
                FireWeaponAt(Target);
            }
        }
    }

    function DoRangedAttackOn(Actor A)
    {
        // End:0x40
        if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
        {
            Target = Focus;
        }
        // End:0x4b
        else
        {
            Target = A;
        }
        GotoState('RangedAttack');
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        // End:0x69
        if(Pawn.Physics != 4 || Pawn.MinFlySpeed == float(0))
        {
            Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        }
        // End:0xc4
        if(Vehicle(Pawn) != none)
        {
            Vehicle(Pawn).Steering = 0.0;
            Vehicle(Pawn).Throttle = 0.0;
            Vehicle(Pawn).Rise = 0.0;
        }
        // End:0x104
        if(Pawn.Weapon != none && Pawn.Weapon.FocusOnLeader(false))
        {
            Target = Focus;
        }
        // End:0x11a
        else
        {
            // End:0x11a
            if(Target == none)
            {
                Target = Enemy;
            }
        }
        // End:0x14c
        if(Target == none)
        {
            Log(GetHumanReadableName() $ " no target in ranged attack");
        }
    }

Begin:
    bHasFired = false;
    // End:0x3f
    if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon)
    {
        SwitchToBestWeapon();
    }
    GoalString = GoalString @ "Ranged attack";
    Focus = Target;
    Sleep(0.0);
    // End:0x86
    if(Target == none)
    {
        WhatToDoNext(byte(335));
    }
    // End:0xb8
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0);
    }
    // End:0xdd
    if(NeedToTurn(Target.Location))
    {
        Focus = Target;
        FinishRotation();
    }
    bHasFired = true;
    // End:0xfd
    if(Target == Enemy)
    {
        TimedFireWeaponAtEnemy();
    }
    // End:0x108
    else
    {
        FireWeaponAt(Target);
    }
    Sleep(0.10);
    // End:0x191
    if(Pawn.Weapon != none && Pawn.Weapon.bMeleeWeapon || Target == none || Target != Enemy && GameObjective(Target) == none && Enemy != none && EnemyVisible())
    {
        WhatToDoNext(35);
    }
    // End:0x1c3
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0);
    }
    Focus = Target;
    Sleep(FMax(Pawn.RangedAttackTime(), 0.20 + 0.50 + 0.50 * FRand() * 0.40 * float(7) - Skill));
    WhatToDoNext(36);
    // End:0x23c
    if(bSoaking)
    {
        SoakStop("STUCK IN RANGEDATTACK!");
    }
    stop;    
}

state ShieldSelf
{
    function bool Stopped()
    {
        return true;
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
    }

    function StopFiring();
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
            Log(GetHumanReadableName() $ " no target in shield self");
        }
    }

Begin:
    bHasFired = false;
    SwitchToBestWeapon();
    TimedFireWeaponAtEnemy();
    Focus = Target;
    Sleep(0.0);
    // End:0x4c
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
        Sleep(0.50);
    }
    // End:0x7c
    else
    {
        Sleep(0.10);
    }
    bHasFired = true;
    // End:0x93
    if(ShouldKeepShielding())
    {
        goto 'KeepShielding';
    }
    WhatToDoNext(136);
    // End:0xc0
    if(bSoaking)
    {
        SoakStop("STUCK IN SHIELDSELF!");
    }
    stop;    
}

state Dead
{
    ignores ReceiveWarning;

    event DelayedWarning();
    function DoRangedAttackOn(Actor A);
    function WhatToDoNext(byte CallingByte);
    function Celebrate()
    {
        Log(string(self) $ " Celebrate while dead");
    }

    function bool SetRouteToGoal(Actor A)
    {
        Log(string(self) $ " SetRouteToGoal while dead");
        return true;
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while dead");
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while dead");
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while dead");
    }

    function Timer();
    function BeginState()
    {
        // End:0x21
        if(Level.Game.TooManyBots(self))
        {
            Destroy();
            return;
        }
        // End:0x44
        if(GoalScript != none && HoldSpot(GoalScript) == none)
        {
            FreeScript();
        }
        // End:0x86
        if(NavigationPoint(MoveTarget) != none)
        {
            NavigationPoint(MoveTarget).FearCost = 2 * NavigationPoint(MoveTarget).FearCost + 600;
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
    }

Begin:
    // End:0x22
    if(Level.Game.bGameEnded)
    {
        GotoState('GameEnded');
    }
    Sleep(0.20);
TryAgain:

    // End:0x49
    if(UnrealMPGameInfo(Level.Game) == none)
    {
        Destroy();
    }
    // End:0xa4
    else
    {
        Sleep(0.250 + UnrealMPGameInfo(Level.Game).SpawnWait(self));
        LastRespawnTime = Level.TimeSeconds;
        Level.Game.RestartPlayer(self);
        goto 'TryAgain';
    }
    Sleep(0.750 + FRand());
    Level.Game.RestartPlayer(self);
    goto 'TryAgain';
    stop;        
}

state FindAir
{
    function bool NotifyHeadVolumeChange(PhysicsVolume newHeadVolume)
    {
        global.NotifyHeadVolumeChange(newHeadVolume);
        // End:0x27
        if(!newHeadVolume.bWaterVolume)
        {
            WhatToDoNext(37);
        }
        return false;
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        Destination = float(200) * Normal(Destination - Pawn.Location) + HitNormal;
        return true;
    }

    function Timer()
    {
        // End:0x1f
        if(Enemy != none && EnemyVisible())
        {
            TimedFireWeaponAtEnemy();
        }
        // End:0x25
        else
        {
            SetCombatTimer();
        }
    }

    function EnemyNotVisible();
    function PickDestination(bool bNoCharge)
    {
        Destination = VRand();
        Destination.Z = 1.0;
        Destination = Pawn.Location + float(200) * Destination;
    }

    function BeginState()
    {
        Pawn.bWantsToCrouch = false;
        bAdjustFromWalls = false;
    }

    function EndState()
    {
        bAdjustFromWalls = true;
    }

Begin:
    PickDestination(false);
DoMove:

    // End:0x1d
    if(Enemy == none)
    {
        MoveTo(Destination);
    }
    // End:0x2a
    else
    {
        MoveTo(Destination, Enemy);
    }
    WhatToDoNext(38);
}

state GameEnded
{
    ignores KilledBy, TakeDamage, ReceiveWarning;

    event DelayedWarning();
    function SwitchToBestWeapon();
    function WhatToDoNext(byte CallingByte)
    {
        Log(string(self) $ " WhatToDoNext while gameended CALLED BY " $ string(CallingByte));
    }

    function Celebrate()
    {
        Log(string(self) $ " Celebrate while gameended");
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while gameended");
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while gameended");
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while gameended");
    }

    function Timer()
    {
        // End:0xcf
        if(DeathMatch(Level.Game) != none)
        {
            // End:0x5e
            if(DeathMatch(Level.Game).EndGameFocus == Pawn && Pawn != none)
            {
                Pawn.PlayVictoryAnimation();
            }
            // End:0xcf
            else
            {
                // End:0xcf
                if(TeamGame(Level.Game) != none && TeamGame(Level.Game).bPlayersVsBots)
                {
                    // End:0xcf
                    if(!TeamGame(Level.Game).PickEndGameTauntFor(self))
                    {
                        SetTimer(1.0 + float(5) * FRand(), false);
                    }
                }
            }
        }
    }

    function BeginState()
    {
        super(Object).BeginState();
        SetTimer(3.0, false);
    }

}

state Scripting
{
    function Restart();
    function UnPossess()
    {
        global.UnPossess();
    }

    function Timer()
    {
        super.Timer();
        Enable('NotifyBump');
    }

    function CompleteAction()
    {
        ++ ActionNum;
        WhatToDoNext(39);
    }

    function LeaveScripting()
    {
        // End:0x32
        if(SequenceScript == GoalScript && HoldSpot(GoalScript) == none)
        {
            FreeScript();
            global.WhatToDoNext(40);
        }
        // End:0x39
        else
        {
            WanderOrCamp(true);
        }
    }

    function EndState()
    {
        super.EndState();
        SetCombatTimer();
        // End:0x4c
        if(Pawn != none && Pawn.Health > 0)
        {
            Pawn.bPhysicsAnimUpdate = Pawn.default.bPhysicsAnimUpdate;
        }
    }

    function ClearPathFor(Controller C)
    {
        CancelCampFor(C);
    }

    function CancelCampFor(Controller C)
    {
        // End:0x4f
        if(Pawn.Velocity == vect(0.0, 0.0, 0.0))
        {
            DirectedWander(Normal(Pawn.Location - C.Pawn.Location));
        }
    }

    function AbortScript()
    {
        // End:0x27
        if(SequenceScript == GoalScript && HoldSpot(GoalScript) == none)
        {
            FreeScript();
        }
        WanderOrCamp(true);
    }

    function SetMoveTarget()
    {
        super.SetMoveTarget();
        // End:0x32
        if(Pawn.ReachedDestination(MoveTarget))
        {
            ++ ActionNum;
            GotoState('Scripting', 'Begin');
            return;
        }
        // End:0x56
        if(Enemy != none && ScriptedCombat == 2)
        {
            GotoState('Fallback');
        }
    }

    function MayShootAtEnemy()
    {
        // End:0x22
        if(Enemy != none)
        {
            Target = Enemy;
            GotoState('Scripting', 'ScriptedRangedAttack');
        }
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
}

state WaitingForLanding
{
    function bool DoWaitForLanding()
    {
        // End:0x0b
        if(bJustLanded)
        {
            return false;
        }
        BeginState();
        return true;
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        bJustLanded = true;
        super(Controller).NotifyLanded(HitNormal);
        return false;
    }

    function Timer()
    {
        // End:0x18
        if(Focus == Enemy)
        {
            TimedFireWeaponAtEnemy();
        }
        // End:0x1e
        else
        {
            SetCombatTimer();
        }
    }

    function BeginState()
    {
        bJustLanded = false;
        // End:0x3c
        if(MoveTarget != none && Enemy == none || Focus != Enemy)
        {
            FaceActor(1.50);
        }
        // End:0x5e
        if(Enemy == none || Focus != Enemy)
        {
            StopFiring();
        }
    }

Begin:
    // End:0x23
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        WhatToDoNext(150);
    }
    // End:0xeb
    if(Pawn.PhysicsVolume.Gravity.Z > 0.90 * Pawn.PhysicsVolume.default.Gravity.Z)
    {
        // End:0xc2
        if(MoveTarget == none || MoveTarget.Location.Z > Pawn.Location.Z)
        {
            NotifyMissedJump();
            // End:0xbf
            if(MoveTarget != none)
            {
                MoveToward(MoveTarget, Focus,, true);
            }
        }
        // End:0xeb
        else
        {
            // End:0xdd
            if(Physics != 2)
            {
                WhatToDoNext(151);
            }
            // End:0xeb
            else
            {
                Sleep(0.50);
                goto 'Begin';
            }
        }
    }
    WaitForLanding();
    WhatToDoNext(50);
}

state Testing
{
    ignores ReceiveWarning;

    function WhatToDoNext(byte CallingByte);
    function Celebrate()
    {
        Log(string(self) $ " Celebrate while dead");
    }

    function SetAttractionState()
    {
        Log(string(self) $ " SetAttractionState while dead");
    }

    function EnemyChanged(bool bNewEnemyVisible)
    {
        Log(string(self) $ " EnemyChanged while dead");
    }

    function WanderOrCamp(bool bMayCrouch)
    {
        Log(string(self) $ " WanderOrCamp while dead");
    }

    function bool AvoidCertainDeath()
    {
        Pawn.SetLocation(TestStart.Location);
        MoveTimer = -1.0;
        return true;
    }

    function Timer();
    function FindNextMoveTarget()
    {
        local NavigationPoint N;
        local bool bFoundStart;
        local int i;

        bFoundStart = TestStart == none;
        Pawn.Health = 100;
        N = Level.NavigationPointList;
        J0x34:
        // End:0x25d [While If]
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
                // End:0x230 [While If]
                if(i < N.PathList.Length)
                {
                    // End:0x226
                    if(JumpSpot(N.PathList[i].End) != none && N.PathList[i].bForced)
                    {
                        Log("Test translocation from " $ string(N) $ " to " $ string(N.PathList[i].End));
                        Pawn.SetLocation(N.Location + Pawn.CollisionHeight - N.CollisionHeight * vect(0.0, 0.0, 1.0));
                        Pawn.Anchor = N;
                        TestStart = N;
                        TestPath = i + 1;
                        MoveTarget = N.PathList[i].End;
                        JumpSpot(N.PathList[i].End).bOnlyTranslocator = true;
                        ClientSetRotation(rotator(MoveTarget.Location - Pawn.Location));
                        return;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x85;
                }
            }
            // End:0x246
            if(N == TestStart)
            {
                TestPath = 0;
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x34;
        }
        TestStart = none;
        TestPath = 0;
        // End:0x283
        if(bSingleTestSection)
        {
            GotoState('Testing', 'AllFinished');
        }
        // End:0x28f
        else
        {
            GotoState('Testing', 'Finished');
        }
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
        // End:0x2e7 [While If]
        if(N != none)
        {
            // End:0x56
            if(N == TestStart)
            {
                bFoundStart = true;
            }
            // End:0x2ba
            if(bFoundStart && JumpPad(N) == none && TestPath < N.PathList.Length)
            {
                i = TestPath;
                J0x97:
                // End:0x2ba [While If]
                if(i < N.PathList.Length)
                {
                    // End:0x2b0
                    if(JumpSpot(N.PathList[i].End) != none && N.PathList[i].bForced)
                    {
                        JumpSpot(N.PathList[i].End).bOnlyTranslocator = JumpSpot(N.PathList[i].End).bRealOnlyTranslocator;
                        // End:0x2b0
                        if(JumpSpot(N.PathList[i].End).SpecialCost(Pawn, N.PathList[i]) < 1000000)
                        {
                            Log("Test " $ GoalString $ " from " $ string(N) $ " to " $ string(N.PathList[i].End));
                            Pawn.SetLocation(N.Location + Pawn.CollisionHeight - N.CollisionHeight * vect(0.0, 0.0, 1.0));
                            Pawn.Anchor = N;
                            TestStart = N;
                            TestPath = i + 1;
                            MoveTarget = N.PathList[i].End;
                            ClientSetRotation(rotator(MoveTarget.Location - Pawn.Location));
                            return;
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x97;
                }
            }
            // End:0x2d0
            if(N == TestStart)
            {
                TestPath = 0;
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x34;
        }
        TestStart = none;
        TestPath = 0;
        // End:0x30d
        if(bSingleTestSection)
        {
            GotoState('Testing', 'AllFinished');
        }
        // End:0x319
        else
        {
            GotoState('Testing', TestLabel);
        }
    }

    function SetLowGrav(bool bSet)
    {
        local PhysicsVolume V;

        // End:0x4c
        if(bSet)
        {
            // End:0x48
            foreach AllActors(class'PhysicsVolume', V)
            {
                V.Gravity.Z = FMax(V.Gravity.Z, -300.0);                                
            }
        }
        // End:0x85
        else
        {
            // End:0x84
            foreach AllActors(class'PhysicsVolume', V)
            {
                V.Gravity.Z = V.default.Gravity.Z;                                
            }
        }
    }

    function EndState()
    {
        Log(string(self) $ " leaving test state");
    }

    function BeginState()
    {
        bHasImpactHammer = false;
        bAllowedToImpactJump = false;
        Log(string(self) $ " entering test state");
        SetTimer(0.0, false);
        Skill = 7.0;
    }

Begin:
    // End:0x76
    if(Pawn.Weapon == none)
    {
        Pawn.PendingWeapon = wWeapon(Pawn.FindInventoryType(class<Inventory>(DynamicLoadObject("XWeapons.Translauncher", class'Class'))));
        Pawn.ChangedWeapon();
        Sleep(0.50);
    }
    bAllowedToTranslocate = true;
    bHasTranslocator = true;
    GoalString = "TRANSLOCATING";
    FindNextMoveTarget();
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    MoveToward(MoveTarget);
    // End:0xfe
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));
    }
    // End:0x15a
    else
    {
        // End:0x14e
        if(Pawn.Health < 100)
        {
            Log("TOOK DAMAGE " $ string(100 - Pawn.Health) $ " but succeeded");
        }
        // End:0x15a
        else
        {
            Log("Success!");
        }
    }
    goto 'Begin';
Finished:

    // End:0x19e
    if(!bAllowedToImpactJump)
    {
        Pawn.GiveWeapon("XWeapons.ShieldGun");
        bAllowedToImpactJump = true;
        Sleep(0.50);
    }
    TestLabel = 'FinishedJumping';
    bAllowedToTranslocate = false;
    bHasImpactHammer = true;
    bHasTranslocator = false;
    Pawn.bCanDoubleJump = true;
    GoalString = "DOUBLE/IMPACT JUMPING";
    FindNextJumpTarget();
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    MoveToward(MoveTarget);
    // End:0x252
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));
    }
    // End:0x2ae
    else
    {
        // End:0x2a2
        if(Pawn.Health < 100)
        {
            Log("TOOK DAMAGE " $ string(100 - Pawn.Health) $ " but succeeded");
        }
        // End:0x2ae
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
    Pawn.JumpZ = Pawn.default.JumpZ * 1.50;
    Pawn.GroundSpeed = Pawn.default.GroundSpeed * 1.40;
    GoalString = "COMBO JUMPING";
    FindNextJumpTarget();
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    MoveToward(MoveTarget);
    // End:0x3c1
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));
    }
    // End:0x41d
    else
    {
        // End:0x411
        if(Pawn.Health < 100)
        {
            Log("TOOK DAMAGE " $ string(100 - Pawn.Health) $ " but succeeded");
        }
        // End:0x41d
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
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    MoveToward(MoveTarget);
    // End:0x51a
    if(!Pawn.ReachedDestination(MoveTarget))
    {
        Log("FAILED to reach " $ string(MoveTarget));
    }
    // End:0x576
    else
    {
        // End:0x56a
        if(Pawn.Health < 100)
        {
            Log("TOOK DAMAGE " $ string(100 - Pawn.Health) $ " but succeeded");
        }
        // End:0x576
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
}

defaultproperties
{
    bLeadTarget=true
    Aggressiveness=0.40
    LastAttractCheck=-10000.0
    BaseAggressiveness=0.40
    CombatStyle=0.20
    TranslocUse=1.0
    ScriptedCombat=3
    LastSearchTime=-10000.0
    ComboNames[0]="wGame.ComboSpeed"
    ComboNames[1]="wGame.ComboBerserk"
    ComboNames[2]="wGame.ComboDefensive"
    ComboNames[3]="wGame.ComboInvis"
    OrderNames[0]=Defend
    OrderNames[1]=HOLD
    OrderNames[2]=Attack
    OrderNames[3]=Follow
    OrderNames[4]=Freelance
    OrderNames[10]=Attack
    OrderNames[11]=Defend
    OrderNames[12]=Defend
    OrderNames[13]=Attack
    OrderNames[14]=Attack
    FovAngle=85.0
    bIsPlayer=true
    OldMessageTime=-100.0
    PlayerReplicationInfoClass=class'TeamPlayerReplicationInfo'
}