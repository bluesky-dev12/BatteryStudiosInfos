class BTTPLuckyBlackBox extends BTTabPanelHK
    editinlinenew
    instanced;

const BLACKBOX_KEY_ITEMID = 17701;

var BTTcpLink_Channel TcpChannel;
var wGameManager GameMgr;
var wMatchMaker MM;
var export editinline BTOwnerDrawImageHK NewBackground;
var FloatBox fbLabelCapsuleName;
var FloatBox fbLabelCapsulePrice;
var export editinline BTOwnerDrawImageHK LabelCapsuleName;
var export editinline BTOwnerDrawImageHK LabelCapsulePrice;
var FloatBox fbImgBlackBoxKey;
var export editinline BTOwnerDrawImageHK ImgBlackBoxKey;
var FloatBox fbLabelHaveKey;
var FloatBox fbLabelHaveKeyNum;
var FloatBox fbLabelKeyName;
var FloatBox fbLabelKeyDesc[2];
var export editinline BTOwnerDrawImageHK LabelHaveKey;
var export editinline BTOwnerDrawImageHK LabelHaveKeyNum;
var export editinline BTOwnerDrawImageHK LabelKeyName;
var export editinline BTOwnerDrawImageHK LabelKeyDesc[2];
var FloatBox fbBuyKeyButton;
var FloatBox fbGiftKeyButton;
var export editinline BTOwnerDrawCaptionButtonHK BuyKeyButton;
var export editinline BTOwnerDrawCaptionButtonHK GiftKeyButton;
var export editinline BTTPLuckyShopCommon LuckyShopCommon;
var FloatBox fbComboBoxBlackBox;
var FloatBox fbBackgroundComboBoxBlackBox;
var export editinline BTOwnerDrawImageHK BackgroundComboBoxBlackBox;
var export editinline BTComboBoxHK ComboBoxBlackBox;
var array<int> BlackBoxIDList;
var int LastOpenBlackBoxID;
var BTROItemBoxHK RoBlackBoxKey;
var localized string strBuyBlackBoxKey;
var localized string strGiftBlackBoxKey;
var localized string strOpenBlackBox;
var localized string strLabelHaveKey;
var localized string strLabelHaveKeyNum;
var localized string strLabelKeyName;
var localized string strLabelKeyDesc[2];
var localized string strBlackBoxListItem;
var localized string strLabelIncludeHeader[2];
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
    NewBackground.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_BlackBoxBG_Img;
    AddLabel(ImgBlackBoxKey, fbImgBlackBoxKey);
    ImgBlackBoxKey.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BlackBoxKey;
    AddLabel(LabelHaveKey, fbLabelHaveKey, strLabelHaveKey, 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite(), 3);
    AddLabel(LabelHaveKeyNum, fbLabelHaveKeyNum, "", 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon(), 5);
    AddLabel(LabelKeyName, fbLabelKeyName, strLabelKeyName, 11, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN(), 4);
    i = 0;
    J0x178:

    // End:0x1C8 [Loop If]
    if(i < 2)
    {
        AddLabel(LabelKeyDesc[i], fbLabelKeyDesc[i], strLabelKeyDesc[i], 8, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite(), 4);
        ++i;
        // [Loop Continue]
        goto J0x178;
    }
    BuyKeyButton = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbBuyKeyButton, 0.5000000, self));
    BuyKeyButton.SetWaitRoomInfoBtnImage();
    BuyKeyButton.Caption = strBuyBlackBoxKey;
    BuyKeyButton.SetFontSizeAll(9);
    BuyKeyButton.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    BuyKeyButton.__OnClick__Delegate = OnClickBuyKey;
    LuckyShopCommon = BTTPLuckyShopCommon(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPLuckyShopCommon', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.5000000, self));
    LuckyShopCommon.BuyButton.Caption = strOpenBlackBox;
    i = 0;
    J0x2A6:

    // End:0x2E5 [Loop If]
    if(i < 2)
    {
        LuckyShopCommon.LabelIncludeHeader[i].Caption = strLabelIncludeHeader[i];
        ++i;
        // [Loop Continue]
        goto J0x2A6;
    }
    LuckyShopCommon.BuyButton.__OnClick__Delegate = OnClickOpen;
    LuckyShopCommon.BestLeftButton.__OnClick__Delegate = OnClickBestItemArrow;
    LuckyShopCommon.BestRightButton.__OnClick__Delegate = OnClickBestItemArrow;
    LuckyShopCommon.UseItemStateView = false;
    AddLabel(BackgroundComboBoxBlackBox, fbBackgroundComboBoxBlackBox);
    BackgroundComboBoxBlackBox.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Combo_New_Back_Blur;
    GiftKeyButton = NewButtonComponent(fbGiftKeyButton, 0.5000000);
    GiftKeyButton.Caption = strGiftBlackBoxKey;
    GiftKeyButton.SetFontSizeAll(9);
    GiftKeyButton.SetFontDrawType(4);
    GiftKeyButton.SetDefaultFontColor();
    GiftKeyButton.SetQuestReceiveRewardImage();
    GiftKeyButton.__OnClick__Delegate = OnClickGift;
    ComboBoxBlackBox = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboBoxBlackBox, 2.0000000));
    ComboBoxBlackBox.__OnChange__Delegate = OnChange_ComboBoxBlackBox;
    RoBlackBoxKey = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    RoBlackBoxKey.Init();
    RoBlackBoxKey.ItemInfo = GameMgr.FindUIItem(17701);
    RoBlackBoxKey.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    RoBlackBoxKey.SetGameManager(GameMgr);
    RoBlackBoxKey.SetMatchMaker(MM);
    RoBlackBoxKey.ChangeState(6);
    RoBlackBoxKey.Update();
    //return;    
}

function AddLabel(out BTOwnerDrawImageHK AddComponent, FloatBox fbComponent, optional string strCaption, optional int FontSize, optional Color TextColor, optional BTCustomDrawHK.DrawType dt)
{
    AddComponent = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbComponent, 0.5000000, self));
    AddComponent.Caption = strCaption;
    AddComponent.SetFontSizeAll(FontSize);
    AddComponent.SetFontColorAll(TextColor);
    AddComponent.SetFontDrawType(dt);
    //return;    
}

function InsertBlackboxData(out array<wItemBaseParam> OutArray, wItemBaseParam blackboxData)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < OutArray.Length)
    {
        // End:0x5D
        if(blackboxData.iInvenDisplayOrder < OutArray[i].iInvenDisplayOrder)
        {
            OutArray.Insert(i, 1);
            OutArray[i] = blackboxData;
            return;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    OutArray[OutArray.Length] = blackboxData;
    //return;    
}

function fill()
{
    local wItemBoxInstanceHK instanceInfo;
    local int i, comboIndex;
    local wItemBaseParam ItemParam;
    local array<wItemBaseParam> blackboxDataArray, blackboxNextDataArray;

    comboIndex = ComboBoxBlackBox.ComboBox.GetIndex();
    BlackBoxIDList.Length = 0;
    ComboBoxBlackBox.ComboBox.Clear();
    i = 0;
    J0x45:

    // End:0xB4 [Loop If]
    if(i < GameMgr.ItemParams.Length)
    {
        ItemParam = GameMgr.ItemParams[i];
        // End:0xAA
        if(GameMgr.CheckBlackbox(int(ItemParam.eType)))
        {
            InsertBlackboxData(blackboxDataArray, ItemParam);
        }
        i++;
        // [Loop Continue]
        goto J0x45;
    }
    i = 0;
    J0xBB:

    // End:0x18E [Loop If]
    if(i < blackboxDataArray.Length)
    {
        ItemParam = blackboxDataArray[i];
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ItemParam.iItemID);
        // End:0x172
        if(instanceInfo != none)
        {
            BlackBoxIDList[BlackBoxIDList.Length] = ItemParam.iItemID;
            ComboBoxBlackBox.ComboBox.AddItem(Class'Engine.BTCustomDrawHK'.static.FormatString(strBlackBoxListItem, ItemParam.strDisplayName, string(instanceInfo.OverlapCount)));
            // [Explicit Continue]
            goto J0x184;
        }
        blackboxNextDataArray[blackboxNextDataArray.Length] = ItemParam;
        J0x184:

        i++;
        // [Loop Continue]
        goto J0xBB;
    }
    i = 0;
    J0x195:

    // End:0x218 [Loop If]
    if(i < blackboxNextDataArray.Length)
    {
        ItemParam = blackboxNextDataArray[i];
        BlackBoxIDList[BlackBoxIDList.Length] = ItemParam.iItemID;
        ComboBoxBlackBox.ComboBox.AddItem(Class'Engine.BTCustomDrawHK'.static.FormatString(strBlackBoxListItem, ItemParam.strDisplayName, string(0)));
        i++;
        // [Loop Continue]
        goto J0x195;
    }
    comboIndex = Max(comboIndex, 0);
    ComboBoxBlackBox.ComboBox.SetIndex(comboIndex);
    OnChange_ComboBoxBlackBox(none);
    LastOpenBlackBoxID = BlackBoxIDList[0];
    LabelHaveKeyNum.Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strLabelHaveKeyNum, string(GetBlackBoxKeyCount()));
    // End:0x2DC
    if(RoBlackBoxKey.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(RoBlackBoxKey.ItemInfo, RoBlackBoxKey.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
    }
    // End:0x341
    if(RoBlackBoxKey.instanceInfo.cashItemInfo != none)
    {
        // End:0x32F
        if(RoBlackBoxKey.instanceInfo.cashItemInfo.bWZCanGift)
        {
            GiftKeyButton.EnableMe();            
        }
        else
        {
            GiftKeyButton.DisableMe();
        }        
    }
    else
    {
        GiftKeyButton.DisableMe();
    }
    //return;    
}

function OnChange_ComboBoxBlackBox(GUIComponent Sender)
{
    local int comboIndex;

    comboIndex = ComboBoxBlackBox.ComboBox.GetIndex();
    LastOpenBlackBoxID = BlackBoxIDList[comboIndex];
    LuckyShopCommon.ChangeViewItem(BlackBoxIDList[comboIndex]);
    LuckyShopCommon.CheckBestItemArrowEnable(comboIndex, 0, BlackBoxIDList.Length, BlackBoxIDList.Length);
    //return;    
}

function bool OnClickBestItemArrow(GUIComponent Sender)
{
    local int TargetIndex;
    local export editinline BTOwnerDrawCaptionButtonHK senderButton;

    senderButton = BTOwnerDrawCaptionButtonHK(Sender);
    TargetIndex = ComboBoxBlackBox.ComboBox.GetIndex();
    // End:0x4C
    if(senderButton.ButtonID == 0)
    {
        --TargetIndex;        
    }
    else
    {
        // End:0x67
        if(senderButton.ButtonID == 1)
        {
            ++TargetIndex;
        }
    }
    // End:0xA1
    if((TargetIndex >= 0) && TargetIndex < BlackBoxIDList.Length)
    {
        ComboBoxBlackBox.ComboBox.SetIndex(TargetIndex);
    }
    return true;
    //return;    
}

function bool OnClickBuyKey(GUIComponent Sender)
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
    local wItemBoxCashHK cii;

    // End:0x0D
    if(!bAcceptsInput)
    {
        return false;
    }
    cii = RoBlackBoxKey.instanceInfo.cashItemInfo;
    // End:0x79
    if(cii != none)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, RoBlackBoxKey, _buyType);
        BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;        
    }
    else
    {
        ShowItemBuyWindow(RoBlackBoxKey, _buyType, 0);
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

function bool OnClickOpen(GUIComponent Sender)
{
    local int comboIndex, blackBoxKeyCount;
    local wItemBoxInstanceHK blackBoxInstanceInfo;

    // End:0x0D
    if(!bAcceptsInput)
    {
        return false;
    }
    comboIndex = ComboBoxBlackBox.ComboBox.GetIndex();
    blackBoxKeyCount = GetBlackBoxKeyCount();
    // End:0x182
    if((comboIndex >= 0) && comboIndex < BlackBoxIDList.Length)
    {
        comboIndex = ComboBoxBlackBox.ComboBox.GetIndex();
        blackBoxInstanceInfo = GameMgr.FindFirstInstanceItemByItemID(BlackBoxIDList[comboIndex]);
        // End:0x169
        if((blackBoxInstanceInfo != none) && blackBoxInstanceInfo.OverlapCount > 0)
        {
            // End:0x150
            if(blackBoxKeyCount > 0)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleOpen");
                BTWindowCapsuleOpen(Controller.TopPage()).FillCapsule(false);
                BTWindowCapsuleOpen(Controller.TopPage()).Initialize(BlackBoxIDList[comboIndex], GetBlackBoxKeyUniqueID(), TcpChannel, GameMgr);                
            }
            else
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 230);
            }            
        }
        else
        {
            Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 816);
        }
    }
    return true;
    //return;    
}

function int GetBlackBoxKeyCount()
{
    local wItemBoxInstanceHK blackBoxKeyInstanceInfo;

    blackBoxKeyInstanceInfo = GameMgr.FindFirstInstanceItemByItemID(17701);
    return blackBoxKeyInstanceInfo.OverlapCount;
    //return;    
}

function BtrDouble GetBlackBoxKeyUniqueID()
{
    local wItemBoxInstanceHK blackBoxKeyInstanceInfo;

    blackBoxKeyInstanceInfo = GameMgr.FindFirstInstanceItemByItemID(17701);
    return blackBoxKeyInstanceInfo.UniqueID;
    //return;    
}

defaultproperties
{
    fbImgBlackBoxKey=(X1=0.0000000,Y1=264.0000000,X2=347.0000000,Y2=504.0000000)
    fbLabelHaveKey=(X1=54.0000000,Y1=188.0000000,X2=212.0000000,Y2=203.0000000)
    fbLabelHaveKeyNum=(X1=249.0000000,Y1=188.0000000,X2=340.0000000,Y2=203.0000000)
    fbLabelKeyName=(X1=80.0000000,Y1=235.0000000,X2=295.0000000,Y2=250.0000000)
    fbLabelKeyDesc[0]=(X1=9.0000000,Y1=514.0000000,X2=344.0000000,Y2=527.0000000)
    fbLabelKeyDesc[1]=(X1=9.0000000,Y1=530.0000000,X2=344.0000000,Y2=543.0000000)
    fbBuyKeyButton=(X1=21.0000000,Y1=554.0000000,X2=204.0000000,Y2=591.0000000)
    fbGiftKeyButton=(X1=209.0000000,Y1=554.0000000,X2=333.0000000,Y2=591.0000000)
    fbComboBoxBlackBox=(X1=441.0000000,Y1=448.0000000,X2=807.0000000,Y2=477.0000000)
    fbBackgroundComboBoxBlackBox=(X1=435.0000000,Y1=442.0000000,X2=814.0000000,Y2=484.0000000)
    strBuyBlackBoxKey="Buy"
    strGiftBlackBoxKey="Gift"
    strOpenBlackBox="Open instantly"
    strLabelHaveKey="Owned keys"
    strLabelHaveKeyNum="%0 total"
    strLabelKeyName="Fortune Box Key"
    strLabelKeyDesc[0]="This item is used to open a Fortune Box."
    strLabelKeyDesc[1]="One key can open one Fortune Box."
    strBlackBoxListItem="%0 (%1 owned)"
    strLabelIncludeHeader[0]="Fortune Box"
    strLabelIncludeHeader[1]="Item List"
}