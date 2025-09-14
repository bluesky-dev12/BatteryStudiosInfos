/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCreateRoom.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:52
 *	Functions:30
 *
 *******************************************************************************/
class BTWindowCreateRoom extends BTWindowHK
    editinlinenew
    instanced;

var string DefaultRandomRoomName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelRoomName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BorderRoomName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTEditBoxHK EditRoomName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BorderPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTEditBoxHK EditPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelGameMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboGameMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelCapacity;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboCapacity;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelWeaponRestriction;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboWeaponRestriction;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelScore;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboScore;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelDefenceModeLevel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboDefenceModeLevel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelTime;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK comboTime;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelBlance;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageSupply[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK NewMapIcon;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelReSpawn;
var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
var localized int DefaultRoomNamesCount;
var localized string DefaultRoomNames[100];
var localized string CaptionMakeRoom;
var localized string CaptionRoomName;
var localized string CaptionPassword;
var localized string CaptionMap;
var localized string CaptionGameMode;
var localized string CaptionCapacity;
var localized string CaptionWeaponRestriction;
var localized string CaptionScore;
var localized string CaptionTime;
var localized string CaptionBlance;
var localized string CaptionReSpawn;
var localized string CaptionRandom;
var localized string CaptionFixed;
var localized string CaptionDefenceModeLevel;
var localized string strLabeDF_Difficult[4];
var export editinline BTRadioOnOffButtonHK TeamBlanceRadioBtn;
var FloatBox fbRadio;
var export editinline BTRadioOnOffButtonHK ReSpawnRadioBtn;
var FloatBox fbReSpawnRadio;
var BTRODecorateStringHK btToolTip;
var array<export editinline BTOwnerDrawCaptionButtonHK> GameModeBtnList;
var byte nSelGameMode;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.MakeRoom_Win_BG;
    BorderRoomName.BackgroundImage = class'BTUIResourcePoolHK'.default.MakeRoom_Input_Text_BG;
    BorderPassword.BackgroundImage = class'BTUIResourcePoolHK'.default.MakeRoom_Input_Text_BG;
    ImageMap.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameModeInfos = class'wGameSettings'.static.GetAllGameModes();
    TeamBlanceRadioBtn = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', fbRadio, 0.10));
    TeamBlanceRadioBtn.ButtonOn.bAcceptsInput = true;
    TeamBlanceRadioBtn.ButtonOff.bAcceptsInput = true;
    ReSpawnRadioBtn = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', fbReSpawnRadio, 0.30));
    ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
    ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
    ReSpawnRadioBtn.ButtonOn.Caption = CaptionRandom;
    ReSpawnRadioBtn.ButtonOff.Caption = CaptionFixed;
    InitializeCombos();
    FillWindow();
    ApplyLocalizedStrings();
    TopLine.FontSize[0] = 11;
    TopLine.CaptionDrawType = 4;
    EditRoomName.MaxTextStrNum = 40;
    EditRoomName.bLimitDrawSize = true;
    EditRoomName.LimitDrawWidth = 230.0;
    EditPassword.MaxTextStrNum = 20;
    // End:0x298
    if(MatchMaker.kClanMatch_InChannel)
    {
        ComboGameMode.DisableMe();
        ComboWeaponRestriction.DisableMe();
        ComboScore.DisableMe();
        TeamBlanceRadioBtn.DisableMe();
        comboTime.DisableMe();
    }
    ComboMap.ComboBox.MyListBox.AWinPos.X1 = 618.0;
    ComboMap.ComboBox.MyListBox.AWinPos.Y1 = 360.0;
    ComboMap.ComboBox.MyListBox.AWinPos.X2 = 639.0;
    ComboMap.ComboBox.MyListBox.AWinPos.Y2 = 388.0;
    ComboGameMode.bVisible = false;
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
}

function InitializeCombos()
{
    ComboCapacity.ComboBox.Edit.bReadOnly = true;
    ComboCapacity.ComboBox.MaxVisibleItems = 5;
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboGameMode.ComboBox.Edit.bReadOnly = true;
    ComboGameMode.ComboBox.MaxVisibleItems = 20;
    ComboMap.ComboBox.Edit.bReadOnly = true;
    ComboScore.ComboBox.Edit.bReadOnly = true;
    ComboWeaponRestriction.ComboBox.Edit.bReadOnly = true;
    TeamBlanceRadioBtn.SetData(false);
    ReSpawnRadioBtn.SetData(false);
    ComboDefenceModeLevel.ComboBox.Edit.bReadOnly = true;
    ComboDefenceModeLevel.ComboBox.MaxVisibleItems = 4;
    ComboWeaponRestriction.ComboBox.MaxVisibleItems = 5;
}

function ApplyLocalizedStrings()
{
    LabelRoomName.Caption = CaptionRoomName;
    LabelPassword.Caption = CaptionPassword;
    LabelMap.Caption = CaptionMap;
    LabelGameMode.Caption = CaptionGameMode;
    LabelCapacity.Caption = CaptionCapacity;
    LabelWeaponRestriction.Caption = CaptionWeaponRestriction;
    LabelScore.Caption = CaptionScore;
    LabelTime.Caption = CaptionTime;
    LabelBlance.Caption = CaptionBlance;
    LabelReSpawn.Caption = CaptionReSpawn;
    LabelDefenceModeLevel.Caption = CaptionDefenceModeLevel;
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    EditPassword.SetText("");
    EditRoomName.SetText("");
    EditRoomName.FocusFirst(none);
}

function string GetGameModeClass()
{
    return ComboGameMode.ComboBox.List.GetExtraAtIndex(ComboGameMode.ComboBox.Index);
}

function SetGameModeByExtraDataIndex(int idx)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x8c [While If]
    if(lp1 < ComboGameMode.ComboBox.List.Elements.Length)
    {
        // End:0x82
        if(IntClass(ComboGameMode.ComboBox.List.Elements[lp1].ExtraData).Index == idx)
        {
            SetGameModeIndex(lp1);
            return;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    SetGameModeIndex(0);
}

function SetGameModeIndex(int idx)
{
    ComboGameMode.ComboBox.SetIndex(idx);
    GameModeBtnList[idx].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    FillWeaponRestrictions();
}

function int GetGameModeIndex()
{
    // End:0x47
    if(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index) == none)
    {
        return -1;
    }
    // End:0x8e
    else
    {
        return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    }
}

function string GetMapFriendlyName()
{
    return ComboMap.ComboBox.GetItem(ComboMap.ComboBox.Index);
}

function string GetMapName()
{
    return ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.Index);
}

function int GetMapIndex()
{
    return ComboMap.ComboBox.Index;
}

function int GetWeaponLimit()
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

function int GetBotModeUserTeam()
{
    // End:0x62
    if(class'wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index;
    }
    // End:0x64
    else
    {
        return 0;
    }
}

function int GetBotDifficultLevel()
{
    // End:0x36
    if(class'wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return ComboDefenceModeLevel.ComboBox.Index + 1;
    }
    // End:0x38
    else
    {
        return 0;
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
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x83:
    // End:0xd3 [While If]
    if(i < Maps.Length)
    {
        // End:0xc9
        if(InStr(FriendlyName, Maps[i].FriendlyName) >= 0)
        {
            return Maps[i].MapID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x83;
    }
    return 0;
}

function FillMapList()
{
    local int i;
    local array<int> GameModeDispOrder;
    local array<wMapInfo> Maps;
    local GameModeInfo gmi;
    local string MapName;
    local wMapInfo temp, Pivot;
    local int Min, j, pivotIndex;
    local bool isChange;

    ComboMap.ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    pivotIndex = 0;
    isChange = false;
    i = 0;
    J0x90:
    // End:0x179 [While If]
    if(i < Maps.Length)
    {
        Pivot = Maps[i];
        j = pivotIndex + 1;
        J0xbf:
        // End:0x124 [While If]
        if(j < Maps.Length)
        {
            // End:0x11a
            if(Pivot.MapDisplaySort > Maps[j].MapDisplaySort)
            {
                Pivot = Maps[j];
                Min = j;
                isChange = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xbf;
        }
        // End:0x160
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
        goto J0x90;
    }
    GameModeDispOrder = class'wGameSettings'.static.GetGameModeDispOrder();
    gmi = class'wGameSettings'.static.GetGameModeByIndex(nSelGameMode);
    i = 0;
    J0x1b1:
    // End:0x3dd [While If]
    if(i < Maps.Length)
    {
        // End:0x29e
        if(nSelGameMode == 255)
        {
            // End:0x223
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = Maps[i].NewMapIcon $ " " $ Maps[i].FriendlyName;
            }
            // End:0x23d
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x29b
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
        }
        // End:0x3d3
        else
        {
            // End:0x3d3
            if(Maps[i].MapID >= 0 && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, gmi.ModeIndex) != 0)
            {
                // End:0x35b
                if(Maps[i].NewMapIcon != "-")
                {
                    MapName = Maps[i].NewMapIcon $ " " $ Maps[i].FriendlyName;
                }
                // End:0x375
                else
                {
                    MapName = Maps[i].FriendlyName;
                }
                // End:0x3d3
                if(Maps[i].File != "TUT-BasicTraining")
                {
                    ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b1;
    }
    // End:0x461
    if(gmi.ModeIndex == 1)
    {
        ReSpawnRadioBtn.SetData(false);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.EnableMe();
        ReSpawnRadioBtn.ButtonOn.DisableMe();
    }
    // End:0x532
    if(gmi.ModeIndex == 2 || gmi.ModeIndex == 3 || gmi.ModeIndex == 4 || gmi.ModeIndex == 6 || gmi.ModeIndex == 7)
    {
        ReSpawnRadioBtn.SetData(true);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.DisableMe();
        ReSpawnRadioBtn.ButtonOn.EnableMe();
    }
}

function FillGameModeList(optional bool bSet, optional int Index)
{
    local int lp1, GameModeIndex, i;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;
    local int MapID;
    local GameModeInfo gmi;
    local export editinline BTOwnerDrawCaptionButtonHK TempBtn;

    // End:0x0e
    if(GameModeBtnList.Length > 0)
    {
        return;
    }
    ComboGameMode.ComboBox.List.Clear();
    GameModeDispOrder = class'wGameSettings'.static.GetGameModeDispOrder();
    i = 0;
    J0x4b:
    // End:0x76 [While If]
    if(i < GameModeBtnList.Length)
    {
        RemoveComponent(GameModeBtnList[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    GameModeBtnList.Length = 0;
    lp1 = 0;
    J0x85:
    // End:0x3f7 [While If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        // End:0xc0
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
        }
        // End:0x3ed
        else
        {
            // End:0xe4
            if(MapID == 29)
            {
                // End:0xe1
                if(GameModeDispOrder[lp1] != 8)
                {
                }
                // End:0x3ed
                else
                {
                    // This is an implied JumpToken;
                    goto J0xf9;
                }
                // End:0xf9
                if(GameModeDispOrder[lp1] == 8)
                {
                }
                // End:0x3ed
                else
                {
                    J0xf9:
                    gmi = class'wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
                    ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
                    TempBtn = new class'BTOwnerDrawCaptionButtonHK';
                    TempBtn.bUseAWinPos = true;
                    TempBtn.AWinPos.X1 = 383.0 + float(78) * float(GameModeBtnList.Length) % float(4);
                    TempBtn.AWinPos.Y1 = 184.0 + float(28 * GameModeBtnList.Length / 4);
                    TempBtn.AWinPos.X2 = 459.0 + float(78) * float(GameModeBtnList.Length) % float(4);
                    TempBtn.AWinPos.Y2 = 212.0 + float(28 * GameModeBtnList.Length / 4);
                    TempBtn.SetDefaultButtonImage();
                    TempBtn.SetDefaultFontColor();
                    TempBtn.SetFontSizeAll(9);
                    TempBtn.CaptionDrawType = 4;
                    TempBtn.Caption = gmi.UserFriendlyName;
                    TempBtn.__OnClick__Delegate = SelGameMode;
                    TempBtn.OnClickSound = 0;
                    TempBtn.InitComponent(Controller, self);
                    TempBtn.ButtonID = GameModeIndex;
                    TempBtn.Extra = GameModeIndex;
                    AppendComponent(TempBtn);
                    GameModeBtnList[GameModeBtnList.Length] = TempBtn;
                    // End:0x336
                    if(ComboGameMode.ComboBox.ItemCount() == 1)
                    {
                        ComboGameMode.ComboBox.SetIndex(0);
                    }
                    // End:0x3ab
                    if(bSet == false)
                    {
                        // End:0x3a8
                        if(bSetGameMode == false && gmi.ClassName == class'wGameSettings'.default.DefaultGameModeClass)
                        {
                            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                            bSetGameMode = true;
                        }
                    }
                    // End:0x3ed
                    else
                    {
                        // End:0x3ed
                        if(GameModeIndex == Index)
                        {
                            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                        }
                    }
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x85;
    }
    // End:0x4f2
    if(MatchMaker.kClanMatch_InChannel)
    {
        lp1 = 0;
        J0x410:
        // End:0x4ce [While If]
        if(lp1 < ComboGameMode.ComboBox.ItemCount())
        {
            // End:0x4af
            if(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(lp1)).Index == class'wGameSettings'.static.GetModeIndex_SD())
            {
                ComboGameMode.ComboBox.SetIndex(lp1);
                GameModeBtnList[lp1].EnableMe();
            }
            // End:0x4c4
            else
            {
                GameModeBtnList[lp1].DisableMe();
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x410;
        }
        SelGameMode(GameModeBtnList[ComboGameMode.ComboBox.GetIndex()]);
    }
}

function bool SelGameMode(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    i = 0;
    J0x17:
    // End:0xc6 [While If]
    if(i < GameModeBtnList.Length)
    {
        // End:0x97
        if(GameModeBtnList[i] == Sender)
        {
            ComboGameMode.ComboBox.SetIndex(i);
            nSelGameMode = byte(btn.ButtonID);
            GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
        }
        // End:0xbc
        else
        {
            GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    FillMapList();
    return true;
}

function FillScoreList()
{
    local int lp1;
    local GameModeInfo modeInfo;

    ComboScore.ComboBox.List.Clear();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    lp1 = 0;
    J0x43:
    // End:0xc6 [While If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0xbc
        if(modeInfo.Scores[lp1] == modeInfo.ScoreDefault)
        {
            ComboScore.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    // End:0xd8
    if(MatchMaker.kClanMatch_InChannel)
    {
    }
}

function FillGameTimeList()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local string DefaultTimeLimit, DefaultTargetScore;

    comboTime.ComboBox.List.Clear();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    DefaultTargetScore = class'wGameSettings'.static.GetDefaultScore_ModeNum(GetGameModeIndex());
    DefaultTimeLimit = class'wGameSettings'.static.GetDefaultTimeLimit_ModeNum(GetGameModeIndex(), DefaultTargetScore);
    lp1 = 0;
    J0x7e:
    // End:0xfc [While If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        comboTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xf2
        if(modeInfo.TimeLimits[lp1] == DefaultTimeLimit)
        {
            comboTime.ComboBox.SetIndex(lp1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
}

function FillCapacity()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local int MapID, MaxUserCount;
    local bool bDefaultSet;

    ComboCapacity.ComboBox.List.Clear();
    modeInfo = class'wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    MapID = GetSelectedMapID();
    MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(MapID, GetGameModeIndex());
    bDefaultSet = false;
    lp1 = 0;
    J0x91:
    // End:0x169 [While If]
    if(lp1 < modeInfo.UserCount.Length)
    {
        // End:0xd4
        if(MatchMaker.kClanMatch_InChannel && modeInfo.UserCount[lp1] < 8)
        {
        }
        // End:0x15f
        else
        {
            // End:0xf1
            if(modeInfo.UserCount[lp1] > MaxUserCount)
            {
            }
            // End:0x15f
            else
            {
                ComboCapacity.ComboBox.AddItem(string(modeInfo.UserCount[lp1]));
                // End:0x15f
                if(modeInfo.UserCount[lp1] == modeInfo.UserCount_Default)
                {
                    ComboCapacity.ComboBox.SetIndex(lp1);
                    bDefaultSet = true;
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x91;
    }
    // End:0x1f3
    if(MatchMaker.kClanMatch_InChannel)
    {
        lp1 = 0;
        J0x182:
        // End:0x1f3 [While If]
        if(lp1 < ComboCapacity.ComboBox.ItemCount())
        {
            // End:0x1e9
            if(int(ComboCapacity.ComboBox.GetItem(lp1)) == 16)
            {
                ComboCapacity.ComboBox.SetIndex(lp1);
                return;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x182;
        }
    }
    // End:0x232
    if(bDefaultSet == false)
    {
        ComboCapacity.ComboBox.SetIndex(ComboCapacity.ComboBox.ItemCount() - 1);
    }
}

function FillWeaponRestrictions()
{
    local int lp1, BotModeIdx;
    local array<string> temp;
    local int MapID;

    BotModeIdx = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    // End:0x118
    if(class'wGameSettings'.static.IsBotModeIndex(BotModeIdx))
    {
        LabelWeaponRestriction.Caption = class'BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[0];
        ComboWeaponRestriction.ComboBox.List.Clear();
        temp = class'wGameSettings'.static.GetBotModeTeam(BotModeIdx);
        lp1 = 0;
        J0xc4:
        // End:0x115 [While If]
        if(lp1 < temp.Length)
        {
            ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], class'BTCustomDrawHK'.static.MakeIntClass(lp1));
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0xc4;
        }
    }
    // End:0x1ff
    else
    {
        LabelWeaponRestriction.Caption = CaptionWeaponRestriction;
        ComboWeaponRestriction.ComboBox.List.Clear();
        temp = class'wGameSettings'.static.GetWeaponRestrictions();
        MapID = GetSelectedMapID();
        lp1 = 0;
        J0x175:
        // End:0x1ff [While If]
        if(lp1 < temp.Length)
        {
            // End:0x1f5
            if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
            {
                ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], class'BTCustomDrawHK'.static.MakeIntClass(lp1));
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x175;
        }
    }
}

function FillDefenceModeLevel()
{
    local int lp1, iGameMode;

    ComboDefenceModeLevel.ComboBox.Clear();
    iGameMode = class'wGameSettings'.static.GetModeIndex_Defence();
    lp1 = 0;
    J0x34:
    // End:0x6d [While If]
    if(lp1 < 4)
    {
        ComboDefenceModeLevel.ComboBox.AddItem(strLabeDF_Difficult[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x34;
    }
    ComboDefenceModeLevel.ComboBox.SetIndex(class'wGameSettings'.default.BotDifficulty_Default[iGameMode]);
}

function SetWeaponRestriction(int Value)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0xa2 [While If]
    if(lp1 < ComboWeaponRestriction.ComboBox.ItemCount())
    {
        // End:0x98
        if(IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index == Value)
        {
            ComboWeaponRestriction.ComboBox.SetIndex(lp1);
            return;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function FillWindow()
{
    FillMapList();
    FillGameModeList();
    FillCapacity();
    FillScoreList();
    FillWeaponRestrictions();
}

function ComboGameMode_OnChange(GUIComponent Sender)
{
    FillScoreList();
    FillCapacity();
    FillWeaponRestrictions();
    FillGameTimeList();
    // End:0x12f
    if(GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_DeathMatch() || GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_BotDeathMatch() || GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_Defence())
    {
        TeamBlanceRadioBtn.SetData(false);
        TeamBlanceRadioBtn.DisableMe();
        // End:0x10c
        if(GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_Defence())
        {
            ComboScore.SetVisibility(false);
            ComboWeaponRestriction.SetVisibility(false);
            LabelScore.SetVisibility(false);
            LabelWeaponRestriction.SetVisibility(false);
            FillDefenceModeLevel();
            ComboDefenceModeLevel.SetVisibility(true);
            LabelDefenceModeLevel.SetVisibility(true);
        }
        // End:0x12c
        else
        {
            ComboDefenceModeLevel.SetVisibility(false);
            LabelDefenceModeLevel.SetVisibility(false);
        }
    }
    // End:0x221
    else
    {
        // End:0x167
        if(GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_Alien())
        {
            TeamBlanceRadioBtn.DisableMe();
            ComboWeaponRestriction.DisableMe();
        }
        // End:0x193
        if(GetGameModeIndex() == class'wGameSettings'.static.GetModeIndex_DOA())
        {
            ComboWeaponRestriction.DisableMe();
        }
        // End:0x1b1
        else
        {
            TeamBlanceRadioBtn.EnableMe();
            ComboWeaponRestriction.EnableMe();
        }
        ComboWeaponRestriction.SetVisibility(true);
        LabelWeaponRestriction.SetVisibility(true);
        ComboScore.SetVisibility(true);
        LabelScore.SetVisibility(true);
        LabelWeaponRestriction.SetVisibility(true);
        ComboDefenceModeLevel.SetVisibility(false);
        LabelDefenceModeLevel.SetVisibility(false);
    }
    // End:0x242
    if(MatchMaker.kClanMatch_InChannel)
    {
        TeamBlanceRadioBtn.DisableMe();
    }
}

function SetRandomRoomName()
{
    DefaultRandomRoomName = DefaultRoomNames[Rand(DefaultRoomNamesCount)];
    EditRoomName.SetText(DefaultRandomRoomName);
    EditRoomName.bAllSelected = false;
    EditRoomName.bSelectionMode = true;
    EditRoomName.SelArea.StartPos = 0;
    EditRoomName.SelArea.EndPos = Len(EditRoomName.GetText());
    SetFocus(EditRoomName);
}

function ComboMap_OnChange(GUIComponent Sender)
{
    local int i;
    local wMapInfo mInfo;
    local int iGameModeIndex;
    local GameModeInfo gmi;

    mInfo = MatchMaker.MapSettings.GetMapInfo(GetMapName());
    gmi = class'wGameSettings'.static.GetGameModeByIndex(nSelGameMode);
    // End:0x31d
    if(mInfo != none)
    {
        // End:0xbe
        if(mInfo.ModeTDM_RandomRespawn == 0)
        {
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
        }
        // End:0x1ac
        else
        {
            // End:0x131
            if(mInfo.ModeTDM_RandomRespawn == 1)
            {
                ReSpawnRadioBtn.SetData(true);
                ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
                ReSpawnRadioBtn.ButtonOff.DisableMe();
                ReSpawnRadioBtn.ButtonOn.EnableMe();
            }
            // End:0x1ac
            else
            {
                // End:0x1ac
                if(mInfo.ModeTDM_RandomRespawn == 2)
                {
                    ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOff.EnableMe();
                    ReSpawnRadioBtn.ButtonOn.EnableMe();
                }
            }
        }
        gmi = class'wGameSettings'.static.GetGameModeByIndex(nSelGameMode);
        // End:0x24c
        if(gmi.ModeIndex == 1)
        {
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
        }
        // End:0x31d
        if(gmi.ModeIndex == 2 || gmi.ModeIndex == 3 || gmi.ModeIndex == 4 || gmi.ModeIndex == 6 || gmi.ModeIndex == 7)
        {
            ReSpawnRadioBtn.SetData(true);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
        }
    }
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    i = 0;
    J0x356:
    // End:0x3db [While If]
    if(i < 3)
    {
        // End:0x383
        if(mInfo.ResourceSupplyImages[i] == "")
        {
            // This is an implied JumpToken;
            goto J0x3db;
        }
        // End:0x3d1
        else
        {
            ImageSupply[i].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material')));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x356;
    }
    J0x3db:
    i = 3;
    J0x3e3:
    // End:0x414 [While If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3e3;
    }
    iGameModeIndex = GetGameModeIndex();
    // End:0x44d
    if(iGameModeIndex != -1)
    {
        FillGameModeList(true, iGameModeIndex);
        FillCapacity();
        FillScoreList();
        FillWeaponRestrictions();
    }
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    i = 0;
    J0x07:
    // End:0xd1 [While If]
    if(i < GameModeBtnList.Length)
    {
        // End:0xc7
        if(GameModeBtnList[i] != none && GameModeBtnList[i].MenuState == 1)
        {
            btToolTip.OriginalString.Text = GameModeInfos[GameModeBtnList[i].Extra].ModeDescription;
            btToolTip.AWinPos = GameModeBtnList[i].GetTooltipPos(0, 0);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(C);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    MapName = ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.List.Index);
    mInfo = MatchMaker.MapSettings.GetMapInfo(MapName);
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    i = 0;
    J0x174:
    // End:0x212 [While If]
    if(i < 3)
    {
        // End:0x1ba
        if(mInfo.ResourceSupplyImages[i] == "-")
        {
            ImageSupply[i].BackgroundImage.Image = none;
        }
        // End:0x208
        else
        {
            ImageSupply[i].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material')));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x174;
    }
    i = 3;
    J0x21a:
    // End:0x24b [While If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21a;
    }
    // End:0x28e
    if(mInfo != none && mInfo.NewMapIcon != "-")
    {
        NewMapIcon.BackgroundImage = class'BTUIResourcePoolHK'.default.newMap_Icon;
    }
    // End:0x2a3
    else
    {
        NewMapIcon.BackgroundImage.Image = none;
    }
}

defaultproperties
{
    begin object name=mLabelRoomName class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=116.0,X2=383.0,Y2=129.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelRoomName'
    LabelRoomName=mLabelRoomName
    begin object name=mBorderRoomName class=BTOwnerDrawImageHK
        AWinPos=(X1=383.0,Y1=108.0,X2=641.0,Y2=137.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mBorderRoomName'
    BorderRoomName=mBorderRoomName
    begin object name=mEditRoomName class=BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=390.0,Y1=116.0,X2=638.0,Y2=129.0)
        OnDraw=OwnerDraw
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnMousePressed=OnMousePressed
        OnMouseRelease=OnMouseRelease
        OnChange=Internal_OnChange
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTEditBoxHK'BTWindowCreateRoom.mEditRoomName'
    EditRoomName=mEditRoomName
    begin object name=mLabelPassword class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=147.0,X2=383.0,Y2=160.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelPassword'
    LabelPassword=mLabelPassword
    begin object name=mBorderPassword class=BTOwnerDrawImageHK
        AWinPos=(X1=383.0,Y1=139.0,X2=641.0,Y2=168.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mBorderPassword'
    BorderPassword=mBorderPassword
    begin object name=mEditPassword class=BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=390.0,Y1=147.0,X2=638.0,Y2=160.0)
        OnDraw=OwnerDraw
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnMousePressed=OnMousePressed
        OnMouseRelease=OnMouseRelease
        OnChange=Internal_OnChange
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTEditBoxHK'BTWindowCreateRoom.mEditPassword'
    EditPassword=mEditPassword
    begin object name=mLabelMap class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=435.0,X2=383.0,Y2=448.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelMap'
    LabelMap=mLabelMap
    begin object name=mComboMap class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=426.0,X2=640.0,Y2=456.0)
        RenderWeight=0.380
        OnDraw=InternalDraw
        OnChange=ComboMap_OnChange
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboMap'
    ComboMap=mComboMap
    begin object name=mLabelGameMode class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=190.0,X2=383.0,Y2=203.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelGameMode'
    LabelGameMode=mLabelGameMode
    begin object name=mComboGameMode class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=459.0,Y1=265.0,X2=641.0,Y2=300.0)
        RenderWeight=0.30
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboGameMode'
    ComboGameMode=mComboGameMode
    begin object name=mLabelCapacity class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=528.0,X2=383.0,Y2=541.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelCapacity'
    LabelCapacity=mLabelCapacity
    begin object name=mComboCapacity class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=519.0,X2=504.0,Y2=549.0)
        RenderWeight=0.370
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboCapacity'
    ComboCapacity=mComboCapacity
    begin object name=mLabelWeaponRestriction class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=561.0,X2=383.0,Y2=574.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelWeaponRestriction'
    LabelWeaponRestriction=mLabelWeaponRestriction
    begin object name=mComboWeaponRestriction class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=552.0,X2=504.0,Y2=582.0)
        RenderWeight=0.360
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboWeaponRestriction'
    ComboWeaponRestriction=mComboWeaponRestriction
    begin object name=mLabelScore class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=513.0,Y1=561.0,X2=631.0,Y2=574.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelScore'
    LabelScore=mLabelScore
    begin object name=mComboScore class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=632.0,Y1=552.0,X2=752.0,Y2=582.0)
        RenderWeight=0.210
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboScore'
    ComboScore=mComboScore
    begin object name=mLabelDefenceModeLevel class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=561.0,X2=383.0,Y2=574.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelDefenceModeLevel'
    LabelDefenceModeLevel=mLabelDefenceModeLevel
    begin object name=mComboDefenceModeLevel class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=552.0,X2=504.0,Y2=582.0)
        RenderWeight=0.220
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboDefenceModeLevel'
    ComboDefenceModeLevel=mComboDefenceModeLevel
    begin object name=mLabelTime class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=513.0,Y1=528.0,X2=631.0,Y2=541.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelTime'
    LabelTime=mLabelTime
    begin object name=mComboTime class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=632.0,Y1=519.0,X2=752.0,Y2=549.0)
        RenderWeight=0.360
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowCreateRoom.mComboTime'
    comboTime=mComboTime
    begin object name=mLabelBlance class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=596.0,X2=383.0,Y2=609.0)
        RenderWeight=0.190
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelBlance'
    LabelBlance=mLabelBlance
    begin object name=mImageMap class=BTOwnerDrawImageHK
        AWinPos=(X1=384.0,Y1=273.0,X2=640.0,Y2=424.0)
        RenderWeight=0.20
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mImageMap'
    ImageMap=mImageMap
    begin objec[0]t name=mImageMap0 class=BTOwnerDrawImageHK
        AWinPos=(X1=611.0,Y1=277.0,X2=635.0,Y2=301.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mImageMap0'
    ImageSupply=mImageMap0
    begin object name=mImageMap1 class=BTOwnerDrawImageHK
        AWinPos=(X1=582.0,Y1=277.0,X2=606.0,Y2=301.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mImageMap1'
    ImageSupply=mImageMap1
    begin object name=mImageMap2 class=BTOwnerDrawImageHK
        AWinPos=(X1=553.0,Y1=277.0,X2=577.0,Y2=301.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mImageMap2'
    ImageSupply=mImageMap2
    begin object name=mNewMapIcon class=BTOwnerDrawImageHK
        AWinPos=(X1=387.0,Y1=277.0,X2=437.0,Y2=302.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mNewMapIcon'
    NewMapIcon=mNewMapIcon
    begin object name=mLabelReSpawn class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0,Y1=469.0,X2=383.0,Y2=482.0)
        RenderWeight=0.190
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowCreateRoom.mLabelReSpawn'
    LabelReSpawn=mLabelReSpawn
    DefaultRoomNamesCount=9
    DefaultRoomNames[0]="Be the Veteran!"
    DefaultRoomNames[1]="Show us what you got!"
    DefaultRoomNames[2]="Your team is waiting for you!"
    DefaultRoomNames[3]="Join the battlegrounds now!"
    DefaultRoomNames[4]="Got the FPS skills?"
    DefaultRoomNames[5]="Lead your team to victory!"
    DefaultRoomNames[6]="The war has begun!"
    DefaultRoomNames[7]="Join your forces now!"
    DefaultRoomNames[8]="Dominate the battlefield!"
    CaptionRoomName="Name"
    CaptionPassword="Password"
    CaptionMap="Map"
    CaptionGameMode="Mode"
    CaptionCapacity="Players"
    CaptionWeaponRestriction="Sub-Mode"
    CaptionScore="Goal Score"
    CaptionTime="Game Time"
    CaptionBlance="Team Balance"
    CaptionReSpawn="Respawn"
    CaptionRandom="Random"
    CaptionFixed="Fixed"
    CaptionDefenceModeLevel="Level"
    strLabeDF_Difficult[0]="Very Easy"
    strLabeDF_Difficult[1]="Easy"
    strLabeDF_Difficult[2]="Normal"
    strLabeDF_Difficult[3]="Hard"
    fbRadio=(X1=385.0,Y1=594.0,X2=504.0,Y2=610.0)
    fbReSpawnRadio=(X1=385.0,Y1=467.0,X2=504.0,Y2=483.0)
    fbBackgroundImage=(X1=256.0,Y1=68.0,X2=768.0,Y2=684.0)
    fbTopLine=(X1=362.0,Y1=74.0,X2=662.0,Y2=89.0)
    fbBottomLine=(X1=201.0,Y1=485.0,X2=822.0,Y2=527.0)
    fbButtonOK=(X1=387.0,Y1=631.0,X2=511.0,Y2=668.0)
    fbButtonCancel=(X1=513.0,Y1=631.0,X2=637.0,Y2=668.0)
    strTitle="Create Game"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
}