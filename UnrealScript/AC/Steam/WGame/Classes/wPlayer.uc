/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPlayer.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:2
 *	Properties:41
 *	Functions:119
 *	States:3
 *
 *******************************************************************************/
class wPlayer extends UnrealPlayer
    dependson(wArtilleryPack)
    dependson(wUtil)
    dependson(AttractCamera)
    dependson(Combo)
    config(User);

const MinComboKeyTime = 0.05;
const MaxComboKeyTime = 0.35;

var AttractCamera camlist[20];
var int numcams;
var int curcam;
var Pawn attracttarget;
var Pawn attracttarget2;
var float camtime;
var float targettime;
var float gibwatchtime;
var Vector focuspoint;
var transient int InputHistory[4];
var transient float LastKeyTime;
var transient int OldKey;
var float MinAdrenalineCost;
var string ComboNameList[16];
var class<Combo> ComboList[16];
var PlayerRecord PawnSetupRecord;
var float LastRulesRequestTime;
var float LastMapListRequestTime;
var bool autozoom;
var bool bClassicTrans;
var bool bHighBeaconTrajectory;
var bool bWaitingForPRI;
var bool bWaitingForVRI;
var bool bDebuggingVoiceChat;
var bool bAutoDemoRec;
var bool bIsFirstTick;
var bool bMusicStarted;
var float bPrevDeltaTime;
var int nRandomSound;
var byte bOldQuickGrenade;
var byte bOldQuickSubGrenade;
var string ResultMenuClass;
var int wPawnCounts;
var array<wWeapon> InventoryRebuildSkipList;
var Controller CmdTarget;
var float fShakeFovSpeed;
var wFPWeaponAttachment FPTest;
var Actor OldViewTarget;
var float BombSettingDelayTime;
var delegate<ProcessRule> __ProcessRule__Delegate;
var delegate<ProcessMapName> __ProcessMapName__Delegate;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerRequestRules, SkillInit_Server,
        ServerSpecViewGoal, ServerRequestPlayerInfo,
        AdminMenu, ServerSkillUsedByWeapon,
        ServerPlayWeaponNullSound, ServerDoCombo,
        ServerSetClassicTrans, ServerRequestMapList;

    // Pos:0x0d
    unreliable if(Role < 4)
        L33TPhrase;

    // Pos:0x1a
    reliable if(Role == 4)
        ClientReceiveMapName, ClientReceiveBan,
        ClientReceiveRule, AddSkill_Client,
        ClientReceiveCombo, RemoveSkill_Client;

}

delegate ProcessRule(string NewRule);
delegate ProcessMapName(string NewMap);
simulated function ShowPathToActor(Actor A)
{
    local class<WillowWhisp> WWclass;
    local Actor Path;

    clog("[wPlayer::ShowPathToActor]");
    // End:0xc7
    if(Pawn != none && Pawn.Health > 0)
    {
        Path = FindPathTo(A.Location);
        // End:0x74
        if(Path == none)
        {
            Path = FindPathToward(A, false);
        }
        // End:0xc7
        if(Path != none)
        {
            WWclass = class<WillowWhisp>(DynamicLoadObject(class'TeamGame'.default.PathWhisps[GetTeamNum()], class'Class'));
            Spawn(WWclass, self,, self.Pawn.Location);
        }
    }
}

function float GetFovSpeed()
{
    return fShakeFovSpeed;
}

exec function SetFovSpeed(float V)
{
    fShakeFovSpeed = V;
    clog("fShakeFovSpeed=" $ string(fShakeFovSpeed));
}

exec function SetDoTraceNativeInstant(bool val)
{
    Level.bDoTraceNativeInstant = val;
    clog("bDoTraceNativeInstant=" $ string(Level.bDoTraceNativeInstant));
}

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    // End:0x36
    if(CmdTarget != none)
    {
        CmdTarget.Cmd(P1, P2, p3, p4, p5);
    }
    // End:0x6c
    else
    {
        // End:0x6c
        if(RealViewTarget != self)
        {
            RealViewTarget.Cmd(P1, P2, p3, p4, p5);
        }
        // End:0x6c
        else
        {
        }
    }
}

exec function setcmd(string targetName)
{
    local Controller C;

    CmdTarget = none;
    C = Level.ControllerList;
    J0x1b:
    // End:0xb8 [While If]
    if(C != none)
    {
        // End:0xa1
        if(C.PlayerReplicationInfo != none && Locs(C.PlayerReplicationInfo.PlayerName) == Locs(targetName))
        {
            CmdTarget = C;
            clog("found CmdTarget: " $ C.PlayerReplicationInfo.PlayerName);
        }
        // End:0xb8
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
}

exec function ResetNames()
{
    clog("resetNames");
    wAILevel(Level.AILevel).ResetNames();
}

exec function SetSpeed(float factor)
{
    Pawn.GroundSpeed = Pawn.default.GroundSpeed * factor;
    clog("setspeed to =" $ string(Pawn.GroundSpeed));
}

function ServerRequestWeapon(int iWeaponID)
{
    local int i;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local bool added;
    local wWeapon W, ow;

    dblog("[wPlayer::ServerRequestWeapon] name=" $ LoginName $ " iWeaponID=" $ string(iWeaponID));
    // End:0x2e1
    if(Pawn != none)
    {
        W = wWeapon(Pawn.Inventory);
        J0x6f:
        // End:0xcc [While If]
        if(W != none)
        {
            // End:0xb0
            if(W.BaseParams.iWeaponID == iWeaponID)
            {
                InventoryRebuildSkipList[InventoryRebuildSkipList.Length] = W;
            }
            // End:0xcc
            else
            {
                W = wWeapon(W.Inventory);
                // This is an implied JumpToken; Continue!
                goto J0x6f;
            }
        }
        added = false;
        kMM = Level.GetMatchMaker();
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        // End:0x1d0
        if(kUser != none)
        {
            i = 0;
            J0x11e:
            // End:0x1d0 [While If]
            if(i < kUser.EquippedItems.Length)
            {
                // End:0x1c6
                if(kUser.EquippedItems[i].ItemID == iWeaponID)
                {
                    W = Pawn.AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false);
                    added = true;
                }
                // End:0x1d0
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x11e;
                }
            }
        }
        // End:0x1f8
        if(added == false)
        {
            Pawn.AddWeapon(EmptyBtrDouble(), iWeaponID, 0, false);
        }
        ow = none;
        // End:0x2bd
        foreach DynamicActors(class'wWeapon', W)
        {
            // End:0x230
            if(InInventoryRebuildSkipList(W))
            {
                W.Inventory = none;
            }
            // End:0x299
            else
            {
                // End:0x299
                if(W.Instigator == Pawn)
                {
                    // End:0x26a
                    if(ow == none)
                    {
                        Pawn.Inventory = W;
                    }
                    // End:0x28e
                    else
                    {
                        ow.Inventory = W;
                        W.Inventory = none;
                    }
                    ow = W;
                }
            }
            W.NetUpdateTime = Level.TimeSeconds - float(5);                        
        }
        Pawn.NetUpdateTime = Level.TimeSeconds - float(5);
    }
}

function bool InInventoryRebuildSkipList(wWeapon W)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x38 [While If]
    if(lp1 < InventoryRebuildSkipList.Length)
    {
        // End:0x2e
        if(InventoryRebuildSkipList[lp1] == W)
        {
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

exec function CheckPriority()
{
    local Inventory Inv;
    local int Count;

    // End:0x2d
    if(Pawn == none)
    {
        DebugMessage("Pawn is none - returning");
        return;
    }
    Inv = Pawn.Inventory;
    J0x41:
    // End:0xd5 [While If]
    if(Inv != none && Count < 1000)
    {
        // End:0xb7
        if(wWeapon(Inv) != none)
        {
            DebugMessage("Weapon:" $ string(Inv.Name) @ "Priority:" $ string(wWeapon(Inv).Priority), 'PriorityDebug');
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
}

simulated function DebugMessage(string DebugString, optional name Type)
{
    ClientMessage(DebugString);
    Log(DebugString, Type);
}

simulated function string GetRoleString()
{
    local string t;

    t = "Role: ";
    switch(Role)
    {
        // End:0x30
        case 0:
            t = t $ "None";
            // End:0xbe
            break;
        // End:0x50
        case 1:
            t = t $ "DumbProxy";
            // End:0xbe
            break;
        // End:0x75
        case 2:
            t = t $ "SimulatedProxy";
            // End:0xbe
            break;
        // End:0x9b
        case 3:
            t = t $ "AutonomousProxy";
            // End:0xbe
            break;
        // End:0xbb
        case 4:
            t = t $ "Authority";
            // End:0xbe
            break;
        // End:0xffff
        default:
            return t;
    }
}

simulated function string GetPhysicsString()
{
    local string t;

    t = "Physics: ";
    switch(Pawn.Physics)
    {
        // End:0x3c
        case 0:
            t = t $ "None";
            // End:0x1d1
            break;
        // End:0x5a
        case 1:
            t = t $ "Walking";
            // End:0x1d1
            break;
        // End:0x78
        case 2:
            t = t $ "Falling";
            // End:0x1d1
            break;
        // End:0x97
        case 3:
            t = t $ "Swimming";
            // End:0x1d1
            break;
        // End:0xb4
        case 4:
            t = t $ "Flying";
            // End:0x1d1
            break;
        // End:0xd3
        case 5:
            t = t $ "Rotating";
            // End:0x1d1
            break;
        // End:0xf4
        case 6:
            t = t $ "Projectile";
            // End:0x1d1
            break;
        // End:0x118
        case 7:
            t = t $ "Interpolating";
            // End:0x1d1
            break;
        // End:0x13a
        case 8:
            t = t $ "MovingBrush";
            // End:0x1d1
            break;
        // End:0x157
        case 9:
            t = t $ "Spider";
            // End:0x1d1
            break;
        // End:0x175
        case 10:
            t = t $ "Trailer";
            // End:0x1d1
            break;
        // End:0x192
        case 11:
            t = t $ "Ladder";
            // End:0x1d1
            break;
        // End:0x1ae
        case 13:
            t = t $ "Karma";
            // End:0x1d1
            break;
        // End:0x1ce
        case 14:
            t = t $ "K-Ragdoll";
            // End:0x1d1
            break;
        // End:0xffff
        default:
            return t;
    }
}

function ServerRequestRules()
{
    local ServerResponseLine Response;
    local int i;

    // End:0x8f
    if(Level.Pauser == none && Level.TimeSeconds - LastRulesRequestTime < 3.0)
    {
        Log("ServerRequestRules Level.TimeSeconds:" $ string(Level.TimeSeconds) @ "LastRequestTime:" $ string(LastRulesRequestTime));
        return;
    }
    LastRulesRequestTime = Level.TimeSeconds;
    Level.Game.GetServerDetails(Response);
    ClientReceiveRule("");
    i = 0;
    J0xcf:
    // End:0x125 [While If]
    if(i < Response.ServerInfo.Length)
    {
        ClientReceiveRule(Response.ServerInfo[i].key $ "=" $ Response.ServerInfo[i].Value);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xcf;
    }
}

function ClientReceiveRule(string NewRule)
{
    ProcessRule(NewRule);
}

simulated function ClientReceiveResultMenu(string MenuClass)
{
    ResultMenuClass = MenuClass;
}

function ServerRequestMapList()
{
    local int X;
    local array<string> MapList;

    // End:0x57
    if(Level.Pauser == none && Level.TimeSeconds - LastMapListRequestTime < 3.0 || Level.Game.MapListType == "")
    {
        return;
    }
    LastMapListRequestTime = Level.TimeSeconds;
    MapList = Level.Game.GetMapRotation();
    ClientReceiveMapName("");
    X = 0;
    J0x98:
    // End:0xc3 [While If]
    if(X < MapList.Length)
    {
        ClientReceiveMapName(MapList[X]);
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x98;
    }
}

function ClientReceiveMapName(string NewMap)
{
    ProcessMapName(NewMap);
}

function StopFiring();
simulated function PlayBeepSound();
simulated function float RateWeapon(wWeapon W)
{
    return float(W.default.Priority);
}

exec function L33TPhrase(int PhraseNum)
{
    SendMessage(none, 'Hidden', byte(PhraseNum), 5.0, 'Global');
}

exec function MakeItemBox(string t)
{
    local Actor spawnedActor;

    // End:0x56
    if(t == "heli")
    {
        spawnedActor = Spawn(class'wHeliPack',,, Pawn.Location - CollisionHeight * vect(0.0, 0.0, 1.0) + vect(100.0, 100.0, 0.0));
    }
    // End:0x155
    else
    {
        // End:0xab
        if(t == "uav")
        {
            spawnedActor = Spawn(class'wUAVPack',,, Pawn.Location - CollisionHeight * vect(0.0, 0.0, 1.0) + vect(100.0, 100.0, 0.0));
        }
        // End:0x155
        else
        {
            // End:0x100
            if(t == "art")
            {
                spawnedActor = Spawn(class'wArtilleryPack',,, Pawn.Location - CollisionHeight * vect(0.0, 0.0, 1.0) + vect(100.0, 100.0, 0.0));
            }
            // End:0x155
            else
            {
                // End:0x155
                if(t == "health")
                {
                    spawnedActor = Spawn(class'wHealthPack',,, Pawn.Location - CollisionHeight * vect(0.0, 0.0, 1.0) + vect(100.0, 100.0, 0.0));
                }
            }
        }
    }
    // End:0x174
    if(spawnedActor != none)
    {
        Pickup(spawnedActor).InitDroppedPack();
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    LastKillTime = -5.0;
}

simulated event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    // End:0x2b
    if(Level.NetMode != 1)
    {
        ServerSetClassicTrans(bClassicTrans);
    }
    // End:0x55
    if(SkillBase == none)
    {
        SkillBase = new class'wSkillBase';
        SkillBase.Owner = self;
    }
}

function ServerSetClassicTrans(bool B)
{
    bHighBeaconTrajectory = B;
}

simulated function ClientReceiveCombo(string NewCombo)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xb7 [While If]
    if(i < 16)
    {
        // End:0x2d
        if(ComboNameList[i] ~= NewCombo)
        {
            return;
        }
        // End:0xad
        else
        {
            // End:0xad
            if(ComboNameList[i] == "")
            {
                ComboNameList[i] = NewCombo;
                ComboList[i] = class<Combo>(DynamicLoadObject(ComboNameList[i], class'Class'));
                // End:0x8a
                if(ComboList[i] == none)
                {
                    return;
                }
                MinAdrenalineCost = FMin(MinAdrenalineCost, ComboList[i].default.AdrenalineCost);
                return;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    super.NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    CientSetHitSprintDelay();
}

event PlayerTick(float DeltaTime)
{
    super(PlayerController).PlayerTick(DeltaTime);
    // End:0x1d
    if(Viewport(Player) == none)
    {
        return;
    }
    // End:0xe2
    if(Pawn == none)
    {
        // End:0xd7
        if(IsInState('Spectating') || IsInState('SpectatingGM') && Pawn != ViewTarget && wPawn(ViewTarget) != none && wPawn(ViewTarget).FPWeaponAttachment != none)
        {
            // End:0xaa
            if(OldViewTarget != ViewTarget)
            {
                wPawn(ViewTarget).FPWeaponAttachment.RefreshState();
            }
            wPawn(ViewTarget).FPWeaponAttachment.TickFPWeapon(DeltaTime);
            OldViewTarget = ViewTarget;
        }
        InputHistory[0] = 0;
        return;
    }
    ProcessUseKey();
    ProcessQuickGrenadeKey2();
}

function ProcessUseKey()
{
    local bool bHasDemoPack;

    // End:0x0d
    if(IsInState('ChangedHost'))
    {
        return;
    }
    // End:0x55
    if(Pawn != none && Pawn.Weapon != none && Pawn.Weapon.IsA('wDemopack'))
    {
        bHasDemoPack = true;
    }
    // End:0xb5
    if(bUseKey == 1)
    {
        Log(string(self) $ " bUseKey : " $ string(bUseKey) $ " / byOldUseKey :" $ string(byOldUseKey));
        // End:0xb2
        if(byOldUseKey == 0)
        {
            ProcessSetObjective();
        }
        // End:0xb2
        else
        {
        }
    }
    // End:0x1db
    else
    {
        // End:0x1db
        if(bUseKey == 0 && byOldUseKey == 1 || bHasDemoPack)
        {
            wPawn(Pawn).SetSpecialState(0);
            // End:0x1c7
            if(bHasDemoPack)
            {
                // End:0x168
                if(Pawn.Role == 4)
                {
                    Pawn.PlaySound(Pawn.Weapon.NullSound, 3, 1.0,, Pawn.Weapon.ResParams.default.rad_Fire, 1.0, false,,, true);
                }
                // End:0x199
                if(0 == Pawn.Weapon.byActionThrowsWeapon)
                {
                    Pawn.SwitchToLastWeapon();
                }
                // End:0x1c7
                else
                {
                    // End:0x1c7
                    if(1 == Pawn.Weapon.byActionThrowsWeapon)
                    {
                        Pawn.SwitchToLastWeapon_ThrowsWeapon();
                    }
                }
            }
            Pawn.ServerSetUseKeyState(bUseKey);
        }
    }
    byOldUseKey = bUseKey;
}

function ProcessSetObjective()
{
    local bool hasBomb, bSettingBomb, bUsed;
    local byte byUsed;

    bUsed = false;
    bUsed = ServerUse();
    Pawn.ServerSetUseKeyState(bUseKey);
    // End:0x50
    if(Level.TimeSeconds - BombSettingDelayTime > 0.40)
    {
        bSettingBomb = true;
    }
    BombSettingDelayTime = Level.TimeSeconds;
    // End:0x1bb
    if(bUsed == false && Level.GRI.GameClass == "WMission.wSDGameInfo" || Level.GRI.GameClass == "WMission.wSBTGameInfo" && myHUD.IsA('wHUD_Mission'))
    {
        hasBomb = PlayerReplicationInfo.HasFlag != none && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
        hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(GetTeamNum()));
        ProcessSwitchDemoPack(byUsed, hasBomb, bSettingBomb);
        bUsed = bool(byUsed);
    }
    // End:0x1d6
    if(bUsed == false)
    {
        Pawn.ClientPickupWeapon();
    }
}

function ProcessSwitchDemoPack(out byte byUsed, bool hasBomb, bool bSettingBomb)
{
    local UseObjective UO;
    local bool bTraceGeom;

    byUsed = 0;
    // End:0xec
    if(hasBomb)
    {
        // End:0xe8
        foreach Pawn.TouchingActors(class'UseObjective', UO)
        {
            // End:0xe7
            if(UO.IsA('wSetObjective'))
            {
                Log(string(self) $ " ProcessSwitchDemoPack() / bSettingBomb : " $ string(bSettingBomb));
                // End:0xc9
                if(bSettingBomb)
                {
                    Pawn.SwitchWeaponWClass('wDemopack');
                    Log(string(self) $ "/ Pawn.SwitchWeaponWClass( 'wDemoPack' )");
                }
                byUsed = 1;
                wPawn(Pawn).SetSpecialState(1);
            }                        
        }
    }
    // End:0x269
    else
    {
        Log("objectplanted: " $ string(Level.GRI.bObjectivePlanted));
        // End:0x268
        foreach Pawn.TouchingActors(class'UseObjective', UO)
        {
            Log("active:" $ string(UO.IsActive()));
            Log("disabled:" $ string(UO.bDisabled));
            // End:0x267
            if(Level.GRI.bObjectivePlanted && UO.IsA('wDiffuseObjective'))
            {
                // End:0x267
                if(Level.GRI.CurrentAttackingTeam != PlayerReplicationInfo.Team.TeamIndex && UO.strPlayerName == "")
                {
                    bTraceGeom = Pawn.FastTrace(Pawn.Location, UO.Location);
                    // End:0x22c
                    if(bTraceGeom == false)
                    {
                        continue;
                    }
                    // End:0x268
                    else
                    {
                        // End:0x249
                        if(bSettingBomb)
                        {
                            Pawn.SwitchWeaponWClass('wDemopack');
                        }
                        byUsed = 1;
                        wPawn(Pawn).SetSpecialState(1);
                    }
                }
                continue;
            }            
        }
    }
}

function ProcessQuickGrenadeKey()
{
    local wWeapon W;

    // End:0x111
    if(bOldQuickGrenade != bQuickGrenade)
    {
        // End:0xa4
        if(bQuickGrenade == 1)
        {
            // End:0x7f
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4)
            {
                // End:0x7c
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }
            }
            // End:0xa1
            else
            {
                W = GetWeaponByInventoryGroup(4);
                // End:0xa1
                if(W != none)
                {
                    SwitchWeapon(4, true);
                }
            }
        }
        // End:0x111
        else
        {
            // End:0x111
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4 && Pawn.Weapon.IsFiring() == true && bFire == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickGrenade = bQuickGrenade;
    // End:0x22d
    if(bOldQuickSubGrenade != bQuickSubGrenade)
    {
        // End:0x1c0
        if(bQuickSubGrenade == 1)
        {
            // End:0x19b
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 3)
            {
                // End:0x198
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }
            }
            // End:0x1bd
            else
            {
                W = GetWeaponByInventoryGroup(3);
                // End:0x1bd
                if(W != none)
                {
                    SwitchWeapon(3, true);
                }
            }
        }
        // End:0x22d
        else
        {
            // End:0x22d
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 3 && Pawn.Weapon.IsFiring() == true && bFire == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickSubGrenade = bQuickSubGrenade;
}

function ProcessQuickGrenadeKey2()
{
    local wWeapon W;

    // End:0x139
    if(bOldQuickGrenade != bQuickGrenade)
    {
        // End:0xcc
        if(bQuickGrenade == 1)
        {
            // End:0x9b
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4 && IsFragGrenade(Pawn.Weapon) == true)
            {
                // End:0x98
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }
            }
            // End:0xc9
            else
            {
                W = GetWeaponByWeaponType(0);
                // End:0xc9
                if(W != none)
                {
                    Pawn.SwitchWeaponByWeaponItem(W, true);
                }
            }
        }
        // End:0x139
        else
        {
            // End:0x139
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4 && Pawn.Weapon.IsFiring() == true && bFire == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickGrenade = bQuickGrenade;
    // End:0x27d
    if(bOldQuickSubGrenade != bQuickSubGrenade)
    {
        // End:0x210
        if(bQuickSubGrenade == 1)
        {
            // End:0x1df
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4 && IsSpecialGrenade(Pawn.Weapon) == true)
            {
                // End:0x1dc
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }
            }
            // End:0x20d
            else
            {
                W = GetWeaponByWeaponType(1);
                // End:0x20d
                if(W != none)
                {
                    Pawn.SwitchWeaponByWeaponItem(W, true);
                }
            }
        }
        // End:0x27d
        else
        {
            // End:0x27d
            if(Pawn.Weapon != none && Pawn.Weapon.InventoryGroup == 4 && Pawn.Weapon.IsFiring() == true && bFire == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickSubGrenade = bQuickSubGrenade;
}

function ServerPlayWeaponNullSound(wWeapon Wpn, Engine.Actor.ESoundSlot Slot, optional bool UseStereo)
{
    Pawn.PlaySound(Wpn.NullSound, Slot, 1.0,, Pawn.Weapon.ResParams.default.rad_Fire, 1.0, false,,, true);
}

function DoCombo(class<Combo> ComboClass)
{
    // End:0x39
    if(Adrenaline >= ComboClass.default.AdrenalineCost && !Pawn.InCurrentCombo())
    {
        ServerDoCombo(ComboClass);
    }
}

function ServerDoCombo(class<Combo> ComboClass)
{
    // End:0x1f
    if(ComboClass == none || wPawn(Pawn) == none)
    {
        return;
    }
    // End:0x8e
    if(Adrenaline >= ComboClass.default.AdrenalineCost && !Pawn.InCurrentCombo())
    {
        // End:0x75
        if(ComboClass.default.ExecMessage != "")
        {
            ReceiveLocalizedMessage(class'ComboMessage',,,, ComboClass);
        }
        wPawn(Pawn).DoCombo(ComboClass);
    }
}

function FillCameraList()
{
    local AttractCamera cam;

    numcams = 0;
    // End:0x3a
    foreach AllActors(class'AttractCamera', cam)
    {
        camlist[++ numcams] = cam;
        // End:0x39
        if(numcams == 20)
        {
        }
        // End:0x3a
        else
        {
            continue;
        }        
    }
}

function bool FindFixedCam(Pawn Target, out int newcam)
{
    local int C, bestc;
    local float dist, BestDist;

    bestc = -1;
    C = 0;
    J0x12:
    // End:0xa2 [While If]
    if(C < numcams)
    {
        dist = VSize(Target.Location - camlist[C].Location);
        // End:0x98
        if(bestc == -1 || dist < BestDist && LineOfSight(C, Target))
        {
            bestc = C;
            BestDist = dist;
        }
        ++ C;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    // End:0xb3
    if(bestc == -1)
    {
        return false;
    }
    newcam = bestc;
    return true;
}

function Vector FindFloatingCam(Pawn Target)
{
    local Vector v1, v2, D;
    local Rotator R;
    local Vector HitLoc, HitNormal;
    local Actor HitActor;
    local int tries;

    // End:0x137 [While If]
    if(++ tries < 10)
    {
        J0x00:
        v1 = Target.Location;
        R = Target.Rotation;
        R.Pitch = int(FRand() * float(12000) - float(2000));
        // End:0x8c
        if(VSize(Target.Velocity) < float(100))
        {
            R.Yaw += int(FRand() * float(24000));
        }
        // End:0xa5
        else
        {
            R.Yaw += int(FRand() * float(12000));
        }
        D = vector(R);
        v2 = v1 + D * float(2000);
        v1 += D * float(50);
        HitActor = Trace(HitLoc, HitNormal, v2, v1, false);
        // End:0x134
        if(HitActor != none && VSize(HitLoc - v1) > float(250))
        {
            return HitLoc - D * float(50);
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    // End:0x158
    if(HitActor != none)
    {
        return HitLoc - D * float(50);
    }
    // End:0x15e
    else
    {
        return v2;
    }
}

function Pawn PickNextBot(Pawn Current)
{
    local Controller con;
    local int B;

    // End:0x1f
    if(Current != none)
    {
        con = Current.Controller;
    }
    B = 0;
    J0x26:
    // End:0xe0 [While If]
    if(B < Level.Game.NumBots)
    {
        // End:0x66
        if(con != none)
        {
            con = con.nextController;
        }
        // End:0x85
        if(con == none)
        {
            con = Level.ControllerList;
        }
        // End:0xd6
        if(con.IsA('Bot') && con.Pawn != none && !con.IsInState('PlayerWaiting'))
        {
            return con.Pawn;
        }
        ++ B;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    return none;
}

function bool LineOfSight(int C, Pawn Target)
{
    local Vector v1, v2;
    local AttractCamera cam;
    local Vector HitLoc, HitNormal;

    // End:0x33
    if(C >= 0)
    {
        cam = camlist[C];
        v1 = cam.Location;
    }
    // End:0x43
    else
    {
        v1 = self.Location;
    }
    v2 = Target.Location;
    v2.Z += Target.EyeHeight;
    v2 += Normal(v1 - v2) * float(100);
    return Trace(HitLoc, HitNormal, v1, v2, false) == none;
}

function Rotator CameraTrack(Pawn Target, float DeltaTime)
{
    local float dist;
    local Vector lead;
    local float MinZoomDist, MaxZoomDist, ViewAngle, viewwidth;

    lead = Target.Location + vect(0.0, 0.0, 2.0) * Target.CollisionHeight;
    dist = VSize(lead - focuspoint);
    // End:0x7f
    if(dist > float(20))
    {
        focuspoint += Normal(lead - focuspoint) * dist * DeltaTime * 2.0;
    }
    // End:0x1a5
    if(autozoom)
    {
        dist = VSize(Location - Target.Location);
        // End:0x101
        if(curcam >= 0)
        {
            MinZoomDist = camlist[curcam].MinZoomDist;
            MaxZoomDist = camlist[curcam].MaxZoomDist;
            ViewAngle = camlist[curcam].ViewAngle;
        }
        // End:0x122
        else
        {
            MinZoomDist = 600.0;
            MaxZoomDist = 1200.0;
            ViewAngle = default.FovAngle;
        }
        // End:0x13f
        if(dist < MinZoomDist)
        {
            FovAngle = ViewAngle;
        }
        // End:0x19a
        else
        {
            // End:0x19a
            if(dist < MaxZoomDist)
            {
                viewwidth = MinZoomDist * Tan(ViewAngle * 3.1415930 / float(180) / float(2));
                FovAngle = Atan(viewwidth, dist) * float(180) / 3.1415930 * float(2);
            }
        }
        DesiredFOV = FovAngle;
    }
    return rotator(focuspoint - Location);
}

function PawnDied(Pawn P)
{
    // End:0x11
    if(Pawn != P)
    {
        return;
    }
    bBehindView = true;
    LastKillTime = -5.0;
    // End:0x5b
    if(Pawn != none)
    {
        curcam = -1;
        SetLocation(FindFloatingCam(Pawn));
        SetRotation(CameraTrack(Pawn, 0.0));
    }
    super(PlayerController).PawnDied(P);
}

function SetPawnClass(string inClass, string InCharacter)
{
    local class<wPawn> pClass;

    // End:0x51
    if(inClass != "")
    {
        pClass = class<wPawn>(DynamicLoadObject(inClass, class'Class'));
        // End:0x51
        if(pClass != none && pClass.default.bCanPickupInventory)
        {
            PawnClass = pClass;
        }
    }
    PawnSetupRecord = class'wUtil'.static.FindPlayerRecord(InCharacter);
    PlayerReplicationInfo.SetCharacterName(InCharacter);
    SetPlayerEquipInfo();
}

function SetPlayerEquipInfo()
{
    local int i, j;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local int iBody[2], iHead, iHelmet, iAcce;

    kMM = Level.GetMatchMaker();
    // End:0x216
    if(kMM.UserInfos.Length > 0)
    {
        i = 0;
        J0x31:
        // End:0x216 [While If]
        if(i < kMM.UserInfos.Length)
        {
            // End:0x20c
            if(kMM.UserInfos[i].UserName == PlayerReplicationInfo.PlayerName)
            {
                kUser = kMM.UserInfos[i];
                iHelmet = 11000;
                iHead = 12000;
                iAcce = 13000;
                iBody[0] = 15000;
                iBody[1] = 15000;
                j = 0;
                J0xd6:
                // End:0x1de [While If]
                if(j < kUser.EquippedItems.Length)
                {
                    switch(kUser.EquippedItems[j].SlotPosition)
                    {
                        // End:0x131
                        case 18:
                            iHelmet = kUser.EquippedItems[j].ItemID;
                            // End:0x1d4
                            break;
                        // End:0x158
                        case 19:
                            iHead = kUser.EquippedItems[j].ItemID;
                            // End:0x1d4
                            break;
                        // End:0x17f
                        case 20:
                            iAcce = kUser.EquippedItems[j].ItemID;
                            // End:0x1d4
                            break;
                        // End:0x1a8
                        case 21:
                            iBody[0] = kUser.EquippedItems[j].ItemID;
                            // End:0x1d4
                            break;
                        // End:0x1d1
                        case 22:
                            iBody[1] = kUser.EquippedItems[j].ItemID;
                            // End:0x1d4
                            break;
                        // End:0xffff
                        default:
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0xd6;
                        }
                        PlayerReplicationInfo.SetCharacterEquipItem(iBody[0], iBody[1], iHead, iHelmet, iAcce);
                        return;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x31;
                }
            }
            PlayerReplicationInfo.SetCharacterEquipItem(15000, 15000, 12000, 11000, 13000);
}

function SetPawnFemale()
{
    // End:0x21
    if(PawnSetupRecord.Species == none)
    {
        PlayerReplicationInfo.bIsFemale = true;
    }
}

function Possess(Pawn aPawn)
{
    local wPawn xp;

    super.Possess(aPawn);
    xp = wPawn(aPawn);
    // End:0x3b
    if(xp != none)
    {
        xp.Setup(PawnSetupRecord, true);
    }
    // End:0x60
    if(Level.NetMode != 1)
    {
        ServerSetClassicTrans(bClassicTrans);
    }
}

exec function ChangeCharacter(string newCharacter)
{
    SetPawnClass(string(PawnClass), newCharacter);
}

simulated function bool NeedNetNotify()
{
    return super.NeedNetNotify() || bWaitingForPRI || bVoiceChatEnabled && bWaitingForVRI;
}

simulated event PostNetReceive()
{
    local PlayerRecord Rec;

    super.PostNetReceive();
    // End:0xa9
    if(PlayerReplicationInfo != none && bWaitingForPRI)
    {
        bWaitingForPRI = false;
        Rec = class'wUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName);
        // End:0x57
        if(Rec.Species != none)
        {
        }
        // End:0xa9
        if(bAutoDemoRec && Level.NetMode == 3 && !bDemoOwner)
        {
            Player.Console.DelayedConsoleCommand("demorec");
        }
    }
    // End:0x12a
    if(VoiceReplicationInfo != none && bWaitingForVRI)
    {
        // End:0x12a
        if(PlayerReplicationInfo != none && !PlayerReplicationInfo.NeedNetNotify())
        {
            bWaitingForVRI = VoiceReplicationInfo.GetPublicChannelCount(true) == 0;
            // End:0x12a
            if(!bWaitingForVRI)
            {
                VoiceReplicationInfo.SetOwner(self);
                // End:0x124
                if(bVoiceChatEnabled)
                {
                    InitializeVoiceChat();
                }
                // End:0x12a
                else
                {
                    DisableVoiceChat();
                }
            }
        }
    }
    bNetNotify = NeedNetNotify();
}

exec function AdminMenu(string CommandLine);
function ServerRequestPlayerInfo()
{
    local Controller C;
    local wPlayer xPC;

    // End:0xf2
    if(PlayerReplicationInfo.bAdmin)
    {
        C = Level.ControllerList;
        J0x26:
        // End:0xf2 [While If]
        if(C != none)
        {
            xPC = wPlayer(C);
            // End:0x9a
            if(xPC != none)
            {
                ClientReceiveRule(xPC.PlayerReplicationInfo.PlayerName $ Chr(27) $ xPC.GetPlayerIDHash() $ Chr(27) $ xPC.GetPlayerNetworkAddress());
            }
            // End:0xdb
            else
            {
                ClientReceiveRule(C.PlayerReplicationInfo.PlayerName $ Chr(27) $ "AI Controlled" $ Chr(27) $ "BOT");
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x26;
        }
    }
    ClientReceiveRule("Done");
}

exec function SpecViewGoal()
{
    ServerSpecViewGoal();
}

function ServerSpecViewGoal()
{
    local Actor NewGoal;

    // End:0xc4
    if(PlayerReplicationInfo.bOnlySpectator && IsInState('Spectating') || IsInState('SpectatingGM'))
    {
        NewGoal = Level.Game.FindSpecGoalFor(PlayerReplicationInfo, 0);
        // End:0xc4
        if(NewGoal != none)
        {
            // End:0x84
            if(Pawn(NewGoal) != none)
            {
                SetViewTarget(NewGoal);
                ClientSetViewTarget_H(NewGoal);
            }
            // End:0xc4
            else
            {
                SetViewTarget(none);
                ClientSetViewTarget_I(none);
                bBehindView = false;
                SetLocation(NewGoal.Location);
                ClientSetLocation(NewGoal.Location, Rotation);
            }
        }
    }
}

function ServerRequestBanInfo(int PlayerID)
{
    local array<PlayerController> CArr;
    local int i;

    // End:0x1f9
    if(Level != none && Level.Game != none)
    {
        Level.Game.GetPlayerControllerList(CArr);
        i = 0;
        J0x45:
        // End:0x1f9 [While If]
        if(i < CArr.Length)
        {
            // End:0x69
            if(CArr[i] == self)
            {
            }
            // End:0x1ef
            else
            {
                // End:0x1ef
                if(PlayerID == -1 || CArr[i].PlayerReplicationInfo.PlayerID == PlayerID)
                {
                    Log(string(Name) @ "Sending BanInfo To Client PlayerID:" $ string(CArr[i].PlayerReplicationInfo.PlayerID) @ "Hash:" $ CArr[i].GetPlayerIDHash() @ "Address:" $ CArr[i].GetPlayerNetworkAddress(), 'ChatManager');
                    ChatManager.TrackNewPlayer(CArr[i].PlayerReplicationInfo.PlayerID, CArr[i].GetPlayerIDHash(), CArr[i].GetPlayerNetworkAddress());
                    ClientReceiveBan(string(CArr[i].PlayerReplicationInfo.PlayerID) $ Chr(27) $ CArr[i].GetPlayerIDHash() $ Chr(27) $ CArr[i].GetPlayerNetworkAddress());
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
    }
}

function ClientReceiveBan(string BanInfo)
{
    // End:0x29
    if(UnrealPlayerChatManager(ChatManager) != none)
    {
        UnrealPlayerChatManager(ChatManager).ReceiveBanInfo(BanInfo);
    }
}

simulated function InitializeVoiceChat()
{
    super(PlayerController).InitializeVoiceChat();
    ServerRequestBanInfo(-1);
}

simulated exec function ShowAliases()
{
    local array<string> output;
    local Security S;
    local int i;

    S = Spawn(class'Security');
    // End:0xa3
    if(S != none)
    {
        S.LocalPerform(100, "", "", output);
        Log("No of Aliases:" @ string(output.Length));
        i = 0;
        J0x56:
        // End:0x97 [While If]
        if(i < output.Length)
        {
            Log("   Alias" @ string(i) $ ":" @ output[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x56;
        }
        S.Destroy();
    }
}

simulated exec function ShowBindings()
{
    local array<string> output;
    local Security S;
    local int i;

    S = Spawn(class'Security');
    // End:0xa6
    if(S != none)
    {
        S.LocalPerform(101, "", "", output);
        Log("No of Bindings:" @ string(output.Length));
        i = 0;
        J0x57:
        // End:0x9a [While If]
        if(i < output.Length)
        {
            Log("   Binding" @ string(i) $ ":" @ output[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x57;
        }
        S.Destroy();
    }
}

exec function Check()
{
    local Decoration D;

    // End:0x49
    foreach AllActors(class'Decoration', D)
    {
        Log("#### D:" @ string(D) @ string(VSize(Pawn.Location - D.Location)));                
    }
}

function ServerCallHelicopter(optional Pawn lastHeliPawn, optional Controller Caller)
{
    local wHelicopter lastHeli;

    // End:0x12
    if(Caller == none)
    {
        Caller = self;
    }
    lastHeli = wHelicopter(lastHeliPawn);
    class'wHelicopter'.static.Call(Level, lastHeli, Caller);
}

function Vector CalcAirStrikeLocation(float fMaxDist)
{
    local Vector vMin, vMax;
    local int lp1, lp2, lpCount;
    local array<Vector> vLocationList, vUsalLocationList;
    local Vector HitLocation;
    local array<Actor> wEnemys;
    local wMatchMaker kMM;
    local NavigationPoint naviPoint;
    local bool bCheck;
    local array<NavigationPoint> selectedRespawndPos;

    bCheck = false;
    lpCount = 0;
    kMM = Level.GetMatchMaker();
    // End:0xe2
    if(kMM.kGame_GameMode == kMM.0 || kMM.kGame_GameMode == kMM.3 || kMM.kGame_GameMode == 5 || kMM.kGame_GameMode == kMM.4)
    {
        wEnemys = Level.Game.GetEveryEnemyList2(byte(Pawn.PlayerReplicationInfo.Team.TeamIndex));
    }
    // End:0x105
    else
    {
        wEnemys = Level.Game.GetPersonalEnemyList(Pawn);
    }
    // End:0x399
    if(wEnemys.Length >= 2)
    {
        // End:0x158
        if(Pawn.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            selectedRespawndPos = Level.Game.recentlySpawnedPointsTeamRSA;
        }
        // End:0x175
        else
        {
            selectedRespawndPos = Level.Game.recentlySpawnedPointsTeamAF;
        }
        lp1 = 0;
        J0x17c:
        // End:0x221 [While If]
        if(lp1 < wEnemys.Length)
        {
            lp2 = 0;
            J0x193:
            // End:0x1e6 [While If]
            if(lp2 < selectedRespawndPos.Length)
            {
                // End:0x1dc
                if(VSize(selectedRespawndPos[lp2].Location - wEnemys[lp1].Location) <= fMaxDist)
                {
                }
                // End:0x1e6
                else
                {
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x193;
                }
            }
            // End:0x217
            if(lp2 == selectedRespawndPos.Length)
            {
                vLocationList[vLocationList.Length] = wEnemys[lp1].Location;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x17c;
        }
        lp1 = 0;
        J0x228:
        // End:0x325 [While If]
        if(lp1 < vLocationList.Length)
        {
            vUsalLocationList.Length = 0;
            lp2 = 0;
            J0x247:
            // End:0x2ca [While If]
            if(lp2 < vLocationList.Length)
            {
                // End:0x269
                if(lp1 == lp2)
                {
                }
                // End:0x2c0
                else
                {
                    HitLocation = vLocationList[lp1] - vLocationList[lp2];
                    HitLocation.Z = 0.0;
                    // End:0x2c0
                    if(VSize(HitLocation) <= fMaxDist)
                    {
                        vUsalLocationList[vUsalLocationList.Length] = vLocationList[lp2];
                    }
                }
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x247;
            }
            vUsalLocationList[vUsalLocationList.Length] = vLocationList[lp1];
            // End:0x31b
            if(vUsalLocationList.Length > lpCount)
            {
                ClipAirStrikeLocation(vMin, vMax, vUsalLocationList);
                bCheck = true;
                lpCount = vUsalLocationList.Length;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x228;
        }
        // End:0x346
        if(bCheck == false)
        {
            ClipAirStrikeLocation(vMin, vMax, vLocationList);
        }
        HitLocation.X = vMin.X + vMax.X * 0.50;
        HitLocation.Y = vMin.Y + vMax.Y * 0.50;
    }
    // End:0x603
    else
    {
        // End:0x3e8
        if(wEnemys.Length == 1)
        {
            HitLocation.X = wEnemys[0].Location.X;
            HitLocation.Y = wEnemys[0].Location.Y;
        }
        // End:0x603
        else
        {
            // End:0x4ca
            if(Level.Game.DeathPos.Length >= 1)
            {
                vLocationList = Level.Game.GetDeathPosArray();
                // End:0x499
                if(vLocationList.Length >= 2)
                {
                    ClipAirStrikeLocation(vMin, vMax, vLocationList);
                    HitLocation.X = vMin.X + vMax.X * 0.50;
                    HitLocation.Y = vMin.Y + vMax.Y * 0.50;
                }
                // End:0x4c7
                else
                {
                    HitLocation.X = vLocationList[0].X;
                    HitLocation.Y = vLocationList[0].Y;
                }
            }
            // End:0x603
            else
            {
                // End:0x53f
                if(Level.Game.NumPlayers + Level.Game.NumBots == 1)
                {
                    HitLocation.X = Pawn.Location.X;
                    HitLocation.Y = Pawn.Location.Y;
                }
                // End:0x603
                else
                {
                    lp1 = Pawn.PlayerReplicationInfo.Team.TeamIndex;
                    // End:0x5a1
                    if(kMM.kGame_GameMode == kMM.0)
                    {
                        // End:0x59a
                        if(lp1 == 0)
                        {
                            lp1 = 1;
                        }
                        // End:0x5a1
                        else
                        {
                            lp1 = 0;
                        }
                    }
                    naviPoint = Level.Game.FindPlayerStart(none, byte(lp1));
                    HitLocation.X = naviPoint.Location.X;
                    HitLocation.Y = naviPoint.Location.Y;
                }
            }
        }
    }
    HitLocation.Z = Pawn.Location.Z + Pawn.EyePosition().Z + 3000.0;
    return HitLocation;
}

function ServerCallAirStrike(optional Controller Caller)
{
    local Vector HitLocation;
    local PlayerController P;

    // End:0x12
    if(Caller == none)
    {
        Caller = self;
    }
    HitLocation = CalcAirStrikeLocation(wPlayer(Caller).Pawn.Weapon.BaseParams.fExplRad_Outer);
    // End:0xe6
    foreach DynamicActors(class'PlayerController', P)
    {
        P.fAirStrikeCenterX = HitLocation.X;
        P.fAirStrikeCenterY = HitLocation.Y;
        P.fAirStrikeRadius = wPlayer(Caller).Pawn.Weapon.BaseParams.fExplRad_Outer;
        P.PlayerReplicationInfo.bySupply_AirStrike = 0;                
    }
    Caller.PlayerReplicationInfo.bySupply_AirStrike = 2;
    wPlayer(Caller).DoAirStrikeFire(HitLocation);
}

exec function art()
{
    local wPawn P;

    // End:0x44
    foreach DynamicActors(class'wPawn', P)
    {
        // End:0x43
        if(class'wArtilleryPack'.static.CanAddArtilleryPack(P))
        {
            P.AddWeapon(EmptyBtrDouble(), 5006, 0, false);
        }                
    }
}

exec function c4()
{
    local wPawn P;

    // End:0x2d
    foreach DynamicActors(class'wPawn', P)
    {
        P.AddWeapon(EmptyBtrDouble(), 7001, 0, false);                
    }
}

exec function heli()
{
    clog("heli");
    CallHelicopter(true);
}

function bool CallHelicopter(optional bool ignoreSupply)
{
    local wHelicopter P;

    // End:0x37
    if(!ignoreSupply && PlayerReplicationInfo.bySupply_Helipack == 0)
    {
        myHUD.CallSkill(6, false);
        return false;
    }
    // End:0x62
    foreach DynamicActors(class'wHelicopter', P)
    {
        // End:0x61
        if(true)
        {
            myHUD.CallSkill(6, true, false);
            break;
            return false;
        }                
    }
    ServerCallHelicopter();
    return true;
}

function bool IsActiveAirFire()
{
    // End:0x17
    if(true == Level.IsAirStriking)
    {
        return true;
    }
    return false;
}

function bool IsActiveHelicopter()
{
    local wHelicopter P;

    // End:0x18
    foreach DynamicActors(class'wHelicopter', P)
    {
        // End:0x17
        if(true)
        {
            break;
            return true;
        }                
    }
    return false;
}

function bool IsActiveUAV()
{
    return false;
}

function DoAirStrikeFire(Vector HitLocation)
{
    local Actor A;

    Pawn.MakeNoise(1.0);
    A = Spawn(class<wProjectile>(DynamicLoadObject("WWeapons.wAirStrikeProjPack", class'Class')),,, HitLocation);
    wProjectile(A).Instigator = Pawn;
    wProjectile(A).PostBeginPlay();
    wProjectile(A).wLoadOut(Pawn.Weapon.BaseParams.iWeaponID);
    Level.Game.AnnounceArtillery(Pawn.Controller);
}

function Vector ClipAirStrikeLocation(out Vector vMin, out Vector vMax, array<Vector> vLocation)
{
    local int i;

    vMin.X = 99999.0;
    vMin.Y = 99999.0;
    vMax.X = -99999.0;
    vMax.Y = -99999.0;
    i = 0;
    J0x47:
    // End:0x149 [While If]
    if(i < vLocation.Length)
    {
        // End:0x91
        if(vMin.X > vLocation[i].X)
        {
            vMin.X = vLocation[i].X;
        }
        // End:0xcb
        if(vMin.Y > vLocation[i].Y)
        {
            vMin.Y = vLocation[i].Y;
        }
        // End:0x105
        if(vMax.X < vLocation[i].X)
        {
            vMax.X = vLocation[i].X;
        }
        // End:0x13f
        if(vMax.Y < vLocation[i].Y)
        {
            vMax.Y = vLocation[i].Y;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
}

function bool CallAirFire()
{
    // End:0x2a
    if(Level.IsAirStriking == true)
    {
        myHUD.CallSkill(6, true, false);
        return false;
    }
    myHUD.CallSkill(6, true, true);
    return true;
}

exec function UAV()
{
    Log("[wPlayer::UAV]");
    ServerUAV();
}

function bool CallUAV()
{
    myHUD.CallSkill(6, true, true);
    return true;
}

exec function Warp()
{
    ServerWarp();
}

function ServerWarp()
{
    local NavigationPoint N;

    // End:0x10f
    if(Level.Game.IsWarpPossible() && Pawn != none && !Pawn.IsInState('Dying'))
    {
        // End:0x10f
        if(wPawn(Pawn).iWarpCount > 0)
        {
            -- wPawn(Pawn).iWarpCount;
            Spawn(class'XWFX_Grenade_explosion',,, Pawn.Location);
            N = Level.Game.GetSafetestRespawnPoint(byte(GetTeamNum()), Level.Game.EveryPlayerStarts);
            Pawn.SetLocation(N.Location);
            Pawn.SetRotation(N.Rotation);
            Spawn(class'XWFX_Grenade_explosion',,, N.Location);
        }
    }
}

exec function HIJ()
{
    ServerCallHelicopter();
}

exec function HIJ2()
{
    local wAIBotBase B;

    // End:0x37
    foreach DynamicActors(class'wAIBotBase', B)
    {
        // End:0x36
        if(B.GetTeamNum() != GetTeamNum())
        {
            ServerCallHelicopter(, B);
        }                
    }
}

exec function TTT()
{
    Pawn.AddWeapon(EmptyBtrDouble(), 5009, 0, false);
}

exec function tT(float fRate)
{
    Pawn.AddWeapon(EmptyBtrDouble(), 5010, 0, false);
}

exec function PartsTest()
{
    local BTNetPlayerData PlayerData;
    local bool bResult;

    PlayerData = new class'BTNetPlayerData';
    bResult = PlayerData.LoadPlayerPartsData();
    // End:0x33
    if(bResult == false)
    {
        return;
    }
}

exec function HIJTest00()
{
    local int iTest;
    local wCharacterManager tmMgr;
    local wMyPlayerStatus tmStatus;
    local string strTemp0, strTemp1;

    tmMgr = Level.CharMgr;
    tmStatus = tmMgr.GetMyStatus();
    strTemp0 = tmStatus.NickName;
    strTemp1 = Level.CharMgr.MyPlayer.NickName;
    iTest = 0;
}

simulated function ShowResultMenu()
{
    // End:0x1b
    if(Level.Pauser == none)
    {
        SetPause(true);
    }
    // End:0x3a
    if(Level.NetMode != 1)
    {
        StopForceFeedback();
    }
    // End:0x5d
    if(myHUD.bShowScoreBoard)
    {
        myHUD.bShowScoreBoard = false;
    }
    // End:0x80
    if(myHUD.bShowLocalStats)
    {
        myHUD.bShowLocalStats = false;
    }
    // End:0x97
    if(ResultMenuClass != "")
    {
        ClientOpenMenu(ResultMenuClass);
    }
}

function AddSkill(int iSkillID)
{
    SkillBase.AddSkill(iSkillID, Level.GameMgr);
    AddSkill_Client(iSkillID);
}

function SkillInit_Server(bool bQuickslotChange)
{
    // End:0x18
    if(bQuickslotChange)
    {
        SkillBase.ResetSkillState();
    }
    SkillBase.PostBeginPlay();
}

simulated function AddSkill_Client(int iSkillID)
{
    local int i;

    SkillBase.AddSkill(iSkillID, Level.GameMgr);
    // End:0xbd
    if(Role == 4)
    {
        i = 0;
        J0x39:
        // End:0xbd [While If]
        if(i < SkillBase.Skills.Length)
        {
            // End:0xb3
            if(SkillBase.Skills[i] != none && SkillBase.Skills[i].SkillID == iSkillID)
            {
                SkillBase.Skills[i].PostBeginPlay();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
    }
}

function ApplySkill_Client(int iSkillID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8b [While If]
    if(i < SkillBase.Skills.Length)
    {
        // End:0x81
        if(SkillBase.Skills[i] != none && SkillBase.Skills[i].SkillID == iSkillID)
        {
            SkillBase.Skills[i].PostBeginPlay();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function SkillUsedByWeapon(int iWeaponID)
{
    // End:0x1b
    if(Role < 4)
    {
        ServerSkillUsedByWeapon(iWeaponID);
    }
    SkillBase.UsedbyWeapon(iWeaponID);
}

function ServerSkillUsedByWeapon(int iWeaponID)
{
    SkillBase.UsedbyWeapon(iWeaponID);
}

function ClientReStart(Pawn NewPawn)
{
    super(PlayerController).ClientReStart(NewPawn);
}

function RemoveSkill(int iSkillID)
{
    SkillBase.RemoveSkill(iSkillID, Level.GameMgr);
    RemoveSkill_Client(iSkillID);
}

simulated function RemoveSkill_Client(int iSkillID)
{
    SkillBase.RemoveSkill(iSkillID, Level.GameMgr);
}

exec function MouseSenseUp()
{
    // End:0x1a
    if(GetSensitivity() < float(5))
    {
        ChangeMouseSense(0.050);
    }
}

exec function MouseSenseDown()
{
    // End:0x1b
    if(GetSensitivity() >= 0.10)
    {
        ChangeMouseSense(-0.050);
    }
}

exec function MouseSenseUpAim()
{
    // End:0x1a
    if(GetSensitivityAim() < float(5))
    {
        ChangeMouseSenseAim(0.050);
    }
}

exec function MouseSenseDownAim()
{
    // End:0x1b
    if(GetSensitivityAim() >= 0.10)
    {
        ChangeMouseSenseAim(-0.050);
    }
}

simulated function ChangeMouseSense(float dt)
{
    SetSensitivity(GetSensitivity() + dt, false);
    ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_MouseSenseChange);
    ConsoleCommand("SETCONFIG_FLOAT Controll MouseSensitivity" @ string(GetSensitivity()));
}

simulated function ChangeMouseSenseAim(float dt)
{
    SetSensitivity(GetSensitivityAim() + dt, true);
    ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_MouseSenseChangeAim);
    ConsoleCommand("SETCONFIG_FLOAT Controll MouseSensitivityAim" @ string(GetSensitivityAim()));
}

simulated function RenderSpectatorFPWeapon(Canvas Canvas, bool bClearedZBuffer)
{
    // End:0x6e
    if(IsInState('Spectating') || IsInState('SpectatingGM') && Pawn != ViewTarget && wPawn(ViewTarget) != none)
    {
        // End:0x55
        if(!bClearedZBuffer)
        {
            Canvas.DrawActor(none, false, true);
        }
        wPawn(ViewTarget).RenderFPWeaponAttachment(Canvas);
    }
}

exec function ShowRot()
{
    clog("-----------------------------------------");
    clog("ROT FL ( " $ string(Pawn.wMyParam.FL_Rot.X) $ ", " $ string(Pawn.wMyParam.FL_Rot.Y) $ ", " $ string(Pawn.wMyParam.FL_Rot.Z) $ " )");
    clog("ROT FR ( " $ string(Pawn.wMyParam.FR_Rot.X) $ ", " $ string(Pawn.wMyParam.FR_Rot.Y) $ ", " $ string(Pawn.wMyParam.FR_Rot.Z) $ " )");
    clog("ROT BL ( " $ string(Pawn.wMyParam.BL_Rot.X) $ ", " $ string(Pawn.wMyParam.BL_Rot.Y) $ ", " $ string(Pawn.wMyParam.BL_Rot.Z) $ " )");
    clog("ROT BR ( " $ string(Pawn.wMyParam.BR_Rot.X) $ ", " $ string(Pawn.wMyParam.BR_Rot.Y) $ ", " $ string(Pawn.wMyParam.BR_Rot.Z) $ " )");
    clog("ROT CFL ( " $ string(Pawn.wMyParam.CFL_Rot.X) $ ", " $ string(Pawn.wMyParam.CFL_Rot.Y) $ ", " $ string(Pawn.wMyParam.CFL_Rot.Z) $ " )");
    clog("ROT CFR ( " $ string(Pawn.wMyParam.CFR_Rot.X) $ ", " $ string(Pawn.wMyParam.CFR_Rot.Y) $ ", " $ string(Pawn.wMyParam.CFR_Rot.Z) $ " )");
    clog("ROT CBL ( " $ string(Pawn.wMyParam.CBL_Rot.X) $ ", " $ string(Pawn.wMyParam.CBL_Rot.Y) $ ", " $ string(Pawn.wMyParam.CBL_Rot.Z) $ " )");
    clog("ROT CBR ( " $ string(Pawn.wMyParam.CBR_Rot.X) $ ", " $ string(Pawn.wMyParam.CBR_Rot.Y) $ ", " $ string(Pawn.wMyParam.CBR_Rot.Z) $ " )");
    clog("-----------------------------------------");
    clog("BodyROT FL ( " $ string(Pawn.wMyParam.BodyFL_Rot) $ " )");
    clog("BodyROT FR ( " $ string(Pawn.wMyParam.BodyFR_Rot) $ " )");
    clog("BodyROT BL ( " $ string(Pawn.wMyParam.BodyBL_Rot) $ " )");
    clog("BodyROT BR ( " $ string(Pawn.wMyParam.BodyBR_Rot) $ " )");
    clog("-----------------------------------------");
}

exec function Rot_FL(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.FL_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.FL_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.FL_Rot.Z = float(fZ);
    Pawn.wMyParam.FL_Rot.X = float(fX);
    Pawn.wMyParam.FL_Rot.Y = float(fY);
    Pawn.wMyParam.FL_Rot.Z = float(fZ);
    clog("ROT FL ( " $ string(Pawn.wMyParam.FL_Rot.X) $ ", " $ string(Pawn.wMyParam.FL_Rot.Y) $ ", " $ string(Pawn.wMyParam.FL_Rot.Z) $ " )");
}

exec function Rot_FR(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.FR_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.FR_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.FR_Rot.Z = float(fZ);
    Pawn.wMyParam.FR_Rot.X = float(fX);
    Pawn.wMyParam.FR_Rot.Y = float(fY);
    Pawn.wMyParam.FR_Rot.Z = float(fZ);
    clog("ROT FR ( " $ string(Pawn.wMyParam.FR_Rot.X) $ ", " $ string(Pawn.wMyParam.FR_Rot.Y) $ ", " $ string(Pawn.wMyParam.FR_Rot.Z) $ " )");
}

exec function Rot_BL(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.BL_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.BL_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.BL_Rot.Z = float(fZ);
    Pawn.wMyParam.BL_Rot.X = float(fX);
    Pawn.wMyParam.BL_Rot.Y = float(fY);
    Pawn.wMyParam.BL_Rot.Z = float(fZ);
    clog("ROT BL ( " $ string(Pawn.wMyParam.BL_Rot.X) $ ", " $ string(Pawn.wMyParam.BL_Rot.Y) $ ", " $ string(Pawn.wMyParam.BL_Rot.Z) $ " )");
}

exec function Rot_BR(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.BR_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.BR_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.BR_Rot.Z = float(fZ);
    Pawn.wMyParam.BR_Rot.X = float(fX);
    Pawn.wMyParam.BR_Rot.Y = float(fY);
    Pawn.wMyParam.BR_Rot.Z = float(fZ);
    clog("ROT BR ( " $ string(Pawn.wMyParam.BR_Rot.X) $ ", " $ string(Pawn.wMyParam.BR_Rot.Y) $ ", " $ string(Pawn.wMyParam.BR_Rot.Z) $ " )");
}

exec function Rot_CFL(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.CFL_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.CFL_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.CFL_Rot.Z = float(fZ);
    Pawn.wMyParam.CFL_Rot.X = float(fX);
    Pawn.wMyParam.CFL_Rot.Y = float(fY);
    Pawn.wMyParam.CFL_Rot.Z = float(fZ);
    clog("ROT CFL ( " $ string(Pawn.wMyParam.CFL_Rot.X) $ ", " $ string(Pawn.wMyParam.CFL_Rot.Y) $ ", " $ string(Pawn.wMyParam.CFL_Rot.Z) $ " )");
}

exec function Rot_CFR(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.CFR_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.CFR_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.CFR_Rot.Z = float(fZ);
    Pawn.wMyParam.CFR_Rot.X = float(fX);
    Pawn.wMyParam.CFR_Rot.Y = float(fY);
    Pawn.wMyParam.CFR_Rot.Z = float(fZ);
    clog("ROT CFR ( " $ string(Pawn.wMyParam.CFR_Rot.X) $ ", " $ string(Pawn.wMyParam.CFR_Rot.Y) $ ", " $ string(Pawn.wMyParam.CFR_Rot.Z) $ " )");
}

exec function Rot_CBL(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.CBL_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.CBL_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.CBL_Rot.Z = float(fZ);
    Pawn.wMyParam.CBL_Rot.X = float(fX);
    Pawn.wMyParam.CBL_Rot.Y = float(fY);
    Pawn.wMyParam.CBL_Rot.Z = float(fZ);
    clog("ROT CBL ( " $ string(Pawn.wMyParam.CBL_Rot.X) $ ", " $ string(Pawn.wMyParam.CBL_Rot.Y) $ ", " $ string(Pawn.wMyParam.CBL_Rot.Z) $ " )");
}

exec function Rot_CBR(string fX, string fY, string fZ)
{
    Level.CharMgr.MyPlayer.CBR_Rot.X = float(fX);
    Level.CharMgr.MyPlayer.CBR_Rot.Y = float(fY);
    Level.CharMgr.MyPlayer.CBR_Rot.Z = float(fZ);
    Pawn.wMyParam.CBR_Rot.X = float(fX);
    Pawn.wMyParam.CBR_Rot.Y = float(fY);
    Pawn.wMyParam.CBR_Rot.Z = float(fZ);
    clog("ROT CBR ( " $ string(Pawn.wMyParam.CBR_Rot.X) $ ", " $ string(Pawn.wMyParam.CBR_Rot.Y) $ ", " $ string(Pawn.wMyParam.CBR_Rot.Z) $ " )");
}

exec function BodyRot_FL(float fR)
{
    Level.CharMgr.MyPlayer.BodyFL_Rot = fR;
    Pawn.wMyParam.BodyFL_Rot = fR;
    clog("BodyROT FL ( " $ string(Pawn.wMyParam.BodyFL_Rot) $ " )");
}

exec function BodyRot_FR(float fR)
{
    Level.CharMgr.MyPlayer.BodyFR_Rot = fR;
    Pawn.wMyParam.BodyFR_Rot = fR;
    clog("BodyROT FR ( " $ string(Pawn.wMyParam.BodyFR_Rot) $ " )");
}

exec function BodyRot_BL(float fR)
{
    Level.CharMgr.MyPlayer.BodyBL_Rot = fR;
    Pawn.wMyParam.BodyBL_Rot = fR;
    clog("BodyROT BL ( " $ string(Pawn.wMyParam.BodyBL_Rot) $ " )");
}

exec function BodyRot_BR(float fR)
{
    Level.CharMgr.MyPlayer.BodyBR_Rot = fR;
    Pawn.wMyParam.BodyBR_Rot = fR;
    clog("BodyROT BR ( " $ string(Pawn.wMyParam.BodyBR_Rot) $ " )");
}

exec function UseRagdoll(bool bUse)
{
    Level.GameMgr.bUseRagdoll = bUse;
}

exec function AnimRate(float fAnimRate)
{
    Pawn.fSequenceAnimRate = fAnimRate;
}

state RoundEnded
{
    exec function WeaponReload();

}

state AttractMode
{
    ignores SwitchWeapon, RestartLevel, ClientReStart, Suicide, ThrowWeapon, Say, 
	    TeamSay;

    function bool IsSpectating()
    {
        return true;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Engine.Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
    function PlayerMove(float DeltaTime)
    {
        local float deltayaw, destyaw;
        local Rotator NewRot;

        // End:0x0d
        if(attracttarget == none)
        {
            return;
        }
        // End:0x131
        if(bBehindView)
        {
            // End:0x4b
            if(attracttarget.Controller == none || attracttarget.Controller.Enemy == none)
            {
                return;
            }
            NewRot = rotator(attracttarget.Controller.Enemy.Location - attracttarget.Location);
            destyaw = float(NewRot.Yaw);
            deltayaw = float(int(destyaw) & 65535) - float(Rotation.Yaw & 65535);
            // End:0xe2
            if(deltayaw < float(-32768))
            {
                deltayaw += float(65536);
            }
            // End:0x101
            else
            {
                // End:0x101
                if(deltayaw > float(32768))
                {
                    deltayaw -= float(65536);
                }
            }
            NewRot = Rotation;
            NewRot.Yaw += int(deltayaw * DeltaTime);
            SetRotation(NewRot);
        }
        // End:0x14f
        else
        {
            NewRot = CameraTrack(attracttarget, DeltaTime);
            SetRotation(NewRot);
        }
    }

    exec function NextWeapon();
    exec function PrevWeapon();
    exec function Fire(optional float f);
    exec function AltFire(optional float f)
    {
        Fire(f);
    }

    function BeginState()
    {
        // End:0x1c
        if(Pawn != none)
        {
            SetLocation(Pawn.Location);
        }
        bCollideWorld = true;
        // End:0x62
        if(curcam == -1)
        {
            FillCameraList();
            camtime = 0.0;
            targettime = 0.0;
            autozoom = true;
            curcam = -1;
        }
        Timer();
        SetTimer(0.50, true);
    }

    function EndState()
    {
        PlayerReplicationInfo.bIsSpectator = false;
        bCollideWorld = false;
        curcam = -1;
    }

    function Timer()
    {
        local bool switchedbots;
        local Vector NewLoc;
        local int newcam;

        camtime += 0.50;
        targettime += 0.50;
        bFrozen = false;
        // End:0x55
        if(gibwatchtime > float(0))
        {
            gibwatchtime -= 0.50;
            // End:0x50
            if(gibwatchtime <= float(0))
            {
                attracttarget = none;
            }
            // End:0x52
            else
            {
                return;
            }
        }
        // End:0x81
        else
        {
            // End:0x81
            if(attracttarget != none && attracttarget.Health <= 0)
            {
                gibwatchtime = 4.0;
            }
        }
        // End:0xc0
        if(attracttarget == none || targettime > float(30))
        {
            attracttarget = PickNextBot(attracttarget);
            switchedbots = true;
            targettime = 0.0;
        }
        // End:0xcd
        if(attracttarget == none)
        {
            return;
        }
        // End:0x25b
        if(switchedbots || camtime > float(10) || bBehindView == false && Rotation.Pitch < -10000 || !LineOfSight(curcam, attracttarget))
        {
            camtime = 0.0;
            FovAngle = default.FovAngle;
            SetViewTarget(self);
            bBehindView = false;
            // End:0x1bf
            if(FindFixedCam(attracttarget, newcam))
            {
                focuspoint = attracttarget.Location;
                curcam = newcam;
                SetLocation(camlist[curcam].Location);
                FovAngle = camlist[curcam].ViewAngle;
                SetRotation(CameraTrack(attracttarget, 0.0));
            }
            // End:0x25b
            else
            {
                // End:0x219
                if(FRand() < 0.50)
                {
                    NewLoc = FindFloatingCam(attracttarget);
                    focuspoint = attracttarget.Location;
                    curcam = -1;
                    SetLocation(NewLoc);
                    SetRotation(CameraTrack(attracttarget, 0.0));
                }
                // End:0x25b
                else
                {
                    curcam = -1;
                    SetViewTarget(attracttarget);
                    SetRotation(attracttarget.Rotation);
                    CameraDeltaRotation.Pitch = -3000;
                    CameraDist = 6.0;
                }
            }
        }
    }

}

state ViewPlayer extends PlayerWalking
{
    function PlayerMove(float DeltaTime)
    {
        super.PlayerMove(DeltaTime);
        CameraSwivel = CameraTrack(Pawn, DeltaTime);
    }

    function PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
    {
        CameraRotation = CameraSwivel;
        CameraLocation = Location;
        ViewActor = self;
    }

    function BeginState()
    {
        FillCameraList();
        bBehindView = true;
        SetViewTarget(self);
        curcam = -2;
        autozoom = true;
        Timer();
        SetTimer(0.50, true);
    }

    function EndState()
    {
        CameraSwivel = rot(0, 0, 0);
        bBehindView = false;
        FovAngle = default.FovAngle;
        DesiredFOV = FovAngle;
        SetViewTarget(Pawn);
    }

    function Timer()
    {
        local Vector NewLoc;
        local int newcam;

        // End:0x102
        if(curcam == -2 || !LineOfSight(curcam, Pawn))
        {
            camtime = 0.0;
            // End:0xa9
            if(FindFixedCam(Pawn, newcam))
            {
                // End:0xa6
                if(curcam != newcam)
                {
                    focuspoint = Pawn.Location;
                    curcam = newcam;
                    SetLocation(camlist[curcam].Location);
                    FovAngle = camlist[curcam].ViewAngle;
                }
                // End:0xa6
                else
                {
                }
            }
            // End:0xec
            else
            {
                NewLoc = FindFloatingCam(Pawn);
                SetLocation(NewLoc);
                curcam = -1;
                FovAngle = default.FovAngle;
                focuspoint = Pawn.Location;
            }
            CameraSwivel = CameraTrack(Pawn, 0.0);
        }
    }

    exec function TogglePlayerAttract()
    {
        GotoState('PlayerWalking');
    }

}

defaultproperties
{
    curcam=-1
    MinAdrenalineCost=100.0
    ComboNameList[0]="WGame.ComboSpeed"
    ComboNameList[1]="WGame.ComboBerserk"
    ComboNameList[2]="WGame.ComboDefensive"
    ComboNameList[3]="WGame.ComboInvis"
    bWaitingForPRI=true
    bWaitingForVRI=true
    bIsFirstTick=true
    BombSettingDelayTime=-1.0
    PlayerReplicationInfoClass=class'wPlayerReplicationInfo'
    PawnClass=class'wPawn'
    bNetNotify=true
}