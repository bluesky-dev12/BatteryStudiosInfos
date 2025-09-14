class BTWindowBuyItem extends BTWindow
    editinlinenew
    instanced;

var() automated BTInputImage BorderTitle;
var() automated FloatingImage Title;
var() automated BTBoxImage BorderPanel;
var() automated FloatingImage ImageItemBG;
var() automated FloatingImage ImageItem;
var() automated FloatingImage ImageCurrentlyPosessing;
var() automated GUILabel LabelDisplayName;
var() automated BTTailImage TailBottomImageItem;
var() automated GUILabel LabelDescription;
var() automated BTTailImage TailBottomDescription;
var() automated BTBoxImage BorderPanelBuyInfo;
var() automated BTComboBox ComboPriceOption;
var() automated BTComboBox ComboExpOption;
var() automated BTTailImage TailCrossingPointAndCash;
var() automated FloatingImage PointImage;
var() automated FloatingImage CashImage;
var() automated GUILabel LabelPrice;
var() automated BTInputImage InputPointPrice;
var() automated GUILabel PointPrice;
var() automated BTInputImage InputCashPrice;
var() automated GUILabel CashPrice;
var() automated GUILabel LabelCurrent;
var() automated BTInputImage InputPointCurrent;
var() automated GUILabel PointCurrent;
var() automated BTInputImage InputCashCurrent;
var() automated GUILabel CashCurrent;
var() automated GUILabel LabelAfter;
var() automated BTInputImage InputPointAfter;
var() automated GUILabel PointAfter;
var() automated BTInputImage InputCashAfter;
var() automated GUILabel CashAfter;
var() automated BTTailImage TailLeftButtonBuy;
var() automated GUIButton ButtonRefillCash;
var() automated GUIButton ButtonBuy;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage TailRightButtonCancel;
var localized string CaptionRefillCash;
var localized string CaptionItemPrice;
var localized string CaptionCurrent;
var localized string CaptionChange;
//var delegate<OnRefillCash> __OnRefillCash__Delegate;
//var delegate<OnBuy> __OnBuy__Delegate;
//var delegate<OnCancel> __OnCancel__Delegate;

delegate OnRefillCash(GUIComponent Sender)
{
    //return;    
}

delegate OnBuy(GUIComponent Sender)
{
    //return;    
}

delegate OnCancel(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    //return;    
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization loc;

    loc = new Class'Engine.GlobalLocalization';
    ButtonRefillCash.Caption = CaptionRefillCash;
    ButtonBuy.Caption = loc.Buy;
    ButtonCancel.Caption = loc.CaptionCancel;
    LabelCurrent.Caption = CaptionCurrent;
    LabelPrice.Caption = CaptionItemPrice;
    LabelAfter.Caption = CaptionChange;
    //return;    
}

function bool ButtonRefillCash_OnClick(GUIComponent Sender)
{
    OnRefillCash(self);
    return true;
    //return;    
}

function bool ButtonBuy_OnClick(GUIComponent Sender)
{
    OnBuy(self);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    OnCancel(self);
    return true;
    //return;    
}

function bool HasItem(int ItemID)
{
    local int lp1;
    local wCharacterManager chMgr;
    local wMyPlayerStatus sts;

    chMgr = PlayerOwner().Level.CharMgr;
    sts = chMgr.MyPlayer;
    lp1 = 0;
    J0x36:

    // End:0x7E [Loop If]
    if(lp1 < sts.ItemList.Length)
    {
        // End:0x74
        if(sts.ItemList[lp1].iItemID == ItemID)
        {
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x36;
    }
    return false;
    //return;    
}

function Set(int ItemID, int currentPoint, int currentCash)
{
    local wGameManager GameMgr;
    local wItemBaseParam ItemParam;
    local wItemResourceParam resourceParam;
    local int leftoverPoint, leftoverCash;

    GameMgr = PlayerOwner().Level.GameMgr;
    ItemParam = GameMgr.GetItemParam(ItemID);
    resourceParam = GameMgr.GetItemResourceParam(ItemID);
    LabelDisplayName.Caption = ItemParam.strDisplayName;
    ImageItem.Image = Material(DynamicLoadObject(resourceParam.strRes_Icon, Class'Engine.Material'));
    PointPrice.Caption = "" $ string(ItemParam.iPointPrice[0]);
    PointCurrent.Caption = "" $ string(currentPoint);
    leftoverPoint = currentPoint - ItemParam.iPointPrice[0];
    PointAfter.Caption = "" $ string(leftoverPoint);
    CashPrice.Caption = "" $ string(ItemParam.iCashPrice[0]);
    CashCurrent.Caption = "" $ string(currentCash);
    leftoverCash = currentCash - ItemParam.iCashPrice[0];
    CashAfter.Caption = "" $ string(leftoverCash);
    ButtonBuy.SetEnabled((leftoverCash >= 0) || leftoverPoint >= 0);
    ImageCurrentlyPosessing.bVisible = HasItem(ItemID);
    //return;    
}

defaultproperties
{
    CaptionRefillCash="????"
    CaptionItemPrice="??? ??"
    CaptionCurrent="?? ??"
    CaptionChange="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=348.0000000,Y1=317.0000000,X2=675.0000000,Y2=457.0000000)
}