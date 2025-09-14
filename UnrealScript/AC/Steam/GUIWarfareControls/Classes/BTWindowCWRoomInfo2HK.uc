/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCWRoomInfo2HK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:63
 *	Functions:44
 *
 *******************************************************************************/
class BTWindowCWRoomInfo2HK extends BTWindowHK
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
};

var UIRoomInfoStruct UIRoomInfo;
var UIRoomInfoStruct UIRoomInfo_Default;
var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbLabelCommonTop[9];
var localized string strLabelCommonTop[9];
var export editinline BTOwnerDrawImageHK LabelCommonTop[9];
var FloatBox fbLabelCommonBottom[7];
var localized string strLabelCommonBottom[7];
var export editinline BTOwnerDrawImageHK LabelCommonBottom[7];
var FloatBox fbLabelAdd[4];
var export editinline BTOwnerDrawImageHK LabelAdd[4];
var FloatBox fbLabelWarning[4];
var localized string strLabelWarning[4];
var export editinline BTOwnerDrawImageHK LabelWarning[4];
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
var bool bPlayWithBots;

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
    UIRoomInfo_Default = UIRoomInfo;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    InitializeRoomInfoStruct(MatchMaker);
    GameModeInfos = class'wGameSettings'.static.GetAllGameModes();
    Separator[0] = NewLabelComponent(fbSeparator[0], class'BTUIResourcePoolHK'.default.img_divid_line);
    Separator[1] = NewLabelComponent(fbSeparator[1], class'BTUIResourcePoolHK'.default.img_divid_line);
    i = 0;
    J0xad:
    // End:0x170 [While If]
    if(i < 9)
    {
        // End:0x166
        if(i == 3 || i == 4 || i == 5 || i == 7)
        {
            LabelCommonTop[i] = NewLabelComponent(fbLabelCommonTop[i], class'BTUIResourcePoolHK'.default.empty);
            LabelCommonTop[i].Caption = strLabelCommonTop[i];
            LabelCommonTop[i].SetDefaultFontColor();
            LabelCommonTop[i].CaptionDrawType = 0;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    i = 0;
    J0x177:
    // End:0x204 [While If]
    if(i < 7)
    {
        LabelCommonBottom[i] = NewLabelComponent(fbLabelCommonBottom[i], class'BTUIResourcePoolHK'.default.empty);
        LabelCommonBottom[i].SetDefaultFontColor();
        LabelCommonBottom[i].Caption = strLabelCommonBottom[i];
        LabelCommonBottom[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x177;
    }
    i = 0;
    J0x20b:
    // End:0x278 [While If]
    if(i < 4)
    {
        LabelAdd[i] = NewLabelComponent(fbLabelAdd[i], class'BTUIResourcePoolHK'.default.empty);
        LabelAdd[i].SetDefaultFontColor();
        LabelAdd[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20b;
    }
    i = 0;
    J0x27f:
    // End:0x332 [While If]
    if(i < 4)
    {
        LabelWarning[i] = NewLabelComponent(fbLabelWarning[i], class'BTUIResourcePoolHK'.default.empty);
        LabelWarning[i].SetFontSizeAll(9);
        LabelWarning[i].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27f;
    }
    InitializeComboBox();
    InitializeRadioButton();
    BeginFillData();
    FillData();
    EndFillData();
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
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

    Combo[0] = BTComboBoxMapHK(NewComponent(new class'BTComboBoxMapHK', fbCombo[0], 0.50));
    Combo[0].ComboBox.Edit.bReadOnly = true;
    i = 1;
    J0x54:
    // End:0xe2 [While If]
    if(i < 7)
    {
        // End:0x6f
        if(i == 6)
        {
        }
        // End:0xd8
        else
        {
            Combo[i] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbCombo[i], 0.50 - float(i) * 0.010));
            Combo[i].ComboBox.Edit.bReadOnly = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    i = 0;
    J0xe9:
    // End:0x168 [While If]
    if(i < 4)
    {
        ComboAdd[i] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[i], 0.40 - float(i) * 0.010));
        ComboAdd[i].ComboBox.Edit.bReadOnly = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe9;
    }
    ComboMap = BTComboBoxMapHK(Combo[0]);
    ComboGameMode = Combo[1];
    ComboGameTime = Combo[2];
    ComboWeaponRestriction = Combo[3];
    ComboWeaponRestriction.DisableMe();
    ComboUserCount = Combo[4];
    ComboTargetScore = Combo[5];
    // End:0x310
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0x1ea:
        // End:0x281 [While If]
        if(i < 7)
        {
            // End:0x205
            if(i == 6)
            {
            }
            // End:0x277
            else
            {
                Combo[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
                Combo[i].ComboBox.bAcceptsInput = false;
                Combo[i].ComboBox.Edit.bAcceptsInput = false;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1ea;
        }
        i = 0;
        J0x288:
        // End:0x310 [While If]
        if(i < 4)
        {
            ComboAdd[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            ComboAdd[i].ComboBox.bAcceptsInput = false;
            ComboAdd[i].ComboBox.Edit.bAcceptsInput = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x288;
        }
    }
    ComboIsHardCore = none;
    Combo[6] = none;
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
        if(i == 3)
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
    return GetMapIDFromComboIndex(ComboMap.ComboBox.GetIndex());
}

function int GetMapIDFromComboIndex(int idx)
{
    local int i;
    local string FriendlyName;
    local array<wMapInfo> Maps;

    FriendlyName = ComboMap.ComboBox.GetItem(idx);
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    i = 0;
    J0x59:
    // End:0xa9 [While If]
    if(i < Maps.Length)
    {
        // End:0x9f
        if(InStr(FriendlyName, Maps[i].FriendlyName) >= 0)
        {
            return Maps[i].MapID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x59;
    }
    return 0;
}

function FillMap()
{
    local int i;
    local array<wMapInfo> Maps;

    ComboMap.ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    i = 0;
    J0x57:
    // End:0xea [While If]
    if(i < Maps.Length)
    {
        // End:0xe0
        if(Maps[i].MapID > 0)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, DynamicLoadObject(Maps[i].ResourceMapImage, class'Material'), Maps[i].File);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    i = 0;
    J0xf1:
    // End:0x184 [While If]
    if(i < Maps.Length)
    {
        // End:0x17a
        if(Maps[i].MapID == 0)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, DynamicLoadObject(Maps[i].ResourceMapImage, class'Material'), Maps[i].File);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf1;
    }
    i = 0;
    J0x18b:
    // End:0x20c [While If]
    if(i < ComboMap.ComboBox.ItemCount())
    {
        // End:0x202
        if(ComboMap.ComboBox.List.GetExtraAtIndex(i) == UIRoomInfo.MapName)
        {
            ComboMap.ComboBox.SetIndex(i);
        }
        // End:0x20c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x18b;
        }
    }
}

function FillGameMode()
{
    local int lp1, DispOrderIndex;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;

    ComboGameMode.ComboBox.List.Clear();
    GameModeDispOrder.Length = 7;
    GameModeDispOrder[0] = 0;
    GameModeDispOrder[1] = 3;
    GameModeDispOrder[2] = 1;
    GameModeDispOrder[3] = 4;
    GameModeDispOrder[4] = 2;
    GameModeDispOrder[5] = 5;
    GameModeDispOrder[6] = 6;
    GameModeDispOrder[7] = 7;
    lp1 = 0;
    J0x85:
    // End:0x173 [While If]
    if(lp1 < GameModeInfos.Length)
    {
        DispOrderIndex = GameModeDispOrder[lp1];
        // End:0xc0
        if(MatchMaker.IsChannelRestrictionModes(DispOrderIndex))
        {
        }
        // End:0x169
        else
        {
            ComboGameMode.ComboBox.AddItem(GameModeInfos[DispOrderIndex].UserFriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(DispOrderIndex), GameModeInfos[DispOrderIndex].ClassName);
            // End:0x169
            if(bSetGameMode == false && DispOrderIndex == UIRoomInfo.GameMode)
            {
                ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                bSetGameMode = true;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x85;
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

    ComboUserCount.ComboBox.List.Clear();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    lp1 = 0;
    J0x43:
    // End:0x172 [While If]
    if(lp1 < modeInfo.UserCount.Length)
    {
        // End:0xec
        if(bInvisibleodd && float(modeInfo.UserCount[lp1]) % float(2) > float(0))
        {
            // End:0xe9
            if(float(UIRoomInfo.UserCount) % float(2) > float(0) && float(UIRoomInfo.UserCount + 1) % float(2) == float(modeInfo.UserCount[lp1]))
            {
                UIRoomInfo.UserCount = modeInfo.UserCount[lp1] + 1;
            }
        }
        // End:0x168
        else
        {
            ComboUserCount.ComboBox.AddItem(string(modeInfo.UserCount[lp1]));
            // End:0x168
            if(modeInfo.UserCount[lp1] == UIRoomInfo.UserCount)
            {
                ComboUserCount.ComboBox.SetIndex(ComboUserCount.ComboBox.ItemCount() - 1);
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
}

function FillWeaponRestriction()
{
    local int lp1;
    local array<string> temp;

    ComboWeaponRestriction.ComboBox.List.Clear();
    temp = class'wGameSettings'.static.GetWeaponRestrictions();
    lp1 = 0;
    J0x3d:
    // End:0xb5 [While If]
    if(lp1 < temp.Length)
    {
        // End:0xab
        if(lp1 == 0 || lp1 == 4 || lp1 == 5)
        {
            ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], class'BTCustomDrawHK'.static.MakeIntClass(lp1));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
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
    ComboGameMode.ComboBox.__OnChange__Delegate = None;
    ComboUserCount.ComboBox.__OnChange__Delegate = None;
    ComboWeaponRestriction.ComboBox.__OnChange__Delegate = None;
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
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboUserCount.ComboBox.__OnChange__Delegate = ComboUserCount_OnChange;
    ComboWeaponRestriction.ComboBox.__OnChange__Delegate = ComboWeaponRest_OnChange;
}

function FillData()
{
    FillGameMode();
    FillGameTime();
    FillTargetScore();
    FillWeaponRestriction();
    ChangeComboAdd();
    RadioTeamDamage.SetData(false);
    RadioFreeCamera.SetData(false);
    RadioTeamBalance.SetData(UIRoomInfo.bTeamBalance);
    RadioKillCam.SetData(false);
    RadioJoinInPlaying.SetData(false);
    RadioVoiceChatting.SetData(false);
    RadioVote.SetData(false);
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
}

function ChangeComboAdd()
{
    local int i, ModeIndex_BotTeamDeath, ModeIndex_BotDomination, ModeIndex_BotDeathMatch;

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
    // End:0xa3
    if(UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_Sabotage())
    {
    }
    // End:0x82a
    else
    {
        // End:0x209
        if(UIRoomInfo.GameMode == class'wGameSettings'.static.GetModeIndex_SD())
        {
            LabelAdd[0].Caption = strLabelBombPossesion;
            ComboBombPossesion = ComboAdd[0];
            ComboBombPossesion.SetVisibility(true);
            i = 0;
            J0xfb:
            // End:0x14a [While If]
            if(i < 3)
            {
                // End:0x115
                if(i != 0)
                {
                }
                // End:0x140
                else
                {
                    ComboAdd[i].EnableMe();
                    ComboAdd[i].SetVisibility(true);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xfb;
            }
            ComboBombPossesion.ComboBox.AddItem(strBombForEveryone);
            ComboBombPossesion.ComboBox.AddItem(strBombForOne);
            // End:0x1ae
            if(UIRoomInfo.bMultiBomb)
            {
                ComboBombPossesion.ComboBox.SetIndex(0);
            }
            // End:0x1c7
            else
            {
                ComboBombPossesion.ComboBox.SetIndex(1);
            }
            ComboBombPossesion.ComboBox.List.SetTopItem(0);
            ComboBombPossesion.ComboBox.__OnChange__Delegate = ComboBombPossesion_OnChange;
        }
        // End:0x82a
        else
        {
            // End:0x82a
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
                switch(UIRoomInfo.GameMode)
                {
                    // End:0x3e4
                    case ModeIndex_BotTeamDeath:
                    // End:0x680
                    case ModeIndex_BotDomination:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[2]);
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[3]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        // End:0x495
                        if(UIRoomInfo.BotUserTeam == 2)
                        {
                            FillUserCountRalRalRa(true);
                        }
                        // End:0x4d3
                        if(UIRoomInfo.BotUserTeam == 0 || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[1];
                        }
                        // End:0x4eb
                        else
                        {
                            LabelAdd[1].Caption = strLabelBot_AF[0];
                        }
                        // End:0x52a
                        if(UIRoomInfo.BotUserTeam == 1 || UIRoomInfo.BotUserTeam == 2)
                        {
                            LabelAdd[3].Caption = strLabelBot_RSA[1];
                        }
                        // End:0x543
                        else
                        {
                            LabelAdd[3].Caption = strLabelBot_RSA[0];
                        }
                        i = 1;
                        J0x54a:
                        // End:0x65d [While If]
                        if(i <= 8)
                        {
                            // End:0x577
                            if(UIRoomInfo.BotUserTeam == 2 && i == 1)
                            {
                            }
                            // End:0x653
                            else
                            {
                                ComboBot_AF.ComboBox.AddItem(string(i));
                                ComboBot_RSA.ComboBox.AddItem(string(i));
                                // End:0x604
                                if(i == UIRoomInfo.BotNum0)
                                {
                                    ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                                }
                                // End:0x653
                                if(i == UIRoomInfo.BotNum1)
                                {
                                    ComboBot_RSA.ComboBox.SetIndex(ComboBot_RSA.ComboBox.List.ItemCount - 1);
                                }
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x54a;
                        }
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(true);
                        // End:0x7b6
                        break;
                    // End:0x7b3
                    case ModeIndex_BotDeathMatch:
                        ComboBot_UserTeam.ComboBox.AddItem(strLabelBot_UserTeam[1]);
                        ComboBot_UserTeam.ComboBox.SetIndex(UIRoomInfo.BotUserTeam);
                        ComboBot_UserTeam.SetVisibility(true);
                        LabelAdd[1].Caption = strLabelBot_AF[1];
                        i = 1;
                        J0x6f8:
                        // End:0x77c [While If]
                        if(i <= 8)
                        {
                            ComboBot_AF.ComboBox.AddItem(string(i));
                            // End:0x772
                            if(i == UIRoomInfo.BotNum0)
                            {
                                ComboBot_AF.ComboBox.SetIndex(ComboBot_AF.ComboBox.List.ItemCount - 1);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x6f8;
                        }
                        LabelAdd[3].Caption = "";
                        ComboBot_AF.SetVisibility(true);
                        ComboBot_RSA.SetVisibility(false);
                        // End:0x7b6
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
    // End:0x7e
    if(UIRoomInfo.BotUserTeam == 0)
    {
        // End:0x7b
        if(UIRoomInfo.BotNum0 < UIRoomInfo.UserCount)
        {
            SetUserCount(UIRoomInfo.BotNum0);
        }
    }
    // End:0xc6
    else
    {
        // End:0xc6
        if(UIRoomInfo.BotUserTeam == 2)
        {
            // End:0xc6
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
    return ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.Index);
}

function int GetMapIndex()
{
    return ComboMap.ComboBox.Index;
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

defaultproperties
{
    fbSeparator[0]=(X1=273.0,Y1=306.0,X2=751.0,Y2=308.0)
    fbSeparator[1]=(X1=273.0,Y1=421.0,X2=751.0,Y2=423.0)
    fbLabelCommonTop[3]=(X1=276.0,Y1=176.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[4]=(X1=276.0,Y1=210.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[5]=(X1=525.0,Y1=176.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[7]=(X1=525.0,Y1=210.0,X2=779.0,Y2=650.0)
    fbLabelCommonBottom[0]=(X1=276.0,Y1=322.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[1]=(X1=276.0,Y1=356.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[2]=(X1=276.0,Y1=390.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[4]=(X1=525.0,Y1=322.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[5]=(X1=525.0,Y1=356.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[6]=(X1=525.0,Y1=390.0,X2=750.0,Y2=612.0)
    fbLabelAdd[0]=(X1=276.0,Y1=244.0,X2=779.0,Y2=650.0)
    fbLabelAdd[1]=(X1=276.0,Y1=278.0,X2=779.0,Y2=650.0)
    fbLabelAdd[2]=(X1=525.0,Y1=244.0,X2=779.0,Y2=650.0)
    fbLabelWarning[0]=(X1=276.0,Y1=434.0,X2=748.0,Y2=446.0)
    fbLabelWarning[1]=(X1=276.0,Y1=458.0,X2=748.0,Y2=470.0)
    fbLabelWarning[2]=(X1=276.0,Y1=482.0,X2=748.0,Y2=494.0)
    fbLabelWarning[3]=(X1=276.0,Y1=500.0,X2=748.0,Y2=512.0)
    fbCombo[1]=(X1=351.0,Y1=170.0,X2=501.0,Y2=196.0)
    fbCombo[2]=(X1=351.0,Y1=204.0,X2=501.0,Y2=230.0)
    fbCombo[3]=(X1=601.0,Y1=170.0,X2=751.0,Y2=196.0)
    fbCombo[5]=(X1=601.0,Y1=204.0,X2=751.0,Y2=230.0)
    fbComboAdd[0]=(X1=351.0,Y1=238.0,X2=501.0,Y2=264.0)
    fbComboAdd[1]=(X1=351.0,Y1=272.0,X2=501.0,Y2=298.0)
    fbComboAdd[2]=(X1=601.0,Y1=238.0,X2=751.0,Y2=264.0)
    fbRadio[0]=(X1=356.0,Y1=321.0,X2=480.0,Y2=339.0)
    fbRadio[1]=(X1=356.0,Y1=355.0,X2=480.0,Y2=373.0)
    fbRadio[2]=(X1=356.0,Y1=389.0,X2=480.0,Y2=407.0)
    fbRadio[4]=(X1=606.0,Y1=321.0,X2=730.0,Y2=339.0)
    fbRadio[5]=(X1=606.0,Y1=355.0,X2=730.0,Y2=373.0)
    fbRadio[6]=(X1=606.0,Y1=389.0,X2=730.0,Y2=407.0)
    fbBackgroundImage=(X1=245.0,Y1=116.0,X2=779.0,Y2=651.0)
    fbTopLine=(X1=265.0,Y1=136.0,X2=759.0,Y2=163.0)
    fbBottomLine=(X1=265.0,Y1=588.0,X2=759.0,Y2=630.0)
    fbButtonOK=(X1=390.0,Y1=594.0,X2=509.0,Y2=626.0)
    fbButtonCancel=(X1=514.0,Y1=594.0,X2=633.0,Y2=626.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}