class BTTPOptionGraphicHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct DisplayModeInfo
{
    var int Width;
    var int Height;
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
var int LastGQSliderPos;
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
    InitInfo.Width = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportX"));
    InitInfo.Height = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportY"));
    aInfo = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    InitInfo.GraphicQuality = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GraphicQuality"));
    InitInfo.UseGore = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics UseGore"));
    // End:0x189
    if(PC.Level.GetIsTeenVersion() == false)
    {
        BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.SetData(InitInfo.UseGore);
    }
    InitInfo.Brightness = int(PC.ConsoleCommand("GETCONFIG_INT Graphics Brightness"));
    CurrentInfo = InitInfo;
    // End:0x1F4
    if(InitInfo.GraphicQuality <= 4)
    {
        LastGQSliderPos = InitInfo.GraphicQuality;
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
    CurrentInfo = InitInfo;
    CurrentInfo.Width = 1024;
    CurrentInfo.Height = 768;
    CurrentInfo.GraphicQuality = 6;
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
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ string(CurrentInfo.Width));
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
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ string(CurrentInfo.Width));
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
    if((InitInfo.Width != CurrentInfo.Width) || InitInfo.Height != CurrentInfo.Height)
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
                PC.ConsoleCommand((((("setres" @ string(CurrentInfo.Width)) $ "x") $ string(CurrentInfo.Height)) $ "x32") $ strFullScreen);                
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
    local int ScreenRatioIndex;
    local PlayerController PC;

    PC = PlayerOwner();
    ScreenRatioIndex = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(CurrentInfo.Width, CurrentInfo.Height);
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(ScreenRatioIndex);
    Content0_OnChange(Content[0]);
    BTSliderHK(Content[4]).SetCurrentValue(float(CurrentInfo.Brightness));
    PC.ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.0500000));
    switch(CurrentInfo.GraphicQuality)
    {
        // End:0xC9
        case 0:
        // End:0xCD
        case 1:
        // End:0xD2
        case 2:
        // End:0xD7
        case 3:
        // End:0xFB
        case 4:
            ButtonGroups_OnClick(BTTPOptionGQSimpleHK(Content[6]).ButtonRadio);
            // End:0x146
            break;
        // End:0x11F
        case 5:
            ButtonGroups_OnClick(BTTPOptionGQAdvanceHK(Content[7]).ButtonRadio);
            // End:0x146
            break;
        // End:0x143
        case 6:
            ButtonGroups_OnClick(BTTPOptionGQAutoHK(Content[5]).ButtonRadio);
            // End:0x146
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
    local RenderObject ro;

    super.InitComponent(MyController, myOwner);
    Label.Length = 10;
    Content.Length = 10;
    InternalPadding.Length = 10;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 10)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    i = 0;
    J0x65:

    // End:0x131 [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9900000);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
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
    local int i, AddCount, ScreenRatioIndex, TestRatioIndex;
    local string currentW, currentHT;
    local int saveW, saveHT;
    local PlayerController PC;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    PC = PlayerOwner();
    ScreenRatioIndex = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    saveW = CurrentInfo.Width;
    saveHT = CurrentInfo.Height;
    AddCount = 0;
    BTComboBoxHK(Content[1]).ComboBox.Clear();
    i = 0;
    J0xAB:

    // End:0x1CB [Loop If]
    if(i < MM.SupportModes.Length)
    {
        TestRatioIndex = MM.SupportModes[i].RatioIndex;
        // End:0x1C1
        if(ScreenRatioIndex == TestRatioIndex)
        {
            BTComboBoxHK(Content[1]).ComboBox.AddItem((string(MM.SupportModes[i].Width) $ "x") $ string(MM.SupportModes[i].Height));
            // End:0x1BA
            if((MM.SupportModes[i].Width == saveW) && MM.SupportModes[i].Height == saveHT)
            {
                BTComboBoxHK(Content[1]).ComboBox.SetIndex(AddCount);
            }
            AddCount++;
        }
        i++;
        // [Loop Continue]
        goto J0xAB;
    }
    // End:0x1F6
    if(BTComboBoxHK(Content[1]).ComboBox.GetIndex() == -1)
    {
        return;
    }
    Divide(BTComboBoxHK(Content[1]).ComboBox.GetItem(BTComboBoxHK(Content[1]).ComboBox.GetIndex()), "x", currentW, currentHT);
    // End:0x38B
    if((int(currentW) != saveW) && int(currentHT) != saveHT)
    {
        PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ currentW);
        PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportY" @ currentHT);
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ currentW);
        PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportY" @ currentHT);
        CurrentInfo.Width = int(currentW);
        CurrentInfo.Height = int(currentHT);
    }
    OnChangeScreen(CurrentInfo.Width, CurrentInfo.Height);
    //return;    
}

function Content1_OnChange(GUIComponent Sender)
{
    local string currentW, currentHT;
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x34
    if(BTComboBoxHK(Content[1]).ComboBox.GetIndex() == -1)
    {
        return;
    }
    Divide(BTComboBoxHK(Content[1]).ComboBox.GetItem(BTComboBoxHK(Content[1]).ComboBox.GetIndex()), "x", currentW, currentHT);
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportX" @ currentW);
    PC.ConsoleCommand("SETCONFIG_INT Graphics GameViewportY" @ currentHT);
    PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportX" @ currentW);
    PC.ConsoleCommand("setdata WinDrv.WindowsClient GameViewportY" @ currentHT);
    CurrentInfo.Width = int(currentW);
    CurrentInfo.Height = int(currentHT);
    OnChangeScreen(CurrentInfo.Width, CurrentInfo.Height);
    //return;    
}

function InitializeContent()
{
    local int i, AddCount, ScreenRatioIndex, TestRatioIndex, currentW, currentHT;

    local PlayerController PC;
    local wMatchMaker MM;

    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[0]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[0]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7900000);
    BTComboBoxHK(Content[1]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[1]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    i = 0;
    J0x114:

    // End:0x17F [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x175
        if(MM.SupportModes[i].RatioIndex == 0)
        {
            BTComboBoxHK(Content[0]).ComboBox.AddItem(strResRatio[0]);
            // [Explicit Break]
            goto J0x17F;
        }
        i++;
        // [Loop Continue]
        goto J0x114;
    }
    J0x17F:

    i = 0;
    J0x186:

    // End:0x1F1 [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x1E7
        if(MM.SupportModes[i].RatioIndex == 1)
        {
            BTComboBoxHK(Content[0]).ComboBox.AddItem(strResRatio[1]);
            // [Explicit Break]
            goto J0x1F1;
        }
        i++;
        // [Loop Continue]
        goto J0x186;
    }
    J0x1F1:

    i = 0;
    J0x1F8:

    // End:0x265 [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x25B
        if(MM.SupportModes[i].RatioIndex == 2)
        {
            BTComboBoxHK(Content[0]).ComboBox.AddItem(strResRatio[2]);
            // [Explicit Break]
            goto J0x265;
        }
        i++;
        // [Loop Continue]
        goto J0x1F8;
    }
    J0x265:

    i = 0;
    J0x26C:

    // End:0x2D9 [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x2CF
        if(MM.SupportModes[i].RatioIndex == 3)
        {
            BTComboBoxHK(Content[0]).ComboBox.AddItem(strResRatio[3]);
            // [Explicit Break]
            goto J0x2D9;
        }
        i++;
        // [Loop Continue]
        goto J0x26C;
    }
    J0x2D9:

    i = 0;
    J0x2E0:

    // End:0x34D [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x343
        if(MM.SupportModes[i].RatioIndex == 4)
        {
            BTComboBoxHK(Content[0]).ComboBox.AddItem(strResRatio[4]);
            // [Explicit Break]
            goto J0x34D;
        }
        i++;
        // [Loop Continue]
        goto J0x2E0;
    }
    J0x34D:

    BTComboBoxHK(Content[0]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[0]).__OnChange__Delegate = Content0_OnChange;
    currentW = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportX"));
    currentHT = int(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportY"));
    ScreenRatioIndex = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(currentW, currentHT);
    AddCount = 0;
    BTComboBoxHK(Content[1]).ComboBox.Clear();
    i = 0;
    J0x44E:

    // End:0x56E [Loop If]
    if(i < MM.SupportModes.Length)
    {
        TestRatioIndex = MM.SupportModes[i].RatioIndex;
        // End:0x564
        if(ScreenRatioIndex == TestRatioIndex)
        {
            BTComboBoxHK(Content[1]).ComboBox.AddItem((string(MM.SupportModes[i].Width) $ "x") $ string(MM.SupportModes[i].Height));
            // End:0x55D
            if((MM.SupportModes[i].Width == currentW) && MM.SupportModes[i].Height == currentHT)
            {
                BTComboBoxHK(Content[1]).ComboBox.SetIndex(AddCount);
            }
            AddCount++;
        }
        i++;
        // [Loop Continue]
        goto J0x44E;
    }
    BTComboBoxHK(Content[1]).__OnChange__Delegate = Content1_OnChange;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    // End:0x625
    if(PC.Level.GetIsTeenVersion())
    {
        BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOn.DisableMe();
        BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.ButtonOff.DisableMe();        
    }
    else
    {
        BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.__OnSelect__Delegate = BottonGore_OnSelect;
    }
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[4]).SetData(36, 16);
    BTSliderHK(Content[4]).ButtonLeft.Caption = strDark;
    BTSliderHK(Content[4]).ButtonRight.Caption = strBright;
    BTSliderHK(Content[4]).MaxValue = 20.0000000;
    BTSliderHK(Content[4]).__SliderValueToString__Delegate = Content4_ValueToString;
    BTSliderHK(Content[4]).bSmoothSlider = false;
    BTSliderHK(Content[4]).__OnChangeValue__Delegate = Content4_OnChangeValue;
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQAutoHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7300000);
    Content[6] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQSimpleHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7200000);
    Content[7] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGQAdvanceHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7100000);
    OptionGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    OptionGroup.AddButton(BTTPOptionGQAutoHK(Content[5]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQSimpleHK(Content[6]).ButtonRadio);
    OptionGroup.AddButton(BTTPOptionGQAdvanceHK(Content[7]).ButtonRadio);
    BTTPOptionGQAutoHK(Content[5]).ButtonRadio.__OnClick__Delegate = ButtonGroups_OnClick;
    BTTPOptionGQSimpleHK(Content[6]).ButtonRadio.__OnClick__Delegate = ButtonGroups_OnClick;
    BTTPOptionGQAdvanceHK(Content[7]).ButtonRadio.__OnClick__Delegate = ButtonGroups_OnClick;
    BTTPOptionGQSimpleHK(Content[6]).Slider.__SliderValueToString__Delegate = Content6_ValueToString;
    BTTPOptionGQSimpleHK(Content[6]).Slider.__OnChangeValue__Delegate = Content6_OnChangeValue;
    BTTPOptionGQSimpleHK(Content[6]).Slider.__CanChangeValue__Delegate = Content6_CanChangeValue;
    BTTPOptionGQSimpleHK(Content[6]).Slider.DisableMe();
    BTTPOptionGQAdvanceHK(Content[7]).ButtonAdvance.DisableMe();
    LastGQSliderPos = 2;
    //return;    
}

function BottonGore_OnSelect(bool bOn)
{
    CurrentInfo.UseGore = bOn;
    PlayerOwner().Level.GameMgr.bUseGore = CurrentInfo.UseGore;
    //return;    
}

function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local int sliderValue;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    OptionGroup.SelectButton(btn.ButtonID);
    switch(btn.ButtonID)
    {
        // End:0x91
        case 0:
            BTTPOptionGQSimpleHK(Content[6]).Slider.DisableMe();
            BTTPOptionGQAdvanceHK(Content[7]).ButtonAdvance.DisableMe();
            CurrentInfo.GraphicQuality = 6;
            // End:0x1B8
            break;
        // End:0x160
        case 1:
            // End:0x106
            if(int(BTTPOptionGQSimpleHK(Content[6]).Slider.MenuState) == int(4))
            {
                BTTPOptionGQSimpleHK(Content[6]).Slider.EnableMe();
                BTTPOptionGQSimpleHK(Content[6]).Slider.SetCurrentValue(float(LastGQSliderPos));
            }
            BTTPOptionGQAdvanceHK(Content[7]).ButtonAdvance.DisableMe();
            sliderValue = int(BTTPOptionGQSimpleHK(Content[6]).Slider.CurrentValue);
            CurrentInfo.GraphicQuality = sliderValue;
            // End:0x1B8
            break;
        // End:0x1B5
        case 2:
            BTTPOptionGQSimpleHK(Content[6]).Slider.DisableMe();
            BTTPOptionGQAdvanceHK(Content[7]).ButtonAdvance.EnableMe();
            CurrentInfo.GraphicQuality = 5;
            // End:0x1B8
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function string Content4_ValueToString(int Value)
{
    // End:0x12
    if(Value == 10)
    {
        return strBrightness;
    }
    return string(Value);
    //return;    
}

function Content4_OnChangeValue(int ChangeValue)
{
    CurrentInfo.Brightness = ChangeValue;
    PlayerOwner().ConsoleCommand("BRIGHTNESS" @ string(float(CurrentInfo.Brightness) * 0.0500000));
    //return;    
}

function string Content6_ValueToString(int Value)
{
    return strGraphicQuality[Value];
    //return;    
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
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 86);
            return false;
        }
    }
    return true;
    //return;    
}

function Content6_OnChangeValue(int ChangeValue)
{
    LastGQSliderPos = ChangeValue;
    CurrentInfo.GraphicQuality = ChangeValue;
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
    strLabel[0]="??????????????"
    strLabel[1]="???????????"
    strLabel[3]="Gore version "
    strLabel[4]="?????????"
    strLabel[5]="???????????"
    strBrightness="???????????"
    strResRatio[0]="4:3"
    strResRatio[1]="5:4"
    strResRatio[2]="16:9"
    strResRatio[3]="16:10"
    strResRatio[4]="?????"
    strGraphicQuality[0]="??????"
    strGraphicQuality[1]="???"
    strGraphicQuality[2]="????"
    strGraphicQuality[3]="???"
    strGraphicQuality[4]="??????"
    strGraphicQuality[5]="????????"
    strTooltip[3]="???????????????????????????????????????????????? ?????????????????????????????<P>?19 ??????????"
    strTooltip[5]="???????????????????????????????????????????????????????"
    strTooltip[6]="?????????????????????????????? <P> ?????????????????????????????????????? <P> <P> [?????????]  P4  3.2GHZ, 2G RAM, GeForce 9800GT ????? <P>[???] P4 3.0GHZ, 2G RAM, GeForce 8600GT ????? <P>[????] P4 3.0GHZ, 2G RAM, GeForce 7600GT ????? <P>[???] P4 2.8GHZ, 1G RAM, GeForce 6600GT ????? <P>[?????????] P4  2.4GHZ, 1G RAM, GeForce FX5700 ?????"
    strTooltip[7]="???????????????????????????????????????????"
}