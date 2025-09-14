class ASOBJ_EnergyCore_Spawn extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var GameObject_EnergyCore myFlag;
var Class<GameObject_EnergyCore> FlagType;
var() StaticMesh FlagMesh;
var() localized string PlayerDroppedMessage;
var() localized string DroppedMessage;
var() localized string EnergyCorePickedUp;
var() localized string PlayerPickedUpEnergyCore;
var() localized string PlayerCoreReset;
var() string Announcer_EnergyCore_Dropped;
var() string Announcer_EnergyCore_PickedUp;
var() string Announcer_EnergyCore_Reset;

function BeginPlay()
{
    super(Actor).BeginPlay();
    SpawnFlag();
    //return;    
}

function SpawnFlag()
{
    Spawn(Class'WGame.wBombBase', self,, Location - vect(0.0000000, 0.0000000, 60.0000000), Rotation);
    //return;    
}

function SetActive(bool bActiveStatus)
{
    // End:0x49
    if(bActiveStatus && myFlag == none)
    {
        myFlag = Spawn(FlagType, self);
        myFlag.SetStaticMesh(FlagMesh);
        myFlag.MySpawnObjective = self;
    }
    super.SetActive(bActiveStatus);
    // End:0xB1
    if(myFlag == none)
    {
        // End:0xAC
        if(bActive)
        {
            Warn((((string(self) $ " could not spawn flag of type '") $ string(FlagType)) $ "' at ") $ string(Location));
        }
        return;        
    }
    else
    {
        myFlag.HomeBase = self;
        ASGameReplicationInfo(Level.Game.GameReplicationInfo).GameObject = myFlag;
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
    SpawnFlag();
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
    FlagType=Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'
    PlayerDroppedMessage="????? ??? ??? ???????!"
    DroppedMessage="??? ??? ???????!"
    EnergyCorePickedUp="??? ??? ???????!"
    PlayerPickedUpEnergyCore=" ????? ??? ??? ???????!"
    PlayerCoreReset="??? ??? ??????!"
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    DefenderTeamIndex=1
    ObjectiveName="??? ?? ??"
    bNotBased=true
    LightType=7
    LightEffect=21
    LightHue=37
    LightSaturation=255
    LightBrightness=128.0000000
    LightRadius=6.0000000
    DrawType=8
    bStatic=false
    bAlwaysRelevant=true
    DrawScale=3.0000000
    bUnlit=true
    CollisionRadius=60.0000000
    CollisionHeight=60.0000000
    bCollideActors=true
    bUseCylinderCollision=true
}