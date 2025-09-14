class GUISubtitleText extends GUILabel
    editinlinenew
    instanced;

enum eDisplayState
{
    DS_Delay,                       // 0
    DS_Visibility,                  // 1
    DS_Stopped                      // 2
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
var protected int CurLine;
var protected GUISubtitleText.eDisplayState DisplayState;
//var delegate<OnStopped> __OnStopped__Delegate;

delegate OnStopped()
{
    //return;    
}

function Restart()
{
    CurLine = 0;
    Caption = "";
    DisplayState = 0;
    // End:0x32
    if(InitialDelay <= 0.0000000)
    {
        SetTimer(0.0010000, true);        
    }
    else
    {
        SetTimer(InitialDelay, true);
    }
    //return;    
}

function Stop()
{
    Caption = "";
    TimerInterval = 0.0000000;
    DisplayState = 2;
    OnStopped();
    //return;    
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
    // End:0x4F
    if(bDontGuess)
    {
        Split(lengthdata, sep, datalength);
        datalength.Length = newdata.Length;
    }
    ClearSubtitles();
    i = 0;
    J0x5C:

    // End:0xC7 [Loop If]
    if(i < newdata.Length)
    {
        // End:0x96
        if(bDontGuess)
        {
            AddSubtitle(newdata[i], float(datalength[i]));
            // [Explicit Continue]
            goto J0xBD;
        }
        AddSubtitle(newdata[i], GuessCharTime * float(Len(newdata[i])));
        J0xBD:

        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    Restart();
    return i;
    //return;    
}

function int AddSubtitle(string NewTitle, optional float Delay, optional float Visible)
{
    return InsertSubtitle(SubTitles.Length, NewTitle, Delay, Visible);
    //return;    
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
    // End:0x9D
    if(Visible == float(0))
    {
        Visible = VisibleTime;
    }
    // End:0xB7
    if(Visible >= Delay)
    {
        Visible = 0.0000000;
    }
    SubTitleTiming[Position].Visible = float(Max(int(Visible), 0));
    return Position;
    //return;    
}

function ClearSubtitles()
{
    SubTitles.Length = 0;
    SubTitleTiming.Length = 0;
    //return;    
}

event Timer()
{
    // End:0x37
    if(CurLine >= SubTitles.Length)
    {
        Caption = "";
        TimerInterval = 0.0000000;
        DisplayState = 2;
        OnStopped();
        return;
    }
    // End:0xB1
    if(int(DisplayState) == int(0))
    {
        Caption = SubTitles[CurLine];
        // End:0x91
        if(SubTitleTiming[CurLine].Visible > float(0))
        {
            DisplayState = 1;
            TimerInterval = SubTitleTiming[CurLine].Visible;            
        }
        else
        {
            TimerInterval = SubTitleTiming[CurLine].Delay;
            CurLine++;
        }        
    }
    else
    {
        // End:0x100
        if(int(DisplayState) == int(1))
        {
            Caption = "";
            DisplayState = 0;
            TimerInterval = SubTitleTiming[CurLine].Delay - SubTitleTiming[CurLine].Visible;
            CurLine++;
        }
    }
    //return;    
}

defaultproperties
{
    DelayTime=2.0000000
    GuessCharTime=0.0600000
    Separator="|"
    TextAlign=1
    bMultiLine=true
    StyleName="TextLabel"
}