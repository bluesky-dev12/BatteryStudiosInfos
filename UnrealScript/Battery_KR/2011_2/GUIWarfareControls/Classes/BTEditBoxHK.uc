class BTEditBoxHK extends GUIEditBox
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
var int FontSize[5];
var Color FontColor[5];
var Color FontShadowColor[5];
var Image bgImg;
var int ButtonID;
var bool bActiveCursor;
var Canvas saveC;
var() automated Color SelectionColor;
var() automated Color CursorColor;
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
//var delegate<OnChat> __OnChat__Delegate;
//var delegate<OnInputTab> __OnInputTab__Delegate;
//var delegate<OnInputSpace> __OnInputSpace__Delegate;
//var delegate<OnFunctionKey> __OnFunctionKey__Delegate;

delegate bool OnChat(GUIComponent Sender, string Text)
{
    return false;
    //return;    
}

delegate OnInputTab(GUIComponent Sender, string Text)
{
    //return;    
}

delegate OnInputSpace(GUIComponent Sender, string Text)
{
    //return;    
}

delegate bool OnFunctionKey(GUIComponent Sender, byte FunctionKey, string Text)
{
    //return;    
}

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
    SetTextSelect(Text, false);
    //return;    
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
    else
    {
        bClickAllSelect = true;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    cursorImg.Image = Controller.DefaultPens[0];
    cursorImg.Width = 8.0000000;
    cursorImg.Height = 8.0000000;
    cursorImg.DrawType = 15;
    cursorImg.DrawColor = CursorColor;
    selectionImg.Image = Controller.DefaultPens[0];
    selectionImg.Width = 8.0000000;
    selectionImg.Height = 8.0000000;
    selectionImg.DrawType = 15;
    selectionImg.DrawColor = SelectionColor;
    SelArea.StartPos = 0;
    SelArea.EndPos = 0;
    FirstVis = 0;
    EndVis = 0;
    SetDefaultFontColor();
    SetFontSizeAll(10);
    //return;    
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
    //return;    
}

function bool OwnerDraw(Canvas C)
{
    local int MousePos;
    local float X, X2, S, E, W, HT;

    local string tempString;

    saveC = C;
    C.Style = 5;
    // End:0x2A
    if(bVisible == false)
    {
        return true;
    }
    // End:0x8F
    if(bHudMode == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, bgImg, RWinPos.X1 - float(6), RWinPos.Y1 - float(3), RWinPos.X2 + float(6), RWinPos.Y2 + float(3));
    }
    // End:0x102
    if((self.FirstVis <= self.CaretPos) && self.CaretPos <= self.EndVis)
    {
        self.textStrVis = self.Mid(self.TextStr, self.FirstVis, self.EndVis - self.FirstVis);        
    }
    else
    {
        // End:0x14F
        if(self.CaretPos < self.FirstVis)
        {
            self.FirstVis = self.CaretPos;
            self.CaculateVisibleText(true, self.FirstVis);
            ResetCache();            
        }
        else
        {
            // End:0x199
            if(self.CaretPos > self.EndVis)
            {
                self.EndVis = self.CaretPos;
                self.CaculateVisibleText(false, self.EndVis);
                ResetCache();
            }
        }
    }
    // End:0x204
    if(bMouseFirstPress)
    {
        bMousePressed = true;
        bMouseFirstPress = false;
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        ResetSelectionPos(CaretPos);
    }
    // End:0x28E
    if(bMousePressed)
    {
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        InputSelectionPos(CaretPos);
        // End:0x28E
        if(bClickAllSelect)
        {
            bSelectionMode = true;
            SelArea.StartPos = 0;
            SelArea.EndPos = Len(TextStr);
        }
    }
    // End:0x330
    if(bHudMode == false)
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, self.textStrVis, 0, float(FontSize[int(self.MenuState)]), RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2, self.FontShadowColor[int(self.MenuState)], 0, true);
    }
    // End:0x63F
    if(bActiveCursor && bReadOnly == false)
    {
        tempString = self.Mid(self.textStrVis, 0, self.CaretPos - self.FirstVis);
        // End:0x3B4
        if(tempString != "")
        {
            C.BtrTextSizeOLD(tempString, FontSize[int(self.MenuState)], W, HT);            
        }
        else
        {
            C.BtrTextSizeOLD("|", FontSize[int(self.MenuState)], W, HT);
            W = 0.0000000;
        }
        // End:0x455
        if(bHudMode == false)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, cursorImg, RWinPos.X1 + W, RWinPos.Y1, (RWinPos.X1 + W) + float(3), RWinPos.Y1 + HT);
        }
        // End:0x63F
        if(bSelectionMode)
        {
            S = float(SelArea.StartPos - self.FirstVis);
            E = float(SelArea.EndPos - self.FirstVis);
            // End:0x4CA
            if(S > E)
            {
                HT = S;
                S = E;
                E = HT;
            }
            // End:0x4E5
            if(S < float(0))
            {
                X = 0.0000000;                
            }
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(S));
                C.BtrTextSizeOLD(tempString, FontSize[int(self.MenuState)], X, HT);
            }
            // End:0x58E
            if(E > float(self.EndVis - self.FirstVis))
            {
                C.BtrTextSizeOLD(self.textStrVis, FontSize[int(self.MenuState)], X2, HT);                
            }
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(E));
                C.BtrTextSizeOLD(tempString, FontSize[int(self.MenuState)], X2, HT);
            }
            // End:0x63F
            if(bHudMode == false)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, selectionImg, RWinPos.X1 + X, RWinPos.Y1, RWinPos.X1 + X2, RWinPos.Y1 + HT);
            }
        }
    }
    return true;
    //return;    
}

function CaculateVisibleText(bool bHoldFirst, int pos)
{
    local int i;
    local float HT, scrollW;
    local string Temp;
    local int lenStr;

    // End:0x0D
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    // End:0xE9
    if(bHoldFirst)
    {
        i = lenStr;
        J0x33:

        // End:0xE6 [Loop If]
        if(i >= pos)
        {
            Temp = self.Mid(self.TextStr, pos, i - pos);
            saveC.BtrTextSizeOLD(Temp, FontSize[int(self.MenuState)], scrollW, HT);
            // End:0xDC
            if((AWinPos.X2 - AWinPos.X1) > scrollW)
            {
                self.EndVis = i;
                self.textStrVis = Temp;
                return;
            }
            i--;
            // [Loop Continue]
            goto J0x33;
        }        
    }
    else
    {
        i = 0;
        J0xF0:

        // End:0x1A4 [Loop If]
        if(i <= pos)
        {
            Temp = self.Mid(self.TextStr, i, pos - i);
            saveC.BtrTextSizeOLD(Temp, FontSize[int(self.MenuState)], scrollW, HT);
            // End:0x19A
            if((AWinPos.X2 - AWinPos.X1) > scrollW)
            {
                self.FirstVis = i;
                CaculateVisibleText(true, self.FirstVis);
                return;
            }
            i++;
            // [Loop Continue]
            goto J0xF0;
        }
    }
    //return;    
}

function ResetCache()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < CacheTextWidth.Length)
    {
        self.CacheTextWidth[i] = 0.0000000;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Internal_OnChange(GUIComponent Sender)
{
    ResetCache();
    self.CaculateVisibleText(true, self.FirstVis);
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
    // End:0x2A
    if((bMouseFirstPress == false) && bMousePressed == false)
    {
        bMouseFirstPress = true;
        bMousePressed = false;
    }
    //return;    
}

function int MousePosToCaretPos(float mx, float my)
{
    local float W, HT;

    mx = mx - AWinPos.X1;
    my = my - AWinPos.Y1;
    // End:0x3B
    if(saveC == none)
    {
        return 0;
    }
    // End:0xA1
    if(self.CacheTextWidth[0] == float(0))
    {
        saveC.BtrTextSizeOLD(self.textStrVis, FontSize[int(self.MenuState)], W, HT);
        self.CacheTextWidth[0] = W;
        CacheTextHeight = HT;
    }
    // End:0xD8
    if((mx >= self.CacheTextWidth[0]) || my >= CacheTextHeight)
    {
        return Len(self.textStrVis);        
    }
    else
    {
        // End:0xE7
        if(mx <= float(0))
        {
            return 0;
        }
    }
    return CaretBinarySearch(0, Len(self.textStrVis), mx, 0);
    //return;    
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
    // End:0xEF
    if(textLen == 1)
    {
        // End:0xB5
        if(self.CacheTextWidth[Parent] == float(0))
        {
            Text = self.Mid(self.textStrVis, lCursor, textLen);
            saveC.BtrTextSizeOLD(Text, FontSize[int(self.MenuState)], W, HT);
            self.CacheTextWidth[Parent] = W;
            Log("1");            
        }
        else
        {
            W = self.CacheTextWidth[Parent];
        }
        // End:0xE9
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
    Child = (Parent * 2) + 1;
    // End:0x1BA
    if(self.CacheTextWidth[Child] == float(0))
    {
        Text = self.Mid(self.textStrVis, lCursor, pivotIndex - lCursor);
        saveC.BtrTextSizeOLD(Text, FontSize[int(self.MenuState)], W, HT);
        self.CacheTextWidth[Child] = W;
        Log("1");        
    }
    else
    {
        W = self.CacheTextWidth[Child];
    }
    // End:0x1FA
    if(mx <= W)
    {
        return CaretBinarySearch(lCursor, pivotIndex, mx, Child);
    }
    Child += 1;
    return CaretBinarySearch(pivotIndex, rCursor, mx - W, Child);
    //return;    
}

function string ConvertIllegal(string inputstr)
{
    local int i, Max;
    local string retval, C;

    i = 0;
    Max = Len(inputstr);
    J0x14:

    // End:0xDF [Loop If]
    if(i < Max)
    {
        C = Mid(inputstr, i, 1);
        // End:0x5C
        if((Asc(C) == 13) || Asc(C) == 10)
        {
            C = "";
        }
        // End:0x84
        if((AllowedCharSet != "") && InStr(AllowedCharSet, C) < 0)
        {
            C = "";
        }
        // End:0xC3
        if(bConvertSpaces && ((C == " ") || C == "?") || C == "\\")
        {
            C = "_";
        }
        retval = retval $ C;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0xF7
    if(MaxWidth > 0)
    {
        return Left(retval, MaxWidth);
    }
    return retval;
    //return;    
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    local float W;
    local string Temp, st;
    local FloatBox fb;

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
    // End:0x284
    if(int(key) < 32)
    {
        // End:0x7B
        if(!Controller.CtrlPressed || int(key) == 9)
        {
            return false;
        }
        // End:0x282
        if(bHudMode == false)
        {
            switch(key)
            {
                // End:0xB2
                case 3:
                    // End:0xAF
                    if(bSelectionMode)
                    {
                        PlayerOwner().CopyToClipboard(GetSelectionText());
                    }
                    // End:0x282
                    break;
                // End:0x244
                case 22:
                    Temp = TextStr $ PlayerOwner().PasteFromClipboard();
                    // End:0xE4
                    if(Len(Temp) > MaxTextStrNum)
                    {
                        return false;
                    }
                    // End:0x17A
                    if(bLimitDrawSize)
                    {
                        fb = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(saveC, Temp, 0, float(FontSize[int(self.MenuState)]), 0.0000000, 0.0000000, 1024.0000000, 768.0000000);
                        W = fb.X2 - fb.X1;
                        // End:0x17A
                        if((LimitDrawWidth * (saveC.ClipX / 1024.0000000)) < W)
                        {
                            return false;
                        }
                    }
                    // End:0x189
                    if(bSelectionMode)
                    {
                        RemoveSelectionText();
                    }
                    // End:0x1E9
                    if((TextStr == "") || CaretPos == Len(TextStr))
                    {
                        // End:0x1B9
                        if(bAllSelected)
                        {
                            TextStr = "";
                        }
                        TextStr = ConvertIllegal(TextStr $ PlayerOwner().PasteFromClipboard());
                        CaretPos = Len(TextStr);                        
                    }
                    else
                    {
                        Temp = ConvertIllegal((Left(TextStr, CaretPos) $ PlayerOwner().PasteFromClipboard()) $ Mid(TextStr, CaretPos));
                        TextStr = Temp;
                    }
                    Log(TextStr);
                    ResetSelectionPos(CaretPos);
                    TextChanged();
                    // End:0x282
                    break;
                // End:0x27F
                case 24:
                    // End:0x27C
                    if(bSelectionMode)
                    {
                        Temp = GetSelectionText();
                        PlayerOwner().CopyToClipboard(Temp);
                        RemoveSelectionText();
                        TextChanged();
                    }
                    // End:0x282
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            return true;
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x282! */
        // End:0x2A4
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
        }
        // End:0x2B3
        if(bSelectionMode)
        {
            RemoveSelectionText();
        }
        // End:0x539
        if(((AllowedCharSet == "") || (bIncludeSign && (st == "-") || st == "+") && TextStr == "") || InStr(AllowedCharSet, st) >= 0)
        {
            // End:0x539
            if((MaxWidth == 0) || Len(TextStr) < MaxWidth)
            {
                // End:0x367
                if(bConvertSpaces && ((st == " ") || st == "?") || st == "\\")
                {
                    st = "_";
                }
                // End:0x449
                if((TextStr == "") || CaretPos == Len(TextStr))
                {
                    Temp = TextStr $ st;
                    // End:0x42E
                    if(bLimitDrawSize)
                    {
                        fb = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(saveC, Temp, 0, float(FontSize[int(self.MenuState)]), 0.0000000, 0.0000000, 1024.0000000, 768.0000000);
                        W = fb.X2 - fb.X1;
                        // End:0x42E
                        if((LimitDrawWidth * (saveC.ClipX / 1024.0000000)) < W)
                        {
                            return false;
                        }
                    }
                    TextStr = Temp;
                    CaretPos = Len(TextStr);                    
                }
                else
                {
                    Temp = (Left(TextStr, CaretPos) $ st) $ Mid(TextStr, CaretPos);
                    // End:0x506
                    if(bLimitDrawSize)
                    {
                        fb = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(saveC, Temp, 0, float(FontSize[int(self.MenuState)]), 0.0000000, 0.0000000, 1024.0000000, 768.0000000);
                        W = fb.X2 - fb.X1;
                        // End:0x506
                        if((LimitDrawWidth * (saveC.ClipX / 1024.0000000)) < W)
                        {
                            return false;
                        }
                    }
                    TextStr = Temp;
                    CaretPos++;
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
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x047! */
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1A
    if(bReadOnly || int(State) != 1)
    {
        return false;
    }
    // End:0x56
    if(int(key) == 13)
    {
        BackupTextStr = TextStr;
        // End:0x51
        if(OnChat(self, self.TextStr))
        {
            Clear();
        }
        return true;        
    }
    else
    {
        // End:0x7E
        if(int(key) == 9)
        {
            OnInputTab(self, self.TextStr);
            return true;            
        }
        else
        {
            // End:0xA1
            if(int(key) == 32)
            {
                OnInputSpace(self, self.TextStr);
            }
        }
    }
    // End:0xDB
    if((int(key) >= 112) && int(key) <= 116)
    {
        OnFunctionKey(self, key, self.TextStr);
        return true;
    }
    // End:0x144
    if(int(key) == 8)
    {
        // End:0x112
        if(bAllSelected)
        {
            TextStr = "";
            CaretPos = 0;
            bAllSelected = false;
            TextChanged();            
        }
        else
        {
            // End:0x12A
            if(bSelectionMode)
            {
                RemoveSelectionText();
                TextChanged();                
            }
            else
            {
                // End:0x142
                if(CaretPos > 0)
                {
                    CaretPos--;
                    DeleteChar();
                }
            }
        }
        return true;
    }
    // End:0x3BE
    if(bHudMode == false)
    {
        // End:0x1A7
        if(int(key) == 46)
        {
            // End:0x187
            if(bAllSelected)
            {
                TextStr = "";
                CaretPos = 0;
                bAllSelected = false;
                TextChanged();                
            }
            else
            {
                // End:0x19F
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
        // End:0x215
        if((int(key) == 36) || (int(key) == 37) && Controller.CtrlPressed)
        {
            CaretPos = 0;
            bAllSelected = false;
            // End:0x208
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
        // End:0x289
        if((int(key) == 35) || (int(key) == 39) && Controller.CtrlPressed)
        {
            CaretPos = Len(TextStr);
            bAllSelected = false;
            // End:0x27C
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
        // End:0x2F1
        if(int(key) == 37)
        {
            // End:0x2B2
            if(bAllSelected)
            {
                CaretPos = 0;
                bAllSelected = false;                
            }
            else
            {
                // End:0x2C4
                if(CaretPos > 0)
                {
                    CaretPos--;
                }
            }
            // End:0x2E4
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
        // End:0x365
        if(int(key) == 39)
        {
            // End:0x320
            if(bAllSelected)
            {
                CaretPos = Len(TextStr);
                bAllSelected = false;                
            }
            else
            {
                // End:0x338
                if(CaretPos < Len(TextStr))
                {
                    CaretPos++;
                }
            }
            // End:0x358
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
        // End:0x392
        if(int(key) == 38)
        {
            TextStr = BackupTextStr;
            CaretPos = Len(self.TextStr);
            return true;
        }
        // End:0x3BE
        if((int(key) == 65) && Controller.CtrlPressed)
        {
            bAllSelected = true;
            return true;
        }
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
    //return;    
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
    OnDraw=BTEditBoxHK.OwnerDraw
    OnActivate=BTEditBoxHK.InternalActivate
    OnDeActivate=BTEditBoxHK.InternalDeactivate
    OnMousePressed=BTEditBoxHK.OnMousePressed
    OnMouseRelease=BTEditBoxHK.OnMouseRelease
    OnChange=BTEditBoxHK.Internal_OnChange
    OnKeyType=BTEditBoxHK.InternalOnKeyType
    OnKeyEvent=BTEditBoxHK.InternalOnKeyEvent
}