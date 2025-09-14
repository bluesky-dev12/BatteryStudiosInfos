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
var() automated Color CursorColor;
var() automated Color SelectionColor;
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
//var delegate<OnChat> __OnChat__Delegate;

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xBF [Loop If]
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
        i++;
        // [Loop Continue]
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
    //return;    
}

function SetFontColor(byte _R, byte _G, byte _B, byte _A)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < 5)
    {
        FontColor[i].R = _R;
        FontColor[i].G = _G;
        FontColor[i].B = _B;
        FontColor[i].A = _A;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetSadowColor(byte _R, byte _G, byte _B, byte _A)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < 5)
    {
        FontShadowColor[i].R = _R;
        FontShadowColor[i].G = _G;
        FontShadowColor[i].B = _B;
        FontShadowColor[i].A = _A;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2E [Loop If]
    if(i < 5)
    {
        FontSize[i] = Size;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

delegate OnChat(string Text)
{
    //return;    
}

function SaveUndo()
{
    bUndo = true;
    UndoCaretPos = CaretPos;
    UndoTextStr = TextStr;
    //return;    
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
    //return;    
}

function RemoveSelectionText()
{
    // End:0x6F
    if(SelArea.StartPos <= SelArea.EndPos)
    {
        self.TextStr = self.Left(self.TextStr, SelArea.StartPos) $ self.Mid(self.TextStr, SelArea.EndPos);
        CaretPos = SelArea.StartPos;        
    }
    else
    {
        self.TextStr = self.Left(self.TextStr, SelArea.EndPos) $ self.Mid(self.TextStr, SelArea.StartPos);
        CaretPos = SelArea.EndPos;
    }
    ResetSelectionPos(CaretPos);
    //return;    
}

function string GetSelectionText()
{
    // End:0x4E
    if(SelArea.StartPos < SelArea.EndPos)
    {
        return self.Mid(self.TextStr, SelArea.StartPos, SelArea.EndPos - SelArea.StartPos);        
    }
    else
    {
        return self.Mid(self.TextStr, SelArea.EndPos, SelArea.StartPos - SelArea.EndPos);
    }
    //return;    
}

function ResetSelectionPos(int pos)
{
    SelArea.StartPos = pos;
    SelArea.EndPos = pos;
    bSelectionMode = false;
    //return;    
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
    else
    {
        bSelectionMode = false;
    }
    //return;    
}

function SetText(string Text)
{
    super.SetText(Text);
    self.bAllSelected = false;
    self.bSelectionMode = false;
    self.SelArea.StartPos = 0;
    self.SelArea.EndPos = 0;
    self.TextChanged();
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    cursorImg.Image = Controller.DefaultPens[0];
    cursorImg.width = 8.0000000;
    cursorImg.Height = 8.0000000;
    cursorImg.DrawType = 15;
    cursorImg.DrawColor = CursorColor;
    selectionImg.Image = Controller.DefaultPens[0];
    selectionImg.width = 8.0000000;
    selectionImg.Height = 8.0000000;
    selectionImg.DrawType = 15;
    selectionImg.DrawColor = SelectionColor;
    SelArea.StartPos = 0;
    SelArea.EndPos = 0;
    FirstVis = 0;
    CaretLinePos = 0;
    SetVisibleLineCount(5);
    SetDefaultFontColor();
    SetFontSizeAll(10);
    //return;    
}

function SetVisibleLineCount(int lc)
{
    VisibleLineCount = lc;
    sumLineTextCount.Length = lc;
    sumLineW.Length = lc;
    sumLineHT.Length = lc;
    textStrVis.Length = lc;
    bEndofNewLineCharacter.Length = lc;
    //return;    
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
    //return;    
}

function int CaretPosToLinePos(int pos)
{
    local int LinePos, i;

    i = 0;
    J0x07:

    // End:0x85 [Loop If]
    if(i < VisibleLineCount)
    {
        // End:0x36
        if(sumLineTextCount[i] < pos)
        {
            LinePos = i;
        }
        // End:0x7B
        if(((sumLineTextCount[i] + Len(textStrVis[i])) == pos) && bEndofNewLineCharacter[i] == 1)
        {
            LinePos = i + 1;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return LinePos;
    //return;    
}

function bool OwnerDraw(Canvas C)
{
    local int MousePos, i;
    local float X, X2, S, E, sl, el,
	    cursorW, HT;

    local string tempString;

    C.Style = 5;
    // End:0x1F
    if(bVisible == false)
    {
        return true;
    }
    // End:0x3B
    if(saveC == none)
    {
        saveC = C;
        CaculateVisibleText();
    }
    // End:0xA4
    if(bgImg.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, bgImg, RWinPos.X1 - float(6), RWinPos.Y1 - float(3), RWinPos.X2 + float(6), RWinPos.Y2 + float(3));
    }
    C.DrawColor = self.FontColor[int(self.MenuState)];
    i = 0;
    J0xD1:

    // End:0x2BC [Loop If]
    if(i < self.VisibleLineCount)
    {
        // End:0x1E4
        if(self.bEndofNewLineCharacter[i] == 1)
        {
            tempString = self.Mid(textStrVis[i], 0, Len(textStrVis[i]) - 1);
            C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X, HT);
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, tempString, 0, float(self.FontSize[int(self.MenuState)]), ClientBounds[0], ClientBounds[1] + (HT * float(i)), ClientBounds[2], ClientBounds[1] + (HT * float(i + 1)), FontShadowColor[int(self.MenuState)], 0, false);
            // [Explicit Continue]
            goto J0x2B2;
        }
        C.BtrTextSizeLH(textStrVis[i], self.FontSize[int(self.MenuState)], X, HT);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, self.textStrVis[i], 0, float(self.FontSize[int(self.MenuState)]), ClientBounds[0], ClientBounds[1] + (HT * float(i)), ClientBounds[2], ClientBounds[1] + (HT * float(i + 1)), FontShadowColor[int(self.MenuState)], 0, false);
        J0x2B2:

        i++;
        // [Loop Continue]
        goto J0xD1;
    }
    // End:0x4E4
    if(bActiveCursor && bReadOnly == false)
    {
        // End:0x33F
        if(bMouseFirstPress)
        {
            bMousePressed = true;
            bMouseFirstPress = false;
            MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
            CaretPos = MousePos + sumLineTextCount[CaretLinePos];
            ResetSelectionPos(CaretPos);
        }
        // End:0x39E
        if(bMousePressed)
        {
            MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
            CaretPos = MousePos + sumLineTextCount[CaretLinePos];
            InputSelectionPos(CaretPos);            
        }
        else
        {
            CaretLinePos = CaretPosToLinePos(CaretPos);
        }
        tempString = self.Mid(self.textStrVis[CaretLinePos], 0, self.CaretPos - sumLineTextCount[CaretLinePos]);
        // End:0x428
        if(tempString != "")
        {
            C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], cursorW, HT);            
        }
        else
        {
            C.BtrTextSizeLH("|", self.FontSize[int(self.MenuState)], cursorW, HT);
            cursorW = 0.0000000;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + cursorW, ClientBounds[1] + float(sumLineHT[CaretLinePos]), (ClientBounds[0] + cursorW) + float(3), (ClientBounds[1] + float(sumLineHT[CaretLinePos])) + HT);
        DrawIMEInfo(C, cursorW);
    }
    // End:0x9E1
    if(bActiveCursor && bReadOnly == false)
    {
        // End:0x9E1
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
            // End:0x6DA
            if(sl == el)
            {
                tempString = self.Mid(self.textStrVis[int(sl)], 0, int(S - float(sumLineTextCount[int(sl)])));
                C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X, HT);
                tempString = self.Mid(self.textStrVis[int(el)], 0, int(E - float(sumLineTextCount[int(el)])));
                C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X2, HT);
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[int(sl)]), ClientBounds[0] + X2, (ClientBounds[1] + float(sumLineHT[int(sl)])) + HT);                
            }
            else
            {
                tempString = self.Mid(self.textStrVis[int(sl)], 0, int(S - float(sumLineTextCount[int(sl)])));
                C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X, HT);
                tempString = self.Mid(self.textStrVis[int(sl)], 0, Len(self.textStrVis[int(sl)]));
                C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X2, HT);
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0] + X, ClientBounds[1] + float(sumLineHT[int(sl)]), ClientBounds[0] + X2, (ClientBounds[1] + float(sumLineHT[int(sl)])) + HT);
                i = int(sl + float(1));
                J0x82E:

                // End:0x90F [Loop If]
                if(float(i) < el)
                {
                    tempString = self.Mid(self.textStrVis[i], 0, Len(self.textStrVis[i]));
                    C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X, HT);
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0], ClientBounds[1] + float(sumLineHT[i]), ClientBounds[0] + X, (ClientBounds[1] + float(sumLineHT[i])) + HT);
                    i++;
                    // [Loop Continue]
                    goto J0x82E;
                }
                tempString = self.Mid(self.textStrVis[int(el)], 0, int(E - float(sumLineTextCount[int(el)])));
                C.BtrTextSizeLH(tempString, self.FontSize[int(self.MenuState)], X, HT);
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, ClientBounds[0], ClientBounds[1] + float(sumLineHT[int(el)]), ClientBounds[0] + X, (ClientBounds[1] + float(sumLineHT[int(el)])) + HT);
            }
        }
    }
    return true;
    //return;    
}

function DrawIMEInfo(Canvas C, float CursorWidth)
{
    local string tempString;
    local float width, SelectWidth, Height, OffsetX;
    local int TextSize, SelectSize;
    local FloatBox fbDraw;

    // End:0x4CE
    if(IMEText != "")
    {
        TextSize = CaretPos - sumLineTextCount[CaretLinePos];
        // End:0x79
        if(CursorWidth <= float(0))
        {
            tempString = Mid(textStrVis[CaretLinePos], FirstVis, TextSize);
            C.BtrTextSizeOLD(tempString, FontSize[int(MenuState)], CursorWidth, Height);
        }
        // End:0x151
        if(IMESelPosEnd == 0)
        {
            tempString = Mid(textStrVis[CaretLinePos], TextSize - IMECompSize, IMECompSize);
            C.BtrTextSizeOLD(tempString, FontSize[int(MenuState)], width, Height);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, (RWinPos.X1 + CursorWidth) - width, RWinPos.Y1 + float(sumLineHT[CaretLinePos]), RWinPos.X1 + CursorWidth, (RWinPos.Y1 + float(sumLineHT[CaretLinePos])) + Height);            
        }
        else
        {
            SelectSize = IMESelPosEnd - IMESelPosStart;
            tempString = Mid(textStrVis[CaretLinePos], (TextSize - IMECompSize) + IMESelPosStart, IMECompSize - IMESelPosStart);
            C.BtrTextSizeOLD(tempString, FontSize[int(MenuState)], width, Height);
            tempString = Mid(textStrVis[CaretLinePos], ((TextSize - IMECompSize) + IMESelPosStart) + SelectSize, (IMECompSize - IMESelPosStart) - SelectSize);
            // End:0x23A
            if(tempString != "")
            {
                C.BtrTextSizeOLD(tempString, FontSize[int(MenuState)], SelectWidth, Height);                
            }
            else
            {
                SelectWidth = 0.0000000;
            }
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, (RWinPos.X1 + CursorWidth) - width, RWinPos.Y1 + float(sumLineHT[CaretLinePos]), (RWinPos.X1 + CursorWidth) - SelectWidth, (RWinPos.Y1 + float(sumLineHT[CaretLinePos])) + Height);
        }
        C.BtrTextSizeOLD(IMEText, FontSize[int(MenuState)], width, Height);
        width += float(5);
        Height += float(5);
        OffsetX = (RWinPos.X1 + CursorWidth) + width;
        // End:0x360
        if(float(C.SizeX) < OffsetX)
        {
            OffsetX = float(C.SizeX) - OffsetX;            
        }
        else
        {
            OffsetX = 0.0000000;
        }
        fbDraw.X1 = (RWinPos.X1 + CursorWidth) + OffsetX;
        fbDraw.X2 = ((RWinPos.X1 + CursorWidth) + width) + OffsetX;
        fbDraw.Y1 = (RWinPos.Y1 + float(sumLineHT[CaretLinePos])) - Height;
        fbDraw.Y2 = RWinPos.Y1 + float(sumLineHT[CaretLinePos]);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1_1, fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2);
        C.DrawColor = FontColor[int(MenuState)];
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, IMEText, 4, float(FontSize[int(MenuState)]), fbDraw.X1, fbDraw.Y1, fbDraw.X2, fbDraw.Y2, FontShadowColor[int(MenuState)], 0, true);
    }
    //return;    
}

function CaculateVisibleText()
{
    local int i, vlc, pos;
    local float HT, scrollW;
    local string temp;
    local int lenStr;
    local bool bEnter;

    // End:0x0D
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    vlc = 0;
    pos = 0;
    i = 1;
    J0x34:

    // End:0x1D3 [Loop If]
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
        saveC.BtrTextSizeLH(temp, FontSize[int(self.MenuState)], scrollW, HT);
        // End:0x130
        if(bEnter)
        {
            // End:0x12A
            if(vlc < (self.VisibleLineCount - 1))
            {
                bEndofNewLineCharacter[vlc] = 1;
                textStrVis[vlc++] = temp;
                pos = i;
                // [Explicit Continue]
                goto J0x1C9;                
            }
            else
            {
                // [Explicit Break]
                goto J0x1D3;
            }            
        }
        else
        {
            // End:0x1B8
            if((ClientBounds[2] - ClientBounds[0]) < scrollW)
            {
                i--;
                // End:0x1B5
                if(vlc < (self.VisibleLineCount - 1))
                {
                    temp = self.Mid(self.TextStr, pos, i - pos);
                    textStrVis[vlc++] = temp;
                    pos = i;
                    // [Explicit Continue]
                    goto J0x1C9;                    
                }
                else
                {
                    // [Explicit Break]
                    goto J0x1D3;
                }
            }
        }
        textStrVis[vlc] = temp;
        J0x1C9:

        i++;
        // [Loop Continue]
        goto J0x34;
    }
    J0x1D3:

    TextStr = self.Mid(TextStr, 0, i);
    self.UpdateLineInfo();
    //return;    
}

function OnChange(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(i < VisibleLineCount)
    {
        self.textStrVis[i] = "";
        self.sumLineTextCount[i] = 0;
        self.sumLineW[i] = 0;
        self.sumLineHT[i] = 0;
        self.bEndofNewLineCharacter[i] = 0;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    self.CaculateVisibleText();
    // End:0xA4
    if(Len(TextStr) <= CaretPos)
    {
        CaretPos = Len(TextStr);
    }
    //return;    
}

function OnMouseRelease(GUIComponent Sender)
{
    bMousePressed = false;
    bMouseFirstPress = false;
    //return;    
}

function OnMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x30
    if((bMouseFirstPress == false) && bMousePressed == false)
    {
        bMouseFirstPress = true;
        bMousePressed = false;
        IMEInputCancel();
    }
    //return;    
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

    // End:0x112 [Loop If]
    if(i < VisibleLineCount)
    {
        saveC.BtrTextSizeLH(self.textStrVis[i - 1], self.FontSize[int(self.MenuState)], W, HT);
        TC = Len(textStrVis[i - 1]);
        sumLineTextCount[i] = sumLineTextCount[i - 1] + TC;
        sumLineW[i] = int(float(sumLineW[i - 1]) + W);
        sumLineHT[i] = int(float(sumLineHT[i - 1]) + HT);
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    //return;    
}

function int MousePosToCaretPos(float mx, float my)
{
    local int i, lentextstrvis;
    local string rightone;
    local float W, HT;

    mx = mx - Bounds[0];
    my = my - Bounds[1];
    i = 0;
    J0x2F:

    // End:0x186 [Loop If]
    if(i < VisibleLineCount)
    {
        saveC.BtrTextSizeLH(self.textStrVis[i], self.FontSize[int(self.MenuState)], W, HT);
        // End:0x17C
        if((my >= float(sumLineHT[i])) && my <= (float(sumLineHT[i]) + HT))
        {
            lentextstrvis = Len(self.textStrVis[i]);
            CaretLinePos = i;
            // End:0x110
            if((mx >= float(0)) && mx <= W)
            {
                return CaretBinarySearch(i, 0, lentextstrvis, mx);
                // [Explicit Continue]
                goto J0x17C;
            }
            // End:0x132
            if(lentextstrvis > 0)
            {
                rightone = Right(textStrVis[i], 1);                
            }
            else
            {
                rightone = "";
            }
            // End:0x165
            if(Asc(rightone) == 13)
            {
                return (CaretBinarySearch(i, 0, lentextstrvis, W)) - 1;
                // [Explicit Continue]
                goto J0x17C;
            }
            return CaretBinarySearch(i, 0, lentextstrvis, W);
        }
        J0x17C:

        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    CaretLinePos = VisibleLineCount - 1;
    return CaretBinarySearch(VisibleLineCount - 1, 0, lentextstrvis, W);
    //return;    
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
    // End:0xAE
    if(textLen == 1)
    {
        Text = self.Mid(self.textStrVis[vlc], lCursor, textLen);
        saveC.BtrTextSizeLH(Text, self.FontSize[int(self.MenuState)], W, HT);
        // End:0xA8
        if(mx <= (W / float(2)))
        {
            return lCursor;            
        }
        else
        {
            return rCursor;
        }
    }
    pivotIndex = int((float(textLen / 2) + (float(textLen) % float(2))) + float(lCursor));
    Text = self.Mid(self.textStrVis[vlc], lCursor, pivotIndex - lCursor);
    saveC.BtrTextSizeLH(Text, self.FontSize[int(self.MenuState)], W, HT);
    // End:0x166
    if(mx <= W)
    {
        return CaretBinarySearch(vlc, lCursor, pivotIndex, mx);
    }
    return CaretBinarySearch(vlc, pivotIndex, rCursor, mx - W);
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
    // End:0x1FC
    if((int(key) < 32) && Controller.CtrlPressed)
    {
        // End:0x79
        if(int(key) == 9)
        {
            return false;
        }
        switch(key)
        {
            // End:0xA4
            case 3:
                // End:0xA1
                if(bSelectionMode)
                {
                    PlayerOwner().CopyToClipboard(GetSelectionText());
                }
                // End:0x1FA
                break;
            // End:0x196
            case 22:
                // End:0xCD
                if((Len(PlayerOwner().PasteFromClipboard()) + Len(TextStr)) >= MaxTextStrNum)
                {
                    return false;
                }
                SaveUndo();
                // End:0xE2
                if(bSelectionMode)
                {
                    RemoveSelectionText();
                }
                // End:0x142
                if((TextStr == "") || CaretPos == Len(TextStr))
                {
                    // End:0x112
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
                ResetSelectionPos(CaretPos);
                TextChanged();
                // End:0x1FA
                break;
            // End:0x1D7
            case 24:
                // End:0x1D4
                if(bSelectionMode)
                {
                    SaveUndo();
                    temp = GetSelectionText();
                    PlayerOwner().CopyToClipboard(temp);
                    RemoveSelectionText();
                    TextChanged();
                }
                // End:0x1FA
                break;
            // End:0x1F7
            case 26:
                // End:0x1F4
                if(bUndo == true)
                {
                    ProcessUndo();
                    TextChanged();
                }
                // End:0x1FA
                break;
            // End:0xFFFF
            default:
                break;
        }
        return true;
    }
    // End:0x21C
    if(bAllSelected)
    {
        TextStr = "";
        CaretPos = 0;
        bAllSelected = false;
    }
    // End:0x231
    if(bSelectionMode)
    {
        RemoveSelectionText();
        CaculateVisibleText();
    }
    // End:0x38B
    if(((AllowedCharSet == "") || (bIncludeSign && (st == "-") || st == "+") && TextStr == "") || InStr(AllowedCharSet, st) >= 0)
    {
        // End:0x29B
        if((CheckKeyInputCondition(st)) == true)
        {
            return false;
        }
        SaveUndo();
        // End:0x38B
        if((MaxWidth == 0) || Len(TextStr) < MaxWidth)
        {
            // End:0x2FE
            if(bConvertSpaces && ((st == " ") || st == "?") || st == "\\")
            {
                st = "_";
            }
            // End:0x33F
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
            ResetSelectionPos(CaretPos);
            TextChanged();
            return true;
        }
    }
    ResetSelectionPos(CaretPos);
    TextChanged();
    return false;
    //return;    
}

function bool CheckKeyInputCondition(string st)
{
    // End:0x20
    if((Asc(st) == 8) || Asc(st) == 27)
    {
        return true;
    }
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string temp, rightone;
    local float W, HT;
    local int lentextstrvis;

    // End:0x1A
    if(bReadOnly || int(State) != 1)
    {
        return false;
    }
    // End:0x3B
    if(int(key) == 13)
    {
        SaveUndo();
        InternalOnKeyType(key);
        return true;
    }
    // End:0xA4
    if(int(key) == 8)
    {
        // End:0x72
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();            
        }
        else
        {
            // End:0x8A
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();                
            }
            else
            {
                // End:0xA2
                if(CaretPos > 0)
                {
                    CaretPos--;
                    DeleteChar();
                }
            }
        }
        return true;
    }
    // End:0x101
    if(int(key) == 46)
    {
        SaveUndo();
        // End:0xE1
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();            
        }
        else
        {
            // End:0xF9
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();                
            }
            else
            {
                DeleteChar();
            }
        }
        return true;
    }
    // End:0x179
    if((int(key) == 36) || (int(key) == 37) && Controller.CtrlPressed)
    {
        CaretPos = sumLineTextCount[CaretLinePos];
        bAllSelected = false;
        // End:0x16C
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);            
        }
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x24B
    if((int(key) == 35) || (int(key) == 39) && Controller.CtrlPressed)
    {
        lentextstrvis = Len(textStrVis[CaretLinePos]);
        CaretPos = sumLineTextCount[CaretLinePos] + lentextstrvis;
        // End:0x1F8
        if(lentextstrvis > 0)
        {
            rightone = Right(textStrVis[CaretLinePos], 1);            
        }
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
        // End:0x23E
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);            
        }
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x2B3
    if(int(key) == 37)
    {
        // End:0x274
        if(bAllSelected)
        {
            CaretPos = 0;
            bAllSelected = false;            
        }
        else
        {
            // End:0x286
            if(CaretPos > 0)
            {
                CaretPos--;
            }
        }
        // End:0x2A6
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);            
        }
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x327
    if(int(key) == 39)
    {
        // End:0x2E2
        if(bAllSelected)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;            
        }
        else
        {
            // End:0x2FA
            if(CaretPos < Len(TextStr))
            {
                CaretPos++;
            }
        }
        // End:0x31A
        if(Controller.ShiftPressed)
        {
            InputSelectionPos(CaretPos);            
        }
        else
        {
            ResetSelectionPos(CaretPos);
        }
        return true;
    }
    // End:0x459
    if(int(key) == 38)
    {
        // End:0x41A
        if(CaretLinePos > 0)
        {
            temp = self.Mid(self.textStrVis[CaretLinePos], 0, CaretPos - self.sumLineTextCount[CaretLinePos]);
            saveC.BtrTextSizeLH(temp, self.FontSize[int(self.MenuState)], W, HT);
            CaretLinePos--;
            CaretPos = (CaretBinarySearch(CaretLinePos, 0, Len(self.textStrVis[CaretLinePos]), W)) + self.sumLineTextCount[CaretLinePos];
            // End:0x40C
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);                
            }
            else
            {
                ResetSelectionPos(CaretPos);
            }            
        }
        else
        {
            // End:0x457
            if(CaretLinePos == 0)
            {
                CaretPos = 0;
                // End:0x44C
                if(Controller.ShiftPressed)
                {
                    InputSelectionPos(CaretPos);                    
                }
                else
                {
                    ResetSelectionPos(CaretPos);
                }
            }
        }
        return true;
    }
    // End:0x59F
    if(int(key) == 40)
    {
        // End:0x553
        if(CaretLinePos < (VisibleLineCount - 1))
        {
            temp = self.Mid(self.textStrVis[CaretLinePos], 0, CaretPos - self.sumLineTextCount[CaretLinePos]);
            saveC.BtrTextSizeLH(temp, self.FontSize[int(self.MenuState)], W, HT);
            CaretLinePos++;
            CaretPos = (CaretBinarySearch(CaretLinePos, 0, Len(self.textStrVis[CaretLinePos]), W)) + self.sumLineTextCount[CaretLinePos];
            // End:0x545
            if(Controller.ShiftPressed)
            {
                InputSelectionPos(CaretPos);                
            }
            else
            {
                ResetSelectionPos(CaretPos);
            }            
        }
        else
        {
            // End:0x59D
            if(CaretLinePos == (VisibleLineCount - 1))
            {
                CaretPos = Len(TextStr);
                // End:0x592
                if(Controller.ShiftPressed)
                {
                    InputSelectionPos(CaretPos);                    
                }
                else
                {
                    ResetSelectionPos(CaretPos);
                }
            }
        }
        return true;
    }
    // End:0x5CB
    if((int(key) == 65) && Controller.CtrlPressed)
    {
        bAllSelected = true;
        return true;
    }
    return false;
    //return;    
}

function InternalActivate()
{
    bActiveCursor = true;
    //return;    
}

function InternalDeactivate()
{
    bActiveCursor = false;
    bMousePressed = false;
    bMouseFirstPress = false;
    IMEInputCancel();
    //return;    
}

defaultproperties
{
    CursorColor=(R=229,G=229,B=229,A=255)
    SelectionColor=(R=229,G=229,B=229,A=128)
    MaxTextStrNum=199
    bAlwaysNotify=true
    StyleName="STY2WarfareHK_Empty"
    bCaptureMouse=true
    OnDraw=BTMultiLineEditBoxHK.OwnerDraw
    OnActivate=BTMultiLineEditBoxHK.InternalActivate
    OnDeActivate=BTMultiLineEditBoxHK.InternalDeactivate
    OnMousePressed=BTMultiLineEditBoxHK.OnMousePressed
    OnMouseRelease=BTMultiLineEditBoxHK.OnMouseRelease
    OnChange=BTMultiLineEditBoxHK.OnChange
    OnKeyType=BTMultiLineEditBoxHK.InternalOnKeyType
    OnKeyEvent=BTMultiLineEditBoxHK.InternalOnKeyEvent
}