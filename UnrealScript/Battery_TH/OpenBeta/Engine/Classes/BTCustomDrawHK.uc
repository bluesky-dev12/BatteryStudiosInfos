class BTCustomDrawHK extends Object;

enum DrawType
{
    E_DT_ORDER_LT,                  // 0
    E_DT_ORDER_CT,                  // 1
    E_DT_ORDER_RT,                  // 2
    E_DT_ORDER_LC,                  // 3
    E_DT_ORDER_CC,                  // 4
    E_DT_ORDER_RC,                  // 5
    E_DT_ORDER_LB,                  // 6
    E_DT_ORDER_CB,                  // 7
    E_DT_ORDER_RB,                  // 8
    E_DT_STRETCHED_WIDTH_ORDER_T,   // 9
    E_DT_STRETCHED_WIDTH_ORDER_C,   // 10
    E_DT_STRETCHED_WIDTH_ORDER_B,   // 11
    E_DT_STRETCHED_HEIGHT_ORDER_R,  // 12
    E_DT_STRETCHED_HEIGHT_ORDER_C,  // 13
    E_DT_STRETCHED_HEIGHT_ORDER_L,  // 14
    E_DT_STRETCHED_ALL,             // 15
    E_DT_SCALE_WIDTH_ORDER_T,       // 16
    E_DT_SCALE_WIDTH_ORDER_C,       // 17
    E_DT_SCALE_WIDTH_ORDER_B,       // 18
    E_DT_SCALE_HEIGHT_ORDER_R,      // 19
    E_DT_SCALE_HEIGHT_ORDER_C,      // 20
    E_DT_SCALE_HEIGHT_ORDER_L,      // 21
    E_DT_SCALE_WIDTH_RATIO_T,       // 22
    E_DT_SCALE_WIDTH_RATIO_C,       // 23
    E_DT_SCALE_WIDTH_RATIO_B,       // 24
    E_DT_SCALE_HEIGHT_RATIO_L,      // 25
    E_DT_SCALE_HEIGHT_RATIO_C,      // 26
    E_DT_SCALE_HEIGHT_RATIO_R,      // 27
    E_DT_SCALE_ALL,                 // 28
    E_DT_SCALE_CLIP_ALL             // 29
};

enum TextArrayDrawType
{
    E_TADT_ORDER_CENTER,            // 0
    E_TADT_ORDER_TOP,               // 1
    E_TADT_ORDER_BOTTOM             // 2
};

struct Text
{
    var() string Text;
    var() int FontSize;
    var() BTCustomDrawHK.DrawType FontDrawType;
    var() Color DrawColor;
    var() Color DrawShadowColor;
};

struct Image
{
    var() float X;
    var() float Y;
    var() float Width;
    var() float Height;
    var() Material Image;
    var() BTCustomDrawHK.DrawType DrawType;
    var() Color DrawColor;
    var() Color DrawShadowColor;
};

static function Text MakeText(int fntSize, BTCustomDrawHK.DrawType fntDrawType, string txt)
{
    return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeTextColor(fntSize, fntDrawType, txt, Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)), Class'Engine_Decompressed.Canvas'.static.MakeColor(0, 0, 0, 100));
    //return;    
}

static function Text MakeTextColor(int fntSize, BTCustomDrawHK.DrawType fntDrawType, string txt, Color frontColor, Color BackShadowColor)
{
    local Text Temp;

    Temp.FontSize = fntSize;
    Temp.FontDrawType = fntDrawType;
    Temp.DrawColor = frontColor;
    Temp.DrawShadowColor = BackShadowColor;
    Temp.Text = txt;
    return Temp;
    //return;    
}

static function Image MakeImage(int Width, int Height, BTCustomDrawHK.DrawType dt, Material img)
{
    return MakeImageColor(Width, Height, dt, img, Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)), Class'Engine_Decompressed.Canvas'.static.MakeColor(0, 0, 0, 100));
    //return;    
}

static function Image MakeImageColor(int Width, int Height, BTCustomDrawHK.DrawType dt, Material img, Color frontColor, Color BackShadowColor)
{
    local Image Temp;

    Temp.Width = float(Width);
    Temp.Height = float(Height);
    Temp.DrawType = dt;
    Temp.Image = img;
    Temp.DrawColor = frontColor;
    Temp.DrawShadowColor = BackShadowColor;
    return Temp;
    //return;    
}

static function string ToWonString(string money)
{
    local int i, sLen, Count;
    local array<string> tarray;
    local string retString;

    // End:0x2A
    if(Left(money, 1) == "-")
    {
        money = Mid(money, 1);
        retString = "-";        
    }
    else
    {
        retString = "";
    }
    Count = 0;
    sLen = Len(money);
    i = int(float(sLen) % float(3));
    // End:0x81
    if(i != 0)
    {
        tarray[Count++] = Mid(money, 0, i);
    }
    J0x81:

    // End:0xB8 [Loop If]
    if(i != sLen)
    {
        tarray[Count++] = Mid(money, i, 3);
        i += 3;
        // [Loop Continue]
        goto J0x81;
    }
    retString = retString $ tarray[0];
    i = 1;
    J0xD3:

    // End:0x10A [Loop If]
    if(i < tarray.Length)
    {
        retString = (retString $ ",") $ tarray[i];
        i++;
        // [Loop Continue]
        goto J0xD3;
    }
    return retString;
    //return;    
}

static function string ToDollarString(string money)
{
    local int i, sLen, Count;
    local array<string> tarray;
    local string retString;

    // End:0x1C
    if(Left(money, 1) == "-")
    {
        retString = "-";        
    }
    else
    {
        retString = "";
    }
    Count = 0;
    sLen = Len(money);
    i = int(float(sLen) % float(4));
    // End:0x73
    if(i != 0)
    {
        tarray[Count++] = Mid(money, 0, i);
    }
    J0x73:

    // End:0xAA [Loop If]
    if(i != sLen)
    {
        tarray[Count++] = Mid(money, i, 4);
        i += 4;
        // [Loop Continue]
        goto J0x73;
    }
    retString = retString $ tarray[0];
    i = 1;
    J0xC5:

    // End:0xFC [Loop If]
    if(i < tarray.Length)
    {
        retString = (retString $ ",") $ tarray[i];
        i++;
        // [Loop Continue]
        goto J0xC5;
    }
    return retString;
    //return;    
}

static function DrawTextArrayPadding(Canvas C, array<Text> textArray, BTCustomDrawHK.DrawType dt, BTCustomDrawHK.TextArrayDrawType tadt, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawTextArray(C, textArray, dt, tadt, tL + (pL * tW), tT + (pT * tH), tR - (pR * tW), tB - (pB * tH));
    //return;    
}

static function DrawTextPaddingOffset(Canvas C, Text Text, float tL, float tT, float tR, float tB, int pL, int pT, int pR, int pB)
{
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawText(C, Text, tL + float(pL), tT + float(pT), tR - float(pR), tB - float(pB));
    //return;    
}

static function DrawText(Canvas C, Text Text, float tL, float tT, float tR, float tB, optional int PresetIndex, optional bool bUseD3DFont)
{
    C.DrawColor = Text.DrawColor;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, Text.Text, Text.FontDrawType, float(Text.FontSize), tL, tT, tR, tB, Text.DrawShadowColor, PresetIndex, bUseD3DFont);
    //return;    
}

static function DrawText_UseModulateColor(Canvas C, Text Text, float tL, float tT, float tR, float tB, optional int PresetIndex, optional bool bUseD3DFont, optional bool bUseModulateColor, optional Plane mColor)
{
    C.DrawColor = Text.DrawColor;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString_UseModulateColor(C, Text.Text, Text.FontDrawType, float(Text.FontSize), tL, tT, tR, tB, Text.DrawShadowColor, PresetIndex, bUseD3DFont, bUseModulateColor, mColor);
    //return;    
}

static function DrawTextCache(Canvas C, Text Text, float tL, float tT, float tR, float tB, optional int Level)
{
    C.DrawColor = Text.DrawColor;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawStringCache(C, Text.Text, Text.FontDrawType, float(Text.FontSize), tL, tT, tR, tB, Text.DrawShadowColor, Level);
    //return;    
}

static function float DrawTextArray(Canvas C, array<Text> textArray, BTCustomDrawHK.DrawType dt, BTCustomDrawHK.TextArrayDrawType tadt, float tL, float tT, float tR, float tB, optional int Level)
{
    local int i;
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, rOneW, rOneH, rSaveW,
	    rSaveH;

    local int addFontSize;
    local float ScaleX, ScaleY, OldScaleX, OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xB2
    if(ScaleY > 1.0000000)
    {
        addFontSize = int((ScaleY - 1.0000000) * float(10));
        C.FontScaleX = 1.0000000;
        C.FontScaleY = 1.0000000;        
    }
    else
    {
        C.FontScaleX = ScaleX;
        C.FontScaleY = ScaleY;
    }
    tW = tR - tL;
    tH = tB - tT;
    rW = 0.0000000;
    rH = 0.0000000;
    i = 0;
    J0x11B:

    // End:0x19B [Loop If]
    if(i < textArray.Length)
    {
        C.BtrTextSize(textArray[i].Text, textArray[i].FontSize + addFontSize, rOneW, rOneH);
        rW += rOneW;
        // End:0x191
        if(rH < rOneH)
        {
            rH = rOneH;
        }
        i++;
        // [Loop Continue]
        goto J0x11B;
    }
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x1E4
        case 0:
            rX = tL;
            rY = tT;
            // End:0x355
            break;
        // End:0x20F
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x355
            break;
        // End:0x234
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x355
            break;
        // End:0x25F
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x355
            break;
        // End:0x297
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x355
            break;
        // End:0x2C9
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x355
            break;
        // End:0x2EE
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x355
            break;
        // End:0x320
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x355
            break;
        // End:0x34C
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x355
            break;
        // End:0xFFFF
        default:
            return -1.0000000;
            break;
    }
    rSaveW = 0.0000000;
    i = 0;
    J0x367:

    // End:0x587 [Loop If]
    if(i < textArray.Length)
    {
        C.BtrTextSize(textArray[i].Text, textArray[i].FontSize + addFontSize, rOneW, rOneH);
        rSaveH = 0.0000000;
        // End:0x3ED
        if(int(tadt) == int(0))
        {
            rSaveH = (rH - rOneH) / float(2);            
        }
        else
        {
            // End:0x40F
            if(int(tadt) == int(2))
            {
                rSaveH = rH - rOneH;
            }
        }
        C.DrawColor = textArray[i].DrawColor;
        // End:0x4DA
        if(((rX + rSaveW) + rOneW) > tR)
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawEllipsisString(C, textArray[i].Text, 0, float(textArray[i].FontSize + addFontSize), 1.0000000, rX + rSaveW, rY + rSaveH, tR, (rY + rSaveH) + rOneH, textArray[i].DrawShadowColor, Level);
            // [Explicit Break]
            goto J0x587;            
        }
        else
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawEllipsisString(C, textArray[i].Text, 0, float(textArray[i].FontSize + addFontSize), 1.0000000, rX + rSaveW, rY + rSaveH, (rX + rSaveW) + rOneW, (rY + rSaveH) + rOneH, textArray[i].DrawShadowColor, Level);
        }
        rSaveW += rOneW;
        i++;
        // [Loop Continue]
        goto J0x367;
    }
    J0x587:

    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    return rX;
    //return;    
}

static function DrawStringPadding(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float FontSize, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB, optional Color BackShadowColor, optional int Level)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, Text, dt, FontSize, tL + (pL * tW), tT + (pT * tH), tR - (pR * tW), tB - (pB * tH), BackShadowColor, Level);
    //return;    
}

static function DrawStringPaddingOffset(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float FontSize, float tL, float tT, float tR, float tB, int pL, int pT, int pR, int pB, optional Color BackShadowColor, optional int PresetIndex, optional bool bUseD3DFont)
{
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, Text, dt, FontSize, tL + float(pL), tT + float(pT), tR - float(pR), tB - float(pB), BackShadowColor, PresetIndex, bUseD3DFont);
    //return;    
}

static function DrawString_UseModulateColor(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor, optional int PresetIndex, optional bool bUseD3DFont, optional bool bUseModulateColor, optional Plane mColor)
{
    local float X, Y, tW, tH, rX, rY,
	    rW, rH;

    local Color SaveBackColor;

    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSize(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x92
        case 0:
            rX = tL;
            rY = tT;
            // End:0x1FF
            break;
        // End:0xBD
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x1FF
            break;
        // End:0xE2
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x1FF
            break;
        // End:0x10D
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x1FF
            break;
        // End:0x145
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x1FF
            break;
        // End:0x177
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x1FF
            break;
        // End:0x19C
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x1FF
            break;
        // End:0x1CE
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x1FF
            break;
        // End:0x1FA
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x1FF
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    SaveBackColor = C.DrawBackColor;
    C.DrawBackColor = BackShadowColor;
    C.BtrDrawTextHK_UseModulateColor(Text, rX, rY, rX + rW, rY + rH, int(fntSize), bUseD3DFont, 0, byte(PresetIndex), bUseModulateColor, mColor);
    C.DrawBackColor = SaveBackColor;
    //return;    
}

static function DrawStringModulateAlpha(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor, optional int PresetIndex, optional bool bUseD3DFont)
{
    local float perc;
    local Color SaveBackColor, saveC;
    local Plane saveMColor, mColor;

    // End:0x0E
    if(Text == "")
    {
        return;
    }
    saveMColor = C.ColorModulate;
    saveC = C.DrawColor;
    SaveBackColor = C.DrawBackColor;
    mColor = C.ColorModulate;
    perc = float(C.DrawColor.A) / 255.0000000;
    mColor.W = mColor.W * perc;
    C.DrawColor.A = byte(255);
    C.ColorModulate = mColor;
    C.DrawBackColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(0, 0, 0, 200);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, Text, dt, fntSize, tL, tT, tR, tB, C.DrawBackColor, PresetIndex, bUseD3DFont);
    C.ColorModulate = saveMColor;
    C.DrawColor = saveC;
    C.DrawBackColor = SaveBackColor;
    //return;    
}

static function DrawString(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor, optional int PresetIndex, optional bool bUseD3DFont)
{
    local float X, Y, tW, tH, rX, rY,
	    rW, rH;

    local Color SaveBackColor;
    local float ScaleX, ScaleY, OldScaleX, OldScaleY;

    // End:0x0E
    if(Text == "")
    {
        return;
    }
    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xCF
    if(ScaleY >= 5.0000000)
    {
        fntSize += float(40);
        C.FontScaleX = Round(ScaleY * float(10)) / float(50);
        C.FontScaleY = Round(ScaleY * float(10)) / float(50);        
    }
    else
    {
        // End:0x125
        if(ScaleY > 1.0000000)
        {
            fntSize += Round((ScaleY - 1.0000000) * float(10));
            C.FontScaleX = 1.0000000;
            C.FontScaleY = 1.0000000;            
        }
        else
        {
            C.FontScaleX = ScaleX;
            C.FontScaleY = ScaleY;
        }
    }
    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSize(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x1DF
        case 0:
            rX = tL;
            rY = tT;
            // End:0x34C
            break;
        // End:0x20A
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x34C
            break;
        // End:0x22F
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x34C
            break;
        // End:0x25A
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x34C
            break;
        // End:0x292
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x34C
            break;
        // End:0x2C4
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x34C
            break;
        // End:0x2E9
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x34C
            break;
        // End:0x31B
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x34C
            break;
        // End:0x347
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x34C
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    SaveBackColor = C.DrawBackColor;
    C.DrawBackColor = BackShadowColor;
    C.BtrDrawTextHK(Text, rX, rY, rX + rW, rY + rH, int(fntSize), bUseD3DFont, 0, byte(PresetIndex));
    C.DrawBackColor = SaveBackColor;
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    //return;    
}

static function DrawStringCache(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor, optional int Level)
{
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, ScaleX, ScaleY, OldScaleX,
	    OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xB5
    if(ScaleY > 1.0000000)
    {
        fntSize += float(int((ScaleY - 1.0000000) * float(10)));
        C.FontScaleX = 1.0000000;
        C.FontScaleY = 1.0000000;        
    }
    else
    {
        C.FontScaleX = ScaleX;
        C.FontScaleY = ScaleY;
    }
    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSize(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x16F
        case 0:
            rX = tL;
            rY = tT;
            // End:0x2DC
            break;
        // End:0x19A
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x2DC
            break;
        // End:0x1BF
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x2DC
            break;
        // End:0x1EA
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x2DC
            break;
        // End:0x222
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x2DC
            break;
        // End:0x254
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x2DC
            break;
        // End:0x279
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x2DC
            break;
        // End:0x2AB
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x2DC
            break;
        // End:0x2D7
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x2DC
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    C.BtrDrawTextHK(Text, rX, rY, rX + rW, rY + rH, int(fntSize));
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    //return;    
}

static function FloatBox GetDrawStringFloatBox(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor)
{
    local FloatBox fb;
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, ScaleX, ScaleY, OldScaleX,
	    OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xC1
    if(ScaleY >= 5.0000000)
    {
        fntSize += float(40);
        C.FontScaleX = Round(ScaleY * float(10)) / float(50);
        C.FontScaleY = Round(ScaleY * float(10)) / float(50);        
    }
    else
    {
        // End:0x117
        if(ScaleY > 1.0000000)
        {
            fntSize += Round((ScaleY - 1.0000000) * float(10));
            C.FontScaleX = 1.0000000;
            C.FontScaleY = 1.0000000;            
        }
        else
        {
            C.FontScaleX = ScaleX;
            C.FontScaleY = ScaleY;
        }
    }
    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSize(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x1D1
        case 0:
            rX = tL;
            rY = tT;
            // End:0x388
            break;
        // End:0x1FC
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x388
            break;
        // End:0x221
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x388
            break;
        // End:0x24C
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x284
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2B6
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2DB
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x30D
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x339
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0xFFFF
        default:
            C.FontScaleX = OldScaleX;
            C.FontScaleY = OldScaleY;
            return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            break;
    }
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(rX, rY, rX + rW, rY + rH);
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    return fb;
    //return;    
}

static function FloatBox GetDrawStringFloatBoxLH(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor)
{
    local FloatBox fb;
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, ScaleX, ScaleY, OldScaleX,
	    OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xC1
    if(ScaleY >= 5.0000000)
    {
        fntSize += float(40);
        C.FontScaleX = Round(ScaleY * float(10)) / float(50);
        C.FontScaleY = Round(ScaleY * float(10)) / float(50);        
    }
    else
    {
        // End:0x117
        if(ScaleY > 1.0000000)
        {
            fntSize += Round((ScaleY - 1.0000000) * float(10));
            C.FontScaleX = 1.0000000;
            C.FontScaleY = 1.0000000;            
        }
        else
        {
            C.FontScaleX = ScaleX;
            C.FontScaleY = ScaleY;
        }
    }
    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSizeLH(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x1D1
        case 0:
            rX = tL;
            rY = tT;
            // End:0x388
            break;
        // End:0x1FC
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x388
            break;
        // End:0x221
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x388
            break;
        // End:0x24C
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x284
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2B6
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2DB
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x30D
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x339
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0xFFFF
        default:
            C.FontScaleX = OldScaleX;
            C.FontScaleY = OldScaleY;
            return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            break;
    }
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(rX, rY, rX + rW, rY + rH);
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    return fb;
    //return;    
}

static function FloatBox GetDrawStringFloatBoxOLD(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float tL, float tT, float tR, float tB, optional Color BackShadowColor)
{
    local FloatBox fb;
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, ScaleX, ScaleY, OldScaleX,
	    OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xC1
    if(ScaleY >= 5.0000000)
    {
        fntSize += float(40);
        C.FontScaleX = Round(ScaleY * float(10)) / float(50);
        C.FontScaleY = Round(ScaleY * float(10)) / float(50);        
    }
    else
    {
        // End:0x117
        if(ScaleY > 1.0000000)
        {
            fntSize += Round((ScaleY - 1.0000000) * float(10));
            C.FontScaleX = 1.0000000;
            C.FontScaleY = 1.0000000;            
        }
        else
        {
            C.FontScaleX = ScaleX;
            C.FontScaleY = ScaleY;
        }
    }
    tW = tR - tL;
    tH = tB - tT;
    C.BtrTextSizeOLD(Text, int(fntSize), rW, rH);
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x1D1
        case 0:
            rX = tL;
            rY = tT;
            // End:0x388
            break;
        // End:0x1FC
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x388
            break;
        // End:0x221
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x388
            break;
        // End:0x24C
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x284
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2B6
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x388
            break;
        // End:0x2DB
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x30D
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x388
            break;
        // End:0x339
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x388
            break;
        // End:0xFFFF
        default:
            C.FontScaleX = OldScaleX;
            C.FontScaleY = OldScaleY;
            return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            break;
    }
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(rX, rY, rX + rW, rY + rH);
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    return fb;
    //return;    
}

static function DrawEllipsisString(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float fntSize, float widthPerc, float tL, float tT, float tR, float tB, optional Color BackShadowColor, optional int Level)
{
    local float X, Y, tW, tH, rX, rY,
	    rW, rH, textWidthLimit, ellipsisWidth, findWidth,
	    tempH;

    local int i;
    local string Temp;
    local float ScaleX, ScaleY, OldScaleX, OldScaleY;

    ScaleX = C.ClipX / 1024.0000000;
    ScaleY = C.ClipY / 768.0000000;
    OldScaleX = C.FontScaleX;
    OldScaleY = C.FontScaleY;
    // End:0xB5
    if(ScaleY > 1.0000000)
    {
        fntSize += float(int((ScaleY - 1.0000000) * float(10)));
        C.FontScaleX = 1.0000000;
        C.FontScaleY = 1.0000000;        
    }
    else
    {
        C.FontScaleX = ScaleX;
        C.FontScaleY = ScaleY;
    }
    tW = tR - tL;
    tH = tB - tT;
    textWidthLimit = tW * widthPerc;
    C.BtrTextSize(Text, int(fntSize), rW, rH);
    // End:0x223
    if(rW > textWidthLimit)
    {
        C.BtrTextSize("...", int(fntSize), ellipsisWidth, tempH);
        i = 0;
        J0x173:

        // End:0x1DF [Loop If]
        if(i < Len(Text))
        {
            Temp = Mid(Text, 0, i);
            C.BtrTextSize(Temp, int(fntSize), findWidth, tempH);
            // End:0x1D5
            if(findWidth > (textWidthLimit - ellipsisWidth))
            {
                // [Explicit Break]
                goto J0x1DF;
            }
            i++;
            // [Loop Continue]
            goto J0x173;
        }
        J0x1DF:

        // End:0x20A
        if(i > 0)
        {
            Temp = Mid(Text, 0, i - 1) $ "...";            
        }
        else
        {
            Temp = "...";
        }
        rW = textWidthLimit;        
    }
    else
    {
        Temp = Text;
    }
    X = tW - rW;
    Y = tH - rH;
    switch(dt)
    {
        // End:0x277
        case 0:
            rX = tL;
            rY = tT;
            // End:0x3E4
            break;
        // End:0x2A2
        case 1:
            rX = tL + (X / float(2));
            rY = tT;
            // End:0x3E4
            break;
        // End:0x2C7
        case 2:
            rX = tL + X;
            rY = tT;
            // End:0x3E4
            break;
        // End:0x2F2
        case 3:
            rX = tL;
            rY = tT + (Y / float(2));
            // End:0x3E4
            break;
        // End:0x32A
        case 4:
            rX = tL + (X / float(2));
            rY = tT + (Y / float(2));
            // End:0x3E4
            break;
        // End:0x35C
        case 5:
            rX = tL + X;
            rY = tT + (Y / float(2));
            // End:0x3E4
            break;
        // End:0x381
        case 6:
            rX = tL;
            rY = tT + Y;
            // End:0x3E4
            break;
        // End:0x3B3
        case 7:
            rX = tL + (X / float(2));
            rY = tT + Y;
            // End:0x3E4
            break;
        // End:0x3DF
        case 8:
            rX = tL + X;
            rY = tT + Y;
            // End:0x3E4
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    C.BtrDrawTextHK(Temp, rX, rY, rX + rW, rY + rH, int(fntSize));
    C.FontScaleX = OldScaleX;
    C.FontScaleY = OldScaleY;
    //return;    
}

static function DrawEllipsisStringPadding(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float FontSize, float widthPerc, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB, optional Color BackShadowColor, optional int Level)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawEllipsisString(C, Text, dt, FontSize, widthPerc, tL + (pL * tW), tT + (pT * tH), tR - (pR * tW), tB - (pB * tH), BackShadowColor, Level);
    //return;    
}

static function DrawEllipsisStringPaddingOffset(Canvas C, string Text, BTCustomDrawHK.DrawType dt, float FontSize, float widthPerc, float tL, float tT, float tR, float tB, int pL, int pT, int pR, int pB, optional Color BackShadowColor, optional int Level)
{
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawEllipsisString(C, Text, dt, FontSize, widthPerc, tL + float(pL), tT + float(pT), tR - float(pR), tB - float(pB), BackShadowColor, Level);
    //return;    
}

static function DrawImageScaleAllAndPaddingAndClipping(Canvas C, out Image img, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB, float cL, float ct, float cR, float cb)
{
    local float tW, tH, rW, rH, rL, rT,
	    rR, rB;

    tW = tR - tL;
    tH = tB - tT;
    rL = tL + (pL * tW);
    rT = tT + (pT * tH);
    rR = tR - (pR * tW);
    rB = tB - (pB * tH);
    rW = rR - rL;
    rH = rB - rT;
    C.SetPos(rL + (rW * cL), rT + (rH * ct));
    C.DrawTile(img.Image, rW * (cR - cL), rH * (cb - ct), img.Width * cL, img.Height * ct, img.Width * (cR - cL), img.Height * (cb - ct));
    //return;    
}

static function DrawImageScaleAllAndPaddingOffsetAndClipping(Canvas C, out Image img, float tL, float tT, float tR, float tB, int pL, int pT, int pR, int pB, float cL, float ct, float cR, float cb)
{
    local float tW, tH, rW, rH, rL, rT,
	    rR, rB;

    tW = tR - tL;
    tH = tB - tT;
    rL = tL + float(pL);
    rT = tT + float(pT);
    rR = tR - float(pR);
    rB = tB - float(pB);
    rW = rR - rL;
    rH = rB - rT;
    C.SetPos(rL + (rW * cL), rT + (rH * ct));
    C.DrawTile(img.Image, rW * (cR - cL), rH * (cb - ct), img.Width * cL, img.Height * ct, img.Width * (cR - cL), img.Height * (cb - ct));
    //return;    
}

static function DrawImagePaddingOffset(Canvas C, out Image img, float tL, float tT, float tR, float tB, int pL, int pT, int pR, int pB)
{
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, tL + float(pL), tT + float(pT), tR - float(pR), tB - float(pB));
    //return;    
}

static function DrawImagePadding(Canvas C, out Image img, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, tL + (pL * tW), tT + (pT * tH), tR - (pR * tW), tB - (pB * tH));
    //return;    
}

static function DrawImagePaddingCache(Canvas C, out Image img, float tL, float tT, float tR, float tB, float pL, float pT, float pR, float pB, optional int Level)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageCache(C, img, tL + (pL * tW), tT + (pT * tH), tR - (pR * tW), tB - (pB * tH), Level);
    //return;    
}

static function DrawImage(Canvas C, out Image img, float tL, float tT, float tR, float tB)
{
    // End:0x12
    if(img.Image == none)
    {
        return;
    }
    C.DrawColor = img.DrawColor;
    // End:0x70
    if(int(img.DrawType) <= int(8))
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageOriginal(C, img, tL, tT, tR, tB);        
    }
    else
    {
        // End:0xB5
        if(int(img.DrawType) <= int(15))
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageStretched(C, img, tL, tT, tR, tB);            
        }
        else
        {
            // End:0xFA
            if(int(img.DrawType) <= int(28))
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageScale(C, img, tL, tT, tR, tB);                
            }
            else
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, img, tL, tT, tR, tB, img.X, img.Y, img.X + img.Width, img.Y + img.Height);
            }
        }
    }
    //return;    
}

static function DrawImage_Alpha(Canvas C, out Image img, float tL, float tT, float tR, float tB, float Alpha)
{
    // End:0x12
    if(img.Image == none)
    {
        return;
    }
    C.DrawColor = img.DrawColor;
    C.DrawColor.A = byte(float(C.DrawColor.A) * Alpha);
    // End:0xA2
    if(int(img.DrawType) <= int(8))
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageOriginal(C, img, tL, tT, tR, tB);        
    }
    else
    {
        // End:0xE7
        if(int(img.DrawType) <= int(15))
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageStretched(C, img, tL, tT, tR, tB);            
        }
        else
        {
            // End:0x12C
            if(int(img.DrawType) <= int(28))
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageScale(C, img, tL, tT, tR, tB);                
            }
            else
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, img, tL, tT, tR, tB, img.X, img.Y, img.X + img.Width, img.Y + img.Height);
            }
        }
    }
    //return;    
}

static function DrawImageCache(Canvas C, out Image img, float tL, float tT, float tR, float tB, optional int Level)
{
    // End:0x12
    if(img.Image == none)
    {
        return;
    }
    C.DrawColor = img.DrawColor;
    // End:0x75
    if(int(img.DrawType) <= int(8))
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageOriginalCache(C, img, tL, tT, tR, tB, Level);        
    }
    else
    {
        // End:0xBF
        if(int(img.DrawType) <= int(15))
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageStretchedCache(C, img, tL, tT, tR, tB, Level);            
        }
        else
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageScaleCache(C, img, tL, tT, tR, tB, Level);
        }
    }
    //return;    
}

static function DrawImageOriginal(Canvas C, out Image img, float tL, float tT, float tR, float tB)
{
    local float X, Y, tW, tH, imgwidth, imgheight;

    tW = tR - tL;
    tH = tB - tT;
    imgwidth = img.Width - img.X;
    imgheight = img.Height - img.Y;
    X = tW - imgwidth;
    Y = tH - imgheight;
    switch(img.DrawType)
    {
        // End:0xAD
        case 0:
            C.SetPos(tL, tT);
            // End:0x248
            break;
        // End:0xDF
        case 1:
            C.SetPos(tL + float(int(X / float(2))), tT);
            // End:0x248
            break;
        // End:0x107
        case 2:
            C.SetPos(tL + X, tT);
            // End:0x248
            break;
        // End:0x139
        case 3:
            C.SetPos(tL, tT + float(int(Y / float(2))));
            // End:0x248
            break;
        // End:0x17C
        case 4:
            C.SetPos(tL + float(int(X / float(2))), tT + float(int(Y / float(2))));
            // End:0x248
            break;
        // End:0x1B5
        case 5:
            C.SetPos(tL + X, tT + float(int(Y / float(2))));
            // End:0x248
            break;
        // End:0x1DD
        case 6:
            C.SetPos(tL, tT + Y);
            // End:0x248
            break;
        // End:0x216
        case 7:
            C.SetPos(tL + float(int(X / float(2))), tT + Y);
            // End:0x248
            break;
        // End:0x245
        case 8:
            C.SetPos(tL + X, tT + Y);
            // End:0x248
            break;
        // End:0xFFFF
        default:
            break;
    }
    C.DrawTile(img.Image, img.Width, img.Height, img.X, img.Y, img.Width, img.Height);
    //return;    
}

static function DrawImageOriginalCache(Canvas C, out Image img, float tL, float tT, float tR, float tB, optional int Level)
{
    local float X, Y, tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    X = tW - img.Width;
    Y = tH - img.Height;
    switch(img.DrawType)
    {
        // End:0x7F
        case 0:
            C.SetPos(tL, tT);
            // End:0x21A
            break;
        // End:0xB1
        case 1:
            C.SetPos(tL + float(int(X / float(2))), tT);
            // End:0x21A
            break;
        // End:0xD9
        case 2:
            C.SetPos(tL + X, tT);
            // End:0x21A
            break;
        // End:0x10B
        case 3:
            C.SetPos(tL, tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x14E
        case 4:
            C.SetPos(tL + float(int(X / float(2))), tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x187
        case 5:
            C.SetPos(tL + X, tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x1AF
        case 6:
            C.SetPos(tL, tT + Y);
            // End:0x21A
            break;
        // End:0x1E8
        case 7:
            C.SetPos(tL + float(int(X / float(2))), tT + Y);
            // End:0x21A
            break;
        // End:0x217
        case 8:
            C.SetPos(tL + X, tT + Y);
            // End:0x21A
            break;
        // End:0xFFFF
        default:
            break;
    }
    C.DrawTileCache(img.Image, img.Width, img.Height, 0.0000000, 0.0000000, img.Width, img.Height, Level);
    //return;    
}

static function DrawImageWithClipArea(Canvas C, out Image img, float tL, float tT, float tR, float tB, float cL, float ct, float cR, float cb)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    C.SetPos(tL, tT);
    C.DrawTile(img.Image, tW, tH, cL, ct, cR - cL, cb - ct);
    //return;    
}

static function DrawImageOriginalWithClipArea(Canvas C, out Image img, float tL, float tT, float tR, float tB, float cL, float ct, float cR, float cb)
{
    local float conL, conT, conR, conB, X, Y,
	    tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    X = tW - img.Width;
    Y = tH - img.Height;
    switch(img.DrawType)
    {
        // End:0x7F
        case 0:
            C.SetPos(tL, tT);
            // End:0x21A
            break;
        // End:0xB1
        case 1:
            C.SetPos(tL + float(int(X / float(2))), tT);
            // End:0x21A
            break;
        // End:0xD9
        case 2:
            C.SetPos(tL + X, tT);
            // End:0x21A
            break;
        // End:0x10B
        case 3:
            C.SetPos(tL, tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x14E
        case 4:
            C.SetPos(tL + float(int(X / float(2))), tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x187
        case 5:
            C.SetPos(tL + X, tT + float(int(Y / float(2))));
            // End:0x21A
            break;
        // End:0x1AF
        case 6:
            C.SetPos(tL, tT + Y);
            // End:0x21A
            break;
        // End:0x1E8
        case 7:
            C.SetPos(tL + float(int(X / float(2))), tT + Y);
            // End:0x21A
            break;
        // End:0x217
        case 8:
            C.SetPos(tL + X, tT + Y);
            // End:0x21A
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x24D
    if(C.CurX < cL)
    {
        conL = cL - C.CurX;
    }
    // End:0x280
    if(C.CurY < ct)
    {
        conT = ct - C.CurY;
    }
    // End:0x2CB
    if((C.CurX + img.Width) > cR)
    {
        conR = (C.CurX + img.Width) - cR;
    }
    // End:0x316
    if((C.CurY + img.Height) > cb)
    {
        conB = (C.CurY + img.Height) - cb;
    }
    // End:0x350
    if(((img.Width - conR) <= conL) || (img.Height - conB) <= conT)
    {
        return;
    }
    C.CurX += conL;
    C.CurY += conT;
    C.DrawColor = img.DrawColor;
    C.DrawTile(img.Image, (img.Width - conL) - conR, (img.Height - conT) - conB, conL, conT, (img.Width - conL) - conR, (img.Height - conT) - conB);
    //return;    
}

static function DrawImageScaleWithClipArea(Canvas C, out Image img, float tL, float tT, float tR, float tB, float cL, float ct, float cR, float cb)
{
    local float tW, tH;

    tW = tR - tL;
    tH = tB - tT;
    C.SetPos(tL, tT);
    C.DrawColor = img.DrawColor;
    C.DrawTile(img.Image, tW, tH, cL, ct, cR - cL, cb - ct);
    //return;    
}

static function DrawImageScale(Canvas C, out Image img, float tL, float tT, float tR, float tB)
{
    local float X, Y, tW, tH, ratioX, ratioY;

    switch(img.DrawType)
    {
        // End:0x8F
        case 21:
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x142
        case 19:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + X, tT);
            C.DrawTile(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x1FB
        case 20:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + (X / float(2)), tT);
            C.DrawTile(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x27E
        case 16:
            tW = tR - tL;
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x331
        case 18:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + Y);
            C.DrawTile(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x3EA
        case 17:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + (Y / float(2)));
            C.DrawTile(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x4A8
        case 22:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x57A
        case 23:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT + ((tH - ratioY) / float(2)));
            C.DrawTile(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x646
        case 24:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT + (tH - ratioY));
            C.DrawTile(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x704
        case 25:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x7D6
        case 26:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL + ((tW - ratioX) / float(2)), tT);
            C.DrawTile(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x8A2
        case 27:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL + (tW - ratioX), tT);
            C.DrawTile(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0x932
        case 28:
            tW = tR - tL;
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, tW, tH, img.X, img.Y, img.Width, img.Height);
            // End:0x935
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static function DrawImageScaleCache(Canvas C, out Image img, float tL, float tT, float tR, float tB, optional int Level)
{
    local float X, Y, tW, tH, ratioX, ratioY;

    switch(img.DrawType)
    {
        // End:0x94
        case 21:
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x14C
        case 19:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + X, tT);
            C.DrawTileCache(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x20A
        case 20:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + (X / float(2)), tT);
            C.DrawTileCache(img.Image, img.Width, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x292
        case 16:
            tW = tR - tL;
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x34A
        case 18:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + Y);
            C.DrawTileCache(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x408
        case 17:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + (Y / float(2)));
            C.DrawTileCache(img.Image, tW, img.Height, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x4CB
        case 22:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x5A2
        case 23:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT + ((tH - ratioY) / float(2)));
            C.DrawTileCache(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x673
        case 24:
            tW = tR - tL;
            tH = tB - tT;
            ratioX = tW / img.Width;
            ratioY = img.Height * ratioX;
            C.SetPos(tL, tT + (tH - ratioY));
            C.DrawTileCache(img.Image, tW, ratioY, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x736
        case 25:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x80D
        case 26:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL + ((tW - ratioX) / float(2)), tT);
            C.DrawTileCache(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x8DE
        case 27:
            tW = tR - tL;
            tH = tB - tT;
            ratioY = tH / img.Height;
            ratioX = img.Width * ratioY;
            C.SetPos(tL + (tW - ratioX), tT);
            C.DrawTileCache(img.Image, ratioX, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0x973
        case 28:
            tW = tR - tL;
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, tW, tH, img.X, img.Y, img.Width, img.Height, Level);
            // End:0x976
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static function DrawImageStretchedWithClipArea(Canvas C, out Image img, float tL, float tT, float tR, float tB, float cL, float ct, float cR, float cb)
{
    local bool bStretchWidth, bStretchHeight;
    local int imgX[3], imgY, tgX, tgY, tW, tH,
	    imgwidth, imgheight;

    imgwidth = int(img.Width);
    imgheight = int(img.Height);
    tW = int(tR - tL);
    tH = int(tB - tT);
    // End:0x63
    if(tW > imgwidth)
    {
        bStretchWidth = true;
    }
    // End:0x7A
    if(tH > imgheight)
    {
        bStretchHeight = true;
    }
    C.bNoSmooth = true;
    // End:0x6BC
    if(bStretchWidth && bStretchHeight)
    {
        imgX[0] = imgwidth / 2;
        imgX[1] = 1;
        imgX[2] = imgwidth - ((imgwidth / 2) + 1);
        imgY[0] = imgheight / 2;
        imgY[1] = 1;
        imgY[2] = imgheight - ((imgheight / 2) + 1);
        tgX[0] = imgX[0];
        tgX[1] = (tW - imgX[0]) - imgX[2];
        tgX[2] = imgX[2];
        tgY[0] = imgY[0];
        tgY[1] = (tH - imgY[0]) - imgY[2];
        tgY[2] = imgY[2];
        C.SetPos(tL, tT);
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
        C.SetPos(tL + float(tgX[0]), tT);
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgX[0])) + 0.5000000, img.Y, 0.0000000, float(imgY[0]));
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[0]), (img.X + float(imgX[0])) + float(imgX[1]), img.Y, float(imgX[2]), float(imgY[0]));
        C.SetPos(tL, tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgY[0])) + 0.5000000, float(imgX[0]), 0.0000000);
        C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgX[0])) + 0.5000000, (img.Y + float(imgY[0])) + 0.5000000, 0.0000000, 0.0000000);
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[1]), (img.X + float(imgX[0])) + float(imgX[1]), (img.Y + float(imgY[0])) + 0.5000000, float(imgX[2]), 0.0000000);
        C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[2]), img.X, (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[0]), float(imgY[2]));
        C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[2]), float(imgX[0]) + 0.5000000, float(imgY[0] + imgY[1]), 0.0000000, float(imgY[2]));
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[2]), float(imgX[0] + imgX[1]), float(imgY[0] + imgY[1]), float(imgX[2]), float(imgY[2]));        
    }
    else
    {
        // End:0xAEA
        if(bStretchWidth)
        {
            imgX[0] = imgwidth / 2;
            imgX[1] = 1;
            imgX[2] = imgwidth - ((imgwidth / 2) + 1);
            tgX[0] = imgX[0];
            tgX[1] = (tW - imgX[0]) - imgX[2];
            tgX[2] = imgX[2];
            tgY[0] = tH / 2;
            tgY[1] = tH - tgY[0];
            imgY[0] = tgY[0];
            imgY[1] = tgY[1];
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
            C.SetPos(tL + float(tgX[0]), tT);
            C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgX[0])) + 0.5000000, img.Y, 0.0000000, float(imgY[0]));
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
            C.DrawTile(img.Image, float(tgX[2]), float(tgY[0]), (img.X + float(imgX[0])) + float(imgX[1]), img.Y, float(imgX[2]), float(imgY[0]));
            C.SetPos(tL, tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[0]), float(imgY[1]));
            C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgX[0])) + 0.5000000, (img.Y + float(imgheight)) - float(imgY[1]), 0.0000000, float(imgY[1]));
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[2]), float(tgY[1]), (img.X + float(imgX[0])) + float(imgX[1]), (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[2]), float(imgY[1]));            
        }
        else
        {
            // End:0xF18
            if(bStretchHeight)
            {
                imgY[0] = imgheight / 2;
                imgY[1] = 1;
                imgY[2] = imgheight - ((imgheight / 2) + 1);
                tgY[0] = imgY[0];
                tgY[1] = (tH - imgY[0]) - imgY[2];
                tgY[2] = imgY[2];
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                C.SetPos(tL, tT);
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgY[0])) + 0.5000000, float(imgX[0]), 0.0000000);
                C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[2]), img.X, (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[0]), float(imgY[2]));
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgwidth)) - float(imgX[1]), img.Y, float(imgX[1]), float(imgY[0]));
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgY[0])) + 0.5000000, float(imgX[1]), 0.0000000);
                C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[2]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[1]), float(imgY[2]));                
            }
            else
            {
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                tgY[0] = tH / 2;
                tgY[1] = tH - tgY[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                imgY[0] = tgY[0];
                imgY[1] = tgY[1];
                C.SetPos(tL, tT);
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgwidth)) - float(imgX[1]), img.Y, float(imgX[1]), float(imgY[0]));
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[0]), float(imgY[1]));
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[1]), float(imgY[1]));
            }
        }
    }
    //return;    
}

static function DrawImageStretched(Canvas C, out Image img, float tL, float tT, float tR, float tB)
{
    local bool bStretchWidth, bStretchHeight;
    local int imgX[3], imgY, tgX, tgY, tW, tH,
	    imgwidth, imgheight;

    imgwidth = int(img.Width);
    imgheight = int(img.Height);
    tW = int(tR - tL);
    tH = int(tB - tT);
    // End:0x63
    if(tW > imgwidth)
    {
        bStretchWidth = true;
    }
    // End:0x7A
    if(tH > imgheight)
    {
        bStretchHeight = true;
    }
    C.bNoSmooth = true;
    // End:0x6BC
    if(bStretchWidth && bStretchHeight)
    {
        imgX[0] = imgwidth / 2;
        imgX[1] = 1;
        imgX[2] = imgwidth - ((imgwidth / 2) + 1);
        imgY[0] = imgheight / 2;
        imgY[1] = 1;
        imgY[2] = imgheight - ((imgheight / 2) + 1);
        tgX[0] = imgX[0];
        tgX[1] = (tW - imgX[0]) - imgX[2];
        tgX[2] = imgX[2];
        tgY[0] = imgY[0];
        tgY[1] = (tH - imgY[0]) - imgY[2];
        tgY[2] = imgY[2];
        C.SetPos(tL, tT);
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
        C.SetPos(tL + float(tgX[0]), tT);
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgX[0])) + 0.5000000, img.Y, 0.0000000, float(imgY[0]));
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[0]), (img.X + float(imgX[0])) + float(imgX[1]), img.Y, float(imgX[2]), float(imgY[0]));
        C.SetPos(tL, tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgY[0])) + 0.5000000, float(imgX[0]), 0.0000000);
        C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgX[0])) + 0.5000000, (img.Y + float(imgY[0])) + 0.5000000, 0.0000000, 0.0000000);
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[1]), (img.X + float(imgX[0])) + float(imgX[1]), (img.Y + float(imgY[0])) + 0.5000000, float(imgX[2]), 0.0000000);
        C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[0]), float(tgY[2]), img.X, (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[0]), float(imgY[2]));
        C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[1]), float(tgY[2]), float(imgX[0]) + 0.5000000, float(imgY[0] + imgY[1]), 0.0000000, float(imgY[2]));
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTile(img.Image, float(tgX[2]), float(tgY[2]), float(imgX[0] + imgX[1]), float(imgY[0] + imgY[1]), float(imgX[2]), float(imgY[2]));        
    }
    else
    {
        // End:0xAEA
        if(bStretchWidth)
        {
            imgX[0] = imgwidth / 2;
            imgX[1] = 1;
            imgX[2] = imgwidth - ((imgwidth / 2) + 1);
            tgX[0] = imgX[0];
            tgX[1] = (tW - imgX[0]) - imgX[2];
            tgX[2] = imgX[2];
            tgY[0] = tH / 2;
            tgY[1] = tH - tgY[0];
            imgY[0] = tgY[0];
            imgY[1] = tgY[1];
            C.SetPos(tL, tT);
            C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
            C.SetPos(tL + float(tgX[0]), tT);
            C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgX[0])) + 0.5000000, img.Y, 0.0000000, float(imgY[0]));
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
            C.DrawTile(img.Image, float(tgX[2]), float(tgY[0]), (img.X + float(imgX[0])) + float(imgX[1]), img.Y, float(imgX[2]), float(imgY[0]));
            C.SetPos(tL, tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[0]), float(imgY[1]));
            C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgX[0])) + 0.5000000, (img.Y + float(imgheight)) - float(imgY[1]), 0.0000000, float(imgY[1]));
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
            C.DrawTile(img.Image, float(tgX[2]), float(tgY[1]), (img.X + float(imgX[0])) + float(imgX[1]), (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[2]), float(imgY[1]));            
        }
        else
        {
            // End:0xF18
            if(bStretchHeight)
            {
                imgY[0] = imgheight / 2;
                imgY[1] = 1;
                imgY[2] = imgheight - ((imgheight / 2) + 1);
                tgY[0] = imgY[0];
                tgY[1] = (tH - imgY[0]) - imgY[2];
                tgY[2] = imgY[2];
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                C.SetPos(tL, tT);
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgY[0])) + 0.5000000, float(imgX[0]), 0.0000000);
                C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[2]), img.X, (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[0]), float(imgY[2]));
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgwidth)) - float(imgX[1]), img.Y, float(imgX[1]), float(imgY[0]));
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgY[0])) + 0.5000000, float(imgX[1]), 0.0000000);
                C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[2]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgY[0])) + float(imgY[1]), float(imgX[1]), float(imgY[2]));                
            }
            else
            {
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                tgY[0] = tH / 2;
                tgY[1] = tH - tgY[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                imgY[0] = tgY[0];
                imgY[1] = tgY[1];
                C.SetPos(tL, tT);
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[0]), img.X, img.Y, float(imgX[0]), float(imgY[0]));
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[0]), (img.X + float(imgwidth)) - float(imgX[1]), img.Y, float(imgX[1]), float(imgY[0]));
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[0]), float(tgY[1]), img.X, (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[0]), float(imgY[1]));
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTile(img.Image, float(tgX[1]), float(tgY[1]), (img.X + float(imgwidth)) - float(imgX[1]), (img.Y + float(imgheight)) - float(imgY[1]), float(imgX[1]), float(imgY[1]));
            }
        }
    }
    //return;    
}

static function DrawImageStretchedCache(Canvas C, out Image img, float tL, float tT, float tR, float tB, optional int Level)
{
    local bool bStretchWidth, bStretchHeight;
    local int imgX[3], imgY, tgX, tgY, tW, tH;

    tW = int(tR - tL);
    tH = int(tB - tT);
    // End:0x46
    if(float(tW) > img.Width)
    {
        bStretchWidth = true;
    }
    // End:0x64
    if(float(tH) > img.Height)
    {
        bStretchHeight = true;
    }
    C.bNoSmooth = true;
    // End:0x681
    if(bStretchWidth && bStretchHeight)
    {
        imgX[0] = int(img.Width / float(2));
        imgX[1] = 1;
        imgX[2] = int(img.Width - ((img.Width / float(2)) + float(1)));
        imgY[0] = int(img.Height / float(2));
        imgY[1] = 1;
        imgY[2] = int(img.Height - ((img.Height / float(2)) + float(1)));
        tgX[0] = imgX[0];
        tgX[1] = (tW - imgX[0]) - imgX[2];
        tgX[2] = imgX[2];
        tgY[0] = imgY[0];
        tgY[1] = (tH - imgY[0]) - imgY[2];
        tgY[2] = imgY[2];
        C.SetPos(tL, tT);
        C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[0]), 0.0000000, 0.0000000, float(imgX[0]), float(imgY[0]), Level);
        C.SetPos(tL + float(tgX[0]), tT);
        C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[0]), float(imgX[0]) + 0.5000000, 0.0000000, 0.0000000, float(imgY[0]), Level);
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
        C.DrawTileCache(img.Image, float(tgX[2]), float(tgY[0]), float(imgX[0] + imgX[1]), 0.0000000, float(imgX[2]), float(imgY[0]), Level);
        C.SetPos(tL, tT + float(tgY[0]));
        C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[1]), 0.0000000, float(imgY[0]) + 0.5000000, float(imgX[0]), 0.0000000, Level);
        C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
        C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[1]), float(imgX[0]) + 0.5000000, float(imgY[0]) + 0.5000000, 0.0000000, 0.0000000, Level);
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
        C.DrawTileCache(img.Image, float(tgX[2]), float(tgY[1]), float(imgX[0] + imgX[1]), float(imgY[0]) + 0.5000000, float(imgX[2]), 0.0000000, Level);
        C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[2]), 0.0000000, float(imgY[0] + imgY[1]), float(imgX[0]), float(imgY[2]), Level);
        C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[2]), float(imgX[0]) + 0.5000000, float(imgY[0] + imgY[1]), 0.0000000, float(imgY[2]), Level);
        C.SetPos((tL + float(tgX[0])) + float(tgX[1]), (tT + float(tgY[0])) + float(tgY[1]));
        C.DrawTileCache(img.Image, float(tgX[2]), float(tgY[2]), float(imgX[0] + imgX[1]), float(imgY[0] + imgY[1]), float(imgX[2]), float(imgY[2]), Level);        
    }
    else
    {
        // End:0xA7E
        if(bStretchWidth)
        {
            imgX[0] = int(img.Width / float(2));
            imgX[1] = 1;
            imgX[2] = int(img.Width - ((img.Width / float(2)) + float(1)));
            tgX[0] = imgX[0];
            tgX[1] = (tW - imgX[0]) - imgX[2];
            tgX[2] = imgX[2];
            tgY[0] = tH / 2;
            tgY[1] = tH - tgY[0];
            imgY[0] = tgY[0];
            imgY[1] = tgY[1];
            C.SetPos(tL, tT);
            C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[0]), 0.0000000, 0.0000000, float(imgX[0]), float(imgY[0]), Level);
            C.SetPos(tL + float(tgX[0]), tT);
            C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[0]), float(imgX[0]) + 0.5000000, 0.0000000, 0.0000000, float(imgY[0]), Level);
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT);
            C.DrawTileCache(img.Image, float(tgX[2]), float(tgY[0]), float(imgX[0] + imgX[1]), 0.0000000, float(imgX[2]), float(imgY[0]), Level);
            C.SetPos(tL, tT + float(tgY[0]));
            C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[1]), 0.0000000, img.Height - float(imgY[1]), float(imgX[0]), float(imgY[1]), Level);
            C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
            C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[1]), float(imgX[0]) + 0.5000000, img.Height - float(imgY[1]), 0.0000000, float(imgY[1]), Level);
            C.SetPos((tL + float(tgX[0])) + float(tgX[1]), tT + float(tgY[0]));
            C.DrawTileCache(img.Image, float(tgX[2]), float(tgY[1]), float(imgX[0] + imgX[1]), img.Height - float(imgY[1]), float(imgX[2]), float(imgY[1]), Level);            
        }
        else
        {
            // End:0xE7B
            if(bStretchHeight)
            {
                imgY[0] = int(img.Height / float(2));
                imgY[1] = 1;
                imgY[2] = int(img.Height - ((img.Height / float(2)) + float(1)));
                tgY[0] = imgY[0];
                tgY[1] = (tH - imgY[0]) - imgY[2];
                tgY[2] = imgY[2];
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                C.SetPos(tL, tT);
                C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[0]), 0.0000000, 0.0000000, float(imgX[0]), float(imgY[0]), Level);
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[1]), 0.0000000, float(imgY[0]) + 0.5000000, float(imgX[0]), 0.0000000, Level);
                C.SetPos(tL, (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[2]), 0.0000000, float(imgY[0] + imgY[1]), float(imgX[0]), float(imgY[2]), Level);
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[0]), img.Width - float(imgX[1]), 0.0000000, float(imgX[1]), float(imgY[0]), Level);
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[1]), img.Width - float(imgX[1]), float(imgY[0]) + 0.5000000, float(imgX[1]), 0.0000000, Level);
                C.SetPos(tL + float(tgX[0]), (tT + float(tgY[0])) + float(tgY[1]));
                C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[2]), img.Width - float(imgX[1]), float(imgY[0] + imgY[1]), float(imgX[1]), float(imgY[2]), Level);                
            }
            else
            {
                tgX[0] = tW / 2;
                tgX[1] = tW - tgX[0];
                tgY[0] = tH / 2;
                tgY[1] = tH - tgY[0];
                imgX[0] = tgX[0];
                imgX[1] = tgX[1];
                imgY[0] = tgY[0];
                imgY[1] = tgY[1];
                C.SetPos(tL, tT);
                C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[0]), 0.0000000, 0.0000000, float(imgX[0]), float(imgY[0]), Level);
                C.SetPos(tL + float(tgX[0]), tT);
                C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[0]), img.Width - float(imgX[1]), 0.0000000, float(imgX[1]), float(imgY[0]), Level);
                C.SetPos(tL, tT + float(tgY[0]));
                C.DrawTileCache(img.Image, float(tgX[0]), float(tgY[1]), 0.0000000, img.Height - float(imgY[1]), float(imgX[0]), float(imgY[1]), Level);
                C.SetPos(tL + float(tgX[0]), tT + float(tgY[0]));
                C.DrawTileCache(img.Image, float(tgX[1]), float(tgY[1]), img.Width - float(imgX[1]), img.Height - float(imgY[1]), float(imgX[1]), float(imgY[1]), Level);
            }
        }
    }
    //return;    
}

static function DrawImageStretchedHK(Canvas C, out Image img, float tL, float tT, float tR, float tB)
{
    local float X, Y, tW, tH, U, V;

    U = float(img.Image.MaterialUSize());
    V = float(img.Image.MaterialVSize());
    U = U - img.Width;
    V = V - img.Height;
    switch(img.DrawType)
    {
        // End:0xDB
        case 14:
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTileStretched(img.Image, img.Width + U, tH + V);
            // End:0x42D
            break;
        // End:0x174
        case 12:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + X, tT);
            C.DrawTileStretched(img.Image, img.Width + U, tH + V);
            // End:0x42D
            break;
        // End:0x213
        case 13:
            tW = tR - tL;
            tH = tB - tT;
            X = tW - img.Width;
            C.SetPos(tL + (X / float(2)), tT);
            C.DrawTileStretched(img.Image, img.Width + U, tH + V);
            // End:0x42D
            break;
        // End:0x27C
        case 9:
            tW = tR - tL;
            C.SetPos(tL, tT);
            C.DrawTileStretched(img.Image, tW + U, img.Height + V);
            // End:0x42D
            break;
        // End:0x315
        case 11:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + Y);
            C.DrawTileStretched(img.Image, tW + U, img.Height + V);
            // End:0x42D
            break;
        // End:0x3B4
        case 10:
            tW = tR - tL;
            tH = tB - tT;
            Y = tH - img.Height;
            C.SetPos(tL, tT + (Y / float(2)));
            C.DrawTileStretched(img.Image, tW + U, img.Height + V);
            // End:0x42D
            break;
        // End:0x42A
        case 15:
            tW = tR - tL;
            tH = tB - tT;
            C.SetPos(tL, tT);
            C.DrawTileStretched(img.Image, tW + U, tH + V);
            // End:0x42D
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static function SplitTextBounds(Canvas C, out array<string> tarray, string Text, int FontSize, float clientWidth)
{
    local int i, j, Count;
    local string Temp;
    local float W, htt;

    // End:0x1A
    if(C == none)
    {
        tarray[0] = Text;
        return;
    }
    Count = 0;
    j = 0;
    i = 0;
    J0x2F:

    // End:0xD1 [Loop If]
    if(i < Len(Text))
    {
        Temp = Mid(Text, j, i - j);
        C.BtrTextSize(Temp, FontSize, W, htt);
        // End:0xC7
        if(clientWidth < W)
        {
            tarray[Count++] = Mid(Text, j, (i - j) - 1);
            j = i - 1;
        }
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    Temp = Mid(Text, j);
    // End:0x102
    if(Temp != "")
    {
        tarray[Count++] = Temp;
    }
    //return;    
}

static function bool HasString(string Check, string word)
{
    local int i, sum;
    local array<string> tarray;

    Split(Check, word, tarray);
    sum = 0;
    i = 0;
    J0x1F:

    // End:0x4D [Loop If]
    if(i < tarray.Length)
    {
        sum += Len(tarray[i]);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    return sum != Len(word);
    //return;    
}

static function FloatBox MakeFloatBox(float X1, float Y1, float X2, float Y2)
{
    local FloatBox fb;

    fb.X1 = X1;
    fb.Y1 = Y1;
    fb.X2 = X2;
    fb.Y2 = Y2;
    return fb;
    //return;    
}

static function FloatBox MakeEmptyBox()
{
    return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    //return;    
}

static function FloatBox MakeResizeBox(FloatBox inBox, int resizeX, optional int resizeY)
{
    // End:0x16
    if(resizeY == 0)
    {
        resizeY = resizeX;
    }
    inBox.X1 -= float(resizeX);
    inBox.X2 += float(resizeX);
    inBox.Y1 -= float(resizeY);
    inBox.Y2 += float(resizeY);
    return inBox;
    //return;    
}

static function string FormatString(string original, optional string arg0, optional string arg1, optional string arg2, optional string arg3, optional string arg4, optional string arg5, optional string arg6, optional string arg7, optional string arg8)
{
    local int arglen;
    local array<string> args;

    args.Length = 9;
    args[0] = arg0;
    args[1] = arg1;
    args[2] = arg2;
    args[3] = arg3;
    args[4] = arg4;
    args[5] = arg5;
    args[6] = arg6;
    args[7] = arg7;
    args[8] = arg8;
    return Class'Engine_Decompressed.BTCustomDrawHK'.static.FormatStringArray(original, args);
    //return;    
}

static function string FormatStringArray(string original, array<string> args)
{
    local string ret;
    local int i;

    ret = original;
    i = 0;
    J0x12:

    // End:0x50 [Loop If]
    if(i < args.Length)
    {
        ret = Repl(ret, "%" $ string(i), args[i]);
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return ret;
    //return;    
}

static function bool SplitString(string original, out array<string> Temp, int ExceptDivideMode, string divider1, optional string divider2, optional string divider3)
{
    local int i, j, k;
    local array<string> Divider, Src, Dest;

    Divider.Length = Divider.Length + 1;
    Divider[Divider.Length - 1] = divider1;
    // End:0x56
    if(divider2 != "")
    {
        Divider.Length = Divider.Length + 1;
        Divider[Divider.Length - 1] = divider2;
    }
    // End:0x87
    if(divider3 != "")
    {
        Divider.Length = Divider.Length + 1;
        Divider[Divider.Length - 1] = divider3;
    }
    Temp.Length = 1;
    Temp[0] = original;
    i = 0;
    J0xA3:

    // End:0x349 [Loop If]
    if(i < Divider.Length)
    {
        Src.Length = Temp.Length;
        j = 0;
        J0xC7:

        // End:0xF8 [Loop If]
        if(j < Temp.Length)
        {
            Src[j] = Temp[j];
            j++;
            // [Loop Continue]
            goto J0xC7;
        }
        Temp.Length = 0;
        j = 0;
        J0x107:

        // End:0x33F [Loop If]
        if(j < Src.Length)
        {
            Split(Src[j], Divider[i], Dest);
            k = 0;
            J0x13B:

            // End:0x335 [Loop If]
            if(k < Dest.Length)
            {
                Temp.Length = Temp.Length + 1;
                // End:0x184
                if(ExceptDivideMode == 0)
                {
                    Temp[Temp.Length - 1] = Dest[k];
                    // [Explicit Continue]
                    goto J0x32B;
                }
                // End:0x1C2
                if((k == 0) && k == (Dest.Length - 1))
                {
                    Temp[Temp.Length - 1] = Dest[k];
                    // [Explicit Continue]
                    goto J0x32B;
                }
                // End:0x222
                if(k == 0)
                {
                    // End:0x1F7
                    if(ExceptDivideMode == 2)
                    {
                        Temp[Temp.Length - 1] = Dest[k];                        
                    }
                    else
                    {
                        Temp[Temp.Length - 1] = Dest[k] $ Divider[i];
                    }
                    // [Explicit Continue]
                    goto J0x32B;
                }
                // End:0x289
                if(k == (Dest.Length - 1))
                {
                    // End:0x25E
                    if(ExceptDivideMode == 1)
                    {
                        Temp[Temp.Length - 1] = Dest[k];                        
                    }
                    else
                    {
                        Temp[Temp.Length - 1] = Divider[i] $ Dest[k];
                    }
                    // [Explicit Continue]
                    goto J0x32B;
                }
                // End:0x2BF
                if(ExceptDivideMode == 1)
                {
                    Temp[Temp.Length - 1] = Dest[k] $ Divider[i];
                    // [Explicit Continue]
                    goto J0x32B;
                }
                // End:0x2F6
                if(ExceptDivideMode == 2)
                {
                    Temp[Temp.Length - 1] = Divider[i] $ Dest[k];
                    // [Explicit Continue]
                    goto J0x32B;
                }
                Temp[Temp.Length - 1] = (Divider[i] $ Dest[k]) $ Divider[i];
                J0x32B:

                k++;
                // [Loop Continue]
                goto J0x13B;
            }
            j++;
            // [Loop Continue]
            goto J0x107;
        }
        i++;
        // [Loop Continue]
        goto J0xA3;
    }
    return true;
    //return;    
}

static function array<string> FormatStringDiviedArray(string original, array<string> args)
{
    local string ret;
    local int i, j;
    local array<string> outRet, arrRet;

    ret = original;
    i = 0;
    J0x12:

    // End:0xF3 [Loop If]
    if(i < args.Length)
    {
        Split(ret, "%" $ string(i), arrRet);
        // End:0x6F
        if(arrRet[0] != "")
        {
            outRet.Length = outRet.Length + 1;
            outRet[outRet.Length - 1] = arrRet[0];
        }
        // End:0xAC
        if(args[i] != "")
        {
            outRet.Length = outRet.Length + 1;
            outRet[outRet.Length - 1] = args[i];
        }
        ret = "";
        j = 1;
        J0xBB:

        // End:0xE9 [Loop If]
        if(j < arrRet.Length)
        {
            ret $= arrRet[j];
            j++;
            // [Loop Continue]
            goto J0xBB;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    // End:0x124
    if(ret != "")
    {
        outRet.Length = outRet.Length + 1;
        outRet[outRet.Length - 1] = ret;
    }
    return outRet;
    //return;    
}

static function IntClass MakeIntClass(int A)
{
    local IntClass ic;

    ic = new Class'Engine_Decompressed.IntClass';
    ic.Index = A;
    return ic;
    //return;    
}

static function int GetRatioIndex(int Width, int Height)
{
    local float ScreenRatio;

    ScreenRatio = float(Width) / float(Height);
    // End:0x2A
    if(ScreenRatio == 1.2500000)
    {
        return 1;        
    }
    else
    {
        // End:0x4F
        if((ScreenRatio <= 1.3400000) && ScreenRatio >= 1.3300000)
        {
            return 0;            
        }
        else
        {
            // End:0x75
            if((ScreenRatio <= 1.7800000) && ScreenRatio >= 1.7700000)
            {
                return 2;                
            }
            else
            {
                // End:0x8A
                if(ScreenRatio == 1.6000000)
                {
                    return 3;                    
                }
                else
                {
                    return 4;
                }
            }
        }
    }
    //return;    
}

static function bool IsInFloatBox(FloatBox Box, float X, float Y)
{
    return ((X >= Box.X1) && X <= Box.X2) && (Y >= Box.Y1) && Y <= Box.Y2;
    //return;    
}

static function bool IsInBox(float boxx1, float boxx2, float boxy1, float boxy2, float X, float Y)
{
    return ((X >= boxx1) && X <= boxx2) && (Y >= boxy1) && Y <= boxy2;
    //return;    
}

static function string GetNumberString(int Num, optional bool fixedsize, optional int fixedlen)
{
    local string ret;
    local int retlen;

    ret = string(Num);
    // End:0x4C
    if(fixedsize)
    {
        retlen = Len(ret);
        J0x23:

        // End:0x4C [Loop If]
        if(retlen < fixedlen)
        {
            ret = "0" $ ret;
            retlen++;
            // [Loop Continue]
            goto J0x23;
        }
    }
    return ret;
    //return;    
}

static function string Get_0x0A_RemoveString(string S)
{
    local string ret, ch;
    local int i;

    i = 0;
    J0x07:

    // End:0x51 [Loop If]
    if(i < Len(S))
    {
        ch = Mid(S, i, 1);
        // End:0x47
        if(Asc(ch) != 10)
        {
            ret $= ch;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return ret;
    //return;    
}
