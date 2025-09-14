class BTWindowRoomInfoHK extends BTWindowHK
    editinlinenew
    instanced;

struct UIRoomInfoStruct
{
    var string RoomName;
    var string RoomPassword;
    var string MapName;
    var int GameMode;
    var int TimeLimit;
    var int Score;
    var int UserCount;
    var int WeaponLimit;
    var bool bTeamBalance;
    var bool bMultiBomb;
    var bool bPlayWithBots;
    var int BotUserTeam;
    var int BotNum0;
    var int BotNum1;
    var int BotDifficulty;
    var bool bResPawnType;
};

var UIRoomInfoStruct UIRoomInfo;
var UIRoomInfoStruct UIRoomInfo_Default;
var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
var() automated FloatBox fbSeparator;
var export editinline BTOwnerDrawImageHK Separator;
var FloatBox fbLabelCommonTop[9];
var localized string strLabelCommonTop[9];
var export editinline BTOwnerDrawImageHK LabelCommonTop[9];
var FloatBox fbLabelCommonBottom[7];
var localized string strLabelCommonBottom[7];
var export editinline BTOwnerDrawImageHK LabelCommonBottom[7];
var FloatBox fbLabelAdd[4];
var export editinline BTOwnerDrawImageHK LabelAdd[4];
var localized string strLabelSwitchSide;
var localized string strLabelBombPossesion;
var localized string strBombForEveryone;
var localized string strBombForOne;
var localized string strLabelChangeAD;
var localized string strLabelChangeRound;
var localized string strUserCount;
var localized string strLabelBot_UserTeam[4];
var localized string strLabelBot_Difficult[6];
var localized string strLabelBot_AF[2];
var localized string strLabelBot_RSA[2];
var FloatBox fbEdit[2];
var FloatBox fbLabelEdit[2];
var export editinline BTOwnerDrawImageHK LabelEdit[2];
var export editinline BTEditBoxHK Edit[2];
var export editinline BTEditBoxHK EditRoomName;
var export editinline BTEditBoxHK EditPassword;
var FloatBox fbCombo[7];
var FloatBox fbComboAdd[4];
var export editinline BTComboBoxHK Combo[7];
var export editinline BTComboBoxHK ComboAdd[4];
var export editinline BTComboBoxMapHK ComboMap;
var export editinline BTComboBoxHK ComboGameMode;
var export editinline BTComboBoxHK ComboGameTime;
var export editinline BTComboBoxHK ComboWeaponRestriction;
var export editinline BTComboBoxHK ComboUserCount;
var export editinline BTComboBoxHK ComboTargetScore;
var export editinline BTComboBoxHK ComboIsHardCore;
var export editinline BTComboBoxHK ComboSwitchSide;
var export editinline BTComboBoxHK ComboBombPossesion;
var export editinline BTComboBoxHK ComboChangeAD;
var export editinline BTComboBoxHK ComboChangeRound;
var export editinline BTComboBoxHK ComboBot_UserTeam;
var export editinline BTComboBoxHK ComboBot_Diffcult;
var export editinline BTComboBoxHK ComboBot_AF;
var export editinline BTComboBoxHK ComboBot_RSA;
var FloatBox fbRadio[7];
var export editinline BTRadioOnOffButtonHK Radio[7];
var export editinline BTRadioOnOffButtonHK RadioTeamDamage;
var export editinline BTRadioOnOffButtonHK RadioFreeCamera;
var export editinline BTRadioOnOffButtonHK RadioTeamBalance;
var export editinline BTRadioOnOffButtonHK RadioKillCam;
var export editinline BTRadioOnOffButtonHK RadioJoinInPlaying;
var export editinline BTRadioOnOffButtonHK RadioVoiceChatting;
var export editinline BTRadioOnOffButtonHK RadioVote;
var() automated BTOwnerDrawImageHK ImageMap;
var() automated BTOwnerDrawImageHK ImageSupply[3];
var() automated BTOwnerDrawImageHK NewMapIcon;
var export editinline BTRadioOnOffButtonHK ReSpawnRadioBtn;
var FloatBox fbReSpawnRadio;
var localized string CaptionReSpawn;
var localized string CaptionRandom;
var localized string CaptionFixed;
var() automated BTOwnerDrawImageHK LabelReSpawn;
var FloatBox fLabelReSpawn;
var bool bEnableFillModeList;

function InitializeRoomInfoStruct(wMatchMaker MM)
{
    UIRoomInfo.RoomName = MM.szRoomName;
    UIRoomInfo.RoomPassword = MM.szRoomPassword;
    UIRoomInfo.MapName = MM.szMapName;
    UIRoomInfo.GameMode = MM.kGame_GameMode;
    // End:0x90
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        UIRoomInfo.bPlayWithBots = true;        
    }
    else
    {
        UIRoomInfo.bPlayWithBots = false;
    }
    UIRoomInfo.BotUserTeam = MM.BotUserTeam;
    UIRoomInfo.BotNum0 = MM.BotNum0;
    UIRoomInfo.BotNum1 = MM.BotNum1;
    UIRoomInfo.BotDifficulty = MM.BotDifficulty;
    UIRoomInfo.TimeLimit = MM.iTimeLimit;
    UIRoomInfo.Score = MM.iGoalRound;
    UIRoomInfo.UserCount = MM.kGame_UserCount;
    UIRoomInfo.WeaponLimit = int(MM.eWeaponLimit);
    UIRoomInfo.bMultiBomb = MM.bMultiBomb;
    UIRoomInfo.bTeamBalance = MM.kGame_TeamBalance;
    UIRoomInfo.bResPawnType = MM.bSDRespawn;
    UIRoomInfo_Default = UIRoomInfo;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    InitializeRoomInfoStruct(MatchMaker);
    GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.MakeRoom_Win_BG;
    ImageMap.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    ReSpawnRadioBtn = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', fbReSpawnRadio, 0.3000000));
    // End:0x112
    if(MatchMaker.bIsOwner == true)
    {
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
    }
    ReSpawnRadioBtn.ButtonOff.Caption = CaptionFixed;
    ReSpawnRadioBtn.ButtonOff.CaptionDrawType = 3;
    ReSpawnRadioBtn.ButtonOn.Caption = CaptionRandom;
    ReSpawnRadioBtn.ButtonOn.CaptionDrawType = 3;
    i = 0;
    J0x187:

    // End:0x214 [Loop If]
    if(i < 9)
    {
        LabelCommonTop[i] = NewLabelComponent(fbLabelCommonTop[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelCommonTop[i].Caption = strLabelCommonTop[i];
        LabelCommonTop[i].SetDefaultFontColor();
        LabelCommonTop[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x187;
    }
    i = 0;
    J0x21B:

    // End:0x2A8 [Loop If]
    if(i < 7)
    {
        LabelCommonBottom[i] = NewLabelComponent(fbLabelCommonBottom[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelCommonBottom[i].SetDefaultFontColor();
        LabelCommonBottom[i].Caption = strLabelCommonBottom[i];
        LabelCommonBottom[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x21B;
    }
    i = 0;
    J0x2AF:

    // End:0x31C [Loop If]
    if(i < 4)
    {
        LabelAdd[i] = NewLabelComponent(fbLabelAdd[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelAdd[i].SetDefaultFontColor();
        LabelAdd[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x2AF;
    }
    LabelReSpawn = NewLabelComponent(fLabelReSpawn, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelReSpawn.Caption = CaptionReSpawn;
    LabelReSpawn.CaptionDrawType = 3;
    InitializeEditBox();
    InitializeComboBox();
    InitializeRadioButton();
    InitGameModeSetting();
    BeginFillData();
    FillData();
    UpdateRespawnStatus();
    EndFillData();
    TopLine.CaptionDrawType = 4;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    EditRoomName.MaxTextStrNum = 30;
    EditPassword.MaxTextStrNum = 20;
    // End:0x4A6
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
        RadioTeamBalance.SetData(false);
        RadioTeamBalance.ButtonOff.DisableMe();
        ComboGameMode.DisableMe();
        ComboGameTime.DisableMe();
        ComboWeaponRestriction.DisableMe();
        ComboTargetScore.DisableMe();
        ComboIsHardCore.DisableMe();
        ComboBombPossesion.DisableMe();
        ComboChangeAD.DisableMe();
        ComboChangeRound.DisableMe();
    }
    //return;    
}

function InitializeEditBox()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xCD [Loop If]
    if(i < 2)
    {
        Edit[i] = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fbEdit[i]));
        // End:0x98
        if(MatchMaker.bIsOwner == false)
        {
            LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2);
            Edit[i].bReadOnly = true;
            // [Explicit Continue]
            goto J0xC3;
        }
        LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
        J0xC3:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    EditRoomName = Edit[0];
    EditPassword = Edit[1];
    EditRoomName.MaxTextStrNum = 100;
    EditPassword.MaxTextStrNum = 20;
    //return;    
}

function InitializeComboBox()
{
    local int i;

    Combo[0] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[0], 0.5900000));
    Combo[0].ComboBox.Edit.bReadOnly = true;
    Combo[1] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[1], 0.6000000));
    Combo[1].ComboBox.Edit.bReadOnly = true;
    Combo[2] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[2], 0.5600000));
    Combo[2].ComboBox.Edit.bReadOnly = true;
    Combo[3] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[3], 0.5500000));
    Combo[3].ComboBox.Edit.bReadOnly = true;
    Combo[4] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[4], 0.5600000));
    Combo[4].ComboBox.Edit.bReadOnly = true;
    Combo[5] = BTComboBoxMapHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxMapHK', fbCombo[5], 0.5500000));
    Combo[5].ComboBox.Edit.bReadOnly = true;
    ComboAdd[0] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboAdd[0], 0.5800000));
    ComboAdd[0].ComboBox.Edit.bReadOnly = true;
    ComboAdd[1] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboAdd[1], 0.5700000));
    ComboAdd[1].ComboBox.Edit.bReadOnly = true;
    ComboAdd[2] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboAdd[2], 0.5800000));
    ComboAdd[2].ComboBox.Edit.bReadOnly = true;
    ComboAdd[3] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboAdd[3], 0.5700000));
    ComboAdd[3].ComboBox.Edit.bReadOnly = true;
    Combo[4].ComboBox.MaxVisibleItems = 5;
    ComboGameMode = Combo[1];
    ComboGameMode.ComboBox.MaxVisibleItems = 10;
    ComboGameTime = Combo[2];
    ComboWeaponRestriction = Combo[3];
    ComboUserCount = Combo[4];
    ComboTargetScore = Combo[5];
    // End:0x4E3
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0x3AC:

        // End:0x443 [Loop If]
        if(i < 7)
        {
            // End:0x3C7
            if(i == 6)
            {
                // [Explicit Continue]
                goto J0x439;
            }
            Combo[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            Combo[i].ComboBox.bAcceptsInput = false;
            Combo[i].ComboBox.Edit.bAcceptsInput = false;
            J0x439:

            i++;
            // [Loop Continue]
            goto J0x3AC;
        }
        i = 0;
        J0x44A:

        // End:0x4D2 [Loop If]
        if(i < 4)
        {
            ComboAdd[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            ComboAdd[i].ComboBox.bAcceptsInput = false;
            ComboAdd[i].ComboBox.Edit.bAcceptsInput = false;
            i++;
            // [Loop Continue]
            goto J0x44A;
        }
        ReSpawnRadioBtn.bAcceptsInput = false;
    }
    ComboIsHardCore = none;
    Combo[6] = none;
    ReSpawnRadioBtn.SetData(false);
    ComboWeaponRestriction.ComboBox.MaxVisibleItems = 5;
    //return;    
}

function InitializeRadioButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(i < 7)
    {
        // End:0x22
        if(i != 2)
        {
            // [Explicit Continue]
            goto J0x52;
        }
        Radio[i] = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', fbRadio[i], 0.3000000));
        J0x52:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    RadioTeamDamage = Radio[0];
    RadioFreeCamera = Radio[1];
    RadioTeamBalance = Radio[2];
    RadioKillCam = Radio[3];
    RadioJoinInPlaying = Radio[4];
    RadioVoiceChatting = Radio[5];
    RadioVote = Radio[6];
    i = 0;
    J0xC3:

    // End:0x155 [Loop If]
    if(i < 7)
    {
        Radio[i].ButtonOn.bAcceptsInput = false;
        Radio[i].ButtonOff.bAcceptsInput = false;
        Radio[i].ButtonOn.DisableMe();
        Radio[i].ButtonOff.DisableMe();
        i++;
        // [Loop Continue]
        goto J0xC3;
    }
    // End:0x1CB
    if(MatchMaker.bIsOwner)
    {
        RadioTeamBalance.ButtonOn.EnableMe();
        RadioTeamBalance.ButtonOff.EnableMe();
        RadioTeamBalance.ButtonOn.bAcceptsInput = true;
        RadioTeamBalance.ButtonOff.bAcceptsInput = true;
    }
    //return;    
}

function int GetSelectedMapID()
{
    return GetMapIDFromComboIndex(Combo[0].ComboBox.GetIndex());
    //return;    
}

function int GetMapIDFromComboIndex(int idx)
{
    local int i;
    local string FriendlyName;
    local array<wMapInfo> Maps;

    FriendlyName = Combo[0].ComboBox.GetItem(idx);
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x85:

    // End:0xD5 [Loop If]
    if(i < Maps.Length)
    {
        // End:0xCB
        if(InStr(FriendlyName, Maps[i].FriendlyName) >= 0)
        {
            return Maps[i].MapID;
        }
        i++;
        // [Loop Continue]
        goto J0x85;
    }
    return 0;
    //return;    
}

function FillMap()
{
    local int i;
    local array<wMapInfo> Maps;
    local GameModeInfo gmi;
    local string MapName;
    local wMapInfo temp, Pivot;
    local int Min, j, pivotIndex;
    local bool isChange;
    local int nIndex;

    nIndex = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.GetIndex())).Index;
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(nIndex);
    Combo[0].ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    pivotIndex = 0;
    isChange = false;
    i = 0;
    J0xF9:

    // End:0x1E2 [Loop If]
    if(i < Maps.Length)
    {
        Pivot = Maps[i];
        j = pivotIndex + 1;
        J0x128:

        // End:0x18D [Loop If]
        if(j < Maps.Length)
        {
            // End:0x183
            if(Pivot.MapDisplaySort > Maps[j].MapDisplaySort)
            {
                Pivot = Maps[j];
                Min = j;
                isChange = true;
            }
            j++;
            // [Loop Continue]
            goto J0x128;
        }
        // End:0x1C9
        if(isChange)
        {
            temp = Maps[i];
            Maps[i] = Pivot;
            Maps[Min] = temp;
        }
        isChange = false;
        pivotIndex++;
        i++;
        // [Loop Continue]
        goto J0xF9;
    }
    i = 0;
    J0x1E9:

    // End:0x353 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x349
        if((Maps[i].MapID >= 0) && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, nIndex) != 0)
        {
            // End:0x2B1
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = (Maps[i].NewMapIcon $ " ") $ Maps[i].FriendlyName;                
            }
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x349
            if(Maps[i].File != "TUT-BasicTraining")
            {
                Combo[0].ComboBox.AddItem(MapName, DynamicLoadObject(Maps[i].ResourceMapImage, Class'Engine.Material'), Maps[i].File);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1E9;
    }
    i = 0;
    J0x35A:

    // End:0x3E1 [Loop If]
    if(i < Combo[0].ComboBox.ItemCount())
    {
        // End:0x3D7
        if(Combo[0].ComboBox.List.GetExtraAtIndex(i) == UIRoomInfo.MapName)
        {
            Combo[0].ComboBox.SetIndex(i);
            // [Explicit Break]
            goto J0x3E1;
        }
        i++;
        // [Loop Continue]
        goto J0x35A;
    }
    J0x3E1:

    //return;    
}

function InitGameModeSetting()
{
    local int lp1, GameModeIndex;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;
    local int MapID;
    local wMapInfo mInfo;
    local GameModeInfo gmi;

    MapID = GetSelectedMapID();
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByID(MapID);
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    ComboGameMode.ComboBox.List.Clear();
    lp1 = 0;
    J0x7D:

    // End:0x15F [Loop If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
        // End:0x155
        if((bSetGameMode == false) && GameModeIndex == UIRoomInfo.GameMode)
        {
            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
            bSetGameMode = true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x7D;
    }
    // End:0x1B7
    if(bSetGameMode == false)
    {
        SetGameMode_DefaultSettings(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index);
    }
    //return;    
}

function FillGameMode()
{
    local int lp1, GameModeIndex;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;
    local int MapID;
    local wMapInfo mInfo;
    local GameModeInfo gmi;

    MapID = GetSelectedMapID();
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByID(MapID);
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    ComboGameMode.ComboBox.List.Clear();
    lp1 = 0;
    J0x7D:

    // End:0x195 [Loop If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        // End:0xB8
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
            // [Explicit Continue]
            goto J0x18B;
        }
        // End:0xD4
        if(GameModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial())
        {
            // [Explicit Continue]
            goto J0x18B;
        }
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
        // End:0x18B
        if((bSetGameMode == false) && GameModeIndex == UIRoomInfo.GameMode)
        {
            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
            bSetGameMode = true;
        }
        J0x18B:

        lp1++;
        // [Loop Continue]
        goto J0x7D;
    }
    // End:0x1ED
    if(bSetGameMode == false)
    {
        SetGameMode_DefaultSettings(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index);
    }
    // End:0x273
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index))
    {
        UIRoomInfo.WeaponLimit = 0;
        SetWeaponRestriction(UIRoomInfo.WeaponLimit);
        ComboWeaponRestriction.DisableMe();        
    }
    else
    {
        SetWeaponRestriction(UIRoomInfo.WeaponLimit);
        ComboWeaponRestriction.EnableMe();
    }
    //return;    
}

function FillDefaultGameTimeAndScore()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local string DefaultTimeLimit, DefaultTargetScore;

    ComboGameTime.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    DefaultTargetScore = Class'Engine.wGameSettings'.static.GetDefaultScore_ModeNum(GetGameModeIndex());
    DefaultTimeLimit = Class'Engine.wGameSettings'.static.GetDefaultTimeLimit_ModeNum(GetGameModeIndex(), DefaultTargetScore);
    lp1 = 0;
    J0x7E:

    // End:0xFC [Loop If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        ComboGameTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xF2
        if(modeInfo.TimeLimits[lp1] == DefaultTimeLimit)
        {
            ComboGameTime.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x7E;
    }
    ComboTargetScore.ComboBox.List.Clear();
    lp1 = 0;
    J0x124:

    // End:0x1A2 [Loop If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboTargetScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0x198
        if(modeInfo.Scores[lp1] == DefaultTargetScore)
        {
            ComboTargetScore.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x124;
    }
    //return;    
}

function FillGameTime()
{
    local int lp1;
    local GameModeInfo modeInfo;

    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    ComboGameTime.ComboBox.List.Clear();
    lp1 = 0;
    J0x43:

    // End:0xC8 [Loop If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        ComboGameTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xBE
        if(modeInfo.TimeLimits[lp1] == string(UIRoomInfo.TimeLimit))
        {
            ComboGameTime.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x43;
    }
    //return;    
}

function FillTargetScore()
{
    local int lp1;
    local GameModeInfo modeInfo;

    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    ComboTargetScore.ComboBox.List.Clear();
    lp1 = 0;
    J0x43:

    // End:0xC8 [Loop If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboTargetScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0xBE
        if(modeInfo.Scores[lp1] == string(UIRoomInfo.Score))
        {
            ComboTargetScore.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x43;
    }
    //return;    
}

function SetUserCount(int usercnt)
{
    local int i;

    UIRoomInfo.UserCount = usercnt;
    i = 0;
    J0x17:

    // End:0x93 [Loop If]
    if(i < ComboUserCount.ComboBox.List.ItemCount)
    {
        // End:0x89
        if(usercnt == int(ComboUserCount.ComboBox.GetItem(i)))
        {
            ComboUserCount.ComboBox.SetIndex(i);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function FillUserCountRalRalRa(optional bool bInvisibleodd)
{
    local int lp1;
    local GameModeInfo modeInfo;
    local int MapID, MaxUserCount;
    local bool bDefaultSet;

    ComboUserCount.ComboBox.List.Clear();
    MapID = GetSelectedMapID();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(MapID, GetGameModeIndex());
    bDefaultSet = false;
    lp1 = 0;
    J0x91:

    // End:0x213 [Loop If]
    if(lp1 < modeInfo.UserCount.Length)
    {
        // End:0xD4
        if(MatchMaker.kClanMatch_InChannel && modeInfo.UserCount[lp1] < 8)
        {
            // [Explicit Continue]
            goto J0x209;
        }
        // End:0x168
        if(bInvisibleodd && (float(modeInfo.UserCount[lp1]) % float(2)) > float(0))
        {
            // End:0x165
            if(((float(UIRoomInfo.UserCount) % float(2)) > float(0)) && (float(UIRoomInfo.UserCount + 1) % float(2)) == float(modeInfo.UserCount[lp1]))
            {
                UIRoomInfo.UserCount = modeInfo.UserCount[lp1] + 1;
            }
            // [Explicit Continue]
            goto J0x209;
        }
        // End:0x185
        if(modeInfo.UserCount[lp1] > MaxUserCount)
        {
            // [Explicit Continue]
            goto J0x209;
        }
        ComboUserCount.ComboBox.AddItem(string(modeInfo.UserCount[lp1]));
        // End:0x209
        if(modeInfo.UserCount[lp1] == UIRoomInfo.UserCount)
        {
            ComboUserCount.ComboBox.SetIndex(ComboUserCount.ComboBox.ItemCount() - 1);
            bDefaultSet = true;
        }
        J0x209:

        lp1++;
        // [Loop Continue]
        goto J0x91;
    }
    // End:0x29B
    if(bDefaultSet == false)
    {
        ComboUserCount.ComboBox.SetIndex(ComboUserCount.ComboBox.ItemCount() - 1);
        UIRoomInfo.UserCount = int(ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.ItemCount() - 1));
    }
    //return;    
}

function FillWeaponRestriction()
{
    local int lp1;
    local array<string> temp;
    local int MapID;

    ComboWeaponRestriction.ComboBox.List.Clear();
    temp = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
    MapID = GetSelectedMapID();
    lp1 = 0;
    J0x49:

    // End:0xD3 [Loop If]
    if(lp1 < temp.Length)
    {
        // End:0xC9
        if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
        {
            ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
        }
        lp1++;
        // [Loop Continue]
        goto J0x49;
    }
    SetWeaponRestriction(UIRoomInfo.WeaponLimit);
    //return;    
}

function SetWeaponRestriction(int Value)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x90 [Loop If]
    if(lp1 < ComboWeaponRestriction.ComboBox.ItemCount())
    {
        // End:0x86
        if(IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(lp1)).Index == Value)
        {
            ComboWeaponRestriction.ComboBox.SetIndex(lp1);
            return;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    ComboWeaponRestriction.ComboBox.SetIndex(0);
    //return;    
}

function FillIsHardCore()
{
    ComboIsHardCore.ComboBox.List.Clear();
    ComboIsHardCore.ComboBox.AddItem("OFF");
    ComboIsHardCore.ComboBox.AddItem("ON");
    // End:0x88
    if(MatchMaker.bHardCore)
    {
        ComboIsHardCore.ComboBox.SetIndex(1);        
    }
    else
    {
        ComboIsHardCore.ComboBox.SetIndex(0);
    }
    //return;    
}

function BeginFillData()
{
    Combo[0].ComboBox.__OnChange__Delegate = None;
    ComboGameMode.ComboBox.__OnChange__Delegate = None;
    ComboUserCount.ComboBox.__OnChange__Delegate = None;
    ComboWeaponRestriction.ComboBox.__OnChange__Delegate = None;
    ComboGameTime.ComboBox.__OnChange__Delegate = None;
    ComboTargetScore.ComboBox.__OnChange__Delegate = None;
    ComboAdd[0].ComboBox.__OnChange__Delegate = None;
    ComboAdd[1].ComboBox.__OnChange__Delegate = None;
    ComboAdd[2].ComboBox.__OnChange__Delegate = None;
    ComboAdd[3].ComboBox.__OnChange__Delegate = None;
    ComboSwitchSide = none;
    ComboBombPossesion = none;
    ComboChangeAD = none;
    ComboChangeRound = none;
    ComboBot_UserTeam = none;
    ComboBot_Diffcult = none;
    ComboBot_AF = none;
    ComboBot_RSA = none;
    //return;    
}

function EndFillData()
{
    Combo[0].ComboBox.__OnChange__Delegate = ComboMap_OnChange;
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboUserCount.ComboBox.__OnChange__Delegate = ComboUserCount_OnChange;
    ComboWeaponRestriction.ComboBox.__OnChange__Delegate = ComboWeaponRest_OnChange;
    ComboGameTime.ComboBox.__OnChange__Delegate = ComboGameTime_OnChange;
    ComboTargetScore.ComboBox.__OnChange__Delegate = ComboTargetScore_OnChange;
    // End:0x130
    if(((UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DeathMatch()) || UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch()) || UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        RadioTeamBalance.DisableMe();
        RadioTeamBalance.SetData(false);        
    }
    else
    {
        RadioTeamBalance.EnableMe();
    }
    //return;    
}

function FillData()
{
    local wMapInfo mInfo;
    local GameModeInfo modeInfo;

    EditRoomName.SetText(UIRoomInfo.RoomName);
    EditPassword.SetText(UIRoomInfo.RoomPassword);
    FillMap();
    FillGameMode();
    FillGameTime();
    FillTargetScore();
    FillUserCountRalRalRa();
    FillWeaponRestriction();
    ChangeComboAdd();
    RadioTeamDamage.SetData(false);
    RadioFreeCamera.SetData(false);
    RadioTeamBalance.SetData(UIRoomInfo.bTeamBalance);
    RadioKillCam.SetData(false);
    RadioJoinInPlaying.SetData(false);
    RadioVoiceChatting.SetData(false);
    RadioVote.SetData(false);
    //return;    
}

function UpdateRespawnStatus()
{
    local wMapInfo mInfo;
    local int RespawnType;

    mInfo = MatchMaker.MapSettings.GetMapInfo(UIRoomInfo.MapName);
    RespawnType = Class'Engine.wGameSettings'.static.GetRespawnType(mInfo, UIRoomInfo.GameMode);
    SetRadioRespawnType(RespawnType);
    // End:0xB7
    if(int(mInfo.ModeTDM_RandomRespawn) == 2)
    {
        // End:0xB7
        if(MatchMaker.bIsOwner != true)
        {
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        }
    }
    //return;    
}

function ComboGameTime_OnChange(GUIComponent Sender)
{
    UIRoomInfo.TimeLimit = int(GetGameTime());
    BeginFillData();
    FillData();
    EndFillData();
    //return;    
}

function ComboTargetScore_OnChange(GUIComponent Sender)
{
    UIRoomInfo.Score = int(GetTargetScore());
    BeginFillData();
    FillData();
    EndFillData();
    //return;    
}

simulated function SetRadioRespawnType(int RespawnType)
{
    switch(RespawnType)
    {
        // End:0x75
        case 0:
            ReSpawnRadioBtn.SetData(false);
            UIRoomInfo.bResPawnType = true;
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
            // End:0x20A
            break;
        // End:0xE3
        case 1:
            ReSpawnRadioBtn.SetData(true);
            UIRoomInfo.bResPawnType = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
            // End:0x20A
            break;
        // End:0x183
        case 2:
            // End:0x10C
            if(UIRoomInfo.bResPawnType == true)
            {
                ReSpawnRadioBtn.SetData(false);                
            }
            else
            {
                ReSpawnRadioBtn.SetData(true);
            }
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
            // End:0x20A
            break;
        // End:0xFFFF
        default:
            ReSpawnRadioBtn.SetData(false);
            UIRoomInfo.bResPawnType = true;
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
            // End:0x20A
            break;
            break;
    }
    //return;    
}

function ComboMap_OnChange(GUIComponent Sender)
{
    UIRoomInfo.MapName = Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.Index);
    // End:0x79
    if((GetSelectedMapID()) == 6)
    {
        // End:0x79
        if(UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Sabotage())
        {
            SetGameMode_DefaultSettings(0);
        }
    }
    BeginFillData();
    FillData();
    UpdateRespawnStatus();
    EndFillData();
    // End:0x15B
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
        RadioTeamBalance.SetData(false);
        RadioTeamBalance.ButtonOff.DisableMe();
        ComboGameMode.DisableMe();
        ComboGameTime.DisableMe();
        ComboWeaponRestriction.DisableMe();
        ComboTargetScore.DisableMe();
        ComboIsHardCore.DisableMe();
        ComboBombPossesion.DisableMe();
        ComboChangeAD.DisableMe();
        ComboChangeRound.DisableMe();
    }
    //return;    
}

function SetRespawnTypebyGameMode(int nMode)
{
    switch(nMode)
    {
        // End:0x0B
        case 1:
        // End:0x87
        case 12:
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
            // End:0x191
            break;
        // End:0x8C
        case 2:
        // End:0x91
        case 3:
        // End:0x96
        case 4:
        // End:0x9B
        case 6:
        // End:0x117
        case 7:
            ReSpawnRadioBtn.SetData(true);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
            // End:0x191
            break;
        // End:0xFFFF
        default:
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
            // End:0x191
            break;
            break;
    }
    //return;    
}

function SetGameMode_DefaultSettings(int cur)
{
    local GameModeInfo modeInfo;

    // End:0x15E
    if(cur != UIRoomInfo.GameMode)
    {
        UIRoomInfo.GameMode = cur;
        modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
        UIRoomInfo.Score = int(modeInfo.ScoreDefault);
        UIRoomInfo.UserCount = modeInfo.UserCount_Default;
        UIRoomInfo.TimeLimit = int(Class'Engine.wGameSettings'.static.GetDefaultTimeLimit_ModeNum(UIRoomInfo.GameMode, string(UIRoomInfo.Score)));
        // End:0x121
        if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
        {
            UIRoomInfo.bPlayWithBots = true;
            UIRoomInfo.BotDifficulty = modeInfo.BotDifficulty_Default;
            UIRoomInfo.BotNum0 = modeInfo.BotNum0_Default;
            UIRoomInfo.BotNum1 = modeInfo.BotNum1_Default;
            UIRoomInfo.BotUserTeam = modeInfo.BotUserTeam_Default;            
        }
        else
        {
            UIRoomInfo.bPlayWithBots = false;
            UIRoomInfo.BotDifficulty = 1;
            UIRoomInfo.BotNum0 = 0;
            UIRoomInfo.BotNum1 = 0;
            UIRoomInfo.BotUserTeam = 0;
        }
    }
    //return;    
}

function ComboGameMode_OnChange(GUIComponent Sender)
{
    local int cur;
    local GameModeInfo modeInfo;

    cur = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    // End:0x216
    if(cur != UIRoomInfo.GameMode)
    {
        UIRoomInfo.GameMode = cur;
        modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
        UIRoomInfo.Score = int(modeInfo.ScoreDefault);
        UIRoomInfo.UserCount = modeInfo.UserCount_Default;
        UIRoomInfo.TimeLimit = int(Class'Engine.wGameSettings'.static.GetDefaultTimeLimit_ModeNum(UIRoomInfo.GameMode, string(UIRoomInfo.Score)));
        UIRoomInfo.bMultiBomb = true;
        // End:0x17A
        if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
        {
            UIRoomInfo.bPlayWithBots = true;
            UIRoomInfo.BotDifficulty = modeInfo.BotDifficulty_Default;
            UIRoomInfo.BotNum0 = modeInfo.BotNum0_Default;
            UIRoomInfo.BotNum1 = modeInfo.BotNum1_Default;
            UIRoomInfo.BotUserTeam = modeInfo.BotUserTeam_Default;            
        }
        else
        {
            UIRoomInfo.bPlayWithBots = false;
            UIRoomInfo.BotDifficulty = 1;
            UIRoomInfo.BotNum0 = 0;
            UIRoomInfo.BotNum1 = 0;
            UIRoomInfo.BotUserTeam = 0;
        }
        BeginFillData();
        FillData();
        UIRoomInfo.MapName = Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.Index);
        UpdateRespawnStatus();
        EndFillData();
    }
    UIRoomInfo.WeaponLimit = 0;
    SetWeaponRestriction(UIRoomInfo.WeaponLimit);
    //return;    
}

function ChangeComboAdd()
{
    local int i, nIndex, MaxUserCount, ModeIndex_BotTeamDeath, ModeIndex_BotDomination, ModeIndex_BotDeathMatch,
	    ModeIndex_BotTeamDeathBeginner, ModeIndex_Defence;

    local bool bUC_AFSet, bUC_RSASet;

    i = 0;
    J0x07:

    // End:0x82 [Loop If]
    if(i < 4)
    {
        LabelAdd[i].Caption = "";
        ComboAdd[i].SetVisibility(false);
        ComboAdd[i].__OnChange__Delegate = None;
        ComboAdd[i].ComboBox.Clear();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    ComboGameTime.SetVisibility(true);
    ComboTargetScore.SetVisibility(true);
    ComboWeaponRestriction.SetVisibility(true);
    LabelCommonTop[4].SetVisibility(true);
    LabelCommonTop[5].SetVisibility(true);
    LabelCommonTop[7].SetVisibility(true);
    // End:0x10C
    if(UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Sabotage())
    {        
    }
    else
    {
        // End:0x272
        if(UIRoomInfo.GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_SD())
        {
            LabelAdd[0].Caption = strLabelBombPossesion;
            ComboBombPossesion = ComboAdd[0];
            ComboBombPossesion.SetVisibility(true);
            i = 0;
            J0x164:

            // End:0x1B3 [Loop If]
            if(i < 3)
            {
                // End:0x17E
                if(i != 0)
                {
                    // [Explicit Continue]
                    goto J0x1A9;
                }
                ComboAdd[i].EnableMe();
                ComboAdd[i].SetVisibility(true);
                J0x1A9:

                i++;
                // [Loop Continue]
                goto J0x164;
            }
            ComboBombPossesion.ComboBox.AddItem(strBombForEveryone);
            ComboBombPossesion.ComboBox.AddItem(strBombForOne);
            // End:0x217
            if(UIRoomInfo.bMultiBomb)
            {
                ComboBombPossesion.ComboBox.SetIndex(0);                
            }
            else
            {
                ComboBombPossesion.ComboBox.SetIndex(1);
            }
            ComboBombPossesion.ComboBox.List.SetTopItem(0);
            ComboBombPossesion.ComboBox.__OnChange__Delegate = ComboBombPossesion_OnChange;            
        }
        else
        {
            // End:0x10D8
            if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
            {
                LabelAdd[0].Caption = strLabelBot_UserTeam[0];
                LabelAdd[1].Caption = strLabelBot_AF[1];
                LabelAdd[2].Caption = strLabelBot_Difficult[0];
                LabelAdd[3].Caption = strLabelBot_RSA[0];
                ComboBot_UserTeam = ComboAdd[0];
                ComboBot_AF = ComboAdd[1];
                ComboBot_Diffcult = ComboAdd[2];
                ComboBot_RSA = ComboAdd[3];
                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[1]);
                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[2]);
                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[3]);
                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[4]);
                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[5]);
                ComboBot_Diffcult.ComboBox.SetIndex(UIRoomInfo.BotDifficulty - 1);
                ComboBot_Diffcult.SetVisibility(true);
                ModeIndex_BotTeamDeath = Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeath();
                ModeIndex_BotDomination = Class'Engine.wGameSettings'.static.GetModeIndex_BotDomination();
                ModeIndex_BotDeathMatch = Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch();
                ModeIndex_BotTeamDeathBeginner = Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner();
                ModeIndex_Defence = Class'Engine.wGameSettings'.static.GetModeIndex_Defence();
                switch(UIRoomInfo.GameMode)
                {
                    // End:0x477
                    case ModeIndex_BotTeamDeath:
                    // End:0x8A3
                    case ModeIndex_BotDomination:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[2]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[3]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        // End:0x528
                        if(UIRoomInfo.BotUserTeam == 2)
                        {
                            FillUserCountRalRalRa(true);
                        }
                        // End:0x566
                        if((UIRoomInfo.BotUserTeam == 0) || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[1];                            
                        }
                        else
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[0];
                        }
                        // End:0x5BD
                        if((UIRoomInfo.BotUserTeam == 1) || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[3].Caption = strLabelBot_RSA[1];                            
                        }
                        else
                        {
                            LabelAdd[3].Caption = strLabelBot_RSA[0];
                        }
                        MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(GetSelectedMapID(), GetGameModeIndex());
                        // End:0x625
                        if(MaxUserCount > 8)
                        {
                            MaxUserCount = 8;
                        }
                        bUC_AFSet = false;
                        bUC_RSASet = false;
                        i = 1;
                        J0x63C:

                        // End:0x762 [Loop If]
                        if(i <= MaxUserCount)
                        {
                            // End:0x66C
                            if((UIRoomInfo.BotUserTeam == 2) && i == 1)
                            {
                                // [Explicit Continue]
                                goto J0x758;
                            }
                            ComboBot_AF.ComboBox.AddItem(string(i));
                            ComboBot_RSA.ComboBox.AddItem(string(i));
                            // End:0x701
                            if(i == UIRoomInfo.BotNum0)
                            {
                                ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                bUC_AFSet = true;
                            }
                            // End:0x758
                            if(i == UIRoomInfo.BotNum1)
                            {
                                ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                                bUC_RSASet = true;
                            }
                            J0x758:

                            i++;
                            // [Loop Continue]
                            goto J0x63C;
                        }
                        // End:0x7F1
                        if(bUC_AFSet == false)
                        {
                            ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.List.ItemCount - 1));
                        }
                        // End:0x880
                        if(bUC_RSASet == false)
                        {
                            ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum1 = int(ComboBot_RSA.ComboBox.GetItem(ComboBot_RSA.ComboBox.List.ItemCount - 1));
                        }
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(true);
                        // End:0x1064
                        break;
                    // End:0xAD3
                    case ModeIndex_BotDeathMatch:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        LabelAdd[1].Caption = strLabelBot_AF[1];
                        MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(GetSelectedMapID(), GetGameModeIndex());
                        MaxUserCount *= float(2);
                        // End:0x96E
                        if(MaxUserCount > 8)
                        {
                            MaxUserCount = 8;
                        }
                        bUC_AFSet = false;
                        i = 2;
                        J0x97E:

                        // End:0xA0D [Loop If]
                        if(i <= MaxUserCount)
                        {
                            ComboBot_AF.ComboBox.AddItem(string(i));
                            // End:0xA03
                            if(i == UIRoomInfo.BotNum0)
                            {
                                ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                bUC_AFSet = true;
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x97E;
                        }
                        // End:0xA9C
                        if(bUC_AFSet == false)
                        {
                            ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.List.ItemCount - 1));
                        }
                        LabelAdd[3].Caption = "";
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(false);
                        // End:0x1064
                        break;
                    // End:0xE4A
                    case ModeIndex_BotTeamDeathBeginner:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[2]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        LabelAdd[1].Caption = strLabelBot_AF[1];
                        LabelAdd[3].Caption = strLabelBot_RSA[0];
                        MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(GetSelectedMapID(), GetGameModeIndex());
                        // End:0xBCC
                        if(MaxUserCount > 8)
                        {
                            MaxUserCount = 8;
                        }
                        bUC_AFSet = false;
                        bUC_RSASet = false;
                        i = 1;
                        J0xBE3:

                        // End:0xD09 [Loop If]
                        if(i <= MaxUserCount)
                        {
                            // End:0xC13
                            if((UIRoomInfo.BotUserTeam == 2) && i == 1)
                            {
                                // [Explicit Continue]
                                goto J0xCFF;
                            }
                            ComboBot_AF.ComboBox.AddItem(string(i));
                            ComboBot_RSA.ComboBox.AddItem(string(i));
                            // End:0xCA8
                            if(i == UIRoomInfo.BotNum0)
                            {
                                ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                bUC_AFSet = true;
                            }
                            // End:0xCFF
                            if(i == UIRoomInfo.BotNum1)
                            {
                                ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                                bUC_RSASet = true;
                            }
                            J0xCFF:

                            i++;
                            // [Loop Continue]
                            goto J0xBE3;
                        }
                        // End:0xD98
                        if(bUC_AFSet == false)
                        {
                            ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.List.ItemCount - 1));
                        }
                        // End:0xE27
                        if(bUC_RSASet == false)
                        {
                            ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum1 = int(ComboBot_RSA.ComboBox.GetItem(ComboBot_RSA.ComboBox.List.ItemCount - 1));
                        }
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(true);
                        // End:0x1064
                        break;
                    // End:0x1061
                    case ModeIndex_Defence:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.SetVisibility(true);
                        ComboBot_UserTeam.DisableMe();
                        ComboBot_Diffcult.ComboBox.Clear();
                        i = 0;
                        J0xEAF:

                        // End:0xF6E [Loop If]
                        if(i < PlayerOwner().Level.GameMgr.DefenceLevelInfoParams.Length)
                        {
                            // End:0xF64
                            if(PlayerOwner().Level.GameMgr.DefenceLevelInfoParams[i].bEnable)
                            {
                                nIndex = int(PlayerOwner().Level.GameMgr.DefenceLevelInfoParams[i].byDifficulty) + 1;
                                ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[nIndex]);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0xEAF;
                        }
                        // End:0xF9E
                        if((UIRoomInfo.BotDifficulty - 1) < 0)
                        {
                            nIndex = Class'Engine.wGameSettings'.default.BotDifficulty_Default[ModeIndex_Defence];                            
                        }
                        else
                        {
                            nIndex = UIRoomInfo.BotDifficulty - 1;
                        }
                        ComboBot_Diffcult.ComboBox.SetIndex(nIndex);
                        ComboGameTime.SetVisibility(false);
                        ComboTargetScore.SetVisibility(false);
                        ComboWeaponRestriction.SetVisibility(false);
                        LabelCommonTop[4].SetVisibility(false);
                        LabelCommonTop[5].SetVisibility(false);
                        LabelCommonTop[7].SetVisibility(false);
                        LabelAdd[1].Caption = "";
                        LabelAdd[3].Caption = "";
                        // End:0x1064
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                ComboBot_UserTeam.ComboBox.__OnChange__Delegate = ComboBot_UserTeam_OnChange;
                ComboBot_AF.ComboBox.__OnChange__Delegate = ComboBot_AF_OnChange;
                ComboBot_Diffcult.ComboBox.__OnChange__Delegate = ComboBot_Diffcult_OnChange;
                ComboBot_RSA.ComboBox.__OnChange__Delegate = ComboBot_RSA_OnChange;
            }
        }
    }
    //return;    
}

function ComboUserCount_OnChange(GUIComponent Sender)
{
    local int HalfPlusOne;

    BeginFillData();
    UIRoomInfo.UserCount = int(ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.Index));
    // End:0x1BE
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        // End:0xCC
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0xC9
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xC9
                if(UIRoomInfo.BotNum0 < (UIRoomInfo.UserCount + 1))
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount + 1;
                }
            }            
        }
        else
        {
            // End:0x10D
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0x10A
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount;
                }                
            }
            else
            {
                // End:0x14E
                if(UIRoomInfo.BotUserTeam == 1)
                {
                    // End:0x14B
                    if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
                    {
                        UIRoomInfo.BotNum1 = UIRoomInfo.UserCount;
                    }                    
                }
                else
                {
                    // End:0x1BE
                    if(UIRoomInfo.BotUserTeam == 2)
                    {
                        HalfPlusOne = (UIRoomInfo.UserCount / 2) + 1;
                        // End:0x19A
                        if(UIRoomInfo.BotNum0 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum0 = HalfPlusOne;
                        }
                        // End:0x1BE
                        if(UIRoomInfo.BotNum1 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum1 = HalfPlusOne;
                        }
                    }
                }
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
    // End:0x22B
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
        RadioTeamBalance.SetData(false);
        RadioTeamBalance.ButtonOff.DisableMe();
        ComboBombPossesion.DisableMe();
    }
    //return;    
}

function ComboBombPossesion_OnChange(GUIComponent Sender)
{
    // End:0x2D
    if(ComboBombPossesion.ComboBox.Index == 0)
    {
        UIRoomInfo.bMultiBomb = true;        
    }
    else
    {
        UIRoomInfo.bMultiBomb = false;
    }
    BeginFillData();
    ChangeComboAdd();
    EndFillData();
    //return;    
}

function ComboBot_UserTeam_OnChange(GUIComponent Sender)
{
    local int HalfPlusOne;

    UIRoomInfo.BotUserTeam = ComboBot_UserTeam.ComboBox.Index;
    BeginFillData();
    // End:0x19B
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        // End:0xA9
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0xA6
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xA6
                if(UIRoomInfo.BotNum0 < (UIRoomInfo.UserCount + 1))
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount + 1;
                }
            }            
        }
        else
        {
            // End:0xEA
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xE7
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount;
                }                
            }
            else
            {
                // End:0x12B
                if(UIRoomInfo.BotUserTeam == 1)
                {
                    // End:0x128
                    if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
                    {
                        UIRoomInfo.BotNum1 = UIRoomInfo.UserCount;
                    }                    
                }
                else
                {
                    // End:0x19B
                    if(UIRoomInfo.BotUserTeam == 2)
                    {
                        HalfPlusOne = (UIRoomInfo.UserCount / 2) + 1;
                        // End:0x177
                        if(UIRoomInfo.BotNum0 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum0 = HalfPlusOne;
                        }
                        // End:0x19B
                        if(UIRoomInfo.BotNum1 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum1 = HalfPlusOne;
                        }
                    }
                }
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
    //return;    
}

function ComboBot_Diffcult_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotDifficulty = ComboBot_Diffcult.ComboBox.Index + 1;
    BeginFillData();
    ChangeComboAdd();
    EndFillData();
    //return;    
}

function ComboWeaponRest_OnChange(GUIComponent Sender)
{
    UIRoomInfo.WeaponLimit = GetWeaponRestrictionIndex();
    //return;    
}

function ComboBot_AF_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.Index));
    BeginFillData();
    // End:0xCE
    if(UIRoomInfo.BotUserTeam == 0)
    {
        // End:0xA2
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0x9F
            if(UIRoomInfo.BotNum0 < (UIRoomInfo.UserCount + 1))
            {
                SetUserCount(UIRoomInfo.BotNum0 - 1);
            }            
        }
        else
        {
            // End:0xCB
            if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
            {
                SetUserCount(UIRoomInfo.BotNum0);
            }
        }        
    }
    else
    {
        // End:0x116
        if(UIRoomInfo.BotUserTeam == 2)
        {
            // End:0x116
            if(UIRoomInfo.BotNum0 < ((UIRoomInfo.UserCount / 2) + 1))
            {
                SetUserCount((UIRoomInfo.BotNum0 - 1) * 2);
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
    //return;    
}

function ComboBot_RSA_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotNum1 = int(ComboBot_RSA.ComboBox.GetItem(ComboBot_RSA.ComboBox.Index));
    BeginFillData();
    // End:0x7E
    if(UIRoomInfo.BotUserTeam == 1)
    {
        // End:0x7B
        if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
        {
            SetUserCount(UIRoomInfo.BotNum1);
        }        
    }
    else
    {
        // End:0xC6
        if(UIRoomInfo.BotUserTeam == 2)
        {
            // End:0xC6
            if(UIRoomInfo.BotNum1 < ((UIRoomInfo.UserCount / 2) + 1))
            {
                SetUserCount((UIRoomInfo.BotNum1 - 1) * 2);
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
    //return;    
}

function bool GetMultiBomb()
{
    // End:0x4C
    if(((ComboBombPossesion != none) && ComboBombPossesion.ComboBox.ItemCount() > 0) && ComboBombPossesion.ComboBox.Index == 1)
    {
        return false;
    }
    return true;
    //return;    
}

function string GetGameModeClass()
{
    return ComboGameMode.ComboBox.List.GetExtraAtIndex(ComboGameMode.ComboBox.Index);
    //return;    
}

function int GetGameModeIndex()
{
    return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    //return;    
}

function string GetMap()
{
    return Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.Index);
    //return;    
}

function int GetMapIndex()
{
    return Combo[0].ComboBox.Index;
    //return;    
}

function string GetUserCount()
{
    return ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.Index);
    //return;    
}

function string GetGameTime()
{
    return ComboGameTime.ComboBox.List.GetItemAtIndex(ComboGameTime.ComboBox.Index);
    //return;    
}

function int GetWeaponRestrictionIndex()
{
    // End:0x1D
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return 0;        
    }
    else
    {
        return IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index;
    }
    //return;    
}

function string GetTargetScore()
{
    return ComboTargetScore.ComboBox.List.GetItemAtIndex(ComboTargetScore.ComboBox.Index);
    //return;    
}

function int GetIsHardCore()
{
    return ComboIsHardCore.ComboBox.Index;
    //return;    
}

function int IsPlayWithBots()
{
    // End:0x13
    if(UIRoomInfo.bPlayWithBots)
    {
        return 1;        
    }
    else
    {
        return 0;
    }
    //return;    
}

function int GetAFBotCount()
{
    return UIRoomInfo.BotNum0;
    //return;    
}

function int GetRSABotCount()
{
    return UIRoomInfo.BotNum1;
    //return;    
}

function int GetBotModeDifficulty()
{
    // End:0x36
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return ComboBot_Diffcult.ComboBox.Index + 1;        
    }
    else
    {
        return UIRoomInfo.BotDifficulty;
    }
    //return;    
}

function int GetBotModeUserTeam()
{
    return UIRoomInfo.BotUserTeam;
    //return;    
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    MapName = Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.List.Index);
    mInfo = MatchMaker.MapSettings.GetMapInfo(MapName);
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    i = 0;
    J0xA7:

    // End:0x145 [Loop If]
    if(i < 3)
    {
        // End:0xED
        if(mInfo.ResourceSupplyImages[i] == "-")
        {
            ImageSupply[i].BackgroundImage.Image = none;
            // [Explicit Continue]
            goto J0x13B;
        }
        ImageSupply[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        J0x13B:

        i++;
        // [Loop Continue]
        goto J0xA7;
    }
    i = 3;
    J0x14D:

    // End:0x17E [Loop If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0x14D;
    }
    // End:0x1C1
    if((mInfo != none) && mInfo.NewMapIcon != "-")
    {
        NewMapIcon.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newMap_Icon;        
    }
    else
    {
        NewMapIcon.BackgroundImage.Image = none;
    }
    //return;    
}

defaultproperties
{
    fbSeparator=(X1=273.0000000,Y1=442.0000000,X2=751.0000000,Y2=444.0000000)
    fbLabelCommonTop[0]=(X1=265.0000000,Y1=116.0000000,X2=383.0000000,Y2=129.0000000)
    fbLabelCommonTop[1]=(X1=265.0000000,Y1=147.0000000,X2=383.0000000,Y2=160.0000000)
    fbLabelCommonTop[2]=(X1=265.0000000,Y1=391.0000000,X2=383.0000000,Y2=404.0000000)
    fbLabelCommonTop[3]=(X1=265.0000000,Y1=196.0000000,X2=365.0000000,Y2=209.0000000)
    fbLabelCommonTop[4]=(X1=513.0000000,Y1=528.0000000,X2=631.0000000,Y2=541.0000000)
    fbLabelCommonTop[5]=(X1=265.0000000,Y1=561.0000000,X2=383.0000000,Y2=574.0000000)
    fbLabelCommonTop[6]=(X1=265.0000000,Y1=528.0000000,X2=383.0000000,Y2=541.0000000)
    fbLabelCommonTop[7]=(X1=513.0000000,Y1=561.0000000,X2=631.0000000,Y2=574.0000000)
    fbLabelCommonTop[8]=(X1=525.0000000,Y1=346.0000000,X2=779.0000000,Y2=650.0000000)
    strLabelCommonTop[0]="Name"
    strLabelCommonTop[1]="Password"
    strLabelCommonTop[2]="Map"
    strLabelCommonTop[3]="Mode"
    strLabelCommonTop[4]="Game Time"
    strLabelCommonTop[5]="Sub-Mode"
    strLabelCommonTop[6]="Players"
    strLabelCommonTop[7]="Goal Score"
    fbLabelCommonBottom[0]=(X1=276.0000000,Y1=458.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[1]=(X1=276.0000000,Y1=492.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[2]=(X1=265.0000000,Y1=596.0000000,X2=383.0000000,Y2=609.0000000)
    fbLabelCommonBottom[3]=(X1=276.0000000,Y1=560.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[4]=(X1=525.0000000,Y1=458.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[5]=(X1=525.0000000,Y1=492.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[6]=(X1=525.0000000,Y1=526.0000000,X2=750.0000000,Y2=612.0000000)
    strLabelCommonBottom[2]="Team Balance"
    fbLabelAdd[0]=(X1=265.0000000,Y1=435.0000000,X2=383.0000000,Y2=448.0000000)
    fbLabelAdd[1]=(X1=265.0000000,Y1=468.0000000,X2=383.0000000,Y2=481.0000000)
    fbLabelAdd[2]=(X1=513.0000000,Y1=435.0000000,X2=631.0000000,Y2=448.0000000)
    fbLabelAdd[3]=(X1=513.0000000,Y1=468.0000000,X2=631.0000000,Y2=481.0000000)
    strLabelSwitchSide="Switch Locations"
    strLabelBombPossesion="C4 Possession"
    strBombForEveryone="All"
    strBombForOne="Single"
    strLabelChangeAD="Change Missions"
    strLabelChangeRound="Change Rounds"
    strUserCount="Players"
    strLabelBot_UserTeam[0]="Team"
    strLabelBot_UserTeam[1]="AF"
    strLabelBot_UserTeam[2]="RSA"
    strLabelBot_UserTeam[3]="AF vs. RSA"
    strLabelBot_Difficult[0]="Difficulty"
    strLabelBot_Difficult[1]="Very Low"
    strLabelBot_Difficult[2]="Low"
    strLabelBot_Difficult[3]="Normal"
    strLabelBot_Difficult[4]="High"
    strLabelBot_Difficult[5]="Very High"
    strLabelBot_AF[0]="AF (Bots)"
    strLabelBot_AF[1]="AF (Bots+Users)"
    strLabelBot_RSA[0]="RSA (Bots)"
    strLabelBot_RSA[1]="RSA (Bots+Users)"
    fbEdit[0]=(X1=390.0000000,Y1=116.0000000,X2=638.0000000,Y2=129.0000000)
    fbEdit[1]=(X1=390.0000000,Y1=147.0000000,X2=638.0000000,Y2=160.0000000)
    fbLabelEdit[0]=(X1=383.0000000,Y1=108.0000000,X2=641.0000000,Y2=137.0000000)
    fbLabelEdit[1]=(X1=383.0000000,Y1=139.0000000,X2=641.0000000,Y2=168.0000000)
    fbCombo[0]=(X1=384.0000000,Y1=383.0000000,X2=639.0000000,Y2=412.0000000)
    fbCombo[1]=(X1=366.0000000,Y1=188.0000000,X2=517.0000000,Y2=217.0000000)
    fbCombo[2]=(X1=632.0000000,Y1=519.0000000,X2=752.0000000,Y2=549.0000000)
    fbCombo[3]=(X1=384.0000000,Y1=552.0000000,X2=504.0000000,Y2=582.0000000)
    fbCombo[4]=(X1=384.0000000,Y1=519.0000000,X2=504.0000000,Y2=549.0000000)
    fbCombo[5]=(X1=632.0000000,Y1=552.0000000,X2=752.0000000,Y2=582.0000000)
    fbCombo[6]=(X1=632.0000000,Y1=552.0000000,X2=752.0000000,Y2=582.0000000)
    fbComboAdd[0]=(X1=384.0000000,Y1=426.0000000,X2=503.0000000,Y2=456.0000000)
    fbComboAdd[1]=(X1=384.0000000,Y1=459.0000000,X2=503.0000000,Y2=489.0000000)
    fbComboAdd[2]=(X1=632.0000000,Y1=426.0000000,X2=752.0000000,Y2=456.0000000)
    fbComboAdd[3]=(X1=632.0000000,Y1=459.0000000,X2=752.0000000,Y2=489.0000000)
    fbRadio[0]=(X1=356.0000000,Y1=457.0000000,X2=480.0000000,Y2=475.0000000)
    fbRadio[1]=(X1=356.0000000,Y1=491.0000000,X2=480.0000000,Y2=509.0000000)
    fbRadio[2]=(X1=385.0000000,Y1=594.0000000,X2=504.0000000,Y2=610.0000000)
    fbRadio[3]=(X1=356.0000000,Y1=559.0000000,X2=480.0000000,Y2=578.0000000)
    fbRadio[4]=(X1=606.0000000,Y1=457.0000000,X2=730.0000000,Y2=475.0000000)
    fbRadio[5]=(X1=606.0000000,Y1=491.0000000,X2=730.0000000,Y2=509.0000000)
    fbRadio[6]=(X1=606.0000000,Y1=525.0000000,X2=730.0000000,Y2=543.0000000)
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK.mImageMap'
    begin object name="mImageMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=384.0000000,Y1=230.0000000,X2=640.0000000,Y2=381.0000000)
        RenderWeight=0.2000000
        OnRendered=mImageMap.Internal_OnRendered
    end object
    ImageMap=mImageMap
    // Referenc[0]e: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK.mImageMap0'
    begin object name="mImageMap0" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=611.0000000,Y1=234.0000000,X2=635.0000000,Y2=258.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap0.Internal_OnRendered
    end object
    ImageSupply=mImageMap0
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK.mImageMap1'
    begin object name="mImageMap1" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=582.0000000,Y1=234.0000000,X2=606.0000000,Y2=258.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap1.Internal_OnRendered
    end object
    ImageSupply=mImageMap1
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK.mImageMap2'
    begin object name="mImageMap2" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=553.0000000,Y1=234.0000000,X2=577.0000000,Y2=258.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap2.Internal_OnRendered
    end object
    ImageSupply=mImageMap2
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK.mNewMapIcon'
    begin object name="mNewMapIcon" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=387.0000000,Y1=234.0000000,X2=437.0000000,Y2=259.0000000)
        RenderWeight=0.2100000
        OnRendered=mNewMapIcon.Internal_OnRendered
    end object
    NewMapIcon=mNewMapIcon
    fbReSpawnRadio=(X1=611.0000000,Y1=195.0000000,X2=730.0000000,Y2=210.0000000)
    CaptionReSpawn="Respawn"
    CaptionRandom="Random"
    CaptionFixed="Fixed"
    fLabelReSpawn=(X1=552.0000000,Y1=196.0000000,X2=640.0000000,Y2=209.0000000)
    fbBackgroundImage=(X1=256.0000000,Y1=68.0000000,X2=768.0000000,Y2=684.0000000)
    fbTopLine=(X1=362.0000000,Y1=74.0000000,X2=662.0000000,Y2=89.0000000)
    fbBottomLine=(X1=265.0000000,Y1=588.0000000,X2=759.0000000,Y2=630.0000000)
    fbButtonOK=(X1=387.0000000,Y1=631.0000000,X2=511.0000000,Y2=668.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=631.0000000,X2=637.0000000,Y2=668.0000000)
    strTitle="Change Settings"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnRendered=BTWindowRoomInfoHK.FloatingRendered
}