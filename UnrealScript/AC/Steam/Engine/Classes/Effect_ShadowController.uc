/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Effect_ShadowController.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:11
 *	Functions:10
 *
 *******************************************************************************/
class Effect_ShadowController extends Actor
    dependson(Effect_ShadowProjector)
    config(User)
    notplaceable;

enum CrispnessEnum
{
    Low,
    Medium,
    High,
    Maximum
};

struct LightGroup
{
    var float Priority;
    var Actor CurrentLight;
    var Actor LastLight;
};

var class<Effect_ShadowProjector> ShadowClass;
var array<Effect_ShadowProjector> Shadows;
var array<Light> LightList;
var array<LightGroup> Lights;
var float MaxLightDistance;
var float UpdateFrequency;
var Light SunLightActor;
var Vector SunDirection;
var bool bShadowActive;
var globalconfig int MaxShadows;
var globalconfig Effect_ShadowController.CrispnessEnum ShadowCrispness;

function Initialize()
{
    local Light LightActor;
    local array<Light> SunLights;
    local int i;

    // End:0x88
    foreach AllActors(class'Light', LightActor)
    {
        // End:0x44
        if(LightActor.LightEffect == 20)
        {
            SunLights[i] = LightActor;
            ++ i;
        }
        // End:0x87
        else
        {
            // End:0x87
            if(LightActor.LightType != 0 && LightActor.LightBrightness > float(1))
            {
                LightList[LightList.Length] = LightActor;
            }
        }                
    }
    i = 0;
    J0x90:
    // End:0xef [While If]
    if(i < SunLights.Length)
    {
        // End:0xe5
        if(SunLightActor == none || SunLightActor.LightBrightness < SunLights[i].LightBrightness)
        {
            SunLightActor = SunLights[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x90;
    }
    Shadows.Insert(0, MaxShadows);
    Lights.Insert(0, MaxShadows);
    bShadowActive = true;
    FillLights();
}

function Timer()
{
    FillLights();
}

function FillLights()
{
    local int i, j;
    local array<Actor> OrigLight;
    local float diff;
    local Vector SunLoc;

    // End:0x0d
    if(Owner == none)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0x71 [While If]
    if(i < MaxShadows)
    {
        OrigLight[i] = Lights[i].CurrentLight;
        Lights[i].CurrentLight = none;
        Lights[i].Priority = 10000.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    SetLocation(Owner.Location);
    // End:0x8f
    if(!bShadowActive)
    {
        return;
    }
    i = 0;
    J0x96:
    // End:0x1c8 [While If]
    if(i < LightList.Length)
    {
        diff = VSize(LightList[i].Location - Owner.Location);
        // End:0x1be
        if(LightList[i].bDynamicLight && diff < MaxLightDistance && LightList[i].LightRadius >= diff * 0.0410 && diff > Owner.CollisionRadius * 0.50 && IsVisible(LightList[i].Location))
        {
            j = 1;
            J0x169:
            // End:0x1a6 [While If]
            if(j < MaxShadows)
            {
                Lights[j].CurrentLight = Lights[j - 1].CurrentLight;
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x169;
            }
            Lights[0].CurrentLight = LightList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x96;
    }
    i = 0;
    J0x1cf:
    // End:0x259 [While If]
    if(i < MaxShadows)
    {
        // End:0x24f
        if(Lights[i].CurrentLight == none && SunLightActor != none)
        {
            SunLoc = Owner.Location;
            SunLoc += SunDirection * -2000.0;
            // End:0x24f
            if(IsVisible(SunLoc))
            {
                Lights[i].CurrentLight = SunLightActor;
            }
            // End:0x259
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1cf;
        }
    }
    i = 0;
    J0x260:
    // End:0x310 [While If]
    if(i < MaxShadows)
    {
        // End:0x306
        if(OrigLight[i] != Lights[i].CurrentLight)
        {
            // End:0x2ea
            if(i > 0)
            {
                // End:0x2ea
                if(OrigLight[i] == Lights[i - 1].CurrentLight || OrigLight[i] == OrigLight[i - 1])
                {
                    OrigLight[i] = none;
                }
            }
            Lights[i].LastLight = OrigLight[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x260;
    }
    SetTimer(UpdateFrequency, false);
}

function float LightPriority(float Brightness, float Radius, float Distance)
{
    local float Priority;

    Priority = Brightness * float(10) / Distance;
    // End:0x3a
    if(Distance < 0.10 * MaxLightDistance)
    {
        Priority *= 1.50;
    }
    // End:0x5c
    if(Radius < 2.0)
    {
        Priority *= Radius * 0.380;
    }
    return Priority;
}

function bool IsVisible(Vector loc)
{
    local Vector FootLocation;

    FootLocation = Owner.Location;
    FootLocation.Z -= Owner.CollisionHeight * 0.490;
    // End:0x88
    if(FastTrace(loc, Owner.Location) || FastTrace(loc, Owner.GetBoneCoords('head').Origin) || FastTrace(loc, FootLocation))
    {
        return true;
    }
}

function Tick(float dt)
{
    // End:0x0d
    if(Owner == none)
    {
        return;
    }
    UpdateShadows(dt);
}

function UpdateShadows(float dt)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xea [While If]
    if(i < Lights.Length)
    {
        // End:0x7b
        if(Lights[i].CurrentLight == none && Lights[i].LastLight == none || !bShadowActive)
        {
            // End:0x78
            if(Shadows[i] != none)
            {
                Shadows[i].DisableShadow();
            }
        }
        // End:0xe0
        else
        {
            // End:0xc0
            if(Shadows[i] == none)
            {
                Shadows[i] = SpawnShadow(rotator(Lights[i].CurrentLight.Location - Location));
            }
            Shadows[i].UpdateShadow(dt, i, self);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Effect_ShadowProjector SpawnShadow(Rotator LightRotation)
{
    local Effect_ShadowProjector NewShadow;

    NewShadow = Spawn(ShadowClass, Owner,, Location, LightRotation);
    NewShadow.Disable('Tick');
    NewShadow.InitializeFor(self);
    return NewShadow;
}

function Destroyed()
{
    local int i;

    Disable('Tick');
    i = 0;
    J0x0e:
    // End:0x4a [While If]
    if(i < MaxShadows)
    {
        // End:0x40
        if(Shadows[i] != none)
        {
            Shadows[i].Destroy();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    super.Destroyed();
}

simulated function SunLightDirectionUpdate(Vector direction)
{
    SunDirection = direction;
}

defaultproperties
{
    ShadowClass=class'Effect_ShadowProjector'
    MaxLightDistance=1300.0
    UpdateFrequency=0.10
    MaxShadows=2
    ShadowCrispness=2
    DrawType=0
    bHidden=true
    RemoteRole=0
}