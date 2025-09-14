class wDiffuseObjective extends UseObjective
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
    // Pos:0x000
    reliable if((bReplicateSettingOn && int(Role) == int(ROLE_Authority)) && bNetDirty)
        bySettingOn, fSetTime;
}

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    // End:0xB4
    if(!Level.Game.bChangedHost)
    {
        rMM = Level.GetMatchMaker();
        // End:0x8F
        if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
        {
            bCanActive = false;
            DefensePriority = 0;
            // End:0x8C
            if(!Level.Game.bChangedHost)
            {
                bActive = false;
            }            
        }
        else
        {
            // End:0xB4
            if(!Level.Game.bChangedHost)
            {
                bActive = true;
            }
        }
    }
    super(GameObjective).PreBeginPlay();
    //return;    
}

event UsedBy(Pawn User)
{
    //return;    
}

function SetBombVisibility(bool val)
{
    local int lp;

    // End:0x7D
    if((val == false) || lastBombVisibility != val)
    {
        // End:0x31
        if(bombs.Length == 0)
        {
            UpdateBombs();
        }
        lastBombVisibility = val;
        lp = 0;
        J0x45:

        // End:0x7D [Loop If]
        if(lp < bombs.Length)
        {
            bombs[lp].bHidden = !val;
            lp++;
            // [Loop Continue]
            goto J0x45;
        }
    }
    //return;    
}

function UpdateBombs()
{
    local wGameObject_Bomb Bomb;

    bombs.Length = 0;
    // End:0x2B
    foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Bomb)
    {
        bombs[bombs.Length] = Bomb;        
    }    
    //return;    
}

function OnBombDiffused(Pawn P)
{
    local wDiffuseObjective dif;

    crlog("[wDiffuseObjective::OnBombDiffused] p=" $ P.OwnerName);
    // End:0x5F
    foreach DynamicActors(Class'WMission_Decompressed.wDiffuseObjective', dif)
    {
        dif.SetActive(false);        
    }    
    wMSGameInfo(Level.Game).EndGameFocus = P;
    PlayBombDefusedMessage(P);
    P.Controller.PlayerReplicationInfo.Score += wSDGameInfo(Level.Game).AddScore_Defuse;
    P.Controller.PlayerReplicationInfo.fExp += wSDGameInfo(Level.Game).AddExp_Defuse;
    P.Controller.PlayerReplicationInfo.Point += wSDGameInfo(Level.Game).AddPoint_Defuse;
    PlayerController(P.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', Class'Engine.wMessage_Score'.default.Code_MessageScore_BombDiffused);
    wSDGameInfo(Level.Game).OnBombDiffused(P, Tag, Location);
    wMSGameInfo(Level.Game).EndRound(1, P, "!!! Defender Win - Bomb Defused !!!");
    //return;    
}

function PlayBombDefusedMessage(Pawn TP)
{
    local byte TeamNum;

    TeamNum = byte(TP.GetTeamNum());
    Level.Game.TeamReceiveLocalizedMessage(TeamNum, Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDAllyBombDefused, TP.PlayerReplicationInfo);
    Level.Game.TeamReceiveLocalizedMessage(byte(int(1) - int(TeamNum)), Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_SDEnemyBombDefused);
    //return;    
}

event Tick(float DeltaTime)
{
    local Pawn P;
    local bool Set;
    local float DecTime;
    local string OldPlayerName;

    // End:0x0E
    if(bDisabled == true)
    {
        return;
    }
    // End:0x5F
    if((strPlayerName != "") && TP == none)
    {
        // End:0x5E
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x5D
            if(P.OwnerName == strPlayerName)
            {
                TP = P;
                // End:0x5E
                break;
            }            
        }        
    }
    // End:0xB5
    if((((TP != none) && IsRelevant(TP, true)) && int(TP.byUseKey) != 0) && TP.Weapon.IsA('wDemopack'))
    {        
    }
    else
    {
        OldPlayerName = strPlayerName;
        TP = none;
        strPlayerName = "";
        Set = false;
        // End:0x1C3
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x1C2
            if((IsRelevant(P, true)) && wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x1C2
                if((int(P.byUseKey) != 0) && P.Weapon.IsA('wDemopack'))
                {
                    TP = P;
                    strPlayerName = P.PlayerReplicationInfo.PlayerName;
                    // End:0x1BF
                    if(OldPlayerName != strPlayerName)
                    {
                        NetUpdateTime = Level.TimeSeconds - float(1);
                    }
                    // End:0x1C3
                    break;
                }
            }            
        }        
    }
    // End:0x2A0
    if(TP != none)
    {
        // End:0x29F
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            // End:0x29E
            if((IsRelevant(P, true)) && wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
            {
                // End:0x29E
                if((int(P.byUseKey) != 0) && P.Weapon.IsA('wDemopack'))
                {
                    // End:0x29E
                    if(P.PlayerReplicationInfo.PlayerName != strPlayerName)
                    {
                        wPawn(P).ClientSwitchToLastWeapon(1);
                    }
                }
            }            
        }        
    }
    // End:0x487
    if((TP != none) && TP.IsA('wPawn'))
    {
        // End:0x47E
        if((int(TP.byUseKey) != 0) && TP.Weapon.IsA('wDemopack'))
        {
            // End:0x360
            if(((TP.Controller != none) && TP.Controller.SkillBase != none) && TP.Controller.SkillBase.bQuickDemolition == true)
            {
                DecTime = fDecLength;                
            }
            else
            {
                DecTime = 0.0000000;
            }
            // End:0x44A
            if(fSetTime == 0.0000000)
            {
                NetUpdateTime = Level.TimeSeconds - float(5);
                fSetTime = Level.TimeSeconds;
                // End:0x3C2
                if(DecTime != 0.0000000)
                {
                    bySettingOn = 2;                    
                }
                else
                {
                    bySettingOn = 1;
                }
                SetBombVisibility(false);
                // End:0x422
                foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', Setbomb)
                {
                    // End:0x421
                    if(Setbomb != none)
                    {
                        Log(string(self) $ " Setbomb.bHidden = true;");
                        Setbomb.bHidden = true;
                        // End:0x422
                        break;
                    }                    
                }                
                Log((string(self) $ " Tick() / Setbomb:") $ string(Setbomb));                
            }
            else
            {
                // End:0x47B
                if((Level.TimeSeconds - fSetTime) > (fSettingLength - DecTime))
                {
                    OnBombDiffused(TP);
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

simulated function bool IsDefusing(Pawn P)
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

simulated function bool CanDefuse(Pawn P)
{
    local Pawn touchingP;
    local bool bCheck;

    // End:0x23
    if((none == Level) || none == Level.GRI)
    {
        return false;
    }
    // End:0x30
    if(none == P)
    {
        return false;
    }
    // End:0x3F
    if(int(bySettingOn) != 0)
    {
        return false;
    }
    // End:0x85
    if(!wMSGameReplicationInfo(Level.GRI).IsDefender(byte(P.PlayerReplicationInfo.Team.TeamIndex)))
    {
        return false;
    }
    // End:0xDE
    foreach TouchingActors(Class'Engine.Pawn', touchingP)
    {
        // End:0xDD
        if(P == touchingP)
        {
            bCheck = P.FastTrace(P.Location, Location);
            // End:0xDA
            if(bCheck == false)
            {
                continue;                
            }            
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
    if((Instigator.GetTeam() == none) || Instigator.GetTeam().TeamIndex == MSGRI.CurrentAttackingTeam)
    {
        return false;
    }
    // End:0xE1
    if(bAliveCheck)
    {
        // End:0xE1
        if(((Instigator.Health < 1) || Instigator.bDeleteMe) || !Instigator.IsPlayerPawn())
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
    // End:0x3B
    if(int(bySettingOn) == 0)
    {
        fSetTimeClient = 0.0000000;
        fSetTimeBefore = 0.0000000;
        return 0.0000000;
    }
    // End:0x69
    if(fSetTimeBefore != fSetTime)
    {
        fSetTimeBefore = fSetTime;
        fSetTimeClient = Level.TimeSeconds;
    }
    // End:0x85
    if(int(bySettingOn) == 2)
    {
        DecTime = fDecLength;        
    }
    else
    {
        DecTime = 0.0000000;
    }
    return FMin(1.0000000, (Level.TimeSeconds - fSetTimeClient) / (fSettingLength - DecTime));
    //return;    
}

function RefreshState()
{
    fSetTime = 0.0000000;
    iTest = 1;
    bySettingOn = 0;
    // End:0x2C
    if(!bDisabled)
    {
        SetBombVisibility(true);
    }
    strPlayerName = "";
    // End:0x8A
    if((Setbomb != none) && Setbomb.bHidden)
    {
        Setbomb.bHidden = false;
        Setbomb = none;
        Log(string(self) $ " Setbomb.bHidden=false");
    }
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

defaultproperties
{
    fSettingLength=7.6500001
    fDecLength=2.2000000
    bReplicateSettingOn=true
    BombDefusedMessage="The bomb has been defused."
    bInitiallyActive=false
    DefensePriority=50
    Score=10
    DestructionMessage=""
    ObjectiveDescription="Bomb is Planted!"
    Objective_Info_Attacker="Defuse the Bomb!"
    Objective_Info_Defender="Defend the Bomb!"
    ApplyGameInfo="wMission.wSDGameInfo"
    bReceivePlayerToucherDiedNotify=true
    bReplicateMovement=true
}