class BTTPLuckyCapsuleInventory extends GUITabPanel
    editinlinenew
    instanced;

const HorzCount = 5;

var BTTcpLink_Channel TcpChannel;
var wGameManager GameMgr;
var wMatchMaker MM;
var export editinline BTOwnerDrawImageHK NewBackground;
var FloatBox fbCapsuleTitle;
var FloatBox fbCapsuleList;
var FloatBox fbCapsuleLeftButton;
var FloatBox fbCapsuleRightButton;
var FloatBox fbRewardTitle;
var FloatBox fbRewardList;
var FloatBox fbRewardLeftButton;
var FloatBox fbRewardRightButton;
var FloatBox fbCouponTitle;
var FloatBox fbCouponList;
var FloatBox fbCouponLeftButton;
var FloatBox fbCouponRightButton;
var export editinline BTListWithButton CapsuleList;
var export editinline BTListWithButton RewardList;
var export editinline BTListWithButton CouponList;
var FloatBox fbCapsuleDesc;
var FloatBox fbRewardDesc;
var FloatBox fbCouponDesc;
var export editinline BTOwnerDrawImageHK CapsuleDesc;
var export editinline BTOwnerDrawImageHK RewardDesc;
var export editinline BTOwnerDrawImageHK CouponDesc;
var FloatBox fbRewardCenterText;
var FloatBox fbCouponCenterText;
var FloatBox fbCapsuleRemainNameStart;
var FloatBox fbCapsuleRemainCountStart;
var export editinline BTOwnerDrawImageHK CapsuleRemainName[5];
var export editinline BTOwnerDrawImageHK CapsuleRemainCount[5];
var FloatBox fbUseCapsuleButtonStart;
var FloatBox fbCapsuleRewardButtonStart;
var FloatBox fbUseCouponButtonStart;
var export editinline BTOwnerDrawCaptionButtonHK UseCapsuleButton[5];
var export editinline BTOwnerDrawCaptionButtonHK CapsuleRewardButton[5];
var export editinline BTOwnerDrawCaptionButtonHK UseCouponButton[5];
var BTROIncludeItemPopup IncludeItemPopup;
var int BuyingCapsuleCount;
var export editinline BTOwnerDrawCaptionButtonHK LastClickedRewardButton;
var localized string strCapsuleTitle;
var localized string strRewardTitle;
var localized string strCouponTitle;
var localized string strCapsuleDesc;
var localized string strRewardDesc;
var localized string strCouponDesc;
var localized string strCapsuleRemainName;
var localized string strCapsuleRemainCount;
var localized string strUseCapsuleButton;
var localized string strCapsuleBuyRewardButton;
var localized string strCouponRewardButton;
var localized string strCapsuleBuyRewardInfo;
var localized string strCouponRewardInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fbButton, fbText;

    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    NewBackground = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 1024.0000000, 768.0000000), 0.5000000, self));
    NewBackground.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_CapsuleInventoryBG_Img;
    AddLabel(CapsuleDesc, fbCapsuleDesc, strCapsuleDesc, 9, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultGrayMoreWhite(), 3);
    CapsuleList = BTListWithButton(NewComponent(new Class'GUIWarfareControls_Decompressed.BTListWithButton', fbCapsuleList, 0.5000000, self));
    CapsuleList.Initialize(MyController, myOwner, false, 5, fbCapsuleList, fbCapsuleLeftButton, fbCapsuleRightButton, strCapsuleTitle, false, true, fbCapsuleTitle);
    CapsuleList.ItemWidth = 180;
    CapsuleList.FixedWidth = -15;
    CapsuleList.TitleText.FontSize = 13;
    CapsuleList.TitleText.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    CapsuleList.__ChangeItemList__Delegate = ChangeCapsuleList;
    AddLabel(RewardDesc, fbRewardDesc, strRewardDesc, 9, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultGrayMoreWhite(), 3);
    RewardList = BTListWithButton(NewComponent(new Class'GUIWarfareControls_Decompressed.BTListWithButton', fbRewardList, 0.5000000, self));
    RewardList.Initialize(MyController, myOwner, false, 5, fbRewardList, fbRewardLeftButton, fbRewardRightButton, "", false, true, fbRewardTitle);
    RewardList.ItemWidth = 180;
    RewardList.FixedWidth = -15;
    RewardList.TitleText.FontSize = 13;
    RewardList.TitleText.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
    RewardList.__ChangeItemList__Delegate = ChangeRewardList;
    AddLabel(CouponDesc, fbCouponDesc, strCouponDesc, 9, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultGrayMoreWhite(), 3);
    CouponList = BTListWithButton(NewComponent(new Class'GUIWarfareControls_Decompressed.BTListWithButton', fbCouponList, 0.5000000, self));
    CouponList.Initialize(MyController, myOwner, false, 5, fbCouponList, fbCouponLeftButton, fbCouponRightButton, "", false, true, fbCouponTitle);
    CouponList.ItemWidth = 180;
    CouponList.FixedWidth = -15;
    CouponList.TitleText.FontSize = 13;
    CouponList.TitleText.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
    CouponList.__ChangeItemList__Delegate = ChangeCouponList;
    i = 0;
    J0x3B2:

    // End:0x6D6 [Loop If]
    if(i < 5)
    {
        fbText = fbCapsuleRemainNameStart;
        fbText.X1 = fbCapsuleRemainNameStart.X1 + float(i * 180);
        fbText.X2 = fbText.X1 + (fbCapsuleRemainNameStart.X2 - fbCapsuleRemainNameStart.X1);
        AddLabel(CapsuleRemainName[i], fbText, strCapsuleRemainName, 9, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite(), 3);
        fbText = fbCapsuleRemainCountStart;
        fbText.X1 = fbCapsuleRemainCountStart.X1 + float(i * 180);
        fbText.X2 = fbText.X1 + (fbCapsuleRemainCountStart.X2 - fbCapsuleRemainCountStart.X1);
        AddLabel(CapsuleRemainCount[i], fbText, "", 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite(), 3);
        fbButton = fbUseCapsuleButtonStart;
        fbButton.X1 = fbUseCapsuleButtonStart.X1 + float(i * 180);
        fbButton.X2 = fbButton.X1 + (fbUseCapsuleButtonStart.X2 - fbUseCapsuleButtonStart.X1);
        AddButton(UseCapsuleButton[i], fbButton, strUseCapsuleButton, 9);
        UseCapsuleButton[i].ButtonID = i;
        UseCapsuleButton[i].__OnClick__Delegate = OnClickUse;
        fbButton = fbCapsuleRewardButtonStart;
        fbButton.X1 = fbCapsuleRewardButtonStart.X1 + float(i * 180);
        fbButton.X2 = fbButton.X1 + (fbCapsuleRewardButtonStart.X2 - fbCapsuleRewardButtonStart.X1);
        AddButton(CapsuleRewardButton[i], fbButton, strCapsuleBuyRewardButton, 9);
        CapsuleRewardButton[i].ButtonID = i;
        CapsuleRewardButton[i].__OnClick__Delegate = OnClickReward;
        fbButton = fbUseCouponButtonStart;
        fbButton.X1 = fbUseCouponButtonStart.X1 + float(i * 180);
        fbButton.X2 = fbButton.X1 + (fbUseCouponButtonStart.X2 - fbUseCouponButtonStart.X1);
        AddButton(UseCouponButton[i], fbButton, strCouponRewardButton, 9);
        UseCouponButton[i].ButtonID = i;
        UseCouponButton[i].__OnClick__Delegate = OnClickCoupon;
        ++i;
        // [Loop Continue]
        goto J0x3B2;
    }
    FillCapsule();
    IncludeItemPopup = new Class'GUIWarfareControls_Decompressed.BTROIncludeItemPopup';
    IncludeItemPopup.Init();
    IncludeItemPopup.SetDefaultLimitPos(MyController);
    IncludeItemPopup.LimitPos.Y1 = 157.0000000;
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

function AddButton(out BTOwnerDrawCaptionButtonHK AddButton, FloatBox fbButton, string strCaption, int FontSize)
{
    AddButton = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButton, 0.5000000, self));
    AddButton.Caption = strCouponRewardButton;
    AddButton.SetDefaultButtonImage();
    AddButton.SetDefaultFontColor();
    AddButton.SetFontSizeAll(FontSize);
    AddButton.Caption = strCaption;
    AddButton.CaptionDrawType = 4;
    //return;    
}

function FillCapsule()
{
    local wItemBoxInstanceHK instanceInfo;
    local int i;
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;

    CapsuleList.ClearItem();
    i = 0;
    J0x16:

    // End:0x1C8 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        // End:0x1BE
        if((ItemInfo != none) && ItemInfo.ItemType == int(GameMgr.37))
        {
            ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            ro.Init();
            ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ro.instanceInfo = instanceInfo;
            ro.ChangeState(23);
            ro.CheckScrollItemName = true;
            // End:0x173
            if(ro.ItemInfo.IsCashItem() == true)
            {
                GameMgr.AddCashItem(ro.ItemInfo, ro.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
            }
            ro.SetMatchMaker(MM);
            ro.SetGameManager(GameMgr);
            ro.Update();
            CapsuleList.AddRenderObject(ro);
        }
        ++i;
        // [Loop Continue]
        goto J0x16;
    }
    CapsuleList.ItemList.LastSelected = 0;
    RefreshUseCapsuleButton();
    //return;    
}

private function FillReward(int _buyingCapsuleCount, int _capsuleRewardState)
{
    local int i, isUsed, bitFlag;
    local wCapsuleRewardParam RewardParam;
    local BTRORewardDecorate ro;
    local array<BTRORewardDecorate> addRewardList, addCouponList;

    RewardList.ClearItem();
    CouponList.ClearItem();
    BuyingCapsuleCount = _buyingCapsuleCount;
    i = 0;
    J0x30:

    // End:0x291 [Loop If]
    if(i < GameMgr.CapsuleRewardParams.Length)
    {
        RewardParam = GameMgr.CapsuleRewardParams[i];
        // End:0x287
        if(RewardParam.rewardType != int(RewardParam.2))
        {
            ro = new Class'GUIWarfareControls_Decompressed.BTRORewardDecorate';
            ro.Init();
            // End:0x1B6
            if(RewardParam.rewardType == int(RewardParam.0))
            {
                bitFlag = 1 << RewardParam.RewardUniqueIndex;
                isUsed = _capsuleRewardState & bitFlag;
                ro.SetItemData(RewardParam.Reward_ID, RewardParam.RewardUniqueIndex, RewardParam.RewardNeedNum, Class'Engine.BTCustomDrawHK'.static.FormatString(strCapsuleBuyRewardInfo, string(RewardParam.RewardNeedNum)), isUsed == 0);
                ro.SetCenterText(9, fbRewardCenterText, string(RewardParam.RewardNeedNum));
                ro.SetBackImage(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Item_RW_buycount);
                ro.DrawAlreadyInfo = true;
                InserItemCheckNeedNum(addRewardList, ro);
                // [Explicit Continue]
                goto J0x287;
            }
            // End:0x287
            if(RewardParam.rewardType == int(RewardParam.1))
            {
                ro.SetItemData(RewardParam.Reward_ID, RewardParam.RewardUniqueIndex, RewardParam.RewardNeedNum, Class'Engine.BTCustomDrawHK'.static.FormatString(strCouponRewardInfo, string(RewardParam.RewardNeedNum)), true);
                ro.SetCenterText(19, fbCouponCenterText, string(RewardParam.RewardNeedNum));
                ro.SetBackImage(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Item_RW_coupon);
                InserItemCheckNeedNum(addCouponList, ro);
            }
        }
        J0x287:

        ++i;
        // [Loop Continue]
        goto J0x30;
    }
    i = 0;
    J0x298:

    // End:0x2CC [Loop If]
    if(i < addRewardList.Length)
    {
        RewardList.AddRenderObject(addRewardList[i]);
        ++i;
        // [Loop Continue]
        goto J0x298;
    }
    i = 0;
    J0x2D3:

    // End:0x307 [Loop If]
    if(i < addCouponList.Length)
    {
        CouponList.AddRenderObject(addCouponList[i]);
        ++i;
        // [Loop Continue]
        goto J0x2D3;
    }
    RewardList.TitleText.Text = Class'Engine.BTCustomDrawHK'.static.FormatString(strRewardTitle, string(BuyingCapsuleCount));
    RefreshRewardButton();
    RefreshCouponButton();
    //return;    
}

function RefreshAllButton()
{
    RefreshUseCapsuleButton();
    RefreshRewardButton();
    RefreshCouponButton();
    //return;    
}

function RefreshUseCapsuleButton()
{
    local int i;
    local BTROItemBoxHK roItemBox;

    i = 0;
    J0x07:

    // End:0x123 [Loop If]
    if(i < 5)
    {
        roItemBox = BTROItemBoxHK(CapsuleList.DataList[CapsuleList.ItemList.Top + i]);
        // End:0xDA
        if(roItemBox != none)
        {
            CapsuleRemainName[i].Show();
            CapsuleRemainCount[i].Show();
            CapsuleRemainCount[i].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strCapsuleRemainCount, string(roItemBox.instanceInfo.OverlapCount));
            UseCapsuleButton[i].EnableMe();
            // [Explicit Continue]
            goto J0x119;
        }
        CapsuleRemainName[i].Hide();
        CapsuleRemainCount[i].Hide();
        UseCapsuleButton[i].DisableMe();
        J0x119:

        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RefreshRewardButton()
{
    local int i;
    local BTRORewardDecorate roReward;

    i = 0;
    J0x07:

    // End:0xBB [Loop If]
    if(i < 5)
    {
        roReward = BTRORewardDecorate(RewardList.DataList[RewardList.ItemList.Top + i]);
        // End:0x9C
        if(((roReward != none) && roReward.EnableItem) && BuyingCapsuleCount >= roReward.RewardNeedNum)
        {
            CapsuleRewardButton[i].EnableMe();
            // [Explicit Continue]
            goto J0xB1;
        }
        CapsuleRewardButton[i].DisableMe();
        J0xB1:

        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RefreshCouponButton()
{
    local int i;
    local BTRORewardDecorate roReward;
    local wItemBoxInstanceHK capsuleInstanceInfo;

    capsuleInstanceInfo = GameMgr.FindFirstInstanceItemByItemType(int(GameMgr.39));
    i = 0;
    J0x29:

    // End:0x138 [Loop If]
    if(i < 5)
    {
        roReward = BTRORewardDecorate(CouponList.DataList[CouponList.ItemList.Top + i]);
        // End:0xD3
        if(roReward != none)
        {
            BTRORewardDecorate(CouponList.DataList[CouponList.ItemList.Top + i]).EnableItem = capsuleInstanceInfo.OverlapCount >= roReward.RewardNeedNum;
        }
        // End:0x119
        if((roReward != none) && capsuleInstanceInfo.OverlapCount >= roReward.RewardNeedNum)
        {
            UseCouponButton[i].EnableMe();
            // [Explicit Continue]
            goto J0x12E;
        }
        UseCouponButton[i].DisableMe();
        J0x12E:

        ++i;
        // [Loop Continue]
        goto J0x29;
    }
    CouponList.TitleText.Text = Class'Engine.BTCustomDrawHK'.static.FormatString(strCouponTitle, string(capsuleInstanceInfo.OverlapCount));
    //return;    
}

function bool OnClickUse(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK clickedButton;
    local BTROItemBoxHK roItemBox;

    clickedButton = BTOwnerDrawCaptionButtonHK(Sender);
    roItemBox = BTROItemBoxHK(CapsuleList.DataList[CapsuleList.ItemList.Top + clickedButton.ButtonID]);
    // End:0xF7
    if(roItemBox != none)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleOpen");
        BTWindowCapsuleOpen(Controller.TopPage()).FillCapsule(true);
        BTWindowCapsuleOpen(Controller.TopPage()).Initialize(roItemBox.ItemInfo.ItemID, EmptyBtrDouble(), TcpChannel, GameMgr);
    }
    return true;
    //return;    
}

function bool OnClickReward(GUIComponent Sender)
{
    local BTRORewardDecorate roReward;

    LastClickedRewardButton = BTOwnerDrawCaptionButtonHK(Sender);
    roReward = BTRORewardDecorate(RewardList.DataList[RewardList.ItemList.Top + LastClickedRewardButton.ButtonID]);
    // End:0x7F
    if(roReward != none)
    {
        TcpChannel.sfReqItemListInItemBox(__NFUN_921__(0), roReward.ItemID, 1);
    }
    return true;
    //return;    
}

function bool OnClickCoupon(GUIComponent Sender)
{
    local BTRORewardDecorate roReward;

    LastClickedRewardButton = BTOwnerDrawCaptionButtonHK(Sender);
    roReward = BTRORewardDecorate(CouponList.DataList[CouponList.ItemList.Top + LastClickedRewardButton.ButtonID]);
    // End:0x7F
    if(roReward != none)
    {
        TcpChannel.sfReqItemListInItemBox(__NFUN_921__(0), roReward.ItemID, 2);
    }
    return true;
    //return;    
}

function bool BTWindowItemBoxHK_OnOK(GUIComponent Sender)
{
    local BTRORewardDecorate roReward;
    local export editinline BTWindowItemBoxHK BTWindow;

    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    // End:0x72
    if(BTWindow.FromContent == 1)
    {
        roReward = BTRORewardDecorate(RewardList.DataList[RewardList.ItemList.Top + LastClickedRewardButton.ButtonID]);        
    }
    else
    {
        // End:0xC8
        if(BTWindow.FromContent == 2)
        {
            roReward = BTRORewardDecorate(CouponList.DataList[CouponList.ItemList.Top + LastClickedRewardButton.ButtonID]);
        }
    }
    Controller.CloseMenu(false);
    ShowWaitWindow();
    // End:0x1A7
    if(roReward != none)
    {
        // End:0x149
        if(BTWindow.FromContent == 1)
        {
            TcpChannel.sfReqLuckShop_RewardBuyingCount(roReward.RewardNeedNum, BTWindow.BoxItemID, BTWindow.GetLastSelectItemID(), BTWindow.GetLastSelectPartID());            
        }
        else
        {
            // End:0x1A7
            if(BTWindow.FromContent == 2)
            {
                TcpChannel.sfReqLuckShop_RewardCoupon(roReward.RewardNeedNum, BTWindow.BoxItemID, BTWindow.GetLastSelectItemID(), BTWindow.GetLastSelectPartID());
            }
        }
    }
    return true;
    //return;    
}

function ChangeCapsuleList()
{
    RefreshUseCapsuleButton();
    //return;    
}

function ChangeRewardList()
{
    RefreshRewardButton();
    //return;    
}

function ChangeCouponList()
{
    RefreshCouponButton();
    //return;    
}

function SetCapsuleRewardInfo(int _buyingCapsuleCount, int _capsuleRewardState)
{
    FillReward(_buyingCapsuleCount, _capsuleRewardState);
    //return;    
}

function ShowWaitWindow()
{
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 229);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = WaitWindow_OnTimeOut;
    //return;    
}

function WaitWindow_OnTimeOut(GUIComponent Sender)
{
    // End:0x41
    if(BTWindowDefineInfoHK(Controller.TopPage()) != none)
    {
        BTWindowDefineInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
    }
    //return;    
}

function InserItemCheckNeedNum(out array<Object> insertList, BTRORewardDecorate inserItem)
{
    local int i;
    local bool bAdded;

    bAdded = false;
    i = 0;
    J0x0F:

    // End:0x7D [Loop If]
    if(i < insertList.Length)
    {
        // End:0x73
        if(inserItem.RewardNeedNum < BTRORewardDecorate(insertList[i]).RewardNeedNum)
        {
            bAdded = true;
            insertList.Insert(i, 1);
            insertList[i] = inserItem;
            // [Explicit Break]
            goto J0x7D;
        }
        ++i;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x7D:

    // End:0x9A
    if(!bAdded)
    {
        insertList[insertList.Length] = inserItem;
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    // End:0x39
    if(bVisible)
    {
        CheckCapsulePopup(C, CapsuleList);
        CheckRewardPopup(C, RewardList);
        CheckRewardPopup(C, CouponList);
    }
    //return;    
}

function CheckCapsulePopup(Canvas C, BTListWithButton checkList)
{
    local int i;
    local BTROItemBoxHK roItemBox;

    i = 0;
    J0x07:

    // End:0x10F [Loop If]
    if(i < 5)
    {
        // End:0x80
        if((checkList.ItemList.Top + i) < checkList.DataList.Length)
        {
            roItemBox = BTROItemBoxHK(checkList.DataList[checkList.ItemList.Top + i]);            
        }
        else
        {
            roItemBox = none;
        }
        // End:0x105
        if((roItemBox != none) && roItemBox.bMouseOn)
        {
            IncludeItemPopup.SetPivotPos(roItemBox.AWinPos);
            IncludeItemPopup.SetBoxData(roItemBox.ItemInfo.ItemID, GameMgr);
            IncludeItemPopup.Render(C);
            // [Explicit Break]
            goto J0x10F;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    J0x10F:

    //return;    
}

function CheckRewardPopup(Canvas C, BTListWithButton checkList)
{
    local int i;
    local BTRORewardDecorate roReward;

    i = 0;
    J0x07:

    // End:0x12D [Loop If]
    if(i < 5)
    {
        // End:0x80
        if((checkList.ItemList.Top + i) < checkList.DataList.Length)
        {
            roReward = BTRORewardDecorate(checkList.DataList[checkList.ItemList.Top + i]);            
        }
        else
        {
            roReward = none;
        }
        // End:0x123
        if((roReward != none) && roReward.bMouseOn)
        {
            IncludeItemPopup.SetPivotPos(roReward.AWinPos);
            IncludeItemPopup.SetBoxData(roReward.ItemID, GameMgr);
            IncludeItemPopup.ItemImage.Image = roReward.BackImage.Image;
            IncludeItemPopup.Render(C);
            // [Explicit Break]
            goto J0x12D;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    J0x12D:

    //return;    
}

defaultproperties
{
    fbCapsuleTitle=(X1=73.0000000,Y1=157.0000000,X2=309.0000000,Y2=175.0000000)
    fbCapsuleList=(X1=69.0000000,Y1=186.0000000,X2=969.0000000,Y2=274.0000000)
    fbCapsuleLeftButton=(X1=17.0000000,Y1=218.0000000,X2=47.0000000,Y2=278.0000000)
    fbCapsuleRightButton=(X1=976.0000000,Y1=218.0000000,X2=1006.0000000,Y2=278.0000000)
    fbRewardTitle=(X1=73.0000000,Y1=368.0000000,X2=309.0000000,Y2=386.0000000)
    fbRewardList=(X1=69.0000000,Y1=397.0000000,X2=969.0000000,Y2=485.0000000)
    fbRewardLeftButton=(X1=17.0000000,Y1=429.0000000,X2=47.0000000,Y2=489.0000000)
    fbRewardRightButton=(X1=976.0000000,Y1=429.0000000,X2=1006.0000000,Y2=489.0000000)
    fbCouponTitle=(X1=73.0000000,Y1=557.0000000,X2=309.0000000,Y2=575.0000000)
    fbCouponList=(X1=69.0000000,Y1=586.0000000,X2=969.0000000,Y2=674.0000000)
    fbCouponLeftButton=(X1=17.0000000,Y1=618.0000000,X2=47.0000000,Y2=678.0000000)
    fbCouponRightButton=(X1=976.0000000,Y1=618.0000000,X2=1006.0000000,Y2=678.0000000)
    fbCapsuleDesc=(X1=341.0000000,Y1=156.0000000,X2=969.0000000,Y2=169.0000000)
    fbRewardDesc=(X1=341.0000000,Y1=367.0000000,X2=969.0000000,Y2=380.0000000)
    fbCouponDesc=(X1=341.0000000,Y1=556.0000000,X2=969.0000000,Y2=569.0000000)
    fbRewardCenterText=(X1=64.0000000,Y1=30.0000000,X2=86.0000000,Y2=43.0000000)
    fbCouponCenterText=(X1=45.0000000,Y1=23.0000000,X2=106.0000000,Y2=44.0000000)
    fbCapsuleRemainNameStart=(X1=67.0000000,Y1=283.0000000,X2=163.0000000,Y2=296.0000000)
    fbCapsuleRemainCountStart=(X1=67.0000000,Y1=298.0000000,X2=163.0000000,Y2=316.0000000)
    fbUseCapsuleButtonStart=(X1=168.0000000,Y1=283.0000000,X2=236.0000000,Y2=320.0000000)
    fbCapsuleRewardButtonStart=(X1=168.0000000,Y1=494.0000000,X2=236.0000000,Y2=531.0000000)
    fbUseCouponButtonStart=(X1=168.0000000,Y1=683.0000000,X2=236.0000000,Y2=720.0000000)
    strCapsuleTitle="Box Storage"
    strRewardTitle="Buy streak reward : %0 times"
    strCouponTitle="Ticket reward : %0 ea"
    strCapsuleDesc="Storage slot for purchased Supply Boxes."
    strRewardDesc="Rewards for achieving Supply Box buy streak."
    strCouponDesc="Rewards for achieving Ticket buy streak."
    strCapsuleRemainName="Amount"
    strCapsuleRemainCount="%0 ea"
    strUseCapsuleButton="Open"
    strCapsuleBuyRewardButton="Receive"
    strCouponRewardButton="Receive"
    strCapsuleBuyRewardInfo="Purchased Supply Box %0 times"
    strCouponRewardInfo="Purchased %0 Tickets"
    OnRendered=BTTPLuckyCapsuleInventory.Internal_OnRendered
}