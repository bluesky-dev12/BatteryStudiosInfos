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
    // Pos:0x000
    reliable if((bReplicateSettingOn && int(Role) == int(ROLE_Authority)) && bNetDirty)
        bySettingOn;
}

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x72
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        DefensePriority = 0;
        // End:0x6F
        if(!Level.Game.bChangedHost)
        {
            bActive = false;
        }        
    }
    else
    {
        // End:0x97
        if(!Level.Game.bChangedHost)
        {
            bActive = true;
        }
    }
    super(GameObjective).PreBeginPlay();
    //return;    
}

event UsedBy(Pawn User)
{
    //return;    
}

function SetDefuseLocation(Vector loc, name Tag)
{
    local wDiffuseObjective Go;
    local wGameObject_Bomb Bomb;

    Log(((((("SetDefuseLocation" $ " x=") $ string(loc.X)) $ " y=") $ string(loc.Y)) $ " z=") $ string(loc.Z));
    // End:0x103
    foreach DynamicActors(Class'WMission_Decompressed.wDiffuseObjective', Go)
    {
        // End:0x102
        if(Go.Tag == Tag)
        {
            Log(((((("found wDiffuseObjective" $ " x=") $ string(Go.Location.X)) $ " y=") $ string(Go.Location.Y)) $ " z=") $ string(Go.Location.Z));
            Go.SetLocation(loc);
        }        
    }    
    // End:0x147
    foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
    {
        Bomb.bHidden = false;
        Bomb.SetLocation(loc);
        Bomb.GotoState('DroppedBomb');        
    }    
    //return;    
}

event Tick(float DeltaTime)
{
    local Vector pawnLoc;
    local Pawn P;
    local name stateName;
    local string OldPlayerName;
    local float DecTime;

    stateName = Level.Game.GetStateName();
    // End:0x3A
    if(Level.Game.IsInState('ChangeHost'))
    {
        return;
    }
    // End:0x48
    if(bDisabled == true)
    {
        return;
    }
    // End:0x6C
    if(wMSGameReplicationInfo(Level.Game.GameReplicationInfo) == none)
    {
        return;
    }
    // End:0x9E
    if(int(wMSGameReplicationInfo(Level.Game.GameReplicationInfo).RoundState) != int(2))
    {
        return;
    }
    // End:0x171
    if((strPlayerName != "") && TP == none)
    {
        Level.GetLocalPlayerController().Player.Console.AddMessageItem(Level.GetLocalPlayerController().Player.Console.ConstructMessageItem("Recover TP", 6));
        Log("[wSetObjective] Recover TP");
        // End:0x170
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x16F
            if(P.OwnerName == strPlayerName)
            {
                TP = P;
                // End:0x170
                break;
            }            
        }        
    }
    // End:0x1C7
    if((((TP != none) && IsRelevant(TP, true)) && int(TP.byUseKey) != 0) && TP.Weapon.IsA('wDemopack'))
    {        
    }
    else
    {
        OldPlayerName = strPlayerName;
        TP = none;
        strPlayerName = "";
        // End:0x2CF
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x2CE
            if((IsRelevant(P, true)) && !wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x2CE
                if((int(P.byUseKey) != 0) && P.Weapon.IsA('wDemopack'))
                {
                    TP = P;
                    strPlayerName = P.PlayerReplicationInfo.PlayerName;
                    // End:0x2CB
                    if(OldPlayerName != strPlayerName)
                    {
                        NetUpdateTime = Level.TimeSeconds - float(1);
                    }
                    // End:0x2CF
                    break;
                }
            }            
        }        
    }
    // End:0x3AC
    if(TP != none)
    {
        // End:0x3AB
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x3AA
            if((IsRelevant(P, true)) && !wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x3AA
                if((int(P.byUseKey) != 0) && P.Weapon.IsA('wDemopack'))
                {
                    // End:0x3AA
                    if(P.PlayerReplicationInfo.PlayerName != strPlayerName)
                    {
                        wPawn(P).ClientSwitchToLastWeapon();
                    }
                }
            }            
        }        
    }
    // End:0x5A3
    if((TP != none) && TP.IsA('wPawn'))
    {
        // End:0x59A
        if((int(TP.byUseKey) != 0) && TP.Weapon.IsA('wDemopack'))
        {
            // End:0x46C
            if(((TP.Controller != none) && TP.Controller.SkillBase != none) && TP.Controller.SkillBase.bQuickDemolition == true)
            {
                DecTime = fDecLength;                
            }
            else
            {
                DecTime = 0.0000000;
            }
            // End:0x4EF
            if(fSetTime == 0.0000000)
            {
                fSetTime = Level.TimeSeconds;
                fActiveStartTime = 0.0000000;
                // End:0x4BF
                if(DecTime != 0.0000000)
                {
                    bySettingOn = 2;                    
                }
                else
                {
                    bySettingOn = 1;
                }
                fHudSetTime = 0.0000000;
                NetUpdateTime = Level.TimeSeconds - float(5);                
            }
            else
            {
                // End:0x597
                if((Level.TimeSeconds - fSetTime) > (fSettingLength - DecTime))
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
        else
        {
            RefreshState();
        }        
    }
    else
    {
        RefreshState();
    }
    //return;    
}

simulated function bool IsPlanting(Pawn P)
{
    // End:0x0D
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
    //return;    
}

simulated function bool CanPlant(Pawn P)
{
    local Pawn touchingP;
    local bool hasBomb;

    // End:0x23
    if((none == Level) || none == Level.GRI)
    {
        return false;
    }
    // End:0x46
    if((none == P) || none == P.PlayerReplicationInfo)
    {
        return false;
    }
    // End:0x55
    if(int(bySettingOn) != 0)
    {
        return false;
    }
    // End:0x99
    if(wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
    {
        return false;
    }
    hasBomb = (P.PlayerReplicationInfo.HasFlag != none) && P.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted;
    // End:0x138
    if(!hasBomb)
    {
        return false;
    }
    // End:0x15B
    foreach TouchingActors(Class'Engine.Pawn', touchingP)
    {
        // End:0x15A
        if(P == touchingP)
        {            
            return true;
        }        
    }    
    //return;    
}

function Touch(Actor Other)
{
    //return;    
}

function UnTouch(Actor Other)
{
    //return;    
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = P.PlayerReplicationInfo;
    // End:0x21
    if(!IsActive())
    {
        return false;
    }
    // End:0x3E
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
    // End:0xD2
    if(bAliveCheck)
    {
        // End:0xD2
        if(((Instigator.Health < 1) || Instigator.bDeleteMe) || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0xF8
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    // End:0x13A
    if(((PRI != none) && PRI.HasFlag != none) && PRI.HasFlag.IsA('wGameObject_Bomb'))
    {
        return true;
    }
    // End:0x157
    if(Level.GRI.bMultiBomb)
    {
        return true;
    }
    return false;
    //return;    
}

function PlayerToucherDied(Pawn P)
{
    // End:0x1E
    if(TP == P)
    {
        TP = none;
        strPlayerName = "";
    }
    RefreshState();
    //return;    
}

simulated function float GetObjectiveProgress()
{
    local float DecTime;

    // End:0x12
    if(bDisabled == true)
    {
        return 0.0000000;
    }
    // End:0x30
    if(int(bySettingOn) == 0)
    {
        fHudSetTime = 0.0000000;
        return 0.0000000;
    }
    // End:0x62
    if((int(bySettingOn) != 0) && fHudSetTime == 0.0000000)
    {
        fHudSetTime = Level.TimeSeconds;
    }
    // End:0x7E
    if(int(bySettingOn) == 2)
    {
        DecTime = fDecLength;        
    }
    else
    {
        DecTime = 0.0000000;
    }
    return FMin(1.0000000, (Level.TimeSeconds - fHudSetTime) / (fSettingLength - DecTime));
    //return;    
}

function RefreshState()
{
    fSetTime = 0.0000000;
    iTest = 1;
    bySettingOn = 0;
    byOldSettingOn = 0;
    fHudSetTime = 0.0000000;
    strPlayerName = "";
    //return;    
}

function Reset()
{
    TP = none;
    strPlayerName = "";
    RefreshState();
    super(GameObjective).Reset();
    //return;    
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bActiveStatus)
    {
        bDisabled = false;
    }
    super(ProximityObjective).SetActive(bActiveStatus);
    //return;    
}

defaultproperties
{
    fSettingLength=7.6500001
    fDecLength=2.2000000
    bReplicateSettingOn=true
    bInitiallyActive=false
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