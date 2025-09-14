class AnimatedEditBox extends moEditBox
    editinlinenew
    instanced;

var() float increment;
var() bool bUseValueForCaption;
var() protected editconst noexport bool bUpdated;

function bool InternalOnPreDraw(Canvas C)
{
    CaptionWidth += increment;
    MyEditBox.CaretPos = 0;
    // End:0x47
    if((CaptionWidth <= 0.0000000) || CaptionWidth >= 1.0000000)
    {
        __OnPreDraw__Delegate = None;
    }
    return true;
    //return;    
}

function SetText(string str)
{
    super.SetText(str);
    // End:0x29
    if(bUseValueForCaption)
    {
        SetCaption(MyEditBox.GetText());
    }
    //return;    
}

function InternalOnActivate()
{
    ShowEditBox();
    //return;    
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
    //return;    
}

function ShowEditBox()
{
    // End:0x35
    if(CaptionWidth > 0.0000000)
    {
        // End:0x2A
        if(increment > 0.0000000)
        {
            increment *= -1.0000000;
        }
        __OnPreDraw__Delegate = InternalOnPreDraw;
    }
    //return;    
}

function ShowLabel()
{
    // End:0x35
    if(CaptionWidth < 1.0000000)
    {
        // End:0x2A
        if(increment < 0.0000000)
        {
            increment *= -1.0000000;
        }
        __OnPreDraw__Delegate = InternalOnPreDraw;
    }
    //return;    
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
        if((Sender == self) || int(MenuState) != int(2))
        {
            // End:0x76
            if(!bIgnoreChange)
            {
                // End:0x6B
                if(bUseValueForCaption)
                {
                    SetCaption(MyEditBox.GetText());
                }
                OnChange(self);
            }
        }
    }
    bIgnoreChange = false;
    //return;    
}

defaultproperties
{
    increment=0.1000000
    bAutoSizeCaption=false
    CaptionWidth=1.0000000
    OnActivate=AnimatedEditBox.InternalOnActivate
    OnDeActivate=AnimatedEditBox.InternalOnDeactivate
}