/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponPickup_DOA.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:5
 *	States:2
 *
 *******************************************************************************/
class wWeaponPickup_DOA extends wWeaponPickup_Location;

var int SelWeaponIdx;
var int WeaponList[5];
var int WeaponListNum;
var() int WeaponGroupID;
var string strWeaponName;

simulated event PreBeginPlay()
{
    // End:0x2f
    if(Level.GetMatchMaker().kGame_GameMode != class'wGameSettings'.static.GetModeIndex_DOA())
    {
        Destroy();
    }
    SetRotation(rot(0, 0, 16384));
    super.PreBeginPlay();
}

function Reset()
{
    super.Reset();
    SwapRandomWeapon();
    wLoadOut(iRepWeaponID, iRepAddPartsID);
    // End:0x7c
    if(Role == 4)
    {
        AmmoAmount[0] = BaseParams.iAmmo_Initial;
        AmmoAmount[1] = BaseParams.iAmmo_Initial;
        AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    }
}

function SwapRandomWeapon()
{
    local wWeaponCustomInfoParam wcip;

    SelWeaponIdx = Rand(WeaponListNum);
    iRepWeaponID = WeaponList[SelWeaponIdx];
    wcip = Level.GameMgr.GetWeaponCustomInfoParam(iRepWeaponID);
    iRepAddPartsID = wcip.iDefaultSightUniID | wcip.iDefaultSilencerUniID | wcip.iDefaultBarrelUniID | wcip.iDefaultGunstockUniID;
    iPainting_Item_ID = wcip.iDefaultPaintingID;
}

function GetWeaponList()
{
    local int i;
    local bool bCanUseWeapon;

    bCanUseWeapon = false;
    i = 0;
    J0x0f:
    // End:0x15c [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    // End:0x18c
    if(!bCanUseWeapon || WeaponList[0] == 0 || WeaponList[0] == 99999)
    {
        Destroy();
    }
    i = 0;
    J0x193:
    // End:0x1db [While If]
    if(i < 5)
    {
        // End:0x1ca
        if(WeaponList[i] == 0 || WeaponList[i] == 99999)
        {
        }
        // End:0x1db
        else
        {
            ++ WeaponListNum;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x193;
        }
    }
}

simulated event PostNetBeginPlay()
{
    GetWeaponList();
    SwapRandomWeapon();
    super.PostNetBeginPlay();
    strWeaponName = BaseParams.strName;
}

state Sleeping
{
    function BeginState()
    {
        SetWeaponStay();
        super.BeginState();
    }

    function EndState()
    {
        super.EndState();
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

        // End:0xeb
        if(ValidTouch(Other))
        {
            P = AddTouchingPawn(Pawn(Other));
            P.kPendingWPick = self;
            J0x34:
            // End:0xc2 [While If]
            if(true)
            {
                // End:0x5a
                if(Inv == none)
                {
                    Inv = P.Inventory;
                }
                // End:0x6e
                else
                {
                    Inv = Inv.Inventory;
                }
                // End:0x7c
                if(Inv == none)
                {
                }
                // End:0xc2
                else
                {
                    weaponDOA = wWeapon(Inv);
                    // End:0x9a
                    if(weaponDOA == none)
                    {
                    }
                    // End:0xbf
                    else
                    {
                        // End:0xbf
                        if(weaponDOA.InventoryGroup == BaseParams.iInventoryGroup)
                        {
                            return;
                        }
                    }
                    // This is an implied JumpToken; Continue!
                    goto J0x34;
                }
            }
            P.PlayerReplicationInfo.bPickupWeaponDOA = true;
            P.ClientPickupWeapon();
        }
    }

}

defaultproperties
{
    PickupMessage="You got the Weapon"
    PickupForce="Weapon for DOA"
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Artil'
}