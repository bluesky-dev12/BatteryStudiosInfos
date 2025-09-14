/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMeleeFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:8
 *	Functions:12
 *
 *******************************************************************************/
class wMeleeFire extends wWeaponFire;

enum EExpressType
{
    ET_Anim,
    ET_Mesh
};

var float frange;
var float fDegree_InsideAngle;
var wWeapon weapon_Old;
var Sound sound_Hit;
var Sound sound_Miss;
var int tempCount;
var bool bApplyMeleeAttackDelay;
var wMeleeFire.EExpressType ExpressType;

event ModeDoFire()
{
    local wWeapon MWeapon;

    // End:0x0d
    if(!AllowFire())
    {
        return;
    }
    // End:0x96
    if(ExpressType == 1)
    {
        // End:0x94
        if(Instigator.IsLocallyControlled())
        {
            weapon_Old = Weapon.OldWeapon;
            MWeapon = Instigator.Inventory.WeaponChangeWClass('wMeleeWeapon');
            // End:0x94
            if(MWeapon != none)
            {
                Instigator.PendingWeapon = MWeapon;
                Instigator.ChangedWeapon();
            }
        }
        return;
    }
    // End:0xb7
    if(MaxHoldTime > 0.0)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0x149
    if(Weapon.Role == 4)
    {
        HoldTime = 0.0;
        // End:0xfe
        if(Instigator == none || Instigator.Controller == none)
        {
            return;
        }
        // End:0x13a
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
    }
    // End:0x19a
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        PlayFiring();
        Weapon.MeleeState = 1;
        Weapon.bActiveMelee = true;
    }
    // End:0x1a0
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    // End:0x1fa
    if(bFireOnRelease)
    {
        // End:0x1dc
        if(bIsFiring)
        {
            NextFireTime += MaxHoldTime + FireRate;
        }
        // End:0x1f7
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }
    }
    // End:0x221
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0;
    // End:0x27e
    if(Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
}

function PlayFiring()
{
    // End:0x2f
    if(Weapon.Mesh != none)
    {
        Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
    }
}

function DoFireEffect()
{
    local Vector StartTrace;
    local Rotator Aim;

    Instigator.MakeNoise(1.0);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x7d
    if(!Level.GetMatchMaker().BotTutorial)
    {
        DoTrace(StartTrace, Aim);
    }
    // End:0x8d
    else
    {
        DoTraceTutorial(StartTrace, Aim);
    }
}

function bool FindTarget2(Vector Start, Rotator Dir, out Pawn rTarget, out Vector HitLocation, out byte HitCollisionPart)
{
    local bool bExistTarg;
    local Pawn collidingPawn;
    local float Range, minCollidingRange, collidingRange;
    local Vector X, End, HitLoc, hitNor, TraceEnd;

    local bool bTraceActor, bTraceGeom;
    local byte HitPart;
    local Vector traceExtent;

    traceExtent.X = float(BaseParams.iMeleeExtent);
    traceExtent.Y = float(BaseParams.iMeleeExtent);
    traceExtent.Z = float(BaseParams.iMeleeExtent);
    X = vector(Dir);
    Range = float(BaseParams.iMeleeRange);
    End = Start + Range * X;
    bExistTarg = false;
    minCollidingRange = -1.0;
    // End:0x1f7
    foreach Weapon.VisibleCollidingActors(class'Pawn', collidingPawn, Range, End)
    {
        // End:0x1f6
        if(collidingPawn != Weapon.Owner && !collidingPawn.Controller.SameTeamAs(Pawn(Weapon.Owner).Controller))
        {
            TraceEnd = End;
            bTraceActor = collidingPawn.TraceThisActorHitPart(HitLoc, hitNor, HitPart, TraceEnd, Start, traceExtent);
            // End:0x165
            if(bTraceActor == true)
            {
                continue;
            }
            // End:0x1f7
            else
            {
                bTraceGeom = collidingPawn.FastTrace(Start, TraceEnd);
                // End:0x192
                if(bTraceGeom == false)
                {
                    continue;
                }
                // End:0x1f7
                else
                {
                    collidingRange = VSize(HitLoc - Start);
                    // End:0x1f6
                    if(!bExistTarg || minCollidingRange > collidingRange)
                    {
                        minCollidingRange = collidingRange;
                        bExistTarg = true;
                        rTarget = collidingPawn;
                        HitLocation = HitLoc;
                        HitCollisionPart = HitPart;
                    }
                }
                continue;
            }
        }        
    }
    return bExistTarg;
}

function bool FindTarget3(Vector Start, Rotator Dir, out Actor rTarget, out Vector HitLocation)
{
    local bool bExistTarg;
    local Actor collidingActor;
    local float Range, minCollidingRange, collidingRange;
    local Vector X, End, HitLoc, hitNor, TraceEnd;

    local bool bTraceActor, bTraceGeom;

    X = vector(Dir);
    Range = frange / float(2);
    End = Start + Range * X;
    bExistTarg = false;
    minCollidingRange = -1.0;
    // End:0x188
    foreach Weapon.VisibleCollidingActors(class'Actor', collidingActor, Range, End)
    {
        // End:0x187
        if(collidingActor != Weapon.Owner)
        {
            TraceEnd = collidingActor.Location;
            TraceEnd.Z += Pawn(Weapon.Owner).EyeHeight / float(2);
            bTraceActor = collidingActor.TraceThisActor(HitLoc, hitNor, TraceEnd, Start);
            // End:0x101
            if(bTraceActor == true)
            {
                continue;
            }
            // End:0x188
            else
            {
                bTraceGeom = collidingActor.FastTrace(Start, TraceEnd);
                // End:0x12e
                if(bTraceGeom == false)
                {
                    continue;
                }
                // End:0x188
                else
                {
                    collidingRange = VSize(HitLoc - Start);
                    // End:0x187
                    if(!bExistTarg || minCollidingRange > collidingRange)
                    {
                        minCollidingRange = collidingRange;
                        bExistTarg = true;
                        rTarget = collidingActor;
                        HitLocation = HitLoc;
                    }
                }
                continue;
            }
        }        
    }
    return bExistTarg;
}

function bool FindTarget(Vector Start, Rotator Dir, out Pawn rTarget, out Vector HitLocation)
{
    local Vector X, End, HitNormal;
    local Actor Other;
    local bool bExistTarg;
    local float fRadian_InsideAngle, fMinRange, i, j, fRange_Iter;

    local Vector vDir_Iter;
    local Rotator rotIter_i, rotIter_j;

    bExistTarg = false;
    fRadian_InsideAngle = fDegree_InsideAngle * 3.1415920 / float(180);
    X = vector(Dir);
    End = Start + frange * X;
    Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
    // End:0xcb
    if(Other != none && Other != Instigator && Other.IsA('wPawn'))
    {
        bExistTarg = true;
        rTarget = Pawn(Other);
        fMinRange = VSize(HitLocation - Start);
    }
    i = 3.1415920 / float(18);
    J0xdc:
    // End:0x27a [While If]
    if(i < fRadian_InsideAngle)
    {
        rotIter_i.Pitch = int(float(int(float(65535) / 3.1415920 * float(2))) * i);
        j = 0.0;
        J0x122:
        // End:0x265 [While If]
        if(j < 3.1415920 * float(2))
        {
            rotIter_j.Roll = int(float(int(float(65535) / 3.1415920 * float(2))) * j);
            vDir_Iter = vector(Dir) >> rotIter_i;
            vDir_Iter = vDir_Iter >> rotIter_j;
            End = Start + frange * vDir_Iter;
            Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
            // End:0x250
            if(Other != none && Other != Instigator && Other.IsA('wPawn'))
            {
                fRange_Iter = VSize(HitLocation - Start);
                // End:0x250
                if(fMinRange > fRange_Iter || !bExistTarg)
                {
                    bExistTarg = true;
                    rTarget = Pawn(Other);
                    fMinRange = fRange_Iter;
                }
            }
            j += 3.1415920 / float(18);
            // This is an implied JumpToken; Continue!
            goto J0x122;
        }
        i += 3.1415920 / float(18);
        // This is an implied JumpToken; Continue!
        goto J0xdc;
    }
    return bExistTarg;
}

function bool FindTarget4(Vector Start, Rotator Dir, out Actor rTarget, out Vector HitLocation)
{
    local Vector X, End, HitNormal;
    local Actor Other;
    local bool bExistTarg;
    local float fRadian_InsideAngle, fMinRange, i, j, fRange_Iter;

    local Vector vDir_Iter;
    local Rotator rotIter_i, rotIter_j;

    bExistTarg = false;
    fRadian_InsideAngle = fDegree_InsideAngle * 3.1415920 / float(180);
    X = vector(Dir);
    End = Start + frange * X;
    Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
    // End:0xb0
    if(Other != none && Other != Instigator)
    {
        bExistTarg = true;
        rTarget = Other;
        fMinRange = VSize(HitLocation - Start);
    }
    i = 3.1415920 / float(18);
    J0xc1:
    // End:0x21d [While If]
    if(i < fRadian_InsideAngle)
    {
        rotIter_i.Pitch = int(float(int(float(65535) / 3.1415920 * float(2))) * i);
        j = 0.0;
        J0x107:
        // End:0x208 [While If]
        if(j < 3.1415920 * float(2))
        {
            rotIter_j.Roll = int(float(int(float(65535) / 3.1415920 * float(2))) * j);
            vDir_Iter = vector(Dir) >> rotIter_i;
            vDir_Iter = vDir_Iter >> rotIter_j;
            End = Start + frange * vDir_Iter;
            // End:0x1f3
            if(Other != none && Other != Instigator)
            {
                fRange_Iter = VSize(HitLocation - Start);
                // End:0x1f3
                if(fMinRange > fRange_Iter || !bExistTarg)
                {
                    bExistTarg = true;
                    rTarget = Other;
                    fMinRange = fRange_Iter;
                }
            }
            j += 3.1415920 / float(18);
            // This is an implied JumpToken; Continue!
            goto J0x107;
        }
        i += 3.1415920 / float(18);
        // This is an implied JumpToken; Continue!
        goto J0xc1;
    }
    return bExistTarg;
}

function float GetDamagePerc(byte HitPart)
{
    local float fDamageAmp;

    switch(HitPart)
    {
        // End:0x48
        case 0:
            fDamageAmp = 1.0;
            Weapon.clog("Melee CollisionPart = CP_None");
            // End:0x2c9
            break;
        // End:0x92
        case 1:
            fDamageAmp = BaseParams.fMeleeDam_Head;
            Weapon.clog("Melee CollisionPart = CP_Head");
            // End:0x2c9
            break;
        // End:0xe2
        case 2:
            fDamageAmp = BaseParams.fMeleeDam_UpperTorso;
            Weapon.clog("Melee CollisionPart = CP_UpperTorso");
            // End:0x2c9
            break;
        // End:0x132
        case 3:
            fDamageAmp = BaseParams.fMeleeDam_LowerTorso;
            Weapon.clog("Melee CollisionPart = CP_LowerTorso");
            // End:0x2c9
            break;
        // End:0x137
        case 4:
        // End:0x182
        case 5:
            fDamageAmp = BaseParams.fMeleeDam_UpperArm;
            Weapon.clog("Melee CollisionPart = CP_UpperArm");
        // End:0x187
        case 6:
        // End:0x1d5
        case 7:
            fDamageAmp = BaseParams.fMeleeDam_LowerArm;
            Weapon.clog("Melee CollisionPart = CP_LowerArm");
            // End:0x2c9
            break;
        // End:0x1da
        case 8:
        // End:0x228
        case 9:
            fDamageAmp = BaseParams.fMeleeDam_UpperLeg;
            Weapon.clog("Melee CollisionPart = CP_UpperLeg");
            // End:0x2c9
            break;
        // End:0x22d
        case 10:
        // End:0x27b
        case 11:
            fDamageAmp = BaseParams.fMeleeDam_LowerLeg;
            Weapon.clog("Melee CollisionPart = CP_LowerLeg");
            // End:0x2c9
            break;
        // End:0x2b8
        case 16:
            fDamageAmp = 1.0;
            Weapon.clog("Melee CollisionPart = CP_ETC");
        // End:0xffff
        default:
            fDamageAmp = 1.0;
            // End:0x2c9 Break;
            break;
    }
    return fDamageAmp;
}

function DoTrace(Vector Start, Rotator Dir)
{
    local bool bExistTarg;
    local Pawn rTarget;
    local Vector HitLocation, MVec;
    local byte HitCollisionPart;
    local float fDamageAmp;
    local int CalDamage;

    bExistTarg = FindTarget2(Start, Dir, rTarget, HitLocation, HitCollisionPart);
    // End:0x147
    if(bExistTarg)
    {
        MVec = vector(Dir) * float(6000);
        fDamageAmp = GetDamagePerc(HitCollisionPart);
        CalDamage = int(float(BaseParams.iDamMelee) * fDamageAmp);
        DamageLog(rTarget, float(CalDamage), float(BaseParams.iMeleeRange), HitCollisionPart);
        rTarget.TakeDamage(CalDamage, Instigator, HitLocation, vect(0.0, 0.0, 0.0), class'wDamageMelee', HitCollisionPart);
        Weapon.clog("Melee Damage = " $ string(CalDamage) $ " Range = " $ string(BaseParams.iMeleeRange));
        Instigator.PlaySound(sound_Hit, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
    // End:0x170
    else
    {
        Instigator.PlaySound(sound_Miss, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
}

function DoTraceTutorial(Vector Start, Rotator Dir)
{
    local bool bExistTarg;
    local Actor rTarget;
    local Vector HitLocation, MVec;

    bExistTarg = FindTarget4(Start, Dir, rTarget, HitLocation);
    // End:0x9d
    if(bExistTarg)
    {
        MVec = vector(Dir) * float(6000);
        rTarget.TakeDamage(BaseParams.iDamMelee, Instigator, HitLocation, MVec, class'wDamageMelee');
        Instigator.PlaySound(sound_Hit, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
    // End:0xc6
    else
    {
        Instigator.PlaySound(sound_Miss, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = 0;
    bWaitForRelease = true;
    FireSound = none;
    FireRate = 0.10;
    sound_Hit = ResParams.default.sound_Melee_Ok;
    sound_Miss = ResParams.default.sound_Melee_Miss;
    SetFireAnim();
}

simulated function SetFireAnim()
{
    // End:0x2a
    if(Weapon.HasAnim('MeleeAttack'))
    {
        ExpressType = 0;
        FireAnim = 'MeleeAttack';
    }
    // End:0x5c
    else
    {
        // End:0x54
        if(Weapon.HasAnim('MAttack'))
        {
            ExpressType = 0;
            FireAnim = 'MAttack';
        }
        // End:0x5c
        else
        {
            ExpressType = 1;
        }
    }
}

defaultproperties
{
    frange=225.0
    fDegree_InsideAngle=90.0
    bApplyMeleeAttackDelay=true
    bWaitForRelease=true
    TransientSoundRadius=105.0
    FireAnim=MeleeAttack
}