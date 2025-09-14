class wTelegraphPack_Install extends wTelegraphPack;

const CHECK_TIME_ENABLE_INSTALL = 0.1;
const SENTRYGUN_SPAWN_DISTANCE = 80.0f;

var name m_naAnim_PutDown;
var string m_FmodSound_Putdown_Plant;
var string m_FmodSound_Putdown_Defuse;
var bool m_bPlayedPutdownSound;
var float m_fElpasedCheckEnableInstall;
var Vector m_v3OldinstigatorLocation;
var Rotator m_rotOldinstigatorRotation;
var Vector m_v3SpawnNormal;
var int m_iUpSide;
var bool m_bDisplayedEnableInstallMessage;
var bool m_bDisplayingInstallMessage;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        InstallPack;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientChangePrevWeapon;
}

simulated function bool UseWeapon()
{
    InstallPack();
    return true;
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.RemoveSupplyItem(4);
    Destroy();
    //return;    
}

simulated event Tick(float Delta)
{
    local bool bOldEnableSentryGunInstall;

    super(Actor).Tick(Delta);
    // End:0x3D
    if((none != Instigator) && Instigator.Weapon != self)
    {
        // End:0x3B
        if(m_bDisplayingInstallMessage)
        {
            PutDown();
        }
        return;
    }
    m_fElpasedCheckEnableInstall += Delta;
    // End:0x5A
    if(0.1000000 > m_fElpasedCheckEnableInstall)
    {
        return;
    }
    m_fElpasedCheckEnableInstall = 0.0000000;
    // End:0x99
    if((m_v3OldinstigatorLocation == Instigator.Location) && m_rotOldinstigatorRotation == Instigator.Rotation)
    {
        return;
    }
    m_v3OldinstigatorLocation = Instigator.Location;
    m_rotOldinstigatorRotation = Instigator.Rotation;
    bOldEnableSentryGunInstall = Instigator.bEnableSentryGunInstall;
    Instigator.bUseCollisionStaticMesh = true;
    Instigator.bEnableSentryGunInstall = Instigator.EnablePositionSentryGunInstall(m_v3SpawnNormal, m_iUpSide);
    Instigator.bUseCollisionStaticMesh = false;
    // End:0x138
    if(self != Instigator.Weapon)
    {
        return;
    }
    // End:0x188
    if((int(ClientState) != int(5)) && int(ClientState) != int(6))
    {
        // End:0x188
        if((false == m_bDisplayedEnableInstallMessage) || bOldEnableSentryGunInstall != Instigator.bEnableSentryGunInstall)
        {
            DisplayEnableInstallMessage();
        }
    }
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    super(wWeapon).BringUp(PrevWeapon);
    m_bPlayedPutdownSound = false;
    switch(BaseParams.eType)
    {
        // End:0x43
        case 19:
            wWeaponFireInstallPack(FireMode[0]).byFirstTick = 0;
            // End:0x46
            break;
        // End:0xFFFF
        default:
            break;
    }
    DisplayEnableInstallMessage();
    FmodPlaySound("Warfare_Sound_Weapon/SP/SentryGun/select");
    //return;    
}

function bool DisplayEnableInstallMessage()
{
    m_bDisplayedEnableInstallMessage = true;
    m_bDisplayingInstallMessage = true;
    // End:0x85
    if(Instigator.bEnableSentryGunInstall)
    {
        PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DisableInstallSentryGun);
        PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnableInstallSentryGun);        
    }
    else
    {
        PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnableInstallSentryGun);
        PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DisableInstallSentryGun);
    }
    //return;    
}

simulated function bool IsCanUseWeapon()
{
    // End:0x17
    if(false == Instigator.bEnableSentryGunInstall)
    {
        return false;
    }
    return Instigator.Controller.CanUseActivateSupplyItem(Instigator.Controller, 4, true);
    //return;    
}

simulated function bool PutDown()
{
    PutDownAnim = m_naAnim_PutDown;
    PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnableInstallSentryGun);
    PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DisableInstallSentryGun);
    m_bDisplayingInstallMessage = false;
    // End:0x81
    if(super(wWeapon).PutDown() == false)
    {
        return false;
    }
    Instigator.FmodPlaySoundUseID(m_FmodSound_Putdown_Defuse, 3, FireMode[0].FireAnimRate,, false, false, -1);
    m_bPlayedPutdownSound = true;
    return true;
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x2E
    if(m_naAnim_Plant == Anim)
    {
        UseWeapon();        
    }
    else
    {
        // End:0x60
        if(m_naAnim_StopPlant == Anim)
        {
            ClientState = 4;
            wWeaponFireInstallPack(FireMode[0]).byFirstTick = 0;            
        }
        else
        {
            super.AnimEnd(Channel);
        }
    }
    //return;    
}

simulated function PlayPlantAnimation()
{
    // End:0x39
    if(HasAnim(m_naAnim_Plant))
    {
        PlayAnim(m_naAnim_Plant);
        Instigator.FmodPlaySound(m_FmodSound_Putdown_Plant, 3, FireMode[0].FireAnimRate);
    }
    ClientState = 5;
    //return;    
}

simulated function StopPlantAnimation()
{
    // End:0x13
    if(HasAnim(m_naAnim_StopPlant))
    {
        PlayAnim(m_naAnim_StopPlant);
    }
    ClientState = 6;
    //return;    
}

simulated function ClientChangePrevWeapon()
{
    ChangePrevWeapon();
    //return;    
}

function InstallPack()
{
    local DeathMatch DeathMatch;
    local Pawn Pawn;
    local Vector v3RegenLocation;
    local string strNPCID;
    local int iTeamID;
    local Rotator rotSpawnRotation;
    local float fSpawnPitch;
    local wMatchMaker MatchMaker;

    // End:0x42
    if(false == Instigator.Controller.CanUseActivateSupplyItem(Instigator.Controller, 4, true))
    {
        FireMode[0].StopFiring();
        return;
    }
    // End:0x83
    if(false == Instigator.Controller.ActivateSupplyItem(Instigator.Controller, 4))
    {
        FireMode[0].StopFiring();
        return;
    }
    Pawn = Pawn(Owner);
    DeathMatch = DeathMatch(Pawn.Level.Game);
    v3RegenLocation = Pawn.Location + (Normal(Vector(Pawn.Rotation)) * 80.0000000);
    // End:0x147
    if(int(19) == int(BaseParams.eType))
    {
        // End:0x13D
        if("WMission.wNDFGameInfo" == Level.GRI.GameClass)
        {
            strNPCID = string(201);            
        }
        else
        {
            strNPCID = string(200);
        }
    }
    // End:0x19F
    if(none != Instigator.Controller.PlayerReplicationInfo.Team)
    {
        iTeamID = Instigator.Controller.PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamID = Instigator.Controller.PlayerReplicationInfo.TeamID;
    }
    rotSpawnRotation = Rotator(m_v3SpawnNormal);
    rotSpawnRotation.Pitch = rotSpawnRotation.Pitch & 65535;
    // End:0x215
    if(0 < m_iUpSide)
    {
        fSpawnPitch = 16383.0000000 - float(rotSpawnRotation.Pitch);        
    }
    else
    {
        fSpawnPitch = float(rotSpawnRotation.Pitch - 16383);
    }
    DeathMatch.AddwAIBot("1", string(iTeamID), "WGame.wAISentryGunController", "0", strNPCID,, Pawn.Controller, true, v3RegenLocation, fSpawnPitch, true);
    wPawn(Instigator).ResetPhysicsBasedAnim();
    wPawn(Instigator).ClientResetPhysicsBasedAnim();
    PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_EnableInstallSentryGun);
    PlayerController(Instigator.Controller).RemoveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DisableInstallSentryGun);
    m_bDisplayingInstallMessage = false;
    ClientChangePrevWeapon();
    ServerDestroy();
    //return;    
}

defaultproperties
{
    m_naAnim_PutDown="PutDown"
    m_FmodSound_Putdown_Plant="Warfare_Sound_Weapon/SP/SentryGun/install"
    m_naAnim_Plant="plant"
    m_naAnim_StopPlant="PlantStop"
    SelectNewAnim="Select"
    InventoryGroup=6
}