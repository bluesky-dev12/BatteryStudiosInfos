class wSeekingRocket_Nemesis extends wSeekingRocket;

singular simulated function Touch(Actor Other)
{
    // End:0x1A
    if(Owner != Other)
    {
        super(Projectile).Touch(Other);
    }
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Pawn Victims;
    local float dist, damageScale, fReduceRate;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner;

    local DECO_Barricade VictimsDeco;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x55
    if(bIncExplosion)
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.3000000;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.3000000;        
    }
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x260
    foreach VisibleCollidingActors(Class'WGame_Decompressed.DECO_Barricade', VictimsDeco, fExpRadious_Outer, HitLocation)
    {
        // End:0xA6
        if(VictimsDeco == none)
        {
            continue;            
        }
        Dir = VictimsDeco.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x11D
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
        // End:0x25F
        if(int(VictimsDeco.Role) == int(ROLE_Authority))
        {
            // End:0x1DF
            if((Instigator == none) || Instigator.Controller == none)
            {
                VictimsDeco.SetDelayedDamageInstigatorController(InstigatorController);
            }
            VictimsDeco.TakeDamage(int(fActualDamage), Instigator, VictimsDeco.Location - ((0.5000000 * (VictimsDeco.CollisionHeight + VictimsDeco.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, ResParams, int(12) + Rand(4), int(MyWeaponType));
        }        
    }    
    // End:0x578
    foreach VisibleCollidingActors(Class'Engine.Pawn', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0x28A
        if(Victims == none)
        {
            continue;            
        }
        // End:0x577
        if((HurtWall != Victims) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x328
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
            // End:0x4F6
            if(int(Victims.Role) == int(ROLE_Authority))
            {
                // End:0x3EA
                if((Instigator == none) || Instigator.Controller == none)
                {
                    Victims.SetDelayedDamageInstigatorController(InstigatorController);
                }
                // End:0x400
                if(Victims == LastTouched)
                {
                    LastTouched = none;
                }
                // End:0x432
                if(Victims.IsA('wHelicopter'))
                {
                    fActualDamage = fActualDamage * BaseParams.fDamPerc_Heli;                    
                }
                else
                {
                    // End:0x461
                    if(Victims.IsA('wSentryGunPawn'))
                    {
                        fActualDamage = fActualDamage * BaseParams.fDamPerc_SentryGun;
                    }
                }
                DamageLog(Victims, fActualDamage, dist);
                Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, ResParams, int(12) + Rand(4), int(MyWeaponType));
            }
            fReduceRate = 1.0000000;
            // End:0x562
            if(BaseParams.fHitFlashTime > float(0))
            {
                fReduceRate = ((((Dir Dot Vector(Victims.Rotation)) * -1.0000000) + 1.0000000) * 0.5000000) + fMinFlashReduceRate;
                fReduceRate = FMin(1.0000000, fReduceRate);
            }
            SufferEffect(Victims, dist, fReduceRate);
        }        
    }    
    // End:0x7FC
    if((LastTouched != none) && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x62A
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
        // End:0x77B
        if(int(LastTouched.Role) == int(ROLE_Authority))
        {
            // End:0x6EC
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            DamageLog(Victims, fActualDamage, dist);
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, int(12), int(MyWeaponType));
        }
        fReduceRate = 1.0000000;
        // End:0x7E7
        if(BaseParams.fHitFlashTime > float(0))
        {
            fReduceRate = ((((Dir Dot Vector(Victims.Rotation)) * -1.0000000) + 1.0000000) * 0.5000000) + fMinFlashReduceRate;
            fReduceRate = FMin(1.0000000, fReduceRate);
        }
        SufferEffect(Victims, dist, fReduceRate);
    }
    bHurtEntry = false;
    //return;    
}

simulated function Timer()
{
    local Vector ForceDir;
    local float VelMag;

    // End:0x24
    if(InitialDir == vect(0.0000000, 0.0000000, 0.0000000))
    {
        InitialDir = Normal(Velocity);
    }
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.Timer();
    // End:0x111
    if((Seeking != none) && Seeking != Instigator)
    {
        ForceDir = Normal(Seeking.Location - Location);
        VelMag = VSize(Velocity);
        // End:0xC1
        if(int(Seeking.Physics) == int(13))
        {
            ForceDir = Normal(((ForceDir * 0.8000000) * VelMag) + Velocity);            
        }
        else
        {
            ForceDir = Normal(((ForceDir * 0.3000000) * VelMag) + Velocity);
        }
        Velocity = VelMag * ForceDir;
        Acceleration += (float(5) * ForceDir);
        SetRotation(Rotator(Velocity));
    }
    //return;    
}

function SetSpeed(float fSpeed)
{
    local Vector vDirection;

    vDirection = Vector(Rotation) * -1.0000000;
    vDirection.X = vDirection.X * FRand();
    vDirection.Y = vDirection.Y * FRand();
    vDirection.Z = vDirection.Z * FRand();
    vDirection = Normal(vDirection);
    Speed = fSpeed;
    Velocity = Speed * vDirection;
    // End:0xB6
    if(Instigator.HeadVolume.bWaterVolume)
    {
        Velocity = 0.6000000 * Velocity;
    }
    //return;    
}

simulated function SetSpawnEmitter()
{
    SetSpeed(BaseParams.fProjSpeed);
    LifeSpan = BaseParams.fActiveTime;
    class_Smoke = ResParams.default.Proj_SmokeEx;
    class_Corona = ResParams.default.Proj_Corona;
    class_ExplosionCrap = none;
    ExplosionDecal = none;
    // End:0x95
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SmokeTrail = Spawn(class_Smoke, self);
        Corona = Spawn(class_Corona, self);
    }
    ExplosionClass_dirt = ResParams.default.effect_Explosion_dirt;
    ExplosionClass_grass = ResParams.default.effect_Explosion_grass;
    ExplosionClass_metal = ResParams.default.effect_Explosion_metal;
    ExplosionClass_snow = ResParams.default.effect_Explosion_snow;
    ExplosionClass_water = ResParams.default.effect_Explosion_water;
    ExplosionClass_wood = ResParams.default.effect_Explosion_wood;
    //return;    
}

simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x23
    if(Damage > 0)
    {
        // End:0x23
        if(int(Role) == int(ROLE_Authority))
        {
            bMustExplode = true;
        }
    }
    //return;    
}

simulated function wLoadOut_SetStaticMesh(StaticMesh stMesh)
{
    SetDrawType(8);
    SetStaticMesh(stMesh);
    //return;    
}

defaultproperties
{
    iWeaponID=90032
    Speed=1000.0000000
    CollisionRadius=20.0000000
    CollisionHeight=20.0000000
}