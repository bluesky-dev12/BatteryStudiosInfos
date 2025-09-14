/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIComponent.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Structs:1
 *	Properties:114
 *	Functions:115
 *
 *******************************************************************************/
class GUIComponent extends GUI
    dependson(GUI)
    dependson(GUIToolTip)
    dependson(GUIController)
    dependson(GUILabel)
    native
    editinlinenew
    abstract
    instanced;

enum EClickSound
{
    CS_None,
    CS_Click,
    CS_Edit,
    CS_Up,
    CS_Down,
    CS_Drag,
    CS_Fade,
    CS_Hover,
    CS_Slide,
    CS_Weapon
};

enum EParentScaleType
{
    SCALE_All,
    SCALE_X,
    SCALE_Y
};

struct native TimerData
{
    var bool bLoop;
    var name FuncName;
    var float Rate;
    var float Count;
};

var const array<TimerData> Timers;
var(Menu) editconst noexport editinline GUIPage PageOwner;
var(Menu) editconst noexport editinline GUIComponent MenuOwner;
var(State) noexport editinline GUIComponent FocusInstead;
var(State) noexport GUI.eMenuState MenuState;
var(State) editconst noexport GUI.eMenuState LastMenuState;
var(State) noexport GUI.eDropState DropState;
var(Style) GUI.eFontScale FontScale;
var Canvas CurrentCanvas;
var() string IniOption;
var() string IniDefault;
var(Style) string StyleName;
var() localized string Hint;
var() noexport editinline GUILabel FriendlyLabel;
var(Menu) float WinTop;
var(Menu) float WinLeft;
var(Menu) float WinWidth;
var(Menu) float WinHeight;
var(Menu) bool bUseAWinPos;
var(Menu) FloatBox AWinPos;
var() FloatBox RWinPos;
var(Menu) FloatBox AWinFrame;
var() float RenderWeight;
var(Style) int MouseCursorIndex;
var(Menu) int TabOrder;
var() int Tag;
var() bool bDebugging;
var(Menu) bool bTabStop;
var() bool bFocusOnWatch;
var(Menu) bool bBoundToParent;
var(Menu) bool bScaleToParent;
var(State) noexport bool bHasFocus;
var(State) bool bVisible;
var(State) bool bAcceptsInput;
var() bool bCaptureTabs;
var(State) bool bCaptureMouse;
var(State) bool bNeverFocus;
var(State) bool bRepeatClick;
var(State) bool bRequireReleaseClick;
var() bool bMouseOverSound;
var() bool bDropSource;
var() bool bDropTarget;
var(State) noexport bool bPendingFocus;
var() bool bInit;
var() bool bNeverScale;
var const noexport bool bRequiresStyle;
var() const editconst noexport bool bPositioned;
var() editconst noexport bool bAnimating;
var() const editconst noexport bool bTravelling;
var() const editconst noexport bool bSizing;
var() const editconst noexport array<editconst Vector> MotionFrame;
var() const editconst noexport array<editconst Vector> SizeFrame;
var(Menu) const editconst noexport float Bounds[4];
var(Menu) const editconst noexport float ClientBounds[4];
var() bool bTimerRepeat;
var() const editconst noexport int TimerIndex;
var() float TimerCountdown;
var() float TimerInterval;
var const noexport float MouseOffset[4];
var() editconst export editinline GUIContextMenu ContextMenu;
var() editconst export editinline GUIToolTip ToolTip;
var const noexport Color WhiteColor;
var(Style) noexport editinline GUIStyles Style;
var(Style) GUIComponent.EClickSound OnClickSound;
var() GUIComponent.EParentScaleType BoundingType;
var() GUIComponent.EParentScaleType ScalingType;
var(Menu) bool bStandardized;
var(Menu) float StandardHeight;
var bool bFlicker;
var const editconst noexport int PreDrawCount;
var const editconst noexport int DrawCount;
var editconst noexport int OnRenderCount;
var editconst noexport int OnRenderedCount;
var editconst noexport int OnPreDrawCount;
var editconst noexport int OnDrawCount;
var bool bIsDisableHover;
var bool bAlwaysFocus;
var delegate<OnArrival> __OnArrival__Delegate;
var delegate<OnEndAnimation> __OnEndAnimation__Delegate;
var delegate<OnPreDraw> __OnPreDraw__Delegate;
var delegate<OnDraw> __OnDraw__Delegate;
var delegate<OnRender> __OnRender__Delegate;
var delegate<OnRendered> __OnRendered__Delegate;
var delegate<OnActivate> __OnActivate__Delegate;
var delegate<OnDeActivate> __OnDeActivate__Delegate;
var delegate<OnWatch> __OnWatch__Delegate;
var delegate<OnHitTest> __OnHitTest__Delegate;
var delegate<OnMessage> __OnMessage__Delegate;
var delegate<OnHide> __OnHide__Delegate;
var delegate<OnShow> __OnShow__Delegate;
var delegate<OnBeginTooltip> __OnBeginTooltip__Delegate;
var delegate<OnEndTooltip> __OnEndTooltip__Delegate;
var delegate<OnInvalidate> __OnInvalidate__Delegate;
var delegate<OnHover> __OnHover__Delegate;
var delegate<OnClick> __OnClick__Delegate;
var delegate<OnDblClick> __OnDblClick__Delegate;
var delegate<OnRightClick> __OnRightClick__Delegate;
var delegate<OnMousePressed> __OnMousePressed__Delegate;
var delegate<OnMouseRelease> __OnMouseRelease__Delegate;
var delegate<OnTimer> __OnTimer__Delegate;
var delegate<OnChange> __OnChange__Delegate;
var delegate<OnKeyType> __OnKeyType__Delegate;
var delegate<OnKeyEvent> __OnKeyEvent__Delegate;
var delegate<OnDesignModeKeyEvent> __OnDesignModeKeyEvent__Delegate;
var delegate<OnCapturedMouseMove> __OnCapturedMouseMove__Delegate;
var delegate<OnLoadINI> __OnLoadINI__Delegate;
var delegate<OnSaveINI> __OnSaveINI__Delegate;
var delegate<OnMultiSelect> __OnMultiSelect__Delegate;
var delegate<OnBeginDrag> __OnBeginDrag__Delegate;
var delegate<OnEndDrag> __OnEndDrag__Delegate;
var delegate<OnDragDrop> __OnDragDrop__Delegate;
var delegate<OnDragEnter> __OnDragEnter__Delegate;
var delegate<OnDragLeave> __OnDragLeave__Delegate;
var delegate<OnDragOver> __OnDragOver__Delegate;

delegate OnArrival(GUIComponent Sender, GUI.EAnimationType Type);
delegate OnEndAnimation(GUIComponent Sender, GUI.EAnimationType Type);
delegate bool OnPreDraw(Canvas Canvas)
{
    CurrentCanvas = Canvas;
    // End:0x14
    if(0 < 1)
    {
        return false;
    }
    ++ OnPreDrawCount;
    // End:0x53
    if(OnPreDrawCount > 0)
    {
        Log("OnPreDraw called" @ string(OnPreDrawCount) @ "times: " $ GetMenuPath());
    }
    return false;
}

delegate bool OnDraw(Canvas Canvas)
{
    CurrentCanvas = Canvas;
    // End:0x14
    if(0 < 1)
    {
        return false;
    }
    ++ OnDrawCount;
    // End:0x50
    if(OnDrawCount > 0)
    {
        Log("OnDraw called" @ string(OnDrawCount) @ "times: " $ GetMenuPath());
    }
    return false;
}

delegate OnRender(Canvas Canvas)
{
    CurrentCanvas = Canvas;
    // End:0x14
    if(0 < 1)
    {
        return;
    }
    ++ OnRenderCount;
    // End:0x52
    if(OnRenderCount > 0)
    {
        Log("OnRender called" @ string(OnRenderCount) @ "times: " $ GetMenuPath());
    }
}

delegate OnRendered(Canvas Canvas)
{
    CurrentCanvas = Canvas;
    // End:0x14
    if(0 < 1)
    {
        return;
    }
    ++ OnRenderedCount;
    // End:0x53
    if(OnRenderedCount > 0)
    {
        Log("OnRendered called" @ string(OnRenderedCount) @ "times:" @ GetMenuPath());
    }
}

delegate OnActivate();
delegate OnDeActivate();
delegate OnWatch();
delegate OnHitTest(float MouseX, float MouseY);
delegate OnMessage(coerce string Msg, float MsgLife);
delegate OnHide();
delegate OnShow();
delegate GUIToolTip OnBeginTooltip()
{
    // End:0x22
    if(ToolTip != none)
    {
        return ToolTip.EnterArea();
    }
    // End:0x41
    else
    {
        // End:0x41
        if(MenuOwner != none)
        {
            return MenuOwner.OnBeginTooltip();
        }
    }
    return none;
}

delegate bool OnEndTooltip()
{
    // End:0x22
    if(ToolTip != none)
    {
        return ToolTip.LeaveArea();
    }
    // End:0x41
    else
    {
        // End:0x41
        if(MenuOwner != none)
        {
            return MenuOwner.OnEndTooltip();
        }
    }
    return true;
}

delegate OnInvalidate(GUIComponent Who);
delegate bool OnHover(GUIComponent Sender)
{
    return false;
}

delegate bool OnClick(GUIComponent Sender);
delegate bool OnDblClick(GUIComponent Sender);
delegate bool OnRightClick(GUIComponent Sender);
delegate OnMousePressed(GUIComponent Sender, bool bRepeat);
delegate OnMouseRelease(GUIComponent Sender);
delegate OnTimer(GUIComponent Sender);
delegate OnChange(GUIComponent Sender);
delegate bool OnKeyType(out byte key, optional string Unicode)
{
    return false;
}

delegate bool OnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
}

delegate bool OnDesignModeKeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction State)
{
    return false;
}

delegate bool OnCapturedMouseMove(float deltaX, float deltaY)
{
    return false;
}

delegate OnLoadINI(GUIComponent Sender, string S);
delegate string OnSaveINI(GUIComponent Sender);
delegate bool OnMultiSelect(GUIComponent Sender)
{
    return true;
}

delegate bool OnBeginDrag(GUIComponent Sender)
{
    return bDropSource;
}

delegate OnEndDrag(GUIComponent Sender, bool bAccepted);
delegate bool OnDragDrop(GUIComponent Sender)
{
    return false;
}

delegate OnDragEnter(GUIComponent Sender);
delegate OnDragLeave(GUIComponent Sender);
delegate OnDragOver(GUIComponent Sender);
// Export UGUIComponent::execPlayerOwner(FFrame&, void* const)
native(812) final function PlayerController PlayerOwner();
// Export UGUIComponent::execSetTimer(FFrame&, void* const)
native(813) final function SetTimer(float Interval, optional bool bRepeat, optional name TimerFunc);
// Export UGUIComponent::execKillTimer(FFrame&, void* const)
native(814) final function KillTimer(optional name TimerFunc);
// Export UGUIComponent::execAutoPosition(FFrame&, void* const)
native(815) final function AutoPosition(array<export editinline GUIComponent> Components, float LeftBound, float UpperBound, float RightBound, float LowerBound, float LeftPad, float UpperPad, float RightPad, float LowerPad, optional int NumberOfColumns, optional float ColumnPadding);
// Export UGUIComponent::execAutoPositionOn(FFrame&, void* const)
native(816) final function AutoPositionOn(array<export editinline GUIComponent> Components, GUIComponent frame, float LeftPadPerc, float UpperPadPerc, float RightPadPerc, float LowerPadPerc, optional int NumberOfColumns, optional float ColumnPadding);
// Export UGUIComponent::execUpdateOffset(FFrame&, void* const)
native(817) final function UpdateOffset(float PosX, float PosY, float PosW, float PosH);
// Export UGUIComponent::execUpdateBounds(FFrame&, void* const)
native final function UpdateBounds();
// Export UGUIComponent::execActualWidth(FFrame&, void* const)
native(820) final function float ActualWidth(coerce optional float val, optional bool bForce);
// Export UGUIComponent::execActualHeight(FFrame&, void* const)
native(821) final function float ActualHeight(coerce optional float val, optional bool bForce);
// Export UGUIComponent::execActualLeft(FFrame&, void* const)
native(822) final function float ActualLeft(coerce optional float val, optional bool bForce);
// Export UGUIComponent::execActualTop(FFrame&, void* const)
native(823) final function float ActualTop(coerce optional float val, optional bool bForce);
// Export UGUIComponent::execRelativeLeft(FFrame&, void* const)
native(824) final function float RelativeLeft(coerce optional float RealLeft, optional bool bForce);
// Export UGUIComponent::execRelativeTop(FFrame&, void* const)
native(825) final function float RelativeTop(coerce optional float RealTop, optional bool bForce);
// Export UGUIComponent::execRelativeWidth(FFrame&, void* const)
native(826) final function float RelativeWidth(coerce optional float RealWidth, optional bool bForce);
// Export UGUIComponent::execRelativeHeight(FFrame&, void* const)
native(827) final function float RelativeHeight(coerce optional float RealHeight, optional bool bForce);
event ResolutionChanged(int ResX, int ResY);
function SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, optional bool bForceRelative)
{
    // End:0x8c
    if(bDebugging && Controller == none || Controller.bModAuthor)
    {
        Log(string(Name) $ ".SetPosition( " $ string(NewLeft) $ "," @ string(NewTop) $ "," @ string(NewWidth) $ "," @ string(NewHeight) $ "," @ string(bForceRelative), 'ModAuthor');
    }
    // End:0xd0
    if(bForceRelative)
    {
        WinLeft = RelativeLeft(NewLeft);
        WinTop = RelativeTop(NewTop);
        WinWidth = RelativeWidth(NewWidth);
        WinHeight = RelativeHeight(NewHeight);
    }
    // End:0xfc
    else
    {
        WinLeft = NewLeft;
        WinTop = NewTop;
        WinWidth = NewWidth;
        WinHeight = NewHeight;
    }
    // End:0x1f0
    if(bDebugging && bForceRelative && Controller == none || Controller.bModAuthor)
    {
        Log(string(Name) @ "SetPosition() Current L:" $ string(WinLeft) $ "(" $ string(Bounds[0]) $ ") T:" $ string(WinTop) $ "(" $ string(Bounds[1]) $ ") W:" $ string(WinWidth) $ "(" $ string(Bounds[0] + Bounds[2]) $ ") H:" $ string(WinHeight) $ "(" $ string(Bounds[1] + Bounds[3]) $ ")", 'ModAuthor');
    }
}

// Export UGUIComponent::execIsCorrectUserName(FFrame&, void* const)
native final function int IsCorrectUserName(string strUserName);
// Export UGUIComponent::execIsCorrectUserName_China(FFrame&, void* const)
native final function int IsCorrectUserName_China(string strUserName);
// Export UGUIComponent::execIsCorrectUserName_THAILAND(FFrame&, void* const)
native final function int IsCorrectUserName_THAILAND(string strUserName);
// Export UGUIComponent::execIsInIncompleteLetter(FFrame&, void* const)
native final function bool IsInIncompleteLetter(string strUserName);
// Export UGUIComponent::execGetMenuPath(FFrame&, void* const)
native(828) final function string GetMenuPath();
// Export UGUIComponent::execSpecialHit(FFrame&, void* const)
native(829) final function bool SpecialHit(optional bool bForce);
event string AdditionalDebugString()
{
    return "";
}

event Timer()
{
    OnTimer(self);
}

event Opened(GUIComponent Sender)
{
    LoadINI();
    // End:0x32
    if(ToolTip != none)
    {
        ToolTip.InitComponent(Controller, self);
        SetToolTipText(Hint);
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    // End:0x11
    if(!bCancelled)
    {
        SaveINI();
    }
}

event free()
{
    MenuOwner = none;
    PageOwner = none;
    Controller = none;
    FocusInstead = none;
    FriendlyLabel = none;
    Style = none;
    // End:0x44
    if(ToolTip != none)
    {
        ToolTip.free();
    }
    ToolTip = none;
}

function string LoadINI()
{
    local string S;

    // End:0x1a
    if(PlayerOwner() == none || IniOption == "")
    {
        return "";
    }
    // End:0x3f
    if(IniOption ~= "@Internal")
    {
        OnLoadINI(self, "");
        return "";
    }
    S = PlayerOwner().ConsoleCommand("get" @ IniOption);
    // End:0x75
    if(S == "")
    {
        S = IniDefault;
    }
    OnLoadINI(self, S);
    return S;
}

function SaveINI(optional string Value)
{
    // End:0x0b
    if(PlayerOwner() == none)
    {
        return;
    }
    OnSaveINI(self);
}

static function string StripColorCodes(string InString)
{
    local int CodePos;

    CodePos = InStr(InString, Chr(27));
    J0x11:
    // End:0x58 [While If]
    if(CodePos != -1)
    {
        InString = Left(InString, CodePos) $ Mid(InString, CodePos + 4);
        CodePos = InStr(InString, Chr(27));
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    return InString;
}

static function string MakeColorCode(Color NewColor)
{
    // End:0x1f
    if(NewColor.R == 0)
    {
        NewColor.R = 1;
    }
    // End:0x3e
    if(NewColor.G == 0)
    {
        NewColor.G = 1;
    }
    // End:0x5d
    if(NewColor.B == 0)
    {
        NewColor.B = 1;
    }
    return Chr(27) $ Chr(NewColor.R) $ Chr(NewColor.G) $ Chr(NewColor.B);
}

event MenuStateChange(GUI.eMenuState NewState)
{
    // End:0x1b
    if(MenuState != 1)
    {
        LastMenuState = MenuState;
    }
    bPendingFocus = false;
    MenuState = NewState;
    switch(MenuState)
    {
        // End:0x58
        case 2:
            // End:0x50
            if(!bNeverFocus)
            {
                bHasFocus = true;
            }
            // End:0xfd
            else
            {
                MenuState = 0;
        // End:0x94
        case 0:
        bHasFocus = false;
        // End:0x91
        if(LastMenuState != 0 && LastMenuState != 4)
        {
            OnDeActivate();
        }
        // End:0xfd
        break;
    // End:0xb8
    case 1:
        // End:0xab
        if(bFocusOnWatch)
        {
            SetFocus(none);
            return;
        }
        OnWatch();
        // End:0xfd
        break;
    // End:0xfa
    case 4:
        Controller.ActiveControl = Controller.ActivePage;
        Controller.FocusedControl = Controller.ActivePage;
        // End:0xfd
        break;
    // End:0xffff
    default:
    }
    // End:0x11c
    if(FriendlyLabel != none)
    {
        FriendlyLabel.MenuState = MenuState;
    }
}

event bool IsMultiSelect()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return bDropSource && DropState != 1 && Controller.CtrlPressed && OnMultiSelect(self);
}

event DropStateChange(GUI.eDropState NewState)
{
    // End:0x0d
    if(Controller == none)
    {
        return;
    }
    switch(NewState)
    {
        // End:0x9f
        case 0:
            // End:0x61
            if(Controller.DropTarget == self)
            {
                OnDragLeave(self);
                Controller.DropTarget = none;
                // End:0x5e
                if(Controller.DropSource == self)
                {
                    return;
                }
            }
            // End:0x9c
            else
            {
                // End:0x9c
                if(Controller.DropSource == self)
                {
                    UpdateOffset(0.0, 0.0, 0.0, 0.0);
                    Controller.DropSource = none;
                }
            }
            // End:0x1d6
            break;
        // End:0xda
        case 1:
            // End:0xb6
            if(!OnBeginDrag(self))
            {
                return;
            }
            Controller.DropSource = self;
            Controller.PlayInterfaceSound(5);
            // End:0x1d6
            break;
        // End:0x10d
        case 2:
            Controller.DropTarget = self;
            // End:0x10a
            if(DropState == 0)
            {
                OnDragEnter(self);
            }
            // End:0x1d6
            break;
        // End:0x170
        case 3:
            Controller.PlayInterfaceSound(3);
            // End:0x155
            if(Controller.DropSource != none)
            {
                Controller.DropSource.OnEndDrag(self, true);
            }
            Controller.DropTarget = none;
            NewState = 0;
            // End:0x1d6
            break;
        // End:0x1d3
        case 4:
            Controller.PlayInterfaceSound(4);
            // End:0x1b8
            if(Controller.DropSource != none)
            {
                Controller.DropSource.OnEndDrag(self, false);
            }
            Controller.DropTarget = none;
            NewState = 0;
            // End:0x1d6
            break;
        // End:0xffff
        default:
            DropState = NewState;
}

event InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Controller = MyController;
    MenuOwner = myOwner;
    PageOwner = OwnerPage();
    // End:0x4c
    if(Style == none)
    {
        Style = Controller.GetStyle(StyleName, FontScale);
    }
    // End:0x5b
    if(bUseAWinPos)
    {
        ApplyAWinPos();
    }
}

function GUIComponent GetTopMenuOwner()
{
    // End:0x1e
    if(MenuOwner != none)
    {
        return MenuOwner.GetTopMenuOwner();
    }
    // End:0x20
    else
    {
        return self;
    }
}

function ApplyAWinPos()
{
    local export editinline GUIComponent TopOwner;

    TopOwner = GetTopMenuOwner();
    WinLeft = AWinPos.X1 + TopOwner.AWinFrame.X1 / TopOwner.AWinFrame.X2 - TopOwner.AWinFrame.X1;
    WinTop = AWinPos.Y1 + TopOwner.AWinFrame.Y1 / TopOwner.AWinFrame.Y2 - TopOwner.AWinFrame.Y1;
    WinWidth = AWinPos.X2 - AWinPos.X1 / TopOwner.AWinFrame.X2 - TopOwner.AWinFrame.X1;
    WinHeight = AWinPos.Y2 - AWinPos.Y1 / TopOwner.AWinFrame.Y2 - TopOwner.AWinFrame.Y1;
    RWinPos.X1 = AWinPos.X1 + TopOwner.AWinFrame.X1;
    RWinPos.Y1 = AWinPos.Y1 + TopOwner.AWinFrame.Y1;
    RWinPos.X2 = RWinPos.X1 + AWinPos.X2 - AWinPos.X1 * TopOwner.AWinFrame.X2 - TopOwner.AWinFrame.X1 / AWinFrame.X2 - AWinFrame.X1;
    RWinPos.Y2 = RWinPos.Y1 + AWinPos.Y2 - AWinPos.Y1 * TopOwner.AWinFrame.Y2 - TopOwner.AWinFrame.Y1 / AWinFrame.Y2 - AWinFrame.Y1;
}

function TraversalApplyAWinPos()
{
    ApplyAWinPos();
}

function bool IsInBounds()
{
    return Controller.MouseX >= Bounds[0] && Controller.MouseX <= Bounds[2] && Controller.MouseY >= Bounds[1] && Controller.MouseY <= Bounds[3];
}

function bool IsInClientBounds()
{
    return Controller.MouseX >= ClientBounds[0] && Controller.MouseX <= ClientBounds[2] && Controller.MouseY >= ClientBounds[1] && Controller.MouseY <= ClientBounds[3];
}

event bool CanAcceptFocus()
{
    return MenuState != 4 && bVisible && !bNeverFocus;
}

event SetFocus(GUIComponent Who)
{
    // End:0xa8
    if(Who == none)
    {
        // End:0x35
        if(bNeverFocus)
        {
            // End:0x33
            if(FocusInstead != none)
            {
                FocusInstead.SetFocus(Who);
            }
            return;
        }
        bPendingFocus = true;
        // End:0x83
        if(Controller.FocusedControl != none)
        {
            // End:0x6a
            if(Controller.FocusedControl == self)
            {
                return;
            }
            // End:0x83
            else
            {
                Controller.FocusedControl.LoseFocus(self);
            }
        }
        MenuStateChange(2);
        Controller.FocusedControl = self;
        OnActivate();
    }
    // End:0xb0
    else
    {
        MenuStateChange(2);
    }
    // End:0xcb
    if(MenuOwner != none)
    {
        MenuOwner.SetFocus(self);
    }
}

event LoseFocus(GUIComponent Sender)
{
    // End:0x1b
    if(Controller != none)
    {
        Controller.FocusedControl = none;
    }
    // End:0x33
    if(MenuState != 4)
    {
        MenuStateChange(0);
    }
    // End:0x4e
    if(MenuOwner != none)
    {
        MenuOwner.LoseFocus(self);
    }
}

event bool FocusFirst(GUIComponent Sender)
{
    // End:0x1a
    if(!bTabStop || !CanAcceptFocus())
    {
        return false;
    }
    SetFocus(none);
    return true;
}

event bool FocusLast(GUIComponent Sender)
{
    // End:0x1a
    if(!bTabStop || !CanAcceptFocus())
    {
        return false;
    }
    SetFocus(none);
    return true;
}

event bool NextControl(GUIComponent Sender)
{
    // End:0x1c
    if(MenuOwner != none)
    {
        return MenuOwner.NextControl(self);
    }
    return false;
}

event bool PrevControl(GUIComponent Sender)
{
    // End:0x1c
    if(MenuOwner != none)
    {
        return MenuOwner.PrevControl(self);
    }
    return false;
}

event bool NextPage()
{
    // End:0x1b
    if(MenuOwner != none)
    {
        return MenuOwner.NextPage();
    }
    return false;
}

event bool PrevPage()
{
    // End:0x1b
    if(MenuOwner != none)
    {
        return MenuOwner.PrevPage();
    }
    return false;
}

function FillOwner()
{
    WinLeft = 0.0;
    WinTop = 0.0;
    WinWidth = 1.0;
    WinHeight = 1.0;
    bScaleToParent = true;
    bBoundToParent = true;
}

event SetVisibility(coerce bool bIsVisible)
{
    bVisible = bIsVisible;
    // End:0x23
    if(bVisible)
    {
        OnShow();
    }
    // End:0x2d
    else
    {
        OnHide();
    }
}

function CenterMouse()
{
    local PlayerController PC;
    local float MidX, MidY;

    PC = PlayerOwner();
    // End:0x68
    if(PC != none)
    {
        MidX = ActualLeft() + ActualWidth() / float(2);
        MidY = ActualTop() + ActualHeight() / float(2);
        PC.ConsoleCommand("SETMOUSE" @ string(MidX) @ string(MidY));
    }
}

event Hide()
{
    SetVisibility(false);
}

event Show()
{
    SetVisibility(true);
}

function SetFocusInstead(GUIComponent InFocusComp)
{
    // End:0x13
    if(InFocusComp != none)
    {
        bNeverFocus = true;
    }
    FocusInstead = InFocusComp;
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    FriendlyLabel = NewLabel;
}

function SetHint(string NewHint)
{
    Hint = NewHint;
    SetToolTipText(Hint);
}

function SetToolTipText(string NewToolTipText)
{
    // End:0x1f
    if(ToolTip != none)
    {
        ToolTip.SetTip(NewToolTipText);
    }
}

function SetTooltip(GUIToolTip InTooltip)
{
    // End:0x1e
    if(ToolTip != none)
    {
        ToolTip.LeaveArea();
    }
    ToolTip = InTooltip;
    // End:0x49
    if(ToolTip != none)
    {
        ToolTip.InitComponent(Controller, self);
    }
}

final function DebugFocus(GUIComponent Who, bool bLose)
{
    return;
    // End:0xdd
    if(Controller != none && Controller.CtrlPressed)
    {
        // End:0x84
        if(bLose)
        {
            // End:0x5c
            if(Who == none)
            {
                Log(string(Name) @ "losing focus chain down");
            }
            // End:0x81
            else
            {
                Log(string(Name) @ "losing focus of" @ string(Who));
            }
        }
        // End:0xdd
        else
        {
            // End:0xb7
            if(Who == none)
            {
                Log(string(Name) @ "sending focus chain down");
            }
            // End:0xdd
            else
            {
                Log(string(Name) @ "setting focus to" @ string(Who));
            }
        }
    }
}

final function DebugFocusPosition(GUIComponent Who, bool Last)
{
    return;
    // End:0xd2
    if(Controller.CtrlPressed)
    {
        // End:0x78
        if(Last)
        {
            // End:0x4c
            if(Who == none)
            {
                Log(string(Name) @ "FocusLast going down");
            }
            // End:0x75
            else
            {
                Log(string(Name) @ "FocusLast call from" @ string(Who));
            }
        }
        // End:0xd2
        else
        {
            // End:0xa8
            if(Who == none)
            {
                Log(string(Name) @ "FocusFirst going down");
            }
            // End:0xd2
            else
            {
                Log(string(Name) @ "FocusFirst call from" @ string(Who));
            }
        }
    }
}

event GUIPage OwnerPage()
{
    local export editinline GUIComponent C;

    // End:0x11
    if(PageOwner != none)
    {
        return PageOwner;
    }
    C = self;
    J0x18:
    // End:0x55 [While If]
    if(C != none)
    {
        // End:0x3e
        if(GUIPage(C) != none)
        {
            return GUIPage(C);
        }
        C = C.MenuOwner;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    Warn("OwnerPage not found!");
    return none;
}

event BeginAnimation(GUIComponent Animating)
{
    bAnimating = true;
    // End:0x27
    if(MenuOwner != none)
    {
        MenuOwner.BeginAnimation(Animating);
    }
}

event EndAnimation(GUIComponent Animating, GUI.EAnimationType Type)
{
    bAnimating = false;
    // End:0x2c
    if(MenuOwner != none)
    {
        MenuOwner.EndAnimation(Animating, Type);
    }
    // End:0x4b
    if(Animating == self)
    {
        OnEndAnimation(Animating, Type);
    }
}

function Animate(float NewLeft, float NewTop, optional float Time)
{
    local int i;

    i = MotionFrame.Length;
    MotionFrame.Length = i + 1;
    MotionFrame[i].X = NewLeft;
    MotionFrame[i].Y = NewTop;
    MotionFrame[i].Z = Time;
    // End:0x6f
    if(i < 1)
    {
        BeginAnimation(self);
    }
}

function Resize(float NewWidth, float NewHeight, optional float Time)
{
    local int i;

    i = SizeFrame.Length;
    SizeFrame.Length = i + 1;
    SizeFrame[i].X = NewWidth;
    SizeFrame[i].Y = NewHeight;
    SizeFrame[i].Z = Time;
    // End:0x6f
    if(i < 1)
    {
        BeginAnimation(self);
    }
}

function DAnimate(float NewLeft, float NewTop, float NewWidth, float NewHeight, optional float PositionTime, optional float DimensionTime)
{
    Animate(NewLeft, NewTop, PositionTime);
    Resize(NewWidth, NewHeight, DimensionTime);
}

function KillAnimation()
{
    // End:0x22
    if(MotionFrame.Length > 0)
    {
        MotionFrame.Remove(0, MotionFrame.Length);
        EndAnimation(self, 0);
    }
    // End:0x44
    if(SizeFrame.Length > 0)
    {
        SizeFrame.Remove(0, SizeFrame.Length);
        EndAnimation(self, 1);
    }
}

final function EnableComponent(GUIComponent Comp)
{
    // End:0x0d
    if(Comp == none)
    {
        return;
    }
    Comp.EnableMe();
}

final function DisableComponent(GUIComponent Comp)
{
    // End:0x0d
    if(Comp == none)
    {
        return;
    }
    Comp.DisableMe();
}

function SetFlicker(bool Value)
{
    bFlicker = Value;
}

function EnableMe()
{
    // End:0x12
    if(MenuState != 4)
    {
        return;
    }
    MenuStateChange(0);
}

function DisableMe()
{
    // End:0x12
    if(MenuState == 4)
    {
        return;
    }
    MenuStateChange(4);
}

function SetEnabled(bool Value)
{
    // End:0x12
    if(Value)
    {
        EnableMe();
    }
    // End:0x18
    else
    {
        DisableMe();
    }
}

function LevelChanged()
{
    // End:0x1a
    if(ToolTip != none)
    {
        ToolTip.free();
    }
}

function DebugTabOrder();
function Canvas GetCurrentCanvas()
{
    // End:0x30
    if(self.CurrentCanvas == none)
    {
        // End:0x2e
        if(MenuOwner != none)
        {
            return MenuOwner.GetCurrentCanvas();
        }
        // End:0x30
        else
        {
            return none;
        }
    }
    return CurrentCanvas;
}

defaultproperties
{
    FontScale=1
    WinWidth=1.0
    WinHeight=1.0
    AWinFrame=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    RenderWeight=0.50
    TabOrder=-1
    Tag=-1
    bVisible=true
    bInit=true
    TimerIndex=-1
    WhiteColor=(R=253,G=237,B=244,A=255)
}