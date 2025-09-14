class wZoomFire extends wAimFire;

var string szTexZoomName;
var Texture TexZoom;
var wGun G;
var float fBlendTime;
var float fBlendCurr;
var float fLastBlend;
var wGun.EWeaponAimState FormerWAS;

simulated function PostBeginPlay()
{
    G = wGun(Weapon);
    TexZoom = Texture(DynamicLoadObject(szTexZoomName, Class'Engine_Decompressed.Texture'));
    //return;    
}

function SetAim(bool bAim)
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x2B
    if(int(G.ClientState) != int(4))
    {
        return;
    }
    // End:0x6C
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0x9E
    if((G.bActioned == false) && int(G.AimState) == int(0))
    {
        return;
    }
    // End:0xB9
    if(int(G.ReloadState) != int(3))
    {
        return;
    }
    bCurrAim = bAim;
    G.PlayAim(bCurrAim);
    // End:0xEE
    if(bCurrAim == false)
    {
        SetFOV(false);
    }
    //return;    
}

event ModeTick(float dt)
{
    // End:0x51
    if((int(FormerWAS) == int(1)) && int(G.AimState) == int(2))
    {
        fBlendCurr = fBlendTime;
        fLastBlend = Level.TimeSeconds;
        SetFOV(true);
    }
    FormerWAS = G.AimState;
    //return;    
}

simulated function RenderScope(Canvas Canv)
{
    local float barW, barH;

    Canv.SetPos((float(Canv.SizeX) * 0.5000000) - (float(Canv.SizeY) * 0.5000000), (float(Canv.SizeY) * 0.5000000) - (float(Canv.SizeY) * 0.5000000));
    Canv.DrawTile(TexZoom, float(Canv.SizeY), float(Canv.SizeY), 0.0000000, 0.0000000, float(TexZoom.USize), float(TexZoom.USize));
    barW = (float(Canv.SizeX) * 0.5000000) - (float(Canv.SizeY) * 0.5000000);
    barH = float(Canv.SizeY);
    Canv.SetPos(0.0000000, 0.0000000);
    Canv.DrawTile(Texture'Engine_Decompressed.BlackTexture', barW, barH, 0.0000000, 0.0000000, float(Texture'Engine_Decompressed.BlackTexture'.USize), float(Texture'Engine_Decompressed.BlackTexture'.VSize));
    Canv.SetPos((float(Canv.SizeX) * 0.5000000) + (float(Canv.SizeY) * 0.5000000), 0.0000000);
    Canv.DrawTile(Texture'Engine_Decompressed.BlackTexture', barW, barH, 0.0000000, 0.0000000, float(Texture'Engine_Decompressed.BlackTexture'.USize), float(Texture'Engine_Decompressed.BlackTexture'.VSize));
    // End:0x30B
    if(fBlendCurr > float(0))
    {
        fBlendCurr -= (Level.TimeSeconds - fLastBlend);
        fLastBlend = Level.TimeSeconds;
        // End:0x25B
        if(fBlendCurr < float(0))
        {
            fBlendCurr = 0.0000000;
        }
        Canv.Style = 5;
        Canv.DrawColor.A = byte(float(255) * (fBlendCurr / fBlendTime));
        Canv.SetPos(0.0000000, 0.0000000);
        Canv.DrawTile(Texture'Engine_Decompressed.BlackTexture', float(Canv.SizeX), float(Canv.SizeY), 0.0000000, 0.0000000, float(Texture'Engine_Decompressed.BlackTexture'.USize), float(Texture'Engine_Decompressed.BlackTexture'.VSize));
    }
    //return;    
}

simulated function bool RenderOverlays(Canvas Canv)
{
    switch(G.AimState)
    {
        // End:0x15
        case 0:
        // End:0x1A
        case 1:
        // End:0x21
        case 3:
            return false;
        // End:0x33
        case 2:
            RenderScope(Canv);
            return true;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

defaultproperties
{
    fBlendTime=0.1000000
    bInstantFOV=true
}