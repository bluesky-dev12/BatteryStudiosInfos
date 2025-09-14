/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CinematicHud.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:4
 *
 *******************************************************************************/
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
    // End:0x2b
    if(Level.TimeSeconds > SubTitleKillTime)
    {
        SubTitle = "";
    }
    // End:0x11f
    if(SubTitle != "")
    {
        Canvas.SetDrawColor(byte(255), byte(255), 0, byte(255));
        Canvas.Font = LoadFontStatic(6);
        Canvas.StrLen(SubTitle, XL, YL);
        // End:0xac
        if(XL >= Canvas.ClipX)
        {
            XL = 0.0;
        }
        // End:0xd3
        else
        {
            XL = Canvas.ClipX / float(2) - XL / float(2);
        }
        Canvas.SetPos(0.0, Canvas.ClipY * 0.850);
        Canvas.bCenter = true;
        Canvas.DrawText(SubTitle, false);
    }
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
}

simulated function Initialize(Canvas Canvas)
{
    // End:0x0f
    if(Scale == float(0))
    {
        return;
    }
    xOffsets[0] = -123.0 * Scale;
    xRates[0] = 512.0 * Scale;
    xOffsets[1] = Canvas.ClipY + float(1);
    xRates[1] = 512.0 * Scale;
    yOffsets[0] = Canvas.ClipY / float(2) - 64.0 * Scale;
    yOffsets[1] = yOffsets[0];
    yRates[0] = -200.0 * Scale;
    yRates[1] = 256.0 * Scale;
    bInitialized = true;
}

simulated function LocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    SubTitle = Message.static.GetString(Switch);
    SubTitleKillTime = Level.TimeSeconds + Message.static.GetLifeTime(Switch);
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