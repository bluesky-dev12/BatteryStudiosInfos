class Warfare_Tracer extends Emitter;

simulated function SpawnParticle(int Amount)
{
    local PlayerController PC;
    local Vector Dir, LineDir, LinePos, RealLocation;

    super.SpawnParticle(Amount);
    // End:0x2C
    if((Instigator == none) || Instigator.IsFirstPerson())
    {
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0x195
    if((PC != none) && PC.Pawn != none)
    {
        Dir.X = Emitters[0].StartVelocityRange.X.Min;
        Dir.Y = Emitters[0].StartVelocityRange.Y.Min;
        Dir.Z = Emitters[0].StartVelocityRange.Z.Min;
        Dir = Normal(Dir);
        LinePos = Location + ((Dir Dot (PC.Pawn.Location - Location)) * Dir);
        LineDir = PC.Pawn.Location - LinePos;
        // End:0x195
        if(VSize(LineDir) < float(150))
        {
            RealLocation = Location;
            SetLocation(LinePos);
            // End:0x17D
            if(FRand() < 0.5000000)
            {
                PlaySound(Sound'XEffects_Decompressed.Impact3Snd',,,, 80.0000000);                
            }
            else
            {
                PlaySound(Sound'XEffects_Decompressed.Impact7Snd',,,, 80.0000000);
            }
            SetLocation(RealLocation);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Warfare_Tracer.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
        UseDirectionAs=2
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        ScaleSizeXByVelocity=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ExtentMultiplier=(X=0.5000000,Y=1.0000000,Z=1.0000000)
        ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
        MaxParticles=100
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0035000,Y=1.0000000,Z=1.0000000)
        DrawStyle=6
        Texture=Texture'FX_TEX.Tracer.Warfare_Tracer'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=10000.0000000,Max=10000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter13
    bNoDelete=false
    bHardAttach=true
}