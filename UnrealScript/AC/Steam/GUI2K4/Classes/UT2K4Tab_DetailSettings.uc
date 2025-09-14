/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_DetailSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:1
 *	Properties:108
 *	Functions:24
 *
 *******************************************************************************/
class UT2K4Tab_DetailSettings extends Settings_Tabs
    dependson(Settings_Tabs)
    dependson(UT2K4VideoChangeOK)
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Section1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Section2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Section3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Gamma;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_GammaBar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Texture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Char;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_World;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Physics;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Decal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_MeshLOD;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Resolution;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_ColorDepth;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_RenderDevice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Shadows;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Decals;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DynLight;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Coronas;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Textures;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Projectors;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DecoLayers;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Trilinear;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_FullScreen;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Weather;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbDOF;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbSSAO;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbHDR;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbShader;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbGlobalAntiportal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbLinkAntiportal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbHOQ;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Gamma;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Brightness;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Contrast;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_DistanceLOD;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_SSAOFactor;
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
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    CheckSupportedResolutions();
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x1b
    if(bShow)
    {
        CheckSliders();
    }
}

function InitializeCombos()
{
    local int i;
    local array<GUIListElem> Options;

    i = 0;
    J0x07:
    // End:0xd0 [While If]
    if(i < Components.Length)
    {
        // End:0xc6
        if(moComboBox(Components[i]) != none)
        {
            GetComboOptions(moComboBox(Components[i]), Options);
            moComboBox(Components[i]).MyComboBox.List.Elements = Options;
            moComboBox(Components[i]).MyComboBox.List.ItemCount = Options.Length;
            moComboBox(Components[i]).ReadOnly(true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x10f
    if(!bDemo)
    {
        co_Texture.MyComboBox.MaxVisibleItems = 9;
        co_Char.MyComboBox.MaxVisibleItems = 9;
    }
}

function CheckSliders()
{
    // End:0x3a
    if(bFullScreen || !PlatformIsWindows())
    {
        EnableComponent(sl_Gamma);
        EnableComponent(sl_Contrast);
        EnableComponent(sl_Brightness);
    }
    // End:0x5b
    else
    {
        DisableComponent(sl_Gamma);
        DisableComponent(sl_Contrast);
        DisableComponent(sl_Brightness);
    }
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
    if(co_ColorDepth != none && co_ColorDepth.ItemCount() > 0)
    {
        BitDepth = int(Left(co_ColorDepth.GetText(), 2));
    }
    i = 0;
    J0x77:
    // End:0x202 [While If]
    if(i < 17)
    {
        W = string(DisplayModes[i].width);
        H = string(DisplayModes[i].Height);
        WH = W $ "x" $ H;
        str = "SUPPORTEDRESOLUTION WIDTH=" $ W @ "HEIGHT=" $ H @ "BITDEPTH=" $ string(BitDepth);
        // End:0x132
        if(CurrentSelection ~= WH)
        {
            bStandard = true;
        }
        Index = co_Resolution.FindIndex(WH);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x1b7
        if(!bSupported && co_Resolution.MyComboBox.List.IsValidIndex(Index))
        {
            co_Resolution.RemoveItem(Index, 1);
        }
        // End:0x1f8
        else
        {
            // End:0x1f8
            if(bSupported && !co_Resolution.MyComboBox.List.IsValidIndex(Index))
            {
                AddNewResolution(WH);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x77;
    }
    // End:0x2bc
    if(!bStandard)
    {
        Divide(CurrentSelection, "x", W, H);
        str = "SUPPORTEDRESOLUTION WIDTH=" $ W @ "HEIGHT=" $ H @ "BITDEPTH=" $ string(BitDepth);
        bSupported = bool(PC.ConsoleCommand(str));
        // End:0x2bc
        if(!bSupported)
        {
            Index = co_Resolution.FindIndex(CurrentSelection);
            bInvalidRes = true;
        }
    }
    CheckSliders();
    co_Resolution.SetText(CurrentSelection);
    bIgnoreChange = bOldIgnoreChange;
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x60
    if(Controller.ActivePage == PageOwner && bInvalidRes)
    {
        bInvalidRes = false;
        Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", InvalidSelectionText);
    }
    return false;
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
    // End:0x4e
    else
    {
        InternalOnLoadINI(co_ColorDepth, "");
    }
}

function Refresh()
{
    InternalOnLoadINI(co_Resolution, "");
    InternalOnLoadINI(co_ColorDepth, "");
    InternalOnLoadINI(ch_FullScreen, "");
    CheckSupportedResolutions();
}

function int AddNewResolution(string NewDisplayMode)
{
    local int i, ItemW, ItemH, InWidth, InHeight;

    local bool bTemp;
    local string str, StrW, StrH;

    bTemp = bIgnoreChange;
    bIgnoreChange = true;
    i = co_Resolution.FindIndex(NewDisplayMode);
    // End:0x4d
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
    // End:0x123 [While If]
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
            }
            // End:0x123
            else
            {
                // This is an implied JumpToken;
                goto J0x119;
            }
            // End:0x119
            if(ItemW > InWidth)
            {
            }
            // End:0x123
            else
            {
                J0x119:
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x82;
            }
        }
    }
    // End:0x153
    if(i == co_Resolution.ItemCount())
    {
        co_Resolution.AddItem(NewDisplayMode);
    }
    // End:0x17e
    else
    {
        co_Resolution.MyComboBox.List.Insert(i, NewDisplayMode);
    }
    bIgnoreChange = bTemp;
    return i;
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
        // End:0xa9
        case co_Texture:
            S = GetGUIString(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailWorld"));
            iTexture = co_Texture.FindIndex(S);
            iTextureD = iTexture;
            co_Texture.SilentSetIndex(iTexture);
            // End:0x159e
            break;
        // End:0x147
        case co_Char:
            S = GetGUIString(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailPlayerSkin"));
            iChar = co_Char.FindIndex(S);
            iCharD = iChar;
            co_Char.SilentSetIndex(iChar);
            // End:0x159e
            break;
        // End:0x26f
        case co_World:
            A = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice HighDetailActors"));
            B = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice SuperHighDetailActors"));
            // End:0x202
            if(B)
            {
                iWorld = 5;
            }
            // End:0x21e
            else
            {
                // End:0x216
                if(A)
                {
                    iWorld = 4;
                }
                // End:0x21e
                else
                {
                    iWorld = 3;
                }
            }
            iWorldD = iWorld;
            i = co_World.FindIndex(DetailLevels[iWorld]);
            // End:0x26c
            if(i != -1)
            {
                co_World.SilentSetIndex(i);
            }
            // End:0x159e
            break;
        // End:0x31b
        case co_MeshLOD:
            switch(class'LevelInfo'.default.MeshLODDetailLevel)
            {
                // End:0x297
                case 0:
                    iMeshLOD = 3;
                    // End:0x2ca
                    break;
                // End:0x2a7
                case 1:
                    iMeshLOD = 4;
                    // End:0x2ca
                    break;
                // End:0x2b7
                case 2:
                    iMeshLOD = 5;
                    // End:0x2ca
                    break;
                // End:0x2c7
                case 3:
                    iMeshLOD = 8;
                    // End:0x2ca
                    break;
                // End:0xffff
                default:
                    iMeshLODD = iMeshLOD;
                    i = co_MeshLOD.FindIndex(DetailLevels[iMeshLOD]);
                    // End:0x318
                    if(i != -1)
                    {
                        co_MeshLOD.SilentSetIndex(i);
                    }
                    // End:0x159e Break;
                    break;
        }
        // End:0x441
        case co_Physics:
            // End:0x387
            if(class'LevelInfo'.default.PhysicsDetailLevel == 0)
            {
                iPhys = 3;
                i = co_Physics.FindIndex(DetailLevels[3]);
                // End:0x384
                if(i != -1)
                {
                    co_Physics.SilentSetIndex(i);
                }
            }
            // End:0x433
            else
            {
                // End:0x3eb
                if(class'LevelInfo'.default.PhysicsDetailLevel == 1)
                {
                    iPhys = 4;
                    i = co_Physics.FindIndex(DetailLevels[4]);
                    // End:0x3e8
                    if(i != -1)
                    {
                        co_Physics.SilentSetIndex(i);
                    }
                }
                // End:0x433
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
            // End:0x159e
            break;
        // End:0x481
        case co_Decal:
            iDecal = int(class'LevelInfo'.default.DecalStayScale);
            iDecalD = iDecal;
            co_Decal.SilentSetIndex(iDecal);
            // End:0x159e
            break;
        // End:0x523
        case co_Resolution:
            // End:0x4b5
            if(Controller.GameResolution != "")
            {
                sRes = Controller.GameResolution;
            }
            // End:0x4ca
            else
            {
                sRes = Controller.GetCurrentRes();
            }
            sResD = sRes;
            i = AddNewResolution(sRes);
            // End:0x520
            if(i >= 0 && i < co_Resolution.ItemCount())
            {
                co_Resolution.SilentSetIndex(i);
            }
            // End:0x159e
            break;
        // End:0x5e4
        case co_ColorDepth:
            // End:0x576
            if(bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit")))
            {
                iColDepth = 0;
            }
            // End:0x57d
            else
            {
                iColDepth = 1;
            }
            iColDepthD = iColDepth;
            co_ColorDepth.SilentSetIndex(iColDepth);
            // End:0x5d2
            if(!bool(PC.ConsoleCommand("ISFULLSCREEN")))
            {
                co_ColorDepth.DisableMe();
            }
            // End:0x5e1
            else
            {
                co_ColorDepth.EnableMe();
            }
            // End:0x159e
            break;
        // End:0x637
        case co_RenderDevice:
            sRenDev = GetNativeClassName("Engine.Engine.RenderDevice");
            sRenDevD = sRenDev;
            co_RenderDevice.SetComponentValue(sRenDev, true);
            // End:0x159e
            break;
        // End:0x806
        case co_Shadows:
            TempStr = GetNativeClassName("Engine.Engine.RenderDevice");
            // End:0x78b
            if(TempStr == "D3DDrv.D3DRenderDevice" || TempStr == "D3D9Drv.D3D9RenderDevice" || TempStr == "OpenGLDrv.OpenGLRenderDevice")
            {
                A = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bPlayerShadows"));
                B = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bBlobShadow"));
                // End:0x76d
                if(B)
                {
                    iShadow = 1;
                }
                // End:0x788
                else
                {
                    // End:0x781
                    if(A)
                    {
                        iShadow = 2;
                    }
                    // End:0x788
                    else
                    {
                        iShadow = 0;
                    }
                }
            }
            // End:0x7e4
            else
            {
                B = bool(PC.ConsoleCommand("get UnrealGame.UnrealPawn bBlobShadow"));
                // End:0x7dd
                if(B)
                {
                    iShadow = 1;
                }
                // End:0x7e4
                else
                {
                    iShadow = 0;
                }
            }
            iShadowD = iShadow;
            co_Shadows.SilentSetIndex(iShadow);
            // End:0x159e
            break;
        // End:0x92e
        case ch_DynLight:
            // End:0x8ee
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDynLight = !bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager NoDynamicLights"));
                bDynLightD = bDynLight;
                ch_DynLight.SetComponentValue(string(bDynLight), true);
            }
            // End:0x92b
            else
            {
                bDynLight = false;
                bDynLightD = bDynLight;
                ch_DynLight.SetComponentValue(string(bDynLight), true);
                ch_DynLight.SetEnabled(false);
            }
            // End:0x159e
            break;
        // End:0x989
        case ch_FullScreen:
            bFullScreen = bool(PC.ConsoleCommand("ISFULLSCREEN"));
            bFullScreenD = bFullScreen;
            moCheckBox(Sender).SetComponentValue(string(bFullScreen), true);
            // End:0x159e
            break;
        // End:0xa02
        case ch_Trilinear:
            bTrilin = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice UseTrilinear"));
            bTrilinD = bTrilin;
            ch_Trilinear.SetComponentValue(string(bTrilin), true);
            // End:0x159e
            break;
        // End:0xa7c
        case ch_Projectors:
            bProj = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Projectors"));
            bProjD = bProj;
            ch_Projectors.SetComponentValue(string(bProj), true);
            // End:0x159e
            break;
        // End:0xaf6
        case ch_DecoLayers:
            bFol = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DecoLayers"));
            bFolD = bFol;
            ch_DecoLayers.SetComponentValue(string(bFol), true);
            // End:0x159e
            break;
        // End:0xb71
        case ch_Textures:
            bTexture = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice DetailTextures"));
            bTextureD = bTexture;
            ch_Textures.SetComponentValue(string(bTexture), true);
            // End:0x159e
            break;
        // End:0xbe8
        case ch_Coronas:
            bCorona = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Coronas"));
            bCoronaD = bCorona;
            ch_Coronas.SetComponentValue(string(bCorona), true);
            // End:0x159e
            break;
        // End:0xc64
        case ch_Decals:
            bDecal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Decals"));
            bDecalD = bDecal;
            ch_Decals.SetComponentValue(string(bDecal), true);
            UpdateDecalStay();
            // End:0x159e
            break;
        // End:0xd18
        case cbShader:
            // End:0xcd8
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")))
            {
                bShader = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader"));
            }
            // End:0xcf0
            else
            {
                bShader = false;
                cbShader.SetEnabled(false);
            }
            bShaderD = bShader;
            cbShader.SetComponentValue(string(bShader), true);
            // End:0x159e
            break;
        // End:0xe31
        case cbHDR:
            // End:0xdf1
            if(bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                bHDR = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR"));
            }
            // End:0xe09
            else
            {
                bHDR = false;
                cbHDR.SetEnabled(false);
            }
            bHDRD = bHDR;
            cbHDR.SetComponentValue(string(bHDR), true);
            // End:0x159e
            break;
        // End:0xfb0
        case cbSSAO:
            // End:0xf70
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HDR")) && bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bSSAO = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager SSAO"));
            }
            // End:0xf88
            else
            {
                bSSAO = false;
                cbSSAO.SetEnabled(false);
            }
            bSSAOD = bSSAO;
            cbSSAO.SetComponentValue(string(bSSAO), true);
            // End:0x159e
            break;
        // End:0x10c9
        case cbDOF:
            // End:0x1089
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDPS30")) && bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Shader")))
            {
                bDOF = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DOF"));
            }
            // End:0x10a1
            else
            {
                bDOF = false;
                cbDOF.SetEnabled(false);
            }
            bDOFD = bDOF;
            cbDOF.SetComponentValue(string(bDOF), true);
            // End:0x159e
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
            // End:0x159e
            break;
        // End:0x1219
        case cbGlobalAntiportal:
            bGlobalAntiportal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager GlobalAntiportal"));
            bGlobalAntiportalD = bGlobalAntiportal;
            cbGlobalAntiportal.SetComponentValue(string(bGlobalAntiportal), true);
            // End:0x159e
            break;
        // End:0x1297
        case cbLinkAntiportal:
            bLinkAntiportal = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager LinkAntiportal"));
            bLinkAntiportalD = bLinkAntiportal;
            cbLinkAntiportal.SetComponentValue(string(bLinkAntiportal), true);
            // End:0x159e
            break;
        // End:0x130a
        case cbHOQ:
            bHOQ = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager HOQ"));
            bHOQD = bHOQ;
            cbHOQ.SetComponentValue(string(bHOQ), true);
            // End:0x159e
            break;
        // End:0x1370
        case sl_Gamma:
            fGamma = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Gamma"));
            sl_Gamma.SetComponentValue(string(fGamma), true);
            // End:0x159e
            break;
        // End:0x13db
        case sl_Brightness:
            fBright = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Brightness"));
            sl_Brightness.SetComponentValue(string(fBright), true);
            // End:0x159e
            break;
        // End:0x1444
        case sl_Contrast:
            fContrast = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager Contrast"));
            sl_Contrast.SetComponentValue(string(fContrast), true);
            // End:0x159e
            break;
        // End:0x14c2
        case ch_Weather:
            bWeather = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager WeatherEffects"));
            bWeatherD = bWeather;
            ch_Weather.SetComponentValue(string(bWeather), true);
            // End:0x159e
            break;
        // End:0x153d
        case sl_DistanceLOD:
            fDistance = float(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager DrawDistanceLOD"));
            fDistanceD = fDistance;
            sl_DistanceLOD.SetComponentValue(string(fDistance), true);
            // End:0x159e
            break;
        // End:0xffff
        default:
            Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
}

function ResetClicked()
{
    local int i;

    super.ResetClicked();
    class'LevelInfo'.static.ResetConfig("MeshLODDetailLevel");
    class'LevelInfo'.static.ResetConfig("PhysicsDetailLevel");
    class'LevelInfo'.static.ResetConfig("DecalStayScale");
    class'UnrealPawn'.static.ResetConfig("bPlayerShadows");
    class'UnrealPawn'.static.ResetConfig("bBlobShadow");
    ResetViewport();
    ResetRenderDevice();
    i = 0;
    J0xb9:
    // End:0xe9 [While If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb9;
    }
}

function ResetViewport()
{
    local class<Client> ViewportClass;

    ViewportClass = class<Client>(DynamicLoadObject(GetNativeClassName("Engine.Engine.ViewportManager"), class'Class'));
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
}

function ResetRenderDevice()
{
    local class<RenderDevice> RenderClass;

    // End:0x25
    if(!sRenDev ~= sRenDevD)
    {
        Controller.SetRenderDevice(sRenDevD);
    }
    RenderClass = class<RenderDevice>(DynamicLoadObject(sRenDevD, class'Class'));
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
    // End:0x16b
    if(iTexture != iTextureD)
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        str = DetailLevels[iTexture];
        V = GetConfigString(str);
        PC.ConsoleCommand(t $ "Terrain" @ V);
        PC.ConsoleCommand(t $ "World" @ V);
        PC.ConsoleCommand(t $ "Rendermap" @ V);
        PC.ConsoleCommand(t $ "Lightmap" @ V);
        PC.ConsoleCommand("flush");
        iTextureD = iTexture;
    }
    // End:0x24d
    if(iChar != iCharD)
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        str = DetailLevels[iChar];
        V = GetConfigString(str);
        PC.ConsoleCommand(t $ "WeaponSkin" @ V);
        PC.ConsoleCommand(t $ "PlayerSkin" @ V);
        PC.ConsoleCommand("flush");
        iCharD = iChar;
    }
    // End:0x4c7
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
                // End:0x4bc
                break;
            // End:0x3fe
            case 4:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                PC.Level.DetailChange(1);
                // End:0x4bc
                break;
            // End:0x4b9
            case 5:
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
                PC.Level.DetailChange(2);
                // End:0x4bc
                break;
            // End:0xffff
            default:
                iWorldD = iWorld;
            }
            // End:0x5bf
            if(iMeshLOD != iMeshLODD)
            {
                switch(iMeshLOD)
                {
                    // End:0x510
                    case 3:
                        class'LevelInfo'.default.MeshLODDetailLevel = 0;
                        PC.Level.MeshLODDetailLevel = 0;
                        // End:0x5ac
                        break;
                    // End:0x543
                    case 4:
                        class'LevelInfo'.default.MeshLODDetailLevel = 1;
                        PC.Level.MeshLODDetailLevel = 1;
                        // End:0x5ac
                        break;
                    // End:0x576
                    case 5:
                        class'LevelInfo'.default.MeshLODDetailLevel = 2;
                        PC.Level.MeshLODDetailLevel = 2;
                        // End:0x5ac
                        break;
                    // End:0x5a9
                    case 8:
                        class'LevelInfo'.default.MeshLODDetailLevel = 3;
                        PC.Level.MeshLODDetailLevel = 3;
                        // End:0x5ac
                        break;
                    // End:0xffff
                    default:
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
                                class'LevelInfo'.default.PhysicsDetailLevel = 0;
                                PC.Level.PhysicsDetailLevel = 0;
                                // End:0x671
                                break;
                            // End:0x63b
                            case 4:
                                class'LevelInfo'.default.PhysicsDetailLevel = 1;
                                PC.Level.PhysicsDetailLevel = 1;
                                // End:0x671
                                break;
                            // End:0x66e
                            case 5:
                                class'LevelInfo'.default.PhysicsDetailLevel = 2;
                                PC.Level.PhysicsDetailLevel = 2;
                                // End:0x671
                                break;
                            // End:0xffff
                            default:
                                iPhysD = iPhys;
                                bLevel = true;
                            }
                            // End:0x751
                            if(iShadow != iShadowD)
                            {
                                // End:0x70e
                                if(PC.Pawn != none && UnrealPawn(PC.Pawn) != none)
                                {
                                    UnrealPawn(PC.Pawn).bBlobShadow = iShadow == 1;
                                    UnrealPawn(PC.Pawn).bPlayerShadows = iShadow > 0;
                                }
                                class'UnrealPawn'.default.bBlobShadow = iShadow == 1;
                                class'UnrealPawn'.default.bPlayerShadows = iShadow > 0;
                                iShadowD = iShadow;
                                bUnreal = true;
                            }
                            // End:0x794
                            if(class'Vehicle'.default.bVehicleShadows != iShadow > 0)
                            {
                                class'Vehicle'.default.bVehicleShadows = iShadow > 0;
                                class'Vehicle'.static.StaticSaveConfig();
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
                                class'LevelInfo'.default.DecalStayScale = float(iDecal);
                                iDecalD = iDecal;
                                bLevel = true;
                            }
                            // End:0x8d9
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
                            // End:0x9ad
                            if(bProj != bProjD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Projectors" @ string(bProj));
                                bProjD = bProj;
                            }
                            // End:0xa18
                            if(bTexture != bTextureD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice DetailTextures" @ string(bTexture));
                                bTextureD = bTexture;
                            }
                            // End:0xa7f
                            if(bCorona != bCoronaD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Coronas" @ string(bCorona));
                                bCoronaD = bCorona;
                            }
                            // End:0xae5
                            if(bDecal != bDecalD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Decals" @ string(bDecal));
                                bDecalD = bDecal;
                            }
                            // End:0xb53
                            if(bWeather != bWeatherD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager WeatherEffects" @ string(bWeather));
                                bWeatherD = bWeather;
                            }
                            // End:0xbda
                            if(fDistance != fDistanceD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DrawDistanceLOD" @ string(fDistance));
                                PC.Level.UpdateDistanceFogLOD(fDistance);
                                fDistanceD = fDistance;
                            }
                            // End:0xc40
                            if(bShader != bShaderD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager Shader" @ string(bShader));
                                bShaderD = bShader;
                            }
                            // End:0xca3
                            if(bHDR != bHDRD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HDR" @ string(bHDR));
                                bHDRD = bHDR;
                            }
                            // End:0xd06
                            if(bDOF != bDOFD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager DOF" @ string(bDOF));
                                bDOFD = bDOF;
                            }
                            // End:0xd6a
                            if(bSSAO != bSSAOD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SSAO" @ string(bSSAO));
                                bSSAOD = bSSAO;
                            }
                            // End:0xdcf
                            if(fSSAOFactor != fSSAOFactorD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager SSAOFactor" @ string(fSSAOFactor));
                                fSSAOFactorD = fSSAOFactor;
                            }
                            // End:0xe3f
                            if(bGlobalAntiportal != bGlobalAntiportalD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager GlobalAntiportal" @ string(bGlobalAntiportal));
                                bGlobalAntiportalD = bGlobalAntiportal;
                            }
                            // End:0xead
                            if(bLinkAntiportal != bLinkAntiportalD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager LinkAntiportal" @ string(bLinkAntiportal));
                                bLinkAntiportalD = bLinkAntiportal;
                            }
                            // End:0xf10
                            if(bHOQ != bHOQD)
                            {
                                PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager HOQ" @ string(bHOQ));
                                bHOQD = bHOQ;
                            }
                            // End:0xf74
                            if(bUnreal)
                            {
                                // End:0xf65
                                if(PC.Pawn != none && UnrealPawn(PC.Pawn) != none)
                                {
                                    UnrealPawn(PC.Pawn).SaveConfig();
                                }
                                // End:0xf74
                                else
                                {
                                    class'UnrealPawn'.static.StaticSaveConfig();
                                }
                            }
                            // End:0xfb8
                            if(bLevel)
                            {
                                // End:0xfa9
                                if(PC.Level != none)
                                {
                                    PC.Level.SaveConfig();
                                }
                                // End:0xfb8
                                else
                                {
                                    class'LevelInfo'.static.StaticSaveConfig();
                                }
                            }
}

function InternalOnChange(GUIComponent Sender)
{
    local string str;
    local bool bGoingUp;
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    super.InternalOnChange(Sender);
    // End:0x1f
    if(bIgnoreChange)
    {
        return;
    }
    switch(Sender)
    {
        // End:0xe4
        case co_Resolution:
            sRes = co_Resolution.GetText();
            // End:0x58
            if(bFullScreen)
            {
                str = "f";
            }
            // End:0x61
            else
            {
                str = "w";
            }
            // End:0xe1
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(sRes $ "x" $ Left(BitDepthText[iColDepth], 2) $ str);
            }
            // End:0xbc6
            break;
        // End:0x1a3
        case ch_FullScreen:
            bFullScreen = ch_FullScreen.IsChecked();
            // End:0x117
            if(bFullScreen)
            {
                str = "f";
            }
            // End:0x120
            else
            {
                str = "w";
            }
            // End:0x1a0
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(sRes $ "x" $ Left(BitDepthText[iColDepth], 2) $ str);
            }
            // End:0xbc6
            break;
        // End:0x23c
        case co_RenderDevice:
            sRenDev = co_RenderDevice.GetExtra();
            // End:0x239
            if(sRenDev != sRenDevD && Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                GUIQuestionPage(Controller.ActivePage).SetupQuestion(RelaunchQuestion, 50, 2);
                GUIQuestionPage(Controller.ActivePage).__NewOnButtonClick__Delegate = RenderDeviceClick;
            }
            // End:0xbc6
            break;
        // End:0x2fa
        case co_ColorDepth:
            iColDepth = co_ColorDepth.GetIndex();
            // End:0x26e
            if(bFullScreen)
            {
                str = "f";
            }
            // End:0x277
            else
            {
                str = "w";
            }
            // End:0x2f7
            if(Controller.OpenMenu(DisplayPromptMenu))
            {
                bIgnoreResNotice = true;
                UT2K4VideoChangeOK(Controller.ActivePage).__OnClose__Delegate = VideoChangeClose;
                UT2K4VideoChangeOK(Controller.ActivePage).Execute(sRes $ "x" $ Left(BitDepthText[iColDepth], 2) $ str);
            }
            // End:0xbc6
            break;
        // End:0x349
        case co_Texture:
            i = co_Texture.GetIndex();
            bGoingUp = i > iTexture && i != iTextureD;
            iTexture = i;
            // End:0xbc6
            break;
        // End:0x398
        case co_Char:
            i = co_Char.GetIndex();
            bGoingUp = i > iChar && i != iCharD;
            iChar = i;
            // End:0xbc6
            break;
        // End:0x3f8
        case co_World:
            str = co_World.GetText();
            i = GetDetailIndex(str);
            bGoingUp = i > iWorld && i != iWorldD;
            iWorld = i;
            // End:0xbc6
            break;
        // End:0x458
        case co_MeshLOD:
            str = co_MeshLOD.GetText();
            i = GetDetailIndex(str);
            bGoingUp = i > iMeshLOD && i != iMeshLODD;
            iMeshLOD = i;
            // End:0xbc6
            break;
        // End:0x4b8
        case co_Physics:
            str = co_Physics.GetText();
            i = GetDetailIndex(str);
            bGoingUp = i > iPhys && i != iPhysD;
            iPhys = i;
            // End:0xbc6
            break;
        // End:0x4d8
        case co_Decal:
            iDecal = co_Decal.GetIndex();
            // End:0xbc6
            break;
        // End:0x527
        case co_Shadows:
            i = co_Shadows.GetIndex();
            bGoingUp = i > iShadow && i != iShadowD;
            iShadow = i;
            // End:0xbc6
            break;
        // End:0x568
        case ch_DynLight:
            bDynLight = ch_DynLight.IsChecked();
            bGoingUp = bDynLight && bDynLight != bDynLightD;
            // End:0xbc6
            break;
        // End:0x5a9
        case ch_Trilinear:
            bTrilin = ch_Trilinear.IsChecked();
            bGoingUp = bTrilin && bTrilin != bTrilinD;
            // End:0xbc6
            break;
        // End:0x5ea
        case ch_Projectors:
            bProj = ch_Projectors.IsChecked();
            bGoingUp = bProj && bProjD != bProj;
            // End:0xbc6
            break;
        // End:0x62b
        case ch_DecoLayers:
            bFol = ch_DecoLayers.IsChecked();
            bGoingUp = bFol && bFol != bFolD;
            // End:0xbc6
            break;
        // End:0x66c
        case ch_Textures:
            bTexture = ch_Textures.IsChecked();
            bGoingUp = bTexture && bTexture != bTextureD;
            // End:0xbc6
            break;
        // End:0x6ad
        case ch_Coronas:
            bCorona = ch_Coronas.IsChecked();
            bGoingUp = bCorona && bCorona != bCoronaD;
            // End:0xbc6
            break;
        // End:0x6f4
        case ch_Decals:
            bDecal = ch_Decals.IsChecked();
            bGoingUp = bDecal && bDecal != bDecalD;
            UpdateDecalStay();
            // End:0xbc6
            break;
        // End:0x732
        case sl_Gamma:
            fGamma = sl_Gamma.GetValue();
            PlayerOwner().ConsoleCommand("GAMMA" @ string(fGamma));
            // End:0xbc6
            break;
        // End:0x775
        case sl_Brightness:
            fBright = sl_Brightness.GetValue();
            PlayerOwner().ConsoleCommand("BRIGHTNESS" @ string(fBright));
            // End:0xbc6
            break;
        // End:0x7b6
        case sl_Contrast:
            fContrast = sl_Contrast.GetValue();
            PlayerOwner().ConsoleCommand("CONTRAST" @ string(fContrast));
            // End:0xbc6
            break;
        // End:0x7d6
        case sl_DistanceLOD:
            fDistance = sl_DistanceLOD.GetValue();
            // End:0xbc6
            break;
        // End:0x817
        case ch_Weather:
            bWeather = ch_Weather.IsChecked();
            bGoingUp = bWeather && bWeather != bWeatherD;
            // End:0xbc6
            break;
        // End:0x9df
        case cbShader:
            bShader = cbShader.IsChecked();
            bGoingUp = bShader && bShader != bShaderD;
            // End:0x88f
            if(bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                cbHDR.SetEnabled(bShader);
            }
            // End:0x89f
            else
            {
                cbHDR.SetEnabled(false);
            }
            // End:0x8d9
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")))
            {
                cbDOF.SetEnabled(bShader);
            }
            // End:0x8e9
            else
            {
                cbDOF.SetEnabled(false);
            }
            // End:0x95c
            if(bool(PC.ConsoleCommand("SUPPORTEDMRT")) && bool(PC.ConsoleCommand("SUPPORTEDHDR")))
            {
                cbSSAO.SetEnabled(bShader);
                sl_SSAOFactor.SetEnabled(bShader);
            }
            // End:0x97c
            else
            {
                cbSSAO.SetEnabled(false);
                sl_SSAOFactor.SetEnabled(false);
            }
            ch_DynLight.SetEnabled(bShader);
            // End:0x9dc
            if(!bShader)
            {
                cbHDR.Checked(false);
                cbDOF.Checked(false);
                cbSSAO.Checked(false);
                ch_DynLight.Checked(false);
            }
            // End:0xbc6
            break;
        // End:0xa5e
        case cbHDR:
            bHDR = cbHDR.IsChecked();
            // End:0xa2b
            if(!bHDR)
            {
                cbSSAO.SetEnabled(false);
                cbSSAO.Checked(false);
            }
            // End:0xa3b
            else
            {
                cbSSAO.SetEnabled(true);
            }
            bGoingUp = bHDR && bHDR != bHDRD;
            // End:0xbc6
            break;
        // End:0xa9f
        case cbDOF:
            bDOF = cbDOF.IsChecked();
            bGoingUp = bDOF && bDOF != bDOFD;
            // End:0xbc6
            break;
        // End:0xae0
        case cbSSAO:
            bSSAO = cbSSAO.IsChecked();
            bGoingUp = bSSAO && bSSAO != bSSAOD;
            // End:0xbc6
            break;
        // End:0xb00
        case sl_SSAOFactor:
            fSSAOFactor = sl_SSAOFactor.GetValue();
            // End:0xbc6
            break;
        // End:0xb41
        case cbGlobalAntiportal:
            bGlobalAntiportal = cbGlobalAntiportal.IsChecked();
            bGoingUp = bGlobalAntiportal && bGlobalAntiportal != bGlobalAntiportalD;
            // End:0xbc6
            break;
        // End:0xb82
        case cbLinkAntiportal:
            bLinkAntiportal = cbLinkAntiportal.IsChecked();
            bGoingUp = bLinkAntiportal && bLinkAntiportal != bLinkAntiportalD;
            // End:0xbc6
            break;
        // End:0xbc3
        case cbHOQ:
            bHOQ = cbHOQ.IsChecked();
            bGoingUp = bHOQ && bHOQ != bHOQD;
            // End:0xbc6
            break;
        // End:0xffff
        default:
            // End:0xbd5
            if(bGoingUp)
            {
                ShowPerformanceWarning();
            }
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
        // End:0xffff
        default:
            return true;
    }
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
    // End:0x14f
    else
    {
        // End:0xb9
        if(int(NewX) < 640 || int(NewY) < 480)
        {
            Controller.GameResolution = NewX $ "x" $ NewY;
        }
        // End:0xca
        else
        {
            Controller.GameResolution = "";
        }
        iColDepthD = iColDepth;
        sResD = sRes;
        // End:0x14f
        if(bFullScreen != bFullScreenD)
        {
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.ViewportManager StartupFullScreen" @ string(bFullScreen));
            bFullScreenD = bFullScreen;
        }
    }
    CheckSliders();
    bIgnoreResNotice = false;
}

function int GetDetailIndex(string DetailString)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < 9)
    {
        // End:0x2e
        if(DetailString == DetailLevels[i])
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

final function string GetGUIString(string ConfigString)
{
    switch(ConfigString)
    {
        // End:0x1c
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
        // End:0x7c
        case "Higher":
            return DetailLevels[5];
        // End:0x8e
        case "High":
            return DetailLevels[6];
        // End:0xa4
        case "VeryHigh":
            return DetailLevels[7];
        // End:0xbb
        case "UltraHigh":
            return DetailLevels[8];
        // End:0xffff
        default:
            return "";
    }
}

final function string GetConfigString(string DetailString)
{
    switch(DetailString)
    {
        // End:0x1c
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
        // End:0x7c
        case DetailLevels[5]:
            return "Higher";
        // End:0x8e
        case DetailLevels[6]:
            return "High";
        // End:0xa4
        case DetailLevels[7]:
            return "VeryHigh";
        // End:0xbb
        case DetailLevels[8]:
            return "UltraHigh";
        // End:0xffff
        default:
            return "";
    }
}

final function GetComboOptions(moComboBox Combo, out array<GUIListElem> AR)
{
    local int i;
    local string TempStr;

    AR.Remove(0, AR.Length);
    // End:0x1a
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
            // End:0x94 [While If]
            if(i < 9)
            {
                // End:0x5e
                if(bDemo && i == 5)
                {
                }
                // End:0x94
                else
                {
                    AR.Length = AR.Length + 1;
                    AR[i].Item = DetailLevels[i];
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x38;
                }
            }
            // End:0x530
            break;
        // End:0x9f
        case co_Physics:
        // End:0xa7
        case co_World:
        // End:0xfb
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
        // End:0x1a8
        case co_Resolution:
            AR.Length = 17;
            i = 0;
            J0x14f:
            // End:0x1a5 [While If]
            if(i < AR.Length)
            {
                AR[i].Item = string(DisplayModes[i].width) $ "x" $ string(DisplayModes[i].Height);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x14f;
            }
            // End:0x530
            break;
        // End:0x3a8
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
            // End:0x3a5
            else
            {
                // End:0x2a4
                if(PlatformIsMacOS())
                {
                    AR.Length = 1;
                    AR[0].Item = "OpenGL";
                    AR[0].ExtraStrData = "OpenGLDrv.OpenGLRenderDevice";
                }
                // End:0x3a5
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
                    // End:0x3a5
                    else
                    {
                        AR.Length = 2;
                        i = 0;
                        J0x357:
                        // End:0x3a5 [While If]
                        if(i < 2)
                        {
                            AR[i].Item = RenderModeText[i];
                            AR[i].ExtraStrData = RenderMode[i];
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x357;
                        }
                    }
                }
            }
            // End:0x530
            break;
        // End:0x4c3
        case co_Shadows:
            TempStr = GetNativeClassName("Engine.Engine.RenderDevice");
            // End:0x48f
            if(TempStr == "OpenGLDrv.OpenGLRenderDevice" || TempStr == "D3DDrv.D3DRenderDevice" || TempStr == "D3D9Drv.D3D9RenderDevice")
            {
                AR.Length = 3;
                i = 0;
                J0x45a:
                // End:0x48c [While If]
                if(i < 3)
                {
                    AR[i].Item = ShadowOptions[i];
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x45a;
                }
            }
            // End:0x4c0
            else
            {
                AR.Length = 2;
                AR[0].Item = ShadowOptions[0];
                AR[1].Item = ShadowOptions[1];
            }
            // End:0x530
            break;
        // End:0x52d
        case co_MeshLOD:
            AR.Length = 4;
            AR[0].Item = DetailLevels[3];
            AR[1].Item = DetailLevels[4];
            AR[2].Item = DetailLevels[5];
            AR[3].Item = DetailLevels[8];
            // End:0x530
            break;
        // End:0xffff
        default:
}

function UpdateDecalStay()
{
    // End:0x20
    if(ch_Decals.IsChecked())
    {
        EnableComponent(co_Decal);
    }
    // End:0x2b
    else
    {
        DisableComponent(co_Decal);
    }
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
    begin object name=sbSection1 class=GUISectionBackground
        Caption="???"
        WinTop=0.0127610
        WinLeft=0.0009480
        WinWidth=0.4918490
        WinHeight=0.4407290
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_DetailSettings.sbSection1'
    sb_Section1=sbSection1
    begin object name=sbSection2 class=GUISectionBackground
        Caption="??"
        WinTop=0.0127610
        WinLeft=0.4958260
        WinWidth=0.5027510
        WinHeight=0.9752280
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_DetailSettings.sbSection2'
    sb_Section2=sbSection2
    begin object name=sbSection3 class=GUISectionBackground
        bFillClient=true
        Caption="?? ???"
        WinTop=0.4760610
        WinLeft=0.0111320
        WinWidth=0.4628910
        WinHeight=0.5112610
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_DetailSettings.sbSection3'
    sb_Section3=sbSection3
    begin object name=GammaBar class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.4500010
        WinLeft=0.0134770
        WinWidth=0.456250
        WinHeight=0.5321170
        OnChange=InternalOnChange
    object end
    // Reference: GUIImage'UT2K4Tab_DetailSettings.GammaBar'
    i_GammaBar=GammaBar
    begin object name=DetailTextureDetail class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="???? ??? ???? ??? ?? ?????."
        WinTop=0.0630210
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=7
        bVisible=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailTextureDetail'
    co_Texture=DetailTextureDetail
    begin object name=DetailCharacterDetail class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="??? ???? ??? ???? ????? ?????."
        WinTop=0.1166670
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=8
        bVisible=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailCharacterDetail'
    co_Char=DetailCharacterDetail
    begin object name=DetailWorldDetail class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="???? ? ??(geometry)? ??(effects)? ????? ??? ?????."
        WinTop=0.1703120
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailWorldDetail'
    co_World=DetailWorldDetail
    begin object name=DetailPhysics class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="??(Physics) ?????? ???? ??? ?????."
        WinTop=0.2239580
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailPhysics'
    co_Physics=DetailPhysics
    begin object name=DetailDecalStay class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Normal"
        Hint="??? ??(Decals)? ??? ?? ????? ?????."
        WinTop=0.2820320
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=12
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailDecalStay'
    co_Decal=DetailDecalStay
    begin object name=MeshLOD class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="???? ?? LOD"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ???? ??? ?? ?? ??? ??? ? ????. ???? ?? ?? ?? ???? ???? ?????. ??? ??? ?? ????? ??? ??? ? ????."
        WinTop=0.2239580
        WinLeft=0.550
        WinWidth=0.40
        TabOrder=11
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.MeshLOD'
    co_MeshLOD=MeshLOD
    begin object name=VideoResolution class=moComboBox
        bReadOnly=true
        CaptionWidth=0.550
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        IniDefault="640x480"
        Hint="??? ???? ?????."
        WinTop=0.0604170
        WinLeft=0.0305080
        WinWidth=0.390
        TabOrder=1
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.VideoResolution'
    co_Resolution=VideoResolution
    begin object name=VideoColorDepth class=moComboBox
        CaptionWidth=0.550
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="false"
        Hint="??? ???? ?? ?? ?? ?????."
        WinTop=0.1171880
        WinLeft=0.0302340
        WinWidth=0.390
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.VideoColorDepth'
    co_ColorDepth=VideoColorDepth
    begin object name=RenderDeviceCombo class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.550
        Caption="?? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? ????? ??? ?? ? ?? ????? ??? ?? ????."
        WinTop=0.3350210
        WinLeft=0.5477730
        WinWidth=0.4019530
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.RenderDeviceCombo'
    co_RenderDevice=RenderDeviceCombo
    begin object name=DetailCharacterShadows class=moComboBox
        ComponentJustification=0
        CaptionWidth=0.650
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ?????."
        WinTop=0.4313780
        WinLeft=0.60
        WinWidth=0.30
        TabOrder=13
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_DetailSettings.DetailCharacterShadows'
    co_Shadows=DetailCharacterShadows
    begin object name=DetailDecals class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ?? ??(Decals) ??"
        WinTop=0.4793080
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=14
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailDecals'
    ch_Decals=DetailDecals
    begin object name=DetailDynamicLighting class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="???? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="???? ???(Dynamic Lighting) ??."
        WinTop=0.5267160
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=15
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailDynamicLighting'
    ch_DynLight=DetailDynamicLighting
    begin object name=DetailCoronas class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="???(corona)??? ?????."
        WinTop=0.6241360
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=17
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailCoronas'
    ch_Coronas=DetailCoronas
    begin object name=DetailDetailTextures class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ??? ??(detail textures) ??? ??."
        WinTop=0.5754250
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=16
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailDetailTextures'
    ch_Textures=DetailDetailTextures
    begin object name=DetailProjectors class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="????(projectors) ??."
        WinTop=0.7211950
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=19
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailProjectors'
    ch_Projectors=DetailProjectors
    begin object name=DetailDecoLayers class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ? ? ??(Foliage) ??."
        WinTop=0.7699060
        WinLeft=0.5997270
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=20
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailDecoLayers'
    ch_DecoLayers=DetailDecoLayers
    begin object name=DetailTrilinear class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="?????? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?????? ???(Trilinear Filtering)? ??, ?? ??? PC? ?? ??."
        WinTop=0.6732630
        WinLeft=0.60
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=18
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.DetailTrilinear'
    ch_Trilinear=DetailTrilinear
    begin object name=VideoFullScreen class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ? ????? ?????."
        WinTop=0.1695310
        WinLeft=0.0309760
        WinWidth=0.38750
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.VideoFullScreen'
    ch_FullScreen=VideoFullScreen
    begin object name=WeatherEffects class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?? ??? ?? ????? ?????. "
        WinTop=0.864910
        WinLeft=0.5997270
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=21
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.WeatherEffects'
    ch_Weather=WeatherEffects
    begin object name=mDOF class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="DOF"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables DepthOfField"
        WinTop=0.0630210
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mDOF'
    cbDOF=mDOF
    begin object name=mSSAO class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="SSAO"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Screen-Space Ambient Occlusion"
        WinTop=0.1166670
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mSSAO'
    cbSSAO=mSSAO
    begin object name=mHDR class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="HDR"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables High Dynamic Range"
        WinTop=0.0630210
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mHDR'
    cbHDR=mHDR
    begin object name=mShader class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="Shader"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Shader"
        WinTop=0.0630210
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mShader'
    cbShader=mShader
    begin object name=mGlobalAntiportal class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="Global Antiportal"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Global Antiportal"
        WinTop=0.1166670
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mGlobalAntiportal'
    cbGlobalAntiportal=mGlobalAntiportal
    begin object name=mLinkAntiportal class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="Link Antiportal"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Link Antiportal"
        WinTop=0.1166670
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mLinkAntiportal'
    cbLinkAntiportal=mLinkAntiportal
    begin object name=mHOQ class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="HOQ"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Enables Hardware Occlusion Query"
        WinTop=0.1166670
        WinLeft=0.550
        WinWidth=0.40
        WinHeight=0.040
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_DetailSettings.mHOQ'
    cbHOQ=mHOQ
    begin object name=GammaSlider class=moSlider
        MaxValue=2.50
        MinValue=0.50
        SliderCaptionStyleName=""
        CaptionWidth=0.550
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="????? ???? ??(Gamma)?? ???? ???? ?????."
        WinTop=0.2729180
        WinLeft=0.0125010
        WinWidth=0.4611330
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_DetailSettings.GammaSlider'
    sl_Gamma=GammaSlider
    begin object name=BrightnessSlider class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName=""
        CaptionWidth=0.550
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="???? ??? ??(Brightness)? ?????."
        WinTop=0.2299510
        WinLeft=0.0121880
        WinWidth=0.4614450
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_DetailSettings.BrightnessSlider'
    sl_Brightness=BrightnessSlider
    begin object name=ContrastSlider class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName=""
        CaptionWidth=0.550
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.8"
        Hint="???? ??? ?????(Contrast)? ?????."
        WinTop=0.3132850
        WinLeft=0.0121880
        WinWidth=0.4611330
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_DetailSettings.ContrastSlider'
    sl_Contrast=ContrastSlider
    begin object name=DistanceLODSlider class=moSlider
        MaxValue=1.0
        Value=0.50
        SliderCaptionStyleName=""
        CaptionWidth=0.650
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??? ??? ????? ???. ??? ??? ?? ????? ??? ??? ? ????."
        WinTop=0.910
        WinLeft=0.560
        WinWidth=0.40
        TabOrder=22
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_DetailSettings.DistanceLODSlider'
    sl_DistanceLOD=DistanceLODSlider
    begin object name=SSAOFactorSlider class=moSlider
        MaxValue=1.0
        Value=0.50
        SliderCaptionStyleName=""
        CaptionWidth=0.650
        Caption="SSAO Factor"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        WinLeft=0.560
        WinWidth=0.40
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_DetailSettings.SSAOFactorSlider'
    sl_SSAOFactor=SSAOFactorSlider
    RelaunchQuestion="??? ??? ??? ???? ??????. ??? ??? ??? ? ?????. ?? ?? ?????????"
    InvalidSelectionText="??? ???? ? ???? ???? ????. ???? ???????"
    bExpert=true
    PanelCaption="?????"
    WinTop=0.150
    WinHeight=0.740
    OnPreDraw=InternalOnPreDraw
}