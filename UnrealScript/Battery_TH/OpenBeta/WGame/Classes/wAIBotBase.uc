class wAIBotBase extends AIController
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
    //return;    
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
    //return;    
}

event PostBeginPlay()
{
    super(Controller).PostBeginPlay();
    //return;    
}

function InitBot(int Grade)
{
    NavExtraCosts.Length = Level.VisibilityOneRowCount;
    NavDetourExtraCosts.Length = Level.VisibilityOneRowCount;
    AILevel = wAILevel(Level.GetAILevel());
    // End:0x75
    if(PlayerReplicationInfo.NPCID == 0)
    {
        NPCParam = AILevel.GetNPCParam(Grade);        
    }
    else
    {
        NPCParam = AILevel.GetNPCParamByNPCID(PlayerReplicationInfo.NPCID);
    }
    npcActions = AILevel.GetNPCAction(NPCParam.ActionGroupID);
    PlayerReplicationInfo.PlayerName = AILevel.GetName(NPCParam.NameGroupID);
    PlayerReplicationInfo.ClassLevel = NPCParam.Lv;
    PlayerReplicationInfo.bPrecached = true;
    // End:0x15B
    if(!Level.Game.bTeamGame)
    {
        PlayerReplicationInfo.TeamID = int(Level.Game.PopNextTeam());
    }
    Planner = Class'WGame_Decompressed.wActionPlanner'.static.Create(self, npcActions);
    PlanMaster = AILevel.PlanMaster;
    FutureState = Class'WGame_Decompressed.wFutureState'.static.Create();
    NavExtraCostFactor_VisCount = NPCParam.SafeWeightMin + (FRand() * (NPCParam.SafeWeightMax - NPCParam.SafeWeightMin));
    InitNavExtraCost();
    NavExtraCostFactor_DetourMaxDistFactor = NPCParam.DetourRate;
    NavExtraCostFactor_DetourScore = NPCParam.DetourWeightMin + (FRand() * (NPCParam.DetourWeightMax - NPCParam.DetourWeightMin));
    AILevel.RegisterBot(self);
    PlayerReplicationInfo.iBodyItemID_0 = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF).ItemID;
    PlayerReplicationInfo.iBodyItemID_1 = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA).ItemID;
    PlayerReplicationInfo.iHeadItemID = AILevel.GetItemParamByGroupID(NPCParam.FaceGroupID).ItemID;
    PlayerReplicationInfo.iHelmetItemID = AILevel.GetItemParamByGroupID(NPCParam.HeadGroupID).ItemID;
    PlayerReplicationInfo.iAccessoryItemID = AILevel.GetItemParamByGroupID(NPCParam.AccessoryGroupID).ItemID;
    //return;    
}

function SetName(wNPCParam Param)
{
    local int lp1;
    local Controller C;
    local string nameCandidate;

    lp1 = 0;
    J0x07:

    // End:0xA7 [Loop If]
    if(true)
    {
        nameCandidate = "ghost" $ string(lp1);
        C = Level.ControllerList;
        J0x35:

        // End:0x7B [Loop If]
        if(C != none)
        {
            // End:0x64
            if(C.PlayerReplicationInfo.PlayerName == nameCandidate)
            {
                // [Explicit Break]
                goto J0x7B;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x35;
        }
        J0x7B:

        // End:0x9D
        if(C == none)
        {
            PlayerReplicationInfo.PlayerName = nameCandidate;
            // [Explicit Break]
            goto J0xA7;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xA7:

    //return;    
}

function SetPawnClass(string inClass, string InCharacter)
{
    //return;    
}

function SetupWeapons(Pawn aPawn)
{
    local int i, lp1;
    local array<wNPCItemGroupParam> items;

    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.MainWeaponGroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.PistolGroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.Grenade1GroupID);
    items[items.Length] = AILevel.GetItemParamByGroupID(NPCParam.Grenade2GroupID);
    lp1 = 0;
    J0xAF:

    // End:0x13D [Loop If]
    if(lp1 < items.Length)
    {
        // End:0x133
        if(items[lp1] != none)
        {
            wPawn(aPawn).wRequiredEquipment[i] = items[lp1].ItemID;
            wPawn(aPawn).wRequiredParts[i] = items[lp1].PartsID;
            i++;
        }
        lp1++;
        // [Loop Continue]
        goto J0xAF;
    }
    wPawn(aPawn).wRequiredEquipment[i++] = 0;
    wPawn(aPawn).Health = NPCParam.HP;
    wPawn(aPawn).HealthMax = float(NPCParam.HP);
    //return;    
}

function NotifyAddInventory(Inventory NewItem)
{
    //return;    
}

function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(1);
    //return;    
}

// Export UwAIBotBase::execSetupWStateNative(FFrame&, void* const)
native function SetupWStateNative(out wState S)
{
    //native.S;        
}

function SetupWState(out wState S)
{
    SetupWStateNative(S);
    //return;    
}

function SetupWStateScript(out wState S)
{
    local float MaxAmmoPrimary, CurAmmoPrimary;
    local int lp1, myTeam;
    local wAIPawn aiPawn;
    local wWeapon Weapon;
    local Inventory Inv;

    S.Ammo = Class'WGame_Decompressed.wState'.default.Ammo;
    S.MaxAmmo = Class'WGame_Decompressed.wState'.default.MaxAmmo;
    S.Magazine = Class'WGame_Decompressed.wState'.default.Magazine;
    S.NumFragGrenade = Class'WGame_Decompressed.wState'.default.NumFragGrenade;
    S.NumStunGrenade = Class'WGame_Decompressed.wState'.default.NumStunGrenade;
    S.NumSmokeGrenade = Class'WGame_Decompressed.wState'.default.NumSmokeGrenade;
    S.CurrentWeapon = Class'WGame_Decompressed.wState'.default.CurrentWeapon;
    S.Weapons = Class'WGame_Decompressed.wState'.default.Weapons;
    S.SwitchWeaponCount = Class'WGame_Decompressed.wState'.default.SwitchWeaponCount;
    S.IsCrouch = Class'WGame_Decompressed.wState'.default.IsCrouch;
    S.IsStand = Class'WGame_Decompressed.wState'.default.IsStand;
    S.IsProne = Class'WGame_Decompressed.wState'.default.IsProne;
    S.FreeHead = Class'WGame_Decompressed.wState'.default.FreeHead;
    S.FreeHands = Class'WGame_Decompressed.wState'.default.FreeHands;
    S.FreeLegs = Class'WGame_Decompressed.wState'.default.FreeLegs;
    S.CannotFindPath = Class'WGame_Decompressed.wState'.default.CannotFindPath;
    S.Health = Class'WGame_Decompressed.wState'.default.Health;
    S.PropsectDealtDamage = Class'WGame_Decompressed.wState'.default.PropsectDealtDamage;
    S.ProspectTakenDamage = Class'WGame_Decompressed.wState'.default.ProspectTakenDamage;
    S.HasSupplyHelicopter = Class'WGame_Decompressed.wState'.default.HasSupplyHelicopter;
    S.HasSupplyUAV = Class'WGame_Decompressed.wState'.default.HasSupplyUAV;
    S.HasSupplyAirstrike = Class'WGame_Decompressed.wState'.default.HasSupplyAirstrike;
    S.Location = Class'WGame_Decompressed.wState'.default.Location;
    S.Target = Class'WGame_Decompressed.wState'.default.Target;
    S.TargetVisible = Class'WGame_Decompressed.wState'.default.TargetVisible;
    S.TargetReachable = Class'WGame_Decompressed.wState'.default.TargetReachable;
    S.TargetChangeCount = Class'WGame_Decompressed.wState'.default.TargetChangeCount;
    S.CanMeleeTarget = Class'WGame_Decompressed.wState'.default.CanMeleeTarget;
    S.MeetNewEnemyProbabilty = Class'WGame_Decompressed.wState'.default.MeetNewEnemyProbabilty;
    S.Time = Class'WGame_Decompressed.wState'.default.Time;
    S.NumCapturedFlags = Class'WGame_Decompressed.wState'.default.NumCapturedFlags;
    S.FlagIamOn = Class'WGame_Decompressed.wState'.default.FlagIamOn;
    S.World_NumAllies = Class'WGame_Decompressed.wState'.default.World_NumAllies;
    S.World_NumEnemies = Class'WGame_Decompressed.wState'.default.World_NumEnemies;
    S.World_IsSDRespawnTime = Class'WGame_Decompressed.wState'.default.World_IsSDRespawnTime;
    S.World_TeamGame = Class'WGame_Decompressed.wState'.default.World_TeamGame;
    S.IsFlashed = wFlashForce > 0.3000000;
    S.World_Helicopter = Level.Helicopters.Length > 0;
    S.World_Airstrike = false;
    S.Owner = self;
    // End:0x99E
    if(Pawn != none)
    {
        aiPawn = wAIPawn(Pawn);
        // End:0x7A8
        if(Pawn.Weapon != none)
        {
            // End:0x4EB
            if(Pawn.PendingWeapon == none)
            {
                Weapon = Pawn.Weapon;                
            }
            else
            {
                Weapon = Pawn.PendingWeapon;
            }
            // End:0x7A8
            if((int(Weapon.InventoryGroup) == 1) || int(Weapon.InventoryGroup) == 2)
            {
                Weapon.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
                S.Ammo = int(CurAmmoPrimary);
                S.MaxAmmo = Weapon.BaseParams.iAmmo_Magazine;
                S.Magazine = int(MaxAmmoPrimary);
                S.CurrentWeapon = Weapon.BaseParams;
                Inv = Pawn.Inventory;
                J0x5CA:

                // End:0x7A8 [Loop If]
                if(Inv != none)
                {
                    Weapon = wWeapon(Inv);
                    // End:0x791
                    if(Weapon != none)
                    {
                        // End:0x647
                        if((Weapon.BaseParams.iWeaponID == 6000) || Weapon.BaseParams.iWeaponID == 6003)
                        {
                            S.NumFragGrenade++;                            
                        }
                        else
                        {
                            // End:0x67B
                            if(Weapon.BaseParams.iWeaponID == 6001)
                            {
                                S.NumSmokeGrenade++;                                
                            }
                            else
                            {
                                // End:0x6AF
                                if(Weapon.BaseParams.iWeaponID == 6000)
                                {
                                    S.NumStunGrenade++;                                    
                                }
                                else
                                {
                                    // End:0x72A
                                    if(((Weapon.BaseParams.iWeaponID == 5006) || Weapon.BaseParams.iWeaponID == 5007) || Weapon.BaseParams.iWeaponID == 5008)
                                    {
                                        S.HasSupplyAirstrike = true;                                        
                                    }
                                    else
                                    {
                                        // End:0x75F
                                        if(Weapon.BaseParams.iWeaponID == 5009)
                                        {
                                            S.HasSupplyHelicopter = true;                                            
                                        }
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
                    // [Loop Continue]
                    goto J0x5CA;
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
        // End:0x94D
        if((Target != none) && Pawn(Target) != none)
        {
            S.Target = Memory.GetByPawn(Pawn(Target));
            // End:0x94D
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
    J0x9B1:

    // End:0xA1F [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        // End:0xA05
        if(myTeam == Level.PawnList[lp1].GetTeamNum())
        {
            S.World_NumAllies++;
            // [Explicit Continue]
            goto J0xA15;
        }
        S.World_NumEnemies++;
        J0xA15:

        lp1++;
        // [Loop Continue]
        goto J0x9B1;
    }
    S.World_IsSDRespawnTime = Level.Game.IsSDRespawnTime();
    S.World_TeamGame = Level.Game.bTeamGame;
    //return;    
}

function float EvaluateState(wState S)
{
    return float(S.PropsectDealtDamage);
    //return;    
}

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    local Controller C;
    local wActionContainer bestPlan;
    local float bestPlanScore;

    P1 = Locs(P1);
    clog(("wAIBot " $ PlayerReplicationInfo.PlayerName) $ " is listening");
    switch(P1)
    {
        // End:0x4A
        case "?":
        // End:0xA5
        case "help":
            clog("moveto [player name]");
            clog("set goal roam/shoot");
            clog("set drawpath 0/1");
            // End:0x56E
            break;
        // End:0x239
        case "moveto":
            C = Level.ControllerList;
            J0xC4:

            // End:0x18C [Loop If]
            if(C != none)
            {
                // End:0x175
                if((C.Pawn != none) && Locs(C.PlayerReplicationInfo.PlayerName) == Locs(P2))
                {
                    Goal = Goal_MovePathToward(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(self, C.Pawn);
                    clog("found " $ C.PlayerReplicationInfo.PlayerName);
                    // [Explicit Break]
                    goto J0x18C;
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0xC4;
            }
            J0x18C:

            // End:0x236
            if((C == none) && Level.GetLocalPlayerController().Pawn != none)
            {
                Goal = Goal_MovePathToward(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(self, Level.GetLocalPlayerController().Pawn);
                clog("found nobody, moveto local player controller");
            }
            // End:0x56E
            break;
        // End:0x3DD
        case "set":
            switch(Locs(P2))
            {
                // End:0x36D
                case "goal":
                    switch(Locs(p3))
                    {
                        // End:0x2AC
                        case "roam":
                            Goal = Goal_Roam(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Roam')).Init(self);
                            clog("Goal_Roam");
                            // End:0x36A
                            break;
                        // End:0x317
                        case "shoot":
                            Goal = Goal_Shoot(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Shoot')).Init(self, Level.GetLocalPlayerController().Pawn, true);
                            clog("Goal_Shoot");
                            // End:0x36A
                            break;
                        // End:0x367
                        case "test":
                            Goal = Goal_Test(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Test')).Init(self);
                            clog("Goal_Test");
                            // End:0x36A
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    // End:0x3DA
                    break;
                // End:0x3D7
                case "drawpath":
                    switch(p3)
                    {
                        // End:0x392
                        case "0":
                            bDrawPath = false;
                            // End:0x3B8
                            break;
                        // End:0x3A3
                        case "1":
                            bDrawPath = true;
                            // End:0x3B8
                            break;
                        // End:0xFFFF
                        default:
                            bDrawPath = !bDrawPath;
                            // End:0x3B8
                            break;
                            break;
                    }
                    clog("bDrawPath=" $ string(bDrawPath));
                    // End:0x3DA
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x56E
            break;
        // End:0x4CA
        case "run":
            switch(Locs(P2))
            {
                // End:0x408
                case "initnavextra":
                    InitNavExtraCost();
                    // End:0x4C7
                    break;
                // End:0x422
                case "copynavextra":
                    CopyNavExtraCost();
                    // End:0x4C7
                    break;
                // End:0x473
                case "updatenavdetourextra":
                    UpdateNavDetourExtraCost(Pawn.Location, Level.GetLocalPlayerController().Pawn.Location);
                    // End:0x4C7
                    break;
                // End:0x48D
                case "zeronavextra":
                    ZeroExtraCost();
                    // End:0x4C7
                    break;
                // End:0x4C4
                case "findpathtoward":
                    MoveTarget = FindPathToward(Level.GetLocalPlayerController().Pawn);
                    // End:0x4C7
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x56E
            break;
        // End:0x4FF
        case "see":
            switch(Locs(P2))
            {
                // End:0xFFFF
                default:
                    SeePlayer(Level.GetLocalPlayerController().Pawn);
                    // End:0x4FF
                    break;
                    break;
            }
        // End:0x56B
        case "plan":
            bestPlan = Planner.Plan(Class'WGame_Decompressed.wPurposeExplore'.static.Create(self), 100, bestPlanScore);
            clog("bestPlanScore=" $ string(bestPlanScore));
            clog(bestPlan.ToString());
            // End:0x56E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function InitNavExtraCost()
{
    local NavigationPoint N;
    local int ExtraCost, maxVisCount;

    maxVisCount = 1;
    N = Level.NavigationPointList;
    J0x1B:

    // End:0x69 [Loop If]
    if(N != none)
    {
        // End:0x52
        if(maxVisCount < N.VisCount)
        {
            maxVisCount = N.VisCount;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x1B;
    }
    maxVisCount *= float(maxVisCount);
    N = Level.NavigationPointList;
    J0x8B:

    // End:0x109 [Loop If]
    if(N != none)
    {
        ExtraCost = 0;
        ExtraCost += int((float(N.VisCount * N.VisCount) / float(maxVisCount)) * NavExtraCostFactor_VisCount);
        NavExtraCosts[N.VisID] = float(ExtraCost);
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x8B;
    }
    //return;    
}

// Export UwAIBotBase::execUpdateNavDetourExtraCostNative(FFrame&, void* const)
native function UpdateNavDetourExtraCostNative(Vector S, Vector E)
{
    //native.S;
    //native.E;        
}

function UpdateNavDetourExtraCost(Vector S, Vector E)
{
    UpdateNavDetourExtraCostNative(S, E);
    //return;    
}

function UpdateNavDetourExtraCostScript(Vector S, Vector E)
{
    local float segmentDist, dist, Extra;
    local Vector N;
    local NavigationPoint np;

    segmentDist = ((S.X - E.X) * (S.X - E.X)) + ((S.Y - E.Y) * (S.Y - E.Y));
    segmentDist *= NavExtraCostFactor_DetourMaxDistFactor;
    np = Level.NavigationPointList;
    J0x84:

    // End:0x1DA [Loop If]
    if(np != none)
    {
        N = np.Location;
        dist = ((S.X - N.X) * (S.X - N.X)) + ((S.Y - N.Y) * (S.Y - N.Y));
        dist += (((E.X - N.X) * (E.X - N.X)) + ((E.Y - N.Y) * (E.Y - N.Y)));
        // End:0x19E
        if(dist < segmentDist)
        {
            Extra = (1.0000000 - (dist / segmentDist)) * NavExtraCostFactor_DetourScore;            
        }
        else
        {
            Extra = 0.0000000;
        }
        NavDetourExtraCosts[np.VisID] = Extra;
        np = np.nextNavigationPoint;
        // [Loop Continue]
        goto J0x84;
    }
    //return;    
}

function CopyNavExtraCost()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0x71 [Loop If]
    if(N != none)
    {
        N.ExtraCost = int(NavExtraCosts[N.VisID] + NavDetourExtraCosts[N.VisID]);
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ZeroExtraCost()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0x46 [Loop If]
    if(N != none)
    {
        N.ExtraCost = 0;
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ClientOnEndWaitingForStart()
{
    GotoState(StateOnPossess);
    //return;    
}

function PawnDied(Pawn P)
{
    super(Controller).PawnDied(P);
    DeadTime = Level.TimeSeconds;
    Memory.RemoveAll();
    Goal.HandleMessage(Class'WGame_Decompressed.Goal'.default.MessageNotifyDied);
    //return;    
}

function SetSprint(bool Value)
{
    TrySprint = Value;
    //return;    
}

function bool IsSprinting()
{
    return Pawn.bIsSprinting;
    //return;    
}

function TryStandUp()
{
    Pawn.bWantsToCrouch = false;
    Pawn.bWantsToProne = false;
    //return;    
}

function bool IsStandingUp()
{
    return !IsCrouching() && !IsProning();
    //return;    
}

function TryCrouch()
{
    Pawn.bWantsToCrouch = true;
    //return;    
}

function bool IsCrouching()
{
    return Pawn.bIsCrouched;
    //return;    
}

function TryProne()
{
    Pawn.bWantsToProne = true;
    Pawn.bWantsToCrouch = true;
    //return;    
}

function bool IsProning()
{
    return Pawn.bIsProned;
    //return;    
}

function wClientFlash(float fTime)
{
    super(Controller).wClientFlash(fTime);
    Goal.HandleMessage(Class'WGame_Decompressed.Goal'.default.MessageFlashed);
    //return;    
}

function HandleMessage(string Msg)
{
    Goal.HandleMessage(Msg);
    //return;    
}

function OnMemoryVisibleChanged()
{
    Goal.HandleMessage(Class'WGame_Decompressed.Goal'.default.MessageMemoryVisibleChanged);
    //return;    
}

function NotifyVehicle(Vehicle V)
{
    SeePlayer(V);
    //return;    
}

event SeePlayer(Pawn SeenPlayer)
{
    Memory.ByVision(SeenPlayer);
    //return;    
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    local wPawn P;

    P = wPawn(NoiseMaker);
    // End:0x51
    if((P != none) && P.Controller.bIsPlayer)
    {
        Memory.BySound(P, Loudness);
    }
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    super(Controller).NotifyKilled(Killer, Killed, KilledPawn);
    // End:0x2B
    if(Target == KilledPawn)
    {
        Target = none;
    }
    // End:0x41
    if(Focus == KilledPawn)
    {
        Focus = none;
    }
    Memory.RemoveByPawn(KilledPawn);
    //return;    
}

function bool CallHelicopter(optional bool ignoreSupply)
{
    local wHelicopter P;

    // End:0x14
    foreach DynamicActors(Class'WGame_Decompressed.wHelicopter', P)
    {        
        return false;        
    }    
    return Class'WGame_Decompressed.wHelicopter'.static.Call(Level, none, self);
    //return;    
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
    // End:0x3E1
    if(pawnTarget != none)
    {
        outerRange = 10000.0000000;
        dist = VSize(pawnTarget.Location - Pawn.Location);
        dist = FMin(dist, outerRange);
        // End:0x111
        if(dist <= NPCParam.CloseRange)
        {
            distRatio = dist / NPCParam.CloseRange;
            distFactorMin = NPCParam.ZeroRangeSpreadMin + (distRatio * (NPCParam.CloseRangeSpreadMin - NPCParam.ZeroRangeSpreadMin));
            distFactorMax = NPCParam.ZeroRangeSpreadMax + (distRatio * (NPCParam.CloseRangeSpreadMax - NPCParam.ZeroRangeSpreadMax));            
        }
        else
        {
            // End:0x1DD
            if(dist <= NPCParam.EffectiveRange)
            {
                distRatio = (dist - NPCParam.CloseRange) / (NPCParam.EffectiveRange - NPCParam.CloseRange);
                distFactorMin = NPCParam.CloseRangeSpreadMin + (distRatio * (NPCParam.EffectiveRangeSpreadMin - NPCParam.CloseRangeSpreadMin));
                distFactorMax = NPCParam.CloseRangeSpreadMax + (distRatio * (NPCParam.EffectiveRangeSpreadMax - NPCParam.CloseRangeSpreadMax));                
            }
            else
            {
                distRatio = (dist - NPCParam.EffectiveRange) / (outerRange - NPCParam.EffectiveRange);
                distFactorMin = NPCParam.EffectiveRangeSpreadMin + (distRatio * (NPCParam.OuterRangeSpreadMin - NPCParam.EffectiveRangeSpreadMin));
                distFactorMax = NPCParam.EffectiveRangeSpreadMax + (distRatio * (NPCParam.OuterRangeSpreadMax - NPCParam.EffectiveRangeSpreadMax));
            }
        }
        lookVect = Vector(Pawn.Rotation);
        lookVect.Z = 0.0000000;
        rightVect = Normal(lookVect Cross UpVector);
        vel1 = Pawn.Velocity;
        vel2 = pawnTarget.Velocity;
        vel1 = rightVect * (vel1 Dot rightVect);
        vel2 = rightVect * (vel2 Dot rightVect);
        movementFactor = FMin(1.0000000, VSize(vel1 - vel2) / 1000.0000000);
        distFactorMin *= Pawn.Weapon.BaseParams.fNPCSpreadRate;
        distFactorMax *= Pawn.Weapon.BaseParams.fNPCSpreadRate;
        aimErrorMax = distFactorMin + (movementFactor * (distFactorMax - distFactorMin));
        aimErrorX = ((FRand() * aimErrorMax) * float(2)) - aimErrorMax;
        aimErrorY = ((FRand() * aimErrorMax) * float(2)) - aimErrorMax;
    }
    // End:0x4BA
    if((pawnTarget != none) && ((pawnTarget.DrivenVehicle == none) && FRand() < NPCParam.HeadshotChance) || (pawnTarget.DrivenVehicle != none) && FRand() < NPCParam.HeadshotChanceMG)
    {
        C = pawnTarget.GetBoneCoords(pawnTarget.HeadBone);
        HeadLoc = C.Origin;
        LookDir = Rotator(HeadLoc - projStart);
        aimErrorX *= NPCParam.HeadshotSpreadRate;
        aimErrorY *= NPCParam.HeadshotSpreadRate;        
    }
    else
    {
        LookDir = Rotator(Target.Location - projStart);
    }
    LookDir.Yaw = SetFireYaw(LookDir.Yaw);
    LookDir.Yaw += int(aimErrorX);
    LookDir.Pitch += int(aimErrorY);
    return LookDir;
    //return;    
}

function int SetFireYaw(int FireYaw)
{
    FireYaw = FireYaw & 65535;
    // End:0xE3
    if((((int(Pawn.Physics) != int(0)) && int(Pawn.Physics) != int(13)) && Abs(float(FireYaw - (Rotation.Yaw & 65535))) > float(8192)) && Abs(float(FireYaw - (Rotation.Yaw & 65535))) < float(57343))
    {
        // End:0xCC
        if(ClockwiseFrom_IntInt(FireYaw, Rotation.Yaw))
        {
            FireYaw = Rotation.Yaw + 8192;            
        }
        else
        {
            FireYaw = Rotation.Yaw - 8192;
        }
    }
    return FireYaw;
    //return;    
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    local float ammoMax, Ammo;
    local string targetName, supposedTargetName;
    local MemoryItem supposedTarget;

    // End:0x35
    if(Pawn(Target) != none)
    {
        targetName = Pawn(Target).PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        targetName = "";
    }
    supposedTarget = TargetSystem.GetTarget();
    // End:0x68
    if(supposedTarget == none)
    {
        supposedTargetName = "";        
    }
    else
    {
        supposedTargetName = supposedTarget.Pawn.PlayerReplicationInfo.PlayerName;
    }
    C.DrawColor = Class'Engine.HUD'.default.CyanColor;
    C.SetPos(4.0000000, YPos += (YL * float(2)));
    C.DrawText("[wAIBot.TargetingSystem]");
    C.SetPos(4.0000000, YPos += YL);
    C.DrawText((("target=" $ targetName) $ " supposedTarget=") $ supposedTargetName);
    TargetSystem.DisplayDebug(C, YL, YPos);
    // End:0x44D
    if(Pawn != none)
    {
        C.SetPos(4.0000000, YPos += (YL * float(2)));
        C.DrawText("[wAIBot.Actions]");
        C.SetPos(4.0000000, YPos += YL);
        C.DrawText("fLastFireNoiseTime=" $ string(Pawn.fLastFireNoiseTime));
        C.SetPos(4.0000000, YPos += YL);
        C.DrawText((((((("IsSprinting=" $ string(IsSprinting())) $ " IsStandingUp=") $ string(IsStandingUp())) $ " IsCrouching=") $ string(IsCrouching())) $ " IsProning=") $ string(IsProning()));
        // End:0x44D
        if(Pawn.Weapon != none)
        {
            Pawn.Weapon.GetAmmoCount(ammoMax, Ammo);
            YPos += YL;
            C.SetPos(4.0000000, YPos);
            C.DrawText((((((("ReadyToFire=" $ string(Pawn.Weapon.ReadyToFire(0))) $ " iFireMode=") $ string(Pawn.Weapon.BaseParams.iFireMode)) $ " ammo=") $ string(Ammo)) $ " max=") $ string(ammoMax));
            YPos += YL;
            C.SetPos(4.0000000, YPos);
            C.DrawText((((("AimState=" $ string(GetEnum(Enum'Engine.wGun.EWeaponAimState', int(wGun(Pawn.Weapon).AimState)))) $ " bIsAiming=") $ string(Pawn.bIsAiming)) $ " bIsFiring=") $ string(Pawn.Weapon.FireMode[0].bIsFiring));
        }
    }
    DisplayDebug_Path(C, YL, YPos);
    C.SetPos(4.0000000, YPos += (YL * float(2)));
    C.DrawText("[wAIBot.Memories] - name[dist,time]");
    Memory.DisplayDebug(C, YL, YPos);
    C.SetPos(4.0000000, YPos += (YL * float(2)));
    C.DrawText("[wAIBot.Goals]");
    Goal.DisplayDebug(C, 1, YL, YPos);
    YPos += YL;
    //return;    
}

function DisplayDebug_Path(Canvas C, out float YL, out float YPos)
{
    local Actor pp;
    local string ppStr;
    local int lp1;

    C.SetPos(4.0000000, YPos += (YL * float(2)));
    C.DrawText("[wAIBot.Path]");
    ppStr = "";
    lp1 = 0;
    J0x50:

    // End:0xFD [Loop If]
    if(lp1 < 16)
    {
        pp = RouteCache[lp1];
        // End:0x7E
        if(pp == none)
        {
            // [Explicit Break]
            goto J0xFD;
            // [Explicit Continue]
            goto J0xF3;
        }
        ppStr = (ppStr $ string(pp.Name)) $ " - ";
        // End:0xF3
        if((float(lp1 + 1) % float(5)) == float(0))
        {
            C.SetPos(4.0000000, YPos += YL);
            C.DrawText(ppStr);
            ppStr = "";
        }
        J0xF3:

        lp1++;
        // [Loop Continue]
        goto J0x50;
    }
    J0xFD:

    // End:0x13A
    if(ppStr != "")
    {
        C.SetPos(4.0000000, YPos += YL);
        C.DrawText(ppStr);
    }
    //return;    
}

state WaitingForStart
{    stop;    
}

state RoundEnded
{
    function Tick(float dt)
    {
        //return;        
    }
    stop;    
}

state Spectating
{
    function Tick(float dt)
    {
        local int A;

        A = 0;
        //return;        
    }
    stop;    
}

state Dummy
{
    function BeginState()
    {
        //return;        
    }

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
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            bRun = byte(TrySprint);
            TickSprint(dt);
            HandleWalking();
            TickStance(dt);
            //return;            
        }
    }
    stop;    
}

state Dummy_Fire extends Dummy
{
    function BeginState()
    {
        //return;        
    }

    function Tick(float dt)
    {
        // End:0x5C
        if(Goal == none)
        {
            Goal = Goal_Fire(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fire')).Init(self, Level.GetLocalPlayerController().Pawn, false, 9999);
        }
        super.Tick(dt);
        //return;        
    }
    stop;    
}

state ProcessGoal
{
    function BeginState()
    {
        // End:0x43
        if(Goal == none)
        {
            Goal = Goal_PlanAndExec(AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_PlanAndExec')).Init(self, Planner);
        }
        //return;        
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
                    // End:0xFFFF
                    default:
                        break;
                }
                UpdateElapsed = 0.0000000;
            }
        }
        bRun = byte(TrySprint);
        TickSprint(dt);
        HandleWalking();
        TickStance(dt);
        wViewFlash(dt);
        //return;        
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
            if(((Level.TimeSeconds - DeadTime) > Level.GRI.RespawnTime) && (Level.TimeSeconds - LastRestartRequestTime) > float(1))
            {
                LastRestartRequestTime = Level.TimeSeconds;
                ServerReStartPlayer();
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    UpdateInterval=0.0555556
    DeadTime=-999.0000000
    LastRestartRequestTime=-999.0000000
    StateOnPossess="ProcessGoal"
    UpVector=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    bIsPlayer=true
    PlayerReplicationInfoClass=Class'WGame_Decompressed.wPlayerReplicationInfo'
    PawnClass=Class'WGame_Decompressed.wAIPawn'
    RotationRate=(Pitch=3072,Yaw=30000,Roll=50000)
}