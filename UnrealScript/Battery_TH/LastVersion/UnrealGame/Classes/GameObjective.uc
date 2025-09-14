class GameObjective extends JumpSpot
    abstract
    hidecategories(Lighting,LightColor,Karma,Force);

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
    // Pos:0x000
    reliable if(((int(Role) == int(ROLE_Authority)) && bReplicateObjective) && bNetDirty)
        DefenderTeamIndex, ObjectiveDisabledTime, 
        SavedObjectiveProgress, bActive, 
        bDisabled, bHighlightPhysicalObjective, 
        bIsCritical;
}

function float GetDifficulty()
{
    return 0.0000000;
    //return;    
}

function bool CanDoubleJump(Pawn Other)
{
    return true;
    //return;    
}

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x17
    if(bReplicateObjective)
    {
        bNetNotify = true;
    }
    //return;    
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
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x39
        if(Level.Game == none)
        {
            SetActive(bInitiallyActive);            
        }
        else
        {
            // End:0x63
            if(Level.Game.bChangedHost)
            {
                SetActive(bActive);                
            }
            else
            {
                SetActive(bInitiallyActive);
            }
        }
        StartTeam = DefenderTeamIndex;
        // End:0xB5
        if(DefenseScriptTags != 'None')
        {
            // End:0xB4
            foreach AllActors(Class'UnrealGame_Decompressed.UnrealScriptedSequence', DefenseScripts, DefenseScriptTags)
            {
                // End:0xB3
                if(DefenseScripts.bFirstScript)
                {
                    // End:0xB4
                    break;
                }                
            }            
        }
        W = DefenseScripts;
        J0xC0:

        // End:0xF3 [Loop If]
        if(W != none)
        {
            W.bFreelance = false;
            W = W.NextScript;
            // [Loop Continue]
            goto J0xC0;
        }
        // End:0x154
        if(bFirstObjective)
        {
            CurrentObjective = self;
            // End:0x153
            foreach AllActors(Class'UnrealGame_Decompressed.GameObjective', o)
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
        // End:0x18D
        foreach AllActors(Class'UnrealGame_Decompressed.AssaultPath', A)
        {
            // End:0x18C
            if(A.ObjectiveTag == Tag)
            {
                A.AddTo(self);
            }            
        }        
        // End:0x227
        if(CriticalObjectiveVolumeTag != 'None')
        {
            // End:0x226
            foreach AllActors(Class'Engine.Volume', MyBaseVolume, CriticalObjectiveVolumeTag)
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
        // End:0x24C
        if(MyBaseVolume == none)
        {
            // End:0x24B
            foreach AllActors(Class'Engine.Volume', MyBaseVolume, AreaVolumeTag)
            {
                // End:0x24B
                break;                
            }            
        }
        // End:0x29C
        if((MyBaseVolume != none) && MyBaseVolume.LocationName ~= "unspecified")
        {
            MyBaseVolume.LocationName = (LocationPrefix @ (GetHumanReadableName())) @ LocationPostfix;
        }
        // End:0x2AE
        if(bAccruePoints)
        {
            SetTimer(1.0000000, true);
        }
        // End:0x2D7
        if(EndCameraTag != 'None')
        {
            // End:0x2D6
            foreach AllActors(Class'Engine.Actor', EndCamera, EndCameraTag)
            {
                // End:0x2D6
                break;                
            }            
        }
        // End:0x342
        if(VehiclePathName != 'None')
        {
            N = Level.NavigationPointList;
            J0x2FA:

            // End:0x342 [Loop If]
            if(N != none)
            {
                // End:0x32B
                if(N.Name == VehiclePathName)
                {
                    VehiclePath = N;
                    // [Explicit Break]
                    goto J0x342;
                }
                N = N.nextNavigationPoint;
                // [Loop Continue]
                goto J0x2FA;
            }
        }
    }
    J0x342:

    // End:0x395
    if((int(Level.NetMode) != int(NM_DedicatedServer)) && PhysicalObjectiveActorsTag != 'None')
    {
        // End:0x394
        foreach AllActors(Class'Engine.Actor', ac, PhysicalObjectiveActorsTag)
        {
            PhysicalObjectiveActors[PhysicalObjectiveActors.Length] = ac;            
        }        
    }
    //return;    
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    //return;    
}

simulated function UpdateLocationName()
{
    // End:0x25
    if(MyBaseVolume == none)
    {
        // End:0x24
        foreach AllActors(Class'Engine.Volume', MyBaseVolume, AreaVolumeTag)
        {
            // End:0x24
            break;            
        }        
    }
    // End:0x75
    if((MyBaseVolume != none) && MyBaseVolume.default.LocationName ~= "unspecified")
    {
        MyBaseVolume.LocationName = (LocationPrefix @ (GetHumanReadableName())) @ LocationPostfix;
    }
    //return;    
}

function PlayAlarm()
{
    //return;    
}

function bool BotNearObjective(Bot B)
{
    // End:0x9C
    if(((NearObjective(B.Pawn)) || (B.RouteGoal == self) && B.RouteDist < float(2500)) || B.bWasNearObjective && VSize(Location - B.Pawn.Location) < BaseRadius)
    {
        B.bWasNearObjective = true;
        return true;
    }
    B.bWasNearObjective = false;
    return false;
    //return;    
}

function bool NearObjective(Pawn P)
{
    // End:0x20
    if(MyBaseVolume != none)
    {
        return P.IsInVolume(MyBaseVolume);
    }
    // End:0x58
    if((VSize(Location - P.Location) < BaseRadius) && P.LineOfSightTo(self))
    {
        return true;
    }
    //return;    
}

function Timer()
{
    // End:0x7B
    if(int(DefenderTeamIndex) < 2)
    {
        Level.GRI.Teams[int(DefenderTeamIndex)].Score += float(Score);
        Level.Game.TeamScoreEvent(int(DefenderTeamIndex), float(Score), "game_objective_score");
    }
    //return;    
}

function bool OwnsDefenseScript(UnrealScriptedSequence S)
{
    return DefenseScriptTags == S.Tag;
    //return;    
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
    return (ObjectiveStringPrefix $ Class'Engine.TeamInfo'.default.ColorNames[int(DefenderTeamIndex)]) $ ObjectiveStringSuffix;
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    return B.Squad.FindPathToObjective(B, self);
    //return;    
}

function int GetNumDefenders()
{
    // End:0x0D
    if(DefenseSquad == none)
    {
        return 0;
    }
    return DefenseSquad.GetSize();
    //return;    
}

function CompleteObjective(Pawn Instigator)
{
    DisableObjective(Instigator);
    //return;    
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
    // End:0x5E
    if(bClearInstigator)
    {
        Instigator = none;        
    }
    else
    {
        // End:0xE4
        if(Instigator != none)
        {
            // End:0x94
            if(Instigator.PlayerReplicationInfo != none)
            {
                PRI = Instigator.PlayerReplicationInfo;                
            }
            else
            {
                // End:0xE4
                if((Instigator.Controller != none) && Instigator.Controller.PlayerReplicationInfo != none)
                {
                    PRI = Instigator.Controller.PlayerReplicationInfo;
                }
            }
        }
        // End:0x143
        if(DelayedDamageInstigatorController != none)
        {
            // End:0x10E
            if(Instigator == none)
            {
                Instigator = DelayedDamageInstigatorController.Pawn;
            }
            // End:0x143
            if((PRI == none) && DelayedDamageInstigatorController.PlayerReplicationInfo != none)
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
    else
    {
        bDisabled = true;
        SetActive(false);
    }
    SetCriticalStatus(false);
    DisabledBy = PRI;
    // End:0x1EA
    if((MyBaseVolume != none) && MyBaseVolume.IsA('ASCriticalObjectiveVolume'))
    {
        MyBaseVolume.GotoState('ObjectiveDisabled');
    }
    // End:0x218
    if(bAccruePoints)
    {
        Level.Game.ScoreObjective(PRI, 0.0000000);        
    }
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
    //return;    
}

simulated function PlayDestructionMessage()
{
    local PlayerController PC;

    // End:0x44
    if(DestructionMessage == default.DestructionMessage)
    {
        DestructionMessage = Level.GRI.Teams[int(DefenderTeamIndex)].TeamName @ DestructionMessage;
    }
    // End:0x74
    if(!bReplicateObjective)
    {
        Level.Game.Broadcast(self, DestructionMessage, 'CriticalEvent');
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0xBB
    if(PC != none)
    {
        PC.TeamMessage(PC.PlayerReplicationInfo, DestructionMessage, 'CriticalEvent');
    }
    //return;    
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x22
    if(!IsActive() || int(DefenderTeamIndex) != int(DesiredTeamNum))
    {
        return false;
    }
    // End:0x4D
    if((Best == none) || int(Best.DefensePriority) < int(DefensePriority))
    {
        return true;
    }
    return false;
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bClearInstigator = false;
    DefenseSquad = none;
    LastDrawTime = 0.0000000;
    bDisabled = false;
    DefenderTeamIndex = StartTeam;
    DisabledBy = none;
    Scorers.Length = 0;
    HighlightPhysicalObjective(false);
    SetActive(bInitiallyActive);
    SetCriticalStatus(false);
    DelayedDamageInstigatorController = none;
    //return;    
}

function SetActive(bool bActiveStatus)
{
    // End:0x0E
    if(bCanActive == false)
    {
        return;
    }
    // End:0x1F
    if(bDisabled)
    {
        bActiveStatus = false;
    }
    bActive = bActiveStatus;
    NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

simulated function bool IsActive()
{
    return !bDisabled && bActive;
    //return;    
}

simulated function bool IsCritical()
{
    return (IsActive()) && bIsCritical;
    //return;    
}

function SetCriticalStatus(bool bNewCriticalStatus)
{
    bIsCritical = bNewCriticalStatus;
    CheckPlayCriticalAlarm();
    //return;    
}

function CheckPlayCriticalAlarm()
{
    local bool bNewCritical;

    // End:0x0D
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
        else
        {
            AmbientSound = none;
            bOldCritical = bNewCritical;
        }
    }
    //return;    
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x29
    if(bDisabled || bTriggerOnceOnly && bActive != bInitiallyActive)
    {
        return;
    }
    SetActive(!bActive);
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    //return;    
}

function HighlightPhysicalObjective(bool bShow)
{
    CheckPlayCriticalAlarm();
    bHighlightPhysicalObjective = bShow;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x51
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SetObjectiveOverlay(bShow);
    }
    //return;    
}

simulated function PostNetReceive()
{
    // End:0x48
    if(bOldDisabled != bDisabled)
    {
        // End:0x3B
        if((bDisabled && !bBotOnlyObjective) && DestructionMessage != "")
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
    //return;    
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
    else
    {
        newUV2Material = HighlightOverlay[int(DefenderTeamIndex)];
    }
    // End:0x50
    if((int(DrawType) == int(8)) && StaticMesh != none)
    {
        UV2Texture = newUV2Material;
    }
    // End:0xA8
    if(PhysicalObjectiveActors.Length > 0)
    {
        i = 0;
        J0x63:

        // End:0xA8 [Loop If]
        if(i < PhysicalObjectiveActors.Length)
        {
            // End:0x9E
            if(PhysicalObjectiveActors[i] != none)
            {
                PhysicalObjectiveActors[i].UV2Texture = newUV2Material;
            }
            i++;
            // [Loop Continue]
            goto J0x63;
        }
    }
    //return;    
}

simulated function float GetObjectiveProgress()
{
    return 0.0000000;
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x1F
    if(ObjectiveTypeIcon != none)
    {
        Level.AddPrecacheMaterial(ObjectiveTypeIcon);
    }
    Level.AddPrecacheMaterial(HighlightOverlay[0]);
    Level.AddPrecacheMaterial(HighlightOverlay[1]);
    super(Actor).UpdatePrecacheMaterials();
    //return;    
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

        // End:0x60 [Loop If]
        if(i < Scorers.Length)
        {
            // End:0x56
            if(Scorers[i].C == C)
            {
                Scorers[i].Pct += Pct;
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    S.C = C;
    S.Pct = Pct;
    Scorers[Scorers.Length] = S;
    //return;    
}

function ShareScore(int Score, string EventDesc)
{
    local int i;
    local float SharedScore;

    i = 0;
    J0x07:

    // End:0x147 [Loop If]
    if(i < Scorers.Length)
    {
        // End:0x30
        if(Scorers[i].C == none)
        {
            // [Explicit Continue]
            goto J0x13D;
        }
        SharedScore = float(Score) * Scorers[i].Pct;
        // End:0x13D
        if(SharedScore > float(0))
        {
            Scorers[i].C.AwardAdrenaline(SharedScore);
            Scorers[i].C.PlayerReplicationInfo.Score += SharedScore;
            Level.Game.ScoreEvent(Scorers[i].C.PlayerReplicationInfo, SharedScore, EventDesc);
            // End:0x13D
            if(Level.Game.GameRulesModifiers != none)
            {
                Level.Game.GameRulesModifiers.ScoreObjective(Scorers[i].C.PlayerReplicationInfo, int(SharedScore));
            }
        }
        J0x13D:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function AwardAssaultScore(int Score)
{
    // End:0x5B
    if(DisabledBy != none)
    {
        DisabledBy.Score += float(Score);
        Level.Game.ScoreEvent(DisabledBy, float(Score), "Objective_Completed");
    }
    //return;    
}

function SetTeam(byte TeamIndex)
{
    DefenderTeamIndex = TeamIndex;
    //return;    
}

defaultproperties
{
    bUsePriorityOnHUD=true
    bAnnounceNextObjective=true
    bInitiallyActive=true
    bActive=true
    bFirstObjective=true
    DestructionMessage="Objective Disabled!"
    LocationPrefix="Near"
    ObjectiveStringSuffix=" Team Base"
    BaseExitTime=8.0000000
    BaseRadius=2000.0000000
    BotDamageScaling=1.5000000
    ObjectiveDescription="Disable Objective."
    Objective_Info_Attacker="Disable Objective"
    Objective_Info_Defender="Defend Objective"
    UseDescription="USE"
    bCanActive=true
    bOptionalJumpDest=true
    bForceDoubleJump=true
    bMustBeReachable=true
    bUseDynamicLights=true
    bReplicateMovement=false
    bOnlyDirtyReplication=true
    NetUpdateFrequency=1.0000000
    SoundVolume=255
    SoundRadius=512.0000000
}