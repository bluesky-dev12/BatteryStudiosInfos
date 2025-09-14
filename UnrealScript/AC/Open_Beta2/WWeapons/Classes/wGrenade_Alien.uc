class wGrenade_Alien extends wGrenade;

var Class<Emitter> SpawnEffectAttack;

simulated function SpawnTrail()
{
    Trail = none;
    //return;    
}

simulated function wLoadOut(int iID)
{
    super.wLoadOut(iID);
    //return;    
}

simulated function LoadOutInit()
{
    // End:0x37
    if(ResParams.default.iCollisionHeight != 0)
    {
        SetCollisionSize(float(ResParams.default.iCollisionRadius), float(ResParams.default.iCollisionHeight));
    }
    SetSpeed(BaseParams.fProjSpeed);
    ExplodeTimer = BaseParams.fFuseTime;
    SetTimer(0.5000000, false);
    LoadEmitters();
    // End:0x96
    if((bTimerSet == false) && !BaseParams.bBulletLandExplode)
    {
        SpawnTrail();
    }
    bTimerSet = true;
    //return;    
}

simulated function SetInit()
{
    local Rotator R;
    local int diff;

    // End:0x61
    if(int(Role) == int(ROLE_Authority))
    {
        R.Yaw = Rotation.Yaw;
        R.Pitch = 0;
        R.Roll = 0;
        Velocity = Speed * Vector(R);
        SetRotation(R);
        bCanHitOwner = false;
    }
    // End:0xC2
    if(int(Role) == int(ROLE_Authority))
    {
        Velocity = Speed * Vector(Rotation);
        bCanHitOwner = false;
        // End:0xC2
        if(Instigator.HeadVolume.bWaterVolume)
        {
            bHitWater = true;
            Velocity = 0.6000000 * Velocity;
        }
    }
    SetTimer(0.1000000, false);
    //return;    
}

simulated function SpawnEmitter(float timeFactor)
{
    local Emitter ExplodeEmitter;
    local PlayerController PC;

    // End:0x105
    if(BaseParams.bBulletLandExplode)
    {
        // End:0x102
        if(int(Role) == int(ROLE_Authority))
        {
            PC = Level.GetLocalPlayerController();
            // End:0xA4
            if((Instigator == PC.Pawn) || Instigator.GetTeamNum() != PC.GetTeamNum())
            {
                ExplodeEmitter = Spawn(ResParams.default.effect_Explosion_enemy, self,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));                
            }
            else
            {
                ExplodeEmitter = Spawn(SpawnEffectAttack, self,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
            }
            ExplodeEmitter.RemoteRole = ROLE_SimulatedProxy;
            ExplodeEmitter.SetFadeOutTime(BaseParams.fHitFireTime * timeFactor, 3.0000000);
        }        
    }
    else
    {
        Spawn(SpawnEffectAttack,,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    }
    //return;    
}

simulated function Class<Emitter> GetExplosionClass()
{
    local Class<Emitter> ResultExplosionClass;

    return none;
    //return;    
}

simulated function SetSpeed(float fSpeed)
{
    local Rotator rThrow;
    local float fAddSpeed, fDot;

    Speed = fSpeed * float(10000);
    rThrow.Pitch = Rotate_Pitch;
    rThrow.Yaw = Rotate_Yaw;
    rThrow.Roll = Rotate_Roll;
    Velocity = Speed * Vector(rThrow);
    bCanHitOwner = false;
    // End:0x95
    if(Instigator.HeadVolume.bWaterVolume)
    {
        bHitWater = true;
        Velocity = 0.6000000 * Velocity;
    }
    Velocity.X = 0.0000000;
    Velocity.Y = 0.0000000;
    bHidden = true;
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float dist, damageScale;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    fExpRadious_Outer = BaseParams.fExplRad_Outer;
    fExpRadious_Inner = BaseParams.fExplRad_Inner;
    // End:0x30A
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0x64
        if(Victims == none)
        {
            continue;            
        }
        // End:0xA8
        if((Victims.IsA('wAIDefencePawn') || Victims.IsA('wFlyingDefenceBot')) || Victims.IsA('wFlagObjectiveBase'))
        {
            continue;            
        }
        // End:0xC0
        if(Victims.IsA('wGrenade_Alien'))
        {
            continue;            
        }
        // End:0xF4
        if((false == Victims.IsA('wPawn')) && false == Victims.IsA('DECO_Barricade'))
        {
            continue;            
        }
        // End:0x309
        if(((Victims != self) && HurtWall != Victims) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x19F
            if(fRangeMiddle == float(0))
            {
                fActualDamage = BaseParams.fExplDam_Inner;                
            }
            else
            {
                fRangeLerp = FMax(0.0000000, (dist - fExpRadious_Inner) / fRangeMiddle);
                fActualDamage = (BaseParams.fExplDam_Inner * (float(1) - fRangeLerp)) + (BaseParams.fExplDam_Outer * fRangeLerp);
                fActualDamage = FMax(0.0000000, fActualDamage);
            }
            damageScale = 1.0000000 - fRangeLerp;
            fActualMomentum = MomentumTransfer;
            // End:0x309
            if(int(Victims.Role) == int(ROLE_Authority))
            {
                // End:0x273
                if((Instigator == none) || Instigator.Controller == none)
                {
                    Victims.SetDelayedDamageInstigatorController(InstigatorController);
                }
                // End:0x289
                if(Victims == LastTouched)
                {
                    LastTouched = none;
                }
                Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, ResParams, int(12) + Rand(4), int(MyWeaponType));
            }
        }        
    }    
    // End:0x4F8
    if((LastTouched != none) && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x3BC
        if(fRangeMiddle == float(0))
        {
            fActualDamage = BaseParams.fExplDam_Inner;            
        }
        else
        {
            fRangeLerp = FMax(0.0000000, (dist - fExpRadious_Inner) / fRangeMiddle);
            fActualDamage = (BaseParams.fExplDam_Inner * (float(1) - fRangeLerp)) + (BaseParams.fExplDam_Outer * fRangeLerp);
        }
        damageScale = 1.0000000 - fRangeLerp;
        fActualMomentum = MomentumTransfer;
        // End:0x4F8
        if(int(LastTouched.Role) == int(ROLE_Authority))
        {
            // End:0x47E
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, int(12), int(MyWeaponType));
        }
    }
    bHurtEntry = false;
    //return;    
}

simulated function ExplodeSelf(Vector HitLocation, Vector HitNormal)
{
    // End:0x0B
    if(bExploded)
    {
        return;
    }
    // End:0x2D
    if(true)
    {
        Spawn(SpawnEffectAttack,,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    }
    // End:0x49
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    //return;    
}

defaultproperties
{
    SpawnEffectAttack=Class'XEffects.Alien_Theta_Lota_elec_attack'
    ExplosionDecal=none
}