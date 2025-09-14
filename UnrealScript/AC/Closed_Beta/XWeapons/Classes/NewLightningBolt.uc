class NewLightningBolt extends wEmitter;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    MakeNoise(0.5000000);
    //return;    
}

simulated function PostNetBeginPlay()
{
    local wWeaponAttachment Attachment;
    local Vector X, Y, Z;

    // End:0xBE
    if((wPawn(Instigator) != none) && !Instigator.IsFirstPerson())
    {
        Attachment = wPawn(Instigator).WeaponAttachment;
        // End:0xBE
        if((Attachment != none) && (Level.TimeSeconds - Attachment.LastRenderTime) < 0.1000000)
        {
            GetAxes(Attachment.Rotation, X, Y, Z);
            SetLocation((Attachment.Location - (float(40) * X)) - (float(10) * Z));
        }
    }
    //return;    
}

defaultproperties
{
    mParticleType=5
    mRegen=false
    mStartParticles=30
    mMaxParticles=30
    mLifeRange[0]=0.5000000
    mLifeRange[1]=0.5000000
    mPosDev=(X=5.0000000,Y=5.0000000,Z=5.0000000)
    mSpawnVecB=(X=40.0000000,Y=40.0000000,Z=10.0000000)
    mSizeRange[0]=30.0000000
    mSizeRange[1]=30.0000000
    blockOnNet=true
    bReplicateInstigator=true
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    RemoteRole=1
    NetPriority=3.0000000
    Style=6
}