class wRocket_Alien extends wRocket;

var StaticMesh stProj;
var wEmitter Trail;

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

simulated function SpawnTrail()
{
    Trail = Spawn(Class'XEffects.TransTrail_Beam_Red', self,, Location, Rotation);
    //return;    
}

simulated function PostBeginPlay()
{
    super(wProjectile).PostBeginPlay();
    // End:0x32
    if(wAIDefencePawn(Instigator) != none)
    {
        iInstigatorID = wAIDefencePawn(Instigator).iNpcID;        
    }
    else
    {
        // End:0x5E
        if(wFlyingDefenceBot(Instigator) != none)
        {
            iInstigatorID = wFlyingDefenceBot(Instigator).iNpcID;            
        }
        else
        {
            // End:0x8A
            if(wMonster(Instigator) != none)
            {
                iInstigatorID = wMonster(Instigator).iNpcID;                
            }
            else
            {
                iInstigatorID = 0;
            }
        }
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    //return;    
}

simulated function wLoadOut(int iID)
{
    super.wLoadOut(iID);
    //return;    
}

simulated function wLoadOut_SetStaticMesh(StaticMesh stMesh)
{
    SetDrawType(8);
    SetStaticMesh(stProj);
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
    // End:0x9D
    if((iWeaponID == 90020) || iWeaponID == 90022)
    {
        // End:0x9D
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            SpawnTrail();
        }
    }
    // End:0xD4
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

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Pawn Victims;
    local float dist, damageScale, fReduceRate;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner;

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
    // End:0x420
    foreach VisibleCollidingActors(Class'Engine.Pawn', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0xA6
        if(Victims == none)
        {
            continue;            
        }
        // End:0xEA
        if((Victims.IsA('wAIDefencePawn') || Victims.IsA('wFlyingDefenceBot')) || Victims.IsA('wFlagObjectiveBase'))
        {
            continue;            
        }
        // End:0x11E
        if((false == Victims.IsA('wPawn')) && false == Victims.IsA('DECO_Barricade'))
        {
            continue;            
        }
        // End:0x41F
        if((HurtWall != Victims) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1BC
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
            // End:0x39E
            if(int(Victims.Role) == int(ROLE_Authority))
            {
                // End:0x27E
                if((Instigator == none) || Instigator.Controller == none)
                {
                    Victims.SetDelayedDamageInstigatorController(InstigatorController);
                }
                // End:0x294
                if(Victims == LastTouched)
                {
                    LastTouched = none;
                }
                Victims.SetDelayedDamageInstigatorID(iInstigatorID);
                // End:0x2DA
                if(Victims.IsA('wHelicopter'))
                {
                    fActualDamage = fActualDamage * BaseParams.fDamPerc_Heli;                    
                }
                else
                {
                    // End:0x309
                    if(Victims.IsA('wSentryGunPawn'))
                    {
                        fActualDamage = fActualDamage * BaseParams.fDamPerc_SentryGun;
                    }
                }
                DamageLog(Victims, fActualDamage, dist);
                Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, ResParams, int(12) + Rand(4), int(MyWeaponType));
            }
            fReduceRate = 1.0000000;
            // End:0x40A
            if(BaseParams.fHitFlashTime > float(0))
            {
                fReduceRate = ((((Dir Dot Vector(Victims.Rotation)) * -1.0000000) + 1.0000000) * 0.5000000) + fMinFlashReduceRate;
                fReduceRate = FMin(1.0000000, fReduceRate);
            }
            SufferEffect(Victims, dist, fReduceRate);
        }        
    }    
    // End:0x6A4
    if((LastTouched != none) && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x4D2
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
        // End:0x623
        if(int(LastTouched.Role) == int(ROLE_Authority))
        {
            // End:0x594
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            DamageLog(Victims, fActualDamage, dist);
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, int(12), int(MyWeaponType));
        }
        fReduceRate = 1.0000000;
        // End:0x68F
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
