class ScriptedTexture extends BitmapMaterial
    native
    collapsecategories
    hidecategories(Object);

var const transient pointer RenderTarget;
var const transient Viewport RenderViewport;
var Actor Client;
var transient int Revision;
var const transient int OldRevision;
var const transient int Invalid;

// Export UScriptedTexture::execSetSize(FFrame&, void* const)
native final function SetSize(int Width, int Height)
{
    //native.Width;
    //native.Height;        
}

// Export UScriptedTexture::execDrawText(FFrame&, void* const)
native final function DrawText(int StartX, int StartY, coerce string Text, Font Font, Color Color)
{
    //native.StartX;
    //native.StartY;
    //native.Text;
    //native.Font;
    //native.Color;        
}

// Export UScriptedTexture::execTextSize(FFrame&, void* const)
native final function TextSize(coerce string Text, Font Font, out int Width, out int Height)
{
    //native.Text;
    //native.Font;
    //native.Width;
    //native.Height;        
}

// Export UScriptedTexture::execDrawTile(FFrame&, void* const)
native final function DrawTile(float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Material Material, Color Color)
{
    //native.X;
    //native.Y;
    //native.XL;
    //native.YL;
    //native.U;
    //native.V;
    //native.UL;
    //native.VL;
    //native.Material;
    //native.Color;        
}

// Export UScriptedTexture::execDrawPortal(FFrame&, void* const)
native final function DrawPortal(int X, int Y, int Width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ)
{
    //native.X;
    //native.Y;
    //native.Width;
    //native.Height;
    //native.CamActor;
    //native.CamLocation;
    //native.CamRotation;
    //native.FOV;
    //native.ClearZ;        
}
