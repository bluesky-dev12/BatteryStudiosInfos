class wEmitter extends Actor
    native
    placeable;

enum ExParticleTypes
{
    PT_Sprite,                      // 0
    PT_Stream,                      // 1
    PT_Line,                        // 2
    PT_Disc,                        // 3
    PT_Mesh,                        // 4
    PT_Branch,                      // 5
    PT_Beam                         // 6
};

enum ExSpawningTypes
{
    ST_Sphere,                      // 0
    ST_Line,                        // 1
    ST_Disc,                        // 2
    ST_Cylinder,                    // 3
    ST_AimedSphere,                 // 4
    ST_StaticMesh,                  // 5
    ST_Explode,                     // 6
    ST_ExplodeRing,                 // 7
    ST_OwnerSkeleton,               // 8
    ST_Test                         // 9
};

enum EAttenFunc
{
    ATF_LerpInOut,                  // 0
    ATF_ExpInOut,                   // 1
    ATF_SmoothStep,                 // 2
    ATF_Pulse,                      // 3
    ATF_Random,                     // 4
    ATF_None                        // 5
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
var transient float mTDelta;
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        blockOnNet, mSpawnVecA;
}

event CollisionSound()
{
    //return;    
}

event PreSpawned()
{
    // End:0xBA
    if(!Level.bStartup)
    {
        bSuspendWhenNotVisible = false;
        // End:0xBA
        if((Level.bDropDetail && mMaxParticles > 5) && ((int(mParticleType) == int(0)) || int(mParticleType) == int(4)) || int(mParticleType) == int(2))
        {
            mMaxParticles = int(float(mMaxParticles) * 0.6500000);
            mRegenRange[0] *= 0.8000000;
            mRegenRange[1] *= 0.8000000;
            mStartParticles = int(0.6500000 * float(mStartParticles));
        }
    }
    //return;    
}

final simulated function float ClampToMaxParticles(float InPart)
{
    return FMin(InPart, float(mStartParticles));
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    mRegenPause = !mRegenPause;
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x1F
    if(mPosColorMapXY != none)
    {
        Level.AddPrecacheMaterial(mPosColorMapXY);
    }
    // End:0x3E
    if(mPosColorMapXZ != none)
    {
        Level.AddPrecacheMaterial(mPosColorMapXZ);
    }
    // End:0x5D
    if(mLifeColorMap != none)
    {
        Level.AddPrecacheMaterial(mLifeColorMap);
    }
    super.UpdatePrecacheMaterials();
    //return;    
}

static function PrecacheContent(LevelInfo Level)
{
    // End:0x1F
    if(default.mPosColorMapXY != none)
    {
        Level.AddPrecacheMaterial(default.mPosColorMapXY);
    }
    // End:0x3E
    if(default.mPosColorMapXZ != none)
    {
        Level.AddPrecacheMaterial(default.mPosColorMapXZ);
    }
    // End:0x5D
    if(default.mLifeColorMap != none)
    {
        Level.AddPrecacheMaterial(default.mLifeColorMap);
    }
    // End:0x7F
    if(default.Skins.Length > 0)
    {
        Level.AddPrecacheMaterial(default.Skins[0]);
    }
    //return;    
}

defaultproperties
{
    mRegen=true
    mStartParticles=1
    mMaxParticles=50
    mLifeRange[0]=4.0000000
    mLifeRange[1]=4.0000000
    mRegenRange[0]=1.0000000
    mRegenRange[1]=1.0000000
    bSuspendWhenNotVisible=true
    mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0500000)
    mSpeedRange[0]=40.0000000
    mSpeedRange[1]=40.0000000
    mAirResistance=0.4000000
    mSizeRange[0]=10.0000000
    mSizeRange[1]=10.0000000
    mColorRange[0]=(R=255,G=255,B=255,A=255)
    mColorRange[1]=(R=255,G=255,B=255,A=255)
    mAttenuate=true
    mAttenKa=0.2000000
    mAttenKb=1.0000000
    mNumTileColumns=1
    mNumTileRows=1
    mColElasticity=0.5000000
    bCallPreSpawn=true
    LightEffect=21
    DrawType=10
    bAcceptsProjectors=false
    bNetTemporary=true
    RemoteRole=0
    Texture=Texture'Engine_Decompressed.S_Emitter'
    Skins[0]=Texture'Engine_Decompressed.S_Emitter'
    bUnlit=true
    bGameRelevant=true
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
    bNotOnDedServer=true
    bDirectional=true
}