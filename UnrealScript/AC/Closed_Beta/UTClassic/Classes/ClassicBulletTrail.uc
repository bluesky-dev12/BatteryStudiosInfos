class ClassicBulletTrail extends wEmitter;

var Vector HitNormal;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        HitNormal;
}

function AimAt(Vector HL, Vector HN)
{
    HitNormal = HN;
    mSpawnVecA = HL;
    // End:0x35
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SpawnEffects();
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    MakeNoise(0.5000000);
    // End:0x1E
    if(int(Role) < int(ROLE_Authority))
    {
        SpawnEffects();
    }
    //return;    
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
            if((Instigator.Weapon != none) && Instigator.Weapon.Instigator == Instigator)
            {
                SetLocation(Instigator.Weapon.GetEffectStart());                
            }
            else
            {
                SetLocation(Instigator.Location);
            }            
        }
        else
        {
            Attachment = wPawn(Instigator).WeaponAttachment;
            // End:0xEA
            if((Attachment != none) && (Level.TimeSeconds - Attachment.LastRenderTime) < float(1))
            {
                NewLocation = Attachment.GetTipLocation();                
            }
            else
            {
                NewLocation = (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (Normal(mSpawnVecA - Instigator.Location) * 25.0000000);
            }
            PC = Level.GetLocalPlayerController();
            // End:0x22B
            if((PC != none) && PC.Pawn != none)
            {
                Dir = Normal(mSpawnVecA - NewLocation);
                LinePos = NewLocation + ((Dir Dot (PC.Pawn.Location - NewLocation)) * Dir);
                LineDir = PC.Pawn.Location - LinePos;
                // End:0x22B
                if(VSize(LineDir) < float(150))
                {
                    SetLocation(LinePos);
                    // End:0x21B
                    if(FRand() < 0.5000000)
                    {
                        PlaySound(Sound'XEffects.Impact3Snd',,,, 80.0000000);                        
                    }
                    else
                    {
                        PlaySound(Sound'XEffects.Impact7Snd',,,, 80.0000000);
                    }
                }
            }
            SetLocation(NewLocation);
        }
    }
    //return;    
}

defaultproperties
{
    mParticleType=6
    mMaxParticles=3
    mLifeRange=0.7500000
    mRegenDist=150.0000000
    mSizeRange[0]=24.0000000
    mSizeRange[1]=48.0000000
    mAttenKa=0.1000000
    bReplicateInstigator=true
    bReplicateMovement=false
    RemoteRole=2
    NetPriority=3.0000000
    LifeSpan=0.7500000
    Texture=Texture'XWeapons_rc.Effects.ShockBeamTex'
    Skins[0]=Texture'XWeapons_rc.Effects.ShockBeamTex'
    Style=6
}