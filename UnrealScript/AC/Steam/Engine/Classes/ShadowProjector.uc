/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ShadowProjector.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:7
 *
 *******************************************************************************/
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
}

event Destroyed()
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

function InitShadow()
{
    local Plane BoundingSphere;

    // End:0x1dd
    if(ShadowActor != none)
    {
        BoundingSphere = ShadowActor.GetRenderBoundingSphere();
        FOV = int(Atan(BoundingSphere.W * float(2) + float(160), LightDistance) * float(180) / 3.1415930);
        // End:0x86
        if(bBlobShadow)
        {
            ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialLow'));
        }
        // End:0xae
        else
        {
            ShadowTexture = ShadowBitmapMaterial(Level.ObjectPool.AllocateObject(class'Effect_ShadowBitmapMaterialHigh'));
        }
        ProjTexture = ShadowTexture;
        // End:0x1a6
        if(ShadowTexture != none)
        {
            SetDrawScale(LightDistance * Tan(0.50 * float(FOV) * 3.1415930 / float(180)) / 0.50 * float(ShadowTexture.USize));
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
        // End:0x1da
        else
        {
            Log(string(Name) $ ".InitShadow: Failed to allocate texture");
        }
    }
    // End:0x1ff
    else
    {
        Log(string(Name) $ ".InitShadow: No actor");
    }
}

function UpdateShadow()
{
    local Coords C;
    local Vector V;

    DetachProjector(true);
    // End:0x153
    if(ShadowActor != none && !ShadowActor.bHidden && Level.TimeSeconds - ShadowActor.LastRenderTime < float(4) && ShadowTexture != none && bShadowActive)
    {
        // End:0x81
        if(ShadowTexture.Invalid)
        {
            Destroy();
        }
        // End:0x153
        else
        {
            // End:0xe8
            if(RootMotion && ShadowActor.DrawType == 2 && ShadowActor.Mesh != none)
            {
                C = ShadowActor.GetBoneCoords('None');
                V = C.Origin;
            }
            // End:0xfc
            else
            {
                V = ShadowActor.Location;
            }
            SetLocation(V);
            SetRotation(rotator(Normal(-LightDirection)));
            ShadowTexture.LightDirection = Normal(LightDirection);
            ShadowTexture.LightDistance = LightDistance;
            ShadowTexture.Dirty = true;
            AttachProjector();
        }
    }
}

function Tick(float DeltaTime)
{
    UpdateShadow();
}

simulated function UpdateSunLight(Vector SunDir)
{
    LightDirection = -SunDir;
    LightDistance = 400.0;
}

simulated function LightUpdate(array<Actor> LightSources)
{
    local float MeanDistance, dx, sdx2;
    local Vector MeanDirection, dv;
    local int LightCount, i;

    // End:0x19
    if(LightSources.Length == 0)
    {
        LightDistance = 0.0;
        return;
    }
    LightCount = LightSources.Length;
    i = 0;
    J0x2c:
    // End:0xdd [While If]
    if(i < LightCount)
    {
        dx += VSize(LightSources[i].Location - Owner.Location);
        dv += LightSources[i].Location - Owner.Location;
        sdx2 += 1.0 / dx * dx;
        MeanDistance += dx;
        MeanDirection += dv / dx * dx;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    MeanDistance /= float(LightCount);
    MeanDirection /= sdx2;
    LightDistance = float(Clamp(int(MeanDistance), 150, 400));
    LightDirection = Normal(MeanDirection);
}

defaultproperties
{
    bShadowActive=true
    bProjectActor=true
    bClipBSP=true
    bGradient=true
    bProjectOnAlpha=true
    bProjectOnParallelBSP=true
    bDynamicAttach=true
    CullDistance=1200.0
    bStatic=true
    bOwnerNoSee=true
}