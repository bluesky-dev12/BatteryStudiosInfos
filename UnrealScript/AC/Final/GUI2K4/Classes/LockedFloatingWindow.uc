class LockedFloatingWindow extends FloatingWindow
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Main;
var() automated GUIButton b_Cancel;
var() automated GUIButton b_OK;
var() localized string SubCaption;
var() float EdgeBorder[4];

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    // End:0x30
    if(SubCaption != "")
    {
        sb_Main.Caption = SubCaption;
    }
    AlignButtons();
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x1F
    if(Sender == self)
    {
        NewComp.bBoundToParent = true;        
    }
    else
    {
        super.InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_OK)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x42
    if(Sender == b_Cancel)
    {
        Controller.CloseMenu(true);
        return true;
    }
    return false;
    //return;    
}

function AlignButtons()
{
    local float X, Y, Xs, Ys, WIP, HIP;

    WIP = ActualWidth();
    HIP = ActualHeight();
    Xs = b_OK.ActualWidth() * 0.1000000;
    Ys = b_OK.ActualHeight() * 0.1000000;
    X = (1.0000000 - ((b_OK.ActualWidth() + Xs) / WIP)) - (EdgeBorder[2] / WIP);
    Y = (1.0000000 - ((b_OK.ActualHeight() + Ys) / HIP)) - (EdgeBorder[3] / WIP);
    b_OK.WinLeft = X;
    b_OK.WinTop = Y;
    X = (1.0000000 - (((b_OK.ActualWidth() + b_Cancel.ActualWidth()) + Xs) / WIP)) - (EdgeBorder[2] / WIP);
    b_Cancel.WinLeft = X;
    b_Cancel.WinTop = Y;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.LockedFloatingWindow.InternalFrameImage'
    begin object name="InternalFrameImage" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.0750000
        WinLeft=0.0400000
        WinWidth=0.6758590
        WinHeight=0.5509760
        OnPreDraw=InternalFrameImage.InternalPreDraw
    end object
    sb_Main=InternalFrameImage
    // Reference: GUIButton'GUI2K4_Decompressed.LockedFloatingWindow.LockedCancelButton'
    begin object name="LockedCancelButton" class=XInterface.GUIButton
        Caption="??"
        bAutoShrink=false
        WinTop=0.8723970
        WinLeft=0.5126950
        WinWidth=0.1596490
        TabOrder=99
        bBoundToParent=true
        OnClick=LockedFloatingWindow.InternalOnClick
        OnKeyEvent=LockedCancelButton.InternalOnKeyEvent
    end object
    b_Cancel=LockedCancelButton
    // Reference: GUIButton'GUI2K4_Decompressed.LockedFloatingWindow.LockedOKButton'
    begin object name="LockedOKButton" class=XInterface.GUIButton
        Caption="??"
        bAutoShrink=false
        WinTop=0.8723970
        WinLeft=0.7421880
        WinWidth=0.1596490
        TabOrder=100
        bBoundToParent=true
        OnClick=LockedFloatingWindow.InternalOnClick
        OnKeyEvent=LockedOKButton.InternalOnKeyEvent
    end object
    b_OK=LockedOKButton
    EdgeBorder[0]=16.0000000
    EdgeBorder[1]=24.0000000
    EdgeBorder[2]=16.0000000
    EdgeBorder[3]=24.0000000
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1250000
    DefaultTop=0.1500000
    DefaultWidth=0.7400000
    DefaultHeight=0.7000000
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.1500000
    WinLeft=0.1250000
    WinWidth=0.7400000
    WinHeight=0.7000000
}