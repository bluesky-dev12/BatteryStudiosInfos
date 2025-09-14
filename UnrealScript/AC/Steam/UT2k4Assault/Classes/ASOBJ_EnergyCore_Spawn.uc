/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASOBJ_EnergyCore_Spawn.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:7
 *
 *******************************************************************************/
class ASOBJ_EnergyCore_Spawn extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Sound TakenSound;
var GameObject_EnergyCore myFlag;
var class<GameObject_EnergyCore> FlagType;
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
}

function SpawnFlag()
{
    Spawn(class'wBombBase', self,, Location - vect(0.0, 0.0, 60.0), Rotation);
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
    // End:0xb1
    if(myFlag == none)
    {
        // End:0xac
        if(bActive)
        {
            Warn(string(self) $ " could not spawn flag of type '" $ string(FlagType) $ "' at " $ string(Location));
        }
        return;
    }
    // End:0xec
    else
    {
        myFlag.HomeBase = self;
        ASGameReplicationInfo(Level.Game.GameReplicationInfo).GameObject = myFlag;
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
    SpawnFlag();
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
    FlagType=class'GameObject_EnergyCore'
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
    LightBrightness=128.0
    LightRadius=6.0
    DrawType=8
    bStatic=true
    bAlwaysRelevant=true
    DrawScale=3.0
    bUnlit=true
    CollisionRadius=60.0
    CollisionHeight=60.0
    bCollideActors=true
    bUseCylinderCollision=true
}