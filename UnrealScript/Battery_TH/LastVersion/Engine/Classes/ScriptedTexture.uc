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
native final function SetSize(int width, int Height)
{
    //native.width;
    //native.Height;        
}

// Export UScriptedTexture::execDrawText(FFrame&, void* const)
native final function DrawText(int startX, int startY, coerce string Text, Font Font, Color Color)
{
    //native.startX;
    //native.startY;
    //native.Text;
    //native.Font;
    //native.Color;        
}

// Export UScriptedTexture::execTextSize(FFrame&, void* const)
native final function TextSize(coerce string Text, Font Font, out int width, out int Height)
{
    //native.Text;
    //native.Font;
    //native.width;
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
native final function DrawPortal(int X, int Y, int width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ)
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
