class ScriptedHudOverlay extends HudOverlay;

var Material HUDMaterial;
var float PosX;
var float PosY;
var float width;
var float Height;

simulated function Render(Canvas C)
{
    local float X, Y, W, H;

    // End:0x0D
    if(HUDMaterial == none)
    {
        return;
    }
    // End:0x3A
    if(PosX <= 1.0000000)
    {
        X = C.ClipX * PosX;        
    }
    else
    {
        X = PosX;
    }
    // End:0x72
    if(PosY <= 1.0000000)
    {
        Y = C.ClipY * PosY;        
    }
    else
    {
        Y = PosY;
    }
    // End:0xAA
    if(width <= 1.0000000)
    {
        W = C.ClipX * width;        
    }
    else
    {
        W = width;
    }
    // End:0xE2
    if(Height <= 1.0000000)
    {
        H = C.ClipY * Height;        
    }
    else
    {
        H = Height;
    }
    C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
    C.SetPos(X, Y);
    C.DrawTile(HUDMaterial, W, H, 0.0000000, 0.0000000, float(HUDMaterial.MaterialUSize()), float(HUDMaterial.MaterialVSize()));
    //return;    
}
