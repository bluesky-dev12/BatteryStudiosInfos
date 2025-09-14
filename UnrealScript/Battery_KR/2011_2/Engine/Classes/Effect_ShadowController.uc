class Effect_ShadowController extends Actor
    config(User)
    notplaceable;

enum CrispnessEnum
{
    Low,                            // 0
    Medium,                         // 1
    High,                           // 2
    Maximum                         // 3
};

struct LightGroup
{
    var float Priority;
    var Actor CurrentLight;
    var Actor LastLight;
};

var Class<Effect_ShadowProjector> ShadowClass;
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
    foreach AllActors(Class'Engine_Decompressed.Light', LightActor)
    {
        // End:0x44
        if(int(LightActor.LightEffect) == int(20))
        {
            SunLights[i] = LightActor;
            i++;
            // End:0x87
            continue;
        }
        // End:0x87
        if((int(LightActor.LightType) != int(0)) && LightActor.LightBrightness > float(1))
        {
            LightList[LightList.Length] = LightActor;
        }        
    }    
    i = 0;
    J0x90:

    // End:0xEF [Loop If]
    if(i < SunLights.Length)
    {
        // End:0xE5
        if((SunLightActor == none) || SunLightActor.LightBrightness < SunLights[i].LightBrightness)
        {
            SunLightActor = SunLights[i];
        }
        i++;
        // [Loop Continue]
        goto J0x90;
    }
    Shadows.Insert(0, MaxShadows);
    Lights.Insert(0, MaxShadows);
    bShadowActive = true;
    FillLights();
    //return;    
}

function Timer()
{
    FillLights();
    //return;    
}

function FillLights()
{
    local int i, j;
    local array<Actor> OrigLight;
    local float diff;
    local Vector SunLoc;

    // End:0x0D
    if(Owner == none)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0x71 [Loop If]
    if(i < MaxShadows)
    {
        OrigLight[i] = Lights[i].CurrentLight;
        Lights[i].CurrentLight = none;
        Lights[i].Priority = 10000.0000000;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    SetLocation(Owner.Location);
    // End:0x8F
    if(!bShadowActive)
    {
        return;
    }
    i = 0;
    J0x96:

    // End:0x1C8 [Loop If]
    if(i < LightList.Length)
    {
        diff = VSize(LightList[i].Location - Owner.Location);
        // End:0x1BE
        if((((LightList[i].bDynamicLight && diff < MaxLightDistance) && LightList[i].LightRadius >= (diff * 0.0410000)) && diff > (Owner.CollisionRadius * 0.5000000)) && IsVisible(LightList[i].Location))
        {
            j = 1;
            J0x169:

            // End:0x1A6 [Loop If]
            if(j < MaxShadows)
            {
                Lights[j].CurrentLight = Lights[j - 1].CurrentLight;
                j++;
                // [Loop Continue]
                goto J0x169;
            }
            Lights[0].CurrentLight = LightList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x96;
    }
    i = 0;
    J0x1CF:

    // End:0x259 [Loop If]
    if(i < MaxShadows)
    {
        // End:0x24F
        if((Lights[i].CurrentLight == none) && SunLightActor != none)
        {
            SunLoc = Owner.Location;
            SunLoc += (SunDirection * -2000.0000000);
            // End:0x24F
            if(IsVisible(SunLoc))
            {
                Lights[i].CurrentLight = SunLightActor;
                // [Explicit Break]
                goto J0x259;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1CF;
    }
    J0x259:

    i = 0;
    J0x260:

    // End:0x310 [Loop If]
    if(i < MaxShadows)
    {
        // End:0x306
        if(OrigLight[i] != Lights[i].CurrentLight)
        {
            // End:0x2EA
            if(i > 0)
            {
                // End:0x2EA
                if((OrigLight[i] == Lights[i - 1].CurrentLight) || OrigLight[i] == OrigLight[i - 1])
                {
                    OrigLight[i] = none;
                }
            }
            Lights[i].LastLight = OrigLight[i];
        }
        i++;
        // [Loop Continue]
        goto J0x260;
    }
    SetTimer(UpdateFrequency, false);
    //return;    
}

function float LightPriority(float Brightness, float Radius, float Distance)
{
    local float Priority;

    Priority = (Brightness * float(10)) / Distance;
    // End:0x3A
    if(Distance < (0.1000000 * MaxLightDistance))
    {
        Priority *= 1.5000000;
    }
    // End:0x5C
    if(Radius < 2.0000000)
    {
        Priority *= (Radius * 0.3800000);
    }
    return Priority;
    //return;    
}

function bool IsVisible(Vector loc)
{
    local Vector FootLocation;

    FootLocation = Owner.Location;
    FootLocation.Z -= (Owner.CollisionHeight * 0.4900000);
    // End:0x88
    if((FastTrace(loc, Owner.Location) || FastTrace(loc, Owner.GetBoneCoords('head').Origin)) || FastTrace(loc, FootLocation))
    {
        return true;
    }
    //return;    
}

function Tick(float dt)
{
    // End:0x0D
    if(Owner == none)
    {
        return;
    }
    UpdateShadows(dt);
    //return;    
}

function UpdateShadows(float dt)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xEA [Loop If]
    if(i < Lights.Length)
    {
        // End:0x7B
        if(((Lights[i].CurrentLight == none) && Lights[i].LastLight == none) || !bShadowActive)
        {
            // End:0x78
            if(Shadows[i] != none)
            {
                Shadows[i].DisableShadow();
            }
            // [Explicit Continue]
            goto J0xE0;
        }
        // End:0xC0
        if(Shadows[i] == none)
        {
            Shadows[i] = SpawnShadow(Rotator(Lights[i].CurrentLight.Location - Location));
        }
        Shadows[i].UpdateShadow(dt, i, self);
        J0xE0:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Effect_ShadowProjector SpawnShadow(Rotator LightRotation)
{
    local Effect_ShadowProjector NewShadow;

    NewShadow = Spawn(ShadowClass, Owner,, Location, LightRotation);
    NewShadow.Disable('Tick');
    NewShadow.InitializeFor(self);
    return NewShadow;
    //return;    
}

function Destroyed()
{
    local int i;

    Disable('Tick');
    i = 0;
    J0x0E:

    // End:0x4A [Loop If]
    if(i < MaxShadows)
    {
        // End:0x40
        if(Shadows[i] != none)
        {
            Shadows[i].Destroy();
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    super.Destroyed();
    //return;    
}

simulated function SunLightDirectionUpdate(Vector direction)
{
    SunDirection = direction;
    //return;    
}

defaultproperties
{
    ShadowClass=Class'Engine_Decompressed.Effect_ShadowProjector'
    MaxLightDistance=1300.0000000
    UpdateFrequency=0.1000000
    MaxShadows=2
    ShadowCrispness=2
    DrawType=0
    bHidden=true
    RemoteRole=0
}