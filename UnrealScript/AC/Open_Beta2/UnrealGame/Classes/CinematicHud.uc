class CinematicHud extends HUD
    transient;

var float Delta;
var bool bHideScope;
var float xOffsets[2];
var float xRates[2];
var float yOffsets[2];
var float yRates[2];
var bool bInitialized;
var float Scale;
var string SubTitle;
var float SubTitleKillTime;

simulated event PostRender(Canvas Canvas)
{
    local float XL, YL;

    super.PostRender(Canvas);
    // End:0x2B
    if(Level.TimeSeconds > SubTitleKillTime)
    {
        SubTitle = "";
    }
    // End:0x11F
    if(SubTitle != "")
    {
        Canvas.SetDrawColor(byte(255), byte(255), 0, byte(255));
        Canvas.Font = LoadFontStatic(6);
        Canvas.StrLen(SubTitle, XL, YL);
        // End:0xAC
        if(XL >= Canvas.ClipX)
        {
            XL = 0.0000000;            
        }
        else
        {
            XL = (Canvas.ClipX / float(2)) - (XL / float(2));
        }
        Canvas.SetPos(0.0000000, Canvas.ClipY * 0.8500000);
        Canvas.bCenter = true;
        Canvas.DrawText(SubTitle, false);
    }
    //return;    
}

simulated function DrawHUD(Canvas Canvas)
{
    // End:0x16
    if(!bInitialized)
    {
        Initialize(Canvas);
    }
    Scale = Canvas.ClipX / float(1024);
    super.DrawHUD(Canvas);
    //return;    
}

simulated function Initialize(Canvas Canvas)
{
    // End:0x0F
    if(Scale == float(0))
    {
        return;
    }
    xOffsets[0] = -123.0000000 * Scale;
    xRates[0] = 512.0000000 * Scale;
    xOffsets[1] = Canvas.ClipY + float(1);
    xRates[1] = 512.0000000 * Scale;
    yOffsets[0] = (Canvas.ClipY / float(2)) - (64.0000000 * Scale);
    yOffsets[1] = yOffsets[0];
    yRates[0] = -200.0000000 * Scale;
    yRates[1] = 256.0000000 * Scale;
    bInitialized = true;
    //return;    
}

simulated function LocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    SubTitle = Message.static.GetString(Switch);
    SubTitleKillTime = Level.TimeSeconds + Message.static.GetLifeTime(Switch);
    //return;    
}

defaultproperties
{
    bHideScope=true
    FontArrayNames[0]="UT2003Fonts.jFontLarge1024x768"
    FontArrayNames[1]="UT2003Fonts.jFontLarge800x600"
    FontArrayNames[2]="UT2003Fonts.jFontLarge"
    FontArrayNames[3]="UT2003Fonts.jFontMedium1024x768"
    FontArrayNames[4]="UT2003Fonts.jFontMedium800x600"
    FontArrayNames[5]="UT2003Fonts.jFontMedium"
    FontArrayNames[6]="UT2003Fonts.jFontSmall"
    FontArrayNames[7]="UT2003Fonts.jFontSmallText800x600"
    FontArrayNames[8]="UT2003Fonts.FontSmallText"
}