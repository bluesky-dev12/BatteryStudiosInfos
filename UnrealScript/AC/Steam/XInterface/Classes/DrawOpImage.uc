/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\DrawOpImage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
class DrawOpImage extends DrawOpBase;

var Material Image;
var byte ImageStyle;
var float SubX;
var float SubY;
var float SubXL;
var float SubYL;
var deprecated bool bStretch;

function Draw(Canvas Canvas)
{
    local float X, Y, XL, YL, U, V,
	    UL, VL;

    // End:0x0d
    if(Image == none)
    {
        return;
    }
    Canvas.Style = RenderStyle;
    Canvas.DrawColor = DrawColor;
    X = Lft * float(Canvas.SizeX);
    Y = Top * float(Canvas.SizeY);
    // End:0x96
    if(width < float(0))
    {
        XL = float(Image.MaterialUSize());
    }
    // End:0xb3
    else
    {
        XL = width * float(Canvas.SizeX);
    }
    // End:0xda
    if(Height < float(0))
    {
        YL = float(Image.MaterialVSize());
    }
    // End:0xf7
    else
    {
        YL = Height * float(Canvas.SizeY);
    }
    U = FMax(0.0, SubX);
    V = FMax(0.0, SubY);
    // End:0x142
    if(SubXL < float(0))
    {
        UL = float(Image.MaterialUSize());
    }
    // End:0x14d
    else
    {
        UL = SubXL;
    }
    // End:0x174
    if(SubYL < float(0))
    {
        VL = float(Image.MaterialVSize());
    }
    // End:0x17f
    else
    {
        VL = SubYL;
    }
    // End:0x1b3
    if(Justification == 1)
    {
        X -= XL / float(2);
        Y -= YL / float(2);
    }
    // End:0x1d9
    else
    {
        // End:0x1d9
        if(Justification == 2)
        {
            X -= XL;
            Y -= YL;
        }
    }
    Canvas.SetPos(X, Y);
    switch(ImageStyle)
    {
        // End:0x233
        case 0:
            Canvas.DrawTile(Image, XL, YL, U, V, UL, VL);
            // End:0x293
            break;
        // End:0x259
        case 1:
            Canvas.DrawTileStretched(Image, XL, YL);
            // End:0x293
            break;
        // End:0x290
        case 2:
            Canvas.DrawTileClipped(Image, XL, YL, U, V, UL, VL);
            // End:0x293
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    SubX=-1.0
    SubY=-1.0
    SubXL=-1.0
    SubYL=-1.0
}