class GUIScrollText extends GUIList
    native
    editinlinenew
    instanced;

enum eScrollState
{
    STS_None,                       // 0
    STS_Initial,                    // 1
    STS_Char,                       // 2
    STS_EOL,                        // 3
    STS_Repeat                      // 4
};

var() editconst int MaxHistory;
var() editconst string NewText;
var() editconst string ClickedString;
var() protected editconst string Content;
var() editconst string Separator;
var() protected editconst int VisibleLines;
var() protected editconst int VisibleChars;
var() protected editconst float oldWidth;
var() protected editconst GUIScrollText.eScrollState ScrollState;
var() protected editconst bool bNewContent;
var() protected editconst bool bStopped;
var private const editconst bool bReceivedNewContent;
var() bool bRepeat;
var() bool bNoTeletype;
var() bool bClickText;
var() float InitialDelay;
var() float CharDelay;
var() float EOLDelay;
var() float RepeatDelay;
var() editconstarray editconst array<editconst string> StringElements;
//var delegate<OnEndOfLine> __OnEndOfLine__Delegate;

// Export UGUIScrollText::execGetWordUnderCursor(FFrame&, void* const)
native final function string GetWordUnderCursor();

delegate OnEndOfLine()
{
    //return;    
}

function Dump()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < StringElements.Length)
    {
        Log((((string(Name) @ "ScrollText Elements[") $ string(i)) $ "]:") $ StringElements[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    // End:0x1F
    if(bNoTeletype)
    {
        EndScrolling();
    }
    //return;    
}

function SetContent(string NewContent, optional string sep)
{
    // End:0x1A
    if(sep == "")
    {
        Separator = default.Separator;        
    }
    else
    {
        Separator = sep;
    }
    Content = NewContent;
    bNewContent = true;
    // End:0x4A
    if(bNoTeletype)
    {
        EndScrolling();        
    }
    else
    {
        Restart();
    }
    //return;    
}

function Stop()
{
    bStopped = true;
    ScrollState = 0;
    TimerInterval = 0.0000000;
    //return;    
}

function Restart()
{
    VisibleLines = 0;
    VisibleChars = 0;
    // End:0x31
    if(InitialDelay <= 0.0000000)
    {
        ScrollState = 0;
        SetTimer(0.0010000, true);        
    }
    else
    {
        ScrollState = 1;
        SetTimer(InitialDelay, true);
    }
    bStopped = false;
    //return;    
}

function bool SkipChar()
{
    // End:0xAB
    if((((ItemCount > 0) && !bStopped) && VisibleLines >= 0) && VisibleLines < ItemCount)
    {
        // End:0x8F
        if(VisibleChars == Len(StringElements[VisibleLines]))
        {
            // End:0x8C
            if((VisibleLines + 1) < ItemCount)
            {
                VisibleLines++;
                VisibleChars = 0;
                TimerInterval = EOLDelay;
                ScrollState = 3;
                OnEndOfLine();
                return true;
            }            
        }
        else
        {
            VisibleChars++;
            TimerInterval = CharDelay;
            ScrollState = 2;
            return true;
        }
    }
    return false;
    //return;    
}

event Timer()
{
    // End:0x23
    if(ItemCount == 0)
    {
        // End:0x21
        if(!bNewContent)
        {
            TimerInterval = 0.0000000;
        }
        return;
    }
    // End:0x3C
    if(int(ScrollState) == int(4))
    {
        Restart();        
    }
    else
    {
        // End:0xAA
        if(int(ScrollState) == int(3))
        {
            // End:0xA7
            if(!SkipChar())
            {
                // End:0x8C
                if(bRepeat)
                {
                    // End:0x83
                    if(RepeatDelay > float(0))
                    {
                        TimerInterval = RepeatDelay;
                        ScrollState = 4;                        
                    }
                    else
                    {
                        Restart();
                    }                    
                }
                else
                {
                    bStopped = true;
                    ScrollState = 0;
                    TimerInterval = 0.0000000;
                }
            }            
        }
        else
        {
            // End:0xCE
            if(int(ScrollState) == int(0))
            {
                ScrollState = 1;
                SetTimer(CharDelay, true);                
            }
            else
            {
                // End:0xF6
                if(!SkipChar())
                {
                    ScrollState = 3;
                    TimerInterval = EOLDelay;
                    OnEndOfLine();
                }
            }
        }
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local bool retval;

    // End:0x17
    if(bClickText)
    {
        ClickedString = GetWordUnderCursor();
        return true;
    }
    retval = super(GUIVertList).InternalOnClick(Sender);
    // End:0x38
    if(retval)
    {
        EndScrolling();
    }
    return retval;
    //return;    
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    EndScrolling();
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local bool retval;

    retval = super(GUIListBase).InternalOnKeyEvent(key, State, Delta);
    // End:0x2B
    if(retval)
    {
        EndScrolling();
    }
    return retval;
    //return;    
}

function EndScrolling()
{
    bStopped = true;
    // End:0x26
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    KillTimer();
    //return;    
}

function bool IsValid()
{
    return true;
    //return;    
}

defaultproperties
{
    Separator="|"
    VisibleLines=-1
    CharDelay=0.2500000
    EOLDelay=0.7500000
    RepeatDelay=3.0000000
    TextAlign=0
    OnClick=GUIScrollText.InternalOnClick
    OnKeyType=GUIScrollText.InternalOnKeyType
    OnKeyEvent=GUIScrollText.InternalOnKeyEvent
}