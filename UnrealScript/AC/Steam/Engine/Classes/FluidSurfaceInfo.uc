/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FluidSurfaceInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:48
 *	Functions:3
 *
 *******************************************************************************/
class FluidSurfaceInfo extends Info
    native
    noexport
    placeable;

enum EFluidGridType
{
    FGT_Square,
    FGT_Hexagonal
};

var() FluidSurfaceInfo.EFluidGridType FluidGridType;
var() float FluidGridSpacing;
var() int FluidXSize;
var() int FluidYSize;
var() float FluidHeightScale;
var() float FluidSpeed;
var() float FluidTimeScale;
var() float FluidDamping;
var() float FluidNoiseFrequency;
var() Range FluidNoiseStrength;
var() bool TestRipple;
var() float TestRippleSpeed;
var() float TestRippleStrength;
var() float TestRippleRadius;
var() float UTiles;
var() float UOffset;
var() float VTiles;
var() float VOffset;
var() float AlphaCurveScale;
var() float AlphaHeightScale;
var() byte AlphaMax;
var() float ShootStrength;
var() float ShootRadius;
var() float RippleVelocityFactor;
var() float TouchStrength;
var() class<Actor> ShootEffect;
var() bool OrientShootEffect;
var() class<Actor> TouchEffect;
var() bool OrientTouchEffect;
var const array<int> ClampBitmap;
var() edfindable TerrainInfo ClampTerrain;
var() bool bShowBoundingBox;
var() bool bUseNoRenderZ;
var() float NoRenderZ;
var() float WarmUpTime;
var() float UpdateRate;
var() Color FluidColor;
var const transient array<float> Verts0;
var const transient array<float> Verts1;
var const transient array<byte> VertAlpha;
var const transient int LatestVerts;
var const transient Box FluidBoundingBox;
var const transient Vector FluidOrigin;
var const transient float TimeRollover;
var const transient float TestRippleAng;
var const transient FluidSurfacePrimitive Primitive;
var const transient array<FluidSurfaceOscillator> Oscillators;
var const transient bool bHasWarmedUp;

// Export UFluidSurfaceInfo::execPling(FFrame&, void* const)
native final function Pling(Vector Position, float Strength, optional float Radius);
simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x18
    if(DamageType.default.FluidSurfaceShootStrengthMod ~= float(0))
    {
        return;
    }
    Pling(HitLocation, ShootStrength * DamageType.default.FluidSurfaceShootStrengthMod, ShootRadius);
    // End:0x8a
    if(ShootEffect != none && EffectIsRelevant(HitLocation, false))
    {
        // End:0x7b
        if(OrientShootEffect)
        {
            Spawn(ShootEffect, self,, HitLocation, rotator(Momentum));
        }
        // End:0x8a
        else
        {
            Spawn(ShootEffect, self,, HitLocation);
        }
    }
}

simulated function Touch(Actor Other)
{
    local Vector touchLocation;

    super(Actor).Touch(Other);
    // End:0x2e
    if(Other == none || !Other.bDisturbFluidSurface)
    {
        return;
    }
    touchLocation = Other.Location;
    Pling(touchLocation, ShootStrength * Other.FluidSurfaceShootStrengthMod, Other.CollisionRadius);
    touchLocation.Z = Location.Z;
    // End:0xdb
    if(TouchEffect != none && EffectIsRelevant(touchLocation, false))
    {
        // End:0xcc
        if(OrientTouchEffect)
        {
            Spawn(TouchEffect, self,, touchLocation, rotator(Other.Velocity));
        }
        // End:0xdb
        else
        {
            Spawn(TouchEffect, self,, touchLocation);
        }
    }
}

defaultproperties
{
    FluidGridType=1
    FluidGridSpacing=24.0
    FluidXSize=48
    FluidYSize=48
    FluidHeightScale=1.0
    FluidSpeed=170.0
    FluidTimeScale=1.0
    FluidDamping=0.50
    FluidNoiseFrequency=60.0
    FluidNoiseStrength=(Min=-70.0,Max=70.0)
    TestRippleSpeed=3000.0
    TestRippleStrength=-20.0
    TestRippleRadius=48.0
    UTiles=1.0
    VTiles=1.0
    AlphaHeightScale=10.0
    AlphaMax=128
    ShootStrength=-50.0
    RippleVelocityFactor=-0.050
    TouchStrength=-50.0
    WarmUpTime=2.0
    UpdateRate=50.0
    DrawType=13
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_FluidSurf'
    bUnlit=true
    bCollideActors=true
    bEdShouldSnap=true
}