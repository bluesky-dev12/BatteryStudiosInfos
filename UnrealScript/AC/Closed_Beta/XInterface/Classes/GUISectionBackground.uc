class GUISectionBackground extends GUIImage
    native
    editinlinenew
    instanced;

var(Style) /*0x00000000-0x00000008*/ editconst noexport editinline GUIStyles CaptionStyle;
var(Style) string CaptionStyleName;
var(Style) int AltCaptionOffset[4];
var(Style) GUI.eTextAlign AltCaptionAlign;
var(Style) bool bAltCaption;
var() bool bRemapStack;
var() bool bFillClient;
var() noexport editinlinenotify array<export editinlinenotify GUIComponent> AlignStack;
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
    // End:0x3B
    if(CaptionStyleName != "")
    {
        CaptionStyle = Controller.GetStyle(CaptionStyleName, FontScale);
    }
    //return;    
}

event SetVisibility(bool bIsVisible)
{
    local int i;

    super(GUIComponent).SetVisibility(bIsVisible);
    i = 0;
    J0x13:

    // End:0x48 [Loop If]
    if(i < AlignStack.Length)
    {
        AlignStack[i].SetVisibility(bIsVisible);
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    //return;    
}

function bool ManageComponent(GUIComponent Component)
{
    local int i;

    // End:0x0D
    if(Component == none)
    {
        return false;
    }
    i = FindComponentIndex(Component);
    // End:0xAF
    if(i == -1)
    {
        // End:0x84
        if(bRemapStack)
        {
            i = 0;
            J0x3D:

            // End:0x81 [Loop If]
            if(i < AlignStack.Length)
            {
                // End:0x77
                if(AlignStack[i].TabOrder > Component.TabOrder)
                {
                    // [Explicit Break]
                    goto J0x81;
                }
                i++;
                // [Loop Continue]
                goto J0x3D;
            }
            J0x81:
            
        }
        else
        {
            i = AlignStack.Length;
        }
        AlignStack.Insert(i, 1);
        AlignStack[i] = Component;
        return true;
    }
    return false;
    //return;    
}

function bool UnmanageComponent(GUIComponent Comp)
{
    local int i;

    i = FindComponentIndex(Comp);
    // End:0x4D
    if(((i != -1) && i >= 0) && i < AlignStack.Length)
    {
        AlignStack.Remove(i, 1);
        return true;
    }
    return false;
    //return;    
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

    // End:0x4D [Loop If]
    if(i < AlignStack.Length)
    {
        // End:0x43
        if(AlignStack[i] == Comp)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
}

function Reset()
{
    AlignStack.Remove(0, AlignStack.Length);
    bInit = true;
    //return;    
}

function bool InternalPreDraw(Canvas C)
{
    local float AL, AT, AW, AH, LPad, RPad,
	    TPad, BPad;

    // End:0x0E
    if(AlignStack.Length == 0)
    {
        return false;
    }
    AL = ActualLeft();
    AT = ActualTop();
    AW = ActualWidth();
    AH = ActualHeight();
    LPad = (LeftPadding * AW) + ImageOffset[0];
    TPad = (TopPadding * AH) + ImageOffset[1];
    RPad = (RightPadding * AW) + ImageOffset[2];
    BPad = (BottomPadding * AH) + ImageOffset[3];
    // End:0xE5
    if(Style != none)
    {
        LPad += BorderOffsets[0];
        TPad += BorderOffsets[1];
        RPad += BorderOffsets[2];
        BPad += BorderOffsets[3];
    }
    AutoPosition(AlignStack, AL, AT, AL + AW, AT + AH, LPad, TPad, RPad, BPad, NumColumns, ColPadding);
    return false;
    //return;    
}

event ResolutionChanged(int ResX, int ResY)
{
    super(GUIComponent).ResolutionChanged(ResX, ResY);
    bInit = true;
    //return;    
}

function SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, optional bool bRelative)
{
    super(GUIComponent).SetPosition(NewLeft, NewTop, NewWidth, NewHeight, bRelative);
    bInit = true;
    //return;    
}

defaultproperties
{
    CaptionStyleName="TextLabel"
    bRemapStack=true
    ColPadding=0.0500000
    LeftPadding=0.0500000
    RightPadding=0.0500000
    ImageOffset[0]=16.0000000
    ImageOffset[1]=44.0000000
    ImageOffset[2]=16.0000000
    ImageOffset[3]=18.0000000
    NumColumns=1
    FontScale=0
    RenderWeight=0.0900000
    OnPreDraw=GUISectionBackground.InternalPreDraw
}