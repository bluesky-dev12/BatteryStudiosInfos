/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ButtonFooter.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:12
 *
 *******************************************************************************/
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
var(Footer) XInterface.GUI.eTextAlign Alignment;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIMultiComponent).InitComponent(InController, inOwner);
    SetupButtons();
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x42
    if(bBoundToParent && MenuOwner != none)
    {
        WinTop = RelativeTop(MenuOwner.ActualTop() + MenuOwner.ActualHeight() - ActualHeight(), true);
    }
    // End:0x61
    else
    {
        WinTop = RelativeTop(float(Controller.ResY) - ActualHeight(), true);
    }
    // End:0xa4
    if(ButtonsSized(C))
    {
        // End:0x9c
        if(!bInit)
        {
            ButtonLeft = GetButtonLeft();
            PositionButtons(C);
            __OnPreDraw__Delegate = None;
        }
        bInit = false;
    }
    return true;
}

function ResolutionChanged(int ResX, int ResY)
{
    SetupButtons();
}

function SetupButtons(optional string bPerButtonSizes)
{
    local int i;
    local export editinline GUIButton B;

    // End:0x1c
    if(bPerButtonSizes != "")
    {
        bFixedWidth = !bool(bPerButtonSizes);
    }
    // End:0x9f
    if(bAutoSize)
    {
        i = 0;
        J0x2c:
        // End:0x9f [While If]
        if(i < Controls.Length)
        {
            B = GUIButton(Controls[i]);
            // End:0x95
            if(B != none)
            {
                B.bAutoSize = true;
                B.AutoSizePadding.HorzPerc = B.RelativeWidth(GetPadding(), true);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2c;
        }
    }
    __OnPreDraw__Delegate = InternalOnPreDraw;
    bInit = true;
}

function bool ButtonsSized(Canvas C)
{
    local int i;
    local export editinline GUIButton B;
    local bool bResult;
    local string str;
    local float t, AH, AT;

    // End:0x0d
    if(!bPositioned)
    {
        return false;
    }
    bResult = true;
    str = GetLongestCaption(C);
    AH = ActualHeight();
    AT = ActualTop();
    i = 0;
    J0x3f:
    // End:0x1c0 [While If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x1b6
        if(B != none)
        {
            // End:0x9b
            if(bAutoSize && bFixedWidth)
            {
                B.SizingCaption = str;
            }
            // End:0xac
            else
            {
                B.SizingCaption = "";
            }
            bResult = bResult && B.bPositioned;
            // End:0xfa
            if(bFullHeight)
            {
                B.WinHeight = B.RelativeHeight(AH, true);
            }
            // End:0x11e
            else
            {
                B.WinHeight = B.RelativeHeight(ActualHeight(ButtonHeight), true);
            }
            switch(Justification)
            {
                // End:0x13a
                case 0:
                    t = ClientBounds[1];
                    // End:0x195
                    break;
                // End:0x16e
                case 1:
                    t = AT + AH / float(2) - B.ActualHeight() / float(2);
                    // End:0x195
                    break;
                // End:0x192
                case 2:
                    t = ClientBounds[3] - B.ActualHeight();
                    // End:0x195
                    break;
                // End:0xffff
                default:
                    B.WinTop = B.RelativeTop(t, true);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x3f;
            }
            return bResult;
}

function PositionButtons(Canvas C)
{
    local int i;
    local export editinline GUIButton B;
    local float X;

    i = 0;
    J0x07:
    // End:0xb2 [While If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0xa8
        if(B != none && B.bVisible)
        {
            // End:0x67
            if(X == float(0))
            {
                X = ButtonLeft;
            }
            // End:0x74
            else
            {
                X += GetSpacer();
            }
            B.WinLeft = B.RelativeLeft(X, true);
            X += B.ActualWidth();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function string GetLongestCaption(Canvas C)
{
    local int i;
    local float XL, YL, LongestW;
    local string str;
    local export editinline GUIButton B;

    // End:0x0e
    if(C == none)
    {
        return "";
    }
    i = 0;
    J0x15:
    // End:0x12d [While If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x123
        if(B != none && B.bVisible)
        {
            // End:0xc2
            if(B.Style != none)
            {
                B.Style.TextSize(C, B.MenuState, B.Caption, XL, YL, B.FontScale);
            }
            // End:0xe6
            else
            {
                C.StrLen(B.Caption, XL, YL);
            }
            // End:0x123
            if(LongestW == float(0) || XL > LongestW)
            {
                str = B.Caption;
                LongestW = XL;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return str;
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
    // End:0xa1 [While If]
    if(i < Controls.Length)
    {
        B = GUIButton(Controls[i]);
        // End:0x97
        if(B != none && B.bVisible)
        {
            // End:0x84
            if(TotalWidth > float(0))
            {
                TotalWidth += GetSpacer();
            }
            TotalWidth += B.ActualWidth();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    // End:0xde
    if(Alignment == 1)
    {
        return AL + AW / float(2) - FooterMargin / float(2) - TotalWidth / float(2);
    }
    // End:0x10f
    if(Alignment == 2)
    {
        return AL + AW - FooterMargin / float(2) - TotalWidth;
    }
    return AL + FooterMargin / float(2);
}

function float GetMargin()
{
    return ActualWidth(Margin);
}

function float GetPadding()
{
    return ActualWidth(Padding);
}

function float GetSpacer()
{
    return ActualWidth(Spacer);
}

event Timer()
{
    SetCaption("");
}

defaultproperties
{
    ButtonHeight=1.0
    Padding=0.140
    Margin=0.0050
    bFixedWidth=true
    bFullHeight=true
    bAutoSize=true
    Alignment=2
    WinHeight=0.040
    bNeverFocus=true
    OnPreDraw=InternalOnPreDraw
}