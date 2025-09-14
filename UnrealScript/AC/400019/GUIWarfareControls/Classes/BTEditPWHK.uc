class BTEditPWHK extends BTEditBoxHK
    editinlinenew
    instanced;

var float StarCharWidth;
var int LenSS;
var string StarString;

function bool OwnerDraw(Canvas C)
{
    local int i, MousePos;
    local float X, X2, S, E, W, HT;

    local string tempString;

    saveC = C;
    // End:0x19
    if(bVisible == false)
    {
        return true;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, bgImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0xEB
    if((self.FirstVis <= self.CaretPos) && self.CaretPos <= self.EndVis)
    {
        self.textStrVis = "";
        LenSS = self.EndVis - self.FirstVis;
        i = 0;
        J0xBE:

        // End:0xE8 [Loop If]
        if(i < LenSS)
        {
            self.textStrVis $= "*";
            i++;
            // [Loop Continue]
            goto J0xBE;
        }        
    }
    else
    {
        // End:0x138
        if(self.CaretPos < self.FirstVis)
        {
            self.FirstVis = self.CaretPos;
            self.CaculateVisibleText(true, self.FirstVis);
            ResetCache();            
        }
        else
        {
            // End:0x182
            if(self.CaretPos > self.EndVis)
            {
                self.EndVis = self.CaretPos;
                self.CaculateVisibleText(false, self.EndVis);
                ResetCache();
            }
        }
    }
    // End:0x1ED
    if(bMouseFirstPress)
    {
        bMousePressed = true;
        bMouseFirstPress = false;
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        ResetSelectionPos(CaretPos);
    }
    // End:0x277
    if(bMousePressed)
    {
        MousePos = MousePosToCaretPos(float(int(Controller.MouseX)), float(int(Controller.MouseY)));
        CaretPos = MousePos + self.FirstVis;
        InputSelectionPos(CaretPos);
        // End:0x277
        if(bClickAllSelect)
        {
            bSelectionMode = true;
            SelArea.StartPos = 0;
            SelArea.EndPos = Len(TextStr);
        }
    }
    // End:0x59C
    if(bActiveCursor && bReadOnly == false)
    {
        tempString = self.Mid(self.textStrVis, 0, self.CaretPos - self.FirstVis);
        // End:0x309
        if(tempString != "")
        {
            C.BtrTextSize(tempString, self.Style.FontSizes[int(self.MenuState)], W, HT);            
        }
        else
        {
            C.BtrTextSize("|", self.Style.FontSizes[int(self.MenuState)], W, HT);
            W = 0.0000000;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + W, ClientBounds[1], (ClientBounds[0] + W) + float(3), ClientBounds[1] + HT);
        // End:0x59C
        if(bSelectionMode)
        {
            S = float(SelArea.StartPos - self.FirstVis);
            E = float(SelArea.EndPos - self.FirstVis);
            // End:0x415
            if(S > E)
            {
                HT = S;
                S = E;
                E = HT;
            }
            // End:0x430
            if(S < float(0))
            {
                X = 0.0000000;                
            }
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(S));
                C.BtrTextSize(tempString, self.Style.FontSizes[int(self.MenuState)], X, HT);
            }
            // End:0x4F5
            if(E > float(self.EndVis - self.FirstVis))
            {
                C.BtrTextSize(self.textStrVis, self.Style.FontSizes[int(self.MenuState)], X2, HT);                
            }
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(E));
                C.BtrTextSize(tempString, self.Style.FontSizes[int(self.MenuState)], X2, HT);
            }
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + X, ClientBounds[1], ClientBounds[0] + X2, ClientBounds[1] + HT);
        }
    }
    C.DrawColor = FontColor[int(self.MenuState)];
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, self.textStrVis, 0, float(FontSize[int(self.MenuState)]), ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3], FontShadowColor[int(self.MenuState)]);
    return true;
    //return;    
}

function CaculateVisibleText(bool bHoldFirst, int pos)
{
    local int i;
    local float HT;
    local int lenStr;

    // End:0x0D
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    saveC.BtrTextSize("*", self.Style.FontSizes[int(self.MenuState)], StarCharWidth, HT);
    // End:0x122
    if(bHoldFirst)
    {
        i = lenStr;
        J0x6F:

        // End:0x11F [Loop If]
        if(i >= pos)
        {
            // End:0x115
            if((ClientBounds[2] - ClientBounds[0]) > (float(i - pos) * StarCharWidth))
            {
                self.EndVis = i;
                self.textStrVis = "";
                LenSS = self.EndVis - self.FirstVis;
                i = 0;
                J0xE9:

                // End:0x113 [Loop If]
                if(i < LenSS)
                {
                    self.textStrVis $= "*";
                    i++;
                    // [Loop Continue]
                    goto J0xE9;
                }
                return;
            }
            i--;
            // [Loop Continue]
            goto J0x6F;
        }        
    }
    else
    {
        i = 0;
        J0x129:

        // End:0x1D9 [Loop If]
        if(i <= pos)
        {
            // End:0x1CF
            if((ClientBounds[2] - ClientBounds[0]) > (float(pos - i) * StarCharWidth))
            {
                self.FirstVis = i;
                self.textStrVis = "";
                LenSS = self.EndVis - self.FirstVis;
                i = 0;
                J0x1A3:

                // End:0x1CD [Loop If]
                if(i < LenSS)
                {
                    self.textStrVis $= "*";
                    i++;
                    // [Loop Continue]
                    goto J0x1A3;
                }
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x129;
        }
    }
    //return;    
}
