class wRandomBonusPack extends wSupplyPack;

enum E_RAND_SUPPLY_TYPE
{
    ITS_AMMO,                       // 0
    ITS_WEAPON,                     // 1
    ITS_SKILL                       // 2
};

var wSupplyRespawnPoint respawnPoint;
var string DropSound;

simulated event PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    PC = Level.GetLocalPlayerController();
    // End:0x3F
    if(PC != none)
    {
        PC.myHUD.CacheSuppliesPositions(self);
    }
    Level.SupplyList_BonusPack[Level.SupplyList_BonusPack.Length] = self;
    //return;    
}

function DeleteSuppliesPositions()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0x61 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x4A
        if(PC != none)
        {
            PC.ClientDeleteSuppliesPositions(self);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function Reset()
{
    DeleteSuppliesPositions();
    Destroy();
    //return;    
}

function AddWeaponByInvenGroup(PlayerController PC, wWeapon DestWeapon, wWeapon AddWeapon)
{
    local Inventory wPrevDestWeapon, wPrevAddWeapon;

    wPrevDestWeapon = PC.Pawn.Inventory;
    J0x1D:

    // End:0x5F [Loop If]
    if(wPrevDestWeapon != none)
    {
        // End:0x48
        if(wWeapon(wPrevDestWeapon.Inventory) == DestWeapon)
        {
            // [Explicit Break]
            goto J0x5F;
        }
        wPrevDestWeapon = wPrevDestWeapon.Inventory;
        // [Loop Continue]
        goto J0x1D;
    }
    J0x5F:

    wPrevAddWeapon = PC.Pawn.Inventory;
    J0x7C:

    // End:0xBE [Loop If]
    if(wPrevAddWeapon != none)
    {
        // End:0xA7
        if(wWeapon(wPrevAddWeapon.Inventory) == AddWeapon)
        {
            // [Explicit Break]
            goto J0xBE;
        }
        wPrevAddWeapon = wPrevAddWeapon.Inventory;
        // [Loop Continue]
        goto J0x7C;
    }
    J0xBE:

    AddWeapon.Inventory = DestWeapon;
    wPrevDestWeapon.Inventory = AddWeapon;
    wPrevAddWeapon.Inventory = none;
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local wWeapon W, OldW;
        local Pawn P;
        local wAlienPlayerReplicationInfo PRI;
        local int ItemID;
        local wItemBaseParam ItemInfo;
        local wAlienController ac;
        local byte byITemType;

        // End:0x523
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
            // End:0x523
            if(int(Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponCount) > 0)
            {
                // End:0xCF
                if(Class'Engine.wGameManager'.static.IsSuperHeroType(PRI.eObjType))
                {
                    ItemID = Rand(wAlienGameInfo(Level.Game).SupplyRandomBonusPack_SkillIDs.Length);
                    ItemID = wAlienGameInfo(Level.Game).SupplyRandomBonusPack_SkillIDs[ItemID];                    
                }
                else
                {
                    ItemID = Rand(int(Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponCount));
                    ItemID = Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponArray[ItemID];
                }
                // End:0x14E
                if(ItemID == -1)
                {
                    P.AddWeaponFillAmmoAndMagazine();
                    byITemType = 0;                    
                }
                else
                {
                    ItemInfo = Level.GameMgr.GetItemParam(ItemID);
                    // End:0x295
                    if(Level.GameMgr.CheckMainWeaponItem(int(ItemInfo.eType)))
                    {
                        // End:0x1D6
                        if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
                        {
                            P.AddWeaponFillAmmoAndMagazine();
                            byITemType = 0;                            
                        }
                        else
                        {
                            // End:0x223
                            if(int(P.Weapon.InventoryGroup) != 1)
                            {
                                P.PendingWeapon = P.GetWeaponByInvenGroup(1);
                                P.ChangedWeapon();
                            }
                            W = P.GetWeaponByInvenGroup(1);
                            // End:0x250
                            if(W != none)
                            {
                                W.Destroy();
                            }
                            W = P.AddWeapon(EmptyBtrDouble(), ItemID, 0, false);
                            P.Weapon.ServerAddMagazine();
                            byITemType = 1;
                        }                        
                    }
                    else
                    {
                        W = P.AddWeapon(EmptyBtrDouble(), ItemID, 0, false);
                        OldW = P.GetWeaponByInvenGroup(int(W.InventoryGroup));
                        // End:0x363
                        if(W == OldW)
                        {
                            // End:0x327
                            if(int(W.InventoryGroup) == 5)
                            {
                                PlayerController(P.Controller).ClientChangeSlot5(W);                                
                            }
                            else
                            {
                                // End:0x360
                                if(int(W.InventoryGroup) == 6)
                                {
                                    PlayerController(P.Controller).ClientChangeSlot6(W);
                                }
                            }                            
                        }
                        else
                        {
                            AddWeaponByInvenGroup(PlayerController(P.Controller), OldW, W);
                            // End:0x3C2
                            if(int(W.InventoryGroup) == 5)
                            {
                                PlayerController(P.Controller).ClientChangeSlot5(W);                                
                            }
                            else
                            {
                                // End:0x3FB
                                if(int(W.InventoryGroup) == 6)
                                {
                                    PlayerController(P.Controller).ClientChangeSlot6(W);
                                }
                            }
                        }
                        byITemType = 2;
                    }
                }
                // End:0x41F
                if(respawnPoint != none)
                {
                    respawnPoint.bSpawnDropItem = false;
                }
                AnnouncePickup(P);
                DeleteSuppliesPositions();
                Destroy();
                // End:0x522
                foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
                {
                    // End:0x496
                    if(ac != wAlienController(P.Controller))
                    {
                        ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxToEveryOne, true,,, PRI.PlayerName);
                        // End:0x521
                        continue;
                    }
                    switch(byITemType)
                    {
                        // End:0x4C8
                        case 0:
                            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInFillAmmo, true);
                            // End:0x521
                            break;
                        // End:0x4F3
                        case 1:
                            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInWeapon, true);
                            // End:0x521
                            break;
                        // End:0x51E
                        case 2:
                            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInSkill, true);
                            // End:0x521
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }                
            }
        }
        //return;        
    }

    function DestroyedByTime()
    {
        DeleteSuppliesPositions();
        Destroy();
        //return;        
    }
    stop;    
}

defaultproperties
{
    DropSound="Warfare_Sound_Alien_Mode/UI/UI_alien_dropitem_01"
    bAmbientGlow=true
    PickupMessage="You got RandomBonus Pack"
    PickupSound="Warfare_Sound_Alien_Mode/UI/UI_alien_dropitem_get_01"
    CullDistance=6500.0000000
    Physics=5
    Mesh=SkeletalMesh'WP_ETC_itembox.ItemBox_Bonus'
    Style=9
    RotationRate=(Pitch=0,Yaw=20000,Roll=0)
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}