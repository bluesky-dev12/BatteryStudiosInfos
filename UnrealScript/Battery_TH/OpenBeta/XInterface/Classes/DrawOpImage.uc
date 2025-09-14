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

    // End:0x0D
    if(Image == none)
    {
        return;
    }
    Canvas.Style = RenderStyle;
    Canvas.DrawColor = DrawColor;
    X = Lft * float(Canvas.SizeX);
    Y = Top * float(Canvas.SizeY);
    // End:0x96
    if(Width < float(0))
    {
        XL = float(Image.MaterialUSize());        
    }
    else
    {
        XL = Width * float(Canvas.SizeX);
    }
    // End:0xDA
    if(Height < float(0))
    {
        YL = float(Image.MaterialVSize());        
    }
    else
    {
        YL = Height * float(Canvas.SizeY);
    }
    U = FMax(0.0000000, SubX);
    V = FMax(0.0000000, SubY);
    // End:0x142
    if(SubXL < float(0))
    {
        UL = float(Image.MaterialUSize());        
    }
    else
    {
        UL = SubXL;
    }
    // End:0x174
    if(SubYL < float(0))
    {
        VL = float(Image.MaterialVSize());        
    }
    else
    {
        VL = SubYL;
    }
    // End:0x1B3
    if(int(Justification) == 1)
    {
        X -= (XL / float(2));
        Y -= (YL / float(2));        
    }
    else
    {
        // End:0x1D9
        if(int(Justification) == 2)
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    SubX=-1.0000000
    SubY=-1.0000000
    SubXL=-1.0000000
    SubYL=-1.0000000
}