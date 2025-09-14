class BTTPOptionGraphicAdvanceHK extends BTTPOptionBaseHK
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
var localized string strAntiAliasingOn;
var localized string strLow;
var localized string strHigh;
var localized string strLabel[18];
var OptionGraphicAdvanceInfo InitInfo;
var OptionGraphicAdvanceInfo CurrentInfo;
var() automated OptionGraphicAdvanceInfo PredefineAdvanceSettings[5];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    Label.Length = 18;
    Content.Length = 18;
    InternalPadding.Length = 18;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 18)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    bSupportPS30 = bool(PlayerOwner().ConsoleCommand("SUPPORTEDPS30"));
    bSupportR32 = bool(PlayerOwner().ConsoleCommand("SUPPORTEDR32"));
    bSupportMRT = bool(PlayerOwner().ConsoleCommand("SUPPORTEDMRT"));
    bSupportHWShadowMap = bool(PlayerOwner().ConsoleCommand("SUPPORTEDHWSHADOWMAP"));
    InitializeLabel();
    InitializeContent();
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
    //return;    
}

function InitData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    InitInfo = Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
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
    else
    {
        // End:0xA6
        if(bSupportMRT == false)
        {
            InitInfo.bDOF = false;
            InitInfo.bGlow = false;
        }
        // End:0xBF
        if(bSupportHWShadowMap == false)
        {
            InitInfo.bShadows = false;
        }
    }
    CurrentInfo = InitInfo;
    //return;    
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
}

function SaveData()
{
    local PlayerController PC;
    local wMatchMaker MM;
    local bool bRoomOwner;

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
    // End:0x11F
    if(Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, CurrentInfo, InitInfo, bRoomOwner))
    {
        // End:0xE6
        if(!bRoomOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient GraphicQuality 5");
        }
        PC.ConsoleCommand("SETCONFIG_INT Graphics GraphicQuality 5");
    }
    //return;    
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
            // End:0xBB
            break;
        // End:0x6C
        case "VeryLow":
            tT = 1;
            // End:0xBB
            break;
        // End:0x7F
        case "Low":
            tT = 2;
            // End:0xBB
            break;
        // End:0x94
        case "Lower":
            tT = 3;
            // End:0xBB
            break;
        // End:0xAD
        case "UltraHigh":
            tT = 4;
            // End:0xBB
            break;
        // End:0xFFFF
        default:
            tT = 3;
            // End:0xBB
            break;
            break;
    }
    InitInfo.TextureQuality = tT;
    b1 = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics HighDetailActors"));
    b2 = bool(PC.ConsoleCommand("GETCONFIG_BOOL Graphics SuperHighDetailActors"));
    // End:0x17D
    if((b1 == false) && b2 == false)
    {
        InitInfo.BackgroundQuality = 0;        
    }
    else
    {
        // End:0x1A6
        if((b1 == true) && b2 == false)
        {
            InitInfo.BackgroundQuality = 1;            
        }
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
    //return;    
}

static function bool SetAdvanceSettings(PlayerController PC, OptionGraphicAdvanceInfo CurrentInfo, OptionGraphicAdvanceInfo InitInfo, optional bool bIsOwner, optional bool bForceSettings)
{
    local bool bNeedReload, bChange;
    local string V, strFullScreen, CurrentRes;

    // End:0x151
    if(bForceSettings || InitInfo.TextureQuality != CurrentInfo.TextureQuality)
    {
        switch(CurrentInfo.TextureQuality)
        {
            // End:0x47
            case 0:
                V = "UltraLow";
                // End:0xB1
                break;
            // End:0x5D
            case 1:
                V = "VeryLow";
                // End:0xB1
                break;
            // End:0x70
            case 2:
                V = "Low";
                // End:0xB1
                break;
            // End:0x85
            case 3:
                V = "Lower";
                // End:0xB1
                break;
            // End:0x9E
            case 4:
                V = "UltraHigh";
                // End:0xB1
                break;
            // End:0xFFFF
            default:
                V = "Lower";
                // End:0xB1
                break;
                break;
        }
        // End:0x104
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient TextureDetailWorld" @ V);
        }
        PC.ConsoleCommand("SETCONFIG_STRING Graphics TextureDetailWorld" @ V);
        bChange = true;
    }
    // End:0x55F
    if(bForceSettings || InitInfo.BackgroundQuality != CurrentInfo.BackgroundQuality)
    {
        switch(CurrentInfo.BackgroundQuality)
        {
            // End:0x2C9
            case 0:
                // End:0x241
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors False");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors False");
                    PC.Level.DetailChange(0);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors False");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors False");
                // End:0x557
                break;
            // End:0x40F
            case 1:
                // End:0x388
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors True");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors False");
                    PC.Level.DetailChange(1);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors True");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors False");
                // End:0x557
                break;
            // End:0x554
            case 2:
                // End:0x4CE
                if(!bIsOwner)
                {
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice HighDetailActors True");
                    PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice SuperHighDetailActors True");
                    PC.Level.DetailChange(2);
                }
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics HighDetailActors True");
                PC.ConsoleCommand("SETCONFIG_BOOL Graphics SuperHighDetailActors True");
                // End:0x557
                break;
            // End:0xFFFF
            default:
                break;
        }
        bChange = true;
    }
    // End:0x784
    if(bForceSettings || InitInfo.LOD != CurrentInfo.LOD)
    {
        switch(CurrentInfo.LOD)
        {
            // End:0x609
            case 0:
                // End:0x5C9
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 0;
                    PC.Level.MeshLODDetailLevel = 0;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 0");
                // End:0x77C
                break;
            // End:0x683
            case 1:
                // End:0x643
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 1;
                    PC.Level.MeshLODDetailLevel = 1;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 1");
                // End:0x77C
                break;
            // End:0x6FE
            case 2:
                // End:0x6BE
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 2;
                    PC.Level.MeshLODDetailLevel = 2;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 2");
                // End:0x77C
                break;
            // End:0x779
            case 3:
                // End:0x739
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.MeshLODDetailLevel = 3;
                    PC.Level.MeshLODDetailLevel = 3;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics MeshLODDetailLevel 3");
                // End:0x77C
                break;
            // End:0xFFFF
            default:
                break;
        }
        bChange = true;
    }
    // End:0x854
    if(bForceSettings || InitInfo.CharacterShadow != CurrentInfo.CharacterShadow)
    {
        PC.ConsoleCommand("SETCONFIG_INT Graphics ShadowType" @ string(CurrentInfo.CharacterShadow));
        // End:0x84C
        if((!bIsOwner && PC.Pawn != none) && wPawn(PC.Pawn) != none)
        {
            wPawn(PC.Pawn).iShadowType = CurrentInfo.CharacterShadow;
        }
        bChange = true;
    }
    // End:0x9B8
    if(bForceSettings || InitInfo.bVSync != CurrentInfo.bVSync)
    {
        // End:0x8CF
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice UseVSync" @ string(CurrentInfo.bVSync));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics UseVSync" @ string(CurrentInfo.bVSync));
        // End:0x9B0
        if(!bForceSettings && !bIsOwner)
        {
            CurrentRes = PC.ConsoleCommand("GETCURRENTRES");
            // End:0x97A
            if(bool(PC.ConsoleCommand("ISFULLSCREEN")))
            {
                strFullScreen = "f";                
            }
            else
            {
                strFullScreen = "w";
            }
            PC.ConsoleCommand((("setres" @ CurrentRes) $ "x32") $ strFullScreen);
        }
        bChange = true;
    }
    // End:0xA7B
    if(bForceSettings || InitInfo.Antialiasing != CurrentInfo.Antialiasing)
    {
        // End:0xA30
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Antialiasing" @ string(CurrentInfo.Antialiasing));
        }
        PC.ConsoleCommand("SETCONFIG_INT Graphics Antialiasing" @ string(CurrentInfo.Antialiasing));
        bChange = true;
    }
    // End:0xB7E
    if(bForceSettings || InitInfo.LevelOfAnisotropy != CurrentInfo.LevelOfAnisotropy)
    {
        // End:0xB2E
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata D3D9Drv.D3D9RenderDevice LevelOfAnisotropy" @ string(CurrentInfo.LevelOfAnisotropy));
            PC.ConsoleCommand("SETANISOTROPY MAX=" $ string(CurrentInfo.LevelOfAnisotropy));
        }
        PC.ConsoleCommand("SETCONFIG_INT Graphics LevelOfAnisotropy" @ string(CurrentInfo.LevelOfAnisotropy));
        bChange = true;
    }
    // End:0xC94
    if(bForceSettings || InitInfo.bShader != CurrentInfo.bShader)
    {
        // End:0xBF3
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Shader" @ string(CurrentInfo.bShader));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Shader" @ string(CurrentInfo.bShader));
        bNeedReload = true;
        bChange = true;
        // End:0xC94
        if(CurrentInfo.bShader == false)
        {
            CurrentInfo.bReflectionMap = false;
            CurrentInfo.bDOF = false;
            CurrentInfo.bGlow = false;
            CurrentInfo.bDynamicLighting = false;
            CurrentInfo.bShadows = false;
        }
    }
    // End:0xD5A
    if(bForceSettings || InitInfo.bReflectionMap != CurrentInfo.bReflectionMap)
    {
        // End:0xD0E
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient SpecularMap" @ string(CurrentInfo.bReflectionMap));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics SpecularMap" @ string(CurrentInfo.bReflectionMap));
        bChange = true;
    }
    // End:0xE18
    if(bForceSettings || InitInfo.bShadows != CurrentInfo.bShadows)
    {
        // End:0xDD0
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Shadows" @ string(CurrentInfo.bShadows));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Shadows" @ string(CurrentInfo.bShadows));
        bChange = true;
    }
    // End:0xECE
    if(bForceSettings || InitInfo.bDOF != CurrentInfo.bDOF)
    {
        // End:0xE8A
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient DOF" @ string(CurrentInfo.bDOF));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics DOF" @ string(CurrentInfo.bDOF));
        bChange = true;
    }
    // End:0xF86
    if(bForceSettings || InitInfo.bGlow != CurrentInfo.bGlow)
    {
        // End:0xF41
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Glow" @ string(CurrentInfo.bGlow));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Glow" @ string(CurrentInfo.bGlow));
        bChange = true;
    }
    // End:0x1058
    if(bForceSettings || InitInfo.bDynamicLighting != CurrentInfo.bDynamicLighting)
    {
        // End:0x1006
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient NoDynamicLights" @ string(!CurrentInfo.bDynamicLighting));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics NoDynamicLights" @ string(!CurrentInfo.bDynamicLighting));
        bChange = true;
    }
    // End:0x1116
    if(bForceSettings || InitInfo.bCorona != CurrentInfo.bCorona)
    {
        // End:0x10CE
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Coronas" @ string(CurrentInfo.bCorona));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Coronas" @ string(CurrentInfo.bCorona));
        bChange = true;
    }
    // End:0x11D2
    if(bForceSettings || InitInfo.bDecal != CurrentInfo.bDecal)
    {
        // End:0x118B
        if(!bIsOwner)
        {
            PC.ConsoleCommand("setdata WinDrv.WindowsClient Decals" @ string(CurrentInfo.bDecal));
        }
        PC.ConsoleCommand("SETCONFIG_BOOL Graphics Decals" @ string(CurrentInfo.bDecal));
        bChange = true;
    }
    // End:0x128D
    if(bForceSettings || InitInfo.DecalStayScale != CurrentInfo.DecalStayScale)
    {
        // End:0x1240
        if(!bIsOwner)
        {
            PC.Level.DecalStayScale = float(CurrentInfo.DecalStayScale);
            Class'Engine.LevelInfo'.default.DecalStayScale = float(CurrentInfo.DecalStayScale);
        }
        PC.ConsoleCommand("SETCONFIG_INT Graphics DecalStayScale" @ string(CurrentInfo.DecalStayScale));
        bChange = true;
    }
    // End:0x1437
    if(bForceSettings || InitInfo.PhysicEffect != CurrentInfo.PhysicEffect)
    {
        switch(CurrentInfo.PhysicEffect)
        {
            // End:0x1337
            case 0:
                // End:0x12F7
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 0;
                    PC.Level.PhysicsDetailLevel = 0;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 0");
                // End:0x142F
                break;
            // End:0x13B1
            case 1:
                // End:0x1371
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 1;
                    PC.Level.PhysicsDetailLevel = 1;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 1");
                // End:0x142F
                break;
            // End:0x142C
            case 2:
                // End:0x13EC
                if(!bIsOwner)
                {
                    Class'Engine.LevelInfo'.default.PhysicsDetailLevel = 2;
                    PC.Level.PhysicsDetailLevel = 2;
                }
                PC.ConsoleCommand("SETCONFIG_INT Graphics PhysicsDetailLevel 2");
                // End:0x142F
                break;
            // End:0xFFFF
            default:
                break;
        }
        bChange = true;
    }
    // End:0x14F4
    if(!bIsOwner && bChange)
    {
        PC.ConsoleCommand("flush");
        // End:0x148D
        if(PC.Level != none)
        {
            PC.Level.SaveConfig();
        }
        Class'Engine.LevelInfo'.static.StaticSaveConfig();
        // End:0x14E5
        if((PC.Pawn != none) && UnrealPawn(PC.Pawn) != none)
        {
            UnrealPawn(PC.Pawn).SaveConfig();
        }
        Class'UnrealGame.UnrealPawn'.static.StaticSaveConfig();
    }
    // End:0x1538
    if((!bIsOwner && bNeedReload) && !bForceSettings)
    {
        PC.ConsoleCommand("RELOADRESOURCES");
    }
    PC.ResetKeySleepTime();
    return bChange;
    //return;    
}

static function OptionGraphicAdvanceInfo GetPredefineAdvanceSettings(PlayerController PC, int Index)
{
    local int LOAnisotropy;
    local OptionGraphicAdvanceInfo Info;

    Info = default.PredefineAdvanceSettings[Index];
    // End:0xFB
    if(Info.bShader)
    {
        LOAnisotropy = 0;
        // End:0xEB
        if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=2")))
        {
            LOAnisotropy = 2;
            // End:0xEB
            if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=4")))
            {
                LOAnisotropy = 4;
                // End:0xEB
                if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=8")))
                {
                    LOAnisotropy = 8;
                    // End:0xEB
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
    //return;    
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
    if((b1 == false) && b2 == false)
    {
        Info.BackgroundQuality = 0;        
    }
    else
    {
        // End:0x23D
        if((b1 == true) && b2 == false)
        {
            Info.BackgroundQuality = 1;            
        }
        else
        {
            Info.BackgroundQuality = 2;
        }
    }
    Info.LevelOfAnisotropy = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION LEVELOFANISOTROPY"));
    Info.LOD = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION MESHLODDETAILLEVEL"));
    Info.TextureQuality = int(PC.ConsoleCommand("GETTEMPGRAPHICOPTION TEXTUREDETAILWORLD"));
    Info.TextureQuality = 4 - Info.TextureQuality;
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
    //return;    
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BTSliderHK(Content[0]).SetCurrentValue(float(CurrentInfo.TextureQuality));
    Content0_OnChangeValue(CurrentInfo.TextureQuality);
    BTSliderHK(Content[1]).SetCurrentValue(float(CurrentInfo.BackgroundQuality));
    Content1_OnChangeValue(CurrentInfo.BackgroundQuality);
    BTSliderHK(Content[2]).SetCurrentValue(float(CurrentInfo.LOD));
    Content2_OnChangeValue(CurrentInfo.LOD);
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.SetData(CurrentInfo.bVSync);
    Content3_OnSelect(CurrentInfo.bVSync);
    BTTPOptionRadioButtonHK(Content[8]).ButtonRadio.SetData(CurrentInfo.bShadows);
    Content8_OnSelect(CurrentInfo.bShadows);
    // End:0x1BE
    if(bSupportPS30)
    {
        BTTPOptionRadioButtonHK(Content[6]).ButtonRadio.SetData(CurrentInfo.bShader);
        Content6_OnSelect(CurrentInfo.bShader);
        BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.SetData(CurrentInfo.bReflectionMap);
        Content7_OnSelect(CurrentInfo.bReflectionMap);
        // End:0x1BB
        if(!bSupportHWShadowMap)
        {
            BTTPOptionRadioButtonHK(Content[8]).DisableMe();
        }        
    }
    else
    {
        BTTPOptionRadioButtonHK(Content[6]).DisableMe();
        BTTPOptionRadioButtonHK(Content[7]).DisableMe();
        BTTPOptionRadioButtonHK(Content[8]).DisableMe();
    }
    // End:0x292
    if(bSupportPS30 && bSupportMRT)
    {
        BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.SetData(CurrentInfo.bDOF);
        Content9_OnSelect(CurrentInfo.bDOF);
        BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.SetData(CurrentInfo.bGlow);
        Content10_OnSelect(CurrentInfo.bGlow);        
    }
    else
    {
        BTTPOptionRadioButtonHK(Content[9]).DisableMe();
        BTTPOptionRadioButtonHK(Content[10]).DisableMe();
    }
    // End:0x308
    if(bSupportPS30)
    {
        BTTPOptionRadioButtonHK(Content[11]).ButtonRadio.SetData(CurrentInfo.bDynamicLighting);
        Content11_OnSelect(CurrentInfo.bDynamicLighting);        
    }
    else
    {
        BTTPOptionRadioButtonHK(Content[11]).DisableMe();
    }
    BTTPOptionRadioButtonHK(Content[12]).ButtonRadio.SetData(CurrentInfo.bCorona);
    Content12_OnSelect(CurrentInfo.bCorona);
    BTTPOptionRadioButtonHK(Content[14]).ButtonRadio.SetData(CurrentInfo.bDecal);
    Content14_OnSelect(CurrentInfo.bDecal);
    BTSliderHK(Content[15]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
    Content15_OnChangeValue(CurrentInfo.DecalStayScale);
    BTSliderHK(Content[16]).SetCurrentValue(float(CurrentInfo.PhysicEffect));
    Content16_OnChangeValue(CurrentInfo.PhysicEffect);
    BTTPOptionRadioButtonHK(Content[17]).ButtonRadio.SetData(CurrentInfo.bRagDoll);
    Content17_OnSelect(CurrentInfo.bRagDoll);
    CurrentInfo.Antialiasing = Min(CurrentInfo.Antialiasing, 3);
    BTComboBoxHK(Content[4]).ComboBox.SetIndex(CurrentInfo.Antialiasing);
    switch(CurrentInfo.LevelOfAnisotropy)
    {
        // End:0x4B1
        case 2:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(1);
            // End:0x556
            break;
        // End:0x4DB
        case 4:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(2);
            // End:0x556
            break;
        // End:0x505
        case 8:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(3);
            // End:0x556
            break;
        // End:0x52F
        case 16:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(4);
            // End:0x556
            break;
        // End:0xFFFF
        default:
            BTComboBoxHK(Content[5]).ComboBox.SetIndex(0);
            // End:0x556
            break;
            break;
    }
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Content0_OnChangeValue(int ChangeValue)
{
    CurrentInfo.TextureQuality = ChangeValue;
    //return;    
}

function Content1_OnChangeValue(int ChangeValue)
{
    CurrentInfo.BackgroundQuality = ChangeValue;
    //return;    
}

function Content2_OnChangeValue(int ChangeValue)
{
    CurrentInfo.LOD = ChangeValue;
    //return;    
}

function Content3_OnSelect(bool bOn)
{
    CurrentInfo.bVSync = bOn;
    //return;    
}

function Content4_OnChangeValue(GUIComponent Sender)
{
    local int massIndex;
    local PlayerController PC;

    PC = PlayerOwner();
    massIndex = BTComboBoxHK(Content[4]).ComboBox.GetIndex();
    CurrentInfo.Antialiasing = massIndex;
    // End:0xE9
    if(CurrentInfo.bShader)
    {
        Content[9].EnableMe();
        Content[10].EnableMe();
        BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.SetData(CurrentInfo.bDOF);
        Content9_OnSelect(CurrentInfo.bDOF);
        BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.SetData(CurrentInfo.bGlow);
        Content10_OnSelect(CurrentInfo.bGlow);
    }
    //return;    
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
        // End:0x7E
        case 3:
            CurrentInfo.LevelOfAnisotropy = 8;
            // End:0x96
            break;
        // End:0x93
        case 4:
            CurrentInfo.LevelOfAnisotropy = 16;
            // End:0x96
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function Content8_OnSelect(bool bOn)
{
    CurrentInfo.bShadows = bOn;
    //return;    
}

function Content6_OnSelect(bool bOn)
{
    local PlayerController PC;

    PC = PlayerOwner();
    CurrentInfo.bShader = bOn;
    // End:0x15D
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
    else
    {
        Content[7].DisableMe();
        Content[9].DisableMe();
        Content[10].DisableMe();
        Content[11].DisableMe();
        Content[8].DisableMe();
    }
    //return;    
}

function Content7_OnSelect(bool bOn)
{
    CurrentInfo.bReflectionMap = bOn;
    //return;    
}

function Content9_OnSelect(bool bOn)
{
    CurrentInfo.bDOF = bOn;
    //return;    
}

function Content10_OnSelect(bool bOn)
{
    CurrentInfo.bGlow = bOn;
    //return;    
}

function Content11_OnSelect(bool bOn)
{
    CurrentInfo.bDynamicLighting = bOn;
    //return;    
}

function Content12_OnSelect(bool bOn)
{
    CurrentInfo.bCorona = bOn;
    //return;    
}

function Content14_OnSelect(bool bOn)
{
    CurrentInfo.bDecal = bOn;
    // End:0x58
    if(CurrentInfo.bDecal)
    {
        BTSliderHK(Content[15]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
        Content[15].EnableMe();        
    }
    else
    {
        BTSliderHK(Content[15]).SetCurrentValue(float(CurrentInfo.DecalStayScale));
        Content[15].DisableMe();
    }
    //return;    
}

function Content15_OnChangeValue(int ChangeValue)
{
    CurrentInfo.DecalStayScale = ChangeValue;
    //return;    
}

function Content16_OnChangeValue(int ChangeValue)
{
    CurrentInfo.PhysicEffect = ChangeValue;
    //return;    
}

function Content17_OnSelect(bool bOn)
{
    CurrentInfo.bRagDoll = bOn;
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

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[0]).MaxValue = 4.0000000;
    BTSliderHK(Content[0]).bSmoothSlider = false;
    BTSliderHK(Content[0]).SetData(36, 16);
    BTSliderHK(Content[0]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[0]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[0]).__OnChangeValue__Delegate = Content0_OnChangeValue;
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[1]).MaxValue = 2.0000000;
    BTSliderHK(Content[1]).bSmoothSlider = false;
    BTSliderHK(Content[1]).SetData(36, 16);
    BTSliderHK(Content[1]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[1]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[1]).__OnChangeValue__Delegate = Content1_OnChangeValue;
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[2]).MaxValue = 3.0000000;
    BTSliderHK(Content[2]).bSmoothSlider = false;
    BTSliderHK(Content[2]).SetData(36, 16);
    BTSliderHK(Content[2]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[2]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[2]).__OnChangeValue__Delegate = Content2_OnChangeValue;
    Content[8] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[8]).ButtonRadio.__OnSelect__Delegate = Content8_OnSelect;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[3]).ButtonRadio.__OnSelect__Delegate = Content3_OnSelect;
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[4]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[4]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    BTComboBoxHK(Content[4]).ComboBox.AddItem("None");
    BTComboBoxHK(Content[4]).ComboBox.AddItem("Low");
    BTComboBoxHK(Content[4]).ComboBox.AddItem("Normal");
    BTComboBoxHK(Content[4]).ComboBox.AddItem("High");
    BTComboBoxHK(Content[4]).__OnChange__Delegate = Content4_OnChangeValue;
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7900000);
    BTComboBoxHK(Content[5]).ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    BTComboBoxHK(Content[5]).ComboBox.__OnShowList__Delegate = OnShow_ComboBoxList;
    BTComboBoxHK(Content[5]).ComboBox.AddItem("None");
    // End:0x643
    if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=2")))
    {
        BTComboBoxHK(Content[5]).ComboBox.AddItem("2x");
        // End:0x640
        if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=4")))
        {
            BTComboBoxHK(Content[5]).ComboBox.AddItem("4x");
            // End:0x640
            if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=8")))
            {
                BTComboBoxHK(Content[5]).ComboBox.AddItem("8x");
                // End:0x640
                if(bool(PC.ConsoleCommand("GETANISOTROPY MAX=16")))
                {
                    BTComboBoxHK(Content[5]).ComboBox.AddItem("16x");
                }
            }
        }        
    }
    else
    {
        Content[5].DisableMe();
    }
    BTComboBoxHK(Content[5]).__OnChange__Delegate = Content5_OnChangeValue;
    Content[6] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[6]).ButtonRadio.__OnSelect__Delegate = Content6_OnSelect;
    Content[7] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[7]).ButtonRadio.__OnSelect__Delegate = Content7_OnSelect;
    Content[9] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[9]).ButtonRadio.__OnSelect__Delegate = Content9_OnSelect;
    Content[10] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[10]).ButtonRadio.__OnSelect__Delegate = Content10_OnSelect;
    Content[11] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[11]).ButtonRadio.__OnSelect__Delegate = Content11_OnSelect;
    Content[12] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[12]).ButtonRadio.__OnSelect__Delegate = Content12_OnSelect;
    Content[13] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[13]).ButtonRadio.ButtonOn.DisableMe();
    BTTPOptionRadioButtonHK(Content[13]).ButtonRadio.ButtonOff.DisableMe();
    Content[14] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[14]).ButtonRadio.__OnSelect__Delegate = Content14_OnSelect;
    Content[15] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[15]).MinValue = 1.0000000;
    BTSliderHK(Content[15]).MaxValue = 2.0000000;
    BTSliderHK(Content[15]).bSmoothSlider = false;
    BTSliderHK(Content[15]).SetData(36, 16);
    BTSliderHK(Content[15]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[15]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[15]).__OnChangeValue__Delegate = Content15_OnChangeValue;
    Content[16] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[16]).MaxValue = 2.0000000;
    BTSliderHK(Content[16]).bSmoothSlider = false;
    BTSliderHK(Content[16]).SetData(36, 16);
    BTSliderHK(Content[16]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[16]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[16]).DisableMe();
    Content[17] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[17]).ButtonRadio.ButtonOn.DisableMe();
    BTTPOptionRadioButtonHK(Content[17]).ButtonRadio.ButtonOff.DisableMe();
    BTTPOptionRadioButtonHK(Content[17]).ButtonRadio.__OnSelect__Delegate = Content17_OnSelect;
    // End:0xBE6
    if(bSupportPS30 == false)
    {
        Content[6].DisableMe();
        Content[7].DisableMe();
        Content[11].DisableMe();
    }
    // End:0xC12
    if((bSupportPS30 == false) || bSupportHWShadowMap == false)
    {
        Content[8].DisableMe();
    }
    // End:0xC50
    if((bSupportPS30 == false) || bSupportMRT == false)
    {
        Content[9].DisableMe();
        Content[10].DisableMe();
    }
    //return;    
}

defaultproperties
{
    strAntiAliasingOn="???????? Anti Aliasing ?????????????????????? Glow Effect ???"
    strLow="???"
    strHigh="???"
    strLabel[0]="????????"
    strLabel[1]="??????????"
    strLabel[2]="LOD"
    strLabel[3]="????????"
    strLabel[4]="Anti Aliasing"
    strLabel[5]="Set Aeolotropy"
    strLabel[6]="Shaders"
    strLabel[7]="Reflection Map"
    strLabel[8]="???"
    strLabel[9]="?????"
    strLabel[10]="Glow "
    strLabel[11]="Dynamic Lighting"
    strLabel[12]="Corona"
    strLabel[13]="???????????"
    strLabel[14]="Decal"
    strLabel[16]="Physical Effect"
    strLabel[17]="Ragdoll"
    PredefineAdvanceSettings[0]=(TextureQuality=2,BackgroundQuality=0,LOD=0,CharacterShadow=0,bVSync=false,bShader=false,bShadows=false,bReflectionMap=false,bHDR=false,bDOF=false,bGlow=false,bDynamicLighting=false,bCorona=false,bBlood=false,bDecal=true,DecalStayScale=1,PhysicEffect=0,bRagDoll=false,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[1]=(TextureQuality=3,BackgroundQuality=0,LOD=0,CharacterShadow=0,bVSync=false,bShader=false,bShadows=false,bReflectionMap=false,bHDR=false,bDOF=false,bGlow=false,bDynamicLighting=false,bCorona=true,bBlood=false,bDecal=true,DecalStayScale=1,PhysicEffect=0,bRagDoll=false,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[2]=(TextureQuality=4,BackgroundQuality=1,LOD=1,CharacterShadow=0,bVSync=false,bShader=false,bShadows=false,bReflectionMap=false,bHDR=false,bDOF=false,bGlow=false,bDynamicLighting=false,bCorona=true,bBlood=false,bDecal=true,DecalStayScale=1,PhysicEffect=0,bRagDoll=false,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[3]=(TextureQuality=4,BackgroundQuality=0,LOD=1,CharacterShadow=1,bVSync=false,bShader=true,bShadows=false,bReflectionMap=false,bHDR=false,bDOF=false,bGlow=false,bDynamicLighting=false,bCorona=true,bBlood=false,bDecal=true,DecalStayScale=2,PhysicEffect=0,bRagDoll=false,Antialiasing=0,LevelOfAnisotropy=0)
    PredefineAdvanceSettings[4]=(TextureQuality=4,BackgroundQuality=1,LOD=1,CharacterShadow=2,bVSync=false,bShader=true,bShadows=true,bReflectionMap=true,bHDR=true,bDOF=true,bGlow=true,bDynamicLighting=false,bCorona=true,bBlood=false,bDecal=true,DecalStayScale=2,PhysicEffect=0,bRagDoll=false,Antialiasing=0,LevelOfAnisotropy=0)
    strTooltip[0]="???????????????????? Texture ??? ???????, ???<P> <P>? ????????? Graphic Card ????? GeForce 6600GT ????????????????????????????????????????????????????????????"
    strTooltip[1]="????????????????????????????????????????????????????????<P> <P>? ??????????????????????????????????????????????????????????????????? CPU (GHZ)??? GPU ????????????????????? "
    strTooltip[2]="???????????????? LOD ??????????????????????????????????????????????????????????????????????????????????<P> <P>? ???????????????????????????????????????<P>? ?????????????????????????????????????????????????????????? CPU (GHZ) ??? GPU ??????????????????"
    strTooltip[3]="??????? Vertical ??????????????????????????????????????????????????????????????????????????????????????????????????"
    strTooltip[4]="?????????????????? 3D ???????????????????????????????<P> <P>? ??????? Anti aliasing ?????????????? Glow Effect ???????????<P>? ?????????????????????????????? Graphic Card ???????????????????????"
    strTooltip[5]="????? Texture ??????????????<P> <P>? ????????? Graphic Card ???????????? GeForce 6600GT????????????????????????????????????????????????? 2x ??????"
    strTooltip[6]="???????????????????????????????????<P> <P>? ???????????? Graphic Card ??????? 8600GT ???????????????????????????????????"
    strTooltip[7]="????????????????????<P> <P>? ??????????????????????????????????????????? Shadow ????????<P>? ????????????? Graphic Card ??????? 9600GT ???????????????????????????"
    strTooltip[8]="???????????????????????????????<P> <P>? ?????????????????????????????????????????????? Shadow<P>? ???????????? Graphic Card ??????? 9600GT ???????????????????????????"
    strTooltip[9]="?????????????????????????<P> <P>? ?????????????????????????????????????????????????????????"
    strTooltip[10]="???????????????????????????<P> <P>?  ?????????????????????????????????????????????????????????"
    strTooltip[11]="??????????????????????????????????? ????????????????????????????????????????????<P> <P>? ????????????????????????????????????????????????????????????"
    strTooltip[12]="?????????????????????????????????????????????<P> <P>? ???????????????????????????? GeForce 6600GT ???????????????????????????"
    strTooltip[14]="????????????????????????????????????<P> <P>? ???????????????????????????????????????????????? CPU (GHZ) ??????"
    strTooltip[16]="?????????????????????????????????????????????????????????????????<P> <P>????????????????????????????????????????????????????? CPU (GHZ) ??????"
    strTooltip[17]="??????? Ragdoll???????????????????????????????????????????<P> <P>? ???????????????????????????????????????????????? CPU (GHZ) ??????"
}