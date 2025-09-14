/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIEditBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:25
 *	Functions:12
 *
 *******************************************************************************/
class GUIEditBox extends GUIButton
    native
    editinlinenew
    instanced;

var int MaxTextStrNum;
var string IMEText;
var int IMESelPosStart;
var int IMESelPosEnd;
var int IMECompSize;
var() string TextStr;
var() string AllowedCharSet;
var() bool bMaskText;
var() bool bIntOnly;
var() bool bFloatOnly;
var() bool bIncludeSign;
var() bool bConvertSpaces;
var() int MaxWidth;
var() GUI.eTextCase TextCase;
var() int BorderOffsets[4];
var() bool bReadOnly;
var() bool bAlwaysNotify;
var int CaretPos;
var int FirstVis;
var int LastSizeX;
var int LastCaret;
var int LastLength;
var bool bAllSelected;
var byte LastKey;
var() float DelayTime;

// Export UGUIEditBox::execOnIME_Notify(FFrame&, void* const)
native function bool OnIME_Notify(int Type, int LangID, string strText, int nStartPos, int nSize);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x4b
    if(bIntOnly || bFloatOnly)
    {
        AllowedCharSet = "0123456789";
        // End:0x4b
        if(bFloatOnly)
        {
            AllowedCharSet $= ".";
        }
    }
    bAllSelected = true;
}

event SetText(string NewText)
{
    local bool bChanged;

    bChanged = bAlwaysNotify || TextStr != NewText;
    TextStr = NewText;
    CaretPos = Len(TextStr);
    // End:0x45
    if(bChanged)
    {
        TextChanged();
    }
    bAllSelected = true;
}

function DeleteChar()
{
    // End:0x16
    if(CaretPos == Len(TextStr))
    {
        return;
    }
    // End:0x6f
    else
    {
        // End:0x4c
        if(CaretPos == Len(TextStr) - 1)
        {
            TextStr = Left(TextStr, CaretPos);
            CaretPos = Len(TextStr);
        }
        // End:0x6f
        else
        {
            TextStr = Left(TextStr, CaretPos) $ Mid(TextStr, CaretPos + 1);
        }
    }
    TextChanged();
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    local string temp, st;

    // End:0x13
    if(Len(TextStr) >= MaxTextStrNum)
    {
        return false;
    }
    // End:0x1e
    if(bReadOnly)
    {
        return false;
    }
    // End:0x38
    if(Unicode != "")
    {
        st = Unicode;
    }
    // End:0x47
    else
    {
        st = Chr(key);
    }
    // End:0x17d
    if(key < 32)
    {
        // End:0x7b
        if(!Controller.CtrlPressed || key == 9)
        {
            return false;
        }
        switch(key)
        {
            // End:0xa4
            case 3:
                PlayerOwner().CopyToClipboard(TextStr);
                bAllSelected = true;
                // End:0x175
                break;
            // End:0x14c
            case 22:
                // End:0x109
                if(TextStr == "" || CaretPos == Len(TextStr))
                {
                    // End:0xd9
                    if(bAllSelected)
                    {
                        TextStr = "";
                    }
                    TextStr = ConvertIllegal(TextStr $ PlayerOwner().PasteFromClipboard());
                    CaretPos = Len(TextStr);
                }
                // End:0x149
                else
                {
                    temp = ConvertIllegal(Left(TextStr, CaretPos) $ PlayerOwner().PasteFromClipboard() $ Mid(TextStr, CaretPos));
                    TextStr = temp;
                }
                // End:0x175
                break;
            // End:0x172
            case 24:
                PlayerOwner().CopyToClipboard(TextStr);
                TextStr = "";
                CaretPos = 0;
            // End:0xffff
            default:
                TextChanged();
                return true;
            }
    }
    // End:0x19d
    if(bAllSelected)
    {
        TextStr = "";
        CaretPos = 0;
        bAllSelected = false;
    }
    // End:0x2d3
    if(AllowedCharSet == "" || bIncludeSign && st == "-" || st == "+" && TextStr == "" || InStr(AllowedCharSet, st) >= 0)
    {
        // End:0x2d3
        if(MaxWidth == 0 || Len(TextStr) < MaxWidth)
        {
            // End:0x251
            if(bConvertSpaces && st == " " || st == "?" || st == "\\")
            {
                st = "_";
            }
            // End:0x292
            if(TextStr == "" || CaretPos == Len(TextStr))
            {
                TextStr = TextStr $ st;
                CaretPos = Len(TextStr);
            }
            // End:0x2cb
            else
            {
                temp = Left(TextStr, CaretPos) $ st $ Mid(TextStr, CaretPos);
                TextStr = temp;
                ++ CaretPos;
            }
            TextChanged();
            return true;
        }
    }
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(bReadOnly || State != 1)
    {
        return false;
    }
    // End:0x6b
    if(key == 8)
    {
        // End:0x69
        if(CaretPos > 0)
        {
            // End:0x5c
            if(bAllSelected)
            {
                TextStr = "";
                CaretPos = 0;
                bAllSelected = false;
                TextChanged();
            }
            // End:0x69
            else
            {
                -- CaretPos;
                DeleteChar();
            }
        }
        return true;
    }
    // End:0xaa
    if(key == 46)
    {
        // End:0xa2
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();
        }
        // End:0xa8
        else
        {
            DeleteChar();
        }
        return true;
    }
    // End:0xe7
    if(key == 37)
    {
        // End:0xd3
        if(bAllSelected)
        {
            CaretPos = 0;
            bAllSelected = false;
        }
        // End:0xe5
        else
        {
            // End:0xe5
            if(CaretPos > 0)
            {
                -- CaretPos;
            }
        }
        return true;
    }
    // End:0x130
    if(key == 39)
    {
        // End:0x116
        if(bAllSelected)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;
        }
        // End:0x12e
        else
        {
            // End:0x12e
            if(CaretPos < Len(TextStr))
            {
                ++ CaretPos;
            }
        }
        return true;
    }
    // End:0x14f
    if(key == 36)
    {
        CaretPos = 0;
        bAllSelected = false;
        return true;
    }
    // End:0x174
    if(key == 35)
    {
        CaretPos = Len(TextStr);
        bAllSelected = false;
        return true;
    }
    // End:0x1a0
    if(key == 65 && Controller.CtrlPressed)
    {
        bAllSelected = true;
        return true;
    }
    return false;
}

function string ConvertIllegal(string inputstr)
{
    local int i, Max;
    local string retval, C;

    i = 0;
    Max = Len(inputstr);
    J0x14:
    // End:0xb9 [While If]
    if(i < Max)
    {
        C = Mid(inputstr, i, 1);
        // End:0x5e
        if(AllowedCharSet != "" && InStr(AllowedCharSet, C) < 0)
        {
            C = "";
        }
        // End:0x9d
        if(bConvertSpaces && C == " " || C == "?" || C == "\\")
        {
            C = "_";
        }
        retval = retval $ C;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    // End:0xd1
    if(MaxWidth > 0)
    {
        return Left(retval, MaxWidth);
    }
    return retval;
}

function string GetText()
{
    return TextStr;
}

function TextChanged()
{
    OnChange(self);
}

function InternalActivate()
{
    CaretPos = Len(TextStr);
    bAllSelected = true;
}

function InternalDeactivate()
{
    CaretPos = 0;
    bAllSelected = false;
}

function IMEInputCancel()
{
    IMEText = "";
    IMECompSize = 0;
    IMESelPosStart = 0;
    IMESelPosEnd = 0;
    Controller.ConsoleCommand("IMECANCEL");
}

defaultproperties
{
    MaxTextStrNum=255
    MaxWidth=768
    LastCaret=-1
    LastLength=-1
    StyleName="EditBox"
    WinHeight=0.060
    bCaptureMouse=true
    bRequiresStyle=true
    OnClickSound=2
    OnActivate=InternalActivate
    OnDeActivate=InternalDeactivate
    OnKeyType=InternalOnKeyType
    OnKeyEvent=InternalOnKeyEvent
}