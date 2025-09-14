class BTMoneyInfo extends GUIMultiComponent
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var() automated FloatBox fbLabelPoint;
var() automated FloatBox fbLabelCash;
var() automated FloatBox fbLabelCoupon;
var() automated FloatBox fbImagePoint;
var() automated FloatBox fbImageCash;
var() automated FloatBox fbImageCoupon;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var export editinline BTOwnerDrawImageHK LabelCoupon;
var export editinline BTOwnerDrawImageHK ImagePoint;
var export editinline BTOwnerDrawImageHK ImageCash;
var export editinline BTOwnerDrawImageHK ImageCoupon;
var() automated FloatBox fbChargeCashBtn;
var export editinline BTOwnerDrawCaptionButtonHK ChargeCashBtn;
var localized string strChargeCash;
//var delegate<deleClickChargeCash> __deleClickChargeCash__Delegate;

delegate deleClickChargeCash()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddLabel(LabelCash, fbLabelCash, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash());
    LabelPoint = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddLabel(LabelPoint, fbLabelPoint, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point());
    LabelCoupon = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddLabel(LabelCoupon, fbLabelCoupon, Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    ImageCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddImage(ImageCash, fbImageCash, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_cash);
    ImagePoint = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddImage(ImagePoint, fbImagePoint, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_point);
    ImageCoupon = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddImage(ImageCoupon, fbImageCoupon, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_coupon);
    AddButton(ChargeCashBtn, fbChargeCashBtn, strChargeCash, 9, 4);
    ChargeCashBtn.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Charge_Cash_Btn_on;
    ChargeCashBtn.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Charge_Cash_Btn_cli;
    ChargeCashBtn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Charge_Cash_Btn_Dis;
    ChargeCashBtn.__OnClick__Delegate = ClickChargeCash;
    //return;    
}

function AddLabel(out BTOwnerDrawImageHK AddComponent, FloatBox fbComponent, Color TextColor)
{
    AddComponent = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AddComponent.bUseAWinPos = true;
    AddComponent.AWinPos = fbComponent;
    AddComponent.SetFontSizeAll(10);
    AddComponent.FontColor[0] = TextColor;
    AddComponent.InitComponent(Controller, self);
    AppendComponent(AddComponent);
    //return;    
}

function AddImage(out BTOwnerDrawImageHK AddImage, FloatBox fbImage, Image applyImage)
{
    AddImage.bUseAWinPos = true;
    AddImage.AWinPos = fbImage;
    AddImage.BackgroundImage = applyImage;
    AddImage.InitComponent(Controller, self);
    AppendComponent(AddImage);
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

function EnableCoupon(bool bEnable)
{
    LabelCoupon.SetVisibility(bEnable);
    LabelCoupon.SetEnabled(bEnable);
    ImageCoupon.SetVisibility(bEnable);
    ImageCoupon.SetEnabled(bEnable);
    //return;    
}

function RefreshCashNPoint(wGameManager GameMgr, wMatchMaker MM)
{
    local wItemBoxInstanceHK capsuleInstanceInfo;

    LabelPoint.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    capsuleInstanceInfo = GameMgr.FindFirstInstanceItemByItemType(int(GameMgr.39));
    LabelCoupon.Caption = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(228, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(capsuleInstanceInfo.OverlapCount)));
    //return;    
}

function bool ClickChargeCash(GUIComponent Sender)
{
    deleClickChargeCash();
    return true;
    //return;    
}

defaultproperties
{
    fbLabelPoint=(X1=575.0000000,Y1=94.0000000,X2=724.0000000,Y2=114.0000000)
    fbLabelCash=(X1=745.0000000,Y1=94.0000000,X2=894.0000000,Y2=114.0000000)
    fbLabelCoupon=(X1=405.0000000,Y1=94.0000000,X2=554.0000000,Y2=114.0000000)
    fbImagePoint=(X1=557.0000000,Y1=96.0000000,X2=571.0000000,Y2=111.0000000)
    fbImageCash=(X1=727.0000000,Y1=96.0000000,X2=742.0000000,Y2=111.0000000)
    fbImageCoupon=(X1=387.0000000,Y1=96.0000000,X2=402.0000000,Y2=111.0000000)
    fbChargeCashBtn=(X1=906.0000000,Y1=85.0000000,X2=1010.0000000,Y2=113.0000000)
    strChargeCash="??????????"
}