class wPlayer extends UnrealPlayer
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
var Class<Combo> ComboList[16];
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
//var delegate<ProcessRule> __ProcessRule__Delegate;
//var delegate<ProcessMapName> __ProcessMapName__Delegate;

replication
{
    // Pos:0x00D
    unreliable if(int(Role) < int(ROLE_Authority))
        L33TPhrase;

    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        AdminMenu, ServerDoCombo, 
        ServerPlayWeaponNullSound, ServerRequestMapList, 
        ServerRequestPlayerInfo, ServerRequestRules, 
        ServerSetClassicTrans, ServerSkillUsedByWeapon, 
        ServerSpecViewGoal, SkillInit_Server;

    // Pos:0x01A
    reliable if(int(Role) == int(ROLE_Authority))
        AddSkill_Client, ClientReceiveBan, 
        ClientReceiveCombo, ClientReceiveMapName, 
        ClientReceiveRule, RemoveSkill_Client;
}

delegate ProcessRule(string NewRule)
{
    //return;    
}

delegate ProcessMapName(string NewMap)
{
    //return;    
}

simulated function ShowPathToActor(Actor A)
{
    local Class<WillowWhisp> WWclass;
    local Actor Path;

    clog("[wPlayer::ShowPathToActor]");
    // End:0xC7
    if((Pawn != none) && Pawn.Health > 0)
    {
        Path = FindPathTo(A.Location);
        // End:0x74
        if(Path == none)
        {
            Path = FindPathToward(A, false);
        }
        // End:0xC7
        if(Path != none)
        {
            WWclass = Class<WillowWhisp>(DynamicLoadObject(Class'UnrealGame.TeamGame'.default.PathWhisps[GetTeamNum()], Class'Core.Class'));
            Spawn(WWclass, self,, self.Pawn.Location);
        }
    }
    //return;    
}

function float GetFovSpeed()
{
    return fShakeFovSpeed;
    //return;    
}

exec function SetFovSpeed(float V)
{
    fShakeFovSpeed = V;
    clog("fShakeFovSpeed=" $ string(fShakeFovSpeed));
    //return;    
}

exec function SetDoTraceNativeInstant(bool val)
{
    Level.bDoTraceNativeInstant = val;
    clog("bDoTraceNativeInstant=" $ string(Level.bDoTraceNativeInstant));
    //return;    
}

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    // End:0x36
    if(CmdTarget != none)
    {
        CmdTarget.Cmd(P1, P2, p3, p4, p5);        
    }
    else
    {
        // End:0x6C
        if(RealViewTarget != self)
        {
            RealViewTarget.Cmd(P1, P2, p3, p4, p5);            
        }
    }
    //return;    
}

exec function setcmd(string targetName)
{
    local Controller C;

    CmdTarget = none;
    C = Level.ControllerList;
    J0x1B:

    // End:0xB8 [Loop If]
    if(C != none)
    {
        // End:0xA1
        if((C.PlayerReplicationInfo != none) && Locs(C.PlayerReplicationInfo.PlayerName) == Locs(targetName))
        {
            CmdTarget = C;
            clog("found CmdTarget: " $ C.PlayerReplicationInfo.PlayerName);
            // [Explicit Break]
            goto J0xB8;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    J0xB8:

    //return;    
}

exec function ResetNames()
{
    clog("resetNames");
    wAILevel(Level.AILevel).ResetNames();
    //return;    
}

exec function SetSpeed(float factor)
{
    Pawn.GroundSpeed = Pawn.default.GroundSpeed * factor;
    clog("setspeed to =" $ string(Pawn.GroundSpeed));
    //return;    
}

function ServerRequestWeapon(int iWeaponID)
{
    local int i;
    local wMatchMaker kMM;
    local wMatchUserInfo kUser;
    local bool added;
    local wWeapon W, ow;

    dblog((("[wPlayer::ServerRequestWeapon] name=" $ LoginName) $ " iWeaponID=") $ string(iWeaponID));
    // End:0x2E1
    if(Pawn != none)
    {
        W = wWeapon(Pawn.Inventory);
        J0x6F:

        // End:0xCC [Loop If]
        if(W != none)
        {
            // End:0xB0
            if(W.BaseParams.iWeaponID == iWeaponID)
            {
                InventoryRebuildSkipList[InventoryRebuildSkipList.Length] = W;
                // [Explicit Break]
                goto J0xCC;
            }
            W = wWeapon(W.Inventory);
            // [Loop Continue]
            goto J0x6F;
        }
        J0xCC:

        added = false;
        kMM = Level.GetMatchMaker();
        kUser = kMM.GetUserInfoByUserName(PlayerReplicationInfo.PlayerName);
        // End:0x1D0
        if(kUser != none)
        {
            i = 0;
            J0x11E:

            // End:0x1D0 [Loop If]
            if(i < kUser.EquippedItems.Length)
            {
                // End:0x1C6
                if(kUser.EquippedItems[i].ItemID == iWeaponID)
                {
                    W = Pawn.AddWeapon(kUser.EquippedItems[i].UniqueID, kUser.EquippedItems[i].ItemID, kUser.EquippedItems[i].AddPartID, false);
                    added = true;
                    // [Explicit Break]
                    goto J0x1D0;
                }
                i++;
                // [Loop Continue]
                goto J0x11E;
            }
        }
        J0x1D0:

        // End:0x1F8
        if(added == false)
        {
            Pawn.AddWeapon(EmptyBtrDouble(), iWeaponID, 0, false);
        }
        ow = none;
        // End:0x2BD
        foreach DynamicActors(Class'Engine.wWeapon', W)
        {
            // End:0x230
            if(InInventoryRebuildSkipList(W))
            {
                W.Inventory = none;                
            }
            else
            {
                // End:0x299
                if(W.Instigator == Pawn)
                {
                    // End:0x26A
                    if(ow == none)
                    {
                        Pawn.Inventory = W;                        
                    }
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
    //return;    
}

function bool InInventoryRebuildSkipList(wWeapon W)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(lp1 < InventoryRebuildSkipList.Length)
    {
        // End:0x2E
        if(InventoryRebuildSkipList[lp1] == W)
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

exec function CheckPriority()
{
    local Inventory Inv;
    local int Count;

    // End:0x2D
    if(Pawn == none)
    {
        DebugMessage("Pawn is none - returning");
        return;
    }
    Inv = Pawn.Inventory;
    J0x41:

    // End:0xD5 [Loop If]
    if((Inv != none) && Count < 1000)
    {
        // End:0xB7
        if(wWeapon(Inv) != none)
        {
            DebugMessage((("Weapon:" $ string(Inv.Name)) @ "Priority:") $ string(wWeapon(Inv).Priority), 'PriorityDebug');
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x41;
    }
    //return;    
}

simulated function DebugMessage(string DebugString, optional name Type)
{
    ClientMessage(DebugString);
    Log(DebugString, Type);
    //return;    
}

simulated function string GetRoleString()
{
    local string t;

    t = "Role: ";
    switch(Role)
    {
        // End:0x30
        case ROLE_None:
            t = t $ "None";
            // End:0xBE
            break;
        // End:0x50
        case 1:
            t = t $ "DumbProxy";
            // End:0xBE
            break;
        // End:0x75
        case 2:
            t = t $ "SimulatedProxy";
            // End:0xBE
            break;
        // End:0x9B
        case 3:
            t = t $ "AutonomousProxy";
            // End:0xBE
            break;
        // End:0xBB
        case 4:
            t = t $ "Authority";
            // End:0xBE
            break;
        // End:0xFFFF
        default:
            break;
    }
    return t;
    //return;    
}

simulated function string GetPhysicsString()
{
    local string t;

    t = "Physics: ";
    switch(Pawn.Physics)
    {
        // End:0x3C
        case 0:
            t = t $ "None";
            // End:0x1D1
            break;
        // End:0x5A
        case 1:
            t = t $ "Walking";
            // End:0x1D1
            break;
        // End:0x78
        case 2:
            t = t $ "Falling";
            // End:0x1D1
            break;
        // End:0x97
        case 3:
            t = t $ "Swimming";
            // End:0x1D1
            break;
        // End:0xB4
        case 4:
            t = t $ "Flying";
            // End:0x1D1
            break;
        // End:0xD3
        case 5:
            t = t $ "Rotating";
            // End:0x1D1
            break;
        // End:0xF4
        case 6:
            t = t $ "Projectile";
            // End:0x1D1
            break;
        // End:0x118
        case 7:
            t = t $ "Interpolating";
            // End:0x1D1
            break;
        // End:0x13A
        case 8:
            t = t $ "MovingBrush";
            // End:0x1D1
            break;
        // End:0x157
        case 9:
            t = t $ "Spider";
            // End:0x1D1
            break;
        // End:0x175
        case 10:
            t = t $ "Trailer";
            // End:0x1D1
            break;
        // End:0x192
        case 11:
            t = t $ "Ladder";
            // End:0x1D1
            break;
        // End:0x1AE
        case 13:
            t = t $ "Karma";
            // End:0x1D1
            break;
        // End:0x1CE
        case 14:
            t = t $ "K-Ragdoll";
            // End:0x1D1
            break;
        // End:0xFFFF
        default:
            break;
    }
    return t;
    //return;    
}

function ServerRequestRules()
{
    local ServerResponseLine Response;
    local int i;

    // End:0x8F
    if((Level.Pauser == none) && (Level.TimeSeconds - LastRulesRequestTime) < 3.0000000)
    {
        Log((("ServerRequestRules Level.TimeSeconds:" $ string(Level.TimeSeconds)) @ "LastRequestTime:") $ string(LastRulesRequestTime));
        return;
    }
    LastRulesRequestTime = Level.TimeSeconds;
    Level.Game.GetServerDetails(Response);
    ClientReceiveRule("");
    i = 0;
    J0xCF:

    // End:0x125 [Loop If]
    if(i < Response.ServerInfo.Length)
    {
        ClientReceiveRule((Response.ServerInfo[i].key $ "=") $ Response.ServerInfo[i].Value);
        i++;
        // [Loop Continue]
        goto J0xCF;
    }
    //return;    
}

function ClientReceiveRule(string NewRule)
{
    ProcessRule(NewRule);
    //return;    
}

simulated function ClientReceiveResultMenu(string MenuClass)
{
    ResultMenuClass = MenuClass;
    //return;    
}

function ServerRequestMapList()
{
    local int X;
    local array<string> MapList;

    // End:0x57
    if((Level.Pauser == none) && ((Level.TimeSeconds - LastMapListRequestTime) < 3.0000000) || Level.Game.MapListType == "")
    {
        return;
    }
    LastMapListRequestTime = Level.TimeSeconds;
    MapList = Level.Game.GetMapRotation();
    ClientReceiveMapName("");
    X = 0;
    J0x98:

    // End:0xC3 [Loop If]
    if(X < MapList.Length)
    {
        ClientReceiveMapName(MapList[X]);
        X++;
        // [Loop Continue]
        goto J0x98;
    }
    //return;    
}

function ClientReceiveMapName(string NewMap)
{
    ProcessMapName(NewMap);
    //return;    
}

function StopFiring()
{
    //return;    
}

simulated function PlayBeepSound()
{
    //return;    
}

simulated function float RateWeapon(wWeapon W)
{
    return float(W.default.Priority);
    //return;    
}

exec function L33TPhrase(int PhraseNum)
{
    SendMessage(none, 'Hidden', byte(PhraseNum), 5.0000000, 'Global');
    //return;    
}

exec function MakeItemBox(string t)
{
    local Actor spawnedActor;

    // End:0x56
    if(t == "heli")
    {
        spawnedActor = Spawn(Class'WGame_Decompressed.wHeliPack',,, (Pawn.Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + vect(100.0000000, 100.0000000, 0.0000000));        
    }
    else
    {
        // End:0xAB
        if(t == "uav")
        {
            spawnedActor = Spawn(Class'WGame_Decompressed.wUAVPack',,, (Pawn.Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + vect(100.0000000, 100.0000000, 0.0000000));            
        }
        else
        {
            // End:0x100
            if(t == "art")
            {
                spawnedActor = Spawn(Class'WGame_Decompressed.wArtilleryPack',,, (Pawn.Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + vect(100.0000000, 100.0000000, 0.0000000));                
            }
            else
            {
                // End:0x155
                if(t == "health")
                {
                    spawnedActor = Spawn(Class'WGame_Decompressed.wHealthPack',,, (Pawn.Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + vect(100.0000000, 100.0000000, 0.0000000));
                }
            }
        }
    }
    // End:0x174
    if(spawnedActor != none)
    {
        Pickup(spawnedActor).InitDroppedPack();
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    LastKillTime = -5.0000000;
    //return;    
}

simulated event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    // End:0x2B
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        ServerSetClassicTrans(bClassicTrans);
    }
    // End:0x55
    if(SkillBase == none)
    {
        SkillBase = new Class'Engine.wSkillBase';
        SkillBase.Owner = self;
    }
    //return;    
}

function ServerSetClassicTrans(bool B)
{
    bHighBeaconTrajectory = B;
    //return;    
}

simulated function ClientReceiveCombo(string NewCombo)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xB7 [Loop If]
    if(i < 16)
    {
        // End:0x2D
        if(ComboNameList[i] ~= NewCombo)
        {
            return;
            // [Explicit Continue]
            goto J0xAD;
        }
        // End:0xAD
        if(ComboNameList[i] == "")
        {
            ComboNameList[i] = NewCombo;
            ComboList[i] = Class<Combo>(DynamicLoadObject(ComboNameList[i], Class'Core.Class'));
            // End:0x8A
            if(ComboList[i] == none)
            {
                return;
            }
            MinAdrenalineCost = FMin(MinAdrenalineCost, ComboList[i].default.AdrenalineCost);
            return;
        }
        J0xAD:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    super.NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    CientSetHitSprintDelay();
    //return;    
}

event PlayerTick(float DeltaTime)
{
    local int CurrentKey, DiffKey, C, i;
    local bool bFullBuffer, bMatch;

    super(PlayerController).PlayerTick(DeltaTime);
    // End:0x1D
    if(Viewport(Player) == none)
    {
        return;
    }
    // End:0xD5
    if(Pawn == none)
    {
        // End:0xCA
        if(((IsInState('Spectating') && Pawn != ViewTarget) && wPawn(ViewTarget) != none) && wPawn(ViewTarget).FPWeaponAttachment != none)
        {
            // End:0x9D
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
    ProcessQuickGrenadeKey();
    //return;    
}

function ProcessUseKey()
{
    local UseObjective UO;
    local bool hasBomb, bSettingBomb, bUsed, bHasDemoPack, bTraceGeom;

    // End:0x0D
    if(IsInState('ChangedHost'))
    {
        return;
    }
    // End:0x55
    if(((Pawn != none) && Pawn.Weapon != none) && Pawn.Weapon.IsA('wDemopack'))
    {
        bHasDemoPack = true;
    }
    // End:0x7B
    if(int(bUseKey) == 1)
    {
        // End:0x78
        if(int(byOldUseKey) == 0)
        {
            ProcessSetObjective();            
        }        
    }
    else
    {
        // End:0x1A1
        if((int(bUseKey) == 0) && (int(byOldUseKey) == 1) || bHasDemoPack)
        {
            wPawn(Pawn).SetSpecialState(0);
            // End:0x18D
            if(bHasDemoPack)
            {
                // End:0x12E
                if(int(Pawn.Role) == int(ROLE_Authority))
                {
                    Pawn.PlaySound(Pawn.Weapon.NullSound, 3, 1.0000000,, Pawn.Weapon.ResParams.default.rad_Fire, 1.0000000, false,,, true);
                }
                // End:0x15F
                if(0 == int(Pawn.Weapon.byActionThrowsWeapon))
                {
                    Pawn.SwitchToLastWeapon();                    
                }
                else
                {
                    // End:0x18D
                    if(1 == int(Pawn.Weapon.byActionThrowsWeapon))
                    {
                        Pawn.SwitchToLastWeapon_ThrowsWeapon();
                    }
                }
            }
            Pawn.ServerSetUseKeyState(bUseKey);
        }
    }
    byOldUseKey = bUseKey;
    //return;    
}

function ProcessSetObjective()
{
    local bool hasBomb, bSettingBomb, bUsed;
    local byte byUsed;

    bUsed = false;
    bUsed = ServerUse();
    Pawn.ServerSetUseKeyState(bUseKey);
    // End:0x50
    if((Level.TimeSeconds - BombSettingDelayTime) > 0.4000000)
    {
        bSettingBomb = true;
    }
    BombSettingDelayTime = Level.TimeSeconds;
    // End:0x1BB
    if(((bUsed == false) && (Level.GRI.GameClass == "WMission.wSDGameInfo") || Level.GRI.GameClass == "WMission.wSBTGameInfo") && myHUD.IsA('wHUD_Mission'))
    {
        hasBomb = (PlayerReplicationInfo.HasFlag != none) && PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
        hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(GetTeamNum()));
        ProcessSwitchDemoPack(byUsed, hasBomb, bSettingBomb);
        bUsed = bool(byUsed);
    }
    // End:0x1D6
    if(bUsed == false)
    {
        Pawn.ClientPickupWeapon();
    }
    //return;    
}

function ProcessSwitchDemoPack(out byte byUsed, bool hasBomb, bool bSettingBomb)
{
    local UseObjective UO;
    local bool bTraceGeom;

    byUsed = 0;
    // End:0xE5
    if(hasBomb)
    {
        // End:0xE1
        foreach Pawn.TouchingActors(Class'UnrealGame.UseObjective', UO)
        {
            // End:0xE0
            if(UO.IsA('wSetObjective'))
            {
                Log((string(self) $ " ProcessSwitchDemoPack() / bSettingBomb : ") $ string(bSettingBomb));
                // End:0xC2
                if(bSettingBomb)
                {
                    Pawn.SwitchWeaponWClass('wDemopack');
                    Log("Pawn.SwitchWeaponWClass( 'wDemoPack' )");
                }
                byUsed = 1;
                wPawn(Pawn).SetSpecialState(1);
            }            
        }                
    }
    else
    {
        Log("objectplanted: " $ string(Level.GRI.bObjectivePlanted));
        // End:0x261
        foreach Pawn.TouchingActors(Class'UnrealGame.UseObjective', UO)
        {
            Log("active:" $ string(UO.IsActive()));
            Log("disabled:" $ string(UO.bDisabled));
            // End:0x260
            if(Level.GRI.bObjectivePlanted && UO.IsA('wDiffuseObjective'))
            {
                // End:0x260
                if((Level.GRI.CurrentAttackingTeam != PlayerReplicationInfo.Team.TeamIndex) && UO.strPlayerName == "")
                {
                    bTraceGeom = Pawn.FastTrace(Pawn.Location, UO.Location);
                    // End:0x225
                    if(bTraceGeom == false)
                    {
                        continue;                        
                    }
                    // End:0x242
                    if(bSettingBomb)
                    {
                        Pawn.SwitchWeaponWClass('wDemopack');
                    }
                    byUsed = 1;
                    wPawn(Pawn).SetSpecialState(1);
                }
            }            
        }        
    }
    //return;    
}

function ProcessQuickGrenadeKey()
{
    local wWeapon W;

    // End:0x111
    if(int(bOldQuickGrenade) != int(bQuickGrenade))
    {
        // End:0xA4
        if(int(bQuickGrenade) == 1)
        {
            // End:0x7F
            if((Pawn.Weapon != none) && int(Pawn.Weapon.InventoryGroup) == 4)
            {
                // End:0x7C
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }                
            }
            else
            {
                W = GetWeaponByInventoryGroup(4);
                // End:0xA1
                if(W != none)
                {
                    SwitchWeapon(4, true);
                }
            }            
        }
        else
        {
            // End:0x111
            if((((Pawn.Weapon != none) && int(Pawn.Weapon.InventoryGroup) == 4) && Pawn.Weapon.IsFiring() == true) && int(bFire) == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickGrenade = bQuickGrenade;
    // End:0x22D
    if(int(bOldQuickSubGrenade) != int(bQuickSubGrenade))
    {
        // End:0x1C0
        if(int(bQuickSubGrenade) == 1)
        {
            // End:0x19B
            if((Pawn.Weapon != none) && int(Pawn.Weapon.InventoryGroup) == 3)
            {
                // End:0x198
                if(Pawn.Weapon.IsFiring() == false)
                {
                    bFire = 1;
                }                
            }
            else
            {
                W = GetWeaponByInventoryGroup(3);
                // End:0x1BD
                if(W != none)
                {
                    SwitchWeapon(3, true);
                }
            }            
        }
        else
        {
            // End:0x22D
            if((((Pawn.Weapon != none) && int(Pawn.Weapon.InventoryGroup) == 3) && Pawn.Weapon.IsFiring() == true) && int(bFire) == 1)
            {
                bFire = 0;
            }
        }
    }
    bOldQuickSubGrenade = bQuickSubGrenade;
    //return;    
}

function ServerPlayWeaponNullSound(wWeapon Wpn, Actor.ESoundSlot Slot, optional bool UseStereo)
{
    Pawn.PlaySound(Wpn.NullSound, Slot, 1.0000000,, Pawn.Weapon.ResParams.default.rad_Fire, 1.0000000, false,,, true);
    //return;    
}

function DoCombo(Class<Combo> ComboClass)
{
    // End:0x39
    if((Adrenaline >= ComboClass.default.AdrenalineCost) && !Pawn.InCurrentCombo())
    {
        ServerDoCombo(ComboClass);
    }
    //return;    
}

function ServerDoCombo(Class<Combo> ComboClass)
{
    // End:0x1F
    if((ComboClass == none) || wPawn(Pawn) == none)
    {
        return;
    }
    // End:0x8E
    if((Adrenaline >= ComboClass.default.AdrenalineCost) && !Pawn.InCurrentCombo())
    {
        // End:0x75
        if(ComboClass.default.ExecMessage != "")
        {
            ReceiveLocalizedMessage(Class'WGame_Decompressed.ComboMessage',,,, ComboClass);
        }
        wPawn(Pawn).DoCombo(ComboClass);
    }
    //return;    
}

function FillCameraList()
{
    local AttractCamera cam;

    numcams = 0;
    // End:0x3A
    foreach AllActors(Class'WGame_Decompressed.AttractCamera', cam)
    {
        camlist[numcams++] = cam;
        // End:0x39
        if(numcams == 20)
        {
            // End:0x3A
            break;
        }        
    }    
    //return;    
}

function bool FindFixedCam(Pawn Target, out int newcam)
{
    local int C, bestc;
    local float dist, BestDist;

    bestc = -1;
    C = 0;
    J0x12:

    // End:0xA2 [Loop If]
    if(C < numcams)
    {
        dist = VSize(Target.Location - camlist[C].Location);
        // End:0x98
        if(((bestc == -1) || dist < BestDist) && LineOfSight(C, Target))
        {
            bestc = C;
            BestDist = dist;
        }
        C++;
        // [Loop Continue]
        goto J0x12;
    }
    // End:0xB3
    if(bestc == -1)
    {
        return false;
    }
    newcam = bestc;
    return true;
    //return;    
}

function Vector FindFloatingCam(Pawn Target)
{
    local Vector v1, v2, D;
    local Rotator R;
    local Vector HitLoc, HitNormal;
    local Actor HitActor;
    local int tries;

    J0x00:
    // End:0x137 [Loop If]
    if(tries++ < 10)
    {
        v1 = Target.Location;
        R = Target.Rotation;
        R.Pitch = int((FRand() * float(12000)) - float(2000));
        // End:0x8C
        if(VSize(Target.Velocity) < float(100))
        {
            R.Yaw += int(FRand() * float(24000));            
        }
        else
        {
            R.Yaw += int(FRand() * float(12000));
        }
        D = Vector(R);
        v2 = v1 + (D * float(2000));
        v1 += (D * float(50));
        HitActor = Trace(HitLoc, HitNormal, v2, v1, false);
        // End:0x134
        if((HitActor != none) && VSize(HitLoc - v1) > float(250))
        {
            return HitLoc - (D * float(50));
        }
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x158
    if(HitActor != none)
    {
        return HitLoc - (D * float(50));        
    }
    else
    {
        return v2;
    }
    //return;    
}

function Pawn PickNextBot(Pawn Current)
{
    local Controller con;
    local int B;

    // End:0x1F
    if(Current != none)
    {
        con = Current.Controller;
    }
    B = 0;
    J0x26:

    // End:0xE0 [Loop If]
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
        // End:0xD6
        if((con.IsA('Bot') && con.Pawn != none) && !con.IsInState('PlayerWaiting'))
        {
            return con.Pawn;
        }
        B++;
        // [Loop Continue]
        goto J0x26;
    }
    return none;
    //return;    
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
    else
    {
        v1 = self.Location;
    }
    v2 = Target.Location;
    v2.Z += Target.EyeHeight;
    v2 += (Normal(v1 - v2) * float(100));
    return Trace(HitLoc, HitNormal, v1, v2, false) == none;
    //return;    
}

function Rotator CameraTrack(Pawn Target, float DeltaTime)
{
    local float dist;
    local Vector lead;
    local float MinZoomDist, MaxZoomDist, ViewAngle, viewwidth;

    lead = Target.Location + (vect(0.0000000, 0.0000000, 2.0000000) * Target.CollisionHeight);
    dist = VSize(lead - focuspoint);
    // End:0x7F
    if(dist > float(20))
    {
        focuspoint += (((Normal(lead - focuspoint) * dist) * DeltaTime) * 2.0000000);
    }
    // End:0x1A5
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
        else
        {
            MinZoomDist = 600.0000000;
            MaxZoomDist = 1200.0000000;
            ViewAngle = default.FovAngle;
        }
        // End:0x13F
        if(dist < MinZoomDist)
        {
            FovAngle = ViewAngle;            
        }
        else
        {
            // End:0x19A
            if(dist < MaxZoomDist)
            {
                viewwidth = MinZoomDist * Tan(((ViewAngle * 3.1415927) / float(180)) / float(2));
                FovAngle = ((Atan(viewwidth, dist) * float(180)) / 3.1415927) * float(2);
            }
        }
        DesiredFOV = FovAngle;
    }
    return Rotator(focuspoint - Location);
    //return;    
}

function PawnDied(Pawn P)
{
    // End:0x11
    if(Pawn != P)
    {
        return;
    }
    bBehindView = true;
    LastKillTime = -5.0000000;
    // End:0x5B
    if(Pawn != none)
    {
        curcam = -1;
        SetLocation(FindFloatingCam(Pawn));
        SetRotation(CameraTrack(Pawn, 0.0000000));
    }
    super(PlayerController).PawnDied(P);
    //return;    
}

function SetPawnClass(string inClass, string InCharacter)
{
    local Class<wPawn> pClass;

    // End:0x51
    if(inClass != "")
    {
        pClass = Class<wPawn>(DynamicLoadObject(inClass, Class'Core.Class'));
        // End:0x51
        if((pClass != none) && pClass.default.bCanPickupInventory)
        {
            PawnClass = pClass;
        }
    }
    PawnSetupRecord = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(InCharacter);
    PlayerReplicationInfo.SetCharacterName(InCharacter);
    SetPlayerEquipInfo();
    //return;    
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

        // End:0x216 [Loop If]
        if(i < kMM.UserInfos.Length)
        {
            // End:0x20C
            if(kMM.UserInfos[i].UserName == PlayerReplicationInfo.PlayerName)
            {
                kUser = kMM.UserInfos[i];
                iHelmet = 11000;
                iHead = 12000;
                iAcce = 13000;
                iBody[0] = 15000;
                iBody[1] = 15000;
                j = 0;
                J0xD6:

                // End:0x1DE [Loop If]
                if(j < kUser.EquippedItems.Length)
                {
                    switch(kUser.EquippedItems[j].SlotPosition)
                    {
                        // End:0x131
                        case 18:
                            iHelmet = kUser.EquippedItems[j].ItemID;
                            // End:0x1D4
                            break;
                        // End:0x158
                        case 19:
                            iHead = kUser.EquippedItems[j].ItemID;
                            // End:0x1D4
                            break;
                        // End:0x17F
                        case 20:
                            iAcce = kUser.EquippedItems[j].ItemID;
                            // End:0x1D4
                            break;
                        // End:0x1A8
                        case 21:
                            iBody[0] = kUser.EquippedItems[j].ItemID;
                            // End:0x1D4
                            break;
                        // End:0x1D1
                        case 22:
                            iBody[1] = kUser.EquippedItems[j].ItemID;
                            // End:0x1D4
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    j++;
                    // [Loop Continue]
                    goto J0xD6;
                }
                PlayerReplicationInfo.SetCharacterEquipItem(iBody[0], iBody[1], iHead, iHelmet, iAcce);
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x31;
        }
    }
    PlayerReplicationInfo.SetCharacterEquipItem(15000, 15000, 12000, 11000, 13000);
    //return;    
}

function SetPawnFemale()
{
    // End:0x21
    if(PawnSetupRecord.Species == none)
    {
        PlayerReplicationInfo.bIsFemale = true;
    }
    //return;    
}

function Possess(Pawn aPawn)
{
    local wPawn xp;

    super.Possess(aPawn);
    xp = wPawn(aPawn);
    // End:0x3B
    if(xp != none)
    {
        xp.Setup(PawnSetupRecord, true);
    }
    // End:0x60
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        ServerSetClassicTrans(bClassicTrans);
    }
    //return;    
}

exec function ChangeCharacter(string newCharacter)
{
    SetPawnClass(string(PawnClass), newCharacter);
    //return;    
}

simulated function bool NeedNetNotify()
{
    return (super.NeedNetNotify() || bWaitingForPRI) || bVoiceChatEnabled && bWaitingForVRI;
    //return;    
}

simulated event PostNetReceive()
{
    local PlayerRecord Rec;

    super.PostNetReceive();
    // End:0xA9
    if((PlayerReplicationInfo != none) && bWaitingForPRI)
    {
        bWaitingForPRI = false;
        Rec = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName);
        // End:0x57
        if(Rec.Species != none)
        {
        }
        // End:0xA9
        if((bAutoDemoRec && int(Level.NetMode) == int(NM_Client)) && !bDemoOwner)
        {
            Player.Console.DelayedConsoleCommand("demorec");
        }
    }
    // End:0x12A
    if((VoiceReplicationInfo != none) && bWaitingForVRI)
    {
        // End:0x12A
        if((PlayerReplicationInfo != none) && !PlayerReplicationInfo.NeedNetNotify())
        {
            bWaitingForVRI = VoiceReplicationInfo.GetPublicChannelCount(true) == 0;
            // End:0x12A
            if(!bWaitingForVRI)
            {
                VoiceReplicationInfo.SetOwner(self);
                // End:0x124
                if(bVoiceChatEnabled)
                {
                    InitializeVoiceChat();                    
                }
                else
                {
                    DisableVoiceChat();
                }
            }
        }
    }
    bNetNotify = NeedNetNotify();
    //return;    
}

exec function AdminMenu(string CommandLine)
{
    //return;    
}

function ServerRequestPlayerInfo()
{
    local Controller C;
    local wPlayer xPC;

    // End:0xF2
    if(PlayerReplicationInfo.bAdmin)
    {
        C = Level.ControllerList;
        J0x26:

        // End:0xF2 [Loop If]
        if(C != none)
        {
            xPC = wPlayer(C);
            // End:0x9A
            if(xPC != none)
            {
                ClientReceiveRule((((xPC.PlayerReplicationInfo.PlayerName $ Chr(27)) $ xPC.GetPlayerIDHash()) $ Chr(27)) $ xPC.GetPlayerNetworkAddress());                
            }
            else
            {
                ClientReceiveRule((((C.PlayerReplicationInfo.PlayerName $ Chr(27)) $ "AI Controlled") $ Chr(27)) $ "BOT");
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x26;
        }
    }
    ClientReceiveRule("Done");
    //return;    
}

exec function SpecViewGoal()
{
    ServerSpecViewGoal();
    //return;    
}

function ServerSpecViewGoal()
{
    local Actor NewGoal;

    // End:0xB7
    if(PlayerReplicationInfo.bOnlySpectator && IsInState('Spectating'))
    {
        NewGoal = Level.Game.FindSpecGoalFor(PlayerReplicationInfo, 0);
        // End:0xB7
        if(NewGoal != none)
        {
            // End:0x77
            if(Pawn(NewGoal) != none)
            {
                SetViewTarget(NewGoal);
                ClientSetViewTarget_H(NewGoal);                
            }
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
    //return;    
}

function ServerRequestBanInfo(int PlayerID)
{
    local array<PlayerController> CArr;
    local int i;

    // End:0x1F9
    if((Level != none) && Level.Game != none)
    {
        Level.Game.GetPlayerControllerList(CArr);
        i = 0;
        J0x45:

        // End:0x1F9 [Loop If]
        if(i < CArr.Length)
        {
            // End:0x69
            if(CArr[i] == self)
            {
                // [Explicit Continue]
                goto J0x1EF;
            }
            // End:0x1EF
            if((PlayerID == -1) || CArr[i].PlayerReplicationInfo.PlayerID == PlayerID)
            {
                Log((((((string(Name) @ "Sending BanInfo To Client PlayerID:") $ string(CArr[i].PlayerReplicationInfo.PlayerID)) @ "Hash:") $ CArr[i].GetPlayerIDHash()) @ "Address:") $ CArr[i].GetPlayerNetworkAddress(), 'ChatManager');
                ChatManager.TrackNewPlayer(CArr[i].PlayerReplicationInfo.PlayerID, CArr[i].GetPlayerIDHash(), CArr[i].GetPlayerNetworkAddress());
                ClientReceiveBan((((string(CArr[i].PlayerReplicationInfo.PlayerID) $ Chr(27)) $ CArr[i].GetPlayerIDHash()) $ Chr(27)) $ CArr[i].GetPlayerNetworkAddress());
            }
            J0x1EF:

            i++;
            // [Loop Continue]
            goto J0x45;
        }
    }
    //return;    
}

function ClientReceiveBan(string BanInfo)
{
    // End:0x29
    if(UnrealPlayerChatManager(ChatManager) != none)
    {
        UnrealPlayerChatManager(ChatManager).ReceiveBanInfo(BanInfo);
    }
    //return;    
}

simulated function InitializeVoiceChat()
{
    super(PlayerController).InitializeVoiceChat();
    ServerRequestBanInfo(-1);
    //return;    
}

simulated exec function ShowAliases()
{
    local array<string> output;
    local Security S;
    local int i;

    S = Spawn(Class'Engine.Security');
    // End:0xA3
    if(S != none)
    {
        S.LocalPerform(100, "", "", output);
        Log("No of Aliases:" @ string(output.Length));
        i = 0;
        J0x56:

        // End:0x97 [Loop If]
        if(i < output.Length)
        {
            Log((("   Alias" @ string(i)) $ ":") @ output[i]);
            i++;
            // [Loop Continue]
            goto J0x56;
        }
        S.Destroy();
    }
    //return;    
}

simulated exec function ShowBindings()
{
    local array<string> output;
    local Security S;
    local int i;

    S = Spawn(Class'Engine.Security');
    // End:0xA6
    if(S != none)
    {
        S.LocalPerform(101, "", "", output);
        Log("No of Bindings:" @ string(output.Length));
        i = 0;
        J0x57:

        // End:0x9A [Loop If]
        if(i < output.Length)
        {
            Log((("   Binding" @ string(i)) $ ":") @ output[i]);
            i++;
            // [Loop Continue]
            goto J0x57;
        }
        S.Destroy();
    }
    //return;    
}

exec function Check()
{
    local Decoration D;

    // End:0x49
    foreach AllActors(Class'Engine.Decoration', D)
    {
        Log(("#### D:" @ string(D)) @ string(VSize(Pawn.Location - D.Location)));        
    }    
    //return;    
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
    Class'WGame_Decompressed.wHelicopter'.static.Call(Level, lastHeli, Caller);
    //return;    
}

exec function art()
{
    local wPawn P;

    // End:0x44
    foreach DynamicActors(Class'WGame_Decompressed.wPawn', P)
    {
        // End:0x43
        if(Class'WGame_Decompressed.wArtilleryPack'.static.CanAddArtilleryPack(P))
        {
            P.AddWeapon(EmptyBtrDouble(), 5006, 0, false);
        }        
    }    
    //return;    
}

exec function c4()
{
    local wPawn P;

    // End:0x2D
    foreach DynamicActors(Class'WGame_Decompressed.wPawn', P)
    {
        P.AddWeapon(EmptyBtrDouble(), 7001, 0, false);        
    }    
    //return;    
}

exec function heli()
{
    clog("heli");
    CallHelicopter(true);
    //return;    
}

function bool CallHelicopter(optional bool ignoreSupply)
{
    local wHelicopter P;

    // End:0x37
    if(!ignoreSupply && int(PlayerReplicationInfo.bySupply_Helipack) == 0)
    {
        myHUD.CallSkill(6, false);
        return false;
    }
    // End:0x62
    foreach DynamicActors(Class'WGame_Decompressed.wHelicopter', P)
    {
        // End:0x61
        if(true)
        {
            myHUD.CallSkill(6, true, false);            
            return false;
        }        
    }    
    ServerCallHelicopter();
    return true;
    //return;    
}

exec function UAV()
{
    Log("[wPlayer::UAV]");
    ServerUAV();
    //return;    
}

function bool CallUAV()
{
    myHUD.CallSkill(10, true, true);
    return true;
    //return;    
}

exec function Warp()
{
    ServerWarp();
    //return;    
}

function ServerWarp()
{
    local NavigationPoint N;

    // End:0x10F
    if((Level.Game.IsWarpPossible() && Pawn != none) && !Pawn.IsInState('Dying'))
    {
        // End:0x10F
        if(wPawn(Pawn).iWarpCount > 0)
        {
            wPawn(Pawn).iWarpCount--;
            Spawn(Class'XEffects.XWFX_Grenade_explosion',,, Pawn.Location);
            N = Level.Game.GetSafetestRespawnPoint(byte(GetTeamNum()), Level.Game.EveryPlayerStarts);
            Pawn.SetLocation(N.Location);
            Pawn.SetRotation(N.Rotation);
            Spawn(Class'XEffects.XWFX_Grenade_explosion',,, N.Location);
        }
    }
    //return;    
}

exec function HIJ()
{
    ServerCallHelicopter();
    //return;    
}

exec function HIJ2()
{
    local Bot B;

    // End:0x37
    foreach DynamicActors(Class'UnrealGame.Bot', B)
    {
        // End:0x36
        if(B.GetTeamNum() != (GetTeamNum()))
        {
            ServerCallHelicopter(, B);
        }        
    }    
    //return;    
}

exec function TTT()
{
    Pawn.AddWeapon(EmptyBtrDouble(), 5009, 0, false);
    //return;    
}

exec function tT(float fRate)
{
    Pawn.AddWeapon(EmptyBtrDouble(), 5010, 0, false);
    //return;    
}

exec function PartsTest()
{
    local BTNetPlayerData PlayerData;
    local bool bResult;

    PlayerData = new Class'BTData.BTNetPlayerData';
    bResult = PlayerData.LoadPlayerPartsData();
    // End:0x33
    if(bResult == false)
    {
        return;
    }
    //return;    
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
    //return;    
}

simulated function ShowResultMenu()
{
    // End:0x1B
    if(Level.Pauser == none)
    {
        SetPause(true);
    }
    // End:0x3A
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        StopForceFeedback();
    }
    // End:0x5D
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
    //return;    
}

function AddSkill(int iSkillID)
{
    SkillBase.AddSkill(iSkillID, Level.GameMgr);
    AddSkill_Client(iSkillID);
    //return;    
}

function SkillInit_Server(bool bQuickslotChange)
{
    // End:0x18
    if(bQuickslotChange)
    {
        SkillBase.ResetSkillState();
    }
    SkillBase.PostBeginPlay();
    //return;    
}

simulated function AddSkill_Client(int iSkillID)
{
    local int i;

    SkillBase.AddSkill(iSkillID, Level.GameMgr);
    // End:0xA1
    if(int(Role) == int(ROLE_Authority))
    {
        i = 0;
        J0x39:

        // End:0xA1 [Loop If]
        if(i < SkillBase.Skills.Length)
        {
            // End:0x97
            if(SkillBase.Skills[i].SkillID == iSkillID)
            {
                SkillBase.Skills[i].PostBeginPlay();
            }
            i++;
            // [Loop Continue]
            goto J0x39;
        }
    }
    //return;    
}

function ApplySkill_Client(int iSkillID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6F [Loop If]
    if(i < SkillBase.Skills.Length)
    {
        // End:0x65
        if(SkillBase.Skills[i].SkillID == iSkillID)
        {
            SkillBase.Skills[i].PostBeginPlay();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function SkillUsedByWeapon(int iWeaponID)
{
    // End:0x1B
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSkillUsedByWeapon(iWeaponID);
    }
    SkillBase.UsedbyWeapon(iWeaponID);
    //return;    
}

function ServerSkillUsedByWeapon(int iWeaponID)
{
    SkillBase.UsedbyWeapon(iWeaponID);
    //return;    
}

function ClientReStart(Pawn NewPawn)
{
    super(PlayerController).ClientReStart(NewPawn);
    //return;    
}

function RemoveSkill(int iSkillID)
{
    SkillBase.RemoveSkill(iSkillID, Level.GameMgr);
    RemoveSkill_Client(iSkillID);
    //return;    
}

simulated function RemoveSkill_Client(int iSkillID)
{
    SkillBase.RemoveSkill(iSkillID, Level.GameMgr);
    //return;    
}

exec function MouseSenseUp()
{
    // End:0x1A
    if((GetSensitivity()) < float(5))
    {
        ChangeMouseSense(0.0500000);
    }
    //return;    
}

exec function MouseSenseDown()
{
    // End:0x1B
    if((GetSensitivity()) >= 0.1000000)
    {
        ChangeMouseSense(-0.0500000);
    }
    //return;    
}

simulated function ChangeMouseSense(float dt)
{
    SetSensitivity((GetSensitivity()) + dt);
    ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_MouseSenseChange);
    ConsoleCommand("SETCONFIG_FLOAT Controll MouseSensitivity" @ string(GetSensitivity()));
    //return;    
}

simulated function RenderSpectatorFPWeapon(Canvas Canvas, bool bClearedZBuffer)
{
    // End:0x61
    if((IsInState('Spectating') && Pawn != ViewTarget) && wPawn(ViewTarget) != none)
    {
        // End:0x48
        if(!bClearedZBuffer)
        {
            Canvas.DrawActor(none, false, true);
        }
        wPawn(ViewTarget).RenderFPWeaponAttachment(Canvas);
    }
    //return;    
}

exec function ShowRot()
{
    clog("-----------------------------------------");
    clog(((((("ROT FL ( " $ string(Pawn.wMyParam.FL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.FL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.FL_Rot.Z)) $ " )");
    clog(((((("ROT FR ( " $ string(Pawn.wMyParam.FR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.FR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.FR_Rot.Z)) $ " )");
    clog(((((("ROT BL ( " $ string(Pawn.wMyParam.BL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.BL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.BL_Rot.Z)) $ " )");
    clog(((((("ROT BR ( " $ string(Pawn.wMyParam.BR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.BR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.BR_Rot.Z)) $ " )");
    clog(((((("ROT CFL ( " $ string(Pawn.wMyParam.CFL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CFL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CFL_Rot.Z)) $ " )");
    clog(((((("ROT CFR ( " $ string(Pawn.wMyParam.CFR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CFR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CFR_Rot.Z)) $ " )");
    clog(((((("ROT CBL ( " $ string(Pawn.wMyParam.CBL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CBL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CBL_Rot.Z)) $ " )");
    clog(((((("ROT CBR ( " $ string(Pawn.wMyParam.CBR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CBR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CBR_Rot.Z)) $ " )");
    clog("-----------------------------------------");
    clog(("BodyROT FL ( " $ string(Pawn.wMyParam.BodyFL_Rot)) $ " )");
    clog(("BodyROT FR ( " $ string(Pawn.wMyParam.BodyFR_Rot)) $ " )");
    clog(("BodyROT BL ( " $ string(Pawn.wMyParam.BodyBL_Rot)) $ " )");
    clog(("BodyROT BR ( " $ string(Pawn.wMyParam.BodyBR_Rot)) $ " )");
    clog("-----------------------------------------");
    //return;    
}

exec function Rot_FL(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.FL_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.FL_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.FL_Rot.Z = float(fZ);
    Pawn.wMyParam.FL_Rot.X = float(fx);
    Pawn.wMyParam.FL_Rot.Y = float(fy);
    Pawn.wMyParam.FL_Rot.Z = float(fZ);
    clog(((((("ROT FL ( " $ string(Pawn.wMyParam.FL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.FL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.FL_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_FR(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.FR_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.FR_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.FR_Rot.Z = float(fZ);
    Pawn.wMyParam.FR_Rot.X = float(fx);
    Pawn.wMyParam.FR_Rot.Y = float(fy);
    Pawn.wMyParam.FR_Rot.Z = float(fZ);
    clog(((((("ROT FR ( " $ string(Pawn.wMyParam.FR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.FR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.FR_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_BL(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.BL_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.BL_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.BL_Rot.Z = float(fZ);
    Pawn.wMyParam.BL_Rot.X = float(fx);
    Pawn.wMyParam.BL_Rot.Y = float(fy);
    Pawn.wMyParam.BL_Rot.Z = float(fZ);
    clog(((((("ROT BL ( " $ string(Pawn.wMyParam.BL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.BL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.BL_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_BR(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.BR_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.BR_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.BR_Rot.Z = float(fZ);
    Pawn.wMyParam.BR_Rot.X = float(fx);
    Pawn.wMyParam.BR_Rot.Y = float(fy);
    Pawn.wMyParam.BR_Rot.Z = float(fZ);
    clog(((((("ROT BR ( " $ string(Pawn.wMyParam.BR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.BR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.BR_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_CFL(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.CFL_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.CFL_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.CFL_Rot.Z = float(fZ);
    Pawn.wMyParam.CFL_Rot.X = float(fx);
    Pawn.wMyParam.CFL_Rot.Y = float(fy);
    Pawn.wMyParam.CFL_Rot.Z = float(fZ);
    clog(((((("ROT CFL ( " $ string(Pawn.wMyParam.CFL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CFL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CFL_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_CFR(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.CFR_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.CFR_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.CFR_Rot.Z = float(fZ);
    Pawn.wMyParam.CFR_Rot.X = float(fx);
    Pawn.wMyParam.CFR_Rot.Y = float(fy);
    Pawn.wMyParam.CFR_Rot.Z = float(fZ);
    clog(((((("ROT CFR ( " $ string(Pawn.wMyParam.CFR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CFR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CFR_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_CBL(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.CBL_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.CBL_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.CBL_Rot.Z = float(fZ);
    Pawn.wMyParam.CBL_Rot.X = float(fx);
    Pawn.wMyParam.CBL_Rot.Y = float(fy);
    Pawn.wMyParam.CBL_Rot.Z = float(fZ);
    clog(((((("ROT CBL ( " $ string(Pawn.wMyParam.CBL_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CBL_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CBL_Rot.Z)) $ " )");
    //return;    
}

exec function Rot_CBR(string fx, string fy, string fZ)
{
    Level.CharMgr.MyPlayer.CBR_Rot.X = float(fx);
    Level.CharMgr.MyPlayer.CBR_Rot.Y = float(fy);
    Level.CharMgr.MyPlayer.CBR_Rot.Z = float(fZ);
    Pawn.wMyParam.CBR_Rot.X = float(fx);
    Pawn.wMyParam.CBR_Rot.Y = float(fy);
    Pawn.wMyParam.CBR_Rot.Z = float(fZ);
    clog(((((("ROT CBR ( " $ string(Pawn.wMyParam.CBR_Rot.X)) $ ", ") $ string(Pawn.wMyParam.CBR_Rot.Y)) $ ", ") $ string(Pawn.wMyParam.CBR_Rot.Z)) $ " )");
    //return;    
}

exec function BodyRot_FL(float fR)
{
    Level.CharMgr.MyPlayer.BodyFL_Rot = fR;
    Pawn.wMyParam.BodyFL_Rot = fR;
    clog(("BodyROT FL ( " $ string(Pawn.wMyParam.BodyFL_Rot)) $ " )");
    //return;    
}

exec function BodyRot_FR(float fR)
{
    Level.CharMgr.MyPlayer.BodyFR_Rot = fR;
    Pawn.wMyParam.BodyFR_Rot = fR;
    clog(("BodyROT FR ( " $ string(Pawn.wMyParam.BodyFR_Rot)) $ " )");
    //return;    
}

exec function BodyRot_BL(float fR)
{
    Level.CharMgr.MyPlayer.BodyBL_Rot = fR;
    Pawn.wMyParam.BodyBL_Rot = fR;
    clog(("BodyROT BL ( " $ string(Pawn.wMyParam.BodyBL_Rot)) $ " )");
    //return;    
}

exec function BodyRot_BR(float fR)
{
    Level.CharMgr.MyPlayer.BodyBR_Rot = fR;
    Pawn.wMyParam.BodyBR_Rot = fR;
    clog(("BodyROT BR ( " $ string(Pawn.wMyParam.BodyBR_Rot)) $ " )");
    //return;    
}

exec function UseRagdoll(bool bUse)
{
    Level.GameMgr.bUseRagdoll = bUse;
    //return;    
}

exec function AnimRate(float fAnimRate)
{
    Pawn.fSequenceAnimRate = fAnimRate;
    //return;    
}

state RoundEnded
{
    exec function WeaponReload()
    {
        //return;        
    }
    stop;    
}

state AttractMode
{
    ignores Timer, EndState, BeginState, AltFire, Fire, PrevWeapon, 
	    NextWeapon, PlayerMove, ProcessMove, IsSpectating;

    function bool IsSpectating()
    {
        return true;
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local float deltayaw, destyaw;
        local Rotator NewRot;

        // End:0x0D
        if(attracttarget == none)
        {
            return;
        }
        // End:0x131
        if(bBehindView)
        {
            // End:0x4B
            if((attracttarget.Controller == none) || attracttarget.Controller.Enemy == none)
            {
                return;
            }
            NewRot = Rotator(attracttarget.Controller.Enemy.Location - attracttarget.Location);
            destyaw = float(NewRot.Yaw);
            deltayaw = float(int(destyaw) & 65535) - float(Rotation.Yaw & 65535);
            // End:0xE2
            if(deltayaw < float(-32768))
            {
                deltayaw += float(65536);                
            }
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
        else
        {
            NewRot = CameraTrack(attracttarget, DeltaTime);
            SetRotation(NewRot);
        }
        //return;        
    }

    exec function NextWeapon()
    {
        //return;        
    }

    exec function PrevWeapon()
    {
        //return;        
    }

    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        Fire(F);
        //return;        
    }

    function BeginState()
    {
        // End:0x1C
        if(Pawn != none)
        {
            SetLocation(Pawn.Location);
        }
        bCollideWorld = true;
        // End:0x62
        if(curcam == -1)
        {
            FillCameraList();
            camtime = 0.0000000;
            targettime = 0.0000000;
            autozoom = true;
            curcam = -1;
        }
        Timer();
        SetTimer(0.5000000, true);
        //return;        
    }

    function EndState()
    {
        PlayerReplicationInfo.bIsSpectator = false;
        bCollideWorld = false;
        curcam = -1;
        //return;        
    }

    function Timer()
    {
        local bool switchedbots;
        local Vector NewLoc;
        local int newcam;

        camtime += 0.5000000;
        targettime += 0.5000000;
        bFrozen = false;
        // End:0x55
        if(gibwatchtime > float(0))
        {
            gibwatchtime -= 0.5000000;
            // End:0x50
            if(gibwatchtime <= float(0))
            {
                attracttarget = none;                
            }
            else
            {
                return;
            }            
        }
        else
        {
            // End:0x81
            if((attracttarget != none) && attracttarget.Health <= 0)
            {
                gibwatchtime = 4.0000000;
            }
        }
        // End:0xC0
        if((attracttarget == none) || targettime > float(30))
        {
            attracttarget = PickNextBot(attracttarget);
            switchedbots = true;
            targettime = 0.0000000;
        }
        // End:0xCD
        if(attracttarget == none)
        {
            return;
        }
        // End:0x25B
        if((switchedbots || camtime > float(10)) || (bBehindView == false) && (Rotation.Pitch < -10000) || !LineOfSight(curcam, attracttarget))
        {
            camtime = 0.0000000;
            FovAngle = default.FovAngle;
            SetViewTarget(self);
            bBehindView = false;
            // End:0x1BF
            if(FindFixedCam(attracttarget, newcam))
            {
                focuspoint = attracttarget.Location;
                curcam = newcam;
                SetLocation(camlist[curcam].Location);
                FovAngle = camlist[curcam].ViewAngle;
                SetRotation(CameraTrack(attracttarget, 0.0000000));                
            }
            else
            {
                // End:0x219
                if(FRand() < 0.5000000)
                {
                    NewLoc = FindFloatingCam(attracttarget);
                    focuspoint = attracttarget.Location;
                    curcam = -1;
                    SetLocation(NewLoc);
                    SetRotation(CameraTrack(attracttarget, 0.0000000));                    
                }
                else
                {
                    curcam = -1;
                    SetViewTarget(attracttarget);
                    SetRotation(attracttarget.Rotation);
                    CameraDeltaRotation.Pitch = -3000;
                    CameraDist = 6.0000000;
                }
            }
        }
        //return;        
    }
    stop;    
}

state ViewPlayer extends PlayerWalking
{
    function PlayerMove(float DeltaTime)
    {
        super.PlayerMove(DeltaTime);
        CameraSwivel = CameraTrack(Pawn, DeltaTime);
        //return;        
    }

    function PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
    {
        CameraRotation = CameraSwivel;
        CameraLocation = Location;
        ViewActor = self;
        //return;        
    }

    function BeginState()
    {
        FillCameraList();
        bBehindView = true;
        SetViewTarget(self);
        curcam = -2;
        autozoom = true;
        Timer();
        SetTimer(0.5000000, true);
        //return;        
    }

    function EndState()
    {
        CameraSwivel = rot(0, 0, 0);
        bBehindView = false;
        FovAngle = default.FovAngle;
        DesiredFOV = FovAngle;
        SetViewTarget(Pawn);
        //return;        
    }

    function Timer()
    {
        local Vector NewLoc;
        local int newcam;

        // End:0x102
        if((curcam == -2) || !LineOfSight(curcam, Pawn))
        {
            camtime = 0.0000000;
            // End:0xA9
            if(FindFixedCam(Pawn, newcam))
            {
                // End:0xA6
                if(curcam != newcam)
                {
                    focuspoint = Pawn.Location;
                    curcam = newcam;
                    SetLocation(camlist[curcam].Location);
                    FovAngle = camlist[curcam].ViewAngle;                    
                }                
            }
            else
            {
                NewLoc = FindFloatingCam(Pawn);
                SetLocation(NewLoc);
                curcam = -1;
                FovAngle = default.FovAngle;
                focuspoint = Pawn.Location;
            }
            CameraSwivel = CameraTrack(Pawn, 0.0000000);
        }
        //return;        
    }

    exec function TogglePlayerAttract()
    {
        GotoState('PlayerWalking');
        //return;        
    }
    stop;    
}

defaultproperties
{
    curcam=-1
    MinAdrenalineCost=100.0000000
    ComboNameList[0]="WGame.ComboSpeed"
    ComboNameList[1]="WGame.ComboBerserk"
    ComboNameList[2]="WGame.ComboDefensive"
    ComboNameList[3]="WGame.ComboInvis"
    bWaitingForPRI=true
    bWaitingForVRI=true
    bIsFirstTick=true
    BombSettingDelayTime=-1.0000000
    PlayerReplicationInfoClass=Class'WGame_Decompressed.wPlayerReplicationInfo'
    PawnClass=Class'WGame_Decompressed.wPawn'
    bNetNotify=true
}