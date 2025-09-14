class wBTLoadingScreenDrawer extends Object
    native;

struct native export OtherLoadingStateItem
{
    var LoadingMessageItem LoadingMsgItem;
    var string strLoadingMsg;
};

var Material Mat_gauge_loading;
var Material Mat_gauge_loading_back;
var Material Mat_img_point_help;
var Material Mat_img_load_pllist;
var Material Mat_img_hud_text;
var Material Mat_img_help_line;
var Material Mat_img_help_all;
var array<FloatBox> ModeFB;
var array<FloatBox> ModeHelp;
var int SelectHelp[4];
var int CurrentHelp[2];
var array<string> ModeNames;
var array<string> ModeDescriptions;
var string GameSubMode;
var string GameDifficulty;
var string GameRespawnType;
var string MapDifficultyDisplay;
var int MapDifficulty;
var int MapID;
var wMatchMaker MM;
var array<OtherLoadingStateItem> OtherLoadingState;
var string MyLoadingState;
var Material LoadingBackGroundImage;
var Material MiniMapInfoImage;
var float iProgress;
var float iPrevProgress;
var float Alpha;
var bool bRefreshRender;
var bool bFirstRender;
var localized string szTipText[5];
var localized string szMapInfo[5];
var int iTipIndex;
var int iRespawnIndex;

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
    iTipIndex = Rand(5);
    //return;    
}

event bool CreateBackGroundImage(wMatchMaker MatchMaker)
{
    local array<GameModeInfo> GameModeInfos;
    local int i;

    // End:0x56
    if(MatchMaker == none)
    {
        Log("wBTLoadingScreenDrawer::CreateBackGroundImage() MatchMaker is none");
        return false;        
    }
    else
    {
        MM = MatchMaker;
        GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
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
        GameSubMode = Class'Engine.wGameSettings'.static.GetWeaponRestrictionByIndex(MM.kGame_WeaponLimit);
        MapID = MM.MapSettings.GetMapInfo(MM.szMapName).MapID;
        MapDifficulty = MM.MapSettings.GetMapInfo(MM.szMapName).MapDifficulty;
        MapDifficultyDisplay = MM.MapSettings.GetMapInfo(MM.szMapName).MapDifficultyDisplay;
        ModeFB.Length = 12;
        ModeFB[0] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 688.0000000, 256.0000000, 752.0000000);
        ModeFB[1] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 688.0000000, 512.0000000, 752.0000000);
        ModeFB[2] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 624.0000000, 256.0000000, 688.0000000);
        ModeFB[3] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 624.0000000, 512.0000000, 688.0000000);
        ModeFB[4] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 752.0000000, 256.0000000, 816.0000000);
        ModeFB[5] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 688.0000000, 256.0000000, 752.0000000);
        ModeFB[6] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 624.0000000, 512.0000000, 688.0000000);
        ModeFB[7] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 624.0000000, 256.0000000, 688.0000000);
        ModeFB[8] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[9] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[10] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(587.0000000, 816.0000000, 819.0000000, 891.0000000);
        ModeFB[11] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(256.0000000, 816.0000000, 512.0000000, 880.0000000);
        ModeHelp.Length = 12;
        ModeHelp[0] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 400.0000000, 137.0000000);
        ModeHelp[1] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 137.0000000, 400.0000000, 274.0000000);
        ModeHelp[2] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 274.0000000, 400.0000000, 411.0000000);
        ModeHelp[3] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 411.0000000, 400.0000000, 548.0000000);
        ModeHelp[4] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 548.0000000, 400.0000000, 685.0000000);
        ModeHelp[5] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 685.0000000, 400.0000000, 822.0000000);
        ModeHelp[6] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 822.0000000, 400.0000000, 959.0000000);
        ModeHelp[7] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 0.0000000, 800.0000000, 137.0000000);
        ModeHelp[8] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 137.0000000, 800.0000000, 274.0000000);
        ModeHelp[9] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 274.0000000, 800.0000000, 411.0000000);
        ModeHelp[10] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 411.0000000, 800.0000000, 548.0000000);
        ModeHelp[11] = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 400.0000000, 137.0000000);
        // End:0x6E4
        if(MM.kLevel <= 5)
        {
            SelectHelp[0] = Rand(ModeHelp.Length - 1);
            SelectHelp[1] = Rand(ModeHelp.Length - 1);
            J0x5FA:

            // End:0x623 [Loop If]
            if(SelectHelp[0] == SelectHelp[1])
            {
                SelectHelp[1] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x5FA;
            }
            SelectHelp[2] = Rand(ModeHelp.Length - 1);
            J0x637:

            // End:0x678 [Loop If]
            if((SelectHelp[0] == SelectHelp[2]) || SelectHelp[1] == SelectHelp[2])
            {
                SelectHelp[2] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x637;
            }
            SelectHelp[3] = Rand(ModeHelp.Length - 1);
            J0x68C:

            // End:0x6E4 [Loop If]
            if(((SelectHelp[0] == SelectHelp[3]) || SelectHelp[1] == SelectHelp[3]) || SelectHelp[2] == SelectHelp[3])
            {
                SelectHelp[3] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x68C;
            }
        }
        Initialize();
        Mat_img_hud_text = Material(DynamicLoadObject("Warfare_GP_UI_HUD.Text.img_hud_text", Class'Engine.Material'));
        // End:0x73B
        if(Mat_img_hud_text != none)
        {
            AddToRoot(Mat_img_hud_text);
        }
        Mat_img_help_line = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_help_line", Class'Engine.Material'));
        // End:0x795
        if(Mat_img_help_line != none)
        {
            AddToRoot(Mat_img_help_line);
        }
        Mat_img_help_all = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_help_all", Class'Engine.Material'));
        // End:0x7EE
        if(Mat_img_help_all != none)
        {
            AddToRoot(Mat_img_help_all);
        }
        Mat_gauge_loading = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.gauge_loading", Class'Engine.Material'));
        // End:0x848
        if(Mat_gauge_loading != none)
        {
            AddToRoot(Mat_gauge_loading);
        }
        Mat_gauge_loading_back = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.gauge_loading_back", Class'Engine.Material'));
        // End:0x8A7
        if(Mat_gauge_loading_back != none)
        {
            AddToRoot(Mat_gauge_loading_back);
        }
        Mat_img_point_help = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_point_help", Class'Engine.Material'));
        // End:0x902
        if(Mat_img_point_help != none)
        {
            AddToRoot(Mat_img_point_help);
        }
        Mat_img_load_pllist = Material(DynamicLoadObject("Warfare_GP_UI_Map.LoadingImage.img_load_pllist", Class'Engine.Material'));
        // End:0x95E
        if(Mat_img_load_pllist != none)
        {
            AddToRoot(Mat_img_load_pllist);
        }
        LoadingBackGroundImage = MatchMaker.GetLoadingImage();
        MiniMapInfoImage = MatchMaker.GetMiniMapInfoImage();
        // End:0x9E2
        if(LoadingBackGroundImage != none)
        {
            AddToRoot(LoadingBackGroundImage);
            // End:0x9B7
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
    if(Mat_img_help_line == none)
    {
        RemoveFromRoot(Mat_img_help_line);
        Mat_img_help_line = none;
    }
    // End:0x57
    if(Mat_img_help_all == none)
    {
        RemoveFromRoot(Mat_img_help_all);
        Mat_img_help_all = none;
    }
    // End:0x74
    if(Mat_gauge_loading == none)
    {
        RemoveFromRoot(Mat_gauge_loading);
        Mat_gauge_loading = none;
    }
    // End:0x91
    if(Mat_gauge_loading_back == none)
    {
        RemoveFromRoot(Mat_gauge_loading_back);
        Mat_gauge_loading_back = none;
    }
    // End:0xAE
    if(Mat_img_point_help == none)
    {
        RemoveFromRoot(Mat_img_point_help);
        Mat_img_point_help = none;
    }
    // End:0xCB
    if(Mat_img_load_pllist == none)
    {
        RemoveFromRoot(Mat_img_load_pllist);
        Mat_img_load_pllist = none;
    }
    // End:0x12E
    if(LoadingBackGroundImage == none)
    {
        Log("wBTLoadingScreenDrawer::DestroyBackGroundImage() LoadingBackGroundImage is none");
        return false;        
    }
    else
    {
        RemoveFromRoot(LoadingBackGroundImage);
        // End:0x14F
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

    // End:0xDE [Loop If]
    if(i < OtherLoadingState.Length)
    {
        // End:0xD4
        if(OtherLoadingState[i].LoadingMsgItem.UserName == Item.UserName)
        {
            OtherLoadingState[i].LoadingMsgItem.UserName = Item.UserName;
            OtherLoadingState[i].LoadingMsgItem.LoadingState = Item.LoadingState;
            OtherLoadingState[i].LoadingMsgItem.NameColor = Item.NameColor;
            OtherLoadingState[i].LoadingMsgItem.StateColor = Item.StateColor;
            OtherLoadingState[i].strLoadingMsg = strMsg;
            // [Explicit Break]
            goto J0xDE;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xDE:

    // End:0x1A5
    if(i == OtherLoadingState.Length)
    {
        OtherLoadingState.Insert(OtherLoadingState.Length, 1);
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.UserName = Item.UserName;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.LoadingState = Item.LoadingState;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.NameColor = Item.NameColor;
        OtherLoadingState[OtherLoadingState.Length - 1].LoadingMsgItem.StateColor = Item.StateColor;
        OtherLoadingState[OtherLoadingState.Length - 1].strLoadingMsg = strMsg;
    }
    bRefreshRender = true;
    //return;    
}

event ClearOtherLoadingState()
{
    OtherLoadingState.Remove(0, OtherLoadingState.Length);
    //return;    
}

event DrawLoadingScreen(Canvas C)
{
    local int i, ModeIndex;
    local float ratioX, ratioY, listStepY, listStepX;
    local FloatBox fb;
    local Image img;
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
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(1024, 768, 28, LoadingBackGroundImage);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, img, 0.0000000, 0.0000000, C.ClipX, C.ClipY);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(27.0000000 * ratioX, 653.0000000 * ratioY, 763.0000000 * ratioX, 682.0000000 * ratioY);
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(736, 31, 28, Mat_gauge_loading_back);
    Class'Engine.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.Width * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + img.Width, img.Y + img.Height);
    // End:0x209
    if(iProgress > float(100))
    {
        iProgress = 100.0000000;
    }
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(30.0000000 * ratioX, 656.0000000 * ratioY, 760.0000000 * ratioX, 679.0000000 * ratioY);
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(730, 23, 28, Mat_gauge_loading);
    loadingBarWidth = img.Width * (iProgress / float(100));
    Class'Engine.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (loadingBarWidth * ratioX), fb.Y1 + (img.Height * ratioY), img.X, img.Y, img.X + loadingBarWidth, img.Y + img.Height);
    C.DrawColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
    kShadowColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, string(int(iProgress)) $ "%", 4, 14.0000000, 30.0000000 * ratioX, 658.0000000 * ratioY, 763.0000000 * ratioX, 679.0000000 * ratioY, 0, 0, 0, 0, kShadowColor, 0, false);
    // End:0x64F
    if(OtherLoadingState.Length > 0)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(19.0000000 * ratioX, 297.0000000 * ratioY, 219.0000000 * ratioX, (319.0000000 * ratioY) + ((float(16) * ratioY) * float(OtherLoadingState.Length)));
        img = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 15, Mat_img_load_pllist);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 = 34.0000000 * ratioX;
        fb.X2 = 204.0000000 * ratioX;
        fb.Y2 = 308.0000000 * ratioY;
        listStepY = 16.0000000 * ratioY;
        listStepX = 168.0000000 * ratioX;
        i = 0;
        J0x515:

        // End:0x64F [Loop If]
        if(i < OtherLoadingState.Length)
        {
            fb.Y1 = fb.Y2;
            fb.Y2 = fb.Y1 + listStepY;
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.NameColor;
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].LoadingMsgItem.UserName, 0, 10.0000000, fb.X1, fb.Y1, listStepX, fb.Y2,,, true);
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.StateColor;
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].strLoadingMsg, 2, 10.0000000, listStepX, fb.Y1, fb.X2, fb.Y2,,, true);
            i++;
            // [Loop Continue]
            goto J0x515;
        }
    }
    ModeIndex = MM.kGame_GameMode;
    // End:0x704
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(ModeIndex))
    {
        // End:0x6A8
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch() == ModeIndex)
        {
            ModeIndex = Class'Engine.wGameSettings'.static.GetModeIndex_DeathMatch();
        }
        // End:0x6D6
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotDomination() == ModeIndex)
        {
            ModeIndex = Class'Engine.wGameSettings'.static.GetModeIndex_Domination();
        }
        // End:0x704
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeath() == ModeIndex)
        {
            ModeIndex = Class'Engine.wGameSettings'.static.GetModeIndex_TeamDeath();
        }
    }
    // End:0x72B
    if(MM.BotTutorial)
    {
        ModeIndex = Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial();
    }
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 64, 0, Mat_img_hud_text);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(23.0000000 * ratioX, 35.0000000 * ratioY, 278.0000000 * ratioX, 99.0000000 * ratioY);
    // End:0x9AE
    if(ModeIndex < ModeFB.Length)
    {
        C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X1 + (img.Width * ratioX), fb.Y1 + (img.Height * ratioY), ModeFB[ModeIndex].X1, ModeFB[ModeIndex].Y1, ModeFB[ModeIndex].X2, ModeFB[ModeIndex].Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ModeDescriptions[ModeIndex], 0, 14.0000000, 31.0000000 * ratioX, 105.0000000 * ratioY, 876.0000000 * ratioX, 143.0000000 * ratioY, kShadowColor, 0, false);
        // End:0x9AE
        if(MM.kGame_WeaponLimit != 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, GameSubMode, 0, 14.0000000, (fb.X1 + (img.Width * ratioX)) - (float(31) * ratioX), (fb.Y1 + (img.Height * ratioY)) - (float(19) * ratioY), (fb.X1 + (img.Width * ratioX)) + (float(876) * ratioX), fb.Y1 + (img.Height * ratioY), kShadowColor, 0, false);
        }
    }
    // End:0xA28
    if(MiniMapInfoImage != none)
    {
        img = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 256, 28, MiniMapInfoImage);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, img, 753.0000000 * ratioX, 154.0000000 * ratioY, 1009.0000000 * ratioX, 410.0000000 * ratioY);
    }
    // End:0xC29
    if(!MM.BotTutorial)
    {
        C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(715.0000000 * ratioX, 511.0000000 * ratioY, 884.0000000 * ratioX, 531.0000000 * ratioY);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, szMapInfo[0], 2, 17.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2, kShadowColor, 0, false);
        // End:0xB55
        if(MM.IsSDRespawn())
        {
            C.DrawColor = Class'Engine.Canvas'.static.MakeColor(89, 253, byte(255), byte(255));
            GameRespawnType = Class'Engine.wGameSettings'.static.GetRespawnTypeByIndex(0);            
        }
        else
        {
            C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 110, 233, byte(255));
            GameRespawnType = Class'Engine.wGameSettings'.static.GetRespawnTypeByIndex(1);
        }
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(894.0000000 * ratioX, 511.0000000 * ratioY, 1024.0000000 * ratioX, 531.0000000 * ratioY);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, GameRespawnType, 0, 17.0000000, fb.X1, fb.Y1, fb.X1, fb.Y1, kShadowColor, 0, false);
    }
    C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(715.0000000 * ratioX, 540.0000000 * ratioY, 884.0000000 * ratioX, 560.0000000 * ratioY);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, szMapInfo[1], 2, 17.0000000, fb.X1, fb.Y1, fb.X2, fb.Y2, kShadowColor, 0, false);
    // End:0xD23
    if(MapDifficulty == 1)
    {
        C.DrawColor = Class'Engine.Canvas'.static.MakeColor(142, 198, 41, byte(255));        
    }
    else
    {
        // End:0xD5C
        if(MapDifficulty == 2)
        {
            C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 202, 60, byte(255));            
        }
        else
        {
            // End:0xD95
            if(MapDifficulty == 3)
            {
                C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 78, 74, byte(255));                
            }
            else
            {
                C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
            }
        }
    }
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(894.0000000 * ratioX, 540.0000000 * ratioY, 1024.0000000 * ratioX, 560.0000000 * ratioY);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, MapDifficultyDisplay, 0, 17.0000000, fb.X1, fb.Y1, fb.X1, fb.Y1, kShadowColor, 0, false);
    C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 198, 0, byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, szTipText[iTipIndex], 0, 12.0000000, 37.0000000 * ratioX, 708.0000000 * ratioY, 760.0000000 * ratioX, 768.0000000 * ratioY, kShadowColor, 0, false);
    //return;    
}

defaultproperties
{
    szTipText[0]="Push shift to run."
    szTipText[1]="Use Ctrl to toggle between standing, crouching, and laying prone."
    szTipText[2]="Press spacebar to jump."
    szTipText[3]="Right-click the mouse to aim your weapon for better accuracy."
    szTipText[4]="Press E to melee a nearby enemy."
    szMapInfo[0]="Respawn Type: "
    szMapInfo[1]="Level: "
}