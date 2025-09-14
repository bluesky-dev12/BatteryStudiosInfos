class wMeleeFire extends wWeaponFire;

enum EExpressType
{
    ET_Anim,                        // 0
    ET_Mesh                         // 1
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

    // End:0x0D
    if(!AllowFire())
    {
        return;
    }
    // End:0x96
    if(int(ExpressType) == int(1))
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
    // End:0xB7
    if(MaxHoldTime > 0.0000000)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0x149
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        HoldTime = 0.0000000;
        // End:0xFE
        if((Instigator == none) || Instigator.Controller == none)
        {
            return;
        }
        // End:0x13A
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
    }
    // End:0x19A
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        PlayFiring();
        Weapon.MeleeState = 1;
        Weapon.bActiveMelee = true;        
    }
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    // End:0x1FA
    if(bFireOnRelease)
    {
        // End:0x1DC
        if(bIsFiring)
        {
            NextFireTime += (MaxHoldTime + FireRate);            
        }
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }        
    }
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0000000;
    // End:0x27E
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    //return;    
}

function PlayFiring()
{
    // End:0x2F
    if(Weapon.Mesh != none)
    {
        Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
    }
    //return;    
}

function DoFireEffect()
{
    local Vector StartTrace;
    local Rotator Aim;

    Instigator.MakeNoise(1.0000000);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x7D
    if(!Level.GetMatchMaker().BotTutorial)
    {
        DoTrace(StartTrace, Aim);        
    }
    else
    {
        DoTraceTutorial(StartTrace, Aim);
    }
    //return;    
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
    X = Vector(Dir);
    Range = float(BaseParams.iMeleeRange);
    End = Start + (Range * X);
    bExistTarg = false;
    minCollidingRange = -1.0000000;
    // End:0x1F7
    foreach Weapon.VisibleCollidingActors(Class'Engine_Decompressed.Pawn', collidingPawn, Range, End)
    {
        // End:0x1F6
        if((collidingPawn != Weapon.Owner) && !collidingPawn.Controller.SameTeamAs(Pawn(Weapon.Owner).Controller))
        {
            TraceEnd = End;
            bTraceActor = collidingPawn.TraceThisActorHitPart(HitLoc, hitNor, HitPart, TraceEnd, Start, traceExtent);
            // End:0x165
            if(bTraceActor == true)
            {
                continue;                
            }
            bTraceGeom = collidingPawn.FastTrace(Start, TraceEnd);
            // End:0x192
            if(bTraceGeom == false)
            {
                continue;                
            }
            collidingRange = VSize(HitLoc - Start);
            // End:0x1F6
            if(!bExistTarg || minCollidingRange > collidingRange)
            {
                minCollidingRange = collidingRange;
                bExistTarg = true;
                rTarget = collidingPawn;
                HitLocation = HitLoc;
                HitCollisionPart = HitPart;
            }
        }        
    }    
    return bExistTarg;
    //return;    
}

function bool FindTarget3(Vector Start, Rotator Dir, out Actor rTarget, out Vector HitLocation)
{
    local bool bExistTarg;
    local Actor collidingActor;
    local float Range, minCollidingRange, collidingRange;
    local Vector X, End, HitLoc, hitNor, TraceEnd;

    local bool bTraceActor, bTraceGeom;

    X = Vector(Dir);
    Range = frange / float(2);
    End = Start + (Range * X);
    bExistTarg = false;
    minCollidingRange = -1.0000000;
    // End:0x188
    foreach Weapon.VisibleCollidingActors(Class'Engine_Decompressed.Actor', collidingActor, Range, End)
    {
        // End:0x187
        if(collidingActor != Weapon.Owner)
        {
            TraceEnd = collidingActor.Location;
            TraceEnd.Z += (Pawn(Weapon.Owner).EyeHeight / float(2));
            bTraceActor = collidingActor.TraceThisActor(HitLoc, hitNor, TraceEnd, Start);
            // End:0x101
            if(bTraceActor == true)
            {
                continue;                
            }
            bTraceGeom = collidingActor.FastTrace(Start, TraceEnd);
            // End:0x12E
            if(bTraceGeom == false)
            {
                continue;                
            }
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
    }    
    return bExistTarg;
    //return;    
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
    fRadian_InsideAngle = (fDegree_InsideAngle * 3.1415920) / float(180);
    X = Vector(Dir);
    End = Start + (frange * X);
    Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
    // End:0xCB
    if(((Other != none) && Other != Instigator) && Other.IsA('wPawn'))
    {
        bExistTarg = true;
        rTarget = Pawn(Other);
        fMinRange = VSize(HitLocation - Start);
    }
    i = 3.1415920 / float(18);
    J0xDC:

    // End:0x27A [Loop If]
    if(i < fRadian_InsideAngle)
    {
        rotIter_i.Pitch = int(float(int(float(65535) / (3.1415920 * float(2)))) * i);
        j = 0.0000000;
        J0x122:

        // End:0x265 [Loop If]
        if(j < (3.1415920 * float(2)))
        {
            rotIter_j.Roll = int(float(int(float(65535) / (3.1415920 * float(2)))) * j);
            vDir_Iter = Vector(Dir) >> rotIter_i;
            vDir_Iter = vDir_Iter >> rotIter_j;
            End = Start + (frange * vDir_Iter);
            Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
            // End:0x250
            if(((Other != none) && Other != Instigator) && Other.IsA('wPawn'))
            {
                fRange_Iter = VSize(HitLocation - Start);
                // End:0x250
                if((fMinRange > fRange_Iter) || !bExistTarg)
                {
                    bExistTarg = true;
                    rTarget = Pawn(Other);
                    fMinRange = fRange_Iter;
                }
            }
            j += (3.1415920 / float(18));
            // [Loop Continue]
            goto J0x122;
        }
        i += (3.1415920 / float(18));
        // [Loop Continue]
        goto J0xDC;
    }
    return bExistTarg;
    //return;    
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
    fRadian_InsideAngle = (fDegree_InsideAngle * 3.1415920) / float(180);
    X = Vector(Dir);
    End = Start + (frange * X);
    Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
    // End:0xB0
    if((Other != none) && Other != Instigator)
    {
        bExistTarg = true;
        rTarget = Other;
        fMinRange = VSize(HitLocation - Start);
    }
    i = 3.1415920 / float(18);
    J0xC1:

    // End:0x21D [Loop If]
    if(i < fRadian_InsideAngle)
    {
        rotIter_i.Pitch = int(float(int(float(65535) / (3.1415920 * float(2)))) * i);
        j = 0.0000000;
        J0x107:

        // End:0x208 [Loop If]
        if(j < (3.1415920 * float(2)))
        {
            rotIter_j.Roll = int(float(int(float(65535) / (3.1415920 * float(2)))) * j);
            vDir_Iter = Vector(Dir) >> rotIter_i;
            vDir_Iter = vDir_Iter >> rotIter_j;
            End = Start + (frange * vDir_Iter);
            // End:0x1F3
            if((Other != none) && Other != Instigator)
            {
                fRange_Iter = VSize(HitLocation - Start);
                // End:0x1F3
                if((fMinRange > fRange_Iter) || !bExistTarg)
                {
                    bExistTarg = true;
                    rTarget = Other;
                    fMinRange = fRange_Iter;
                }
            }
            j += (3.1415920 / float(18));
            // [Loop Continue]
            goto J0x107;
        }
        i += (3.1415920 / float(18));
        // [Loop Continue]
        goto J0xC1;
    }
    return bExistTarg;
    //return;    
}

function float GetDamagePerc(byte HitPart)
{
    local float fDamageAmp;

    switch(HitPart)
    {
        // End:0x1A
        case 0:
            fDamageAmp = 1.0000000;
            // End:0x110
            break;
        // End:0x36
        case 1:
            fDamageAmp = BaseParams.fMeleeDam_Head;
            // End:0x110
            break;
        // End:0x52
        case 2:
            fDamageAmp = BaseParams.fMeleeDam_UpperTorso;
            // End:0x110
            break;
        // End:0x6E
        case 3:
            fDamageAmp = BaseParams.fMeleeDam_LowerTorso;
            // End:0x110
            break;
        // End:0x73
        case 4:
        // End:0x8C
        case 5:
            fDamageAmp = BaseParams.fMeleeDam_UpperArm;
        // End:0x91
        case 6:
        // End:0xAD
        case 7:
            fDamageAmp = BaseParams.fMeleeDam_LowerArm;
            // End:0x110
            break;
        // End:0xB2
        case 8:
        // End:0xCE
        case 9:
            fDamageAmp = BaseParams.fMeleeDam_UpperLeg;
            // End:0x110
            break;
        // End:0xD3
        case 10:
        // End:0xEF
        case 11:
            fDamageAmp = BaseParams.fMeleeDam_LowerLeg;
            // End:0x110
            break;
        // End:0xFF
        case 16:
            fDamageAmp = 1.0000000;
        // End:0xFFFF
        default:
            fDamageAmp = 1.0000000;
            // End:0x110
            break;
            break;
    }
    return fDamageAmp;
    //return;    
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
    // End:0xFF
    if(bExistTarg)
    {
        MVec = Vector(Dir) * float(6000);
        fDamageAmp = GetDamagePerc(HitCollisionPart);
        CalDamage = int(float(BaseParams.iDamMelee) * fDamageAmp);
        DamageLog(rTarget, float(CalDamage), float(BaseParams.iMeleeRange), HitCollisionPart);
        rTarget.TakeDamage(CalDamage, Instigator, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine_Decompressed.wDamageMelee', int(HitCollisionPart));
        Instigator.PlaySound(sound_Hit, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);        
    }
    else
    {
        Instigator.PlaySound(sound_Miss, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
    //return;    
}

function DoTraceTutorial(Vector Start, Rotator Dir)
{
    local bool bExistTarg;
    local Actor rTarget;
    local Vector HitLocation, MVec;

    bExistTarg = FindTarget4(Start, Dir, rTarget, HitLocation);
    // End:0x9D
    if(bExistTarg)
    {
        MVec = Vector(Dir) * float(6000);
        rTarget.TakeDamage(BaseParams.iDamMelee, Instigator, HitLocation, MVec, Class'Engine_Decompressed.wDamageMelee');
        Instigator.PlaySound(sound_Hit, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);        
    }
    else
    {
        Instigator.PlaySound(sound_Miss, 0, TransientSoundVolume,, ResParams.default.rad_MeleeFire,, false);
    }
    //return;    
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = 0;
    bWaitForRelease = true;
    FireSound = none;
    FireRate = 0.1000000;
    sound_Hit = ResParams.default.sound_Melee_Ok;
    sound_Miss = ResParams.default.sound_Melee_Miss;
    SetFireAnim();
    //return;    
}

simulated function SetFireAnim()
{
    // End:0x2A
    if(Weapon.HasAnim('MeleeAttack'))
    {
        ExpressType = 0;
        FireAnim = 'MeleeAttack';        
    }
    else
    {
        // End:0x54
        if(Weapon.HasAnim('MAttack'))
        {
            ExpressType = 0;
            FireAnim = 'MAttack';            
        }
        else
        {
            ExpressType = 1;
        }
    }
    //return;    
}

defaultproperties
{
    frange=225.0000000
    fDegree_InsideAngle=90.0000000
    bApplyMeleeAttackDelay=true
    bWaitForRelease=true
    TransientSoundRadius=105.0000000
    FireAnim="MeleeAttack"
}