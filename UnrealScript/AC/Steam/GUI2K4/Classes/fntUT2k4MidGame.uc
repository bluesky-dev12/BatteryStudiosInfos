/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\fntUT2k4MidGame.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class fntUT2k4MidGame extends GUIFont
    editinlinenew
    instanced;

var int FontScreenWidth[7];

static function Font GetMidGameFont(int XRes)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3e [While If]
    if(i < 7)
    {
        // End:0x34
        if(default.FontScreenWidth[i] <= XRes)
        {
            return LoadFontStatic(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LoadFontStatic(6);
}

event Font GetFont(int XRes)
{
    return GetMidGameFont(XRes);
}

defaultproperties
{
    FontScreenWidth[0]=2048
    FontScreenWidth[1]=1600
    FontScreenWidth[2]=1280
    FontScreenWidth[3]=1024
    FontScreenWidth[4]=800
    FontScreenWidth[5]=640
    FontScreenWidth[6]=600
    KeyName="UT2MidGameFont"
}