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
    //return;    
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    BotPortrait.Image = PRE.Portrait;
    botname.Caption = PRE.DefaultName;
    BotRace.Caption = (PRE.Species.default.SpeciesName $ " - ") $ Class'WGame.wUtil'.static.GetFavoriteWeaponFor(PRE);
    Bars[0].Value = float(Class'WGame.wUtil'.static.AccuracyRating(PRE));
    Bars[1].Value = float(Class'WGame.wUtil'.static.AgilityRating(PRE));
    Bars[2].Value = float(Class'WGame.wUtil'.static.TacticsRating(PRE));
    Bars[3].Value = float(Class'WGame.wUtil'.static.AccuracyRating(PRE));
    //return;    
}

function bool OkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    NoInformation="No information."
    // Reference: GUIImage'XInterface_Decompressed.UT2BotInfoPage.PageBack'
    begin object name="PageBack" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        WinLeft=0.0625000
        WinWidth=0.8906250
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[0]=PageBack
    // Reference: GUIImage'XInterface_Decompressed.UT2BotInfoPage.imgBotPic'
    begin object name="imgBotPic" class=XInterface_Decompressed.GUIImage
        ImageStyle=4
        ImageRenderStyle=1
        WinTop=0.1708340
        WinLeft=0.0781250
        WinWidth=0.2468750
        WinHeight=0.6580080
    end object
    Controls[1]=imgBotPic
    // Reference: GUIImage'XInterface_Decompressed.UT2BotInfoPage.BotPortraitBorder'
    begin object name="BotPortraitBorder" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        WinTop=0.1687510
        WinLeft=0.0765630
        WinWidth=0.2531250
        WinHeight=0.6642580
    end object
    Controls[2]=BotPortraitBorder
    // Reference: GUILabel'XInterface_Decompressed.UT2BotInfoPage.lblName'
    begin object name="lblName" class=XInterface_Decompressed.GUILabel
        Caption="Unknown"
        TextAlign=1
        TextColor=(R=153,G=216,B=253,A=255)
        WinTop=0.1757810
        WinLeft=0.3330080
        WinWidth=0.5984370
        WinHeight=0.0525390
    end object
    Controls[3]=lblName
    // Reference: GUILabel'XInterface_Decompressed.UT2BotInfoPage.lblRace'
    begin object name="lblRace" class=XInterface_Decompressed.GUILabel
        Caption="Unknown"
        TextAlign=1
        TextColor=(R=153,G=216,B=253,A=255)
        TextFont="UT2SmallFont"
        WinTop=0.2317710
        WinLeft=0.3320310
        WinWidth=0.6091800
        WinHeight=0.0476560
    end object
    Controls[4]=lblRace
    // Reference: GUIProgressBar'XInterface_Decompressed.UT2BotInfoPage.myPB'
    begin object name="myPB" class=XInterface_Decompressed.GUIProgressBar
        BarColor=(R=0,G=160,B=0,A=255)
        Value=45.0000000
        Caption="Accuracy"
        FontName="UT2SmallFont"
        WinTop=0.3291670
        WinLeft=0.3359380
        WinWidth=0.6000000
        WinHeight=0.0625000
    end object
    Controls[5]=myPB
    // Reference: GUIProgressBar'XInterface_Decompressed.UT2BotInfoPage.myPB2'
    begin object name="myPB2" class=XInterface_Decompressed.GUIProgressBar
        BarColor=(R=0,G=160,B=0,A=255)
        Value=20.0000000
        Caption="Quickness"
        FontName="UT2SmallFont"
        WinTop=0.4104170
        WinLeft=0.3359380
        WinWidth=0.6000000
        WinHeight=0.0625000
    end object
    Controls[6]=myPB2
    // Reference: GUIProgressBar'XInterface_Decompressed.UT2BotInfoPage.myPB3'
    begin object name="myPB3" class=XInterface_Decompressed.GUIProgressBar
        BarColor=(R=0,G=160,B=0,A=255)
        Value=50.0000000
        Caption="Tactics"
        FontName="UT2SmallFont"
        WinTop=0.4916670
        WinLeft=0.3359380
        WinWidth=0.6000000
        WinHeight=0.0625000
    end object
    Controls[7]=myPB3
    // Reference: GUIProgressBar'XInterface_Decompressed.UT2BotInfoPage.myPB4'
    begin object name="myPB4" class=XInterface_Decompressed.GUIProgressBar
        BarColor=(R=0,G=160,B=0,A=255)
        Value=75.0000000
        Caption="Aggression"
        FontName="UT2SmallFont"
        WinTop=0.5729170
        WinLeft=0.3359380
        WinWidth=0.6000000
        WinHeight=0.0625000
    end object
    Controls[8]=myPB4
    // Reference: GUIProgressBar'XInterface_Decompressed.UT2BotInfoPage.myPB5'
    begin object name="myPB5" class=XInterface_Decompressed.GUIProgressBar
        BarColor=(R=0,G=160,B=0,A=255)
        Value=70.0000000
        Caption="Unknown!"
        FontName="UT2SmallFont"
        WinTop=0.6541670
        WinLeft=0.3359380
        WinWidth=0.6000000
        WinHeight=0.0625000
        bVisible=false
    end object
    Controls[9]=myPB5
    // Reference: GUIButton'XInterface_Decompressed.UT2BotInfoPage.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        WinTop=0.7625010
        WinLeft=0.7031250
        WinWidth=0.2375000
        WinHeight=0.0609380
        OnClick=UT2BotInfoPage.OkClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[10]=OkButton
    WinTop=0.1500000
    WinHeight=0.7000000
}