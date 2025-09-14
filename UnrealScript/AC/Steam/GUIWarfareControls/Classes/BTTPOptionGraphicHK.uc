/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionGraphicHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:16
 *	Functions:19
 *
 *******************************************************************************/
class BTTPOptionGraphicHK extends BTTPOptionBaseHK
    dependson(BTTPOptionGQAdvanceHK)
    dependson(BTTPOptionGQAutoHK)
    editinlinenew
    instanced;

struct DisplayModeInfo
{
    var int width;
    var int Height;
    var int SupportComboIdx;
    var int GraphicQuality;
    var bool UseGore;
    var int Brightness;
};

var bool bInGameResolutionChanged;
var bool bChangeResolution;
var bool bChangeGraphicOption;
var localized string strDark;
var localized string strBright;
var localized string strLow;
var localized string strHigh;
var localized string strLabel[10];
var localized string strBrightness;
var export editinline ButtonGroups OptionGroup;
var int LastSimpleButtonPos;
var localized string strResRatio[5];
var DisplayModeInfo CurrentInfo;
var DisplayModeInfo InitInfo;
var localized string strGraphicQuality[6];
var delegate<OnChangeScreen> __OnChangeScreen__Delegate;

delegate OnChangeScreen(int iScreenWidth, int iScreenHeight);
function InitData()
{
    local PlayerController PC;
    local OptionGraphicAdvanceInfo aInfo;

    PC = PlayerOwner();
    bChangeResolution = false;
    bChangeGraphicOption = false;
    bInGameResolutionChanged = false;
    InitInfo.width = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportX"));
    InitInfo.Height = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportY"));
    InitInfo.SupportComboIdx = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    aInfo = class'BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    InitInfo.GraphicQuality = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GraphicQuality"));
    InitInfo.UseGore = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics UseGore"));
    // End:0x1b3
    if(PC.Level.GetIsTeenVersion() == false)
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.SetData(InitInfo.UseGore);
    }
    InitInfo.Brightness = int(PC.ConsoleCommand("GETCONFIG_INT Graphics Brightness"));
    CurrentInfo = InitInfo;
    // End:0x21e
    if(InitInfo.GraphicQuality < 4)
    {
        LastSimpleButtonPos = InitInfo.GraphicQuality;
    }
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
}

function DefaultResetData()
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    CurrentInfo = InitInfo;
    CurrentInfo.width = 1024;
    CurrentInfo.Height = 768;
    CurrentInfo.SupportComboIdx = MM.DefaultSupportModeIdx;
    CurrentInfo.GraphicQuality = 6;
    LastSimpleButtonPos = 0;
    CurrentInfo.Brightness = 10;
    SaveData();
    LoadData();
}

function SaveData()
{
    local string strFullScreen;
    local bool bRoomOwner;
    local PlayerController PC;
    local OptionGraphicAdvanceInfo Settings, InitSettings;
    local wMatchMaker MM;

    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    // End:0x6d
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        bRoomOwner = MM.bIsOwner;
    }
    // End:0x75
    else
    {
        bRoomOwner = false;
    }
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ string(CurrentInfo.width));
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportY" @ string(CurrentInfo.Height));
    PC.ConsoleCommand("SETCONFIG_INT Graphics GraphicQuality" @ string(CurrentInfo.GraphicQuality));
    PC.ConsoleCommand("SETCONFIG_INT Graphics Brightness" @ string(CurrentInfo.Brightness));
    // End:0x1cf
    if(InitInfo.Brightness != CurrentInfo.Brightness)
    {
        PC.ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.050));
    }
    // End:0x2b9
    if(!bRoomOwner)
    {
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ string(CurrentInfo.width));
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportY" @ string(CurrentInfo.Height));
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GraphicQuality" @ string(CurrentInfo.GraphicQuality));
    }
    // End:0x348
    if(CurrentInfo.GraphicQuality >= 0 && CurrentInfo.GraphicQuality <= 4)
    {
        Settings = class'BTTPOptionGraphicAdvanceHK'.static.GetPredefineAdvanceSettings(PC, CurrentInfo.GraphicQuality);
        InitSettings = class'BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
        bChangeGraphicOption = class'BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, InitSettings, bRoomOwner);
    }
    // End:0x3d4
    else
    {
        // End:0x364
        if(CurrentInfo.GraphicQuality == 5)
        {
            bChangeGraphicOption = true;
        }
        // End:0x3d4
        else
        {
            // End:0x3d4
            if(CurrentInfo.GraphicQuality == 6)
            {
                Settings = class'BTTPOptionGraphicAdvanceHK'.static.GetDefaultTestAdvanceSettings(PC);
                InitSettings = class'BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
                bChangeGraphicOption = class'BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, InitSettings, bRoomOwner);
            }
        }
    }
    // End:0x4c6
    if(InitInfo.width != CurrentInfo.width || InitInfo.Height != CurrentInfo.Height)
    {
        // End:0x4be
        if(!bRoomOwner)
        {
            // End:0x4b6
            if(bool(PC.ConsoleCommand("CANCHANGERES")))
            {
                // End:0x463
                if(bool(PC.ConsoleCommand("ISFULLSCREEN")))
                {
                    strFullScreen = "f";
                }
                // End:0x46c
                else
                {
                    strFullScreen = "w";
                }
                PC.ConsoleCommand("setres" @ string(CurrentInfo.width) $ "x" $ string(CurrentInfo.Height) $ "x32" $ strFullScreen);
            }
            // End:0x4be
            else
            {
                bInGameResolutionChanged = true;
            }
        }
        bChangeResolution = true;
    }
    // End:0x4fe
    if(!bRoomOwner)
    {
        PC.Level.GameMgr.bUseGore = CurrentInfo.UseGore;
    }
    PC.ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(CurrentInfo.UseGore));
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(CurrentInfo.SupportComboIdx);
    BTSliderHK(Content[2]).SetCurrentValue(float(CurrentInfo.Brightness));
    PC.ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.050));
    switch(CurrentInfo.GraphicQuality)
    {
        // End:0x98
        case 0:
        // End:0x9c
        case 1:
        // End:0xa1
        case 2:
        // End:0xa6
        case 3:
        // End:0xca
        case 4:
            QualityRadio_OnClick(BTTPOptionGQSimpleHK(Content[4]).ButtonRadio);
            // End:0x115
            break;
        // End:0xee
        case 5:
            QualityRadio_OnClick(BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio);
            // End:0x115
            break;
        // End:0x112
        case 6:
            QualityRadio_OnClick(BTTPOptionGQAutoHK(Content[3]).ButtonRadio);
            // End:0x115
            break;
        // End:0xffff
        default:
}

function float Clock()
{
    local float t, t2;

    Controller.ViewportOwner.Actor.UnClock(t);
    Controller.ViewportOwner.Actor.super(BTTPOptionGraphicHK).Clock(t2);
    return t;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local float t;
    local RenderObject ro;

    super.InitComponent(MyController, myOwner);
    Label.Length = 10;
    Content.Length = 10;
    InternalPadding.Length = 10;
    i = 0;
    J0x32:
    // End:0x5e [While If]
    if(i < 10)
    {
        InternalPadding[i].Y2 = 3.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
    i = 0;
    J0x65:
    // End:0x148 [While If]
    if(i < Label.Length)
    {
        ro = new class'RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeEmptyBox(), class'BTUIResourcePoolHK'.default.empty, 0.990);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(9);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    Controller.ViewportOwner.Actor.Clock(t);
    Controller.ViewportOwner.Actor.dblog("1) InitComponent Clock() = " $ string(Clock()));
    InitializeContent();
    Controller.ViewportOwner.Actor.dblog("2) InitComponent Clock() = " $ string(Clock()));
    Controller.ViewportOwner.Actor.UnClock(t);
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
}

function Content0_OnChange(GUIComponent Sender)
{
    local string currentW, currentHT, deleteStr;
    local int saveW, saveHT;
    local PlayerController PC;

    PC = PlayerOwner();
    saveW = CurrentInfo.width;
    saveHT = CurrentInfo.Height;
    Divide(BTComboBoxHK(Content[0]).ComboBox.GetItem(BTComboBoxHK(Content[0]).ComboBox.GetIndex()), "x", currentW, currentHT);
    Divide(currentHT, "(", currentHT, deleteStr);
    // End:0x1fc
    if(saveW != int(currentW) || saveHT != int(currentHT))
    {
        PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ currentW);
        PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportY" @ currentHT);
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ currentW);
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportY" @ currentHT);
        CurrentInfo.width = int(currentW);
        CurrentInfo.Height = int(currentHT);
        CurrentInfo.SupportComboIdx = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    }
    OnChangeScreen(CurrentInfo.width, CurrentInfo.Height);
}

function InitializeContent()
{
    local int i, ScreenRatioIndex, currentW, currentHT;
    local string strSupportGraphic;
    local PlayerController PC;
    local wMatchMaker MM;

    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    currentW = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportX"));
    currentHT = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportY"));
    ScreenRatioIndex = class'BTCustomDrawHK'.static.GetRatioIndex(currentW, currentHT);
    Content[0] = NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.80);
    BTComboBoxHK(Content[0]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[0]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    i = 0;
    J0x13a:
    // End:0x251 [While If]
    if(i < MM.SupportModes.Length)
    {
        strSupportGraphic = string(MM.SupportModes[i].width) $ "x" $ string(MM.SupportModes[i].Height) $ strResRatio[MM.SupportModes[i].RatioIndex];
        BTComboBoxHK(Content[0]).ComboBox.AddItem(strSupportGraphic);
        // End:0x247
        if(MM.SupportModes[i].width == currentW && MM.SupportModes[i].Height == currentHT)
        {
            BTComboBoxHK(Content[0]).ComboBox.SetIndex(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13a;
    }
    BTComboBoxHK(Content[0]).__OnChange__Delegate = Content0_OnChange;
    Content[2] = NewComponent(new class'BTSliderHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTSliderHK(Content[2]).SetData(36, 16);
    BTSliderHK(Content[2]).ButtonLeft.Caption = strDark;
    BTSliderHK(Content[2]).ButtonLeft.SetFontSizeAll(9);
    BTSliderHK(Content[2]).ButtonRight.Caption = strBright;
    BTSliderHK(Content[2]).ButtonRight.SetFontSizeAll(9);
    BTSliderHK(Content[2]).MaxValue = 20.0;
    BTSliderHK(Content[2]).__SliderValueToString__Delegate = Content2_ValueToString;
    BTSliderHK(Content[2]).bSmoothSlider = false;
    BTSliderHK(Content[2]).__OnChangeValue__Delegate = Content2_OnChangeValue;
    Content[3] = NewComponent(new class'BTTPOptionGQAutoHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.730);
    Content[4] = NewComponent(new class'BTTPOptionGQSimpleHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.720);
    Content[5] = NewComponent(new class'BTTPOptionGQAdvanceHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.710);
    OptionGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    OptionGroup.AddButton(BTTPOptionGQAutoHK(Content[3]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQSimpleHK(Content[4]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio);
    BTTPOptionGQAutoHK(Content[3]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQSimpleHK(Content[4]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.DisableMe();
    i = 0;
    J0x560:
    // End:0x5a1 [While If]
    if(i < 4)
    {
        BTTPOptionGQSimpleHK(Content[4]).SimpleButton[i].__OnClick__Delegate = SimpleButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x560;
    }
    Content[7] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    // End:0x63d
    if(PC.Level.GetIsTeenVersion())
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.ButtonOn.DisableMe();
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.ButtonOff.DisableMe();
    }
    // End:0x662
    else
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.__OnSelect__Delegate = BottonGore_OnSelect;
    }
}

function bool SimpleButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    CurrentInfo.GraphicQuality = btn.ButtonID;
    LastSimpleButtonPos = btn.ButtonID;
    BTTPOptionGQSimpleHK(Content[4]).GraphicSimpleGroup.SelectButton(LastSimpleButtonPos);
    BTTPOptionGQSimpleHK(Content[4]).ChangeButtonImage();
    Log("Graphic Quality (Simple Config) - " $ string(CurrentInfo.GraphicQuality));
    return true;
}

function BottonGore_OnSelect(bool bOn)
{
    CurrentInfo.UseGore = bOn;
    PlayerOwner().Level.GameMgr.bUseGore = CurrentInfo.UseGore;
}

function bool QualityRadio_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    OptionGroup.SelectButton(btn.ButtonID);
    switch(btn.ButtonID)
    {
        // End:0x88
        case 0:
            BTTPOptionGQSimpleHK(Content[4]).DisableAllButton();
            BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.DisableMe();
            CurrentInfo.GraphicQuality = 6;
            // End:0x161
            break;
        // End:0x112
        case 1:
            BTTPOptionGQSimpleHK(Content[4]).EnableAllButton();
            BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.DisableMe();
            BTTPOptionGQSimpleHK(Content[4]).GraphicSimpleGroup.SelectButton(LastSimpleButtonPos);
            BTTPOptionGQSimpleHK(Content[4]).ChangeButtonImage();
            CurrentInfo.GraphicQuality = LastSimpleButtonPos;
            // End:0x161
            break;
        // End:0x15e
        case 2:
            BTTPOptionGQSimpleHK(Content[4]).DisableAllButton();
            BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.EnableMe();
            CurrentInfo.GraphicQuality = 5;
            // End:0x161
            break;
        // End:0xffff
        default:
            return true;
    }
}

function string Content2_ValueToString(int Value)
{
    // End:0x12
    if(Value == 10)
    {
        return strBrightness;
    }
    return string(Value);
}

function Content2_OnChangeValue(int ChangeValue)
{
    CurrentInfo.Brightness = ChangeValue;
    PlayerOwner().ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.050));
}

function string Content6_ValueToString(int Value)
{
    return strGraphicQuality[Value];
}

function bool Content6_CanChangeValue(int CurrentValue, int ChangeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x78
    if(ChangeValue >= 3)
    {
        // End:0x78
        if(!bool(PC.ConsoleCommand("SUPPORTEDPS30")) || !bool(PC.ConsoleCommand("SUPPORTEDMRT")))
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 86);
            return false;
        }
    }
    return true;
}

function OnShow_ComboBoxList()
{
    bToolTipVisible = false;
}

function OnHide_ComboBoxList()
{
    bToolTipVisible = true;
}

defaultproperties
{
    strDark="Dark"
    strBright="Bright"
    strLow="Low"
    strHigh="High"
    strLabel[0]="Resolution & Ratio"
    strLabel[2]="Brightness"
    strLabel[3]="Graphics Quality"
    strLabel[7]="Gore"
    strBrightness="Default"
    strResRatio[0]="(4:3)"
    strResRatio[1]="(5:4)"
    strResRatio[2]="(16:9)"
    strResRatio[3]="(16:10)"
    strResRatio[4]="(Other)"
    strGraphicQuality[0]="Very Low"
    strGraphicQuality[1]="Low"
    strGraphicQuality[2]="Normal"
    strGraphicQuality[3]="High"
    strGraphicQuality[4]="Very High"
    strGraphicQuality[5]="User-Defined"
    strTooltip[3]="Automatically set graphics quality to suit this computer's hardware."
    strTooltip[4]="Quickly optimize your graphics settings.<P>Recommended specifications for each option are as follows.<P> <P>[Very High] P4 3.2 GHz, 2 GB RAM, GeForce 9800 GT or equivalent. <P> [High] P4 3.0 GHz, 2 GB RAM, GeForce 8600 GT or equivalent.<P>[Medium] P4 3.0 GHz, 2 GB RAM, GeForce 7600 GT or equivalent. <P>[Low] P4 2.8 GHz, 1 GB RAM, GeForce 6600 GT or equivalent."
    strTooltip[5]="Change advanced graphics settings."
    strTooltip[7]="Set the gore level for death animations. <P>? Only for mature audiences."
}