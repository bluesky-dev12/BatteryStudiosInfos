class BTWindowCreateRoom extends BTWindowHK
    editinlinenew
    instanced;

var string DefaultRandomRoomName;
var() automated BTOwnerDrawImageHK LabelRoomName;
var() automated BTOwnerDrawImageHK BorderRoomName;
var() automated BTEditBoxHK EditRoomName;
var() automated BTOwnerDrawImageHK LabelPassword;
var() automated BTOwnerDrawImageHK BorderPassword;
var() automated BTEditBoxHK EditPassword;
var() automated BTOwnerDrawImageHK LabelMap;
var() automated BTComboBoxHK ComboMap;
var() automated BTOwnerDrawImageHK LabelGameMode;
var() automated BTComboBoxHK ComboGameMode;
var() automated BTOwnerDrawImageHK LabelCapacity;
var() automated BTComboBoxHK ComboCapacity;
var() automated BTOwnerDrawImageHK LabelWeaponRestriction;
var() automated BTComboBoxHK ComboWeaponRestriction;
var() automated BTOwnerDrawImageHK LabelScore;
var() automated BTComboBoxHK ComboScore;
var() automated BTOwnerDrawImageHK LabelDefenceModeLevel;
var() automated BTComboBoxHK ComboDefenceModeLevel;
var() automated BTOwnerDrawImageHK LabelTime;
var() automated BTComboBoxHK comboTime;
var() automated BTOwnerDrawImageHK LabelBlance;
var() automated BTOwnerDrawImageHK ImageMap;
var() automated BTOwnerDrawImageHK ImageSupply[3];
var() automated BTOwnerDrawImageHK NewMapIcon;
var() automated BTOwnerDrawImageHK LabelReSpawn;
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
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.MakeRoom_Win_BG;
    BorderRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.MakeRoom_Input_Text_BG;
    BorderPassword.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.MakeRoom_Input_Text_BG;
    ImageMap.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
    TeamBlanceRadioBtn = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', fbRadio, 0.1000000));
    TeamBlanceRadioBtn.ButtonOn.bAcceptsInput = true;
    TeamBlanceRadioBtn.ButtonOff.bAcceptsInput = true;
    ReSpawnRadioBtn = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', fbReSpawnRadio, 0.3000000));
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
    EditRoomName.LimitDrawWidth = 230.0000000;
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
    ComboMap.ComboBox.MyListBox.AWinPos.X1 = 618.0000000;
    ComboMap.ComboBox.MyListBox.AWinPos.Y1 = 360.0000000;
    ComboMap.ComboBox.MyListBox.AWinPos.X2 = 639.0000000;
    ComboMap.ComboBox.MyListBox.AWinPos.Y2 = 388.0000000;
    ComboGameMode.bVisible = false;
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
    //return;    
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
    //return;    
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
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    EditPassword.SetText("");
    EditRoomName.SetText("");
    EditRoomName.FocusFirst(none);
    //return;    
}

function string GetGameModeClass()
{
    return ComboGameMode.ComboBox.List.GetExtraAtIndex(ComboGameMode.ComboBox.Index);
    //return;    
}

function SetGameModeByExtraDataIndex(int idx)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(lp1 < ComboGameMode.ComboBox.List.Elements.Length)
    {
        // End:0x82
        if(IntClass(ComboGameMode.ComboBox.List.Elements[lp1].ExtraData).Index == idx)
        {
            SetGameModeIndex(lp1);
            return;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    SetGameModeIndex(0);
    //return;    
}

function SetGameModeIndex(int idx)
{
    ComboGameMode.ComboBox.SetIndex(idx);
    GameModeBtnList[idx].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    FillWeaponRestrictions();
    //return;    
}

function int GetGameModeIndex()
{
    // End:0x47
    if(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index) == none)
    {
        return -1;        
    }
    else
    {
        return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    }
    //return;    
}

function string GetMapFriendlyName()
{
    return ComboMap.ComboBox.GetItem(ComboMap.ComboBox.Index);
    //return;    
}

function string GetMapName()
{
    return ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.Index);
    //return;    
}

function int GetMapIndex()
{
    return ComboMap.ComboBox.Index;
    //return;    
}

function int GetWeaponLimit()
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

function int GetBotModeUserTeam()
{
    // End:0x62
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index;        
    }
    else
    {
        return 0;
    }
    //return;    
}

function int GetBotDifficultLevel()
{
    // End:0x36
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(GetGameModeIndex()))
    {
        return ComboDefenceModeLevel.ComboBox.Index + 1;        
    }
    else
    {
        return 0;
    }
    //return;    
}

function int GetSelectedMapID()
{
    return GetMapIDFromComboIndex(ComboMap.ComboBox.GetIndex());
    //return;    
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

    // End:0xD3 [Loop If]
    if(i < Maps.Length)
    {
        // End:0xC9
        if(InStr(FriendlyName, Maps[i].FriendlyName) >= 0)
        {
            return Maps[i].MapID;
        }
        i++;
        // [Loop Continue]
        goto J0x83;
    }
    return 0;
    //return;    
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

    // End:0x179 [Loop If]
    if(i < Maps.Length)
    {
        Pivot = Maps[i];
        j = pivotIndex + 1;
        J0xBF:

        // End:0x124 [Loop If]
        if(j < Maps.Length)
        {
            // End:0x11A
            if(Pivot.MapDisplaySort > Maps[j].MapDisplaySort)
            {
                Pivot = Maps[j];
                Min = j;
                isChange = true;
            }
            j++;
            // [Loop Continue]
            goto J0xBF;
        }
        // End:0x160
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
        goto J0x90;
    }
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(nSelGameMode));
    i = 0;
    J0x1B1:

    // End:0x3DD [Loop If]
    if(i < Maps.Length)
    {
        // End:0x29E
        if(int(nSelGameMode) == 255)
        {
            // End:0x223
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = (Maps[i].NewMapIcon $ " ") $ Maps[i].FriendlyName;                
            }
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x29B
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
            // [Explicit Continue]
            goto J0x3D3;
        }
        // End:0x3D3
        if((Maps[i].MapID >= 0) && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, gmi.ModeIndex) != 0)
        {
            // End:0x35B
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = (Maps[i].NewMapIcon $ " ") $ Maps[i].FriendlyName;                
            }
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x3D3
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
        }
        J0x3D3:

        i++;
        // [Loop Continue]
        goto J0x1B1;
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
    if(((((gmi.ModeIndex == 2) || gmi.ModeIndex == 3) || gmi.ModeIndex == 4) || gmi.ModeIndex == 6) || gmi.ModeIndex == 7)
    {
        ReSpawnRadioBtn.SetData(true);
        ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
        ReSpawnRadioBtn.ButtonOff.DisableMe();
        ReSpawnRadioBtn.ButtonOn.EnableMe();
    }
    //return;    
}

function FillGameModeList(optional bool bSet, optional int Index)
{
    local int lp1, GameModeIndex, i;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;
    local int MapID;
    local GameModeInfo gmi;
    local export editinline BTOwnerDrawCaptionButtonHK TempBtn;

    // End:0x0E
    if(GameModeBtnList.Length > 0)
    {
        return;
    }
    ComboGameMode.ComboBox.List.Clear();
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    i = 0;
    J0x4B:

    // End:0x76 [Loop If]
    if(i < GameModeBtnList.Length)
    {
        RemoveComponent(GameModeBtnList[i]);
        i++;
        // [Loop Continue]
        goto J0x4B;
    }
    GameModeBtnList.Length = 0;
    lp1 = 0;
    J0x85:

    // End:0x3F7 [Loop If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        // End:0xC0
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
            // [Explicit Continue]
            goto J0x3ED;
        }
        // End:0xE4
        if(MapID == 29)
        {
            // End:0xE1
            if(GameModeDispOrder[lp1] != 8)
            {
                // [Explicit Continue]
                goto J0x3ED;
            }            
        }
        else
        {
            // End:0xF9
            if(GameModeDispOrder[lp1] == 8)
            {
                // [Explicit Continue]
                goto J0x3ED;
            }
        }
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
        TempBtn = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        TempBtn.bUseAWinPos = true;
        TempBtn.AWinPos.X1 = 383.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y1 = 184.0000000 + float(28 * (GameModeBtnList.Length / 4));
        TempBtn.AWinPos.X2 = 459.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y2 = 212.0000000 + float(28 * (GameModeBtnList.Length / 4));
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
        // End:0x3AB
        if(bSet == false)
        {
            // End:0x3A8
            if((bSetGameMode == false) && gmi.ClassName == Class'Engine.wGameSettings'.default.DefaultGameModeClass)
            {
                ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                bSetGameMode = true;
            }
            // [Explicit Continue]
            goto J0x3ED;
        }
        // End:0x3ED
        if(GameModeIndex == Index)
        {
            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
        }
        J0x3ED:

        lp1++;
        // [Loop Continue]
        goto J0x85;
    }
    // End:0x4F2
    if(MatchMaker.kClanMatch_InChannel)
    {
        lp1 = 0;
        J0x410:

        // End:0x4CE [Loop If]
        if(lp1 < ComboGameMode.ComboBox.ItemCount())
        {
            // End:0x4AF
            if(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(lp1)).Index == Class'Engine.wGameSettings'.static.GetModeIndex_SD())
            {
                ComboGameMode.ComboBox.SetIndex(lp1);
                GameModeBtnList[lp1].EnableMe();
                // [Explicit Continue]
                goto J0x4C4;
            }
            GameModeBtnList[lp1].DisableMe();
            J0x4C4:

            lp1++;
            // [Loop Continue]
            goto J0x410;
        }
        SelGameMode(GameModeBtnList[ComboGameMode.ComboBox.GetIndex()]);
    }
    //return;    
}

function bool SelGameMode(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    i = 0;
    J0x17:

    // End:0xC6 [Loop If]
    if(i < GameModeBtnList.Length)
    {
        // End:0x97
        if(GameModeBtnList[i] == Sender)
        {
            ComboGameMode.ComboBox.SetIndex(i);
            nSelGameMode = byte(btn.ButtonID);
            GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
            // [Explicit Continue]
            goto J0xBC;
        }
        GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        J0xBC:

        i++;
        // [Loop Continue]
        goto J0x17;
    }
    FillMapList();
    return true;
    //return;    
}

function FillScoreList()
{
    local int lp1;
    local GameModeInfo modeInfo;

    ComboScore.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    lp1 = 0;
    J0x43:

    // End:0xC6 [Loop If]
    if(lp1 < modeInfo.Scores.Length)
    {
        ComboScore.ComboBox.AddItem(modeInfo.Scores[lp1]);
        // End:0xBC
        if(modeInfo.Scores[lp1] == modeInfo.ScoreDefault)
        {
            ComboScore.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0xD8
    if(MatchMaker.kClanMatch_InChannel)
    {
    }
    //return;    
}

function FillGameTimeList()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local string DefaultTimeLimit, DefaultTargetScore;

    comboTime.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    DefaultTargetScore = Class'Engine.wGameSettings'.static.GetDefaultScore_ModeNum(GetGameModeIndex());
    DefaultTimeLimit = Class'Engine.wGameSettings'.static.GetDefaultTimeLimit_ModeNum(GetGameModeIndex(), DefaultTargetScore);
    lp1 = 0;
    J0x7E:

    // End:0xFC [Loop If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        comboTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xF2
        if(modeInfo.TimeLimits[lp1] == DefaultTimeLimit)
        {
            comboTime.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x7E;
    }
    //return;    
}

function FillCapacity()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local int MapID, MaxUserCount;
    local bool bDefaultSet;

    ComboCapacity.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GetGameModeIndex());
    MapID = GetSelectedMapID();
    MaxUserCount = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMaxUserCount(MapID, GetGameModeIndex());
    bDefaultSet = false;
    lp1 = 0;
    J0x91:

    // End:0x169 [Loop If]
    if(lp1 < modeInfo.UserCount.Length)
    {
        // End:0xD4
        if(MatchMaker.kClanMatch_InChannel && modeInfo.UserCount[lp1] < 8)
        {
            // [Explicit Continue]
            goto J0x15F;
        }
        // End:0xF1
        if(modeInfo.UserCount[lp1] > MaxUserCount)
        {
            // [Explicit Continue]
            goto J0x15F;
        }
        ComboCapacity.ComboBox.AddItem(string(modeInfo.UserCount[lp1]));
        // End:0x15F
        if(modeInfo.UserCount[lp1] == modeInfo.UserCount_Default)
        {
            ComboCapacity.ComboBox.SetIndex(lp1);
            bDefaultSet = true;
        }
        J0x15F:

        lp1++;
        // [Loop Continue]
        goto J0x91;
    }
    // End:0x1F3
    if(MatchMaker.kClanMatch_InChannel)
    {
        lp1 = 0;
        J0x182:

        // End:0x1F3 [Loop If]
        if(lp1 < ComboCapacity.ComboBox.ItemCount())
        {
            // End:0x1E9
            if(int(ComboCapacity.ComboBox.GetItem(lp1)) == 16)
            {
                ComboCapacity.ComboBox.SetIndex(lp1);
                return;
            }
            lp1++;
            // [Loop Continue]
            goto J0x182;
        }
    }
    // End:0x232
    if(bDefaultSet == false)
    {
        ComboCapacity.ComboBox.SetIndex(ComboCapacity.ComboBox.ItemCount() - 1);
    }
    //return;    
}

function FillWeaponRestrictions()
{
    local int lp1, BotModeIdx;
    local array<string> temp;
    local int MapID;

    BotModeIdx = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    // End:0x118
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(BotModeIdx))
    {
        LabelWeaponRestriction.Caption = Class'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[0];
        ComboWeaponRestriction.ComboBox.List.Clear();
        temp = Class'Engine.wGameSettings'.static.GetBotModeTeam(BotModeIdx);
        lp1 = 0;
        J0xC4:

        // End:0x115 [Loop If]
        if(lp1 < temp.Length)
        {
            ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
            lp1++;
            // [Loop Continue]
            goto J0xC4;
        }        
    }
    else
    {
        LabelWeaponRestriction.Caption = CaptionWeaponRestriction;
        ComboWeaponRestriction.ComboBox.List.Clear();
        temp = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
        MapID = GetSelectedMapID();
        lp1 = 0;
        J0x175:

        // End:0x1FF [Loop If]
        if(lp1 < temp.Length)
        {
            // End:0x1F5
            if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
            {
                ComboWeaponRestriction.ComboBox.AddItem(temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
            }
            lp1++;
            // [Loop Continue]
            goto J0x175;
        }
    }
    //return;    
}

function FillDefenceModeLevel()
{
    local int lp1, iGameMode;

    ComboDefenceModeLevel.ComboBox.Clear();
    iGameMode = Class'Engine.wGameSettings'.static.GetModeIndex_Defence();
    lp1 = 0;
    J0x34:

    // End:0x6D [Loop If]
    if(lp1 < 4)
    {
        ComboDefenceModeLevel.ComboBox.AddItem(strLabeDF_Difficult[lp1]);
        ++lp1;
        // [Loop Continue]
        goto J0x34;
    }
    ComboDefenceModeLevel.ComboBox.SetIndex(Class'Engine.wGameSettings'.default.BotDifficulty_Default[iGameMode]);
    //return;    
}

function SetWeaponRestriction(int Value)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0xA2 [Loop If]
    if(lp1 < ComboWeaponRestriction.ComboBox.ItemCount())
    {
        // End:0x98
        if(IntClass(ComboWeaponRestriction.ComboBox.List.GetObjectAtIndex(ComboWeaponRestriction.ComboBox.Index)).Index == Value)
        {
            ComboWeaponRestriction.ComboBox.SetIndex(lp1);
            return;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FillWindow()
{
    FillMapList();
    FillGameModeList();
    FillCapacity();
    FillScoreList();
    FillWeaponRestrictions();
    //return;    
}

function ComboGameMode_OnChange(GUIComponent Sender)
{
    FillScoreList();
    FillCapacity();
    FillWeaponRestrictions();
    FillGameTimeList();
    // End:0x12F
    if((((GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_DeathMatch()) || (GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch()) || (GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        TeamBlanceRadioBtn.SetData(false);
        TeamBlanceRadioBtn.DisableMe();
        // End:0x10C
        if((GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
        {
            ComboScore.SetVisibility(false);
            ComboWeaponRestriction.SetVisibility(false);
            LabelScore.SetVisibility(false);
            LabelWeaponRestriction.SetVisibility(false);
            FillDefenceModeLevel();
            ComboDefenceModeLevel.SetVisibility(true);
            LabelDefenceModeLevel.SetVisibility(true);            
        }
        else
        {
            ComboDefenceModeLevel.SetVisibility(false);
            LabelDefenceModeLevel.SetVisibility(false);
        }        
    }
    else
    {
        // End:0x167
        if((GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
        {
            TeamBlanceRadioBtn.DisableMe();
            ComboWeaponRestriction.DisableMe();
        }
        // End:0x193
        if((GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
        {
            ComboWeaponRestriction.DisableMe();            
        }
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
    //return;    
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
    //return;    
}

function ComboMap_OnChange(GUIComponent Sender)
{
    local int i;
    local wMapInfo mInfo;
    local int iGameModeIndex;
    local GameModeInfo gmi;

    mInfo = MatchMaker.MapSettings.GetMapInfo(GetMapName());
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(nSelGameMode));
    // End:0x31D
    if(mInfo != none)
    {
        // End:0xBE
        if(int(mInfo.ModeTDM_RandomRespawn) == 0)
        {
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();            
        }
        else
        {
            // End:0x131
            if(int(mInfo.ModeTDM_RandomRespawn) == 1)
            {
                ReSpawnRadioBtn.SetData(true);
                ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
                ReSpawnRadioBtn.ButtonOff.DisableMe();
                ReSpawnRadioBtn.ButtonOn.EnableMe();                
            }
            else
            {
                // End:0x1AC
                if(int(mInfo.ModeTDM_RandomRespawn) == 2)
                {
                    ReSpawnRadioBtn.ButtonOff.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOn.bAcceptsInput = true;
                    ReSpawnRadioBtn.ButtonOff.EnableMe();
                    ReSpawnRadioBtn.ButtonOn.EnableMe();
                }
            }
        }
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(nSelGameMode));
        // End:0x24C
        if(gmi.ModeIndex == 1)
        {
            ReSpawnRadioBtn.SetData(false);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.EnableMe();
            ReSpawnRadioBtn.ButtonOn.DisableMe();
        }
        // End:0x31D
        if(((((gmi.ModeIndex == 2) || gmi.ModeIndex == 3) || gmi.ModeIndex == 4) || gmi.ModeIndex == 6) || gmi.ModeIndex == 7)
        {
            ReSpawnRadioBtn.SetData(true);
            ReSpawnRadioBtn.ButtonOn.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.bAcceptsInput = false;
            ReSpawnRadioBtn.ButtonOff.DisableMe();
            ReSpawnRadioBtn.ButtonOn.EnableMe();
        }
    }
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    i = 0;
    J0x356:

    // End:0x3DB [Loop If]
    if(i < 3)
    {
        // End:0x383
        if(mInfo.ResourceSupplyImages[i] == "")
        {
            // [Explicit Break]
            goto J0x3DB;
            // [Explicit Continue]
            goto J0x3D1;
        }
        ImageSupply[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        J0x3D1:

        i++;
        // [Loop Continue]
        goto J0x356;
    }
    J0x3DB:

    i = 3;
    J0x3E3:

    // End:0x414 [Loop If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0x3E3;
    }
    iGameModeIndex = GetGameModeIndex();
    // End:0x44D
    if(iGameModeIndex != -1)
    {
        FillGameModeList(true, iGameModeIndex);
        FillCapacity();
        FillScoreList();
        FillWeaponRestrictions();
    }
    //return;    
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    i = 0;
    J0x07:

    // End:0xD1 [Loop If]
    if(i < GameModeBtnList.Length)
    {
        // End:0xC7
        if((GameModeBtnList[i] != none) && int(GameModeBtnList[i].MenuState) == int(1))
        {
            btToolTip.OriginalString.Text = GameModeInfos[GameModeBtnList[i].Extra].ModeDescription;
            btToolTip.AWinPos = GameModeBtnList[i].GetTooltipPos(0, 0);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(C);
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    MapName = ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.List.Index);
    mInfo = MatchMaker.MapSettings.GetMapInfo(MapName);
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    i = 0;
    J0x174:

    // End:0x212 [Loop If]
    if(i < 3)
    {
        // End:0x1BA
        if(mInfo.ResourceSupplyImages[i] == "-")
        {
            ImageSupply[i].BackgroundImage.Image = none;
            // [Explicit Continue]
            goto J0x208;
        }
        ImageSupply[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        J0x208:

        i++;
        // [Loop Continue]
        goto J0x174;
    }
    i = 3;
    J0x21A:

    // End:0x24B [Loop If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0x21A;
    }
    // End:0x28E
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
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelRoomName'
    begin object name="mLabelRoomName" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=116.0000000,X2=383.0000000,Y2=129.0000000)
        OnRendered=mLabelRoomName.Internal_OnRendered
    end object
    LabelRoomName=mLabelRoomName
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mBorderRoomName'
    begin object name="mBorderRoomName" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=383.0000000,Y1=108.0000000,X2=641.0000000,Y2=137.0000000)
        OnRendered=mBorderRoomName.Internal_OnRendered
    end object
    BorderRoomName=mBorderRoomName
    // Reference: BTEditBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mEditRoomName'
    begin object name="mEditRoomName" class=GUIWarfareControls_Decompressed.BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=390.0000000,Y1=116.0000000,X2=638.0000000,Y2=129.0000000)
        OnDraw=mEditRoomName.OwnerDraw
        OnActivate=mEditRoomName.InternalActivate
        OnDeActivate=mEditRoomName.InternalDeactivate
        OnMousePressed=mEditRoomName.OnMousePressed
        OnMouseRelease=mEditRoomName.OnMouseRelease
        OnChange=mEditRoomName.Internal_OnChange
        OnKeyType=mEditRoomName.InternalOnKeyType
        OnKeyEvent=mEditRoomName.InternalOnKeyEvent
    end object
    EditRoomName=mEditRoomName
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelPassword'
    begin object name="mLabelPassword" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=147.0000000,X2=383.0000000,Y2=160.0000000)
        OnRendered=mLabelPassword.Internal_OnRendered
    end object
    LabelPassword=mLabelPassword
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mBorderPassword'
    begin object name="mBorderPassword" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=383.0000000,Y1=139.0000000,X2=641.0000000,Y2=168.0000000)
        OnRendered=mBorderPassword.Internal_OnRendered
    end object
    BorderPassword=mBorderPassword
    // Reference: BTEditBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mEditPassword'
    begin object name="mEditPassword" class=GUIWarfareControls_Decompressed.BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=390.0000000,Y1=147.0000000,X2=638.0000000,Y2=160.0000000)
        OnDraw=mEditPassword.OwnerDraw
        OnActivate=mEditPassword.InternalActivate
        OnDeActivate=mEditPassword.InternalDeactivate
        OnMousePressed=mEditPassword.OnMousePressed
        OnMouseRelease=mEditPassword.OnMouseRelease
        OnChange=mEditPassword.Internal_OnChange
        OnKeyType=mEditPassword.InternalOnKeyType
        OnKeyEvent=mEditPassword.InternalOnKeyEvent
    end object
    EditPassword=mEditPassword
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelMap'
    begin object name="mLabelMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=435.0000000,X2=383.0000000,Y2=448.0000000)
        OnRendered=mLabelMap.Internal_OnRendered
    end object
    LabelMap=mLabelMap
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboMap'
    begin object name="mComboMap" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=426.0000000,X2=640.0000000,Y2=456.0000000)
        RenderWeight=0.3800000
        OnDraw=mComboMap.InternalDraw
        OnChange=BTWindowCreateRoom.ComboMap_OnChange
    end object
    ComboMap=mComboMap
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelGameMode'
    begin object name="mLabelGameMode" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=190.0000000,X2=383.0000000,Y2=203.0000000)
        OnRendered=mLabelGameMode.Internal_OnRendered
    end object
    LabelGameMode=mLabelGameMode
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboGameMode'
    begin object name="mComboGameMode" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=459.0000000,Y1=265.0000000,X2=641.0000000,Y2=300.0000000)
        RenderWeight=0.3000000
        OnDraw=mComboGameMode.InternalDraw
    end object
    ComboGameMode=mComboGameMode
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelCapacity'
    begin object name="mLabelCapacity" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=528.0000000,X2=383.0000000,Y2=541.0000000)
        OnRendered=mLabelCapacity.Internal_OnRendered
    end object
    LabelCapacity=mLabelCapacity
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboCapacity'
    begin object name="mComboCapacity" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=519.0000000,X2=504.0000000,Y2=549.0000000)
        RenderWeight=0.3700000
        OnDraw=mComboCapacity.InternalDraw
    end object
    ComboCapacity=mComboCapacity
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelWeaponRestriction'
    begin object name="mLabelWeaponRestriction" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=561.0000000,X2=383.0000000,Y2=574.0000000)
        OnRendered=mLabelWeaponRestriction.Internal_OnRendered
    end object
    LabelWeaponRestriction=mLabelWeaponRestriction
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboWeaponRestriction'
    begin object name="mComboWeaponRestriction" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=552.0000000,X2=504.0000000,Y2=582.0000000)
        RenderWeight=0.3600000
        OnDraw=mComboWeaponRestriction.InternalDraw
    end object
    ComboWeaponRestriction=mComboWeaponRestriction
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelScore'
    begin object name="mLabelScore" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=513.0000000,Y1=561.0000000,X2=631.0000000,Y2=574.0000000)
        OnRendered=mLabelScore.Internal_OnRendered
    end object
    LabelScore=mLabelScore
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboScore'
    begin object name="mComboScore" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=632.0000000,Y1=552.0000000,X2=752.0000000,Y2=582.0000000)
        RenderWeight=0.2100000
        OnDraw=mComboScore.InternalDraw
    end object
    ComboScore=mComboScore
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelDefenceModeLevel'
    begin object name="mLabelDefenceModeLevel" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=561.0000000,X2=383.0000000,Y2=574.0000000)
        OnRendered=mLabelDefenceModeLevel.Internal_OnRendered
    end object
    LabelDefenceModeLevel=mLabelDefenceModeLevel
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboDefenceModeLevel'
    begin object name="mComboDefenceModeLevel" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=552.0000000,X2=504.0000000,Y2=582.0000000)
        RenderWeight=0.2200000
        OnDraw=mComboDefenceModeLevel.InternalDraw
    end object
    ComboDefenceModeLevel=mComboDefenceModeLevel
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelTime'
    begin object name="mLabelTime" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=513.0000000,Y1=528.0000000,X2=631.0000000,Y2=541.0000000)
        OnRendered=mLabelTime.Internal_OnRendered
    end object
    LabelTime=mLabelTime
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboTime'
    begin object name="mComboTime" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=632.0000000,Y1=519.0000000,X2=752.0000000,Y2=549.0000000)
        RenderWeight=0.3600000
        OnDraw=mComboTime.InternalDraw
    end object
    comboTime=mComboTime
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelBlance'
    begin object name="mLabelBlance" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=596.0000000,X2=383.0000000,Y2=609.0000000)
        RenderWeight=0.1900000
        OnRendered=mLabelBlance.Internal_OnRendered
    end object
    LabelBlance=mLabelBlance
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap'
    begin object name="mImageMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=384.0000000,Y1=273.0000000,X2=640.0000000,Y2=424.0000000)
        RenderWeight=0.2000000
        OnRendered=mImageMap.Internal_OnRendered
    end object
    ImageMap=mImageMap
    // Referenc[0]e: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap0'
    begin object name="mImageMap0" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=611.0000000,Y1=277.0000000,X2=635.0000000,Y2=301.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap0.Internal_OnRendered
    end object
    ImageSupply=mImageMap0
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap1'
    begin object name="mImageMap1" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=582.0000000,Y1=277.0000000,X2=606.0000000,Y2=301.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap1.Internal_OnRendered
    end object
    ImageSupply=mImageMap1
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap2'
    begin object name="mImageMap2" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=553.0000000,Y1=277.0000000,X2=577.0000000,Y2=301.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap2.Internal_OnRendered
    end object
    ImageSupply=mImageMap2
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mNewMapIcon'
    begin object name="mNewMapIcon" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=387.0000000,Y1=277.0000000,X2=437.0000000,Y2=302.0000000)
        RenderWeight=0.2100000
        OnRendered=mNewMapIcon.Internal_OnRendered
    end object
    NewMapIcon=mNewMapIcon
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelReSpawn'
    begin object name="mLabelReSpawn" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=265.0000000,Y1=469.0000000,X2=383.0000000,Y2=482.0000000)
        RenderWeight=0.1900000
        OnRendered=mLabelReSpawn.Internal_OnRendered
    end object
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
    fbRadio=(X1=385.0000000,Y1=594.0000000,X2=504.0000000,Y2=610.0000000)
    fbReSpawnRadio=(X1=385.0000000,Y1=467.0000000,X2=504.0000000,Y2=483.0000000)
    fbBackgroundImage=(X1=256.0000000,Y1=68.0000000,X2=768.0000000,Y2=684.0000000)
    fbTopLine=(X1=362.0000000,Y1=74.0000000,X2=662.0000000,Y2=89.0000000)
    fbBottomLine=(X1=201.0000000,Y1=485.0000000,X2=822.0000000,Y2=527.0000000)
    fbButtonOK=(X1=387.0000000,Y1=631.0000000,X2=511.0000000,Y2=668.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=631.0000000,X2=637.0000000,Y2=668.0000000)
    strTitle="Create Game"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}