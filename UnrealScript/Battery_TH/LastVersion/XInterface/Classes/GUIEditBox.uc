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
native function bool OnIME_Notify(int Type, int LangID, string strText, int nStartPos, int nSize)
{
    //native.Type;
    //native.LangID;
    //native.strText;
    //native.nStartPos;
    //native.nSize;        
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x4B
    if(bIntOnly || bFloatOnly)
    {
        AllowedCharSet = "0123456789";
        // End:0x4B
        if(bFloatOnly)
        {
            AllowedCharSet $= ".";
        }
    }
    bAllSelected = true;
    //return;    
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
    //return;    
}

function DeleteChar()
{
    // End:0x16
    if(CaretPos == Len(TextStr))
    {
        return;        
    }
    else
    {
        // End:0x4C
        if(CaretPos == (Len(TextStr) - 1))
        {
            TextStr = Left(TextStr, CaretPos);
            CaretPos = Len(TextStr);            
        }
        else
        {
            TextStr = Left(TextStr, CaretPos) $ Mid(TextStr, CaretPos + 1);
        }
    }
    TextChanged();
    //return;    
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    local string temp, st;

    // End:0x13
    if(Len(TextStr) >= MaxTextStrNum)
    {
        return false;
    }
    // End:0x1E
    if(bReadOnly)
    {
        return false;
    }
    // End:0x38
    if(Unicode != "")
    {
        st = Unicode;        
    }
    else
    {
        st = Chr(int(key));
    }
    // End:0x17D
    if(int(key) < 32)
    {
        // End:0x7B
        if(!Controller.CtrlPressed || int(key) == 9)
        {
            return false;
        }
        switch(key)
        {
            // End:0xA4
            case 3:
                PlayerOwner().CopyToClipboard(TextStr);
                bAllSelected = true;
                // End:0x175
                break;
            // End:0x14C
            case 22:
                // End:0x109
                if((TextStr == "") || CaretPos == Len(TextStr))
                {
                    // End:0xD9
                    if(bAllSelected)
                    {
                        TextStr = "";
                    }
                    TextStr = ConvertIllegal(TextStr $ PlayerOwner().PasteFromClipboard());
                    CaretPos = Len(TextStr);                    
                }
                else
                {
                    temp = ConvertIllegal((Left(TextStr, CaretPos) $ PlayerOwner().PasteFromClipboard()) $ Mid(TextStr, CaretPos));
                    TextStr = temp;
                }
                // End:0x175
                break;
            // End:0x172
            case 24:
                PlayerOwner().CopyToClipboard(TextStr);
                TextStr = "";
                CaretPos = 0;
            // End:0xFFFF
            default:
                break;
        }
        TextChanged();
        return true;
    }
    // End:0x19D
    if(bAllSelected)
    {
        TextStr = "";
        CaretPos = 0;
        bAllSelected = false;
    }
    // End:0x2D3
    if(((AllowedCharSet == "") || (bIncludeSign && (st == "-") || st == "+") && TextStr == "") || InStr(AllowedCharSet, st) >= 0)
    {
        // End:0x2D3
        if((MaxWidth == 0) || Len(TextStr) < MaxWidth)
        {
            // End:0x251
            if(bConvertSpaces && ((st == " ") || st == "?") || st == "\\")
            {
                st = "_";
            }
            // End:0x292
            if((TextStr == "") || CaretPos == Len(TextStr))
            {
                TextStr = TextStr $ st;
                CaretPos = Len(TextStr);                
            }
            else
            {
                temp = (Left(TextStr, CaretPos) $ st) $ Mid(TextStr, CaretPos);
                TextStr = temp;
                CaretPos++;
            }
            TextChanged();
            return true;
        }
    }
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1A
    if(bReadOnly || int(State) != 1)
    {
        return false;
    }
    // End:0x6B
    if(int(key) == 8)
    {
        // End:0x69
        if(CaretPos > 0)
        {
            // End:0x5C
            if(bAllSelected)
            {
                TextStr = "";
                CaretPos = 0;
                bAllSelected = false;
                TextChanged();                
            }
            else
            {
                CaretPos--;
                DeleteChar();
            }
        }
        return true;
    }
    // End:0xAA
    if(int(key) == 46)
    {
        // End:0xA2
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();            
        }
        else
        {
            DeleteChar();
        }
        return true;
    }
    // End:0xE7
    if(int(key) == 37)
    {
        // End:0xD3
        if(bAllSelected)
        {
            CaretPos = 0;
            bAllSelected = false;            
        }
        else
        {
            // End:0xE5
            if(CaretPos > 0)
            {
                CaretPos--;
            }
        }
        return true;
    }
    // End:0x130
    if(int(key) == 39)
    {
        // End:0x116
        if(bAllSelected)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;            
        }
        else
        {
            // End:0x12E
            if(CaretPos < Len(TextStr))
            {
                CaretPos++;
            }
        }
        return true;
    }
    // End:0x14F
    if(int(key) == 36)
    {
        CaretPos = 0;
        bAllSelected = false;
        return true;
    }
    // End:0x174
    if(int(key) == 35)
    {
        CaretPos = Len(TextStr);
        bAllSelected = false;
        return true;
    }
    // End:0x1A0
    if((int(key) == 65) && Controller.CtrlPressed)
    {
        bAllSelected = true;
        return true;
    }
    return false;
    //return;    
}

function string ConvertIllegal(string inputstr)
{
    local int i, Max;
    local string retval, C;

    i = 0;
    Max = Len(inputstr);
    J0x14:

    // End:0xB9 [Loop If]
    if(i < Max)
    {
        C = Mid(inputstr, i, 1);
        // End:0x5E
        if((AllowedCharSet != "") && InStr(AllowedCharSet, C) < 0)
        {
            C = "";
        }
        // End:0x9D
        if(bConvertSpaces && ((C == " ") || C == "?") || C == "\\")
        {
            C = "_";
        }
        retval = retval $ C;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0xD1
    if(MaxWidth > 0)
    {
        return Left(retval, MaxWidth);
    }
    return retval;
    //return;    
}

function string GetText()
{
    return TextStr;
    //return;    
}

function TextChanged()
{
    OnChange(self);
    //return;    
}

function InternalActivate()
{
    CaretPos = Len(TextStr);
    bAllSelected = true;
    //return;    
}

function InternalDeactivate()
{
    CaretPos = 0;
    bAllSelected = false;
    //return;    
}

function IMEInputCancel()
{
    IMEText = "";
    IMECompSize = 0;
    IMESelPosStart = 0;
    IMESelPosEnd = 0;
    Controller.ConsoleCommand("IMECANCEL");
    //return;    
}

defaultproperties
{
    MaxTextStrNum=255
    MaxWidth=768
    LastCaret=-1
    LastLength=-1
    StyleName="EditBox"
    WinHeight=0.0600000
    bCaptureMouse=false
    bRequiresStyle=true
    OnClickSound=2
    OnActivate=GUIEditBox.InternalActivate
    OnDeActivate=GUIEditBox.InternalDeactivate
    OnKeyType=GUIEditBox.InternalOnKeyType
    OnKeyEvent=GUIEditBox.InternalOnKeyEvent
}