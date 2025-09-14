class wIncendiaryRocket extends wRocket;

var wEmitter Trail;

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

function SplashGrenades(Vector HitLocation)
{
    local int G;
    local wProjectile NewGr;
    local Class<wProjectile> GRClass;
    local Vector RandV;
    local Rotator RandR;

    GRClass = Class<wProjectile>(DynamicLoadObject("WWeapons.wGrenade_Nemesis", Class'Core.Class'));
    G = 0;
    J0x38:

    // End:0x177 [Loop If]
    if(G < BaseParams.i2ndBulletCount)
    {
        NewGr = Spawn(GRClass, self,, HitLocation);
        // End:0x16D
        if(NewGr != none)
        {
            RandV = VRand();
            NewGr.bIncExplosion = false;
            // End:0x150
            if(NewGr.IsA('wGrenade_Nemesis'))
            {
                // End:0xC2
                if(RandV.Z < 0.0000000)
                {
                    RandV.Z *= -1.0000000;
                }
                RandR = Rotator(RandV);
                NewGr.Rotate_Pitch = RandR.Pitch;
                NewGr.Rotate_Yaw = RandR.Yaw;
                NewGr.Rotate_Roll = RandR.Roll;
                // End:0x150
                if(int(Instigator.Role) == int(ROLE_Authority))
                {
                    NewGr.vHostLocation = NewGr.Location;
                }
            }
            NewGr.iWeaponID = BaseParams.iBombWeaponID;
        }
        G++;
        // [Loop Continue]
        goto J0x38;
    }
    NewGr = Spawn(GRClass, self,, Location);
    // End:0x24B
    if(NewGr != none)
    {
        RandV = VRand();
        NewGr.bIncExplosion = false;
        // End:0x22E
        if(NewGr.IsA('wGrenade_Nemesis'))
        {
            NewGr.Rotate_Pitch = 32768;
            NewGr.Rotate_Yaw = 0;
            NewGr.Rotate_Roll = 0;
            // End:0x22E
            if(int(Instigator.Role) == int(ROLE_Authority))
            {
                NewGr.vHostLocation = NewGr.Location;
            }
        }
        NewGr.iWeaponID = BaseParams.iBombWeaponID;
    }
    //return;    
}

simulated function SetSpawnEmitter()
{
    SetSpeed(BaseParams.fProjSpeed);
    LifeSpan = BaseParams.fActiveTime;
    class_Smoke = ResParams.default.Proj_Smoke;
    class_Corona = ResParams.default.Proj_Corona;
    class_ExplosionCrap = ResParams.default.Proj_ExplosionCrap;
    ExplosionDecal = ResParams.default.Proj_ExplosionDecal;
    // End:0x97
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SpawnTrail();
    }
    // End:0xCE
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

simulated function SpawnTrail()
{
    Trail = Spawn(Class'XEffects.TransTrail_Beam', self,, Location, Rotation);
    //return;    
}

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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    // End:0x1B
    if(int(Role) == int(ROLE_Authority))
    {
        SplashGrenades(HitLocation);
    }
    super.Explode(HitLocation, HitNormal);
    //return;    
}

defaultproperties
{
    iWeaponID=90030
}