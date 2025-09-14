/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\DrawOpText.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:1
 *
 *******************************************************************************/
class DrawOpText extends DrawOpBase;

var localized string Text;
var string FontName;
var int MaxLines;
var bool bWrapText;
var byte VertAlign;

function Draw(Canvas Canvas)
{
    local Font fnt;
    local int i;
    local float X, Y, XL, YL, TextHeight, StrHeight,
	    StrWidth;

    local array<string> Lines;

    super.Draw(Canvas);
    // End:0x57
    if(FontName != "")
    {
        fnt = GetFont(FontName, float(Canvas.SizeX));
        // End:0x57
        if(fnt != none)
        {
            Canvas.Font = fnt;
        }
    }
    Canvas.FontScaleX = 0.90;
    Canvas.FontScaleY = 0.90;
    X = Lft * float(Canvas.SizeX);
    Y = Top * float(Canvas.SizeY);
    XL = width * float(Canvas.SizeX);
    YL = Height * float(Canvas.SizeY);
    Canvas.StrLen(Text, StrWidth, StrHeight);
    // End:0x13b
    if(bWrapText)
    {
        Canvas.WrapStringToArray(Text, Lines, XL, "|");
    }
    // End:0x148
    else
    {
        Lines[0] = Text;
    }
    TextHeight = StrHeight * float(Lines.Length);
    switch(VertAlign)
    {
        // End:0x18b
        case 1:
            Y = Y + YL - TextHeight / float(2);
            // End:0x1af
            break;
        // End:0x1ac
        case 2:
            Y = Y + YL - TextHeight;
            // End:0x1af
            break;
        // End:0xffff
        default:
            i = 0;
            J0x1b6:
            // End:0x2a3 [While If]
            if(i < Lines.Length)
            {
                Canvas.StrLen(Lines[i], StrWidth, StrHeight);
                switch(Justification)
                {
                    // End:0x20f
                    case 0:
                        Canvas.SetPos(X, Y);
                        // End:0x276
                        break;
                    // End:0x244
                    case 1:
                        Canvas.SetPos(X + XL - StrWidth / float(2), Y);
                        // End:0x276
                        break;
                    // End:0x273
                    case 2:
                        Canvas.SetPos(X + XL - StrWidth, Y);
                        // End:0x276
                        break;
                    // End:0xffff
                    default:
                        Canvas.DrawText(Lines[i]);
                        Y += StrHeight;
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1b6;
                    }
}

defaultproperties
{
    FontName="XInterface.UT2DefaultFont"
    MaxLines=99
    bWrapText=true
}