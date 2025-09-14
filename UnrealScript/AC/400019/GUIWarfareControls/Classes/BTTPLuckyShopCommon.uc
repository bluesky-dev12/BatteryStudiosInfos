class BTTPLuckyShopCommon extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var wGameManager GameMgr;
var wMatchMaker MM;
var bool UseItemStateView;
var FloatBox fbImageBestItem;
var FloatBox fbLabelBestItemName;
var FloatBox fbLabelBestItemPrice;
var FloatBox fbLabelBestItemOriginPrice;
var export editinline BTOwnerDrawImageHK ImageBestItem;
var export editinline BTOwnerDrawImageHK LabelBestItemName;
var export editinline BTOwnerDrawImageHK LabelBestItemPrice;
var export editinline BTOwnerDrawImageHK LabelBestItemOriginPrice;
var export editinline BTOwnerDrawImageHK LabelBestItemOriginPriceStrike;
var FloatBox fbCapsuleDescription;
var export editinline BTMultiLineEditBoxHK CapsuleDescription;
var FloatBox fbItemStateBack;
var FloatBox fbItemStateView;
var export editinline BTOwnerDrawImageHK ItemStateBack;
var export editinline BTItemStateBoxButtonHK ItemStateView;
var FloatBox fbBestLeftButton;
var FloatBox fbBestRightButton;
var FloatBox fbBuyButton;
var export editinline BTOwnerDrawCaptionButtonHK BestLeftButton;
var export editinline BTOwnerDrawCaptionButtonHK BestRightButton;
var export editinline BTOwnerDrawCaptionButtonHK BuyButton;
var FloatBox fbLabelIncludeHeader[2];
var export editinline BTOwnerDrawImageHK LabelIncludeHeader[2];
var FloatBox fbIncludeItemList;
var export editinline BTAutoImageListHK IncludeItemList;
var FloatBox fbLabelWinners;
var export editinline BTOwnerDrawImageScroll LabelWinners;
var int CurrentSelectedCapsuleIndex;
var array<export editinline BTLuckyWinner> LuckyWinner;
var bool HasBestWeaponItem;
var bool bShowDiscount;
var bool bRefreshDiscount;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ImageBestItem = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbImageBestItem, 0.5000000, self));
    ImageBestItem.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(int(fbImageBestItem.X2 - fbImageBestItem.X1), int(fbImageBestItem.Y2 - fbImageBestItem.Y1), 1, none);
    AddLabel(LabelBestItemName, fbLabelBestItemName, "", 13, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon(), 3);
    AddLabel(LabelBestItemPrice, fbLabelBestItemPrice, "", 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed(), 3);
    AddLabel(LabelBestItemOriginPrice, fbLabelBestItemOriginPrice, "", 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed(), 3);
    AddLabel(LabelBestItemOriginPriceStrike, fbLabelBestItemOriginPrice, "", 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed(), 3);
    LabelBestItemOriginPrice.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultRed());
    LabelBestItemOriginPriceStrike.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_DisCountLine;
    LabelBestItemOriginPrice.SetVisibility(false);
    LabelBestItemOriginPriceStrike.SetVisibility(false);
    CapsuleDescription = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fbCapsuleDescription, 0.5000000, self));
    CapsuleDescription.SetFontColor(byte(255), byte(255), byte(255), byte(255));
    CapsuleDescription.SetFontSizeAll(8);
    CapsuleDescription.SetVisibleLineCount(3);
    CapsuleDescription.bReadOnly = true;
    CapsuleDescription.TextStr = "-";
    AddButton(BestLeftButton, fbBestLeftButton);
    BestLeftButton.SetLuckyShopLeftArrowButtonImage();
    BestLeftButton.ButtonID = 0;
    AddButton(BestRightButton, fbBestRightButton);
    BestRightButton.SetLuckyShopRightArrowButtonImage();
    BestRightButton.ButtonID = 1;
    AddButton(BuyButton, fbBuyButton, "", 9, 4);
    BuyButton.SetDefaultButtonImage();
    ItemStateBack = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbItemStateBack, 0.5000000, self));
    ItemStateBack.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_ItemInfoGauge_Back;
    ItemStateView = BTItemStateBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK', fbItemStateView, 0.5000000, self));
    ItemStateView.GaugeBGImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_gauge_bg;
    ItemStateView.StateBox.X[0] = -83;
    ItemStateView.StateBox.X[1] = 3;
    ItemStateView.StateBox.X[2] = 146;
    i = 0;
    J0x3C3:

    // End:0x40A [Loop If]
    if(i < 2)
    {
        AddLabel(LabelIncludeHeader[i], fbLabelIncludeHeader[i], "", 9, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite(), 5);
        ++i;
        // [Loop Continue]
        goto J0x3C3;
    }
    IncludeItemList = BTAutoImageListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAutoImageListHK', fbIncludeItemList, 0.5000000, self));
    IncludeItemList.SetItemSize(169, 86);
    IncludeItemList.SetItemCountPerPage(2, 3);
    LabelWinners = NewScrollLabelComponent(fbLabelWinners, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.5000000);
    LabelWinners.OnClickSound = 0;
    LabelWinners.SetFontSizeAll(10);
    LabelWinners.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelWinners.Left_Hold_Left();
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

function ChangeViewItem(int ItemID)
{
    local BTROItemBoxHK roItem;
    local array<int> ItemIDs, PartIDs, BestItemIDs;
    local int i, k, t, randBoxCount, BestItemID;

    IncludeItemList.RemoveAll();
    BestItemID = -1;
    // End:0x28C
    if(ItemID >= 0)
    {
        randBoxCount = GameMgr.GetRandBoxItemsCount(ItemID);
        i = 0;
        J0x46:

        // End:0x271 [Loop If]
        if(i < randBoxCount)
        {
            // End:0x267
            if(GameMgr.GetRandBoxItems(ItemID, i + 1, ItemIDs, PartIDs, BestItemIDs))
            {
                k = 0;
                J0x8A:

                // End:0x267 [Loop If]
                if(k < ItemIDs.Length)
                {
                    roItem = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
                    roItem.Init();
                    roItem.ItemInfo = GameMgr.FindUIItem(ItemIDs[k]);
                    roItem.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                    roItem.instanceInfo.SetExtraValue(roItem.ItemInfo, PartIDs[k]);
                    roItem.ChangeState(22);
                    t = 0;
                    J0x142:

                    // End:0x1A7 [Loop If]
                    if(t < BestItemIDs.Length)
                    {
                        // End:0x16E
                        if(BestItemID < 0)
                        {
                            BestItemID = BestItemIDs[t];
                        }
                        // End:0x19D
                        if(ItemIDs[k] == BestItemIDs[t])
                        {
                            roItem.RibbonState = 5;
                            // [Explicit Break]
                            goto J0x1A7;
                        }
                        ++t;
                        // [Loop Continue]
                        goto J0x142;
                    }
                    J0x1A7:

                    // End:0x201
                    if(roItem.ItemInfo.IsCashItem() == true)
                    {
                        GameMgr.AddCashItem(roItem.ItemInfo, roItem.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
                    }
                    roItem.SetMatchMaker(MM);
                    roItem.SetGameManager(GameMgr);
                    roItem.Update();
                    roItem.CheckScrollItemName = true;
                    IncludeItemList.AddRenderObject(roItem);
                    ++k;
                    // [Loop Continue]
                    goto J0x8A;
                }
            }
            ++i;
            // [Loop Continue]
            goto J0x46;
        }
        SendWinnersList(ItemID);
        SetBestItemData(ItemID, BestItemID);
    }
    //return;    
}

function SetBestItemData(int CapsuleItemID, int bestItem)
{
    local wItemBoxHK capsuleItemInfo, ItemInfo;
    local wItemBoxInstanceHK cashInstanceInfo;
    local int foundResult;
    local WebzenShopPackage WZShopPackage;

    bShowDiscount = false;
    capsuleItemInfo = GameMgr.FindUIItem(CapsuleItemID);
    ItemInfo = GameMgr.FindUIItem(bestItem);
    ImageBestItem.BackgroundImage.Image = capsuleItemInfo.CapsuleImage;
    LabelBestItemName.Caption = capsuleItemInfo.ItemName;
    // End:0x221
    if(capsuleItemInfo.IsCashItem())
    {
        // End:0x194
        if(UseGP20())
        {
            cashInstanceInfo = new Class'Engine.wItemBoxInstanceHK';
            // End:0x191
            if(GameMgr.AddCashItem(capsuleItemInfo, cashInstanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122)))
            {
                // End:0x147
                if(cashInstanceInfo.cashItemInfo.IsDiscount)
                {
                    bShowDiscount = true;
                    bRefreshDiscount = true;
                    LabelBestItemOriginPrice.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(cashInstanceInfo.cashItemInfo.WZOriginalCashPrice[0])));
                }
                LabelBestItemPrice.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(cashInstanceInfo.cashItemInfo.WZCashPrice[0])));
            }            
        }
        else
        {
            WZShopPackage = GameMgr.GetWebzenShopPackage2(CapsuleItemID, foundResult);
            // End:0x200
            if(foundResult == 1)
            {
                LabelBestItemPrice.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(WZShopPackage.PriceList[0].Price)));
            }
        }
        LabelBestItemPrice.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash());        
    }
    else
    {
        LabelBestItemPrice.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(capsuleItemInfo.PointPrice[0])));
        LabelBestItemPrice.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point());
    }
    LabelBestItemOriginPrice.SetVisibility(bShowDiscount);
    LabelBestItemOriginPriceStrike.SetVisibility(bShowDiscount);
    CapsuleDescription.SetText(capsuleItemInfo.ItemDescription);
    // End:0x31F
    if((UseItemStateView && ItemInfo != none) && GameMgr.CheckWeaponItem(ItemInfo.ItemType))
    {
        HasBestWeaponItem = true;
        ItemStateView.SetData(ItemInfo, none);        
    }
    else
    {
        HasBestWeaponItem = false;
    }
    // End:0x35A
    if(MM.kLevel < capsuleItemInfo.EquipLevel)
    {
        BuyButton.DisableMe();        
    }
    else
    {
        BuyButton.EnableMe();
    }
    RefreshVisible();
    //return;    
}

function SendWinnersList(int CapsuleItemID)
{
    // End:0x39
    if(CapsuleItemID != 0)
    {
        // End:0x2E
        if(CurrentSelectedCapsuleIndex != CapsuleItemID)
        {
            TcpChannel.sfReqLuckShop_LotteryWinnerList(CapsuleItemID);
        }
        CurrentSelectedCapsuleIndex = CapsuleItemID;
    }
    //return;    
}

function CheckBestItemArrowEnable(int currentSelected, int CurrentTop, int CountPerPage, int ItemCount)
{
    // End:0x24
    if((currentSelected - 1) < CurrentTop)
    {
        BestLeftButton.DisableMe();        
    }
    else
    {
        BestLeftButton.EnableMe();
    }
    // End:0x72
    if(((currentSelected + 1) >= (CurrentTop + CountPerPage)) || (currentSelected + 1) >= ItemCount)
    {
        BestRightButton.DisableMe();        
    }
    else
    {
        BestRightButton.EnableMe();
    }
    //return;    
}

function bool Fill_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time)
{
    local int i, capsuleIndex;

    capsuleIndex = FindWiinerList(CapsuleItemID, true);
    // End:0x34
    if(int(IsNotification) == 0)
    {
        LuckyWinner[capsuleIndex].ClearWinners();
    }
    i = 0;
    J0x3B:

    // End:0x80 [Loop If]
    if(i < NickName.Length)
    {
        LuckyWinner[capsuleIndex].AddWinner(NickName[i], Time[i]);
        ++i;
        // [Loop Continue]
        goto J0x3B;
    }
    // End:0x96
    if(int(IsNotification) == 0)
    {
        RefreshWinnerList();        
    }
    else
    {
        // End:0xB6
        if(NickName[0] != MM.kUserName)
        {
            RefreshWinnerList();
        }
    }
    return true;
    //return;    
}

function int FindWiinerList(int CapsuleItemID, bool createItem)
{
    local int i, foundIndex;

    foundIndex = -1;
    i = 0;
    J0x12:

    // End:0x58 [Loop If]
    if(i < LuckyWinner.Length)
    {
        // End:0x4E
        if(LuckyWinner[i].ItemID == CapsuleItemID)
        {
            foundIndex = i;
            // [Explicit Break]
            goto J0x58;
        }
        ++i;
        // [Loop Continue]
        goto J0x12;
    }
    J0x58:

    // End:0xB9
    if((foundIndex < 0) && createItem)
    {
        foundIndex = LuckyWinner.Length;
        LuckyWinner.Length = LuckyWinner.Length + 1;
        LuckyWinner[foundIndex] = new Class'GUIWarfareControls_Decompressed.BTLuckyWinner';
        LuckyWinner[foundIndex].ItemID = CapsuleItemID;
    }
    return foundIndex;
    //return;    
}

function RefreshWinnerList()
{
    local int capsuleIndex;
    local string strWinners;

    capsuleIndex = FindWiinerList(CurrentSelectedCapsuleIndex, false);
    // End:0x4E
    if(capsuleIndex >= 0)
    {
        // End:0x4E
        if(LuckyWinner[capsuleIndex].MakeString(strWinners))
        {
            LabelWinners.Caption = strWinners;
        }
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    local float stringX, stringY;

    LabelWinners.AWinPos = LabelWinners.ScrollProcess.Process(Controller.RenderDelta);
    LabelWinners.ApplyAWinPos();
    // End:0x12C
    if(bRefreshDiscount)
    {
        bRefreshDiscount = false;
        C.BtrTextSize(LabelBestItemOriginPrice.Caption, LabelBestItemOriginPrice.FontSize[0], stringX, stringY);
        LabelBestItemOriginPriceStrike.AWinPos = fbLabelBestItemOriginPrice;
        LabelBestItemOriginPriceStrike.AWinPos.X1 = LabelBestItemOriginPriceStrike.AWinPos.X1 - float(5);
        LabelBestItemOriginPriceStrike.AWinPos.X2 = (fbLabelBestItemOriginPrice.X1 + stringX) + float(5);
        LabelBestItemOriginPriceStrike.AWinPos.Y2 = fbLabelBestItemOriginPrice.Y1 + stringY;
        LabelBestItemOriginPriceStrike.ApplyAWinPos();
    }
    return super(GUIComponent).OnPreDraw(C);
    //return;    
}

function RefreshVisible()
{
    // End:0x2B
    if(!UseItemStateView)
    {
        CapsuleDescription.SetVisibility(false);
        LabelBestItemPrice.SetVisibility(false);
    }
    ItemStateBack.SetVisibility(HasBestWeaponItem);
    ItemStateView.VisibleGaugeBG = HasBestWeaponItem;
    ItemStateView.SetVisibility(HasBestWeaponItem);
    LabelBestItemOriginPrice.SetVisibility(bShowDiscount);
    LabelBestItemOriginPriceStrike.SetVisibility(bShowDiscount);
    //return;    
}

defaultproperties
{
    UseItemStateView=true
    fbImageBestItem=(X1=394.0000000,Y1=123.0000000,X2=1024.0000000,Y2=464.0000000)
    fbLabelBestItemName=(X1=405.0000000,Y1=133.0000000,X2=810.0000000,Y2=151.0000000)
    fbLabelBestItemPrice=(X1=405.0000000,Y1=473.0000000,X2=514.0000000,Y2=489.0000000)
    fbLabelBestItemOriginPrice=(X1=530.0000000,Y1=473.0000000,X2=614.0000000,Y2=489.0000000)
    fbCapsuleDescription=(X1=405.0000000,Y1=421.0000000,X2=690.0000000,Y2=466.0000000)
    fbItemStateBack=(X1=720.0000000,Y1=322.0000000,X2=1024.0000000,Y2=464.0000000)
    fbItemStateView=(X1=878.0000000,Y1=330.0000000,X2=1006.0000000,Y2=425.0000000)
    fbBestLeftButton=(X1=398.0000000,Y1=275.0000000,X2=418.0000000,Y2=315.0000000)
    fbBestRightButton=(X1=999.0000000,Y1=275.0000000,X2=1019.0000000,Y2=315.0000000)
    fbBuyButton=(X1=822.0000000,Y1=456.0000000,X2=1005.0000000,Y2=493.0000000)
    fbLabelIncludeHeader[0]=(X1=375.0000000,Y1=517.0000000,X2=464.0000000,Y2=531.0000000)
    fbLabelIncludeHeader[1]=(X1=375.0000000,Y1=534.0000000,X2=464.0000000,Y2=548.0000000)
    fbIncludeItemList=(X1=471.0000000,Y1=515.0000000,X2=1000.0000000,Y2=689.0000000)
    fbLabelWinners=(X1=51.0000000,Y1=708.0000000,X2=973.0000000,Y2=726.0000000)
    CurrentSelectedCapsuleIndex=-1
    OnPreDraw=BTTPLuckyShopCommon.OnPreDraw
}