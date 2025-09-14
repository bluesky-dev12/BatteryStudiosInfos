class wAmmoSupplyObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() int MagazineSkillID;
var() array<int> WeaponGroups;
var() int SupplyCount;
var string ChargeSound;

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
            PlayerController(P.Controller).FmodClientPlaySound(ChargeSound);
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

    // End:0xCC
    if((Level.GRI.GameClass ~= "WMission.wAlienGameInfo") || Level.GRI.GameClass ~= Level.GetMatchMaker().GetDefenceGameInfo())
    {
        // End:0xCA
        if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none)
        {
            // End:0xC7
            if(P.PlayerReplicationInfo.Team.TeamIndex == 1)
            {
                return false;
            }            
        }
        else
        {
            return false;
        }
    }
    PC = P.Controller;
    // End:0x111
    if(PC != none)
    {
        bAmmoMagazine = PC.SkillBase.bAddManazine;
        SupplyAmmoCount = 0;
    }
    Inv = P.Inventory;
    J0x125:

    // End:0x260 [Loop If]
    if(Inv != none)
    {
        Weapon = wWeapon(Inv);
        i = 0;
        J0x147:

        // End:0x249 [Loop If]
        if(i < WeaponGroups.Length)
        {
            // End:0x23F
            if((Weapon != none) && Weapon.BaseParams.iInventoryGroup == WeaponGroups[i])
            {
                ammoCount = Weapon.GetCurMagazineAmmoCount();
                // End:0x1C9
                if(bAmmoMagazine)
                {
                    AddAmmoCount = Weapon.AmmoCharge[1] - ammoCount;                    
                }
                else
                {
                    AddAmmoCount = (Weapon.AmmoCharge[1] - wGun(Weapon).AmmoCharge_MaxLoaded) - ammoCount;
                }
                SupplyAmmoCount += AddAmmoCount;
                // End:0x23F
                if(AddAmmoCount > 0)
                {
                    // End:0x230
                    if(bAmmoMagazine == true)
                    {
                        Weapon.ServerAddMagazine();
                        // [Explicit Continue]
                        goto J0x23F;
                    }
                    Weapon.FillToDefaultAmmo();
                }
            }
            J0x23F:

            ++i;
            // [Loop Continue]
            goto J0x147;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x125;
    }
    // End:0x2A3
    if(SupplyAmmoCount != 0)
    {
        PlayerController(PC).ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_ImpSystem', Class'Engine.wMessage_Game_ImpSystem'.default.Code_DFSupplyAmmo, false, SupplyAmmoCount);
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
    ChargeSound="Warfare_Sound_Defense_Mode/Object/ammocharger"
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