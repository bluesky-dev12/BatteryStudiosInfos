class Gib extends Actor
    abstract
    notplaceable;

var Class<xPawnGibGroup> GibGroupClass;
var() Class<wEmitter> TrailClass;
var() wEmitter Trail;
var() float DampenFactor;
var string HitSounds;
var bool bFlaming;
var Class<wEmitter> GibBloodClass;

simulated function Destroyed()
{
    // End:0x1C
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    super.Destroyed();
    //return;    
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local float Speed, MinSpeed;

    Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
    RandSpin(100000.0000000);
    Speed = VSize(Velocity);
    // End:0x6D
    if(int(Level.DetailMode) == int(0))
    {
        MinSpeed = 250.0000000;        
    }
    else
    {
        MinSpeed = 150.0000000;
    }
    // End:0x124
    if(!bFlaming && Speed > MinSpeed)
    {
        // End:0x124
        if((int(Level.NetMode) != int(NM_DedicatedServer)) && !Level.bDropDetail)
        {
            // End:0xEF
            if(GibGroupClass.default.BloodHitClass != none)
            {
                Spawn(GibBloodClass,,, Location, Rotator(-HitNormal));
            }
            // End:0x124
            if((LifeSpan < 7.3000002) && int(Level.DetailMode) != int(0))
            {
                FmodPlaySound(HitSounds);
            }
        }
    }
    // End:0x1A9
    if(Speed < float(20))
    {
        // End:0x19C
        if(((!bFlaming && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && GibGroupClass.default.BloodHitClass != none)
        {
            Spawn(GibBloodClass,,, Location, Rotator(-HitNormal));
        }
        bBounce = false;
        SetPhysics(0);
    }
    //return;    
}

simulated function SpawnTrail()
{
    // End:0xEB
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x97
        if(bFlaming)
        {
            Trail = Spawn(Class'XEffects_Decompressed.HitFlameBig', self,, Location, Rotation);
            // End:0x49
            if(Trail == none)
            {
                return;
            }
            Trail.LifeSpan = 4.0000000 + (float(2) * FRand());
            LifeSpan = Trail.LifeSpan;
            Trail.SetTimer(LifeSpan - 3.0000000, false);            
        }
        else
        {
            Trail = Spawn(TrailClass, self,, Location, Rotation);
            // End:0xBE
            if(Trail == none)
            {
                return;
            }
            Trail.LifeSpan = 1.8000000;
        }
        Trail.SetPhysics(10);
        RandSpin(64000.0000000);
    }
    //return;    
}

simulated function SetTeam(string strSTMeshName)
{
    //return;    
}

defaultproperties
{
    GibGroupClass=Class'XEffects_Decompressed.xPawnGibGroup'
    DampenFactor=0.6500000
    HitSounds="Warfare_Sound_Impact/gore/gore_rand"
    GibBloodClass=Class'XEffects_Decompressed.BloodHit_spurt'
    Physics=2
    RemoteRole=0
    LifeSpan=8.0000000
    bShadowMap=true
    TransientSoundVolume=0.1700000
    bCollideWorld=true
    bUseCylinderCollision=true
    bBounce=true
    bFixedRotationDir=true
    Mass=30.0000000
}