class wWeaponPickup_DOA extends wWeaponPickup_Location;

var int SelWeaponIdx;
var int WeaponList[5];
var int WeaponListNum;
var() int WeaponGroupID;
var string strWeaponName;

simulated event PreBeginPlay()
{
    // End:0x2F
    if(Level.GetMatchMaker().kGame_GameMode != Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
    {
        Destroy();
    }
    SetRotation(rot(0, 0, 16384));
    super.PreBeginPlay();
    //return;    
}

function Reset()
{
    super.Reset();
    SwapRandomWeapon();
    wLoadOut(iRepWeaponID, iRepAddPartsID);
    // End:0x7C
    if(int(Role) == int(ROLE_Authority))
    {
        AmmoAmount[0] = BaseParams.iAmmo_Initial;
        AmmoAmount[1] = BaseParams.iAmmo_Initial;
        AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    }
    //return;    
}

function SwapRandomWeapon()
{
    local wWeaponCustomInfoParam wcip;

    SelWeaponIdx = Rand(WeaponListNum);
    iRepWeaponID = WeaponList[SelWeaponIdx];
    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iRepWeaponID);
    iRepAddPartsID = ((wcip.iDefaultSightUniID | wcip.iDefaultSilencerUniID) | wcip.iDefaultBarrelUniID) | wcip.iDefaultGunstockUniID;
    iPainting_Item_ID = wcip.iDefaultPaintingID;
    //return;    
}

function GetWeaponList()
{
    local int i;
    local bool bCanUseWeapon;

    bCanUseWeapon = false;
    i = 0;
    J0x0F:

    // End:0x15C [Loop If]
    if(i < Level.GameMgr.ModeDOAParams.Length)
    {
        // End:0x152
        if(Level.GameMgr.ModeDOAParams[i].GroupID == WeaponGroupID)
        {
            bCanUseWeapon = true;
            WeaponList[0] = Level.GameMgr.ModeDOAParams[i].WeaponID0;
            WeaponList[1] = Level.GameMgr.ModeDOAParams[i].WeaponID1;
            WeaponList[2] = Level.GameMgr.ModeDOAParams[i].WeaponID2;
            WeaponList[3] = Level.GameMgr.ModeDOAParams[i].WeaponID3;
            WeaponList[4] = Level.GameMgr.ModeDOAParams[i].WeaponID4;
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0x18C
    if((!bCanUseWeapon || WeaponList[0] == 0) || WeaponList[0] == 99999)
    {
        Destroy();
    }
    i = 0;
    J0x193:

    // End:0x1DB [Loop If]
    if(i < 5)
    {
        // End:0x1CA
        if((WeaponList[i] == 0) || WeaponList[i] == 99999)
        {
            // [Explicit Break]
            goto J0x1DB;
        }
        WeaponListNum++;
        i++;
        // [Loop Continue]
        goto J0x193;
    }
    J0x1DB:

    //return;    
}

simulated event PostNetBeginPlay()
{
    GetWeaponList();
    SwapRandomWeapon();
    super.PostNetBeginPlay();
    strWeaponName = BaseParams.strName;
    //return;    
}

state Sleeping
{
    ignores EndState, BeginState;

    function BeginState()
    {
        SetWeaponStay();
        super.BeginState();
        //return;        
    }

    function EndState()
    {
        super.EndState();
        //return;        
    }
respawn:

    stop;                
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;
        local wWeapon weaponDOA;
        local Inventory Inv;

        // End:0xEB
        if(ValidTouch(Other))
        {
            P = AddTouchingPawn(Pawn(Other));
            P.kPendingWPick = self;
            J0x34:

            // End:0xC2 [Loop If]
            if(true)
            {
                // End:0x5A
                if(Inv == none)
                {
                    Inv = P.Inventory;                    
                }
                else
                {
                    Inv = Inv.Inventory;
                }
                // End:0x7C
                if(Inv == none)
                {
                    // [Explicit Break]
                    goto J0xC2;
                }
                weaponDOA = wWeapon(Inv);
                // End:0x9A
                if(weaponDOA == none)
                {                    
                }
                else
                {
                    // End:0xBF
                    if(int(weaponDOA.InventoryGroup) == BaseParams.iInventoryGroup)
                    {
                        return;
                    }
                }
                // [Loop Continue]
                goto J0x34;
            }
            J0xC2:

            P.PlayerReplicationInfo.bPickupWeaponDOA = true;
            P.ClientPickupWeapon();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    PickupMessage="You got the Weapon"
    PickupForce="Weapon for DOA"
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Artil'
}