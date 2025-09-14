/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowBuyItem.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:43
 *	Functions:10
 *
 *******************************************************************************/
class BTWindowBuyItem extends BTWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage BorderTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage Title;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTBoxImage BorderPanel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage ImageItemBG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage ImageItem;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage ImageCurrentlyPosessing;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel LabelDisplayName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTailImage TailBottomImageItem;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel LabelDescription;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTailImage TailBottomDescription;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTBoxImage BorderPanelBuyInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBox ComboPriceOption;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBox ComboExpOption;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTailImage TailCrossingPointAndCash;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage PointImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage CashImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel LabelPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputPointPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel PointPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputCashPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel CashPrice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel LabelCurrent;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputPointCurrent;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel PointCurrent;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputCashCurrent;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel CashCurrent;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel LabelAfter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputPointAfter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel PointAfter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage InputCashAfter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel CashAfter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTailImage TailLeftButtonBuy;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton ButtonRefillCash;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton ButtonBuy;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton ButtonCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTailImage TailRightButtonCancel;
var localized string CaptionRefillCash;
var localized string CaptionItemPrice;
var localized string CaptionCurrent;
var localized string CaptionChange;
var delegate<OnRefillCash> __OnRefillCash__Delegate;
var delegate<OnBuy> __OnBuy__Delegate;
var delegate<OnCancel> __OnCancel__Delegate;

delegate OnRefillCash(GUIComponent Sender);
delegate OnBuy(GUIComponent Sender);
delegate OnCancel(GUIComponent Sender);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization loc;

    loc = new class'GlobalLocalization';
    ButtonRefillCash.Caption = CaptionRefillCash;
    ButtonBuy.Caption = loc.Buy;
    ButtonCancel.Caption = loc.CaptionCancel;
    LabelCurrent.Caption = CaptionCurrent;
    LabelPrice.Caption = CaptionItemPrice;
    LabelAfter.Caption = CaptionChange;
}

function bool ButtonRefillCash_OnClick(GUIComponent Sender)
{
    OnRefillCash(self);
    return true;
}

function bool ButtonBuy_OnClick(GUIComponent Sender)
{
    OnBuy(self);
    return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    OnCancel(self);
    return true;
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
    // End:0x7e [While If]
    if(lp1 < sts.ItemList.Length)
    {
        // End:0x74
        if(sts.ItemList[lp1].iItemID == ItemID)
        {
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return false;
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
    ImageItem.Image = Material(DynamicLoadObject(resourceParam.strRes_Icon, class'Material'));
    PointPrice.Caption = "" $ string(ItemParam.iPointPrice[0]);
    PointCurrent.Caption = "" $ string(currentPoint);
    leftoverPoint = currentPoint - ItemParam.iPointPrice[0];
    PointAfter.Caption = "" $ string(leftoverPoint);
    CashPrice.Caption = "" $ string(ItemParam.iCashPrice[0]);
    CashCurrent.Caption = "" $ string(currentCash);
    leftoverCash = currentCash - ItemParam.iCashPrice[0];
    CashAfter.Caption = "" $ string(leftoverCash);
    ButtonBuy.SetEnabled(leftoverCash >= 0 || leftoverPoint >= 0);
    ImageCurrentlyPosessing.bVisible = HasItem(ItemID);
}

defaultproperties
{
    CaptionRefillCash="Buy Cash"
    CaptionItemPrice="Item Price"
    CaptionCurrent="Funds"
    CaptionChange="Balance"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=348.0,Y1=317.0,X2=675.0,Y2=457.0)
}