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
    local BTROItemBoxHK Ro;

    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    Ro.Init();
    Ro.ItemInfo = ItemInfo;
    // End:0x88
    if(Ro.ItemInfo == none)
    {
        Ro.ItemInfo = new Class'Engine.wItemBoxHK';
        Ro.ItemInfo.ItemName = "ItemID=" $ string(ItemID);
    }
    Ro.SetGameManager(GameMgr);
    Ro.SetMatchMaker(MM);
    Ro.ChangeState(6);
    // End:0xEE
    if(GameMgr.FindFirstInstanceItemByItemID(ItemID) != none)
    {
        Ro.RibbonState = 1;        
    }
    else
    {
        // End:0x120
        if(Ro.ItemInfo.AdType == 2)
        {
            Ro.RibbonState = 3;            
        }
        else
        {
            // End:0x152
            if(Ro.ItemInfo.AdType == 3)
            {
                Ro.RibbonState = 2;                
            }
            else
            {
                // End:0x181
                if(Ro.ItemInfo.AdType == 4)
                {
                    Ro.RibbonState = 4;
                }
            }
        }
    }
    return Ro;
    //return;    
}

function Object DefaultCreateGP20Item(wGameManager GameMgr, wMatchMaker MM, wItemBoxHK ItemInfo, wGP20Product gp20Product)
{
    local BTROItemBoxHK Ro;

    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    Ro.Init();
    Ro.ItemInfo = ItemInfo;
    Ro.ItemInfo.PurchaseType = 1;
    Ro.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    Ro.instanceInfo.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    Ro.instanceInfo.cashItemInfo.SetCashItemInfoGP20(Ro.ItemInfo, gp20Product, Ro.instanceInfo.cashItemInfo.0);
    // End:0xFB
    if(gp20Product.IsDiscount(0))
    {
        Ro.RibbonState = 6;        
    }
    else
    {
        // End:0x12D
        if(gp20Product.SaleMasterFlag == gp20Product.16)
        {
            Ro.RibbonState = 3;            
        }
        else
        {
            // End:0x15E
            if(gp20Product.SaleMasterFlag == gp20Product.1)
            {
                Ro.RibbonState = 2;                
            }
            else
            {
                // End:0x18D
                if(gp20Product.SaleMasterFlag == gp20Product.8)
                {
                    Ro.RibbonState = 4;
                }
            }
        }
    }
    Ro.SetGameManager(GameMgr);
    Ro.SetMatchMaker(MM);
    Ro.ChangeState(16);
    return Ro;
    //return;    
}

function Object DefaultCreateWZCashItem(wGameManager GameMgr, wMatchMaker MM, wItemBoxHK ItemInfo, WebzenShopPackage WZShopPackage)
{
    local BTROItemBoxHK Ro;

    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    Ro.Init();
    Ro.ItemInfo = ItemInfo;
    Ro.ItemInfo.PurchaseType = 1;
    Ro.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    Ro.instanceInfo.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    Ro.instanceInfo.cashItemInfo.SetCashItemInfoWZ(Ro.ItemInfo, WZShopPackage);
    // End:0xEA
    if(Ro.ItemInfo.AdType == 2)
    {
        Ro.RibbonState = 3;        
    }
    else
    {
        // End:0x11C
        if(Ro.ItemInfo.AdType == 3)
        {
            Ro.RibbonState = 2;            
        }
        else
        {
            // End:0x14B
            if(Ro.ItemInfo.AdType == 4)
            {
                Ro.RibbonState = 4;
            }
        }
    }
    Ro.SetGameManager(GameMgr);
    Ro.SetMatchMaker(MM);
    Ro.ChangeState(16);
    return Ro;
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

    // End:0xF3 [Loop If]
    if(i < GameMgr.ShopItemList.Length)
    {
        addedObject = none;
        ItemInfo = GameMgr.FindUIItem(GameMgr.ShopItemList[i]);
        // End:0xE9
        if(CheckItemCommon(GameMgr, ItemInfo))
        {
            addedObject = CreatePointItem(GameMgr.ShopItemList[i], ItemInfo);
            // End:0xCA
            if(addedObject == none)
            {
                addedObject = DefaultCreatePointItem(GameMgr, MM, GameMgr.ShopItemList[i], ItemInfo);
            }
            // End:0xE9
            if(addedObject != none)
            {
                AddPointItem(GameMgr, addedObject);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x20F
    if(UseGP20())
    {
        i = 0;
        J0x103:

        // End:0x20C [Loop If]
        if(i < GameMgr.kGP20ProductList.Length)
        {
            addedObject = none;
            gp20Product = GameMgr.kGP20ProductList[i];
            ItemInfo = GameMgr.FindUIItem(gp20Product.ProductCode);
            // End:0x202
            if((CheckItemCommon(GameMgr, ItemInfo)) && Class'Engine.wItemBoxCashHK'.static.IsShowStore(GameMgr.kClientTime, gp20Product))
            {
                addedObject = CreateGP20Item(ItemInfo, gp20Product);
                // End:0x1E3
                if(addedObject == none)
                {
                    addedObject = DefaultCreateGP20Item(GameMgr, MM, ItemInfo, gp20Product);
                }
                // End:0x202
                if(addedObject != none)
                {
                    AddGP20Item(GameMgr, addedObject);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x103;
        }        
    }
    else
    {
        i = 0;
        J0x216:

        // End:0x329 [Loop If]
        if(i < GameMgr.kGP20ProductList.Length)
        {
            addedObject = none;
            ItemInfo = GameMgr.FindUIItem(GameMgr.kWZPackageList[i].ItemID);
            // End:0x31F
            if((CheckItemCommon(GameMgr, ItemInfo)) && GameMgr.kWZPackageList[i].SalesFlag != 183)
            {
                addedObject = CreateWZCashItem(ItemInfo, GameMgr.kWZPackageList[i]);
                // End:0x300
                if(addedObject == none)
                {
                    addedObject = DefaultCreateWZCashItem(GameMgr, MM, ItemInfo, GameMgr.kWZPackageList[i]);
                }
                // End:0x31F
                if(addedObject != none)
                {
                    AddWZCashItem(GameMgr, addedObject);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x216;
        }
    }
    //return;    
}
