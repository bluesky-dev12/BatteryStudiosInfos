/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTNumericEditBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class BTNumericEditBoxHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var int MinValue;
var int MaxValue;
var bool bReadOnly;
var string FormatStr;
var string OriginalStr;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color CursorColor;
var Image cursorImg;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    cursorImg.Image = Controller.DefaultPens[0];
    cursorImg.width = 8.0;
    cursorImg.Height = 8.0;
    cursorImg.DrawType = 15;
    cursorImg.DrawColor = CursorColor;
    OriginalStr = "";
    Caption = "";
    i = 4;
    FontColor[i].R = 80;
    FontColor[i].G = 80;
    FontColor[i].B = 70;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = 100;
}

function Clear()
{
    OriginalStr = "";
    Caption = "";
}

function Internal_OnRendered(Canvas C)
{
    local int SelectMenuState;
    local string DrawStr;
    local FloatBox cursorPos;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    SelectMenuState = self.MenuState;
    // End:0x9a
    if(bActiveCursor == false && MenuState == 2)
    {
        SelectMenuState = 0;
    }
    // End:0xb5
    else
    {
        // End:0xb5
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    C.DrawColor = FontColor[SelectMenuState];
    DrawStr = Caption;
    // End:0x139
    if(DrawStr == "")
    {
        DrawStr = "|";
    }
    // End:0x1cb
    else
    {
        class'BTCustomDrawHK'.static.DrawString(C, DrawStr, CaptionDrawType, float(FontSize[SelectMenuState]), RWinPos.X1 + float(CaptionPadding[0]), RWinPos.Y1 + float(CaptionPadding[1]), RWinPos.X2 - float(CaptionPadding[2]) - float(3), RWinPos.Y2 - float(CaptionPadding[3]), FontShadowColor[SelectMenuState]);
    }
    // End:0x2ca
    if(bReadOnly == false && bActiveCursor)
    {
        C.DrawColor = CursorColor;
        cursorPos = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(C, DrawStr, CaptionDrawType, float(FontSize[SelectMenuState]), RWinPos.X1 + float(CaptionPadding[0]), RWinPos.Y1 + float(CaptionPadding[1]), RWinPos.X2 - float(CaptionPadding[2]) - float(3), RWinPos.Y2 - float(CaptionPadding[3]));
        class'BTCustomDrawHK'.static.DrawImage(C, cursorImg, cursorPos.X2, cursorPos.Y1, cursorPos.X2 + float(3), cursorPos.Y2);
    }
}

function SetData(int Number)
{
    OriginalStr = string(Number);
    Caption = class'BTCustomDrawHK'.static.ToWonString(OriginalStr);
}

function SetDataExtra(int Number, string Extra)
{
    OriginalStr = string(Number);
    Caption = class'BTCustomDrawHK'.static.ToWonString(OriginalStr) @ Extra;
}

function bool Internal_OnKeyEvent(out byte key, out byte State, float Delta)
{
    local int srcLen, temp, sum;
    local string BackupStr;

    // End:0x0b
    if(bReadOnly)
    {
        return true;
    }
    // End:0x1a
    if(State != 1)
    {
        return false;
    }
    BackupStr = OriginalStr;
    // End:0x3f
    if(key == 13)
    {
        FocusFirst(none);
        return true;
    }
    // End:0x3a8
    else
    {
        // End:0xb6
        if(key == 38 || key == 236)
        {
            sum = int(OriginalStr) + 50;
            // End:0x8c
            if(sum < MinValue)
            {
                sum = MinValue;
            }
            // End:0xa6
            if(sum > MaxValue)
            {
                sum = MaxValue;
            }
            OriginalStr = string(sum);
        }
        // End:0x3a8
        else
        {
            // End:0x12d
            if(key == 40 || key == 237)
            {
                sum = int(OriginalStr) - 50;
                // End:0x103
                if(sum < MinValue)
                {
                    sum = MinValue;
                }
                // End:0x11d
                if(sum > MaxValue)
                {
                    sum = MaxValue;
                }
                OriginalStr = string(sum);
            }
            // End:0x3a8
            else
            {
                // End:0x181
                if(key == 8)
                {
                    srcLen = Len(OriginalStr);
                    // End:0x16b
                    if(srcLen > 1)
                    {
                        OriginalStr = Left(OriginalStr, srcLen - 1);
                    }
                    // End:0x17e
                    else
                    {
                        // End:0x17e
                        if(srcLen == 1)
                        {
                            OriginalStr = "";
                        }
                    }
                }
                // End:0x3a8
                else
                {
                    // End:0x208
                    if(key == 48)
                    {
                        srcLen = Len(OriginalStr);
                        // End:0x1fc
                        if(srcLen >= 1)
                        {
                            temp = Asc(Left(OriginalStr, 1));
                            // End:0x1f9
                            if(byte(temp) > 48 && byte(temp) <= 57)
                            {
                                OriginalStr = OriginalStr $ string(key - 48);
                            }
                        }
                        // End:0x205
                        else
                        {
                            OriginalStr = "0";
                        }
                    }
                    // End:0x3a8
                    else
                    {
                        // End:0x296
                        if(key > 48 && key <= 57)
                        {
                            srcLen = Len(OriginalStr);
                            temp = Asc(OriginalStr);
                            // End:0x279
                            if(srcLen == 1 && byte(temp) == 48)
                            {
                                OriginalStr = string(key - 48);
                            }
                            // End:0x293
                            else
                            {
                                OriginalStr = OriginalStr $ string(key - 48);
                            }
                        }
                        // End:0x3a8
                        else
                        {
                            // End:0x31d
                            if(key == 96)
                            {
                                srcLen = Len(OriginalStr);
                                // End:0x311
                                if(srcLen >= 1)
                                {
                                    temp = Asc(Left(OriginalStr, 1));
                                    // End:0x30e
                                    if(byte(temp) > 48 && byte(temp) <= 57)
                                    {
                                        OriginalStr = OriginalStr $ string(key - 96);
                                    }
                                }
                                // End:0x31a
                                else
                                {
                                    OriginalStr = "0";
                                }
                            }
                            // End:0x3a8
                            else
                            {
                                // End:0x3a8
                                if(key > 96 && key <= 105)
                                {
                                    srcLen = Len(OriginalStr);
                                    temp = Asc(OriginalStr);
                                    // End:0x38e
                                    if(srcLen == 1 && byte(temp) == 48)
                                    {
                                        OriginalStr = string(key - 96);
                                    }
                                    // End:0x3a8
                                    else
                                    {
                                        OriginalStr = OriginalStr $ string(key - 96);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x3c4
    if(int(OriginalStr) > MaxValue)
    {
        OriginalStr = BackupStr;
    }
    Caption = class'BTCustomDrawHK'.static.ToWonString(OriginalStr);
    return true;
}

defaultproperties
{
    MaxValue=99999999
    CursorColor=(R=229,G=229,B=229,A=255)
    StyleName="STY2WarfareHK_Empty"
    bCaptureMouse=true
    OnRendered=Internal_OnRendered
    OnActivate=InternalActivate
    OnDeActivate=InternalDeactivate
    OnKeyEvent=Internal_OnKeyEvent
}