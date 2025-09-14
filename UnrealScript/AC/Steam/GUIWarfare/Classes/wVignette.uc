/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\wVignette.uc
 * Package Imports:
 *	GUIWarfare
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class wVignette extends Vignette
    transient;

var array<string> MapNames;
var array<Material> Images;
var array<float> Widths;
var array<float> Heights;
var array<string> BGMList;
var int Index;

simulated event Init()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x41 [While If]
    if(lp1 < MapNames.Length)
    {
        // End:0x37
        if(MapNames[lp1] == MapName)
        {
            Index = lp1;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated event DrawVignette(Canvas C, float Progress)
{
    Level.GetLocalPlayerController().Player.Console.SetBGM(BGMList);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(0.0, 0.0);
    C.DrawTile(Images[Index], C.ClipX, C.ClipY, 0.0, 0.0, Widths[Index], Heights[Index]);
}

defaultproperties
{
    MapNames=// Object reference not set to an instance of an object.
    
    Widths=// Object reference not set to an instance of an object.
    
    Heights=// Object reference not set to an instance of an object.
    
}