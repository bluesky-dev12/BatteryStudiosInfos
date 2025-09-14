class Tab_InstantActionBaseRules extends UT2K3TabPanel
    config(User)
    editinlinenew
    instanced;

var config float LastFriendlyFire;
var config bool LastWeaponStay;
var config bool LastTranslocator;
var config float LastGameSpeed;
var config int LastGoalScore;
var config int LastTimeLimit;
var config int LastMaxLives;
var config bool bLastWeaponThrowing;
var export editinline GUISlider MyGameSpeed;
var export editinline moCheckBox MyWeaponStay;
var export editinline moCheckBox MyTranslocator;
var export editinline GUISlider MyFriendlyFire;
var export editinline moNumericEdit MyGoalScore;
var export editinline moNumericEdit MyTimeLimit;
var export editinline moNumericEdit MyMaxLives;
var export editinline moCheckBox MyWeaponThrowing;
var export editinline moCheckBox MyBrightSkins;
var localized string PercentText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int NewGameSpeed;

    super(GUIPanel).InitComponent(MyController, myOwner);
    MyGameSpeed = GUISlider(Controls[4]);
    MyWeaponStay = moCheckBox(Controls[5]);
    MyTranslocator = moCheckBox(Controls[6]);
    MyFriendlyFire = GUISlider(Controls[8]);
    MyGoalScore = moNumericEdit(Controls[9]);
    MyTimeLimit = moNumericEdit(Controls[10]);
    MyMaxLives = moNumericEdit(Controls[11]);
    NewGameSpeed = int(LastGameSpeed * float(100));
    MyGameSpeed.Value = float(Clamp(NewGameSpeed, 50, 200));
    MyWeaponStay.Checked(LastWeaponStay);
    MyFriendlyFire.Value = LastFriendlyFire * float(100);
    MyTranslocator.Checked(LastTranslocator);
    MyGoalScore.SetValue(LastGoalScore);
    MyTimeLimit.SetValue(LastTimeLimit);
    MyMaxLives.SetValue(LastMaxLives);
    MyGameSpeed.__OnDrawCaption__Delegate = InternalGameSpeedDraw;
    MyFriendlyFire.__OnDrawCaption__Delegate = InternalFriendlyFireDraw;
    Controls[4].FriendlyLabel = GUILabel(Controls[3]);
    Controls[8].FriendlyLabel = GUILabel(Controls[7]);
    MyWeaponThrowing = moCheckBox(Controls[12]);
    MyWeaponThrowing.Checked(bLastWeaponThrowing);
    MyBrightSkins = moCheckBox(Controls[13]);
    MyBrightSkins.Checked(Class'UnrealGame.DMMutator'.default.bBrightSkins);
    //return;    
}

function string Play()
{
    local string URL;

    LastGameSpeed = MyGameSpeed.Value / float(100);
    LastWeaponStay = MyWeaponStay.IsChecked();
    LastTranslocator = MyTranslocator.IsChecked();
    LastFriendlyFire = MyFriendlyFire.Value / float(100);
    LastGoalScore = MyGoalScore.GetValue();
    LastTimeLimit = MyTimeLimit.GetValue();
    LastMaxLives = MyMaxLives.GetValue();
    bLastWeaponThrowing = MyWeaponThrowing.IsChecked();
    SaveConfig();
    URL = (((((("?GameSpeed=" $ string(LastGameSpeed)) $ "?WeaponStay=") $ string(LastWeaponStay)) $ "?Translocator=") $ string(LastTranslocator)) $ "?FriendlyFireScale=") $ string(LastFriendlyFire);
    URL = (((((URL $ "?GoalScore=") $ string(LastGoalScore)) $ "?TimeLimit=") $ string(LastTimeLimit)) $ "?MaxLives=") $ string(LastMaxLives);
    // End:0x1AD
    if(bLastWeaponThrowing)
    {
        URL = (URL $ "?AllowThrowing=") $ string(bLastWeaponThrowing);
    }
    return URL;
    //return;    
}

function string InternalGameSpeedDraw()
{
    return (("(" $ string(int(MyGameSpeed.Value))) @ PercentText) $ ")";
    //return;    
}

function string InternalFriendlyFireDraw()
{
    return (("(" $ string(int(MyFriendlyFire.Value))) @ PercentText) $ ")";
    //return;    
}

function BrightOnchange(GUIComponent Sender)
{
    Class'UnrealGame.DMMutator'.default.bBrightSkins = MyBrightSkins.IsChecked();
    Class'UnrealGame.DMMutator'.static.StaticSaveConfig();
    //return;    
}

defaultproperties
{
    bLastWeaponThrowing=true
    PercentText="percent"
    // Reference: GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK1'
    begin object name="IARulesBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0246870
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.1560160
    end object
    Controls[0]=IARulesBK1
    // Reference: GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK2'
    begin object name="IARulesBK2" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.2395310
        WinLeft=0.5099220
        WinWidth=0.4692190
        WinHeight=0.4870710
    end object
    Controls[1]=IARulesBK2
    // Reference: GUIImage'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBK3'
    begin object name="IARulesBK3" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.2395310
        WinLeft=0.0195310
        WinWidth=0.4692190
        WinHeight=0.4870710
    end object
    Controls[2]=IARulesBK3
    // Reference: GUILabel'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGameSpeedLabel'
    begin object name="IARulesGameSpeedLabel" class=XInterface_Decompressed.GUILabel
        Caption="Game Speed"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.0414060
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=32.0000000
    end object
    Controls[3]=IARulesGameSpeedLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGameSpeedSlider'
    begin object name="IARulesGameSpeedSlider" class=XInterface_Decompressed.GUISlider
        MinValue=50.0000000
        MaxValue=200.0000000
        CalcMarkerPosition=IARulesGameSpeedSlider.InternalCalcMarkerPosition
        Hint="This option controls how fast the game will be played."
        WinTop=0.0975520
        WinLeft=0.3750000
        WinWidth=0.2500000
        OnClick=IARulesGameSpeedSlider.InternalOnClick
        OnMousePressed=IARulesGameSpeedSlider.InternalOnMousePressed
        OnMouseRelease=IARulesGameSpeedSlider.InternalOnMouseRelease
        OnKeyEvent=IARulesGameSpeedSlider.InternalOnKeyEvent
        OnCapturedMouseMove=IARulesGameSpeedSlider.InternalCapturedMouseMove
    end object
    Controls[4]=IARulesGameSpeedSlider
    // Reference: moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesWeaponStay'
    begin object name="IARulesWeaponStay" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Weapon Stay"
        OnCreateComponent=IARulesWeaponStay.InternalOnCreateComponent
        Hint="When enabled, weapons will always be available for pickup."
        WinTop=0.3151040
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[5]=IARulesWeaponStay
    // Reference: moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesTranslocator'
    begin object name="IARulesTranslocator" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Include Translocator"
        OnCreateComponent=IARulesTranslocator.InternalOnCreateComponent
        Hint="Enable this option to allow Translocators."
        WinTop=0.4281250
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[6]=IARulesTranslocator
    // Reference: GUILabel'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesFriendlyFireLabel'
    begin object name="IARulesFriendlyFireLabel" class=XInterface_Decompressed.GUILabel
        Caption="FriendlyFire"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.5408330
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[7]=IARulesFriendlyFireLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesFriendlyFireSlider'
    begin object name="IARulesFriendlyFireSlider" class=XInterface_Decompressed.GUISlider
        MaxValue=200.0000000
        CalcMarkerPosition=IARulesFriendlyFireSlider.InternalCalcMarkerPosition
        Hint="This option controls how much damage you do to teammates."
        WinTop=0.6000000
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnClick=IARulesFriendlyFireSlider.InternalOnClick
        OnMousePressed=IARulesFriendlyFireSlider.InternalOnMousePressed
        OnMouseRelease=IARulesFriendlyFireSlider.InternalOnMouseRelease
        OnKeyEvent=IARulesFriendlyFireSlider.InternalOnKeyEvent
        OnCapturedMouseMove=IARulesFriendlyFireSlider.InternalCapturedMouseMove
    end object
    Controls[8]=IARulesFriendlyFireSlider
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesGoalScore'
    begin object name="IARulesGoalScore" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=99
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="Goal Score"
        OnCreateComponent=IARulesGoalScore.InternalOnCreateComponent
        Hint="The game will end when this threshold is met."
        WinTop=0.3151040
        WinLeft=0.5539060
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[9]=IARulesGoalScore
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesTimeLimit'
    begin object name="IARulesTimeLimit" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=3600
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="Time Limit"
        OnCreateComponent=IARulesTimeLimit.InternalOnCreateComponent
        Hint="The game will end after this many minutes of play."
        WinTop=0.4281250
        WinLeft=0.5539060
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[10]=IARulesTimeLimit
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesMaxLives'
    begin object name="IARulesMaxLives" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=255
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="Max Lives"
        OnCreateComponent=IARulesMaxLives.InternalOnCreateComponent
        Hint="If this value is not 0, you will only respawn this many times."
        WinTop=0.5476560
        WinLeft=0.5539060
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[11]=IARulesMaxLives
    // Reference: moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesAllowWeaponThrow'
    begin object name="IARulesAllowWeaponThrow" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Allow Weapon Throwing"
        OnCreateComponent=IARulesAllowWeaponThrow.InternalOnCreateComponent
        Hint="When selected, a player will have the ability to throw out his current weapon."
        WinTop=0.3708330
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
    end object
    Controls[12]=IARulesAllowWeaponThrow
    // Reference: moCheckBox'XInterface_Decompressed.Tab_InstantActionBaseRules.IARulesBrightSkins'
    begin object name="IARulesBrightSkins" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9250000
        Caption="Bright Skins"
        OnCreateComponent=IARulesBrightSkins.InternalOnCreateComponent
        Hint="When selected, the server will cause the skins to be brighter than usual."
        WinTop=0.4795850
        WinLeft=0.0482420
        WinWidth=0.3906260
        WinHeight=0.0400000
        OnChange=Tab_InstantActionBaseRules.BrightOnchange
    end object
    Controls[13]=IARulesBrightSkins
    WinTop=0.1500000
    WinHeight=0.7700000
}