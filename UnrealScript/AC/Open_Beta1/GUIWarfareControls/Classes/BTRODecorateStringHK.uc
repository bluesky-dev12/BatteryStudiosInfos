class BTRODecorateStringHK extends RenderObject;

var Text OriginalString;
var array<string> TargetString;
var Image BackgroundImg;
var int InternalPadding[4];
var float TextHeight;
var bool bAutoWidth;
var int nAutoWidth;

function Init()
{
    BackgroundImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    OriginalString = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 4, "");
    //return;    
}

function SetData(string str)
{
    OriginalString.Text = str;
    bNeedUpdate = true;
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    local int i, SpreadHeight, strIdx;
    local float W, dw;
    local string divStrL, divStr;
    local int Space;
    local array<string> StringArray;

    // End:0x57
    if(AWinPos.X2 > float(1024))
    {
        Space = int(AWinPos.X2 - float(1024));
        AWinPos.X1 -= float(Space);
        AWinPos.X2 -= float(Space);
    }
    // End:0xAE
    if(AWinPos.Y2 > float(768))
    {
        Space = int(AWinPos.Y2 - float(768));
        AWinPos.Y1 -= float(Space);
        AWinPos.Y2 -= float(Space);
    }
    bNeedUpdate = false;
    TargetString.Length = 0;
    dw = (AWinPos.X2 - AWinPos.X1) - float(InternalPadding[0] + InternalPadding[2]);
    Class'Engine.BTCustomDrawHK'.static.SplitString(OriginalString.Text, StringArray, 0, "<P>");
    strIdx = 0;
    J0x11A:

    // End:0x253 [Loop If]
    if(strIdx < StringArray.Length)
    {
        divStr = StringArray[strIdx];
        i = 0;
        J0x142:

        // End:0x217 [Loop If]
        if(i <= Len(divStr))
        {
            divStrL = Left(divStr, i);
            C.BtrTextSize(divStrL, OriginalString.FontSize, W, TextHeight);
            // End:0x1B3
            if(bAutoWidth)
            {
                // End:0x1B0
                if(W > dw)
                {
                    dw = W;
                }
                // [Explicit Continue]
                goto J0x20D;
            }
            // End:0x20D
            if(W > dw)
            {
                TargetString.Length = TargetString.Length + 1;
                TargetString[TargetString.Length - 1] = Left(divStr, i - 1);
                divStr = Mid(divStr, i - 1);
                i = 1;
            }
            J0x20D:

            i++;
            // [Loop Continue]
            goto J0x142;
        }
        // End:0x249
        if(Len(divStr) > 0)
        {
            TargetString.Length = TargetString.Length + 1;
            TargetString[TargetString.Length - 1] = divStr;
        }
        ++strIdx;
        // [Loop Continue]
        goto J0x11A;
    }
    SpreadHeight = int(((AWinPos.Y1 + (float(TargetString.Length) * TextHeight)) + float(InternalPadding[1])) + float(InternalPadding[3]));
    // End:0x2B5
    if(AWinPos.Y2 < float(SpreadHeight))
    {
        AWinPos.Y2 = float(SpreadHeight);
    }
    // End:0x348
    if(bAutoWidth)
    {
        AWinPos.X2 = ((AWinPos.X1 + dw) + float(InternalPadding[0])) + float(InternalPadding[2]);
        // End:0x348
        if(AWinPos.X2 > float(1024))
        {
            Space = int(AWinPos.X2 - float(1024));
            AWinPos.X1 -= float(Space);
            AWinPos.X2 -= float(Space);
        }
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int i;
    local float CenterOrderUp;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    // End:0x22
    if(bNeedUpdate)
    {
        Update(C);
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0x15F
    if((int(OriginalString.FontDrawType) >= int(0)) && int(OriginalString.FontDrawType) <= int(2))
    {
        i = 0;
        J0xA7:

        // End:0x15C [Loop If]
        if(i < TargetString.Length)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), (AWinPos.Y1 + (TextHeight * float(i))) + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), AWinPos.Y2 - float(InternalPadding[3]));
            i++;
            // [Loop Continue]
            goto J0xA7;
        }        
    }
    else
    {
        // End:0x2B6
        if((int(OriginalString.FontDrawType) >= int(3)) && int(OriginalString.FontDrawType) <= int(5))
        {
            // End:0x1CE
            if(TargetString.Length > 1)
            {
                CenterOrderUp = float(TargetString.Length / 2);
                // End:0x1CB
                if((float(TargetString.Length) % float(2)) == float(0))
                {
                    CenterOrderUp -= 0.5000000;
                }                
            }
            else
            {
                CenterOrderUp = 0.0000000;
            }
            i = 0;
            J0x1E0:

            // End:0x2B3 [Loop If]
            if(i < TargetString.Length)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), (AWinPos.Y1 + (TextHeight * (float(i) - CenterOrderUp))) + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), (AWinPos.Y2 + (TextHeight * (float(i) - CenterOrderUp))) - float(InternalPadding[3]));
                i++;
                // [Loop Continue]
                goto J0x1E0;
            }            
        }
        else
        {
            // End:0x3A9
            if((int(OriginalString.FontDrawType) >= int(6)) && int(OriginalString.FontDrawType) <= int(8))
            {
                i = 0;
                J0x2E9:

                // End:0x3A9 [Loop If]
                if(i < TargetString.Length)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), AWinPos.Y1 + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), (AWinPos.Y2 - (TextHeight * float((TargetString.Length - i) - 1))) - float(InternalPadding[3]));
                    i++;
                    // [Loop Continue]
                    goto J0x2E9;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    InternalPadding[0]=5
    InternalPadding[1]=2
    InternalPadding[2]=5
    InternalPadding[3]=2
}