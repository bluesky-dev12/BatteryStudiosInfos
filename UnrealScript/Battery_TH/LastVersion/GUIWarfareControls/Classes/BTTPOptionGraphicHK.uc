class BTTPOptionGraphicHK extends BTTPOptionBaseHK
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
//var delegate<OnChangeScreen> __OnChangeScreen__Delegate;

delegate OnChangeScreen(int iScreenWidth, int iScreenHeight)
{
    //return;    
}

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
    aInfo = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    InitInfo.GraphicQuality = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GraphicQuality"));
    InitInfo.UseGore = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics UseGore"));
    // End:0x1B3
    if(PC.Level.bNoGoreVersion == false)
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.SetData(InitInfo.UseGore);
    }
    InitInfo.Brightness = int(PC.ConsoleCommand("GETCONFIG_INT Graphics Brightness"));
    CurrentInfo = InitInfo;
    // End:0x21E
    if(InitInfo.GraphicQuality < 4)
    {
        LastSimpleButtonPos = InitInfo.GraphicQuality;
    }
    //return;    
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
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
    //return;    
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
    // End:0x6D
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        bRoomOwner = MM.bIsOwner;        
    }
    else
    {
        bRoomOwner = false;
    }
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ string(CurrentInfo.width));
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportY" @ string(CurrentInfo.Height));
    PC.ConsoleCommand("SETCONFIG_INT Graphics GraphicQuality" @ string(CurrentInfo.GraphicQuality));
    PC.ConsoleCommand("SETCONFIG_INT Graphics Brightness" @ string(CurrentInfo.Brightness));
    // End:0x1CF
    if(InitInfo.Brightness != CurrentInfo.Brightness)
    {
        PC.ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.0500000));
    }
    // End:0x2B9
    if(!bRoomOwner)
    {
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ string(CurrentInfo.width));
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportY" @ string(CurrentInfo.Height));
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GraphicQuality" @ string(CurrentInfo.GraphicQuality));
    }
    // End:0x348
    if((CurrentInfo.GraphicQuality >= 0) && CurrentInfo.GraphicQuality <= 4)
    {
        Settings = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetPredefineAdvanceSettings(PC, CurrentInfo.GraphicQuality);
        InitSettings = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
        bChangeGraphicOption = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, InitSettings, bRoomOwner);        
    }
    else
    {
        // End:0x364
        if(CurrentInfo.GraphicQuality == 5)
        {
            bChangeGraphicOption = true;            
        }
        else
        {
            // End:0x3D4
            if(CurrentInfo.GraphicQuality == 6)
            {
                Settings = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetDefaultTestAdvanceSettings(PC);
                InitSettings = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
                bChangeGraphicOption = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, InitSettings, bRoomOwner);
            }
        }
    }
    // End:0x4C6
    if((InitInfo.width != CurrentInfo.width) || InitInfo.Height != CurrentInfo.Height)
    {
        // End:0x4BE
        if(!bRoomOwner)
        {
            // End:0x4B6
            if(bool(PC.ConsoleCommand("CANCHANGERES")))
            {
                // End:0x463
                if(bool(PC.ConsoleCommand("ISFULLSCREEN")))
                {
                    strFullScreen = "f";                    
                }
                else
                {
                    strFullScreen = "w";
                }
                PC.ConsoleCommand((((("setres" @ string(CurrentInfo.width)) $ "x") $ string(CurrentInfo.Height)) $ "x32") $ strFullScreen);                
            }
            else
            {
                bInGameResolutionChanged = true;
            }
        }
        bChangeResolution = true;
    }
    // End:0x4FE
    if(!bRoomOwner)
    {
        PC.Level.GameMgr.bUseGore = CurrentInfo.UseGore;
    }
    PC.ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(CurrentInfo.UseGore));
    //return;    
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(CurrentInfo.SupportComboIdx);
    BTSliderHK(Content[2]).SetCurrentValue(float(CurrentInfo.Brightness));
    PC.ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.0500000));
    switch(CurrentInfo.GraphicQuality)
    {
        // End:0x98
        case 0:
        // End:0x9C
        case 1:
        // End:0xA1
        case 2:
        // End:0xA6
        case 3:
        // End:0xCA
        case 4:
            QualityRadio_OnClick(BTTPOptionGQSimpleHK(Content[4]).ButtonRadio);
            // End:0x115
            break;
        // End:0xEE
        case 5:
            QualityRadio_OnClick(BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio);
            // End:0x115
            break;
        // End:0x112
        case 6:
            QualityRadio_OnClick(BTTPOptionGQAutoHK(Content[3]).ButtonRadio);
            // End:0x115
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function float Clock()
{
    local float t, t2;

    Controller.ViewportOwner.Actor.UnClock(t);
    Controller.ViewportOwner.Actor.super(BTTPOptionGraphicHK).Clock(t2);
    return t;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local float t;
    local RenderObject Ro;

    super.InitComponent(MyController, myOwner);
    Label.Length = 10;
    Content.Length = 10;
    InternalPadding.Length = 10;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 10)
    {
        InternalPadding[i].Y2 = 3.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    i = 0;
    J0x65:

    // End:0x148 [Loop If]
    if(i < Label.Length)
    {
        Ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        Ro.Init();
        ACLList.AddRenderObject(Ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9900000);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(9);
        i++;
        // [Loop Continue]
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
    //return;    
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
    // End:0x1FC
    if((saveW != int(currentW)) || saveHT != int(currentHT))
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
    //return;    
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
    ScreenRatioIndex = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(currentW, currentHT);
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[0]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[0]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    i = 0;
    J0x13A:

    // End:0x251 [Loop If]
    if(i < MM.SupportModes.Length)
    {
        strSupportGraphic = ((string(MM.SupportModes[i].width) $ "x") $ string(MM.SupportModes[i].Height)) $ strResRatio[MM.SupportModes[i].RatioIndex];
        BTComboBoxHK(Content[0]).ComboBox.AddItem(strSupportGraphic);
        // End:0x247
        if((MM.SupportModes[i].width == currentW) && MM.SupportModes[i].Height == currentHT)
        {
            BTComboBoxHK(Content[0]).ComboBox.SetIndex(i);
        }
        i++;
        // [Loop Continue]
        goto J0x13A;
    }
    BTComboBoxHK(Content[0]).__OnChange__Delegate = Content0_OnChange;
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[2]).SetData(36, 16);
    BTSliderHK(Content[2]).ButtonLeft.Caption = strDark;
    BTSliderHK(Content[2]).ButtonLeft.SetFontSizeAll(9);
    BTSliderHK(Content[2]).ButtonRight.Caption = strBright;
    BTSliderHK(Content[2]).ButtonRight.SetFontSizeAll(9);
    BTSliderHK(Content[2]).MaxValue = 20.0000000;
    BTSliderHK(Content[2]).__SliderValueToString__Delegate = Content2_ValueToString;
    BTSliderHK(Content[2]).bSmoothSlider = false;
    BTSliderHK(Content[2]).__OnChangeValue__Delegate = Content2_OnChangeValue;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQAutoHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7300000);
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQSimpleHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7200000);
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQAdvanceHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7100000);
    OptionGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    OptionGroup.AddButton(BTTPOptionGQAutoHK(Content[3]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQSimpleHK(Content[4]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio);
    BTTPOptionGQAutoHK(Content[3]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQSimpleHK(Content[4]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQAdvanceHK(Content[5]).ButtonRadio.__OnClick__Delegate = QualityRadio_OnClick;
    BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.DisableMe();
    i = 0;
    J0x560:

    // End:0x5A1 [Loop If]
    if(i < 4)
    {
        BTTPOptionGQSimpleHK(Content[4]).SimpleButton[i].__OnClick__Delegate = SimpleButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x560;
    }
    Content[7] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    // End:0x640
    if(PC.Level.bNoGoreVersion == true)
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.ButtonOn.DisableMe();
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.ButtonOff.DisableMe();        
    }
    else
    {
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.__OnSelect__Delegate = BottonGore_OnSelect;
    }
    //return;    
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
    //return;    
}

function BottonGore_OnSelect(bool bOn)
{
    CurrentInfo.UseGore = bOn;
    PlayerOwner().Level.GameMgr.bUseGore = CurrentInfo.UseGore;
    //return;    
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
            // End:0x151
            break;
        // End:0x102
        case 1:
            BTTPOptionGQSimpleHK(Content[4]).EnableAllButton();
            BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.DisableMe();
            BTTPOptionGQSimpleHK(Content[4]).GraphicSimpleGroup.SelectButton(LastSimpleButtonPos);
            BTTPOptionGQSimpleHK(Content[4]).ChangeButtonImage();
            // End:0x151
            break;
        // End:0x14E
        case 2:
            BTTPOptionGQSimpleHK(Content[4]).DisableAllButton();
            BTTPOptionGQAdvanceHK(Content[5]).ButtonAdvance.EnableMe();
            CurrentInfo.GraphicQuality = 5;
            // End:0x151
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function string Content2_ValueToString(int Value)
{
    // End:0x12
    if(Value == 10)
    {
        return strBrightness;
    }
    return string(Value);
    //return;    
}

function Content2_OnChangeValue(int changeValue)
{
    CurrentInfo.Brightness = changeValue;
    PlayerOwner().ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.0500000));
    //return;    
}

function string Content6_ValueToString(int Value)
{
    return strGraphicQuality[Value];
    //return;    
}

function bool Content6_CanChangeValue(int CurrentValue, int changeValue)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x78
    if(changeValue >= 3)
    {
        // End:0x78
        if(!bool(PC.ConsoleCommand("SUPPORTEDPS30")) || !bool(PC.ConsoleCommand("SUPPORTEDMRT")))
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 86);
            return false;
        }
    }
    return true;
    //return;    
}

function OnShow_ComboBoxList()
{
    bToolTipVisible = false;
    //return;    
}

function OnHide_ComboBoxList()
{
    bToolTipVisible = true;
    //return;    
}

defaultproperties
{
    strDark="???"
    strBright="?????"
    strLow="???"
    strHigh="???"
    strLabel[0]="Resolution"
    strLabel[2]="?????????"
    strLabel[3]="???????????"
    strLabel[7]="Gore version "
    strBrightness="???????????"
    strResRatio[0]="(4:3)"
    strResRatio[1]="(5:4)"
    strResRatio[2]="(16:9)"
    strResRatio[3]="(16:10)"
    strResRatio[4]="(?????)"
    strGraphicQuality[0]="??????"
    strGraphicQuality[1]="???"
    strGraphicQuality[2]="????"
    strGraphicQuality[3]="???"
    strGraphicQuality[4]="??????"
    strGraphicQuality[5]="????????"
    strToolTip[3]="???????????????????????????????????????????????????????"
    strToolTip[4]="?????????????????????????????? <P> ?????????????????????????????????????? <P> <P> [?????????]  P4  3.2GHZ, 2G RAM, GeForce 9800GT ????? <P>[???] P4 3.0GHZ, 2G RAM, GeForce 8600GT ????? <P>[????] P4 3.0GHZ, 2G RAM, GeForce 7600GT ????? <P>[???] P4 2.8GHZ, 1G RAM, GeForce 6600GT ????? <P>[?????????] P4  2.4GHZ, 1G RAM, GeForce FX5700 ?????"
    strToolTip[5]="???????????????????????????????????????????"
    strToolTip[7]="???????????????????????????????????????????????? ?????????????????????????????<P>19 ??????????"
}