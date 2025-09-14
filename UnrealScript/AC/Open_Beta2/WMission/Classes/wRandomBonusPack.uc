class wRandomBonusPack extends wSupplyPack;

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

function FillWeaponAmmo(Pawn P)
{
    local wWeapon W;

    P.AddWeaponMagazine();
    // End:0x48
    if(P.Controller.SkillBase.bAddManazine == true)
    {
        P.AddWeaponMagazine();        
    }
    else
    {
        W = P.GetWeaponByInvenGroup(1);
        // End:0x78
        if(W != none)
        {
            W.FillToInitialAmmo();
        }
        W = P.GetWeaponByInvenGroup(2);
        // End:0xA9
        if(W != none)
        {
            W.FillToInitialAmmo();
        }
    }
    //return;    
}

function bool CanPickupByPRI(wAlienPlayerReplicationInfo PRI)
{
    // End:0x22
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(PRI.eObjType))
    {
        return false;
    }
    return true;
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

        // End:0x4B9
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            PRI = wAlienPlayerReplicationInfo(P.PlayerReplicationInfo);
            // End:0x4B9
            if(CanPickupByPRI(PRI))
            {
                // End:0x4B9
                if(int(Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponCount) > 0)
                {
                    ItemID = Rand(int(Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponCount));
                    ItemID = Level.GameMgr.AlienGameParam.AlienSupplyPackWeaponArray[ItemID];
                    // End:0xE8
                    if(ItemID == -1)
                    {
                        FillWeaponAmmo(P);
                        byITemType = 1;                        
                    }
                    else
                    {
                        ItemInfo = Level.GameMgr.GetItemParam(ItemID);
                        // End:0x22B
                        if(Level.GameMgr.CheckMainWeaponItem(int(ItemInfo.eType)))
                        {
                            // End:0x16C
                            if(Class'Engine.wGameManager'.static.IsHeroType(PRI.eObjType))
                            {
                                FillWeaponAmmo(P);
                                byITemType = 1;                                
                            }
                            else
                            {
                                // End:0x1B9
                                if(int(P.Weapon.InventoryGroup) != 1)
                                {
                                    P.PendingWeapon = P.GetWeaponByInvenGroup(1);
                                    P.ChangedWeapon();
                                }
                                W = P.GetWeaponByInvenGroup(1);
                                // End:0x1E6
                                if(W != none)
                                {
                                    W.Destroy();
                                }
                                W = P.AddWeapon(EmptyBtrDouble(), ItemID, 0, false);
                                P.Weapon.ServerAddMagazine();
                                byITemType = 2;
                            }                            
                        }
                        else
                        {
                            W = P.AddWeapon(EmptyBtrDouble(), ItemID, 0, false);
                            OldW = P.GetWeaponByInvenGroup(int(W.InventoryGroup));
                            // End:0x2F9
                            if(W == OldW)
                            {
                                // End:0x2BD
                                if(int(W.InventoryGroup) == 5)
                                {
                                    PlayerController(P.Controller).ClientChangeSlot5(W);                                    
                                }
                                else
                                {
                                    // End:0x2F6
                                    if(int(W.InventoryGroup) == 6)
                                    {
                                        PlayerController(P.Controller).ClientChangeSlot6(W);
                                    }
                                }                                
                            }
                            else
                            {
                                AddWeaponByInvenGroup(PlayerController(P.Controller), OldW, W);
                                // End:0x358
                                if(int(W.InventoryGroup) == 5)
                                {
                                    PlayerController(P.Controller).ClientChangeSlot5(W);                                    
                                }
                                else
                                {
                                    // End:0x391
                                    if(int(W.InventoryGroup) == 6)
                                    {
                                        PlayerController(P.Controller).ClientChangeSlot6(W);
                                    }
                                }
                            }
                            byITemType = 3;
                        }
                    }
                    // End:0x3B5
                    if(respawnPoint != none)
                    {
                        respawnPoint.bSpawnDropItem = false;
                    }
                    AnnouncePickup(P);
                    DeleteSuppliesPositions();
                    Destroy();
                    // End:0x4B8
                    foreach DynamicActors(Class'WMission_Decompressed.wAlienController', ac)
                    {
                        // End:0x42C
                        if(ac != wAlienController(P.Controller))
                        {
                            ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxToEveryOne, true,,, PRI.PlayerName);
                            // End:0x4B7
                            continue;
                        }
                        switch(byITemType)
                        {
                            // End:0x45E
                            case 1:
                                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInFillAmmo, true);
                                // End:0x4B7
                                break;
                            // End:0x489
                            case 2:
                                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInWeapon, true);
                                // End:0x4B7
                                break;
                            // End:0x4B4
                            case 3:
                                ac.ReceiveLocalizedMessage2(Class'Engine.wMessage_Game_Alien', Class'Engine.wMessage_Game_Alien'.default.Code_AMTouchItemBoxInSkill, true);
                                // End:0x4B7
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }                        
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