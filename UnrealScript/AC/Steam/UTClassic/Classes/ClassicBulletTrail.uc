/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTClassic\Classes\ClassicBulletTrail.uc
 * Package Imports:
 *	UTClassic
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class ClassicBulletTrail extends wEmitter;

var Vector HitNormal;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        HitNormal;

}

function AimAt(Vector HL, Vector HN)
{
    HitNormal = HN;
    mSpawnVecA = HL;
    // End:0x35
    if(Level.NetMode != 1)
    {
        SpawnEffects();
    }
}

simulated function PostNetBeginPlay()
{
    MakeNoise(0.50);
    // End:0x1e
    if(Role < 4)
    {
        SpawnEffects();
    }
}

simulated function SpawnEffects()
{
    local wWeaponAttachment Attachment;
    local PlayerController PC;
    local Vector Dir, LineDir, NewLocation, LinePos;

    // End:0x233
    if(Instigator != none)
    {
        // End:0x86
        if(Instigator.IsFirstPerson())
        {
            // End:0x72
            if(Instigator.Weapon != none && Instigator.Weapon.Instigator == Instigator)
            {
                SetLocation(Instigator.Weapon.GetEffectStart());
            }
            // End:0x83
            else
            {
                SetLocation(Instigator.Location);
            }
        }
        // End:0x233
        else
        {
            Attachment = wPawn(Instigator).WeaponAttachment;
            // End:0xea
            if(Attachment != none && Level.TimeSeconds - Attachment.LastRenderTime < float(1))
            {
                NewLocation = Attachment.GetTipLocation();
            }
            // End:0x13d
            else
            {
                NewLocation = Instigator.Location + Instigator.EyeHeight * vect(0.0, 0.0, 1.0) + Normal(mSpawnVecA - Instigator.Location) * 25.0;
            }
            PC = Level.GetLocalPlayerController();
            // End:0x22b
            if(PC != none && PC.Pawn != none)
            {
                Dir = Normal(mSpawnVecA - NewLocation);
                LinePos = NewLocation + Dir Dot PC.Pawn.Location - NewLocation * Dir;
                LineDir = PC.Pawn.Location - LinePos;
                // End:0x22b
                if(VSize(LineDir) < float(150))
                {
                    SetLocation(LinePos);
                    // End:0x21b
                    if(FRand() < 0.50)
                    {
                        PlaySound(sound'Impact3Snd',,,, 80.0);
                    }
                    // End:0x22b
                    else
                    {
                        PlaySound(sound'Impact7Snd',,,, 80.0);
                    }
                }
            }
            SetLocation(NewLocation);
        }
    }
}

defaultproperties
{
    mParticleType=6
    mMaxParticles=3
    mLifeRange=0.750
    mRegenDist=150.0
    mSizeRange[0]=24.0
    mSizeRange[1]=48.0
    mAttenKa=0.10
    bReplicateInstigator=true
    bReplicateMovement=true
    RemoteRole=2
    NetPriority=3.0
    LifeSpan=0.750
    Texture=Texture'XWeapons_rc.Effects.ShockBeamTex'
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}