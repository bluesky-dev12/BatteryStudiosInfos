class BulldogDust extends Emitter;

var() int MaxSpritePPS;
var() int MaxMeshPPS;

simulated function UpdateDust(KTire t, float DustSlipRate, float DustSlipThresh)
{
    local float SpritePPS, MeshPPS;

    // End:0x103
    if(t.bTireOnGround && t.GroundSlipVel > DustSlipThresh)
    {
        SpritePPS = FMin(DustSlipRate * (t.GroundSlipVel - DustSlipThresh), float(MaxSpritePPS));
        Emitters[0].ParticlesPerSecond = SpritePPS;
        Emitters[0].InitialParticlesPerSecond = SpritePPS;
        Emitters[0].AllParticlesDead = false;
        MeshPPS = FMin(DustSlipRate * (t.GroundSlipVel - DustSlipThresh), float(MaxMeshPPS));
        Emitters[1].ParticlesPerSecond = MeshPPS;
        Emitters[1].InitialParticlesPerSecond = MeshPPS;
        Emitters[1].AllParticlesDead = false;        
    }
    else
    {
        Emitters[0].ParticlesPerSecond = 0.0000000;
        Emitters[0].InitialParticlesPerSecond = 0.0000000;
        Emitters[1].ParticlesPerSecond = 0.0000000;
        Emitters[1].InitialParticlesPerSecond = 0.0000000;
    }
    //return;    
}

defaultproperties
{
    MaxSpritePPS=35
    MaxMeshPPS=35
    // Reference: SpriteEmitter'Vehicles_Decompressed.BulldogDust.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=15.0000000)
        ColorScale=/* Array type was not detected. */
        MaxParticles=100
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        DrawStyle=1
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: MeshEmitter'Vehicles_Decompressed.BulldogDust.MeshEmitter1'
    begin object name="MeshEmitter1" class=Engine.MeshEmitter
        UseParticleColor=true
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        AlphaTest=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
        DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.0000000
        MaxParticles=100
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0100000),Z=(Min=0.0000000,Max=0.0100000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=0.3000000,Max=1.0000000),Y=(Min=0.3000000,Max=1.0000000),Z=(Min=0.3000000,Max=1.0000000))
        DrawStyle=1
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=60.0000000,Max=120.0000000))
    end object
    Emitters[1]=MeshEmitter1
    bNoDelete=false
    bHardAttach=true
}