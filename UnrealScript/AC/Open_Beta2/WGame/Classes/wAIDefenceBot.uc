class wAIDefenceBot extends wAIBot;

var float fLastTimeMeleeAttack;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        CallAirStrike;
}

function bool ReadyToMeleeAttack()
{
    local float fElapsedTime;

    // End:0x23
    if((Pawn == none) || Pawn.Weapon == none)
    {
        return false;
    }
    fElapsedTime = Level.TimeSeconds - fLastTimeMeleeAttack;
    // End:0x81
    if(Pawn.Weapon.BaseParams.fMeleeDelay < fElapsedTime)
    {
        fLastTimeMeleeAttack = Level.TimeSeconds;
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function CallAirStrike(optional Controller Caller)
{
    //return;    
}

function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(1);
    //return;    
}

function SetPawnClass(string inClass, string InCharacter)
{
    local Class<wPawn> pClass;

    // End:0x3D
    if(inClass != "")
    {
        pClass = Class<wPawn>(DynamicLoadObject(inClass, Class'Core.Class'));
        // End:0x3D
        if(pClass != none)
        {
            PawnClass = pClass;
        }
    }
    PawnSetupRecord = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(InCharacter);
    PlayerReplicationInfo.SetCharacterName(InCharacter);
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
    // End:0x174
    if(aPawn != none)
    {
        aPawn.AdjustCollisionSize();
    }
    //return;    
}

function TryCrouch()
{
    //return;    
}

function TryProne()
{
    //return;    
}

function TickStance(float DeltaTime)
{
    // End:0x16
    if(Pawn != none)
    {
        super(Controller).TickStance(DeltaTime);
    }
    //return;    
}

function InitBot(int Grade)
{
    local wAILevel AILevel;
    local wNPCItemGroupParam npcItemParam;

    NavExtraCosts.Length = Level.VisibilityOneRowCount;
    NavDetourExtraCosts.Length = Level.VisibilityOneRowCount;
    AILevel = wAILevel(Level.GetAILevel());
    NPCParam = AILevel.GetNPCParam(Grade);
    npcActions = AILevel.GetNPCAction(NPCParam.ActionGroupID);
    Planner = Class'WGame_Decompressed.wActionPlanner'.static.Create(self, npcActions);
    PlanMaster = AILevel.PlanMaster;
    FutureState = Class'WGame_Decompressed.wFutureState'.static.Create();
    NavExtraCostFactor_VisCount = NPCParam.SafeWeightMin + (FRand() * (NPCParam.SafeWeightMax - NPCParam.SafeWeightMin));
    InitNavExtraCost();
    NavExtraCostFactor_DetourMaxDistFactor = NPCParam.DetourRate;
    NavExtraCostFactor_DetourScore = NPCParam.DetourWeightMin + (FRand() * (NPCParam.DetourWeightMax - NPCParam.DetourWeightMin));
    AILevel.RegisterBot(self);
    //return;    
}

function Possess(Pawn aPawn)
{
    local int lp1;

    super.Possess(aPawn);
    Pawn.Health = int(float(NPCParam.HP) * Level.Game.GetAddHealthRatio());
    Pawn.HealthMax = float(Pawn.Health);
    Pawn.DealDamageRatio_Default = NPCParam.DamageRate;
    Pawn.DealDamageRatio_Explosive = NPCParam.ExplosionDmageRate;
    Pawn.DealDamageRatio_Melee = NPCParam.MeleeDamageRate;
    lp1 = 0;
    J0xC3:

    // End:0x160 [Loop If]
    if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
    {
        // End:0x156
        if(Level.GameMgr.NPCNameGroupParams[lp1].GroupID == NPCParam.NameGroupID)
        {
            Pawn.OwnerName = Level.GameMgr.NPCNameGroupParams[lp1].NickName;
            // [Explicit Break]
            goto J0x160;
        }
        lp1++;
        // [Loop Continue]
        goto J0xC3;
    }
    J0x160:

    // End:0x1B1
    if(Pawn.TeamIndex == 0)
    {
        wAIDefencePawn(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_AF).ItemID;        
    }
    else
    {
        wAIDefencePawn(Pawn).MeshItemID = AILevel.GetItemParamByGroupID(NPCParam.SpCharGroupID_RSA).ItemID;
    }
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
    wAIDefencePawn(Pawn).iNpcID = NPCParam.NPCID;
    // End:0x242
    if(Pawn != none)
    {
        Pawn.AdjustCollisionSize();
    }
    //return;    
}

simulated function int GetTeamNum()
{
    return 1;
    //return;    
}

state PlayerWalking
{    stop;    
}

defaultproperties
{
    bIsPlayer=false
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn'
}