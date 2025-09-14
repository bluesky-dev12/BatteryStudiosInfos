class wActionPlanner extends Object;

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
    i.WorkingState = Class'WGame_Decompressed.wState'.static.Create();
    i.WorkingState2 = Class'WGame_Decompressed.wState'.static.Create();
    return i;
    //return;    
}

function ClearReferences()
{
    Log("[wActionPlanner::ClearRefenreces]");
    Owner = none;
    //return;    
}

function GetActionCandidates_SwitchWeapon(out array<wAction> Actions)
{
    local Inventory Inv;
    local wWeapon Wpn;
    local float MaxAmmo, curAmmo;

    // End:0x144
    if((npcActions.SwitchWeapon && Owner.Pawn != none) && Owner.Pawn.Inventory != none)
    {
        Inv = Owner.Pawn.Inventory;
        J0x64:

        // End:0x144 [Loop If]
        if(Inv != none)
        {
            Wpn = wWeapon(Inv);
            // End:0x12D
            if(Wpn != none)
            {
                Wpn.GetAmmoCount(MaxAmmo, curAmmo);
                // End:0x12D
                if((MaxAmmo + curAmmo) > float(0))
                {
                    // End:0x12D
                    if((int(Wpn.InventoryGroup) == 1) || int(Wpn.InventoryGroup) == 2)
                    {
                        Actions[Actions.Length] = wAction_SwitchWeapon(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_SwitchWeapon')).Init(Wpn);
                    }
                }
            }
            Inv = Inv.Inventory;
            // [Loop Continue]
            goto J0x64;
        }
    }
    //return;    
}

function GetActionCandidates_Pick(out array<wAction> Actions)
{
    local float DIST_FACTOR_HEALTH, distThreshold, dist, healthRatio, prob;

    local int lp1;
    local Pickup P;

    DIST_FACTOR_HEALTH = 3000.0000000;
    // End:0x19C
    if(npcActions.PickHealth && float(Owner.Pawn.Health) < (Owner.Pawn.HealthMax * 0.9000000))
    {
        healthRatio = 1.0000000 - (float(Owner.Pawn.Health) / Owner.Pawn.HealthMax);
        distThreshold = (healthRatio * healthRatio) * DIST_FACTOR_HEALTH;
        lp1 = 0;
        J0xBA:

        // End:0x19C [Loop If]
        if(lp1 < Owner.Level.SupplyList_Health.Length)
        {
            P = Owner.Level.SupplyList_Health[lp1];
            // End:0x10D
            if(P == none)
            {
                // [Explicit Continue]
                goto J0x192;
            }
            dist = VSize(P.Location - Owner.Pawn.Location);
            // End:0x192
            if(dist < distThreshold)
            {
                Actions[Actions.Length] = wAction_PickHealth(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickHealth')).Init(P);
            }
            J0x192:

            lp1++;
            // [Loop Continue]
            goto J0xBA;
        }
    }
    // End:0x2D8
    if(npcActions.PickHelicopter && Owner.Level.SupplyList_Helicopter.Length > 0)
    {
        distThreshold = 2500.0000000;
        lp1 = 0;
        J0x1E0:

        // End:0x2D8 [Loop If]
        if(lp1 < Owner.Level.SupplyList_Helicopter.Length)
        {
            P = Owner.Level.SupplyList_Helicopter[lp1];
            // End:0x233
            if(P == none)
            {
                // [Explicit Continue]
                goto J0x2CE;
            }
            dist = VSize(P.Location - Owner.Pawn.Location);
            prob = FMax(0.9500000, dist / distThreshold);
            // End:0x2CE
            if(FRand() > prob)
            {
                Actions[Actions.Length] = wAction_PickHelicopter(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickHelicopter')).Init(P);
            }
            J0x2CE:

            lp1++;
            // [Loop Continue]
            goto J0x1E0;
        }
    }
    // End:0x414
    if(npcActions.PickAirstrike && Owner.Level.SupplyList_Artillery.Length > 0)
    {
        distThreshold = 2500.0000000;
        lp1 = 0;
        J0x31C:

        // End:0x414 [Loop If]
        if(lp1 < Owner.Level.SupplyList_Artillery.Length)
        {
            P = Owner.Level.SupplyList_Artillery[lp1];
            // End:0x36F
            if(P == none)
            {
                // [Explicit Continue]
                goto J0x40A;
            }
            dist = VSize(P.Location - Owner.Pawn.Location);
            prob = FMax(0.9500000, dist / distThreshold);
            // End:0x40A
            if(FRand() > prob)
            {
                Actions[Actions.Length] = wAction_PickAirstrike(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickAirstrike')).Init(P);
            }
            J0x40A:

            lp1++;
            // [Loop Continue]
            goto J0x31C;
        }
    }
    // End:0x550
    if(npcActions.PickUAV && Owner.Level.SupplyList_UAV.Length > 0)
    {
        distThreshold = 2500.0000000;
        lp1 = 0;
        J0x458:

        // End:0x550 [Loop If]
        if(lp1 < Owner.Level.SupplyList_UAV.Length)
        {
            P = Owner.Level.SupplyList_UAV[lp1];
            // End:0x4AB
            if(P == none)
            {
                // [Explicit Continue]
                goto J0x546;
            }
            dist = VSize(P.Location - Owner.Pawn.Location);
            prob = FMax(0.9500000, dist / distThreshold);
            // End:0x546
            if(FRand() > prob)
            {
                Actions[Actions.Length] = wAction_PickUAV(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickUAV')).Init(P);
            }
            J0x546:

            lp1++;
            // [Loop Continue]
            goto J0x458;
        }
    }
    //return;    
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
        Actions[Actions.Length] = wAction_Fire(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_Fire')).Init();
    }
    // End:0xBD
    if(npcActions.Reload)
    {
        Actions[Actions.Length] = wAction_Reload(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_Reload')).Init();
    }
    // End:0x111
    if(npcActions.Explore)
    {
        Actions[Actions.Length] = wAction_Explore(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_Explore')).Init();
    }
    // End:0x165
    if(npcActions.ExploreTutorial)
    {
        Actions[Actions.Length] = wAction_Explore(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_ExploreTutorial')).Init();
    }
    // End:0x1BE
    if(npcActions.IdleHands)
    {
        Actions[Actions.Length] = wAction_IdleHands(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_IdleHands')).Init(1.0000000);
    }
    // End:0x21F
    if(!Peaceful && npcActions.ApproachAndMelee)
    {
        Actions[Actions.Length] = wAction_ApproachAndMelee(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_ApproachAndMelee')).Init();
    }
    // End:0x273
    if(npcActions.MoveToEnemyInfluence)
    {
        Actions[Actions.Length] = wAction_MoveToEnemyInfluence(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MoveToEnemyInfluence')).Init();
    }
    // End:0x2C7
    if(npcActions.MoveToSeeTarget)
    {
        Actions[Actions.Length] = wAction_MoveToSeeTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MoveToSeeTarget')).Init();
    }
    // End:0x329
    if(npcActions.LookAround)
    {
        Actions[Actions.Length] = wAction_LookAround(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_LookAround')).Init(Class'WGame_Decompressed.wAIPawn'.default.CannotFindPathTimeHoldDuration);
    }
    // End:0x37D
    if(npcActions.UseHelicopter)
    {
        Actions[Actions.Length] = wAction_UseHelicopter(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseHelicopter')).Init();
    }
    // End:0x3D1
    if(npcActions.UseAirstrikeRealTime)
    {
        Actions[Actions.Length] = wAction_UseAIrstrikeRealTime(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseAIrstrikeRealTime')).Init();
    }
    // End:0x425
    if(npcActions.UseUAV)
    {
        Actions[Actions.Length] = wAction_UseUAV(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseUAV')).Init();
    }
    // End:0x486
    if(!Peaceful && npcActions.MeleeNoTarget)
    {
        Actions[Actions.Length] = wAction_MeleeNoTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MeleeNoTarget')).Init();
    }
    // End:0x5B8
    if(npcActions.FireHelicopter && Owner.Level.Helicopters.Length > 0)
    {
        lp1 = 0;
        J0x4BF:

        // End:0x5B8 [Loop If]
        if(lp1 < Owner.Level.Helicopters.Length)
        {
            // End:0x5AE
            if((Owner.Level.Helicopters[lp1].GetTeamNum() != Owner.GetTeamNum()) && Owner.LineOfSightTo(Owner.Level.Helicopters[lp1]))
            {
                Actions[Actions.Length] = wAction_FireSpecialTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_FireSpecialTarget')).Init2(Owner.Level.Helicopters[lp1], 1.1000000);
            }
            lp1++;
            // [Loop Continue]
            goto J0x4BF;
        }
    }
    Owner.Level.Game.GetGameSpecificActions(Owner, npcActions, gameSpecificActions);
    lp1 = 0;
    J0x5EF:

    // End:0x626 [Loop If]
    if(lp1 < gameSpecificActions.Length)
    {
        Actions[Actions.Length] = wAction(gameSpecificActions[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x5EF;
    }
    targetMI = Owner.TargetSystem.GetTarget();
    // End:0x696
    if(targetMI != none)
    {
        Actions[Actions.Length] = wAction_PickTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickTarget')).Init(targetMI);
    }
    // End:0x6F7
    if(!Peaceful && npcActions.ThrowGrenadeRealTime)
    {
        Actions[Actions.Length] = wAction_ThrowGrenadeRealTime(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_ThrowGrenadeRealTime')).Init();
    }
    GetActionCandidates_SwitchWeapon(Actions);
    GetActionCandidates_Pick(Actions);
    //return;    
}

function GetActionCandidatesByLayer(out array<wAction> rawActions, out array<wActionLayer> actionsByLayer)
{
    local int lp1;
    local wAction A;
    local array<wAction> Actions;

    GetActionCandidates(Actions);
    rawActions = Actions;
    lp1 = 0;
    J0x1D:

    // End:0x77 [Loop If]
    if(lp1 < MaxActionLayers)
    {
        actionsByLayer[lp1] = wActionLayer(Owner.AILevel.PoolActionLayer.AllocateObject(Class'WGame_Decompressed.wActionLayer')).Init();
        lp1++;
        // [Loop Continue]
        goto J0x1D;
    }
    lp1 = 0;
    J0x7E:

    // End:0xEB [Loop If]
    if(lp1 < Actions.Length)
    {
        A = Actions[lp1];
        actionsByLayer[A.Layer].Actions[actionsByLayer[A.Layer].Actions.Length] = A;
        lp1++;
        // [Loop Continue]
        goto J0x7E;
    }
    //return;    
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
    // End:0x1C4
    if(Layer != 0)
    {
        J0x3C:

        // End:0x1C4 [Loop If]
        if(true)
        {
            possibleActions.Length = 0;
            lp1 = 0;
            J0x4F:

            // End:0x125 [Loop If]
            if(lp1 < Actions[Layer].Actions.Length)
            {
                SubAction = Actions[Layer].Actions[lp1];
                // End:0x11B
                if(SubAction.CheckRequirement(S))
                {
                    subActionTime = SubAction.Sim_GetTime(S);
                    // End:0x11B
                    if(((purpose.ActionMinTime <= subActionTime) && subActionTime <= purpose.ActionMaxTime) && (TotalTime + subActionTime) <= parentActionTime)
                    {
                        possibleActions[possibleActions.Length] = SubAction;
                    }
                }
                lp1++;
                // [Loop Continue]
                goto J0x4F;
            }
            // End:0x134
            if(possibleActions.Length == 0)
            {
                // [Explicit Break]
                goto J0x1C4;
            }
            SubAction = possibleActions[Rand(possibleActions.Length)];
            subActionTime = SubAction.Sim_GetTime(S);
            subcon = acon.AddSubContainer(SubAction);
            SubPlan(Layer - 1, subcon, S, Actions, purpose, subActionTime);
            TotalTime += subActionTime;
            // End:0x1C1
            if(TotalTime >= parentActionTime)
            {
                // [Explicit Break]
                goto J0x1C4;
            }
            // [Loop Continue]
            goto J0x3C;
        }
    }
    J0x1C4:

    acon.Action.Sim_PostEffect(S);
    S.Time = StartTime + parentActionTime;
    //return;    
}

function wActionContainer Plan(wPurpose purpose, int tries, out float bestPlanScore)
{
    local int lp1, lpTry;
    local wActionContainer bestPlan, workingPlan;
    local array<wActionLayer> Actions;
    local array<wAction> rawActions;
    local float Score;

    GetActionCandidatesByLayer(rawActions, Actions);
    bestPlanScore = -99999.0000000;
    lpTry = 0;
    J0x22:

    // End:0x1C6 [Loop If]
    if(lpTry < tries)
    {
        Owner.SetupWState(WorkingState);
        workingPlan = wActionContainer(Owner.AILevel.PoolActionContainer.AllocateObject(Class'WGame_Decompressed.wActionContainer')).Init(Owner);
        workingPlan.Action = wAction_Empty(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_Empty')).Init();
        SubPlan(2, workingPlan, WorkingState, Actions, purpose, purpose.PlanLength);
        Score = purpose.Evaluate(WorkingState);
        // End:0x17E
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
            // [Explicit Continue]
            goto J0x1BC;
        }
        Owner.AILevel.PoolAction.FreeObject(workingPlan.Action);
        workingPlan.FreeActionContainers();
        J0x1BC:

        lpTry++;
        // [Loop Continue]
        goto J0x22;
    }
    // End:0x23D
    if(bestPlan != none)
    {
        lp1 = 0;
        J0x1D8:

        // End:0x23D [Loop If]
        if(lp1 < rawActions.Length)
        {
            // End:0x233
            if(!bestPlan.Includes(rawActions[lp1]))
            {
                Owner.AILevel.PoolAction.FreeObject(rawActions[lp1]);
            }
            lp1++;
            // [Loop Continue]
            goto J0x1D8;
        }
    }
    lp1 = 0;
    J0x244:

    // End:0x28A [Loop If]
    if(lp1 < Actions.Length)
    {
        Owner.AILevel.PoolActionLayer.FreeObject(Actions[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x244;
    }
    return bestPlan;
    //return;    
}

defaultproperties
{
    MaxActionLayers=3
}