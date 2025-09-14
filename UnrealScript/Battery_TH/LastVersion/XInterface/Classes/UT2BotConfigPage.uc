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
    Class'Engine.CacheManager'.static.GetWeaponList(Records);
    Wep = moComboBox(Controls[13]);
    Wep.AddItem("None");
    i = 0;
    J0x75:

    // End:0xBF [Loop If]
    if(i < Records.Length)
    {
        Wep.AddItem(Records[i].FriendlyName,, Records[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x75;
    }
    Wep.__OnChange__Delegate = ComboBoxChange;
    moSlider(Controls[6]).MySlider.__OnDrawCaption__Delegate = AggDC;
    moSlider(Controls[7]).MySlider.__OnDrawCaption__Delegate = AccDC;
    moSlider(Controls[8]).MySlider.__OnDrawCaption__Delegate = ComDC;
    moSlider(Controls[9]).MySlider.__OnDrawCaption__Delegate = StrDC;
    moSlider(Controls[10]).MySlider.__OnDrawCaption__Delegate = TacDC;
    moSlider(Controls[11]).MySlider.__OnDrawCaption__Delegate = ReaDC;
    //return;    
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    ThisBot = PRE;
    BotPortrait.Image = PRE.Portrait;
    botname.Caption = PRE.DefaultName;
    ConfigIndex = Class'UnrealGame.CustomBotConfig'.static.IndexFor(PRE.DefaultName);
    bIgnoreChange = true;
    // End:0x1F4
    if(ConfigIndex >= 0)
    {
        moSlider(Controls[6]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness);
        moSlider(Controls[7]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy);
        moSlider(Controls[8]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle);
        moSlider(Controls[9]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility);
        moSlider(Controls[10]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics);
        moSlider(Controls[11]).SetValue(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime);
        moCheckBox(Controls[12]).Checked(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness > 0.5000000);
        Wep.Find(Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon,, true);        
    }
    else
    {
        moSlider(Controls[6]).SetValue(float(PRE.Aggressiveness));
        moSlider(Controls[7]).SetValue(float(PRE.Accuracy));
        moSlider(Controls[8]).SetValue(float(PRE.CombatStyle));
        moSlider(Controls[9]).SetValue(float(PRE.StrafingAbility));
        moSlider(Controls[10]).SetValue(float(PRE.Tactics));
        moSlider(Controls[11]).SetValue(float(PRE.ReactionTime));
        moCheckBox(Controls[12]).Checked(float(PRE.Jumpiness) > 0.5000000);
        Wep.Find(PRE.FavoriteWeapon,, true);
    }
    bIgnoreChange = false;
    //return;    
}

function bool OkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    Class'UnrealGame.CustomBotConfig'.static.StaticSaveConfig();
    return true;
    //return;    
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
    moCheckBox(Controls[12]).Checked(float(ThisBot.Jumpiness) > 0.5000000);
    Wep.Find(ThisBot.FavoriteWeapon, false, true);
    bIgnoreChange = false;
    return true;
    //return;    
}

function string DoPerc(GUISlider control)
{
    local float R, V, vMin;

    vMin = control.MinValue;
    R = control.MaxValue - vMin;
    V = control.Value - vMin;
    return string(int((V / R) * float(100)));
    //return;    
}

function string AggDC()
{
    return (DoPerc(moSlider(Controls[6]).MySlider)) $ "%";
    //return;    
}

function string AccDC()
{
    return (DoPerc(moSlider(Controls[7]).MySlider)) $ "%";
    //return;    
}

function string ComDC()
{
    return (DoPerc(moSlider(Controls[8]).MySlider)) $ "%";
    //return;    
}

function string StrDC()
{
    return (DoPerc(moSlider(Controls[9]).MySlider)) $ "%";
    //return;    
}

function string TacDC()
{
    return (DoPerc(moSlider(Controls[10]).MySlider)) $ "%";
    //return;    
}

function string ReaDC()
{
    return (DoPerc(moSlider(Controls[11]).MySlider)) $ "%";
    //return;    
}

function SetDefaults()
{
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].CharacterName = ThisBot.DefaultName;
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].PlayerName = ThisBot.DefaultName;
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon = ThisBot.FavoriteWeapon;
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness = float(ThisBot.Aggressiveness);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy = float(ThisBot.Accuracy);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle = float(ThisBot.CombatStyle);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility = float(ThisBot.StrafingAbility);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics = float(ThisBot.Tactics);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime = float(ThisBot.ReactionTime);
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = float(ThisBot.Jumpiness);
    //return;    
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
        ConfigIndex = Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length;
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    // End:0xC0
    if(S == Controls[6])
    {
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Aggressiveness = S.Value;        
    }
    else
    {
        // End:0xFD
        if(S == Controls[7])
        {
            Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Accuracy = S.Value;            
        }
        else
        {
            // End:0x13A
            if(S == Controls[8])
            {
                Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].CombatStyle = S.Value;                
            }
            else
            {
                // End:0x177
                if(S == Controls[9])
                {
                    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].StrafingAbility = S.Value;                    
                }
                else
                {
                    // End:0x1B4
                    if(S == Controls[10])
                    {
                        Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Tactics = S.Value;                        
                    }
                    else
                    {
                        // End:0x1EE
                        if(S == Controls[11])
                        {
                            Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].ReactionTime = S.Value;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function CheckBoxChange(GUIComponent Sender)
{
    // End:0x1F
    if(bIgnoreChange || Sender != Controls[18])
    {
        return;
    }
    // End:0x61
    if(ConfigIndex == -1)
    {
        ConfigIndex = Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length;
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    // End:0x9D
    if(moCheckBox(Controls[18]).IsChecked())
    {
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = 1.0000000;        
    }
    else
    {
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].Jumpiness = 0.0000000;
    }
    //return;    
}

function ComboBoxChange(GUIComponent Sender)
{
    // End:0x1F
    if(bIgnoreChange || Sender != Controls[13])
    {
        return;
    }
    // End:0x61
    if(ConfigIndex == -1)
    {
        ConfigIndex = Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length;
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    Class'UnrealGame.CustomBotConfig'.default.ConfigArray[ConfigIndex].FavoriteWeapon = moComboBox(Sender).GetExtra();
    //return;    
}

defaultproperties
{
    NoInformation="No Information Available!"
    // Reference: GUIImage'XInterface_Decompressed.UT2BotConfigPage.PageBack'
    begin object name="PageBack" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        WinLeft=0.0625000
        WinWidth=0.8906250
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[0]=PageBack
    // Reference: GUIImage'XInterface_Decompressed.UT2BotConfigPage.imgBotPic'
    begin object name="imgBotPic" class=XInterface_Decompressed.GUIImage
        ImageStyle=4
        ImageRenderStyle=1
        WinTop=0.1939820
        WinLeft=0.0781250
        WinWidth=0.2468750
        WinHeight=0.6580080
        RenderWeight=0.1001000
    end object
    Controls[1]=imgBotPic
    // Reference: GUIImage'XInterface_Decompressed.UT2BotConfigPage.BotPortraitBorder'
    begin object name="BotPortraitBorder" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        DropShadowX=8
        DropShadowY=8
        WinTop=0.1884270
        WinLeft=0.0765630
        WinWidth=0.2531250
        WinHeight=0.6642580
    end object
    Controls[2]=BotPortraitBorder
    // Reference: GUILabel'XInterface_Decompressed.UT2BotConfigPage.BotCfgName'
    begin object name="BotCfgName" class=XInterface_Decompressed.GUILabel
        Caption="Unknown"
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.1190680
        WinLeft=0.0847440
        WinWidth=0.5984370
        WinHeight=0.0525390
    end object
    Controls[3]=BotCfgName
    // Reference: GUIButton'XInterface_Decompressed.UT2BotConfigPage.ResetButton'
    begin object name="ResetButton" class=XInterface_Decompressed.GUIButton
        Caption="Reset"
        WinTop=0.8250010
        WinLeft=0.5859380
        WinWidth=0.1671870
        WinHeight=0.0453130
        OnClick=UT2BotConfigPage.ResetClick
        OnKeyEvent=ResetButton.InternalOnKeyEvent
    end object
    Controls[4]=ResetButton
    // Reference: GUIButton'XInterface_Decompressed.UT2BotConfigPage.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        WinTop=0.8250010
        WinLeft=0.7656250
        WinWidth=0.1671870
        WinHeight=0.0453130
        OnClick=UT2BotConfigPage.OkClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[5]=OkButton
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotAggrSlider'
    begin object name="BotAggrSlider" class=XInterface_Decompressed.moSlider
        MaxValue=1.0000000
        Caption="Aggressiveness"
        OnCreateComponent=BotAggrSlider.InternalOnCreateComponent
        Hint="Configures the aggressiveness rating of this bot."
        WinTop=0.2082290
        WinLeft=0.3453130
        WinWidth=0.5984380
        TabOrder=0
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[6]=BotAggrSlider
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotAccuracySlider'
    begin object name="BotAccuracySlider" class=XInterface_Decompressed.moSlider
        MaxValue=1.0000000
        MinValue=-1.0000000
        Caption="Accuracy"
        OnCreateComponent=BotAccuracySlider.InternalOnCreateComponent
        Hint="Configures the accuracy rating of this bot."
        WinTop=0.2811450
        WinLeft=0.3453130
        WinWidth=0.5984380
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[7]=BotAccuracySlider
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotCStyleSlider'
    begin object name="BotCStyleSlider" class=XInterface_Decompressed.moSlider
        MaxValue=1.0000000
        Caption="Combat Style"
        OnCreateComponent=BotCStyleSlider.InternalOnCreateComponent
        Hint="Adjusts the combat style of this bot."
        WinTop=0.3540620
        WinLeft=0.3453130
        WinWidth=0.5984380
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[8]=BotCStyleSlider
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotStrafeSlider'
    begin object name="BotStrafeSlider" class=XInterface_Decompressed.moSlider
        MaxValue=1.0000000
        Caption="Strafing Ability"
        OnCreateComponent=BotStrafeSlider.InternalOnCreateComponent
        Hint="Adjusts the strafing ability of this bot."
        WinTop=0.4269790
        WinLeft=0.3453130
        WinWidth=0.5984380
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[9]=BotStrafeSlider
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotTacticsSlider'
    begin object name="BotTacticsSlider" class=XInterface_Decompressed.moSlider
        MaxValue=1.0000000
        MinValue=-1.0000000
        Caption="Tactics"
        OnCreateComponent=BotTacticsSlider.InternalOnCreateComponent
        Hint="Adjusts the team-play awareness ability of this bot."
        WinTop=0.4998950
        WinLeft=0.3453130
        WinWidth=0.5984380
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[10]=BotTacticsSlider
    // Reference: moSlider'XInterface_Decompressed.UT2BotConfigPage.BotReactionSlider'
    begin object name="BotReactionSlider" class=XInterface_Decompressed.moSlider
        MaxValue=4.0000000
        MinValue=-4.0000000
        Caption="Reaction Time"
        OnCreateComponent=BotReactionSlider.InternalOnCreateComponent
        Hint="Adjusts the reaction speed of this bot."
        WinTop=0.5936450
        WinLeft=0.3453130
        WinWidth=0.5984380
        OnChange=UT2BotConfigPage.SliderChange
    end object
    Controls[11]=BotReactionSlider
    // Reference: moCheckBox'XInterface_Decompressed.UT2BotConfigPage.BotJumpy'
    begin object name="BotJumpy" class=XInterface_Decompressed.moCheckBox
        CaptionWidth=0.9000000
        Caption="Jump Happy"
        OnCreateComponent=BotJumpy.InternalOnCreateComponent
        Hint="Controls whether this bot jumps a lot during the game."
        WinTop=0.6665620
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0400000
        OnChange=UT2BotConfigPage.CheckBoxChange
    end object
    Controls[12]=BotJumpy
    // Reference: moComboBox'XInterface_Decompressed.UT2BotConfigPage.BotWeapon'
    begin object name="BotWeapon" class=XInterface_Decompressed.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.4500000
        Caption="Preferred Weapon"
        OnCreateComponent=BotWeapon.InternalOnCreateComponent
        Hint="Select which weapon this bot should prefer."
        WinTop=0.7290620
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0443750
    end object
    Controls[13]=BotWeapon
    WinTop=0.1000000
    WinHeight=0.8000000
}