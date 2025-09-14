class UT2K4BotInfoPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var localized string NoInformation;
var localized string AggressionCaption;
var localized string AccuracyCaption;
var localized string AgilityCaption;
var localized string TacticsCaption;
var() automated GUIImage i_Portrait;
var() automated GUIProgressBar pb_Accuracy;
var() automated GUIProgressBar pb_Agility;
var() automated GUIProgressBar pb_Tactics;
var() automated GUIProgressBar pb_Aggression;
var() automated GUIScrollTextBox lb_Deco;
var() automated GUISectionBackground sb_PicBK;
var() automated AltSectionBackground sb_HistBK;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    sb_Main.SetPosition(0.3632430, 0.0575580, 0.5391400, 0.3361320);
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
    //return;    
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
    else
    {
        TextName = DecoTextName;
    }
    // End:0x96
    if(DecoTextName != "")
    {
        BotDeco = Class'WGame.wUtil'.static.LoadDecoText(Package, TextName);
    }
    sb_PicBK.Caption = PRE.DefaultName;
    i = Class'UnrealGame.CustomBotConfig'.static.IndexFor(PRE.DefaultName);
    // End:0x1D9
    if(i != -1)
    {
        FavWeap = Class'UnrealGame.CustomBotConfig'.static.GetFavoriteWeaponFor(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[i]);
        pb_Aggression.Value = float(Class'UnrealGame.CustomBotConfig'.static.AggressivenessRating(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[i]));
        pb_Agility.Value = float(Class'UnrealGame.CustomBotConfig'.static.AgilityRating(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[i]));
        pb_Tactics.Value = float(Class'UnrealGame.CustomBotConfig'.static.TacticsRating(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[i]));
        pb_Accuracy.Value = float(Class'UnrealGame.CustomBotConfig'.static.AccuracyRating(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[i]));        
    }
    else
    {
        FavWeap = Class'WGame.wUtil'.static.GetFavoriteWeaponFor(PRE);
        pb_Aggression.Value = float(Class'WGame.wUtil'.static.AggressivenessRating(PRE));
        pb_Agility.Value = float(Class'WGame.wUtil'.static.AgilityRating(PRE));
        pb_Tactics.Value = float(Class'WGame.wUtil'.static.TacticsRating(PRE));
        pb_Accuracy.Value = float(Class'WGame.wUtil'.static.AccuracyRating(PRE));
    }
    sb_Main.Caption = FavWeap;
    // End:0x2CF
    if(BotDeco != none)
    {
        lb_Deco.SetContent(JoinArray(BotDeco.Rows, "|"), "|");
    }
    sb_HistBK.Caption = PRE.Species.default.SpeciesName;
    //return;    
}

defaultproperties
{
    NoInformation="??? ????!"
    AggressionCaption="???"
    AccuracyCaption="???"
    AgilityCaption="???"
    TacticsCaption="??"
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4BotInfoPage.imgBotPic'
    begin object name="imgBotPic" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.0979230
        WinLeft=0.0798610
        WinWidth=0.2468750
        WinHeight=0.8668090
        RenderWeight=1.0100000
    end object
    i_Portrait=imgBotPic
    // Reference: GUIProgressBar'GUI2K4_Decompressed.UT2K4BotInfoPage.myPB'
    begin object name="myPB" class=XInterface.GUIProgressBar
        BarColor=(R=255,G=155,B=255,A=255)
        Value=50.0000000
        FontName="UT2SmallFont"
        bShowValue=false
        StyleName="TextLabel"
        WinHeight=0.0400000
        RenderWeight=1.2000000
    end object
    pb_Accuracy=myPB
    pb_Agility=myPB
    pb_Tactics=myPB
    pb_Aggression=myPB
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4BotInfoPage.DecoDescription'
    begin object name="DecoDescription" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=DecoDescription.InternalOnCreateComponent
        WinTop=0.6134470
        WinLeft=0.3530080
        WinWidth=0.5709360
        WinHeight=0.2695530
        bNeverFocus=true
    end object
    lb_Deco=DecoDescription
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4BotInfoPage.PicBK'
    begin object name="PicBK" class=XInterface.GUISectionBackground
        WinTop=0.0575580
        WinLeft=0.0261500
        WinWidth=0.2908200
        WinHeight=0.6617310
        OnPreDraw=PicBK.InternalPreDraw
    end object
    sb_PicBK=PicBK
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4BotInfoPage.HistBk'
    begin object name="HistBk" class=GUI2K4_Decompressed.AltSectionBackground
        LeftPadding=0.0100000
        RightPadding=0.0100000
        WinTop=0.5157900
        WinLeft=0.3578910
        WinWidth=0.5465220
        WinHeight=0.2695530
        OnPreDraw=HistBk.InternalPreDraw
    end object
    sb_HistBK=HistBk
    WinTop=0.1002280
    WinLeft=0.0458980
    WinWidth=0.9023440
    WinHeight=0.7591150
}