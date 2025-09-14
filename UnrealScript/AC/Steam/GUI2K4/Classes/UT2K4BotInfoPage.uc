/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4BotInfoPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4BotInfoPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var localized string NoInformation;
var localized string AggressionCaption;
var localized string AccuracyCaption;
var localized string AgilityCaption;
var localized string TacticsCaption;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Portrait;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIProgressBar pb_Accuracy;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIProgressBar pb_Agility;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIProgressBar pb_Tactics;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIProgressBar pb_Aggression;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Deco;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_PicBK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_HistBK;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sb_Main.SetPosition(0.3632430, 0.0575580, 0.539140, 0.3361320);
    sb_PicBK.ManageComponent(i_Portrait);
    sb_HistBK.ManageComponent(lb_Deco);
    sb_Main.ManageComponent(pb_Accuracy);
    sb_Main.ManageComponent(pb_Agility);
    sb_Main.ManageComponent(pb_Tactics);
    sb_Main.ManageComponent(pb_Aggression);
    pb_Accuracy.Caption = AccuracyCaption;
    pb_Agility.Caption = AgilityCaption;
    pb_Tactics.Caption = TacticsCaption;
    pb_Aggression.Caption = AggressionCaption;
    b_Cancel.SetVisibility(false);
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    local DecoText BotDeco;
    local int i;
    local string FavWeap, Package, TextName;

    i_Portrait.Image = PRE.Portrait;
    // End:0x35
    if(DecoTextName == "")
    {
        DecoTextName = PRE.TextName;
    }
    // End:0x60
    if(InStr(DecoTextName, ".") != -1)
    {
        Divide(DecoTextName, ".", Package, TextName);
    }
    // End:0x6b
    else
    {
        TextName = DecoTextName;
    }
    // End:0x96
    if(DecoTextName != "")
    {
        BotDeco = class'wUtil'.static.LoadDecoText(Package, TextName);
    }
    sb_PicBK.Caption = PRE.DefaultName;
    i = class'CustomBotConfig'.static.IndexFor(PRE.DefaultName);
    // End:0x1d9
    if(i != -1)
    {
        FavWeap = class'CustomBotConfig'.static.GetFavoriteWeaponFor(class'CustomBotConfig'.default.ConfigArray[i]);
        pb_Aggression.Value = float(class'CustomBotConfig'.static.AggressivenessRating(class'CustomBotConfig'.default.ConfigArray[i]));
        pb_Agility.Value = float(class'CustomBotConfig'.static.AgilityRating(class'CustomBotConfig'.default.ConfigArray[i]));
        pb_Tactics.Value = float(class'CustomBotConfig'.static.TacticsRating(class'CustomBotConfig'.default.ConfigArray[i]));
        pb_Accuracy.Value = float(class'CustomBotConfig'.static.AccuracyRating(class'CustomBotConfig'.default.ConfigArray[i]));
    }
    // End:0x287
    else
    {
        FavWeap = class'wUtil'.static.GetFavoriteWeaponFor(PRE);
        pb_Aggression.Value = float(class'wUtil'.static.AggressivenessRating(PRE));
        pb_Agility.Value = float(class'wUtil'.static.AgilityRating(PRE));
        pb_Tactics.Value = float(class'wUtil'.static.TacticsRating(PRE));
        pb_Accuracy.Value = float(class'wUtil'.static.AccuracyRating(PRE));
    }
    sb_Main.Caption = FavWeap;
    // End:0x2cf
    if(BotDeco != none)
    {
        lb_Deco.SetContent(JoinArray(BotDeco.Rows, "|"), "|");
    }
    sb_HistBK.Caption = PRE.Species.default.SpeciesName;
}

defaultproperties
{
    NoInformation="??? ????!"
    AggressionCaption="???"
    AccuracyCaption="???"
    AgilityCaption="???"
    TacticsCaption="??"
    begin object name=imgBotPic class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.0979230
        WinLeft=0.0798610
        WinWidth=0.2468750
        WinHeight=0.8668090
        RenderWeight=1.010
    object end
    // Reference: GUIImage'UT2K4BotInfoPage.imgBotPic'
    i_Portrait=imgBotPic
    begin object name=myPB class=GUIProgressBar
        BarColor=(R=255,G=155,B=255,A=255)
        Value=50.0
        FontName="UT2SmallFont"
        bShowValue=true
        StyleName="TextLabel"
        WinHeight=0.040
        RenderWeight=1.20
    object end
    // Reference: GUIProgressBar'UT2K4BotInfoPage.myPB'
    pb_Accuracy=myPB
    begin object name=myPB class=GUIProgressBar
        BarColor=(R=255,G=155,B=255,A=255)
        Value=50.0
        FontName="UT2SmallFont"
        bShowValue=true
        StyleName="TextLabel"
        WinHeight=0.040
        RenderWeight=1.20
    object end
    // Reference: GUIProgressBar'UT2K4BotInfoPage.myPB'
    pb_Agility=myPB
    begin object name=myPB class=GUIProgressBar
        BarColor=(R=255,G=155,B=255,A=255)
        Value=50.0
        FontName="UT2SmallFont"
        bShowValue=true
        StyleName="TextLabel"
        WinHeight=0.040
        RenderWeight=1.20
    object end
    // Reference: GUIProgressBar'UT2K4BotInfoPage.myPB'
    pb_Tactics=myPB
    begin object name=myPB class=GUIProgressBar
        BarColor=(R=255,G=155,B=255,A=255)
        Value=50.0
        FontName="UT2SmallFont"
        bShowValue=true
        StyleName="TextLabel"
        WinHeight=0.040
        RenderWeight=1.20
    object end
    // Reference: GUIProgressBar'UT2K4BotInfoPage.myPB'
    pb_Aggression=myPB
    begin object name=DecoDescription class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6134470
        WinLeft=0.3530080
        WinWidth=0.5709360
        WinHeight=0.2695530
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4BotInfoPage.DecoDescription'
    lb_Deco=DecoDescription
    begin object name=PicBK class=GUISectionBackground
        WinTop=0.0575580
        WinLeft=0.026150
        WinWidth=0.290820
        WinHeight=0.6617310
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4BotInfoPage.PicBK'
    sb_PicBK=PicBK
    begin object name=HistBk class=AltSectionBackground
        LeftPadding=0.010
        RightPadding=0.010
        WinTop=0.515790
        WinLeft=0.3578910
        WinWidth=0.5465220
        WinHeight=0.2695530
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4BotInfoPage.HistBk'
    sb_HistBK=HistBk
    WinTop=0.1002280
    WinLeft=0.0458980
    WinWidth=0.9023440
    WinHeight=0.7591150
}