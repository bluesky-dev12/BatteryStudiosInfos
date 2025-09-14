/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\BufferedTCPLink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:12
 *
 *******************************************************************************/
class BufferedTCPLink extends TcpLink
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    transient;

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
}

function WaitFor(string What, float TimeOut, int MatchData)
{
    bWaiting = true;
    WaitingFor = What;
    WaitForCountChars = 0;
    WaitTimeoutTime = Level.TimeSeconds + TimeOut;
    WaitMatchData = MatchData;
    WaitResult = "";
}

function WaitForCount(int Count, float TimeOut, int MatchData)
{
    bWaiting = true;
    WaitingFor = "";
    WaitForCountChars = Count;
    WaitTimeoutTime = Level.TimeSeconds + TimeOut;
    WaitMatchData = MatchData;
    WaitResult = "";
}

function GotMatch(int MatchData);
function GotMatchTimeout(int MatchData);
function string ParseDelimited(string Text, string Delimiter, int Count, optional bool bToEndOfLine)
{
    local string Result;
    local int Found, i;
    local string S;

    Result = "";
    Found = 1;
    i = 0;
    J0x16:
    // End:0xba [While If]
    if(i < Len(Text))
    {
        S = Mid(Text, i, 1);
        // End:0x8f
        if(InStr(Delimiter, S) != -1)
        {
            // End:0x85
            if(Found == Count)
            {
                // End:0x7f
                if(bToEndOfLine)
                {
                    return Result $ Mid(Text, i);
                }
                // End:0x85
                else
                {
                    return Result;
                }
            }
            ++ Found;
        }
        // End:0xb0
        else
        {
            // End:0xb0
            if(Found >= Count)
            {
                Result = Result $ S;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    return Result;
}

function int ReadChar()
{
    local int C;

    // End:0x0e
    if(InputBuffer == "")
    {
        return 0;
    }
    C = Asc(Left(InputBuffer, 1));
    InputBuffer = Mid(InputBuffer, 1);
    return C;
}

function int PeekChar()
{
    // End:0x0e
    if(InputBuffer == "")
    {
        return 0;
    }
    return Asc(Left(InputBuffer, 1));
}

function bool ReadBufferedLine(out string Text)
{
    // End:0x0e
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
    // End:0x5f
    if(Divide(InputBuffer, LF, Text, InputBuffer))
    {
        return true;
    }
    return false;
}

function SendBufferedData(string Text)
{
    OutputBuffer $= Text;
}

event ReceivedText(string Text)
{
    InputBuffer $= Text;
}

function DoBufferQueueIO()
{
    local int i;

    // End:0x132 [While If]
    if(bWaiting)
    {
        J0x00:
        // End:0x34
        if(Level.TimeSeconds > WaitTimeoutTime)
        {
            bWaiting = false;
            GotMatchTimeout(WaitMatchData);
        }
        // End:0x8d
        if(WaitForCountChars > 0)
        {
            // End:0x53
            if(Len(InputBuffer) < WaitForCountChars)
            {
            }
            // End:0x132
            else
            {
                WaitResult = Left(InputBuffer, WaitForCountChars);
                InputBuffer = Mid(InputBuffer, WaitForCountChars);
                bWaiting = false;
                GotMatch(WaitMatchData);
                // This is an implied JumpToken;
                goto J0x12f;
            }
            i = InStr(InputBuffer, WaitingFor);
            // End:0xd1
            if(i == -1 && WaitingFor == cR)
            {
                i = InStr(InputBuffer, LF);
            }
            // End:0x12c
            if(i != -1)
            {
                WaitResult = Left(InputBuffer, i + Len(WaitingFor));
                InputBuffer = Mid(InputBuffer, i + Len(WaitingFor));
                bWaiting = false;
                GotMatch(WaitMatchData);
            }
            // End:0x12f
            else
            {
                // This is an implied JumpToken;
                goto J0x132;
            }
            // This is an implied JumpToken; Continue!
            goto J0x00;
        }
    }
    // End:0x16a
    if(IsConnected())
    {
        // End:0x16a
        if(OutputBuffer != "")
        {
            i = SendText(OutputBuffer);
            OutputBuffer = Mid(OutputBuffer, i);
        }
    }
}

defaultproperties
{
    ReceiveMode=1
}