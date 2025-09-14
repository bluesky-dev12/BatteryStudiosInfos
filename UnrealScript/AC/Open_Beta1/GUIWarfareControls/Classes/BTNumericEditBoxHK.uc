class BTNumericEditBoxHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var int MinValue;
var int MaxValue;
var bool bReadOnly;
var string FormatStr;
var string OriginalStr;
var() automated Color CursorColor;
var Image cursorImg;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    cursorImg.Image = Controller.DefaultPens[0];
    cursorImg.width = 8.0000000;
    cursorImg.Height = 8.0000000;
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
    //return;    
}

function Clear()
{
    OriginalStr = "";
    Caption = "";
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int SelectMenuState;
    local string DrawStr;
    local FloatBox cursorPos;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    SelectMenuState = int(self.MenuState);
    // End:0x9A
    if((bActiveCursor == false) && int(MenuState) == int(2))
    {
        SelectMenuState = 0;        
    }
    else
    {
        // End:0xB5
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    C.DrawColor = FontColor[SelectMenuState];
    DrawStr = Caption;
    // End:0x139
    if(DrawStr == "")
    {
        DrawStr = "|";        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, DrawStr, CaptionDrawType, float(FontSize[SelectMenuState]), RWinPos.X1 + float(CaptionPadding[0]), RWinPos.Y1 + float(CaptionPadding[1]), (RWinPos.X2 - float(CaptionPadding[2])) - float(3), RWinPos.Y2 - float(CaptionPadding[3]), FontShadowColor[SelectMenuState]);
    }
    // End:0x2CA
    if((bReadOnly == false) && bActiveCursor)
    {
        C.DrawColor = CursorColor;
        cursorPos = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, DrawStr, CaptionDrawType, float(FontSize[SelectMenuState]), RWinPos.X1 + float(CaptionPadding[0]), RWinPos.Y1 + float(CaptionPadding[1]), (RWinPos.X2 - float(CaptionPadding[2])) - float(3), RWinPos.Y2 - float(CaptionPadding[3]));
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, cursorImg, cursorPos.X2, cursorPos.Y1, cursorPos.X2 + float(3), cursorPos.Y2);
    }
    //return;    
}

function SetData(int Number)
{
    OriginalStr = string(Number);
    Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(OriginalStr);
    //return;    
}

function SetDataExtra(int Number, string Extra)
{
    OriginalStr = string(Number);
    Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(OriginalStr) @ Extra;
    //return;    
}

function bool Internal_OnKeyEvent(out byte key, out byte State, float Delta)
{
    local int srcLen, temp, sum;
    local string BackupStr;

    // End:0x0B
    if(bReadOnly)
    {
        return true;
    }
    // End:0x1A
    if(int(State) != 1)
    {
        return false;
    }
    BackupStr = OriginalStr;
    // End:0x3F
    if(int(key) == 13)
    {
        FocusFirst(none);
        return true;        
    }
    else
    {
        // End:0xB6
        if((int(key) == int(38)) || int(key) == int(236))
        {
            sum = int(OriginalStr) + 50;
            // End:0x8C
            if(sum < MinValue)
            {
                sum = MinValue;
            }
            // End:0xA6
            if(sum > MaxValue)
            {
                sum = MaxValue;
            }
            OriginalStr = string(sum);            
        }
        else
        {
            // End:0x12D
            if((int(key) == int(40)) || int(key) == int(237))
            {
                sum = int(OriginalStr) - 50;
                // End:0x103
                if(sum < MinValue)
                {
                    sum = MinValue;
                }
                // End:0x11D
                if(sum > MaxValue)
                {
                    sum = MaxValue;
                }
                OriginalStr = string(sum);                
            }
            else
            {
                // End:0x181
                if(int(key) == 8)
                {
                    srcLen = Len(OriginalStr);
                    // End:0x16B
                    if(srcLen > 1)
                    {
                        OriginalStr = Left(OriginalStr, srcLen - 1);                        
                    }
                    else
                    {
                        // End:0x17E
                        if(srcLen == 1)
                        {
                            OriginalStr = "";
                        }
                    }                    
                }
                else
                {
                    // End:0x208
                    if(int(key) == int(48))
                    {
                        srcLen = Len(OriginalStr);
                        // End:0x1FC
                        if(srcLen >= 1)
                        {
                            temp = Asc(Left(OriginalStr, 1));
                            // End:0x1F9
                            if((int(byte(temp)) > int(48)) && int(byte(temp)) <= int(57))
                            {
                                OriginalStr = OriginalStr $ string(int(key) - 48);
                            }                            
                        }
                        else
                        {
                            OriginalStr = "0";
                        }                        
                    }
                    else
                    {
                        // End:0x296
                        if((int(key) > int(48)) && int(key) <= int(57))
                        {
                            srcLen = Len(OriginalStr);
                            temp = Asc(OriginalStr);
                            // End:0x279
                            if((srcLen == 1) && int(byte(temp)) == int(48))
                            {
                                OriginalStr = string(int(key) - 48);                                
                            }
                            else
                            {
                                OriginalStr = OriginalStr $ string(int(key) - 48);
                            }                            
                        }
                        else
                        {
                            // End:0x31D
                            if(int(key) == int(96))
                            {
                                srcLen = Len(OriginalStr);
                                // End:0x311
                                if(srcLen >= 1)
                                {
                                    temp = Asc(Left(OriginalStr, 1));
                                    // End:0x30E
                                    if((int(byte(temp)) > int(48)) && int(byte(temp)) <= int(57))
                                    {
                                        OriginalStr = OriginalStr $ string(int(key) - 96);
                                    }                                    
                                }
                                else
                                {
                                    OriginalStr = "0";
                                }                                
                            }
                            else
                            {
                                // End:0x3A8
                                if((int(key) > int(96)) && int(key) <= int(105))
                                {
                                    srcLen = Len(OriginalStr);
                                    temp = Asc(OriginalStr);
                                    // End:0x38E
                                    if((srcLen == 1) && int(byte(temp)) == int(48))
                                    {
                                        OriginalStr = string(int(key) - 96);                                        
                                    }
                                    else
                                    {
                                        OriginalStr = OriginalStr $ string(int(key) - 96);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x3C4
    if(int(OriginalStr) > MaxValue)
    {
        OriginalStr = BackupStr;
    }
    Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(OriginalStr);
    return true;
    //return;    
}

defaultproperties
{
    MaxValue=99999999
    CursorColor=(R=229,G=229,B=229,A=255)
    StyleName="STY2WarfareHK_Empty"
    bCaptureMouse=true
    OnRendered=BTNumericEditBoxHK.Internal_OnRendered
    OnActivate=BTNumericEditBoxHK.InternalActivate
    OnDeActivate=BTNumericEditBoxHK.InternalDeactivate
    OnKeyEvent=BTNumericEditBoxHK.Internal_OnKeyEvent
}