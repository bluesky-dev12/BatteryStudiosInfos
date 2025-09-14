class Emitter extends Actor
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        fFadeOutTime;
}

// Export UEmitter::execKill(FFrame&, void* const)
native function Kill();

simulated function SetFadeOutTime(float fTotal, float fFadeOutGap)
{
    LifeSpan = fTotal + fFadeOutGap;
    LifeSpanReplicated = LifeSpan;
    fFadeOutTime = fFadeOutGap;
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    local int i;

    super.UpdatePrecacheMaterials();
    i = 0;
    J0x0D:

    // End:0x75 [Loop If]
    if(i < Emitters.Length)
    {
        // End:0x6B
        if(Emitters[i] != none)
        {
            // End:0x6B
            if(Emitters[i].Texture != none)
            {
                Level.AddPrecacheMaterial(Emitters[i].Texture);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < Emitters.Length)
    {
        // End:0x3D
        if(Emitters[i] != none)
        {
            Emitters[i].Trigger();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated event SpawnParticle(int Amount)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < Emitters.Length)
    {
        // End:0x42
        if(Emitters[i] != none)
        {
            Emitters[i].SpawnParticle(Amount);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function Reset()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < Emitters.Length)
    {
        // End:0x3D
        if(Emitters[i] != none)
        {
            Emitters[i].Reset();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    DrawType=10
    bNoDelete=true
    RemoteRole=0
    Texture=Texture'Engine_Decompressed.S_Emitter'
    Style=8
    bUnlit=true
    bNotOnDedServer=true
}