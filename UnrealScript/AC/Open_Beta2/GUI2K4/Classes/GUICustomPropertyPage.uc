class GUICustomPropertyPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x00000008*/ noexport editinline GUIComponent Owner;
var() noexport PlayInfoData Item;

function SetOwner(GUIComponent NewOwner)
{
    Owner = NewOwner;
    //return;    
}

function GUIComponent GetOwner()
{
    return Owner;
    //return;    
}

function SetReadOnly(bool bValue)
{
    //return;    
}

function bool GetReadOnly()
{
    return false;
    //return;    
}

function Strip(out string Source, string char)
{
    // End:0x7B
    if((Source != "") && char != "")
    {
        // End:0x46
        if(Left(Source, Len(char)) == char)
        {
            Source = Mid(Source, Len(char));
        }
        // End:0x7B
        if(Right(Source, Len(char)) == char)
        {
            Source = Left(Source, Len(Source) - Len(char));
        }
    }
    //return;    
}

static function bool GrabOption(string Delim, out string Options, out string Result)
{
    local string S;

    S = Options;
    // End:0x2B
    if(Left(Options, 1) == Delim)
    {
        Result = Mid(Options, 1);
    }
    // End:0x51
    if(!Divide(S, Delim, Result, Options))
    {
        Result = S;
    }
    return Result != "";
    //return;    
}

static function GetKeyValue(string Pair, out string key, out string Value)
{
    // End:0x24
    if(!Divide(Pair, "=", key, Value))
    {
        key = Pair;
    }
    //return;    
}

static function string ParseOption(string Options, string Delim, string InKey)
{
    local string Pair, key, Value;

    J0x00:
    // End:0x45 [Loop If]
    if(GrabOption(Delim, Options, Pair))
    {
        GetKeyValue(Pair, key, Value);
        // End:0x42
        if(key ~= InKey)
        {
            return Value;
        }
        // [Loop Continue]
        goto J0x00;
    }
    return "";
    //return;    
}
