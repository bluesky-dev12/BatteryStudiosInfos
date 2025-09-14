class BG_FX_snowblizzard extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_snowblizzard.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=1.8714660,Y=1.8662400,Z=-0.2385050)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=6.3381829
        FadeInEndTime=2.2045851
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=-120.0000000,Y=0.0000000,Z=0.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=-0.0350000,Max=0.0350000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0700000,Max=0.0700000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1900.0000000,Max=1900.0000000),Y=(Min=1900.0000000,Max=1900.0000000),Z=(Min=1900.0000000,Max=1900.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.snow_sw03'
        LifetimeRange=(Min=27.5573177,Max=27.5573177)
        StartVelocityRange=(X=(Min=-15.5520020,Max=15.5520020),Y=(Min=-15.5520020,Max=15.5520020),Z=(Min=0.0000000,Max=6.4800000))
        VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.1814400,Max=0.1814400),Z=(Min=0.0000000,Max=0.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter3
}