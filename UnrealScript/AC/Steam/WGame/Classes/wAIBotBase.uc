/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIBotBase.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:42
 *	States:7
 *
 *******************************************************************************/
class wAIBotBase extends AIController
    dependson(TargetingSystem)
    dependson(MemoryItem)
    dependson(ShortMemory)
    dependson(Goal)
    dependson(wHelicopter)
    dependson(wPawn)
    dependson(wAILevel)
    dependson(Goal_PlanAndExec)
    dependson(Goal_Fire)
    dependson(Goal_MovePathToward)
    dependson(Goal_Roam)
    dependson(Goal_Shoot)
    dependson(Goal_Test)
    dependson(wActionPlanner)
    dependson(wPurposeExplore)
    dependson(wActionContainer)
    dependson(wState)
    dependson(wAIPawn)
    dependson(wFutureState)
    native;

var Goal Goal;
var wFutureState FutureState;
var ShortMemory Memory;
var TargetingSystem TargetSystem;
var wActionPlanner Planner;
var wPlanMaster PlanMaster;
var wAILevel AILevel;
var wNPCParam NPCParam;
var wNPCActions npcActions;
var float UpdateElapsed;
var float UpdateInterval;
var bool TrySprint;
var float DeadTime;
var float LastRestartRequestTime;
var bool bDrawPath;
var array<float> NavExtraCosts;
var array<float> NavDetourExtraCosts;
var float NavExtraCostFactor_VisCount;
var float NavExtraCostFactor_DetourScore;
var float NavExtraCostFactor_DetourMaxDistFactor;
var wFlagObjectiveBase LastTargetFlag;
var name StateOnPossess;
var Vector UpVector;

function bool WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
    return false;
}

function ClearReferences()
{
    Log("[wAIBotBase::ClearRefenreces]");
    Memory.ClearReferences();
    TargetSystem.ClearReferences();
    Focus = none;
    Caller = none;
    MoveTarget = none;
    Enemy = none;
    Target = none;
}

event PostBeginPlay()
{
    super(Controller).PostBeginPlay();
}

function InitBot(int Grade)
{
    local wNPCItemGroupParam npcItemParam;

    NavExtraCosts.Length = Level.VisibilityOneRowCount;
    NavDetourExtraCosts.Length = Level.VisibilityOneRowCount;
    AILevel = wAILevel(Level.GetAILevel());
    // End:0x9a
    if(PlayerReplicationInfo.NPCID == 0 || DeathMatch(Level.Game).GiveBotsFakeUID == true)
    {
        NPCParam = AILevel.GetNPCParam(Grade);
    }
    // End:0xbd
    else
    {
        NPCParam = AILevel.GetNPCParamByNPCID(PlayerReplicationInfo.NPCID);
    }
    npcActions = AILevel.GetNPCAction(NPCParam.ActionGroupID);
    PlayerReplicationInfo.PlayerName = AILevel.GetName(NPCParam.NameGroupID);
    PlayerReplicationInfo.ClassLevel = NPCParam.Lv;
    PlayerReplicationInfo.bPrecached = true;
    // End:0x180
    if(!Level.Game.bTeamGame)
    {
        PlayerReplicationInfo.TeamID = Level.Game.PopNextTeam();
    }
    Planner = class'wActionPlanner'.static.Create(self, npcActions);
    PlanMaster = AILevel.PlanMaster;
    FutureState = class'wFutureState'.static.Create();
    NavExtraCostFactor_VisCount = NPCParam.SafeWeightMin + FRand() * NPCParam.SafeWeightMax - NPCParam.SafeWeightMin;
    InitNavExtraCost();
    NavExtraCostFactor_DetourMaxDistFactor = NPCParam.DetourRate;
    NavExtraCostFactor_DetourScore = NPCParam.DetourWeightMin + FRand() * NPCParam.DetourWeightMax - NPCParam.DetourWeightMin;
    AILevel.RegisterBot(self);
    npcItemParam = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF);
    // End:0x2a9
    if(npcItemParam != none)
    {
        PlayerReplicationInfo.iBodyItemID_0 = npcItemParam.ItemID;
    }
    npcItemParam = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA);
    // End:0x2f4
    if(npcItemParam != none)
    {
        PlayerReplicationInfo.iBodyItemID_1 = npcItemParam.ItemID;
    }
    npcItemParam = AILevel.GetItemParamByGroupID(NPCParam.FaceGroupID);
    // End:0x33f
    if(npcItemParam != none)
    {
        PlayerReplicationInfo.iHeadItemID = npcItemParam.ItemID;
    }
    npcItemParam = AILevel.GetItemParamByGroupID(NPCParam.HeadGroupID);
    // End:0x38a
    if(npcItemParam != none)
    {
        PlayerReplicationInfo.iHelmetItemID = npcItemParam.ItemID;
    }
    npcItemParam = AILevel.GetItemParamByGroupID(NPCParam.AccessoryGroupID);
    // End:0x3d5
    if(npcItemParam != none)
    {
        PlayerReplicationInfo.iAccessoryItemID = npcItemParam.ItemID;
    }
}

function SetName(wNPCParam Param)
{
    local int lp1;
    local Controller C;
    local string nameCandidate;

    lp1 = 0;
    J0x07:
    // End:0xa7 [While If]
    if(true)
    {
        nameCandidate = "ghost" $ string(lp1);
        C = Level.ControllerList;
        J0x35:
        // End:0x7b [While If]
        if(C != none)
        {
            // End:0x64
            if(C.PlayerReplicationInfo.PlayerName == nameCandidate)
            {
            }
            // End:0x7b
            else
            {
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x35;
            }
        }
        // End:0x9d
        if(C == none)
        {
            PlayerReplicationInfo.PlayerName = nameCandidate;
        }
        // End:0xa7
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function SetPawnClass(string inClass, string InCharacter);
function SetupWeapons(Pawn aPawn)
{
    local int i, lp1;
    local array<wNPCItemGroupParam> items;

    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.MainWeaponGroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.PistolGroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.Grenade1GroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.Grenade2GroupID);
    lp1 = 0;
    J0xaf:
    // End:0x13d [While If]
    if(lp1 < items.Length)
    {
        // End:0x133
        if(items[lp1] != none)
        {
            wPawn(aPawn).wRequiredEquipment[i] = items[lp1].ItemID;
            wPawn(aPawn).wRequiredParts[i] = items[lp1].PartsID;
            ++ i;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xaf;
    }
    wPawn(aPawn).wRequiredEquipment[++ i] = 0;
    wPawn(aPawn).Health = NPCParam.HP;
    wPawn(aPawn).HealthMax = float(NPCParam.HP);
}

function NotifyAddInventory(Inventory NewItem);
function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(1);
}

// Export UwAIBotBase::execSetupWStateNative(FFrame&, void* const)
native function SetupWStateNative(out wState S);
function SetupWState(out wState S)
{
    SetupWStateNative(S);
}

function SetupWStateScript(out wState S)
{
    local float MaxAmmoPrimary, CurAmmoPrimary;
    local int lp1, myTeam;
    local wAIPawn aiPawn;
    local wWeapon Weapon;
    local Inventory Inv;

    S.Ammo = class'wState'.default.Ammo;
    S.MaxAmmo = class'wState'.default.MaxAmmo;
    S.Magazine = class'wState'.default.Magazine;
    S.NumFragGrenade = class'wState'.default.NumFragGrenade;
    S.NumStunGrenade = class'wState'.default.NumStunGrenade;
    S.NumSmokeGrenade = class'wState'.default.NumSmokeGrenade;
    S.CurrentWeapon = class'wState'.default.CurrentWeapon;
    S.Weapons = class'wState'.default.Weapons;
    S.SwitchWeaponCount = class'wState'.default.SwitchWeaponCount;
    S.IsCrouch = class'wState'.default.IsCrouch;
    S.IsStand = class'wState'.default.IsStand;
    S.IsProne = class'wState'.default.IsProne;
    S.FreeHead = class'wState'.default.FreeHead;
    S.FreeHands = class'wState'.default.FreeHands;
    S.FreeLegs = class'wState'.default.FreeLegs;
    S.CannotFindPath = class'wState'.default.CannotFindPath;
    S.Health = class'wState'.default.Health;
    S.PropsectDealtDamage = class'wState'.default.PropsectDealtDamage;
    S.ProspectTakenDamage = class'wState'.default.ProspectTakenDamage;
    S.HasSupplyHelicopter = class'wState'.default.HasSupplyHelicopter;
    S.HasSupplyUAV = class'wState'.default.HasSupplyUAV;
    S.HasSupplyAirstrike = class'wState'.default.HasSupplyAirstrike;
    S.Location = class'wState'.default.Location;
    S.Target = class'wState'.default.Target;
    S.TargetVisible = class'wState'.default.TargetVisible;
    S.TargetReachable = class'wState'.default.TargetReachable;
    S.TargetChangeCount = class'wState'.default.TargetChangeCount;
    S.CanMeleeTarget = class'wState'.default.CanMeleeTarget;
    S.MeetNewEnemyProbabilty = class'wState'.default.MeetNewEnemyProbabilty;
    S.Time = class'wState'.default.Time;
    S.NumCapturedFlags = class'wState'.default.NumCapturedFlags;
    S.FlagIamOn = class'wState'.default.FlagIamOn;
    S.World_NumAllies = class'wState'.default.World_NumAllies;
    S.World_NumEnemies = class'wState'.default.World_NumEnemies;
    S.World_IsSDRespawnTime = class'wState'.default.World_IsSDRespawnTime;
    S.World_TeamGame = class'wState'.default.World_TeamGame;
    S.IsFlashed = wFlashForce > 0.30;
    S.World_Helicopter = Level.Helicopters.Length > 0;
    S.World_Airstrike = false;
    S.Owner = self;
    // End:0x99e
    if(Pawn != none)
    {
        aiPawn = wAIPawn(Pawn);
        // End:0x7a8
        if(Pawn.Weapon != none)
        {
            // End:0x4eb
            if(Pawn.PendingWeapon == none)
            {
                Weapon = Pawn.Weapon;
            }
            // End:0x4ff
            else
            {
                Weapon = Pawn.PendingWeapon;
            }
            // End:0x7a8
            if(Weapon.InventoryGroup == 1 || Weapon.InventoryGroup == 2)
            {
                Weapon.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
                S.Ammo = int(CurAmmoPrimary);
                S.MaxAmmo = Weapon.BaseParams.iAmmo_Magazine;
                S.Magazine = int(MaxAmmoPrimary);
                S.CurrentWeapon = Weapon.BaseParams;
                Inv = Pawn.Inventory;
                J0x5ca:
                // End:0x7a8 [While If]
                if(Inv != none)
                {
                    Weapon = wWeapon(Inv);
                    // End:0x791
                    if(Weapon != none)
                    {
                        // End:0x647
                        if(Weapon.BaseParams.iWeaponID == 6000 || Weapon.BaseParams.iWeaponID == 6003)
                        {
                            ++ S.NumFragGrenade;
                        }
                        // End:0x791
                        else
                        {
                            // End:0x67b
                            if(Weapon.BaseParams.iWeaponID == 6001)
                            {
                                ++ S.NumSmokeGrenade;
                            }
                            // End:0x791
                            else
                            {
                                // End:0x6af
                                if(Weapon.BaseParams.iWeaponID == 6000)
                                {
                                    ++ S.NumStunGrenade;
                                }
                                // End:0x791
                                else
                                {
                                    // End:0x72a
                                    if(Weapon.BaseParams.iWeaponID == 5006 || Weapon.BaseParams.iWeaponID == 5007 || Weapon.BaseParams.iWeaponID == 5008)
                                    {
                                        S.HasSupplyAirstrike = true;
                                    }
                                    // End:0x791
                                    else
                                    {
                                        // End:0x75f
                                        if(Weapon.BaseParams.iWeaponID == 5009)
                                        {
                                            S.HasSupplyHelicopter = true;
                                        }
                                        // End:0x791
                                        else
                                        {
                                            // End:0x791
                                            if(Weapon.BaseParams.iWeaponID == 5010)
                                            {
                                                S.HasSupplyUAV = true;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Inv = Inv.Inventory;
                    // This is an implied JumpToken; Continue!
                    goto J0x5ca;
                }
            }
        }
        S.FreeHands = true;
        S.FreeHead = true;
        S.FreeLegs = true;
        S.CannotFindPath = aiPawn.CannotFindPath;
        S.Location = Pawn.Location;
        S.IsCrouch = Pawn.bIsCrouched || Pawn.bIsCrouching;
        S.IsProne = Pawn.bIsProned || Pawn.bIsProning;
        S.IsStand = !S.IsCrouch && !S.IsProne;
        // End:0x94d
        if(Target != none && Pawn(Target) != none)
        {
            S.Target = Memory.GetByPawn(Pawn(Target));
            // End:0x94d
            if(S.Target != none)
            {
                S.TargetVisible = S.Target.IsVisible;
                S.TargetReachable = actorReachable(Target);
            }
        }
        S.TargetChangeCount = 0;
        S.NumCapturedFlags = 0;
        S.FlagIamOn = wFlagObjectiveBase(Level.Game.GetNearFlag(Pawn));
    }
    myTeam = GetTeamNum();
    lp1 = 0;
    J0x9b1:
    // End:0xa1f [While If]
    if(lp1 < Level.PawnList.Length)
    {
        // End:0xa05
        if(myTeam == Level.PawnList[lp1].GetTeamNum())
        {
            ++ S.World_NumAllies;
        }
        // End:0xa15
        else
        {
            ++ S.World_NumEnemies;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x9b1;
    }
    S.World_IsSDRespawnTime = Level.Game.IsSDRespawnTime();
    S.World_TeamGame = Level.Game.bTeamGame;
}

function float EvaluateState(wState S)
{
    return float(S.PropsectDealtDamage);
}

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    local Controller C;
    local wActionContainer bestPlan;
    local float bestPlanScore;

    P1 = Locs(P1);
    clog("wAIBot " $ PlayerReplicationInfo.PlayerName $ " is listening");
    switch(P1)
    {
        // End:0x4a
        case "?":
        // End:0xa5
        case "help":
            clog("moveto [player name]");
            clog("set goal roam/shoot");
            clog("set drawpath 0/1");
            // End:0x56e
            break;
        // End:0x239
        case "moveto":
            C = Level.ControllerList;
            J0xc4:
            // End:0x18c [While If]
            if(C != none)
            {
                // End:0x175
                if(C.Pawn != none && Locs(C.PlayerReplicationInfo.PlayerName) == Locs(P2))
                {
                    Goal = Goal_MovePathToward(AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(self, C.Pawn);
                    clog("found " $ C.PlayerReplicationInfo.PlayerName);
                }
                // End:0x18c
                else
                {
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0xc4;
                }
            }
            // End:0x236
            if(C == none && Level.GetLocalPlayerController().Pawn != none)
            {
                Goal = Goal_MovePathToward(AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(self, Level.GetLocalPlayerController().Pawn);
                clog("found nobody, moveto local player controller");
            }
            // End:0x56e
            break;
        // End:0x3dd
        case "set":
            switch(Locs(P2))
            {
                // End:0x36d
                case "goal":
                    switch(Locs(p3))
                    {
                        // End:0x2ac
                        case "roam":
                            Goal = Goal_Roam(AILevel.PoolGoal.AllocateObject(class'Goal_Roam')).Init(self);
                            clog("Goal_Roam");
                            // End:0x36a
                            break;
                        // End:0x317
                        case "shoot":
                            Goal = Goal_Shoot(AILevel.PoolGoal.AllocateObject(class'Goal_Shoot')).Init(self, Level.GetLocalPlayerController().Pawn, true);
                            clog("Goal_Shoot");
                            // End:0x36a
                            break;
                        // End:0x367
                        case "test":
                            Goal = Goal_Test(AILevel.PoolGoal.AllocateObject(class'Goal_Test')).Init(self);
                            clog("Goal_Test");
                            // End:0x36a
                            break;
                        // End:0xffff
                        default:
                            // End:0x3da Break;
                            break;
                }
                // End:0x3d7
                case "drawpath":
                    switch(p3)
                    {
                        // End:0x392
                        case "0":
                            bDrawPath = false;
                            // End:0x3b8
                            break;
                        // End:0x3a3
                        case "1":
                            bDrawPath = true;
                            // End:0x3b8
                            break;
                        // End:0xffff
                        default:
                            bDrawPath = !bDrawPath;
                            // End:0x3b8 Break;
                            break;
                    }
                    clog("bDrawPath=" $ string(bDrawPath));
                    // End:0x3da
                    break;
                // End:0xffff
                default:
                    // End:0x56e Break;
                    break;
        }
        // End:0x4ca
        case "run":
            switch(Locs(P2))
            {
                // End:0x408
                case "initnavextra":
                    InitNavExtraCost();
                    // End:0x4c7
                    break;
                // End:0x422
                case "copynavextra":
                    CopyNavExtraCost();
                    // End:0x4c7
                    break;
                // End:0x473
                case "updatenavdetourextra":
                    UpdateNavDetourExtraCost(Pawn.Location, Level.GetLocalPlayerController().Pawn.Location);
                    // End:0x4c7
                    break;
                // End:0x48d
                case "zeronavextra":
                    ZeroExtraCost();
                    // End:0x4c7
                    break;
                // End:0x4c4
                case "findpathtoward":
                    MoveTarget = FindPathToward(Level.GetLocalPlayerController().Pawn);
                    // End:0x4c7
                    break;
                // End:0xffff
                default:
                    // End:0x56e Break;
                    break;
        }
        // End:0x4ff
        case "see":
            switch(Locs(P2))
            {
                // End:0xffff
                default:
                    SeePlayer(Level.GetLocalPlayerController().Pawn);
                    // End:0x4ff Break;
                    break;
        }
        // End:0x56b
        case "plan":
            bestPlan = Planner.Plan(class'wPurposeExplore'.static.Create(self), 100, bestPlanScore);
            clog("bestPlanScore=" $ string(bestPlanScore));
            clog(bestPlan.ToString());
            // End:0x56e
            break;
        // End:0xffff
        default:
}

function InitNavExtraCost()
{
    local NavigationPoint N;
    local int ExtraCost, maxVisCount;

    maxVisCount = 1;
    N = Level.NavigationPointList;
    J0x1b:
    // End:0x69 [While If]
    if(N != none)
    {
        // End:0x52
        if(maxVisCount < N.VisCount)
        {
            maxVisCount = N.VisCount;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
    maxVisCount *= float(maxVisCount);
    N = Level.NavigationPointList;
    J0x8b:
    // End:0x109 [While If]
    if(N != none)
    {
        ExtraCost = 0;
        ExtraCost += int(float(N.VisCount * N.VisCount) / float(maxVisCount) * NavExtraCostFactor_VisCount);
        NavExtraCosts[N.VisID] = float(ExtraCost);
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x8b;
    }
}

// Export UwAIBotBase::execUpdateNavDetourExtraCostNative(FFrame&, void* const)
native function UpdateNavDetourExtraCostNative(Vector S, Vector E);
function UpdateNavDetourExtraCost(Vector S, Vector E)
{
    UpdateNavDetourExtraCostNative(S, E);
}

function UpdateNavDetourExtraCostScript(Vector S, Vector E)
{
    local float segmentDist, dist, Extra;
    local Vector N;
    local NavigationPoint np;

    segmentDist = S.X - E.X * S.X - E.X + S.Y - E.Y * S.Y - E.Y;
    segmentDist *= NavExtraCostFactor_DetourMaxDistFactor;
    np = Level.NavigationPointList;
    J0x84:
    // End:0x1da [While If]
    if(np != none)
    {
        N = np.Location;
        dist = S.X - N.X * S.X - N.X + S.Y - N.Y * S.Y - N.Y;
        dist += E.X - N.X * E.X - N.X + E.Y - N.Y * E.Y - N.Y;
        // End:0x19e
        if(dist < segmentDist)
        {
            Extra = 1.0 - dist / segmentDist * NavExtraCostFactor_DetourScore;
        }
        // End:0x1a9
        else
        {
            Extra = 0.0;
        }
        NavDetourExtraCosts[np.VisID] = Extra;
        np = np.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x84;
    }
}

function CopyNavExtraCost()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:
    // End:0x71 [While If]
    if(N != none)
    {
        N.ExtraCost = int(NavExtraCosts[N.VisID] + NavDetourExtraCosts[N.VisID]);
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ZeroExtraCost()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:
    // End:0x46 [While If]
    if(N != none)
    {
        N.ExtraCost = 0;
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ClientOnEndWaitingForStart()
{
    GotoState(StateOnPossess);
}

function PawnDied(Pawn P)
{
    super(Controller).PawnDied(P);
    DeadTime = Level.TimeSeconds;
    Memory.RemoveAll();
    Goal.HandleMessage(class'Goal'.default.MessageNotifyDied);
}

function SetSprint(bool Value)
{
    TrySprint = Value;
}

function bool IsSprinting()
{
    return Pawn.bIsSprinting;
}

function TryStandUp()
{
    Pawn.bWantsToCrouch = false;
    Pawn.bWantsToProne = false;
}

function bool IsStandingUp()
{
    return !IsCrouching() && !IsProning();
}

function TryCrouch()
{
    Pawn.bWantsToCrouch = true;
}

function bool IsCrouching()
{
    return Pawn.bIsCrouched;
}

function TryProne()
{
    Pawn.bWantsToProne = true;
    Pawn.bWantsToCrouch = true;
}

function bool IsProning()
{
    return Pawn.bIsProned;
}

function wClientFlash(float fTime)
{
    super(Controller).wClientFlash(fTime);
    Goal.HandleMessage(class'Goal'.default.MessageFlashed);
}

function HandleMessage(string Msg)
{
    Goal.HandleMessage(Msg);
}

function OnMemoryVisibleChanged()
{
    Goal.HandleMessage(class'Goal'.default.MessageMemoryVisibleChanged);
}

function NotifyVehicle(Vehicle V)
{
    SeePlayer(V);
}

event SeePlayer(Pawn SeenPlayer)
{
    Memory.ByVision(SeenPlayer);
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    local wPawn P;

    P = wPawn(NoiseMaker);
    // End:0x51
    if(P != none && P.Controller.bIsPlayer)
    {
        Memory.BySound(P, Loudness);
    }
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    super(Controller).NotifyKilled(Killer, Killed, KilledPawn);
    // End:0x2b
    if(Target == KilledPawn)
    {
        Target = none;
    }
    // End:0x41
    if(Focus == KilledPawn)
    {
        Focus = none;
    }
    // End:0x60
    if(Memory != none)
    {
        Memory.RemoveByPawn(KilledPawn);
    }
}

function bool CallHelicopter(optional bool ignoreSupply)
{
    local wHelicopter P;

    // End:0x14
    foreach DynamicActors(class'wHelicopter', P)
    {        
    }
    return false;        
    return class'wHelicopter'.static.Call(Level, none, self);
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator LookDir, R;
    local Pawn pawnTarget;
    local Coords C;
    local Vector HeadLoc, lookVect, rightVect, vel1, vel2;

    local float aimErrorMax, movementFactor, dist, distRatio, distFactorMin, distFactorMax,
	    outerRange, aimErrorX, aimErrorY;

    pawnTarget = Pawn(Target);
    AimError = 0;
    // End:0x3e1
    if(pawnTarget != none)
    {
        outerRange = 10000.0;
        dist = VSize(pawnTarget.Location - Pawn.Location);
        dist = FMin(dist, outerRange);
        // End:0x111
        if(dist <= NPCParam.CloseRange)
        {
            distRatio = dist / NPCParam.CloseRange;
            distFactorMin = NPCParam.ZeroRangeSpreadMin + distRatio * NPCParam.CloseRangeSpreadMin - NPCParam.ZeroRangeSpreadMin;
            distFactorMax = NPCParam.ZeroRangeSpreadMax + distRatio * NPCParam.CloseRangeSpreadMax - NPCParam.ZeroRangeSpreadMax;
        }
        // End:0x285
        else
        {
            // End:0x1dd
            if(dist <= NPCParam.EffectiveRange)
            {
                distRatio = dist - NPCParam.CloseRange / NPCParam.EffectiveRange - NPCParam.CloseRange;
                distFactorMin = NPCParam.CloseRangeSpreadMin + distRatio * NPCParam.EffectiveRangeSpreadMin - NPCParam.CloseRangeSpreadMin;
                distFactorMax = NPCParam.CloseRangeSpreadMax + distRatio * NPCParam.EffectiveRangeSpreadMax - NPCParam.CloseRangeSpreadMax;
            }
            // End:0x285
            else
            {
                distRatio = dist - NPCParam.EffectiveRange / outerRange - NPCParam.EffectiveRange;
                distFactorMin = NPCParam.EffectiveRangeSpreadMin + distRatio * NPCParam.OuterRangeSpreadMin - NPCParam.EffectiveRangeSpreadMin;
                distFactorMax = NPCParam.EffectiveRangeSpreadMax + distRatio * NPCParam.OuterRangeSpreadMax - NPCParam.EffectiveRangeSpreadMax;
            }
        }
        lookVect = vector(Pawn.Rotation);
        lookVect.Z = 0.0;
        rightVect = Normal(lookVect Cross UpVector);
        vel1 = Pawn.Velocity;
        vel2 = pawnTarget.Velocity;
        vel1 = rightVect * vel1 Dot rightVect;
        vel2 = rightVect * vel2 Dot rightVect;
        movementFactor = FMin(1.0, VSize(vel1 - vel2) / 1000.0);
        distFactorMin *= Pawn.Weapon.BaseParams.fNPCSpreadRate;
        distFactorMax *= Pawn.Weapon.BaseParams.fNPCSpreadRate;
        aimErrorMax = distFactorMin + movementFactor * distFactorMax - distFactorMin;
        aimErrorX = FRand() * aimErrorMax * float(2) - aimErrorMax;
        aimErrorY = FRand() * aimErrorMax * float(2) - aimErrorMax;
    }
    // End:0x4ba
    if(pawnTarget != none && pawnTarget.DrivenVehicle == none && FRand() < NPCParam.HeadshotChance || pawnTarget.DrivenVehicle != none && FRand() < NPCParam.HeadshotChanceMG)
    {
        C = pawnTarget.GetBoneCoords(pawnTarget.HeadBone);
        HeadLoc = C.Origin;
        LookDir = rotator(HeadLoc - projStart);
        aimErrorX *= NPCParam.HeadshotSpreadRate;
        aimErrorY *= NPCParam.HeadshotSpreadRate;
    }
    // End:0x4d7
    else
    {
        LookDir = rotator(Target.Location - projStart);
    }
    LookDir.Yaw = SetFireYaw(LookDir.Yaw);
    LookDir.Yaw += int(aimErrorX);
    LookDir.Pitch += int(aimErrorY);
    return LookDir;
}

function int SetFireYaw(int FireYaw)
{
    FireYaw = FireYaw & 65535;
    // End:0xe3
    if(Pawn.Physics != 0 && Pawn.Physics != 13 && Abs(float(FireYaw - Rotation.Yaw & 65535)) > float(8192) && Abs(float(FireYaw - Rotation.Yaw & 65535)) < float(57343))
    {
        // End:0xcc
        if(ClockwiseFrom_IntInt(FireYaw, Rotation.Yaw))
        {
            FireYaw = Rotation.Yaw + 8192;
        }
        // End:0xe3
        else
        {
            FireYaw = Rotation.Yaw - 8192;
        }
    }
    return FireYaw;
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    local float ammoMax, Ammo;
    local string targetName, supposedTargetName;
    local MemoryItem supposedTarget;

    super.DisplayDebug(C, YL, YPos);
    // End:0x4a
    if(Pawn(Target) != none)
    {
        targetName = Pawn(Target).PlayerReplicationInfo.PlayerName;
    }
    // End:0x52
    else
    {
        targetName = "";
    }
    supposedTarget = TargetSystem.GetTarget();
    // End:0x7d
    if(supposedTarget == none)
    {
        supposedTargetName = "";
    }
    // End:0xa3
    else
    {
        supposedTargetName = supposedTarget.Pawn.PlayerReplicationInfo.PlayerName;
    }
    C.DrawColor = class'HUD'.default.CyanColor;
    C.SetPos(4.0, YPos += YL * float(2));
    C.DrawText("[wAIBot.TargetingSystem]");
    C.SetPos(4.0, YPos += YL);
    C.DrawText("target=" $ targetName $ " supposedTarget=" $ supposedTargetName);
    TargetSystem.DisplayDebug(C, YL, YPos);
    // End:0x462
    if(Pawn != none)
    {
        C.SetPos(4.0, YPos += YL * float(2));
        C.DrawText("[wAIBot.Actions]");
        C.SetPos(4.0, YPos += YL);
        C.DrawText("fLastFireNoiseTime=" $ string(Pawn.fLastFireNoiseTime));
        C.SetPos(4.0, YPos += YL);
        C.DrawText("IsSprinting=" $ string(IsSprinting()) $ " IsStandingUp=" $ string(IsStandingUp()) $ " IsCrouching=" $ string(IsCrouching()) $ " IsProning=" $ string(IsProning()));
        // End:0x462
        if(Pawn.Weapon != none)
        {
            Pawn.Weapon.GetAmmoCount(ammoMax, Ammo);
            YPos += YL;
            C.SetPos(4.0, YPos);
            C.DrawText("ReadyToFire=" $ string(Pawn.Weapon.ReadyToFire(0)) $ " iFireMode=" $ string(Pawn.Weapon.BaseParams.iFireMode) $ " ammo=" $ string(Ammo) $ " max=" $ string(ammoMax));
            YPos += YL;
            C.SetPos(4.0, YPos);
            C.DrawText("AimState=" $ string(GetEnum(enum'EWeaponAimState', wGun(Pawn.Weapon).AimState)) $ " bIsAiming=" $ string(Pawn.bIsAiming) $ " bIsFiring=" $ string(Pawn.Weapon.FireMode[0].bIsFiring));
        }
    }
    DisplayDebug_Path(C, YL, YPos);
    C.SetPos(4.0, YPos += YL * float(2));
    C.DrawText("[wAIBot.Memories] - name[dist,time]");
    Memory.DisplayDebug(C, YL, YPos);
    C.SetPos(4.0, YPos += YL * float(2));
    C.DrawText("[wAIBot.Goals]");
    Goal.DisplayDebug(C, 1, YL, YPos);
    YPos += YL;
}

function DisplayDebug_Path(Canvas C, out float YL, out float YPos)
{
    local Actor pp;
    local string ppStr;
    local int lp1;

    C.SetPos(4.0, YPos += YL * float(2));
    C.DrawText("[wAIBot.Path]");
    ppStr = "";
    lp1 = 0;
    J0x50:
    // End:0xfd [While If]
    if(lp1 < 16)
    {
        pp = RouteCache[lp1];
        // End:0x7e
        if(pp == none)
        {
            // This is an implied JumpToken;
            goto J0xfd;
        }
        // End:0xf3
        else
        {
            ppStr = ppStr $ string(pp.Name) $ " - ";
            // End:0xf3
            if(float(lp1 + 1) % float(5) == float(0))
            {
                C.SetPos(4.0, YPos += YL);
                C.DrawText(ppStr);
                ppStr = "";
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    J0xfd:
    // End:0x13a
    if(ppStr != "")
    {
        C.SetPos(4.0, YPos += YL);
        C.DrawText(ppStr);
    }
}

state WaitingForStart
{

}

state RoundEnded
{
    function Tick(float dt);

}

state Spectating
{
    function Tick(float dt)
    {
        local int A;

        A = 0;
    }

}

state Dummy
{
    function BeginState();
    function Tick(float dt)
    {
        // End:0x38
        if(Goal != none)
        {
            switch(Goal.Process(dt))
            {
                // End:0x26
                case 3:
                // End:0x35
                case 2:
                    Goal = none;
                    // End:0x38
                    break;
                // End:0xffff
                default:
                }
                bRun = byte(TrySprint);
                TickSprint(dt);
                HandleWalking();
                TickStance(dt);
    }

}

state Dummy_Fire extends Dummy
{
    function BeginState();
    function Tick(float dt)
    {
        // End:0x5c
        if(Goal == none)
        {
            Goal = Goal_Fire(AILevel.PoolGoal.AllocateObject(class'Goal_Fire')).Init(self, Level.GetLocalPlayerController().Pawn, false, 9999);
        }
        super.Tick(dt);
    }

}

state ProcessGoal
{
    function BeginState()
    {
        // End:0x43
        if(Goal == none)
        {
            Goal = Goal_PlanAndExec(AILevel.PoolGoal.AllocateObject(class'Goal_PlanAndExec')).Init(self, Planner);
        }
    }

    function Tick(float dt)
    {
        Memory.Update(dt);
        // End:0x81
        if(Goal != none)
        {
            UpdateElapsed += dt;
            // End:0x81
            if(UpdateElapsed > UpdateInterval)
            {
                Goal.SetFocus();
                switch(Goal.Process(UpdateElapsed))
                {
                    // End:0x64
                    case 3:
                    // End:0x73
                    case 2:
                        Goal = none;
                        // End:0x76
                        break;
                    // End:0xffff
                    default:
                        UpdateElapsed = 0.0;
                    }
                }
                bRun = byte(TrySprint);
                TickSprint(dt);
                HandleWalking();
                TickStance(dt);
                wViewFlash(dt);
    }

Move:
    // End:0x18
    if(MoveTarget != none)
    {
        MoveToward(MoveTarget, Focus);
    }
MovePosition:

    // End:0x35
    if(!IsZeroVector(Destination))
    {
        MoveTo(Destination, Focus);
    }
Begin:

    stop;
}

state Dead
{
    function Tick(float dt)
    {
        // End:0x86
        if(Level.Game.IsRightTimeForRespawn(self))
        {
            // End:0x86
            if(Level.TimeSeconds - DeadTime > Level.GRI.RespawnTime && Level.TimeSeconds - LastRestartRequestTime > float(1))
            {
                LastRestartRequestTime = Level.TimeSeconds;
                ServerReStartPlayer();
            }
        }
    }

}

defaultproperties
{
    UpdateInterval=0.0555560
    DeadTime=-999.0
    LastRestartRequestTime=-999.0
    StateOnPossess=ProcessGoal
    UpVector=(X=0.0,Y=0.0,Z=1.0)
    bIsPlayer=true
    PlayerReplicationInfoClass=class'wPlayerReplicationInfo'
    PawnClass=class'wAIPawn'
    RotationRate=(Pitch=3072,Yaw=30000,Roll=50000)
}