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
    // End:0x5B
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;        
    }
    else
    {
        bActive = true;
    }
    //return;    
}

event Touch(Actor Other)
{
    local wPawn P;

    // End:0x0D
    if(SupplyCount == 0)
    {
        return;
    }
    P = wPawn(Other);
    // End:0x5F
    if(P != none)
    {
        // End:0x5F
        if(ChargeAmmo(P))
        {
            --SupplyCount;
            PlayerController(P.Controller).ClientPlaySound(ChargeSound);
        }
    }
    //return;    
}

function bool ChargeAmmo(wPawn P)
{
    local int i, ammoCount, SupplyAmmoCount, AddAmmoCount;
    local bool bAmmoMagazine, bResult;
    local Inventory Inv;
    local wWeapon Weapon;
    local Controller PC;

    PC = P.Controller;
    // End:0x8D
    if(PC != none)
    {
        i = 0;
        J0x26:

        // End:0x8D [Loop If]
        if(i < PC.SkillBase.Skills.Length)
        {
            // End:0x83
            if(PC.SkillBase.Skills[i].SkillID == MagazineSkillID)
            {
                bAmmoMagazine = true;
                // [Explicit Break]
                goto J0x8D;
            }
            ++i;
            // [Loop Continue]
            goto J0x26;
        }
    }
    J0x8D:

    SupplyAmmoCount = 0;
    Inv = P.Inventory;
    J0xA8:

    // End:0x1BA [Loop If]
    if(Inv != none)
    {
        Weapon = wWeapon(Inv);
        i = 0;
        J0xCA:

        // End:0x1A3 [Loop If]
        if(i < WeaponGroups.Length)
        {
            // End:0x199
            if((Weapon != none) && Weapon.BaseParams.iInventoryGroup == WeaponGroups[i])
            {
                ammoCount = Weapon.GetCurMagazineAmmoCount();
                AddAmmoCount = (Weapon.AmmoCharge[1] - wGun(Weapon).AmmoCharge_MaxLoaded) - ammoCount;
                SupplyAmmoCount += AddAmmoCount;
                // End:0x199
                if(AddAmmoCount != 0)
                {
                    // End:0x18A
                    if(bAmmoMagazine == true)
                    {
                        Weapon.ServerAddMagazine();
                        // [Explicit Continue]
                        goto J0x199;
                    }
                    Weapon.FillToDefaultAmmo();
                }
            }
            J0x199:

            ++i;
            // [Loop Continue]
            goto J0xCA;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0xA8;
    }
    // End:0x1FC
    if(SupplyAmmoCount != 0)
    {
        PlayerController(PC).ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DFSupplyAmmo, SupplyAmmoCount);
        bResult = true;        
    }
    else
    {
        bResult = false;
    }
    return bResult;
    //return;    
}

defaultproperties
{
    MagazineSkillID=40011
    WeaponGroups[0]=1
    WeaponGroups[1]=2
    SupplyCount=-1
    ChargeSound=Sound'Warfare_Sound_Defense_Mode.Object.ammocharger'
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ApplyGameInfo="wMission.wDefenceGameInfo"
    bNotBased=true
    bStatic=false
    bOnlyAffectPawns=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bCollideWhenPlacing=false
    CollisionRadius=180.0000000
    bCollideActors=true
}