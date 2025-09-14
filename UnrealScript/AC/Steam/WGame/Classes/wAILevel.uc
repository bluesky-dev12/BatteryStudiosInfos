/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAILevel.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:24
 *
 *******************************************************************************/
class wAILevel extends wAILevelBase
    dependson(wAction)
    dependson(wActionContainer)
    dependson(Goal)
    dependson(wPlanMaster)
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
        PoolAction = new class'ObjectPool';
        PoolActionContainer = new class'ObjectPool';
        PoolActionLayer = new class'ObjectPool';
        PoolGoal = new class'ObjectPool';
        PlanMaster = class'wPlanMaster'.static.Create(self);
        InitInfluenceList();
        UpdateAllNavs();
    }
}

function InitInfluenceList()
{
    local int lp1;
    local NavigationPoint nav;

    lp1 = 0;
    nav = Level.NavigationPointList;
    J0x1b:
    // End:0x6b [While If]
    if(nav != none)
    {
        Influence1[lp1] = none;
        Influence0[lp1] = none;
        InfluenceN[lp1] = none;
        ++ lp1;
        nav = nav.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
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
}

function InitFrontLine()
{
    local NavigationPoint nav;

    nav = Level.NavigationPointList;
    J0x14:
    // End:0x9b [While If]
    if(nav != none)
    {
        // End:0x84
        if(!nav.IsA('FlyingPathNode'))
        {
            // End:0x5e
            if(nav.AcquireTeam == 0)
            {
                FrontLineTeam0[FrontLineTeam0.Length] = nav;
            }
            // End:0x84
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
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function NavigationPoint GetRandomDestFromFrontLine(byte inTeam)
{
    // End:0x1f
    if(inTeam == 0)
    {
        return FrontLineTeam1[Rand(FrontLineTeam1.Length)];
    }
    // End:0x40
    else
    {
        // End:0x3e
        if(inTeam == 1)
        {
            return FrontLineTeam1[Rand(FrontLineTeam1.Length)];
        }
        // End:0x40
        else
        {
            return none;
        }
    }
}

function NavigationPoint GetRandomDestFromInfluence(byte inTeam)
{
    // End:0x56
    if(inTeam == 0)
    {
        // End:0x45
        if(Influence1Length == 0)
        {
            // End:0x34
            if(InfluenceNLength == 0)
            {
                return Influence0[Rand(Influence0Length)];
            }
            // End:0x42
            else
            {
                return InfluenceN[Rand(InfluenceNLength)];
            }
        }
        // End:0x53
        else
        {
            return Influence1[Rand(Influence1Length)];
        }
    }
    // End:0xa9
    else
    {
        // End:0xa9
        if(inTeam == 1)
        {
            // End:0x9b
            if(Influence0Length == 0)
            {
                // End:0x8a
                if(InfluenceNLength == 0)
                {
                    return Influence1[Rand(Influence1Length)];
                }
                // End:0x98
                else
                {
                    return InfluenceN[Rand(InfluenceNLength)];
                }
            }
            // End:0xa9
            else
            {
                return Influence0[Rand(Influence0Length)];
            }
        }
    }
}

function UpdateAllNavs()
{
    local NavigationPoint nav;

    AllNavsLength = 0;
    nav = Level.NavigationPointList;
    J0x1b:
    // End:0x50 [While If]
    if(nav != none)
    {
        AllNavs[++ AllNavsLength] = nav;
        nav = nav.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
}

// Export UwAILevel::execUpdateInfluenceListNative(FFrame&, void* const)
native function UpdateInfluenceListNative();
function UpdateInfluenceList()
{
    UpdateInfluenceListNative();
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
    // End:0xd0 [While If]
    if(nav != none)
    {
        // End:0x67
        if(nav.Influence < float(0))
        {
            Influence1[++ Influence1Length] = nav;
        }
        // End:0xa6
        else
        {
            // End:0x93
            if(nav.Influence > float(0))
            {
                Influence0[++ Influence0Length] = nav;
            }
            // End:0xa6
            else
            {
                InfluenceN[++ InfluenceNLength] = nav;
            }
        }
        AllNavs[++ AllNavsLength] = nav;
        nav = nav.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
    lp1 = Influence0Length;
    J0xdb:
    // End:0x102 [While If]
    if(lp1 < Influence0.Length)
    {
        Influence0[lp1] = none;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xdb;
    }
    lp1 = Influence1Length;
    J0x10d:
    // End:0x134 [While If]
    if(lp1 < Influence1.Length)
    {
        Influence1[lp1] = none;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x10d;
    }
    lp1 = InfluenceNLength;
    J0x13f:
    // End:0x166 [While If]
    if(lp1 < InfluenceN.Length)
    {
        InfluenceN[lp1] = none;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x13f;
    }
}

function wNPCParam GetNPCParamByNPCID(int NPCID)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x81 [While If]
    if(lp1 < Level.GameMgr.NPCParams.Length)
    {
        // End:0x77
        if(Level.GameMgr.NPCParams[lp1].NPCID == NPCID)
        {
            return Level.GameMgr.NPCParams[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function wNPCParam GetNPCParam(int Grade)
{
    local int lp1;
    local string Type;
    local wNPCSpawnParam spawnParam, curParam;
    local array<wNPCSpawnParam> spawnParams;

    // End:0x1c
    if(NumTypeAR <= NumTypeSMG)
    {
        Type = "AR";
    }
    // End:0x27
    else
    {
        Type = "SMG";
    }
    lp1 = 0;
    J0x2e:
    // End:0xd9 [While If]
    if(lp1 < Level.GameMgr.NPCSpawnParams.Length)
    {
        curParam = Level.GameMgr.NPCSpawnParams[lp1];
        // End:0xcf
        if(curParam.Type == Type && curParam.Grade == Grade)
        {
            spawnParams[spawnParams.Length] = Level.GameMgr.NPCSpawnParams[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
    // End:0x17d
    if(spawnParams.Length == 0)
    {
        lp1 = 0;
        J0xec:
        // End:0x17d [While If]
        if(lp1 < Level.GameMgr.NPCSpawnParams.Length)
        {
            curParam = Level.GameMgr.NPCSpawnParams[lp1];
            // End:0x173
            if(curParam.Grade == Grade)
            {
                spawnParams[spawnParams.Length] = Level.GameMgr.NPCSpawnParams[lp1];
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xec;
        }
    }
    spawnParam = spawnParams[Rand(spawnParams.Length)];
    lp1 = 0;
    J0x198:
    // End:0x21b [While If]
    if(lp1 < Level.GameMgr.NPCParams.Length)
    {
        // End:0x211
        if(Level.GameMgr.NPCParams[lp1].NPCID == spawnParam.NPCID)
        {
            return Level.GameMgr.NPCParams[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x198;
    }
    return none;
}

function bool ActionExists(int ActionGroupID, string Action)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x97 [While If]
    if(lp1 < Level.GameMgr.NPCActionGroupParams.Length)
    {
        // End:0x8d
        if(Level.GameMgr.NPCActionGroupParams[lp1].ActionGroupID == ActionGroupID && Level.GameMgr.NPCActionGroupParams[lp1].ActionID ~= Action)
        {
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function wNPCActions GetNPCAction(int ActionGroupID)
{
    local wNPCActions A;

    A = new class'wNPCActions';
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
}

function RegisterBot(wAIBotBase Bot)
{
    Bots[Bots.Length] = Bot;
    // End:0x3c
    if(Bot.NPCParam.Type == "AR")
    {
        ++ NumTypeAR;
    }
    // End:0x64
    else
    {
        // End:0x64
        if(Bot.NPCParam.Type == "SMG")
        {
            ++ NumTypeSMG;
        }
    }
}

function KillBotsTeam(int Num, int inTeam)
{
    local int lp1;

    lp1 = Bots.Length - 1;
    J0x0f:
    // End:0x9b [While If]
    if(lp1 >= 0 && Num > 0)
    {
        // End:0x91
        if(Bots[lp1].GetTeamNum() == inTeam)
        {
            Bots[lp1].ClearReferences();
            Level.Game.Kill(Bots[lp1]);
            Bots.Remove(lp1, 1);
            -- Num;
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}

function KillBots(int Num)
{
    local int lp1;

    lp1 = Min(Bots.Length - 1, Num - 1);
    lp1 = lp1;
    J0x24:
    // End:0x7d [While If]
    if(lp1 >= 0)
    {
        Bots[lp1].ClearReferences();
        Level.Game.Kill(Bots[lp1]);
        Bots.Remove(lp1, 1);
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
}

function KillBot(AIController Bot)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7d [While If]
    if(i < Bots.Length)
    {
        // End:0x73
        if(Bots[i] == Bot)
        {
            Bots[i].ClearReferences();
            Level.Game.Kill(Bots[i]);
            Bots.Remove(i, 1);
        }
        // End:0x7d
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function string GetName(int NameGroupID)
{
    local int lp1, lp2;
    local array<string> nameCandidates;
    local bool Found;
    local string curName;

    // End:0x99
    if(NameGroupID > 99)
    {
        lp1 = 0;
        J0x13:
        // End:0x96 [While If]
        if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
        {
            // End:0x8c
            if(Level.GameMgr.NPCNameGroupParams[lp1].GroupID == NameGroupID)
            {
                return Level.GameMgr.NPCNameGroupParams[lp1].NickName;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    // End:0x1a0
    else
    {
        lp1 = 0;
        J0xa0:
        // End:0x1a0 [While If]
        if(lp1 < Level.GameMgr.NPCNameGroupParams.Length)
        {
            // End:0x196
            if(Level.GameMgr.NPCNameGroupParams[lp1].GroupID == NameGroupID)
            {
                curName = Level.GameMgr.NPCNameGroupParams[lp1].NickName;
                Found = false;
                lp2 = 0;
                J0x12d:
                // End:0x179 [While If]
                if(lp2 < Bots.Length)
                {
                    // End:0x16f
                    if(Bots[lp2].PlayerReplicationInfo.PlayerName == curName)
                    {
                        Found = true;
                    }
                    // End:0x179
                    else
                    {
                        ++ lp2;
                        // This is an implied JumpToken; Continue!
                        goto J0x12d;
                    }
                }
                // End:0x196
                if(!Found)
                {
                    nameCandidates[nameCandidates.Length] = curName;
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xa0;
        }
    }
    return nameCandidates[Rand(nameCandidates.Length)];
}

function wNPCItemGroupParam GetItemParamByGroupID(int GroupID)
{
    local int lp1;
    local array<wNPCItemGroupParam> candidates;

    lp1 = 0;
    J0x07:
    // End:0x8d [While If]
    if(lp1 < Level.GameMgr.NPCItemGroupParams.Length)
    {
        // End:0x83
        if(Level.GameMgr.NPCItemGroupParams[lp1].GroupID == GroupID)
        {
            candidates[candidates.Length] = Level.GameMgr.NPCItemGroupParams[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x9e
    if(candidates.Length == 0)
    {
        return none;
    }
    // End:0xad
    else
    {
        return candidates[Rand(candidates.Length)];
    }
}

exec function ResetNames()
{
    local int lp1;
    local wAIBotBase Bot;

    lp1 = 0;
    J0x07:
    // End:0x57 [While If]
    if(lp1 < Bots.Length)
    {
        Bot = Bots[lp1];
        Bot.PlayerReplicationInfo.PlayerName = "ai" $ string(lp1);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function BotsLovePeace()
{
    local int lp1;
    local wAIBotBase Bot;

    lp1 = 0;
    J0x07:
    // End:0x4f [While If]
    if(lp1 < Bots.Length)
    {
        Bot = Bots[lp1];
        Bot.HandleMessage(class'Goal'.default.MessageBePeaceful);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ClearReferences()
{
    local int lp1;

    dblog("[wAILevel::ClearRefenreces]");
    lp1 = 0;
    J0x2a:
    // End:0x59 [While If]
    if(lp1 < Bots.Length)
    {
        Bots[lp1].ClearReferences();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    lp1 = 0;
    J0x60:
    // End:0xa6 [While If]
    if(lp1 < PoolAction.Objects.Length)
    {
        wAction(PoolAction.Objects[lp1]).ClearReferences();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
    lp1 = 0;
    J0xad:
    // End:0xf3 [While If]
    if(lp1 < PoolActionContainer.Objects.Length)
    {
        wActionContainer(PoolActionContainer.Objects[lp1]).ClearReferences();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    lp1 = 0;
    J0xfa:
    // End:0x140 [While If]
    if(lp1 < PoolGoal.Objects.Length)
    {
        Goal(PoolGoal.Objects[lp1]).ClearReferences();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xfa;
    }
}

defaultproperties
{
    bHidden=true
    bAlwaysRelevant=true
    bSkipActorPropertyReplication=true
    RemoteRole=2
}