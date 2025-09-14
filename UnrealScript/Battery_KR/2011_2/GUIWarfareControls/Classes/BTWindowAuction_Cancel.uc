class BTWindowAuction_Cancel extends BTWindow
    editinlinenew
    instanced;

var() automated BTInputImage BorderTitle;
var() automated FloatingImage Title;
var() automated BTBoxImage BorderPanel;
var() automated BTBoxImage BorderQuestion;
var() automated GUILabel LabelQuestion;
var() automated GUILabel LabelWarning;
var() automated BTTailImage TailLeftButtonOK;
var() automated GUIButton ButtonOK;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage TailRightButtonCancel;
var localized string CaptionCancelQuestion;
var localized string CaptionWarning;
//var delegate<OnOK> __OnOK__Delegate;
//var delegate<OnCancel> __OnCancel__Delegate;

delegate OnOK(GUIComponent Sender)
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
    LabelWarning.Caption = CaptionWarning;
    ButtonOK.Caption = loc.CaptionOK;
    ButtonCancel.Caption = loc.CaptionCancel;
    //return;    
}

function SetItemName(string str)
{
    LabelQuestion.Caption = str $ CaptionCancelQuestion;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    OnOK(self);
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
    CaptionCancelQuestion="?(?) ?? ??????????"
    CaptionWarning="?????? ???? ?? ?? ? ????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=348.0000000,Y1=317.0000000,X2=675.0000000,Y2=457.0000000)
}