class wGrenade_Nemesis extends wGrenade;

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
    foreach VisibleCollidingActors(Class'WGame.DECO_Barricade', VictimsDeco, fExpRadious_Outer, HitLocation)
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

state Burning
{
    function RecoverFromHostChange()
    {
        super.RecoverFromHostChange();
        InitBurning(0.5000000);
        SpawnEmitter(0.5000000);
        //return;        
    }

    function InitBurning(float timeFactor)
    {
        bBlockZeroExtentTraces = false;
        SetCollisionSize(100.0000000, 50.0000000);
        SetTimer(BaseParams.fHitFireTime * timeFactor, false);
        //return;        
    }

    function BeginState()
    {
        InitBurning(1.0000000);
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Timer()
    {
        Destroy();
        //return;        
    }

    simulated event Tick(float DeltaTime)
    {
        local wPawn P;
        local DECO_Barricade DB;

        // End:0x1E
        if((Instigator == none) || InstigatorController == none)
        {
            RecoverInstigator();
        }
        // End:0x81
        foreach TouchingActors(Class'WGame.wPawn', P)
        {
            // End:0x80
            if((P != none) && (P == Instigator) || P.GetTeamNum() != Instigator.GetTeamNum())
            {
                P.SetBurning(true, self);
            }            
        }        
        // End:0xAF
        foreach TouchingActors(Class'WGame.DECO_Barricade', DB)
        {
            // End:0xAE
            if(DB != none)
            {
                DB.SetBurning(true, self);
            }            
        }        
        //return;        
    }
    stop;    
}
