/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedHudOverlay.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:1
 *
 *******************************************************************************/
class ScriptedHudOverlay extends HudOverlay;

var Material HUDMaterial;
var float PosX;
var float PosY;
var float width;
var float Height;

simulated function Render(Canvas C)
{
    local float X, Y, W, H;

    // End:0x0d
    if(HUDMaterial == none)
    {
        return;
    }
    // End:0x3a
    if(PosX <= 1.0)
    {
        X = C.ClipX * PosX;
    }
    // End:0x45
    else
    {
        X = PosX;
    }
    // End:0x72
    if(PosY <= 1.0)
    {
        Y = C.ClipY * PosY;
    }
    // End:0x7d
    else
    {
        Y = PosY;
    }
    // End:0xaa
    if(width <= 1.0)
    {
        W = C.ClipX * width;
    }
    // End:0xb5
    else
    {
        W = width;
    }
    // End:0xe2
    if(Height <= 1.0)
    {
        H = C.ClipY * Height;
    }
    // End:0xed
    else
    {
        H = Height;
    }
    C.DrawColor = class'HUD'.default.WhiteColor;
    C.SetPos(X, Y);
    C.DrawTile(HUDMaterial, W, H, 0.0, 0.0, float(HUDMaterial.MaterialUSize()), float(HUDMaterial.MaterialVSize()));
}
