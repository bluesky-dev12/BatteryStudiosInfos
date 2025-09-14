class ButtonFooter extends GUIFooter
    editinlinenew
    instanced;

var(Footer) editconst noexport float ButtonLeft;
var(Footer) float ButtonHeight;
var(Footer) float ButtonWidth;
var(Footer) float Padding;
var(Footer) float Margin;
var(Footer) float Spacer;
var(Footer) bool bFixedWidth;
var(Footer) bool bFullHeight;
var(Footer) bool bAutoSize;
var(Footer) GUI.eTextAlign Alignment;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIMultiComponent).InitComponent(InController, inOwner);
    SetupButtons();
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x42
    if(bBoundToParent && MenuOwner != none)
    {
        WinTop = RelativeTop((MenuOwner.ActualTop() + MenuOwner.ActualHeight()) - ActualHeight(), true);        
    }
    else
    {
        WinTop = RelativeTop(float(Controller.ResY) - ActualHeight(), true);
    }
    // End:0xA4
    if(ButtonsSized(C))
    {
        // End:0x9C
        if(!bInit)
        {
            ButtonLeft = GetButtonLeft();
            PositionButtons(C);
            __OnPreDraw__Delegate = None;
        }
        bInit = false;
    }
    return true;
    //return;    
}

function ResolutionChanged(int ResX, int ResY)
{
    SetupButtons();
    //return;    
}

function SetupButtons(optional string bPerButtonSizes)
{
    local int i;
    local export editinline GUIButton B;

    // End:0x1C
    if(bPerButtonSizes != "")
    {
        bFixedWidth = !bool(bPerButtonSizes);
    }
    // End:0x9F
    if(bAutoSize)
    {
        i = 0;
        J0x2C:

        // End:0x9F [Loop If]
        if(i < Controls.Length)
        {
            B = GUIButton(Controls[i]);
            // End:0x95
            if(B != none)
            {
                B.bAutoSize = true;
                B.AutoSizePadding.HorzPerc = B.RelativeWidth(GetPadding(), true);
            }
            i++;
            // [Loop Continue]
            goto J0x2C;
        }
    }
    __OnPreDraw__Delegate = InternalOnPreDraw;
    bInit = true;
    //return;    
}

function bool ButtonsSized(Canvas C)
{
    local int i;
    local export editinline GUIButton B;
    local bool bResult;
    local string str;
    local float t, AH, AT;

    // End:0x0D
    if(!bPositioned)
    {
        return false;
    }
    bResult = true;
    str = GetLongestCaption(C);
    AH = ActualHeight();
    AT = ActualTop();
    i = 0;
    J0x3F:

    // End:0x1C0 [Loop If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x1B6
        if(B != none)
        {
            // End:0x9B
            if(bAutoSize && bFixedWidth)
            {
                B.SizingCaption = str;                
            }
            else
            {
                B.SizingCaption = "";
            }
            bResult = bResult && B.bPositioned;
            // End:0xFA
            if(bFullHeight)
            {
                B.WinHeight = B.RelativeHeight(AH, true);                
            }
            else
            {
                B.WinHeight = B.RelativeHeight(ActualHeight(ButtonHeight), true);
            }
            switch(Justification)
            {
                // End:0x13A
                case 0:
                    t = ClientBounds[1];
                    // End:0x195
                    break;
                // End:0x16E
                case 1:
                    t = (AT + (AH / float(2))) - (B.ActualHeight() / float(2));
                    // End:0x195
                    break;
                // End:0x192
                case 2:
                    t = ClientBounds[3] - B.ActualHeight();
                    // End:0x195
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            B.WinTop = B.RelativeTop(t, true);
        }
        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    return bResult;
    //return;    
}

function PositionButtons(Canvas C)
{
    local int i;
    local export editinline GUIButton B;
    local float X;

    i = 0;
    J0x07:

    // End:0xB2 [Loop If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0xA8
        if((B != none) && B.bVisible)
        {
            // End:0x67
            if(X == float(0))
            {
                X = ButtonLeft;                
            }
            else
            {
                X += (GetSpacer());
            }
            B.WinLeft = B.RelativeLeft(X, true);
            X += B.ActualWidth();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function string GetLongestCaption(Canvas C)
{
    local int i;
    local float XL, YL, LongestW;
    local string str;
    local export editinline GUIButton B;

    // End:0x0E
    if(C == none)
    {
        return "";
    }
    i = 0;
    J0x15:

    // End:0x12D [Loop If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x123
        if((B != none) && B.bVisible)
        {
            // End:0xC2
            if(B.Style != none)
            {
                B.Style.TextSize(C, B.MenuState, B.Caption, XL, YL, B.FontScale);                
            }
            else
            {
                C.StrLen(B.Caption, XL, YL);
            }
            // End:0x123
            if((LongestW == float(0)) || XL > LongestW)
            {
                str = B.Caption;
                LongestW = XL;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return str;
    //return;    
}

function float GetButtonLeft()
{
    local int i;
    local export editinline GUIButton B;
    local float TotalWidth, AW, AL, FooterMargin;

    AL = ActualLeft();
    AW = ActualWidth();
    FooterMargin = GetMargin();
    i = 0;
    J0x25:

    // End:0xA1 [Loop If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x97
        if((B != none) && B.bVisible)
        {
            // End:0x84
            if(TotalWidth > float(0))
            {
                TotalWidth += (GetSpacer());
            }
            TotalWidth += B.ActualWidth();
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    // End:0xDE
    if(int(Alignment) == int(1))
    {
        return (((AL + AW) / float(2)) - (FooterMargin / float(2))) - (TotalWidth / float(2));
    }
    // End:0x10F
    if(int(Alignment) == int(2))
    {
        return ((AL + AW) - (FooterMargin / float(2))) - TotalWidth;
    }
    return AL + (FooterMargin / float(2));
    //return;    
}

function float GetMargin()
{
    return ActualWidth(Margin);
    //return;    
}

function float GetPadding()
{
    return ActualWidth(Padding);
    //return;    
}

function float GetSpacer()
{
    return ActualWidth(Spacer);
    //return;    
}

event Timer()
{
    SetCaption("");
    //return;    
}

defaultproperties
{
    ButtonHeight=1.0000000
    Padding=0.1400000
    Margin=0.0050000
    bFixedWidth=true
    bFullHeight=true
    bAutoSize=true
    Alignment=2
    WinHeight=0.0400000
    bNeverFocus=false
    OnPreDraw=ButtonFooter.InternalOnPreDraw
}