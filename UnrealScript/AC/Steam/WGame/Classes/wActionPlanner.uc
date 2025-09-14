/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wActionPlanner.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:8
 *
 *******************************************************************************/
class wActionPlanner extends Object
    dependson(wAction_Empty)
    dependson(wActionLayer)
    dependson(wAction_Fire)
    dependson(wAction_Reload)
    dependson(wAction_Explore)
    dependson(wAction_IdleHands)
    dependson(wAction_ApproachAndMelee)
    dependson(wAction_MoveToEnemyInfluence)
    dependson(wAction_MoveToSeeTarget)
    dependson(wAction_LookAround)
    dependson(wAIPawn)
    dependson(wAction_UseHelicopter)
    dependson(wAction_UseAIrstrikeRealTime)
    dependson(wAction_UseUAV)
    dependson(wAction_MeleeNoTarget)
    dependson(wAction_FireSpecialTarget)
    dependson(wAction_PickTarget)
    dependson(wAction_ThrowGrenadeRealTime)
    dependson(wAction_PickHealth)
    dependson(wAction_PickHelicopter)
    dependson(wAction_PickAirstrike)
    dependson(wAction_PickUAV)
    dependson(wAction_SwitchWeapon);

var wAIBotBase Owner;
var bool Peaceful;
var int MaxActionLayers;
var wState WorkingState;
var wState WorkingState2;
var wNPCActions npcActions;

static function wActionPlanner Create(wAIBotBase inOwner, wNPCActions Actions)
{
    local wActionPlanner i;

    i = new default.Class;
    i.Owner = inOwner;
    i.npcActions = Actions;
    i.WorkingState = class'wState'.static.Create();
    i.WorkingState2 = class'wState'.static.Create();
    return i;
}

function ClearReferences()
{
    Log("[wActionPlanner::ClearRefenreces]");
    Owner = none;
}

function GetActionCandidates_SwitchWeapon(out array<wAction> Actions)
{
    local Inventory Inv;
    local wWeapon Wpn;
    local float MaxAmmo, curAmmo;

    // End:0x144
    if(npcActions.SwitchWeapon && Owner.Pawn != none && Owner.Pawn.Inventory != none)
    {
        Inv = Owner.Pawn.Inventory;
        J0x64:
        // End:0x144 [While If]
        if(Inv != none)
        {
            Wpn = wWeapon(Inv);
            // End:0x12d
            if(Wpn != none)
            {
                Wpn.GetAmmoCount(MaxAmmo, curAmmo);
                // End:0x12d
                if(MaxAmmo + curAmmo > float(0))
                {
                    // End:0x12d
                    if(Wpn.InventoryGroup == 1 || Wpn.InventoryGroup == 2)
                    {
                        Actions[Actions.Length] = wAction_SwitchWeapon(Owner.AILevel.PoolAction.AllocateObject(class'wAction_SwitchWeapon')).Init(Wpn);
                    }
                }
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
    }
}

function GetActionCandidates_Pick(out array<wAction> Actions)
{
    local float DIST_FACTOR_HEALTH, distThreshold, dist, healthRatio, prob;

    local int lp1;
    local Pickup P;

    DIST_FACTOR_HEALTH = 3000.0;
    // End:0x19c
    if(npcActions.PickHealth && float(Owner.Pawn.Health) < Owner.Pawn.HealthMax * 0.90)
    {
        healthRatio = 1.0 - float(Owner.Pawn.Health) / Owner.Pawn.HealthMax;
        distThreshold = healthRatio * healthRatio * DIST_FACTOR_HEALTH;
        lp1 = 0;
        J0xba:
        // End:0x19c [While If]
        if(lp1 < Owner.Level.SupplyList_Health.Length)
        {
            P = Owner.Level.SupplyList_Health[lp1];
            // End:0x10d
            if(P == none)
            {
            }
            // End:0x192
            else
            {
                dist = VSize(P.Location - Owner.Pawn.Location);
                // End:0x192
                if(dist < distThreshold)
                {
                    Actions[Actions.Length] = wAction_PickHealth(Owner.AILevel.PoolAction.AllocateObject(class'wAction_PickHealth')).Init(P);
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xba;
        }
    }
    // End:0x2d8
    if(npcActions.PickHelicopter && Owner.Level.SupplyList_Helicopter.Length > 0)
    {
        distThreshold = 2500.0;
        lp1 = 0;
        J0x1e0:
        // End:0x2d8 [While If]
        if(lp1 < Owner.Level.SupplyList_Helicopter.Length)
        {
            P = Owner.Level.SupplyList_Helicopter[lp1];
            // End:0x233
            if(P == none)
            {
            }
            // End:0x2ce
            else
            {
                dist = VSize(P.Location - Owner.Pawn.Location);
                prob = FMax(0.950, dist / distThreshold);
                // End:0x2ce
                if(FRand() > prob)
                {
                    Actions[Actions.Length] = wAction_PickHelicopter(Owner.AILevel.PoolAction.AllocateObject(class'wAction_PickHelicopter')).Init(P);
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1e0;
        }
    }
    // End:0x414
    if(npcActions.PickAirstrike && Owner.Level.SupplyList_Artillery.Length > 0)
    {
        distThreshold = 2500.0;
        lp1 = 0;
        J0x31c:
        // End:0x414 [While If]
        if(lp1 < Owner.Level.SupplyList_Artillery.Length)
        {
            P = Owner.Level.SupplyList_Artillery[lp1];
            // End:0x36f
            if(P == none)
            {
            }
            // End:0x40a
            else
            {
                dist = VSize(P.Location - Owner.Pawn.Location);
                prob = FMax(0.950, dist / distThreshold);
                // End:0x40a
                if(FRand() > prob)
                {
                    Actions[Actions.Length] = wAction_PickAirstrike(Owner.AILevel.PoolAction.AllocateObject(class'wAction_PickAirstrike')).Init(P);
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x31c;
        }
    }
    // End:0x550
    if(npcActions.PickUAV && Owner.Level.SupplyList_UAV.Length > 0)
    {
        distThreshold = 2500.0;
        lp1 = 0;
        J0x458:
        // End:0x550 [While If]
        if(lp1 < Owner.Level.SupplyList_UAV.Length)
        {
            P = Owner.Level.SupplyList_UAV[lp1];
            // End:0x4ab
            if(P == none)
            {
            }
            // End:0x546
            else
            {
                dist = VSize(P.Location - Owner.Pawn.Location);
                prob = FMax(0.950, dist / distThreshold);
                // End:0x546
                if(FRand() > prob)
                {
                    Actions[Actions.Length] = wAction_PickUAV(Owner.AILevel.PoolAction.AllocateObject(class'wAction_PickUAV')).Init(P);
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x458;
        }
    }
}

function GetActionCandidates(out array<wAction> Actions)
{
    local int lp1;
    local array<Object> gameSpecificActions;
    local MemoryItem targetMI;

    Actions.Length = 0;
    // End:0x69
    if(!Peaceful && npcActions.Fire)
    {
        Actions[Actions.Length] = wAction_Fire(Owner.AILevel.PoolAction.AllocateObject(class'wAction_Fire')).Init();
    }
    // End:0xbd
    if(npcActions.Reload)
    {
        Actions[Actions.Length] = wAction_Reload(Owner.AILevel.PoolAction.AllocateObject(class'wAction_Reload')).Init();
    }
    // End:0x111
    if(npcActions.Explore)
    {
        Actions[Actions.Length] = wAction_Explore(Owner.AILevel.PoolAction.AllocateObject(class'wAction_Explore')).Init();
    }
    // End:0x165
    if(npcActions.ExploreTutorial)
    {
        Actions[Actions.Length] = wAction_Explore(Owner.AILevel.PoolAction.AllocateObject(class'wAction_ExploreTutorial')).Init();
    }
    // End:0x1be
    if(npcActions.IdleHands)
    {
        Actions[Actions.Length] = wAction_IdleHands(Owner.AILevel.PoolAction.AllocateObject(class'wAction_IdleHands')).Init(1.0);
    }
    // End:0x21f
    if(!Peaceful && npcActions.ApproachAndMelee)
    {
        Actions[Actions.Length] = wAction_ApproachAndMelee(Owner.AILevel.PoolAction.AllocateObject(class'wAction_ApproachAndMelee')).Init();
    }
    // End:0x273
    if(npcActions.MoveToEnemyInfluence)
    {
        Actions[Actions.Length] = wAction_MoveToEnemyInfluence(Owner.AILevel.PoolAction.AllocateObject(class'wAction_MoveToEnemyInfluence')).Init();
    }
    // End:0x2c7
    if(npcActions.MoveToSeeTarget)
    {
        Actions[Actions.Length] = wAction_MoveToSeeTarget(Owner.AILevel.PoolAction.AllocateObject(class'wAction_MoveToSeeTarget')).Init();
    }
    // End:0x329
    if(npcActions.LookAround)
    {
        Actions[Actions.Length] = wAction_LookAround(Owner.AILevel.PoolAction.AllocateObject(class'wAction_LookAround')).Init(class'wAIPawn'.default.CannotFindPathTimeHoldDuration);
    }
    // End:0x37d
    if(npcActions.UseHelicopter)
    {
        Actions[Actions.Length] = wAction_UseHelicopter(Owner.AILevel.PoolAction.AllocateObject(class'wAction_UseHelicopter')).Init();
    }
    // End:0x3d1
    if(npcActions.UseAirstrikeRealTime)
    {
        Actions[Actions.Length] = wAction_UseAIrstrikeRealTime(Owner.AILevel.PoolAction.AllocateObject(class'wAction_UseAIrstrikeRealTime')).Init();
    }
    // End:0x425
    if(npcActions.UseUAV)
    {
        Actions[Actions.Length] = wAction_UseUAV(Owner.AILevel.PoolAction.AllocateObject(class'wAction_UseUAV')).Init();
    }
    // End:0x486
    if(!Peaceful && npcActions.MeleeNoTarget)
    {
        Actions[Actions.Length] = wAction_MeleeNoTarget(Owner.AILevel.PoolAction.AllocateObject(class'wAction_MeleeNoTarget')).Init();
    }
    // End:0x5b8
    if(npcActions.FireHelicopter && Owner.Level.Helicopters.Length > 0)
    {
        lp1 = 0;
        J0x4bf:
        // End:0x5b8 [While If]
        if(lp1 < Owner.Level.Helicopters.Length)
        {
            // End:0x5ae
            if(Owner.Level.Helicopters[lp1].GetTeamNum() != Owner.GetTeamNum() && Owner.LineOfSightTo(Owner.Level.Helicopters[lp1]))
            {
                Actions[Actions.Length] = wAction_FireSpecialTarget(Owner.AILevel.PoolAction.AllocateObject(class'wAction_FireSpecialTarget')).Init2(Owner.Level.Helicopters[lp1], 1.10);
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x4bf;
        }
    }
    Owner.Level.Game.GetGameSpecificActions(Owner, npcActions, gameSpecificActions);
    lp1 = 0;
    J0x5ef:
    // End:0x626 [While If]
    if(lp1 < gameSpecificActions.Length)
    {
        Actions[Actions.Length] = wAction(gameSpecificActions[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5ef;
    }
    targetMI = Owner.TargetSystem.GetTarget();
    // End:0x696
    if(targetMI != none)
    {
        Actions[Actions.Length] = wAction_PickTarget(Owner.AILevel.PoolAction.AllocateObject(class'wAction_PickTarget')).Init(targetMI);
    }
    // End:0x6f7
    if(!Peaceful && npcActions.ThrowGrenadeRealTime)
    {
        Actions[Actions.Length] = wAction_ThrowGrenadeRealTime(Owner.AILevel.PoolAction.AllocateObject(class'wAction_ThrowGrenadeRealTime')).Init();
    }
    GetActionCandidates_SwitchWeapon(Actions);
    GetActionCandidates_Pick(Actions);
}

function GetActionCandidatesByLayer(out array<wAction> rawActions, out array<wActionLayer> actionsByLayer)
{
    local int lp1;
    local wAction A;
    local array<wAction> Actions;

    GetActionCandidates(Actions);
    rawActions = Actions;
    lp1 = 0;
    J0x1d:
    // End:0x77 [While If]
    if(lp1 < MaxActionLayers)
    {
        actionsByLayer[lp1] = wActionLayer(Owner.AILevel.PoolActionLayer.AllocateObject(class'wActionLayer')).Init();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    lp1 = 0;
    J0x7e:
    // End:0xeb [While If]
    if(lp1 < Actions.Length)
    {
        A = Actions[lp1];
        actionsByLayer[A.Layer].Actions[actionsByLayer[A.Layer].Actions.Length] = A;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
}

function SubPlan(int Layer, out wActionContainer acon, out wState S, out array<wActionLayer> Actions, wPurpose purpose, float parentActionTime)
{
    local int lp1;
    local array<wAction> possibleActions;
    local float TotalTime, subActionTime;
    local wAction SubAction;
    local wActionContainer subcon;
    local float StartTime;

    StartTime = S.Time;
    acon.Action.Sim_PreEffect(S);
    // End:0x1c4
    if(Layer != 0)
    {
        J0x3c:
        // End:0x1c4 [While If]
        if(true)
        {
            possibleActions.Length = 0;
            lp1 = 0;
            J0x4f:
            // End:0x125 [While If]
            if(lp1 < Actions[Layer].Actions.Length)
            {
                SubAction = Actions[Layer].Actions[lp1];
                // End:0x11b
                if(SubAction.CheckRequirement(S))
                {
                    subActionTime = SubAction.Sim_GetTime(S);
                    // End:0x11b
                    if(purpose.ActionMinTime <= subActionTime && subActionTime <= purpose.ActionMaxTime && TotalTime + subActionTime <= parentActionTime)
                    {
                        possibleActions[possibleActions.Length] = SubAction;
                    }
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x4f;
            }
            // End:0x134
            if(possibleActions.Length == 0)
            {
            }
            // End:0x1c4
            else
            {
                SubAction = possibleActions[Rand(possibleActions.Length)];
                subActionTime = SubAction.Sim_GetTime(S);
                subcon = acon.AddSubContainer(SubAction);
                SubPlan(Layer - 1, subcon, S, Actions, purpose, subActionTime);
                TotalTime += subActionTime;
                // End:0x1c1
                if(TotalTime >= parentActionTime)
                {
                }
                // End:0x1c4
                else
                {
                    // This is an implied JumpToken; Continue!
                    goto J0x3c;
                }
            }
        }
    }
    acon.Action.Sim_PostEffect(S);
    S.Time = StartTime + parentActionTime;
}

function wActionContainer Plan(wPurpose purpose, int tries, out float bestPlanScore)
{
    local int lp1, lpTry;
    local wActionContainer bestPlan, workingPlan;
    local array<wActionLayer> Actions;
    local array<wAction> rawActions;
    local float Score;

    GetActionCandidatesByLayer(rawActions, Actions);
    bestPlanScore = -99999.0;
    lpTry = 0;
    J0x22:
    // End:0x1c6 [While If]
    if(lpTry < tries)
    {
        Owner.SetupWState(WorkingState);
        workingPlan = wActionContainer(Owner.AILevel.PoolActionContainer.AllocateObject(class'wActionContainer')).Init(Owner);
        workingPlan.Action = wAction_Empty(Owner.AILevel.PoolAction.AllocateObject(class'wAction_Empty')).Init();
        SubPlan(2, workingPlan, WorkingState, Actions, purpose, purpose.PlanLength);
        Score = purpose.Evaluate(WorkingState);
        // End:0x17e
        if(Score > bestPlanScore)
        {
            // End:0x165
            if(bestPlan != none)
            {
                Owner.AILevel.PoolAction.FreeObject(bestPlan.Action);
                bestPlan.FreeActionContainers();
            }
            bestPlanScore = Score;
            bestPlan = workingPlan;
        }
        // End:0x1bc
        else
        {
            Owner.AILevel.PoolAction.FreeObject(workingPlan.Action);
            workingPlan.FreeActionContainers();
        }
        ++ lpTry;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    // End:0x23d
    if(bestPlan != none)
    {
        lp1 = 0;
        J0x1d8:
        // End:0x23d [While If]
        if(lp1 < rawActions.Length)
        {
            // End:0x233
            if(!bestPlan.Includes(rawActions[lp1]))
            {
                Owner.AILevel.PoolAction.FreeObject(rawActions[lp1]);
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1d8;
        }
    }
    lp1 = 0;
    J0x244:
    // End:0x28a [While If]
    if(lp1 < Actions.Length)
    {
        Owner.AILevel.PoolActionLayer.FreeObject(Actions[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x244;
    }
    return bestPlan;
}

defaultproperties
{
    MaxActionLayers=3
}