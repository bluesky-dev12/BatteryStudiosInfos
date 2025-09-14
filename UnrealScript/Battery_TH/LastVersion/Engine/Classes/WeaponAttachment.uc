class WeaponAttachment extends InventoryAttachment
    native
    nativereplication
    exportstructs
    notplaceable;

struct stMultiBulletPerFire
{
    var Actor mHitActor[6];
    var Vector mHitNormal[6];
    var Actor.CollisionPartsType mCollisionPart[6];
    var Material mHitMaterial[6];
    var Vector mvEffLocation[6];
    var int mLastHitIdx;
};

var Actor HitActor[6];
var Vector HitNormal[6];
var Actor.CollisionPartsType CollisionPart[6];
var Material HitMaterial[6];
var Vector vEffLocation[6];
var stMultiBulletPerFire stMBPF[10];
var int RepLastHitIdx[10];
var Vector RepEffectLocation[60];
var int nIndexEffect[60];
var int nRepOffset;
var int nBulletCntPerFire;
var int LastHitIdx;
var byte FlashCount;
var byte FiringMode;
var byte SpawnHitCount;
var bool bAutoFire;
var float FiringSpeed;
var bool bMatchWeapons;
var Color BeaconColor;
var wWeapon Weapon;
var Class<Actor> SplashEffect;
var int iLocalWeaponID;
var int iLocalAddPartsID;
var int iRepWeaponID;
var int iRepAddPartsID;
var bool bMeleeKnifeOrButt;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var int iPainting_Item_ID;
var Emitter IdleEffect;
var bool bLoopAnim;
var name AnimName;
var float AnimRate;
var float AnimTweenTime;
var int AnimChannel;
var bool RepLoopAnim;
var name RepAnimName;
var float RepAnimRate;
var float RepAnimTweenTime;
var int RepAnimChannel;

replication
{
    // Pos:0x000
    reliable if((bNetDirty && (!bNetOwner || bDemoRecording) || bRepClientDemo) && int(Role) == int(ROLE_Authority))
        FiringMode, FlashCount, 
        bAutoFire;

    // Pos:0x03B
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        LastHitIdx, RepAnimChannel, 
        RepAnimName, RepAnimRate, 
        RepAnimTweenTime, RepEffectLocation, 
        RepLastHitIdx, RepLoopAnim, 
        SpawnHitCount, bMeleeKnifeOrButt, 
        iPainting_Item_ID, iRepAddPartsID, 
        iRepWeaponID, nBulletCntPerFire, 
        nIndexEffect;
}

simulated function ClearArray()
{
    nRepOffset = 0;
    nBulletCntPerFire = 0;
    //return;    
}

simulated function Destroyed()
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < 6)
    {
        HitMaterial[i] = none;
        HitActor[i] = none;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x3E:

    // End:0xA1 [Loop If]
    if(i < 10)
    {
        j = 0;
        J0x51:

        // End:0x97 [Loop If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            j++;
            // [Loop Continue]
            goto J0x51;
        }
        i++;
        // [Loop Continue]
        goto J0x3E;
    }
    // End:0xB8
    if(IdleEffect != none)
    {
        IdleEffect.Destroy();
    }
    super(Actor).Destroyed();
    //return;    
}

simulated function FakeUpdateTracer(Vector LastHitLocation)
{
    //return;    
}

simulated function FakeThirdPersonEffects(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    //return;    
}

simulated event ThirdPersonEffects()
{
    // End:0x4D
    if(Instigator != none)
    {
        // End:0x34
        if(int(FiringMode) == 1)
        {
            Instigator.PlayFiring(1.0000000, '1');            
        }
        else
        {
            Instigator.PlayFiring(1.0000000, '0');
        }
    }
    //return;    
}

simulated function CheckForSplash(int nIndex, int i)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation;

    // End:0xFA
    if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && SplashEffect != none) && !Instigator.PhysicsVolume.bWaterVolume)
    {
        bTraceWater = true;
        HitActor = Trace(HitLocation, HitNormal, stMBPF[nIndex].mvEffLocation[i], Instigator.Location, true);
        bTraceWater = false;
        // End:0xFA
        if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
        {
            Spawn(SplashEffect,,, HitLocation, rot(16384, 0, 0));
        }
    }
    //return;    
}

event UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial)
{
    //return;    
}

event UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < 6)
    {
        HitActor[i] = none;
        HitMaterial[i] = none;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    SpawnHitCount++;
    Log("UpdatePenetrateHit = " @ string(SpawnHitCount));
    i = 0;
    J0x67:

    // End:0xCA [Loop If]
    if(i < 10)
    {
        j = 0;
        J0x7A:

        // End:0xC0 [Loop If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            j++;
            // [Loop Continue]
            goto J0x7A;
        }
        i++;
        // [Loop Continue]
        goto J0x67;
    }
    //return;    
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;
    local int i, j;
    local Class<Emitter> idleEffectClass;
    local Actor AttachActor;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    // End:0x3B
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6B
    if(wRes == none)
    {
        return;
    }
    BaseParams = wBase;
    ResParams = wRes;
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, true));
    i = 0;
    J0xAC:

    // End:0xDC [Loop If]
    if(i < 6)
    {
        HitActor[i] = none;
        HitMaterial[i] = none;
        i++;
        // [Loop Continue]
        goto J0xAC;
    }
    i = 0;
    J0xE3:

    // End:0x146 [Loop If]
    if(i < 10)
    {
        j = 0;
        J0xF6:

        // End:0x13C [Loop If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            j++;
            // [Loop Continue]
            goto J0xF6;
        }
        i++;
        // [Loop Continue]
        goto J0xE3;
    }
    // End:0x183
    if(Instigator.IsFirstPerson())
    {
        idleEffectClass = ResParams.default.effect_Idle_1st;
        AttachActor = Instigator.Weapon;        
    }
    else
    {
        idleEffectClass = ResParams.default.effect_Idle_3rd;
        AttachActor = self;
    }
    // End:0x208
    if((idleEffectClass != none) && (IdleEffect == none) || IdleEffect.bDeleteMe)
    {
        IdleEffect = Spawn(idleEffectClass, AttachActor,, Location);
        // End:0x208
        if(IdleEffect != none)
        {
            AttachActor.AttachToBone(IdleEffect, GetBoneNameTip());
        }
    }
    //return;    
}

simulated function name GetBoneNameTip()
{
    //return;    
}

simulated function name GetBoneNameRotation()
{
    //return;    
}

simulated function Coords GetBoneTipLocation3rd()
{
    return GetBoneCoords(GetBoneNameTip());
    //return;    
}

simulated function Coords GetBoneTipLocation1st()
{
    return Weapon.GetBoneCoords(GetBoneNameTip());
    //return;    
}

simulated event PlayWeaponAnim(name Sequence, float Rate, optional float TweenTime, optional int Channel)
{
    // End:0x1F
    if(false == PlayAnim(Sequence, Rate, TweenTime, Channel))
    {
        return;
    }
    RepLoopAnim = false;
    RepAnimName = Sequence;
    RepAnimRate = Rate;
    RepAnimTweenTime = TweenTime;
    RepAnimChannel = Channel;
    //return;    
}

simulated event LoopWeaponAnim(name Sequence, float Rate, optional float TweenTime, optional int Channel)
{
    // End:0x1F
    if(false == LoopAnim(Sequence, Rate, TweenTime, Channel))
    {
        return;
    }
    RepLoopAnim = true;
    RepAnimName = Sequence;
    RepAnimRate = Rate;
    RepAnimTweenTime = TweenTime;
    RepAnimChannel = Channel;
    //return;    
}

defaultproperties
{
    FiringSpeed=1.0000000
    BeaconColor=(R=0,G=255,B=0,A=255)
    bActorShadows=true
    bReplicateInstigator=true
    NetUpdateFrequency=8.0000000
}