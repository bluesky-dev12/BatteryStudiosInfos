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
    //return;    
}

function Tick(float dt)
{
    //return;    
}

function DisableShadow()
{
    DetachProjector();
    // End:0x32
    if(ShadowTexture != none)
    {
        ShadowTexture.Dirty = false;
        ShadowTexture.ShadowActor = none;
    }
    //return;    
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
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine_Decompressed.Effect_ShadowBitmapMaterialMedium'));
                // End:0xF3
                break;
            // End:0x95
            case 2:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine_Decompressed.Effect_ShadowBitmapMaterialHigh'));
                // End:0xF3
                break;
            // End:0xC5
            case 3:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine_Decompressed.Effect_ShadowBitmapMaterialMax'));
                // End:0xF3
                break;
            // End:0xFFFF
            default:
                ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine_Decompressed.Effect_ShadowBitmapMaterialLow'));
                // End:0xF3
                break;
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
        else
        {
            Log(string(Name) $ ".InitializeFor: No shadow texture!  Escaping...");
            Destroy();
        }        
    }
    else
    {
        Log(string(Name) $ ".InitializeFor: No Owner!");
    }
    //return;    
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
    if(((Owner == none) || Owner.bHidden) || ShadowTexture == none)
    {
        return;
    }
    // End:0x4C
    if(ShadowTexture.Invalid)
    {
        Destroy();
        return;
    }
    // End:0x88
    if((Level.TimeSeconds - Owner.LastRenderTime) > float(5))
    {
        CullDistance = 0.5000000 * default.CullDistance;        
    }
    else
    {
        CullDistance = default.CullDistance;
    }
    // End:0xC3
    if(Level.bDropDetail)
    {
        ShadowTexture.CullDistance = 0.6000000 * CullDistance;        
    }
    else
    {
        ShadowTexture.CullDistance = CullDistance;
    }
    ShadowTexture.ShadowActor = Owner;
    ShadowLight = ShadowController.Lights[LN].CurrentLight;
    // End:0x1A0
    if(ShadowController.Lights[LN].LastLight != none)
    {
        // End:0x16A
        if(int(ShadowTexture.ShadowDarkness) > 5)
        {
            ShadowLight = ShadowController.Lights[LN].LastLight;
            bFadeOut = true;            
        }
        else
        {
            ShadowController.Lights[LN].LastLight = none;
            bFadeOut = false;
            bFadeIn = true;
            DarknessScale = 0.0000000;
        }
    }
    // End:0x1AD
    if(ShadowLight == none)
    {
        return;
    }
    diff = ShadowLight.Location - Owner.Location;
    // End:0x208
    if(int(ShadowLight.LightEffect) == int(20))
    {
        LightDistance = ShadowController.MaxLightDistance * 0.3000000;        
    }
    else
    {
        LightDistance = FClamp(VSize(diff), ShadowController.MaxLightDistance * 0.1000000, ShadowController.MaxLightDistance * 0.3000000);
    }
    ShadowLocation = Owner.Location + (float(4) * Normal(diff));
    // End:0x2AA
    if(ShadowLocation.Z < Owner.Location.Z)
    {
        ShadowLocation.Z = Owner.Location.Z + float(4);
    }
    SetLocation(ShadowLocation + vect(0.0000000, 0.0000000, -8.0000000));
    Origin = ShadowLocation + (ShadowTexture.LightDirection * ShadowTexture.LightDistance);
    Interpolation = FMin(1.0000000, dt * InterpolationRate);
    Origin += ((ShadowLight.Location - Origin) * Interpolation);
    diff = ShadowLocation - Origin;
    LightRotation = Rotator(diff);
    BoundingSphere = Owner.GetRenderBoundingSphere();
    FOV = int((Atan((BoundingSphere.W * float(2)) + float(160), LightDistance) * float(180)) / 3.1415927);
    AdjustedRotation = Rotator(Owner.Location - ShadowLight.Location);
    AdjustedRotation.Pitch = Clamp(AdjustedRotation.Pitch, -20500, -9500);
    SetRotation(AdjustedRotation);
    LightDirection = -Vector(AdjustedRotation) * LightDistance;
    ShadowTexture.LightDirection = Normal(LightDirection);
    ShadowTexture.LightDistance = LightDistance;
    ShadowTexture.LightFOV = float(FOV);
    SetDrawScale(((LightDistance * 0.8200000) * Tan(((0.5000000 * float(FOV)) * 3.1415927) / float(180))) / (0.4500000 * float(ShadowTexture.USize)));
    // End:0x4BD
    if(bFadeOut)
    {
        ShadowTexture.ShadowDarkness = byte(Max(int(float(ShadowTexture.ShadowDarkness) - (FadeSpeed * dt)), 0));        
    }
    else
    {
        // End:0x4EC
        if(int(ShadowLight.LightEffect) == int(20))
        {
            ShadowTexture.ShadowDarkness = byte(255);            
        }
        else
        {
            ShadowTexture.ShadowDarkness = byte((float(140) * (1.0000000 - FClamp(VSize(ShadowLight.Location - Owner.Location) / ShadowController.MaxLightDistance, 0.0000000, 1.0000000))) + float(70));
        }
        // End:0x5B8
        if(bFadeIn && DarknessScale < 1.0000000)
        {
            DarknessScale = FMin(DarknessScale + ((FadeSpeed * 0.0070000) * dt), 1.0000000);
            ShadowTexture.ShadowDarkness = byte(float(ShadowTexture.ShadowDarkness) * DarknessScale);            
        }
        else
        {
            bFadeIn = false;
        }
    }
    ShadowTexture.Dirty = true;
    AttachProjector();
    //return;    
}

function Destroyed()
{
    // End:0x5A
    if(ShadowTexture != none)
    {
        ShadowTexture.ShadowActor = none;
        // End:0x4C
        if(!ShadowTexture.Invalid)
        {
            Level.ObjectPool.FreeObject(ShadowTexture);
        }
        ShadowTexture = none;
        ProjTexture = none;
    }
    super(Actor).Destroyed();
    //return;    
}

defaultproperties
{
    InterpolationRate=2.5000000
    MaxFOV=80.0000000
    FadeSpeed=500.0000000
    MaxTraceDistance=500
    bProjectActor=false
    bClipBSP=true
    bProjectOnParallelBSP=true
    bDynamicAttach=true
    bNoProjectOnOwner=true
    CullDistance=1200.0000000
    bStatic=false
    bOwnerNoSee=true
}