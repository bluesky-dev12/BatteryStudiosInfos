class BufferedTCPLink extends TcpLink
    transient
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string InputBuffer;
var string OutputBuffer;
var string CRLF;
var string cR;
var string LF;
var bool bWaiting;
var float WaitTimeoutTime;
var string WaitingFor;
var int WaitForCountChars;
var string WaitResult;
var int WaitMatchData;

function ResetBuffer()
{
    InputBuffer = "";
    OutputBuffer = "";
    bWaiting = false;
    cR = Chr(13);
    LF = Chr(10);
    CRLF = cR $ LF;
    //return;    
}

function WaitFor(string What, float TimeOut, int MatchData)
{
    bWaiting = true;
    WaitingFor = What;
    WaitForCountChars = 0;
    WaitTimeoutTime = Level.TimeSeconds + TimeOut;
    WaitMatchData = MatchData;
    WaitResult = "";
    //return;    
}

function WaitForCount(int Count, float TimeOut, int MatchData)
{
    bWaiting = true;
    WaitingFor = "";
    WaitForCountChars = Count;
    WaitTimeoutTime = Level.TimeSeconds + TimeOut;
    WaitMatchData = MatchData;
    WaitResult = "";
    //return;    
}

function GotMatch(int MatchData)
{
    //return;    
}

function GotMatchTimeout(int MatchData)
{
    //return;    
}

function string ParseDelimited(string Text, string Delimiter, int Count, optional bool bToEndOfLine)
{
    local string Result;
    local int Found, i;
    local string S;

    Result = "";
    Found = 1;
    i = 0;
    J0x16:

    // End:0xBA [Loop If]
    if(i < Len(Text))
    {
        S = Mid(Text, i, 1);
        // End:0x8F
        if(InStr(Delimiter, S) != -1)
        {
            // End:0x85
            if(Found == Count)
            {
                // End:0x7F
                if(bToEndOfLine)
                {
                    return Result $ Mid(Text, i);                    
                }
                else
                {
                    return Result;
                }
            }
            Found++;
            // [Explicit Continue]
            goto J0xB0;
        }
        // End:0xB0
        if(Found >= Count)
        {
            Result = Result $ S;
        }
        J0xB0:

        i++;
        // [Loop Continue]
        goto J0x16;
    }
    return Result;
    //return;    
}

function int ReadChar()
{
    local int C;

    // End:0x0E
    if(InputBuffer == "")
    {
        return 0;
    }
    C = Asc(Left(InputBuffer, 1));
    InputBuffer = Mid(InputBuffer, 1);
    return C;
    //return;    
}

function int PeekChar()
{
    // End:0x0E
    if(InputBuffer == "")
    {
        return 0;
    }
    return Asc(Left(InputBuffer, 1));
    //return;    
}

function bool ReadBufferedLine(out string Text)
{
    // End:0x0E
    if(InputBuffer == "")
    {
        return false;
    }
    // End:0x29
    if(Divide(InputBuffer, CRLF, Text, InputBuffer))
    {
        return true;
    }
    // End:0x44
    if(Divide(InputBuffer, cR, Text, InputBuffer))
    {
        return true;
    }
    // End:0x5F
    if(Divide(InputBuffer, LF, Text, InputBuffer))
    {
        return true;
    }
    return false;
    //return;    
}

function SendBufferedData(string Text)
{
    OutputBuffer $= Text;
    //return;    
}

event ReceivedText(string Text)
{
    InputBuffer $= Text;
    //return;    
}

function DoBufferQueueIO()
{
    local int i;

    J0x00:
    // End:0x132 [Loop If]
    if(bWaiting)
    {
        // End:0x34
        if(Level.TimeSeconds > WaitTimeoutTime)
        {
            bWaiting = false;
            GotMatchTimeout(WaitMatchData);
        }
        // End:0x8D
        if(WaitForCountChars > 0)
        {
            // End:0x53
            if(Len(InputBuffer) < WaitForCountChars)
            {
                // [Explicit Break]
                goto J0x132;
            }
            WaitResult = Left(InputBuffer, WaitForCountChars);
            InputBuffer = Mid(InputBuffer, WaitForCountChars);
            bWaiting = false;
            GotMatch(WaitMatchData);            
        }
        else
        {
            i = InStr(InputBuffer, WaitingFor);
            // End:0xD1
            if((i == -1) && WaitingFor == cR)
            {
                i = InStr(InputBuffer, LF);
            }
            // End:0x12C
            if(i != -1)
            {
                WaitResult = Left(InputBuffer, i + Len(WaitingFor));
                InputBuffer = Mid(InputBuffer, i + Len(WaitingFor));
                bWaiting = false;
                GotMatch(WaitMatchData);                
            }
            else
            {
                // [Explicit Break]
                goto J0x132;
            }
        }
        // [Loop Continue]
        goto J0x00;
    }
    J0x132:

    // End:0x16A
    if(IsConnected())
    {
        // End:0x16A
        if(OutputBuffer != "")
        {
            i = SendText(OutputBuffer);
            OutputBuffer = Mid(OutputBuffer, i);
        }
    }
    //return;    
}

defaultproperties
{
    ReceiveMode=1
}