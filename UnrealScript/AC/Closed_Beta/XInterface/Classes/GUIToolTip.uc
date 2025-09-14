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
//var delegate<EnterArea> __EnterArea__Delegate;
//var delegate<LeaveArea> __LeaveArea__Delegate;
//var delegate<Tick> __Tick__Delegate;
//var delegate<ShowToolTip> __ShowToolTip__Delegate;
//var delegate<HideToolTip> __HideToolTip__Delegate;
//var delegate<GetLeft> __GetLeft__Delegate;
//var delegate<GetTop> __GetTop__Delegate;
//var delegate<GetWidth> __GetWidth__Delegate;
//var delegate<GetHeight> __GetHeight__Delegate;

delegate GUIToolTip EnterArea()
{
    return InternalEnterArea();
    //return;    
}

function GUIToolTip InternalEnterArea()
{
    // End:0x46
    if(Controller == none)
    {
        // End:0x44
        if(Class'XInterface_Decompressed.GUIController'.default.bModAuthor)
        {
            Log(("ToolTip (" $ string(self)) $ ") not initialized");
        }
        return none;
    }
    StartTime = PlayerOwner().Level.TimeSeconds;
    // End:0xC3
    if((((Controller != none) && Controller.MouseOver != none) && Controller.MouseOver != self) && Controller.MouseOver.bVisible)
    {
        CurrentTime = InitialDelay;        
    }
    else
    {
        CurrentTime = 0.0000000;
    }
    bResetPosition = true;
    return self;
    //return;    
}

delegate bool LeaveArea()
{
    return InternalLeaveArea();
    //return;    
}

function bool InternalLeaveArea()
{
    StartTime = -1.0000000;
    CurrentTime = -1.0000000;
    SetVisibility(false);
    // End:0x4E
    if((Controller != none) && Controller.MouseOver == self)
    {
        Controller.MouseOver = none;
    }
    return true;
    //return;    
}

delegate Tick(float RealSeconds)
{
    CurrentTime += RealSeconds;
    // End:0x54
    if((!bVisible && CurrentTime > InitialDelay) && (ExpirationSeconds == 0.0000000) || CurrentTime <= ExpirationSeconds)
    {
        ShowToolTip();
    }
    // End:0x89
    if((bVisible && CurrentTime > ExpirationSeconds) && ExpirationSeconds > 0.0000000)
    {
        HideToolTip();
    }
    //return;    
}

delegate ShowToolTip()
{
    SetVisibility(true);
    //return;    
}

delegate HideToolTip()
{
    SetVisibility(false);
    //return;    
}

event UpdatePosition(Canvas C)
{
    WinWidth = GetWidth(C);
    WinHeight = GetHeight(C);
    WinLeft = GetLeft(C);
    WinTop = GetTop(C);
    bResetPosition = false;
    //return;    
}

delegate float GetLeft(Canvas C)
{
    local float X;

    // End:0x2B
    if(((C == none) || MenuOwner == none) || Style == none)
    {
        return -1.0000000;
    }
    X = FMin(Controller.MouseX, Controller.MouseCursorBounds.X1);
    // End:0x87
    if((X + WinWidth) > float(C.SizeX))
    {
        X -= (WinWidth + float(10));
    }
    return X;
    //return;    
}

delegate float GetTop(Canvas C)
{
    local float TargetTop;

    // End:0x2B
    if(((C == none) || MenuOwner == none) || Style == none)
    {
        return -1.0000000;
    }
    // End:0x66
    if(Controller.MouseY > float(C.SizeY / 8))
    {
        TargetTop = GetTopAboveCursor(C);        
    }
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
    //return;    
}

delegate float GetWidth(Canvas C)
{
    local int i;
    local float MaxLineWidth, XL, YL;

    // End:0x39
    if((((C == none) || Lines.Length == 0) || MenuOwner == none) || Style == none)
    {
        return 0.0000000;
    }
    i = 0;
    J0x40:

    // End:0xB0 [Loop If]
    if(i < Lines.Length)
    {
        Style.TextSize(C, MenuOwner.MenuState, Lines[i], XL, YL, FontScale);
        // End:0xA6
        if(XL > MaxLineWidth)
        {
            MaxLineWidth = XL;
        }
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    return (FMin(MaxLineWidth, MaxWidth * float(C.SizeX)) + float(Style.BorderOffsets[0])) + float(Style.BorderOffsets[2]);
    //return;    
}

delegate float GetHeight(Canvas C)
{
    local float XL, YL;

    // End:0x39
    if((((C == none) || Lines.Length == 0) || MenuOwner == none) || Style == none)
    {
        return 0.0000000;
    }
    Style.TextSize(C, MenuOwner.MenuState, Lines[0], XL, YL, FontScale);
    return ((YL * float(Lines.Length)) + float(Style.BorderOffsets[1])) + float(Style.BorderOffsets[3]);
    //return;    
}

singular function float GetTopAboveCursor(Canvas C)
{
    local float TargetY, TempY;

    // End:0x2B
    if(((MenuOwner == none) || C == none) || Controller == none)
    {
        return -1.0000000;
    }
    TargetY = FMin(Controller.MouseCursorBounds.Y1, Controller.MouseY) - (WinHeight + float(10));
    // End:0x7F
    if(TargetY < float(0))
    {
        TempY = GetTopBelowCursor(C);
    }
    return FMax(TempY, TargetY);
    //return;    
}

singular function float GetTopBelowCursor(Canvas C)
{
    local float TargetY, TempY;

    // End:0x2B
    if(((MenuOwner == none) || C == none) || Controller == none)
    {
        return -1.0000000;
    }
    TargetY = FMax(Controller.MouseCursorBounds.Y2, Controller.MouseY) + float(10);
    // End:0x8C
    if((TargetY + WinHeight) > float(C.SizeY))
    {
        TempY = GetTopAboveCursor(C);
    }
    return FMax(TargetY, TempY);
    //return;    
}

// Export UGUIToolTip::execSetTip(FFrame&, void* const)
native final function SetTip(coerce string NewTip)
{
    //native.NewTip;        
}

defaultproperties
{
    bMultiLine=true
    bTrackInput=true
    MaxWidth=0.3000000
    InitialDelay=0.2500000
    ExpirationSeconds=3.0000000
    StyleName="MouseOver"
    bVisible=false
    bRequiresStyle=true
}