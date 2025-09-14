class BTWindowCapsuleGet extends BTWindowRandBoxHK
    editinlinenew
    instanced;

const BLACKBOX_KEY_ITEMID = 17701;

var wGameManager GameMgr;
var wMatchMaker MM;
var BTTcpLink_Channel TcpChannel;
var int KeyCount;
var BtrDouble KeyUniqueID;
var FloatBox fbButtonUseCapsule;
var FloatBox fbButtonInventory;
var export editinline BTOwnerDrawCaptionButtonHK ButtonUseCapsule;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInventory;
var FloatBox fbComboBoxCapsule;
var FloatBox fbBackgroundComboBoxCapsule;
var export editinline BTComboCapsuleData ComboCapsuleData;
var FloatBox fbLabelDesc;
var FloatBox fbLabelRemainName;
var FloatBox fbLabelReOpen;
var FloatBox fbImgRemainBackground;
var export editinline BTOwnerDrawImageHK LabelDesc;
var export editinline BTOwnerDrawImageHK LabelRemainName;
var export editinline BTOwnerDrawImageHK LabelReOpen;
var export editinline BTOwnerDrawImageHK ImgRemainBackground;
var string strSoundShake;
var string strSoundLose;
var string strSoundEffect;
var string strSoundWin;
var localized string strOpening;
var localized string strCongratulation;
var localized string strRemainName;
var localized string strReOpen;
var localized string strUseCapsule;
var localized string strInventory;
var localized string strBestItemGet[2];
//var delegate<ClickInventory> __ClickInventory__Delegate;
//var delegate<ClickShowCashChargeWindow> __ClickShowCashChargeWindow__Delegate;

delegate ClickInventory()
{
    //return;    
}

delegate ClickShowCashChargeWindow()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Capsule_Get;
    LabelDesc = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelDesc, 0.5000000, self));
    LabelDesc.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelDesc.SetFontSizeAll(10);
    LabelDesc.SetFontDrawType(4);
    LabelReOpen = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelReOpen, 0.5000000, self));
    LabelReOpen.Caption = strReOpen;
    LabelReOpen.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelReOpen.SetFontSizeAll(9);
    LabelReOpen.SetFontDrawType(4);
    ImgRemainBackground = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbImgRemainBackground, 0.5000000, self));
    ImgRemainBackground.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Capsule_Get_RemainBG;
    LabelRemainName = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelRemainName, 0.5000000, self));
    LabelRemainName.Caption = strRemainName;
    LabelRemainName.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN());
    LabelRemainName.SetFontSizeAll(11);
    LabelRemainName.SetFontDrawType(4);
    ButtonUseCapsule = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButtonUseCapsule, 0.5000000, self));
    ButtonInventory = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButtonInventory, 0.5000000, self));
    ButtonUseCapsule.SetDefaultButtonImage();
    ButtonUseCapsule.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Cash_Btn_mid_n;
    ComboCapsuleData = BTComboCapsuleData(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboCapsuleData', fbBackgroundComboBoxCapsule, 0.5000000, self));
    ComboCapsuleData.SetSize(fbBackgroundComboBoxCapsule, fbComboBoxCapsule);
    ComboCapsuleData.ComboBoxCapsule.DisableMe();
    ComboCapsuleData.__ChangeComboBox__Delegate = ChangeComboBox;
    ButtonInventory.SetDefaultButtonImage();
    ButtonUseCapsule.Caption = strUseCapsule;
    ButtonInventory.Caption = strInventory;
    ButtonUseCapsule.__OnClick__Delegate = InternalOnUseCapsule;
    ButtonInventory.__OnClick__Delegate = InternalOnInventory;
    ImgRemainBackground.Hide();
    LabelRemainName.Hide();
    LabelReOpen.Hide();
    ComboCapsuleData.Hide();
    ButtonUseCapsule.DisableMe();
    ButtonInventory.DisableMe();
    i = 0;
    J0x3C7:

    // End:0x45E [Loop If]
    if(i < 3)
    {
        itemBox[i].itemBox.RandEndAniType();
        itemBox[i].itemBox.bRenderInfo = false;
        itemBox[i].itemBox.bShowGrade = false;
        itemBox[i].itemBox.__OnNextRoll__Delegate = Internal_OnNextRoll;
        ++i;
        // [Loop Continue]
        goto J0x3C7;
    }
    //return;    
}

function Initialize(BTTcpLink_Channel _tcpChannel, wItemBoxHK _itemInfo, int _capsuleCount, BtrDouble _uniqueID, int _keyCount, BtrDouble _keyUniqueID)
{
    TcpChannel = _tcpChannel;
    KeyCount = _keyCount;
    KeyUniqueID = _keyUniqueID;
    LabelDesc.Caption = strOpening;
    ComboCapsuleData.SetInitItemCount(_itemInfo, _capsuleCount);
    ButtonUseCapsule.DisableMe();
    //return;    
}

function AllEnd()
{
    local int i;
    local bool getBestItem;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;

    super.AllEnd();
    i = 0;
    J0x0D:

    // End:0x43 [Loop If]
    if(i < 3)
    {
        itemBox[i].itemBox.bRenderInfo = true;
        ++i;
        // [Loop Continue]
        goto J0x0D;
    }
    LabelDesc.Caption = strCongratulation;
    ImgRemainBackground.Show();
    LabelRemainName.Show();
    LabelReOpen.Show();
    ComboCapsuleData.Show();
    instanceInfo = ComboCapsuleData.GetCurrentSelectedInstance();
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    EnableOpenButton(ItemInfo, instanceInfo.OverlapCount);
    ComboCapsuleData.ComboBoxCapsule.EnableMe();
    ButtonInventory.EnableMe();
    i = 0;
    J0x112:

    // End:0x20C [Loop If]
    if(i < ItemIDChoose.Length)
    {
        // End:0x202
        if(IsBestItem(i, ItemIDChoose[i]))
        {
            InactiveFadeColor = ActiveFadeColor;
            getBestItem = true;
            // End:0x1FF
            if(Class'GUIWarfareControls_Decompressed.BTWindowFadeScreen'.static.StartFadeInOut(Controller, 0.2000000, 1.5000000, 2.0000000, 5.0000000, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Effect_BestItemGet))
            {
                BTWindowFadeScreen(Controller.TopPage()).strFadeInSound = strSoundWin;
                i = 0;
                J0x1B1:

                // End:0x1FF [Loop If]
                if(i < 2)
                {
                    BTWindowFadeScreen(Controller.TopPage()).ShowLabelInfo[i].Caption = strBestItemGet[i];
                    ++i;
                    // [Loop Continue]
                    goto J0x1B1;
                }
            }
            // [Explicit Break]
            goto J0x20C;
        }
        i++;
        // [Loop Continue]
        goto J0x112;
    }
    J0x20C:

    // End:0x22E
    if(getBestItem)
    {
        PlayerOwner().FmodClientPlaySound(strSoundEffect,,, 6);        
    }
    else
    {
        PlayerOwner().FmodClientPlaySound(strSoundLose,,, 6);
    }
    //return;    
}

function SetItemCount(int Count)
{
    super.SetItemCount(Count);
    TopLine.Caption = strTitle;
    //return;    
}

function bool InternalOnUseCapsule(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;

    Controller.CloseMenu(false);
    instanceInfo = ComboCapsuleData.GetCurrentSelectedInstance();
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    // End:0xAF
    if(instanceInfo.OverlapCount < 1)
    {
        // End:0x98
        if(GameMgr.CheckBlackbox(ItemInfo.ItemType))
        {
            Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 816);            
        }
        else
        {
            ItemBuyWindowProcess(instanceInfo.ItemID);
        }        
    }
    else
    {
        // End:0x123
        if(GameMgr.CheckBlackbox(ItemInfo.ItemType))
        {
            // End:0xFF
            if(KeyCount > 0)
            {
                TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID, KeyUniqueID);                
            }
            else
            {
                ItemBuyWindowProcess(17701);
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 230);
            }            
        }
        else
        {
            TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID, KeyUniqueID);
        }
    }
    return true;
    //return;    
}

function ItemBuyWindowProcess(int ItemID)
{
    local wItemBoxHK ItemInfo;
    local BTROItemBoxHK tempRo;
    local wItemBoxCashHK cii;

    ItemInfo = GameMgr.FindUIItem(ItemID);
    tempRo = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    tempRo.Init();
    tempRo.ItemInfo = ItemInfo;
    tempRo.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    tempRo.SetGameManager(GameMgr);
    tempRo.SetMatchMaker(MM);
    tempRo.ChangeState(6);
    tempRo.Update();
    // End:0x106
    if(tempRo.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(tempRo.ItemInfo, tempRo.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
    }
    cii = tempRo.instanceInfo.cashItemInfo;
    ShowItemBuyWindow(tempRo, 0, 0);
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
    BTWindowItemBuyHK(Controller.TopPage()).__deleShowCashChargeWindow__Delegate = __ClickShowCashChargeWindow__Delegate;
    //return;    
}

function bool InternalOnInventory(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    ClickInventory();
    return true;
    //return;    
}

function FillCapsule(bool inCapsuleItem)
{
    ComboCapsuleData.InitItemData(inCapsuleItem);
    //return;    
}

function Internal_OnNextRoll()
{
    PlayerOwner().FmodClientPlaySound(strSoundShake,,, 6);
    //return;    
}

function ChangeComboBox()
{
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;

    instanceInfo = ComboCapsuleData.GetCurrentSelectedInstance();
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    EnableOpenButton(ItemInfo, instanceInfo.OverlapCount);
    //return;    
}

function EnableOpenButton(wItemBoxHK curItemInfo, int curItemCount)
{
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxCashHK cii;
    local bool buttonVisible, bEnable;

    buttonVisible = ButtonUseCapsule.bVisible;
    bEnable = true;
    // End:0xC7
    if(curItemCount < 1)
    {
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        // End:0x77
        if(curItemInfo.IsCashItem() == true)
        {
            GameMgr.AddCashItem(curItemInfo, instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
        }
        cii = instanceInfo.cashItemInfo;
        // End:0xAF
        if(cii != none)
        {
            bEnable = cii.bWZCanBuy;            
        }
        else
        {
            bEnable = curItemInfo.AdType != 0;
        }
    }
    // End:0xE2
    if(bEnable)
    {
        ButtonUseCapsule.EnableMe();        
    }
    else
    {
        ButtonUseCapsule.DisableMe();
    }
    ButtonUseCapsule.SetVisibility(buttonVisible);
    //return;    
}

defaultproperties
{
    fbButtonUseCapsule=(X1=325.0000000,Y1=464.0000000,X2=449.0000000,Y2=501.0000000)
    fbButtonInventory=(X1=451.0000000,Y1=464.0000000,X2=575.0000000,Y2=501.0000000)
    fbComboBoxCapsule=(X1=471.0000000,Y1=370.0000000,X2=714.0000000,Y2=400.0000000)
    fbLabelDesc=(X1=258.0000000,Y1=224.0000000,X2=771.0000000,Y2=239.0000000)
    fbLabelRemainName=(X1=304.0000000,Y1=378.0000000,X2=467.0000000,Y2=393.0000000)
    fbLabelReOpen=(X1=304.0000000,Y1=432.0000000,X2=720.0000000,Y2=447.0000000)
    fbImgRemainBackground=(X1=212.0000000,Y1=364.0000000,X2=831.0000000,Y2=401.0000000)
    strSoundShake="Warfare_Sound_UI/Luckyshop/shake"
    strSoundLose="Warfare_Sound_UI/Luckyshop/lose"
    strSoundEffect="Warfare_Sound_UI/Luckyshop/effect"
    strSoundWin="Warfare_Sound_UI/Luckyshop/win"
    strOpening="???????????????...."
    strCongratulation="?????????! ??????????????????????"
    strRemainName="?????????????"
    strReOpen="?????????????????"
    strUseCapsule="?????????????"
    strInventory="Personal Warehouse"
    strBestItemGet[0]="???????????????!"
    strBestItemGet[1]="???????????????????"
    fbEven[0]=(X1=342.0000000,Y1=255.0000000,X2=511.0000000,Y2=341.0000000)
    fbEven[1]=(X1=514.0000000,Y1=255.0000000,X2=683.0000000,Y2=341.0000000)
    fbOdd[0]=(X1=256.0000000,Y1=255.0000000,X2=425.0000000,Y2=341.0000000)
    fbOdd[1]=(X1=428.0000000,Y1=255.0000000,X2=597.0000000,Y2=341.0000000)
    fbOdd[2]=(X1=600.0000000,Y1=255.0000000,X2=769.0000000,Y2=341.0000000)
    useEndSound=false
    fbBackgroundImage=(X1=178.0000000,Y1=181.0000000,X2=847.0000000,Y2=511.0000000)
    fbTopLine=(X1=403.0000000,Y1=187.0000000,X2=621.0000000,Y2=202.0000000)
    fbButtonOK=(X1=577.0000000,Y1=464.0000000,X2=701.0000000,Y2=501.0000000)
    UseOpenSound=false
    strTitle="?????????????"
    bUseMyInactiveFadeColor=true
}