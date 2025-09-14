class BTWindowAuction_BuyItNow extends BTWindow
    editinlinenew
    instanced;

var() automated BTInputImage BorderTitle;
var() automated FloatingImage Title;
var() automated BTBoxImage BorderPanel;
var() automated GUILabel LabelPrice;
var() automated BTInputImage InputPrice;
var() automated GUILabel Price;
var() automated BTBoxImage BorderQuestion;
var() automated GUILabel LabelQuestion;
var() automated BTTailImage TailLeftButtonBuy;
var() automated GUIButton ButtonBuy;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage TailRightButtonCancel;
var localized string CaptionBuyItNowPrice;
var localized string CaptionBuyQuestion;
//var delegate<OnBuy> __OnBuy__Delegate;
//var delegate<OnCancel> __OnCancel__Delegate;

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
    LabelPrice.Caption = CaptionBuyItNowPrice;
    ButtonBuy.Caption = loc.Buy;
    ButtonCancel.Caption = loc.CaptionCancel;
    //return;    
}

function SetItemName(string val)
{
    LabelQuestion.Caption = val $ CaptionBuyQuestion;
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

defaultproperties
{
    CaptionBuyItNowPrice="??????"
    CaptionBuyQuestion="?(?) ?? ?????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=348.0000000,Y1=317.0000000,X2=675.0000000,Y2=457.0000000)
}