class BTStoreFillProcess extends Object;

//var delegate<CheckItemCommon> __CheckItemCommon__Delegate;
//var delegate<CreatePointItem> __CreatePointItem__Delegate;
//var delegate<CreateGP20Item> __CreateGP20Item__Delegate;
//var delegate<CreateWZCashItem> __CreateWZCashItem__Delegate;
//var delegate<AddPointItem> __AddPointItem__Delegate;
//var delegate<AddGP20Item> __AddGP20Item__Delegate;
//var delegate<AddWZCashItem> __AddWZCashItem__Delegate;

delegate bool CheckItemCommon(wGameManager GameMgr, wItemBoxHK ItemInfo)
{
    //return;    
}

delegate Object CreatePointItem(int ItemID, wItemBoxHK ItemInfo)
{
    //return;    
}

delegate Object CreateGP20Item(wItemBoxHK ItemInfo, wGP20Product gp20Product)
{
    //return;    
}

delegate Object CreateWZCashItem(wItemBoxHK ItemInfo, WebzenShopPackage WZShopPackage)
{
    //return;    
}

delegate AddPointItem(wGameManager GameMgr, Object addedObject)
{
    //return;    
}

delegate AddGP20Item(wGameManager GameMgr, Object addedObject)
{
    //return;    
}

delegate AddWZCashItem(wGameManager GameMgr, Object addedObject)
{
    //return;    
}

function Object DefaultCreatePointItem(wGameManager GameMgr, wMatchMaker MM, int ItemID, wItemBoxHK ItemInfo)
{
    local BTROItemBoxHK ro;

    ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    ro.Init();
    ro.ItemInfo = ItemInfo;
    // End:0x88
    if(ro.ItemInfo == none)
    {
        ro.ItemInfo = new Class'Engine.wItemBoxHK';
        ro.ItemInfo.ItemName = "ItemID=" $ string(ItemID);
    }
    ro.SetGameManager(GameMgr);
    ro.SetMatchMaker(MM);
    ro.ChangeState(6);
    // End:0xEE
    if(GameMgr.FindFirstInstanceItemByItemID(ItemID) != none)
    {
        ro.RibbonState = 1;        
    }
    else
    {
        // End:0x120
        if(ro.ItemInfo.AdType == 2)
        {
            ro.RibbonState = 3;            
        }
        else
        {
            // End:0x152
            if(ro.ItemInfo.AdType == 3)
            {
                ro.RibbonState = 2;                
            }
            else
            {
                // End:0x181
                if(ro.ItemInfo.AdType == 4)
                {
                    ro.RibbonState = 4;
                }
            }
        }
    }
    return ro;
    //return;    
}

function Object DefaultCreateGP20Item(wGameManager GameMgr, wMatchMaker MM, wItemBoxHK ItemInfo, wGP20Product gp20Product)
{
    local BTROItemBoxHK ro;

    ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    ro.Init();
    ro.ItemInfo = ItemInfo;
    ro.ItemInfo.PurchaseType = 1;
    ro.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    ro.instanceInfo.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    ro.instanceInfo.cashItemInfo.SetCashItemInfoGP20(ro.ItemInfo, gp20Product, ro.instanceInfo.cashItemInfo.0);
    // End:0xFB
    if(gp20Product.IsDiscount(0))
    {
        ro.RibbonState = 6;        
    }
    else
    {
        // End:0x12D
        if(gp20Product.SaleMasterFlag == gp20Product.16)
        {
            ro.RibbonState = 3;            
        }
        else
        {
            // End:0x15E
            if(gp20Product.SaleMasterFlag == gp20Product.1)
            {
                ro.RibbonState = 2;                
            }
            else
            {
                // End:0x18D
                if(gp20Product.SaleMasterFlag == gp20Product.8)
                {
                    ro.RibbonState = 4;
                }
            }
        }
    }
    ro.SetGameManager(GameMgr);
    ro.SetMatchMaker(MM);
    ro.ChangeState(16);
    return ro;
    //return;    
}

function Object DefaultCreateWZCashItem(wGameManager GameMgr, wMatchMaker MM, wItemBoxHK ItemInfo, WebzenShopPackage WZShopPackage)
{
    local BTROItemBoxHK ro;

    ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    ro.Init();
    ro.ItemInfo = ItemInfo;
    ro.ItemInfo.PurchaseType = 1;
    ro.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    ro.instanceInfo.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    ro.instanceInfo.cashItemInfo.SetCashItemInfoWZ(ro.ItemInfo, WZShopPackage);
    // End:0xEA
    if(ro.ItemInfo.AdType == 2)
    {
        ro.RibbonState = 3;        
    }
    else
    {
        // End:0x11C
        if(ro.ItemInfo.AdType == 3)
        {
            ro.RibbonState = 2;            
        }
        else
        {
            // End:0x14B
            if(ro.ItemInfo.AdType == 4)
            {
                ro.RibbonState = 4;
            }
        }
    }
    ro.SetGameManager(GameMgr);
    ro.SetMatchMaker(MM);
    ro.ChangeState(16);
    return ro;
    //return;    
}

function fill(wGameManager GameMgr, wMatchMaker MM)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wGP20Product gp20Product;
    local Object addedObject;

    i = 0;
    J0x07:

    // End:0x119 [Loop If]
    if(i < GameMgr.ShopItemList.Length)
    {
        addedObject = none;
        ItemInfo = GameMgr.FindUIItem(GameMgr.ShopItemList[i]);
        // End:0x10F
        if(CheckItemCommon(GameMgr, ItemInfo))
        {
            addedObject = CreatePointItem(GameMgr.ShopItemList[i], ItemInfo);
            // End:0xCA
            if(addedObject == none)
            {
                addedObject = DefaultCreatePointItem(GameMgr, MM, GameMgr.ShopItemList[i], ItemInfo);
            }
            // End:0x10F
            if(addedObject != none)
            {
                Log("Add Point Item :" @ string(ItemInfo.ItemID));
                AddPointItem(GameMgr, addedObject);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x25A
    if(UseGP20())
    {
        i = 0;
        J0x129:

        // End:0x257 [Loop If]
        if(i < GameMgr.kGP20ProductList.Length)
        {
            addedObject = none;
            gp20Product = GameMgr.kGP20ProductList[i];
            ItemInfo = GameMgr.FindUIItem(gp20Product.ProductCode);
            // End:0x24D
            if((CheckItemCommon(GameMgr, ItemInfo)) && Class'Engine.wItemBoxCashHK'.static.IsShowStore(GameMgr.kClientTime, gp20Product))
            {
                addedObject = CreateGP20Item(ItemInfo, gp20Product);
                // End:0x209
                if(addedObject == none)
                {
                    addedObject = DefaultCreateGP20Item(GameMgr, MM, ItemInfo, gp20Product);
                }
                // End:0x24D
                if(addedObject != none)
                {
                    Log("Add GP20 Item :" @ string(ItemInfo.ItemID));
                    AddGP20Item(GameMgr, addedObject);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x129;
        }        
    }
    else
    {
        i = 0;
        J0x261:

        // End:0x39F [Loop If]
        if(i < GameMgr.kWZPackageList.Length)
        {
            addedObject = none;
            ItemInfo = GameMgr.FindUIItem(GameMgr.kWZPackageList[i].ItemID);
            // End:0x395
            if((CheckItemCommon(GameMgr, ItemInfo)) && GameMgr.kWZPackageList[i].SalesFlag != 183)
            {
                addedObject = CreateWZCashItem(ItemInfo, GameMgr.kWZPackageList[i]);
                // End:0x34B
                if(addedObject == none)
                {
                    addedObject = DefaultCreateWZCashItem(GameMgr, MM, ItemInfo, GameMgr.kWZPackageList[i]);
                }
                // End:0x395
                if(addedObject != none)
                {
                    Log("Add WebzenCash Item :" @ string(ItemInfo.ItemID));
                    AddWZCashItem(GameMgr, addedObject);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x261;
        }
    }
    //return;    
}
