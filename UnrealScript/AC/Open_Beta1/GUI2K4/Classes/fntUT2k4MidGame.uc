class fntUT2k4MidGame extends GUIFont
    editinlinenew
    instanced;

var int FontScreenWidth[7];

static function Font GetMidGameFont(int XRes)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3E [Loop If]
    if(i < 7)
    {
        // End:0x34
        if(default.FontScreenWidth[i] <= XRes)
        {
            return LoadFontStatic(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return LoadFontStatic(6);
    //return;    
}

event Font GetFont(int XRes)
{
    return GetMidGameFont(XRes);
    //return;    
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