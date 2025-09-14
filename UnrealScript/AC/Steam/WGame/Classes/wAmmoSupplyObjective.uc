/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAmmoSupplyObjective.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class wAmmoSupplyObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() int MagazineSkillID;
var() array<int> WeaponGroups;
var() int SupplyCount;
var Sound ChargeSound;

function PostBeginPlay()
{
    local wMatchMaker rMM;

    super.PostBeginPlay();
    rMM = Level.GetMatchMaker();
    // End:0x5b
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;
    }
    // End:0x63
    else
    {
        bActive = true;
    }
}

event Touch(Actor Other)
{
    local wPawn P;

    // End:0x0d
    if(SupplyCount == 0)
    {
        return;
    }
    P = wPawn(Other);
    // End:0x5f
    if(P != none)
    {
        // End:0x5f
        if(ChargeAmmo(P))
        {
            -- SupplyCount;
            PlayerController(P.Controller).ClientPlaySound(ChargeSound);
        }
    }
}

function bool ChargeAmmo(wPawn P)
{
    local int i, ammoCount, SupplyAmmoCount, AddAmmoCount;
    local bool bAmmoMagazine, bResult;
    local Inventory Inv;
    local wWeapon Weapon;
    local Controller PC;

    PC = P.Controller;
    // End:0x8d
    if(PC != none)
    {
        i = 0;
        J0x26:
        // End:0x8d [While If]
        if(i < PC.SkillBase.Skills.Length)
        {
            // End:0x83
            if(PC.SkillBase.Skills[i].SkillID == MagazineSkillID)
            {
                bAmmoMagazine = true;
            }
            // End:0x8d
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x26;
            }
        }
    }
    SupplyAmmoCount = 0;
    Inv = P.Inventory;
    J0xa8:
    // End:0x1ba [While If]
    if(Inv != none)
    {
        Weapon = wWeapon(Inv);
        i = 0;
        J0xca:
        // End:0x1a3 [While If]
        if(i < WeaponGroups.Length)
        {
            // End:0x199
            if(Weapon != none && Weapon.BaseParams.iInventoryGroup == WeaponGroups[i])
            {
                ammoCount = Weapon.GetCurMagazineAmmoCount();
                AddAmmoCount = Weapon.AmmoCharge[1] - wGun(Weapon).AmmoCharge_MaxLoaded - ammoCount;
                SupplyAmmoCount += AddAmmoCount;
                // End:0x199
                if(AddAmmoCount != 0)
                {
                    // End:0x18a
                    if(bAmmoMagazine == true)
                    {
                        Weapon.ServerAddMagazine();
                    }
                    // End:0x199
                    else
                    {
                        Weapon.FillToDefaultAmmo();
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xca;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0xa8;
    }
    // End:0x1fc
    if(SupplyAmmoCount != 0)
    {
        PlayerController(PC).ReceiveLocalizedMessage2(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_DFSupplyAmmo, SupplyAmmoCount);
        bResult = true;
    }
    // End:0x204
    else
    {
        bResult = false;
    }
    return bResult;
}

defaultproperties
{
    MagazineSkillID=40011
    WeaponGroups=// Object reference not set to an instance of an object.
    
    SupplyCount=-1
    ChargeSound=Sound'Warfare_Sound_Defense_Mode.Object.ammocharger'
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ApplyGameInfo="wMission.wDefenceGameInfo"
    bNotBased=true
    bStatic=true
    bOnlyAffectPawns=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bCollideWhenPlacing=true
    CollisionRadius=180.0
    bCollideActors=true
}