class wAlienController extends wPlayer
    config(User);

const ALIEN_FOV = 80;

struct CoolTimeSkillObject
{
    var float fCurCoolTime;
    var float fCurActiveTime;
    var bool bIsActive;
    var wSkill SkillObject;
};

var array<CoolTimeSkillObject> CoolTimeSkills;
var Vector vDeadLocation;
var Rotator rDeadRotation;
var Vector vKnockBackDir;
var float fKnockBackTime;
var float fKnockBackMomentum;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerChangePawn, ServerSetBase;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientChangeKnockBackState, ClientChangeTeam, 
        ClientQuickRepairByAlien, ClientUpdate3rdModel, 
        ClientUpdateDefSuccessFromInfection, ClientUpdateLevelup;
}

function LocalSetPrecached()
{
    local wAlienGameReplicationInfo GRI;

    super(PlayerController).LocalSetPrecached();
    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x70
    if((PlayerReplicationInfo != none) && ((PlayerReplicationInfo.bOnlySpectator == true) || PlayerReplicationInfo.bOutOfLives == true) || GRI.IsCanRespawnTime() == false)
    {
        SetAlienModeType(5);
        return;
    }
    ChangeTeam(0);
    SetAlienModeType(0);
    ++GRI.HumanTeamCount;
    //return;    
}

function ClientRoundEnded()
{
    super(Controller).ClientRoundEnded();
    myHUD.ChangeHudType(2);
    //return;    
}

function AddSkill(int iSkillID)
{
    local wSkill Skill;
    local wAlienPlayerReplicationInfo PRI;
    local bool bExistSkill;

    Skill = SkillBase.FindSkill(iSkillID);
    SkillBase.AddSkill(iSkillID, Level.GameMgr);
    AddSkill_Client(iSkillID);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0xDA
    if(((PRI != none) && int(PRI.InfectionLevel) == 0) || Skill == none)
    {
        // End:0xAC
        if(Skill == none)
        {
            Skill = SkillBase.FindSkill(iSkillID);
        }
        // End:0xDA
        if((Skill != none) && Skill.bCoolTimeSkill)
        {
            Skill.ResetSkill();
        }
    }
    //return;    
}

simulated function AddSkill_Client(int iSkillID)
{
    local wSkill Skill;
    local CoolTimeSkillObject CoolTimeSkill;
    local wAlienPlayerReplicationInfo PRI;
    local int Index;

    super.AddSkill_Client(iSkillID);
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    Skill = SkillBase.FindSkill(iSkillID);
    // End:0x66
    if(((Skill != none) && false == Skill.bCoolTimeSkill) || Skill == none)
    {
        return;
    }
    Index = ClientCoolTimeSkillObject(iSkillID);
    // End:0xDC
    if((PRI != none) && int(PRI.InfectionLevel) == 0)
    {
        CoolTimeSkills[Index].fCurActiveTime = 0.0000000;
        CoolTimeSkills[Index].fCurCoolTime = 0.0000000;
        CoolTimeSkills[Index].bIsActive = false;        
    }
    else
    {
        // End:0x13A
        if(Index == -1)
        {
            CoolTimeSkill.fCurActiveTime = 0.0000000;
            CoolTimeSkill.fCurCoolTime = 0.0000000;
            CoolTimeSkill.bIsActive = false;
            CoolTimeSkill.SkillObject = Skill;
            CoolTimeSkills[CoolTimeSkills.Length] = CoolTimeSkill;
        }
    }
    //return;    
}

simulated function RemoveSkill_Client(int iSkillID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x6B [Loop If]
    if(lp1 < CoolTimeSkills.Length)
    {
        // End:0x61
        if((CoolTimeSkills[lp1].SkillObject != none) && CoolTimeSkills[lp1].SkillObject.SkillID == iSkillID)
        {
            CoolTimeSkills.Remove(lp1, 1);
            // [Explicit Break]
            goto J0x6B;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    J0x6B:

    super.RemoveSkill_Client(iSkillID);
    //return;    
}

function bool AddInfectionLevel()
{
    local wGameManager GameMgr;
    local wAlienPlayerReplicationInfo PRI;
    local bool bEvolveAlien;
    local wAMPawn P;
    local int lp1;

    P = wAMPawn(Pawn);
    GameMgr = Level.GameMgr;
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    bEvolveAlien = false;
    PRI.InfectionLevel += PRI.InfectionPoint;
    // End:0xA6
    if(int(PRI.InfectionLevel) > GameMgr.AlienGameParam.5)
    {
        PRI.InfectionLevel = GameMgr.AlienGameParam.5;
    }
    // End:0x102
    if(int(PRI.InfectionLevel) >= GameMgr.AlienGameParam.5)
    {
        // End:0xEF
        if(int(PRI.eObjType) == int(4))
        {
            return bEvolveAlien;
        }
        SetAlienModeType(4);
        bEvolveAlien = true;        
    }
    else
    {
        // End:0x15B
        if(int(PRI.InfectionLevel) >= GameMgr.AlienGameParam.3)
        {
            // End:0x14B
            if(int(PRI.eObjType) == int(3))
            {
                return bEvolveAlien;
            }
            SetAlienModeType(3);
            bEvolveAlien = true;
        }
    }
    return bEvolveAlien;
    //return;    
}

function byte GetInfectionLevel()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    return PRI.InfectionLevel;
    //return;    
}

function Possess(Pawn aPawn)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    super.Possess(aPawn);
    clog((("Possess " $ PlayerReplicationInfo.PlayerName) $ " ") $ string(PRI.eObjType));
    wAMPawn(aPawn).eAMPawnType = PRI.eObjType;
    UpdateHPValue(PRI.bySkinID, PRI.eObjType);
    //return;    
}

simulated function ClientOnEndWaitingForStart()
{
    super(PlayerController).ClientOnEndWaitingForStart();
    // End:0x7F
    if(myHUD != none)
    {
        // End:0x7F
        if(!(int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
        {
            wHUD_Alien(myHUD).UpdateModeItemSlot_Human();
            wHUD_Alien(myHUD).UpdateModeEquippedItem();
            myHUD.ChangeHudType(wHUD_Alien(myHUD).0);
        }
    }
    //return;    
}

event ClientReset()
{
    local Actor A;

    Log("[AlienLog] ClientReset");
    super(PlayerController).ClientReset();
    clog("[AlienLog] ClientReset");
    // End:0x8C
    foreach AllActors(Class'Engine.Actor', A)
    {
        // End:0x8B
        if(!A.IsA('Controller') && !A.IsA('LevelInfo'))
        {
            A.Reset();
        }        
    }    
    //return;    
}

exec function PawnItemList()
{
    local Pawn A;
    local int i;

    clog("PawnItemList Start");
    // End:0x85
    foreach DynamicActors(Class'Engine.Pawn', A)
    {
        clog((("Pawn name : " $ A.PlayerReplicationInfo.PlayerName) $ " BodyItem : ") $ string(A.PlayerReplicationInfo.aiBodyItemID[0]));        
    }    
    clog("PawnItemList End");
    //return;    
}

function SetAlienModeType(wGameManager.EAlienModeType eType)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    PRI.eObjType = eType;
    UpdateHPValue(PRI.bySkinID, PRI.eObjType);
    //return;    
}

function UpdateHPValue(byte bySkinID, wGameManager.EAlienModeType eObjType)
{
    local wAMPawn P;
    local wGameManager GameMgr;
    local wAlienGameReplicationInfo GRI;

    Log("[wAlienController::UpdateHPValue] eObjType : " $ string(eObjType));
    P = wAMPawn(Pawn);
    // End:0x11B
    if(P != none)
    {
        GameMgr = Level.GameMgr;
        GRI = wAlienGameReplicationInfo(GameReplicationInfo);
        switch(eObjType)
        {
            // End:0x85
            case 2:
            // End:0x8A
            case 3:
            // End:0xE5
            case 4:
                P.Health = GameMgr.GetStartAlienHP(eObjType, int(bySkinID), GRI.GetStartPlayerCountOfCurRound());
                P.PlayerReplicationInfo.IsCriticalState = false;
                // End:0xFC
                break;
            // End:0xFFFF
            default:
                P.Health = 100;
                // End:0xFC
                break;
                break;
        }
        P.HealthMax = float(P.Health);
    }
    //return;    
}

function ChangeTeam(int N)
{
    local TeamInfo OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    Level.Game.ChangeTeam(self, N, true);
    //return;    
}

function UnPossess()
{
    local Vector vEmpty;

    // End:0x4D
    if((Pawn != none) && vEmpty != Pawn.Location)
    {
        vDeadLocation = Pawn.Location;
        rDeadRotation = Pawn.Rotation;
    }
    super(PlayerController).UnPossess();
    //return;    
}

function wGameManager.EAlienModeType GetObjType()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    return PRI.eObjType;
    //return;    
}

function float GetHitGunKick(wWeaponBaseParams WBP)
{
    return 0.0000000;
    //return;    
}

function UpdateHitMoveEffectFromWeapon(wWeaponBaseParams WBP)
{
    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    hit_gun_move_speed = GameMgr.AlienGameParam.fAlien_Hit_Move_Speed;
    hit_gun_move_time = GameMgr.AlienGameParam.fAlien_Hit_Move_Time;
    hit_gun_move_delay = GameMgr.AlienGameParam.fAlien_Hit_Delay_Time;
    //return;    
}

function bool ServerUse()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x37
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        return super(PlayerController).ServerUse();
    }
    return false;
    //return;    
}

function CallCoolTimeSkill(int iSkillID)
{
    local wSkill SkillObject;

    SkillObject = SkillBase.FindSkill(iSkillID);
    // End:0x6F
    if(SkillObject != none)
    {
        // End:0x6F
        if(SkillObject.IsA('wSkill_QuickLifeRepair'))
        {
            // End:0x6F
            if(PlayerReplicationInfo != none)
            {
                wAlienGameInfo(Level.Game).ProcessQuickRepairByAlien(PlayerReplicationInfo.PlayerID);
            }
        }
    }
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local wGameManager GameMgr;
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    GameMgr = Level.GameMgr;
    super.NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    // End:0x55
    if(instigatedBy == none)
    {
        return;
    }
    vKnockBackDir = Pawn.Location - instigatedBy.Location;
    vKnockBackDir = Normal(vKnockBackDir);
    // End:0x16B
    if((Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType) == true) && !IsInState('PlayerKnockBack'))
    {
        fKnockBackTime = GameMgr.AlienGameParam.AlienKnockBack_Time;
        // End:0x132
        if(int(GameMgr.AlienGameParam.AlienKnockBack_UseDamage) == 1)
        {
            fKnockBackMomentum = (GameMgr.AlienGameParam.AlienKnockBack_Momentum * float(Damage)) * wAMPawn(Pawn).fKnockRatio;            
        }
        else
        {
            fKnockBackMomentum = GameMgr.AlienGameParam.AlienKnockBack_Momentum * wAMPawn(Pawn).fKnockRatio;
        }
        GotoState('PlayerKnockBack');
    }
    //return;    
}

simulated function ClientChangeKnockBackState(Vector _vKnockBackDir, float _fKnockBackTime, float _fKnockBackMomentum)
{
    fKnockBackTime = _fKnockBackTime;
    fKnockBackMomentum = _fKnockBackMomentum;
    vKnockBackDir = _vKnockBackDir;
    GotoState('PlayerKnockBack');
    //return;    
}

function SelectRadioMessage(int iKey)
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x35
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        return;        
    }
    else
    {
        super(PlayerController).SelectRadioMessage(iKey);
    }
    //return;    
}

function OnEndRound()
{
    local int lp1;

    super(Controller).OnEndRound();
    lp1 = 0;
    J0x0D:

    // End:0x50 [Loop If]
    if(lp1 < SkillBase.Skills.Length)
    {
        SkillBase.Skills[lp1].bUpdateProcess = false;
        ++lp1;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ServerSetBase()
{
    clog("ServerSetBase Name=" $ Pawn.PlayerReplicationInfo.PlayerName);
    Pawn.SetBase(none);
    Pawn.SetPhysics(2);
    //return;    
}

function ServerChangePawn(byte bySkinID)
{
    wAlienPlayerReplicationInfo(PlayerReplicationInfo).bySkinID = bySkinID;
    wAlienGameInfo(Level.Game).ChangePawn(self);
    UpdateHPValue(bySkinID, wAlienPlayerReplicationInfo(PlayerReplicationInfo).eObjType);
    //return;    
}

event PlayerTick(float DeltaTime)
{
    local wAMPawn BaseAMPawn;
    local Vector vTempLength;
    local bool bTryFalling;
    local int lp1;

    super.PlayerTick(DeltaTime);
    // End:0x2E9
    if(((self.Pawn != none) && int(Pawn.Physics) != int(2)) && self.Pawn.Base != none)
    {
        BaseAMPawn = wAMPawn(Pawn.Base);
        // End:0x2E9
        if(BaseAMPawn != none)
        {
            vTempLength = BaseAMPawn.Location - Pawn.Location;
            // End:0x12F
            if(Abs(vTempLength.Z) > ((Pawn.CollisionHeight + BaseAMPawn.CollisionHeight) * 1.2000000))
            {
                clog((("TryFalling Height" $ string(Abs(vTempLength.Z))) $ "  ") $ string((Pawn.CollisionHeight + BaseAMPawn.CollisionHeight) * 1.2000000));
                bTryFalling = true;
            }
            // End:0x1D7
            if(bTryFalling == false)
            {
                vTempLength.Z = 0.0000000;
                // End:0x1D7
                if(VSize(vTempLength) > ((Pawn.CollisionRadius + BaseAMPawn.CollisionRadius) * 1.2000000))
                {
                    clog((("TryFalling Radius" $ string(VSize(vTempLength))) $ "  ") $ string((Pawn.CollisionRadius + BaseAMPawn.CollisionRadius) * 1.2000000));
                    bTryFalling = true;
                }
            }
            // End:0x2E9
            if(bTryFalling)
            {
                Log((("Base : " $ string(BaseAMPawn.Location)) $ " self : ") $ string(Pawn.Location));
                Log((((((("Base H=" $ string(BaseAMPawn.CollisionHeight)) $ " R=") $ string(BaseAMPawn.CollisionRadius)) $ " Self H=") $ string(Pawn.CollisionHeight)) $ " R=") $ string(Pawn.CollisionRadius));
                // End:0x2A1
                if(int(Role) < int(ROLE_Authority))
                {
                    ServerSetBase();                    
                }
                else
                {
                    Log("TryFalling Name=" $ Pawn.PlayerReplicationInfo.PlayerName);
                    Pawn.SetBase(none);
                }
                Pawn.SetPhysics(2);
            }
        }
    }
    // End:0x412
    if(CoolTimeSkills.Length > 0)
    {
        lp1 = 0;
        J0x2FC:

        // End:0x412 [Loop If]
        if(lp1 < CoolTimeSkills.Length)
        {
            // End:0x397
            if(CoolTimeSkills[lp1].bIsActive == false)
            {
                CoolTimeSkills[lp1].fCurCoolTime += DeltaTime;
                // End:0x394
                if(CoolTimeSkills[lp1].SkillObject.GetMaxCoolTime() < CoolTimeSkills[lp1].fCurCoolTime)
                {
                    CoolTimeSkills[lp1].fCurCoolTime = CoolTimeSkills[lp1].SkillObject.GetMaxCoolTime();
                }
                // [Explicit Continue]
                goto J0x408;
            }
            CoolTimeSkills[lp1].fCurActiveTime += DeltaTime;
            // End:0x408
            if(CoolTimeSkills[lp1].SkillObject.GetMaxActiveTime() < CoolTimeSkills[lp1].fCurActiveTime)
            {
                CoolTimeSkills[lp1].fCurActiveTime = CoolTimeSkills[lp1].SkillObject.GetMaxActiveTime();
            }
            J0x408:

            ++lp1;
            // [Loop Continue]
            goto J0x2FC;
        }
    }
    //return;    
}

simulated function ClientUpdate3rdModel(int PlayerID, wGameManager.EAlienModeType eType, byte bySkinID)
{
    local wAMPawn P;
    local wAlienPlayerReplicationInfo PRI;

    // End:0x79
    foreach DynamicActors(Class'WMission_Decompressed.wAMPawn', P)
    {
        PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
        // End:0x78
        if(PRI.PlayerID == PlayerID)
        {
            PRI.bySkinID = bySkinID;
            P.ChangeModelType(eType);
            P.ChangeModel();
        }        
    }    
    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0xE2
    if((PRI.PlayerID == PlayerID) && Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        wHUD_Alien(myHUD).byShowRadioMessage = 0;
        bToggleRadioMessage = false;
    }
    //return;    
}

simulated function ClientUpdateLevelup(byte byAttackLevelIndex)
{
    local wAMPawn P;
    local wAlienPlayerReplicationInfo PRI;
    local wAlienGameReplicationInfo GRI;

    GRI = wAlienGameReplicationInfo(GameReplicationInfo);
    // End:0x31
    if(GRI != none)
    {
        GRI.iPrevAlienAttackIndex = int(byAttackLevelIndex);
    }
    // End:0x8F
    foreach DynamicActors(Class'WMission_Decompressed.wAMPawn', P)
    {
        PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
        // End:0x8E
        if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
        {
            P.MakeAttackLevelEffect(byAttackLevelIndex);
        }        
    }    
    //return;    
}

simulated function ClientUpdateDefSuccessFromInfection(int PlayerID)
{
    local wAMPawn P;
    local wAlienPlayerReplicationInfo PRI;

    // End:0x51
    foreach DynamicActors(Class'WMission_Decompressed.wAMPawn', P)
    {
        PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
        // End:0x50
        if(PRI.PlayerID == PlayerID)
        {
            P.MakeDefecneSuccessEffect();
        }        
    }    
    //return;    
}

simulated function ClientQuickRepairByAlien(int PlayerID)
{
    local wAMPawn P;
    local wAlienPlayerReplicationInfo PRI;

    // End:0x51
    foreach DynamicActors(Class'WMission_Decompressed.wAMPawn', P)
    {
        PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
        // End:0x50
        if(PRI.PlayerID == PlayerID)
        {
            P.MakeDefecneSuccessEffect();
        }        
    }    
    //return;    
}

simulated function ClientChangeTeam(byte InvertSideID)
{
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0xAB
    if(MM != none)
    {
        Log((("[wAlienController::ClientChangeTeam] name : " $ PlayerReplicationInfo.PlayerName) $ " TeamIndex : ") $ string(PlayerReplicationInfo.Team.TeamIndex));
        MM.kTcpChannel.sfReqChangeTeam(int(InvertSideID));
    }
    // End:0xE9
    if(myHUD != none)
    {
        myHUD.ChangeHudType(wHUD_Alien(myHUD).1);
        wHUD_Alien(myHUD).UpdateModeItemSlot_Alien();
    }
    //return;    
}

function AttackedView(int iWeaponID, float fHitGunKick, Vector vAttacked)
{
    wAttackedState = 0;
    //return;    
}

function ProcessUseKey()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(PlayerReplicationInfo);
    // End:0x39
    if(Class'Engine.wGameManager'.static.IsHumanTeamType(PRI.eObjType))
    {
        super.ProcessUseKey();        
    }
    else
    {
        // End:0x89
        if((int(bUseKey) == 1) && int(byOldUseKey) == 0)
        {
            Pawn.ServerSetUseKeyState(bUseKey);
            // End:0x86
            if(CoolTimeSkills.Length > 0)
            {
                myHUD.CallSkill(7);
            }            
        }
        else
        {
            // End:0xB9
            if((int(byOldUseKey) == 1) && int(bUseKey) == 0)
            {
                Pawn.ServerSetUseKeyState(bUseKey);
            }
        }
        byOldUseKey = bUseKey;
    }
    //return;    
}

simulated function ClientReadyCoolTimeSkill(int iSkillID)
{
    // End:0x93
    if(myHUD != none)
    {
        wHUD_Alien(myHUD).bEnableSlot5 = true;
        wHUD_Alien(myHUD).ActiveUsingSkill.iState = 2;
        wHUD_Alien(myHUD).ChangeWeaponSlot5Hud(none);
        wHUD_Alien(myHUD).ActiveUsingSkill.bDrawed = false;
        wHUD_Alien(myHUD).ActiveUsingSkill.fActiveTime = Level.TimeSeconds;
    }
    //return;    
}

simulated function ClientCallCoolTimeSkill(int iSkillID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x116 [Loop If]
    if(lp1 < CoolTimeSkills.Length)
    {
        // End:0x10C
        if(CoolTimeSkills[lp1].SkillObject.SkillID == iSkillID)
        {
            CoolTimeSkills[lp1].bIsActive = !CoolTimeSkills[lp1].bIsActive;
            // End:0x8C
            if(CoolTimeSkills[lp1].bIsActive)
            {
                CoolTimeSkills[lp1].fCurCoolTime = 0.0000000;                
            }
            else
            {
                CoolTimeSkills[lp1].fCurActiveTime = 0.0000000;
                // End:0x109
                if(wHUD_Alien(myHUD).ActiveUsingSkill.iSkillID == iSkillID)
                {
                    wHUD_Alien(myHUD).bEnableSlot5 = false;
                    wHUD_Alien(myHUD).ActiveUsingSkill.iState = 1;
                    wHUD_Alien(myHUD).ChangeWeaponSlot5Hud(none);
                }
            }
            // [Explicit Break]
            goto J0x116;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    J0x116:

    //return;    
}

simulated function int ClientCoolTimeSkillObject(int iSkillID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(lp1 < CoolTimeSkills.Length)
    {
        // End:0x58
        if((CoolTimeSkills[lp1].SkillObject != none) && CoolTimeSkills[lp1].SkillObject.SkillID == iSkillID)
        {
            return lp1;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

exec function ConsoleTakeHit()
{
    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    vKnockBackDir = Vector(Pawn.Rotation);
    // End:0x71
    if(!IsInState('PlayerKnockBack'))
    {
        fKnockBackTime = GameMgr.AlienGameParam.AlienKnockBack_Time;
        fKnockBackMomentum = GameMgr.AlienGameParam.AlienKnockBack_Momentum;
    }
    GotoState('PlayerKnockBack');
    //return;    
}

simulated event ReceiveMessage_QuestType1(Class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    //return;    
}

simulated event ReceiveMessage_QuestType2(Class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    //return;    
}

simulated event ReceiveMessage_QuestType3(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    //return;    
}

simulated event ReceiveMessage_QuestType4(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound)
{
    //return;    
}

state Spectating
{
    function BeginState()
    {
        super.BeginState();
        // End:0x35
        if(myHUD != none)
        {
            wHUD_Alien(myHUD).ChangeHudType(wHUD_Alien(myHUD).2);
        }
        //return;        
    }
    stop;    
}

state PlayerWalking
{
    function BeginState()
    {
        local bool bTempCrouch, bTempProne;

        bTempCrouch = Pawn.bWantsToCrouch;
        bTempProne = Pawn.bWantsToProne;
        super.BeginState();
        Pawn.ShouldCrouch(bTempCrouch);
        Pawn.ShouldProne(bTempProne);
        //return;        
    }

    function EndState()
    {
        local int bTempGotoProne, byTempGoCrouch, byTempGoProne;

        bTempGotoProne = int(bGotoProne);
        byTempGoCrouch = int(byGoCrouch);
        byTempGoProne = int(byGoProne);
        super.EndState();
        PreviousStateName = "PlayerKnockBack";
        bGotoProne = byte(bTempGotoProne);
        byGoCrouch = byte(byTempGoCrouch);
        byGoProne = byte(byTempGoProne);
        //return;        
    }
    stop;    
}

state PlayerKnockBack extends PlayerWalking
{
    function TickStance(float DeltaTime)
    {
        super(Controller).TickStance(DeltaTime);
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local bool OldCrouch, OldProne;

        Pawn.Acceleration = vKnockBackDir * fKnockBackMomentum;
        // End:0x39
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
        Pawn.SetViewPitch(Rotation.Pitch);
        // End:0x112
        if(int(Pawn.Physics) != int(2))
        {
            OldCrouch = Pawn.bWantsToCrouch;
            OldProne = Pawn.bWantsToProne;
            // End:0xB7
            if(int(bProne) == 1)
            {
                Pawn.ShouldProne(true);                
            }
            else
            {
                // End:0xF6
                if(int(bDuck) == 1)
                {
                    // End:0xE3
                    if(OldProne == true)
                    {
                        Pawn.ShouldProne(false);                        
                    }
                    else
                    {
                        Pawn.ShouldCrouch(true);
                    }                    
                }
                else
                {
                    // End:0x112
                    if(OldCrouch == true)
                    {
                        Pawn.ShouldCrouch(false);
                    }
                }
            }
        }
        //return;        
    }

    function BeginState()
    {
        //return;        
    }

    function EndState()
    {
        PreviousStateName = "PlayerKnockBack";
        //return;        
    }

    function Timer()
    {
        GotoState(Pawn.LandMovementState);
        //return;        
    }
Begin:

    SetTimer(fKnockBackTime, false);
    stop;            
}

defaultproperties
{
    wAttackedAimRatio=0.0000000
    wAttackedCameraRatioF=0.0000000
    wAttackedCameraRatioS=0.0000000
    PawnClass=Class'WMission_Decompressed.wAMPawn'
}