/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIScrollText.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:21
 *	Functions:14
 *
 *******************************************************************************/
class GUIScrollText extends GUIList
    native
    editinlinenew
    instanced;

enum eScrollState
{
    STS_None,
    STS_Initial,
    STS_Char,
    STS_EOL,
    STS_Repeat
};

var() editconst int MaxHistory;
var() editconst string NewText;
var() editconst string ClickedString;
var() editconst string Content;
var() editconst string Separator;
var() editconst int VisibleLines;
var() editconst int VisibleChars;
var() editconst float oldWidth;
var() editconst GUIScrollText.eScrollState ScrollState;
var() editconst bool bNewContent;
var() editconst bool bStopped;
var private const editconst bool bReceivedNewContent;
var() bool bRepeat;
var() bool bNoTeletype;
var() bool bClickText;
var() float InitialDelay;
var() float CharDelay;
var() float EOLDelay;
var() float RepeatDelay;
var() editconstarray editconst array<editconst string> StringElements;
var delegate<OnEndOfLine> __OnEndOfLine__Delegate;

// Export UGUIScrollText::execGetWordUnderCursor(FFrame&, void* const)
native final function string GetWordUnderCursor();
delegate OnEndOfLine();
function Dump()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < StringElements.Length)
    {
        Log(string(Name) @ "ScrollText Elements[" $ string(i) $ "]:" $ StringElements[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    // End:0x1f
    if(bNoTeletype)
    {
        EndScrolling();
    }
}

function SetContent(string NewContent, optional string sep)
{
    // End:0x1a
    if(sep == "")
    {
        Separator = default.Separator;
    }
    // End:0x25
    else
    {
        Separator = sep;
    }
    Content = NewContent;
    bNewContent = true;
    // End:0x4a
    if(bNoTeletype)
    {
        EndScrolling();
    }
    // End:0x50
    else
    {
        Restart();
    }
}

function Stop()
{
    bStopped = true;
    ScrollState = 0;
    TimerInterval = 0.0;
}

function Restart()
{
    VisibleLines = 0;
    VisibleChars = 0;
    // End:0x31
    if(InitialDelay <= 0.0)
    {
        ScrollState = 0;
        SetTimer(0.0010, true);
    }
    // End:0x42
    else
    {
        ScrollState = 1;
        SetTimer(InitialDelay, true);
    }
    bStopped = false;
}

function bool SkipChar()
{
    // End:0xab
    if(ItemCount > 0 && !bStopped && VisibleLines >= 0 && VisibleLines < ItemCount)
    {
        // End:0x8f
        if(VisibleChars == Len(StringElements[VisibleLines]))
        {
            // End:0x8c
            if(VisibleLines + 1 < ItemCount)
            {
                ++ VisibleLines;
                VisibleChars = 0;
                TimerInterval = EOLDelay;
                ScrollState = 3;
                OnEndOfLine();
                return true;
            }
        }
        // End:0xab
        else
        {
            ++ VisibleChars;
            TimerInterval = CharDelay;
            ScrollState = 2;
            return true;
        }
    }
    return false;
}

event Timer()
{
    // End:0x23
    if(ItemCount == 0)
    {
        // End:0x21
        if(!bNewContent)
        {
            TimerInterval = 0.0;
        }
        return;
    }
    // End:0x3c
    if(ScrollState == 4)
    {
        Restart();
    }
    // End:0xf6
    else
    {
        // End:0xaa
        if(ScrollState == 3)
        {
            // End:0xa7
            if(!SkipChar())
            {
                // End:0x8c
                if(bRepeat)
                {
                    // End:0x83
                    if(RepeatDelay > float(0))
                    {
                        TimerInterval = RepeatDelay;
                        ScrollState = 4;
                    }
                    // End:0x89
                    else
                    {
                        Restart();
                    }
                }
                // End:0xa7
                else
                {
                    bStopped = true;
                    ScrollState = 0;
                    TimerInterval = 0.0;
                }
            }
        }
        // End:0xf6
        else
        {
            // End:0xce
            if(ScrollState == 0)
            {
                ScrollState = 1;
                SetTimer(CharDelay, true);
            }
            // End:0xf6
            else
            {
                // End:0xf6
                if(!SkipChar())
                {
                    ScrollState = 3;
                    TimerInterval = EOLDelay;
                    OnEndOfLine();
                }
            }
        }
    }
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
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    EndScrolling();
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local bool retval;

    retval = super(GUIListBase).InternalOnKeyEvent(key, State, Delta);
    // End:0x2b
    if(retval)
    {
        EndScrolling();
    }
    return retval;
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
}

function bool IsValid()
{
    return true;
}

defaultproperties
{
    Separator="|"
    VisibleLines=-1
    CharDelay=0.250
    EOLDelay=0.750
    RepeatDelay=3.0
    TextAlign=0
    OnClick=InternalOnClick
    OnKeyType=InternalOnKeyType
    OnKeyEvent=InternalOnKeyEvent
}