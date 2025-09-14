/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Gib.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class Gib extends Actor
    dependson(xPawnGibGroup)
    abstract
    notplaceable;

var class<xPawnGibGroup> GibGroupClass;
var() class<wEmitter> TrailClass;
var() wEmitter Trail;
var() float DampenFactor;
var Sound HitSounds;
var bool bFlaming;
var class<wEmitter> GibBloodClass;

simulated function Destroyed()
{
    // End:0x1c
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    super.Destroyed();
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Pitch = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Roll = int(spinRate * float(2) * FRand() - spinRate);
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local float Speed, MinSpeed;

    Velocity = DampenFactor * Velocity Dot HitNormal * HitNormal * -2.0 + Velocity;
    RandSpin(100000.0);
    Speed = VSize(Velocity);
    // End:0x6d
    if(Level.DetailMode == 0)
    {
        MinSpeed = 250.0;
    }
    // End:0x78
    else
    {
        MinSpeed = 150.0;
    }
    // End:0x121
    if(!bFlaming && Speed > MinSpeed)
    {
        // End:0x121
        if(Level.NetMode != 1 && !Level.bDropDetail)
        {
            // End:0xef
            if(GibGroupClass.default.BloodHitClass != none)
            {
                Spawn(GibBloodClass,,, Location, rotator(-HitNormal));
            }
            // End:0x121
            if(LifeSpan < 7.30 && Level.DetailMode != 0)
            {
                PlaySound(HitSounds);
            }
        }
    }
    // End:0x1a6
    if(Speed < float(20))
    {
        // End:0x199
        if(!bFlaming && !Level.bDropDetail && Level.DetailMode != 0 && GibGroupClass.default.BloodHitClass != none)
        {
            Spawn(GibBloodClass,,, Location, rotator(-HitNormal));
        }
        bBounce = false;
        SetPhysics(0);
    }
}

simulated function SpawnTrail()
{
    // End:0xeb
    if(Level.NetMode != 1)
    {
        // End:0x97
        if(bFlaming)
        {
            Trail = Spawn(class'HitFlameBig', self,, Location, Rotation);
            // End:0x49
            if(Trail == none)
            {
                return;
            }
            Trail.LifeSpan = 4.0 + float(2) * FRand();
            LifeSpan = Trail.LifeSpan;
            Trail.SetTimer(LifeSpan - 3.0, false);
        }
        // End:0xd2
        else
        {
            Trail = Spawn(TrailClass, self,, Location, Rotation);
            // End:0xbe
            if(Trail == none)
            {
                return;
            }
            Trail.LifeSpan = 1.80;
        }
        Trail.SetPhysics(10);
        RandSpin(64000.0);
    }
}

simulated function SetTeam(string strSTMeshName);

defaultproperties
{
    GibGroupClass=class'xPawnGibGroup'
    DampenFactor=0.650
    HitSounds=SoundGroup'Warfare_Sound_Impact.gore.impact_gore'
    GibBloodClass=class'BloodHit_spurt'
    Physics=2
    RemoteRole=0
    LifeSpan=8.0
    bShadowMap=true
    TransientSoundVolume=0.170
    bCollideWorld=true
    bUseCylinderCollision=true
    bBounce=true
    bFixedRotationDir=true
    Mass=30.0
}