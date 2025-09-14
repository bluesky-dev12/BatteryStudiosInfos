class BTWindowSellItem extends BTWindow
    editinlinenew
    instanced;

var() automated BTInputImage BorderTitle;
var() automated FloatingImage Title;
var() automated BTBoxImage BorderPanel;
var() automated FloatingImage ImageItemBG;
var() automated FloatingImage ImageItem;
var() automated GUILabel LabelDisplayName;
var() automated BTTailImage TailCrossingPoint;
var() automated FloatingImage PointImage;
var() automated GUILabel LabelSellingPrice;
var() automated BTInputImage InputSellingPrice;
var() automated GUILabel SellingPrice;
var() automated GUILabel LabelCurrent;
var() automated BTInputImage InputCurrent;
var() automated GUILabel Current;
var() automated GUILabel LabelAfter;
var() automated BTInputImage InputAfter;
var() automated GUILabel after;
var() automated BTTailImage TailLeftButtonSell;
var() automated GUIButton ButtonSell;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage TailRightButtonCancel;
var localized string CaptionSellingPrice;
var localized string CaptionCurrent;
var localized string CaptionAfter;
var BtrDouble iUniqueID;
//var delegate<OnSell> __OnSell__Delegate;
//var delegate<OnCancel> __OnCancel__Delegate;

delegate OnSell(GUIComponent Sender)
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
    ButtonSell.Caption = loc.Sell;
    ButtonCancel.Caption = loc.CaptionCancel;
    LabelSellingPrice.Caption = CaptionSellingPrice;
    LabelCurrent.Caption = CaptionCurrent;
    LabelAfter.Caption = CaptionAfter;
    //return;    
}

function bool ButtonSell_OnClick(GUIComponent Sender)
{
    OnSell(self);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    OnCancel(self);
    return true;
    //return;    
}

function Set(int ItemID, BtrDouble UniqueID, int sellp, int curp, int afterp)
{
    local wGameManager GameMgr;
    local wItemBaseParam ItemParam;
    local wItemResourceParam resourceParam;

    GameMgr = PlayerOwner().Level.GameMgr;
    ItemParam = GameMgr.GetItemParam(ItemID);
    resourceParam = GameMgr.GetItemResourceParam(ItemID);
    LabelDisplayName.Caption = ItemParam.strDisplayName;
    ImageItem.Image = Material(DynamicLoadObject(resourceParam.strRes_Icon, Class'Engine.Material'));
    SellingPrice.Caption = "" $ string(sellp);
    Current.Caption = "" $ string(curp);
    after.Caption = "" $ string(afterp);
    iUniqueID = UniqueID;
    //return;    
}

defaultproperties
{
    CaptionSellingPrice="?? ??"
    CaptionCurrent="?? ??"
    CaptionAfter="?? ? ???"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=348.0000000,Y1=248.0000000,X2=675.0000000,Y2=500.0000000)
}