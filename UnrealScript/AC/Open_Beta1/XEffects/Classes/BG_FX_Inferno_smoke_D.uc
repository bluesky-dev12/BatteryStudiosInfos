class BG_FX_Inferno_smoke_D extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_D.SpriteEmitter51'
    begin object name="SpriteEmitter51" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=584.2369995,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1388890
        FadeInEndTime=0.0595240
        CoordinateSystem=1
        MaxParticles=5
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.3030000,Max=0.4030000),Y=(Min=0.0756000,Max=0.1512000),Z=(Min=0.0756000,Max=0.1512000))
        StartSpinRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1123.4160156
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SubdivisionEnd=1
        LifetimeRange=(Min=0.4960320,Max=0.4960320)
        StartVelocityRange=(X=(Min=0.0000000,Max=50.7439995),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter51
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_D.SpriteEmitter95'
    begin object name="SpriteEmitter95" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=320.0000000,Y=0.0000000,Z=100.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5000000
        FadeOutStartTime=0.1428750
        FadeInEndTime=0.0571500
        CoordinateSystem=1
        StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=0.0840000,Max=0.0840000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.9525000,Max=0.9525000)
        StartVelocityRange=(X=(Min=0.0000000,Max=160.0000000),Y=(Min=-100.0000000,Max=70.0000000),Z=(Min=0.0000000,Max=300.0000000))
    end object
    Emitters[1]=SpriteEmitter95
}