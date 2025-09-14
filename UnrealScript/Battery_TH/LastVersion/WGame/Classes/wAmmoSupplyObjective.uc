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
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0xBB
    if((MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Alien()) || MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        // End:0xB9
        if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none)
        {
            // End:0xB6
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
    // End:0x100
    if(PC != none)
    {
        bAmmoMagazine = PC.SkillBase.bAddManazine;
        SupplyAmmoCount = 0;
    }
    Inv = P.Inventory;
    J0x114:

    // End:0x26C [Loop If]
    if(Inv != none)
    {
        Weapon = wWeapon(Inv);
        // End:0x159
        if((Weapon == none) || false == (CheckFillAmmoToWeapon(Weapon.WeaponType)))
        {            
        }
        else
        {
            i = 0;
            J0x160:

            // End:0x255 [Loop If]
            if(i < WeaponGroups.Length)
            {
                // End:0x24B
                if(Weapon.BaseParams.iInventoryGroup == WeaponGroups[i])
                {
                    ammoCount = Weapon.GetCurMagazineAmmoCount();
                    // End:0x1D5
                    if(bAmmoMagazine)
                    {
                        AddAmmoCount = Weapon.AmmoCharge[1] - ammoCount;                        
                    }
                    else
                    {
                        AddAmmoCount = (Weapon.AmmoCharge[1] - wGun(Weapon).AmmoCharge_MaxLoaded) - ammoCount;
                    }
                    SupplyAmmoCount += AddAmmoCount;
                    // End:0x24B
                    if(AddAmmoCount > 0)
                    {
                        // End:0x23C
                        if(bAmmoMagazine == true)
                        {
                            Weapon.ServerAddMagazine();
                            // [Explicit Continue]
                            goto J0x24B;
                        }
                        Weapon.FillToDefaultAmmo();
                    }
                }
                J0x24B:

                ++i;
                // [Loop Continue]
                goto J0x160;
            }
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x114;
    }
    // End:0x2AF
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

function bool CheckFillAmmoToWeapon(Actor.eWeaponType eType)
{
    // End:0x6C
    if((((((int(eType) == int(1)) || int(eType) == int(2)) || int(eType) == int(3)) || int(eType) == int(4)) || int(eType) == int(6)) || int(eType) == int(9))
    {
        return true;
    }
    return false;
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