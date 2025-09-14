class wDomPoint extends DominationPoint
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
//var delegate<ResetCount> __ResetCount__Delegate;

delegate ResetCount()
{
    //return;    
}

simulated function PostBeginPlay()
{
    super(GameObjective).PostBeginPlay();
    // End:0x48
    if((int(Level.NetMode) != int(NM_Client)) && !Level.Game.IsA('wDoubleDom'))
    {
        bHidden = true;
    }
    //return;    
}

function string GetHumanName()
{
    return PointName;
    //return;    
}

function Touch(Actor Other)
{
    // End:0x2D
    if((Pawn(Other) == none) || !Pawn(Other).IsPlayerPawn())
    {
        return;
    }
    // End:0x74
    if(bControllable && ControllingTeam != Pawn(Other).PlayerReplicationInfo.Team)
    {
        ControllingPawn = Pawn(Other);
        UpdateStatus();
    }
    //return;    
}

function UnTouch(Actor Other)
{
    local Pawn NewControl;

    // End:0x47
    if(Other == ControllingPawn)
    {
        // End:0x46
        foreach TouchingActors(Class'Engine.Pawn', NewControl)
        {
            // End:0x45
            if(NewControl.IsPlayerPawn())
            {
                ControllingPawn = NewControl;
                UpdateStatus();
                // End:0x46
                break;
            }            
        }        
    }
    //return;    
}

simulated function float Pulse(float X)
{
    // End:0x3B
    if(X < 0.5000000)
    {
        return 2.0000000 * ((X * X) * (3.0000000 - (2.0000000 * X)));        
    }
    else
    {
        return 2.0000000 * (1.0000000 - ((X * X) * (3.0000000 - (2.0000000 * X))));
    }
    //return;    
}

simulated function Tick(float t)
{
    local float F, Alpha;

    super(Actor).Tick(t);
    // End:0xCC
    if((DomShader != none) && PulseSpeed != 0.0000000)
    {
        // End:0xA5
        if(bControllable)
        {
            F = Level.TimeSeconds * PulseSpeed;
            F = F - float(int(F));
            Alpha = 255.0000000;
            ConstantColor(DomShader.SpecularityMask).Color.A = byte((Pulse(F)) * Alpha);            
        }
        else
        {
            ConstantColor(DomShader.SpecularityMask).Color.A = NoPulseAlpha;
        }
    }
    //return;    
}

simulated function PostNetReceive()
{
    local wDOMMonitor M;
    local byte NewTeam;

    // End:0x2F
    if(!bControllable)
    {
        SetShaderStatus(CDisableState[0], SDisableState, CDisableState[1]);
        NewTeam = 254;        
    }
    else
    {
        // End:0x60
        if(ControllingTeam == none)
        {
            SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
            NewTeam = byte(255);            
        }
        else
        {
            // End:0x90
            if(ControllingTeam.TeamIndex == 0)
            {
                SetShaderStatus(CRedState[0], SRedState, CRedState[1]);                
            }
            else
            {
                SetShaderStatus(CBlueState[0], SBlueState, CBlueState[1]);
            }
            NewTeam = byte(ControllingTeam.TeamIndex);
        }
    }
    // End:0xF8
    foreach DynamicActors(Class'WGame_Decompressed.wDOMMonitor', M, ControlEvent)
    {
        M.NewTeam = NewTeam;
        M.UpdateForTeam();        
    }    
    //return;    
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
        if(PulseSpeed != 0.0000000)
        {
            DomShader.Specular = mat2;            
        }
        else
        {
            DomShader.Diffuse = mat2;
        }
    }
    //return;    
}

function UpdateStatus()
{
    local Actor A;
    local TeamInfo NewTeam;
    local int OldIndex;

    // End:0x64
    if(bControllable && (ControllingPawn == none) || !ControllingPawn.IsPlayerPawn())
    {
        ControllingPawn = none;
        // End:0x63
        foreach TouchingActors(Class'Engine.Pawn', ControllingPawn)
        {
            // End:0x5B
            if(ControllingPawn.IsPlayerPawn())
            {
                // End:0x63
                break;
                // End:0x62
                continue;
            }
            ControllingPawn = none;            
        }        
    }
    // End:0x7E
    if((ControllingTeam != none) && ControllingPawn == none)
    {
        return;
    }
    // End:0x93
    if(ControllingPawn == none)
    {
        NewTeam = none;        
    }
    else
    {
        NewTeam = ControllingPawn.Controller.PlayerReplicationInfo.Team;
    }
    // End:0xD7
    if((NewTeam == ControllingTeam) && NewTeam != none)
    {
        return;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    OldIndex = int(DefenderTeamIndex);
    // End:0x115
    if(NewTeam == none)
    {
        DefenderTeamIndex = byte(255);        
    }
    else
    {
        DefenderTeamIndex = byte(NewTeam.TeamIndex);
    }
    // End:0x165
    if(bControllable && OldIndex != int(DefenderTeamIndex))
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
    // End:0x2F9
    if(ControllingTeam == none)
    {
        // End:0x1FD
        if(!bControllable)
        {
            LightType = 0;
            SetShaderStatus(CDisableState[0], SDisableState, CDisableState[1]);
            // End:0x1DE
            if(DomLetter != none)
            {
                DomLetter.bHidden = true;
            }
            // End:0x1FA
            if(DOMRing != none)
            {
                DOMRing.bHidden = true;
            }            
        }
        else
        {
            // End:0x2F6
            if(bControllable)
            {
                LightHue = byte(255);
                LightBrightness = 128.0000000;
                LightSaturation = byte(255);
                LightType = 7;
                SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
                // End:0x29E
                if(DomLetter != none)
                {
                    DomLetter.bHidden = false;
                    DomLetter.Skins[0] = Class'WGame_Decompressed.wDOMLetter'.default.NeutralShader;
                    DomLetter.RepSkin = Class'WGame_Decompressed.wDOMLetter'.default.NeutralShader;
                }
                // End:0x2F6
                if(DOMRing != none)
                {
                    DOMRing.bHidden = false;
                    DOMRing.Skins[0] = Class'WGame_Decompressed.wDomRing'.default.NeutralShader;
                    DOMRing.RepSkin = Class'WGame_Decompressed.wDomRing'.default.NeutralShader;
                }
            }
        }        
    }
    else
    {
        // End:0x417
        if(ControllingPawn.Controller.PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            LightType = 7;
            LightHue = 0;
            LightBrightness = 255.0000000;
            LightSaturation = 128;
            SetShaderStatus(CRedState[0], SRedState, CRedState[1]);
            // End:0x3BC
            if(DomLetter != none)
            {
                DomLetter.bHidden = false;
                DomLetter.Skins[0] = Class'WGame_Decompressed.wDOMLetter'.default.RedTeamShader;
                DomLetter.RepSkin = Class'WGame_Decompressed.wDOMLetter'.default.RedTeamShader;
            }
            // End:0x414
            if(DOMRing != none)
            {
                DOMRing.bHidden = false;
                DOMRing.Skins[0] = Class'WGame_Decompressed.wDomRing'.default.RedTeamShader;
                DOMRing.RepSkin = Class'WGame_Decompressed.wDomRing'.default.RedTeamShader;
            }            
        }
        else
        {
            LightType = 7;
            LightHue = 170;
            LightBrightness = 255.0000000;
            LightSaturation = 128;
            SetShaderStatus(CBlueState[0], SBlueState, CBlueState[1]);
            // End:0x4AB
            if(DomLetter != none)
            {
                DomLetter.bHidden = false;
                DomLetter.Skins[0] = Class'WGame_Decompressed.wDOMLetter'.default.BlueTeamShader;
                DomLetter.RepSkin = Class'WGame_Decompressed.wDOMLetter'.default.BlueTeamShader;
            }
            // End:0x503
            if(DOMRing != none)
            {
                DOMRing.bHidden = false;
                DOMRing.Skins[0] = Class'WGame_Decompressed.wDomRing'.default.BlueTeamShader;
                DOMRing.RepSkin = Class'WGame_Decompressed.wDomRing'.default.BlueTeamShader;
            }
        }
    }
    // End:0x52E
    foreach DynamicActors(Class'Engine.Actor', A, ControlEvent)
    {
        A.Trigger(self, ControllingPawn);        
    }    
    //return;    
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
    //return;    
}

function PlayAlarm()
{
    SetTimer(5.0000000, false);
    AmbientSound = ControlSound;
    //return;    
}

function Timer()
{
    AmbientSound = none;
    //return;    
}

function bool BetterObjectiveThan(GameObjective Best, byte DesiredTeamNum, byte RequesterTeamNum)
{
    // End:0x22
    if((Best == none) || int(DefenderTeamIndex) == int(DesiredTeamNum))
    {
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    PulseSpeed=1.0000000
    EffectOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
    bControllable=true
    bTeamControlled=true
    DefenderTeamIndex=255
    DestructionMessage=""
    LightType=7
    LightEffect=21
    LightHue=255
    LightSaturation=255
    LightBrightness=128.0000000
    LightRadius=6.0000000
    DrawType=8
    bStatic=false
    bHidden=false
    bDynamicLight=true
    bAlwaysRelevant=true
    RemoteRole=2
    DrawScale=0.6000000
    PrePivot=(X=0.0000000,Y=0.0000000,Z=70.0000000)
    SoundRadius=255.0000000
    CollisionRadius=60.0000000
    CollisionHeight=40.0000000
    bCollideActors=true
    bUseCylinderCollision=true
    bNetNotify=true
}