/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\FractalTextureFactory.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class FractalTextureFactory extends MaterialFactory;

enum EResolution
{
    Pixels_1,
    Pixels_2,
    Pixels_4,
    Pixels_8,
    Pixels_16,
    Pixels_32,
    Pixels_64,
    Pixels_128,
    Pixels_256
};

var() class<FractalTexture> Class;
var() FractalTextureFactory.EResolution width;
var() FractalTextureFactory.EResolution Height;

function Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName)
{
    local int W, H;

    switch(width)
    {
        // End:0x16
        case 0:
            W = 1;
            // End:0x9c
            break;
        // End:0x26
        case 1:
            W = 2;
            // End:0x9c
            break;
        // End:0x36
        case 2:
            W = 4;
            // End:0x9c
            break;
        // End:0x46
        case 3:
            W = 8;
            // End:0x9c
            break;
        // End:0x56
        case 4:
            W = 16;
            // End:0x9c
            break;
        // End:0x66
        case 5:
            W = 32;
            // End:0x9c
            break;
        // End:0x76
        case 6:
            W = 64;
            // End:0x9c
            break;
        // End:0x86
        case 7:
            W = 128;
            // End:0x9c
            break;
        // End:0x99
        case 8:
            W = 256;
            // End:0x9c
            break;
        // End:0xffff
        default:
            switch(Height)
            {
                // End:0xb2
                case 0:
                    H = 1;
                    // End:0x138
                    break;
                // End:0xc2
                case 1:
                    H = 2;
                    // End:0x138
                    break;
                // End:0xd2
                case 2:
                    H = 4;
                    // End:0x138
                    break;
                // End:0xe2
                case 3:
                    H = 8;
                    // End:0x138
                    break;
                // End:0xf2
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
                // End:0xffff
                default:
                    ConsoleCommand("TEXTURE NEW NAME=\\"" $ InName $ "\\" CLASS=\\"" $ string(Class) $ "\\" GROUP=\\"" $ InGroup $ "\\" PACKAGE=\\"" $ InPackage $ "\\" USIZE=" $ string(W) $ " VSIZE=" $ string(H));
                    // End:0x1f3
                    if(InGroup == "")
                    {
                        return Material(FindObject(InPackage $ "." $ InName, class'Material'));
                    }
                    // End:0x221
                    else
                    {
                        return Material(FindObject(InPackage $ "." $ InGroup $ "." $ InName, class'Material'));
                    }
}

defaultproperties
{
    Class=Class'Fire.WetTexture'
    width=8
    Height=8
    Description="Real-time Procedural Texture"
}