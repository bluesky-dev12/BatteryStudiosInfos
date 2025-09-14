/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Effect_ShadowProjector.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:6
 *
 *******************************************************************************/
class Effect_ShadowProjector extends Projector
    placeable;

var() Vector LightDirection;
var() float LightDistance;
var() float InterpolationRate;
var() float MaxFOV;
var() float FadeSpeed;
var() float DarknessScale;
var ShadowBitmapMaterial ShadowTexture;
var bool bFadeIn;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
}

function Tick(float dt);
function DisableShadow()
{
    DetachProjector();
    // End:0x32
    if(ShadowTexture != none)
    {
        ShadowTexture.Dirty = false;
        ShadowTexture.ShadowActor = none;
    }
}

function InitializeFor(Effect_ShadowController ShadowController)
{
    // End:0x198
    if(ShadowController.Owner != none)
    {
        SetOwner(ShadowController.Owner);
        switch(ShadowController.ShadowCrispness)
        {
            // End:0x65
            case 1:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialMedium'));
                // End:0xf3
                break;
            // End:0x95
            case 2:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialHigh'));
                // End:0xf3
                break;
            // End:0xc5
            case 3:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialMax'));
                // End:0xf3
                break;
            // End:0xffff
            default:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialLow'));
                // End:0xf3 Break;
                break;
        }
        ProjTexture = ShadowTexture;
        // End:0x156
        if(ShadowTexture != none)
        {
            ShadowTexture.Invalid = false;
            ShadowTexture.ShadowActor = Owner;
            ShadowTexture.bBlobShadow = false;
            ShadowTexture.CullDistance = CullDistance;
        }
        // End:0x195
        else
        {
            Log(string(Name) $ ".InitializeFor: No shadow texture!  Escaping...");
            Destroy();
        }
    }
    // End:0x1be
    else
    {
        Log(string(Name) $ ".InitializeFor: No Owner!");
    }
}

function UpdateShadow(float dt, int LN, Effect_ShadowController ShadowController)
{
    local Plane BoundingSphere;
    local Actor ShadowLight;
    local Vector diff, ShadowLocation, Origin;
    local Rotator LightRotation, AdjustedRotation;
    local float Interpolation;
    local bool bFadeOut;

    DetachProjector(true);
    // End:0x35
    if(Owner == none || Owner.bHidden || ShadowTexture == none)
    {
        return;
    }
    // End:0x4c
    if(ShadowTexture.Invalid)
    {
        Destroy();
        return;
    }
    // End:0x88
    if(Level.TimeSeconds - Owner.LastRenderTime > float(5))
    {
        CullDistance = 0.50 * default.CullDistance;
    }
    // End:0x93
    else
    {
        CullDistance = default.CullDistance;
    }
    // End:0xc3
    if(Level.bDropDetail)
    {
        ShadowTexture.CullDistance = 0.60 * CullDistance;
    }
    // End:0xd7
    else
    {
        ShadowTexture.CullDistance = CullDistance;
    }
    ShadowTexture.ShadowActor = Owner;
    ShadowLight = ShadowController.Lights[LN].CurrentLight;
    // End:0x1a0
    if(ShadowController.Lights[LN].LastLight != none)
    {
        // End:0x16a
        if(ShadowTexture.ShadowDarkness > 5)
        {
            ShadowLight = ShadowController.Lights[LN].LastLight;
            bFadeOut = true;
        }
        // End:0x1a0
        else
        {
            ShadowController.Lights[LN].LastLight = none;
            bFadeOut = false;
            bFadeIn = true;
            DarknessScale = 0.0;
        }
    }
    // End:0x1ad
    if(ShadowLight == none)
    {
        return;
    }
    diff = ShadowLight.Location - Owner.Location;
    // End:0x208
    if(ShadowLight.LightEffect == 20)
    {
        LightDistance = ShadowController.MaxLightDistance * 0.30;
    }
    // End:0x241
    else
    {
        LightDistance = FClamp(VSize(diff), ShadowController.MaxLightDistance * 0.10, ShadowController.MaxLightDistance * 0.30);
    }
    ShadowLocation = Owner.Location + float(4) * Normal(diff);
    // End:0x2aa
    if(ShadowLocation.Z < Owner.Location.Z)
    {
        ShadowLocation.Z = Owner.Location.Z + float(4);
    }
    SetLocation(ShadowLocation + vect(0.0, 0.0, -8.0));
    Origin = ShadowLocation + ShadowTexture.LightDirection * ShadowTexture.LightDistance;
    Interpolation = FMin(1.0, dt * InterpolationRate);
    Origin += ShadowLight.Location - Origin * Interpolation;
    diff = ShadowLocation - Origin;
    LightRotation = rotator(diff);
    BoundingSphere = Owner.GetRenderBoundingSphere();
    FOV = int(Atan(BoundingSphere.W * float(2) + float(160), LightDistance) * float(180) / 3.1415930);
    AdjustedRotation = rotator(Owner.Location - ShadowLight.Location);
    AdjustedRotation.Pitch = Clamp(AdjustedRotation.Pitch, -20500, -9500);
    SetRotation(AdjustedRotation);
    LightDirection = -vector(AdjustedRotation) * LightDistance;
    ShadowTexture.LightDirection = Normal(LightDirection);
    ShadowTexture.LightDistance = LightDistance;
    ShadowTexture.LightFOV = float(FOV);
    SetDrawScale(LightDistance * 0.820 * Tan(0.50 * float(FOV) * 3.1415930 / float(180)) / 0.450 * float(ShadowTexture.USize));
    // End:0x4bd
    if(bFadeOut)
    {
        ShadowTexture.ShadowDarkness = byte(Max(int(float(ShadowTexture.ShadowDarkness) - FadeSpeed * dt), 0));
    }
    // End:0x5c0
    else
    {
        // End:0x4ec
        if(ShadowLight.LightEffect == 20)
        {
            ShadowTexture.ShadowDarkness = byte(255);
        }
        // End:0x54c
        else
        {
            ShadowTexture.ShadowDarkness = byte(float(140) * 1.0 - FClamp(VSize(ShadowLight.Location - Owner.Location) / ShadowController.MaxLightDistance, 0.0, 1.0) + float(70));
        }
        // End:0x5b8
        if(bFadeIn && DarknessScale < 1.0)
        {
            DarknessScale = FMin(DarknessScale + FadeSpeed * 0.0070 * dt, 1.0);
            ShadowTexture.ShadowDarkness = byte(float(ShadowTexture.ShadowDarkness) * DarknessScale);
        }
        // End:0x5c0
        else
        {
            bFadeIn = false;
        }
    }
    ShadowTexture.Dirty = true;
    AttachProjector();
}

function Destroyed()
{
    // End:0x5a
    if(ShadowTexture != none)
    {
        ShadowTexture.ShadowActor = none;
        // End:0x4c
        if(!ShadowTexture.Invalid)
        {
            Level.ObjectPool.FreeObject(ShadowTexture);
        }
        ShadowTexture = none;
        ProjTexture = none;
    }
    super(Actor).Destroyed();
}

defaultproperties
{
    InterpolationRate=2.50
    MaxFOV=80.0
    FadeSpeed=500.0
    MaxTraceDistance=500
    bProjectActor=true
    bClipBSP=true
    bProjectOnParallelBSP=true
    bDynamicAttach=true
    bNoProjectOnOwner=true
    CullDistance=1200.0
    bStatic=true
    bOwnerNoSee=true
}