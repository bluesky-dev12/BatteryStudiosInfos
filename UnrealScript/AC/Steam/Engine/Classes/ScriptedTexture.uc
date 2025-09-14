/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ScriptedTexture.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:5
 *
 *******************************************************************************/
class ScriptedTexture extends BitmapMaterial
    hidecategories(Object)
    native
    collapsecategories;

var const transient pointer RenderTarget;
var const transient Viewport RenderViewport;
var Actor Client;
var transient int Revision;
var const transient int OldRevision;
var const transient int Invalid;

// Export UScriptedTexture::execSetSize(FFrame&, void* const)
native final function SetSize(int width, int Height);
// Export UScriptedTexture::execDrawText(FFrame&, void* const)
native final function DrawText(int StartX, int StartY, coerce string Text, Font Font, Color Color);
// Export UScriptedTexture::execTextSize(FFrame&, void* const)
native final function TextSize(coerce string Text, Font Font, out int width, out int Height);
// Export UScriptedTexture::execDrawTile(FFrame&, void* const)
native final function DrawTile(float X, float Y, float XL, float YL, float U, float V, float UL, float VL, Material Material, Color Color);
// Export UScriptedTexture::execDrawPortal(FFrame&, void* const)
native final function DrawPortal(int X, int Y, int width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ);
