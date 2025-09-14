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
    //return;    
}

function array<string> SplitIntoMultiLines(Canvas C, string S, int fSize, int width)
{
    local int lpStart, lpLen;
    local array<string> Result;
    local string piece;
    local float x_l, y_l;
    local bool didSplit;

    Log(((((("SplitIntoMultiLines " $ "s=") $ S) $ " fSize=") $ string(fSize)) $ " width=") $ string(width));
    lpStart = 0;
    J0x54:

    // End:0x182 [Loop If]
    if(lpStart < Len(S))
    {
        didSplit = false;
        lpLen = 1;
        J0x74:

        // End:0x149 [Loop If]
        if(lpLen <= (Len(S) - lpStart))
        {
            piece = Mid(S, lpStart, lpLen);
            C.BtrTextSize(piece, fSize, x_l, y_l);
            // End:0x13F
            if(x_l > float(width))
            {
                // End:0xF8
                if(lpLen == 1)
                {
                    piece = Mid(S, lpStart, 1);                    
                }
                else
                {
                    piece = Mid(S, lpStart, lpLen - 1);
                }
                Result[Result.Length] = piece;
                lpStart += (lpLen - 2);
                didSplit = true;
                // [Explicit Break]
                goto J0x149;
            }
            lpLen++;
            // [Loop Continue]
            goto J0x74;
        }
        J0x149:

        // End:0x178
        if(!didSplit)
        {
            Log("holy~molly~");
            Result[Result.Length] = piece;
            // [Explicit Break]
            goto J0x182;
        }
        lpStart++;
        // [Loop Continue]
        goto J0x54;
    }
    J0x182:

    return Result;
    //return;    
}

function bool InternalOnDraw(Canvas C)
{
    local int lp1;
    local float X1, Y1;

    // End:0x72
    if(((Caption != LastCaption) || FontSize != LastFontSize) || float(LastAW) != ActualWidth())
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
    J0x9F:

    // End:0x12F [Loop If]
    if(lp1 < Lines.Length)
    {
        C.BtrTextSize(Lines[lp1], FontSize, XL, YL);
        C.BtrDrawTextJustified(Lines[lp1], 0, X1, Y1, X1 + ActualWidth(), Y1 + YL, FontSize);
        Y1 += YL;
        lp1++;
        // [Loop Continue]
        goto J0x9F;
    }
    return false;
    //return;    
}

defaultproperties
{
    TextColor=(R=255,G=255,B=255,A=255)
    LastFontSize=-1
    OnDraw=BTMultiLabel.InternalOnDraw
}