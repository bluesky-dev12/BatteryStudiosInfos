class BG_FX_whiteout_LightHouse extends Emitter;

defaultproperties
{
    // Reference: MeshEmitter'XEffects_Decompressed.BG_FX_whiteout_LightHouse.MeshEmitter0'
    begin object name="MeshEmitter0" class=Engine.MeshEmitter
        StaticMesh=StaticMesh'FX_StaticMesh.Map.LightHouse_Light'
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        RotationOffset=(Pitch=0,Yaw=8738,Roll=0)
        SpinCCWorCW=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        InitialParticlesPerSecond=1166666624.0000000
        LifetimeRange=(Min=23.8095226,Max=23.8095226)
    end object
    Emitters[0]=MeshEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_whiteout_LightHouse.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.5700000
        FadeOutStartTime=1.1666670
        FadeInEndTime=0.4259260
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.5400000,Max=0.5400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=1300.0000000,Max=1300.0000000),Y=(Min=1300.0000000,Max=1300.0000000),Z=(Min=1300.0000000,Max=1300.0000000))
        InitialParticlesPerSecond=1800000000.0000000
        Texture=Texture'FX_TEX.Flares.projector_corona_02'
        LifetimeRange=(Min=1.8518521,Max=1.8518521)
    end object
    Emitters[1]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_whiteout_LightHouse.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.0400000
        FadeOutStartTime=2.5599999
        FadeInEndTime=0.7200000
        MaxParticles=30
        SpinsPerSecondRange=(X=(Min=0.0700000,Max=0.0700000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0200000,Max=0.0700000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
        InitialParticlesPerSecond=333333.0000000
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha'
        LifetimeRange=(Min=10.0000000,Max=10.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-265.0000000,Max=-265.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[2]=SpriteEmitter2
}