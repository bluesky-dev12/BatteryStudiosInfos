class Canvas extends Object
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
native(464) final function StrLen(coerce string String, out float XL, out float YL)
{
    //native.String;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execDrawText(FFrame&, void* const)
native(465) final function DrawText(coerce string Text, optional bool cR)
{
    //native.Text;
    //native.cR;        
}

// Export UCanvas::execDrawTile(FFrame&, void* const)
native final function DrawTile(Material mat, float XL, float YL, float U, float V, float UL, float VL)
{
    //native.mat;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;        
}

// Export UCanvas::execDrawActor(FFrame&, void* const)
native(467) final function DrawActor(Actor A, bool Wireframe, optional bool ClearZ, optional float DisplayFOV)
{
    //native.A;
    //native.Wireframe;
    //native.ClearZ;
    //native.DisplayFOV;        
}

// Export UCanvas::execDrawTileClipped(FFrame&, void* const)
native(468) final function DrawTileClipped(Material mat, float XL, float YL, float U, float V, float UL, float VL)
{
    //native.mat;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;        
}

// Export UCanvas::execDrawTextClipped(FFrame&, void* const)
native(469) final function DrawTextClipped(coerce string Text, optional bool bCheckHotKey)
{
    //native.Text;
    //native.bCheckHotKey;        
}

// Export UCanvas::execTextSize(FFrame&, void* const)
native(470) final function TextSize(coerce string String, out float XL, out float YL)
{
    //native.String;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execDrawPortal(FFrame&, void* const)
native(480) final function DrawPortal(int X, int Y, int width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ)
{
    //native.X;
    //native.Y;
    //native.width;
    //native.Height;
    //native.CamActor;
    //native.CamLocation;
    //native.CamRotation;
    //native.FOV;
    //native.ClearZ;        
}

// Export UCanvas::execWorldToScreen(FFrame&, void* const)
native final function Vector WorldToScreen(Vector WorldLoc)
{
    //native.WorldLoc;        
}

// Export UCanvas::execGetCameraLocation(FFrame&, void* const)
native final function GetCameraLocation(out Vector CameraLocation, out Rotator CameraRotation)
{
    //native.CameraLocation;
    //native.CameraRotation;        
}

// Export UCanvas::execSetCameraLocation(FFrame&, void* const)
native final function SetCameraLocation(Vector CameraLocation)
{
    //native.CameraLocation;        
}

// Export UCanvas::execSetCameraRotation(FFrame&, void* const)
native final function SetCameraRotation(Rotator CameraRotation)
{
    //native.CameraRotation;        
}

// Export UCanvas::execDraw2DLine(FFrame&, void* const)
native final function Draw2DLine(float X1, float Y1, float X2, float Y2, Color LineColor)
{
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.LineColor;        
}

// Export UCanvas::execDraw2DPoint(FFrame&, void* const)
native final function Draw2DPoint(float X, float Y, Color PointColor)
{
    //native.X;
    //native.Y;
    //native.PointColor;        
}

// Export UCanvas::execSetFontScale(FFrame&, void* const)
native final function SetFontScale(float fX, float fY)
{
    //native.fX;
    //native.fY;        
}

// Export UCanvas::execSetScreenLight(FFrame&, void* const)
native final function SetScreenLight(int Index, Vector Position, Color LightColor, float Radius)
{
    //native.Index;
    //native.Position;
    //native.LightColor;
    //native.Radius;        
}

// Export UCanvas::execSetScreenProjector(FFrame&, void* const)
native final function SetScreenProjector(int Index, Vector Position, Color Color, float Radius, Texture Tex)
{
    //native.Index;
    //native.Position;
    //native.Color;
    //native.Radius;
    //native.Tex;        
}

// Export UCanvas::execDrawScreenActor(FFrame&, void* const)
native final function DrawScreenActor(Actor A, optional float FOV, optional bool Wireframe, optional bool ClearZ)
{
    //native.A;
    //native.FOV;
    //native.Wireframe;
    //native.ClearZ;        
}

// Export UCanvas::execDrawScreenActorWithViewport(FFrame&, void* const)
native final function DrawScreenActorWithViewport(Actor A, int X1, int Y1, int X2, int Y2, float AspectRatio, optional float FOV, optional bool Wireframe, optional bool ClearZ)
{
    //native.A;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.AspectRatio;
    //native.FOV;
    //native.Wireframe;
    //native.ClearZ;        
}

// Export UCanvas::execClear(FFrame&, void* const)
native final function Clear(optional bool ClearRGB, optional bool ClearZ)
{
    //native.ClearRGB;
    //native.ClearZ;        
}

// Export UCanvas::execWrapStringToArray(FFrame&, void* const)
native final function WrapStringToArray(string Text, out array<string> OutArray, float dx, optional string EOL)
{
    //native.Text;
    //native.OutArray;
    //native.dx;
    //native.EOL;        
}

// Export UCanvas::execWrapText(FFrame&, void* const)
native static final function WrapText(out string Text, out string Line, float dx, Font f, float FontScaleX)
{
    //native.Text;
    //native.Line;
    //native.dx;
    //native.f;
    //native.FontScaleX;        
}

// Export UCanvas::execDrawTilePartialStretched(FFrame&, void* const)
native final function DrawTilePartialStretched(Material mat, float XL, float YL)
{
    //native.mat;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execDrawTileStretched(FFrame&, void* const)
native final function DrawTileStretched(Material mat, float XL, float YL)
{
    //native.mat;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execDrawTileCroppedStretched(FFrame&, void* const)
native final function DrawTileCroppedStretched(Material mat, float XL, float YL, float UL, float VL)
{
    //native.mat;
    //native.XL;
    //native.YL;
    //native.UL;
    //native.VL;        
}

// Export UCanvas::execDrawTileJustified(FFrame&, void* const)
native final function DrawTileJustified(Material mat, byte Justification, float XL, float YL)
{
    //native.mat;
    //native.Justification;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execDrawTileScaled(FFrame&, void* const)
native final function DrawTileScaled(Material mat, float XScale, float YScale)
{
    //native.mat;
    //native.XScale;
    //native.YScale;        
}

// Export UCanvas::execDrawTextJustified(FFrame&, void* const)
native final function DrawTextJustified(coerce string String, byte Justification, float X1, float Y1, float X2, float Y2)
{
    //native.String;
    //native.Justification;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;        
}

// Export UCanvas::execDrawActorClipped(FFrame&, void* const)
native final function DrawActorClipped(Actor A, bool Wireframe, float Left, float Top, float width, float Height, optional bool ClearZ, optional float DisplayFOV)
{
    //native.A;
    //native.Wireframe;
    //native.Left;
    //native.Top;
    //native.width;
    //native.Height;
    //native.ClearZ;
    //native.DisplayFOV;        
}

// Export UCanvas::execBtrDrawTextJustified(FFrame&, void* const)
native final function BtrDrawTextJustified(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bCache)
{
    //native.Text;
    //native.Justification;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.FontSize;
    //native.bCache;        
}

// Export UCanvas::execBtrSaveTexture(FFrame&, void* const)
native final function BtrSaveTexture();

// Export UCanvas::execBtrToggleUseD3DFont(FFrame&, void* const)
native final function BtrToggleUseD3DFont();

// Export UCanvas::execBtrFontReset(FFrame&, void* const)
native final function BtrFontReset();

// Export UCanvas::execBtrFontTextureGC(FFrame&, void* const)
native final function BtrFontTextureGC();

// Export UCanvas::execBtrDrawTextHK(FFrame&, void* const)
native final function BtrDrawTextHK(coerce string Text, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bUseD3DFont, optional byte GCLevel, optional byte PresetIndex)
{
    //native.Text;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.FontSize;
    //native.bUseD3DFont;
    //native.GCLevel;
    //native.PresetIndex;        
}

// Export UCanvas::execBtrDrawTextHK_UseModulateColor(FFrame&, void* const)
native final function BtrDrawTextHK_UseModulateColor(coerce string Text, float X1, float Y1, float X2, float Y2, int FontSize, optional bool bUseD3DFont, optional byte GCLevel, optional byte PresetIndex, optional bool bUseModulateColor, optional Plane mColor)
{
    //native.Text;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.FontSize;
    //native.bUseD3DFont;
    //native.GCLevel;
    //native.PresetIndex;
    //native.bUseModulateColor;
    //native.mColor;        
}

// Export UCanvas::execBtrTextSize(FFrame&, void* const)
native final function BtrTextSize(coerce string Text, int FontSize, out float XL, out float YL)
{
    //native.Text;
    //native.FontSize;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execBtrTextSizeLH(FFrame&, void* const)
native final function BtrTextSizeLH(coerce string Text, int FontSize, out float XL, out float YL)
{
    //native.Text;
    //native.FontSize;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execBtrTextSizeOLD(FFrame&, void* const)
native final function BtrTextSizeOLD(coerce string Text, int FontSize, out float XL, out float YL)
{
    //native.Text;
    //native.FontSize;
    //native.XL;
    //native.YL;        
}

// Export UCanvas::execBeginCache(FFrame&, void* const)
native final function BeginCache();

// Export UCanvas::execEndCache(FFrame&, void* const)
native final function EndCache();

// Export UCanvas::execDrawTileCache(FFrame&, void* const)
native final function DrawTileCache(Material mat, float XL, float YL, float U, float V, float UL, float VL, optional int Level)
{
    //native.mat;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;
    //native.Level;        
}

// Export UCanvas::execBtrDrawTextJustifiedCache(FFrame&, void* const)
native final function BtrDrawTextJustifiedCache(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int FontSize, optional int Level)
{
    //native.Text;
    //native.Justification;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.FontSize;
    //native.Level;        
}

// Export UCanvas::execDrawTileExact(FFrame&, void* const)
native final function DrawTileExact(Material mat, float X, float Y, float XL, float YL, float U, float V, float UL, float VL)
{
    //native.mat;
    //native.X;
    //native.Y;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;        
}

// Export UCanvas::execDrawTileExactWithRotation(FFrame&, void* const)
native final function DrawTileExactWithRotation(Material mat, float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Rotator R)
{
    //native.mat;
    //native.X;
    //native.Y;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;
    //native.R;        
}

// Export UCanvas::execFlush(FFrame&, void* const)
native final function Flush();

function BtrDrawTextJustifiedWithVolumeLineNoCache(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int fntSize, optional Color shadowC, optional int dropSX, optional int dropSY, optional int Level)
{
    BtrDrawTextJustifiedWithVolumeLine(Text, Justification, X1, Y1, X2, Y2, fntSize, shadowC, dropSX, dropSY, 0, true);
    //return;    
}

function BtrDrawTextJustifiedWithVolumeLine(coerce string Text, byte Justification, float X1, float Y1, float X2, float Y2, int fntSize, optional Color shadowC, optional int dropSX, optional int dropSY, optional int Level, optional bool bUseD3DFont)
{
    local float perc;
    local Color SaveBackColor, saveC;
    local Plane saveMColor, mColor;

    // End:0x0E
    if(Text == "")
    {
        return;
    }
    saveMColor = ColorModulate;
    saveC = self.DrawColor;
    SaveBackColor = self.DrawBackColor;
    mColor = ColorModulate;
    perc = float(DrawColor.A) / 255.0000000;
    mColor.W = mColor.W * perc;
    DrawColor.A = byte(255);
    ColorModulate = mColor;
    DrawBackColor = MakeColor(0, 0, 0, 200);
    BtrDrawTextJustified(Text, Justification, X1, Y1, X2, Y2, fntSize, bUseD3DFont);
    ColorModulate = saveMColor;
    DrawColor = saveC;
    DrawBackColor = SaveBackColor;
    //return;    
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
    //return;    
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
    Z = 1.0000000;
    ColorModulate = default.ColorModulate;
    //return;    
}

final function SetPos(float X, float Y)
{
    CurX = X;
    CurY = Y;
    //return;    
}

final function SetOrigin(float X, float Y)
{
    OrgX = X;
    OrgY = Y;
    //return;    
}

final function SetClip(float X, float Y)
{
    ClipX = X;
    ClipY = Y;
    //return;    
}

final function DrawPattern(Material Tex, float XL, float YL, float Scale)
{
    DrawTile(Tex, XL, YL, (CurX - OrgX) * Scale, (CurY - OrgY) * Scale, XL * Scale, YL * Scale);
    //return;    
}

final function DrawIcon(Texture Tex, float Scale)
{
    // End:0x6E
    if(Tex != none)
    {
        DrawTile(Tex, float(Tex.USize) * Scale, float(Tex.VSize) * Scale, 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize));
    }
    //return;    
}

final function DrawRect(Texture Tex, float RectX, float RectY)
{
    DrawTile(Tex, RectX, RectY, 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize));
    //return;    
}

final function SetDrawColor(byte R, byte G, byte B, optional byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    // End:0x47
    if(int(A) == 0)
    {
        A = byte(255);
    }
    C.A = A;
    DrawColor = C;
    //return;    
}

static final function Color MakeColor(byte R, byte G, byte B, optional byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    // End:0x47
    if(int(A) == 0)
    {
        A = byte(255);
    }
    C.A = A;
    return C;
    //return;    
}

static final function Color MakeColorNoEmpty(byte R, byte G, byte B, byte A)
{
    local Color C;

    C.R = R;
    C.G = G;
    C.B = B;
    C.A = A;
    return C;
    //return;    
}

final function DrawVertical(float X, float Height)
{
    local float cX, cY;

    cX = CurX;
    cY = CurY;
    CurX = X;
    DrawTile(Texture'Engine_Decompressed.WhiteSquareTexture', 2.0000000, Height, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
    CurX = cX;
    CurY = cY;
    //return;    
}

final function DrawHorizontal(float Y, float width)
{
    local float cX, cY;

    cX = CurX;
    cY = CurY;
    CurY = Y;
    DrawTile(Texture'Engine_Decompressed.WhiteSquareTexture', width, 2.0000000, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
    CurX = cX;
    CurY = cY;
    //return;    
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
        // End:0x7B
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
        // End:0xFFFF
        default:
            break;
    }
    CurX = cX;
    CurY = cY;
    //return;    
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
    CurY = (Y + Height) - bracket_size;
    DrawVertical(CurX, bracket_size);
    DrawVertical(CurX + width, bracket_size);
    CurX = (X + width) - bracket_size;
    DrawHorizontal(Y, bracket_size);
    DrawHorizontal(Y + Height, bracket_size);
    //return;    
}

final simulated function DrawBox(Canvas Canvas, float width, float Height)
{
    DrawHorizontal(CurY, width);
    DrawHorizontal(CurY + Height, width);
    DrawVertical(CurX, Height);
    DrawVertical(CurX + width, Height);
    //return;    
}

simulated function DrawScreenText(string Text, float X, float Y, Object.EDrawPivot Pivot)
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
            // End:0x15A
            break;
        // End:0x71
        case 1:
            X -= float(TextScreenWidth / 2);
            // End:0x15A
            break;
        // End:0x87
        case 2:
            X -= float(TextScreenWidth);
            // End:0x15A
            break;
        // End:0xAF
        case 3:
            X -= float(TextScreenWidth);
            Y -= float(TextScreenHeight / 2);
            // End:0x15A
            break;
        // End:0xD3
        case 4:
            X -= float(TextScreenWidth);
            Y -= float(TextScreenHeight);
            // End:0x15A
            break;
        // End:0xFB
        case 5:
            X -= float(TextScreenWidth / 2);
            Y -= float(TextScreenHeight);
            // End:0x15A
            break;
        // End:0x111
        case 6:
            Y -= float(TextScreenHeight);
            // End:0x15A
            break;
        // End:0x12B
        case 7:
            Y -= float(TextScreenHeight / 2);
            // End:0x15A
            break;
        // End:0x157
        case 8:
            X -= float(TextScreenWidth / 2);
            Y -= float(TextScreenHeight / 2);
            // End:0x15A
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetPos(X, Y);
    DrawTextClipped(Text);
    //return;    
}

defaultproperties
{
    Font=Font'Engine_Decompressed.DefaultFont'
    FontScaleX=1.0000000
    FontScaleY=1.0000000
    Z=1.0000000
    Style=5
    DrawColor=(R=127,G=127,B=127,A=255)
    DrawBackColor=(R=0,G=0,B=0,A=200)
    ColorModulate=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    bRenderLevel=true
    TinyFontName="EntryTex.Entry"
    SmallFontName="EntryTex.Entry"
    MedFontName="EntryTex.Entry"
}