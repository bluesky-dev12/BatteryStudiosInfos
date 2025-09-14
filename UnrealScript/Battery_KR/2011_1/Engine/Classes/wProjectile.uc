class wProjectile extends Projectile
    notplaceable;

var Class<Emitter> ExplosionClass;
var Class<Emitter> ExplosionClass_dirt;
var Class<Emitter> ExplosionClass_grass;
var Class<Emitter> ExplosionClass_metal;
var Class<Emitter> ExplosionClass_snow;
var Class<Emitter> ExplosionClass_water;
var Class<Emitter> ExplosionClass_wood;
var int iWeaponID;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var bool bExplodeCollide;
var bool bTakeDamage;
var bool bMustExplode;
var Material mHitMaterial;
var Actor mHitActor;
var int Rotate_Pitch;
var int Rotate_Yaw;
var int Rotate_Roll;
var Vector vHostLocation;
var bool bIncExplosion;
var int Team;
var string InstigatorName;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        InstigatorName, Rotate_Pitch, 
        Rotate_Roll, Rotate_Yaw, 
        Team, bIncExplosion, 
        bMustExplode, iWeaponID, 
        vHostLocation;
}

simulated function PostBeginPlay()
{
    // End:0x20
    if(Instigator != none)
    {
        Team = Instigator.GetTeamNum();
    }
    super.PostBeginPlay();
    // End:0x64
    if((Instigator != none) && Instigator.PlayerReplicationInfo != none)
    {
        InstigatorName = Instigator.PlayerReplicationInfo.PlayerName;
    }
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    // End:0x2E
    if((BaseParams == none) && iWeaponID != 0)
    {
        wLoadOut(iWeaponID);
    }
    // End:0x4F
    if(bMustExplode)
    {
        Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
    }
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Pawn Victims;
    local float dist, damageScale;
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
    // End:0x2F1
    foreach VisibleCollidingActors(Class'Engine_Decompressed.Pawn', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0xA6
        if(Victims == none)
        {
            continue;            
        }
        // End:0x2F0
        if((HurtWall != Victims) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x144
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
            // End:0x2E0
            if(int(Victims.Role) == int(ROLE_Authority))
            {
                // End:0x206
                if((Instigator == none) || Instigator.Controller == none)
                {
                    Victims.SetDelayedDamageInstigatorController(InstigatorController);
                }
                // End:0x21C
                if(Victims == LastTouched)
                {
                    LastTouched = none;
                }
                // End:0x24B
                if(Victims.IsA('wHelicopter'))
                {
                    fActualDamage = fActualDamage * BaseParams.fDamPerc_Heli;
                }
                DamageLog(Victims, fActualDamage, dist);
                Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, ResParams, int(12) + Rand(4), int(MyWeaponType));
            }
            SufferEffect(Victims, dist);
        }        
    }    
    // End:0x504
    if((LastTouched != none) && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x3A3
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
        // End:0x4F4
        if(int(LastTouched.Role) == int(ROLE_Authority))
        {
            // End:0x465
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            DamageLog(Victims, fActualDamage, dist);
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, int(12), int(MyWeaponType));
        }
        SufferEffect(Victims, dist);
    }
    bHurtEntry = false;
    //return;    
}

simulated function SufferEffect(Pawn Victim, float fDist)
{
    local float fRangeMiddle, fRangeLerp, fEffDistLerp;
    local PlayerController VictimPC;
    local float fExpRadious_Outer, fExpRadious_Inner;

    // End:0x0D
    if(Victim == none)
    {
        return;
    }
    // End:0x23
    if(!Victim.IsLocallyControlled())
    {
        return;
    }
    // End:0x65
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
    // End:0x27E
    if((Victim != none) && BaseParams.fHitEAXEffectTime > float(0))
    {
        // End:0x158
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x158
            if((Victim.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x158
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        VictimPC = PlayerController(Victim.Controller);
        // End:0x27E
        if(VictimPC != none)
        {
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1A9
            if(fRangeMiddle == float(0))
            {
                fEffDistLerp = 1.0000000;                
            }
            else
            {
                fRangeLerp = FMax(0.0000000, (fDist - fExpRadious_Inner) / fRangeMiddle);
                // End:0x229
                if(BaseParams.fExplDam_Inner != float(0))
                {
                    fEffDistLerp = ((BaseParams.fExplDam_Inner * (float(1) - fRangeLerp)) + (BaseParams.fExplDam_Outer * fRangeLerp)) / BaseParams.fExplDam_Inner;                    
                }
                else
                {
                    fEffDistLerp = 0.0000000;
                }
            }
            Victim.SetEaxEffect(Level.GameMgr.GetEAXEffect(BaseParams.strHitEAXEffectClass), BaseParams.fHitEAXEffectTime * fEffDistLerp);
        }
    }
    //return;    
}

function DamageLog(Pawn Victim, float fDam, float fDist)
{
    local string szType, szName;

    // End:0x20
    if(!Level.GetLocalPlayerController().bDamageLog)
    {
        return;
    }
    // End:0x68
    if((Instigator.Controller != Level.GetLocalPlayerController()) && Victim.Controller != Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0x88
    if(Victim.PlayerReplicationInfo.PlayerName == "")
    {
        return;
    }
    // End:0xDA
    if(Instigator.Controller == Level.GetLocalPlayerController())
    {
        szType = "[Attack]";
        szName = Victim.PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        szType = "[Defend]";
        szName = Instigator.PlayerReplicationInfo.PlayerName;
    }
    Level.GetLocalPlayerController().myHUD.AddTextMessage((((((((((((((szType $ " ") $ string(fDam)) $ " / ") $ szName) $ " / ") $ BaseParams.strName) $ " / ") $ string(0)) $ " / ") $ string(fDist)) $ " / ") $ "0%") $ " / ") $ string(Level.TimeSeconds), Class'Engine_Decompressed.GameMessage', Instigator.Controller.PlayerReplicationInfo);
    //return;    
}

simulated function Class<Emitter> GetExplosionClassByActor()
{
    switch(mHitActor.SurfaceType)
    {
        // End:0x1B
        case 5:
            return ExplosionClass_dirt;
        // End:0x26
        case 9:
            return ExplosionClass_grass;
        // End:0x2B
        case 6:
        // End:0x36
        case 7:
            return ExplosionClass_metal;
        // End:0x41
        case 12:
            return ExplosionClass_snow;
        // End:0x4C
        case 13:
            return ExplosionClass_water;
        // End:0x57
        case 8:
            return ExplosionClass_wood;
        // End:0xFFFF
        default:
            return ExplosionClass;
            break;
    }
    //return;    
}

simulated function Class<Emitter> GetExplosionClassByMaterial()
{
    switch(mHitMaterial.SurfaceType)
    {
        // End:0x1B
        case 5:
            return ExplosionClass_dirt;
        // End:0x26
        case 9:
            return ExplosionClass_grass;
        // End:0x2B
        case 6:
        // End:0x36
        case 7:
            return ExplosionClass_metal;
        // End:0x41
        case 12:
            return ExplosionClass_snow;
        // End:0x4C
        case 13:
            return ExplosionClass_water;
        // End:0x57
        case 8:
            return ExplosionClass_wood;
        // End:0xFFFF
        default:
            return ExplosionClass;
            break;
    }
    //return;    
}

simulated function Class<Emitter> GetExplosionClass()
{
    local Class<Emitter> ResultExplosionClass;

    // End:0x1A
    if(mHitMaterial != none)
    {
        ResultExplosionClass = GetExplosionClassByMaterial();        
    }
    else
    {
        // End:0x34
        if(mHitActor != none)
        {
            ResultExplosionClass = GetExplosionClassByActor();            
        }
        else
        {
            ResultExplosionClass = ExplosionClass;
        }
    }
    // End:0x55
    if(ResultExplosionClass == none)
    {
        ResultExplosionClass = ExplosionClass;
    }
    return ResultExplosionClass;
    //return;    
}

simulated function wLoadOut(int iID)
{
    local wWeaponManager wMani;

    wMani = Level.WeaponMgr;
    BaseParams = wMani.GetBaseParam(iID);
    ResParams = wMani.GetRes(BaseParams.szClass_Resource);
    MomentumTransfer = BaseParams.fMomentum;
    Momentum_Pawn = BaseParams.fMomentum_Pawn;
    switch(BaseParams.ProjMoveType)
    {
        // End:0x96
        case 1:
            SetPhysics(2);
            // End:0xAB
            break;
        // End:0x9B
        case 2:
        // End:0xA8
        case 3:
            SetPhysics(6);
            // End:0xAB
            break;
        // End:0xFFFF
        default:
            break;
    }
    bProjTarget = true;
    bExplodeCollide = BaseParams.bExplodeCollide;
    bTakeDamage = BaseParams.bProjTakeDamage;
    LifeSpan = BaseParams.fActiveTime;
    // End:0x123
    if(ResParams.default.stProj != none)
    {
        SetDrawType(8);
        SetStaticMesh(ResParams.default.stProj);
    }
    fGravMass = BaseParams.fBulletGravity;
    ExplosionClass = ResParams.default.effect_Explosion;
    // End:0x182
    if(ResParams.default.sound_Bullet_Move != none)
    {
        PlaySound(ResParams.default.sound_Bullet_Move, 3,,, ResParams.default.rad_Bullet_Move);
    }
    //return;    
}

simulated function BlowUp(Vector HitLocation)
{
    HurtRadius(Damage, DamageRadius, MyDamageType, 0.0000000, HitLocation);
    // End:0x37
    if(int(Role) == int(ROLE_Authority))
    {
        MakeNoise(1.0000000);
    }
    RumbleRadius(HitLocation);
    //return;    
}

simulated function RumbleRadius(Vector HitLocation)
{
    local Pawn kVictim;

    // End:0x18
    if(BaseParams.fExplForce_Effect == float(0))
    {
        return;
    }
    // End:0x8C
    foreach CollidingActors(Class'Engine_Decompressed.Pawn', kVictim, BaseParams.fExplRad_Effect, HitLocation)
    {
        // End:0x8B
        if(kVictim == Level.GetLocalPlayerController().Pawn)
        {
            PlayerController(kVictim.Controller).wShockView(BaseParams.fExplForce_Effect);            
            return;
        }        
    }    
    //return;    
}

function RecoverInstigator()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x8D [Loop If]
    if(C != none)
    {
        // End:0x76
        if(C.PlayerReplicationInfo.PlayerName == InstigatorName)
        {
            // End:0x76
            if(C.Pawn != none)
            {
                Instigator = C.Pawn;
                InstigatorController = C;
                // [Explicit Break]
                goto J0x8D;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    J0x8D:

    // End:0x9B
    if(Instigator == none)
    {
        Destroy();
    }
    //return;    
}

function RecoverFromHostChange()
{
    super(Actor).RecoverFromHostChange();
    RecoverInstigator();
    //return;    
}

defaultproperties
{
    Team=255
    Physics=0
    SoundOcclusion=1
}