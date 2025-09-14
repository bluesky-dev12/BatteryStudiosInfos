class FractalTextureFactory extends MaterialFactory;

enum EResolution
{
    Pixels_1,                       // 0
    Pixels_2,                       // 1
    Pixels_4,                       // 2
    Pixels_8,                       // 3
    Pixels_16,                      // 4
    Pixels_32,                      // 5
    Pixels_64,                      // 6
    Pixels_128,                     // 7
    Pixels_256                      // 8
};

var() Class<FractalTexture> Class;
var() FractalTextureFactory.EResolution Width;
var() FractalTextureFactory.EResolution Height;

function Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName)
{
    local int W, H;

    switch(Width)
    {
        // End:0x16
        case 0:
            W = 1;
            // End:0x9C
            break;
        // End:0x26
        case 1:
            W = 2;
            // End:0x9C
            break;
        // End:0x36
        case 2:
            W = 4;
            // End:0x9C
            break;
        // End:0x46
        case 3:
            W = 8;
            // End:0x9C
            break;
        // End:0x56
        case 4:
            W = 16;
            // End:0x9C
            break;
        // End:0x66
        case 5:
            W = 32;
            // End:0x9C
            break;
        // End:0x76
        case 6:
            W = 64;
            // End:0x9C
            break;
        // End:0x86
        case 7:
            W = 128;
            // End:0x9C
            break;
        // End:0x99
        case 8:
            W = 256;
            // End:0x9C
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(Height)
    {
        // End:0xB2
        case 0:
            H = 1;
            // End:0x138
            break;
        // End:0xC2
        case 1:
            H = 2;
            // End:0x138
            break;
        // End:0xD2
        case 2:
            H = 4;
            // End:0x138
            break;
        // End:0xE2
        case 3:
            H = 8;
            // End:0x138
            break;
        // End:0xF2
        case 4:
            H = 16;
            // End:0x138
            break;
        // End:0x102
        case 5:
            H = 32;
            // End:0x138
            break;
        // End:0x112
        case 6:
            H = 64;
            // End:0x138
            break;
        // End:0x122
        case 7:
            H = 128;
            // End:0x138
            break;
        // End:0x135
        case 8:
            H = 256;
            // End:0x138
            break;
        // End:0xFFFF
        default:
            break;
    }
    ConsoleCommand((((((((((("TEXTURE NEW NAME=\"" $ InName) $ "\" CLASS=\"") $ string(Class)) $ "\" GROUP=\"") $ InGroup) $ "\" PACKAGE=\"") $ InPackage) $ "\" USIZE=") $ string(W)) $ " VSIZE=") $ string(H));
    // End:0x1F3
    if(InGroup == "")
    {
        return Material(FindObject((InPackage $ ".") $ InName, Class'Engine.Material'));        
    }
    else
    {
        return Material(FindObject((((InPackage $ ".") $ InGroup) $ ".") $ InName, Class'Engine.Material'));
    }
    //return;    
}

defaultproperties
{
    Class=Class'Fire.WetTexture'
    Width=8
    Height=8
    Description="Real-time Procedural Texture"
}