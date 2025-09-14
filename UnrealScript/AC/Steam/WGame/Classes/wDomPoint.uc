/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDomPoint.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:14
 *
 *******************************************************************************/
class wDomPoint extends DominationPoint
    dependson(wDOMLetter)
    dependson(wDomRing)
    dependson(wDOMMonitor)
    hidecategories(Lighting,LightColor,Karma,Force);

var() localized string PointName;
var() Sound ControlSound;
var() name ControlEvent;
var(Material) Material DomCombiner[2];
var(Material) Material CRedState[2];
var(Material) Material CBlueState[2];
var(Material) Material CNeutralState[2];
var(Material) Material CDisableState[2];
var(Material) Shader DomShader;
var(Material) Material SRedState;
var(Material) Material SBlueState;
var(Material) Material SNeutralState;
var(Material) Material SDisableState;
var(Material) float PulseSpeed;
var wDOMLetter DomLetter;
var wDomRing DOMRing;
var transient byte NoPulseAlpha;
var Vector EffectOffset;
var delegate<ResetCount> __ResetCount__Delegate;

delegate ResetCount();
simulated function PostBeginPlay()
{
    super(GameObjective).PostBeginPlay();
    // End:0x48
    if(Level.NetMode != 3 && !Level.Game.IsA('wDoubleDom'))
    {
        bHidden = true;
    }
}

function string GetHumanName()
{
    return PointName;
}

function Touch(Actor Other)
{
    // End:0x2d
    if(Pawn(Other) == none || !Pawn(Other).IsPlayerPawn())
    {
        return;
    }
    // End:0x74
    if(bControllable && ControllingTeam != Pawn(Other).PlayerReplicationInfo.Team)
    {
        ControllingPawn = Pawn(Other);
        UpdateStatus();
    }
}

function UnTouch(Actor Other)
{
    local Pawn NewControl;

    // End:0x47
    if(Other == ControllingPawn)
    {
        // End:0x46
        foreach TouchingActors(class'Pawn', NewControl)
        {
            // End:0x45
            if(NewControl.IsPlayerPawn())
            {
                ControllingPawn = NewControl;
                UpdateStatus();
            }
            // End:0x46
            else
            {
                continue;
            }            
        }
    }
}

simulated function float Pulse(float X)
{
    // End:0x3b
    if(X < 0.50)
    {
        return 2.0 * X * X * 3.0 - 2.0 * X;
    }
    // End:0x6b
    else
    {
        return 2.0 * 1.0 - X * X * 3.0 - 2.0 * X;
    }
}

simulated function Tick(float t)
{
    local float f, Alpha;

    super(Actor).Tick(t);
    // End:0xcc
    if(DomShader != none && PulseSpeed != 0.0)
    {
        // End:0xa5
        if(bControllable)
        {
            f = Level.TimeSeconds * PulseSpeed;
            f = f - float(int(f));
            Alpha = 255.0;
            ConstantColor(DomShader.SpecularityMask).Color.A = byte(Pulse(f) * Alpha);
        }
        // End:0xcc
        else
        {
            ConstantColor(DomShader.SpecularityMask).Color.A = NoPulseAlpha;
        }
    }
}

simulated function PostNetReceive()
{
    local wDOMMonitor M;
    local byte NewTeam;

    // End:0x2f
    if(!bControllable)
    {
        SetShaderStatus(CDisableState[0], SDisableState, CDisableState[1]);
        NewTeam = 254;
    }
    // End:0xbf
    else
    {
        // End:0x60
        if(ControllingTeam == none)
        {
            SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
            NewTeam = byte(255);
        }
        // End:0xbf
        else
        {
            // End:0x90
            if(ControllingTeam.TeamIndex == 0)
            {
                SetShaderStatus(CRedState[0], SRedState, CRedState[1]);
            }
            // End:0xa9
            else
            {
                SetShaderStatus(CBlueState[0], SBlueState, CBlueState[1]);
            }
            NewTeam = byte(ControllingTeam.TeamIndex);
        }
    }
    // End:0xf8
    foreach DynamicActors(class'wDOMMonitor', M, ControlEvent)
    {
        M.NewTeam = NewTeam;
        M.UpdateForTeam();                
    }
}

simulated function SetShaderStatus(Material mat1, Material mat2, Material mat3)
{
    // End:0x28
    if(DomCombiner[0] != none)
    {
        Combiner(DomCombiner[0]).Material1 = mat1;
    }
    // End:0x50
    if(DomCombiner[1] != none)
    {
        Combiner(DomCombiner[1]).Material1 = mat3;
    }
    // End:0x95
    if(DomShader != none)
    {
        // End:0x81
        if(PulseSpeed != 0.0)
        {
            DomShader.Specular = mat2;
        }
        // End:0x95
        else
        {
            DomShader.Diffuse = mat2;
        }
    }
}

function UpdateStatus()
{
    local Actor A;
    local TeamInfo NewTeam;
    local int OldIndex;

    // End:0x64
    if(bControllable && ControllingPawn == none || !ControllingPawn.IsPlayerPawn())
    {
        ControllingPawn = none;
        // End:0x63
        foreach TouchingActors(class'Pawn', ControllingPawn)
        {
            // End:0x5b
            if(ControllingPawn.IsPlayerPawn())
            {
                // This is an implied JumpToken;
                goto J0x63;
            }
            // End:0x62
            else
            {
                ControllingPawn = none;
            }            
            J0x63:            
        }
    }
    // End:0x7e
    if(ControllingTeam != none && ControllingPawn == none)
    {
        return;
    }
    // End:0x93
    if(ControllingPawn == none)
    {
        NewTeam = none;
    }
    // End:0xb9
    else
    {
        NewTeam = ControllingPawn.Controller.PlayerReplicationInfo.Team;
    }
    // End:0xd7
    if(NewTeam == ControllingTeam && NewTeam != none)
    {
        return;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    OldIndex = DefenderTeamIndex;
    // End:0x115
    if(NewTeam == none)
    {
        DefenderTeamIndex = byte(255);
    }
    // End:0x12b
    else
    {
        DefenderTeamIndex = byte(NewTeam.TeamIndex);
    }
    // End:0x165
    if(bControllable && OldIndex != DefenderTeamIndex)
    {
        UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
    }
    ControllingTeam = NewTeam;
    // End:0x181
    if(ControllingTeam != none)
    {
        PlayAlarm();
    }
    ResetCount();
    // End:0x2f9
    if(ControllingTeam == none)
    {
        // End:0x1fd
        if(!bControllable)
        {
            LightType = 0;
            SetShaderStatus(CDisableState[0], SDisableState, CDisableState[1]);
            // End:0x1de
            if(DomLetter != none)
            {
                DomLetter.bHidden = true;
            }
            // End:0x1fa
            if(DOMRing != none)
            {
                DOMRing.bHidden = true;
            }
        }
        // End:0x2f6
        else
        {
            // End:0x2f6
            if(bControllable)
            {
                LightHue = byte(255);
                LightBrightness = 128.0;
                LightSaturation = byte(255);
                LightType = 7;
                SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
                // End:0x29e
                if(DomLetter != none)
                {
                    DomLetter.bHidden = false;
                    DomLetter.Skins[0] = class'wDOMLetter'.default.NeutralShader;
                    DomLetter.RepSkin = class'wDOMLetter'.default.NeutralShader;
                }
                // End:0x2f6
                if(DOMRing != none)
                {
                    DOMRing.bHidden = false;
                    DOMRing.Skins[0] = class'wDomRing'.default.NeutralShader;
                    DOMRing.RepSkin = class'wDomRing'.default.NeutralShader;
                }
            }
        }
    }
    // End:0x503
    else
    {
        // End:0x417
        if(ControllingPawn.Controller.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            LightType = 7;
            LightHue = 0;
            LightBrightness = 255.0;
            LightSaturation = 128;
            SetShaderStatus(CRedState[0], SRedState, CRedState[1]);
            // End:0x3bc
            if(DomLetter != none)
            {
                DomLetter.bHidden = false;
                DomLetter.Skins[0] = class'wDOMLetter'.default.RedTeamShader;
                DomLetter.RepSkin = class'wDOMLetter'.default.RedTeamShader;
            }
            // End:0x414
            if(DOMRing != none)
            {
                DOMRing.bHidden = false;
                DOMRing.Skins[0] = class'wDomRing'.default.RedTeamShader;
                DOMRing.RepSkin = class'wDomRing'.default.RedTeamShader;
            }
        }
        // End:0x503
        else
        {
            LightType = 7;
            LightHue = 170;
            LightBrightness = 255.0;
            LightSaturation = 128;
            SetShaderStatus(CBlueState[0], SBlueState, CBlueState[1]);
            // End:0x4ab
            if(DomLetter != none)
            {
                DomLetter.bHidden = false;
                DomLetter.Skins[0] = class'wDOMLetter'.default.BlueTeamShader;
                DomLetter.RepSkin = class'wDOMLetter'.default.BlueTeamShader;
            }
            // End:0x503
            if(DOMRing != none)
            {
                DOMRing.bHidden = false;
                DOMRing.Skins[0] = class'wDomRing'.default.BlueTeamShader;
                DOMRing.RepSkin = class'wDomRing'.default.BlueTeamShader;
            }
        }
    }
    // End:0x52e
    foreach DynamicActors(class'Actor', A, ControlEvent)
    {
        A.Trigger(self, ControllingPawn);                
    }
}

function ResetPoint(bool Enabled)
{
    // End:0x34
    if(!bControllable && Enabled)
    {
        UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    bControllable = Enabled;
    ControllingPawn = none;
    ControllingTeam = none;
    UpdateStatus();
}

function PlayAlarm()
{
    SetTimer(5.0, false);
    AmbientSound = ControlSound;
}

function Timer()
{
    AmbientSound = none;
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x22
    if(Best == none || DefenderTeamIndex == DesiredTeamNum)
    {
        return true;
    }
    return false;
}

defaultproperties
{
    PulseSpeed=1.0
    EffectOffset=(X=0.0,Y=0.0,Z=60.0)
    bControllable=true
    bTeamControlled=true
    DefenderTeamIndex=255
    DestructionMessage=""
    LightType=7
    LightEffect=21
    LightHue=255
    LightSaturation=255
    LightBrightness=128.0
    LightRadius=6.0
    DrawType=8
    bStatic=true
    bHidden=true
    bDynamicLight=true
    bAlwaysRelevant=true
    RemoteRole=2
    DrawScale=0.60
    PrePivot=(X=0.0,Y=0.0,Z=70.0)
    SoundRadius=255.0
    CollisionRadius=60.0
    CollisionHeight=40.0
    bCollideActors=true
    bUseCylinderCollision=true
    bNetNotify=true
}