/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Emitter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:6
 *
 *******************************************************************************/
class Emitter extends Actor
    dependson(ParticleEmitter)
    native
    placeable;

var() export editinline array<export editinline ParticleEmitter> Emitters;
var(Global) RangeVector GlobalOffsetRange;
var(Global) Range TimeTillResetRange;
var(Global) bool AutoDestroy;
var(Global) bool AutoReset;
var(Global) bool DisableFogging;
var transient Vector OldLocation;
var transient Vector GlobalOffset;
var transient Vector AbsoluteVelocity;
var transient int Initialized;
var transient Box BoundingBox;
var transient float EmitterRadius;
var transient float EmitterHeight;
var transient float TimeTillReset;
var transient bool UseParticleProjectors;
var transient bool DeleteParticleEmitters;
var transient bool ActorForcesEnabled;
var transient ParticleMaterial ParticleMaterial;
var float fFadeOutTime;
var bool bChecked;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        fFadeOutTime;

}

// Export UEmitter::execKill(FFrame&, void* const)
native function Kill();
simulated function SetFadeOutTime(float fTotal, float fFadeOutGap)
{
    LifeSpan = fTotal + fFadeOutGap;
    LifeSpanReplicated = LifeSpan;
    fFadeOutTime = fFadeOutGap;
}

simulated function UpdatePrecacheMaterials()
{
    local int i;

    super.UpdatePrecacheMaterials();
    i = 0;
    J0x0d:
    // End:0x75 [While If]
    if(i < Emitters.Length)
    {
        // End:0x6b
        if(Emitters[i] != none)
        {
            // End:0x6b
            if(Emitters[i].Texture != none)
            {
                Level.AddPrecacheMaterial(Emitters[i].Texture);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < Emitters.Length)
    {
        // End:0x3d
        if(Emitters[i] != none)
        {
            Emitters[i].Trigger();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated event SpawnParticle(int Amount)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < Emitters.Length)
    {
        // End:0x42
        if(Emitters[i] != none)
        {
            Emitters[i].SpawnParticle(Amount);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function Reset()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < Emitters.Length)
    {
        // End:0x3d
        if(Emitters[i] != none)
        {
            Emitters[i].Reset();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

defaultproperties
{
    DrawType=10
    bNoDelete=true
    RemoteRole=0
    Texture=Texture'S_Emitter'
    Style=8
    bUnlit=true
    bNotOnDedServer=true
}