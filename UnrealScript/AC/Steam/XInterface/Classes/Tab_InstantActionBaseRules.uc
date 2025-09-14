/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_InstantActionBaseRules.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:5
 *
 *******************************************************************************/
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
    MyBrightSkins.Checked(class'DMMutator'.default.bBrightSkins);
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
    URL = "?GameSpeed=" $ string(LastGameSpeed) $ "?WeaponStay=" $ string(LastWeaponStay) $ "?Translocator=" $ string(LastTranslocator) $ "?FriendlyFireScale=" $ string(LastFriendlyFire);
    URL = URL $ "?GoalScore=" $ string(LastGoalScore) $ "?TimeLimit=" $ string(LastTimeLimit) $ "?MaxLives=" $ string(LastMaxLives);
    // End:0x1ad
    if(bLastWeaponThrowing)
    {
        URL = URL $ "?AllowThrowing=" $ string(bLastWeaponThrowing);
    }
    return URL;
}

function string InternalGameSpeedDraw()
{
    return "(" $ string(int(MyGameSpeed.Value)) @ PercentText $ ")";
}

function string InternalFriendlyFireDraw()
{
    return "(" $ string(int(MyFriendlyFire.Value)) @ PercentText $ ")";
}

function BrightOnchange(GUIComponent Sender)
{
    class'DMMutator'.default.bBrightSkins = MyBrightSkins.IsChecked();
    class'DMMutator'.static.StaticSaveConfig();
}

defaultproperties
{
    bLastWeaponThrowing=true
    PercentText="Percent"
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.770
}