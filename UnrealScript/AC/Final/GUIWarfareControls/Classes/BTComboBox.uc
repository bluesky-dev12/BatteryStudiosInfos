class BTComboBox extends GUIPanel
    editinlinenew
    instanced;

var() automated BTInputImage Border;
var() automated GUIComboBox ComboBox;
var float MarginL;
var float MarginR;
var float MarginT;
var float MarginB;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PositionControls();
    //return;    
}

function PositionControls()
{
    Border.WinLeft = WinLeft;
    Border.WinTop = WinTop;
    Border.WinWidth = WinWidth;
    Border.WinHeight = WinHeight;
    //return;    
}

function bool InternalPreDraw(Canvas C)
{
    PositionControls();
    ComboBox.WinLeft = Border.WinLeft + (MarginL / C.ClipX);
    ComboBox.WinTop = Border.WinTop + (MarginT / C.ClipY);
    ComboBox.WinWidth = Border.WinWidth - ((MarginL + MarginR) / C.ClipX);
    ComboBox.WinHeight = Border.WinHeight - ((MarginT + MarginB) / C.ClipY);
    return false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

defaultproperties
{
    // Reference: BTInputImage'GUIWarfareControls_Decompressed.BTComboBox.mBorder'
    begin object name="mBorder" class=GUIWarfareControls_Decompressed.BTInputImage
    end object
    Border=mBorder
    // Reference: GUIComboBox'GUIWarfareControls_Decompressed.BTComboBox.mComboBox'
    begin object name="mComboBox" class=XInterface.GUIComboBox
        WinTop=0.4609375
        WinLeft=0.2724609
        WinWidth=0.2460938
        WinHeight=0.0208333
        OnChange=BTComboBox.InternalOnChange
        OnKeyEvent=mComboBox.InternalOnKeyEvent
    end object
    ComboBox=mComboBox
    MarginL=3.0000000
    MarginR=3.0000000
    MarginT=4.0000000
    MarginB=4.0000000
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinTop=0.4557292
    WinLeft=0.2695312
    WinWidth=0.2519531
    WinHeight=0.0312500
    OnPreDraw=BTComboBox.InternalPreDraw
}