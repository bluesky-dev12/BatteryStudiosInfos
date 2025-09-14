class BTPageRoomLobby_Defence extends BTPageRoomLobby
    editinlinenew
    instanced;

var() automated FloatBox fbRewardInfo;
var export editinline BTDefenceRewardInfo RewardInfo;
var bool bShowRewardWindow;
var bool bAfterStartGame;
var export editinline BTOwnerDrawCaptionButtonHK ItemBuyButton[2];
var() automated FloatBox fbItemBuyButton[2];
var export editinline BTOwnerDrawCaptionButtonHK ArrowButton[2];
var() automated FloatBox fbArrowButton[2];
var localized string lsDefenceShop_Buy;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var bool IsVisibleMiniShop;
var() automated FloatBox fbTPTeamListMiniShop;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x223
    if(IsVisibleMiniShop)
    {
        i = 0;
        J0x20:

        // End:0x18B [Loop If]
        if(i < 2)
        {
            ItemBuyButton[i] = NewButtonComponent(fbItemBuyButton[i], 0.9000000);
            ItemBuyButton[i].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_n;
            ItemBuyButton[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_on;
            ItemBuyButton[i].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_n;
            ItemBuyButton[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_cli;
            ItemBuyButton[i].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_Dis;
            ItemBuyButton[i].buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Defence_Buy_Btn_on;
            ItemBuyButton[i].Caption = lsDefenceShop_Buy;
            ItemBuyButton[i].__OnClick__Delegate = BuyButton_OnClick;
            ItemBuyButton[i].ButtonID = i + 1;
            i++;
            // [Loop Continue]
            goto J0x20;
        }
        i = 0;
        J0x192:

        // End:0x201 [Loop If]
        if(i < 2)
        {
            ArrowButton[i] = NewButtonComponent(fbArrowButton[i], 0.9000000);
            ArrowButton[i].__OnClick__Delegate = ArrowButton_OnClick;
            ArrowButton[i].ButtonID = i + 1;
            i++;
            // [Loop Continue]
            goto J0x192;
        }
        ArrowButton[0].SetLuckyShopLeftArrowButtonImage();
        ArrowButton[1].SetLuckyShopRightArrowButtonImage();
    }
    //return;    
}

function InitializeTeamList()
{
    LabelTeamTopLine = NewLabelComponent(fbLabelTeamTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
    LabelTeamTopLine.SetFontSizeAll(11);
    ButtonTeam[0] = NewButtonComponent(fbButtonTeam[0]);
    ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
    ButtonTeam[0].bActiveCursor = false;
    ButtonTeam[1] = NewButtonComponent(fbButtonTeam[1]);
    // End:0xA4
    if(IsVisibleMiniShop)
    {
        fbTPTeamList[0] = fbTPTeamListMiniShop;
    }
    TPTeamList[0] = BTTPTeamMemberList(NewComponent(new Class'GUIWarfareControls.BTTPTeamMemberList', fbTPTeamList[0]));
    TPTeamList[0].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[0].__OnPopup__Delegate = TPTeamList_OnPopup;
    RewardInfo = BTDefenceRewardInfo(NewComponent(new Class'GUIWarfareControls.BTDefenceRewardInfo', fbRewardInfo));
    RewardInfo.ApplyAWinPos();
    RewardInfo.IsVisibleMiniShop = self.IsVisibleMiniShop;
    //return;    
}

function bool ChangeButtonTeam(int Team)
{
    // End:0xED
    if(Team == 0)
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
        ButtonTeam[0].__OnClick__Delegate = None;        
    }
    else
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Defence_Team;
    }
    return true;
    //return;    
}

function UpdateGameRoomInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby_Defence::UpdateGameRoomInfo]");
    super.UpdateGameRoomInfo(MM);
    RewardInfo.SetDefenceRewardInfo();
    // End:0xC3
    if(bShowRewardWindow)
    {
        bShowRewardWindow = false;
        Controller.OpenMenu("GUIWarfareControls.BTWindowDefenceReward");
        BTWindowDefenceReward(Controller.TopPage()).InitializeReward(int(RewardInfo.BotDifficulty));
    }
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    local Controller C;
    local wDefenceController dPC;

    Log((((((((((string(self) $ "[rfAckUseItemDuringGame] ErrorCode:") $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ __NFUN_918__(ItemUniqueID)) $ " / RemainCount:") $ string(RemainCount));
    // End:0xA8
    if(ErrorCode != 0)
    {
        return false;
    }
    // End:0x24A
    if((MM.playingLevelInfo != none) && int(MM.playingLevelInfo.NetMode) == int(NM_ListenServer))
    {
        Log((string(self) $ "[rfAckUseItemDuringGame] ") $ string(MM.playingLevelInfo.NetMode));
        C = MM.playingLevelInfo.ControllerList;
        J0x13A:

        // End:0x24A [Loop If]
        if(C != none)
        {
            dPC = wDefenceController(C);
            // End:0x163
            if(dPC == none)
            {                
            }
            else
            {
                Log((string(self) $ "[rfAckUseItemDuringGame] PlayerName:") $ dPC.PlayerReplicationInfo.PlayerName);
                // End:0x233
                if(((dPC != none) && dPC.PlayerReplicationInfo != none) && dPC.PlayerReplicationInfo.PlayerName == CharName)
                {
                    switch(ItemID)
                    {
                        // End:0x20E
                        case 92005:
                            dPC.SetRepairNuclear();
                            // End:0x230
                            break;
                        // End:0x22A
                        case 92006:
                            dPC.bActiveNowRespawn = true;
                            // End:0x230
                            break;
                        // End:0xFFFF
                        default:
                            // End:0x230
                            break;
                            break;
                    }
                    // [Explicit Break]
                    goto J0x24A;
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x13A;
        }
    }
    J0x24A:

    // End:0x38E
    if((PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none)
    {
        // End:0x38E
        if((PlayerOwner().PlayerReplicationInfo.PlayerName == CharName) && PlayerOwner().myHUD != none)
        {
            PlayerOwner().myHUD.CallUsingItem(ItemID, RemainCount);
            dPC = wDefenceController(PlayerOwner());
            // End:0x38E
            if(dPC != none)
            {
                switch(ItemID)
                {
                    // End:0x30F
                    case 92005:
                        dPC.bReqActiveRepair = false;
                        dPC.SetItemCount(ItemID, RemainCount);
                        // End:0x34A
                        break;
                    // End:0x344
                    case 92006:
                        dPC.bReqAcitveRespawn = false;
                        dPC.SetItemCount(ItemID, RemainCount);
                        // End:0x34A
                        break;
                    // End:0xFFFF
                    default:
                        // End:0x34A
                        break;
                        break;
                }
                MM.kNeedUpdateItemList = true;
                // End:0x38E
                if(RemainCount == 0)
                {
                    GameMgr.RemoveInstanceItem(ItemUniqueID);
                    GameMgr.RemoveQuickSlotItem(ItemUniqueID);
                }
            }
        }
    }
    return true;
    //return;    
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    // End:0x19
    if(!bAfterStartGame)
    {
        bShowRewardWindow = true;
    }
    bAfterStartGame = false;
    // End:0x73
    if(UseGP20())
    {
        Log("page_Main.TcpChannel.sfReqShopItemData(0)");
        page_Main.TcpChannel.sfReqShopItemData(0);        
    }
    else
    {
        Log("page_Main.TcpChannel.sfReqWebzenShopScriptVersion()");
        page_Main.TcpChannel.sfReqWebzenShopScriptVersion();
    }
    // End:0xF2
    if(GameMgr.ShopItemList.Length == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();        
    }
    else
    {
        FillShopItem();
    }
    // End:0x11E
    if((none != RewardInfo) && IsVisibleMiniShop)
    {
        RewardInfo.iShopIndex = 0;
    }
    //return;    
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    // End:0x13
    if(Result == 0)
    {
        bAfterStartGame = true;
    }
    return super.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg);
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageStore::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log(string(self) $ "[BTPageRoomLobby_Defence::rfAckShopItemList]");
    i = 0;
    J0x3C:

    // End:0xA5 [Loop If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    Log(string(self) $ "[BTPageRoomLobby_Defence::rfAckShopItemListEnd]");
    FillShopItem();
    return true;
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby_Defence::UpdateItemList]");
    // End:0x6B
    if((page_Main != none) && page_Main.page_Inventory != none)
    {
        page_Main.page_Inventory.UpdateItemList(GameMgr);
    }
    FillShopItem();
    //return;    
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    FillShopItem();
    //return;    
}

function bool ArrowButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local array<BTROItemBoxHK> arROI;

    // End:0x09
    if(bReadyToGame)
    {
    }
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x26
    if(none == btn)
    {
        return false;
    }
    switch(btn.ButtonID)
    {
        // End:0x4D
        case 1:
            --RewardInfo.iShopIndex;
            // End:0x68
            break;
        // End:0x65
        case 2:
            ++RewardInfo.iShopIndex;
            // End:0x68
            break;
        // End:0xFFFF
        default:
            break;
    }
    RewardInfo.UpdateShopItemInfo();
    return true;
    //return;    
}

function bool BuyButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local array<BTROItemBoxHK> arROI;

    // End:0x21
    if(bReadyToGame)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return false;
    }
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x3E
    if(none == btn)
    {
        return false;
    }
    switch(btn.ButtonID)
    {
        // End:0x9E
        case 1:
            TPItemList.ItemList.GetItemFromItemID(RewardInfo.GetShopItemID(0), arROI);
            // End:0x9B
            if(arROI.Length > 0)
            {
                ShowSaveWindow(arROI[0], 0, 0);
            }
            // End:0xF5
            break;
        // End:0xEF
        case 2:
            TPItemList.ItemList.GetItemFromItemID(RewardInfo.GetShopItemID(1), arROI);
            // End:0xEC
            if(arROI.Length > 0)
            {
                ShowSaveWindow(arROI[0], 0, 0);
            }
            // End:0xF5
            break;
        // End:0xFFFF
        default:
            // End:0xF5
            break;
            break;
    }
    return false;
    //return;    
}

function bool ShowItemBuyWindow(BTROItemBoxHK Ro, int buyType, byte cashType)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    Class'GUIWarfareControls.BTWindowItemBuyHK'.static.ShowItemBuyWindow(Controller, TcpChannel, Ro, MM.kPoint, MM.kCash, MM.kCCoinCash, buyType, cashType);
    BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
    return true;
    //return;    
}

function bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    page_Main.ShowCashChargeWindow();
    return true;
    //return;    
}

function SelectCoin(int buyType, int cashType, BTROItemBoxHK Ro)
{
    ShowItemBuyWindow(Ro, buyType, byte(cashType));
    //return;    
}

function bool ShowSaveWindow(BTROItemBoxHK Ro, int buyType, byte cashType)
{
    local wItemBoxCashHK cii;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x3C
    if(Ro == none)
    {
        return true;
    }
    cii = Ro.instanceInfo.cashItemInfo;
    // End:0xFC
    if(cii != none)
    {
        // End:0xB8
        if(cii.CheckSaleEnd(GameMgr.kClientTime))
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
            GameMgr.UpdateItemList(GameMgr);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, Ro, buyType);
            BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;
        }        
    }
    else
    {
        ShowItemBuyWindow(Ro, buyType, cashType);
    }
    return true;
    //return;    
}

function bool deleCheckItemCommon(wGameManager GameMgr, wItemBoxHK ItemInfo)
{
    // End:0x1B
    if(!ItemInfo.IsShowStore(GameMgr))
    {
        return false;
    }
    // End:0x41
    if(int(ItemInfo.byModeItem) != Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        return false;
    }
    return true;
    //return;    
}

function deleAddItem(wGameManager GameMgr, Object addedObject)
{
    local BTROItemBoxHK Ro;
    local wItemBoxCashHK cashItemInfo;
    local wItemBoxInstanceHK curInstanceInfo;

    Ro = BTROItemBoxHK(addedObject);
    curInstanceInfo = GameMgr.FindFirstInstanceItemByItemID(Ro.ItemInfo.ItemID);
    // End:0x95
    if(curInstanceInfo != none)
    {
        cashItemInfo = Ro.instanceInfo.cashItemInfo;
        Ro.instanceInfo = curInstanceInfo;
        Ro.instanceInfo.cashItemInfo = cashItemInfo;
    }
    Ro.MyData = TPItemList.MyData;
    Ro.Update();
    Ro.bUseCache = true;
    TPItemList.ItemList.AddItem(Ro);
    // End:0x12B
    if((none != RewardInfo) && IsVisibleMiniShop)
    {
        RewardInfo.SetDefenceShopInfo(Ro.ItemInfo.ItemID);
    }
    //return;    
}

function FillShopItem()
{
    local wGameManager GameMgr;
    local wMatchMaker MM;
    local BTStoreFillProcess fillProcess;

    // End:0x0D
    if(!IsVisibleMiniShop)
    {
        return;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x96
    if(none == TPItemList)
    {
        TPItemList = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls.BTTPItemListHK', fbTPItemList));
    }
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    TPItemList.ItemList.ClearItem();
    fillProcess = new Class'GUIWarfareControls.BTStoreFillProcess';
    fillProcess.__CheckItemCommon__Delegate = deleCheckItemCommon;
    fillProcess.__AddPointItem__Delegate = deleAddItem;
    fillProcess.__AddGP20Item__Delegate = deleAddItem;
    fillProcess.__AddWZCashItem__Delegate = deleAddItem;
    fillProcess.fill(GameMgr, MM);
    // End:0x1BD
    if((none != RewardInfo) && IsVisibleMiniShop)
    {
        RewardInfo.UpdateShopItemInfo();
    }
    //return;    
}

defaultproperties
{
    fbRewardInfo=(X1=385.0000000,Y1=137.0000000,X2=745.0000000,Y2=508.0000000)
    fbItemBuyButton[0]=(X1=77.0000000,Y1=475.0000000,X2=181.0000000,Y2=497.0000000)
    fbItemBuyButton[1]=(X1=253.0000000,Y1=475.0000000,X2=357.0000000,Y2=497.0000000)
    fbArrowButton[0]=(X1=14.0000000,Y1=415.0000000,X2=34.0000000,Y2=455.0000000)
    fbArrowButton[1]=(X1=339.0000000,Y1=415.0000000,X2=359.0000000,Y2=455.0000000)
    lsDefenceShop_Buy="Buy"
    IsVisibleMiniShop=true
    fbTPTeamListMiniShop=(X1=12.0000000,Y1=207.0000000,X2=374.0000000,Y2=350.0000000)
}