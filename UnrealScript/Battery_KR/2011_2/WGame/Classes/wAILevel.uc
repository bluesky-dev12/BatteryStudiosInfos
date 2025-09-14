class wAILevel extends wAILevelBase
    native;

var wMatchMaker MM;
var array<NavigationPoint> FrontLineTeam0;
var array<NavigationPoint> FrontLineTeam1;
var int Influence0Length;
var int Influence1Length;
var int InfluenceNLength;
var int AllNavsLength;
var array<NavigationPoint> Influence0;
var array<NavigationPoint> Influence1;
var array<NavigationPoint> InfluenceN;
var array<NavigationPoint> AllNavs;
var int NumTypeAR;
var int NumTypeSMG;
var array<wAIBotBase> Bots;
var ObjectPool PoolAction;
var ObjectPool PoolActionContainer;
var ObjectPool PoolActionLayer;
var ObjectPool PoolGoal;
var wPlanMaster PlanMaster;
var bool bInitialized;

event PreBeginPlay()
{
    Initialize();
    MM = Level.GetMatchMaker();
    //return;    
}

function Initialize()
{
    // End:0x92
    if(!bInitialized)
    {
        bInitialized = true;
        // End:0x34
        if(Level.Game.bTeamGame)
        {
            InitFrontLine();
        }
        PoolAction = new Class'Engine.ObjectPool';
        PoolActionContainer = new Class'Engine.ObjectPool';
        PoolActionLayer = new Class'Engine.ObjectPool';
        PoolGoal = new Class'Engine.ObjectPool';
        PlanMaster = Class'WGame_Decompressed.wPlanMaster'.static.Create(self);
        InitInfluenceList();
        UpdateAllNavs();
    }
    //return;    
}

function InitInfluenceList()
{
    local int lp1;
    local NavigationPoint nav;

    lp1 = 0;
    nav = Level.NavigationPointList;
    J0x1B:

    // End:0x6B [Loop If]
    if(nav != none)
    {
        Influence1[lp1] = none;
        Influence0[lp1] = none;
        InfluenceN[lp1] = none;
        lp1++;
        nav = nav.nextNavigationPoint;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

event Tick(float dt)
{
    // End:0x30
    if(Level.Game.bTeamGame)
    {
        Level.UpdateInfluence();
        UpdateInfluenceList();
    }
    PlanMaster.Update(dt);
    //return;    
}

function InitFrontLine()
{
    local NavigationPoint nav;

    nav = Level.NavigationPointList;
    J0x14:

    // End:0x9B [Loop If]
    if(nav != none)
    {
        // End:0x84
        if(!nav.IsA('FlyingPathNode'))
        {
            // End:0x5E
            if(nav.AcquireTeam == 0)
            {
                FrontLineTeam0[FrontLineTeam0.Length] = nav;                
            }
            else
            {
                // End:0x84
                if(nav.AcquireTeam == 1)
                {
                    FrontLineTeam1[FrontLineTeam1.Length] = nav;
                }
            }
        }
        nav = nav.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function NavigationPoint GetRandomDestFromFrontLine(byte inTeam)
{
    // End:0x1F
    if(int(inTeam) == 0)
    {
        return FrontLineTeam1[Rand(FrontLineTeam1.Length)];        
    }
    else
    {
        // End:0x3E
        if(int(inTeam) == 1)
        {
            return FrontLineTeam1[Rand(FrontLineTeam1.Length)];            
        }
        else
        {
            return none;
        }
    }
    //return;    
}

function NavigationPoint GetRandomDestFromInfluence(byte inTeam)
{
    // End:0x56
    if(int(inTeam) == 0)
    {
        // End:0x45
        if(Influence1Length == 0)
        {
            // End:0x34
            if(InfluenceNLength == 0)
            {
                return Influence0[Rand(Influence0Length)];                
            }
            else
            {
                return InfluenceN[Rand(InfluenceNLength)];
            }            
        }
        else
        {
            return Influence1[Rand(Influence1Length)];
        }        
    }
    else
    {
        // End:0xA9
        if(int(inTeam) == 1)
        {
            // End:0x9B
            if(Influence0Length == 0)
            {
                // End:0x8A
                if(InfluenceNLength == 0)
                {
                    return Influence1[Rand(Influence1Length)];                    
                }
                else
                {
                    return InfluenceN[Rand(InfluenceNLength)];
                }                
            }
            else
            {
                return Influence0[Rand(Influence0Length)];
            }
        }
    }
    //return;    
}

function UpdateAllNavs()
{
    local NavigationPoint nav;

    AllNavsLength = 0;
    nav = Level.NavigationPointList;
    J0x1B:

    // End:0x50 [Loop If]
    if(nav != none)
    {
        AllNavs[AllNavsLength++] = nav;
        nav = nav.nextNavigationPoint;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

// Export UwAILevel::execUpdateInfluenceListNative(FFrame&, void* const)
native function UpdateInfluenceListNative();

function UpdateInfluenceList()
{
    UpdateInfluenceListNative();
    //return;    
}

function UpdateInfluenceListScript()
{
    local int lp1;
    local NavigationPoint nav;

    Influence0Length = 0;
    Influence1Length = 0;
    InfluenceNLength = 0;
    AllNavsLength = 0;
    nav = Level.NavigationPointList;
    J0x30:

    // End:0xD0 [Loop If]
    if(nav != none)
    {
        // End:0x67
        if(nav.Influence < float(0))
        {
            Influence1[Influence1Length++] = nav;            
        }
        else
        {
            // End:0x93
            if(nav.Influence > float(0))
            {
                Influence0[Influence0Length++] = nav;                
            }
            else
            {
                InfluenceN[InfluenceNLength++] = nav;
            }
        }
        AllNavs[AllNavsLength++] = nav;
        nav = nav.nextNavigationPoint;
        // [Loop Continue]
        goto J0x30;
    }
    lp1 = Influence0Length;
    J0xDB:

    // End:0x102 [Loop If]
    if(lp1 < Influence0.Length)
    {
        Influence0[lp1] = none;
        lp1++;
        // [Loop Continue]
        goto J0xDB;
    }
    lp1 = Influence1Length;
    J0x10D:

    // End:0x134 [Loop If]
    if(lp1 < Influence1.Length)
    {
        Influence1[lp1] = none;
        lp1++;
        // [Loop Continue]
        goto J0x10D;
    }
    lp1 = InfluenceNLength;
    J0x13F:

    // End:0x166 [Loop If]
    if(lp1 < InfluenceN.Length)
    {
        InfluenceN[lp1] = none;
        lp1++;
        // [Loop Continue]
        goto J0x13F;
    }
    //return;    
}

function wNPCParam GetNPCParamByNPCID(int NPCID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x81 [Loop If]
    if(lp1 < Level.GameMgr.NPCParams.Length)
    {
        // End:0x77
        if(Level.GameMgr.NPCParams[lp1].NPCID == NPCID)
        {
            return Level.GameMgr.NPCParams[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function wNPCParam GetNPCParam(int Grade)
{
    local int lp1;
    local string Type;
    local wNPCSpawnParam spawnParam, curParam;
    local array<wNPCSpawnParam> spawnParams;

    // End:0x1C
    if(NumTypeAR <= NumTypeSMG)
    {
        Type = "AR";        
    }
    else
    {
        Type = "SMG";
    }
    lp1 = 0;
    J0x2E:

    // End:0xD9 [Loop If]
    if(lp1 < Level.GameMgr.NPCSpawnParams.Length)
    {
        curParam = Level.GameMgr.NPCSpawnParams[lp1];
        // End:0xCF
        if((curParam.Type == Type) && curParam.Grade == Grade)
        {
            spawnParams[spawnParams.Length] = Level.GameMgr.NPCSpawnParams[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x2E;
    }
    // End:0x17D
    if(spawnParams.Length == 0)
    {
        lp1 = 0;
        J0xEC:

        // End:0x17D [Loop If]
        if(lp1 < Level.GameMgr.NPCSpawnParams.Length)
        {
            curParam = Level.GameMgr.NPCSpawnParams[lp1];
            // End:0x173
            if(curParam.Grade == Grade)
            {
                spawnParams[spawnParams.Length] = Level.GameMgr.NPCSpawnParams[lp1];
            }
            lp1++;
            // [Loop Continue]
            goto J0xEC;
        }
    }
    spawnParam = spawnParams[Rand(spawnParams.Length)];
    lp1 = 0;
    J0x198:

    // End:0x21B [Loop If]
    if(lp1 < Level.GameMgr.NPCParams.Length)
    {
        // End:0x211
        if(Level.GameMgr.NPCParams[lp1].NPCID == spawnParam.NPCID)
        {
            return Level.GameMgr.NPCParams[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x198;
    }
    return none;
    //return;    
}

function bool ActionExists(int ActionGroupID, string Action)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x97 [Loop If]
    if(lp1 < Level.GameMgr.NPCActionGroupParams.Length)
    {
        // End:0x8D
        if((Level.GameMgr.NPCActionGroupParams[lp1].ActionGroupID == ActionGroupID) && Level.GameMgr.NPCActionGroupParams[lp1].ActionID ~= Action)
        {
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function wNPCActions GetNPCAction(int ActionGroupID)
{
    local wNPCActions A;

    A = new Class'Engine.wNPCActions';
    A.Fire = ActionExists(ActionGroupID, "Fire");
    A.FireHelicopter = ActionExists(ActionGroupID, "FireHelicopter");
    A.Reload = ActionExists(ActionGroupID, "Reload");
    A.Explore = ActionExists(ActionGroupID, "Explore");
    A.ExploreTutorial = ActionExists(ActionGroupID, "ExploreTutorial");
    A.IdleHands = ActionExists(ActionGroupID, "IdleHands");
    A.ApproachAndMelee = ActionExists(ActionGroupID, "ApproachAndMelee");
    A.MoveToEnemyInfluence = ActionExists(ActionGroupID, "MoveToEnemyInfluence");
    A.MoveToSeeTarget = ActionExists(ActionGroupID, "MoveToSeeTarget");
    A.LookAround = ActionExists(ActionGroupID, "LookAround");
    A.UseHelicopter = ActionExists(ActionGroupID, "UseHelicopter");
    A.UseAirstrikeRealTime = ActionExists(ActionGroupID, "UseAirstrikeRealTime");
    A.UseUAV = ActionExists(ActionGroupID, "UseUAV");
    A.MeleeNoTarget = ActionExists(ActionGroupID, "MeleeNoTarget");
    A.ThrowGrenadeRealTime = ActionExists(ActionGroupID, "ThrowGrenadeRealTime");
    A.SwitchWeapon = ActionExists(ActionGroupID, "SwitchWeapon");
    A.PickHealth = ActionExists(ActionGroupID, "PickHealth");
    A.PickHelicopter = ActionExists(ActionGroupID, "PickHelicopter");
    A.PickAirstrike = ActionExists(ActionGroupID, "PickAirstrike");
    A.PickUAV = ActionExists(ActionGroupID, "PickUAV");
    A.GotoFlag = ActionExists(ActionGroupID, "GotoFlag");
    A.CaptureFlag = ActionExists(ActionGroupID, "CaptureFlag");
    return A;
    //return;    
}

function RegisterBot(wAIBotBase Bot)
{
    Bots[Bots.Length] = Bot;
    // End:0x3C
    if(Bot.NPCParam.Type == "AR")
    {
        NumTypeAR++;        
    }
    else
    {
        // End:0x64
        if(Bot.NPCParam.Type == "SMG")
        {
            NumTypeSMG++;
        }
    }
    //return;    
}

function KillBotsTeam(int Num, int inTeam)
{
    local int lp1;

    lp1 = Bots.Length - 1;
    J0x0F:

    // End:0x86 [Loop If]
    if((lp1 >= 0) && Num > 0)
    {
        // End:0x7C
        if(Bots[lp1].GetTeamNum() == inTeam)
        {
            Level.Game.Kill(Bots[lp1]);
            Bots.Remove(lp1, 1);
            Num--;
        }
        lp1--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

function KillBots(int Num)
{
    local int lp1;

    lp1 = Min(Bots.Length - 1, Num - 1);
    lp1 = lp1;
    J0x24:

    // End:0x7D [Loop If]
    if(lp1 >= 0)
    {
        Bots[lp1].ClearReferences();
        Level.Game.Kill(Bots[lp1]);
        Bots.Remove(lp1, 1);
        lp1--;
        // [Loop Continue]
        goto J0x24;
    }
    //return;    
}

function string GetName(int NameGroupID)
{
    local int lp1, lp2;
    local array<string> nameCandidates;
    local bool Found;
    local string curName;

    lp1 = 0;
    J0x07:

    // End:0x107 [Loop If]
    if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
    {
        // End:0xFD
        if(Level.GameMgr.NPCNameGroupParams[lp1].GroupID == NameGroupID)
        {
            curName = Level.GameMgr.NPCNameGroupParams[lp1].NickName;
            Found = false;
            lp2 = 0;
            J0x94:

            // End:0xE0 [Loop If]
            if(lp2 < Bots.Length)
            {
                // End:0xD6
                if(Bots[lp2].PlayerReplicationInfo.PlayerName == curName)
                {
                    Found = true;
                    // [Explicit Break]
                    goto J0xE0;
                }
                lp2++;
                // [Loop Continue]
                goto J0x94;
            }
            J0xE0:

            // End:0xFD
            if(!Found)
            {
                nameCandidates[nameCandidates.Length] = curName;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return nameCandidates[Rand(nameCandidates.Length)];
    //return;    
}

function wNPCItemGroupParam GetItemParamByGroupID(int GroupID)
{
    local int lp1;
    local array<wNPCItemGroupParam> candidates;

    lp1 = 0;
    J0x07:

    // End:0x8D [Loop If]
    if(lp1 < Level.GameMgr.NPCItemGroupParams.Length)
    {
        // End:0x83
        if(Level.GameMgr.NPCItemGroupParams[lp1].GroupID == GroupID)
        {
            candidates[candidates.Length] = Level.GameMgr.NPCItemGroupParams[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x9E
    if(candidates.Length == 0)
    {
        return none;        
    }
    else
    {
        return candidates[Rand(candidates.Length)];
    }
    //return;    
}

exec function ResetNames()
{
    local int lp1;
    local wAIBotBase Bot;

    lp1 = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(lp1 < Bots.Length)
    {
        Bot = Bots[lp1];
        Bot.PlayerReplicationInfo.PlayerName = "ai" $ string(lp1);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function BotsLovePeace()
{
    local int lp1;
    local wAIBotBase Bot;

    lp1 = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(lp1 < Bots.Length)
    {
        Bot = Bots[lp1];
        Bot.HandleMessage(Class'WGame_Decompressed.Goal'.default.MessageBePeaceful);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ClearReferences()
{
    local int lp1;

    dblog("[wAILevel::ClearRefenreces]");
    lp1 = 0;
    J0x2A:

    // End:0x59 [Loop If]
    if(lp1 < Bots.Length)
    {
        Bots[lp1].ClearReferences();
        lp1++;
        // [Loop Continue]
        goto J0x2A;
    }
    lp1 = 0;
    J0x60:

    // End:0xA6 [Loop If]
    if(lp1 < PoolAction.Objects.Length)
    {
        wAction(PoolAction.Objects[lp1]).ClearReferences();
        lp1++;
        // [Loop Continue]
        goto J0x60;
    }
    lp1 = 0;
    J0xAD:

    // End:0xF3 [Loop If]
    if(lp1 < PoolActionContainer.Objects.Length)
    {
        wActionContainer(PoolActionContainer.Objects[lp1]).ClearReferences();
        lp1++;
        // [Loop Continue]
        goto J0xAD;
    }
    lp1 = 0;
    J0xFA:

    // End:0x140 [Loop If]
    if(lp1 < PoolGoal.Objects.Length)
    {
        Goal(PoolGoal.Objects[lp1]).ClearReferences();
        lp1++;
        // [Loop Continue]
        goto J0xFA;
    }
    //return;    
}

defaultproperties
{
    bHidden=true
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    RemoteRole=2
}