/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionGraphicAdvanceHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *	Functions:30
 *
 *******************************************************************************/
class BTTPOptionGraphicAdvanceHK extends BTTPOptionBaseHK
    dependson(BTTPOptionTextureQuality)
    dependson(BTTPOptionBGQuality)
    dependson(BTTPOptionLOD)
    dependson(BTTPOptionOnOffButton)
    editinlinenew
    instanced;

struct OptionGraphicAdvanceInfo
{
    var int TextureQuality;
    var int BackgroundQuality;
    var int LOD;
    var int CharacterShadow;
    var bool bVSync;
    var bool bShader;
    var bool bShadows;
    var bool bReflectionMap;
    var bool bHDR;
    var bool bDOF;
    var bool bGlow;
    var bool bDynamicLighting;
    var bool bCorona;
    var bool bBlood;
    var bool bDecal;
    var int DecalStayScale;
    var int PhysicEffect;
    var bool bRagDoll;
    var int Antialiasing;
    var int LevelOfAnisotropy;
};

var bool bSupportPS30;
var bool bSupportR32;
var bool bSupportMRT;
var bool bSupportHWShadowMap;
var bool bShowAAWarning;
var localized string strAntiAliasing[4];
var localized string strLow;
var localized string strHigh;
var localized string strLabel[16];
var localized string strAnisortropy;
var OptionGraphicAdvanceInfo InitInfo;
var OptionGraphicAdvanceInfo CurrentInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify OptionGraphicAdvanceInfo PredefineAdvanceSettings[5];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    Label.Length = 15;
    Content.Length = 15;
    InternalPadding.Length = 15;
    i = 0;
    J0x32:
    // End:0x62 [While If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y2 = 9.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
    InternalPadding[4].Y2 = 3.0;
    InternalPadding[5].Y2 = 3.0;
    bSupportPS30 = bool(PlayerOwner().ConsoleCommand("SUPPORTEDPS30"));
    bSupportR32 = bool(PlayerOwner().ConsoleCommand("SUPPORTEDR32"));
    bSupportMRT = bool(PlayerOwner().ConsoleCommand("SUPPORTEDMRT"));
    bSupportHWShadowMap = bool(PlayerOwner().ConsoleCommand("SUPPORTEDHWSHADOWMAP"));
    InitializeLabel();
    InitializeContent();
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
}

function InitData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    InitInfo = class'BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    // End:0x80
    if(bSupportPS30 == false)
    {
        InitInfo.bShader = false;
        InitInfo.bReflectionMap = false;
        InitInfo.bDynamicLighting = false;
        InitInfo.bDOF = false;
        InitInfo.bGlow = false;
        InitInfo.bShadows = false;
    }
    // End:0xbf
    else
    {
        // End:0xa6
        if(bSupportMRT == false)
        {
            InitInfo.bDOF = false;
            InitInfo.bGlow = false;
        }
        // End:0xbf
        if(bSupportHWShadowMap == false)
        {
            InitInfo.bShadows = false;
        }
    }
    CurrentInfo = InitInfo;
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
}

function SaveData()
{
    local PlayerController PC;
    local wMatchMaker MM;
    local bool bRoomOwner;

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
    // End:0x11f
    if(class'BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, CurrentInfo, InitInfo, bRoomOwner))
    {
        // End:0xe6
        if(!bRoomOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient GraphicQuality 5");
        }
        PC.ConsoleCommand("SETCONFIG_INT Graphics GraphicQuality 5");
    }
}

static function OptionGraphicAdvanceInfo GetAdvanceSettings(PlayerController PC)
{
    local int tT;
    local bool b1, b2;
    local OptionGraphicAdvanceInfo InitInfo;

    switch(PC.ConsoleCommand("GETCONFIG_STRING Graphics TextureDetailWorld"))
    {
        // End:0x56
        case "UltraLow":
            tT = 0;
            // End:0xbd
            break;
        // End:0x68
        case "Low":
            tT = 1;
            // End:0xbd
            break;
        // End:0x7d
        case "Lower":
            tT = 2;
            // End:0xbd
            break;
        // End:0x96
        case "UltraHigh":
            tT = 3;
            // End:0xbd
            break;
        // End:0xaf
        case "UltraHigh":
            tT = 3;
            // End:0xbd
            break;
        // End:0xffff
        default:
            tT = 2;
            // End:0xbd Break;
            break;
    }
    InitInfo.TextureQuality = tT;
    b1 = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics HighDetailActors"));
    b2 = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics SuperHighDetailActors"));
    // End:0x17f
    if(b1 == false && b2 == false)
    {
        InitInfo.BackgroundQuality = 0;
    }
    // End:0x1b5
    else
    {
        // End:0x1a8
        if(b1 == true && b2 == false)
        {
            InitInfo.BackgroundQuality = 1;
        }
        // End:0x1b5
        else
        {
            InitInfo.BackgroundQuality = 2;
        }
    }
    InitInfo.LOD = int(PC.ConsoleCommand("GETCONFIG_INT Graphics MeshLODDetailLevel"));
    InitInfo.bVSync = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics UseVSync"));
    InitInfo.CharacterShadow = int(PC.ConsoleCommand("GETCONFIG_INT Graphics ShadowType"));
    InitInfo.bShader = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics Shader"));
    InitInfo.bReflectionMap = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics SpecularMap"));
    InitInfo.bShadows = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics Shadows"));
    InitInfo.bDOF = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics DOF"));
    InitInfo.bGlow = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics Glow"));
    InitInfo.bDynamicLighting = !bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics NoDynamicLights"));
    InitInfo.bCorona = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics Coronas"));
    InitInfo.bDecal = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics Decals"));
    InitInfo.DecalStayScale = int(PC.ConsoleCommand("GETCONFIG_INT Graphics DecalStayScale"));
    InitInfo.PhysicEffect = int(PC.ConsoleCommand("GETCONFIG_INT Graphics PhysicsDetailLevel"));
    InitInfo.bRagDoll = false;
    InitInfo.Antialiasing = int(PC.ConsoleCommand("GETCONFIG_INT Graphics Antialiasing"));
    InitInfo.LevelOfAnisotropy = int(PC.ConsoleCommand("GETCONFIG_INT Graphics LevelOfAnisotropy"));
    Log("LevelOfAnisotropy :" @ string(InitInfo.LevelOfAnisotropy));
    return InitInfo;
}

static function bool SetAdvanceSettings(PlayerController PC, OptionGraphicAdvanceInfo CurrentInfo, OptionGraphicAdvanceInfo InitInfo, optional bool bIsOwner, optional bool bForceSettings)
{
    local bool bNeedReload, bChange;
    local string V, strFullScreen, CurrentRes;

    // End:0x153
    if(bForceSettings || InitInfo.TextureQuality != CurrentInfo.TextureQuality)
    {
        switch(CurrentInfo.TextureQuality)
        {
            // End:0x47
            case 0:
                V = "UltraLow";
                // End:0xb3
                break;
            // End:0x59
            case 1:
                V = "Low";
                // End:0xb3
                break;
            // End:0x6e
            case 2:
                V = "Lower";
                // End:0xb3
                break;
            // End:0x87
            case 3:
                V = "UltraHigh";
                // End:0xb3
                break;
            // End:0xa0
            case 4:
                V = "UltraHigh";
                // End:0xb3
                break;
            // End:0xffff
            default:
                V = "Lower";
                // End:0xb3 Break;
                break;
        }
        // End:0x106
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient TextureDetailWorld" @ V);
        }
        PC.ConsoleCommand("SETCONFIG_STRING Graphics TextureDetailWorld" @ V);
        bChange = true;
    }
    // End:0x561
    if(bForceSettings || InitInfo.BackgroundQuality != CurrentInfo.BackgroundQuality)
    {
        switch(CurrentInfo.BackgroundQuality)
        {
            // End:0x2cb
            case 0:
                // End:0x243
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors False");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors False");
                    PC.Level.DetailChange(0);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors False");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors False");
                // End:0x559
                break;
            // End:0x411
            case 1:
                // End:0x38a
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors True");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors False");
                    PC.Level.DetailChange(1);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors True");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors False");
                // End:0x559
                break;
            // End:0x556
            case 2:
                // End:0x4d0
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors True");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors True");
                    PC.Level.DetailChange(2);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors True");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors True");
                // End:0x559
                break;
            // End:0xffff
            default:
                bChange = true;
            }
            // End:0x786
            if(bForceSettings || InitInfo.LOD != CurrentInfo.LOD)
            {
                switch(CurrentInfo.LOD)
                {
                    // End:0x60b
                    case 0:
                        // End:0x5cb
                        if(!bIsOwner)
                        {
                            class'LevelInfo'.default.MeshLODDetailLevel = 0;
                            PC.Level.MeshLODDetailLevel = 0;
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 0");
                        // End:0x77e
                        break;
                    // End:0x685
                    case 1:
                        // End:0x645
                        if(!bIsOwner)
                        {
                            class'LevelInfo'.default.MeshLODDetailLevel = 1;
                            PC.Level.MeshLODDetailLevel = 1;
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 1");
                        // End:0x77e
                        break;
                    // End:0x700
                    case 2:
                        // End:0x6c0
                        if(!bIsOwner)
                        {
                            class'LevelInfo'.default.MeshLODDetailLevel = 2;
                            PC.Level.MeshLODDetailLevel = 2;
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 2");
                        // End:0x77e
                        break;
                    // End:0x77b
                    case 3:
                        // End:0x73b
                        if(!bIsOwner)
                        {
                            class'LevelInfo'.default.MeshLODDetailLevel = 3;
                            PC.Level.MeshLODDetailLevel = 3;
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 3");
                        // End:0x77e
                        break;
                    // End:0xffff
                    default:
                        bChange = true;
                    }
                    // End:0x856
                    if(bForceSettings || InitInfo.CharacterShadow != CurrentInfo.CharacterShadow)
                    {
                        PC.ConsoleCommand("SETCONFIG_INT Graphics ShadowType" @ string(CurrentInfo.CharacterShadow));
                        // End:0x84e
                        if(!bIsOwner && PC.Pawn != none && wPawn(PC.Pawn) != none)
                        {
                            wPawn(PC.Pawn).iShadowType = CurrentInfo.CharacterShadow;
                        }
                        bChange = true;
                    }
                    // End:0x9ba
                    if(bForceSettings || InitInfo.bVSync != CurrentInfo.bVSync)
                    {
                        // End:0x8d1
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice UseVSync" @ string(CurrentInfo.bVSync));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics UseVSync" @ string(CurrentInfo.bVSync));
                        // End:0x9b2
                        if(!bForceSettings && !bIsOwner)
                        {
                            CurrentRes = PC.ConsoleCommand("GETCURRENTRES");
                            // End:0x97c
                            if(bool(PC.ConsoleCommand("ISFULLSCREEN")))
                            {
                                strFullScreen = "f";
                            }
                            // End:0x985
                            else
                            {
                                strFullScreen = "w";
                            }
                            PC.ConsoleCommand("setres" @ CurrentRes $ "x32" $ strFullScreen);
                        }
                        bChange = true;
                    }
                    // End:0xa7d
                    if(bForceSettings || InitInfo.Antialiasing != CurrentInfo.Antialiasing)
                    {
                        // End:0xa32
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Antialiasing" @ string(CurrentInfo.Antialiasing));
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics Antialiasing" @ string(CurrentInfo.Antialiasing));
                        bChange = true;
                    }
                    // End:0xb80
                    if(bForceSettings || InitInfo.LevelOfAnisotropy != CurrentInfo.LevelOfAnisotropy)
                    {
                        // End:0xb30
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice LevelOfAnisotropy" @ string(CurrentInfo.LevelOfAnisotropy));
                            PC.ConsoleCommand("SETANISOTROPY MAX=" $ string(CurrentInfo.LevelOfAnisotropy));
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics LevelOfAnisotropy" @ string(CurrentInfo.LevelOfAnisotropy));
                        bChange = true;
                    }
                    // End:0xc96
                    if(bForceSettings || InitInfo.bShader != CurrentInfo.bShader)
                    {
                        // End:0xbf5
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Shader" @ string(CurrentInfo.bShader));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Shader" @ string(CurrentInfo.bShader));
                        bNeedReload = true;
                        bChange = true;
                        // End:0xc96
                        if(CurrentInfo.bShader == false)
                        {
                            CurrentInfo.bReflectionMap = false;
                            CurrentInfo.bDOF = false;
                            CurrentInfo.bGlow = false;
                            CurrentInfo.bDynamicLighting = false;
                            CurrentInfo.bShadows = false;
                        }
                    }
                    // End:0xd5c
                    if(bForceSettings || InitInfo.bReflectionMap != CurrentInfo.bReflectionMap)
                    {
                        // End:0xd10
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient SpecularMap" @ string(CurrentInfo.bReflectionMap));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics SpecularMap" @ string(CurrentInfo.bReflectionMap));
                        bChange = true;
                    }
                    // End:0xe1a
                    if(bForceSettings || InitInfo.bShadows != CurrentInfo.bShadows)
                    {
                        // End:0xdd2
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Shadows" @ string(CurrentInfo.bShadows));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Shadows" @ string(CurrentInfo.bShadows));
                        bChange = true;
                    }
                    // End:0xed0
                    if(bForceSettings || InitInfo.bDOF != CurrentInfo.bDOF)
                    {
                        // End:0xe8c
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient DOF" @ string(CurrentInfo.bDOF));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics DOF" @ string(CurrentInfo.bDOF));
                        bChange = true;
                    }
                    // End:0xf88
                    if(bForceSettings || InitInfo.bGlow != CurrentInfo.bGlow)
                    {
                        // End:0xf43
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Glow" @ string(CurrentInfo.bGlow));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Glow" @ string(CurrentInfo.bGlow));
                        bChange = true;
                    }
                    // End:0x105a
                    if(bForceSettings || InitInfo.bDynamicLighting != CurrentInfo.bDynamicLighting)
                    {
                        // End:0x1008
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient NoDynamicLights" @ string(!CurrentInfo.bDynamicLighting));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics NoDynamicLights" @ string(!CurrentInfo.bDynamicLighting));
                        bChange = true;
                    }
                    // End:0x1118
                    if(bForceSettings || InitInfo.bCorona != CurrentInfo.bCorona)
                    {
                        // End:0x10d0
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Coronas" @ string(CurrentInfo.bCorona));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Coronas" @ string(CurrentInfo.bCorona));
                        bChange = true;
                    }
                    // End:0x11d4
                    if(bForceSettings || InitInfo.bDecal != CurrentInfo.bDecal)
                    {
                        // End:0x118d
                        if(!bIsOwner)
                        {
                            PC.ConsoleCommand("setdata WinDrv.WindowsClient Decals" @ string(CurrentInfo.bDecal));
                        }
                        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Decals" @ string(CurrentInfo.bDecal));
                        bChange = true;
                    }
                    // End:0x128f
                    if(bForceSettings || InitInfo.DecalStayScale != CurrentInfo.DecalStayScale)
                    {
                        // End:0x1242
                        if(!bIsOwner)
                        {
                            PC.Level.DecalStayScale = float(CurrentInfo.DecalStayScale);
                            class'LevelInfo'.default.DecalStayScale = float(CurrentInfo.DecalStayScale);
                        }
                        PC.ConsoleCommand("SETCONFIG_INT Graphics DecalStayScale" @ string(CurrentInfo.DecalStayScale));
                        bChange = true;
                    }
                    // End:0x1439
                    if(bForceSettings || InitInfo.PhysicEffect != CurrentInfo.PhysicEffect)
                    {
                        switch(CurrentInfo.PhysicEffect)
                        {
                            // End:0x1339
                            case 0:
                                // End:0x12f9
                                if(!bIsOwner)
                                {
                                    class'LevelInfo'.default.PhysicsDetailLevel = 0;
                                    PC.Level.PhysicsDetailLevel = 0;
                                }
                                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 0");
                                // End:0x1431
                                break;
                            // End:0x13b3
                            case 1:
                                // End:0x1373
                                if(!bIsOwner)
                                {
                                    class'LevelInfo'.default.PhysicsDetailLevel = 1;
                                    PC.Level.PhysicsDetailLevel = 1;
                                }
                                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 1");
                                // End:0x1431
                                break;
                            // End:0x142e
                            case 2:
                                // End:0x13ee
                                if(!bIsOwner)
                                {
                                    class'LevelInfo'.default.PhysicsDetailLevel = 2;
                                    PC.Level.PhysicsDetailLevel = 2;
                                }
                                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 2");
                                // End:0x1431
                                break;
                            // End:0xffff
                            default:
                                bChange = true;
                            }
                            // End:0x1510
                            if(!bIsOwner && bChange)
                            {
                                Log("### Graphics Flush ###");
                                PC.ConsoleCommand("flush");
                                // End:0x14a9
                                if(PC.Level != none)
                                {
                                    PC.Level.SaveConfig();
                                }
                                class'LevelInfo'.static.StaticSaveConfig();
                                // End:0x1501
                                if(PC.Pawn != none && UnrealPawn(PC.Pawn) != none)
                                {
                                    UnrealPawn(PC.Pawn).SaveConfig();
                                }
                                class'UnrealPawn'.static.StaticSaveConfig();
                            }
                            // End:0x1554
                            if(!bIsOwner && bNeedReload && !bForceSettings)
                            {
                                PC.ConsoleCommand("RELOADRESOURCES");
                            }
                            PC.ResetKeySleepTime();
                            return bChange;
}

static function OptionGraphicAdvanceInfo GetPredefineAdvanceSettings(PlayerController PC, int Index)
{
    local int LOAnisotropy;
    local OptionGraphicAdvanceInfo Info;

    Info = default.PredefineAdvanceSettings[Index];
    // End:0xfb
    if(Info.bShader)
    {
        LOAnisotropy = 0;
        // End:0xeb
        if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=2")))
        {
            LOAnisotropy = 2;
            // End:0xeb
            if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=4")))
            {
                LOAnisotropy = 4;
                // End:0xeb
                if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=8")))
                {
                    LOAnisotropy = 8;
                    // End:0xeb
                    if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=16")))
                    {
                        LOAnisotropy = 16;
                    }
                }
            }
        }
        Info.LevelOfAnisotropy = LOAnisotropy;
    }
    return Info;
}

static function OptionGraphicAdvanceInfo GetDefaultTestAdvanceSettings(PlayerController PC)
{
    local OptionGraphicAdvanceInfo Info;
    local bool b1, b2;

    Info.bDecal = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION DECALS"));
    Info.bCorona = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION CORONAS"));
    Info.bDynamicLighting = !bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION NODYNAMICLIGHTS"));
    Info.bDOF = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION DOF"));
    Info.bReflectionMap = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION SPECULARMAP"));
    Info.bGlow = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION GLOW"));
    b1 = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION HIGHDETAILACTORS"));
    b2 = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION SUPERHIGHDETAILACTORS"));
    // End:0x214
    if(b1 == false && b2 == false)
    {
        Info.BackgroundQuality = 0;
    }
    // End:0x24a
    else
    {
        // End:0x23d
        if(b1 == true && b2 == false)
        {
            Info.BackgroundQuality = 1;
        }
        // End:0x24a
        else
        {
            Info.BackgroundQuality = 2;
        }
    }
    Info.LevelOfAnisotropy = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION LEVELOFANISOTROPY"));
    Info.LOD = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION MESHLODDETAILLEVEL"));
    Info.TextureQuality = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION TEXTUREDETAILWORLD"));
    Info.TextureQuality = Clamp(4 - Info.TextureQuality, 0, 3);
    Info.bShader = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION SHADER"));
    Info.CharacterShadow = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION SHADOWTYPE"));
    Info.bShadows = bool(PC.ConsoleCommand("GETTEMPGRAPHICOPTION SHADOWS"));
    Info.Antialiasing = 0;
    Info.bBlood = false;
    Info.bHDR = false;
    Info.bRagDoll = false;
    Info.PhysicEffect = 0;
    Info.bVSync = false;
    Info.DecalStayScale = 2;
    return Info;
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Log("####  Option Graphic Advance - Load - ####");
    BTTPOptionTextureQuality(Content[0]).TextureQualityGroup.SelectButton(CurrentInfo.TextureQuality);
    BTTPOptionTextureQuality(Content[0]).ChangeButtonImage();
    BTTPOptionBGQuality(Content[1]).BGQualityGroup.SelectButton(CurrentInfo.BackgroundQuality);
    BTTPOptionBGQuality(Content[1]).ChangeButtonImage();
    BTTPOptionLOD(Content[2]).LODGroup.SelectButton(CurrentInfo.LOD);
    BTTPOptionLOD(Content[2]).ChangeButtonImage();
    BTTPOptionOnOffButton(Content[3]).BTGroup.SelectButton(int(CurrentInfo.bVSync));
    BTTPOptionOnOffButton(Content[3]).ChangeButtonImage();
    BTTPOptionRadioButtonHK(Content[8]).ButtonRadio.SetData(CurrentInfo.bShadows);
    Content8_OnSelect(CurrentInfo.bShadows);
    // End:0x21c
    if(bSupportPS30)
    {
        BTTPOptionRadioButtonHK(Content[6]).ButtonRadio.SetData(CurrentInfo.bShader);
        Content6_OnSelect(CurrentInfo.bShader);
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.SetData(CurrentInfo.bReflectionMap);
        Content7_OnSelect(CurrentInfo.bReflectionMap);
        // End:0x219
        if(!bSupportHWShadowMap)
        {
            BTTPOptionRadioButtonHK(Content[8]).DisableMe();
        }
    }
    // End:0x261
    else
    {
        BTTPOptionRadioButtonHK(Content[6]).DisableMe();
        BTTPOptionRadioButtonHK(Content[7]).DisableMe();
        BTTPOptionRadioButtonHK(Content[8]).DisableMe();
    }
    // End:0x2f0
    if(bSupportPS30 && bSupportMRT)
    {
        BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.SetData(CurrentInfo.bDOF);
        Content9_OnSelect(CurrentInfo.bDOF);
        BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.SetData(CurrentInfo.bGlow);
        Content10_OnSelect(CurrentInfo.bGlow);
    }
    // End:0x31e
    else
    {
        BTTPOptionRadioButtonHK(Content[9]).DisableMe();
        BTTPOptionRadioButtonHK(Content[10]).DisableMe();
    }
    // End:0x366
    if(bSupportPS30)
    {
        BTTPOptionRadioButtonHK(Content[11]).ButtonRadio.SetData(CurrentInfo.bDynamicLighting);
        Content11_OnSelect(CurrentInfo.bDynamicLighting);
    }
    // End:0x37d
    else
    {
        BTTPOptionRadioButtonHK(Content[11]).DisableMe();
    }
    BTTPOptionRadioButtonHK(Content[12]).ButtonRadio.SetData(CurrentInfo.bCorona);
    Content12_OnSelect(CurrentInfo.bCorona);
    BTTPOptionRadioButtonHK(Content[13]).ButtonRadio.SetData(CurrentInfo.bDecal);
    Content14_OnSelect(CurrentInfo.bDecal);
    BTSliderHK(Content[14]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
    Content15_OnChangeValue(CurrentInfo.DecalStayScale);
    CurrentInfo.Antialiasing = Min(CurrentInfo.Antialiasing, 3);
    BTComboBoxHK(Content[4]).ComboBox.SetIndex(CurrentInfo.Antialiasing);
    switch(CurrentInfo.LevelOfAnisotropy)
    {
        // End:0x4a0
        case 2:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(1);
            // End:0x545
            break;
        // End:0x4ca
        case 4:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(2);
            // End:0x545
            break;
        // End:0x4f4
        case 8:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(3);
            // End:0x545
            break;
        // End:0x51e
        case 16:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(4);
            // End:0x545
            break;
        // End:0xffff
        default:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(0);
            // End:0x545 Break;
            break;
    }
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:
    // End:0xce [While If]
    if(i < Label.Length)
    {
        ro = new class'RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeEmptyBox(), class'BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool Content0_OnChangeValue(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    CurrentInfo.TextureQuality = btn.ButtonID;
    BTTPOptionTextureQuality(Content[0]).TextureQualityGroup.SelectButton(btn.ButtonID);
    BTTPOptionTextureQuality(Content[0]).ChangeButtonImage();
    Log("#00 : GraphicAdvanceHK - TextureQuality - " $ string(CurrentInfo.TextureQuality));
    return true;
}

function bool Content1_OnChangeValue(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    CurrentInfo.BackgroundQuality = btn.ButtonID;
    BTTPOptionBGQuality(Content[1]).BGQualityGroup.SelectButton(btn.ButtonID);
    BTTPOptionBGQuality(Content[1]).ChangeButtonImage();
    Log("#01 : GraphicAdvanceHK - BG Quality - " $ string(CurrentInfo.BackgroundQuality));
    return true;
}

function bool Content2_OnChangeValue(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    CurrentInfo.LOD = btn.ButtonID;
    BTTPOptionLOD(Content[2]).LODGroup.SelectButton(btn.ButtonID);
    BTTPOptionLOD(Content[2]).ChangeButtonImage();
    Log("#02 : GraphicAdvanceHK - LOD - " $ string(CurrentInfo.LOD));
    return true;
}

function bool Content3_OnChangeValue(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    CurrentInfo.bVSync = bool(btn.ButtonID);
    BTTPOptionOnOffButton(Content[3]).BTGroup.SelectButton(btn.ButtonID);
    BTTPOptionOnOffButton(Content[3]).ChangeButtonImage();
    Log("#03 : GraphicAdvanceHK - vSync - " $ string(CurrentInfo.bVSync));
    return true;
}

function Content4_OnChangeValue(GUIComponent Sender)
{
    local int massIndex;
    local PlayerController PC;

    PC = PlayerOwner();
    massIndex = BTComboBoxHK(Content[4]).ComboBox.GetIndex();
    CurrentInfo.Antialiasing = massIndex;
    // End:0xe9
    if(CurrentInfo.bShader)
    {
        Content[9].EnableMe();
        Content[10].EnableMe();
        BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.SetData(CurrentInfo.bDOF);
        Content9_OnSelect(CurrentInfo.bDOF);
        BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.SetData(CurrentInfo.bGlow);
        Content10_OnSelect(CurrentInfo.bGlow);
    }
}

function Content5_OnChangeValue(GUIComponent Sender)
{
    local int anisotropyIndex;

    anisotropyIndex = BTComboBoxHK(Content[5]).ComboBox.GetIndex();
    switch(anisotropyIndex)
    {
        // End:0x40
        case 0:
            CurrentInfo.LevelOfAnisotropy = 1;
            // End:0x96
            break;
        // End:0x54
        case 1:
            CurrentInfo.LevelOfAnisotropy = 2;
            // End:0x96
            break;
        // End:0x69
        case 2:
            CurrentInfo.LevelOfAnisotropy = 4;
            // End:0x96
            break;
        // End:0x7e
        case 3:
            CurrentInfo.LevelOfAnisotropy = 8;
            // End:0x96
            break;
        // End:0x93
        case 4:
            CurrentInfo.LevelOfAnisotropy = 16;
            // End:0x96
            break;
        // End:0xffff
        default:
}

function Content8_OnSelect(bool bOn)
{
    CurrentInfo.bShadows = bOn;
}

function Content6_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bShader = bOn;
    // End:0x15d
    if(CurrentInfo.bShader)
    {
        Content[7].EnableMe();
        Content[11].EnableMe();
        Content[8].EnableMe();
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.SetData(CurrentInfo.bReflectionMap);
        BTTPOptionRadioButtonHK(Content[11]).ButtonRadio.SetData(CurrentInfo.bDynamicLighting);
        BTTPOptionRadioButtonHK(Content[8]).ButtonRadio.SetData(CurrentInfo.bShadows);
        Content[9].EnableMe();
        Content[10].EnableMe();
        BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.SetData(CurrentInfo.bDOF);
        BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.SetData(CurrentInfo.bGlow);
    }
    // End:0x1b7
    else
    {
        Content[7].DisableMe();
        Content[9].DisableMe();
        Content[10].DisableMe();
        Content[11].DisableMe();
        Content[8].DisableMe();
    }
}

function Content7_OnSelect(bool bOn)
{
    CurrentInfo.bReflectionMap = bOn;
}

function Content9_OnSelect(bool bOn)
{
    CurrentInfo.bDOF = bOn;
}

function Content10_OnSelect(bool bOn)
{
    CurrentInfo.bGlow = bOn;
}

function Content11_OnSelect(bool bOn)
{
    CurrentInfo.bDynamicLighting = bOn;
}

function Content12_OnSelect(bool bOn)
{
    CurrentInfo.bCorona = bOn;
}

function Content14_OnSelect(bool bOn)
{
    CurrentInfo.bDecal = bOn;
    // End:0x58
    if(CurrentInfo.bDecal)
    {
        BTSliderHK(Content[14]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
        Content[14].EnableMe();
    }
    // End:0x8d
    else
    {
        BTSliderHK(Content[14]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
        Content[14].DisableMe();
    }
}

function Content15_OnChangeValue(int ChangeValue)
{
    CurrentInfo.DecalStayScale = ChangeValue;
}

function Content16_OnChangeValue(int ChangeValue)
{
    CurrentInfo.PhysicEffect = ChangeValue;
}

function Content17_OnSelect(bool bOn)
{
    CurrentInfo.bRagDoll = bOn;
}

function OnShow_ComboBoxList()
{
    bToolTipVisible = false;
}

function OnHide_ComboBoxList()
{
    bToolTipVisible = true;
}

function InitializeContent()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new class'BTTPOptionTextureQuality', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    i = 0;
    J0x3b:
    // End:0x7b [While If]
    if(i < 4)
    {
        BTTPOptionTextureQuality(Content[0]).TextureQualityButton[i].__OnClick__Delegate = Content0_OnChangeValue;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    Content[1] = NewComponent(new class'BTTPOptionBGQuality', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    i = 0;
    J0xad:
    // End:0xed [While If]
    if(i < 3)
    {
        BTTPOptionBGQuality(Content[1]).BGQualityButton[i].__OnClick__Delegate = Content1_OnChangeValue;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    Content[2] = NewComponent(new class'BTTPOptionLOD', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    i = 0;
    J0x120:
    // End:0x161 [While If]
    if(i < 4)
    {
        BTTPOptionLOD(Content[2]).LODButton[i].__OnClick__Delegate = Content2_OnChangeValue;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x120;
    }
    Content[3] = NewComponent(new class'BTTPOptionOnOffButton', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    i = 0;
    J0x194:
    // End:0x1d5 [While If]
    if(i < 2)
    {
        BTTPOptionOnOffButton(Content[3]).CaptionButton[i].__OnClick__Delegate = Content3_OnChangeValue;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x194;
    }
    Content[8] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[8]).ButtonRadio.__OnSelect__Delegate = Content8_OnSelect;
    Content[4] = NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.80);
    BTComboBoxHK(Content[4]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[4]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    BTComboBoxHK(Content[4]).ComboBox.AddItem(strAntiAliasing[0]);
    BTComboBoxHK(Content[4]).ComboBox.AddItem(strAntiAliasing[1]);
    BTComboBoxHK(Content[4]).ComboBox.AddItem(strAntiAliasing[2]);
    BTComboBoxHK(Content[4]).ComboBox.AddItem(strAntiAliasing[3]);
    BTComboBoxHK(Content[4]).__OnChange__Delegate = Content4_OnChangeValue;
    Content[5] = NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.790);
    BTComboBoxHK(Content[5]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[5]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    BTComboBoxHK(Content[5]).ComboBox.AddItem(strAnisortropy);
    // End:0x52a
    if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=2")))
    {
        BTComboBoxHK(Content[5]).ComboBox.AddItem("2x");
        // End:0x527
        if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=4")))
        {
            BTComboBoxHK(Content[5]).ComboBox.AddItem("4x");
            // End:0x527
            if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=8")))
            {
                BTComboBoxHK(Content[5]).ComboBox.AddItem("8x");
                // End:0x527
                if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=16")))
                {
                    BTComboBoxHK(Content[5]).ComboBox.AddItem("16x");
                }
            }
        }
    }
    // End:0x53c
    else
    {
        Content[5].DisableMe();
    }
    BTComboBoxHK(Content[5]).__OnChange__Delegate = Content5_OnChangeValue;
    Content[6] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[6]).ButtonRadio.__OnSelect__Delegate = Content6_OnSelect;
    Content[7] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.__OnSelect__Delegate = Content7_OnSelect;
    Content[9] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.__OnSelect__Delegate = Content9_OnSelect;
    Content[10] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.__OnSelect__Delegate = Content10_OnSelect;
    Content[11] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[11]).ButtonRadio.__OnSelect__Delegate = Content11_OnSelect;
    Content[12] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[12]).ButtonRadio.__OnSelect__Delegate = Content12_OnSelect;
    Content[13] = NewComponent(new class'BTTPOptionRadioButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPOptionRadioButtonHK(Content[13]).ButtonRadio.__OnSelect__Delegate = Content14_OnSelect;
    Content[14] = NewComponent(new class'BTSliderHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTSliderHK(Content[14]).MinValue = 1.0;
    BTSliderHK(Content[14]).MaxValue = 2.0;
    BTSliderHK(Content[14]).bSmoothSlider = false;
    BTSliderHK(Content[14]).SetData(36, 16);
    BTSliderHK(Content[14]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[14]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[14]).__OnChangeValue__Delegate = Content15_OnChangeValue;
    // End:0x8cf
    if(bSupportPS30 == false)
    {
        Content[6].DisableMe();
        Content[7].DisableMe();
        Content[11].DisableMe();
    }
    // End:0x8fb
    if(bSupportPS30 == false || bSupportHWShadowMap == false)
    {
        Content[8].DisableMe();
    }
    // End:0x939
    if(bSupportPS30 == false || bSupportMRT == false)
    {
        Content[9].DisableMe();
        Content[10].DisableMe();
    }
}

defaultproperties
{
    strAntiAliasing[0]="None"
    strAntiAliasing[1]="Low"
    strAntiAliasing[2]="Normal"
    strAntiAliasing[3]="High"
    strLow="Low"
    strHigh="High"
    strLabel[0]="Texture Quality"
    strLabel[1]="Background"
    strLabel[2]="LOD"
    strLabel[3]="V-Sync"
    strLabel[4]="Anti-Aliasing"
    strLabel[5]="Anisotropic Filter"
    strLabel[6]="Shaders"
    strLabel[7]="Reflection Maps"
    strLabel[8]="Shadows"
    strLabel[9]="Focus Effect"
    strLabel[10]="Glow"
    strLabel[11]="Dynamic Lighting"
    strLabel[12]="Coronas"
    strLabel[13]="Decals"
    strAnisortropy="None"
    PredefineAdvanceSettings[0]=(TextureQuality=0,BackgroundQuality=0,LOD=0,CharacterShadow=0,bVSync=true,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=true,bCorona=true,bBlood=true,bDecal=true,DecalStayScale=1,PhysicEffect=0,bRagDoll=true,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[1]=(TextureQuality=2,BackgroundQuality=0,LOD=1,CharacterShadow=0,bVSync=true,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=true,bCorona=true,bBlood=true,bDecal=true,DecalStayScale=1,PhysicEffect=0,bRagDoll=true,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[2]=(TextureQuality=3,BackgroundQuality=1,LOD=1,CharacterShadow=0,bVSync=true,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=true,bCorona=true,bBlood=true,bDecal=true,DecalStayScale=2,PhysicEffect=0,bRagDoll=true,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[3]=(TextureQuality=3,BackgroundQuality=2,LOD=1,CharacterShadow=0,bVSync=true,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=true,bCorona=true,bBlood=true,bDecal=true,DecalStayScale=2,PhysicEffect=0,bRagDoll=true,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[4]=(TextureQuality=3,BackgroundQuality=1,LOD=1,CharacterShadow=0,bVSync=true,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=true,bCorona=true,bBlood=true,bDecal=true,DecalStayScale=2,PhysicEffect=0,bRagDoll=true,Antialiasing=0,LevelOfAnisotropy=0)
    strTooltip[0]="Set the texture quality of characters and backgrounds. <P> <P>? Highest setting recommended. Frame rate not likely to be impacted on GeForce 6600 GT cards or higher."
    strTooltip[1]="Set the details of background buildings and small objects.<P> <P>? Greatly affects frame rate. Computers with slower CPUs (GHz) and slower GPUs should use lower options."
    strTooltip[2]="Reduces the complexity of distant objects.<P> <P>? Object complexity increases as you move closer. <P>? Greatly affects frame rate. Computers with slower CPUs (GHz) and slower GPUs should use lower options."
    strTooltip[3]="Vertical sync may prevent screen tearing when turning quickly. However, this option may delay graphical response and adversely affect your performance."
    strTooltip[4]="Reduces jagged polygon edges. Higher settings increase the effect. <P> <P>? Anti-aliasing cannot be used with blur or glow effects.<P>? This greatly affects frame rate. Users with lower-end graphics cards may want to disable this."
    strTooltip[5]="Improves clarity of textures on angled surfaces. <P> <P>? Frame rate not likely to be impacted on GeForce 6600 GT cards or higher. A setting of 2x or higher is recommended."
    strTooltip[6]="Increases overall graphics quality.<P> <P>? This is a high-end graphical effect. Only 8600 GT or above graphics cards are recommended."
    strTooltip[7]="Adds light reflections and effects. <P> <P>? Only available with shaders enabled.<P>? This is a high-end graphical effect. Only 9600 GT or above graphics cards are recommended."
    strTooltip[8]="Enables shadows caused by objects and characters. <P> <P>? Option only available with shaders enabled.<P>? This is a high-end graphical effect. Only 9600 GT or above graphics cards are recommended."
    strTooltip[9]="Adds screen effects while aiming.<P> <P>? Option only available with shaders enabled."
    strTooltip[10]="Adds realistic lighting effects on objects.<P> <P>? Option only available with shaders enabled."
    strTooltip[11]="Adds light effects processed in real-time. For example, your surrounding area is lit while firing a gun. <P> <P>? Option only available with shaders enabled."
    strTooltip[12]="Adds effects for lights and sunlight. <P> <P>? Recommended. Frame rate not likely to be impacted on GeForce 6600GT cards or higher."
    strTooltip[14]="Adds bullet holes and scorch marks after explosions.<P> <P>? Not likely to affect frame rate, but players with slower CPUs (GHz) may want to disable this."
    strTooltip[16]="Enables realistic physics processing on objects shot or hit by explosions. <P> <P>? This affects frame rate. Players with slower CPUs (GHz) may want to disable this."
    strTooltip[17]="Applies ragdoll physics to dead bodies for more natural death animations.<P> <P>? Not likely to affect frame rate, but players with slower CPUs (GHz) may want to disable this."
}