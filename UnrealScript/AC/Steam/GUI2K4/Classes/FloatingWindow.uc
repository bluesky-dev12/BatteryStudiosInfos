/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\FloatingWindow.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:27
 *	Functions:28
 *
 *******************************************************************************/
class FloatingWindow extends PopupPageBase
    dependson(PopupPageBase)
    dependson(UT2K4GUIController)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIHeader t_WindowTitle;
var() export editinline GUIButton b_ExitButton;
var() localized string WindowName;
var() float MinPageWidth;
var() float MinPageHeight;
var() float MaxPageHeight;
var() float MaxPageWidth;
var() editconst bool bResizeWidthAllowed;
var() editconst bool bResizeHeightAllowed;
var() editconst bool bResizing;
var() editconst bool bMoveAllowed;
var() editconst bool bMoving;
var() editconst bool TSizing;
var() editconst bool RSizing;
var() editconst bool LSizing;
var() editconst bool BtSizing;
var() editconst bool TLSizing;
var() editconst bool TRSizing;
var() editconst bool BRSizing;
var() editconst bool BLSizing;
var() float DefaultLeft;
var() float DefaultTop;
var() float DefaultWidth;
var() float DefaultHeight;
var() int HeaderMouseCursorIndex;
var bool bSetControlsBoundToParent;
var bool bSetControlsScaleToParent;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    // End:0x2f
    if(t_WindowTitle != none)
    {
        t_WindowTitle.SetCaption(WindowName);
    }
    // End:0x6a
    if(t_WindowTitle != none && bMoveAllowed)
    {
        t_WindowTitle.bAcceptsInput = true;
        t_WindowTitle.MouseCursorIndex = HeaderMouseCursorIndex;
    }
    AddSystemMenu();
    // End:0x8f
    if(i_FrameBG != none)
    {
        i_FrameBG.__OnPreDraw__Delegate = AlignFrame;
    }
}

function bool AlignFrame(Canvas C)
{
    local float temp;

    temp = ActualHeight();
    // End:0x2e
    if(t_WindowTitle != none)
    {
        temp -= t_WindowTitle.ActualHeight() * 0.50;
    }
    i_FrameBG.WinHeight = i_FrameBG.RelativeHeight(temp);
    temp = ActualTop();
    // End:0x7c
    if(t_WindowTitle != none)
    {
        temp += t_WindowTitle.ActualHeight() * 0.50;
    }
    i_FrameBG.WinTop = i_FrameBG.RelativeTop(temp);
    return bInit;
}

function AddSystemMenu()
{
    local XInterface.GUI.eFontScale tFontScale;

    // End:0xfb
    if(b_ExitButton != none && t_WindowTitle != none)
    {
        b_ExitButton = GUIButton(t_WindowTitle.AddComponent("XInterface.GUIButton"));
        b_ExitButton.Style = Controller.GetStyle("CloseButton", tFontScale);
        b_ExitButton.__OnClick__Delegate = XButtonClicked;
        b_ExitButton.bNeverFocus = true;
        b_ExitButton.FocusInstead = t_WindowTitle;
        b_ExitButton.RenderWeight = 1.0;
        b_ExitButton.bScaleToParent = false;
        b_ExitButton.__OnPreDraw__Delegate = SystemMenuPreDraw;
        b_ExitButton.bRepeatClick = false;
    }
}

function bool SystemMenuPreDraw(Canvas Canvas)
{
    // End:0x0d
    if(t_WindowTitle == none)
    {
        return false;
    }
    b_ExitButton.SetPosition(t_WindowTitle.ActualLeft() + t_WindowTitle.ActualWidth() - float(35), t_WindowTitle.ActualTop(), 24.0, 24.0, true);
    return true;
}

function CheckBounds()
{
    local float AH, AW, AL, AT;

    AW = FClamp(ActualWidth(), 0.0, float(Controller.ResX));
    AH = FClamp(ActualHeight(), 0.0, float(Controller.ResY));
    AT = FClamp(ActualTop(), 0.0, float(Controller.ResY) - AH);
    AL = FClamp(ActualLeft(), 0.0, float(Controller.ResX) - AW);
    SetPosition(AL, AT, AW, AH, true);
}

function SetDefaultPosition()
{
    local float rH, rW;

    // End:0x0d
    if(!bPositioned)
    {
        return;
    }
    bInit = false;
    // End:0x2b
    if(!bResizeWidthAllowed)
    {
        DefaultWidth = WinWidth;
    }
    // End:0x41
    if(!bResizeHeightAllowed)
    {
        DefaultHeight = WinHeight;
    }
    // End:0x62
    if(!bMoveAllowed)
    {
        DefaultLeft = WinLeft;
        DefaultTop = WinTop;
    }
    rW = FClamp(RelativeWidth(DefaultWidth), RelativeWidth(MinPageWidth), RelativeWidth(MaxPageWidth));
    rH = FClamp(RelativeHeight(DefaultHeight), RelativeHeight(MinPageHeight), RelativeHeight(MaxPageHeight));
    SetPosition(FClamp(RelativeLeft(DefaultLeft), 0.0, RelativeLeft(float(Controller.ResX)) - rW), FClamp(RelativeTop(DefaultTop), 0.0, RelativeTop(float(Controller.ResY)) - rH), rW, rH);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0xb8
    if(Sender == self)
    {
        // End:0x28
        if(bSetControlsBoundToParent)
        {
            NewComp.bBoundToParent = true;
        }
        // End:0x39
        else
        {
            NewComp.bBoundToParent = false;
        }
        // End:0x56
        if(bSetControlsScaleToParent)
        {
            NewComp.bScaleToParent = true;
        }
        // End:0x67
        else
        {
            NewComp.bScaleToParent = false;
        }
        // End:0x91
        if(!bResizeHeightAllowed && bResizeWidthAllowed)
        {
            NewComp.ScalingType = 1;
        }
        // End:0xb8
        else
        {
            // End:0xb8
            if(!bResizeWidthAllowed && bResizeHeightAllowed)
            {
                NewComp.ScalingType = 2;
            }
        }
    }
}

event SetFocus(GUIComponent Who)
{
    // End:0x25
    if(UT2K4GUIController(Controller) != none)
    {
        UT2K4GUIController(Controller).SetFocusTo(self);
    }
    super(GUIPage).SetFocus(Who);
}

function FloatingMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x18
    if(Controller == none || bRepeat)
    {
        return;
    }
    TSizing = bResizeHeightAllowed && HoveringTopBorder();
    RSizing = bResizeWidthAllowed && HoveringRightBorder();
    LSizing = bResizeWidthAllowed && HoveringLeftBorder();
    BtSizing = bResizeHeightAllowed && HoveringBottomBorder();
    bMoving = bMoveAllowed && Controller.ActiveControl == t_WindowTitle && !TSizing || RSizing || BtSizing || LSizing;
    // End:0x11f
    if(TSizing)
    {
        // End:0x11c
        if(RSizing || LSizing)
        {
            TRSizing = RSizing;
            TLSizing = LSizing;
            TSizing = false;
            RSizing = false;
            LSizing = false;
        }
    }
    // End:0x16e
    else
    {
        // End:0x16e
        if(BtSizing)
        {
            // End:0x16e
            if(RSizing || LSizing)
            {
                BRSizing = RSizing;
                BLSizing = LSizing;
                BtSizing = false;
                RSizing = false;
                LSizing = false;
            }
        }
    }
    // End:0x19f
    if(bMoving)
    {
        SetMouseCursorIndex(1);
        UpdateOffset(ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3]);
    }
    bResizing = bMoving || TSizing || TRSizing || RSizing || BRSizing || BtSizing || BLSizing || LSizing || TLSizing;
    bCaptureMouse = bResizing;
    // End:0x232
    if(t_WindowTitle != none)
    {
        t_WindowTitle.bCaptureMouse = bCaptureMouse;
    }
}

function FloatingMouseRelease(GUIComponent Sender)
{
    local bool bSave;

    bSave = bCaptureMouse;
    bResizing = false;
    bCaptureMouse = false;
    t_WindowTitle.bCaptureMouse = false;
    // End:0x7c
    if(bMoving)
    {
        SetPosition(Controller.MouseX - MouseOffset[0], Controller.MouseY - MouseOffset[1], WinWidth, WinHeight, true);
        CheckBounds();
    }
    bMoving = false;
    TSizing = false;
    BtSizing = false;
    RSizing = false;
    LSizing = false;
    TLSizing = false;
    BLSizing = false;
    TRSizing = false;
    BRSizing = false;
    SetMouseCursorIndex(default.MouseCursorIndex);
    UpdateOffset(-1.0, -1.0, -1.0, -1.0);
    // End:0xf5
    if(bSave)
    {
        SaveCurrentPosition();
    }
}

function SaveCurrentPosition()
{
    DefaultLeft = WinLeft;
    DefaultTop = WinTop;
    DefaultWidth = WinWidth;
    DefaultHeight = WinHeight;
    SaveConfig();
}

function bool FloatingHover(GUIComponent Sender)
{
    // End:0x0d
    if(!ResizeAllowed())
    {
        return false;
    }
    // End:0x18
    if(bCaptureMouse)
    {
        return true;
    }
    // End:0x58
    if(bResizeHeightAllowed && bResizeWidthAllowed && BLSizing || TRSizing || HoveringBottomLeft())
    {
        SetMouseCursorIndex(2);
    }
    // End:0x123
    else
    {
        // End:0x98
        if(bResizeHeightAllowed && bResizeWidthAllowed && TLSizing || BRSizing || HoveringTopLeft())
        {
            SetMouseCursorIndex(4);
        }
        // End:0x123
        else
        {
            // End:0xd8
            if(bResizeHeightAllowed && TSizing || BtSizing || HoveringTopBorder() || HoveringBottomBorder())
            {
                SetMouseCursorIndex(3);
            }
            // End:0x123
            else
            {
                // End:0x118
                if(bResizeWidthAllowed && LSizing || RSizing || HoveringLeftBorder() || HoveringRightBorder())
                {
                    SetMouseCursorIndex(5);
                }
                // End:0x123
                else
                {
                    SetMouseCursorIndex(default.MouseCursorIndex);
                }
            }
        }
    }
    return true;
}

function SetPanelPosition(Canvas C);
function bool FloatingPreDraw(Canvas C)
{
    local float OldW, OldH, DiffX, DiffY, AW, AT,
	    AH, AL;

    InternalOnPreDraw(C);
    // End:0x1a
    if(bInit)
    {
        SetDefaultPosition();
    }
    // End:0x32
    if(!bCaptureMouse || bMoving)
    {
        return false;
    }
    SetPanelPosition(C);
    AL = ActualLeft();
    AT = ActualTop();
    AW = ActualWidth();
    AH = ActualHeight();
    OldH = AH;
    OldW = AW;
    // End:0x13f
    if(TLSizing)
    {
        DiffX = Controller.MouseX - AL;
        DiffY = Controller.MouseY - AT;
        WinWidth = RelativeWidth(FClamp(AW - DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)));
        WinHeight = RelativeHeight(FClamp(AH - DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)));
        SetPosition(AL + OldW - ActualWidth(), AT + OldH - ActualHeight(), WinWidth, WinHeight, true);
        ResizedBoth();
        return true;
    }
    // End:0x1f4
    if(TRSizing)
    {
        DiffX = Controller.MouseX - AL + AW;
        DiffY = Controller.MouseY - AT;
        WinHeight = RelativeHeight(FClamp(AH - DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)));
        SetPosition(WinLeft, AT + OldH - ActualHeight(), FClamp(AW + DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)), WinHeight, true);
        ResizedBoth();
        return true;
    }
    // End:0x2a9
    if(BLSizing)
    {
        DiffX = Controller.MouseX - AL;
        DiffY = Controller.MouseY - AT + AH;
        WinWidth = RelativeWidth(FClamp(AW - DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)));
        SetPosition(AL + OldW - ActualWidth(), WinTop, WinWidth, FClamp(AH + DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)), true);
        ResizedBoth();
        return true;
    }
    // End:0x34b
    if(BRSizing)
    {
        DiffX = Controller.MouseX - AL + AW;
        DiffY = Controller.MouseY - AT + AH;
        SetPosition(WinLeft, WinTop, FClamp(AW + DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)), FClamp(AH + DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)), true);
        ResizedBoth();
        return true;
    }
    // End:0x3c5
    if(TSizing)
    {
        DiffY = Controller.MouseY - AT;
        WinHeight = RelativeHeight(FClamp(AH - DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)));
        SetPosition(WinLeft, AT + OldH - ActualHeight(), WinWidth, WinHeight, true);
        ResizedHeight();
        return true;
    }
    // End:0x43f
    if(LSizing)
    {
        DiffX = Controller.MouseX - AL;
        WinWidth = RelativeWidth(FClamp(AW - DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)));
        SetPosition(AL + OldW - ActualWidth(), WinTop, WinWidth, WinHeight, true);
        ResizedWidth();
        return true;
    }
    // End:0x4a6
    if(RSizing)
    {
        DiffX = Controller.MouseX - AL + AW;
        SetPosition(WinLeft, WinTop, FClamp(AW + DiffX, ActualWidth(MinPageWidth), ActualWidth(MaxPageWidth)), WinHeight, true);
        ResizedWidth();
        return true;
    }
    // End:0x50d
    if(BtSizing)
    {
        DiffY = Controller.MouseY - AT + AH;
        SetPosition(WinLeft, WinTop, WinWidth, FClamp(AH + DiffY, ActualHeight(MinPageHeight), ActualHeight(MaxPageHeight)), true);
        ResizedHeight();
        return true;
    }
    return false;
}

function FloatingRendered(Canvas C)
{
    // End:0x0d
    if(!bMoving)
    {
        return;
    }
    C.SetPos(FClamp(Controller.MouseX - MouseOffset[0], 0.0, float(Controller.ResX) - ActualWidth()), FClamp(Controller.MouseY - MouseOffset[1], 0.0, float(Controller.ResY) - ActualHeight()));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTileStretched(Controller.WhiteBorder, ActualWidth(), ActualHeight());
}

event ResolutionChanged(int ResX, int ResY)
{
    bInit = true;
    super(GUIComponent).ResolutionChanged(ResX, ResY);
}

function ResizedBoth();
function ResizedWidth();
function ResizedHeight();
function bool ResizeAllowed()
{
    return bResizeHeightAllowed || bResizeWidthAllowed;
}

function bool HoveringLeftBorder()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return Controller.MouseX > Bounds[0] - float(5) && Controller.MouseX < Bounds[0] + float(5);
}

function bool HoveringRightBorder()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return Controller.MouseX > Bounds[2] - float(5) && Controller.MouseX < Bounds[2] + float(5);
}

function bool HoveringTopBorder()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return Controller.MouseY > Bounds[1] - float(5) && Controller.MouseY < Bounds[1] + float(5);
}

function bool HoveringBottomBorder()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return Controller.MouseY > Bounds[3] - float(5) && Controller.MouseY < Bounds[3] + float(5);
}

function bool HoveringTopLeft()
{
    return HoveringLeftBorder() && HoveringTopBorder() || HoveringRightBorder() && HoveringBottomBorder();
}

function bool HoveringBottomLeft()
{
    return HoveringRightBorder() && HoveringTopBorder() || HoveringLeftBorder() && HoveringBottomBorder();
}

function bool XButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function SetMouseCursorIndex(int NewIndex)
{
    MouseCursorIndex = NewIndex;
    // End:0x31
    if(MouseCursorIndex == default.MouseCursorIndex)
    {
        t_WindowTitle.MouseCursorIndex = HeaderMouseCursorIndex;
    }
    // End:0x45
    else
    {
        t_WindowTitle.MouseCursorIndex = NewIndex;
    }
}

defaultproperties
{
    begin object name=TitleBar class=GUIHeader
        bUseTextHeight=true
        WinHeight=0.043750
        RenderWeight=0.10
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        bNeverFocus=true
        ScalingType=1
        OnMousePressed=FloatingMousePressed
        OnMouseRelease=FloatingMouseRelease
    object end
    // Reference: GUIHeader'FloatingWindow.TitleBar'
    t_WindowTitle=TitleBar
    MinPageWidth=0.10
    MinPageHeight=0.10
    MaxPageHeight=1.0
    MaxPageWidth=1.0
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bMoveAllowed=true
    DefaultLeft=0.20
    DefaultTop=0.20
    DefaultWidth=0.60
    DefaultHeight=0.60
    HeaderMouseCursorIndex=1
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    InactiveFadeColor=(R=255,G=255,B=255,A=255)
    OnCreateComponent=InternalOnCreateComponent
    OnPreDraw=FloatingPreDraw
    OnRendered=FloatingRendered
    OnHover=FloatingHover
    OnMousePressed=FloatingMousePressed
    OnMouseRelease=FloatingMouseRelease
}