/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSetObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:14
 *
 *******************************************************************************/
class wSetObjective extends UseObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var Pawn TP;
var float fSetTime;
var float fActiveStartTime;
var() float fSettingLength;
var int iTest;
var float fDecLength;
var bool bReplicateSettingOn;
var byte bySettingOn;
var byte byOldSettingOn;
var float fHudSetTime;

replication
{
    // Pos:0x00
    reliable if(bReplicateSettingOn && Role == 4 && bNetDirty)
        bySettingOn;

}

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x72
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        DefensePriority = 0;
        // End:0x6f
        if(!Level.Game.bChangedHost)
        {
            bActive = false;
        }
    }
    // End:0x97
    else
    {
        // End:0x97
        if(!Level.Game.bChangedHost)
        {
            bActive = true;
        }
    }
    super(GameObjective).PreBeginPlay();
}

event UsedBy(Pawn User);
function SetDefuseLocation(Vector loc, name Tag)
{
    local wDiffuseObjective Go;
    local wGameObject_Bomb Bomb;

    Log("SetDefuseLocation" $ " x=" $ string(loc.X) $ " y=" $ string(loc.Y) $ " z=" $ string(loc.Z));
    // End:0x103
    foreach DynamicActors(class'wDiffuseObjective', Go)
    {
        // End:0x102
        if(Go.Tag == Tag)
        {
            Log("found wDiffuseObjective" $ " x=" $ string(Go.Location.X) $ " y=" $ string(Go.Location.Y) $ " z=" $ string(Go.Location.Z));
            Go.SetLocation(loc);
        }                
    }
    // End:0x147
    foreach DynamicActors(class'wGameObject_Bomb', Bomb)
    {
        Bomb.bHidden = false;
        Bomb.SetLocation(loc);
        Bomb.GotoState('DroppedBomb');                
    }
}

event Tick(float DeltaTime)
{
    local Vector pawnLoc;
    local Pawn P;
    local name stateName;
    local string OldPlayerName;
    local float DecTime;

    stateName = Level.Game.GetStateName();
    // End:0x3a
    if(Level.Game.IsInState('ChangeHost'))
    {
        return;
    }
    // End:0x48
    if(bDisabled == true)
    {
        return;
    }
    // End:0x6c
    if(wMSGameReplicationInfo(Level.Game.GameReplicationInfo) == none)
    {
        return;
    }
    // End:0x9e
    if(wMSGameReplicationInfo(Level.Game.GameReplicationInfo).RoundState != 2)
    {
        return;
    }
    // End:0x171
    if(strPlayerName != "" && TP == none)
    {
        Level.GetLocalPlayerController().Player.Console.AddMessageItem(Level.GetLocalPlayerController().Player.Console.ConstructMessageItem("Recover TP", 6));
        Log("[wSetObjective] Recover TP");
        // End:0x170
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x16f
            if(P.OwnerName == strPlayerName)
            {
                TP = P;
            }
            // End:0x170
            else
            {
                continue;
            }            
        }
    }
    // End:0x1c7
    if(TP != none && IsRelevant(TP, true) && TP.byUseKey != 0 && TP.Weapon.IsA('wDemopack'))
    {
    }
    // End:0x2d0
    else
    {
        OldPlayerName = strPlayerName;
        TP = none;
        strPlayerName = "";
        // End:0x2cf
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x2ce
            if(IsRelevant(P, true) && !wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x2ce
                if(P.byUseKey != 0 && P.Weapon.IsA('wDemopack'))
                {
                    TP = P;
                    strPlayerName = P.PlayerReplicationInfo.PlayerName;
                    // End:0x2cb
                    if(OldPlayerName != strPlayerName)
                    {
                        NetUpdateTime = Level.TimeSeconds - float(1);
                    }
                }
                // End:0x2cf
                else
                {
                }
                continue;
            }            
        }
    }
    // End:0x3ac
    if(TP != none)
    {
        // End:0x3ab
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x3aa
            if(IsRelevant(P, true) && !wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x3aa
                if(P.byUseKey != 0 && P.Weapon.IsA('wDemopack'))
                {
                    // End:0x3aa
                    if(P.PlayerReplicationInfo.PlayerName != strPlayerName)
                    {
                        wPawn(P).ClientSwitchToLastWeapon();
                    }
                }
            }                        
        }
    }
    // End:0x5a3
    if(TP != none && TP.IsA('wPawn'))
    {
        // End:0x59a
        if(TP.byUseKey != 0 && TP.Weapon.IsA('wDemopack'))
        {
            // End:0x46c
            if(TP.Controller != none && TP.Controller.SkillBase != none && TP.Controller.SkillBase.bQuickDemolition == true)
            {
                DecTime = fDecLength;
            }
            // End:0x477
            else
            {
                DecTime = 0.0;
            }
            // End:0x4ef
            if(fSetTime == 0.0)
            {
                fSetTime = Level.TimeSeconds;
                fActiveStartTime = 0.0;
                // End:0x4bf
                if(DecTime != 0.0)
                {
                    bySettingOn = 2;
                }
                // End:0x4c7
                else
                {
                    bySettingOn = 1;
                }
                fHudSetTime = 0.0;
                NetUpdateTime = Level.TimeSeconds - float(5);
            }
            // End:0x597
            else
            {
                // End:0x597
                if(Level.TimeSeconds - fSetTime > fSettingLength - DecTime)
                {
                    pawnLoc = TP.Location;
                    wPawn(TP).ClientSwitchToLastWeapon();
                    fActiveStartTime = Level.TimeSeconds;
                    // End:0x591
                    if(true)
                    {
                        wMSGameInfo(Level.Game).SetObjectiveSetted(TP, Tag, Location);
                        SetDefuseLocation(pawnLoc, Tag);
                    }
                    RefreshState();
                }
            }
        }
        // End:0x5a0
        else
        {
            RefreshState();
        }
    }
    // End:0x5a9
    else
    {
        RefreshState();
    }
}

simulated function bool IsPlanting(Pawn P)
{
    // End:0x0d
    if(none == P)
    {
        return false;
    }
    // End:0x23
    if(none == P.PlayerReplicationInfo)
    {
        return false;
    }
    return P.PlayerReplicationInfo.PlayerName == strPlayerName;
}

simulated function bool CanPlant(Pawn P)
{
    local Pawn touchingP;
    local bool hasBomb;

    // End:0x23
    if(none == Level || none == Level.GRI)
    {
        return false;
    }
    // End:0x46
    if(none == P || none == P.PlayerReplicationInfo)
    {
        return false;
    }
    // End:0x55
    if(bySettingOn != 0)
    {
        return false;
    }
    // End:0x99
    if(wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
    {
        return false;
    }
    hasBomb = P.PlayerReplicationInfo.HasFlag != none && P.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted;
    // End:0x138
    if(!hasBomb)
    {
        return false;
    }
    // End:0x15b
    foreach TouchingActors(class'Pawn', touchingP)
    {
        // End:0x15a
        if(P == touchingP)
        {
            break;
            return true;
        }                
    }
}

function Touch(Actor Other);
function UnTouch(Actor Other);
function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = P.PlayerReplicationInfo;
    // End:0x21
    if(!IsActive())
    {
        return false;
    }
    // End:0x3e
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0x89
    if(PRI.Team.TeamIndex != wMSGameReplicationInfo(Level.GRI).CurrentAttackingTeam)
    {
        return false;
    }
    // End:0xd2
    if(bAliveCheck)
    {
        // End:0xd2
        if(Instigator.Health < 1 || Instigator.bDeleteMe || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0xf8
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    // End:0x13a
    if(PRI != none && PRI.HasFlag != none && PRI.HasFlag.IsA('wGameObject_Bomb'))
    {
        return true;
    }
    // End:0x157
    if(Level.GRI.bMultiBomb)
    {
        return true;
    }
    return false;
}

function PlayerToucherDied(Pawn P)
{
    // End:0x1e
    if(TP == P)
    {
        TP = none;
        strPlayerName = "";
    }
    RefreshState();
}

simulated function float GetObjectiveProgress()
{
    local float DecTime;

    // End:0x12
    if(bDisabled == true)
    {
        return 0.0;
    }
    // End:0x30
    if(bySettingOn == 0)
    {
        fHudSetTime = 0.0;
        return 0.0;
    }
    // End:0x62
    if(bySettingOn != 0 && fHudSetTime == 0.0)
    {
        fHudSetTime = Level.TimeSeconds;
    }
    // End:0x7e
    if(bySettingOn == 2)
    {
        DecTime = fDecLength;
    }
    // End:0x89
    else
    {
        DecTime = 0.0;
    }
    return FMin(1.0, Level.TimeSeconds - fHudSetTime / fSettingLength - DecTime);
}

function RefreshState()
{
    fSetTime = 0.0;
    iTest = 1;
    bySettingOn = 0;
    byOldSettingOn = 0;
    fHudSetTime = 0.0;
    strPlayerName = "";
}

function Reset()
{
    TP = none;
    strPlayerName = "";
    RefreshState();
    super(GameObjective).Reset();
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bActiveStatus)
    {
        bDisabled = false;
    }
    super(ProximityObjective).SetActive(bActiveStatus);
}

defaultproperties
{
    fSettingLength=7.650
    fDecLength=2.20
    bReplicateSettingOn=true
    bInitiallyActive=true
    DefensePriority=100
    Score=10
    DestructionMessage=""
    ObjectiveDescription="Destroy the objectives!"
    Objective_Info_Attacker="Destroy the objectives!"
    Objective_Info_Defender="Defend the objectives!"
    Announcer_DisabledObjective="v_sd_bomb_plant_team_R"
    Announcer_ObjectiveInfo="v_sd_destroy_R"
    Announcer_DefendObjective="v_sd_guard_R"
    ApplyGameInfo="wMission.wSDGameInfo"
    bReceivePlayerToucherDiedNotify=true
}