/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2BotConfigPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:15
 *
 *******************************************************************************/
class UT2BotConfigPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var localized string NoInformation;
var export editinline GUIImage BotPortrait;
var export editinline GUILabel botname;
var int ConfigIndex;
var PlayerRecord ThisBot;
var bool bIgnoreChange;
var export editinline moComboBox Wep;
var array<WeaponRecord> Records;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    BotPortrait = GUIImage(Controls[1]);
    botname = GUILabel(Controls[3]);
    class'CacheManager'.static.GetWeaponList(Records);
    Wep = moComboBox(Controls[13]);
    Wep.AddItem("None");
    i = 0;
    J0x75:
    // End:0xbf [While If]
    if(i < Records.Length)
    {
        Wep.AddItem(Records[i].FriendlyName,, Records[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    Wep.__OnChange__Delegate = ComboBoxChange;
    moSlider(Controls[6]).MySlider.__OnDrawCaption__Delegate = AggDC;
    moSlider(Controls[7]).MySlider.__OnDrawCaption__Delegate = AccDC;
    moSlider(Controls[8]).MySlider.__OnDrawCaption__Delegate = ComDC;
    moSlider(Controls[9]).MySlider.__OnDrawCaption__Delegate = StrDC;
    moSlider(Controls[10]).MySlider.__OnDrawCaption__Delegate = TacDC;
    moSlider(Controls[11]).MySlider.__OnDrawCaption__Delegate = ReaDC;
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    ThisBot = PRE;
    BotPortrait.Image = PRE.Portrait;
    botname.Caption = PRE.DefaultName;
    ConfigIndex = class'CustomBotConfig'.static.IndexFor(PRE.DefaultName);
    bIgnoreChange = true;
    // End:0x1f4
    if(ConfigIndex >= 0)
    {
        moSlider(Controls[6]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness);
        moSlider(Controls[7]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy);
        moSlider(Controls[8]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle);
        moSlider(Controls[9]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility);
        moSlider(Controls[10]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics);
        moSlider(Controls[11]).SetValue(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime);
        moCheckBox(Controls[12]).Checked(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness > 0.50);
        Wep.Find(class'CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon,, true);
    }
    // End:0x30c
    else
    {
        moSlider(Controls[6]).SetValue(float(PRE.Aggressiveness));
        moSlider(Controls[7]).SetValue(float(PRE.Accuracy));
        moSlider(Controls[8]).SetValue(float(PRE.CombatStyle));
        moSlider(Controls[9]).SetValue(float(PRE.StrafingAbility));
        moSlider(Controls[10]).SetValue(float(PRE.Tactics));
        moSlider(Controls[11]).SetValue(float(PRE.ReactionTime));
        moCheckBox(Controls[12]).Checked(float(PRE.Jumpiness) > 0.50);
        Wep.Find(PRE.FavoriteWeapon,, true);
    }
    bIgnoreChange = false;
}

function bool OkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    class'CustomBotConfig'.static.StaticSaveConfig();
    return true;
}

function bool ResetClick(GUIComponent Sender)
{
    bIgnoreChange = true;
    SetDefaults();
    moSlider(Controls[6]).SetValue(float(ThisBot.Aggressiveness));
    moSlider(Controls[7]).SetValue(float(ThisBot.Accuracy));
    moSlider(Controls[8]).SetValue(float(ThisBot.CombatStyle));
    moSlider(Controls[9]).SetValue(float(ThisBot.StrafingAbility));
    moSlider(Controls[10]).SetValue(float(ThisBot.Tactics));
    moSlider(Controls[11]).SetValue(float(ThisBot.ReactionTime));
    moCheckBox(Controls[12]).Checked(float(ThisBot.Jumpiness) > 0.50);
    Wep.Find(ThisBot.FavoriteWeapon, false, true);
    bIgnoreChange = false;
    return true;
}

function string DoPerc(GUISlider control)
{
    local float R, V, vMin;

    vMin = control.MinValue;
    R = control.MaxValue - vMin;
    V = control.Value - vMin;
    return string(int(V / R * float(100)));
}

function string AggDC()
{
    return DoPerc(moSlider(Controls[6]).MySlider) $ "%";
}

function string AccDC()
{
    return DoPerc(moSlider(Controls[7]).MySlider) $ "%";
}

function string ComDC()
{
    return DoPerc(moSlider(Controls[8]).MySlider) $ "%";
}

function string StrDC()
{
    return DoPerc(moSlider(Controls[9]).MySlider) $ "%";
}

function string TacDC()
{
    return DoPerc(moSlider(Controls[10]).MySlider) $ "%";
}

function string ReaDC()
{
    return DoPerc(moSlider(Controls[11]).MySlider) $ "%";
}

function SetDefaults()
{
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].CharacterName = ThisBot.DefaultName;
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].PlayerName = ThisBot.DefaultName;
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon = ThisBot.FavoriteWeapon;
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness = float(ThisBot.Aggressiveness);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy = float(ThisBot.Accuracy);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle = float(ThisBot.CombatStyle);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility = float(ThisBot.StrafingAbility);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics = float(ThisBot.Tactics);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime = float(ThisBot.ReactionTime);
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = float(ThisBot.Jumpiness);
}

function SliderChange(GUIComponent Sender)
{
    local export editinline GUISlider S;

    // End:0x29
    if(moSlider(Sender) != none)
    {
        S = moSlider(Sender).MySlider;
    }
    // End:0x41
    if(bIgnoreChange || S == none)
    {
        return;
    }
    // End:0x83
    if(ConfigIndex == -1)
    {
        ConfigIndex = class'CustomBotConfig'.default.ConfigArray.Length;
        class'CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    // End:0xc0
    if(S == Controls[6])
    {
        class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness = S.Value;
    }
    // End:0x1ee
    else
    {
        // End:0xfd
        if(S == Controls[7])
        {
            class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy = S.Value;
        }
        // End:0x1ee
        else
        {
            // End:0x13a
            if(S == Controls[8])
            {
                class'CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle = S.Value;
            }
            // End:0x1ee
            else
            {
                // End:0x177
                if(S == Controls[9])
                {
                    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility = S.Value;
                }
                // End:0x1ee
                else
                {
                    // End:0x1b4
                    if(S == Controls[10])
                    {
                        class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics = S.Value;
                    }
                    // End:0x1ee
                    else
                    {
                        // End:0x1ee
                        if(S == Controls[11])
                        {
                            class'CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime = S.Value;
                        }
                    }
                }
            }
        }
    }
}

function CheckBoxChange(GUIComponent Sender)
{
    // End:0x1f
    if(bIgnoreChange || Sender != Controls[18])
    {
        return;
    }
    // End:0x61
    if(ConfigIndex == -1)
    {
        ConfigIndex = class'CustomBotConfig'.default.ConfigArray.Length;
        class'CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    // End:0x9d
    if(moCheckBox(Controls[18]).IsChecked())
    {
        class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = 1.0;
    }
    // End:0xbc
    else
    {
        class'CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = 0.0;
    }
}

function ComboBoxChange(GUIComponent Sender)
{
    // End:0x1f
    if(bIgnoreChange || Sender != Controls[13])
    {
        return;
    }
    // End:0x61
    if(ConfigIndex == -1)
    {
        ConfigIndex = class'CustomBotConfig'.default.ConfigArray.Length;
        class'CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    class'CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon = moComboBox(Sender).GetExtra();
}

defaultproperties
{
    NoInformation="No information."
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.10
    WinHeight=0.80
}