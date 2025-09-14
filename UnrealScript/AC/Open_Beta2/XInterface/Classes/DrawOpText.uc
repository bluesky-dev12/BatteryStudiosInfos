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
    Canvas.FontScaleX = 0.9000000;
    Canvas.FontScaleY = 0.9000000;
    X = Lft * float(Canvas.SizeX);
    Y = Top * float(Canvas.SizeY);
    XL = width * float(Canvas.SizeX);
    YL = Height * float(Canvas.SizeY);
    Canvas.StrLen(Text, StrWidth, StrHeight);
    // End:0x13B
    if(bWrapText)
    {
        Canvas.WrapStringToArray(Text, Lines, XL, "|");        
    }
    else
    {
        Lines[0] = Text;
    }
    TextHeight = StrHeight * float(Lines.Length);
    switch(VertAlign)
    {
        // End:0x18B
        case 1:
            Y = Y + ((YL - TextHeight) / float(2));
            // End:0x1AF
            break;
        // End:0x1AC
        case 2:
            Y = (Y + YL) - TextHeight;
            // End:0x1AF
            break;
        // End:0xFFFF
        default:
            break;
    }
    i = 0;
    J0x1B6:

    // End:0x2A3 [Loop If]
    if(i < Lines.Length)
    {
        Canvas.StrLen(Lines[i], StrWidth, StrHeight);
        switch(Justification)
        {
            // End:0x20F
            case 0:
                Canvas.SetPos(X, Y);
                // End:0x276
                break;
            // End:0x244
            case 1:
                Canvas.SetPos(X + ((XL - StrWidth) / float(2)), Y);
                // End:0x276
                break;
            // End:0x273
            case 2:
                Canvas.SetPos((X + XL) - StrWidth, Y);
                // End:0x276
                break;
            // End:0xFFFF
            default:
                break;
        }
        Canvas.DrawText(Lines[i]);
        Y += StrHeight;
        i++;
        // [Loop Continue]
        goto J0x1B6;
    }
    //return;    
}

defaultproperties
{
    FontName="XInterface.UT2DefaultFont"
    MaxLines=99
    bWrapText=true
}