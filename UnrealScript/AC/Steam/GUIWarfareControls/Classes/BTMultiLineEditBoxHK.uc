/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTMultiLineEditBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:25
 *	Functions:31
 *
 *******************************************************************************/
class BTMultiLineEditBoxHK extends GUIEditBox
    editinlinenew
    instanced;

struct SelectionArea
{
    var() int StartPos;
    var() int EndPos;
};

var bool bActiveCursor;
var Canvas saveC;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color CursorColor;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color SelectionColor;
var Image bgImg;
var Image cursorImg;
var Image selectionImg;
var int FontSize[5];
var Color FontColor[5];
var Color FontShadowColor[5];
var int CaretLinePos;
var array<int> sumLineTextCount;
var array<int> sumLineW;
var array<int> sumLineHT;
var array<string> textStrVis;
var array<int> bEndofNewLineCharacter;
var bool bUndo;
var int UndoCaretPos;
var string UndoTextStr;
var int VisibleLineCount;
var bool bSelectionMode;
var bool bMouseFirstPress;
var bool bMousePressed;
var SelectionArea SelArea;
var delegate<OnChat> __OnChat__Delegate;

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

function SetFontColor(byte _R, byte _G, byte _B, byte _A)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < 5)
    {
        FontColor[i].R = _R;
        FontColor[i].G = _G;
        FontColor[i].B = _B;
        FontColor[i].A = _A;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetSadowColor(byte _R, byte _G, byte _B, byte _A)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < 5)
    {
        FontShadowColor[i].R = _R;
        FontShadowColor[i].G = _G;
        FontShadowColor[i].B = _B;
        FontShadowColor[i].A = _A;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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

delegate OnChat(string Text);
function SaveUndo()
{
    bUndo = true;
    UndoCaretPos = CaretPos;
    UndoTextStr = TextStr;
}

function ProcessUndo(optional bool bForceBack)
{
    local int tempPos;
    local string TempStr;

    // End:0x11
    if(bForceBack)
    {
        bUndo = false;
    }
    tempPos = CaretPos;
    TempStr = TextStr;
    CaretPos = UndoCaretPos;
    TextStr = UndoTextStr;
    UndoCaretPos = tempPos;
    UndoTextStr = TempStr;
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
    super.SetText(Text);
    self.bAllSelected = false;
    self.bSelectionMode = false;
    self.SelArea.StartPos = 0;
    self.SelArea.EndPos = 0;
    self.TextChanged();
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
    CaretLinePos = 0;
    SetVisibleLineCount(5);
    SetDefaultFontColor();
    SetFontSizeAll(10);
}

function SetVisibleLineCount(int lc)
{
    VisibleLineCount = lc;
    sumLineTextCount.Length = lc;
    sumLineW.Length = lc;
    sumLineHT.Length = lc;
    textStrVis.Length = lc;
    bEndofNewLineCharacter.Length = lc;
}

function Clear()
{
    SelArea.StartPos = 0;
    SelArea.EndPos = 0;
    FirstVis = 0;
    bSelectionMode = false;
    bMouseFirstPress = false;
    bMousePressed = false;
    TextStr = "";
    TextChanged();
}

function int CaretPosToLinePos(int pos)
{
    local int LinePos, i;

    i = 0;
    J0x07:
    // End:0x85 [While If]
    if(i < VisibleLineCount)
    {
        // End:0x36
        if(sumLineTextCount[i] < pos)
        {
            LinePos = i;
        }
        // End:0x7b
        if(sumLineTextCount[i] + Len(textStrVis[i]) == pos && bEndofNewLineCharacter[i] == 1)
        {
            LinePos = i + 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LinePos;
}

function bool OwnerDraw(Canvas C)
{
    local int MousePos, i;
    local float X, X2, S, E, sl, el,
	    cursorW, HT;

    local string tempString;

    C.Style = 5;
    // End:0x1f
    if(bVisible == false)
    {
        return true;
    }
    // End:0x3b
    if(saveC == none)
    {
        saveC = C;
        CaculateVisibleText();
    }
    // End:0xa4
    if(bgImg.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, bgImg, RWinPos.X1 - float(6), RWinPos.Y1 - float(3), RWinPos.X2 + float(6), RWinPos.Y2 + float(3));
    }
    C.DrawColor = self.FontColor[self.MenuState];
    i = 0;
    J0xd1:
    // End:0x2bc [While If]
    if(i < self.VisibleLineCount)
    {
        // End:0x1e4
        if(self.bEndofNewLineCharacter[i] == 1)
        {
            tempString = self.Mid(textStrVis[i], 0, Len(textStrVis[i]) - 1);
            C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X, HT);
            class'BTCustomDrawHK'.static.DrawString(C, tempString, 0, float(self.FontSize[self.MenuState]), ClientBounds[0], ClientBounds[1] + HT * float(i), ClientBounds[2], ClientBounds[1] + HT * float(i + 1), FontShadowColor[self.MenuState], 0, false);
        }
        // End:0x2b2
        else
        {
            C.BtrTextSizeLH(textStrVis[i], self.FontSize[self.MenuState], X, HT);
            class'BTCustomDrawHK'.static.DrawString(C, self.textStrVis[i], 0, float(self.FontSize[self.MenuState]), ClientBounds[0], ClientBounds[1] + HT * float(i), ClientBounds[2], ClientBounds[1] + HT * float(i + 1), FontShadowColor[self.MenuState], 0, false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd1;
    }
    // End:0x4e4
    if(bActiveCursor && bReadOnly == false)
    {
        // End:0x33f
        if(bMouseFirstPress)
        {
            bMousePressed = true;
            bMouseFirstPress = false;
            MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
            CaretPos = MousePos + sumLineTextCount[CaretLinePos];
            ResetSelectionPos(CaretPos);
        }
        // End:0x39e
        if(bMousePressed)
        {
            MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
            CaretPos = MousePos + sumLineTextCount[CaretLinePos];
            InputSelectionPos(CaretPos);
        }
        // End:0x3af
        else
        {
            CaretLinePos = CaretPosToLinePos(CaretPos);
        }
        tempString = self.Mid(self.textStrVis[CaretLinePos], 0, self.CaretPos - sumLineTextCount[CaretLinePos]);
        // End:0x428
        if(tempString != "")
        {
            C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], cursorW, HT);
        }
        // End:0x466
        else
        {
            C.BtrTextSizeLH("|", self.FontSize[self.MenuState], cursorW, HT);
            cursorW = 0.0;
        }
        class'BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + cursorW, ClientBounds[1] + float(sumLineHT[CaretLinePos]), ClientBounds[0] + cursorW + float(3), ClientBounds[1] + float(sumLineHT[CaretLinePos]) + HT);
        DrawIMEInfo(C, cursorW);
    }
    // End:0x9e1
    if(bActiveCursor && bReadOnly == false)
    {
        // End:0x9e1
        if(bSelectionMode)
        {
            S = float(SelArea.StartPos);
            E = float(SelArea.EndPos);
            // End:0x558
            if(S > E)
            {
                HT = S;
                S = E;
                E = HT;
            }
            sl = float(CaretPosToLinePos(int(S)));
            el = float(CaretPosToLinePos(int(E)));
            // End:0x6da
            if(sl == el)
            {
                tempString = self.Mid(self.textStrVis[int(sl)], 0, int(S - float(sumLineTextCount[int(sl)])));
                C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X, HT);
                tempString = self.Mid(self.textStrVis[int(el)], 0, int(E - float(sumLineTextCount[int(el)])));
                C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X2, HT);
                class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[int(sl)]), ClientBounds[0] + X2, ClientBounds[1] + float(sumLineHT[int(sl)]) + HT);
            }
            // End:0x9e1
            else
            {
                tempString = self.Mid(self.textStrVis[int(sl)], 0, int(S - float(sumLineTextCount[int(sl)])));
                C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X, HT);
                tempString = self.Mid(self.textStrVis[int(sl)], 0, Len(self.textStrVis[int(sl)]));
                C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X2, HT);
                class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[int(sl)]), ClientBounds[0] + X2, ClientBounds[1] + float(sumLineHT[int(sl)]) + HT);
                i = int(sl + float(1));
                J0x82e:
                // End:0x90f [While If]
                if(float(i) < el)
                {
                    tempString = self.Mid(self.textStrVis[i], 0, Len(self.textStrVis[i]));
                    C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X, HT);
                    class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0], ClientBounds[1] + float(sumLineHT[i]), ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[i]) + HT);
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x82e;
                }
                tempString = self.Mid(self.textStrVis[int(el)], 0, int(E - float(sumLineTextCount[int(el)])));
                C.BtrTextSizeLH(tempString, self.FontSize[self.MenuState], X, HT);
                class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0], ClientBounds[1] + float(sumLineHT[int(el)]), ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[int(el)]) + HT);
            }
        }
    }
    return true;
}

function DrawIMEInfo(Canvas C, float CursorWidth)
{
    local string tempString;
    local float width, SelectWidth, Height, OffsetX;
    local int TextSize, SelectSize;
    local FloatBox fbDraw;

    // End:0x4ce
    if(IMEText != "")
    {
        TextSize = CaretPos - sumLineTextCount[CaretLinePos];
        // End:0x79
        if(CursorWidth <= float(0))
        {
            tempString = Mid(textStrVis[CaretLinePos], FirstVis, TextSize);
            C.BtrTextSizeOLD(tempString, FontSize[MenuState], CursorWidth, Height);
        }
        // End:0x151
        if(IMESelPosEnd == 0)
        {
            tempString = Mid(textStrVis[CaretLinePos], TextSize - IMECompSize, IMECompSize);
            C.BtrTextSizeOLD(tempString, FontSize[MenuState], width, Height);
            class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + CursorWidth - width, RWinPos.Y1 + float(sumLineHT[CaretLinePos]), RWinPos.X1 + CursorWidth, RWinPos.Y1 + float(sumLineHT[CaretLinePos]) + Height);
        }
        // End:0x2c7
        else
        {
            SelectSize = IMESelPosEnd - IMESelPosStart;
            tempString = Mid(textStrVis[CaretLinePos], TextSize - IMECompSize + IMESelPosStart, IMECompSize - IMESelPosStart);
            C.BtrTextSizeOLD(tempString, FontSize[MenuState], width, Height);
            tempString = Mid(textStrVis[CaretLinePos], TextSize - IMECompSize + IMESelPosStart + SelectSize, IMECompSize - IMESelPosStart - SelectSize);
            // End:0x23a
            if(tempString != "")
            {
                C.BtrTextSizeOLD(tempString, FontSize[MenuState], SelectWidth, Height);
            }
            // End:0x245
            else
            {
                SelectWidth = 0.0;
            }
            class'BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + CursorWidth - width, RWinPos.Y1 + float(sumLineHT[CaretLinePos]), RWinPos.X1 + CursorWidth - SelectWidth, RWinPos.Y1 + float(sumLineHT[CaretLinePos]) + Height);
        }
        C.BtrTextSizeOLD(IMEText, FontSize[MenuState], width, Height);
        width += float(5);
        Height += float(5);
        OffsetX = RWinPos.X1 + CursorWidth + width;
        // End:0x360
        if(float(C.SizeX) < OffsetX)
        {
            OffsetX = float(C.SizeX) - OffsetX;
        }
        // End:0x36b
        else
        {
            OffsetX = 0.0;
        }
        fbDraw.X1 = RWinPos.X1 + CursorWidth + OffsetX;
        fbDraw.X2 = RWinPos.X1 + CursorWidth + width + OffsetX;
        fbDraw.Y1 = RWinPos.Y1 + float(sumLineHT[CaretLinePos]) - Height;
        fbDraw.Y2 = RWinPos.Y1 + float(sumLineHT[CaretLinePos]);
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.panel_1_1, fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2);
        C.DrawColor = FontColor[MenuState];
        class'BTCustomDrawHK'.static.DrawString(C, IMEText, 4, float(FontSize[MenuState]), fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2, FontShadowColor[MenuState], 0, true);
    }
}

function CaculateVisibleText()
{
    local int i, vlc, pos;
    local float HT, scrollW;
    local string temp;
    local int lenStr;
    local bool bEnter;

    // End:0x0d
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    vlc = 0;
    pos = 0;
    i = 1;
    J0x34:
    // End:0x1eb [While If]
    if(i <= lenStr)
    {
        bEnter = false;
        temp = self.Mid(self.TextStr, i - 1, 1);
        // End:0x81
        if(Asc(temp) == 13)
        {
            bEnter = true;
        }
        temp = self.Mid(self.TextStr, pos, i - pos);
        saveC.BtrTextSizeLH(temp, FontSize[self.MenuState], scrollW, HT);
        // End:0x13c
        if(bEnter)
        {
            // End:0x12a
            if(vlc < self.VisibleLineCount - 1)
            {
                bEndofNewLineCharacter[vlc] = 1;
                textStrVis[++ vlc] = temp;
                pos = i;
                // This is an implied JumpToken;
                goto J0x1e1;
            }
            // End:0x139
            else
            {
                ProcessUndo(true);
                CaculateVisibleText();
                return;
            }
        }
        // End:0x1d0
        else
        {
            // End:0x1d0
            if(ClientBounds[2] - ClientBounds[0] < scrollW)
            {
                -- i;
                // End:0x1c1
                if(vlc < self.VisibleLineCount - 1)
                {
                    temp = self.Mid(self.TextStr, pos, i - pos);
                    textStrVis[++ vlc] = temp;
                    pos = i;
                    // This is an implied JumpToken;
                    goto J0x1e1;
                }
                // End:0x1d0
                else
                {
                    ProcessUndo(true);
                    CaculateVisibleText();
                    return;
                }
            }
        }
        textStrVis[vlc] = temp;
        J0x1e1:
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x34;
    }
    TextStr = self.Mid(TextStr, 0, i);
    self.UpdateLineInfo();
}

function OnChange(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7b [While If]
    if(i < VisibleLineCount)
    {
        self.textStrVis[i] = "";
        self.sumLineTextCount[i] = 0;
        self.sumLineW[i] = 0;
        self.sumLineHT[i] = 0;
        self.bEndofNewLineCharacter[i] = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    self.CaculateVisibleText();
    // End:0xa4
    if(Len(TextStr) <= CaretPos)
    {
        CaretPos = Len(TextStr);
    }
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

function UpdateLineInfo()
{
    local int i, TC;
    local float W, HT;

    i = 0;
    sumLineTextCount[i] = 0;
    sumLineW[i] = 0;
    sumLineHT[i] = 0;
    i = 1;
    J0x35:
    // End:0x112 [While If]
    if(i < VisibleLineCount)
    {
        saveC.BtrTextSizeLH(self.textStrVis[i - 1], self.FontSize[self.MenuState], W, HT);
        TC = Len(textStrVis[i - 1]);
        sumLineTextCount[i] = sumLineTextCount[i - 1] + TC;
        sumLineW[i] = int(float(sumLineW[i - 1]) + W);
        sumLineHT[i] = int(float(sumLineHT[i - 1]) + HT);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
}

function int MousePosToCaretPos(float mx, float my)
{
    local int i, lentextstrvis;
    local string rightone;
    local float W, HT;

    mx = mx - Bounds[0];
    my = my - Bounds[1];
    i = 0;
    J0x2f:
    // End:0x186 [While If]
    if(i < VisibleLineCount)
    {
        saveC.BtrTextSizeLH(self.textStrVis[i], self.FontSize[self.MenuState], W, HT);
        // End:0x17c
        if(my >= float(sumLineHT[i]) && my <= float(sumLineHT[i]) + HT)
        {
            lentextstrvis = Len(self.textStrVis[i]);
            CaretLinePos = i;
            // End:0x110
            if(mx >= float(0) && mx <= W)
            {
                return CaretBinarySearch(i, 0, lentextstrvis, mx);
            }
            // End:0x17c
            else
            {
                // End:0x132
                if(lentextstrvis > 0)
                {
                    rightone = Right(textStrVis[i], 1);
                }
                // End:0x13a
                else
                {
                    rightone = "";
                }
                // End:0x165
                if(Asc(rightone) == 13)
                {
                    return CaretBinarySearch(i, 0, lentextstrvis, W) - 1;
                }
                // End:0x17c
                else
                {
                    return CaretBinarySearch(i, 0, lentextstrvis, W);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    CaretLinePos = VisibleLineCount - 1;
    return CaretBinarySearch(VisibleLineCount - 1, 0, lentextstrvis, W);
}

function int CaretBinarySearch(int vlc, int lCursor, int rCursor, float mx)
{
    local int textLen, pivotIndex;
    local float W, HT;
    local string Text;

    textLen = rCursor - lCursor;
    // End:0x23
    if(textLen == 0)
    {
        return lCursor;
    }
    // End:0xae
    if(textLen == 1)
    {
        Text = self.Mid(self.textStrVis[vlc], lCursor, textLen);
        saveC.BtrTextSizeLH(Text, self.FontSize[self.MenuState], W, HT);
        // End:0xa8
        if(mx <= W / float(2))
        {
            return lCursor;
        }
        // End:0xae
        else
        {
            return rCursor;
        }
    }
    pivotIndex = int(float(textLen / 2) + float(textLen) % float(2) + float(lCursor));
    Text = self.Mid(self.textStrVis[vlc], lCursor, pivotIndex - lCursor);
    saveC.BtrTextSizeLH(Text, self.FontSize[self.MenuState], W, HT);
    // End:0x166
    if(mx <= W)
    {
        return CaretBinarySearch(vlc, lCursor, pivotIndex, mx);
    }
    return CaretBinarySearch(vlc, pivotIndex, rCursor, mx - W);
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
    // End:0x1fe
    if(key < 32)
    {
        // End:0x7b
        if(!Controller.CtrlPressed || key == 9)
        {
            return false;
        }
        switch(key)
        {
            // End:0xa6
            case 3:
                // End:0xa3
                if(bSelectionMode)
                {
                    PlayerOwner().CopyToClipboard(GetSelectionText());
                }
                // End:0x1fc
                break;
            // End:0x198
            case 22:
                // End:0xcf
                if(Len(PlayerOwner().PasteFromClipboard()) + Len(TextStr) >= MaxTextStrNum)
                {
                    return false;
                }
                SaveUndo();
                // End:0xe4
                if(bSelectionMode)
                {
                    RemoveSelectionText();
                }
                // End:0x144
                if(TextStr == "" || CaretPos == Len(TextStr))
                {
                    // End:0x114
                    if(bAllSelected)
                    {
                        TextStr = "";
                    }
                    TextStr = ConvertIllegal(TextStr $ PlayerOwner().PasteFromClipboard());
                    CaretPos = Len(TextStr);
                }
                // End:0x184
                else
                {
                    temp = ConvertIllegal(Left(TextStr, CaretPos) $ PlayerOwner().PasteFromClipboard() $ Mid(TextStr, CaretPos));
                    TextStr = temp;
                }
                ResetSelectionPos(CaretPos);
                TextChanged();
                // End:0x1fc
                break;
            // End:0x1d9
            case 24:
                // End:0x1d6
                if(bSelectionMode)
                {
                    SaveUndo();
                    temp = GetSelectionText();
                    PlayerOwner().CopyToClipboard(temp);
                    RemoveSelectionText();
                    TextChanged();
                }
                // End:0x1fc
                break;
            // End:0x1f9
            case 26:
                // End:0x1f6
                if(bUndo == true)
                {
                    ProcessUndo();
                    TextChanged();
                }
                // End:0x1fc
                break;
            // End:0xffff
            default:
                return true;
            }
    }
    // End:0x21e
    if(bAllSelected)
    {
        TextStr = "";
        CaretPos = 0;
        bAllSelected = false;
    }
    // End:0x233
    if(bSelectionMode)
    {
        RemoveSelectionText();
        CaculateVisibleText();
    }
    // End:0x37a
    if(AllowedCharSet == "" || bIncludeSign && st == "-" || st == "+" && TextStr == "" || InStr(AllowedCharSet, st) >= 0)
    {
        SaveUndo();
        // End:0x37a
        if(MaxWidth == 0 || Len(TextStr) < MaxWidth)
        {
            // End:0x2ed
            if(bConvertSpaces && st == " " || st == "?" || st == "\\")
            {
                st = "_";
            }
            // End:0x32e
            if(TextStr == "" || CaretPos == Len(TextStr))
            {
                TextStr = TextStr $ st;
                CaretPos = Len(TextStr);
            }
            // End:0x367
            else
            {
                temp = Left(TextStr, CaretPos) $ st $ Mid(TextStr, CaretPos);
                TextStr = temp;
                ++ CaretPos;
            }
            ResetSelectionPos(CaretPos);
            TextChanged();
            return true;
        }
    }
    ResetSelectionPos(CaretPos);
    TextChanged();
    return false;
}

function bool CheckKeyInputCondition(string st)
{
    // End:0x20
    if(Asc(st) == 8 || Asc(st) == 27)
    {
        return true;
    }
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string temp, rightone;
    local float W, HT;
    local int lentextstrvis;

    // End:0x1a
    if(bReadOnly || State != 1)
    {
        return false;
    }
    // End:0x3b
    if(key == 13)
    {
        SaveUndo();
        InternalOnKeyType(key);
        return true;
    }
    // End:0xa4
    if(key == 8)
    {
        // End:0x72
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();
        }
        // End:0xa2
        else
        {
            // End:0x8a
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();
            }
            // End:0xa2
            else
            {
                // End:0xa2
                if(CaretPos > 0)
                {
                    -- CaretPos;
                    DeleteChar();
                }
            }
        }
        return true;
    }
    // End:0x101
    if(key == 46)
    {
        SaveUndo();
        // End:0xe1
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();
        }
        // End:0xff
        else
        {
            // End:0xf9
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();
            }
            // End:0xff
            else
            {
                DeleteChar();
            }
        }
        return true;
    }
    // End:0x179
    if(key == 36 || key == 37 && Controller.CtrlPressed)
    {
        CaretPos = sumLineTextCount[CaretLinePos];
        bAllSelected = false;
        // End:0x16c
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);
        }
        // End:0x177
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x24b
    if(key == 35 || key == 39 && Controller.CtrlPressed)
    {
        lentextstrvis = Len(textStrVis[CaretLinePos]);
        CaretPos = sumLineTextCount[CaretLinePos] + lentextstrvis;
        // End:0x1f8
        if(lentextstrvis > 0)
        {
            rightone = Right(textStrVis[CaretLinePos], 1);
        }
        // End:0x200
        else
        {
            rightone = "";
        }
        // End:0x216
        if(Asc(rightone) == 13)
        {
            CaretPos -= 1;
        }
        bAllSelected = false;
        // End:0x23e
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);
        }
        // End:0x249
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x2b3
    if(key == 37)
    {
        // End:0x274
        if(bAllSelected)
        {
            CaretPos = 0;
            bAllSelected = false;
        }
        // End:0x286
        else
        {
            // End:0x286
            if(CaretPos > 0)
            {
                -- CaretPos;
            }
        }
        // End:0x2a6
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);
        }
        // End:0x2b1
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x327
    if(key == 39)
    {
        // End:0x2e2
        if(bAllSelected)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;
        }
        // End:0x2fa
        else
        {
            // End:0x2fa
            if(CaretPos < Len(TextStr))
            {
                ++ CaretPos;
            }
        }
        // End:0x31a
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);
        }
        // End:0x325
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x459
    if(key == 38)
    {
        // End:0x41a
        if(CaretLinePos > 0)
        {
            temp = self.Mid(self.textStrVis[CaretLinePos], 0, CaretPos - self.sumLineTextCount[CaretLinePos]);
            saveC.BtrTextSizeLH(temp, self.FontSize[self.MenuState], W, HT);
            -- CaretLinePos;
            CaretPos = CaretBinarySearch(CaretLinePos, 0, Len(self.textStrVis[CaretLinePos]), W) + self.sumLineTextCount[CaretLinePos];
            // End:0x40c
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x417
            else
            {
                ResetSelectionPos(CaretPos);
            }
        }
        // End:0x457
        else
        {
            // End:0x457
            if(CaretLinePos == 0)
            {
                CaretPos = 0;
                // End:0x44c
                if(Controller.ShiftPressed)
                {
                    InputSelectionPos(CaretPos);
                }
                // End:0x457
                else
                {
                    ResetSelectionPos(CaretPos);
                }
            }
        }
        return true;
    }
    // End:0x59f
    if(key == 40)
    {
        // End:0x553
        if(CaretLinePos < VisibleLineCount - 1)
        {
            temp = self.Mid(self.textStrVis[CaretLinePos], 0, CaretPos - self.sumLineTextCount[CaretLinePos]);
            saveC.BtrTextSizeLH(temp, self.FontSize[self.MenuState], W, HT);
            ++ CaretLinePos;
            CaretPos = CaretBinarySearch(CaretLinePos, 0, Len(self.textStrVis[CaretLinePos]), W) + self.sumLineTextCount[CaretLinePos];
            // End:0x545
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);
            }
            // End:0x550
            else
            {
                ResetSelectionPos(CaretPos);
            }
        }
        // End:0x59d
        else
        {
            // End:0x59d
            if(CaretLinePos == VisibleLineCount - 1)
            {
                CaretPos = Len(TextStr);
                // End:0x592
                if(Controller.ShiftPressed)
                {
                    InputSelectionPos(CaretPos);
                }
                // End:0x59d
                else
                {
                    ResetSelectionPos(CaretPos);
                }
            }
        }
        return true;
    }
    // End:0x5cb
    if(key == 65 && Controller.CtrlPressed)
    {
        bAllSelected = true;
        return true;
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
    CursorColor=(R=229,G=229,B=229,A=255)
    SelectionColor=(R=229,G=229,B=229,A=128)
    MaxTextStrNum=199
    bAlwaysNotify=true
    StyleName="STY2WarfareHK_Empty"
    bCaptureMouse=true
    OnDraw=OwnerDraw
    OnActivate=InternalActivate
    OnDeActivate=InternalDeactivate
    OnMousePressed=OnMousePressed
    OnMouseRelease=OnMouseRelease
    OnChange=OnChange
    OnKeyType=InternalOnKeyType
    OnKeyEvent=InternalOnKeyEvent
}