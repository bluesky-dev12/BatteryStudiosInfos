/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUISectionBackground.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:9
 *
 *******************************************************************************/
class GUISectionBackground extends GUIImage
    native
    editinlinenew
    instanced;

var(Style) editconst noexport editinline GUIStyles CaptionStyle;
var(Style) string CaptionStyleName;
var(Style) int AltCaptionOffset[4];
var(Style) GUI.eTextAlign AltCaptionAlign;
var(Style) bool bAltCaption;
var() bool bRemapStack;
var() bool bFillClient;
var() databinding noexport editinlinenotify array<databinding export editinlinenotify GUIComponent> AlignStack;
var() Material HeaderTop;
var() Material HeaderBar;
var() Material HeaderBase;
var() localized string Caption;
var() float ColPadding;
var() float LeftPadding;
var() float RightPadding;
var() float TopPadding;
var() float BottomPadding;
var() float ImageOffset[4];
var() int NumColumns;
var() int MaxPerColumn;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    // End:0x3b
    if(CaptionStyleName != "")
    {
        CaptionStyle = Controller.GetStyle(CaptionStyleName, FontScale);
    }
}

event SetVisibility(bool bIsVisible)
{
    local int i;

    super(GUIComponent).SetVisibility(bIsVisible);
    i = 0;
    J0x13:
    // End:0x48 [While If]
    if(i < AlignStack.Length)
    {
        AlignStack[i].SetVisibility(bIsVisible);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
}

function bool ManageComponent(GUIComponent Component)
{
    local int i;

    // End:0x0d
    if(Component == none)
    {
        return false;
    }
    i = FindComponentIndex(Component);
    // End:0xaf
    if(i == -1)
    {
        // End:0x84
        if(bRemapStack)
        {
            i = 0;
            J0x3d:
            // End:0x81 [While If]
            if(i < AlignStack.Length)
            {
                // End:0x77
                if(AlignStack[i].TabOrder > Component.TabOrder)
                {
                }
                // End:0x81
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x3d;
                }
            }
        }
        // End:0x90
        else
        {
            i = AlignStack.Length;
        }
        AlignStack.Insert(i, 1);
        AlignStack[i] = Component;
        return true;
    }
    return false;
}

function bool UnmanageComponent(GUIComponent Comp)
{
    local int i;

    i = FindComponentIndex(Comp);
    // End:0x4d
    if(i != -1 && i >= 0 && i < AlignStack.Length)
    {
        AlignStack.Remove(i, 1);
        return true;
    }
    return false;
}

function int FindComponentIndex(GUIComponent Comp)
{
    local int i;

    // End:0x11
    if(Comp == none)
    {
        return -1;
    }
    i = 0;
    J0x18:
    // End:0x4d [While If]
    if(i < AlignStack.Length)
    {
        // End:0x43
        if(AlignStack[i] == Comp)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return -1;
}

function Reset()
{
    AlignStack.Remove(0, AlignStack.Length);
    bInit = true;
}

function bool InternalPreDraw(Canvas C)
{
    local float AL, AT, AW, AH, LPad, RPad,
	    TPad, BPad;

    // End:0x0e
    if(AlignStack.Length == 0)
    {
        return false;
    }
    AL = ActualLeft();
    AT = ActualTop();
    AW = ActualWidth();
    AH = ActualHeight();
    LPad = LeftPadding * AW + ImageOffset[0];
    TPad = TopPadding * AH + ImageOffset[1];
    RPad = RightPadding * AW + ImageOffset[2];
    BPad = BottomPadding * AH + ImageOffset[3];
    // End:0xe5
    if(Style != none)
    {
        LPad += BorderOffsets[0];
        TPad += BorderOffsets[1];
        RPad += BorderOffsets[2];
        BPad += BorderOffsets[3];
    }
    AutoPosition(AlignStack, AL, AT, AL + AW, AT + AH, LPad, TPad, RPad, BPad, NumColumns, ColPadding);
    return false;
}

event ResolutionChanged(int ResX, int ResY)
{
    super(GUIComponent).ResolutionChanged(ResX, ResY);
    bInit = true;
}

function SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, optional bool bRelative)
{
    super(GUIComponent).SetPosition(NewLeft, NewTop, NewWidth, NewHeight, bRelative);
    bInit = true;
}

defaultproperties
{
    CaptionStyleName="TextLabel"
    bRemapStack=true
    ColPadding=0.050
    LeftPadding=0.050
    RightPadding=0.050
    ImageOffset[0]=16.0
    ImageOffset[1]=44.0
    ImageOffset[2]=16.0
    ImageOffset[3]=18.0
    NumColumns=1
    FontScale=0
    RenderWeight=0.090
    OnPreDraw=InternalPreDraw
}