class wActionPlanner extends Object;

var wAIBotBase Owner;
var bool Peaceful;
var int MaxActionLayers;
var wStateData WorkingState;
var wNPCActions npcActions;

static function wActionPlanner Create(wAIBotBase inOwner, wNPCActions Actions)
{
    local wActionPlanner i;

    i = new default.Class;
    i.Owner = inOwner;
    i.npcActions = Actions;
    i.WorkingState = Class'WGame_Decompressed.wStateData'.static.Create();
    return i;
    //return;    
}

function ClearReferences()
{
    Log("[wActionPlanner::ClearRefenreces]");
    Owner = none;
    //return;    
}

protected function GetActionCandidates_SwitchWeapon(out array<wAction> Actions)
{
    local Inventory Inv;
    local wWeapon Wpn;
    local float MaxAmmo, CurAmmo;

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
                Wpn.GetAmmoCount(MaxAmmo, CurAmmo);
                // End:0x12D
                if((MaxAmmo + CurAmmo) > float(0))
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

protected function GetActionCandidates_Pick(out array<wAction> Actions)
{
    local float DIST_FACTOR_HEALTH, fDistThreshold, fDist, fHealthRatio, fProb;

    local int i;
    local Pickup Pickup;

    DIST_FACTOR_HEALTH = 3000.0000000;
    // End:0x19C
    if(npcActions.PickHealth && float(Owner.Pawn.Health) < (Owner.Pawn.HealthMax * 0.9000000))
    {
        fHealthRatio = 1.0000000 - (float(Owner.Pawn.Health) / Owner.Pawn.HealthMax);
        fDistThreshold = (fHealthRatio * fHealthRatio) * DIST_FACTOR_HEALTH;
        i = 0;
        J0xBA:

        // End:0x19C [Loop If]
        if(i < Owner.Level.SupplyList_Health.Length)
        {
            Pickup = Owner.Level.SupplyList_Health[i];
            // End:0x10D
            if(Pickup == none)
            {
                // [Explicit Continue]
                goto J0x192;
            }
            fDist = VSize(Pickup.Location - Owner.Pawn.Location);
            // End:0x192
            if(fDist < fDistThreshold)
            {
                Actions[Actions.Length] = wAction_PickHealth(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickHealth')).Init(Pickup);
            }
            J0x192:

            i++;
            // [Loop Continue]
            goto J0xBA;
        }
    }
    // End:0x2D8
    if(npcActions.PickHelicopter && Owner.Level.SupplyList_Helicopter.Length > 0)
    {
        fDistThreshold = 2500.0000000;
        i = 0;
        J0x1E0:

        // End:0x2D8 [Loop If]
        if(i < Owner.Level.SupplyList_Helicopter.Length)
        {
            Pickup = Owner.Level.SupplyList_Helicopter[i];
            // End:0x233
            if(Pickup == none)
            {
                // [Explicit Continue]
                goto J0x2CE;
            }
            fDist = VSize(Pickup.Location - Owner.Pawn.Location);
            fProb = FMax(0.9500000, fDist / fDistThreshold);
            // End:0x2CE
            if(FRand() > fProb)
            {
                Actions[Actions.Length] = wAction_PickHelicopter(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickHelicopter')).Init(Pickup);
            }
            J0x2CE:

            i++;
            // [Loop Continue]
            goto J0x1E0;
        }
    }
    // End:0x414
    if(npcActions.PickAirstrike && Owner.Level.SupplyList_Artillery.Length > 0)
    {
        fDistThreshold = 2500.0000000;
        i = 0;
        J0x31C:

        // End:0x414 [Loop If]
        if(i < Owner.Level.SupplyList_Artillery.Length)
        {
            Pickup = Owner.Level.SupplyList_Artillery[i];
            // End:0x36F
            if(Pickup == none)
            {
                // [Explicit Continue]
                goto J0x40A;
            }
            fDist = VSize(Pickup.Location - Owner.Pawn.Location);
            fProb = FMax(0.9500000, fDist / fDistThreshold);
            // End:0x40A
            if(FRand() > fProb)
            {
                Actions[Actions.Length] = wAction_PickAirstrike(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickAirstrike')).Init(Pickup);
            }
            J0x40A:

            i++;
            // [Loop Continue]
            goto J0x31C;
        }
    }
    // End:0x550
    if(npcActions.PickUAV && Owner.Level.SupplyList_UAV.Length > 0)
    {
        fDistThreshold = 2500.0000000;
        i = 0;
        J0x458:

        // End:0x550 [Loop If]
        if(i < Owner.Level.SupplyList_UAV.Length)
        {
            Pickup = Owner.Level.SupplyList_UAV[i];
            // End:0x4AB
            if(Pickup == none)
            {
                // [Explicit Continue]
                goto J0x546;
            }
            fDist = VSize(Pickup.Location - Owner.Pawn.Location);
            fProb = FMax(0.9500000, fDist / fDistThreshold);
            // End:0x546
            if(FRand() > fProb)
            {
                Actions[Actions.Length] = wAction_PickUAV(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickUAV')).Init(Pickup);
            }
            J0x546:

            i++;
            // [Loop Continue]
            goto J0x458;
        }
    }
    //return;    
}

protected function GetActionCandidates(out array<wAction> Actions)
{
    local int i;
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
    // End:0x235
    if((!Peaceful && npcActions.ApproachAndMelee) && !Owner.IsStopAction)
    {
        Actions[Actions.Length] = wAction_ApproachAndMelee(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_ApproachAndMelee')).Init();
    }
    // End:0x289
    if(npcActions.MoveToEnemyInfluence)
    {
        Actions[Actions.Length] = wAction_MoveToEnemyInfluence(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MoveToEnemyInfluence')).Init();
    }
    // End:0x2DD
    if(npcActions.MoveToSeeTarget)
    {
        Actions[Actions.Length] = wAction_MoveToSeeTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MoveToSeeTarget')).Init();
    }
    // End:0x33F
    if(npcActions.LookAround)
    {
        Actions[Actions.Length] = wAction_LookAround(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_LookAround')).Init(Class'WGame_Decompressed.wAIPawn'.default.CannotFindPathTimeHoldDuration);
    }
    // End:0x393
    if(npcActions.UseHelicopter)
    {
        Actions[Actions.Length] = wAction_UseHelicopter(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseHelicopter')).Init();
    }
    // End:0x3E7
    if(npcActions.UseAirstrikeRealTime)
    {
        Actions[Actions.Length] = wAction_UseAIrstrikeRealTime(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseAIrstrikeRealTime')).Init();
    }
    // End:0x43B
    if(npcActions.UseUAV)
    {
        Actions[Actions.Length] = wAction_UseUAV(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_UseUAV')).Init();
    }
    // End:0x49C
    if(!Peaceful && npcActions.MeleeNoTarget)
    {
        Actions[Actions.Length] = wAction_MeleeNoTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_MeleeNoTarget')).Init();
    }
    // End:0x4F0
    if(npcActions.bAimSpecificParts)
    {
        Actions[Actions.Length] = wAction_AimSpecificParts(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_AimSpecificParts')).Init();
    }
    // End:0x622
    if(npcActions.FireHelicopter && Owner.Level.Helicopters.Length > 0)
    {
        i = 0;
        J0x529:

        // End:0x622 [Loop If]
        if(i < Owner.Level.Helicopters.Length)
        {
            // End:0x618
            if((Owner.Level.Helicopters[i].GetTeamNum() != Owner.GetTeamNum()) && Owner.LineOfSightTo(Owner.Level.Helicopters[i]))
            {
                Actions[Actions.Length] = wAction_FireSpecialTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_FireSpecialTarget')).Init2(Owner.Level.Helicopters[i], 1.1000000);
            }
            i++;
            // [Loop Continue]
            goto J0x529;
        }
    }
    Owner.Level.Game.GetGameSpecificActions(Owner, npcActions, gameSpecificActions);
    i = 0;
    J0x659:

    // End:0x690 [Loop If]
    if(i < gameSpecificActions.Length)
    {
        Actions[Actions.Length] = wAction(gameSpecificActions[i]);
        i++;
        // [Loop Continue]
        goto J0x659;
    }
    targetMI = Owner.TargetSystem.GetTarget();
    // End:0x700
    if(targetMI != none)
    {
        Actions[Actions.Length] = wAction_PickTarget(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_PickTarget')).Init(targetMI);
    }
    // End:0x761
    if(!Peaceful && npcActions.ThrowGrenadeRealTime)
    {
        Actions[Actions.Length] = wAction_ThrowGrenadeRealTime(Owner.AILevel.PoolAction.AllocateObject(Class'WGame_Decompressed.wAction_ThrowGrenadeRealTime')).Init();
    }
    GetActionCandidates_SwitchWeapon(Actions);
    GetActionCandidates_Pick(Actions);
    //return;    
}

protected function GetActionCandidatesByLayer(out array<wAction> rawActions, out array<wActionLayer> actionsByLayer)
{
    local int i;
    local wAction Action;
    local array<wAction> aParamActions;

    GetActionCandidates(aParamActions);
    rawActions = aParamActions;
    i = 0;
    J0x1D:

    // End:0x77 [Loop If]
    if(i < MaxActionLayers)
    {
        actionsByLayer[i] = wActionLayer(Owner.AILevel.PoolActionLayer.AllocateObject(Class'WGame_Decompressed.wActionLayer')).Init();
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    i = 0;
    J0x7E:

    // End:0xEB [Loop If]
    if(i < aParamActions.Length)
    {
        Action = aParamActions[i];
        actionsByLayer[Action.Layer].Actions[actionsByLayer[Action.Layer].Actions.Length] = Action;
        i++;
        // [Loop Continue]
        goto J0x7E;
    }
    //return;    
}

protected function SubPlan(int Layer, out wActionContainer acon, out wStateData S, out array<wActionLayer> Actions, wPurpose purpose, float parentActionTime)
{
    local int i;
    local array<wAction> possibleActions;
    local float TotalTime, subActionTime;
    local wAction SubAction;
    local wActionContainer subcon;
    local float StartTime;

    StartTime = S.Time;
    acon.Action.Sim_PreEffect(S);
    // End:0x1C0
    if(Layer != 0)
    {
        J0x3C:

        // End:0x1C0 [Loop If]
        if(true)
        {
            possibleActions.Length = 0;
            i = 0;
            J0x4F:

            // End:0x121 [Loop If]
            if(i < Actions[Layer].Actions.Length)
            {
                SubAction = Actions[Layer].Actions[i];
                // End:0x117
                if(SubAction.CheckRequirement(S))
                {
                    subActionTime = SubAction.Sim_GetTime(S);
                    // End:0x117
                    if(purpose.ActionMinTime <= subActionTime)
                    {
                        // End:0x117
                        if(subActionTime <= purpose.ActionMaxTime)
                        {
                            // End:0x117
                            if((TotalTime + subActionTime) <= parentActionTime)
                            {
                                possibleActions[possibleActions.Length] = SubAction;
                            }
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x4F;
            }
            // End:0x130
            if(possibleActions.Length == 0)
            {
                // [Explicit Break]
                goto J0x1C0;
            }
            SubAction = possibleActions[Rand(possibleActions.Length)];
            subActionTime = SubAction.Sim_GetTime(S);
            subcon = acon.AddSubContainer(SubAction);
            SubPlan(Layer - 1, subcon, S, Actions, purpose, subActionTime);
            TotalTime += subActionTime;
            // End:0x1BD
            if(TotalTime >= parentActionTime)
            {
                // [Explicit Break]
                goto J0x1C0;
            }
            // [Loop Continue]
            goto J0x3C;
        }
    }
    J0x1C0:

    acon.Action.Sim_PostEffect(S);
    S.Time = StartTime + parentActionTime;
    //return;    
}

function wActionContainer Plan(wPurpose purpose, int tries, out float bestPlanScore)
{
    local int i;
    local wActionContainer bestPlan, workingPlan;
    local array<wActionLayer> Actions;
    local array<wAction> rawActions;
    local float Score;

    GetActionCandidatesByLayer(rawActions, Actions);
    bestPlanScore = -99999.0000000;
    i = 0;
    J0x22:

    // End:0x1C6 [Loop If]
    if(i < tries)
    {
        Owner.SetupWStateNative(WorkingState);
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

        i++;
        // [Loop Continue]
        goto J0x22;
    }
    // End:0x23D
    if(bestPlan != none)
    {
        i = 0;
        J0x1D8:

        // End:0x23D [Loop If]
        if(i < rawActions.Length)
        {
            // End:0x233
            if(!bestPlan.Includes(rawActions[i]))
            {
                Owner.AILevel.PoolAction.FreeObject(rawActions[i]);
            }
            i++;
            // [Loop Continue]
            goto J0x1D8;
        }
    }
    i = 0;
    J0x244:

    // End:0x28A [Loop If]
    if(i < Actions.Length)
    {
        Owner.AILevel.PoolActionLayer.FreeObject(Actions[i]);
        i++;
        // [Loop Continue]
        goto J0x244;
    }
    return bestPlan;
    //return;    
}

defaultproperties
{
    MaxActionLayers=4
}