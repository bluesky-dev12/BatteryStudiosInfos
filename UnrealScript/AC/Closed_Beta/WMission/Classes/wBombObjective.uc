class wBombObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var wGameObject_Bomb myFlag;
var Class<wGameObject_Bomb> FlagType;
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
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;        
    }
    else
    {
        bActive = true;
    }
    super.PreBeginPlay();
    //return;    
}

function SetActive(bool bActiveStatus)
{
    local Actor aBomb;

    // End:0x0E
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
    // End:0xEF
    if(myFlag == none)
    {
        // End:0xEA
        if(bActive)
        {
            Warn((((string(self) $ " could not spawn flag of type '") $ string(FlagType)) $ "' at ") $ string(Location));
        }
        return;        
    }
    else
    {
        myFlag.HomeBase = self;
        wMSGameReplicationInfo(Level.Game.GameReplicationInfo).GameObject = myFlag;
    }
    //return;    
}

function bool BotNearObjective(Bot B)
{
    // End:0x27
    if((!IsActive() || myFlag == none) || B == none)
    {
        return false;
    }
    // End:0x6A
    if(((MyBaseVolume != none) && myFlag.bHome) && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    return (VSize(myFlag.Position().Location - B.Pawn.Location) < float(2000)) && B.LineOfSightTo(myFlag.Position());
    //return;    
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x45
    if(((!IsActive() || myFlag == none) || !myFlag.bHome) || int(RequesterTeamNum) == int(DesiredTeamNum))
    {
        return false;
    }
    return true;
    //return;    
}

function Reset()
{
    // End:0x3A
    if(myFlag != none)
    {
        // End:0x2E
        if(myFlag.Holder != none)
        {
            myFlag.ClearHolder();
        }
        myFlag.Destroy();
    }
    super.Reset();
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    local string SoundPackageName;

    super.PrecacheAnnouncer(V, bRewardSounds);
    // End:0x88
    if(Announcer_EnergyCore_Dropped != default.Announcer_EnergyCore_Dropped)
    {
        SoundPackageName = Class'Engine.wGameManager'.default.VoicePackageName;
        // End:0x57
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;            
        }
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_Dropped);
    }
    // End:0xFF
    if(Announcer_EnergyCore_Reset != default.Announcer_EnergyCore_Reset)
    {
        SoundPackageName = Class'Engine.wGameManager'.default.VoicePackageName;
        // End:0xCE
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;            
        }
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_PickedUp);
    }
    // End:0x176
    if(Announcer_EnergyCore_Reset != default.Announcer_EnergyCore_Reset)
    {
        SoundPackageName = Class'Engine.wGameManager'.default.VoicePackageName;
        // End:0x145
        if(SoundPackageName != "")
        {
            V.AlternateFallbackSoundPackage = SoundPackageName;            
        }
        else
        {
            V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
        }
        V.PrecacheSound(Announcer_EnergyCore_Reset);
    }
    //return;    
}

defaultproperties
{
    FlagType=Class'WMission_Decompressed.wGameObject_Bomb'
    FlagMesh=StaticMesh'WPS_GR.Demolition Pack.DemolitionPack'
    PlayerDroppedMessage=" dropped the bomb."
    DroppedMessage="The bomb was dropped."
    EnergyCorePickedUp="You picked up the bomb."
    PlayerPickedUpEnergyCore=" picked up the bomb."
    PlayerCoreReset="The position of the bomb was reset."
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
    bStatic=false
    bAlwaysRelevant=true
    DrawScale=3.0000000
    bUnlit=true
    CollisionRadius=60.0000000
    CollisionHeight=60.0000000
    bCollideActors=true
    bUseCylinderCollision=true
}