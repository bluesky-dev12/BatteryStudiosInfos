/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\NewLightningBolt.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class NewLightningBolt extends wEmitter;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    MakeNoise(0.50);
}

simulated function PostNetBeginPlay()
{
    local wWeaponAttachment Attachment;
    local Vector X, Y, Z;

    // End:0xbe
    if(wPawn(Instigator) != none && !Instigator.IsFirstPerson())
    {
        Attachment = wPawn(Instigator).WeaponAttachment;
        // End:0xbe
        if(Attachment != none && Level.TimeSeconds - Attachment.LastRenderTime < 0.10)
        {
            GetAxes(Attachment.Rotation, X, Y, Z);
            SetLocation(Attachment.Location - float(40) * X - float(10) * Z);
        }
    }
}

defaultproperties
{
    mParticleType=5
    mRegen=true
    mStartParticles=30
    mMaxParticles=30
    mLifeRange[0]=0.50
    mLifeRange[1]=0.50
    mPosDev=(X=5.0,Y=5.0,Z=5.0)
    mSpawnVecB=(X=40.0,Y=40.0,Z=10.0)
    mSizeRange[0]=30.0
    mSizeRange[1]=30.0
    blockOnNet=true
    bReplicateInstigator=true
    bReplicateMovement=true
    bSkipActorPropertyReplication=true
    RemoteRole=1
    NetPriority=3.0
    Style=6
}