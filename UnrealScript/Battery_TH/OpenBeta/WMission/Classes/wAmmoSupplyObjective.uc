class wAmmoSupplyObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() int SkillID;
var() array<int> WeaponGroups;
var() int SupplyCount;
var int nSound;

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
    // End:0x3D
    if(P != none)
    {
        // End:0x3D
        if(ChargeAmmo(P))
        {
            --SupplyCount;
        }
    }
    //return;    
}

function bool ChargeAmmo(wPawn P)
{
    local int i;
    local bool bAmmoMagazine, bResult;
    local wItemBaseParam ItemParam;
    local wMatchUserInfo UserInfo;
    local Inventory Inv;
    local wWeapon Weapon;

    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(P.PlayerReplicationInfo.PlayerName);
    i = 0;
    J0x3D:

    // End:0x110 [Loop If]
    if(i < UserInfo.EquippedItems.Length)
    {
        // End:0x106
        if(UserInfo.EquippedItems[i].SlotPosition == int(P.BTNetEnums.13))
        {
            ItemParam = Level.GameMgr.GetItemParam(UserInfo.EquippedItems[i].ItemID);
            // End:0x106
            if((ItemParam.strAddOption[0] == "skill") && int(ItemParam.strOptionValue[0]) == SkillID)
            {
                bAmmoMagazine = true;
                // [Explicit Break]
                goto J0x110;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    J0x110:

    Inv = P.Inventory;
    J0x124:

    // End:0x1E0 [Loop If]
    if(Inv != none)
    {
        Weapon = wWeapon(Inv);
        i = 0;
        J0x146:

        // End:0x1C9 [Loop If]
        if(i < WeaponGroups.Length)
        {
            // End:0x1BF
            if((Weapon != none) && Weapon.BaseParams.iInventoryGroup == WeaponGroups[i])
            {
                // End:0x1A8
                if(bAmmoMagazine == true)
                {
                    Weapon.ServerAddMagazine();                    
                }
                else
                {
                    Weapon.FillToDefaultAmmo();
                }
                bResult = true;
            }
            ++i;
            // [Loop Continue]
            goto J0x146;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x124;
    }
    return bResult;
    //return;    
}

defaultproperties
{
    SkillID=40011
    WeaponGroups[0]=1
    WeaponGroups[1]=2
    SupplyCount=-1
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