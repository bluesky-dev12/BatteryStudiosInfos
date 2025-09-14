/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4BotConfigPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:16
 *
 *******************************************************************************/
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Portrait;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Agg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Acc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Com;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Str;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Tac;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Rea;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Jumpy;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Weapon;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Voice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Orders;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_PicBK;
var class<CustomBotConfig> BotConfigClass;
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
    class'CacheManager'.static.GetWeaponList(Records);
    co_Weapon.AddItem(NoPref);
    i = 0;
    J0x14f:
    // End:0x199 [While If]
    if(i < Records.Length)
    {
        co_Weapon.AddItem(Records[i].FriendlyName,, Records[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14f;
    }
    i = 0;
    J0x1a0:
    // End:0x1d9 [While If]
    if(i < 5)
    {
        co_Orders.AddItem(class'GameProfile'.default.PositionName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a0;
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
}

function SetupBotInfo(Material Portrait, string DecoTextName, PlayerRecord PRE)
{
    local array<string> VoicePackClasses;

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
        co_Orders.Find(class'GameProfile'.static.TextPositionDescription(BotConfigClass.default.ConfigArray[ConfigIndex].CustomOrders));
    }
    // End:0x389
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
}

function bool OkClick(GUIComponent Sender)
{
    BotConfigClass.static.StaticSaveConfig();
    Controller.CloseMenu(false);
    return true;
}

function bool ResetClick(GUIComponent Sender)
{
    bIgnoreChange = true;
    // End:0x37
    if(ConfigIndex >= 0)
    {
        class'CustomBotConfig'.default.ConfigArray.Remove(ConfigIndex, 1);
        class'CustomBotConfig'.static.StaticSaveConfig();
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
    // End:0x14b
    if(ThisBot.VoiceClassName != "")
    {
        co_Voice.Find(ThisBot.VoiceClassName, false, true);
    }
    // End:0x15b
    else
    {
        co_Voice.SetIndex(0);
    }
    co_Orders.SetIndex(0);
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
    return DoPerc(sl_Agg.MySlider) $ "%";
}

function string AccDC()
{
    return sl_Acc.GetComponentValue();
}

function string ComDC()
{
    return DoPerc(sl_Com.MySlider) $ "%";
}

function string StrDC()
{
    return sl_Str.GetComponentValue();
}

function string TacDC()
{
    return sl_Tac.GetComponentValue();
}

function string ReaDC()
{
    return sl_Rea.GetComponentValue();
}

function string JumpyDC()
{
    return DoPerc(sl_Jumpy.MySlider) $ "%";
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
    // End:0x1d8
    else
    {
        // End:0xb4
        if(S == sl_Acc)
        {
            BotConfigClass.default.ConfigArray[ConfigIndex].Accuracy = S.GetValue();
        }
        // End:0x1d8
        else
        {
            // End:0xef
            if(S == sl_Com)
            {
                BotConfigClass.default.ConfigArray[ConfigIndex].CombatStyle = S.GetValue();
            }
            // End:0x1d8
            else
            {
                // End:0x12a
                if(S == sl_Str)
                {
                    BotConfigClass.default.ConfigArray[ConfigIndex].StrafingAbility = S.GetValue();
                }
                // End:0x1d8
                else
                {
                    // End:0x165
                    if(S == sl_Tac)
                    {
                        BotConfigClass.default.ConfigArray[ConfigIndex].Tactics = S.GetValue();
                    }
                    // End:0x1d8
                    else
                    {
                        // End:0x1a0
                        if(S == sl_Rea)
                        {
                            BotConfigClass.default.ConfigArray[ConfigIndex].ReactionTime = S.GetValue();
                        }
                        // End:0x1d8
                        else
                        {
                            // End:0x1d8
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
}

function ComboBoxChange(GUIComponent Sender)
{
    // End:0x1d
    if(bIgnoreChange || moComboBox(Sender) == none)
    {
        return;
    }
    ValidateIndex();
    // End:0x5e
    if(Sender == co_Weapon)
    {
        BotConfigClass.default.ConfigArray[ConfigIndex].FavoriteWeapon = co_Weapon.GetExtra();
    }
    // End:0xe0
    else
    {
        // End:0x99
        if(Sender == co_Voice)
        {
            BotConfigClass.default.ConfigArray[ConfigIndex].CustomVoice = co_Voice.GetExtra();
        }
        // End:0xe0
        else
        {
            // End:0xe0
            if(Sender == co_Orders)
            {
                BotConfigClass.default.ConfigArray[ConfigIndex].CustomOrders = class'GameProfile'.static.EnumPositionDescription(co_Orders.GetText());
            }
        }
    }
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
}

defaultproperties
{
    NoInformation="??? ????!"
    NoPref="????? ????"
    DefaultString="???"
    begin object name=imgBotPic class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1160310
        WinLeft=0.0798610
        WinWidth=0.2468750
        WinHeight=0.822510
        RenderWeight=0.110
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4BotConfigPage.imgBotPic'
    i_Portrait=imgBotPic
    begin object name=BotAggrSlider class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.1076180
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotAggrSlider'
    sl_Agg=BotAggrSlider
    begin object name=BotAccuracySlider class=moSlider
        MaxValue=2.0
        MinValue=-2.0
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.1776030
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotAccuracySlider'
    sl_Acc=BotAccuracySlider
    begin object name=BotCStyleSlider class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName="TextLabel"
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ?? ???? ?????."
        WinTop=0.2475880
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotCStyleSlider'
    sl_Com=BotCStyleSlider
    begin object name=BotStrafeSlider class=moSlider
        MaxValue=2.0
        MinValue=-2.0
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.3175730
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotStrafeSlider'
    sl_Str=BotStrafeSlider
    begin object name=BotTacticsSlider class=moSlider
        MaxValue=2.0
        MinValue=-2.0
        SliderCaptionStyleName="TextLabel"
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ? ??? ??? ?????."
        WinTop=0.3875580
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotTacticsSlider'
    sl_Tac=BotTacticsSlider
    begin object name=BotReactionSlider class=moSlider
        MaxValue=2.0
        MinValue=-2.0
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.4575420
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotReactionSlider'
    sl_Rea=BotReactionSlider
    begin object name=BotJumpy class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName="TextLabel"
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ?? ??? ?????."
        WinTop=0.5275280
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=6
        bBoundToParent=true
        bScaleToParent=true
        OnChange=SliderChange
    object end
    // Reference: moSlider'UT2K4BotConfigPage.BotJumpy'
    sl_Jumpy=BotJumpy
    begin object name=BotWeapon class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ???? ??? ?????."
        WinTop=0.6479670
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=7
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moComboBox'UT2K4BotConfigPage.BotWeapon'
    co_Weapon=BotWeapon
    begin object name=BotVoice class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ???? ?????."
        WinTop=0.7180110
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=8
        bBoundToParent=true
        bScaleToParent=true
        OnChange=ComboBoxChange
    object end
    // Reference: moComboBox'UT2K4BotConfigPage.BotVoice'
    co_Voice=BotVoice
    begin object name=BotOrders class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?? ??? ?????."
        WinTop=0.7911590
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0554690
        TabOrder=9
        bBoundToParent=true
        bScaleToParent=true
        OnChange=ComboBoxChange
    object end
    // Reference: moComboBox'UT2K4BotConfigPage.BotOrders'
    co_Orders=BotOrders
    begin object name=PicBK class=GUISectionBackground
        WinTop=0.0783910
        WinLeft=0.026150
        WinWidth=0.290820
        WinHeight=0.6382940
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4BotConfigPage.PicBK'
    sb_PicBK=PicBK
    BotConfigClass=Class'UnrealGame.CustomBotConfig'
    ResetString="???"
    AttributesString="??"
    WinTop=0.1239580
    WinLeft=0.0439450
    WinWidth=0.9218750
    WinHeight=0.7591150
}