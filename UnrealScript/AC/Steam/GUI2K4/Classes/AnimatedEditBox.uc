/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AnimatedEditBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:7
 *
 *******************************************************************************/
class AnimatedEditBox extends moEditBox
    editinlinenew
    instanced;

var() float increment;
var() bool bUseValueForCaption;
var() editconst noexport bool bUpdated;

function bool InternalOnPreDraw(Canvas C)
{
    CaptionWidth += increment;
    MyEditBox.CaretPos = 0;
    // End:0x47
    if(CaptionWidth <= 0.0 || CaptionWidth >= 1.0)
    {
        __OnPreDraw__Delegate = None;
    }
    return true;
}

function SetText(string str)
{
    super.SetText(str);
    // End:0x29
    if(bUseValueForCaption)
    {
        SetCaption(MyEditBox.GetText());
    }
}

function InternalOnActivate()
{
    ShowEditBox();
}

function InternalOnDeactivate()
{
    ShowLabel();
    // End:0x16
    if(bUpdated)
    {
        InternalOnChange(self);
    }
    bUpdated = false;
}

function ShowEditBox()
{
    // End:0x35
    if(CaptionWidth > 0.0)
    {
        // End:0x2a
        if(increment > 0.0)
        {
            increment *= -1.0;
        }
        __OnPreDraw__Delegate = InternalOnPreDraw;
    }
}

function ShowLabel()
{
    // End:0x35
    if(CaptionWidth < 1.0)
    {
        // End:0x2a
        if(increment < 0.0)
        {
            increment *= -1.0;
        }
        __OnPreDraw__Delegate = InternalOnPreDraw;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x76
    if(Controller.bCurMenuInitialized)
    {
        // End:0x25
        if(Sender != self)
        {
            bUpdated = true;
        }
        // End:0x76
        if(Sender == self || MenuState != 2)
        {
            // End:0x76
            if(!bIgnoreChange)
            {
                // End:0x6b
                if(bUseValueForCaption)
                {
                    SetCaption(MyEditBox.GetText());
                }
                OnChange(self);
            }
        }
    }
    bIgnoreChange = false;
}

defaultproperties
{
    increment=0.10
    bAutoSizeCaption=true
    CaptionWidth=1.0
    OnActivate=InternalOnActivate
    OnDeActivate=InternalOnDeactivate
}