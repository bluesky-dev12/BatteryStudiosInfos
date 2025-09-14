class wBTLoadingScreenDrawer extends Object
    native;

struct native export OtherLoadingStateItem
{
    var LoadingMessageItem LoadingMsgItem;
    var string strLoadingMsg;
};

var Material Mat_img_point_help;
var Material Mat_gauge_loading;
var Material Mat_gauge_loading_back;
var Material Mat_img_load_pllist;
var Material Mat_img_hud_text;
var Material Mat_img_hud_text2;
var Material Mat_img_help_all;
var Material Mat_img_help_line;
var Material Mat_img_RespawnLevelStar[5];
var Material LoadingBackGroundImage;
var Material MiniMapInfoImage;
var Material Mat_img_SupplyIcon[5];
var int TeamCountAF;
var int TeamCountRSA;
var localized string strSupplyIcon[5];
var int SupplyImgNum[3];
var FloatBox ModeHelp[11];
var localized string strModeHelp1[11];
var int SelectHelp;
var array<FloatBox> ModeFB;
var array<FloatBox> ModeFB2;
var array<string> ModeNames;
var array<string> ModeDescriptions;
var string GameSubMode;
var string GameDifficulty;
var string GameRespawnType;
var int MapDifficulty;
var int MapID;
var wMatchMaker MM;
var array<OtherLoadingStateItem> OtherLoadingState;
var string MyLoadingState;
var float iProgress;
var float iPrevProgress;
var float Alpha;
var bool bRefreshRender;
var bool bFirstRender;
var localized string szTipText[5];
var localized string szMapInfo[5];
var int iTipIndex;
var int iRespawnIndex;
var localized string szTipText_Defence[5];
var localized string CantUseSupplyLineText1;
var localized string CantUseSupplyLineText2;
var FloatBox fbSupplyIcon[3];
var FloatBox fbSupplyStr[3];

// Export UwBTLoadingScreenDrawer::execAddToRoot(FFrame&, void* const)
native function AddToRoot(Material Image)
{
    //native.Image;        
}

// Export UwBTLoadingScreenDrawer::execRemoveFromRoot(FFrame&, void* const)
native function RemoveFromRoot(Material Image)
{
    //native.Image;        
}

event Initialize()
{
    UpdateProgress(0);
    UpdateMyLoadingState("");
    ClearOtherLoadingState();
    DestroyBackGroundImage();
    bRefreshRender = true;
    bFirstRender = false;
    //return;    
}

event bool CreateBackGroundImage(wMatchMaker MatchMaker)
{
    local array<GameModeInfo> GameModeInfos;
    local int i;
    local string strSupplyResource;

    // End:0x56
    if(MatchMaker == none)
    {
        Log("wBTLoadingScreenDrawer::CreateBackGroundImage() MatchMaker is none");
        return false;        
    }
    else
    {
        MM = MatchMaker;
        GameModeInfos = Class'Engine_Decompressed.wGameSettings'.static.GetAllGameModes();
        i = 0;
        J0x7D:

        // End:0xCF [Loop If]
        if(i < GameModeInfos.Length)
        {
            ModeNames[i] = GameModeInfos[i].UserFriendlyName;
            ModeDescriptions[i] = GameModeInfos[i].ModeDescription;
            i++;
            // [Loop Continue]
            goto J0x7D;
        }
        GameSubMode = Class'Engine_Decompressed.wGameSettings'.static.GetWeaponRestrictionByIndex(MM.kGame_WeaponLimit);
        MapID = MM.MapSettings.GetMapInfo(MM.szMapName).MapID;
        MapDifficulty = MM.MapSettings.GetMapInfo(MM.szMapName).MapDifficulty;
        i = 0;
        J0x163:

        // End:0x30E [Loop If]
        if(i < 3)
        {
            strSupplyResource = MM.MapSettings.GetMapInfo(MM.szMapName).ResourceSupplyImages[i];
            // End:0x1BC
            if(strSupplyResource == "")
            {
                // [Explicit Break]
                goto J0x30E;
                // [Explicit Continue]
                goto J0x304;
            }
            // End:0x209
            if(strSupplyResource == "Warfare_UI_Item.SupplySkillIcon.icon_sup_UAV_s")
            {
                SupplyImgNum[i] = int(1);
                // [Explicit Continue]
                goto J0x304;
            }
            // End:0x257
            if(strSupplyResource == "Warfare_UI_Item.SupplySkillIcon.icon_sup_heli_s")
            {
                SupplyImgNum[i] = int(2);
                // [Explicit Continue]
                goto J0x304;
            }
            // End:0x2A5
            if(strSupplyResource == "Warfare_UI_Item.SupplySkillIcon.icon_sup_bomb_s")
            {
                SupplyImgNum[i] = int(3);
                // [Explicit Continue]
                goto J0x304;
            }
            // End:0x2F3
            if(strSupplyResource == "Warfare_UI_Item.SupplySkillIcon.icon_sup_sent_s")
            {
                SupplyImgNum[i] = int(4);
                // [Explicit Continue]
                goto J0x304;
            }
            SupplyImgNum[i] = -1;
            J0x304:

            i++;
            // [Loop Continue]
            goto J0x163;
        }
        J0x30E:

        ModeFB.Length = 12;
        ModeFB[0] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 688.0000000, 256.0000000, 752.0000000);
        ModeFB[1] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 688.0000000, 512.0000000, 752.0000000);
        ModeFB[2] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 624.0000000, 256.0000000, 688.0000000);
        ModeFB[3] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 624.0000000, 512.0000000, 688.0000000);
        ModeFB[4] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 752.0000000, 256.0000000, 816.0000000);
        ModeFB[5] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 688.0000000, 256.0000000, 752.0000000);
        ModeFB[6] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 624.0000000, 512.0000000, 688.0000000);
        ModeFB[7] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 624.0000000, 256.0000000, 688.0000000);
        ModeFB[8] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[9] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[10] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[11] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 816.0000000, 512.0000000, 880.0000000);
        ModeFB2.Length = 3;
        ModeFB2[0] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 64.0000000, 256.0000000, 128.0000000);
        ModeFB2[1] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 128.0000000, 256.0000000, 192.0000000);
        ModeFB2[2] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 304.0000000, 64.0000000);
        ModeHelp[0] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 120.0000000, 74.0000000);
        ModeHelp[1] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 74.0000000, 120.0000000, 148.0000000);
        ModeHelp[2] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 148.0000000, 120.0000000, 222.0000000);
        ModeHelp[3] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 222.0000000, 120.0000000, 296.0000000);
        ModeHelp[4] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 296.0000000, 120.0000000, 370.0000000);
        ModeHelp[5] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 370.0000000, 120.0000000, 444.0000000);
        ModeHelp[6] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(120.0000000, 0.0000000, 240.0000000, 74.0000000);
        ModeHelp[7] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(120.0000000, 74.0000000, 240.0000000, 148.0000000);
        ModeHelp[8] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(120.0000000, 148.0000000, 240.0000000, 222.0000000);
        ModeHelp[9] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(120.0000000, 222.0000000, 240.0000000, 296.0000000);
        ModeHelp[10] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(120.0000000, 296.0000000, 240.0000000, 370.0000000);
        SelectHelp = Rand(11);
        Initialize();
        Mat_img_help_line = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_help_line", Class'Engine_Decompressed.Material'));
        Mat_img_hud_text = Material(DynamicLoadObject("Warfare_GP_UI_HUD.Text.img_hud_text", Class'Engine_Decompressed.Material'));
        Mat_img_hud_text2 = Material(DynamicLoadObject("Warfare_GP_UI_HUD.Text.img_hud_text2", Class'Engine_Decompressed.Material'));
        Mat_img_help_all = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_help_all", Class'Engine_Decompressed.Material'));
        Mat_gauge_loading = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.gauge_loading", Class'Engine_Decompressed.Material'));
        Mat_gauge_loading_back = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.gauge_loading_back", Class'Engine_Decompressed.Material'));
        Mat_img_point_help = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_point_help", Class'Engine_Decompressed.Material'));
        Mat_img_load_pllist = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_load_pllist", Class'Engine_Decompressed.Material'));
        Mat_img_SupplyIcon[int(1)] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_supplyicon_UAV", Class'Engine_Decompressed.Material'));
        Mat_img_SupplyIcon[int(2)] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_supplyicon_helicopter", Class'Engine_Decompressed.Material'));
        Mat_img_SupplyIcon[int(3)] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_supplyicon_bombing", Class'Engine_Decompressed.Material'));
        Mat_img_SupplyIcon[int(4)] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_supplyicon_sent", Class'Engine_Decompressed.Material'));
        Mat_img_RespawnLevelStar[0] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_respawnlevel_star01", Class'Engine_Decompressed.Material'));
        Mat_img_RespawnLevelStar[1] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_respawnlevel_star02", Class'Engine_Decompressed.Material'));
        Mat_img_RespawnLevelStar[2] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_respawnlevel_star03", Class'Engine_Decompressed.Material'));
        Mat_img_RespawnLevelStar[3] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_respawnlevel_star04", Class'Engine_Decompressed.Material'));
        Mat_img_RespawnLevelStar[4] = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_loading_respawnlevel_star05", Class'Engine_Decompressed.Material'));
        // End:0xCF5
        if(Mat_img_help_line != none)
        {
            AddToRoot(Mat_img_help_line);
        }
        // End:0xD0B
        if(Mat_img_hud_text != none)
        {
            AddToRoot(Mat_img_hud_text);
        }
        // End:0xD21
        if(Mat_img_hud_text2 != none)
        {
            AddToRoot(Mat_img_hud_text2);
        }
        // End:0xD37
        if(Mat_img_load_pllist != none)
        {
            AddToRoot(Mat_img_load_pllist);
        }
        // End:0xD4D
        if(Mat_img_help_all != none)
        {
            AddToRoot(Mat_img_help_all);
        }
        // End:0xD63
        if(Mat_gauge_loading != none)
        {
            AddToRoot(Mat_gauge_loading);
        }
        // End:0xD79
        if(Mat_gauge_loading_back != none)
        {
            AddToRoot(Mat_gauge_loading_back);
        }
        // End:0xD8F
        if(Mat_img_point_help != none)
        {
            AddToRoot(Mat_img_point_help);
        }
        LoadingBackGroundImage = MatchMaker.GetLoadingImage();
        MiniMapInfoImage = MatchMaker.GetMiniMapInfoImage();
        // End:0xE13
        if(LoadingBackGroundImage != none)
        {
            AddToRoot(LoadingBackGroundImage);
            // End:0xDE8
            if(MiniMapInfoImage != none)
            {
                AddToRoot(MiniMapInfoImage);                
            }
            else
            {
                Log(string(self) $ " GetMiniMapInfoImage is none ");
            }
            return true;            
        }
        else
        {
            Log("wBTLoadingScreenDrawer::CreateBackGroundImage() LoadingBackGroundImage is none");
            return false;
        }
    }
    //return;    
}

event bool DestroyBackGroundImage()
{
    // End:0x1D
    if(Mat_img_hud_text == none)
    {
        RemoveFromRoot(Mat_img_hud_text);
        Mat_img_hud_text = none;
    }
    // End:0x3A
    if(Mat_img_hud_text2 == none)
    {
        RemoveFromRoot(Mat_img_hud_text2);
        Mat_img_hud_text = none;
    }
    // End:0x57
    if(Mat_img_help_line == none)
    {
        RemoveFromRoot(Mat_img_help_line);
        Mat_img_help_line = none;
    }
    // End:0x74
    if(Mat_img_help_all == none)
    {
        RemoveFromRoot(Mat_img_help_all);
        Mat_img_help_all = none;
    }
    // End:0x91
    if(Mat_gauge_loading == none)
    {
        RemoveFromRoot(Mat_gauge_loading);
        Mat_gauge_loading = none;
    }
    // End:0xAE
    if(Mat_gauge_loading_back == none)
    {
        RemoveFromRoot(Mat_gauge_loading_back);
        Mat_gauge_loading_back = none;
    }
    // End:0xCB
    if(Mat_img_point_help == none)
    {
        RemoveFromRoot(Mat_img_point_help);
        Mat_img_point_help = none;
    }
    // End:0xE8
    if(Mat_img_load_pllist == none)
    {
        RemoveFromRoot(Mat_img_load_pllist);
        Mat_img_load_pllist = none;
    }
    // End:0x14B
    if(LoadingBackGroundImage == none)
    {
        Log("wBTLoadingScreenDrawer::DestroyBackGroundImage() LoadingBackGroundImage is none");
        return false;        
    }
    else
    {
        RemoveFromRoot(LoadingBackGroundImage);
        // End:0x16C
        if(MiniMapInfoImage != none)
        {
            RemoveFromRoot(MiniMapInfoImage);
        }
        LoadingBackGroundImage = none;
        return true;
    }
    //return;    
}

event bool UpdateProgress(int CurrenetProgress)
{
    iPrevProgress = iProgress;
    iProgress = float(CurrenetProgress);
    bRefreshRender = true;
    return true;
    //return;    
}

event UpdateMyLoadingState(string LoadingState)
{
    MyLoadingState = LoadingState;
    //return;    
}

event UpdateOtherLoadingState(LoadingMessageItem Item, string strMsg)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xFE [Loop If]
    if(i < OtherLoadingState.Length)
    {
        // End:0xF4
        if(OtherLoadingState[i].LoadingMsgItem.UserName == Item.UserName)
        {
            OtherLoadingState[i].LoadingMsgItem.UserName = Item.UserName;
            OtherLoadingState[i].LoadingMsgItem.LoadingState = Item.LoadingState;
            OtherLoadingState[i].LoadingMsgItem.NameColor = Item.NameColor;
            OtherLoadingState[i].LoadingMsgItem.StateColor = Item.StateColor;
            OtherLoadingState[i].strLoadingMsg = strMsg;
            OtherLoadingState[i].LoadingMsgItem.TeamNum = Item.TeamNum;
            // [Explicit Break]
            goto J0xFE;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xFE:

    // End:0x219
    if(i == OtherLoadingState.Length)
    {
        OtherLoadingState.Insert(OtherLoadingState.Length, 1);
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.UserName = Item.UserName;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.LoadingState = Item.LoadingState;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.NameColor = Item.NameColor;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.StateColor = Item.StateColor;
        OtherLoadingState[OtherLoadingState.Length - 1].strLoadingMsg = strMsg;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.TeamNum = Item.TeamNum;
        // End:0x212
        if(OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.TeamNum == 0)
        {
            TeamCountAF++;            
        }
        else
        {
            TeamCountRSA++;
        }
    }
    bRefreshRender = true;
    //return;    
}

event ClearOtherLoadingState()
{
    OtherLoadingState.Remove(0, OtherLoadingState.Length);
    TeamCountAF = 0;
    TeamCountRSA = 0;
    //return;    
}

event DrawLoadingScreen(Canvas C)
{
    local int i, ModeIndex, modeNameIndex, SupplyAddCount;
    local float ratioX, ratioY, listStepX;
    local FloatBox fb, fbRSA;
    local Image img;
    local int StrLenPerOneLine;
    local string tmpStrTip, strHelpTip;
    local float loadingBarWidth;
    local Color kShadowColor;

    C.Style = 5;
    C.ColorModulate = C.default.ColorModulate;
    ratioX = C.ClipX / float(1024);
    ratioY = C.ClipY / float(768);
    // End:0x7C
    if(bFirstRender == false)
    {
        bFirstRender = true;
    }
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(1024, 768, 28, LoadingBackGroundImage);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, 0.0000000, 0.0000000, C.ClipX, C.ClipY);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(27.0000000 * ratioX, 653.0000000 * ratioY, 763.0000000 * ratioX, 682.0000000 * ratioY);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(736, 31, 28, Mat_gauge_loading_back);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + img.width, img.Y + img.Height);
    // End:0x209
    if(iProgress > float(100))
    {
        iProgress = 100.0000000;
    }
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(30.0000000 * ratioX, 656.0000000 * ratioY, 760.0000000 * ratioX, 679.0000000 * ratioY);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(730, 23, 28, Mat_gauge_loading);
    loadingBarWidth = img.width * (iProgress / float(100));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (loadingBarWidth * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + loadingBarWidth, img.Y + img.Height);
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
    kShadowColor = Class'Engine_Decompressed.Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, string(int(iProgress)) $ "%", 4, 14.0000000, 30.0000000 * ratioX, 658.0000000 * ratioY, 763.0000000 * ratioX, 679.0000000 * ratioY, 0, 0, 0, 0, kShadowColor, 0, false);
    // End:0x8B9
    if(OtherLoadingState.Length > 0)
    {
        listStepX = 204.0000000 * ratioX;
        C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(28.0000000 * ratioX, 447.0000000 * ratioY, 228.0000000 * ratioX, (462.0000000 * ratioY) + ((float(15) * ratioY) * float(TeamCountAF)));
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 15, Mat_img_load_pllist);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox((28.0000000 * ratioX) + listStepX, 447.0000000 * ratioY, (228.0000000 * ratioX) + listStepX, (462.0000000 * ratioY) + ((float(15) * ratioY) * float(TeamCountRSA)));
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 15, Mat_img_load_pllist);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 = 34.0000000 * ratioX;
        fb.X2 = 225.0000000 * ratioX;
        fb.Y2 = 453.0000000 * ratioY;
        fbRSA = fb;
        i = 0;
        J0x605:

        // End:0x8B9 [Loop If]
        if(i < OtherLoadingState.Length)
        {
            // End:0x763
            if(OtherLoadingState[i].LoadingMsgItem.TeamNum == 0)
            {
                fb.Y1 = fb.Y2;
                fb.Y2 = fb.Y1 + (float(15) * ratioY);
                C.DrawColor = OtherLoadingState[i].LoadingMsgItem.NameColor;
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].LoadingMsgItem.UserName, 3, 9.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2,,, true);
                C.DrawColor = OtherLoadingState[i].LoadingMsgItem.StateColor;
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].strLoadingMsg, 5, 9.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2,,, true);
                // [Explicit Continue]
                goto J0x8AF;
            }
            fbRSA.Y1 = fbRSA.Y2;
            fbRSA.Y2 = fbRSA.Y1 + (float(15) * ratioY);
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.NameColor;
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].LoadingMsgItem.UserName, 3, 9.0000000, fbRSA.X1 + listStepX, fbRSA.Y1, fbRSA.X2 + listStepX, fbRSA.Y2,,, true);
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.StateColor;
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].strLoadingMsg, 5, 9.0000000, fbRSA.X1 + listStepX, fbRSA.Y1, fbRSA.X2 + listStepX, fbRSA.Y2,,, true);
            J0x8AF:

            i++;
            // [Loop Continue]
            goto J0x605;
        }
    }
    ModeIndex = MM.kGame_GameMode;
    // End:0x96E
    if(Class'Engine_Decompressed.wGameSettings'.static.IsBotModeIndex(ModeIndex))
    {
        // End:0x912
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDeathMatch() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DeathMatch();
        }
        // End:0x940
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDomination() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Domination();
        }
        // End:0x96E
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeath() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_TeamDeath();
        }
    }
    // End:0x995
    if(MM.BotTutorial)
    {
        ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTutorial();
    }
    modeNameIndex = int(float(ModeIndex) % float(12));
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(23.0000000 * ratioX, 35.0000000 * ratioY, 278.0000000 * ratioX, 99.0000000 * ratioY);
    // End:0xC24
    if(ModeIndex < ModeFB.Length)
    {
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(256, 64, 0, Mat_img_hud_text);
        C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), ModeFB[ModeIndex].X1, ModeFB[ModeIndex].Y1, ModeFB[ModeIndex].X2, ModeFB[ModeIndex].Y2);
        // End:0xBC4
        if(MM.kGame_WeaponLimit != 0)
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, GameSubMode, 5, 14.0000000, (fb.X1 + ((img.width * float(2)) / float(3))) * ratioX, ((fb.Y1 + img.Height) + float(5)) * ratioY, ((fb.X1 - float(25)) + img.width) * ratioX, ((fb.Y1 + img.Height) + float(25)) * ratioY, kShadowColor, 0, false);
        }
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, ModeDescriptions[ModeIndex], 5, 13.0000000, 661.0000000 * ratioX, 53.0000000 * ratioY, 999.0000000 * ratioX, 72.0000000 * ratioY, kShadowColor, 0, false);        
    }
    else
    {
        // End:0xE56
        if(modeNameIndex < ModeFB.Length)
        {
            img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(256, 64, 0, Mat_img_hud_text2);
            C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), ModeFB2[modeNameIndex].X1, ModeFB2[modeNameIndex].Y1, ModeFB2[modeNameIndex].X2, ModeFB2[modeNameIndex].Y2);
            // End:0xDF9
            if(MM.kGame_WeaponLimit != 0)
            {
                Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, GameSubMode, 5, 14.0000000, (fb.X1 + ((img.width * float(2)) / float(3))) * ratioX, ((fb.Y1 + img.Height) + float(5)) * ratioY, ((fb.X1 - float(25)) + img.width) * ratioX, ((fb.Y1 + img.Height) + float(25)) * ratioY, kShadowColor, 0, false);
            }
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, ModeDescriptions[ModeIndex], 5, 13.0000000, 661.0000000 * ratioX, 53.0000000 * ratioY, 999.0000000 * ratioX, 72.0000000 * ratioY, kShadowColor, 0, false);
        }
    }
    // End:0xED0
    if(MiniMapInfoImage != none)
    {
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(256, 256, 28, MiniMapInfoImage);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, 753.0000000 * ratioX, 154.0000000 * ratioY, 1009.0000000 * ratioX, 410.0000000 * ratioY);
    }
    // End:0x10D1
    if(!MM.BotTutorial)
    {
        C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(715.0000000 * ratioX, 497.0000000 * ratioY, 872.0000000 * ratioX, 517.0000000 * ratioY);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, szMapInfo[0], 5, 17.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2, kShadowColor, 0, false);
        // End:0xFFD
        if(MM.IsSDRespawn())
        {
            C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(89, 253, byte(255), byte(255));
            GameRespawnType = Class'Engine_Decompressed.wGameSettings'.static.GetRespawnTypeByIndex(0);            
        }
        else
        {
            C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), 110, 233, byte(255));
            GameRespawnType = Class'Engine_Decompressed.wGameSettings'.static.GetRespawnTypeByIndex(1);
        }
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(893.0000000 * ratioX, 497.0000000 * ratioY, 1024.0000000 * ratioX, 517.0000000 * ratioY);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, GameRespawnType, 3, 17.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2, kShadowColor, 0, false);
    }
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(715.0000000 * ratioX, 530.0000000 * ratioY, 872.0000000 * ratioX, 550.0000000 * ratioY);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, szMapInfo[1], 5, 17.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2, kShadowColor, 0, false);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(890.0000000 * ratioX, 527.0000000 * ratioY, 1008.0000000 * ratioX, 553.0000000 * ratioY);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(118, 26, 28, Mat_img_RespawnLevelStar[MapDifficulty - 1]);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + img.width, img.Y + img.Height);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, szMapInfo[2], 3, 9.0000000, 19.0000000 * ratioX, 275.0000000 * ratioY, 232.0000000 * ratioX, 290.0000000 * ratioY, kShadowColor, 0, false);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(120, 74, 28, Mat_img_help_all);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(59.0000000 * ratioX, 301.0000000 * ratioY, 179.0000000 * ratioX, 375.0000000 * ratioY);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), ModeHelp[SelectHelp].X1, ModeHelp[SelectHelp].Y1, ModeHelp[SelectHelp].X2, ModeHelp[SelectHelp].Y2);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, strModeHelp1[SelectHelp], 0, 9.0000000, 19.0000000 * ratioX, 380.0000000 * ratioY, 232.0000000 * ratioX, 395.0000000 * ratioY, kShadowColor);
    // End:0x15C1
    if((float(213) * ratioX) < (fb.X2 - fb.X1))
    {
        StrLenPerOneLine = int((float(213) * ratioX) / ((fb.X2 - fb.X1) / float(Len(strModeHelp1[SelectHelp]))));
        tmpStrTip = Left(strModeHelp1[SelectHelp], StrLenPerOneLine);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, tmpStrTip, 0, 9.0000000, 19.0000000 * ratioX, 380.0000000 * ratioY, 232.0000000 * ratioX, 395.0000000 * ratioY, kShadowColor, 0, false);
        tmpStrTip = Mid(strModeHelp1[SelectHelp], StrLenPerOneLine, Len(strModeHelp1[SelectHelp]));
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, tmpStrTip, 0, 9.0000000, 19.0000000 * ratioX, 396.0000000 * ratioY, 232.0000000 * ratioX, 411.0000000 * ratioY, kShadowColor, 0, false);        
    }
    else
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, strModeHelp1[SelectHelp], 0, 9.0000000, 19.0000000 * ratioX, 380.0000000 * ratioY, 232.0000000 * ratioX, 395.0000000 * ratioY, kShadowColor, 0, false);
    }
    SupplyAddCount = 0;
    i = 0;
    J0x162C:

    // End:0x165E [Loop If]
    if(i < 3)
    {
        // End:0x1654
        if(SupplyImgNum[i] != -1)
        {
            SupplyAddCount++;
        }
        i++;
        // [Loop Continue]
        goto J0x162C;
    }
    // End:0x171A
    if(SupplyAddCount == 0)
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, CantUseSupplyLineText1, 4, 10.0000000, 13.0000000 * ratioX, 195.0000000 * ratioY, 226.0000000 * ratioX, 210.0000000 * ratioY, kShadowColor, 0, false);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, CantUseSupplyLineText2, 4, 10.0000000, 13.0000000 * ratioX, 211.0000000 * ratioY, 226.0000000 * ratioX, 226.0000000 * ratioY, kShadowColor, 0, false);        
    }
    else
    {
        i = 0;
        J0x1721:

        // End:0x1959 [Loop If]
        if(i < SupplyAddCount)
        {
            img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(68, 90, 28, Mat_img_SupplyIcon[SupplyImgNum[i]]);
            fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox((fbSupplyIcon[SupplyAddCount - 1].X1 + float(i * 71)) * ratioX, fbSupplyIcon[SupplyAddCount - 1].Y1 * ratioY, (fbSupplyIcon[SupplyAddCount - 1].X2 + float(i * 71)) * ratioX, fbSupplyIcon[SupplyAddCount - 1].Y2 * ratioY);
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.width * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + img.width, img.Y + img.Height);
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, strSupplyIcon[SupplyImgNum[i]], 4, 10.0000000, (fbSupplyStr[SupplyAddCount - 1].X1 + float(i * 71)) * ratioX, fbSupplyStr[SupplyAddCount - 1].Y1 * ratioY, (fbSupplyStr[SupplyAddCount - 1].X2 + float(i * 71)) * ratioX, fbSupplyStr[SupplyAddCount - 1].Y2 * ratioY, kShadowColor, 0, false);
            i++;
            // [Loop Continue]
            goto J0x1721;
        }
    }
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, szMapInfo[3], 3, 9.0000000, 28.0000000 * ratioX, 137.0000000 * ratioY, 222.0000000 * ratioX, 152.0000000 * ratioY, kShadowColor, 0, false);
    // End:0x1A0A
    if(ModeIndex == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Defence())
    {
        strHelpTip = szTipText_Defence[iTipIndex];        
    }
    else
    {
        strHelpTip = szTipText[iTipIndex];
    }
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), 198, 0, byte(255));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, strHelpTip, 0, 12.0000000, 37.0000000 * ratioX, 708.0000000 * ratioY, 760.0000000 * ratioX, 768.0000000 * ratioY, kShadowColor, 0, false);
    //return;    
}

defaultproperties
{
    strSupplyIcon[1]="UAV"
    strSupplyIcon[2]="Helicopter"
    strSupplyIcon[3]="Artillery"
    strSupplyIcon[4]="Sentrygun"
    strModeHelp1[0]="Hold right click to aim down sight."
    strModeHelp1[1]="Press 'Shift' to sprint."
    strModeHelp1[2]="Request helicopter support with the helicopter pack."
    strModeHelp1[3]="Request artillery support with the artillery pack."
    strModeHelp1[4]="Request UAV support with the UAV pack."
    strModeHelp1[5]="Recover lost health with the health pack."
    strModeHelp1[6]="Use the AT-4 rocket launcher located in certain locations on maps."
    strModeHelp1[7]="Use the flame thrower located in certain locations on maps."
    strModeHelp1[8]="Use the mounted machine gun located in certain locations on maps."
    strModeHelp1[9]="Use the sniper rifle scope to see far distance enemies."
    strModeHelp1[10]="Press 'E' for melee attack."
    szTipText[0]="Push shift to sprint."
    szTipText[1]="Use Ctrl to toggle between standing, crouching, and laying prone."
    szTipText[2]="Press spacebar to jump."
    szTipText[3]="Right-click the mouse to aim your weapon for better accuracy."
    szTipText[4]="Press E to melee a nearby enemy."
    szMapInfo[0]="Respawn Type: "
    szMapInfo[1]="Level: "
    szMapInfo[2]="Tips"
    szMapInfo[3]="Supply pack"
    szTipText_Defence[0]="Tip : The game is over when the Nuclear Reactor is destroyed."
    szTipText_Defence[1]="Tip : Items can be purchased and used during game play."
    szTipText_Defence[2]="Tip : Points earned during game play are used to acquire rewards."
    CantUseSupplyLineText1="Supply packs are not"
    CantUseSupplyLineText2="given in this map."
    fbSupplyIcon[0]=(X1=85.0000000,Y1=165.0000000,X2=153.0000000,Y2=255.0000000)
    fbSupplyIcon[1]=(X1=48.0000000,Y1=165.0000000,X2=116.0000000,Y2=255.0000000)
    fbSupplyIcon[2]=(X1=14.0000000,Y1=165.0000000,X2=82.0000000,Y2=255.0000000)
    fbSupplyStr[0]=(X1=86.0000000,Y1=235.0000000,X2=152.0000000,Y2=250.0000000)
    fbSupplyStr[1]=(X1=49.0000000,Y1=235.0000000,X2=115.0000000,Y2=250.0000000)
    fbSupplyStr[2]=(X1=15.0000000,Y1=235.0000000,X2=81.0000000,Y2=250.0000000)
}