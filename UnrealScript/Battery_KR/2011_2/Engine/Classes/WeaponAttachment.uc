class WeaponAttachment extends InventoryAttachment
    native
    nativereplication
    notplaceable;

var byte FlashCount;
var byte FiringMode;
var byte SpawnHitCount;
var bool bAutoFire;
var float FiringSpeed;
var Vector mHitLocation;
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

replication
{
    // Pos:0x000
    reliable if((bNetDirty && (!bNetOwner || bDemoRecording) || bRepClientDemo) && int(Role) == int(ROLE_Authority))
        FiringMode, FlashCount, 
        bAutoFire;

    // Pos:0x03B
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        SpawnHitCount, bMeleeKnifeOrButt, 
        iPainting_Item_ID, iRepAddPartsID, 
        iRepWeaponID, mHitLocation;
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

simulated function CheckForSplash()
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation;

    // End:0xE9
    if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && SplashEffect != none) && !Instigator.PhysicsVolume.bWaterVolume)
    {
        bTraceWater = true;
        HitActor = Trace(HitLocation, HitNormal, mHitLocation, Instigator.Location, true);
        bTraceWater = false;
        // End:0xE9
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

simulated event wLoadOut(int iID, int iAddPartsID)
{
    local wWeaponManager wMani;
    local wWeaponBaseParams wBase;
    local Class<wWeaponRes_Base> wRes;

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

defaultproperties
{
    FiringSpeed=1.0000000
    BeaconColor=(R=0,G=255,B=0,A=255)
    bActorShadows=true
    bReplicateInstigator=true
    NetUpdateFrequency=8.0000000
}