class BTTPLuckyCapsuleStore extends GUITabPanel
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var wGameManager GameMgr;
var wMatchMaker MM;
var export editinline BTOwnerDrawImageHK NewBackground;
var FloatBox fbLabelCapsuleName;
var FloatBox fbLabelCapsulePrice;
var export editinline BTOwnerDrawImageHK LabelCapsuleName;
var export editinline BTOwnerDrawImageHK LabelCapsulePrice;
var FloatBox fbBuyButton;
var FloatBox fbGiftButton;
var export editinline BTOwnerDrawCaptionButtonHK GiftButton;
var FloatBox fbCapsuleList;
var FloatBox fbCapsuleLeftButton;
var FloatBox fbCapsuleRightButton;
var FloatBox fbPageInfo;
var export editinline BTListWithButton CapsuleList;
var export editinline BTTPLuckyShopCommon LuckyShopCommon;
var localized string strCapsuleName;
var localized string strCapsulePrice;
var localized string strBuyCapsule;
var localized string strGiftCapsule;
var localized string strLabelIncludeHeader[2];
var array<BTROCapsuleTitle> OriginalCapsuleData;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

delegate deleShowCashChargeWindow()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    NewBackground = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 1024.0000000, 768.0000000), 0.5000000, self));
    NewBackground.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_CapsuleStoreBG_Img;
    AddLabel(LabelCapsuleName, fbLabelCapsuleName, strCapsuleName, 8, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed(), 3);
    AddLabel(LabelCapsulePrice, fbLabelCapsulePrice, strCapsulePrice, 8, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed(), 4);
    CapsuleList = BTListWithButton(NewComponent(new Class'GUIWarfareControls_Decompressed.BTListWithButton', fbCapsuleList, 0.5000000, self));
    CapsuleList.Initialize(MyController, myOwner, true, 10, fbCapsuleList, fbCapsuleLeftButton, fbCapsuleRightButton, "", true, false,, fbPageInfo);
    CapsuleList.ItemList.__OnChange__Delegate = OnChangeCapsuleList;
    CapsuleList.ItemList.OnClickSound = 1;
    LuckyShopCommon = BTTPLuckyShopCommon(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPLuckyShopCommon', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.5000000, self));
    LuckyShopCommon.BuyButton.Caption = strBuyCapsule;
    i = 0;
    J0x203:

    // End:0x242 [Loop If]
    if(i < 2)
    {
        LuckyShopCommon.LabelIncludeHeader[i].Caption = strLabelIncludeHeader[i];
        ++i;
        // [Loop Continue]
        goto J0x203;
    }
    LuckyShopCommon.BuyButton.__OnClick__Delegate = OnClickBuy;
    LuckyShopCommon.BestLeftButton.__OnClick__Delegate = OnClickBestItemArrow;
    LuckyShopCommon.BestRightButton.__OnClick__Delegate = OnClickBestItemArrow;
    LuckyShopCommon.BuyButton.AWinPos = fbBuyButton;
    LuckyShopCommon.BuyButton.ApplyAWinPos();
    AddButton(GiftButton, fbGiftButton, strGiftCapsule, 9, 4);
    GiftButton.SetQuestReceiveRewardImage();
    GiftButton.__OnClick__Delegate = OnClickGift;
    //return;    
}

function AddLabel(out BTOwnerDrawImageHK AddComponent, FloatBox fbComponent, string strCaption, int FontSize, Color TextColor, BTCustomDrawHK.DrawType dt)
{
    AddComponent = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbComponent, 0.5000000, self));
    AddComponent.Caption = strCaption;
    AddComponent.SetFontSizeAll(FontSize);
    AddComponent.SetFontColorAll(TextColor);
    AddComponent.SetFontDrawType(dt);
    //return;    
}

function AddButton(out BTOwnerDrawCaptionButtonHK AddButton, FloatBox fbButton, optional string strCaption, optional int FontSize, optional BTCustomDrawHK.DrawType dt)
{
    AddButton = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButton, 0.5000000, self));
    AddButton.Caption = strCaption;
    AddButton.SetFontSizeAll(FontSize);
    AddButton.SetFontDrawType(dt);
    AddButton.SetDefaultFontColor();
    //return;    
}

function InsertCapsuleData(out array<BTROCapsuleTitle> OutArray, BTROCapsuleTitle capsuleData)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x79 [Loop If]
    if(i < OutArray.Length)
    {
        // End:0x6F
        if(capsuleData.ItemInfo.ShopDisplayOrder < OutArray[i].ItemInfo.ShopDisplayOrder)
        {
            OutArray.Insert(i, 1);
            OutArray[i] = capsuleData;
            return;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    OutArray[OutArray.Length] = capsuleData;
    //return;    
}

function bool deleCheckItemCommon(wGameManager GameMgr, wItemBoxHK ItemInfo)
{
    return ItemInfo.ItemType == int(GameMgr.37);
    //return;    
}

function Object deleCreatePointItem(int ItemID, wItemBoxHK ItemInfo)
{
    local BTROCapsuleTitle roCapsuleTitle;

    roCapsuleTitle = new Class'GUIWarfareControls_Decompressed.BTROCapsuleTitle';
    roCapsuleTitle.Initialize(ItemInfo);
    return roCapsuleTitle;
    //return;    
}

function Object deleCreateGP20Item(wItemBoxHK ItemInfo, wGP20Product gp20Product)
{
    local BTROCapsuleTitle roCapsuleTitle;

    roCapsuleTitle = new Class'GUIWarfareControls_Decompressed.BTROCapsuleTitle';
    roCapsuleTitle.Initialize(ItemInfo);
    roCapsuleTitle.ItemInfo.PurchaseType = 1;
    roCapsuleTitle.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    roCapsuleTitle.cashItemInfo.SetCashItemInfoGP20(roCapsuleTitle.ItemInfo, gp20Product, roCapsuleTitle.cashItemInfo.0);
    roCapsuleTitle.RefreshPrice();
    // End:0xD8
    if(gp20Product.SaleMasterFlag == gp20Product.1)
    {
        roCapsuleTitle.ItemInfo.AdType = 3;
    }
    return roCapsuleTitle;
    //return;    
}

function Object deleCreateWZCashItem(wItemBoxHK ItemInfo, WebzenShopPackage WZShopPackage)
{
    local BTROCapsuleTitle roCapsuleTitle;

    roCapsuleTitle = new Class'GUIWarfareControls_Decompressed.BTROCapsuleTitle';
    roCapsuleTitle.Initialize(ItemInfo);
    roCapsuleTitle.ItemInfo.PurchaseType = 1;
    roCapsuleTitle.cashItemInfo = new Class'Engine.wItemBoxCashHK';
    roCapsuleTitle.cashItemInfo.SetCashItemInfoWZ(roCapsuleTitle.ItemInfo, WZShopPackage);
    roCapsuleTitle.RefreshPrice();
    return roCapsuleTitle;
    //return;    
}

function deleAddItem(wGameManager GameMgr, Object addedObject)
{
    local BTROCapsuleTitle roCapsuleTitle;

    roCapsuleTitle = BTROCapsuleTitle(addedObject);
    InsertCapsuleData(OriginalCapsuleData, roCapsuleTitle);
    //return;    
}

function fill()
{
    local int i, currentSelectIndex;
    local BTStoreFillProcess fillProcess;

    currentSelectIndex = CapsuleList.ItemList.Index;
    currentSelectIndex = Max(currentSelectIndex, 0);
    OriginalCapsuleData.Length = 0;
    CapsuleList.ClearItem();
    fillProcess = new Class'GUIWarfareControls_Decompressed.BTStoreFillProcess';
    fillProcess.__CheckItemCommon__Delegate = deleCheckItemCommon;
    fillProcess.__CreatePointItem__Delegate = deleCreatePointItem;
    fillProcess.__CreateGP20Item__Delegate = deleCreateGP20Item;
    fillProcess.__CreateWZCashItem__Delegate = deleCreateWZCashItem;
    fillProcess.__AddPointItem__Delegate = deleAddItem;
    fillProcess.__AddGP20Item__Delegate = deleAddItem;
    fillProcess.__AddWZCashItem__Delegate = deleAddItem;
    fillProcess.fill(GameMgr, MM);
    i = 0;
    J0xFD:

    // End:0x159 [Loop If]
    if(i < OriginalCapsuleData.Length)
    {
        OriginalCapsuleData[i].CheckLimitLevel(GameMgr, MM.kLevel);
        CapsuleList.AddRenderObject(OriginalCapsuleData[i]);
        i++;
        // [Loop Continue]
        goto J0xFD;
    }
    currentSelectIndex = Min(currentSelectIndex, CapsuleList.ItemList.ItemCount - 1);
    CapsuleList.ItemList.SetIndex(currentSelectIndex);
    //return;    
}

function OnChangeCapsuleList(GUIComponent Sender)
{
    local BTROCapsuleTitle SelectedItem;

    SelectedItem = CapsuleList.GetLastSelectedObject();
    // End:0xA8
    if(SelectedItem != none)
    {
        LuckyShopCommon.ChangeViewItem(SelectedItem.ItemInfo.ItemID);
        // End:0x99
        if(SelectedItem.cashItemInfo != none)
        {
            // End:0x87
            if(SelectedItem.cashItemInfo.bWZCanGift)
            {
                GiftButton.EnableMe();                
            }
            else
            {
                GiftButton.DisableMe();
            }            
        }
        else
        {
            GiftButton.DisableMe();
        }
    }
    LuckyShopCommon.CheckBestItemArrowEnable(CapsuleList.ItemList.Index, CapsuleList.ItemList.Top, CapsuleList.CountPerPage, CapsuleList.ItemList.ItemCount);
    //return;    
}

function bool OnClickBestItemArrow(GUIComponent Sender)
{
    local int TargetIndex;
    local export editinline BTOwnerDrawCaptionButtonHK senderButton;

    TargetIndex = CapsuleList.ItemList.Index;
    senderButton = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x4B
    if(senderButton.ButtonID == 0)
    {
        --TargetIndex;        
    }
    else
    {
        // End:0x66
        if(senderButton.ButtonID == 1)
        {
            ++TargetIndex;
        }
    }
    CapsuleList.ItemList.SetIndex(TargetIndex);
    return true;
    //return;    
}

function bool OnClickBuy(GUIComponent Sender)
{
    ItemBuyProcess(0);
    return true;
    //return;    
}

function bool OnClickGift(GUIComponent Sender)
{
    ItemBuyProcess(1);
    return true;
    //return;    
}

function bool ItemBuyProcess(int _buyType)
{
    local BTROCapsuleTitle SelectedItem;
    local BTROItemBoxHK tempRo;
    local wItemBoxCashHK cii;

    // End:0x0D
    if(!bAcceptsInput)
    {
        return false;
    }
    SelectedItem = CapsuleList.GetLastSelectedObject();
    // End:0x20C
    if(SelectedItem != none)
    {
        tempRo = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        tempRo.Init();
        tempRo.ItemInfo = GameMgr.FindUIItem(SelectedItem.ItemInfo.ItemID);
        tempRo.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        tempRo.SetGameManager(GameMgr);
        tempRo.SetMatchMaker(MM);
        tempRo.ChangeState(6);
        tempRo.Update();
        // End:0x13A
        if(tempRo.ItemInfo.IsCashItem() == true)
        {
            GameMgr.AddCashItem(tempRo.ItemInfo, tempRo.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
        }
        cii = tempRo.instanceInfo.cashItemInfo;
        // End:0x1FA
        if(cii != none)
        {
            // End:0x1B6
            if(cii.CheckSaleEnd(GameMgr.kClientTime))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
                GameMgr.UpdateItemList(GameMgr);                
            }
            else
            {
                Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, tempRo, _buyType);
                BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;
            }            
        }
        else
        {
            ShowItemBuyWindow(tempRo, _buyType, 0);
        }
    }
    return true;
    //return;    
}

function SelectCoin(int buyType, int cashType, BTROItemBoxHK Ro)
{
    ShowItemBuyWindow(Ro, buyType, byte(cashType));
    //return;    
}

function ShowItemBuyWindow(BTROItemBoxHK Ro, int buyType, byte cashType)
{
    Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK'.static.ShowItemBuyWindow(Controller, TcpChannel, Ro, MM.kPoint, MM.kCash, MM.kCCoinCash, buyType, cashType);
    BTWindowItemBuyHK(Controller.TopPage()).__deleShowCashChargeWindow__Delegate = __deleShowCashChargeWindow__Delegate;
    //return;    
}

defaultproperties
{
    fbLabelCapsuleName=(X1=33.0000000,Y1=135.0000000,X2=206.0000000,Y2=149.0000000)
    fbLabelCapsulePrice=(X1=283.0000000,Y1=135.0000000,X2=349.0000000,Y2=149.0000000)
    fbBuyButton=(X1=693.0000000,Y1=460.0000000,X2=876.0000000,Y2=497.0000000)
    fbGiftButton=(X1=881.0000000,Y1=460.0000000,X2=1005.0000000,Y2=497.0000000)
    fbCapsuleList=(X1=11.0000000,Y1=152.0000000,X2=362.0000000,Y2=662.0000000)
    fbCapsuleLeftButton=(X1=88.0000000,Y1=668.0000000,X2=130.0000000,Y2=689.0000000)
    fbCapsuleRightButton=(X1=229.0000000,Y1=668.0000000,X2=271.0000000,Y2=689.0000000)
    fbPageInfo=(X1=132.0000000,Y1=670.0000000,X2=227.0000000,Y2=688.0000000)
    strCapsuleName="Supply Box Type"
    strCapsulePrice="Price"
    strBuyCapsule="Buy"
    strGiftCapsule="Gift"
    strLabelIncludeHeader[0]="Supply Box Item"
    strLabelIncludeHeader[1]="List"
}