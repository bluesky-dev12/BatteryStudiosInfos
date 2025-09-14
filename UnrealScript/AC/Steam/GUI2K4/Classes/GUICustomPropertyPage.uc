/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUICustomPropertyPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:8
 *
 *******************************************************************************/
class GUICustomPropertyPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var() noexport editinline GUIComponent Owner;
var() noexport PlayInfoData Item;

function SetOwner(GUIComponent NewOwner)
{
    Owner = NewOwner;
}

function GUIComponent GetOwner()
{
    return Owner;
}

function SetReadOnly(bool bValue);
function bool GetReadOnly()
{
    return false;
}

function Strip(out string Source, string char)
{
    // End:0x7b
    if(Source != "" && char != "")
    {
        // End:0x46
        if(Left(Source, Len(char)) == char)
        {
            Source = Mid(Source, Len(char));
        }
        // End:0x7b
        if(Right(Source, Len(char)) == char)
        {
            Source = Left(Source, Len(Source) - Len(char));
        }
    }
}

static function bool GrabOption(string Delim, out string Options, out string Result)
{
    local string S;

    S = Options;
    // End:0x2b
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
}

static function GetKeyValue(string Pair, out string key, out string Value)
{
    // End:0x24
    if(!Divide(Pair, "=", key, Value))
    {
        key = Pair;
    }
}

static function string ParseOption(string Options, string Delim, string InKey)
{
    local string Pair, key, Value;

    // End:0x45 [While If]
    if(GrabOption(Delim, Options, Pair))
    {
        J0x00:
        GetKeyValue(Pair, key, Value);
        // End:0x42
        if(key ~= InKey)
        {
            return Value;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return "";
}
