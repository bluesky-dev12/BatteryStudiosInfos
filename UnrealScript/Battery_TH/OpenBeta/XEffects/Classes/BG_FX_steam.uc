class BG_FX_steam extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_steam.SpriteEmitter49'
    begin object name="SpriteEmitter49" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=584.2369995,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.3030000,Max=0.4030000),Y=(Min=0.0756000,Max=0.1512000),Z=(Min=0.0756000,Max=0.1512000))
        StartSpinRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1123.4160156
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.4960320,Max=0.4960320)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=30.7439995),Z=(Min=0.0000000,Max=0.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter49
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_steam.SpriteEmitter50'
    begin object name="SpriteEmitter50" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=482.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3300000
        FadeOutStartTime=0.1349210
        CoordinateSystem=1
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=70.0000000,Z=0.0000000)
        StartLocationShape=2
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=75.5999985
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.0793650,Max=0.3968250)
        StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=330.0000000,Max=330.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter50
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_steam.SpriteEmitter51'
    begin object name="SpriteEmitter51" class=Engine.SpriteEmitter
        UseColorScale=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=320.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8200000
        CoordinateSystem=1
        StartLocationOffset=(X=0.0000000,Y=100.0000000,Z=0.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=0.0840000,Max=0.0840000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        LifetimeRange=(Min=0.9525000,Max=0.9525000)
        StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=18.0000000,Max=160.0000000),Z=(Min=-100.0000000,Max=100.0000000))
    end object
    Emitters[2]=SpriteEmitter51
}