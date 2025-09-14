/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Canvas.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:32
 *	Functions:65
 *
 *******************************************************************************/
class Canvas extends Object
    dependson(Texture)
    native
    noexport;

var Font Font;
var float FontScaleX;
var float FontScaleY;
var float SpaceX;
var float SpaceY;
var float OrgX;
var float OrgY;
var float ClipX;
var float ClipY;
var float CurX;
var float CurY;
var float Z;
var byte Style;
var float CurYL;
var Color DrawColor;
var Color DrawBackColor;
var bool bCenter;
var bool bNoSmooth;
var const int SizeX;
var const int SizeY;
var Plane ColorModulate;
var bool bForceAlpha;
var float ForcedAlpha;
var bool bRenderLevel;
var Font TinyFont;
var Font SmallFont;
var Font MedFont;
var string TinyFontName;
var string SmallFontName;
var string MedFontName;
var const Viewport Viewport;
var const transient pointer pCanvasUtil;

// Export UCanvas::execStrLen(FFrame&, void* const)
native(464) final function StrLen(coerce string String, out float XL, out float YL);
// Export UCanvas::execDrawText(FFrame&, void* const)
native(465) final function DrawText(coerce string Text, optional bool cR);
// Export UCanvas::execDrawTile(FFrame&, void* const)
native final function DrawTile(Material mat, float XL, float YL, float U, float V, float UL, float VL);
// Export UCanvas::execDrawActor(FFrame&, void* const)
native(467) final function DrawActor(Actor A, bool Wireframe, optional bool ClearZ, optional float DisplayFOV);
// Export UCanvas::execDrawTileClipped(FFrame&, void* const)
native(468) final function DrawTileClipped(Material mat, float XL, float YL, float U, float V, float UL, float VL);
// Export UCanvas::execDrawTextClipped(FFrame&, void* const)
native(469) final function DrawTextClipped(coerce string Text, optional bool bCheckHotKey);
// Export UCanvas::execTextSize(FFrame&, void* const)
native(470) final function TextSize(coerce string String, out float XL, out float YL);
// Export UCanvas::execDrawPortal(FFrame&, void* const)
native(480) final function DrawPortal(int X, int Y, int width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ);
// Export UCanvas::execWorldToScreen(FFrame&, void* const)
native final function Vector WorldToScreen(Vector WorldLoc);
// Export UCanvas::execGetCameraLocation(FFrame&, void* const)
native final function GetCameraLocation(out Vector CameraLocation, out Rotator CameraRotation);
// Export UCanvas::execSetCameraLocation(FFrame&, void* const)
native final function SetCameraLocation(Vector CameraLocation);
// Export UCanvas::execSetCameraRotation(FFrame&, void* const)
native final function SetCameraRotation(Rotator CameraRotation);
// Export UCanvas::execDraw2DLine(FFrame&, void* const)
native final function Draw2DLine(float X1, float Y1, float X2, float Y2, Color LineColor);
// Export UCanvas::execDraw2DPoint(FFrame&, void* const)
native final function Draw2DPoint(float X, float Y, Color PointColor);
// Export UCanvas::execSetFontScale(FFrame&, void* const)
native final function SetFontScale(float fX, float fY);
// Export UCanvas::execSetScreenLight(FFrame&, void* const)
native final function SetScreenLight(int Index, Vector Position, Color LightColor, float Radius);
// Export UCanvas::execSetScreenProjector(FFrame&, void* const)
native final function SetScreenProjector(int Index, Vector Position, Color Color, float Radius, Texture Tex);
// Export UCanvas::execDrawScreenActor(FFrame&, void* const)
native final function DrawScreenActor(Actor A, optional float FOV, optional bool Wireframe, optional bool ClearZ);
// Export UCanvas::execDrawScreenActorWithViewport(FFrame&, void* const)
native final function DrawScreenActorWithViewport(Actor A, int X1, int Y1, int X2, int Y2, float AspectRatio, optional float FOV, optional bool Wireframe, optional bool ClearZ);
// Export UCanvas::execClear(FFrame&, void* const)
native final function Clear(optional bool ClearRGB, optional bool ClearZ);
// Export UCanvas::execWrapStringToArray(FFrame&, void* const)
native final function WrapStringToArray(string Text, out array<string> OutArray, float dx, optional string EOL);
// Export UCanvas::execWrapText(FFrame&, void* const)
native static final function WrapText(out string Text, out string Line, float dx, Font f, float FontScaleX);
// Export UCanvas::execDrawTilePartialStretched(FFrame&, void* const)
native final function DrawTilePartialStretched(Material mat, float XL, float YL);
// Export UCanvas::execDrawTileStretched(FFrame&, void* const)
native final function DrawTileStretched(Material mat, float XL, float YL);
// Export UCanvas::execDrawTileCroppedStretched(FFrame&, void* const)
native final function DrawTileCroppedStretched(Material mat, float XL, float YL, float UL, float VL);
// Export UCanvas::execDrawTileJustified(FFrame&, void* const)
native final function DrawTileJustified(Material mat, byte Justification, float XL, float YL);
// Export UCanvas::execDrawTileScaled(FFrame&, void* const)
native final function DrawTileScaled(Material mat, float XScale, float YScale);
// Export UCanvas::execDrawTextJustified(FFrame&, void* const)
native final function DrawTextJustified(coerce string String, byte Justification, float X1, float Y1, float X2, float Y2);
// Export UCanvas::execDrawActorClipped(FFrame&, void* const)
native final function DrawActorClipped(Actor A, bool Wireframe, float Left, float Top, float width, float Height, optional bool ClearZ, optional float DisplayFOV);
// Export UCanvas::execBtrDrawTextJustified(FFrame&, void* const)
native final function BtrDrawTextJustified(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bCache);
// Export UCanvas::execBtrSaveTexture(FFrame&, void* const)
native final function BtrSaveTexture();
// Export UCanvas::execBtrToggleUseD3DFont(FFrame&, void* const)
native final function BtrToggleUseD3DFont();
// Export UCanvas::execBtrFontReset(FFrame&, void* const)
native final function BtrFontReset();
// Export UCanvas::execBtrFontTextureGC(FFrame&, void* const)
native final function BtrFontTextureGC();
// Export UCanvas::execBtrDrawTextHK(FFrame&, void* const)
native final function BtrDrawTextHK(coerce string Text, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bUseD3DFont, optional byte GCLevel, optional byte PresetIndex);
// Export UCanvas::execBtrDrawTextHK_UseModulateColor(FFrame&, void* const)
native final function BtrDrawTextHK_UseModulateColor(coerce string Text, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bUseD3DFont, optional byte GCLevel, optional byte PresetIndex, optional bool bUseModulateColor, optional Plane mColor);
// Export UCanvas::execBtrTextSize(FFrame&, void* const)
native final function BtrTextSize(coerce string Text, int FontSize, out float XL, out float YL);
// Export UCanvas::execBtrTextSizeLH(FFrame&, void* const)
native final function BtrTextSizeLH(coerce string Text, int FontSize, out float XL, out float YL);
// Export UCanvas::execBtrTextSizeOLD(FFrame&, void* const)
native final function BtrTextSizeOLD(coerce string Text, int FontSize, out float XL, out float YL);
// Export UCanvas::execBeginCache(FFrame&, void* const)
native final function BeginCache();
// Export UCanvas::execEndCache(FFrame&, void* const)
native final function EndCache();
// Export UCanvas::execDrawTileCache(FFrame&, void* const)
native final function DrawTileCache(Material mat, float XL, float YL, float U, float V, float UL, float VL, optional int Level);
// Export UCanvas::execBtrDrawTextJustifiedCache(FFrame&, void* const)
native final function BtrDrawTextJustifiedCache(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int FontSize, optional int Level);
// Export UCanvas::execDrawTileExact(FFrame&, void* const)
native final function DrawTileExact(Material mat, float X, float Y, float XL, float YL, float U, float V, float UL, float VL);
// Export UCanvas::execDrawTileExactWithRotation(FFrame&, void* const)
native final function DrawTileExactWithRotation(Material mat, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Rotator R);
// Export UCanvas::execFlush(FFrame&, void* const)
native final function Flush();
function BtrDrawTextJustifiedWithVolumeLineNoCache(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int fntSize, optional Color shadowC, optional int dropSX, optional int dropSY, optional int Level)
{
    BtrDrawTextJustifiedWithVolumeLine(Text, Justification, X1, Y1, X2, Y2, fntSize, shadowC, dropSX, dropSY, 0, true);
}

function BtrDrawTextJustifiedWithVolumeLine(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int fntSize, optional Color shadowC, optional int dropSX, optional int dropSY, optional int Level, optional bool bUseD3DFont)
{
    local float perc;
    local Color SaveBackColor, saveC;
    local Plane saveMColor, mColor;

    // End:0x0e
    if(Text == "")
    {
        return;
    }
    saveMColor = ColorModulate;
    saveC = self.DrawColor;
    SaveBackColor = self.DrawBackColor;
    mColor = ColorModulate;
    perc = float(DrawColor.A) / 255.0;
    mColor.W = mColor.W * perc;
    DrawColor.A = byte(255);
    ColorModulate = mColor;
    DrawBackColor = MakeColor(0, 0, 0, 200);
    BtrDrawTextJustified(Text, Justification, X1, Y1, X2, Y2, fntSize, bUseD3DFont);
    ColorModulate = saveMColor;
    DrawColor = saveC;
    DrawBackColor = SaveBackColor;
}

function BtrDrawTextJustifiedWithVolumeLineCache(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int fntSize, optional Color shadowC, optional int dropSX, optional int dropSY, optional int Level)
{
    local Color temp;

    // End:0x12
    if(dropSX == 0)
    {
        dropSX = 1;
    }
    // End:0x24
    if(dropSY == 0)
    {
        dropSY = 1;
    }
    temp = self.DrawColor;
    self.DrawColor = shadowC;
    BtrDrawTextJustifiedCache(Text, Justification, X1 + float(dropSX), Y1 + float(dropSY), X2 + float(dropSX), Y2 + float(dropSY), fntSize, Level);
    self.DrawColor = temp;
    BtrDrawTextJustifiedCache(Text, Justification, X1, Y1, X2, Y2, fntSize, Level);
}

event Reset()
{
    Font = default.Font;
    FontScaleX = default.FontScaleX;
    FontScaleY = default.FontScaleY;
    SpaceX = default.SpaceX;
    SpaceY = default.SpaceY;
    OrgX = default.OrgX;
    OrgY = default.OrgY;
    CurX = default.CurX;
    CurY = default.CurY;
    Style = default.Style;
    DrawColor = default.DrawColor;
    CurYL = default.CurYL;
    bCenter = false;
    bNoSmooth = false;
    Z = 1.0;
    ColorModulate = default.ColorModulate;
}

final function SetPos(float X, float Y)
{
    CurX = X;
    CurY = Y;
}

final function SetOrigin(float X, float Y)
{
    OrgX = X;
    OrgY = Y;
}

final function SetClip(float X, float Y)
{
    ClipX = X;
    ClipY = Y;
}

final function DrawPattern(Material Tex, float XL, float YL, float Scale)
{
    DrawTile(Tex, XL, YL, CurX - OrgX * Scale, CurY - OrgY * Scale, XL * Scale, YL * Scale);
}

final function DrawIcon(Texture Tex, float Scale)
{
    // End:0x6e
    if(Tex != none)
    {
        DrawTile(Tex, float(Tex.USize) * Scale, float(Tex.VSize) * Scale, 0.0, 0.0, float(Tex.USize), float(Tex.VSize));
    }
}

final function DrawRect(Texture Tex, float RectX, float RectY)
{
    DrawTile(Tex, RectX, RectY, 0.0, 0.0, float(Tex.USize), float(Tex.VSize));
}

final function SetDrawColor(byte R, byte G, byte B, optional byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    // End:0x47
    if(A == 0)
    {
        A = byte(255);
    }
    C.A = A;
    DrawColor = C;
}

static final function Color MakeColor(byte R, byte G, byte B, optional byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    // End:0x47
    if(A == 0)
    {
        A = byte(255);
    }
    C.A = A;
    return C;
}

static final function Color MakeColorNoEmpty(byte R, byte G, byte B, byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    C.A = A;
    return C;
}

final function DrawVertical(float X, float Height)
{
    local float cX, cY;

    cX = CurX;
    cY = CurY;
    CurX = X;
    DrawTile(texture'WhiteSquareTexture', 2.0, Height, 0.0, 0.0, 2.0, 2.0);
    CurX = cX;
    CurY = cY;
}

final function DrawHorizontal(float Y, float width)
{
    local float cX, cY;

    cX = CurX;
    cY = CurY;
    CurY = Y;
    DrawTile(texture'WhiteSquareTexture', width, 2.0, 0.0, 0.0, 2.0, 2.0);
    CurX = cX;
    CurY = cY;
}

final function DrawLine(int direction, float Size)
{
    local float cX, cY;

    cX = CurX;
    cY = CurY;
    switch(direction)
    {
        // End:0x40
        case 0:
            CurY -= Size;
            DrawVertical(CurX, Size);
            // End:0x96
            break;
        // End:0x57
        case 1:
            DrawVertical(CurX, Size);
            // End:0x96
            break;
        // End:0x7b
        case 2:
            CurX -= Size;
            DrawHorizontal(CurY, Size);
            // End:0x96
            break;
        // End:0x93
        case 3:
            DrawHorizontal(CurY, Size);
            // End:0x96
            break;
        // End:0xffff
        default:
            CurX = cX;
            CurY = cY;
}

final simulated function DrawBracket(float width, float Height, float bracket_size)
{
    local float X, Y;

    width = float(Max(int(width), 5));
    Height = float(Max(int(Height), 5));
    X = CurX;
    Y = CurY;
    DrawHorizontal(CurY, bracket_size);
    DrawHorizontal(CurY + Height, bracket_size);
    DrawVertical(CurX, bracket_size);
    DrawVertical(CurX + width, bracket_size);
    CurY = Y + Height - bracket_size;
    DrawVertical(CurX, bracket_size);
    DrawVertical(CurX + width, bracket_size);
    CurX = X + width - bracket_size;
    DrawHorizontal(Y, bracket_size);
    DrawHorizontal(Y + Height, bracket_size);
}

final simulated function DrawBox(Canvas Canvas, float width, float Height)
{
    DrawHorizontal(CurY, width);
    DrawHorizontal(CurY + Height, width);
    DrawVertical(CurX, Height);
    DrawVertical(CurX + width, Height);
}

simulated function DrawScreenText(string Text, float X, float Y, Core.Object.EDrawPivot Pivot)
{
    local int TextScreenWidth, TextScreenHeight;
    local float UL, VL;

    X *= float(SizeX);
    Y *= float(SizeY);
    TextSize(Text, UL, VL);
    TextScreenWidth = int(UL);
    TextScreenHeight = int(VL);
    switch(Pivot)
    {
        // End:0x57
        case 0:
            // End:0x15a
            break;
        // End:0x71
        case 1:
            X -= float(TextScreenWidth / 2);
            // End:0x15a
            break;
        // End:0x87
        case 2:
            X -= float(TextScreenWidth);
            // End:0x15a
            break;
        // End:0xaf
        case 3:
            X -= float(TextScreenWidth);
            Y -= float(TextScreenHeight / 2);
            // End:0x15a
            break;
        // End:0xd3
        case 4:
            X -= float(TextScreenWidth);
            Y -= float(TextScreenHeight);
            // End:0x15a
            break;
        // End:0xfb
        case 5:
            X -= float(TextScreenWidth / 2);
            Y -= float(TextScreenHeight);
            // End:0x15a
            break;
        // End:0x111
        case 6:
            Y -= float(TextScreenHeight);
            // End:0x15a
            break;
        // End:0x12b
        case 7:
            Y -= float(TextScreenHeight / 2);
            // End:0x15a
            break;
        // End:0x157
        case 8:
            X -= float(TextScreenWidth / 2);
            Y -= float(TextScreenHeight / 2);
            // End:0x15a
            break;
        // End:0xffff
        default:
            SetPos(X, Y);
            DrawTextClipped(Text);
}

defaultproperties
{
    Font=Font'DefaultFont'
    FontScaleX=1.0
    FontScaleY=1.0
    Z=1.0
    Style=5
    DrawColor=(R=127,G=127,B=127,A=255)
    DrawBackColor=(R=0,G=0,B=0,A=200)
    ColorModulate=(X=0.0,Y=3368904000000000.0,Z=0.0,W=0.0)
    bRenderLevel=true
    TinyFontName="EntryTex.Entry"
    SmallFontName="EntryTex.Entry"
    MedFontName="EntryTex.Entry"
}