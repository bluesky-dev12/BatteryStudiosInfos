class BTPageLucky extends BTNetGUIPageHK
    editinlinenew
    instanced;

const TabCount = 3;

enum E_LUCKY_TAB
{
    ELT_CAPSULE_STORE,              // 0
    ELT_CAPSULE_INVENTORY,          // 1
    ELT_BLACKBOX                    // 2
};

var export editinline BTOwnerDrawImageHK PageBackground;
var() automated TabControlMocker TabControl;
var export editinline GUITabPanel TabPanels[3];
var export editinline BTTPLuckyCapsuleStore tpCapsuleStore;
var export editinline BTTPLuckyCapsuleInventory tpCapsuleInventory;
var export editinline BTTPLuckyBlackBox tpBlackBox;
var FloatBox fbButton[3];
var localized string strButton[3];
var export editinline BTMoneyInfo MoneyInfoObject;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    PageBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.LuckyShopBG_Img);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    SkipTopMenuIndex = int(TPTopMenu.8);
    AddTab(int(0), Class'GUIWarfareControls.BTTPLuckyCapsuleStore');
    AddTab(int(1), Class'GUIWarfareControls.BTTPLuckyCapsuleInventory');
    AddTab(int(2), Class'GUIWarfareControls.BTTPLuckyBlackBox');
    tpCapsuleStore = BTTPLuckyCapsuleStore(TabPanels[int(0)]);
    tpCapsuleInventory = BTTPLuckyCapsuleInventory(TabPanels[int(1)]);
    tpBlackBox = BTTPLuckyBlackBox(TabPanels[int(2)]);
    tpCapsuleStore.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    tpCapsuleStore.TcpChannel = TcpChannel;
    tpCapsuleStore.LuckyShopCommon.TcpChannel = TcpChannel;
    tpCapsuleStore.fill();
    tpCapsuleInventory.TcpChannel = TcpChannel;
    tpBlackBox.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    tpBlackBox.TcpChannel = TcpChannel;
    tpBlackBox.LuckyShopCommon.TcpChannel = TcpChannel;
    TabControl.SetVisiblePanel(0);
    MoneyInfoObject = new Class'GUIWarfareControls.BTMoneyInfo';
    MoneyInfoObject.InitComponent(Controller, self);
    MoneyInfoObject.TcpChannel = TcpChannel;
    MoneyInfoObject.__deleClickChargeCash__Delegate = page_Main.ShowCashChargeWindow;
    AppendComponent(MoneyInfoObject);
    RefreshCashNPoint();
    Controller.PushPage();
    TabControl.__OnChangedTab__Delegate = Internal_OnChangedTab;
    //return;    
}

function AddTab(int Num, Class<GUITabPanel> tabClass)
{
    local export editinline BTOwnerDrawCaptionButtonHK TabButton;

    TabButton = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
    TabButton.bUseAWinPos = true;
    TabButton.AWinPos = fbButton[Num];
    TabButton.RenderWeight = 0.5000000;
    TabButton.Caption = strButton[Num];
    TabButton.SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.newButtonPressed());
    TabButton.CaptionDrawType = 4;
    TabButton.CaptionPadding[1] = 2;
    TabButton.SetDefaultTabButtonImage();
    TabButton.SetDefaultTabButtonFontColor();
    TabButton.bBoundToParent = false;
    TabButton.bScaleToParent = false;
    TabButton.ButtonID = Num;
    TabButton.InitComponent(Controller, self);
    AppendComponent(TabButton);
    TabPanels[Num] = new tabClass;
    TabPanels[Num].bUseAWinPos = true;
    TabPanels[Num].RenderWeight = 0.5000000;
    TabPanels[Num].InitComponent(Controller, self);
    AppendComponent(TabPanels[Num]);
    TabControl.BindTabButtonAndPanel(TabButton, TabPanels[Num]);
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageLucky_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageLucky_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function InternalOnOpen()
{
    OnOpen();
    TcpChannel.sfReqChangeUserState(9, 0);
    // End:0x3C
    if(GameMgr.ShopItemListCount == 0)
    {
        TcpChannel.sfReqShopItemList();
    }
    TcpChannel.sfReqLuckShop_StorageInfo();
    InitializeDelegate();
    GameMgr.UpdateItemList(GameMgr);
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    UnInitializeDelegate();
    TcpChannel.sfReqChangeUserState(0, 0);
    OnClose(bCanceled);
    //return;    
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    GameMgr.__UpdateWebzenItemList__Delegate = UpdateWebzenItemList;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateMoneyInfo__Delegate = None;
    GameMgr.__UpdateServerTime__Delegate = None;
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageLucky::UpdateItemList]");
    tpCapsuleStore.fill();
    tpCapsuleInventory.FillCapsule();
    tpCapsuleInventory.RefreshCouponButton();
    tpBlackBox.fill();
    RefreshCashNPoint();
    //return;    
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageLucky::UpdateWebzenItemList]");
    tpCapsuleStore.fill();
    tpCapsuleInventory.FillCapsule();
    tpCapsuleInventory.RefreshCouponButton();
    tpBlackBox.fill();
    RefreshCashNPoint();
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageLucky::UpdateMoneyInfo]");
    RefreshCashNPoint();
    //return;    
}

function RefreshCashNPoint()
{
    Log("[BTPageLucky::RefreshCashNPoint]");
    MoneyInfoObject.RefreshCashNPoint(GameMgr, MM);
    //return;    
}

function RefreshWinnerList()
{
    tpCapsuleStore.LuckyShopCommon.RefreshWinnerList();
    tpBlackBox.LuckyShopCommon.RefreshWinnerList();
    //return;    
}

function Internal_OnChangedTab(int CurrentIndex, int PrevIndex)
{
    // End:0x20
    if(CurrentIndex == int(1))
    {
        tpCapsuleInventory.RefreshAllButton();        
    }
    else
    {
        // End:0x49
        if(CurrentIndex == int(0))
        {
            tpCapsuleStore.LuckyShopCommon.RefreshVisible();            
        }
        else
        {
            // End:0x6F
            if(CurrentIndex == int(2))
            {
                tpBlackBox.LuckyShopCommon.RefreshVisible();
            }
        }
    }
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageLucky::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log("[BTPageLucky::rfAckShopItemList]");
    i = 0;
    J0x2B:

    // End:0xD4 [Loop If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        Log((("BTPageLucky::ShopList[" $ string(i)) $ " ItemID : ") $ string(ItemID[i]));
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    Log("[BTPageLucky::rfAckShopItemListEnd]");
    tpCapsuleStore.fill();
    return true;
    //return;    
}

function bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    tpCapsuleStore.LuckyShopCommon.Fill_LotteryWinnerList(CapsuleItemID, IsNotification, NickName, Time);
    tpBlackBox.LuckyShopCommon.Fill_LotteryWinnerList(CapsuleItemID, IsNotification, NickName, Time);
    return false;
    //return;    
}

function bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState)
{
    // End:0x27
    if(ErrorCode != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, ErrorCode);        
    }
    else
    {
        tpCapsuleInventory.SetCapsuleRewardInfo(BuyingCapsuleCount, CapsuleRewardState);
    }
    return true;
    //return;    
}

function bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState)
{
    // End:0x51
    if(ErrorCode != 0)
    {
        // End:0x35
        if(BTWindowDefineInfoHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, ErrorCode);        
    }
    else
    {
        // End:0x92
        if(BTWindowDefineInfoHK(Controller.TopPage()) != none)
        {
            BTWindowDefineInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        }
        tpCapsuleInventory.SetCapsuleRewardInfo(tpCapsuleInventory.BuyingCapsuleCount, FinalCapsuleRewardState);
    }
    return true;
    //return;    
}

function bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, BtrDouble Coupon_ItemUniqueID, int Coupon_Count_AfterReduction)
{
    // End:0x51
    if(ErrorCode != 0)
    {
        // End:0x35
        if(BTWindowDefineInfoHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, ErrorCode);        
    }
    else
    {
        // End:0x92
        if(BTWindowDefineInfoHK(Controller.TopPage()) != none)
        {
            BTWindowDefineInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        }
        // End:0xB4
        if(Coupon_Count_AfterReduction == 0)
        {
            GameMgr.RemoveInstanceItem(Coupon_ItemUniqueID);            
        }
        else
        {
            GameMgr.ChangeInstance_StackCount(Coupon_ItemUniqueID, Coupon_Count_AfterReduction);
        }
        MM.UpdateMoneyInfo(MM);
        tpCapsuleInventory.RefreshCouponButton();
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTPageLucky.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
    end object
    TabControl=mTabControl
    fbButton[0]=(X1=11.0000000,Y1=97.0000000,X2=114.0000000,Y2=129.0000000)
    fbButton[1]=(X1=115.0000000,Y1=97.0000000,X2=218.0000000,Y2=129.0000000)
    fbButton[2]=(X1=219.0000000,Y1=97.0000000,X2=322.0000000,Y2=129.0000000)
    strButton[0]="Buy Supply Box"
    strButton[1]="Box Storage"
    strButton[2]="Fortune Box"
    bPersistent=false
    OnOpen=BTPageLucky.InternalOnOpen
    OnClose=BTPageLucky.InternalOnClose
}