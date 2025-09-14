/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTEditBoxHK2.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:29
 *	Functions:28
 *
 *******************************************************************************/
class BTEditBoxHK2 extends GUIEditBox
    editinlinenew
    instanced;

struct SelectionArea
{
    var() int StartPos;
    var() int EndPos;
};

var bool bHudMode;
var bool bLimitDrawSize;
var float LimitDrawWidth;
var int LimitDrawTextSize;
var int FontSize[5];
var Color FontColor[5];
var Color FontShadowColor[5];
var Image bgImg;
var int ButtonID;
var bool bActiveCursor;
var Canvas saveC;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color SelectionColor;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color CursorColor;
var Image selectionImg;
var Image cursorImg;
var array<float> CacheTextWidth;
var float CacheTextHeight;
var string textStrVis;
var string BackupTextStr;
var int EndVis;
var bool bClickAllSelect;
var bool bSelectionMode;
var bool bMouseFirstPress;
var bool bMousePressed;
var SelectionArea SelArea;
var delegate<OnChat> __OnChat__Delegate;
var delegate<OnInputTab> __OnInputTab__Delegate;
var delegate<OnInputSpace> __OnInputSpace__Delegate;
var delegate<OnFunctionKey> __OnFunctionKey__Delegate;

delegate bool OnChat(GUIComponent Sender, string Text)
{
    return false;
}

delegate OnInputTab(GUIComponent Sender, string Text);
delegate OnInputSpace(GUIComponent Sender, string Text);
delegate bool OnFunctionKey(GUIComponent Sender, byte FunctionKey, string Text);
function SetDefaultFontColor()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xbf [While If]
    if(i < 4)
    {
        FontColor[i].R = byte(255);
        FontColor[i].G = byte(255);
        FontColor[i].B = byte(255);
        FontColor[i].A = byte(255);
        FontShadowColor[i].R = 0;
        FontShadowColor[i].G = 0;
        FontShadowColor[i].B = 0;
        FontShadowColor[i].A = byte(255);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    FontColor[4].R = 90;
    FontColor[i].G = 90;
    FontColor[i].B = 90;
    FontColor[i].A = byte(255);
    FontShadowColor[4].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = byte(255);
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontSize[i] = Size;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveSelectionText()
{
    // End:0x6f
    if(SelArea.StartPos <= SelArea.EndPos)
    {
        self.TextStr = self.Left(self.TextStr, SelArea.StartPos) $ self.Mid(self.TextStr, SelArea.EndPos);
        CaretPos = SelArea.StartPos;
    }
    // End:0xc2
    else
    {
        self.TextStr = self.Left(self.TextStr, SelArea.EndPos) $ self.Mid(self.TextStr, SelArea.StartPos);
        CaretPos = SelArea.EndPos;
    }
    ResetSelectionPos(CaretPos);
}

function string GetSelectionText()
{
    // End:0x4e
    if(SelArea.StartPos < SelArea.EndPos)
    {
        return self.Mid(self.TextStr, SelArea.StartPos, SelArea.EndPos - SelArea.StartPos);
    }
    // End:0x80
    else
    {
        return self.Mid(self.TextStr, SelArea.EndPos, SelArea.StartPos - SelArea.EndPos);
    }
}

function ResetSelectionPos(int pos)
{
    SelArea.StartPos = pos;
    SelArea.EndPos = pos;
    bSelectionMode = false;
}

function InputSelectionPos(int pos)
{
    // End:0x32
    if(pos == -1)
    {
        SelArea.StartPos = 0;
        SelArea.EndPos = Len(self.TextStr);
    }
    SelArea.EndPos = pos;
    // End:0x66
    if(SelArea.StartPos != SelArea.EndPos)
    {
        bSelectionMode = true;
    }
    // End:0x6e
    else
    {
        bSelectionMode = false;
    }
}

function SetText(string Text)
{
    SetTextSelect(Text, false);
}

function SetTextSelect(string Text, bool bAllSelect)
{
    SetText(Text);
    bAllSelected = false;
    TextChanged();
    // End:0x48
    if(bAllSelect == false)
    {
        bSelectionMode = false;
        SelArea.StartPos = 0;
        SelArea.EndPos = 0;
    }
    // End:0x50
    else
    {
        bClickAllSelect = true;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    cursorImg.Image = Controller.DefaultPens[0];
    cursorImg.width = 8.0;
    cursorImg.Height = 8.0;
    cursorImg.DrawType = 15;
    cursorImg.DrawColor = CursorColor;
    selectionImg.Image = Controller.DefaultPens[0];
    selectionImg.width = 8.0;
    selectionImg.Height = 8.0;
    selectionImg.DrawType = 15;
    selectionImg.DrawColor = SelectionColor;
    SelArea.StartPos = 0;
    SelArea.EndPos = 0;
    FirstVis = 0;
    EndVis = 0;
    SetDefaultFontColor();
    SetFontSizeAll(10);
}

function Clear()
{
    ResetCache();
    SelArea.StartPos = 0;
    SelArea.EndPos = 0;
    FirstVis = 0;
    EndVis = 0;
    bSelectionMode = false;
    bMouseFirstPress = false;
    bMousePressed = false;
    TextStr = "";
    TextChanged();
}

function bool OwnerDraw(Canvas C)
{
    local int MousePos;
    local float X, X2, S, E, cursorW, HT;

    local string tempString;

    saveC = C;
    C.Style = 5;
    // End:0x2a
    if(bVisible == false)
    {
        return true;
    }
    // End:0x77
    if(bHudMode == false)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, bgImg, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    // End:0xea
    if(self.FirstVis <= self.CaretPos && self.CaretPos <= self.EndVis)
    {
        self.textStrVis = self.Mid(self.TextStr, self.FirstVis, self.EndVis - self.FirstVis);
    }
    // End:0x181
    else
    {
        // End:0x137
        if(self.CaretPos < self.FirstVis)
        {
            self.FirstVis = self.CaretPos;
            self.CaculateVisibleText(true, self.FirstVis);
            ResetCache();
        }
        // End:0x181
        else
        {
            // End:0x181
            if(self.CaretPos > self.EndVis)
            {
                self.EndVis = self.CaretPos;
                self.CaculateVisibleText(false, self.EndVis);
                ResetCache();
            }
        }
    }
    // End:0x1ec
    if(bMouseFirstPress)
    {
        bMousePressed = true;
        bMouseFirstPress = false;
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        ResetSelectionPos(CaretPos);
    }
    // End:0x276
    if(bMousePressed)
    {
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        InputSelectionPos(CaretPos);
        // End:0x276
        if(bClickAllSelect)
        {
            bSelectionMode = true;
            SelArea.StartPos = 0;
            SelArea.EndPos = Len(TextStr);
        }
    }
    // End:0x318
    if(bHudMode == false)
    {
        C.DrawColor = FontColor[self.MenuState];
        class'BTCustomDrawHK'.static.DrawString(C, self.textStrVis, 0, float(FontSize[self.MenuState]), RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2, self.FontShadowColor[self.MenuState], 0, true);
    }
    // End:0x637
    if(bActiveCursor && bReadOnly == false)
    {
        tempString = self.Mid(self.textStrVis, 0, self.CaretPos - self.FirstVis);
        // End:0x39c
        if(tempString != "")
        {
            C.BtrTextSize(tempString, FontSize[self.MenuState], cursorW, HT);
        }
        // End:0x3d5
        else
        {
            C.BtrTextSize("|", FontSize[self.MenuState], cursorW, HT);
            cursorW = 0.0;
        }
        // End:0x43d
        if(bHudMode == false)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, cursorImg, RWinPos.X1 + cursorW, RWinPos.Y1, RWinPos.X1 + cursorW + float(3), RWinPos.Y1 + HT);
        }
        // End:0x627
        if(bSelectionMode)
        {
            S = float(SelArea.StartPos - self.FirstVis);
            E = float(SelArea.EndPos - self.FirstVis);
            // End:0x4b2
            if(S > E)
            {
                HT = S;
                S = E;
                E = HT;
            }
            // End:0x4cd
            if(S < float(0))
            {
                X = 0.0;
            }
            // End:0x51c
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(S));
                C.BtrTextSize(tempString, FontSize[self.MenuState], X, HT);
            }
            // End:0x576
            if(E > float(self.EndVis - self.FirstVis))
            {
                C.BtrTextSize(self.textStrVis, FontSize[self.MenuState], X2, HT);
            }
            // End:0x5c5
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(E));
                C.BtrTextSize(tempString, FontSize[self.MenuState], X2, HT);
            }
            // End:0x627
            if(bHudMode == false)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + X, RWinPos.Y1, RWinPos.X1 + X2, RWinPos.Y1 + HT);
            }
        }
        DrawIMEInfo(C, cursorW);
    }
    return true;
}

function DrawIMEInfo(Canvas C, float CursorWidth)
{
    local string tempString;
    local float width, SelectWidth, Height, OffsetX;
    local int TextSize, CompSize, SelectSize, SelPosStart;
    local FloatBox fbDraw;

    // End:0x4f4
    if(IMEText != "")
    {
        // End:0x5b
        if(CursorWidth <= float(0))
        {
            tempString = Mid(textStrVis, FirstVis, TextSize);
            C.BtrTextSizeOLD(tempString, FontSize[MenuState], CursorWidth, Height);
        }
        TextSize = CaretPos - FirstVis;
        // End:0x8a
        if(TextSize < IMECompSize)
        {
            CompSize = TextSize;
        }
        // End:0x95
        else
        {
            CompSize = IMECompSize;
        }
        // End:0x149
        if(IMESelPosEnd == 0)
        {
            tempString = Mid(textStrVis, TextSize - CompSize, CompSize);
            C.BtrTextSizeOLD(tempString, FontSize[MenuState], width, Height);
            class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + CursorWidth - width, RWinPos.Y1, RWinPos.X1 + CursorWidth, RWinPos.Y1 + Height);
        }
        // End:0x304
        else
        {
            // End:0x1a2
            if(TextSize < IMECompSize)
            {
                // End:0x186
                if(LimitDrawTextSize == 0)
                {
                    SelPosStart = CaretPos - IMECompSize + IMESelPosStart - FirstVis;
                }
                // End:0x19f
                else
                {
                    SelPosStart = CaretPos - CompSize + IMESelPosStart;
                }
            }
            // End:0x1ad
            else
            {
                SelPosStart = IMESelPosStart;
            }
            // End:0x304
            if(SelPosStart >= 0)
            {
                SelectSize = IMESelPosEnd - IMESelPosStart;
                tempString = Mid(textStrVis, TextSize - CompSize + SelPosStart, CompSize - SelPosStart);
                C.BtrTextSizeOLD(tempString, FontSize[MenuState], width, Height);
                tempString = Mid(textStrVis, TextSize - CompSize + SelPosStart + SelectSize, CompSize - SelPosStart - SelectSize);
                // End:0x295
                if(tempString != "")
                {
                    C.BtrTextSizeOLD(tempString, FontSize[MenuState], SelectWidth, Height);
                }
                // End:0x2a0
                else
                {
                    SelectWidth = 0.0;
                }
                class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + CursorWidth - width, RWinPos.Y1, RWinPos.X1 + CursorWidth - SelectWidth, RWinPos.Y1 + Height);
            }
        }
        C.BtrTextSizeOLD(IMEText, FontSize[MenuState], width, Height);
        width += float(5);
        Height += float(5);
        OffsetX = RWinPos.X1 + CursorWidth + width;
        // End:0x39d
        if(float(C.SizeX) < OffsetX)
        {
            OffsetX = float(C.SizeX) - OffsetX;
        }
        // End:0x3a8
        else
        {
            OffsetX = 0.0;
        }
        fbDraw.X1 = RWinPos.X1 + CursorWidth + OffsetX;
        fbDraw.X2 = RWinPos.X1 + CursorWidth + width + OffsetX;
        fbDraw.Y1 = RWinPos.Y1 - Height;
        fbDraw.Y2 = RWinPos.Y2 - Height;
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.panel_1_1, fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2);
        C.DrawColor = FontColor[MenuState];
        class'BTCustomDrawHK'.static.DrawString(C, IMEText, 4, float(FontSize[MenuState]), fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2, FontShadowColor[MenuState], 0, true);
    }
}

function CaculateVisibleText(bool bHoldFirst, int pos)
{
    local int i;
    local float HT, scrollW;
    local string temp;
    local int lenStr;

    // End:0x0d
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    // End:0xe9
    if(bHoldFirst)
    {
        i = lenStr;
        J0x33:
        // End:0xe6 [While If]
        if(i >= pos)
        {
            temp = self.Mid(self.TextStr, pos, i - pos);
            saveC.BtrTextSize(temp, FontSize[self.MenuState], scrollW, HT);
            // End:0xdc
            if(AWinPos.X2 - AWinPos.X1 > scrollW)
            {
                self.EndVis = i;
                self.textStrVis = temp;
                return;
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x33;
        }
    }
    // End:0x1a4
    else
    {
        i = 0;
        J0xf0:
        // End:0x1a4 [While If]
        if(i <= pos)
        {
            temp = self.Mid(self.TextStr, i, pos - i);
            saveC.BtrTextSize(temp, FontSize[self.MenuState], scrollW, HT);
            // End:0x19a
            if(AWinPos.X2 - AWinPos.X1 > scrollW)
            {
                self.FirstVis = i;
                CaculateVisibleText(true, self.FirstVis);
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf0;
        }
    }
}

function ResetCache()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < CacheTextWidth.Length)
    {
        self.CacheTextWidth[i] = 0.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Internal_OnChange(GUIComponent Sender)
{
    ResetCache();
    self.CaculateVisibleText(true, self.FirstVis);
}

function OnMouseRelease(GUIComponent Sender)
{
    bMousePressed = false;
    bMouseFirstPress = false;
}

function OnMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x30
    if(bMouseFirstPress == false && bMousePressed == false)
    {
        bMouseFirstPress = true;
        bMousePressed = false;
        IMEInputCancel();
    }
}

function int MousePosToCaretPos(float mx, float my)
{
    local float W, HT;

    mx = mx - AWinPos.X1;
    my = my - AWinPos.Y1;
    // End:0x3b
    if(saveC == none)
    {
        return 0;
    }
    // End:0xa1
    if(self.CacheTextWidth[0] == float(0))
    {
        saveC.BtrTextSize(self.textStrVis, FontSize[self.MenuState], W, HT);
        self.CacheTextWidth[0] = W;
        CacheTextHeight = HT;
    }
    // End:0xd8
    if(mx >= self.CacheTextWidth[0] || my >= CacheTextHeight)
    {
        return Len(self.textStrVis);
    }
    // End:0xe7
    else
    {
        // End:0xe7
        if(mx <= float(0))
        {
            return 0;
        }
    }
    return CaretBinarySearch(0, Len(self.textStrVis), mx, 0);
}

function int CaretBinarySearch(int lCursor, int rCursor, float mx, int Parent)
{
    local int textLen, pivotIndex, Child;
    local float W, HT;
    local string Text;

    textLen = rCursor - lCursor;
    // End:0x23
    if(textLen == 0)
    {
        return lCursor;
    }
    // End:0xef
    if(textLen == 1)
    {
        // End:0xb5
        if(self.CacheTextWidth[Parent] == float(0))
        {
            Text = self.Mid(self.textStrVis, lCursor, textLen);
            saveC.BtrTextSize(Text, FontSize[self.MenuState], W, HT);
            self.CacheTextWidth[Parent] = W;
            Log("1");
        }
        // End:0xcb
        else
        {
            W = self.CacheTextWidth[Parent];
        }
        // End:0xe9
        if(mx <= W / float(2))
        {
            return lCursor;
        }
        // End:0xef
        else
        {
            return rCursor;
        }
    }
    pivotIndex = int(float(textLen / 2) + float(textLen) % float(2) + float(lCursor));
    Child = Parent * 2 + 1;
    // End:0x1ba
    if(self.CacheTextWidth[Child] == float(0))
    {
        Text = self.Mid(self.textStrVis, lCursor, pivotIndex - lCursor);
        saveC.BtrTextSize(Text, FontSize[self.MenuState], W, HT);
        self.CacheTextWidth[Child] = W;
        Log("1");
    }
    // End:0x1d0
    else
    {
        W = self.CacheTextWidth[Child];
    }
    // End:0x1fa
    if(mx <= W)
    {
        return CaretBinarySearch(lCursor, pivotIndex, mx, Child);
    }
    Child += 1;
    return CaretBinarySearch(pivotIndex, rCursor, mx - W, Child);
}

function string ConvertIllegal(string inputstr)
{
    local int i, Max;
    local string retval, C;

    i = 0;
    Max = Len(inputstr);
    J0x14:
    // End:0xdf [While If]
    if(i < Max)
    {
        C = Mid(inputstr, i, 1);
        // End:0x5c
        if(Asc(C) == 13 || Asc(C) == 10)
        {
            C = "";
        }
        // End:0x84
        if(AllowedCharSet != "" && InStr(AllowedCharSet, C) < 0)
        {
            C = "";
        }
        // End:0xc3
        if(bConvertSpaces && C == " " || C == "?" || C == "\\")
        {
            C = "_";
        }
        retval = retval $ C;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    // End:0xf7
    if(MaxWidth > 0)
    {
        return Left(retval, MaxWidth);
    }
    return retval;
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    local float W;
    local string temp, st;
    local FloatBox fb;

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
    // End:0x29b
    if(key < 32)
    {
        // End:0x7b
        if(!Controller.CtrlPressed || key == 9)
        {
            return false;
        }
        // End:0x299
        if(bHudMode == false)
        {
            switch(key)
            {
                // End:0xb2
                case 3:
                    // End:0xaf
                    if(bSelectionMode)
                    {
                        PlayerOwner().CopyToClipboard(GetSelectionText());
                    }
                    // End:0x299
                    break;
                // End:0x25b
                case 22:
                    temp = TextStr $ PlayerOwner().PasteFromClipboard();
                    // End:0xe4
                    if(Len(temp) > MaxTextStrNum)
                    {
                        return false;
                    }
                    // End:0x191
                    if(bLimitDrawSize)
                    {
                        fb = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(saveC, temp, 0, float(FontSize[self.MenuState]), 0.0, 0.0, 1024.0, 768.0);
                        W = fb.X2 - fb.X1;
                        // End:0x18a
                        if(LimitDrawWidth * saveC.ClipX / 1024.0 < W)
                        {
                            LimitDrawTextSize = Len(TextStr);
                            return false;
                        }
                        // End:0x191
                        else
                        {
                            LimitDrawTextSize = 0;
                        }
                    }
                    // End:0x1a0
                    if(bSelectionMode)
                    {
                        RemoveSelectionText();
                    }
                    // End:0x200
                    if(TextStr == "" || CaretPos == Len(TextStr))
                    {
                        // End:0x1d0
                        if(bAllSelected)
                        {
                            TextStr = "";
                        }
                        TextStr = ConvertIllegal(TextStr $ PlayerOwner().PasteFromClipboard());
                        CaretPos = Len(TextStr);
                    }
                    // End:0x240
                    else
                    {
                        temp = ConvertIllegal(Left(TextStr, CaretPos) $ PlayerOwner().PasteFromClipboard() $ Mid(TextStr, CaretPos));
                        TextStr = temp;
                    }
                    Log(TextStr);
                    ResetSelectionPos(CaretPos);
                    TextChanged();
                    // End:0x299
                    break;
                // End:0x296
                case 24:
                    // End:0x293
                    if(bSelectionMode)
                    {
                        temp = GetSelectionText();
                        PlayerOwner().CopyToClipboard(temp);
                        RemoveSelectionText();
                        TextChanged();
                    }
                    // End:0x299
                    break;
                // End:0xffff
                default:
                }
                return true;
            }
            // End:0x2bb
            if(bAllSelected)
            {
                TextStr = "";
                CaretPos = 0;
                bAllSelected = false;
            }
            // End:0x2ca
            if(bSelectionMode)
            {
                RemoveSelectionText();
            }
            // End:0x57e
            if(AllowedCharSet == "" || bIncludeSign && st == "-" || st == "+" && TextStr == "" || InStr(AllowedCharSet, st) >= 0)
            {
                // End:0x57e
                if(MaxWidth == 0 || Len(TextStr) < MaxWidth)
                {
                    // End:0x37e
                    if(bConvertSpaces && st == " " || st == "?" || st == "\\")
                    {
                        st = "_";
                    }
                    // End:0x477
                    if(TextStr == "" || CaretPos == Len(TextStr))
                    {
                        temp = TextStr $ st;
                        // End:0x45c
                        if(bLimitDrawSize)
                        {
                            fb = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(saveC, temp, 0, float(FontSize[self.MenuState]), 0.0, 0.0, 1024.0, 768.0);
                            W = fb.X2 - fb.X1;
                            // End:0x455
                            if(LimitDrawWidth * saveC.ClipX / 1024.0 < W)
                            {
                                LimitDrawTextSize = Len(TextStr);
                                return false;
                            }
                            // End:0x45c
                            else
                            {
                                LimitDrawTextSize = 0;
                            }
                        }
                        TextStr = temp;
                        CaretPos = Len(TextStr);
                    }
                    // End:0x55d
                    else
                    {
                        temp = Left(TextStr, CaretPos) $ st $ Mid(TextStr, CaretPos);
                        // End:0x54b
                        if(bLimitDrawSize)
                        {
                            fb = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(saveC, temp, 0, float(FontSize[self.MenuState]), 0.0, 0.0, 1024.0, 768.0);
                            W = fb.X2 - fb.X1;
                            // End:0x544
                            if(LimitDrawWidth * saveC.ClipX / 1024.0 < W)
                            {
                                LimitDrawTextSize = Len(TextStr);
                                return false;
                            }
                            // End:0x54b
                            else
                            {
                                LimitDrawTextSize = 0;
                            }
                        }
                        TextStr = temp;
                        ++ CaretPos;
                    }
                    Log(TextStr @ st);
                    ResetSelectionPos(CaretPos);
                    TextChanged();
                    return true;
                }
            }
            ResetSelectionPos(CaretPos);
            TextChanged();
            return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(bReadOnly || State != 1)
    {
        return false;
    }
    // End:0x56
    if(key == 13)
    {
        BackupTextStr = TextStr;
        // End:0x51
        if(OnChat(self, self.TextStr))
        {
            Clear();
        }
        return true;
    }
    // End:0xa1
    else
    {
        // End:0x7e
        if(key == 9)
        {
            OnInputTab(self, self.TextStr);
            return true;
        }
        // End:0xa1
        else
        {
            // End:0xa1
            if(key == 32)
            {
                OnInputSpace(self, self.TextStr);
            }
        }
    }
    // End:0xdb
    if(key >= 112 && key <= 116)
    {
        OnFunctionKey(self, key, self.TextStr);
        return true;
    }
    // End:0x144
    if(key == 8)
    {
        // End:0x112
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();
        }
        // End:0x142
        else
        {
            // End:0x12a
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();
            }
            // End:0x142
            else
            {
                // End:0x142
                if(CaretPos > 0)
                {
                    -- CaretPos;
                    DeleteChar();
                }
            }
        }
        return true;
    }
    // End:0x3be
    if(bHudMode == false)
    {
        // End:0x1a7
        if(key == 46)
        {
            // End:0x187
            if(bAllSelected)
            {
                TextStr = "";
                CaretPos = 0;
                bAllSelected = false;
                TextChanged();
            }
            // End:0x1a5
            else
            {
                // End:0x19f
                if(bSelectionMode)
                {
                    RemoveSelectionText();
                    TextChanged();
                }
                // End:0x1a5
                else
                {
                    DeleteChar();
                }
            }
            return true;
        }
        // End:0x215
        if(key == 36 || key == 37 && Controller.CtrlPressed)
        {
            CaretPos = 0;
            bAllSelected = false;
            // End:0x208
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x213
            else
            {
                ResetSelectionPos(CaretPos);
            }
            return true;
        }
        // End:0x289
        if(key == 35 || key == 39 && Controller.CtrlPressed)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;
            // End:0x27c
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x287
            else
            {
                ResetSelectionPos(CaretPos);
            }
            return true;
        }
        // End:0x2f1
        if(key == 37)
        {
            // End:0x2b2
            if(bAllSelected)
            {
                CaretPos = 0;
                bAllSelected = false;
            }
            // End:0x2c4
            else
            {
                // End:0x2c4
                if(CaretPos > 0)
                {
                    -- CaretPos;
                }
            }
            // End:0x2e4
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x2ef
            else
            {
                ResetSelectionPos(CaretPos);
            }
            return true;
        }
        // End:0x365
        if(key == 39)
        {
            // End:0x320
            if(bAllSelected)
            {
                CaretPos = Len(TextStr);
                bAllSelected = false;
            }
            // End:0x338
            else
            {
                // End:0x338
                if(CaretPos < Len(TextStr))
                {
                    ++ CaretPos;
                }
            }
            // End:0x358
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x363
            else
            {
                ResetSelectionPos(CaretPos);
            }
            return true;
        }
        // End:0x392
        if(key == 38)
        {
            TextStr = BackupTextStr;
            CaretPos = Len(self.TextStr);
            return true;
        }
        // End:0x3be
        if(key == 65 && Controller.CtrlPressed)
        {
            bAllSelected = true;
            return true;
        }
    }
    return false;
}

function InternalActivate()
{
    bActiveCursor = true;
}

function InternalDeactivate()
{
    bActiveCursor = false;
    bMousePressed = false;
    bMouseFirstPress = false;
    IMEInputCancel();
}

defaultproperties
{
    FontSize[0]=10
    FontSize[1]=10
    FontSize[2]=10
    FontSize[3]=10
    FontSize[4]=10
    SelectionColor=(R=229,G=229,B=229,A=128)
    CursorColor=(R=229,G=229,B=229,A=255)
    StyleName="STY2WarfareHK_Empty"
    bCaptureMouse=true
    OnDraw=OwnerDraw
    OnActivate=InternalActivate
    OnDeActivate=InternalDeactivate
    OnMousePressed=OnMousePressed
    OnMouseRelease=OnMouseRelease
    OnChange=Internal_OnChange
    OnKeyType=InternalOnKeyType
    OnKeyEvent=InternalOnKeyEvent
}