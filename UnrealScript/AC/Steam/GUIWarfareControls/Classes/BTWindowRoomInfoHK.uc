/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowRoomInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:70
 *	Functions:50
 *
 *******************************************************************************/
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbSeparator;
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageSupply[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK NewMapIcon;
var export editinline BTRadioOnOffButtonHK ReSpawnRadioBtn;
var FloatBox fbReSpawnRadio;
var localized string CaptionReSpawn;
var localized string CaptionRandom;
var localized string CaptionFixed;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelReSpawn;
var FloatBox fLabelReSpawn;
var bool bEnableFillModeList;

function InitializeRoomInfoStruct(wMatchMaker MM)
{
    UIRoomInfo.RoomName = MM.szRoomName;
    UIRoomInfo.RoomPassword = MM.szRoomPassword;
    UIRoomInfo.MapName = MM.szMapName;
    UIRoomInfo.GameMode = MM.kGame_GameMode;
    // End:0x90
    if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        UIRoomInfo.bPlayWithBots = true;
    }
    // End:0x9d
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
    UIRoomInfo.WeaponLimit = MM.eWeaponLimit;
    UIRoomInfo.bMultiBomb = MM.bMultiBomb;
    UIRoomInfo.bTeamBalance = MM.kGame_TeamBalance;
    UIRoomInfo.bResPawnType = MM.bSDRespawn;
    UIRoomInfo_Default = UIRoomInfo;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    InitializeRoomInfoStruct(MatchMaker);
    GameModeInfos = class'wGameSettings'.static.GetAllGameModes();
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.MakeRoom_Win_BG;
    ImageMap.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    ReSpawnRadioBtn = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', fbReSpawnRadio, 0.30));
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
    // End:0x214 [While If]
    if(i < 9)
    {
        LabelCommonTop[i] = NewLabelComponent(fbLabelCommonTop[i], class'BTUIResourcePoolHK'.default.empty);
        LabelCommonTop[i].Caption = strLabelCommonTop[i];
        LabelCommonTop[i].SetDefaultFontColor();
        LabelCommonTop[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x187;
    }
    i = 0;
    J0x21b:
    // End:0x2a8 [While If]
    if(i < 7)
    {
        LabelCommonBottom[i] = NewLabelComponent(fbLabelCommonBottom[i], class'BTUIResourcePoolHK'.default.empty);
        LabelCommonBottom[i].SetDefaultFontColor();
        LabelCommonBottom[i].Caption = strLabelCommonBottom[i];
        LabelCommonBottom[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21b;
    }
    i = 0;
    J0x2af:
    // End:0x31c [While If]
    if(i < 4)
    {
        LabelAdd[i] = NewLabelComponent(fbLabelAdd[i], class'BTUIResourcePoolHK'.default.empty);
        LabelAdd[i].SetDefaultFontColor();
        LabelAdd[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2af;
    }
    LabelReSpawn = NewLabelComponent(fLabelReSpawn, class'BTUIResourcePoolHK'.default.empty);
    LabelReSpawn.Caption = CaptionReSpawn;
    LabelReSpawn.CaptionDrawType = 3;
    InitializeEditBox();
    InitializeComboBox();
    InitializeRadioButton();
    InitGameModeSetting();
    BeginFillData();
    FillData();
    EndFillData();
    TopLine.CaptionDrawType = 4;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    EditRoomName.MaxTextStrNum = 30;
    EditPassword.MaxTextStrNum = 20;
    // End:0x490
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
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
}

function InitializeEditBox()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xcd [While If]
    if(i < 2)
    {
        Edit[i] = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fbEdit[i]));
        // End:0x98
        if(MatchMaker.bIsOwner == false)
        {
            LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], class'BTUIResourcePoolHK'.default.panel_2);
            Edit[i].bReadOnly = true;
        }
        // End:0xc3
        else
        {
            LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], class'BTUIResourcePoolHK'.default.panel_1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    EditRoomName = Edit[0];
    EditPassword = Edit[1];
    EditRoomName.MaxTextStrNum = 100;
    EditPassword.MaxTextStrNum = 20;
}

function InitializeComboBox()
{
    local int i;

    Combo[0] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[0], 0.590));
    Combo[0].ComboBox.Edit.bReadOnly = true;
    Combo[1] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[1], 0.60));
    Combo[1].ComboBox.Edit.bReadOnly = true;
    Combo[2] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[2], 0.560));
    Combo[2].ComboBox.Edit.bReadOnly = true;
    Combo[3] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[3], 0.550));
    Combo[3].ComboBox.Edit.bReadOnly = true;
    Combo[4] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[4], 0.560));
    Combo[4].ComboBox.Edit.bReadOnly = true;
    Combo[5] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[5], 0.550));
    Combo[5].ComboBox.Edit.bReadOnly = true;
    ComboAdd[0] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[0], 0.580));
    ComboAdd[0].ComboBox.Edit.bReadOnly = true;
    ComboAdd[1] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[1], 0.570));
    ComboAdd[1].ComboBox.Edit.bReadOnly = true;
    ComboAdd[2] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[2], 0.580));
    ComboAdd[2].ComboBox.Edit.bReadOnly = true;
    ComboAdd[3] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[3], 0.570));
    ComboAdd[3].ComboBox.Edit.bReadOnly = true;
    Combo[4].ComboBox.MaxVisibleItems = 5;
    ComboGameMode = Combo[1];
    ComboGameMode.ComboBox.MaxVisibleItems = 10;
    ComboGameTime = Combo[2];
    ComboWeaponRestriction = Combo[3];
    ComboWeaponRestriction.ComboBox.MaxVisibleItems = 5;
    ComboUserCount = Combo[4];
    ComboTargetScore = Combo[5];
    // End:0x4fd
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0x3c6:
        // End:0x45d [While If]
        if(i < 7)
        {
            // End:0x3e1
            if(i == 6)
            {
            }
            // End:0x453
            else
            {
                Combo[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
                Combo[i].ComboBox.bAcceptsInput = false;
                Combo[i].ComboBox.Edit.bAcceptsInput = false;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3c6;
        }
        i = 0;
        J0x464:
        // End:0x4ec [While If]
        if(i < 4)
        {
            ComboAdd[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            ComboAdd[i].ComboBox.bAcceptsInput = false;
            ComboAdd[i].ComboBox.Edit.bAcceptsInput = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x464;
        }
        ReSpawnRadioBtn.bAcceptsInput = false;
    }
    ComboIsHardCore = none;
    Combo[6] = none;
    ReSpawnRadioBtn.SetData(false);
}

function InitializeRadioButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5c [While If]
    if(i < 7)
    {
        // End:0x22
        if(i != 2)
        {
        }
        // End:0x52
        else
        {
            Radio[i] = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', fbRadio[i], 0.30));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
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
    J0xc3:
    // End:0x155 [While If]
    if(i < 7)
    {
        Radio[i].ButtonOn.bAcceptsInput = false;
        Radio[i].ButtonOff.bAcceptsInput = false;
        Radio[i].ButtonOn.DisableMe();
        Radio[i].ButtonOff.DisableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc3;
    }
    // End:0x1cb
    if(MatchMaker.bIsOwner)
    {
        RadioTeamBalance.ButtonOn.EnableMe();
        RadioTeamBalance.ButtonOff.EnableMe();
        RadioTeamBalance.ButtonOn.bAcceptsInput = true;
        RadioTeamBalance.ButtonOff.bAcceptsInput = true;
    }
}

function int GetSelectedMapID()
{
    return GetMapIDFromComboIndex(Combo[0].ComboBox.GetIndex());
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
    // End:0xd5 [While If]
    if(i < Maps.Length)
    {
        // End:0xcb
        if(InStr(FriendlyName, Maps[i].FriendlyName) >= 0)
        {
            return Maps[i].MapID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x85;
    }
    return 0;
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
    gmi = class'wGameSettings'.static.GetGameModeByIndex(nIndex);
    Combo[0].ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    pivotIndex = 0;
    isChange = false;
    i = 0;
    J0xf9:
    // End:0x1e2 [While If]
    if(i < Maps.Length)
    {
        Pivot = Maps[i];
        j = pivotIndex + 1;
        J0x128:
        // End:0x18d [While If]
        if(j < Maps.Length)
        {
            // End:0x183
            if(Pivot.MapDisplaySort > Maps[j].MapDisplaySort)
            {
                Pivot = Maps[j];
                Min = j;
                isChange = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x128;
        }
        // End:0x1c9
        if(isChange)
        {
            temp = Maps[i];
            Maps[i] = Pivot;
            Maps[Min] = temp;
        }
        isChange = false;
        ++ pivotIndex;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf9;
    }
    i = 0;
    J0x1e9:
    // End:0x353 [While If]
    if(i < Maps.Length)
    {
        // End:0x349
        if(Maps[i].MapID >= 0 && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, nIndex) != 0)
        {
            // End:0x2b1
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = Maps[i].NewMapIcon $ " " $ Maps[i].FriendlyName;
            }
            // End:0x2cb
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x349
            if(Maps[i].File != "TUT-BasicTraining")
            {
                Combo[0].ComboBox.AddItem(MapName, DynamicLoadObject(Maps[i].ResourceMapImage, class'Material'), Maps[i].File);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e9;
    }
    i = 0;
    J0x35a:
    // End:0x3e1 [While If]
    if(i < Combo[0].ComboBox.ItemCount())
    {
        // End:0x3d7
        if(Combo[0].ComboBox.List.GetExtraAtIndex(i) == UIRoomInfo.MapName)
        {
            Combo[0].ComboBox.SetIndex(i);
        }
        // End:0x3e1
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x35a;
        }
    }
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
    GameModeDispOrder = class'wGameSettings'.static.GetGameModeDispOrder();
    ComboGameMode.ComboBox.List.Clear();
    lp1 = 0;
    J0x7d:
    // End:0x15f [While If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        gmi = class'wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
        // End:0x155
        if(bSetGameMode == false && GameModeIndex == UIRoomInfo.GameMode)
        {
            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
            bSetGameMode = true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7d;
    }
    // End:0x1b7
    if(bSetGameMode == false)
    {
        SetGameMode_DefaultSettings(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index);
    }
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
    GameModeDispOrder = class'wGameSettings'.static.GetGameModeDispOrder();
    ComboGameMode.ComboBox.List.Clear();
    lp1 = 0;
    J0x7d:
    // End:0x195 [While If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        // End:0xb8
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
        }
        // End:0x18b
        else
        {
            // End:0xd4
            if(GameModeIndex == class'wGameSettings'.static.GetModeIndex_BotTutorial())
            {
            }
            // End:0x18b
            else
            {
                gmi = class'wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
                ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
                // End:0x18b
                if(bSetGameMode == false && GameModeIndex == UIRoomInfo.GameMode)
                {
                    ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                    bSetGameMode = true;
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7d;
    }
    // End:0x1ed
    if(bSetGameMode == false)
    {
        SetGameMode_DefaultSettings(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index);
    }
    // End:0x2c5
    if(class'wGameSettings'.static.IsBotModeIndex(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index) || GameModeIndex == IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index)
    {
        UIRoomInfo.WeaponLimit = 0;
        SetWeaponRestriction(UIRoomInfo.WeaponLimit);
        ComboWeaponRestriction.DisableMe();
    }
    // End:0x2e4
    else
    {
        SetWeaponRestriction(UIRoomInfo.WeaponLimit);
        ComboWeaponRestriction.EnableMe();
    }
}

function FillDefaultGameTimeAndScore()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local string DefaultTimeLimit, DefaultTargetScore;

    ComboGameTime.ComboBox.List.Clear();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    DefaultTargetScore = class'wGameSettings'.static.GetDefaultScore_ModeNum(GetGameModeIndex());
    DefaultTimeLimit = class'wGameSettings'.static.GetDefaultTimeLimit_ModeNum(GetGameModeIndex(), DefaultTargetScore);
    lp1 = 0;
    J0x7e:
    // End:0xfc [While If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        ComboGameTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xf2
        if(modeInfo.TimeLimits[lp1] == DefaultTimeLimit)
        {
            ComboGameTime.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
    ComboTargetScore.ComboBox.List.Clear();
    lp1 = 0;
    J0x124:
    // End:0x1a2 [While If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboTargetScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0x198
        if(modeInfo.Scores[lp1] == DefaultTargetScore)
        {
            ComboTargetScore.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x124;
    }
}

function FillGameTime()
{
    local int lp1;
    local GameModeInfo modeInfo;

    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    ComboGameTime.ComboBox.List.Clear();
    lp1 = 0;
    J0x43:
    // End:0xc8 [While If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        ComboGameTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xbe
        if(modeInfo.TimeLimits[lp1] == string(UIRoomInfo.TimeLimit))
        {
            ComboGameTime.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
}

function FillTargetScore()
{
    local int lp1;
    local GameModeInfo modeInfo;

    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    ComboTargetScore.ComboBox.List.Clear();
    lp1 = 0;
    J0x43:
    // End:0xc8 [While If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboTargetScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0xbe
        if(modeInfo.Scores[lp1] == string(UIRoomInfo.Score))
        {
            ComboTargetScore.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
}

function SetUserCount(int usercnt)
{
    local int i;

    UIRoomInfo.UserCount = usercnt;
    i = 0;
    J0x17:
    // End:0x93 [While If]
    if(i < ComboUserCount.ComboBox.List.ItemCount)
    {
        // End:0x89
        if(usercnt == int(ComboUserCount.ComboBox.GetItem(i)))
        {
            ComboUserCount.ComboBox.SetIndex(i);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function FillUserCountRalRalRa(optional bool bInvisibleodd)
{
    local int lp1;
    local GameModeInfo modeInfo;
    local int MapID, MaxUserCount;
    local bool bDefaultSet;

    ComboUserCount.ComboBox.List.Clear();
    MapID = GetSelectedMapID();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(MapID, GetGameModeIndex());
    bDefaultSet = false;
    lp1 = 0;
    J0x91:
    // End:0x213 [While If]
    if(lp1 < modeInfo.UserCount.Length)
    {
        // End:0xd4
        if(MatchMaker.kClanMatch_InChannel && modeInfo.UserCount[lp1] < 8)
        {
        }
        // End:0x209
        else
        {
            // End:0x168
            if(bInvisibleodd && float(modeInfo.UserCount[lp1]) % float(2) > float(0))
            {
                // End:0x165
                if(float(UIRoomInfo.UserCount) % float(2) > float(0) && float(UIRoomInfo.UserCount + 1) % float(2) == float(modeInfo.UserCount[lp1]))
                {
                    UIRoomInfo.UserCount = modeInfo.UserCount[lp1] + 1;
                }
            }
            // End:0x209
            else
            {
                // End:0x185
                if(modeInfo.UserCount[lp1] > MaxUserCount)
                {
                }
                // End:0x209
                else
                {
                    ComboUserCount.ComboBox.AddItem(string(modeInfo.UserCount[lp1]));
                    // End:0x209
                    if(modeInfo.UserCount[lp1] == UIRoomInfo.UserCount)
                    {
                        ComboUserCount.ComboBox.SetIndex(ComboUserCount.ComboBox.ItemCount() - 1);
                        bDefaultSet = true;
                    }
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x91;
    }
    // End:0x29b
    if(bDefaultSet == false)
    {
        ComboUserCount.ComboBox.SetIndex(ComboUserCount.ComboBox.ItemCount() - 1);
        UIRoomInfo.UserCount = int(ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.ItemCount() - 1));
    }
}

function FillWeaponRestriction()
{
    local int lp1;
    local array<string> temp;
    local int MapID;

    ComboWeaponRestriction.ComboBox.List.Clear();
    temp = class'wGameSettings'.static.GetWeaponRestrictions();
    MapID = GetSelectedMapID();
    lp1 = 0;
    J0x49:
    // End:0xd3 [While If]
    if(lp1 < temp.Length)
    {
        // End:0xc9
        if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
        {
            ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], class'BTCustomDrawHK'.static.MakeIntClass(lp1));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    UIRoomInfo.WeaponLimit = 0;
    SetWeaponRestriction(UIRoomInfo.WeaponLimit);
}

function SetWeaponRestriction(int Value)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x90 [While If]
    if(lp1 < ComboWeaponRestriction.ComboBox.ItemCount())
    {
        // End:0x86
        if(IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(lp1)).Index == Value)
        {
            ComboWeaponRestriction.ComboBox.SetIndex(lp1);
            return;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    ComboWeaponRestriction.ComboBox.SetIndex(0);
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
    // End:0xa1
    else
    {
        ComboIsHardCore.ComboBox.SetIndex(0);
    }
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
}

function EndFillData()
{
    Combo[0].ComboBox.__OnChange__Delegate = ComboMap_OnChange;
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboUserCount.ComboBox.__OnChange__Delegate = ComboUserCount_OnChange;
    ComboWeaponRestriction.ComboBox.__OnChange__Delegate = ComboWeaponRest_OnChange;
    ComboGameTime.ComboBox.__OnChange__Delegate = ComboGameTime_OnChange;
    ComboTargetScore.ComboBox.__OnChange__Delegate = ComboTargetScore_OnChange;
    // End:0x120
    if(UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_DeathMatch() || UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_BotDeathMatch() || UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_Defence())
    {
        RadioTeamBalance.DisableMe();
    }
    // End:0x12f
    else
    {
        RadioTeamBalance.EnableMe();
    }
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
    mInfo = MatchMaker.MapSettings.GetMapInfo(UIRoomInfo.MapName);
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    // End:0x1a3
    if(mInfo.ModeTDM_RandomRespawn == 0)
    {
        ReSpawnRadioBtn.SetData(false);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.EnableMe();
        ReSpawnRadioBtn.ButtonOn.DisableMe();
    }
    // End:0x311
    else
    {
        // End:0x216
        if(mInfo.ModeTDM_RandomRespawn == 1)
        {
            ReSpawnRadioBtn.SetData(true);
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
        }
        // End:0x311
        else
        {
            // End:0x311
            if(mInfo.ModeTDM_RandomRespawn == 2)
            {
                // End:0x251
                if(UIRoomInfo.bResPawnType == true)
                {
                    ReSpawnRadioBtn.SetData(false);
                }
                // End:0x261
                else
                {
                    ReSpawnRadioBtn.SetData(true);
                }
                // End:0x2dd
                if(MatchMaker.bIsOwner == true)
                {
                    ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOff.EnableMe();
                    ReSpawnRadioBtn.ButtonOn.EnableMe();
                }
                // End:0x311
                else
                {
                    ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
                    ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
                }
            }
        }
    }
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
    // End:0x3b4
    if(modeInfo.ModeIndex == 1)
    {
        ReSpawnRadioBtn.SetData(false);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.EnableMe();
        ReSpawnRadioBtn.ButtonOn.DisableMe();
    }
    // End:0x485
    if(modeInfo.ModeIndex == 2 || modeInfo.ModeIndex == 3 || modeInfo.ModeIndex == 4 || modeInfo.ModeIndex == 6 || modeInfo.ModeIndex == 7)
    {
        ReSpawnRadioBtn.SetData(true);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.DisableMe();
        ReSpawnRadioBtn.ButtonOn.EnableMe();
    }
}

function ComboGameTime_OnChange(GUIComponent Sender)
{
    UIRoomInfo.TimeLimit = int(GetGameTime());
    BeginFillData();
    FillData();
    EndFillData();
}

function ComboTargetScore_OnChange(GUIComponent Sender)
{
    UIRoomInfo.Score = int(GetTargetScore());
    BeginFillData();
    FillData();
    EndFillData();
}

function ComboMap_OnChange(GUIComponent Sender)
{
    local GameModeInfo modeInfo;

    UIRoomInfo.MapName = Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.Index);
    // End:0x6c
    if(GetSelectedMapID() == 6)
    {
        // End:0x6c
        if(UIRoomInfo.GameMode == 4)
        {
            SetGameMode_DefaultSettings(0);
        }
    }
    BeginFillData();
    FillData();
    EndFillData();
    // End:0x138
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
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
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
    // End:0x1db
    if(modeInfo.ModeIndex == 1)
    {
        ReSpawnRadioBtn.SetData(false);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.EnableMe();
        ReSpawnRadioBtn.ButtonOn.DisableMe();
    }
    // End:0x2ac
    if(modeInfo.ModeIndex == 2 || modeInfo.ModeIndex == 3 || modeInfo.ModeIndex == 4 || modeInfo.ModeIndex == 6 || modeInfo.ModeIndex == 7)
    {
        ReSpawnRadioBtn.SetData(true);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.DisableMe();
        ReSpawnRadioBtn.ButtonOn.EnableMe();
    }
    // End:0x2d9
    if(modeInfo.ModeIndex == class'wGameSettings'.static.GetModeIndex_DOA())
    {
        ComboWeaponRestriction.DisableMe();
    }
}

function SetGameMode_DefaultSettings(int cur)
{
    local GameModeInfo modeInfo;

    // End:0x16b
    if(cur != UIRoomInfo.GameMode)
    {
        UIRoomInfo.GameMode = cur;
        modeInfo = class'wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
        UIRoomInfo.Score = int(modeInfo.ScoreDefault);
        UIRoomInfo.UserCount = modeInfo.UserCount_Default;
        UIRoomInfo.TimeLimit = int(class'wGameSettings'.static.GetDefaultTimeLimit_ModeNum(UIRoomInfo.GameMode, string(UIRoomInfo.Score)));
        UIRoomInfo.bMultiBomb = true;
        // End:0x12e
        if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
        {
            UIRoomInfo.bPlayWithBots = true;
            UIRoomInfo.BotDifficulty = modeInfo.BotDifficulty_Default;
            UIRoomInfo.BotNum0 = modeInfo.BotNum0_Default;
            UIRoomInfo.BotNum1 = modeInfo.BotNum1_Default;
            UIRoomInfo.BotUserTeam = modeInfo.BotUserTeam_Default;
        }
        // End:0x16b
        else
        {
            UIRoomInfo.bPlayWithBots = false;
            UIRoomInfo.BotDifficulty = 1;
            UIRoomInfo.BotNum0 = 0;
            UIRoomInfo.BotNum1 = 0;
            UIRoomInfo.BotUserTeam = 0;
        }
    }
}

function ComboGameMode_OnChange(GUIComponent Sender)
{
    local int cur;
    local GameModeInfo modeInfo;

    cur = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    // End:0x1c9
    if(cur != UIRoomInfo.GameMode)
    {
        UIRoomInfo.GameMode = cur;
        modeInfo = class'wGameSettings'.static.GetGameModeByIndex(UIRoomInfo.GameMode);
        UIRoomInfo.Score = int(modeInfo.ScoreDefault);
        UIRoomInfo.UserCount = modeInfo.UserCount_Default;
        UIRoomInfo.TimeLimit = int(class'wGameSettings'.static.GetDefaultTimeLimit_ModeNum(UIRoomInfo.GameMode, string(UIRoomInfo.Score)));
        UIRoomInfo.bMultiBomb = true;
        // End:0x17a
        if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
        {
            UIRoomInfo.bPlayWithBots = true;
            UIRoomInfo.BotDifficulty = modeInfo.BotDifficulty_Default;
            UIRoomInfo.BotNum0 = modeInfo.BotNum0_Default;
            UIRoomInfo.BotNum1 = modeInfo.BotNum1_Default;
            UIRoomInfo.BotUserTeam = modeInfo.BotUserTeam_Default;
        }
        // End:0x1b7
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
        EndFillData();
    }
    // End:0x24d
    if(modeInfo.ModeIndex == 1)
    {
        ReSpawnRadioBtn.SetData(false);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.EnableMe();
        ReSpawnRadioBtn.ButtonOn.DisableMe();
    }
    // End:0x31e
    if(modeInfo.ModeIndex == 2 || modeInfo.ModeIndex == 3 || modeInfo.ModeIndex == 4 || modeInfo.ModeIndex == 6 || modeInfo.ModeIndex == 7)
    {
        ReSpawnRadioBtn.SetData(true);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.DisableMe();
        ReSpawnRadioBtn.ButtonOn.EnableMe();
    }
}

function ChangeComboAdd()
{
    local int i, MaxUserCount, ModeIndex_BotTeamDeath, ModeIndex_BotDomination, ModeIndex_BotDeathMatch, ModeIndex_BotTeamDeathBeginner,
	    ModeIndex_Defence;

    local bool bUC_AFSet, bUC_RSASet;

    i = 0;
    J0x07:
    // End:0x82 [While If]
    if(i < 4)
    {
        LabelAdd[i].Caption = "";
        ComboAdd[i].SetVisibility(false);
        ComboAdd[i].__OnChange__Delegate = None;
        ComboAdd[i].ComboBox.Clear();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    ComboGameTime.SetVisibility(true);
    ComboTargetScore.SetVisibility(true);
    ComboWeaponRestriction.SetVisibility(true);
    LabelCommonTop[4].SetVisibility(true);
    LabelCommonTop[5].SetVisibility(true);
    LabelCommonTop[7].SetVisibility(true);
    // End:0x10c
    if(UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_Sabotage())
    {
    }
    // End:0x1056
    else
    {
        // End:0x272
        if(UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_SD())
        {
            LabelAdd[0].Caption = strLabelBombPossesion;
            ComboBombPossesion = ComboAdd[0];
            ComboBombPossesion.SetVisibility(true);
            i = 0;
            J0x164:
            // End:0x1b3 [While If]
            if(i < 3)
            {
                // End:0x17e
                if(i != 0)
                {
                }
                // End:0x1a9
                else
                {
                    ComboAdd[i].EnableMe();
                    ComboAdd[i].SetVisibility(true);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x164;
            }
            ComboBombPossesion.ComboBox.AddItem(strBombForEveryone);
            ComboBombPossesion.ComboBox.AddItem(strBombForOne);
            // End:0x217
            if(UIRoomInfo.bMultiBomb)
            {
                ComboBombPossesion.ComboBox.SetIndex(0);
            }
            // End:0x230
            else
            {
                ComboBombPossesion.ComboBox.SetIndex(1);
            }
            ComboBombPossesion.ComboBox.List.SetTopItem(0);
            ComboBombPossesion.ComboBox.__OnChange__Delegate = ComboBombPossesion_OnChange;
        }
        // End:0x1056
        else
        {
            // End:0x1056
            if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
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
                ModeIndex_BotTeamDeath = class'wGameSettings'.static.GetModeIndex_BotTeamDeath();
                ModeIndex_BotDomination = class'wGameSettings'.static.GetModeIndex_BotDomination();
                ModeIndex_BotDeathMatch = class'wGameSettings'.static.GetModeIndex_BotDeathMatch();
                ModeIndex_BotTeamDeathBeginner = class'wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner();
                ModeIndex_Defence = class'wGameSettings'.static.GetModeIndex_Defence();
                switch(UIRoomInfo.GameMode)
                {
                    // End:0x477
                    case ModeIndex_BotTeamDeath:
                    // End:0x8a3
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
                        if(UIRoomInfo.BotUserTeam == 0 || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[1];
                        }
                        // End:0x57e
                        else
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[0];
                        }
                        // End:0x5bd
                        if(UIRoomInfo.BotUserTeam == 1 || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[3].Caption = strLabelBot_RSA[1];
                        }
                        // End:0x5d6
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
                        J0x63c:
                        // End:0x762 [While If]
                        if(i <= MaxUserCount)
                        {
                            // End:0x66c
                            if(UIRoomInfo.BotUserTeam == 2 && i == 1)
                            {
                            }
                            // End:0x758
                            else
                            {
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
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x63c;
                        }
                        // End:0x7f1
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
                        // End:0xfe2
                        break;
                    // End:0xad3
                    case ModeIndex_BotDeathMatch:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        LabelAdd[1].Caption = strLabelBot_AF[1];
                        MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(GetSelectedMapID(), GetGameModeIndex());
                        MaxUserCount *= float(2);
                        // End:0x96e
                        if(MaxUserCount > 8)
                        {
                            MaxUserCount = 8;
                        }
                        bUC_AFSet = false;
                        i = 2;
                        J0x97e:
                        // End:0xa0d [While If]
                        if(i <= MaxUserCount)
                        {
                            ComboBot_AF.ComboBox.AddItem(string(i));
                            // End:0xa03
                            if(i == UIRoomInfo.BotNum0)
                            {
                                ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                bUC_AFSet = true;
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x97e;
                        }
                        // End:0xa9c
                        if(bUC_AFSet == false)
                        {
                            ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.List.ItemCount - 1));
                        }
                        LabelAdd[3].Caption = "";
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(false);
                        // End:0xfe2
                        break;
                    // End:0xe4a
                    case ModeIndex_BotTeamDeathBeginner:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[2]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        LabelAdd[1].Caption = strLabelBot_AF[1];
                        LabelAdd[3].Caption = strLabelBot_RSA[0];
                        MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(GetSelectedMapID(), GetGameModeIndex());
                        // End:0xbcc
                        if(MaxUserCount > 8)
                        {
                            MaxUserCount = 8;
                        }
                        bUC_AFSet = false;
                        bUC_RSASet = false;
                        i = 1;
                        J0xbe3:
                        // End:0xd09 [While If]
                        if(i <= MaxUserCount)
                        {
                            // End:0xc13
                            if(UIRoomInfo.BotUserTeam == 2 && i == 1)
                            {
                            }
                            // End:0xcff
                            else
                            {
                                ComboBot_AF.ComboBox.AddItem(string(i));
                                ComboBot_RSA.ComboBox.AddItem(string(i));
                                // End:0xca8
                                if(i == UIRoomInfo.BotNum0)
                                {
                                    ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                    bUC_AFSet = true;
                                }
                                // End:0xcff
                                if(i == UIRoomInfo.BotNum1)
                                {
                                    ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                                    bUC_RSASet = true;
                                }
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0xbe3;
                        }
                        // End:0xd98
                        if(bUC_AFSet == false)
                        {
                            ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.List.ItemCount - 1));
                        }
                        // End:0xe27
                        if(bUC_RSASet == false)
                        {
                            ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                            UIRoomInfo.BotNum1 = int(ComboBot_RSA.ComboBox.GetItem(ComboBot_RSA.ComboBox.List.ItemCount - 1));
                        }
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(true);
                        // End:0xfe2
                        break;
                    // End:0xfdf
                    case ModeIndex_Defence:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.SetVisibility(true);
                        ComboBot_UserTeam.DisableMe();
                        ComboBot_Diffcult.ComboBox.Clear();
                        ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[1]);
                        ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[2]);
                        ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[3]);
                        ComboBot_Diffcult.ComboBox.AddItem(strLabelBot_Difficult[4]);
                        ComboBot_Diffcult.ComboBox.SetIndex(UIRoomInfo.BotDifficulty - 1);
                        ComboGameTime.SetVisibility(false);
                        ComboTargetScore.SetVisibility(false);
                        ComboWeaponRestriction.SetVisibility(false);
                        LabelCommonTop[4].SetVisibility(false);
                        LabelCommonTop[5].SetVisibility(false);
                        LabelCommonTop[7].SetVisibility(false);
                        LabelAdd[1].Caption = "";
                        LabelAdd[3].Caption = "";
                        // End:0xfe2
                        break;
                    // End:0xffff
                    default:
                        ComboBot_UserTeam.ComboBox.__OnChange__Delegate = ComboBot_UserTeam_OnChange;
                        ComboBot_AF.ComboBox.__OnChange__Delegate = ComboBot_AF_OnChange;
                        ComboBot_Diffcult.ComboBox.__OnChange__Delegate = ComboBot_Diffcult_OnChange;
                        ComboBot_RSA.ComboBox.__OnChange__Delegate = ComboBot_RSA_OnChange;
                    }
                }
            }
}

function ComboUserCount_OnChange(GUIComponent Sender)
{
    local int HalfPlusOne;

    BeginFillData();
    UIRoomInfo.UserCount = int(ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.Index));
    // End:0x1be
    if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        // End:0xcc
        if(class'wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0xc9
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xc9
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount + 1)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount + 1;
                }
            }
        }
        // End:0x1be
        else
        {
            // End:0x10d
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0x10a
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount;
                }
            }
            // End:0x1be
            else
            {
                // End:0x14e
                if(UIRoomInfo.BotUserTeam == 1)
                {
                    // End:0x14b
                    if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
                    {
                        UIRoomInfo.BotNum1 = UIRoomInfo.UserCount;
                    }
                }
                // End:0x1be
                else
                {
                    // End:0x1be
                    if(UIRoomInfo.BotUserTeam == 2)
                    {
                        HalfPlusOne = UIRoomInfo.UserCount / 2 + 1;
                        // End:0x19a
                        if(UIRoomInfo.BotNum0 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum0 = HalfPlusOne;
                        }
                        // End:0x1be
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
    // End:0x21b
    if(MatchMaker.kClanMatch_InChannel)
    {
        RadioTeamBalance.ButtonOn.DisableMe();
        RadioTeamBalance.ButtonOff.DisableMe();
        ComboBombPossesion.DisableMe();
    }
}

function ComboBombPossesion_OnChange(GUIComponent Sender)
{
    // End:0x2d
    if(ComboBombPossesion.ComboBox.Index == 0)
    {
        UIRoomInfo.bMultiBomb = true;
    }
    // End:0x3a
    else
    {
        UIRoomInfo.bMultiBomb = false;
    }
    BeginFillData();
    ChangeComboAdd();
    EndFillData();
}

function ComboBot_UserTeam_OnChange(GUIComponent Sender)
{
    local int HalfPlusOne;

    UIRoomInfo.BotUserTeam = ComboBot_UserTeam.ComboBox.Index;
    BeginFillData();
    // End:0x19b
    if(class'wGameSettings'.static.IsBotModeIndex(UIRoomInfo.GameMode))
    {
        // End:0xa9
        if(class'wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0xa6
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xa6
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount + 1)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount + 1;
                }
            }
        }
        // End:0x19b
        else
        {
            // End:0xea
            if(UIRoomInfo.BotUserTeam == 0)
            {
                // End:0xe7
                if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
                {
                    UIRoomInfo.BotNum0 = UIRoomInfo.UserCount;
                }
            }
            // End:0x19b
            else
            {
                // End:0x12b
                if(UIRoomInfo.BotUserTeam == 1)
                {
                    // End:0x128
                    if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
                    {
                        UIRoomInfo.BotNum1 = UIRoomInfo.UserCount;
                    }
                }
                // End:0x19b
                else
                {
                    // End:0x19b
                    if(UIRoomInfo.BotUserTeam == 2)
                    {
                        HalfPlusOne = UIRoomInfo.UserCount / 2 + 1;
                        // End:0x177
                        if(UIRoomInfo.BotNum0 < HalfPlusOne)
                        {
                            UIRoomInfo.BotNum0 = HalfPlusOne;
                        }
                        // End:0x19b
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
}

function ComboBot_Diffcult_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotDifficulty = ComboBot_Diffcult.ComboBox.Index + 1;
    BeginFillData();
    ChangeComboAdd();
    EndFillData();
}

function ComboWeaponRest_OnChange(GUIComponent Sender)
{
    UIRoomInfo.WeaponLimit = GetWeaponRestrictionIndex();
}

function ComboBot_AF_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotNum0 = int(ComboBot_AF.ComboBox.GetItem(ComboBot_AF.ComboBox.Index));
    BeginFillData();
    // End:0xce
    if(UIRoomInfo.BotUserTeam == 0)
    {
        // End:0xa2
        if(class'wGameSettings'.static.GetModeIndex_BotDeathMatch() == UIRoomInfo.GameMode)
        {
            // End:0x9f
            if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount + 1)
            {
                SetUserCount(UIRoomInfo.BotNum0 - 1);
            }
        }
        // End:0xcb
        else
        {
            // End:0xcb
            if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
            {
                SetUserCount(UIRoomInfo.BotNum0);
            }
        }
    }
    // End:0x116
    else
    {
        // End:0x116
        if(UIRoomInfo.BotUserTeam == 2)
        {
            // End:0x116
            if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount / 2 + 1)
            {
                SetUserCount(UIRoomInfo.BotNum0 - 1 * 2);
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
}

function ComboBot_RSA_OnChange(GUIComponent Sender)
{
    UIRoomInfo.BotNum1 = int(ComboBot_RSA.ComboBox.GetItem(ComboBot_RSA.ComboBox.Index));
    BeginFillData();
    // End:0x7e
    if(UIRoomInfo.BotUserTeam == 1)
    {
        // End:0x7b
        if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount)
        {
            SetUserCount(UIRoomInfo.BotNum1);
        }
    }
    // End:0xc6
    else
    {
        // End:0xc6
        if(UIRoomInfo.BotUserTeam == 2)
        {
            // End:0xc6
            if(UIRoomInfo.BotNum1 < UIRoomInfo.UserCount / 2 + 1)
            {
                SetUserCount(UIRoomInfo.BotNum1 - 1 * 2);
            }
        }
    }
    ChangeComboAdd();
    EndFillData();
}

function bool GetMultiBomb()
{
    // End:0x4c
    if(ComboBombPossesion != none && ComboBombPossesion.ComboBox.ItemCount() > 0 && ComboBombPossesion.ComboBox.Index == 1)
    {
        return false;
    }
    return true;
}

function string GetGameModeClass()
{
    return ComboGameMode.ComboBox.List.GetExtraAtIndex(ComboGameMode.ComboBox.Index);
}

function int GetGameModeIndex()
{
    return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
}

function string GetMap()
{
    return Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.Index);
}

function int GetMapIndex()
{
    return Combo[0].ComboBox.Index;
}

function string GetUserCount()
{
    return ComboUserCount.ComboBox.List.GetItemAtIndex(ComboUserCount.ComboBox.Index);
}

function string GetGameTime()
{
    return ComboGameTime.ComboBox.List.GetItemAtIndex(ComboGameTime.ComboBox.Index);
}

function int GetWeaponRestrictionIndex()
{
    // End:0x1d
    if(class'wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return 0;
    }
    // End:0x64
    else
    {
        return IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index;
    }
}

function string GetTargetScore()
{
    return ComboTargetScore.ComboBox.List.GetItemAtIndex(ComboTargetScore.ComboBox.Index);
}

function int GetIsHardCore()
{
    return ComboIsHardCore.ComboBox.Index;
}

function int IsPlayWithBots()
{
    // End:0x13
    if(UIRoomInfo.bPlayWithBots)
    {
        return 1;
    }
    // End:0x15
    else
    {
        return 0;
    }
}

function int GetAFBotCount()
{
    return UIRoomInfo.BotNum0;
}

function int GetRSABotCount()
{
    return UIRoomInfo.BotNum1;
}

function int GetBotModeDifficulty()
{
    return UIRoomInfo.BotDifficulty;
}

function int GetBotModeUserTeam()
{
    return UIRoomInfo.BotUserTeam;
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    MapName = Combo[0].ComboBox.List.GetExtraAtIndex(Combo[0].ComboBox.List.Index);
    mInfo = MatchMaker.MapSettings.GetMapInfo(MapName);
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    i = 0;
    J0xa7:
    // End:0x145 [While If]
    if(i < 3)
    {
        // End:0xed
        if(mInfo.ResourceSupplyImages[i] == "-")
        {
            ImageSupply[i].BackgroundImage.Image = none;
        }
        // End:0x13b
        else
        {
            ImageSupply[i].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material')));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa7;
    }
    i = 3;
    J0x14d:
    // End:0x17e [While If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14d;
    }
    // End:0x1c1
    if(mInfo != none && mInfo.NewMapIcon != "-")
    {
        NewMapIcon.BackgroundImage = class'BTUIResourcePoolHK'.default.newMap_Icon;
    }
    // End:0x1d6
    else
    {
        NewMapIcon.BackgroundImage.Image = none;
    }
}

defaultproperties
{
    fbSeparator=(X1=273.0,Y1=442.0,X2=751.0,Y2=444.0)
    fbLabelCommonTop[0]=(X1=265.0,Y1=116.0,X2=383.0,Y2=129.0)
    fbLabelCommonTop[1]=(X1=265.0,Y1=147.0,X2=383.0,Y2=160.0)
    fbLabelCommonTop[2]=(X1=265.0,Y1=391.0,X2=383.0,Y2=404.0)
    fbLabelCommonTop[3]=(X1=265.0,Y1=196.0,X2=365.0,Y2=209.0)
    fbLabelCommonTop[4]=(X1=513.0,Y1=528.0,X2=631.0,Y2=541.0)
    fbLabelCommonTop[5]=(X1=265.0,Y1=561.0,X2=383.0,Y2=574.0)
    fbLabelCommonTop[6]=(X1=265.0,Y1=528.0,X2=383.0,Y2=541.0)
    fbLabelCommonTop[7]=(X1=513.0,Y1=561.0,X2=631.0,Y2=574.0)
    fbLabelCommonTop[8]=(X1=525.0,Y1=346.0,X2=779.0,Y2=650.0)
    strLabelCommonTop[0]="Name"
    strLabelCommonTop[1]="Password"
    strLabelCommonTop[2]="Map"
    strLabelCommonTop[3]="Mode"
    strLabelCommonTop[4]="Game Time"
    strLabelCommonTop[5]="Sub-Mode"
    strLabelCommonTop[6]="Players"
    strLabelCommonTop[7]="Goal Score"
    fbLabelCommonBottom[0]=(X1=276.0,Y1=458.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[1]=(X1=276.0,Y1=492.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[2]=(X1=265.0,Y1=596.0,X2=383.0,Y2=609.0)
    fbLabelCommonBottom[3]=(X1=276.0,Y1=560.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[4]=(X1=525.0,Y1=458.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[5]=(X1=525.0,Y1=492.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[6]=(X1=525.0,Y1=526.0,X2=750.0,Y2=612.0)
    strLabelCommonBottom[0]=" "
    strLabelCommonBottom[1]=" "
    strLabelCommonBottom[2]="Team Balance"
    strLabelCommonBottom[4]=" "
    strLabelCommonBottom[5]=" "
    strLabelCommonBottom[6]=" "
    fbLabelAdd[0]=(X1=265.0,Y1=435.0,X2=383.0,Y2=448.0)
    fbLabelAdd[1]=(X1=265.0,Y1=468.0,X2=383.0,Y2=481.0)
    fbLabelAdd[2]=(X1=513.0,Y1=435.0,X2=631.0,Y2=448.0)
    fbLabelAdd[3]=(X1=513.0,Y1=468.0,X2=631.0,Y2=481.0)
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
    fbEdit[0]=(X1=390.0,Y1=116.0,X2=638.0,Y2=129.0)
    fbEdit[1]=(X1=390.0,Y1=147.0,X2=638.0,Y2=160.0)
    fbLabelEdit[0]=(X1=383.0,Y1=108.0,X2=641.0,Y2=137.0)
    fbLabelEdit[1]=(X1=383.0,Y1=139.0,X2=641.0,Y2=168.0)
    fbCombo[0]=(X1=384.0,Y1=383.0,X2=639.0,Y2=412.0)
    fbCombo[1]=(X1=366.0,Y1=188.0,X2=517.0,Y2=217.0)
    fbCombo[2]=(X1=632.0,Y1=519.0,X2=752.0,Y2=549.0)
    fbCombo[3]=(X1=384.0,Y1=552.0,X2=504.0,Y2=582.0)
    fbCombo[4]=(X1=384.0,Y1=519.0,X2=504.0,Y2=549.0)
    fbCombo[5]=(X1=632.0,Y1=552.0,X2=752.0,Y2=582.0)
    fbCombo[6]=(X1=632.0,Y1=552.0,X2=752.0,Y2=582.0)
    fbComboAdd[0]=(X1=384.0,Y1=426.0,X2=503.0,Y2=456.0)
    fbComboAdd[1]=(X1=384.0,Y1=459.0,X2=503.0,Y2=489.0)
    fbComboAdd[2]=(X1=632.0,Y1=426.0,X2=752.0,Y2=456.0)
    fbComboAdd[3]=(X1=632.0,Y1=459.0,X2=752.0,Y2=489.0)
    fbRadio[0]=(X1=356.0,Y1=457.0,X2=480.0,Y2=475.0)
    fbRadio[1]=(X1=356.0,Y1=491.0,X2=480.0,Y2=509.0)
    fbRadio[2]=(X1=385.0,Y1=594.0,X2=504.0,Y2=610.0)
    fbRadio[3]=(X1=356.0,Y1=559.0,X2=480.0,Y2=578.0)
    fbRadio[4]=(X1=606.0,Y1=457.0,X2=730.0,Y2=475.0)
    fbRadio[5]=(X1=606.0,Y1=491.0,X2=730.0,Y2=509.0)
    fbRadio[6]=(X1=606.0,Y1=525.0,X2=730.0,Y2=543.0)
    begin object name=mImageMap class=BTOwnerDrawImageHK
        AWinPos=(X1=384.0,Y1=230.0,X2=640.0,Y2=381.0)
        RenderWeight=0.20
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRoomInfoHK.mImageMap'
    ImageMap=mImageMap
    begin objec[0]t name=mImageMap0 class=BTOwnerDrawImageHK
        AWinPos=(X1=611.0,Y1=234.0,X2=635.0,Y2=258.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRoomInfoHK.mImageMap0'
    ImageSupply=mImageMap0
    begin object name=mImageMap1 class=BTOwnerDrawImageHK
        AWinPos=(X1=582.0,Y1=234.0,X2=606.0,Y2=258.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRoomInfoHK.mImageMap1'
    ImageSupply=mImageMap1
    begin object name=mImageMap2 class=BTOwnerDrawImageHK
        AWinPos=(X1=553.0,Y1=234.0,X2=577.0,Y2=258.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRoomInfoHK.mImageMap2'
    ImageSupply=mImageMap2
    begin object name=mNewMapIcon class=BTOwnerDrawImageHK
        AWinPos=(X1=387.0,Y1=234.0,X2=437.0,Y2=259.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRoomInfoHK.mNewMapIcon'
    NewMapIcon=mNewMapIcon
    fbReSpawnRadio=(X1=611.0,Y1=195.0,X2=730.0,Y2=210.0)
    CaptionReSpawn="Respawn"
    CaptionRandom="Random"
    CaptionFixed="Fixed"
    fLabelReSpawn=(X1=552.0,Y1=196.0,X2=640.0,Y2=209.0)
    fbBackgroundImage=(X1=256.0,Y1=68.0,X2=768.0,Y2=684.0)
    fbTopLine=(X1=362.0,Y1=74.0,X2=662.0,Y2=89.0)
    fbBottomLine=(X1=265.0,Y1=588.0,X2=759.0,Y2=630.0)
    fbButtonOK=(X1=387.0,Y1=631.0,X2=511.0,Y2=668.0)
    fbButtonCancel=(X1=513.0,Y1=631.0,X2=637.0,Y2=668.0)
    strTitle="Change Settings"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnRendered=FloatingRendered
}