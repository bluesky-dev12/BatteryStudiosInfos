class UT2K4BotConfigPage extends LockedFloatingWindow
    editinlinenew
    instanced;

var localized string NoInformation;
var localized string NoPref;
var localized string DefaultString;
var export editinline GUIImage BotPortrait;
var export editinline GUILabel botname;
var int ConfigIndex;
var PlayerRecord ThisBot;
var bool bIgnoreChange;
var() automated GUIImage i_Portrait;
var() automated moSlider sl_Agg;
var() automated moSlider sl_Acc;
var() automated moSlider sl_Com;
var() automated moSlider sl_Str;
var() automated moSlider sl_Tac;
var() automated moSlider sl_Rea;
var() automated moSlider sl_Jumpy;
var() automated moComboBox co_Weapon;
var() automated moComboBox co_Voice;
var() automated moComboBox co_Orders;
var() automated GUISectionBackground sb_PicBK;
var Class<CustomBotConfig> BotConfigClass;
var array<WeaponRecord> Records;
var localized string ResetString;
var localized string AttributesString;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    sb_PicBK.ManageComponent(i_Portrait);
    sb_Main.SetPosition(0.3505470, 0.0783910, 0.5655070, 0.6005860);
    sb_Main.Caption = AttributesString;
    sb_Main.ManageComponent(sl_Agg);
    sb_Main.ManageComponent(sl_Acc);
    sb_Main.ManageComponent(sl_Com);
    sb_Main.ManageComponent(sl_Str);
    sb_Main.ManageComponent(sl_Tac);
    sb_Main.ManageComponent(sl_Rea);
    sb_Main.ManageComponent(sl_Jumpy);
    sb_Main.ManageComponent(co_Weapon);
    sb_Main.ManageComponent(co_Voice);
    sb_Main.ManageComponent(co_Orders);
    Class'Engine.CacheManager'.static.GetWeaponList(Records);
    co_Weapon.AddItem(NoPref);
    i = 0;
    J0x14F:

    // End:0x199 [Loop If]
    if(i < Records.Length)
    {
        co_Weapon.AddItem(Records[i].FriendlyName,, Records[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x14F;
    }
    i = 0;
    J0x1A0:

    // End:0x1D9 [Loop If]
    if(i < 5)
    {
        co_Orders.AddItem(Class'Engine.GameProfile'.default.PositionName[i]);
        i++;
        // [Loop Continue]
        goto J0x1A0;
    }
    co_Weapon.__OnChange__Delegate = ComboBoxChange;
    sl_Agg.MySlider.__OnDrawCaption__Delegate = AggDC;
    sl_Acc.MySlider.__OnDrawCaption__Delegate = AccDC;
    sl_Com.MySlider.__OnDrawCaption__Delegate = ComDC;
    sl_Str.MySlider.__OnDrawCaption__Delegate = StrDC;
    sl_Tac.MySlider.__OnDrawCaption__Delegate = TacDC;
    sl_Rea.MySlider.__OnDrawCaption__Delegate = ReaDC;
    sl_Jumpy.MySlider.__OnDrawCaption__Delegate = JumpyDC;
    b_OK.__OnClick__Delegate = OkClick;
    b_Cancel.Caption = ResetString;
    b_Cancel.__OnClick__Delegate = ResetClick;
    //return;    
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    local int i;
    local array<string> VoicePackClasses;
    local Class<wVoicePack> Pack;

    bIgnoreChange = true;
    ThisBot = PRE;
    PlayerOwner().GetAllInt("WGame.wVoicePack", VoicePackClasses);
    co_Voice.MyComboBox.List.Clear();
    co_Voice.AddItem(DefaultString);
    i_Portrait.Image = PRE.Portrait;
    sb_PicBK.Caption = PRE.DefaultName;
    ConfigIndex = BotConfigClass.static.IndexFor(PRE.DefaultName);
    // End:0x273
    if(ConfigIndex >= 0)
    {
        sl_Agg.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].Aggressiveness);
        sl_Acc.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].Accuracy);
        sl_Com.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].CombatStyle);
        sl_Str.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].StrafingAbility);
        sl_Tac.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].Tactics);
        sl_Rea.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].ReactionTime);
        sl_Jumpy.SetValue(BotConfigClass.default.ConfigArray[ConfigIndex].Jumpiness);
        co_Weapon.Find(BotConfigClass.default.ConfigArray[ConfigIndex].FavoriteWeapon,, true);
        co_Voice.Find(BotConfigClass.default.ConfigArray[ConfigIndex].CustomVoice,, true);
        co_Orders.Find(Class'Engine.GameProfile'.static.TextPositionDescription(int(BotConfigClass.default.ConfigArray[ConfigIndex].CustomOrders)));        
    }
    else
    {
        sl_Agg.SetValue(float(PRE.Aggressiveness));
        sl_Acc.SetValue(float(PRE.Accuracy));
        sl_Com.SetValue(float(PRE.CombatStyle));
        sl_Str.SetValue(float(PRE.StrafingAbility));
        sl_Tac.SetValue(float(PRE.Tactics));
        sl_Rea.SetValue(float(PRE.ReactionTime));
        sl_Jumpy.SetValue(float(PRE.Jumpiness));
        co_Weapon.Find(PRE.FavoriteWeapon,, true);
        // End:0x379
        if(PRE.VoiceClassName != "")
        {
            co_Voice.Find(PRE.VoiceClassName,, true);
        }
        co_Orders.SetIndex(0);
    }
    bIgnoreChange = false;
    //return;    
}

function bool OkClick(GUIComponent Sender)
{
    BotConfigClass.static.StaticSaveConfig();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ResetClick(GUIComponent Sender)
{
    bIgnoreChange = true;
    // End:0x37
    if(ConfigIndex >= 0)
    {
        Class'UnrealGame.CustomBotConfig'.default.ConfigArray.Remove(ConfigIndex, 1);
        Class'UnrealGame.CustomBotConfig'.static.StaticSaveConfig();
    }
    ConfigIndex = -1;
    sl_Agg.SetValue(float(ThisBot.Aggressiveness));
    sl_Acc.SetValue(float(ThisBot.Accuracy));
    sl_Com.SetValue(float(ThisBot.CombatStyle));
    sl_Str.SetValue(float(ThisBot.StrafingAbility));
    sl_Tac.SetValue(float(ThisBot.Tactics));
    sl_Rea.SetValue(float(ThisBot.ReactionTime));
    sl_Jumpy.SetValue(float(ThisBot.Jumpiness));
    co_Weapon.Find(ThisBot.FavoriteWeapon, false, true);
    // End:0x14B
    if(ThisBot.VoiceClassName != "")
    {
        co_Voice.Find(ThisBot.VoiceClassName, false, true);        
    }
    else
    {
        co_Voice.SetIndex(0);
    }
    co_Orders.SetIndex(0);
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
    return (DoPerc(sl_Agg.MySlider)) $ "%";
    //return;    
}

function string AccDC()
{
    return sl_Acc.GetComponentValue();
    //return;    
}

function string ComDC()
{
    return (DoPerc(sl_Com.MySlider)) $ "%";
    //return;    
}

function string StrDC()
{
    return sl_Str.GetComponentValue();
    //return;    
}

function string TacDC()
{
    return sl_Tac.GetComponentValue();
    //return;    
}

function string ReaDC()
{
    return sl_Rea.GetComponentValue();
    //return;    
}

function string JumpyDC()
{
    return (DoPerc(sl_Jumpy.MySlider)) $ "%";
    //return;    
}

function SetDefaults()
{
    BotConfigClass.default.ConfigArray[ConfigIndex].CharacterName = ThisBot.DefaultName;
    BotConfigClass.default.ConfigArray[ConfigIndex].PlayerName = ThisBot.DefaultName;
    BotConfigClass.default.ConfigArray[ConfigIndex].FavoriteWeapon = ThisBot.FavoriteWeapon;
    BotConfigClass.default.ConfigArray[ConfigIndex].Aggressiveness = float(ThisBot.Aggressiveness);
    BotConfigClass.default.ConfigArray[ConfigIndex].Accuracy = float(ThisBot.Accuracy);
    BotConfigClass.default.ConfigArray[ConfigIndex].CombatStyle = float(ThisBot.CombatStyle);
    BotConfigClass.default.ConfigArray[ConfigIndex].StrafingAbility = float(ThisBot.StrafingAbility);
    BotConfigClass.default.ConfigArray[ConfigIndex].Tactics = float(ThisBot.Tactics);
    BotConfigClass.default.ConfigArray[ConfigIndex].ReactionTime = float(ThisBot.ReactionTime);
    BotConfigClass.default.ConfigArray[ConfigIndex].Jumpiness = float(ThisBot.Jumpiness);
    BotConfigClass.default.ConfigArray[ConfigIndex].CustomVoice = ThisBot.VoiceClassName;
    BotConfigClass.default.ConfigArray[ConfigIndex].CustomOrders = 0;
    //return;    
}

function SliderChange(GUIComponent Sender)
{
    local export editinline moSlider S;

    // End:0x20
    if(moSlider(Sender) != none)
    {
        S = moSlider(Sender);
    }
    // End:0x38
    if(bIgnoreChange || S == none)
    {
        return;
    }
    ValidateIndex();
    // End:0x79
    if(S == sl_Agg)
    {
        BotConfigClass.default.ConfigArray[ConfigIndex].Aggressiveness = S.GetValue();        
    }
    else
    {
        // End:0xB4
        if(S == sl_Acc)
        {
            BotConfigClass.default.ConfigArray[ConfigIndex].Accuracy = S.GetValue();            
        }
        else
        {
            // End:0xEF
            if(S == sl_Com)
            {
                BotConfigClass.default.ConfigArray[ConfigIndex].CombatStyle = S.GetValue();                
            }
            else
            {
                // End:0x12A
                if(S == sl_Str)
                {
                    BotConfigClass.default.ConfigArray[ConfigIndex].StrafingAbility = S.GetValue();                    
                }
                else
                {
                    // End:0x165
                    if(S == sl_Tac)
                    {
                        BotConfigClass.default.ConfigArray[ConfigIndex].Tactics = S.GetValue();                        
                    }
                    else
                    {
                        // End:0x1A0
                        if(S == sl_Rea)
                        {
                            BotConfigClass.default.ConfigArray[ConfigIndex].ReactionTime = S.GetValue();                            
                        }
                        else
                        {
                            // End:0x1D8
                            if(S == sl_Jumpy)
                            {
                                BotConfigClass.default.ConfigArray[ConfigIndex].Jumpiness = S.GetValue();
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function ComboBoxChange(GUIComponent Sender)
{
    // End:0x1D
    if(bIgnoreChange || moComboBox(Sender) == none)
    {
        return;
    }
    ValidateIndex();
    // End:0x5E
    if(Sender == co_Weapon)
    {
        BotConfigClass.default.ConfigArray[ConfigIndex].FavoriteWeapon = co_Weapon.GetExtra();        
    }
    else
    {
        // End:0x99
        if(Sender == co_Voice)
        {
            BotConfigClass.default.ConfigArray[ConfigIndex].CustomVoice = co_Voice.GetExtra();            
        }
        else
        {
            // End:0xE0
            if(Sender == co_Orders)
            {
                BotConfigClass.default.ConfigArray[ConfigIndex].CustomOrders = Class'Engine.GameProfile'.static.EnumPositionDescription(co_Orders.GetText());
            }
        }
    }
    //return;    
}

function ValidateIndex()
{
    // End:0x42
    if(ConfigIndex == -1)
    {
        ConfigIndex = BotConfigClass.default.ConfigArray.Length;
        BotConfigClass.default.ConfigArray.Length = ConfigIndex + 1;
        SetDefaults();
    }
    //return;    
}

defaultproperties
{
    NoInformation="??? ????!"
    NoPref="????? ????"
    DefaultString="???"
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4BotConfigPage.imgBotPic'
    begin object name="imgBotPic" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1160310
        WinLeft=0.0798610
        WinWidth=0.2468750
        WinHeight=0.8225100
        RenderWeight=0.1100000
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_Portrait=imgBotPic
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotAggrSlider'
    begin object name="BotAggrSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=BotAggrSlider.InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.1076180
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Agg=BotAggrSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotAccuracySlider'
    begin object name="BotAccuracySlider" class=XInterface.moSlider
        MaxValue=2.0000000
        MinValue=-2.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=BotAccuracySlider.InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.1776030
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Acc=BotAccuracySlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotCStyleSlider'
    begin object name="BotCStyleSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="?? ???"
        OnCreateComponent=BotCStyleSlider.InternalOnCreateComponent
        Hint="???? ?? ?? ???? ?????."
        WinTop=0.2475880
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Com=BotCStyleSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotStrafeSlider'
    begin object name="BotStrafeSlider" class=XInterface.moSlider
        MaxValue=2.0000000
        MinValue=-2.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=BotStrafeSlider.InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.3175730
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Str=BotStrafeSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotTacticsSlider'
    begin object name="BotTacticsSlider" class=XInterface.moSlider
        MaxValue=2.0000000
        MinValue=-2.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="??"
        OnCreateComponent=BotTacticsSlider.InternalOnCreateComponent
        Hint="???? ?? ? ??? ??? ?????."
        WinTop=0.3875580
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Tac=BotTacticsSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotReactionSlider'
    begin object name="BotReactionSlider" class=XInterface.moSlider
        MaxValue=2.0000000
        MinValue=-2.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=BotReactionSlider.InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.4575420
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Rea=BotReactionSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4BotConfigPage.BotJumpy'
    begin object name="BotJumpy" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=BotJumpy.InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.5275280
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=6
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.SliderChange
    end object
    sl_Jumpy=BotJumpy
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4BotConfigPage.BotWeapon'
    begin object name="BotWeapon" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="?? ??"
        OnCreateComponent=BotWeapon.InternalOnCreateComponent
        Hint="???? ?? ???? ??? ?????."
        WinTop=0.6479670
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=7
        bBoundToParent=true
        bScaleToParent=true
    end object
    co_Weapon=BotWeapon
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4BotConfigPage.BotVoice'
    begin object name="BotVoice" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="???"
        OnCreateComponent=BotVoice.InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.7180110
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=8
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.ComboBoxChange
    end object
    co_Voice=BotVoice
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4BotConfigPage.BotOrders'
    begin object name="BotOrders" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="??"
        OnCreateComponent=BotOrders.InternalOnCreateComponent
        Hint="???? ?? ??? ?????."
        WinTop=0.7911590
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=9
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4BotConfigPage.ComboBoxChange
    end object
    co_Orders=BotOrders
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4BotConfigPage.PicBK'
    begin object name="PicBK" class=XInterface.GUISectionBackground
        WinTop=0.0783910
        WinLeft=0.0261500
        WinWidth=0.2908200
        WinHeight=0.6382940
        OnPreDraw=PicBK.InternalPreDraw
    end object
    sb_PicBK=PicBK
    BotConfigClass=Class'UnrealGame.CustomBotConfig'
    ResetString="???"
    AttributesString="??"
    WinTop=0.1239580
    WinLeft=0.0439450
    WinWidth=0.9218750
    WinHeight=0.7591150
}