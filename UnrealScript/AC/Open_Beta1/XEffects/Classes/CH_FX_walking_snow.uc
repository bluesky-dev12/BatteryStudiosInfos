class CH_FX_walking_snow extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.CH_FX_walking_snow.SpriteEmitter32'
    begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-15.5298700)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4000000
        FadeOutStartTime=0.2800000
        FadeInEndTime=0.0480000
        MaxParticles=4
        SpinsPerSecondRange=(X=(Min=-0.6320000,Max=0.6320000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=234344.3281250
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-19.4687996,Max=19.4687996),Y=(Min=-19.4687996,Max=19.4687996),Z=(Min=4.8671999,Max=14.6015997))
    end object
    Emitters[0]=SpriteEmitter32
    // Reference: SpriteEmitter'XEffects_Decompressed.CH_FX_walking_snow.SpriteEmitter33'
    begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-98.6208878)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1111110
        FadeInEndTime=0.0190480
        MaxParticles=5
        SpinsPerSecondRange=(X=(Min=-0.2520000,Max=0.2520000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=590547.7500000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit_blood.teen_hit_blood_ani_03'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.3968250,Max=0.3968250)
        StartVelocityRange=(X=(Min=-36.4618797,Max=36.4618797),Y=(Min=-36.4618797,Max=36.4618797),Z=(Min=12.2648401,Max=61.9957771))
    end object
    Emitters[1]=SpriteEmitter33
}