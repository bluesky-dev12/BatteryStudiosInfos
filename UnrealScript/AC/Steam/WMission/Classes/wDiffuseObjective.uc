/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wDiffuseObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:16
 *
 *******************************************************************************/
class wDiffuseObjective extends UseObjective
    dependson(wSDGameInfo)
    hidecategories(Lighting,LightColor,Karma,Force);

var Pawn TP;
var float fSetTime;
var float fSetTimeBefore;
var float fSetTimeClient;
var() float fSettingLength;
var int iTest;
var float fDecLength;
var bool bReplicateSettingOn;
var byte bySettingOn;
var bool lastBombVisibility;
var array<Pawn> TouchingPawns;
var array<wGameObject_Bomb> bombs;
var localized string BombDefusedMessage;
var wGameObject_Bomb Setbomb;

replication
{
    // Pos:0x00
    reliable if(bReplicateSettingOn && Role == 4 && bNetDirty)
        fSetTime, bySettingOn;

}

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    // End:0xb4
    if(!Level.Game.bChangedHost)
    {
        rMM = Level.GetMatchMaker();
        // End:0x8f
        if(rMM != none && rMM.szGameClass != ApplyGameInfo)
        {
            bCanActive = false;
            DefensePriority = 0;
            // End:0x8c
            if(!Level.Game.bChangedHost)
            {
                bActive = false;
            }
        }
        // End:0xb4
        else
        {
            // End:0xb4
            if(!Level.Game.bChangedHost)
            {
                bActive = true;
            }
        }
    }
    super(GameObjective).PreBeginPlay();
}

event UsedBy(Pawn User);
function SetBombVisibility(bool val)
{
    local int lp;

    // End:0x7d
    if(val == false || lastBombVisibility != val)
    {
        // End:0x31
        if(bombs.Length == 0)
        {
            UpdateBombs();
        }
        lastBombVisibility = val;
        lp = 0;
        J0x45:
        // End:0x7d [While If]
        if(lp < bombs.Length)
        {
            bombs[lp].bHidden = !val;
            ++ lp;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
    }
}

function UpdateBombs()
{
    local wGameObject_Bomb Bomb;

    bombs.Length = 0;
    // End:0x2b
    foreach DynamicActors(class'wGameObject_Bomb', Bomb)
    {
        bombs[bombs.Length] = Bomb;                
    }
}

function OnBombDiffused(Pawn P)
{
    local wDiffuseObjective dif;

    crlog("[wDiffuseObjective::OnBombDiffused] p=" $ P.OwnerName);
    // End:0x5f
    foreach DynamicActors(class'wDiffuseObjective', dif)
    {
        dif.SetActive(false);                
    }
    wMSGameInfo(Level.Game).EndGameFocus = P;
    PlayBombDefusedMessage(P);
    P.Controller.PlayerReplicationInfo.Score += wSDGameInfo(Level.Game).AddScore_Defuse;
    P.Controller.PlayerReplicationInfo.fExp += wSDGameInfo(Level.Game).AddExp_Defuse;
    P.Controller.PlayerReplicationInfo.Point += wSDGameInfo(Level.Game).AddPoint_Defuse;
    PlayerController(P.Controller).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_BombDiffused);
    wSDGameInfo(Level.Game).OnBombDiffused(P, Tag, Location);
    wMSGameInfo(Level.Game).EndRound(1, P, "!!! Defender Win - Bomb Defused !!!");
}

function PlayBombDefusedMessage(Pawn TP)
{
    local byte TeamNum;

    TeamNum = byte(TP.GetTeamNum());
    Level.Game.TeamReceiveLocalizedMessage(TeamNum, class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDAllyBombDefused, TP.PlayerReplicationInfo);
    Level.Game.TeamReceiveLocalizedMessage(byte(1 - TeamNum), class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_SDEnemyBombDefused);
}

event Tick(float DeltaTime)
{
    local Pawn P;
    local bool Set;
    local float DecTime;
    local string OldPlayerName;

    // End:0x0e
    if(bDisabled == true)
    {
        return;
    }
    // End:0x5f
    if(strPlayerName != "" && TP == none)
    {
        // End:0x5e
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x5d
            if(P.OwnerName == strPlayerName)
            {
                TP = P;
            }
            // End:0x5e
            else
            {
                continue;
            }            
        }
    }
    // End:0xb5
    if(TP != none && IsRelevant(TP, true) && TP.byUseKey != 0 && TP.Weapon.IsA('wDemopack'))
    {
    }
    // End:0x1c4
    else
    {
        OldPlayerName = strPlayerName;
        TP = none;
        strPlayerName = "";
        Set = false;
        // End:0x1c3
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x1c2
            if(IsRelevant(P, true) && wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x1c2
                if(P.byUseKey != 0 && P.Weapon.IsA('wDemopack'))
                {
                    TP = P;
                    strPlayerName = P.PlayerReplicationInfo.PlayerName;
                    // End:0x1bf
                    if(OldPlayerName != strPlayerName)
                    {
                        NetUpdateTime = Level.TimeSeconds - float(1);
                    }
                }
                // End:0x1c3
                else
                {
                }
                continue;
            }            
        }
    }
    // End:0x2a0
    if(TP != none)
    {
        // End:0x29f
        foreach TouchingActors(class'Pawn', P)
        {
            // End:0x29e
            if(IsRelevant(P, true) && wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x29e
                if(P.byUseKey != 0 && P.Weapon.IsA('wDemopack'))
                {
                    // End:0x29e
                    if(P.PlayerReplicationInfo.PlayerName != strPlayerName)
                    {
                        wPawn(P).ClientSwitchToLastWeapon(1);
                    }
                }
            }                        
        }
    }
    // End:0x487
    if(TP != none && TP.IsA('wPawn'))
    {
        // End:0x47e
        if(TP.byUseKey != 0 && TP.Weapon.IsA('wDemopack'))
        {
            // End:0x360
            if(TP.Controller != none && TP.Controller.SkillBase != none && TP.Controller.SkillBase.bQuickDemolition == true)
            {
                DecTime = fDecLength;
            }
            // End:0x36b
            else
            {
                DecTime = 0.0;
            }
            // End:0x44a
            if(fSetTime == 0.0)
            {
                NetUpdateTime = Level.TimeSeconds - float(5);
                fSetTime = Level.TimeSeconds;
                // End:0x3c2
                if(DecTime != 0.0)
                {
                    bySettingOn = 2;
                }
                // End:0x3ca
                else
                {
                    bySettingOn = 1;
                }
                SetBombVisibility(false);
                // End:0x422
                foreach DynamicActors(class'wGameObject_Bomb', Setbomb)
                {
                    // End:0x421
                    if(Setbomb != none)
                    {
                        Log(string(self) $ " Setbomb.bHidden = true;");
                        Setbomb.bHidden = true;
                    }
                    // End:0x422
                    else
                    {
                        continue;
                    }                    
                }
                Log(string(self) $ " Tick() / Setbomb:" $ string(Setbomb));
            }
            // End:0x47b
            else
            {
                // End:0x47b
                if(Level.TimeSeconds - fSetTime > fSettingLength - DecTime)
                {
                    OnBombDiffused(TP);
                }
            }
        }
        // End:0x484
        else
        {
            RefreshState();
        }
    }
    // End:0x48d
    else
    {
        RefreshState();
    }
}

simulated function bool IsDefusing(Pawn P)
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

simulated function bool CanDefuse(Pawn P)
{
    local Pawn touchingP;
    local bool bCheck;

    // End:0x23
    if(none == Level || none == Level.GRI)
    {
        return false;
    }
    // End:0x30
    if(none == P)
    {
        return false;
    }
    // End:0x3f
    if(bySettingOn != 0)
    {
        return false;
    }
    // End:0x85
    if(!wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
    {
        return false;
    }
    // End:0xde
    foreach TouchingActors(class'Pawn', touchingP)
    {
        // End:0xdd
        if(P == touchingP)
        {
            bCheck = P.FastTrace(P.Location, Location);
            // End:0xda
            if(bCheck == false)
            {
                continue;
            }
            // End:0xde
            else
            {
                break;
                return true;
            }
            continue;
        }        
    }
}

function Touch(Actor Other);
function UnTouch(Actor Other);
function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local wMSGameReplicationInfo MSGRI;

    MSGRI = wMSGameReplicationInfo(Level.GRI);
    // End:0x26
    if(!IsActive())
    {
        return false;
    }
    // End:0x43
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0x98
    if(Instigator.GetTeam() == none || Instigator.GetTeam().TeamIndex == MSGRI.CurrentAttackingTeam)
    {
        return false;
    }
    // End:0xe1
    if(bAliveCheck)
    {
        // End:0xe1
        if(Instigator.Health < 1 || Instigator.bDeleteMe || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x107
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    return true;
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
    // End:0x3b
    if(bySettingOn == 0)
    {
        fSetTimeClient = 0.0;
        fSetTimeBefore = 0.0;
        return 0.0;
    }
    // End:0x69
    if(fSetTimeBefore != fSetTime)
    {
        fSetTimeBefore = fSetTime;
        fSetTimeClient = Level.TimeSeconds;
    }
    // End:0x85
    if(bySettingOn == 2)
    {
        DecTime = fDecLength;
    }
    // End:0x90
    else
    {
        DecTime = 0.0;
    }
    return FMin(1.0, Level.TimeSeconds - fSetTimeClient / fSettingLength - DecTime);
}

function RefreshState()
{
    fSetTime = 0.0;
    iTest = 1;
    bySettingOn = 0;
    // End:0x2c
    if(!bDisabled)
    {
        SetBombVisibility(true);
    }
    strPlayerName = "";
    // End:0x8a
    if(Setbomb != none && Setbomb.bHidden)
    {
        Setbomb.bHidden = false;
        Setbomb = none;
        Log(string(self) $ " Setbomb.bHidden=false");
    }
}

function Reset()
{
    TP = none;
    strPlayerName = "";
    RefreshState();
    super(GameObjective).Reset();
}

defaultproperties
{
    fSettingLength=7.650
    fDecLength=2.20
    bReplicateSettingOn=true
    BombDefusedMessage="The bomb has been defused."
    bInitiallyActive=true
    DefensePriority=50
    Score=10
    DestructionMessage=""
    ObjectiveDescription="Bomb is Planted!"
    Objective_Info_Attacker="Defuse the Bomb!"
    Objective_Info_Defender="Defend the Bomb!"
    Announcer_DisabledObjective="v_sd_bomb_defuse_enemy_R"
    Announcer_ObjectiveInfo="v_sd_bomb_plant_team_R"
    ApplyGameInfo="wMission.wSDGameInfo"
    bReceivePlayerToucherDiedNotify=true
    bReplicateMovement=true
}