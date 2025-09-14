/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROMapInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *
 *******************************************************************************/
class BTROMapInfoHK extends RenderObject;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontMapNameSize;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontColor;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontShadowColor;
var Image BackgroundImage;
var Image MapImage;
var Image ImageSupply[3];
var string strMapName;

function Init()
{
    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_3;
    MapImage = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    ImageSupply[0] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
    ImageSupply[1] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
    ImageSupply[2] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
}

function SetData(string MapName, Material MapImg, Material imgSupply0, Material imgSupply1, Material imgSupply2)
{
    strMapName = MapName;
    MapImage.Image = MapImg;
    ImageSupply[0].Image = imgSupply0;
    ImageSupply[1].Image = imgSupply1;
    ImageSupply[2].Image = imgSupply2;
}

function bool Render(Canvas C, optional float Delta)
{
    local float X, Y, X2, Y2;

    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    X = AWinPos.X1;
    Y = AWinPos.Y1;
    X2 = AWinPos.X2;
    Y2 = AWinPos.Y2;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X, Y, X2, Y2);
    class'BTCustomDrawHK'.static.DrawImage(C, MapImage, X + float(30), Y + float(30), X2 - float(30), Y2 - float(30));
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[0], X2 - float(30) - float(5) - float(24), Y + float(30) + float(5), X2 - float(30) - float(5), Y + float(30) + float(5) + float(24));
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[1], X2 - float(30) - float(5 * 2) - float(24 * 2), Y + float(30) + float(5), X2 - float(30) - float(5 * 2) - float(24), Y + float(30) + float(5) + float(24));
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[2], X2 - float(30) - float(5 * 3) - float(24 * 3), Y + float(30) + float(5), X2 - float(30) - float(5 * 3) - float(24 * 2), Y + float(30) + float(5) + float(24));
    C.DrawColor = FontColor;
    class'BTCustomDrawHK'.static.DrawString(C, strMapName, 0, float(FontMapNameSize), X + float(40), Y + float(35), X2, Y2);
    return true;
}

defaultproperties
{
    FontMapNameSize=10
    FontColor=(R=229,G=229,B=229,A=255)
    FontShadowColor=(R=0,G=0,B=0,A=100)
}