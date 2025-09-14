class BTWindowCapsuleOpen extends BTWindowHK
    editinlinenew
    instanced;

var wGameManager GameMgr;
var BTTcpLink_Channel TcpChannel;
var BtrDouble KeyUniqueID;
var FloatBox fbImageItem;
var FloatBox fbLabelItemName;
var FloatBox fbLabelRemainName;
var FloatBox fbLabelDesc;
var export editinline BTOwnerDrawImageHK ImageItem;
var export editinline BTOwnerDrawImageHK LabelItemName;
var export editinline BTOwnerDrawImageHK LabelRemainName;
var export editinline BTOwnerDrawImageHK LabelDesc;
var FloatBox fbComboBoxCapsule;
var FloatBox fbBackgroundComboBoxCapsule;
var export editinline BTComboCapsuleData ComboCapsuleData;
var localized string strRemainName;
var localized string strDesc;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Capsule_Open;
    TopLine.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    TopLine.SetFontSizeAll(11);
    TopLine.SetFontDrawType(4);
    ImageItem = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbImageItem, 0.5000000, self));
    ImageItem.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(int(fbImageItem.X2 - fbImageItem.X1), int(fbImageItem.Y2 - fbImageItem.Y1), 1, none);
    LabelItemName = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelItemName, 0.5000000, self));
    LabelItemName.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelItemName.SetFontSizeAll(11);
    LabelItemName.SetFontDrawType(4);
    LabelRemainName = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelRemainName, 0.5000000, self));
    LabelRemainName.Caption = strRemainName;
    LabelRemainName.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN());
    LabelRemainName.SetFontSizeAll(11);
    LabelRemainName.SetFontDrawType(4);
    LabelDesc = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelDesc, 0.5000000, self));
    LabelDesc.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelDesc.SetFontSizeAll(9);
    LabelDesc.SetFontDrawType(4);
    ComboCapsuleData = BTComboCapsuleData(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboCapsuleData', fbBackgroundComboBoxCapsule, 0.5000000, self));
    ComboCapsuleData.SetSize(fbBackgroundComboBoxCapsule, fbComboBoxCapsule);
    ComboCapsuleData.__ChangeComboBox__Delegate = ChangeComboBox;
    ButtonOK.bTabStop = false;
    ButtonCancel.bTabStop = false;
    __OnOK__Delegate = Internal_OnOK;
    //return;    
}

function Initialize(int setItemID, BtrDouble _keyUniqueID, BTTcpLink_Channel setTcpChannel, wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceItem;
    local wItemBoxHK ItemInfo;

    TcpChannel = setTcpChannel;
    instanceItem = GameMgr.FindFirstInstanceItemByItemID(setItemID);
    ItemInfo = GameMgr.FindUIItem(setItemID);
    KeyUniqueID = _keyUniqueID;
    ImageItem.BackgroundImage.Image = ItemInfo.ItemImage;
    LabelItemName.Caption = ItemInfo.ItemName;
    LabelDesc.Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strDesc, ItemInfo.ItemName);
    ComboCapsuleData.SetInitItemCount(ItemInfo, instanceItem.OverlapCount);
    //return;    
}

function bool Internal_OnOK(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = ComboCapsuleData.GetCurrentSelectedInstance();
    TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID, KeyUniqueID);
    OnOK(Sender);
    return true;
    //return;    
}

function FillCapsule(bool inCapsuleItem)
{
    ComboCapsuleData.InitItemData(inCapsuleItem);
    //return;    
}

function ChangeComboBox()
{
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;

    instanceInfo = ComboCapsuleData.GetCurrentSelectedInstance();
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    ImageItem.BackgroundImage.Image = ItemInfo.ItemImage;
    //return;    
}

defaultproperties
{
    fbImageItem=(X1=436.0000000,Y1=243.0000000,X2=589.0000000,Y2=307.0000000)
    fbLabelItemName=(X1=403.0000000,Y1=218.0000000,X2=621.0000000,Y2=233.0000000)
    fbLabelRemainName=(X1=304.0000000,Y1=342.0000000,X2=467.0000000,Y2=357.0000000)
    fbLabelDesc=(X1=304.0000000,Y1=396.0000000,X2=720.0000000,Y2=411.0000000)
    fbComboBoxCapsule=(X1=471.0000000,Y1=334.0000000,X2=714.0000000,Y2=364.0000000)
    strDesc="????????????? 0% "
    fbBackgroundImage=(X1=282.0000000,Y1=181.0000000,X2=742.0000000,Y2=475.0000000)
    fbTopLine=(X1=403.0000000,Y1=187.0000000,X2=621.0000000,Y2=202.0000000)
    fbButtonOK=(X1=387.0000000,Y1=429.0000000,X2=511.0000000,Y2=466.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=429.0000000,X2=637.0000000,Y2=466.0000000)
    strTitle="??????????"
    strOK="????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}