/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Warfare_Tracer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Warfare_Tracer extends Emitter;

simulated function SpawnParticle(int Amount)
{
    local PlayerController PC;
    local Vector Dir, LineDir, LinePos, RealLocation;

    super.SpawnParticle(Amount);
    // End:0x2c
    if(Instigator == none || Instigator.IsFirstPerson())
    {
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0x195
    if(PC != none && PC.Pawn != none)
    {
        Dir.X = Emitters[0].StartVelocityRange.X.Min;
        Dir.Y = Emitters[0].StartVelocityRange.Y.Min;
        Dir.Z = Emitters[0].StartVelocityRange.Z.Min;
        Dir = Normal(Dir);
        LinePos = Location + Dir Dot PC.Pawn.Location - Location * Dir;
        LineDir = PC.Pawn.Location - LinePos;
        // End:0x195
        if(VSize(LineDir) < float(150))
        {
            RealLocation = Location;
            SetLocation(LinePos);
            // End:0x17d
            if(FRand() < 0.50)
            {
                PlaySound(sound'Impact3Snd',,,, 80.0);
            }
            // End:0x18d
            else
            {
                PlaySound(sound'Impact7Snd',,,, 80.0);
            }
            SetLocation(RealLocation);
        }
    }
}

defaultproperties
{
    Emitters=// Object reference not set to an instance of an object.
    
    bNoDelete=true
    bHardAttach=true
}