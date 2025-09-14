/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIToolTip.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:15
 *
 *******************************************************************************/
class GUIToolTip extends GUIComponent
    native
    config(User)
    editinlinenew
    instanced;

var() bool bResetPosition;
var() bool bTrackMouse;
var() bool bMultiLine;
var() bool bTrackInput;
var() const string Text;
var() const array<string> Lines;
var() noexport float StartTime;
var() noexport float CurrentTime;
var() globalconfig float MaxWidth;
var() globalconfig float InitialDelay;
var() globalconfig float ExpirationSeconds;
var delegate<EnterArea> __EnterArea__Delegate;
var delegate<LeaveArea> __LeaveArea__Delegate;
var delegate<Tick> __Tick__Delegate;
var delegate<ShowToolTip> __ShowToolTip__Delegate;
var delegate<HideToolTip> __HideToolTip__Delegate;
var delegate<GetLeft> __GetLeft__Delegate;
var delegate<GetTop> __GetTop__Delegate;
var delegate<GetWidth> __GetWidth__Delegate;
var delegate<GetHeight> __GetHeight__Delegate;

delegate GUIToolTip EnterArea()
{
    return InternalEnterArea();
}

function GUIToolTip InternalEnterArea()
{
    // End:0x46
    if(Controller == none)
    {
        // End:0x44
        if(class'GUIController'.default.bModAuthor)
        {
            Log("ToolTip (" $ string(self) $ ") not initialized");
        }
        return none;
    }
    StartTime = PlayerOwner().Level.TimeSeconds;
    // End:0xc3
    if(Controller != none && Controller.MouseOver != none && Controller.MouseOver != self && Controller.MouseOver.bVisible)
    {
        CurrentTime = InitialDelay;
    }
    // End:0xce
    else
    {
        CurrentTime = 0.0;
    }
    bResetPosition = true;
    return self;
}

delegate bool LeaveArea()
{
    return InternalLeaveArea();
}

function bool InternalLeaveArea()
{
    StartTime = -1.0;
    CurrentTime = -1.0;
    SetVisibility(false);
    // End:0x4e
    if(Controller != none && Controller.MouseOver == self)
    {
        Controller.MouseOver = none;
    }
    return true;
}

delegate Tick(float RealSeconds)
{
    CurrentTime += RealSeconds;
    // End:0x54
    if(!bVisible && CurrentTime > InitialDelay && ExpirationSeconds == 0.0 || CurrentTime <= ExpirationSeconds)
    {
        ShowToolTip();
    }
    // End:0x89
    if(bVisible && CurrentTime > ExpirationSeconds && ExpirationSeconds > 0.0)
    {
        HideToolTip();
    }
}

delegate ShowToolTip()
{
    SetVisibility(true);
}

delegate HideToolTip()
{
    SetVisibility(false);
}

event UpdatePosition(Canvas C)
{
    WinWidth = GetWidth(C);
    WinHeight = GetHeight(C);
    WinLeft = GetLeft(C);
    WinTop = GetTop(C);
    bResetPosition = false;
}

delegate float GetLeft(Canvas C)
{
    local float X;

    // End:0x2b
    if(C == none || MenuOwner == none || Style == none)
    {
        return -1.0;
    }
    X = FMin(Controller.MouseX, Controller.MouseCursorBounds.X1);
    // End:0x87
    if(X + WinWidth > float(C.SizeX))
    {
        X -= WinWidth + float(10);
    }
    return X;
}

delegate float GetTop(Canvas C)
{
    local float TargetTop;

    // End:0x2b
    if(C == none || MenuOwner == none || Style == none)
    {
        return -1.0;
    }
    // End:0x66
    if(Controller.MouseY > float(C.SizeY / 8))
    {
        TargetTop = GetTopAboveCursor(C);
    }
    // End:0x77
    else
    {
        TargetTop = GetTopBelowCursor(C);
    }
    // End:0x95
    if(TargetTop < float(0))
    {
        TargetTop = GetTopBelowCursor(C);
    }
    return TargetTop;
}

delegate float GetWidth(Canvas C)
{
    local int i;
    local float MaxLineWidth, XL, YL;

    // End:0x39
    if(C == none || Lines.Length == 0 || MenuOwner == none || Style == none)
    {
        return 0.0;
    }
    i = 0;
    J0x40:
    // End:0xb0 [While If]
    if(i < Lines.Length)
    {
        Style.TextSize(C, MenuOwner.MenuState, Lines[i], XL, YL, FontScale);
        // End:0xa6
        if(XL > MaxLineWidth)
        {
            MaxLineWidth = XL;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return FMin(MaxLineWidth, MaxWidth * float(C.SizeX)) + float(Style.BorderOffsets[0]) + float(Style.BorderOffsets[2]);
}

delegate float GetHeight(Canvas C)
{
    local float XL, YL;

    // End:0x39
    if(C == none || Lines.Length == 0 || MenuOwner == none || Style == none)
    {
        return 0.0;
    }
    Style.TextSize(C, MenuOwner.MenuState, Lines[0], XL, YL, FontScale);
    return YL * float(Lines.Length) + float(Style.BorderOffsets[1]) + float(Style.BorderOffsets[3]);
}

singular function float GetTopAboveCursor(Canvas C)
{
    local float TargetY, TempY;

    // End:0x2b
    if(MenuOwner == none || C == none || Controller == none)
    {
        return -1.0;
    }
    TargetY = FMin(Controller.MouseCursorBounds.Y1, Controller.MouseY) - WinHeight + float(10);
    // End:0x7f
    if(TargetY < float(0))
    {
        TempY = GetTopBelowCursor(C);
    }
    return FMax(TempY, TargetY);
}

singular function float GetTopBelowCursor(Canvas C)
{
    local float TargetY, TempY;

    // End:0x2b
    if(MenuOwner == none || C == none || Controller == none)
    {
        return -1.0;
    }
    TargetY = FMax(Controller.MouseCursorBounds.Y2, Controller.MouseY) + float(10);
    // End:0x8c
    if(TargetY + WinHeight > float(C.SizeY))
    {
        TempY = GetTopAboveCursor(C);
    }
    return FMax(TargetY, TempY);
}

// Export UGUIToolTip::execSetTip(FFrame&, void* const)
native final function SetTip(coerce string NewTip);

defaultproperties
{
    bMultiLine=true
    bTrackInput=true
    MaxWidth=0.30
    InitialDelay=0.250
    ExpirationSeconds=3.0
    StyleName="MouseOver"
    bVisible=true
    bRequiresStyle=true
}