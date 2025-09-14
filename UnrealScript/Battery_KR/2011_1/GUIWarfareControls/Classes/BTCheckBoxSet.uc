class BTCheckBoxSet extends GUIPanel
    editinlinenew
    instanced;

var() automated GUIGFXButton CbxOff;
var() automated GUILabel LabelOff;
var() automated GUIGFXButton CbxOn;
var() automated GUILabel LabelOn;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PositionControls();
    //return;    
}

function PositionControls()
{
    CbxOff.WinTop = WinTop + (5.0000000 / 1024.0000000);
    CbxOn.WinTop = WinTop + (5.0000000 / 1024.0000000);
    LabelOff.WinTop = WinTop;
    LabelOn.WinTop = WinTop;
    //return;    
}

function SetValue(bool Value)
{
    CbxOff.bChecked = !Value;
    CbxOn.bChecked = Value;
    OnChange(self);
    //return;    
}

function bool GetValue()
{
    return CbxOn.bChecked;
    //return;    
}

function CbxOff_OnChange(GUIComponent Sender)
{
    CbxOn.bChecked = !CbxOff.bChecked;
    OnChange(self);
    //return;    
}

function CbxOn_OnChange(GUIComponent Sender)
{
    CbxOff.bChecked = !CbxOn.bChecked;
    OnChange(self);
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    PositionControls();
    return false;
    //return;    
}

defaultproperties
{
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinTop=0.4153646
    WinLeft=0.4003906
    WinWidth=0.1396484
    WinHeight=0.0312500
    OnPreDraw=BTCheckBoxSet.InternalOnPreDraw
}