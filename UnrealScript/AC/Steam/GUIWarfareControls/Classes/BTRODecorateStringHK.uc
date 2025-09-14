/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTRODecorateStringHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class BTRODecorateStringHK extends RenderObject
    dependson(RenderObject);

var Text OriginalString;
var array<string> TargetString;
var Image BackgroundImg;
var int InternalPadding[4];
var float TextHeight;
var bool bAutoWidth;
var int nAutoWidth;

function Init()
{
    BackgroundImg = class'BTUIResourcePoolHK'.default.panel_1;
    OriginalString = class'BTCustomDrawHK'.static.MakeText(10, 4, "");
}

function SetData(string str)
{
    OriginalString.Text = str;
    bNeedUpdate = true;
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
    // End:0xae
    if(AWinPos.Y2 > float(768))
    {
        Space = int(AWinPos.Y2 - float(768));
        AWinPos.Y1 -= float(Space);
        AWinPos.Y2 -= float(Space);
    }
    bNeedUpdate = false;
    TargetString.Length = 0;
    dw = AWinPos.X2 - AWinPos.X1 - float(InternalPadding[0] + InternalPadding[2]);
    class'BTCustomDrawHK'.static.SplitString(OriginalString.Text, StringArray, 0, "<P>");
    strIdx = 0;
    J0x11a:
    // End:0x253 [While If]
    if(strIdx < StringArray.Length)
    {
        divStr = StringArray[strIdx];
        i = 0;
        J0x142:
        // End:0x217 [While If]
        if(i <= Len(divStr))
        {
            divStrL = Left(divStr, i);
            C.BtrTextSize(divStrL, OriginalString.FontSize, W, TextHeight);
            // End:0x1b3
            if(bAutoWidth)
            {
                // End:0x1b0
                if(W > dw)
                {
                    dw = W;
                }
            }
            // End:0x20d
            else
            {
                // End:0x20d
                if(W > dw)
                {
                    TargetString.Length = TargetString.Length + 1;
                    TargetString[TargetString.Length - 1] = Left(divStr, i - 1);
                    divStr = Mid(divStr, i - 1);
                    i = 1;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x142;
        }
        // End:0x249
        if(Len(divStr) > 0)
        {
            TargetString.Length = TargetString.Length + 1;
            TargetString[TargetString.Length - 1] = divStr;
        }
        ++ strIdx;
        // This is an implied JumpToken; Continue!
        goto J0x11a;
    }
    SpreadHeight = int(AWinPos.Y1 + float(TargetString.Length) * TextHeight + float(InternalPadding[1]) + float(InternalPadding[3]));
    // End:0x2b5
    if(AWinPos.Y2 < float(SpreadHeight))
    {
        AWinPos.Y2 = float(SpreadHeight);
    }
    // End:0x348
    if(bAutoWidth)
    {
        AWinPos.X2 = AWinPos.X1 + dw + float(InternalPadding[0]) + float(InternalPadding[2]);
        // End:0x348
        if(AWinPos.X2 > float(1024))
        {
            Space = int(AWinPos.X2 - float(1024));
            AWinPos.X1 -= float(Space);
            AWinPos.X2 -= float(Space);
        }
    }
}

function bool Render(Canvas C, optional float Delta)
{
    local int i;
    local float CenterOrderUp;

    // End:0x0e
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
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0x15f
    if(OriginalString.FontDrawType >= 0 && OriginalString.FontDrawType <= 2)
    {
        i = 0;
        J0xa7:
        // End:0x15c [While If]
        if(i < TargetString.Length)
        {
            class'BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), AWinPos.Y1 + TextHeight * float(i) + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), AWinPos.Y2 - float(InternalPadding[3]));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xa7;
        }
    }
    // End:0x3a9
    else
    {
        // End:0x2b6
        if(OriginalString.FontDrawType >= 3 && OriginalString.FontDrawType <= 5)
        {
            // End:0x1ce
            if(TargetString.Length > 1)
            {
                CenterOrderUp = float(TargetString.Length / 2);
                // End:0x1cb
                if(float(TargetString.Length) % float(2) == float(0))
                {
                    CenterOrderUp -= 0.50;
                }
            }
            // End:0x1d9
            else
            {
                CenterOrderUp = 0.0;
            }
            i = 0;
            J0x1e0:
            // End:0x2b3 [While If]
            if(i < TargetString.Length)
            {
                class'BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), AWinPos.Y1 + TextHeight * float(i) - CenterOrderUp + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), AWinPos.Y2 + TextHeight * float(i) - CenterOrderUp - float(InternalPadding[3]));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1e0;
            }
        }
        // End:0x3a9
        else
        {
            // End:0x3a9
            if(OriginalString.FontDrawType >= 6 && OriginalString.FontDrawType <= 8)
            {
                i = 0;
                J0x2e9:
                // End:0x3a9 [While If]
                if(i < TargetString.Length)
                {
                    class'BTCustomDrawHK'.static.DrawString(C, TargetString[i], OriginalString.FontDrawType, float(OriginalString.FontSize), AWinPos.X1 + float(InternalPadding[0]), AWinPos.Y1 + float(InternalPadding[1]), AWinPos.X2 - float(InternalPadding[2]), AWinPos.Y2 - TextHeight * float(TargetString.Length - i - 1) - float(InternalPadding[3]));
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x2e9;
                }
            }
        }
    }
}

defaultproperties
{
    InternalPadding[0]=5
    InternalPadding[1]=2
    InternalPadding[2]=5
    InternalPadding[3]=2
}