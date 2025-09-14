/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wBombObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:6
 *
 *******************************************************************************/
class wBombObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var wGameObject_Bomb myFlag;
var class<wGameObject_Bomb> FlagType;
var() StaticMesh FlagMesh;
var() localized string PlayerDroppedMessage;
var() localized string DroppedMessage;
var() localized string EnergyCorePickedUp;
var() localized string PlayerPickedUpEnergyCore;
var() localized string PlayerCoreReset;
var() string Announcer_EnergyCore_Dropped;
var() string Announcer_EnergyCore_PickedUp;
var() string Announcer_EnergyCore_Reset;

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x55
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;
    }
    // End:0x5d
    else
    {
        bActive = true;
    }
    super.PreBeginPlay();
}

function SetActive(bool bActiveStatus)
{
    local Actor aBomb;

    // End:0x0e
    if(bCanActive == false)
    {
        return;
    }
    // End:0x87
    if(bActiveStatus && myFlag == none)
    {
        // End:0x48
        foreach DynamicActors(FlagType, aBomb)
        {
            myFlag = wGameObject_Bomb(aBomb);
            // End:0x48
            break;                        
        }
        // End:0x87
        if(myFlag == none)
        {
            myFlag = Spawn(FlagType, self);
            myFlag.SetStaticMesh(FlagMesh);
            myFlag.MySpawnObjective = self;
        }
    }
    super.SetActive(bActiveStatus);
    // End:0xef
    if(myFlag == none)
    {
        // End:0xea
        if(bActive)
        {
            Warn(string(self) $ " could not spawn flag of type '" $ string(FlagType) $ "' at " $ string(Location));
        }
        return;
    }
    // End:0x12a
    else
    {
        myFlag.HomeBase = self;
        wMSGameReplicationInfo(Level.Game.GameReplicationInfo).GameObject = myFlag;
    }
}

function bool BotNearObjective(Bot B)
{
    // End:0x27
    if(!IsActive() || myFlag == none || B == none)
    {
        return false;
    }
    // End:0x6a
    if(MyBaseVolume != none && myFlag.bHome && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    return VSize(myFlag.Position().Location - B.Pawn.Location) < float(2000) && B.LineOfSightTo(myFlag.Position());
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x45
    if(!IsActive() || myFlag == none || !myFlag.bHome || RequesterTeamNum == DesiredTeamNum)
    {
        return false;
    }
    return true;
}

function Reset()
{
    // End:0x3a
    if(myFlag != none)
    {
        // End:0x2e
        if(myFlag.Holder != none)
        {
            myFlag.ClearHolder();
        }
        myFlag.Destroy();
    }
    super.Reset();
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    local string SoundPackageName;

    super.PrecacheAnnouncer(V, bRewardSounds);
    // End:0x88
    if(Announcer_EnergyCore_Dropped != default.Announcer_EnergyCore_Dropped)
    {
        SoundPackageName = class'wGameManager'.default.VoicePackageName;
        // End:0x57
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;
        }
        // End:0x74
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_Dropped);
    }
    // End:0xff
    if(Announcer_EnergyCore_Reset != default.Announcer_EnergyCore_Reset)
    {
        SoundPackageName = class'wGameManager'.default.VoicePackageName;
        // End:0xce
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;
        }
        // End:0xeb
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_PickedUp);
    }
    // End:0x176
    if(Announcer_EnergyCore_Reset != default.Announcer_EnergyCore_Reset)
    {
        SoundPackageName = class'wGameManager'.default.VoicePackageName;
        // End:0x145
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;
        }
        // End:0x162
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_Reset);
    }
}

defaultproperties
{
    FlagType=class'wGameObject_Bomb'
    FlagMesh=StaticMesh'WPS_GR.Demolition Pack.DemolitionPack'
    PlayerDroppedMessage=" dropped the bomb."
    DroppedMessage="The bomb has been dropped."
    EnergyCorePickedUp="You picked up the bomb."
    PlayerPickedUpEnergyCore=" picked up the bomb."
    PlayerCoreReset="The position of the bomb has been reset."
    Announcer_EnergyCore_PickedUp=".Mode_SD.v_sd_bomb_get_team_R"
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    DefenderTeamIndex=1
    DefensePriority=100
    ObjectiveName="Bomb Spawn"
    DestructionMessage=""
    Announcer_ObjectiveInfo="v_sd_destroy_R"
    Announcer_DefendObjective="v_sd_guard_R"
    ApplyGameInfo="wMission.wSDGameInfo"
    bNotBased=true
    DrawType=8
    StaticMesh=StaticMesh'WPS_GR.Demolition Pack.DemolitionPack'
    bStatic=true
    bAlwaysRelevant=true
    DrawScale=3.0
    bUnlit=true
    CollisionRadius=60.0
    CollisionHeight=60.0
    bCollideActors=true
    bUseCylinderCollision=true
}