class BTPageOption_Graphic extends BTPageOption_Base
    editinlinenew
    instanced;

struct DisplayMode
{
    var int Width;
    var int Height;
};

var() DisplayMode DisplayModes[17];
var() localized string BitDepthText[2];
var() string DisplayPromptMenu;
var() noexport transient string sRes;
var() noexport transient string sResD;
var() noexport transient string sRenDev;
var() noexport transient string sRenDevD;
var() noexport transient float fGamma;
var() noexport transient float fBright;
var() noexport transient float fContrast;
var() noexport transient float fDistance;
var() noexport transient float fDistanceD;
var() noexport transient float fSSAOFactor;
var() noexport transient float fSSAOFactorD;
var() noexport transient bool bDecal;
var() noexport transient bool bDynLight;
var() noexport transient bool bTexture;
var() noexport transient bool bCorona;
var() noexport transient bool bTrilin;
var() noexport transient bool bProj;
var() noexport transient bool bFol;
var() noexport transient bool bFullScreen;
var() noexport transient bool bWeather;
var() noexport transient bool bHDR;
var() noexport transient bool bDOF;
var() noexport transient bool bSSAO;
var() noexport transient bool bGlobalAntiportal;
var() noexport transient bool bLinkAntiportal;
var() noexport transient bool bHOQ;
var() noexport transient bool bShader;
var() noexport transient bool bSpecularMap;
var() noexport transient bool bDecalD;
var() noexport transient bool bDynLightD;
var() noexport transient bool bTextureD;
var() noexport transient bool bCoronaD;
var() noexport transient bool bTrilinD;
var() noexport transient bool bProjD;
var() noexport transient bool bFolD;
var() noexport transient bool bFullScreenD;
var() noexport transient bool bWeatherD;
var() noexport transient bool bHDRD;
var() noexport transient bool bDOFD;
var() noexport transient bool bSSAOD;
var() noexport transient bool bGlobalAntiportalD;
var() noexport transient bool bLinkAntiportalD;
var() noexport transient bool bHOQD;
var() noexport transient bool bShaderD;
var() noexport transient bool bSpecularMapD;
var() noexport transient int iColDepth;
var() noexport transient int iTexture;
var() noexport transient int iChar;
var() noexport transient int iPhys;
var() noexport transient int iWorld;
var() noexport transient int iDecal;
var() noexport transient int iShadow;
var() noexport transient int iMeshLOD;
var() noexport transient int iColDepthD;
var() noexport transient int iTextureD;
var() noexport transient int iCharD;
var() noexport transient int iWorldD;
var() noexport transient int iPhysD;
var() noexport transient int iDecalD;
var() noexport transient int iShadowD;
var() noexport transient int iMeshLODD;
var() noexport bool bIgnoreResNotice;
var() noexport bool bInvalidRes;
var() noexport bool bIgnoreChange;
var() localized string RelaunchQuestion;
var() localized string InvalidSelectionText;
var() automated GUILabel LabelScreenRatio;
var() automated BTComboBox ComboScreenRatio;
var() automated GUILabel LabelScreenResolution;
var() automated BTComboBox ComboScreenResolution;
var() automated GUILabel LabelColorDepth;
var() automated BTComboBox ComboColorDepth;
var() automated GUILabel LabelBrightness;
var() automated BTSliderSet SlideBrightness;
var() automated GUILabel LabelGore;
var() automated BTCheckBoxSet CbSetGore;
var() automated GUILabel LabelGoreNotice;
var() automated GUILabel LabelGraphicQuality;
var() automated BTSliderSet SlideGraphicQuality;
var() automated GUIButton ButtonAutoSetting;
var() automated GUIButton ButtonAdvancedOptions;
var() automated FloatingImage Separator1;
var() automated BTUIList UIList;
var() automated GUILabel LabelTextureQuality;
var() automated BTSliderSet SlideTextureQuality;
var() automated GUILabel LabelBGQuality;
var() automated BTSliderSet SlideBGQuality;
var() automated GUILabel LabelLOD;
var() automated BTSliderSet SlideLOD;
var() automated GUILabel LabelShadow;
var() automated BTSliderSet SlideShadow;
var() automated GUILabel LabelEffects;
var() automated BTSliderSet SlideEffects;
var() automated GUILabel LabelAntialias;
var() automated BTComboBox SlideAntialias;
var() automated GUILabel LabelShader;
var() automated BTCheckBoxSet CbSetShader;
var() automated GUILabel LabelSpecularMap;
var() automated BTCheckBoxSet CbSetSpecularMap;
var() automated GUILabel LabelHDR;
var() automated BTCheckBoxSet CbSetHDR;
var() automated GUILabel LabelDOF;
var() automated BTCheckBoxSet CbSetDOF;
var() automated GUILabel LabelSSAO;
var() automated BTCheckBoxSet CbSetSSAO;
var() automated GUILabel LabelDynamicLighting;
var() automated BTCheckBoxSet CbSetDynamicLighting;
var() automated GUILabel LabelCorona;
var() automated BTCheckBoxSet CbSetCorona;
var() automated GUILabel LabelDecal;
var() automated BTCheckBoxSet CbSetDecal;
var() automated BTSliderSet SlideDecal;
var() automated GUILabel LabelPhysics;
var() automated BTSliderSet SlidePhysics;
var() automated GUILabel LabelRagdoll;
var() automated BTCheckBoxSet CbSetRagdoll;
var localized string CaptionScreenRatio;
var localized string CaptionScreenResolution;
var localized string CaptionColorDepth;
var localized string CaptionBrightness;
var localized string CaptionGore;
var localized string CaptionGoreNotice;
var localized string CaptionGraphicQuality;
var localized string CaptionAutoSetting;
var localized string CaptionAdvancedOptions;
var localized string CaptionTextureQuality;
var localized string CaptionBGQuality;
var localized string CaptionLOD;
var localized string CaptionShadow;
var localized string CaptionEffects;
var localized string CaptionAntialias;
var localized string CaptionShader;
var localized string CaptionSpecularMap;
var localized string CaptionHDR;
var localized string CaptionDOF;
var localized string CaptionSSAO;
var localized string CaptionDynamicLighting;
var localized string CaptionCorona;
var localized string CaptionDecal;
var localized string CaptionPhysics;
var localized string CaptionRagdoll;
var localized string CaptionVeryHigh;
var localized string CaptionHigh;
var localized string CaptionNormal;
var localized string CaptionLow;
var localized string CaptionVeryLow;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ApplyLocalizedStrings();
    InitializeSlides();
    super.InitComponent(MyController, myOwner);
    ComboScreenRatio.ComboBox.AddItem("4:3");
    ComboScreenRatio.ComboBox.SetIndex(0);
    ComboScreenRatio.SetEnabled(false);
    CbSetGore.SetValue(true);
    CbSetGore.SetEnabled(false);
    SlideGraphicQuality.SetEnabled(false);
    CbSetRagdoll.SetValue(true);
    CbSetRagdoll.SetEnabled(false);
    CbSetSSAO.SetEnabled(false);
    InitializeUIList();
    InitializeCombos();
    //return;    
}

function InitializeSlides()
{
    SlideBrightness.Slide.MinValue = 0.0000000;
    SlideBrightness.Slide.MaxValue = 100.0000000;
    SlideGraphicQuality.Slide.MinValue = 0.0000000;
    SlideGraphicQuality.Slide.MaxValue = 4.0000000;
    SlideGraphicQuality.bUseSmoothSlide = false;
    SlideTextureQuality.Slide.MinValue = 0.0000000;
    SlideTextureQuality.Slide.MaxValue = 4.0000000;
    SlideTextureQuality.bUseSmoothSlide = false;
    SlideBGQuality.Slide.MinValue = 0.0000000;
    SlideBGQuality.Slide.MaxValue = 2.0000000;
    SlideBGQuality.bUseSmoothSlide = false;
    SlideLOD.Slide.MinValue = 0.0000000;
    SlideLOD.Slide.MaxValue = 3.0000000;
    SlideLOD.bUseSmoothSlide = false;
    SlideShadow.Slide.MinValue = 0.0000000;
    SlideShadow.Slide.MaxValue = 2.0000000;
    SlideShadow.bUseSmoothSlide = false;
    SlideEffects.Slide.MinValue = 0.0000000;
    SlideEffects.Slide.MaxValue = 2.0000000;
    SlideEffects.bUseSmoothSlide = false;
    SlidePhysics.Slide.MinValue = 0.0000000;
    SlidePhysics.Slide.MaxValue = 2.0000000;
    SlidePhysics.bUseSmoothSlide = false;
    SlideDecal.Slide.MinValue = 0.0000000;
    SlideDecal.Slide.MaxValue = 2.0000000;
    SlideDecal.bUseSmoothSlide = false;
    //return;    
}

function InitializeCombos()
{
    local int i;
    local array<GUIListElem> Options;

    i = 0;
    J0x07:

    // End:0xD9 [Loop If]
    if(i < Controls.Length)
    {
        // End:0xCF
        if(BTComboBox(Controls[i]) != none)
        {
            GetComboOptions(BTComboBox(Controls[i]), Options);
            BTComboBox(Controls[i]).ComboBox.List.Elements = Options;
            BTComboBox(Controls[i]).ComboBox.List.ItemCount = Options.Length;
            BTComboBox(Controls[i]).ComboBox.ReadOnly(true);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitializeUIListUpper()
{
    UIList.AddUIComponent(LabelScreenRatio);
    UIList.AddUIComponent(ComboScreenRatio);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelScreenResolution);
    UIList.AddUIComponent(ComboScreenResolution);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelColorDepth);
    UIList.AddUIComponent(ComboColorDepth);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelBrightness);
    UIList.AddUIComponent(SlideBrightness);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelGore);
    UIList.AddUIComponent(CbSetGore);
    UIList.AddUIComponent(LabelGoreNotice);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelGraphicQuality);
    UIList.AddUIComponent(SlideGraphicQuality);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(ButtonAutoSetting);
    UIList.AddUIComponent(ButtonAdvancedOptions);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(Separator1);
    UIList.AddLineBreaker();
    //return;    
}

function InitializeUIList()
{
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelTextureQuality);
    UIList.AddUIComponent(SlideTextureQuality);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelBGQuality);
    UIList.AddUIComponent(SlideBGQuality);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelLOD);
    UIList.AddUIComponent(SlideLOD);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelShadow);
    UIList.AddUIComponent(SlideShadow);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelEffects);
    UIList.AddUIComponent(SlideEffects);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelAntialias);
    UIList.AddUIComponent(SlideAntialias);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelShader);
    UIList.AddUIComponent(CbSetShader);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelSpecularMap);
    UIList.AddUIComponent(CbSetSpecularMap);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelHDR);
    UIList.AddUIComponent(CbSetHDR);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelDOF);
    UIList.AddUIComponent(CbSetDOF);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelSSAO);
    UIList.AddUIComponent(CbSetSSAO);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelDynamicLighting);
    UIList.AddUIComponent(CbSetDynamicLighting);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelCorona);
    UIList.AddUIComponent(CbSetCorona);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelDecal);
    UIList.AddUIComponent(CbSetDecal);
    UIList.AddUIComponent(SlideDecal);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelPhysics);
    UIList.AddUIComponent(SlidePhysics);
    UIList.AddLineBreaker();
    UIList.AddUIComponent(LabelRagdoll);
    UIList.AddUIComponent(CbSetRagdoll);
    UIList.AddLineBreaker();
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    CheckSupportedResolutions();
    bFullScreen = bool(PlayerOwner().ConsoleCommand("ISFULLSCREEN"));
    bFullScreenD = bFullScreen;
    fSSAOFactor = float(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager SSAOFactor"));
    fSSAOFactorD = fSSAOFactor;
    bHOQ = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager HOQ"));
    bHOQD = bHOQ;
    bLinkAntiportal = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager LinkAntiportal"));
    bLinkAntiportalD = bLinkAntiportal;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x60
    if((Controller.ActivePage == PageOwner) && bInvalidRes)
    {
        bInvalidRes = false;
        Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", InvalidSelectionText);
    }
    return false;
    //return;    
}

final function int GetValueFromConfigString(string ConfigString)
{
    switch(ConfigString)
    {
        // End:0x16
        case "UltraLow":
            return 0;
        // End:0x24
        case "VeryLow":
            return 1;
        // End:0x2F
        case "Low":
            return 2;
        // End:0x3C
        case "Lower":
            return 3;
        // End:0x4A
        case "Normal":
            return 4;
        // End:0x58
        case "Higher":
            return 5;
        // End:0x64
        case "High":
            return 6;
        // End:0x74
        case "VeryHigh":
            return 7;
        // End:0x85
        case "UltraHigh":
            return 8;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
}

final function string GetConfigStringFromValue(int val)
{
    switch(val)
    {
        // End:0x16
        case 0:
            return "UltraLow";
        // End:0x24
        case 1:
            return "VeryLow";
        // End:0x2F
        case 2:
            return "Low";
        // End:0x3C
        case 3:
            return "Lower";
        // End:0x4A
        case 4:
            return "Normal";
        // End:0x58
        case 5:
            return "Higher";
        // End:0x64
        case 6:
            return "High";
        // End:0x74
        case 7:
            return "VeryHigh";
        // End:0x85
        case 8:
            return "UltraHigh";
        // End:0xFFFF
        default:
            return "UltraLow";
            break;
    }
    //return;    
}

function ResolutionChanged(int NewX, int NewY)
{
    // End:0x41
    if(!bIgnoreResNotice)
    {
        // End:0x38
        if(Controller.ActivePage == PageOwner)
        {
            PageOwner.CheckResolution(false, Controller);
        }
        Refresh();        
    }
    else
    {
        InternalOnLoadINI(ComboColorDepth, "");
    }
    //return;    
}

function Refresh()
{
    InternalOnLoadINI(ComboScreenResolution, "");
    InternalOnLoadINI(ComboColorDepth, "");
    CheckSupportedResolutions();
    //return;    
}

function CheckSupportedResolutions()
{
    local int i, Index, BitDepth;
    local string CurrentSelection, str, W, H, WH;

    local bool bStandard, bSupported, bOldIgnoreChange;
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentSelection = ComboScreenResolution.ComboBox.GetText();
    bOldIgnoreChange = bIgnoreChange;
    bIgnoreChange = true;
    // End:0x7E
    if(ComboColorDepth.ComboBox.ItemCount() > 0)
    {
        BitDepth = int(Left(ComboColorDepth.ComboBox.GetText(), 2));
    }
    i = 0;
    J0x85:

    // End:0x222 [Loop If]
    if(i < 17)
    {
        W = string(DisplayModes[i].Width);
        H = string(DisplayModes[i].Height);
        WH = (W $ "x") $ H;
        str = (((("SUPPORTEDRESOLUTION WIDTH=" $ W) @ "HEIGHT=") $ H) @ "BITDEPTH=") $ string(BitDepth);
        // End:0x140
        if(CurrentSelection ~= WH)
        {
            bStandard = true;
        }
        Index = ComboScreenResolution.ComboBox.FindIndex(WH);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x1D7
        if(!bSupported && ComboScreenResolution.ComboBox.List.IsValidIndex(Index))
        {
            ComboScreenResolution.ComboBox.RemoveItem(Index, 1);
            // [Explicit Continue]
            goto J0x218;
        }
        // End:0x218
        if(bSupported && !ComboScreenResolution.ComboBox.List.IsValidIndex(Index))
        {
            AddNewResolution(WH);
        }
        J0x218:

        i++;
        // [Loop Continue]
        goto J0x85;
    }
    // End:0x2E5
    if(!bStandard)
    {
        Divide(CurrentSelection, "x", W, H);
        str = (((("SUPPORTEDRESOLUTION WIDTH=" $ W) @ "HEIGHT=") $ H) @ "BITDEPTH=") $ string(BitDepth);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x2E5
        if(!bSupported)
        {
            Index = ComboScreenResolution.ComboBox.FindIndex(CurrentSelection);
            bInvalidRes = true;
        }
    }
    CheckSliders();
    ComboScreenResolution.ComboBox.SetText(CurrentSelection);
    bIgnoreChange = bOldIgnoreChange;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local string str;
    local bool bGoingUp;
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    Log("[BTPageOption_Graphic::InternalOnChange] " $ string(Sender));
    // End:0x4A
    if(bIgnoreChange)
    {
        return;
    }
    switch(Sender)
    {
        // End:0x118
        case ComboScreenResolution:
            sRes = ComboScreenResolution.ComboBox.GetText();
            // End:0x8C
            if(bFullScreen)
            {
                str = "f";                
            }
            else
            {
                str = "w";
            }
            // End:0x115
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(((sRes $ "x") $ Left(BitDepthText[iColDepth], 2)) $ str);
            }
            // End:0x7DA
            break;
        // End:0x1DF
        case ComboColorDepth:
            iColDepth = ComboColorDepth.ComboBox.GetIndex();
            // End:0x153
            if(bFullScreen)
            {
                str = "f";                
            }
            else
            {
                str = "w";
            }
            // End:0x1DC
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(((sRes $ "x") $ Left(BitDepthText[iColDepth], 2)) $ str);
            }
            // End:0x7DA
            break;
        // End:0x23E
        case SlideTextureQuality:
            i = ConvertTextureQuality_ControlToEngine(int(SlideTextureQuality.Slide.Value));
            bGoingUp = (i > iTexture) && i != iTextureD;
            iTexture = i;
            // End:0x7DA
            break;
        // End:0x29D
        case SlideBGQuality:
            i = ConvertBGQuality_ControlToEngine(int(SlideBGQuality.Slide.Value));
            bGoingUp = (i > iWorld) && i != iWorldD;
            iWorld = i;
            // End:0x7DA
            break;
        // End:0x2FC
        case SlideLOD:
            i = ConvertLOD_ControlToEngine(int(SlideLOD.Slide.Value));
            bGoingUp = (i > iMeshLOD) && i != iMeshLODD;
            iMeshLOD = i;
            // End:0x7DA
            break;
        // End:0x35B
        case SlidePhysics:
            i = ConvertPhysics_ControlToEngine(int(SlidePhysics.Slide.Value));
            bGoingUp = (i > iPhys) && i != iPhysD;
            iPhys = i;
            // End:0x7DA
            break;
        // End:0x385
        case SlideDecal:
            iDecal = int(SlideDecal.Slide.Value);
            // End:0x7DA
            break;
        // End:0x3E4
        case SlideShadow:
            i = ConvertShadow_ControlToEngine(int(SlideShadow.Slide.Value));
            bGoingUp = (i > iShadow) && i != iShadowD;
            iShadow = i;
            // End:0x7DA
            break;
        // End:0x425
        case CbSetDynamicLighting:
            bDynLight = CbSetDynamicLighting.GetValue();
            bGoingUp = bDynLight && bDynLight != bDynLightD;
            // End:0x7DA
            break;
        // End:0x466
        case CbSetCorona:
            bCorona = CbSetCorona.GetValue();
            bGoingUp = bCorona && bCorona != bCoronaD;
            // End:0x7DA
            break;
        // End:0x4BC
        case CbSetDecal:
            bDecal = CbSetDecal.GetValue();
            bGoingUp = bDecal && bDecal != bDecalD;
            SlideDecal.SetEnabled(bDecal);
            // End:0x7DA
            break;
        // End:0x695
        case CbSetShader:
            bShader = CbSetShader.GetValue();
            bGoingUp = bShader && bShader != bShaderD;
            // End:0x534
            if(bool(PC.ConsoleCommand("SUPPORTEDR32")))
            {
                CbSetHDR.SetEnabled(bShader);                
            }
            else
            {
                CbSetHDR.SetEnabled(false);
            }
            // End:0x57E
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")))
            {
                CbSetDOF.SetEnabled(bShader);                
            }
            else
            {
                CbSetDOF.SetEnabled(false);
            }
            // End:0x5EC
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                CbSetSSAO.SetEnabled(bShader);                
            }
            else
            {
                CbSetSSAO.SetEnabled(false);
            }
            CbSetDynamicLighting.SetEnabled(bShader);
            CbSetSpecularMap.SetEnabled(bShader);
            // End:0x63A
            if(bShader)
            {
                bHOQ = true;                
            }
            else
            {
                CbSetHDR.SetValue(false);
                CbSetDOF.SetValue(false);
                CbSetSSAO.SetValue(false);
                CbSetDynamicLighting.SetValue(false);
                CbSetSpecularMap.SetValue(false);
                bHOQ = false;
            }
            // End:0x7DA
            break;
        // End:0x6D6
        case CbSetSpecularMap:
            bSpecularMap = CbSetSpecularMap.GetValue();
            bGoingUp = bSpecularMap && bSpecularMap != bSpecularMapD;
            // End:0x7DA
            break;
        // End:0x755
        case CbSetHDR:
            bHDR = CbSetHDR.GetValue();
            // End:0x722
            if(!bHDR)
            {
                CbSetSSAO.SetEnabled(false);
                CbSetSSAO.SetValue(false);                
            }
            else
            {
                CbSetSSAO.SetEnabled(true);
            }
            bGoingUp = bHDR && bHDR != bHDRD;
            // End:0x7DA
            break;
        // End:0x796
        case CbSetDOF:
            bDOF = CbSetDOF.GetValue();
            bGoingUp = bDOF && bDOF != bDOFD;
            // End:0x7DA
            break;
        // End:0x7D7
        case CbSetSSAO:
            bSSAO = CbSetSSAO.GetValue();
            bGoingUp = bSSAO && bSSAO != bSSAOD;
            // End:0x7DA
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool SaveSettings()
{
    local string t, V;
    local PlayerController PC;
    local bool bUnreal, bLevel, bNeedReload;

    Log("[BTPageOption_Graphic::SaveSettings] ");
    bNeedReload = false;
    // End:0x4A
    if(bShader != bShaderD)
    {
        bNeedReload = true;
    }
    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x173
    if(iTexture != iTextureD)
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        V = GetConfigStringFromValue(iTexture);
        PC.ConsoleCommand((t $ "Terrain") @ V);
        PC.ConsoleCommand((t $ "World") @ V);
        PC.ConsoleCommand((t $ "Rendermap") @ V);
        PC.ConsoleCommand((t $ "Lightmap") @ V);
        PC.ConsoleCommand("flush");
        iTextureD = iTexture;
    }
    // End:0x3CB
    if(iWorld != iWorldD)
    {
        switch(iWorld)
        {
            // End:0x246
            case 3:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors False");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                PC.Level.DetailChange(0);
                // End:0x3C0
                break;
            // End:0x302
            case 4:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                PC.Level.DetailChange(1);
                // End:0x3C0
                break;
            // End:0x3BD
            case 5:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
                PC.Level.DetailChange(2);
                // End:0x3C0
                break;
            // End:0xFFFF
            default:
                break;
        }
        iWorldD = iWorld;
    }
    // End:0x4C3
    if(iMeshLOD != iMeshLODD)
    {
        switch(iMeshLOD)
        {
            // End:0x414
            case 3:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 0;
                PC.Level.MeshLODDetailLevel = 0;
                // End:0x4B0
                break;
            // End:0x447
            case 4:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 1;
                PC.Level.MeshLODDetailLevel = 1;
                // End:0x4B0
                break;
            // End:0x47A
            case 5:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 2;
                PC.Level.MeshLODDetailLevel = 2;
                // End:0x4B0
                break;
            // End:0x4AD
            case 8:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 3;
                PC.Level.MeshLODDetailLevel = 3;
                // End:0x4B0
                break;
            // End:0xFFFF
            default:
                break;
        }
        iMeshLODD = iMeshLOD;
        bLevel = true;
    }
    // End:0x588
    if(iPhys != iPhysD)
    {
        switch(iPhys)
        {
            // End:0x50C
            case 3:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 0;
                PC.Level.PhysicsDetailLevel = 0;
                // End:0x575
                break;
            // End:0x53F
            case 4:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 1;
                PC.Level.PhysicsDetailLevel = 1;
                // End:0x575
                break;
            // End:0x572
            case 5:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 2;
                PC.Level.PhysicsDetailLevel = 2;
                // End:0x575
                break;
            // End:0xFFFF
            default:
                break;
        }
        iPhysD = iPhys;
        bLevel = true;
    }
    // End:0x655
    if(iShadow != iShadowD)
    {
        // End:0x612
        if((PC.Pawn != none) && UnrealPawn(PC.Pawn) != none)
        {
            UnrealPawn(PC.Pawn).bBlobShadow = iShadow == 1;
            UnrealPawn(PC.Pawn).bPlayerShadows = iShadow > 0;
        }
        Class'UnrealGame.UnrealPawn'.default.bBlobShadow = iShadow == 1;
        Class'UnrealGame.UnrealPawn'.default.bPlayerShadows = iShadow > 0;
        iShadowD = iShadow;
        bUnreal = true;
    }
    // End:0x698
    if(Class'Engine.Vehicle'.default.bVehicleShadows != (iShadow > 0))
    {
        Class'Engine.Vehicle'.default.bVehicleShadows = iShadow > 0;
        Class'Engine.Vehicle'.static.StaticSaveConfig();
    }
    // End:0x709
    if(bDynLight != bDynLightD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager NoDynamicLights" @ string(!bDynLight));
        bDynLightD = bDynLight;
    }
    // End:0x774
    if(iDecal != iDecalD)
    {
        // End:0x74B
        if(PC.Level != none)
        {
            PC.Level.DecalStayScale = float(iDecal);
        }
        Class'Engine.LevelInfo'.default.DecalStayScale = float(iDecal);
        iDecalD = iDecal;
        bLevel = true;
    }
    // End:0x7DB
    if(bCorona != bCoronaD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Coronas" @ string(bCorona));
        bCoronaD = bCorona;
    }
    // End:0x841
    if(bDecal != bDecalD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Decals" @ string(bDecal));
        bDecalD = bDecal;
    }
    // End:0x8A7
    if(bShader != bShaderD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Shader" @ string(bShader));
        bShaderD = bShader;
    }
    // End:0x912
    if(bSpecularMap != bSpecularMapD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SpecularMap" @ string(bSpecularMap));
        bSpecularMapD = bSpecularMap;
    }
    // End:0x975
    if(bHDR != bHDRD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HDR" @ string(bHDR));
        bHDRD = bHDR;
    }
    // End:0x9D8
    if(bDOF != bDOFD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DOF" @ string(bDOF));
        bDOFD = bDOF;
    }
    // End:0xA3C
    if(bSSAO != bSSAOD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SSAO" @ string(bSSAO));
        bSSAOD = bSSAO;
    }
    // End:0xA9F
    if(bHOQ != bHOQD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HOQ" @ string(bHOQ));
        bHOQD = bHOQ;
    }
    // End:0xB03
    if(bUnreal)
    {
        // End:0xAF4
        if((PC.Pawn != none) && UnrealPawn(PC.Pawn) != none)
        {
            UnrealPawn(PC.Pawn).SaveConfig();            
        }
        else
        {
            Class'UnrealGame.UnrealPawn'.static.StaticSaveConfig();
        }
    }
    // End:0xB47
    if(bLevel)
    {
        // End:0xB38
        if(PC.Level != none)
        {
            PC.Level.SaveConfig();            
        }
        else
        {
            Class'Engine.LevelInfo'.static.StaticSaveConfig();
        }
    }
    return bNeedReload;
    //return;    
}

function int ConvertLOD_EngineToControl(int i)
{
    switch(i)
    {
        // End:0x0E
        case 3:
            return 0;
        // End:0x15
        case 4:
            return 1;
        // End:0x1D
        case 5:
            return 2;
        // End:0x25
        case 8:
            return 3;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
}

function int ConvertLOD_ControlToEngine(int i)
{
    switch(i)
    {
        // End:0x0E
        case 0:
            return 3;
        // End:0x15
        case 1:
            return 4;
        // End:0x1D
        case 2:
            return 5;
        // End:0x25
        case 3:
            return 8;
        // End:0xFFFF
        default:
            return 3;
            break;
    }
    //return;    
}

function int ConvertTextureQuality_EngineToControl(int i)
{
    return i / 2;
    //return;    
}

function int ConvertTextureQuality_ControlToEngine(int i)
{
    return i * 2;
    //return;    
}

function int ConvertBGQuality_EngineToControl(int i)
{
    return i - 3;
    //return;    
}

function int ConvertBGQuality_ControlToEngine(int i)
{
    return i + 3;
    //return;    
}

function int ConvertShadow_EngineToControl(int i)
{
    return i;
    //return;    
}

function int ConvertShadow_ControlToEngine(int i)
{
    return i;
    //return;    
}

function int ConvertPhysics_EngineToControl(int i)
{
    return i - 3;
    //return;    
}

function int ConvertPhysics_ControlToEngine(int i)
{
    return i + 3;
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local bool A, B;
    local int i;
    local PlayerController PC;
    local string TempStr;

    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0xAB
        case SlideTextureQuality:
            i = GetValueFromConfigString(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailWorld"));
            iTexture = i;
            iTextureD = iTexture;
            SlideTextureQuality.Slide.SetValue(float(ConvertTextureQuality_EngineToControl(iTexture)));
            // End:0xDB9
            break;
        // End:0x1B5
        case SlideBGQuality:
            A = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice HighDetailActors"));
            B = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice SuperHighDetailActors"));
            // End:0x166
            if(B)
            {
                iWorld = 5;                
            }
            else
            {
                // End:0x17A
                if(A)
                {
                    iWorld = 4;                    
                }
                else
                {
                    iWorld = 3;
                }
            }
            iWorldD = iWorld;
            SlideBGQuality.Slide.SetValue(float(ConvertBGQuality_EngineToControl(iWorld)));
            // End:0xDB9
            break;
        // End:0x243
        case SlideLOD:
            switch(Class'Engine.LevelInfo'.default.MeshLODDetailLevel)
            {
                // End:0x1DD
                case 0:
                    iMeshLOD = 3;
                    // End:0x210
                    break;
                // End:0x1ED
                case 1:
                    iMeshLOD = 4;
                    // End:0x210
                    break;
                // End:0x1FD
                case 2:
                    iMeshLOD = 5;
                    // End:0x210
                    break;
                // End:0x20D
                case 3:
                    iMeshLOD = 8;
                    // End:0x210
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            iMeshLODD = iMeshLOD;
            SlideLOD.Slide.SetValue(float(ConvertLOD_EngineToControl(iMeshLOD)));
            // End:0xDB9
            break;
        // End:0x2CE
        case SlidePhysics:
            // End:0x26F
            if(int(Class'Engine.LevelInfo'.default.PhysicsDetailLevel) == int(0))
            {
                iPhys = 3;                
            }
            else
            {
                // End:0x293
                if(int(Class'Engine.LevelInfo'.default.PhysicsDetailLevel) == int(1))
                {
                    iPhys = 4;                    
                }
                else
                {
                    iPhys = 5;
                }
            }
            SlidePhysics.Slide.SetValue(float(ConvertPhysics_EngineToControl(iPhys)));
            iPhysD = iPhys;
            // End:0xDB9
            break;
        // End:0x319
        case SlideDecal:
            iDecal = int(Class'Engine.LevelInfo'.default.DecalStayScale);
            iDecalD = iDecal;
            SlideDecal.Slide.SetValue(float(iDecal));
            // End:0xDB9
            break;
        // End:0x3D6
        case ComboScreenResolution:
            // End:0x34D
            if(Controller.GameResolution != "")
            {
                sRes = Controller.GameResolution;                
            }
            else
            {
                sRes = Controller.GetCurrentRes();
            }
            sResD = sRes;
            i = AddNewResolution(sRes);
            // End:0x3D3
            if((i >= 0) && i < ComboScreenResolution.ComboBox.ItemCount())
            {
                ComboScreenResolution.ComboBox.List.SetIndex(i);
            }
            // End:0xDB9
            break;
        // End:0x4A9
        case ComboColorDepth:
            // End:0x429
            if(bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit")))
            {
                iColDepth = 0;                
            }
            else
            {
                iColDepth = 1;
            }
            iColDepthD = iColDepth;
            ComboColorDepth.ComboBox.List.SetIndex(iColDepth);
            // End:0x497
            if(!bool(PC.ConsoleCommand("ISFULLSCREEN")))
            {
                ComboColorDepth.DisableMe();                
            }
            else
            {
                ComboColorDepth.EnableMe();
            }
            // End:0xDB9
            break;
        // End:0x689
        case SlideShadow:
            TempStr = GetNativeClassName("Engine.Engine.RenderDevice");
            // End:0x5FD
            if(((TempStr == "D3DDrv.D3DRenderDevice") || TempStr == "D3D9Drv.D3D9RenderDevice") || TempStr == "OpenGLDrv.OpenGLRenderDevice")
            {
                A = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bPlayerShadows"));
                B = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bBlobShadow"));
                // End:0x5DF
                if(B)
                {
                    iShadow = 1;                    
                }
                else
                {
                    // End:0x5F3
                    if(A)
                    {
                        iShadow = 2;                        
                    }
                    else
                    {
                        iShadow = 0;
                    }
                }                
            }
            else
            {
                B = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bBlobShadow"));
                // End:0x64F
                if(B)
                {
                    iShadow = 1;                    
                }
                else
                {
                    iShadow = 0;
                }
            }
            iShadowD = iShadow;
            SlideShadow.Slide.SetValue(float(ConvertShadow_EngineToControl(iShadow)));
            // End:0xDB9
            break;
        // End:0x7AB
        case CbSetDynamicLighting:
            // End:0x76E
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDynLight = !bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager NoDynamicLights"));
                bDynLightD = bDynLight;
                CbSetDynamicLighting.SetValue(bDynLight);                
            }
            else
            {
                bDynLight = false;
                bDynLightD = bDynLight;
                CbSetDynamicLighting.SetValue(bDynLight);
                CbSetDynamicLighting.SetEnabled(false);
            }
            // End:0xDB9
            break;
        // End:0x81F
        case CbSetCorona:
            bCorona = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Coronas"));
            bCoronaD = bCorona;
            CbSetCorona.SetValue(bCorona);
            // End:0xDB9
            break;
        // End:0x8A7
        case CbSetDecal:
            bDecal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Decals"));
            bDecalD = bDecal;
            CbSetDecal.SetValue(bDecal);
            SlideDecal.SetEnabled(bDecal);
            // End:0xDB9
            break;
        // End:0x958
        case CbSetShader:
            // End:0x91B
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")))
            {
                bShader = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader"));                
            }
            else
            {
                bShader = false;
                CbSetShader.SetEnabled(false);
            }
            bShaderD = bShader;
            CbSetShader.SetValue(bShader);
            // End:0xDB9
            break;
        // End:0xA0E
        case CbSetSpecularMap:
            // End:0x9D1
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")))
            {
                bSpecularMap = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager SpecularMap"));                
            }
            else
            {
                bSpecularMap = false;
                CbSetSpecularMap.SetEnabled(false);
            }
            bSpecularMapD = bSpecularMap;
            CbSetSpecularMap.SetValue(bSpecularMap);
            // End:0xDB9
            break;
        // End:0xB24
        case CbSetHDR:
            // End:0xAE7
            if((bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader"))) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                bHDR = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR"));                
            }
            else
            {
                bHDR = false;
                CbSetHDR.SetEnabled(false);
            }
            bHDRD = bHDR;
            CbSetHDR.SetValue(bHDR);
            // End:0xDB9
            break;
        // End:0xCA0
        case CbSetSSAO:
            // End:0xC63
            if((((bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR"))) && bool(PC.ConsoleCommand("SUPPORTEDPS30"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bSSAO = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager SSAO"));                
            }
            else
            {
                bSSAO = false;
                CbSetSSAO.SetEnabled(false);
            }
            bSSAOD = bSSAO;
            CbSetSSAO.SetValue(bSSAO);
            // End:0xDB9
            break;
        // End:0xDB6
        case CbSetDOF:
            // End:0xD79
            if((bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDPS30"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDOF = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DOF"));                
            }
            else
            {
                bDOF = false;
                CbSetDOF.SetEnabled(false);
            }
            bDOFD = bDOF;
            CbSetDOF.SetValue(bDOF);
            // End:0xDB9
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function int AddNewResolution(string NewDisplayMode)
{
    local int i, ItemW, ItemH, InWidth, InHeight;

    local bool bTemp;
    local string str, StrW, StrH;

    bTemp = bIgnoreChange;
    bIgnoreChange = true;
    i = ComboScreenResolution.ComboBox.FindIndex(NewDisplayMode);
    // End:0x56
    if(i >= 0)
    {
        bIgnoreChange = bTemp;
        return i;
    }
    Divide(NewDisplayMode, "x", StrW, StrH);
    InWidth = int(StrW);
    InHeight = int(StrH);
    i = 0;
    J0x8B:

    // End:0x13E [Loop If]
    if(i < ComboScreenResolution.ComboBox.ItemCount())
    {
        str = ComboScreenResolution.ComboBox.GetItem(i);
        Divide(str, "x", StrW, StrH);
        ItemW = int(StrW);
        ItemH = int(StrH);
        // End:0x122
        if(ItemW == InWidth)
        {
            // End:0x11F
            if(ItemH > InHeight)
            {
                // [Explicit Break]
                goto J0x13E;
            }
            // [Explicit Continue]
            goto J0x134;
        }
        // End:0x134
        if(ItemW > InWidth)
        {
            // [Explicit Break]
            goto J0x13E;
        }
        J0x134:

        i++;
        // [Loop Continue]
        goto J0x8B;
    }
    J0x13E:

    // End:0x180
    if(i == ComboScreenResolution.ComboBox.ItemCount())
    {
        ComboScreenResolution.ComboBox.AddItem(NewDisplayMode);        
    }
    else
    {
        ComboScreenResolution.ComboBox.List.Insert(i, NewDisplayMode);
    }
    bIgnoreChange = bTemp;
    return i;
    //return;    
}

function CheckSliders()
{
    // End:0x24
    if(bFullScreen || !PlatformIsWindows())
    {
        EnableComponent(SlideBrightness);        
    }
    else
    {
        DisableComponent(SlideBrightness);
    }
    //return;    
}

function VideoChangeClose(optional bool bCancelled)
{
    local bool bTemp;
    local string NewX, NewY;

    Log("[BTPageOption_Graphic::VideoChangeClose]");
    Divide(sRes, "x", NewX, NewY);
    // End:0x8E
    if(bCancelled)
    {
        bTemp = bIgnoreChange;
        bIgnoreChange = true;
        ComboScreenResolution.LoadINI();
        ComboColorDepth.LoadINI();
        bIgnoreChange = bTemp;        
    }
    else
    {
        // End:0xD5
        if((int(NewX) < 640) || int(NewY) < 480)
        {
            Controller.GameResolution = (NewX $ "x") $ NewY;            
        }
        else
        {
            Controller.GameResolution = "";
        }
        iColDepthD = iColDepth;
        sResD = sRes;
        // End:0x16B
        if(bFullScreen != bFullScreenD)
        {
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.ViewportManager StartupFullScreen" @ string(bFullScreen));
            bFullScreenD = bFullScreen;
        }
    }
    CheckSliders();
    bIgnoreResNotice = false;
    //return;    
}

final function GetComboOptions(BTComboBox Combo, out array<GUIListElem> AR)
{
    local int i;

    AR.Remove(0, AR.Length);
    // End:0x1A
    if(Combo == none)
    {
        return;
    }
    switch(Combo)
    {
        // End:0x5D
        case ComboColorDepth:
            AR.Length = 2;
            AR[0].Item = BitDepthText[0];
            AR[1].Item = BitDepthText[1];
            // End:0xD1
            break;
        // End:0xCE
        case ComboScreenResolution:
            AR.Length = 17;
            i = 0;
            J0x75:

            // End:0xCB [Loop If]
            if(i < AR.Length)
            {
                AR[i].Item = (string(DisplayModes[i].Width) $ "x") $ string(DisplayModes[i].Height);
                i++;
                // [Loop Continue]
                goto J0x75;
            }
            // End:0xD1
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelScreenRatio.Caption = CaptionScreenRatio;
    LabelScreenResolution.Caption = CaptionScreenResolution;
    LabelColorDepth.Caption = CaptionColorDepth;
    LabelBrightness.Caption = CaptionBrightness;
    LabelGore.Caption = CaptionGore;
    LabelGoreNotice.Caption = CaptionGoreNotice;
    LabelGraphicQuality.Caption = CaptionGraphicQuality;
    ButtonAutoSetting.Caption = CaptionAutoSetting;
    ButtonAdvancedOptions.Caption = CaptionAdvancedOptions;
    LabelTextureQuality.Caption = CaptionTextureQuality;
    LabelBGQuality.Caption = CaptionBGQuality;
    LabelLOD.Caption = CaptionLOD;
    LabelShadow.Caption = CaptionShadow;
    LabelEffects.Caption = CaptionEffects;
    LabelAntialias.Caption = CaptionAntialias;
    LabelShader.Caption = CaptionShader;
    LabelSpecularMap.Caption = CaptionSpecularMap;
    LabelHDR.Caption = CaptionHDR;
    LabelDOF.Caption = CaptionDOF;
    LabelSSAO.Caption = CaptionSSAO;
    LabelDynamicLighting.Caption = CaptionDynamicLighting;
    LabelCorona.Caption = CaptionCorona;
    LabelDecal.Caption = CaptionDecal;
    LabelPhysics.Caption = CaptionPhysics;
    LabelRagdoll.Caption = CaptionRagdoll;
    //return;    
}

function bool ButtonAdvancedOptions_OnClick(GUIComponent Sender)
{
    Log("[BTPageOption_Graphic::ButtonAdvancedOptions_OnClick]");
    UIList.bVisible = !UIList.bVisible;
    return true;
    //return;    
}

function ResetSettings()
{
    Log("[BTPageOption_Graphic::ResetSettings]");
    SlideTextureQuality.Slide.Adjust(4.0000000);
    SlideBGQuality.Slide.Adjust(2.0000000);
    SlideLOD.Slide.Adjust(0.0000000);
    SlideShadow.Slide.Adjust(1.0000000);
    CbSetShader.SetValue(true);
    CbSetSpecularMap.SetValue(true);
    CbSetHDR.SetValue(false);
    CbSetDOF.SetValue(true);
    CbSetSSAO.SetValue(false);
    CbSetDynamicLighting.SetValue(false);
    CbSetDecal.SetValue(true);
    CbSetCorona.SetValue(true);
    ComboScreenResolution.ComboBox.SetIndex(ComboScreenResolution.ComboBox.FindIndex("1024x768"));
    //return;    
}

defaultproperties
{
    DisplayModes[0]=(Width=320,Height=240)
    DisplayModes[1]=(Width=512,Height=384)
    DisplayModes[2]=(Width=640,Height=480)
    DisplayModes[3]=(Width=800,Height=500)
    DisplayModes[4]=(Width=800,Height=600)
    DisplayModes[5]=(Width=1024,Height=640)
    DisplayModes[6]=(Width=1024,Height=768)
    DisplayModes[7]=(Width=1152,Height=768)
    DisplayModes[8]=(Width=1152,Height=864)
    DisplayModes[9]=(Width=1280,Height=800)
    DisplayModes[10]=(Width=1280,Height=854)
    DisplayModes[11]=(Width=1280,Height=960)
    DisplayModes[12]=(Width=1280,Height=1024)
    DisplayModes[13]=(Width=1600,Height=1024)
    DisplayModes[14]=(Width=1600,Height=1200)
    DisplayModes[15]=(Width=1680,Height=1050)
    DisplayModes[16]=(Width=1920,Height=1200)
    BitDepthText[0]="16-bit"
    BitDepthText[1]="32-bit"
    DisplayPromptMenu="GUI2K4.UT2K4VideoChangeOK"
    RelaunchQuestion="The graphics mode has been successfully changed.  However, it will not take effect until the next time the game is started.  Would you like to restart Battery right now?"
    InvalidSelectionText="The selected custom resolution is reported to be incompatible with your machine.  In order to ensure maximum stability, it is recommended that you choose a compatible resolution from the 'Resolution' drop-down menu"
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelScreenRatio'
    begin object name="mLabelScreenRatio" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2591146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelScreenRatio=mLabelScreenRatio
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Graphic.mComboScreenRatio'
    begin object name="mComboScreenRatio" class=GUIWarfareControls.BTComboBox
        WinTop=0.2591146
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboScreenRatio.InternalPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    ComboScreenRatio=mComboScreenRatio
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelScreenResolution'
    begin object name="mLabelScreenResolution" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2981771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelScreenResolution=mLabelScreenResolution
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Graphic.mComboScreenResolution'
    begin object name="mComboScreenResolution" class=GUIWarfareControls.BTComboBox
        IniOption="@INTERNAL"
        IniDefault="1024x768"
        WinTop=0.2981771
        WinLeft=0.3955078
        WinWidth=0.2958984
        RenderWeight=1.0000000
        OnPreDraw=mComboScreenResolution.InternalPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    ComboScreenResolution=mComboScreenResolution
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelColorDepth'
    begin object name="mLabelColorDepth" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.3372396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelColorDepth=mLabelColorDepth
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Graphic.mComboColorDepth'
    begin object name="mComboColorDepth" class=GUIWarfareControls.BTComboBox
        IniOption="@Internal"
        IniDefault="false"
        WinTop=0.3372396
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboColorDepth.InternalPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    ComboColorDepth=mComboColorDepth
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelBrightness'
    begin object name="mLabelBrightness" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.3763021
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelBrightness=mLabelBrightness
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideBrightness'
    begin object name="mSlideBrightness" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="80"
        OnPreDraw=mSlideBrightness.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideBrightness=mSlideBrightness
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelGore'
    begin object name="mLabelGore" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.4153646
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelGore=mLabelGore
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetGore'
    begin object name="mCbSetGore" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        OnPreDraw=mCbSetGore.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetGore=mCbSetGore
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelGoreNotice'
    begin object name="mLabelGoreNotice" class=XInterface.GUILabel
        TextColor=(R=129,G=0,B=1,A=255)
        WinTop=0.4153646
        WinLeft=0.5654297
        WinWidth=0.1328125
        WinHeight=0.0312500
    end object
    LabelGoreNotice=mLabelGoreNotice
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelGraphicQuality'
    begin object name="mLabelGraphicQuality" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.4544271
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelGraphicQuality=mLabelGraphicQuality
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideGraphicQuality'
    begin object name="mSlideGraphicQuality" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        WinTop=0.4544271
        OnPreDraw=mSlideGraphicQuality.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideGraphicQuality=mSlideGraphicQuality
    // Reference: GUIButton'GUIWarfare_Decompressed.BTPageOption_Graphic.mButtonAutoSetting'
    begin object name="mButtonAutoSetting" class=XInterface.GUIButton
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5000000
        WinLeft=0.3955078
        WinWidth=0.1464844
        WinHeight=0.0403646
        OnKeyEvent=mButtonAutoSetting.InternalOnKeyEvent
    end object
    ButtonAutoSetting=mButtonAutoSetting
    // Reference: GUIButton'GUIWarfare_Decompressed.BTPageOption_Graphic.mButtonAdvancedOptions'
    begin object name="mButtonAdvancedOptions" class=XInterface.GUIButton
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5000000
        WinLeft=0.5449219
        WinWidth=0.1464844
        WinHeight=0.0403646
        OnClick=BTPageOption_Graphic.ButtonAdvancedOptions_OnClick
        OnKeyEvent=mButtonAdvancedOptions.InternalOnKeyEvent
    end object
    ButtonAdvancedOptions=mButtonAdvancedOptions
    // Reference: FloatingImage'GUIWarfare_Decompressed.BTPageOption_Graphic.mSeparator1'
    begin object name="mSeparator1" class=XInterface.FloatingImage
        Image=Texture'Warfare_UI.Common_1.line_bagic_2pixel'
        X1=0
        Y1=0
        X2=2
        Y2=2
        DropShadowX=0
        DropShadowY=0
        WinTop=0.5559896
        WinLeft=0.2939453
        WinWidth=0.3974609
        WinHeight=0.0013021
        RenderWeight=0.2000000
    end object
    Separator1=mSeparator1
    // Reference: BTUIList'GUIWarfare_Decompressed.BTPageOption_Graphic.mUIList'
    begin object name="mUIList" class=GUIWarfareControls.BTUIList
        OnCreateComponent=mUIList.InternalOnCreateComponent
        WinTop=0.5716146
        WinLeft=0.2949219
        WinWidth=0.3974609
        WinHeight=0.1562500
        bVisible=false
        OnPreDraw=mUIList.OnPreDraw
        OnRendered=mUIList.OnRendered
    end object
    UIList=mUIList
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelTextureQuality'
    begin object name="mLabelTextureQuality" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.5716146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelTextureQuality=mLabelTextureQuality
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideTextureQuality'
    begin object name="mSlideTextureQuality" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        WinTop=0.5716146
        OnPreDraw=mSlideTextureQuality.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideTextureQuality=mSlideTextureQuality
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelBGQuality'
    begin object name="mLabelBGQuality" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.6106771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelBGQuality=mLabelBGQuality
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideBGQuality'
    begin object name="mSlideBGQuality" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="High"
        WinTop=0.6106771
        OnPreDraw=mSlideBGQuality.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideBGQuality=mSlideBGQuality
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelLOD'
    begin object name="mLabelLOD" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.6497396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelLOD=mLabelLOD
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideLOD'
    begin object name="mSlideLOD" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        WinTop=0.6497396
        OnPreDraw=mSlideLOD.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideLOD=mSlideLOD
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelShadow'
    begin object name="mLabelShadow" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.6888021
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelShadow=mLabelShadow
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideShadow'
    begin object name="mSlideShadow" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        WinTop=0.6888021
        OnPreDraw=mSlideShadow.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideShadow=mSlideShadow
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelEffects'
    begin object name="mLabelEffects" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.7278646
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelEffects=mLabelEffects
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideEffects'
    begin object name="mSlideEffects" class=GUIWarfareControls.BTSliderSet
        WinTop=0.7278646
        OnPreDraw=mSlideEffects.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideEffects=mSlideEffects
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelAntialias'
    begin object name="mLabelAntialias" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.7669271
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelAntialias=mLabelAntialias
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideAntialias'
    begin object name="mSlideAntialias" class=GUIWarfareControls.BTComboBox
        WinTop=0.7669271
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mSlideAntialias.InternalPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideAntialias=mSlideAntialias
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelShader'
    begin object name="mLabelShader" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8059896
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelShader=mLabelShader
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetShader'
    begin object name="mCbSetShader" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=0.8059896
        OnPreDraw=mCbSetShader.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetShader=mCbSetShader
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelSpecularMap'
    begin object name="mLabelSpecularMap" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8450521
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelSpecularMap=mLabelSpecularMap
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetSpecularMap'
    begin object name="mCbSetSpecularMap" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=0.8450521
        OnPreDraw=mCbSetSpecularMap.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetSpecularMap=mCbSetSpecularMap
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelHDR'
    begin object name="mLabelHDR" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.8841146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelHDR=mLabelHDR
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetHDR'
    begin object name="mCbSetHDR" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=0.8841146
        OnPreDraw=mCbSetHDR.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetHDR=mCbSetHDR
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelDOF'
    begin object name="mLabelDOF" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.9231771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelDOF=mLabelDOF
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetDOF'
    begin object name="mCbSetDOF" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=0.9231771
        OnPreDraw=mCbSetDOF.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetDOF=mCbSetDOF
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelSSAO'
    begin object name="mLabelSSAO" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.9622396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelSSAO=mLabelSSAO
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetSSAO'
    begin object name="mCbSetSSAO" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=0.9622396
        OnPreDraw=mCbSetSSAO.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetSSAO=mCbSetSSAO
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelDynamicLighting'
    begin object name="mLabelDynamicLighting" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=1.0013021
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelDynamicLighting=mLabelDynamicLighting
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetDynamicLighting'
    begin object name="mCbSetDynamicLighting" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=1.0013021
        OnPreDraw=mCbSetDynamicLighting.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetDynamicLighting=mCbSetDynamicLighting
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelCorona'
    begin object name="mLabelCorona" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=1.0403646
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelCorona=mLabelCorona
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetCorona'
    begin object name="mCbSetCorona" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=1.0403646
        OnPreDraw=mCbSetCorona.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetCorona=mCbSetCorona
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelDecal'
    begin object name="mLabelDecal" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=1.0794271
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelDecal=mLabelDecal
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetDecal'
    begin object name="mCbSetDecal" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        IniDefault="True"
        WinTop=1.0794271
        OnPreDraw=mCbSetDecal.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetDecal=mCbSetDecal
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlideDecal'
    begin object name="mSlideDecal" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="Normal"
        WinTop=1.1184896
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mSlideDecal.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlideDecal=mSlideDecal
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelPhysics'
    begin object name="mLabelPhysics" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=1.1575521
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelPhysics=mLabelPhysics
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mSlidePhysics'
    begin object name="mSlidePhysics" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="High"
        WinTop=1.1575521
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mSlidePhysics.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    SlidePhysics=mSlidePhysics
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Graphic.mLabelRagdoll'
    begin object name="mLabelRagdoll" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=1.1966146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelRagdoll=mLabelRagdoll
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Graphic.mCbSetRagdoll'
    begin object name="mCbSetRagdoll" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        WinTop=1.1966146
        OnPreDraw=mCbSetRagdoll.InternalOnPreDraw
        OnChange=BTPageOption_Graphic.InternalOnChange
        OnLoadINI=BTPageOption_Graphic.InternalOnLoadINI
    end object
    CbSetRagdoll=mCbSetRagdoll
    CaptionScreenRatio="?? ??"
    CaptionScreenResolution="???"
    CaptionColorDepth="??"
    CaptionBrightness="?? ??"
    CaptionGore="?? ??"
    CaptionGoreNotice="19? ??? ????"
    CaptionGraphicQuality="??? ??"
    CaptionAutoSetting="?? ??"
    CaptionAdvancedOptions="?? ??"
    CaptionTextureQuality="??? ??"
    CaptionBGQuality="?? ??"
    CaptionLOD="LOD"
    CaptionShadow="??? ???"
    CaptionEffects="?? ??"
    CaptionAntialias="?? ????"
    CaptionShader="???"
    CaptionSpecularMap="???"
    CaptionHDR="HDR"
    CaptionDOF="DOF"
    CaptionSSAO="SSAO"
    CaptionDynamicLighting="???? ???"
    CaptionCorona="???"
    CaptionDecal="??"
    CaptionPhysics="?? ??"
    CaptionRagdoll="??"
    CaptionVeryHigh="??"
    CaptionHigh="?"
    CaptionNormal="?"
    CaptionLow="?"
    CaptionVeryLow="??"
    PropagateVisibility=false
    OnPreDraw=BTPageOption_Graphic.InternalOnPreDraw
}