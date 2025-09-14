/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wEmitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:3
 *	Properties:91
 *	Functions:6
 *
 *******************************************************************************/
class wEmitter extends Actor
    native
    placeable;

enum ExParticleTypes
{
    PT_Sprite,
    PT_Stream,
    PT_Line,
    PT_Disc,
    PT_Mesh,
    PT_Branch,
    PT_Beam
};

enum ExSpawningTypes
{
    ST_Sphere,
    ST_Line,
    ST_Disc,
    ST_Cylinder,
    ST_AimedSphere,
    ST_StaticMesh,
    ST_Explode,
    ST_ExplodeRing,
    ST_OwnerSkeleton,
    ST_Test
};

enum EAttenFunc
{
    ATF_LerpInOut,
    ATF_ExpInOut,
    ATF_SmoothStep,
    ATF_Pulse,
    ATF_Random,
    ATF_None
};

var(PclEmitter) wEmitter.ExParticleTypes mParticleType;
var(PclEmitter) wEmitter.ExSpawningTypes mSpawningType;
var(PclEmitter) bool mRegen;
var(PclEmitter) bool mRegenPause;
var(PclEmitter) float mRegenOnTime[2];
var(PclEmitter) float mRegenOffTime[2];
var(PclEmitter) int mStartParticles;
var(PclEmitter) private int mMaxParticles;
var(PclEmitter) float mDelayRange[2];
var(PclEmitter) float mLifeRange[2];
var(PclEmitter) float mRegenRange[2];
var(PclEmitter) float mRegenDist;
var(PclEmitter) name mSourceActor;
var(PclEmitter) name mChildName;
var wEmitter mChildEmitter;
var(PclEmitter) StaticMeshActor SourceStaticMesh;
var(PclEmitter) bool bSuspendWhenNotVisible;
var(PclVisuals) bool mDistanceAtten;
var(PclMovement) Vector mDirDev;
var(PclMovement) Vector mPosDev;
var(PclMovement) Vector mSpawnVecA;
var(PclMovement) Vector mSpawnVecB;
var(PclMovement) float mSpeedRange[2];
var(PclMovement) bool mPosRelative;
var(PclMovement) float mMassRange[2];
var(PclMovement) float mAirResistance;
var(PclMovement) bool mCollision;
var(PclMovement) float mOwnerVelocityFactor;
var(PclVisuals) bool mRandOrient;
var(PclMovement) float mSpinRange[2];
var(PclVisuals) float mSizeRange[2];
var(PclVisuals) float mGrowthRate;
var(PclVisuals) Color mColorRange[2];
var(PclVisuals) bool mAttenuate;
var(PclVisuals) float mAttenKa;
var(PclVisuals) float mAttenKb;
var(PclVisuals) wEmitter.EAttenFunc mAttenFunc;
var int mpAttenFunc;
var(PclVisuals) bool mRandTextures;
var(PclVisuals) bool mTileAnimation;
var(PclVisuals) int mNumTileColumns;
var(PclVisuals) int mNumTileRows;
var(PclVisuals) bool mUseMeshNodes;
var(PclVisuals) bool mRandMeshes;
var(PclVisuals) StaticMesh mMeshNodes[8];
var(PclVisuals) Texture mPosColorMapXY;
var(PclVisuals) Texture mPosColorMapXZ;
var(PclVisuals) Texture mLifeColorMap;
var(PclSoftBody) float springK;
var(PclSoftBody) float springD;
var(PclSoftBody) float springMaxStretch;
var(PclSoftBody) float springMaxCompress;
var(PclMovement) float mColElasticity;
var(PclMovement) float mAttraction;
var(PclMovement) bool mColMakeSound;
var(pclBeam) float mWaveFrequency;
var(pclBeam) float mWaveAmplitude;
var(pclBeam) float mWaveShift;
var(pclBeam) float mBendStrength;
var(pclBeam) bool mWaveLockEnd;
var(Force) bool bForceAffected;
var transient int SystemHandle;
var transient int Expire;
var transient pointer mpParticles;
var transient int mNumActivePcl;
var transient pointer mpIterator;
var transient int mbSpinningNodes;
var transient Vector mLastPos;
var transient Vector mLastVector;
var transient float mTime;
var transient float mT;
var transient float mRegenBias;
var transient float mRegenTimer;
var transient float mPauseTimer;
var transient Box mBounds;
var transient Plane mSphere;
var transient Vector mDir;
var transient int mNumUpdates;
var transient int mAtLeastOneFrame;
var transient int mRenderableVerts;
var transient float mTexU;
var transient float mTexV;
var transient float mTotalTiles;
var transient float mInvTileCols;
var transient pointer mpSprings;
var transient int mNumSprings;
var transient float mWavePhaseA;
var transient float mWavePhaseB;
var bool blockOnNet;
var bool bCallPreSpawn;
var transient int mHeadIndex;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        mSpawnVecA, blockOnNet;

}

event CollisionSound();
event PreSpawned()
{
    // End:0xba
    if(!Level.bStartup)
    {
        bSuspendWhenNotVisible = false;
        // End:0xba
        if(Level.bDropDetail && mMaxParticles > 5 && mParticleType == 0 || mParticleType == 4 || mParticleType == 2)
        {
            mMaxParticles = int(float(mMaxParticles) * 0.650);
            mRegenRange[0] *= 0.80;
            mRegenRange[1] *= 0.80;
            mStartParticles = int(0.650 * float(mStartParticles));
        }
    }
}

final simulated function float ClampToMaxParticles(float InPart)
{
    return FMin(InPart, float(mStartParticles));
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    mRegenPause = !mRegenPause;
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x1f
    if(mPosColorMapXY != none)
    {
        Level.AddPrecacheMaterial(mPosColorMapXY);
    }
    // End:0x3e
    if(mPosColorMapXZ != none)
    {
        Level.AddPrecacheMaterial(mPosColorMapXZ);
    }
    // End:0x5d
    if(mLifeColorMap != none)
    {
        Level.AddPrecacheMaterial(mLifeColorMap);
    }
    super.UpdatePrecacheMaterials();
}

static function PrecacheContent(LevelInfo Level)
{
    // End:0x1f
    if(default.mPosColorMapXY != none)
    {
        Level.AddPrecacheMaterial(default.mPosColorMapXY);
    }
    // End:0x3e
    if(default.mPosColorMapXZ != none)
    {
        Level.AddPrecacheMaterial(default.mPosColorMapXZ);
    }
    // End:0x5d
    if(default.mLifeColorMap != none)
    {
        Level.AddPrecacheMaterial(default.mLifeColorMap);
    }
    // End:0x7f
    if(default.Skins.Length > 0)
    {
        Level.AddPrecacheMaterial(default.Skins[0]);
    }
}

defaultproperties
{
    mRegen=true
    mStartParticles=1
    mMaxParticles=50
    mLifeRange[0]=4.0
    mLifeRange[1]=4.0
    mRegenRange[0]=1.0
    mRegenRange[1]=1.0
    bSuspendWhenNotVisible=true
    mSpawnVecB=(X=0.0,Y=0.0,Z=0.050)
    mSpeedRange[0]=40.0
    mSpeedRange[1]=40.0
    mAirResistance=0.40
    mSizeRange[0]=10.0
    mSizeRange[1]=10.0
    mColorRange[0]=(R=255,G=255,B=255,A=255)
    mColorRange[1]=(R=255,G=255,B=255,A=255)
    mAttenuate=true
    mAttenKa=0.20
    mAttenKb=1.0
    mNumTileColumns=1
    mNumTileRows=1
    mColElasticity=0.50
    bCallPreSpawn=true
    LightEffect=21
    DrawType=10
    bAcceptsProjectors=true
    bNetTemporary=true
    RemoteRole=0
    Texture=Texture'S_Emitter'
    Skins=// Object reference not set to an instance of an object.
    
    bUnlit=true
    bGameRelevant=true
    CollisionRadius=0.0
    CollisionHeight=0.0
    bNotOnDedServer=true
    bDirectional=true
}