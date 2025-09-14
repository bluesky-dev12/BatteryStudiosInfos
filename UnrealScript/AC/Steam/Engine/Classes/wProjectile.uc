/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wProjectile.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:14
 *
 *******************************************************************************/
class wProjectile extends Projectile
    dependson(Projectile)
    dependson(wWeaponManager)
    notplaceable;

var class<Emitter> ExplosionClass;
var class<Emitter> ExplosionClass_dirt;
var class<Emitter> ExplosionClass_grass;
var class<Emitter> ExplosionClass_metal;
var class<Emitter> ExplosionClass_snow;
var class<Emitter> ExplosionClass_water;
var class<Emitter> ExplosionClass_wood;
var int iWeaponID;
var wWeaponBaseParams BaseParams;
var class<wWeaponRes_Base> ResParams;
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
var float fMinFlashReduceRate;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        iWeaponID, bMustExplode,
        Rotate_Pitch, Rotate_Yaw,
        Rotate_Roll, vHostLocation,
        bIncExplosion, Team,
        InstigatorName;

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
    if(Instigator != none && Instigator.PlayerReplicationInfo != none)
    {
        InstigatorName = Instigator.PlayerReplicationInfo.PlayerName;
    }
}

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    // End:0x2e
    if(BaseParams == none && iWeaponID != 0)
    {
        wLoadOut(iWeaponID);
    }
    // End:0x4f
    if(bMustExplode)
    {
        Explode(Location, vect(0.0, 0.0, 1.0));
    }
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Pawn Victims;
    local float dist, damageScale, fReduceRate;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner;

    // End:0x0b
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x55
    if(bIncExplosion)
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.30;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.30;
    }
    // End:0x7d
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x362
    foreach VisibleCollidingActors(class'Pawn', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0xa6
        if(Victims == none)
        {
            continue;
        }
        // End:0x362
        else
        {
            // End:0x361
            if(HurtWall != Victims && !Victims.IsA('FluidSurfaceInfo'))
            {
                Dir = Victims.Location - HitLocation;
                dist = FMax(1.0, VSize(Dir));
                Dir = Dir / dist;
                fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
                // End:0x144
                if(fRangeMiddle == float(0))
                {
                    fActualDamage = BaseParams.fExplDam_Inner;
                }
                // End:0x19b
                else
                {
                    fRangeLerp = FMax(0.0, dist - fExpRadious_Inner / fRangeMiddle);
                    fActualDamage = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp;
                }
                damageScale = 1.0 - fRangeLerp;
                fActualMomentum = MomentumTransfer;
                // End:0x2e0
                if(Victims.Role == 4)
                {
                    // End:0x206
                    if(Instigator == none || Instigator.Controller == none)
                    {
                        Victims.SetDelayedDamageInstigatorController(InstigatorController);
                    }
                    // End:0x21c
                    if(Victims == LastTouched)
                    {
                        LastTouched = none;
                    }
                    // End:0x24b
                    if(Victims.IsA('wHelicopter'))
                    {
                        fActualDamage = fActualDamage * BaseParams.fDamPerc_Heli;
                    }
                    DamageLog(Victims, fActualDamage, dist);
                    Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, ResParams, 12 + Rand(4), MyWeaponType);
                }
                fReduceRate = 1.0;
                // End:0x34c
                if(BaseParams.fHitFlashTime > float(0))
                {
                    fReduceRate = Dir Dot vector(Victims.Rotation) * -1.0 + 1.0 * 0.50 + fMinFlashReduceRate;
                    fReduceRate = FMin(1.0, fReduceRate);
                }
                SufferEffect(Victims, dist, fReduceRate);
            }
            continue;
        }        
    }
    // End:0x5e6
    if(LastTouched != none && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x414
        if(fRangeMiddle == float(0))
        {
            fActualDamage = BaseParams.fExplDam_Inner;
        }
        // End:0x46b
        else
        {
            fRangeLerp = FMax(0.0, dist - fExpRadious_Inner / fRangeMiddle);
            fActualDamage = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp;
        }
        damageScale = 1.0 - fRangeLerp;
        fActualMomentum = MomentumTransfer;
        // End:0x565
        if(LastTouched.Role == 4)
        {
            // End:0x4d6
            if(Instigator == none || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            DamageLog(Victims, fActualDamage, dist);
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, DamageType, 12, MyWeaponType);
        }
        fReduceRate = 1.0;
        // End:0x5d1
        if(BaseParams.fHitFlashTime > float(0))
        {
            fReduceRate = Dir Dot vector(Victims.Rotation) * -1.0 + 1.0 * 0.50 + fMinFlashReduceRate;
            fReduceRate = FMin(1.0, fReduceRate);
        }
        SufferEffect(Victims, dist, fReduceRate);
    }
    bHurtEntry = false;
}

simulated function HurtRadiusTutorial(float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float dist, damageScale;
    local Vector Dir;
    local float fActualMomentum, fRangeLerp, fRangeMiddle, fActualDamage, fExpRadious_Outer, fExpRadious_Inner;

    // End:0x0b
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x55
    if(bIncExplosion)
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.30;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.30;
    }
    // End:0x7d
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x2cc
    foreach VisibleCollidingActors(class'Actor', Victims, fExpRadious_Outer, HitLocation)
    {
        // End:0xa6
        if(Victims == none)
        {
            continue;
        }
        // End:0x2cc
        else
        {
            // End:0x2cb
            if(HurtWall != Victims && !Victims.IsA('FluidSurfaceInfo'))
            {
                Dir = Victims.Location - HitLocation;
                dist = FMax(1.0, VSize(Dir));
                Dir = Dir / dist;
                fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
                // End:0x144
                if(fRangeMiddle == float(0))
                {
                    fActualDamage = BaseParams.fExplDam_Inner;
                }
                // End:0x19b
                else
                {
                    fRangeLerp = FMax(0.0, dist - fExpRadious_Inner / fRangeMiddle);
                    fActualDamage = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp;
                }
                damageScale = 1.0 - fRangeLerp;
                fActualMomentum = MomentumTransfer;
                // End:0x2cb
                if(Victims.Role == 4)
                {
                    // End:0x206
                    if(Instigator == none || Instigator.Controller == none)
                    {
                        Victims.SetDelayedDamageInstigatorController(InstigatorController);
                    }
                    // End:0x21c
                    if(Victims == LastTouched)
                    {
                        LastTouched = none;
                    }
                    // End:0x24b
                    if(Victims.IsA('wHelicopter'))
                    {
                        fActualDamage = fActualDamage * BaseParams.fDamPerc_Heli;
                    }
                    Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, ResParams, 12 + Rand(4), MyWeaponType);
                }
            }
            continue;
        }        
    }
    // End:0x4ba
    if(LastTouched != none && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = Pawn(LastTouched);
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0, VSize(Dir));
        Dir = Dir / dist;
        fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
        // End:0x37e
        if(fRangeMiddle == float(0))
        {
            fActualDamage = BaseParams.fExplDam_Inner;
        }
        // End:0x3d5
        else
        {
            fRangeLerp = FMax(0.0, dist - fExpRadious_Inner / fRangeMiddle);
            fActualDamage = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp;
        }
        damageScale = 1.0 - fRangeLerp;
        fActualMomentum = MomentumTransfer;
        // End:0x4ba
        if(LastTouched.Role == 4)
        {
            // End:0x440
            if(Instigator == none || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            Victims.TakeDamage(int(fActualDamage), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, DamageType, 12, MyWeaponType);
        }
    }
    bHurtEntry = false;
}

simulated function SufferEffect(Pawn Victim, float fDist, float fReduceRate)
{
    local float fRangeMiddle, fRangeLerp, fEffDistLerp;
    local PlayerController VictimPC;
    local float fExpRadious_Outer, fExpRadious_Inner;

    // End:0x0d
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
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.30;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.30;
    }
    // End:0x8d
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x27e
    if(Victim != none && BaseParams.fHitEAXEffectTime > float(0))
    {
        // End:0x158
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x158
            if(Victim.PlayerReplicationInfo.Team != none && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x158
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        VictimPC = PlayerController(Victim.Controller);
        // End:0x27e
        if(VictimPC != none)
        {
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1a9
            if(fRangeMiddle == float(0))
            {
                fEffDistLerp = 1.0;
            }
            // End:0x234
            else
            {
                fRangeLerp = FMax(0.0, fDist - fExpRadious_Inner / fRangeMiddle);
                // End:0x229
                if(BaseParams.fExplDam_Inner != float(0))
                {
                    fEffDistLerp = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp / BaseParams.fExplDam_Inner;
                }
                // End:0x234
                else
                {
                    fEffDistLerp = 0.0;
                }
            }
            Victim.SetEaxEffect(Level.GameMgr.GetEAXEffect(BaseParams.strHitEAXEffectClass), BaseParams.fHitEAXEffectTime * fEffDistLerp);
        }
    }
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
    if(Instigator.Controller != Level.GetLocalPlayerController() && Victim.Controller != Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0x88
    if(Victim.PlayerReplicationInfo.PlayerName == "")
    {
        return;
    }
    // End:0xda
    if(Instigator.Controller == Level.GetLocalPlayerController())
    {
        szType = "[Attack]";
        szName = Victim.PlayerReplicationInfo.PlayerName;
    }
    // End:0x107
    else
    {
        szType = "[Defend]";
        szName = Instigator.PlayerReplicationInfo.PlayerName;
    }
    Level.GetLocalPlayerController().myHUD.AddTextMessage(szType $ " " $ string(fDam) $ " / " $ szName $ " / " $ BaseParams.strName $ " / " $ string(0) $ " / " $ string(fDist) $ " / " $ "0%" $ " / " $ string(Level.TimeSeconds), class'GameMessage', Instigator.Controller.PlayerReplicationInfo);
}

simulated function class<Emitter> GetExplosionClassByActor()
{
    switch(mHitActor.SurfaceType)
    {
        // End:0x1b
        case 5:
            return ExplosionClass_dirt;
        // End:0x26
        case 9:
            return ExplosionClass_grass;
        // End:0x2b
        case 6:
        // End:0x36
        case 7:
            return ExplosionClass_metal;
        // End:0x41
        case 12:
            return ExplosionClass_snow;
        // End:0x4c
        case 13:
            return ExplosionClass_water;
        // End:0x57
        case 8:
            return ExplosionClass_wood;
        // End:0xffff
        default:
            return ExplosionClass;
    }
}

simulated function class<Emitter> GetExplosionClassByMaterial()
{
    switch(mHitMaterial.SurfaceType)
    {
        // End:0x1b
        case 5:
            return ExplosionClass_dirt;
        // End:0x26
        case 9:
            return ExplosionClass_grass;
        // End:0x2b
        case 6:
        // End:0x36
        case 7:
            return ExplosionClass_metal;
        // End:0x41
        case 12:
            return ExplosionClass_snow;
        // End:0x4c
        case 13:
            return ExplosionClass_water;
        // End:0x57
        case 8:
            return ExplosionClass_wood;
        // End:0xffff
        default:
            return ExplosionClass;
    }
}

simulated function class<Emitter> GetExplosionClass()
{
    local class<Emitter> ResultExplosionClass;

    // End:0x1a
    if(mHitMaterial != none)
    {
        ResultExplosionClass = GetExplosionClassByMaterial();
    }
    // End:0x3f
    else
    {
        // End:0x34
        if(mHitActor != none)
        {
            ResultExplosionClass = GetExplosionClassByActor();
        }
        // End:0x3f
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
            // End:0xab
            break;
        // End:0x9b
        case 2:
        // End:0xa8
        case 3:
            SetPhysics(6);
            // End:0xab
            break;
        // End:0xffff
        default:
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
}

simulated function BlowUp(Vector HitLocation)
{
    // End:0x40
    if(!Level.GetMatchMaker().BotTutorial)
    {
        HurtRadius(Damage, DamageRadius, MyDamageType, 0.0, HitLocation);
    }
    // End:0x5f
    else
    {
        HurtRadiusTutorial(Damage, DamageRadius, MyDamageType, 0.0, HitLocation);
    }
    // End:0x77
    if(Role == 4)
    {
        MakeNoise(1.0);
    }
    RumbleRadius(HitLocation);
}

simulated function RumbleRadius(Vector HitLocation)
{
    local Pawn kVictim;

    // End:0x18
    if(BaseParams.fExplForce_Effect == float(0))
    {
        return;
    }
    // End:0x8c
    foreach CollidingActors(class'Pawn', kVictim, BaseParams.fExplRad_Effect, HitLocation)
    {
        // End:0x8b
        if(kVictim == Level.GetLocalPlayerController().Pawn)
        {
            PlayerController(kVictim.Controller).wShockView(BaseParams.fExplForce_Effect);
            break;
            return;
        }                
    }
}

function RecoverInstigator()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x8d [While If]
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
            }
            // End:0x8d
            else
            {
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    // End:0x9b
    if(Instigator == none)
    {
        Destroy();
    }
}

function RecoverFromHostChange()
{
    super(Actor).RecoverFromHostChange();
    RecoverInstigator();
}

defaultproperties
{
    Team=255
    fMinFlashReduceRate=0.50
    Physics=0
    SoundOcclusion=1
}