/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2BotInfoPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class UT2BotInfoPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var localized string NoInformation;
var export editinline GUIImage BotPortrait;
var export editinline GUILabel botname;
var export editinline GUILabel BotRace;
var array<export editinline GUIProgressBar> Bars;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    BotPortrait = GUIImage(Controls[1]);
    botname = GUILabel(Controls[3]);
    BotRace = GUILabel(Controls[4]);
    Bars[0] = GUIProgressBar(Controls[5]);
    Bars[1] = GUIProgressBar(Controls[6]);
    Bars[2] = GUIProgressBar(Controls[7]);
    Bars[3] = GUIProgressBar(Controls[8]);
    Bars[4] = GUIProgressBar(Controls[9]);
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    BotPortrait.Image = PRE.Portrait;
    botname.Caption = PRE.DefaultName;
    BotRace.Caption = PRE.Species.default.SpeciesName $ " - " $ class'wUtil'.static.GetFavoriteWeaponFor(PRE);
    Bars[0].Value = float(class'wUtil'.static.AccuracyRating(PRE));
    Bars[1].Value = float(class'wUtil'.static.AgilityRating(PRE));
    Bars[2].Value = float(class'wUtil'.static.TacticsRating(PRE));
    Bars[3].Value = float(class'wUtil'.static.AccuracyRating(PRE));
}

function bool OkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    NoInformation="No information."
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.70
}