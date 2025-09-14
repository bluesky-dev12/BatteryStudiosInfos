/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\BulldogDust.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class BulldogDust extends Emitter;

var() int MaxSpritePPS;
var() int MaxMeshPPS;

simulated function UpdateDust(KTire t, float DustSlipRate, float DustSlipThresh)
{
    local float SpritePPS, MeshPPS;

    // End:0x103
    if(t.bTireOnGround && t.GroundSlipVel > DustSlipThresh)
    {
        SpritePPS = FMin(DustSlipRate * t.GroundSlipVel - DustSlipThresh, float(MaxSpritePPS));
        Emitters[0].ParticlesPerSecond = SpritePPS;
        Emitters[0].InitialParticlesPerSecond = SpritePPS;
        Emitters[0].AllParticlesDead = false;
        MeshPPS = FMin(DustSlipRate * t.GroundSlipVel - DustSlipThresh, float(MaxMeshPPS));
        Emitters[1].ParticlesPerSecond = MeshPPS;
        Emitters[1].InitialParticlesPerSecond = MeshPPS;
        Emitters[1].AllParticlesDead = false;
    }
    // End:0x15b
    else
    {
        Emitters[0].ParticlesPerSecond = 0.0;
        Emitters[0].InitialParticlesPerSecond = 0.0;
        Emitters[1].ParticlesPerSecond = 0.0;
        Emitters[1].InitialParticlesPerSecond = 0.0;
    }
}

defaultproperties
{
    MaxSpritePPS=35
    MaxMeshPPS=35
    Emitters=// Object reference not set to an instance of an object.
    
    bNoDelete=true
    bHardAttach=true
}