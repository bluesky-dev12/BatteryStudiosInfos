class wBTLoadingScreenDrawer extends Object
    native;

struct native export OtherLoadingStateItem
{
    var LoadingMessageItem LoadingMsgItem;
    var string strLoadingMsg;
};

var Material Mat_img_15_or_18;
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
var wMatchMaker MM;
var array<OtherLoadingStateItem> OtherLoadingState;
var string MyLoadingState;
var Material LoadingBackGroundImage;
var float iProgress;
var float iPrevProgress;
var float Alpha;
var bool bRefreshRender;
var bool bFirstRender;

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
        ModeHelp.Length = 12;
        ModeHelp[0] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 400.0000000, 137.0000000);
        ModeHelp[1] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 137.0000000, 400.0000000, 274.0000000);
        ModeHelp[2] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 274.0000000, 400.0000000, 411.0000000);
        ModeHelp[3] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 411.0000000, 400.0000000, 548.0000000);
        ModeHelp[4] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 548.0000000, 400.0000000, 685.0000000);
        ModeHelp[5] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 685.0000000, 400.0000000, 822.0000000);
        ModeHelp[6] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 822.0000000, 400.0000000, 959.0000000);
        ModeHelp[7] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 0.0000000, 800.0000000, 137.0000000);
        ModeHelp[8] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 137.0000000, 800.0000000, 274.0000000);
        ModeHelp[9] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 274.0000000, 800.0000000, 411.0000000);
        ModeHelp[10] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 411.0000000, 800.0000000, 548.0000000);
        ModeHelp[11] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 400.0000000, 137.0000000);
        // End:0x645
        if(MM.kLevel <= 5)
        {
            SelectHelp[0] = Rand(ModeHelp.Length - 1);
            SelectHelp[1] = Rand(ModeHelp.Length - 1);
            J0x55B:

            // End:0x584 [Loop If]
            if(SelectHelp[0] == SelectHelp[1])
            {
                SelectHelp[1] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x55B;
            }
            SelectHelp[2] = Rand(ModeHelp.Length - 1);
            J0x598:

            // End:0x5D9 [Loop If]
            if((SelectHelp[0] == SelectHelp[2]) || SelectHelp[1] == SelectHelp[2])
            {
                SelectHelp[2] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x598;
            }
            SelectHelp[3] = Rand(ModeHelp.Length - 1);
            J0x5ED:

            // End:0x645 [Loop If]
            if(((SelectHelp[0] == SelectHelp[3]) || SelectHelp[1] == SelectHelp[3]) || SelectHelp[2] == SelectHelp[3])
            {
                SelectHelp[3] = Rand(ModeHelp.Length - 1);
                // [Loop Continue]
                goto J0x5ED;
            }
        }
        Initialize();
        Mat_img_hud_text = Material(DynamicLoadObject("Warfare_UI_HUD.Text.img_hud_text", Class'Engine_Decompressed.Material'));
        // End:0x699
        if(Mat_img_hud_text != none)
        {
            AddToRoot(Mat_img_hud_text);
        }
        Mat_img_help_line = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.img_help_line", Class'Engine_Decompressed.Material'));
        // End:0x6F0
        if(Mat_img_help_line != none)
        {
            AddToRoot(Mat_img_help_line);
        }
        Mat_img_help_all = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.img_help_all", Class'Engine_Decompressed.Material'));
        // End:0x746
        if(Mat_img_help_all != none)
        {
            AddToRoot(Mat_img_help_all);
        }
        // End:0x796
        if(Class'Engine_Decompressed.LevelInfo'.default.bTeenVersion)
        {
            Mat_img_15_or_18 = Material(DynamicLoadObject("Warfare_UI_UI.NHN_games.img_mark_15", Class'Engine_Decompressed.Material'));            
        }
        else
        {
            Mat_img_15_or_18 = Material(DynamicLoadObject("Warfare_UI_UI.NHN_games.img_mark_18", Class'Engine_Decompressed.Material'));
        }
        // End:0x7E7
        if(Mat_img_15_or_18 != none)
        {
            AddToRoot(Mat_img_15_or_18);
        }
        Mat_gauge_loading = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.gauge_loading", Class'Engine_Decompressed.Material'));
        // End:0x83E
        if(Mat_gauge_loading != none)
        {
            AddToRoot(Mat_gauge_loading);
        }
        Mat_gauge_loading_back = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.gauge_loading_back", Class'Engine_Decompressed.Material'));
        // End:0x89A
        if(Mat_gauge_loading_back != none)
        {
            AddToRoot(Mat_gauge_loading_back);
        }
        Mat_img_point_help = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.img_point_help", Class'Engine_Decompressed.Material'));
        // End:0x8F2
        if(Mat_img_point_help != none)
        {
            AddToRoot(Mat_img_point_help);
        }
        Mat_img_load_pllist = Material(DynamicLoadObject("Warfare_UI_Map.LoadingImage.img_load_pllist", Class'Engine_Decompressed.Material'));
        // End:0x94B
        if(Mat_img_load_pllist != none)
        {
            AddToRoot(Mat_img_load_pllist);
        }
        LoadingBackGroundImage = MatchMaker.GetLoadingImage();
        // End:0x97B
        if(LoadingBackGroundImage != none)
        {
            AddToRoot(LoadingBackGroundImage);
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
    if(Mat_img_15_or_18 == none)
    {
        RemoveFromRoot(Mat_img_15_or_18);
        Mat_img_15_or_18 = none;
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
        LoadingBackGroundImage = none;
        return true;
    }
    //return;    
}

event bool UpdateProgress(int CurrenetProgress)
{
    // End:0x1B
    if(iPrevProgress == float(CurrenetProgress))
    {
        bRefreshRender = false;
        return false;
    }
    iPrevProgress = iProgress;
    iProgress = float(CurrenetProgress);
    bRefreshRender = true;
    // End:0x57
    if(iProgress < float(45))
    {
        Alpha = 0.0000000;        
    }
    else
    {
        // End:0x73
        if(iProgress > float(55))
        {
            Alpha = 1.0000000;            
        }
        else
        {
            // End:0xA9
            if((iProgress >= float(45)) && iProgress <= float(55))
            {
                Alpha = (iProgress - float(45)) / 10.0000000;
            }
        }
    }
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

    C.Style = 5;
    C.ColorModulate = C.default.ColorModulate;
    ratioX = C.ClipX / float(1024);
    ratioY = C.ClipY / float(768);
    // End:0x7C
    if(bFirstRender == false)
    {
        bFirstRender = true;
    }
    // End:0x8A
    if(bRefreshRender == false)
    {
        return;
    }
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(1024, 768, 28, LoadingBackGroundImage);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, 0.0000000, 0.0000000, C.ClipX, C.ClipY);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(220, 128, 28, Mat_img_15_or_18);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(798.0000000 * ratioX, 4.0000000 * ratioY, (798.0000000 + float(220)) * ratioX, (4.0000000 + float(128)) * ratioY);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(246.0000000 * ratioX, 548.0000000 * ratioY, 778.0000000 * ratioX, 574.0000000 * ratioY);
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(532, 26, 28, Mat_gauge_loading_back);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, string(int(iProgress)) $ "%", 3, 11.0000000, fb.X2, 553.0000000 * ratioY, 1024.0000000 * ratioX, 579.0000000 * ratioY, int(float(5) * ratioX), 0, 0, 0,,, true);
    // End:0x2FB
    if(iProgress > float(100))
    {
        iProgress = 100.0000000;
    }
    fb.X2 = fb.X1 + (((float(778) * ratioX) - fb.X1) * (iProgress / float(100)));
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(532, 26, 28, Mat_gauge_loading);
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
    // End:0x6A6
    if(OtherLoadingState.Length > 0)
    {
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(809.0000000 * ratioX, 143.0000000 * ratioY, 1006.0000000 * ratioX, (165.0000000 * ratioY) + ((float(16) * ratioY) * float(OtherLoadingState.Length)));
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 15, Mat_img_load_pllist);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 = 824.0000000 * ratioX;
        fb.X2 = 994.0000000 * ratioX;
        fb.Y2 = 154.0000000 * ratioY;
        listStepY = 16.0000000 * ratioY;
        listStepX = 958.0000000 * ratioX;
        i = 0;
        J0x504:

        // End:0x63E [Loop If]
        if(i < OtherLoadingState.Length)
        {
            fb.Y1 = fb.Y2;
            fb.Y2 = fb.Y1 + listStepY;
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.NameColor;
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].LoadingMsgItem.UserName, 0, 10.0000000, fb.X1, fb.Y1, listStepX, fb.Y2,,, true);
            C.DrawColor = OtherLoadingState[i].LoadingMsgItem.StateColor;
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, OtherLoadingState[i].strLoadingMsg, 2, 10.0000000, listStepX, fb.Y1, fb.X2, fb.Y2,,, true);
            i++;
            // [Loop Continue]
            goto J0x504;
        }
        C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, string(OtherLoadingState.Length), 0, 10.0000000, 0.0000000, 0.0000000, 100.0000000, 50.0000000,,, true);
    }
    // End:0xACB
    if(MM.kLevel <= 5)
    {
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(16, 16, 15, Mat_img_help_line);
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(310.0000000 * ratioX, 199.0000000 * ratioY, 714.0000000 * ratioX, 477.0000000 * ratioY);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImage(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2);
        img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(1024, 1024, 0, Mat_img_help_all);
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(312.0000000 * ratioX, 201.0000000 * ratioY, 712.0000000 * ratioX, 338.0000000 * ratioY);
        C.DrawColor.A = byte(float(255) * (float(1) - Alpha));
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2, ModeHelp[SelectHelp[0]].X1, ModeHelp[SelectHelp[0]].Y1, ModeHelp[SelectHelp[0]].X2, ModeHelp[SelectHelp[0]].Y2);
        C.DrawColor.A = byte(float(255) * Alpha);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2, ModeHelp[SelectHelp[2]].X1, ModeHelp[SelectHelp[2]].Y1, ModeHelp[SelectHelp[2]].X2, ModeHelp[SelectHelp[2]].Y2);
        fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(312.0000000 * ratioX, 338.0000000 * ratioY, 712.0000000 * ratioX, 475.0000000 * ratioY);
        C.DrawColor.A = byte(float(255) * (float(1) - Alpha));
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2, ModeHelp[SelectHelp[1]].X1, ModeHelp[SelectHelp[1]].Y1, ModeHelp[SelectHelp[1]].X2, ModeHelp[SelectHelp[1]].Y2);
        C.DrawColor.A = byte(float(255) * Alpha);
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2, ModeHelp[SelectHelp[3]].X1, ModeHelp[SelectHelp[3]].Y1, ModeHelp[SelectHelp[3]].X2, ModeHelp[SelectHelp[3]].Y2);
    }
    C.DrawColor.A = byte(255);
    ModeIndex = MM.kGame_GameMode;
    // End:0xB98
    if(Class'Engine_Decompressed.wGameSettings'.static.IsBotModeIndex(ModeIndex))
    {
        // End:0xB3C
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDeathMatch() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DeathMatch();
        }
        // End:0xB6A
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDomination() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Domination();
        }
        // End:0xB98
        if(Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeath() == ModeIndex)
        {
            ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_TeamDeath();
        }
    }
    // End:0xBBF
    if(MM.BotTutorial)
    {
        ModeIndex = Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTutorial();
    }
    img = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(1024, 1024, 4, Mat_img_hud_text);
    fb = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeFloatBox(410.0000000 * ratioX, 32.0000000 * ratioY, 614.0000000 * ratioX, 84.0000000 * ratioY);
    // End:0xDAC
    if(ModeIndex < ModeFB.Length)
    {
        Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawImageWithClipArea(C, img, fb.X1, fb.Y1, fb.X2, fb.Y2, ModeFB[ModeIndex].X1, ModeFB[ModeIndex].Y1, ModeFB[ModeIndex].X2, ModeFB[ModeIndex].Y2);
        C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
        // End:0xD59
        if(MM.kGame_WeaponLimit == 0)
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, ModeDescriptions[ModeIndex], 4, 15.0000000, 148.0000000 * ratioX, 95.0000000 * ratioY, 876.0000000 * ratioX, 123.0000000 * ratioY,,, true);            
        }
        else
        {
            Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, GameSubMode, 4, 15.0000000, 148.0000000 * ratioX, 95.0000000 * ratioY, 876.0000000 * ratioX, 123.0000000 * ratioY,,, true);
        }
    }
    C.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    Class'Engine_Decompressed.BTCustomDrawHK'.static.DrawString(C, MyLoadingState, 4, 11.0000000, 148.0000000 * ratioX, 578.0000000 * ratioY, 876.0000000 * ratioX, 602.0000000 * ratioY,,, true);
    //return;    
}
