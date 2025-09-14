/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WeaponAttachment.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:29
 *	Functions:13
 *
 *******************************************************************************/
class WeaponAttachment extends InventoryAttachment
    dependson(InventoryAttachment)
    dependson(wWeaponManager)
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
var class<Actor> SplashEffect;
var int iLocalWeaponID;
var int iLocalAddPartsID;
var int iRepWeaponID;
var int iRepAddPartsID;
var bool bMeleeKnifeOrButt;
var wWeaponBaseParams BaseParams;
var class<wWeaponRes_Base> ResParams;
var int iPainting_Item_ID;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && !bNetOwner || bDemoRecording || bRepClientDemo && Role == 4)
        FlashCount, FiringMode,
        bAutoFire;

    // Pos:0x3b
    reliable if(bNetDirty && Role == 4)
        RepLastHitIdx, RepEffectLocation,
        nIndexEffect, nBulletCntPerFire,
        LastHitIdx, SpawnHitCount,
        iRepWeaponID, iRepAddPartsID,
        bMeleeKnifeOrButt, iPainting_Item_ID;

}

simulated function ClearArray()
{
    nRepOffset = 0;
    nBulletCntPerFire = 0;
}

simulated function Destroyed()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < 6)
    {
        HitMaterial[i] = none;
        HitActor[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x3e:
    // End:0xa1 [While If]
    if(i < 10)
    {
        j = 0;
        J0x51:
        // End:0x97 [While If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x51;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    super(Actor).Destroyed();
}

simulated function FakeUpdateTracer(Vector LastHitLocation);
simulated function FakeThirdPersonEffects(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial);
simulated event ThirdPersonEffects()
{
    // End:0x4d
    if(Instigator != none)
    {
        // End:0x34
        if(FiringMode == 1)
        {
            Instigator.PlayFiring(1.0, '1');
        }
        // End:0x4d
        else
        {
            Instigator.PlayFiring(1.0, '0');
        }
    }
}

simulated function CheckForSplash(int nIndex, int i)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation;

    // End:0xfa
    if(!Level.bDropDetail && Level.DetailMode != 0 && SplashEffect != none && !Instigator.PhysicsVolume.bWaterVolume)
    {
        bTraceWater = true;
        HitActor = Trace(HitLocation, HitNormal, stMBPF[nIndex].mvEffLocation[i], Instigator.Location, true);
        bTraceWater = false;
        // End:0xfa
        if(FluidSurfaceInfo(HitActor) != none || PhysicsVolume(HitActor) != none && PhysicsVolume(HitActor).bWaterVolume)
        {
            Spawn(SplashEffect,,, HitLocation, rot(16384, 0, 0));
        }
    }
}

event UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Material HitMaterial);
event UpdatePenetrateHit(Actor mHitActor[6], Vector mHitLocation[6], Vector mHitNormal[6], Material mHitMaterial[6], int mLastHitIdx)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < 6)
    {
        HitActor[i] = none;
        HitMaterial[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    ++ SpawnHitCount;
    Log("UpdatePenetrateHit = " @ string(SpawnHitCount));
    i = 0;
    J0x67:
    // End:0xca [While If]
    if(i < 10)
    {
        j = 0;
        J0x7a:
        // End:0xc0 [While If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x7a;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local class<wWeaponRes_Base> wRes;
    local int i, j;

    wMani = Level.WeaponMgr;
    wBase = wMani.GetBaseParam(iID);
    // End:0x3b
    if(wBase == none)
    {
        return;
    }
    wRes = wMani.GetRes(wBase.szClass_Resource);
    // End:0x6b
    if(wRes == none)
    {
        return;
    }
    BaseParams = wBase;
    ResParams = wRes;
    LinkMesh(Level.GameMgr.GetItemResourceMesh(iID, true));
    i = 0;
    J0xac:
    // End:0xdc [While If]
    if(i < 6)
    {
        HitActor[i] = none;
        HitMaterial[i] = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xac;
    }
    i = 0;
    J0xe3:
    // End:0x146 [While If]
    if(i < 10)
    {
        j = 0;
        J0xf6:
        // End:0x13c [While If]
        if(j < 6)
        {
            stMBPF[i].mHitActor[j] = none;
            stMBPF[i].mHitMaterial[j] = none;
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xf6;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe3;
    }
}

simulated function name GetBoneNameTip();
simulated function name GetBoneNameRotation();
simulated function Coords GetBoneTipLocation3rd()
{
    return GetBoneCoords(GetBoneNameTip());
}

simulated function Coords GetBoneTipLocation1st()
{
    return Weapon.GetBoneCoords(GetBoneNameTip());
}

defaultproperties
{
    FiringSpeed=1.0
    BeaconColor=(R=0,G=255,B=0,A=255)
    bActorShadows=true
    bReplicateInstigator=true
    NetUpdateFrequency=8.0
}