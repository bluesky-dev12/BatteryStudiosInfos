class BG_FX_Inferno_smoke_F extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_F.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=8.7830000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4600000
        FadeOutFactor=(W=1.5000000,X=1.5000000,Y=1.5000000,Z=1.5000000)
        FadeOutStartTime=4.1128240
        FadeInEndTime=1.0004170
        CoordinateSystem=1
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=100.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=150.0000000),Z=(Min=100.0000000,Max=150.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.big_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=8.0000000,Max=8.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=63.6839981,Max=63.6839981))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[0]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_F.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=40.2255020)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6700000
        FadeOutStartTime=0.8046270
        FadeInEndTime=0.1087330
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=0.0680000,Max=0.0680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0090000,Max=0.0090000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.1746669,Max=2.1746669)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-18.9375000,Max=-18.9375000),Z=(Min=17.2919998,Max=17.2919998))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[1]=SpriteEmitter3
}