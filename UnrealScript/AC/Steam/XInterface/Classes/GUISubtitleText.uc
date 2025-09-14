/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUISubtitleText.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:10
 *	Functions:8
 *
 *******************************************************************************/
class GUISubtitleText extends GUILabel
    editinlinenew
    instanced;

enum eDisplayState
{
    DS_Delay,
    DS_Visibility,
    DS_Stopped
};

struct VisibleDelay
{
    var float Visible;
    var float Delay;
};

var() array<string> SubTitles;
var() array<VisibleDelay> SubTitleTiming;
var() float VisibleTime;
var() float DelayTime;
var() float InitialDelay;
var() float GuessCharTime;
var string Separator;
var int CurLine;
var GUISubtitleText.eDisplayState DisplayState;
var delegate<OnStopped> __OnStopped__Delegate;

delegate OnStopped();
function Restart()
{
    CurLine = 0;
    Caption = "";
    DisplayState = 0;
    // End:0x32
    if(InitialDelay <= 0.0)
    {
        SetTimer(0.0010, true);
    }
    // End:0x3b
    else
    {
        SetTimer(InitialDelay, true);
    }
}

function Stop()
{
    Caption = "";
    TimerInterval = 0.0;
    DisplayState = 2;
    OnStopped();
}

function int SetSubtitles(string alldata, optional string sep, optional bool bDontGuess, optional string lengthdata)
{
    local array<string> newdata, datalength;
    local int i;

    // End:0x17
    if(sep == "")
    {
        sep = Separator;
    }
    Split(alldata, sep, newdata);
    // End:0x4f
    if(bDontGuess)
    {
        Split(lengthdata, sep, datalength);
        datalength.Length = newdata.Length;
    }
    ClearSubtitles();
    i = 0;
    J0x5c:
    // End:0xc7 [While If]
    if(i < newdata.Length)
    {
        // End:0x96
        if(bDontGuess)
        {
            AddSubtitle(newdata[i], float(datalength[i]));
        }
        // End:0xbd
        else
        {
            AddSubtitle(newdata[i], GuessCharTime * float(Len(newdata[i])));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    Restart();
    return i;
}

function int AddSubtitle(string NewTitle, optional float Delay, optional float Visible)
{
    return InsertSubtitle(SubTitles.Length, NewTitle, Delay, Visible);
}

function int InsertSubtitle(int Position, string NewTitle, optional float Delay, optional float Visible)
{
    // End:0x16
    if(Position > SubTitles.Length)
    {
        return -1;
    }
    // End:0x27
    if(Position < 0)
    {
        return -1;
    }
    SubTitles.Insert(Position, 1);
    SubTitleTiming.Insert(Position, 1);
    SubTitles[Position] = NewTitle;
    // End:0x68
    if(Delay == float(0))
    {
        Delay = DelayTime;
    }
    SubTitleTiming[Position].Delay = float(Max(int(Delay), 0));
    // End:0x9d
    if(Visible == float(0))
    {
        Visible = VisibleTime;
    }
    // End:0xb7
    if(Visible >= Delay)
    {
        Visible = 0.0;
    }
    SubTitleTiming[Position].Visible = float(Max(int(Visible), 0));
    return Position;
}

function ClearSubtitles()
{
    SubTitles.Length = 0;
    SubTitleTiming.Length = 0;
}

event Timer()
{
    // End:0x37
    if(CurLine >= SubTitles.Length)
    {
        Caption = "";
        TimerInterval = 0.0;
        DisplayState = 2;
        OnStopped();
        return;
    }
    // End:0xb1
    if(DisplayState == 0)
    {
        Caption = SubTitles[CurLine];
        // End:0x91
        if(SubTitleTiming[CurLine].Visible > float(0))
        {
            DisplayState = 1;
            TimerInterval = SubTitleTiming[CurLine].Visible;
        }
        // End:0xae
        else
        {
            TimerInterval = SubTitleTiming[CurLine].Delay;
            ++ CurLine;
        }
    }
    // End:0x100
    else
    {
        // End:0x100
        if(DisplayState == 1)
        {
            Caption = "";
            DisplayState = 0;
            TimerInterval = SubTitleTiming[CurLine].Delay - SubTitleTiming[CurLine].Visible;
            ++ CurLine;
        }
    }
}

defaultproperties
{
    DelayTime=2.0
    GuessCharTime=0.060
    Separator="|"
    TextAlign=1
    bMultiLine=true
    StyleName="TextLabel"
}