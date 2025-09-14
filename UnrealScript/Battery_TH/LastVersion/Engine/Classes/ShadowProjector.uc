class ShadowProjector extends Projector
    placeable;

var() Actor ShadowActor;
var() Vector LightLocation;
var() Vector LightDirection;
var() float LightDistance;
var() bool RootMotion;
var() bool bBlobShadow;
var() bool bShadowActive;
var ShadowBitmapMaterial ShadowTexture;

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

event Destroyed()
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

function InitShadow()
{
    local Plane BoundingSphere;

    // End:0x1DD
    if(ShadowActor != none)
    {
        BoundingSphere = ShadowActor.GetRenderBoundingSphere();
        FOV = int((Atan((BoundingSphere.W * float(2)) + float(160), LightDistance) * float(180)) / 3.1415927);
        // End:0x86
        if(bBlobShadow)
        {
            ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine.Effect_ShadowBitmapMaterialLow'));            
        }
        else
        {
            ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(Class'Engine.Effect_ShadowBitmapMaterialHigh'));
        }
        ProjTexture = ShadowTexture;
        // End:0x1A6
        if(ShadowTexture != none)
        {
            SetDrawScale((LightDistance * Tan(((0.5000000 * float(FOV)) * 3.1415927) / float(180))) / (0.5000000 * float(ShadowTexture.USize)));
            ShadowTexture.Invalid = false;
            ShadowTexture.bBlobShadow = bBlobShadow;
            ShadowTexture.ShadowActor = ShadowActor;
            ShadowTexture.LightDirection = Normal(LightDirection);
            ShadowTexture.LightDistance = LightDistance;
            ShadowTexture.LightFOV = float(FOV);
            ShadowTexture.CullDistance = CullDistance;
            Enable('Tick');
            UpdateShadow();            
        }
        else
        {
            Log(string(Name) $ ".InitShadow: Failed to allocate texture");
        }        
    }
    else
    {
        Log(string(Name) $ ".InitShadow: No actor");
    }
    //return;    
}

function UpdateShadow()
{
    local Coords C;
    local Vector V;

    DetachProjector(true);
    // End:0x153
    if(((((ShadowActor != none) && !ShadowActor.bHidden) && (Level.TimeSeconds - ShadowActor.LastRenderTime) < float(4)) && ShadowTexture != none) && bShadowActive)
    {
        // End:0x81
        if(ShadowTexture.Invalid)
        {
            Destroy();            
        }
        else
        {
            // End:0xE8
            if((RootMotion && int(ShadowActor.DrawType) == int(2)) && ShadowActor.Mesh != none)
            {
                C = ShadowActor.GetBoneCoords('None');
                V = C.Origin;                
            }
            else
            {
                V = ShadowActor.Location;
            }
            SetLocation(V);
            SetRotation(Rotator(Normal(-LightDirection)));
            ShadowTexture.LightDirection = Normal(LightDirection);
            ShadowTexture.LightDistance = LightDistance;
            ShadowTexture.Dirty = true;
            AttachProjector();
        }
    }
    //return;    
}

function Tick(float DeltaTime)
{
    UpdateShadow();
    //return;    
}

simulated function UpdateSunLight(Vector SunDir)
{
    LightDirection = -SunDir;
    LightDistance = 400.0000000;
    //return;    
}

simulated function LightUpdate(array<Actor> LightSources)
{
    local float MeanDistance, dx, sdx2;
    local Vector MeanDirection, dv;
    local int LightCount, i;

    // End:0x19
    if(LightSources.Length == 0)
    {
        LightDistance = 0.0000000;
        return;
    }
    LightCount = LightSources.Length;
    i = 0;
    J0x2C:

    // End:0xDD [Loop If]
    if(i < LightCount)
    {
        dx += VSize(LightSources[i].Location - Owner.Location);
        dv += (LightSources[i].Location - Owner.Location);
        sdx2 += (1.0000000 / (dx * dx));
        MeanDistance += dx;
        MeanDirection += (dv / (dx * dx));
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    MeanDistance /= float(LightCount);
    MeanDirection /= sdx2;
    LightDistance = float(Clamp(int(MeanDistance), 150, 400));
    LightDirection = Normal(MeanDirection);
    //return;    
}

defaultproperties
{
    bShadowActive=true
    bProjectActor=false
    bClipBSP=true
    bGradient=true
    bProjectOnAlpha=true
    bProjectOnParallelBSP=true
    bDynamicAttach=true
    CullDistance=1200.0000000
    bStatic=false
    bOwnerNoSee=true
}