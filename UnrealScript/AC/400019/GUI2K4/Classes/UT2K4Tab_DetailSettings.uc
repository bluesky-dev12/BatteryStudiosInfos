class UT2K4Tab_DetailSettings extends Settings_Tabs
    editinlinenew
    instanced;

const RENDERMODECOUNT = 2;

struct DisplayMode
{
    var int width;
    var int Height;
};

var() DisplayMode DisplayModes[17];
var() localized string BitDepthText[2];
var() localized string DetailLevels[9];
var() localized string ShadowOptions[3];
var() localized string RenderModeText[2];
var() string RenderMode[2];
var() string DisplayPromptMenu;
var() automated GUISectionBackground sb_Section1;
var() automated GUISectionBackground sb_Section2;
var() automated GUISectionBackground sb_Section3;
var() automated GUIImage i_Gamma;
var() automated GUIImage i_GammaBar;
var() automated moComboBox co_Texture;
var() automated moComboBox co_Char;
var() automated moComboBox co_World;
var() automated moComboBox co_Physics;
var() automated moComboBox co_Decal;
var() automated moComboBox co_MeshLOD;
var() automated moComboBox co_Resolution;
var() automated moComboBox co_ColorDepth;
var() automated moComboBox co_RenderDevice;
var() automated moComboBox co_Shadows;
var() automated moCheckBox ch_Decals;
var() automated moCheckBox ch_DynLight;
var() automated moCheckBox ch_Coronas;
var() automated moCheckBox ch_Textures;
var() automated moCheckBox ch_Projectors;
var() automated moCheckBox ch_DecoLayers;
var() automated moCheckBox ch_Trilinear;
var() automated moCheckBox ch_FullScreen;
var() automated moCheckBox ch_Weather;
var() automated moCheckBox cbDOF;
var() automated moCheckBox cbSSAO;
var() automated moCheckBox cbHDR;
var() automated moCheckBox cbShader;
var() automated moCheckBox cbGlobalAntiportal;
var() automated moCheckBox cbLinkAntiportal;
var() automated moCheckBox cbHOQ;
var() automated moSlider sl_Gamma;
var() automated moSlider sl_Brightness;
var() automated moSlider sl_Contrast;
var() automated moSlider sl_DistanceLOD;
var() automated moSlider sl_SSAOFactor;
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
var() private editconst noexport transient bool bDemo;
var() noexport bool bIgnoreResNotice;
var() noexport bool bInvalidRes;
var() noexport bool bIgnoreChange;
var() localized string RelaunchQuestion;
var() localized string InvalidSelectionText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    bDemo = PlayerOwner().Level.IsDemoBuild();
    InitializeCombos();
    SetupPositions();
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    CheckSupportedResolutions();
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x1B
    if(bShow)
    {
        CheckSliders();
    }
    //return;    
}

function InitializeCombos()
{
    local int i;
    local array<GUIListElem> Options;

    i = 0;
    J0x07:

    // End:0xD0 [Loop If]
    if(i < Components.Length)
    {
        // End:0xC6
        if(moComboBox(Components[i]) != none)
        {
            GetComboOptions(moComboBox(Components[i]), Options);
            moComboBox(Components[i]).MyComboBox.List.Elements = Options;
            moComboBox(Components[i]).MyComboBox.List.ItemCount = Options.Length;
            moComboBox(Components[i]).ReadOnly(true);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x10F
    if(!bDemo)
    {
        co_Texture.MyComboBox.MaxVisibleItems = 9;
        co_Char.MyComboBox.MaxVisibleItems = 9;
    }
    //return;    
}

function CheckSliders()
{
    // End:0x3A
    if(bFullScreen || !PlatformIsWindows())
    {
        EnableComponent(sl_Gamma);
        EnableComponent(sl_Contrast);
        EnableComponent(sl_Brightness);        
    }
    else
    {
        DisableComponent(sl_Gamma);
        DisableComponent(sl_Contrast);
        DisableComponent(sl_Brightness);
    }
    //return;    
}

function SetupPositions()
{
    sb_Section1.ManageComponent(co_RenderDevice);
    sb_Section1.ManageComponent(co_Resolution);
    sb_Section1.ManageComponent(co_ColorDepth);
    sb_Section1.ManageComponent(ch_FullScreen);
    sb_Section1.ManageComponent(sl_Gamma);
    sb_Section1.ManageComponent(sl_Brightness);
    sb_Section1.ManageComponent(sl_Contrast);
    sb_Section2.ManageComponent(co_Texture);
    sb_Section2.ManageComponent(co_Char);
    sb_Section2.ManageComponent(cbShader);
    sb_Section2.ManageComponent(cbHDR);
    sb_Section2.ManageComponent(cbDOF);
    sb_Section2.ManageComponent(cbSSAO);
    sb_Section2.ManageComponent(sl_SSAOFactor);
    sb_Section2.ManageComponent(cbGlobalAntiportal);
    sb_Section2.ManageComponent(cbLinkAntiportal);
    sb_Section2.ManageComponent(cbHOQ);
    sb_Section2.ManageComponent(co_World);
    sb_Section2.ManageComponent(co_Physics);
    sb_Section2.ManageComponent(co_Decal);
    sb_Section2.ManageComponent(co_Shadows);
    sb_Section2.ManageComponent(co_MeshLOD);
    sb_Section2.ManageComponent(ch_Decals);
    sb_Section2.ManageComponent(ch_DynLight);
    sb_Section2.ManageComponent(ch_Coronas);
    sb_Section2.ManageComponent(ch_Textures);
    sb_Section2.ManageComponent(ch_Projectors);
    sb_Section2.ManageComponent(ch_DecoLayers);
    sb_Section2.ManageComponent(ch_Trilinear);
    sb_Section2.ManageComponent(ch_Weather);
    sb_Section2.ManageComponent(sl_DistanceLOD);
    sb_Section3.ManageComponent(i_GammaBar);
    //return;    
}

function CheckSupportedResolutions()
{
    local int i, Index, BitDepth;
    local string CurrentSelection, str, W, H, WH;

    local bool bStandard, bSupported, bOldIgnoreChange;
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentSelection = co_Resolution.GetText();
    bOldIgnoreChange = bIgnoreChange;
    bIgnoreChange = true;
    // End:0x70
    if((co_ColorDepth != none) && co_ColorDepth.ItemCount() > 0)
    {
        BitDepth = int(Left(co_ColorDepth.GetText(), 2));
    }
    i = 0;
    J0x77:

    // End:0x202 [Loop If]
    if(i < 17)
    {
        W = string(DisplayModes[i].width);
        H = string(DisplayModes[i].Height);
        WH = (W $ "x") $ H;
        str = (((("SUPPORTEDRESOLUTION WIDTH=" $ W) @ "HEIGHT=") $ H) @ "BITDEPTH=") $ string(BitDepth);
        // End:0x132
        if(CurrentSelection ~= WH)
        {
            bStandard = true;
        }
        Index = co_Resolution.FindIndex(WH);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x1B7
        if(!bSupported && co_Resolution.MyComboBox.List.IsValidIndex(Index))
        {
            co_Resolution.RemoveItem(Index, 1);
            // [Explicit Continue]
            goto J0x1F8;
        }
        // End:0x1F8
        if(bSupported && !co_Resolution.MyComboBox.List.IsValidIndex(Index))
        {
            AddNewResolution(WH);
        }
        J0x1F8:

        i++;
        // [Loop Continue]
        goto J0x77;
    }
    // End:0x2BC
    if(!bStandard)
    {
        Divide(CurrentSelection, "x", W, H);
        str = (((("SUPPORTEDRESOLUTION WIDTH=" $ W) @ "HEIGHT=") $ H) @ "BITDEPTH=") $ string(BitDepth);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x2BC
        if(!bSupported)
        {
            Index = co_Resolution.FindIndex(CurrentSelection);
            bInvalidRes = true;
        }
    }
    CheckSliders();
    co_Resolution.SetText(CurrentSelection);
    bIgnoreChange = bOldIgnoreChange;
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
        InternalOnLoadINI(co_ColorDepth, "");
    }
    //return;    
}

function Refresh()
{
    InternalOnLoadINI(co_Resolution, "");
    InternalOnLoadINI(co_ColorDepth, "");
    InternalOnLoadINI(ch_FullScreen, "");
    CheckSupportedResolutions();
    //return;    
}

function int AddNewResolution(string NewDisplayMode)
{
    local int i, ItemW, ItemH, InWidth, InHeight;

    local bool bTemp;
    local string str, StrW, StrH;

    bTemp = bIgnoreChange;
    bIgnoreChange = true;
    i = co_Resolution.FindIndex(NewDisplayMode);
    // End:0x4D
    if(i >= 0)
    {
        bIgnoreChange = bTemp;
        return i;
    }
    Divide(NewDisplayMode, "x", StrW, StrH);
    InWidth = int(StrW);
    InHeight = int(StrH);
    i = 0;
    J0x82:

    // End:0x123 [Loop If]
    if(i < co_Resolution.ItemCount())
    {
        str = co_Resolution.GetItem(i);
        Divide(str, "x", StrW, StrH);
        ItemW = int(StrW);
        ItemH = int(StrH);
        // End:0x107
        if(ItemW == InWidth)
        {
            // End:0x104
            if(ItemH > InHeight)
            {
                // [Explicit Break]
                goto J0x123;
            }
            // [Explicit Continue]
            goto J0x119;
        }
        // End:0x119
        if(ItemW > InWidth)
        {
            // [Explicit Break]
            goto J0x123;
        }
        J0x119:

        i++;
        // [Loop Continue]
        goto J0x82;
    }
    J0x123:

    // End:0x153
    if(i == co_Resolution.ItemCount())
    {
        co_Resolution.AddItem(NewDisplayMode);        
    }
    else
    {
        co_Resolution.MyComboBox.List.Insert(i, NewDisplayMode);
    }
    bIgnoreChange = bTemp;
    return i;
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
        // End:0xA9
        case co_Texture:
            S = GetGUIString(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailWorld"));
            iTexture = co_Texture.FindIndex(S);
            iTextureD = iTexture;
            co_Texture.SilentSetIndex(iTexture);
            // End:0x159E
            break;
        // End:0x147
        case co_Char:
            S = GetGUIString(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailPlayerSkin"));
            iChar = co_Char.FindIndex(S);
            iCharD = iChar;
            co_Char.SilentSetIndex(iChar);
            // End:0x159E
            break;
        // End:0x26F
        case co_World:
            A = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice HighDetailActors"));
            B = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice SuperHighDetailActors"));
            // End:0x202
            if(B)
            {
                iWorld = 5;                
            }
            else
            {
                // End:0x216
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
            i = co_World.FindIndex(DetailLevels[iWorld]);
            // End:0x26C
            if(i != -1)
            {
                co_World.SilentSetIndex(i);
            }
            // End:0x159E
            break;
        // End:0x31B
        case co_MeshLOD:
            switch(Class'Engine.LevelInfo'.default.MeshLODDetailLevel)
            {
                // End:0x297
                case 0:
                    iMeshLOD = 3;
                    // End:0x2CA
                    break;
                // End:0x2A7
                case 1:
                    iMeshLOD = 4;
                    // End:0x2CA
                    break;
                // End:0x2B7
                case 2:
                    iMeshLOD = 5;
                    // End:0x2CA
                    break;
                // End:0x2C7
                case 3:
                    iMeshLOD = 8;
                    // End:0x2CA
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            iMeshLODD = iMeshLOD;
            i = co_MeshLOD.FindIndex(DetailLevels[iMeshLOD]);
            // End:0x318
            if(i != -1)
            {
                co_MeshLOD.SilentSetIndex(i);
            }
            // End:0x159E
            break;
        // End:0x441
        case co_Physics:
            // End:0x387
            if(int(Class'Engine.LevelInfo'.default.PhysicsDetailLevel) == int(0))
            {
                iPhys = 3;
                i = co_Physics.FindIndex(DetailLevels[3]);
                // End:0x384
                if(i != -1)
                {
                    co_Physics.SilentSetIndex(i);
                }                
            }
            else
            {
                // End:0x3EB
                if(int(Class'Engine.LevelInfo'.default.PhysicsDetailLevel) == int(1))
                {
                    iPhys = 4;
                    i = co_Physics.FindIndex(DetailLevels[4]);
                    // End:0x3E8
                    if(i != -1)
                    {
                        co_Physics.SilentSetIndex(i);
                    }                    
                }
                else
                {
                    iPhys = 5;
                    i = co_Physics.FindIndex(DetailLevels[5]);
                    // End:0x433
                    if(i != -1)
                    {
                        co_Physics.SilentSetIndex(i);
                    }
                }
            }
            iPhysD = iPhys;
            // End:0x159E
            break;
        // End:0x481
        case co_Decal:
            iDecal = int(Class'Engine.LevelInfo'.default.DecalStayScale);
            iDecalD = iDecal;
            co_Decal.SilentSetIndex(iDecal);
            // End:0x159E
            break;
        // End:0x523
        case co_Resolution:
            // End:0x4B5
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
            // End:0x520
            if((i >= 0) && i < co_Resolution.ItemCount())
            {
                co_Resolution.SilentSetIndex(i);
            }
            // End:0x159E
            break;
        // End:0x5E4
        case co_ColorDepth:
            // End:0x576
            if(bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit")))
            {
                iColDepth = 0;                
            }
            else
            {
                iColDepth = 1;
            }
            iColDepthD = iColDepth;
            co_ColorDepth.SilentSetIndex(iColDepth);
            // End:0x5D2
            if(!bool(PC.ConsoleCommand("ISFULLSCREEN")))
            {
                co_ColorDepth.DisableMe();                
            }
            else
            {
                co_ColorDepth.EnableMe();
            }
            // End:0x159E
            break;
        // End:0x637
        case co_RenderDevice:
            sRenDev = GetNativeClassName("Engine.Engine.RenderDevice");
            sRenDevD = sRenDev;
            co_RenderDevice.SetComponentValue(sRenDev, true);
            // End:0x159E
            break;
        // End:0x806
        case co_Shadows:
            TempStr = GetNativeClassName("Engine.Engine.RenderDevice");
            // End:0x78B
            if(((TempStr == "D3DDrv.D3DRenderDevice") || TempStr == "D3D9Drv.D3D9RenderDevice") || TempStr == "OpenGLDrv.OpenGLRenderDevice")
            {
                A = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bPlayerShadows"));
                B = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bBlobShadow"));
                // End:0x76D
                if(B)
                {
                    iShadow = 1;                    
                }
                else
                {
                    // End:0x781
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
                // End:0x7DD
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
            co_Shadows.SilentSetIndex(iShadow);
            // End:0x159E
            break;
        // End:0x92E
        case ch_DynLight:
            // End:0x8EE
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDynLight = !bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager NoDynamicLights"));
                bDynLightD = bDynLight;
                ch_DynLight.SetComponentValue(string(bDynLight), true);                
            }
            else
            {
                bDynLight = false;
                bDynLightD = bDynLight;
                ch_DynLight.SetComponentValue(string(bDynLight), true);
                ch_DynLight.SetEnabled(false);
            }
            // End:0x159E
            break;
        // End:0x989
        case ch_FullScreen:
            bFullScreen = bool(PC.ConsoleCommand("ISFULLSCREEN"));
            bFullScreenD = bFullScreen;
            moCheckBox(Sender).SetComponentValue(string(bFullScreen), true);
            // End:0x159E
            break;
        // End:0xA02
        case ch_Trilinear:
            bTrilin = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice UseTrilinear"));
            bTrilinD = bTrilin;
            ch_Trilinear.SetComponentValue(string(bTrilin), true);
            // End:0x159E
            break;
        // End:0xA7C
        case ch_Projectors:
            bProj = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Projectors"));
            bProjD = bProj;
            ch_Projectors.SetComponentValue(string(bProj), true);
            // End:0x159E
            break;
        // End:0xAF6
        case ch_DecoLayers:
            bFol = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DecoLayers"));
            bFolD = bFol;
            ch_DecoLayers.SetComponentValue(string(bFol), true);
            // End:0x159E
            break;
        // End:0xB71
        case ch_Textures:
            bTexture = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice DetailTextures"));
            bTextureD = bTexture;
            ch_Textures.SetComponentValue(string(bTexture), true);
            // End:0x159E
            break;
        // End:0xBE8
        case ch_Coronas:
            bCorona = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Coronas"));
            bCoronaD = bCorona;
            ch_Coronas.SetComponentValue(string(bCorona), true);
            // End:0x159E
            break;
        // End:0xC64
        case ch_Decals:
            bDecal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Decals"));
            bDecalD = bDecal;
            ch_Decals.SetComponentValue(string(bDecal), true);
            UpdateDecalStay();
            // End:0x159E
            break;
        // End:0xD18
        case cbShader:
            // End:0xCD8
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")))
            {
                bShader = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader"));                
            }
            else
            {
                bShader = false;
                cbShader.SetEnabled(false);
            }
            bShaderD = bShader;
            cbShader.SetComponentValue(string(bShader), true);
            // End:0x159E
            break;
        // End:0xE31
        case cbHDR:
            // End:0xDF1
            if((bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader"))) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                bHDR = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR"));                
            }
            else
            {
                bHDR = false;
                cbHDR.SetEnabled(false);
            }
            bHDRD = bHDR;
            cbHDR.SetComponentValue(string(bHDR), true);
            // End:0x159E
            break;
        // End:0xFB0
        case cbSSAO:
            // End:0xF70
            if((((bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR"))) && bool(PC.ConsoleCommand("SUPPORTEDPS30"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bSSAO = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager SSAO"));                
            }
            else
            {
                bSSAO = false;
                cbSSAO.SetEnabled(false);
            }
            bSSAOD = bSSAO;
            cbSSAO.SetComponentValue(string(bSSAO), true);
            // End:0x159E
            break;
        // End:0x10C9
        case cbDOF:
            // End:0x1089
            if((bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDPS30"))) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDOF = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DOF"));                
            }
            else
            {
                bDOF = false;
                cbDOF.SetEnabled(false);
            }
            bDOFD = bDOF;
            cbDOF.SetComponentValue(string(bDOF), true);
            // End:0x159E
            break;
        // End:0x1199
        case sl_SSAOFactor:
            fSSAOFactor = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager SSAOFactor"));
            fSSAOFactorD = fSSAOFactor;
            sl_SSAOFactor.SetComponentValue(string(fSSAOFactor), true);
            // End:0x1196
            if(!bool(PC.ConsoleCommand("SUPPORTEDMRT")) || !bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                sl_SSAOFactor.SetEnabled(false);
            }
            // End:0x159E
            break;
        // End:0x1219
        case cbGlobalAntiportal:
            bGlobalAntiportal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager GlobalAntiportal"));
            bGlobalAntiportalD = bGlobalAntiportal;
            cbGlobalAntiportal.SetComponentValue(string(bGlobalAntiportal), true);
            // End:0x159E
            break;
        // End:0x1297
        case cbLinkAntiportal:
            bLinkAntiportal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager LinkAntiportal"));
            bLinkAntiportalD = bLinkAntiportal;
            cbLinkAntiportal.SetComponentValue(string(bLinkAntiportal), true);
            // End:0x159E
            break;
        // End:0x130A
        case cbHOQ:
            bHOQ = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HOQ"));
            bHOQD = bHOQ;
            cbHOQ.SetComponentValue(string(bHOQ), true);
            // End:0x159E
            break;
        // End:0x1370
        case sl_Gamma:
            fGamma = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Gamma"));
            sl_Gamma.SetComponentValue(string(fGamma), true);
            // End:0x159E
            break;
        // End:0x13DB
        case sl_Brightness:
            fBright = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Brightness"));
            sl_Brightness.SetComponentValue(string(fBright), true);
            // End:0x159E
            break;
        // End:0x1444
        case sl_Contrast:
            fContrast = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Contrast"));
            sl_Contrast.SetComponentValue(string(fContrast), true);
            // End:0x159E
            break;
        // End:0x14C2
        case ch_Weather:
            bWeather = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager WeatherEffects"));
            bWeatherD = bWeather;
            ch_Weather.SetComponentValue(string(bWeather), true);
            // End:0x159E
            break;
        // End:0x153D
        case sl_DistanceLOD:
            fDistance = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DrawDistanceLOD"));
            fDistanceD = fDistance;
            sl_DistanceLOD.SetComponentValue(string(fDistance), true);
            // End:0x159E
            break;
        // End:0xFFFF
        default:
            Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
            break;
    }
    //return;    
}

function ResetClicked()
{
    local int i;

    super.ResetClicked();
    Class'Engine.LevelInfo'.static.ResetConfig("MeshLODDetailLevel");
    Class'Engine.LevelInfo'.static.ResetConfig("PhysicsDetailLevel");
    Class'Engine.LevelInfo'.static.ResetConfig("DecalStayScale");
    Class'UnrealGame.UnrealPawn'.static.ResetConfig("bPlayerShadows");
    Class'UnrealGame.UnrealPawn'.static.ResetConfig("bBlobShadow");
    ResetViewport();
    ResetRenderDevice();
    i = 0;
    J0xB9:

    // End:0xE9 [Loop If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0xB9;
    }
    //return;    
}

function ResetViewport()
{
    local Class<Client> ViewportClass;

    ViewportClass = Class<Client>(DynamicLoadObject(GetNativeClassName("Engine.Engine.ViewportManager"), Class'Core.Class'));
    ViewportClass.static.ResetConfig("WindowedViewportX");
    ViewportClass.static.ResetConfig("WindowedViewportY");
    ViewportClass.static.ResetConfig("FullscreenViewportX");
    ViewportClass.static.ResetConfig("FullscreenViewportY");
    ViewportClass.static.ResetConfig("Brightness");
    ViewportClass.static.ResetConfig("Contrast");
    ViewportClass.static.ResetConfig("Gamma");
    ViewportClass.static.ResetConfig("StartupFullScreen");
    ViewportClass.static.ResetConfig("NoLighting");
    ViewportClass.static.ResetConfig("MinDesiredFrameRate");
    ViewportClass.static.ResetConfig("Decals");
    ViewportClass.static.ResetConfig("Coronas");
    ViewportClass.static.ResetConfig("DecoLayers");
    ViewportClass.static.ResetConfig("Projectors");
    ViewportClass.static.ResetConfig("NoDynamicLights");
    ViewportClass.static.ResetConfig("ReportDynamicUploads");
    ViewportClass.static.ResetConfig("TextureDetailInterface");
    ViewportClass.static.ResetConfig("TextureDetailTerrain");
    ViewportClass.static.ResetConfig("TextureDetailWeaponSkin");
    ViewportClass.static.ResetConfig("TextureDetailPlayerSkin");
    ViewportClass.static.ResetConfig("TextureDetailWorld");
    ViewportClass.static.ResetConfig("TextureDetailRendermap");
    ViewportClass.static.ResetConfig("TextureDetailLightmap");
    ViewportClass.static.ResetConfig("NoFractalAnim");
    ViewportClass.static.ResetConfig("WeatherEffects");
    ViewportClass.static.ResetConfig("DrawDistanceLOD");
    //return;    
}

function ResetRenderDevice()
{
    local Class<RenderDevice> RenderClass;

    // End:0x25
    if(!sRenDev ~= sRenDevD)
    {
        Controller.SetRenderDevice(sRenDevD);
    }
    RenderClass = Class<RenderDevice>(DynamicLoadObject(sRenDevD, Class'Core.Class'));
    RenderClass.static.ResetConfig("DetailTextures");
    RenderClass.static.ResetConfig("HighDetailActors");
    RenderClass.static.ResetConfig("SuperHighDetailActors");
    RenderClass.static.ResetConfig("UsePrecaching");
    RenderClass.static.ResetConfig("UseTrilinear");
    RenderClass.static.ResetConfig("UseTripleBuffering");
    RenderClass.static.ResetConfig("UseHardwareTL");
    RenderClass.static.ResetConfig("UseHardwareVS");
    RenderClass.static.ResetConfig("UseCubemaps");
    RenderClass.static.ResetConfig("DesiredRefreshRate");
    RenderClass.static.ResetConfig("UseCompressedLightmaps");
    RenderClass.static.ResetConfig("UseStencil");
    RenderClass.static.ResetConfig("Use16bit");
    RenderClass.static.ResetConfig("Use16bitTextures");
    RenderClass.static.ResetConfig("MaxPixelShaderVersion");
    RenderClass.static.ResetConfig("UseVSync");
    RenderClass.static.ResetConfig("LevelOfAnisotropy");
    RenderClass.static.ResetConfig("DetailTexMipBias");
    RenderClass.static.ResetConfig("DefaultTexMipBias");
    RenderClass.static.ResetConfig("UseNPatches");
    RenderClass.static.ResetConfig("TesselationFactor");
    RenderClass.static.ResetConfig("CheckForOverflow");
    RenderClass.static.ResetConfig("AvoidHitches");
    RenderClass.static.ResetConfig("OverrideDesktopRefreshRate");
    //return;    
}

function SaveSettings()
{
    local string t, V, str;
    local PlayerController PC;
    local bool bUnreal, bLevel;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x40
    if(sRenDev != sRenDevD)
    {
        // End:0x40
        if(Controller.SetRenderDevice(sRenDev))
        {
            sRenDevD = sRenDev;
        }
    }
    // End:0x16B
    if(iTexture != iTextureD)
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        str = DetailLevels[iTexture];
        V = GetConfigString(str);
        PC.ConsoleCommand((t $ "Terrain") @ V);
        PC.ConsoleCommand((t $ "World") @ V);
        PC.ConsoleCommand((t $ "Rendermap") @ V);
        PC.ConsoleCommand((t $ "Lightmap") @ V);
        PC.ConsoleCommand("flush");
        iTextureD = iTexture;
    }
    // End:0x24D
    if(iChar != iCharD)
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        str = DetailLevels[iChar];
        V = GetConfigString(str);
        PC.ConsoleCommand((t $ "WeaponSkin") @ V);
        PC.ConsoleCommand((t $ "PlayerSkin") @ V);
        PC.ConsoleCommand("flush");
        iCharD = iChar;
    }
    // End:0x4C7
    if(iWorld != iWorldD)
    {
        str = DetailLevels[iWorld];
        V = GetConfigString(str);
        switch(iWorld)
        {
            // End:0x342
            case 3:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors False");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                PC.Level.DetailChange(0);
                // End:0x4BC
                break;
            // End:0x3FE
            case 4:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                PC.Level.DetailChange(1);
                // End:0x4BC
                break;
            // End:0x4B9
            case 5:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
                PC.Level.DetailChange(2);
                // End:0x4BC
                break;
            // End:0xFFFF
            default:
                break;
        }
        iWorldD = iWorld;
    }
    // End:0x5BF
    if(iMeshLOD != iMeshLODD)
    {
        switch(iMeshLOD)
        {
            // End:0x510
            case 3:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 0;
                PC.Level.MeshLODDetailLevel = 0;
                // End:0x5AC
                break;
            // End:0x543
            case 4:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 1;
                PC.Level.MeshLODDetailLevel = 1;
                // End:0x5AC
                break;
            // End:0x576
            case 5:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 2;
                PC.Level.MeshLODDetailLevel = 2;
                // End:0x5AC
                break;
            // End:0x5A9
            case 8:
                Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 3;
                PC.Level.MeshLODDetailLevel = 3;
                // End:0x5AC
                break;
            // End:0xFFFF
            default:
                break;
        }
        iMeshLODD = iMeshLOD;
        bLevel = true;
    }
    // End:0x684
    if(iPhys != iPhysD)
    {
        switch(iPhys)
        {
            // End:0x608
            case 3:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 0;
                PC.Level.PhysicsDetailLevel = 0;
                // End:0x671
                break;
            // End:0x63B
            case 4:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 1;
                PC.Level.PhysicsDetailLevel = 1;
                // End:0x671
                break;
            // End:0x66E
            case 5:
                Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 2;
                PC.Level.PhysicsDetailLevel = 2;
                // End:0x671
                break;
            // End:0xFFFF
            default:
                break;
        }
        iPhysD = iPhys;
        bLevel = true;
    }
    // End:0x751
    if(iShadow != iShadowD)
    {
        // End:0x70E
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
    // End:0x794
    if(Class'Engine.Vehicle'.default.bVehicleShadows != (iShadow > 0))
    {
        Class'Engine.Vehicle'.default.bVehicleShadows = iShadow > 0;
        Class'Engine.Vehicle'.static.StaticSaveConfig();
    }
    // End:0x805
    if(bDynLight != bDynLightD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager NoDynamicLights" @ string(!bDynLight));
        bDynLightD = bDynLight;
    }
    // End:0x870
    if(iDecal != iDecalD)
    {
        // End:0x847
        if(PC.Level != none)
        {
            PC.Level.DecalStayScale = float(iDecal);
        }
        Class'Engine.LevelInfo'.default.DecalStayScale = float(iDecal);
        iDecalD = iDecal;
        bLevel = true;
    }
    // End:0x8D9
    if(bTrilin != bTrilinD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice UseTrilinear" @ string(bTrilin));
        bTrilinD = bTrilin;
    }
    // End:0x943
    if(bFol != bFolD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DecoLayers" @ string(bFol));
        bFolD = bFol;
    }
    // End:0x9AD
    if(bProj != bProjD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Projectors" @ string(bProj));
        bProjD = bProj;
    }
    // End:0xA18
    if(bTexture != bTextureD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice DetailTextures" @ string(bTexture));
        bTextureD = bTexture;
    }
    // End:0xA7F
    if(bCorona != bCoronaD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Coronas" @ string(bCorona));
        bCoronaD = bCorona;
    }
    // End:0xAE5
    if(bDecal != bDecalD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Decals" @ string(bDecal));
        bDecalD = bDecal;
    }
    // End:0xB53
    if(bWeather != bWeatherD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager WeatherEffects" @ string(bWeather));
        bWeatherD = bWeather;
    }
    // End:0xBDA
    if(fDistance != fDistanceD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DrawDistanceLOD" @ string(fDistance));
        PC.Level.UpdateDistanceFogLOD(fDistance);
        fDistanceD = fDistance;
    }
    // End:0xC40
    if(bShader != bShaderD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Shader" @ string(bShader));
        bShaderD = bShader;
    }
    // End:0xCA3
    if(bHDR != bHDRD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HDR" @ string(bHDR));
        bHDRD = bHDR;
    }
    // End:0xD06
    if(bDOF != bDOFD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DOF" @ string(bDOF));
        bDOFD = bDOF;
    }
    // End:0xD6A
    if(bSSAO != bSSAOD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SSAO" @ string(bSSAO));
        bSSAOD = bSSAO;
    }
    // End:0xDCF
    if(fSSAOFactor != fSSAOFactorD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SSAOFactor" @ string(fSSAOFactor));
        fSSAOFactorD = fSSAOFactor;
    }
    // End:0xE3F
    if(bGlobalAntiportal != bGlobalAntiportalD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager GlobalAntiportal" @ string(bGlobalAntiportal));
        bGlobalAntiportalD = bGlobalAntiportal;
    }
    // End:0xEAD
    if(bLinkAntiportal != bLinkAntiportalD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager LinkAntiportal" @ string(bLinkAntiportal));
        bLinkAntiportalD = bLinkAntiportal;
    }
    // End:0xF10
    if(bHOQ != bHOQD)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HOQ" @ string(bHOQ));
        bHOQD = bHOQ;
    }
    // End:0xF74
    if(bUnreal)
    {
        // End:0xF65
        if((PC.Pawn != none) && UnrealPawn(PC.Pawn) != none)
        {
            UnrealPawn(PC.Pawn).SaveConfig();            
        }
        else
        {
            Class'UnrealGame.UnrealPawn'.static.StaticSaveConfig();
        }
    }
    // End:0xFB8
    if(bLevel)
    {
        // End:0xFA9
        if(PC.Level != none)
        {
            PC.Level.SaveConfig();            
        }
        else
        {
            Class'Engine.LevelInfo'.static.StaticSaveConfig();
        }
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local string str;
    local bool bGoingUp;
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    super.InternalOnChange(Sender);
    // End:0x1F
    if(bIgnoreChange)
    {
        return;
    }
    switch(Sender)
    {
        // End:0xE4
        case co_Resolution:
            sRes = co_Resolution.GetText();
            // End:0x58
            if(bFullScreen)
            {
                str = "f";                
            }
            else
            {
                str = "w";
            }
            // End:0xE1
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(((sRes $ "x") $ Left(BitDepthText[iColDepth], 2)) $ str);
            }
            // End:0xBC6
            break;
        // End:0x1A3
        case ch_FullScreen:
            bFullScreen = ch_FullScreen.IsChecked();
            // End:0x117
            if(bFullScreen)
            {
                str = "f";                
            }
            else
            {
                str = "w";
            }
            // End:0x1A0
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(((sRes $ "x") $ Left(BitDepthText[iColDepth], 2)) $ str);
            }
            // End:0xBC6
            break;
        // End:0x23C
        case co_RenderDevice:
            sRenDev = co_RenderDevice.GetExtra();
            // End:0x239
            if((sRenDev != sRenDevD) && Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                GUIQuestionPage(Controller.ActivePage).SetupQuestion(RelaunchQuestion, 50, 2);
                GUIQuestionPage(Controller.ActivePage).__NewOnButtonClick__Delegate = RenderDeviceClick;
            }
            // End:0xBC6
            break;
        // End:0x2FA
        case co_ColorDepth:
            iColDepth = co_ColorDepth.GetIndex();
            // End:0x26E
            if(bFullScreen)
            {
                str = "f";                
            }
            else
            {
                str = "w";
            }
            // End:0x2F7
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(((sRes $ "x") $ Left(BitDepthText[iColDepth], 2)) $ str);
            }
            // End:0xBC6
            break;
        // End:0x349
        case co_Texture:
            i = co_Texture.GetIndex();
            bGoingUp = (i > iTexture) && i != iTextureD;
            iTexture = i;
            // End:0xBC6
            break;
        // End:0x398
        case co_Char:
            i = co_Char.GetIndex();
            bGoingUp = (i > iChar) && i != iCharD;
            iChar = i;
            // End:0xBC6
            break;
        // End:0x3F8
        case co_World:
            str = co_World.GetText();
            i = GetDetailIndex(str);
            bGoingUp = (i > iWorld) && i != iWorldD;
            iWorld = i;
            // End:0xBC6
            break;
        // End:0x458
        case co_MeshLOD:
            str = co_MeshLOD.GetText();
            i = GetDetailIndex(str);
            bGoingUp = (i > iMeshLOD) && i != iMeshLODD;
            iMeshLOD = i;
            // End:0xBC6
            break;
        // End:0x4B8
        case co_Physics:
            str = co_Physics.GetText();
            i = GetDetailIndex(str);
            bGoingUp = (i > iPhys) && i != iPhysD;
            iPhys = i;
            // End:0xBC6
            break;
        // End:0x4D8
        case co_Decal:
            iDecal = co_Decal.GetIndex();
            // End:0xBC6
            break;
        // End:0x527
        case co_Shadows:
            i = co_Shadows.GetIndex();
            bGoingUp = (i > iShadow) && i != iShadowD;
            iShadow = i;
            // End:0xBC6
            break;
        // End:0x568
        case ch_DynLight:
            bDynLight = ch_DynLight.IsChecked();
            bGoingUp = bDynLight && bDynLight != bDynLightD;
            // End:0xBC6
            break;
        // End:0x5A9
        case ch_Trilinear:
            bTrilin = ch_Trilinear.IsChecked();
            bGoingUp = bTrilin && bTrilin != bTrilinD;
            // End:0xBC6
            break;
        // End:0x5EA
        case ch_Projectors:
            bProj = ch_Projectors.IsChecked();
            bGoingUp = bProj && bProjD != bProj;
            // End:0xBC6
            break;
        // End:0x62B
        case ch_DecoLayers:
            bFol = ch_DecoLayers.IsChecked();
            bGoingUp = bFol && bFol != bFolD;
            // End:0xBC6
            break;
        // End:0x66C
        case ch_Textures:
            bTexture = ch_Textures.IsChecked();
            bGoingUp = bTexture && bTexture != bTextureD;
            // End:0xBC6
            break;
        // End:0x6AD
        case ch_Coronas:
            bCorona = ch_Coronas.IsChecked();
            bGoingUp = bCorona && bCorona != bCoronaD;
            // End:0xBC6
            break;
        // End:0x6F4
        case ch_Decals:
            bDecal = ch_Decals.IsChecked();
            bGoingUp = bDecal && bDecal != bDecalD;
            UpdateDecalStay();
            // End:0xBC6
            break;
        // End:0x732
        case sl_Gamma:
            fGamma = sl_Gamma.GetValue();
            PlayerOwner().ConsoleCommand("GAMMA" @ string(fGamma));
            // End:0xBC6
            break;
        // End:0x775
        case sl_Brightness:
            fBright = sl_Brightness.GetValue();
            PlayerOwner().ConsoleCommand("BRIGHTNESS" @ string(fBright));
            // End:0xBC6
            break;
        // End:0x7B6
        case sl_Contrast:
            fContrast = sl_Contrast.GetValue();
            PlayerOwner().ConsoleCommand("CONTRAST" @ string(fContrast));
            // End:0xBC6
            break;
        // End:0x7D6
        case sl_DistanceLOD:
            fDistance = sl_DistanceLOD.GetValue();
            // End:0xBC6
            break;
        // End:0x817
        case ch_Weather:
            bWeather = ch_Weather.IsChecked();
            bGoingUp = bWeather && bWeather != bWeatherD;
            // End:0xBC6
            break;
        // End:0x9DF
        case cbShader:
            bShader = cbShader.IsChecked();
            bGoingUp = bShader && bShader != bShaderD;
            // End:0x88F
            if(bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                cbHDR.SetEnabled(bShader);                
            }
            else
            {
                cbHDR.SetEnabled(false);
            }
            // End:0x8D9
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")))
            {
                cbDOF.SetEnabled(bShader);                
            }
            else
            {
                cbDOF.SetEnabled(false);
            }
            // End:0x95C
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                cbSSAO.SetEnabled(bShader);
                sl_SSAOFactor.SetEnabled(bShader);                
            }
            else
            {
                cbSSAO.SetEnabled(false);
                sl_SSAOFactor.SetEnabled(false);
            }
            ch_DynLight.SetEnabled(bShader);
            // End:0x9DC
            if(!bShader)
            {
                cbHDR.Checked(false);
                cbDOF.Checked(false);
                cbSSAO.Checked(false);
                ch_DynLight.Checked(false);
            }
            // End:0xBC6
            break;
        // End:0xA5E
        case cbHDR:
            bHDR = cbHDR.IsChecked();
            // End:0xA2B
            if(!bHDR)
            {
                cbSSAO.SetEnabled(false);
                cbSSAO.Checked(false);                
            }
            else
            {
                cbSSAO.SetEnabled(true);
            }
            bGoingUp = bHDR && bHDR != bHDRD;
            // End:0xBC6
            break;
        // End:0xA9F
        case cbDOF:
            bDOF = cbDOF.IsChecked();
            bGoingUp = bDOF && bDOF != bDOFD;
            // End:0xBC6
            break;
        // End:0xAE0
        case cbSSAO:
            bSSAO = cbSSAO.IsChecked();
            bGoingUp = bSSAO && bSSAO != bSSAOD;
            // End:0xBC6
            break;
        // End:0xB00
        case sl_SSAOFactor:
            fSSAOFactor = sl_SSAOFactor.GetValue();
            // End:0xBC6
            break;
        // End:0xB41
        case cbGlobalAntiportal:
            bGlobalAntiportal = cbGlobalAntiportal.IsChecked();
            bGoingUp = bGlobalAntiportal && bGlobalAntiportal != bGlobalAntiportalD;
            // End:0xBC6
            break;
        // End:0xB82
        case cbLinkAntiportal:
            bLinkAntiportal = cbLinkAntiportal.IsChecked();
            bGoingUp = bLinkAntiportal && bLinkAntiportal != bLinkAntiportalD;
            // End:0xBC6
            break;
        // End:0xBC3
        case cbHOQ:
            bHOQ = cbHOQ.IsChecked();
            bGoingUp = bHOQ && bHOQ != bHOQD;
            // End:0xBC6
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xBD5
    if(bGoingUp)
    {
        ShowPerformanceWarning();
    }
    //return;    
}

function bool RenderDeviceClick(byte btn)
{
    switch(btn)
    {
        // End:0x45
        case 16:
            SaveSettings();
            Console(Controller.Master.Console).DelayedConsoleCommand("relaunch");
            // End:0x85
            break;
        // End:0x82
        case 2:
            sRenDev = sRenDevD;
            co_RenderDevice.Find(sRenDev);
            co_RenderDevice.SetComponentValue(sRenDev, true);
            // End:0x85
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function VideoChangeClose(optional bool bCancelled)
{
    local bool bTemp;
    local string NewX, NewY;

    Divide(sRes, "x", NewX, NewY);
    // End:0x72
    if(bCancelled)
    {
        bTemp = bIgnoreChange;
        bIgnoreChange = true;
        co_Resolution.LoadINI();
        co_ColorDepth.LoadINI();
        ch_FullScreen.LoadINI();
        bIgnoreChange = bTemp;        
    }
    else
    {
        // End:0xB9
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
        // End:0x14F
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

function int GetDetailIndex(string DetailString)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < 9)
    {
        // End:0x2E
        if(DetailString == DetailLevels[i])
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

final function string GetGUIString(string ConfigString)
{
    switch(ConfigString)
    {
        // End:0x1C
        case "UltraLow":
            return DetailLevels[0];
        // End:0x30
        case "VeryLow":
            return DetailLevels[1];
        // End:0x41
        case "Low":
            return DetailLevels[2];
        // End:0x54
        case "Lower":
            return DetailLevels[3];
        // End:0x68
        case "Normal":
            return DetailLevels[4];
        // End:0x7C
        case "Higher":
            return DetailLevels[5];
        // End:0x8E
        case "High":
            return DetailLevels[6];
        // End:0xA4
        case "VeryHigh":
            return DetailLevels[7];
        // End:0xBB
        case "UltraHigh":
            return DetailLevels[8];
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

final function string GetConfigString(string DetailString)
{
    switch(DetailString)
    {
        // End:0x1C
        case DetailLevels[0]:
            return "UltraLow";
        // End:0x30
        case DetailLevels[1]:
            return "VeryLow";
        // End:0x41
        case DetailLevels[2]:
            return "Low";
        // End:0x54
        case DetailLevels[3]:
            return "Lower";
        // End:0x68
        case DetailLevels[4]:
            return "Normal";
        // End:0x7C
        case DetailLevels[5]:
            return "Higher";
        // End:0x8E
        case DetailLevels[6]:
            return "High";
        // End:0xA4
        case DetailLevels[7]:
            return "VeryHigh";
        // End:0xBB
        case DetailLevels[8]:
            return "UltraHigh";
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

final function GetComboOptions(moComboBox Combo, out array<GUIListElem> AR)
{
    local int i;
    local string TempStr;

    AR.Remove(0, AR.Length);
    // End:0x1A
    if(Combo == none)
    {
        return;
    }
    switch(Combo)
    {
        // End:0x29
        case co_Texture:
        // End:0x97
        case co_Char:
            i = 0;
            J0x38:

            // End:0x94 [Loop If]
            if(i < 9)
            {
                // End:0x5E
                if(bDemo && i == 5)
                {
                    // [Explicit Break]
                    goto J0x94;
                }
                AR.Length = AR.Length + 1;
                AR[i].Item = DetailLevels[i];
                i++;
                // [Loop Continue]
                goto J0x38;
            }
            J0x94:

            // End:0x530
            break;
        // End:0x9F
        case co_Physics:
        // End:0xA7
        case co_World:
        // End:0xFB
        case co_Decal:
            AR.Length = 3;
            AR[0].Item = DetailLevels[3];
            AR[1].Item = DetailLevels[4];
            AR[2].Item = DetailLevels[5];
            // End:0x530
            break;
        // End:0x137
        case co_ColorDepth:
            AR.Length = 2;
            AR[0].Item = BitDepthText[0];
            AR[1].Item = BitDepthText[1];
            // End:0x530
            break;
        // End:0x1A8
        case co_Resolution:
            AR.Length = 17;
            i = 0;
            J0x14F:

            // End:0x1A5 [Loop If]
            if(i < AR.Length)
            {
                AR[i].Item = (string(DisplayModes[i].width) $ "x") $ string(DisplayModes[i].Height);
                i++;
                // [Loop Continue]
                goto J0x14F;
            }
            // End:0x530
            break;
        // End:0x3A8
        case co_RenderDevice:
            // End:0x250
            if(PlatformIsWindows() && PlatformIs64Bit())
            {
                AR.Length = 2;
                AR[0].Item = RenderModeText[0] @ "9";
                AR[0].ExtraStrData = "D3D9Drv.D3D9RenderDevice";
                AR[1].Item = "OpenGL";
                AR[1].ExtraStrData = "OpenGLDrv.OpenGLRenderDevice";                
            }
            else
            {
                // End:0x2A4
                if(PlatformIsMacOS())
                {
                    AR.Length = 1;
                    AR[0].Item = "OpenGL";
                    AR[0].ExtraStrData = "OpenGLDrv.OpenGLRenderDevice";                    
                }
                else
                {
                    // End:0x347
                    if(PlatformIsUnix())
                    {
                        AR.Length = 1;
                        AR[0].Item = "OpenGL";
                        AR[0].ExtraStrData = "OpenGLDrv.OpenGLRenderDevice";
                        // End:0x344
                        if(!PlatformIs64Bit())
                        {
                            AR.Length = 2;
                            AR[1].Item = RenderModeText[1];
                            AR[1].ExtraStrData = "PixoDrv.PixoRenderDevice";
                        }                        
                    }
                    else
                    {
                        AR.Length = 2;
                        i = 0;
                        J0x357:

                        // End:0x3A5 [Loop If]
                        if(i < 2)
                        {
                            AR[i].Item = RenderModeText[i];
                            AR[i].ExtraStrData = RenderMode[i];
                            i++;
                            // [Loop Continue]
                            goto J0x357;
                        }
                    }
                }
            }
            // End:0x530
            break;
        // End:0x4C3
        case co_Shadows:
            TempStr = GetNativeClassName("Engine.Engine.RenderDevice");
            // End:0x48F
            if(((TempStr == "OpenGLDrv.OpenGLRenderDevice") || TempStr == "D3DDrv.D3DRenderDevice") || TempStr == "D3D9Drv.D3D9RenderDevice")
            {
                AR.Length = 3;
                i = 0;
                J0x45A:

                // End:0x48C [Loop If]
                if(i < 3)
                {
                    AR[i].Item = ShadowOptions[i];
                    i++;
                    // [Loop Continue]
                    goto J0x45A;
                }                
            }
            else
            {
                AR.Length = 2;
                AR[0].Item = ShadowOptions[0];
                AR[1].Item = ShadowOptions[1];
            }
            // End:0x530
            break;
        // End:0x52D
        case co_MeshLOD:
            AR.Length = 4;
            AR[0].Item = DetailLevels[3];
            AR[1].Item = DetailLevels[4];
            AR[2].Item = DetailLevels[5];
            AR[3].Item = DetailLevels[8];
            // End:0x530
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function UpdateDecalStay()
{
    // End:0x20
    if(ch_Decals.IsChecked())
    {
        EnableComponent(co_Decal);        
    }
    else
    {
        DisableComponent(co_Decal);
    }
    //return;    
}

defaultproperties
{
    DisplayModes[0]=(width=320,Height=240)
    DisplayModes[1]=(width=512,Height=384)
    DisplayModes[2]=(width=640,Height=480)
    DisplayModes[3]=(width=800,Height=500)
    DisplayModes[4]=(width=800,Height=600)
    DisplayModes[5]=(width=1024,Height=640)
    DisplayModes[6]=(width=1024,Height=768)
    DisplayModes[7]=(width=1152,Height=768)
    DisplayModes[8]=(width=1152,Height=864)
    DisplayModes[9]=(width=1280,Height=800)
    DisplayModes[10]=(width=1280,Height=854)
    DisplayModes[11]=(width=1280,Height=960)
    DisplayModes[12]=(width=1280,Height=1024)
    DisplayModes[13]=(width=1600,Height=1024)
    DisplayModes[14]=(width=1600,Height=1200)
    DisplayModes[15]=(width=1680,Height=1050)
    DisplayModes[16]=(width=1920,Height=1200)
    BitDepthText[0]="16?? ??"
    BitDepthText[1]="32?? ??"
    DetailLevels[0]="?? ??"
    DetailLevels[1]="?? ??"
    DetailLevels[2]="?? ??"
    DetailLevels[3]="??"
    DetailLevels[4]="??"
    DetailLevels[5]="??"
    DetailLevels[6]="?? ??"
    DetailLevels[7]="?? ??"
    DetailLevels[8]="?? ??"
    ShadowOptions[0]="??"
    ShadowOptions[1]="???(Blob)"
    ShadowOptions[2]="??(Full)"
    RenderModeText[0]="???? 3D"
    RenderModeText[1]="??GL"
    RenderMode[0]="D3D9Drv.D3D9RenderDevice"
    RenderMode[1]="PixoDrv.PixoRenderDevice"
    DisplayPromptMenu="GUI2K4.UT2K4VideoChangeOK"
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.sbSection1'
    begin object name="sbSection1" class=XInterface.GUISectionBackground
        Caption="???"
        WinTop=0.0127610
        WinLeft=0.0009480
        WinWidth=0.4918490
        WinHeight=0.4407290
        RenderWeight=0.0100000
        OnPreDraw=sbSection1.InternalPreDraw
    end object
    sb_Section1=sbSection1
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.sbSection2'
    begin object name="sbSection2" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0127610
        WinLeft=0.4958260
        WinWidth=0.5027510
        WinHeight=0.9752280
        RenderWeight=0.0100000
        OnPreDraw=sbSection2.InternalPreDraw
    end object
    sb_Section2=sbSection2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.sbSection3'
    begin object name="sbSection3" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="?? ???"
        WinTop=0.4760610
        WinLeft=0.0111320
        WinWidth=0.4628910
        WinHeight=0.5112610
        RenderWeight=0.0100000
        OnPreDraw=sbSection3.InternalPreDraw
    end object
    sb_Section3=sbSection3
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.GammaBar'
    begin object name="GammaBar" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.4500010
        WinLeft=0.0134770
        WinWidth=0.4562500
        WinHeight=0.5321170
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
    end object
    i_GammaBar=GammaBar
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailTextureDetail'
    begin object name="DetailTextureDetail" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="??? ???"
        OnCreateComponent=DetailTextureDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="???? ??? ???? ??? ?? ?????."
        WinTop=0.0630210
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=7
        bVisible=false
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Texture=DetailTextureDetail
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailCharacterDetail'
    begin object name="DetailCharacterDetail" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="??? ???"
        OnCreateComponent=DetailCharacterDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="??? ???? ??? ???? ????? ?????."
        WinTop=0.1166670
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=8
        bVisible=false
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Char=DetailCharacterDetail
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailWorldDetail'
    begin object name="DetailWorldDetail" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="?? ???"
        OnCreateComponent=DetailWorldDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="???? ? ??(geometry)? ??(effects)? ????? ??? ?????."
        WinTop=0.1703120
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=9
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_World=DetailWorldDetail
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailPhysics'
    begin object name="DetailPhysics" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="?? ???"
        OnCreateComponent=DetailPhysics.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="??(Physics) ?????? ???? ??? ?????."
        WinTop=0.2239580
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=10
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Physics=DetailPhysics
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailDecalStay'
    begin object name="DetailDecalStay" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="?? ???"
        OnCreateComponent=DetailDecalStay.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Normal"
        Hint="??? ??(Decals)? ??? ?? ????? ?????."
        WinTop=0.2820320
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=12
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Decal=DetailDecalStay
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.MeshLOD'
    begin object name="MeshLOD" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="???? ?? LOD"
        OnCreateComponent=MeshLOD.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ???? ??? ?? ?? ??? ??? ? ????. ???? ?? ?? ?? ???? ???? ?????. ??? ??? ?? ????? ??? ??? ? ????."
        WinTop=0.2239580
        WinLeft=0.5500000
        WinWidth=0.4000000
        TabOrder=11
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_MeshLOD=MeshLOD
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.VideoResolution'
    begin object name="VideoResolution" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.5500000
        Caption="???"
        OnCreateComponent=VideoResolution.InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="640x480"
        Hint="??? ???? ?????."
        WinTop=0.0604170
        WinLeft=0.0305080
        WinWidth=0.3900000
        TabOrder=1
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Resolution=VideoResolution
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.VideoColorDepth'
    begin object name="VideoColorDepth" class=XInterface.moComboBox
        CaptionWidth=0.5500000
        Caption="??"
        OnCreateComponent=VideoColorDepth.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="false"
        Hint="??? ???? ?? ?? ?? ?????."
        WinTop=0.1171880
        WinLeft=0.0302340
        WinWidth=0.3900000
        TabOrder=2
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_ColorDepth=VideoColorDepth
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.RenderDeviceCombo'
    begin object name="RenderDeviceCombo" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.5500000
        Caption="?? ????"
        OnCreateComponent=RenderDeviceCombo.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ????? ??? ?? ? ?? ????? ??? ?? ????."
        WinTop=0.3350210
        WinLeft=0.5477730
        WinWidth=0.4019530
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_RenderDevice=RenderDeviceCombo
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailCharacterShadows'
    begin object name="DetailCharacterShadows" class=XInterface.moComboBox
        ComponentJustification=0
        CaptionWidth=0.6500000
        Caption="??? ???"
        OnCreateComponent=DetailCharacterShadows.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ?????."
        WinTop=0.4313780
        WinLeft=0.6000000
        WinWidth=0.3000000
        TabOrder=13
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    co_Shadows=DetailCharacterShadows
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailDecals'
    begin object name="DetailDecals" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??"
        OnCreateComponent=DetailDecals.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ?? ??(Decals) ??"
        WinTop=0.4793080
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=14
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Decals=DetailDecals
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailDynamicLighting'
    begin object name="DetailDynamicLighting" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="???? ???"
        OnCreateComponent=DetailDynamicLighting.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="???? ???(Dynamic Lighting) ??."
        WinTop=0.5267160
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=15
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_DynLight=DetailDynamicLighting
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailCoronas'
    begin object name="DetailCoronas" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="???"
        OnCreateComponent=DetailCoronas.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="???(corona)??? ?????."
        WinTop=0.6241360
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=17
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Coronas=DetailCoronas
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailDetailTextures'
    begin object name="DetailDetailTextures" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ???"
        OnCreateComponent=DetailDetailTextures.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ??? ??(detail textures) ??? ??."
        WinTop=0.5754250
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=16
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Textures=DetailDetailTextures
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailProjectors'
    begin object name="DetailProjectors" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="????"
        OnCreateComponent=DetailProjectors.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="????(projectors) ??."
        WinTop=0.7211950
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=19
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Projectors=DetailProjectors
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailDecoLayers'
    begin object name="DetailDecoLayers" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="?? ??"
        OnCreateComponent=DetailDecoLayers.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ? ? ??(Foliage) ??."
        WinTop=0.7699060
        WinLeft=0.5997270
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=20
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_DecoLayers=DetailDecoLayers
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DetailTrilinear'
    begin object name="DetailTrilinear" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="?????? ???"
        OnCreateComponent=DetailTrilinear.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?????? ???(Trilinear Filtering)? ??, ?? ??? PC? ?? ??."
        WinTop=0.6732630
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=18
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Trilinear=DetailTrilinear
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.VideoFullScreen'
    begin object name="VideoFullScreen" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="????"
        OnCreateComponent=VideoFullScreen.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ? ????? ?????."
        WinTop=0.1695310
        WinLeft=0.0309760
        WinWidth=0.3875000
        TabOrder=3
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_FullScreen=VideoFullScreen
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.WeatherEffects'
    begin object name="WeatherEffects" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="????"
        OnCreateComponent=WeatherEffects.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?? ??? ?? ????? ?????. "
        WinTop=0.8649100
        WinLeft=0.5997270
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=21
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    ch_Weather=WeatherEffects
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mDOF'
    begin object name="mDOF" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="DOF"
        OnCreateComponent=mDOF.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables DepthOfField"
        WinTop=0.0630210
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbDOF=mDOF
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mSSAO'
    begin object name="mSSAO" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="SSAO"
        OnCreateComponent=mSSAO.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Screen-Space Ambient Occlusion"
        WinTop=0.1166670
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbSSAO=mSSAO
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mHDR'
    begin object name="mHDR" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="HDR"
        OnCreateComponent=mHDR.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables High Dynamic Range"
        WinTop=0.0630210
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbHDR=mHDR
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mShader'
    begin object name="mShader" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="Shader"
        OnCreateComponent=mShader.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Shader"
        WinTop=0.0630210
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbShader=mShader
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mGlobalAntiportal'
    begin object name="mGlobalAntiportal" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="Global Antiportal"
        OnCreateComponent=mGlobalAntiportal.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Global Antiportal"
        WinTop=0.1166670
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbGlobalAntiportal=mGlobalAntiportal
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mLinkAntiportal'
    begin object name="mLinkAntiportal" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="Link Antiportal"
        OnCreateComponent=mLinkAntiportal.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Link Antiportal"
        WinTop=0.1166670
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbLinkAntiportal=mLinkAntiportal
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.mHOQ'
    begin object name="mHOQ" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="HOQ"
        OnCreateComponent=mHOQ.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Hardware Occlusion Query"
        WinTop=0.1166670
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    cbHOQ=mHOQ
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.GammaSlider'
    begin object name="GammaSlider" class=XInterface.moSlider
        MaxValue=2.5000000
        MinValue=0.5000000
        SliderCaptionStyleName=""
        CaptionWidth=0.5500000
        Caption="??"
        OnCreateComponent=GammaSlider.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="????? ???? ??(Gamma)?? ???? ???? ?????."
        WinTop=0.2729180
        WinLeft=0.0125010
        WinWidth=0.4611330
        TabOrder=5
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    sl_Gamma=GammaSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.BrightnessSlider'
    begin object name="BrightnessSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName=""
        CaptionWidth=0.5500000
        Caption="??"
        OnCreateComponent=BrightnessSlider.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="???? ??? ??(Brightness)? ?????."
        WinTop=0.2299510
        WinLeft=0.0121880
        WinWidth=0.4614450
        TabOrder=4
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    sl_Brightness=BrightnessSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.ContrastSlider'
    begin object name="ContrastSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName=""
        CaptionWidth=0.5500000
        Caption="????"
        OnCreateComponent=ContrastSlider.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="???? ??? ?????(Contrast)? ?????."
        WinTop=0.3132850
        WinLeft=0.0121880
        WinWidth=0.4611330
        TabOrder=6
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    sl_Contrast=ContrastSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.DistanceLODSlider'
    begin object name="DistanceLODSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        Value=0.5000000
        SliderCaptionStyleName=""
        CaptionWidth=0.6500000
        Caption="?? ?? ??"
        OnCreateComponent=DistanceLODSlider.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??? ??? ????? ???. ??? ??? ?? ????? ??? ??? ? ????."
        WinTop=0.9100000
        WinLeft=0.5600000
        WinWidth=0.4000000
        TabOrder=22
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    sl_DistanceLOD=DistanceLODSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_DetailSettings.SSAOFactorSlider'
    begin object name="SSAOFactorSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        Value=0.5000000
        SliderCaptionStyleName=""
        CaptionWidth=0.6500000
        Caption="SSAO Factor"
        OnCreateComponent=SSAOFactorSlider.InternalOnCreateComponent
        IniOption="@Internal"
        WinLeft=0.5600000
        WinWidth=0.4000000
        OnChange=UT2K4Tab_DetailSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_DetailSettings.InternalOnLoadINI
    end object
    sl_SSAOFactor=SSAOFactorSlider
    RelaunchQuestion="??? ??? ??? ???? ??????. ??? ??? ??? ? ?????. ?? ?? ?????????"
    InvalidSelectionText="??? ???? ? ???? ???? ????. ???? ???????"
    bExpert=false
    PanelCaption="?????"
    WinTop=0.1500000
    WinHeight=0.7400000
    OnPreDraw=UT2K4Tab_DetailSettings.InternalOnPreDraw
}