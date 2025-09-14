/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTEditPWHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
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
    class'BTCustomDrawHK'.static.DrawImage(C, bgImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0xeb
    if(self.FirstVis <= self.CaretPos && self.CaretPos <= self.EndVis)
    {
        self.textStrVis = "";
        LenSS = self.EndVis - self.FirstVis;
        i = 0;
        J0xbe:
        // End:0xe8 [While If]
        if(i < LenSS)
        {
            self.textStrVis $= "*";
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xbe;
        }
    }
    // End:0x182
    else
    {
        // End:0x138
        if(self.CaretPos < self.FirstVis)
        {
            self.FirstVis = self.CaretPos;
            self.CaculateVisibleText(true, self.FirstVis);
            ResetCache();
        }
        // End:0x182
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
    // End:0x1ed
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
    // End:0x59c
    if(bActiveCursor && bReadOnly == false)
    {
        tempString = self.Mid(self.textStrVis, 0, self.CaretPos - self.FirstVis);
        // End:0x309
        if(tempString != "")
        {
            C.BtrTextSize(tempString, self.Style.FontSizes[self.MenuState], W, HT);
        }
        // End:0x350
        else
        {
            C.BtrTextSize("|", self.Style.FontSizes[self.MenuState], W, HT);
            W = 0.0;
        }
        class'BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + W, ClientBounds[1], ClientBounds[0] + W + float(3), ClientBounds[1] + HT);
        // End:0x59c
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
                X = 0.0;
            }
            // End:0x48d
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(S));
                C.BtrTextSize(tempString, self.Style.FontSizes[self.MenuState], X, HT);
            }
            // End:0x4f5
            if(E > float(self.EndVis - self.FirstVis))
            {
                C.BtrTextSize(self.textStrVis, self.Style.FontSizes[self.MenuState], X2, HT);
            }
            // End:0x552
            else
            {
                tempString = self.Mid(self.textStrVis, 0, int(E));
                C.BtrTextSize(tempString, self.Style.FontSizes[self.MenuState], X2, HT);
            }
            class'BTCustomDrawHK'.static.DrawImage(C, cursorImg, ClientBounds[0] + X, ClientBounds[1], ClientBounds[0] + X2, ClientBounds[1] + HT);
        }
    }
    C.DrawColor = FontColor[self.MenuState];
    class'BTCustomDrawHK'.static.DrawString(C, self.textStrVis, 0, float(FontSize[self.MenuState]), ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3], FontShadowColor[self.MenuState]);
    return true;
}

function CaculateVisibleText(bool bHoldFirst, int pos)
{
    local int i;
    local float HT;
    local int lenStr;

    // End:0x0d
    if(saveC == none)
    {
        return;
    }
    lenStr = Len(self.TextStr);
    saveC.BtrTextSize("*", self.Style.FontSizes[self.MenuState], StarCharWidth, HT);
    // End:0x122
    if(bHoldFirst)
    {
        i = lenStr;
        J0x6f:
        // End:0x11f [While If]
        if(i >= pos)
        {
            // End:0x115
            if(ClientBounds[2] - ClientBounds[0] > float(i - pos) * StarCharWidth)
            {
                self.EndVis = i;
                self.textStrVis = "";
                LenSS = self.EndVis - self.FirstVis;
                i = 0;
                J0xe9:
                // End:0x113 [While If]
                if(i < LenSS)
                {
                    self.textStrVis $= "*";
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xe9;
                }
                return;
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x6f;
        }
    }
    // End:0x1d9
    else
    {
        i = 0;
        J0x129:
        // End:0x1d9 [While If]
        if(i <= pos)
        {
            // End:0x1cf
            if(ClientBounds[2] - ClientBounds[0] > float(pos - i) * StarCharWidth)
            {
                self.FirstVis = i;
                self.textStrVis = "";
                LenSS = self.EndVis - self.FirstVis;
                i = 0;
                J0x1a3:
                // End:0x1cd [While If]
                if(i < LenSS)
                {
                    self.textStrVis $= "*";
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x1a3;
                }
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x129;
        }
    }
}
