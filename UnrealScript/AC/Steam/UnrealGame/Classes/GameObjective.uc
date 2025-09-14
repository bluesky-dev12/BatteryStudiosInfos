/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\GameObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:73
 *	Functions:35
 *
 *******************************************************************************/
class GameObjective extends JumpSpot
    dependson(JumpSpot)
    dependson(UnrealMPGameInfo)
    dependson(SquadAI)
    dependson(UnrealScriptedSequence)
    dependson(AssaultPath)
    hidecategories(Lighting,LightColor,Karma,Force)
    abstract;

struct ScorerRecord
{
    var Controller C;
    var float Pct;
};

var(Assault) float DrawDistThresHold;
var(Assault) bool bUsePriorityOnHUD;
var(Assault) bool bOverrideZoneCheck;
var(Assault) bool bOverrideVisibilityCheck;
var(Assault) bool bReplicateObjective;
var(Assault) bool bAnnounceNextObjective;
var(MothershipHack) bool bMustBoardVehicleFirst;
var(Assault) bool bBotOnlyObjective;
var() bool bInitiallyActive;
var bool bActive;
var() bool bTriggerOnceOnly;
var() bool bOptionalObjective;
var bool bIgnoredObjective;
var bool bDisabled;
var bool bOldDisabled;
var bool bFirstObjective;
var() bool bTeamControlled;
var() bool bAccruePoints;
var bool bHasShootSpots;
var bool bSoundsPrecached;
var bool bIsCritical;
var bool bHighlightPhysicalObjective;
var bool bOldHighlightPhysicalObjective;
var bool bIsBeingAttacked;
var bool bClearInstigator;
var bool bOldCritical;
var(Assault) bool bPlayCriticalAssaultAlarm;
var() byte DefenderTeamIndex;
var byte StartTeam;
var() byte DefensePriority;
var() int Score;
var() name DefenseScriptTags;
var UnrealScriptedSequence DefenseScripts;
var() localized string ObjectiveName;
var() localized string DestructionMessage;
var() localized string LocationPrefix;
var() localized string LocationPostfix;
var localized string ObjectiveStringPrefix;
var localized string ObjectiveStringSuffix;
var GameObjective NextObjective;
var SquadAI DefenseSquad;
var AssaultPath AlternatePaths;
var() name AreaVolumeTag;
var Volume MyBaseVolume;
var() float BaseExitTime;
var() float BaseRadius;
var() float BotDamageScaling;
var() name CriticalObjectiveVolumeTag;
var() Material ObjectiveTypeIcon;
var byte ObjectivePriority;
var float LastDrawTime;
var float DrawTime;
var(Assault) localized string ObjectiveDescription;
var(Assault) localized string Objective_Info_Attacker;
var(Assault) localized string Objective_Info_Defender;
var localized string UseDescription;
var(Assault) string Announcer_DisabledObjective;
var(Assault) string Announcer_ObjectiveInfo;
var(Assault) string Announcer_DefendObjective;
var PlayerReplicationInfo DisabledBy;
var Material HighlightOverlay[2];
var array<Actor> PhysicalObjectiveActors;
var(Assault) name PhysicalObjectiveActorsTag;
var(Assault) name EndCameraTag;
var Actor EndCamera;
var Controller DelayedDamageInstigatorController;
var() name VehiclePathName;
var NavigationPoint VehiclePath;
var int ObjectiveDisabledTime;
var float SavedObjectiveProgress;
var array<ScorerRecord> Scorers;
var string ApplyGameInfo;
var bool bCanActive;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bReplicateObjective && bNetDirty)
        bActive, bDisabled,
        bIsCritical, bHighlightPhysicalObjective,
        DefenderTeamIndex, ObjectiveDisabledTime,
        SavedObjectiveProgress;

}

function float GetDifficulty()
{
    return 0.0;
}

function bool CanDoubleJump(Pawn Other)
{
    return true;
}

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x17
    if(bReplicateObjective)
    {
        bNetNotify = true;
    }
}

simulated function PostBeginPlay()
{
    local GameObjective o, CurrentObjective;
    local AssaultPath A;
    local UnrealScriptedSequence W;
    local Actor ac;
    local NavigationPoint N;

    super.PostBeginPlay();
    // End:0x342
    if(Role == 4)
    {
        // End:0x39
        if(Level.Game == none)
        {
            SetActive(bInitiallyActive);
        }
        // End:0x6f
        else
        {
            // End:0x63
            if(Level.Game.bChangedHost)
            {
                SetActive(bActive);
            }
            // End:0x6f
            else
            {
                SetActive(bInitiallyActive);
            }
        }
        StartTeam = DefenderTeamIndex;
        // End:0xb5
        if(DefenseScriptTags != 'None')
        {
            // End:0xb4
            foreach AllActors(class'UnrealScriptedSequence', DefenseScripts, DefenseScriptTags)
            {
                // End:0xb3
                if(DefenseScripts.bFirstScript)
                {
                }
                // End:0xb4
                else
                {
                    continue;
                }                
            }
        }
        W = DefenseScripts;
        J0xc0:
        // End:0xf3 [While If]
        if(W != none)
        {
            W.bFreelance = false;
            W = W.NextScript;
            // This is an implied JumpToken; Continue!
            goto J0xc0;
        }
        // End:0x154
        if(bFirstObjective)
        {
            CurrentObjective = self;
            // End:0x153
            foreach AllActors(class'GameObjective', o)
            {
                // End:0x152
                if(o != CurrentObjective)
                {
                    CurrentObjective.NextObjective = o;
                    o.bFirstObjective = false;
                    CurrentObjective = o;
                }                                
            }
        }
        // End:0x18d
        foreach AllActors(class'AssaultPath', A)
        {
            // End:0x18c
            if(A.ObjectiveTag == Tag)
            {
                A.AddTo(self);
            }                        
        }
        // End:0x227
        if(CriticalObjectiveVolumeTag != 'None')
        {
            // End:0x226
            foreach AllActors(class'Volume', MyBaseVolume, CriticalObjectiveVolumeTag)
            {
                MyBaseVolume.AssociatedActor = self;
                // End:0x222
                if(!MyBaseVolume.IsA('ASCriticalObjectiveVolume'))
                {
                    Warn("CriticalObjectiveVolumeTag is not a ASCriticalObjectiveVolume actor!!!");
                }
                // End:0x226
                break;                                
            }
        }
        // End:0x24c
        if(MyBaseVolume == none)
        {
            // End:0x24b
            foreach AllActors(class'Volume', MyBaseVolume, AreaVolumeTag)
            {
                // End:0x24b
                break;                                
            }
        }
        // End:0x29c
        if(MyBaseVolume != none && MyBaseVolume.LocationName ~= "unspecified")
        {
            MyBaseVolume.LocationName = LocationPrefix @ GetHumanReadableName() @ LocationPostfix;
        }
        // End:0x2ae
        if(bAccruePoints)
        {
            SetTimer(1.0, true);
        }
        // End:0x2d7
        if(EndCameraTag != 'None')
        {
            // End:0x2d6
            foreach AllActors(class'Actor', EndCamera, EndCameraTag)
            {
                // End:0x2d6
                break;                                
            }
        }
        // End:0x342
        if(VehiclePathName != 'None')
        {
            N = Level.NavigationPointList;
            J0x2fa:
            // End:0x342 [While If]
            if(N != none)
            {
                // End:0x32b
                if(N.Name == VehiclePathName)
                {
                    VehiclePath = N;
                }
                // End:0x342
                else
                {
                    N = N.nextNavigationPoint;
                    // This is an implied JumpToken; Continue!
                    goto J0x2fa;
                }
            }
        }
    }
    // End:0x395
    if(Level.NetMode != 1 && PhysicalObjectiveActorsTag != 'None')
    {
        // End:0x394
        foreach AllActors(class'Actor', ac, PhysicalObjectiveActorsTag)
        {
            PhysicalObjectiveActors[PhysicalObjectiveActors.Length] = ac;                        
        }
    }
}

function ForceBegin()
{
    super(Actor).ForceBegin();
}

simulated function UpdateLocationName()
{
    // End:0x25
    if(MyBaseVolume == none)
    {
        // End:0x24
        foreach AllActors(class'Volume', MyBaseVolume, AreaVolumeTag)
        {
            // End:0x24
            break;                        
        }
    }
    // End:0x75
    if(MyBaseVolume != none && MyBaseVolume.default.LocationName ~= "unspecified")
    {
        MyBaseVolume.LocationName = LocationPrefix @ GetHumanReadableName() @ LocationPostfix;
    }
}

function PlayAlarm();
function bool BotNearObjective(Bot B)
{
    // End:0x9c
    if(NearObjective(B.Pawn) || B.RouteGoal == self && B.RouteDist < float(2500) || B.bWasNearObjective && VSize(Location - B.Pawn.Location) < BaseRadius)
    {
        B.bWasNearObjective = true;
        return true;
    }
    B.bWasNearObjective = false;
    return false;
}

function bool NearObjective(Pawn P)
{
    // End:0x20
    if(MyBaseVolume != none)
    {
        return P.IsInVolume(MyBaseVolume);
    }
    // End:0x58
    if(VSize(Location - P.Location) < BaseRadius && P.LineOfSightTo(self))
    {
        return true;
    }
}

function Timer()
{
    // End:0x7b
    if(DefenderTeamIndex < 2)
    {
        Level.GRI.Teams[DefenderTeamIndex].Score += float(Score);
        Level.Game.TeamScoreEvent(DefenderTeamIndex, float(Score), "game_objective_score");
    }
}

function bool OwnsDefenseScript(UnrealScriptedSequence S)
{
    return DefenseScriptTags == S.Tag;
}

simulated function string GetHumanReadableName()
{
    // End:0x12
    if(ObjectiveName != "")
    {
        return ObjectiveName;
    }
    // End:0x24
    if(default.ObjectiveName != "")
    {
        return default.ObjectiveName;
    }
    return ObjectiveStringPrefix $ class'TeamInfo'.default.ColorNames[DefenderTeamIndex] $ ObjectiveStringSuffix;
}

function bool TellBotHowToDisable(Bot B)
{
    return B.Squad.FindPathToObjective(B, self);
}

function int GetNumDefenders()
{
    // End:0x0d
    if(DefenseSquad == none)
    {
        return 0;
    }
    return DefenseSquad.GetSize();
}

function CompleteObjective(Pawn Instigator)
{
    DisableObjective(Instigator);
}

function DisableObjective(Pawn Instigator)
{
    local PlayerReplicationInfo PRI;

    // End:0x32
    if(!IsActive() || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x5e
    if(bClearInstigator)
    {
        Instigator = none;
    }
    // End:0x162
    else
    {
        // End:0xe4
        if(Instigator != none)
        {
            // End:0x94
            if(Instigator.PlayerReplicationInfo != none)
            {
                PRI = Instigator.PlayerReplicationInfo;
            }
            // End:0xe4
            else
            {
                // End:0xe4
                if(Instigator.Controller != none && Instigator.Controller.PlayerReplicationInfo != none)
                {
                    PRI = Instigator.Controller.PlayerReplicationInfo;
                }
            }
        }
        // End:0x143
        if(DelayedDamageInstigatorController != none)
        {
            // End:0x10e
            if(Instigator == none)
            {
                Instigator = DelayedDamageInstigatorController.Pawn;
            }
            // End:0x143
            if(PRI == none && DelayedDamageInstigatorController.PlayerReplicationInfo != none)
            {
                PRI = DelayedDamageInstigatorController.PlayerReplicationInfo;
            }
        }
        // End:0x162
        if(!bBotOnlyObjective && DestructionMessage != "")
        {
            PlayDestructionMessage();
        }
    }
    // End:0x198
    if(bTeamControlled)
    {
        // End:0x195
        if(PRI != none)
        {
            DefenderTeamIndex = byte(PRI.Team.TeamIndex);
        }
    }
    // End:0x1a7
    else
    {
        bDisabled = true;
        SetActive(false);
    }
    SetCriticalStatus(false);
    DisabledBy = PRI;
    // End:0x1ea
    if(MyBaseVolume != none && MyBaseVolume.IsA('ASCriticalObjectiveVolume'))
    {
        MyBaseVolume.GotoState('ObjectiveDisabled');
    }
    // End:0x218
    if(bAccruePoints)
    {
        Level.Game.ScoreObjective(PRI, 0.0);
    }
    // End:0x23c
    else
    {
        Level.Game.ScoreObjective(PRI, float(Score));
    }
    // End:0x265
    if(!bBotOnlyObjective)
    {
        UnrealMPGameInfo(Level.Game).ObjectiveDisabled(self);
    }
    TriggerEvent(Event, self, Instigator);
    UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
}

simulated function PlayDestructionMessage()
{
    local PlayerController PC;

    // End:0x44
    if(DestructionMessage == default.DestructionMessage)
    {
        DestructionMessage = Level.GRI.Teams[DefenderTeamIndex].TeamName @ DestructionMessage;
    }
    // End:0x74
    if(!bReplicateObjective)
    {
        Level.Game.Broadcast(self, DestructionMessage, 'CriticalEvent');
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0xbb
    if(PC != none)
    {
        PC.TeamMessage(PC.PlayerReplicationInfo, DestructionMessage, 'CriticalEvent');
    }
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x22
    if(!IsActive() || DefenderTeamIndex != DesiredTeamNum)
    {
        return false;
    }
    // End:0x4d
    if(Best == none || Best.DefensePriority < DefensePriority)
    {
        return true;
    }
    return false;
}

function Reset()
{
    super(Actor).Reset();
    bClearInstigator = false;
    DefenseSquad = none;
    LastDrawTime = 0.0;
    bDisabled = false;
    DefenderTeamIndex = StartTeam;
    DisabledBy = none;
    Scorers.Length = 0;
    HighlightPhysicalObjective(false);
    SetActive(bInitiallyActive);
    SetCriticalStatus(false);
    DelayedDamageInstigatorController = none;
}

function SetActive(bool bActiveStatus)
{
    // End:0x0e
    if(bCanActive == false)
    {
        return;
    }
    // End:0x1f
    if(bDisabled)
    {
        bActiveStatus = false;
    }
    bActive = bActiveStatus;
    NetUpdateTime = Level.TimeSeconds - float(1);
}

simulated function bool IsActive()
{
    return !bDisabled && bActive;
}

simulated function bool IsCritical()
{
    return IsActive() && bIsCritical;
}

function SetCriticalStatus(bool bNewCriticalStatus)
{
    bIsCritical = bNewCriticalStatus;
    CheckPlayCriticalAlarm();
}

function CheckPlayCriticalAlarm()
{
    local bool bNewCritical;

    // End:0x0d
    if(!bPlayCriticalAssaultAlarm)
    {
        return;
    }
    bNewCritical = IsCritical();
    // End:0x79
    if(bOldCritical != bNewCritical)
    {
        // End:0x65
        if(bNewCritical)
        {
            // End:0x62
            if(UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
            {
                bOldCritical = bNewCritical;
            }
        }
        // End:0x79
        else
        {
            AmbientSound = none;
            bOldCritical = bNewCritical;
        }
    }
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x29
    if(bDisabled || bTriggerOnceOnly && bActive != bInitiallyActive)
    {
        return;
    }
    SetActive(!bActive);
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    local string SoundPackageName;

    // End:0x19a
    if(!bRewardSounds && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        // End:0x94
        if(Announcer_DisabledObjective != "")
        {
            SoundPackageName = class'wGameManager'.default.VoicePackageName;
            // End:0x63
            if(SoundPackageName != "")
            {
                V.AlternateFallbackSoundPackage = SoundPackageName;
            }
            // End:0x80
            else
            {
                V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
            }
            V.PrecacheSound(Announcer_DisabledObjective);
        }
        // End:0x109
        if(Len(Announcer_ObjectiveInfo) != 0)
        {
            SoundPackageName = class'wGameManager'.default.VoicePackageName;
            // End:0xd8
            if(SoundPackageName != "")
            {
                V.AlternateFallbackSoundPackage = SoundPackageName;
            }
            // End:0xf5
            else
            {
                V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
            }
            V.PrecacheSound(Announcer_ObjectiveInfo);
        }
        // End:0x17d
        if(Announcer_DefendObjective != "")
        {
            SoundPackageName = class'wGameManager'.default.VoicePackageName;
            // End:0x14c
            if(SoundPackageName != "")
            {
                V.AlternateFallbackSoundPackage = SoundPackageName;
            }
            // End:0x169
            else
            {
                V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
            }
            V.PrecacheSound(Announcer_DefendObjective);
        }
        V.AlternateFallbackSoundPackage = V.default.AlternateFallbackSoundPackage;
    }
}

function HighlightPhysicalObjective(bool bShow)
{
    CheckPlayCriticalAlarm();
    bHighlightPhysicalObjective = bShow;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x51
    if(Level.NetMode != 1)
    {
        SetObjectiveOverlay(bShow);
    }
}

simulated function PostNetReceive()
{
    // End:0x48
    if(bOldDisabled != bDisabled)
    {
        // End:0x3b
        if(bDisabled && !bBotOnlyObjective && DestructionMessage != "")
        {
            PlayDestructionMessage();
        }
        bOldDisabled = bDisabled;
    }
    // End:0x72
    if(bHighlightPhysicalObjective != bOldHighlightPhysicalObjective)
    {
        SetObjectiveOverlay(bHighlightPhysicalObjective);
        bOldHighlightPhysicalObjective = bHighlightPhysicalObjective;
    }
}

simulated function SetObjectiveOverlay(bool bShow)
{
    local int i;
    local Material newUV2Material;

    // End:0x15
    if(!bShow)
    {
        newUV2Material = none;
    }
    // End:0x28
    else
    {
        newUV2Material = HighlightOverlay[DefenderTeamIndex];
    }
    // End:0x50
    if(DrawType == 8 && StaticMesh != none)
    {
        UV2Texture = newUV2Material;
    }
    // End:0xa8
    if(PhysicalObjectiveActors.Length > 0)
    {
        i = 0;
        J0x63:
        // End:0xa8 [While If]
        if(i < PhysicalObjectiveActors.Length)
        {
            // End:0x9e
            if(PhysicalObjectiveActors[i] != none)
            {
                PhysicalObjectiveActors[i].UV2Texture = newUV2Material;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x63;
        }
    }
}

simulated function float GetObjectiveProgress()
{
    return 0.0;
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x1f
    if(ObjectiveTypeIcon != none)
    {
        Level.AddPrecacheMaterial(ObjectiveTypeIcon);
    }
    Level.AddPrecacheMaterial(HighlightOverlay[0]);
    Level.AddPrecacheMaterial(HighlightOverlay[1]);
    super(Actor).UpdatePrecacheMaterials();
}

function AddScorer(Controller C, float Pct)
{
    local ScorerRecord S;
    local int i;

    // End:0x60
    if(Scorers.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x60 [While If]
        if(i < Scorers.Length)
        {
            // End:0x56
            if(Scorers[i].C == C)
            {
                Scorers[i].Pct += Pct;
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    S.C = C;
    S.Pct = Pct;
    Scorers[Scorers.Length] = S;
}

function ShareScore(int Score, string EventDesc)
{
    local int i;
    local float SharedScore;

    i = 0;
    J0x07:
    // End:0x147 [While If]
    if(i < Scorers.Length)
    {
        // End:0x30
        if(Scorers[i].C == none)
        {
        }
        // End:0x13d
        else
        {
            SharedScore = float(Score) * Scorers[i].Pct;
            // End:0x13d
            if(SharedScore > float(0))
            {
                Scorers[i].C.AwardAdrenaline(SharedScore);
                Scorers[i].C.PlayerReplicationInfo.Score += SharedScore;
                Level.Game.ScoreEvent(Scorers[i].C.PlayerReplicationInfo, SharedScore, EventDesc);
                // End:0x13d
                if(Level.Game.GameRulesModifiers != none)
                {
                    Level.Game.GameRulesModifiers.ScoreObjective(Scorers[i].C.PlayerReplicationInfo, int(SharedScore));
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function AwardAssaultScore(int Score)
{
    // End:0x5b
    if(DisabledBy != none)
    {
        DisabledBy.Score += float(Score);
        Level.Game.ScoreEvent(DisabledBy, float(Score), "Objective_Completed");
    }
}

function SetTeam(byte TeamIndex)
{
    DefenderTeamIndex = TeamIndex;
}

defaultproperties
{
    bUsePriorityOnHUD=true
    bAnnounceNextObjective=true
    bInitiallyActive=true
    bActive=true
    bFirstObjective=true
    DestructionMessage="??? ?? ??!"
    LocationPrefix="??"
    ObjectiveStringSuffix=" ? ??"
    BaseExitTime=8.0
    BaseRadius=2000.0
    BotDamageScaling=1.50
    ObjectiveDescription="??? ???."
    Objective_Info_Attacker="??? ???"
    Objective_Info_Defender="??? ??"
    UseDescription="??"
    bCanActive=true
    bOptionalJumpDest=true
    bForceDoubleJump=true
    bMustBeReachable=true
    bUseDynamicLights=true
    bReplicateMovement=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=1.0
    SoundVolume=255
    SoundRadius=512.0
}