/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTMultiLabel.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:3
 *
 *******************************************************************************/
class BTMultiLabel extends GUIComponent
    editinlinenew
    instanced;

var string Caption;
var int FontSize;
var Color TextColor;
var string LastCaption;
var int LastFontSize;
var int LastAW;
var float XL;
var float YL;
var array<string> Lines;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
}

function array<string> SplitIntoMultiLines(Canvas C, string S, int fSize, int width)
{
    local int lpStart, lpLen;
    local array<string> Result;
    local string piece;
    local float x_l, y_l;
    local bool didSplit;

    Log("SplitIntoMultiLines " $ "s=" $ S $ " fSize=" $ string(fSize) $ " width=" $ string(width));
    lpStart = 0;
    J0x54:
    // End:0x182 [While If]
    if(lpStart < Len(S))
    {
        didSplit = false;
        lpLen = 1;
        J0x74:
        // End:0x149 [While If]
        if(lpLen <= Len(S) - lpStart)
        {
            piece = Mid(S, lpStart, lpLen);
            C.BtrTextSize(piece, fSize, x_l, y_l);
            // End:0x13f
            if(x_l > float(width))
            {
                // End:0xf8
                if(lpLen == 1)
                {
                    piece = Mid(S, lpStart, 1);
                }
                // End:0x112
                else
                {
                    piece = Mid(S, lpStart, lpLen - 1);
                }
                Result[Result.Length] = piece;
                lpStart += lpLen - 2;
                didSplit = true;
            }
            // End:0x149
            else
            {
                ++ lpLen;
                // This is an implied JumpToken; Continue!
                goto J0x74;
            }
        }
        // End:0x178
        if(!didSplit)
        {
            Log("holy~molly~");
            Result[Result.Length] = piece;
        }
        // End:0x182
        else
        {
            ++ lpStart;
            // This is an implied JumpToken; Continue!
            goto J0x54;
        }
    }
    return Result;
}

function bool InternalOnDraw(Canvas C)
{
    local int lp1;
    local float X1, Y1;

    // End:0x72
    if(Caption != LastCaption || FontSize != LastFontSize || float(LastAW) != ActualWidth())
    {
        LastCaption = Caption;
        LastFontSize = FontSize;
        LastAW = int(ActualWidth());
        Lines = SplitIntoMultiLines(C, Caption, FontSize, int(ActualWidth()));
    }
    X1 = ActualLeft();
    Y1 = ActualTop();
    C.DrawColor = TextColor;
    lp1 = 0;
    J0x9f:
    // End:0x12f [While If]
    if(lp1 < Lines.Length)
    {
        C.BtrTextSize(Lines[lp1], FontSize, XL, YL);
        C.BtrDrawTextJustified(Lines[lp1], 0, X1, Y1, X1 + ActualWidth(), Y1 + YL, FontSize);
        Y1 += YL;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x9f;
    }
    return false;
}

defaultproperties
{
    TextColor=(R=255,G=255,B=255,A=255)
    LastFontSize=-1
    OnDraw=InternalOnDraw
}