/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowQuickEnterRoomHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:9
 *	Properties:31
 *	Functions:19
 *
 *******************************************************************************/
class BTWindowQuickEnterRoomHK extends BTWindowHK
    config(User)
    editinlinenew
    instanced;

const ButtonWidth = 128;
const ButtonHeight = 32;
const LabelWidth = 80;
const LabelHeight = 32;
const GroupOffsetY = 38;
const LineOffsetX = 10;
const LineOffsetY = 13;
const WindowBtnHeight = 33;
const ColumnCount = 4;

var config int GameMode;
var config int Map;
var config int MapID;
var config int WeaponRestriction;
var config int SubModeIdx;
var localized string strLabel[3];
var localized string strAllMaps;
var localized string strAllModes;
var localized string strAllSubMode;
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline ButtonGroups GroupGameMode;
var array<export editinline BTCheckBoxHK> ButtonGameMode;
var export editinline ButtonGroups GroupMap;
var array<export editinline BTCheckBoxHK> ButtonMap;
var export editinline ButtonGroups GroupSubMode;
var array<export editinline BTCheckBoxHK> ButtonSubMode;
var bool bCancelled;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelGameMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboGameMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelSubMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboSubMode;
var array<export editinline BTOwnerDrawCaptionButtonHK> GameModeBtnList;
var transient wMatchMaker MatchMaker;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK ImageSupply[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK NewMapIcon;
var byte nSelGameMode;
var BTRODecorateStringHK btToolTip;
var array<GameModeInfo> GameModeInfos;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nBtnCount, nOffsetY;
    local FloatBox fboxLabel, fboxBtn, fboxLine, fboxTemp;
    local array<GameModeInfo> GameModes;
    local array<wMapInfo> Maps;
    local array<string> SubModes;
    local GameModeInfo allGameMode;
    local wMapInfo AllMap;
    local FloatBox fbButtonGameMode;

    fbButtonGameMode.X1 = 311.0;
    fbButtonGameMode.Y1 = 257.0;
    fbButtonGameMode.X2 = 411.0;
    fbButtonGameMode.Y2 = 273.0;
    super.InitComponent(MyController, myOwner);
    fboxTemp = class'BTCustomDrawHK'.static.MakeEmptyBox();
    GroupGameMode = ButtonGroups(NewComponent(new class'ButtonGroups', fboxTemp));
    GroupMap = ButtonGroups(NewComponent(new class'ButtonGroups', fboxTemp));
    GroupSubMode = ButtonGroups(NewComponent(new class'ButtonGroups', fboxTemp));
    GameModes = class'wGameSettings'.static.GetAllGameModes();
    SubModes = class'wGameSettings'.static.GetWeaponRestrictions();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    allGameMode.UserFriendlyName = strAllModes;
    GameModes.Insert(0, 1);
    GameModes[0] = allGameMode;
    AllMap = new class'wMapInfo';
    AllMap.FriendlyName = strAllMaps;
    Maps.Insert(0, 1);
    Maps[0] = AllMap;
    SubModes.Insert(0, 1);
    SubModes[0] = strAllSubMode;
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    nBtnCount = 0;
    ButtonGameMode[0].FontColor[0] = class'BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.X1 = fbTopLine.X1 + float(10);
    fboxLine.X2 = fbTopLine.X2 - float(10);
    fboxLine.Y1 = fboxBtn.Y2 + float(13);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    ButtonMap[0].FontColor[0] = class'BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    nBtnCount = 0;
    ButtonSubMode[i].FontColor[0] = class'BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fbBottomLine.Y2 = fbBackgroundImage.Y2 - float(20);
    fbBottomLine.Y1 = fbBottomLine.Y2 - float(43);
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ImageMap.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    nSelGameMode = byte(GameMode);
    FillMapList(Map);
    FillSubModeList();
    InitGameModeList();
    FillSubMode();
    ApplyLocalizedStrings();
    // End:0x549
    if(Map == 255)
    {
        ComboMap.ComboBox.SetIndex(0);
    }
    // End:0x566
    else
    {
        ComboMap.ComboBox.SetIndex(Map);
    }
    ComboSubMode.ComboBox.SetIndex(SubModeIdx);
    TopLine.CaptionDrawType = 4;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.QuickEnterRoom_Win_BG;
    BackgroundImage.AWinPos = fbBackgroundImage;
    nOffsetY = int(float(int(float(Controller.ResY) - BackgroundImage.AWinPos.Y2 - BackgroundImage.AWinPos.Y1) / 2) - BackgroundImage.AWinPos.Y1);
    SetContentOffset(0, nOffsetY);
    ButtonCancel.__OnClick__Delegate = OnCancel;
    bCancelled = false;
    ComboGameMode.bVisible = false;
    // End:0x67e
    if(MatchMaker.kClanMatch_InChannel)
    {
        ComboSubMode.DisableMe();
    }
    GameModeInfos = class'wGameSettings'.static.GetAllGameModes();
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    // End:0xac
    if(!bCancelled)
    {
        GameMode = nSelGameMode;
        // End:0x40
        if(ComboMap.ComboBox.Index == 0)
        {
            Map = 255;
        }
        // End:0x5d
        else
        {
            Map = ComboMap.ComboBox.Index;
        }
        MapID = GetSelectedMapID();
        SubModeIdx = ComboSubMode.ComboBox.Index;
        WeaponRestriction = GetSubModeIDFromComboIndex(ComboSubMode.ComboBox.Index);
        SaveConfig();
    }
    return "";
}

function bool OnCancel(GUIComponent Sender)
{
    bCancelled = true;
    FadeOut(false, true);
    return true;
}

function ComboMap_OnChange(GUIComponent Sender)
{
    FillSubMode();
}

function FillMapList(int nIndex)
{
    local int i, GameModeIndex;
    local array<int> GameModeDispOrder;
    local array<wMapInfo> Maps;
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
    GameModeIndex = GameModeDispOrder[nSelGameMode];
    ComboMap.ComboBox.AddItem(strAllMaps, none, "255");
    i = 0;
    J0x1cb:
    // End:0x3f4 [While If]
    if(i < Maps.Length)
    {
        // End:0x2b8
        if(nSelGameMode == 255)
        {
            // End:0x23d
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = Maps[i].NewMapIcon $ " " $ Maps[i].FriendlyName;
            }
            // End:0x257
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x2b5
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
        }
        // End:0x3ea
        else
        {
            // End:0x3ea
            if(Maps[i].MapID >= 0 && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, nSelGameMode) != 0)
            {
                // End:0x372
                if(Maps[i].NewMapIcon != "-")
                {
                    MapName = Maps[i].NewMapIcon $ " " $ Maps[i].FriendlyName;
                }
                // End:0x38c
                else
                {
                    MapName = Maps[i].FriendlyName;
                }
                // End:0x3ea
                if(Maps[i].File != "TUT-BasicTraining")
                {
                    ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1cb;
    }
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    i = 1;
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
    // End:0x16a
    if(MapName == "255")
    {
        ImageMap.BackgroundImage = class'BTUIResourcePoolHK'.default.All_Map_Img;
    }
    // End:0x19c
    else
    {
        ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    }
    i = 0;
    J0x1a3:
    // End:0x26e [While If]
    if(i < 3)
    {
        // End:0x1fa
        if(mInfo.ResourceSupplyImages[i] == "-" || MapName == "255")
        {
            ImageSupply[i].BackgroundImage.Image = none;
        }
        // End:0x264
        else
        {
            // End:0x264
            if(mInfo.ResourceSupplyImages[i] != "-")
            {
                ImageSupply[i].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material')));
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a3;
    }
    // End:0x2b1
    if(mInfo != none && mInfo.NewMapIcon != "-")
    {
        NewMapIcon.BackgroundImage = class'BTUIResourcePoolHK'.default.newMap_Icon;
    }
    // End:0x2c6
    else
    {
        NewMapIcon.BackgroundImage.Image = none;
    }
}

function FillSubModeList()
{
    local int i;
    local array<string> SubModes;

    ComboSubMode.ComboBox.List.Clear();
    SubModes = class'wGameSettings'.static.GetWeaponRestrictions();
    i = 0;
    J0x3d:
    // End:0x95 [While If]
    if(i < SubModes.Length)
    {
        // End:0x8b
        if(class'wGameSettings'.static.IsAllowedWeaponRest(i - 1))
        {
            ComboSubMode.ComboBox.AddItem(SubModes[i], none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
}

function ApplyLocalizedStrings()
{
    LabelMap.Caption = strLabel[1];
    LabelGameMode.Caption = strLabel[0];
    LabelSubMode.Caption = strLabel[2];
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

function int GetSubModeIDFromComboIndex(int idx)
{
    local int i;
    local string FriendlyName;
    local array<string> temp;

    FriendlyName = ComboSubMode.ComboBox.GetItem(idx);
    temp = class'wGameSettings'.static.GetWeaponRestrictions();
    i = 0;
    J0x3f:
    // End:0x77 [While If]
    if(i < temp.Length)
    {
        // End:0x6d
        if(InStr(FriendlyName, temp[i]) >= 0)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return 0;
}

function InitGameModeList(optional bool bSet, optional int Index)
{
    local int i, GameModeIndex, MapID;
    local export editinline BTOwnerDrawCaptionButtonHK TempBtn;
    local array<int> GameModeDispOrder;
    local GameModeInfo gmi;

    MapID = GetSelectedMapID();
    GameModeDispOrder = class'wGameSettings'.static.GetGameModeDispOrder();
    TempBtn = new class'BTOwnerDrawCaptionButtonHK';
    TempBtn.bUseAWinPos = true;
    TempBtn.AWinPos.X1 = 383.0 + float(78) * float(GameModeBtnList.Length) % float(4);
    TempBtn.AWinPos.Y1 = 197.0 + float(28 * GameModeBtnList.Length / 4);
    TempBtn.AWinPos.X2 = 459.0 + float(78) * float(GameModeBtnList.Length) % float(4);
    TempBtn.AWinPos.Y2 = 225.0 + float(28 * GameModeBtnList.Length / 4);
    TempBtn.SetDefaultButtonImage();
    TempBtn.SetDefaultFontColor();
    TempBtn.SetFontSizeAll(10);
    TempBtn.CaptionDrawType = 4;
    TempBtn.Caption = strAllModes;
    TempBtn.__OnClick__Delegate = SelGameMode;
    TempBtn.OnClickSound = 0;
    TempBtn.ButtonID = 255;
    TempBtn.InitComponent(Controller, self);
    AppendComponent(TempBtn);
    GameModeBtnList[GameModeBtnList.Length] = TempBtn;
    i = 0;
    J0x1b8:
    // End:0x3f9 [While If]
    if(i < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[i];
        gmi = class'wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        // End:0x20d
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
        }
        // End:0x3ef
        else
        {
            // End:0x22e
            if(MapID == 29)
            {
                // End:0x22e
                if(GameModeDispOrder[i] != 8)
                {
                }
                // End:0x3ef
                else
                {
                }
                // End:0x243
                if(GameModeDispOrder[i] == 8)
                {
                }
                // End:0x3ef
                else
                {
                    TempBtn = new class'BTOwnerDrawCaptionButtonHK';
                    TempBtn.bUseAWinPos = true;
                    TempBtn.AWinPos.X1 = 383.0 + float(78) * float(GameModeBtnList.Length) % float(4);
                    TempBtn.AWinPos.Y1 = 197.0 + float(28 * GameModeBtnList.Length / 4);
                    TempBtn.AWinPos.X2 = 459.0 + float(78) * float(GameModeBtnList.Length) % float(4);
                    TempBtn.AWinPos.Y2 = 225.0 + float(28 * GameModeBtnList.Length / 4);
                    TempBtn.SetDefaultButtonImage();
                    TempBtn.SetDefaultFontColor();
                    TempBtn.SetFontSizeAll(10);
                    TempBtn.CaptionDrawType = 4;
                    TempBtn.Caption = gmi.UserFriendlyName;
                    TempBtn.__OnClick__Delegate = SelGameMode;
                    TempBtn.OnClickSound = 0;
                    TempBtn.ButtonID = GameModeIndex;
                    TempBtn.Extra = GameModeIndex;
                    TempBtn.InitComponent(Controller, self);
                    AppendComponent(TempBtn);
                    GameModeBtnList[GameModeBtnList.Length] = TempBtn;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b8;
    }
    i = 0;
    J0x400:
    // End:0x482 [While If]
    if(i < GameModeBtnList.Length)
    {
        GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        // End:0x478
        if(GameMode == GameModeBtnList[i].ButtonID)
        {
            GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x400;
    }
    // End:0x51b
    if(MatchMaker.kClanMatch_InChannel)
    {
        i = 0;
        J0x49b:
        // End:0x50a [While If]
        if(i < GameModeBtnList.Length)
        {
            // End:0x4eb
            if(GameModeBtnList[i].ButtonID == class'wGameSettings'.static.GetModeIndex_SD())
            {
                GameModeBtnList[i].EnableMe();
            }
            // End:0x500
            else
            {
                GameModeBtnList[i].DisableMe();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x49b;
        }
        SelGameMode(GameModeBtnList[i]);
    }
}

function string GetMapName()
{
    return ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.Index);
}

function bool SelGameMode(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    ComboMap.ComboBox.List.Clear();
    i = 0;
    J0x28:
    // End:0xe6 [While If]
    if(i < GameModeBtnList.Length)
    {
        GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        // End:0xdc
        if(GameModeBtnList[i] == Sender)
        {
            GameModeBtnList[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
            btn = BTOwnerDrawCaptionButtonHK(Sender);
            nSelGameMode = byte(btn.ButtonID);
            ComboGameMode.ComboBox.SetIndex(nSelGameMode);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    FillMapList(nSelGameMode);
    FillSubMode();
    return true;
}

function FillSubMode()
{
    local int lp1, BotModeIdx;
    local array<string> temp;
    local int MapID;

    // End:0x1a
    if(class'wGameSettings'.static.IsBotModeIndex(BotModeIdx))
    {
    }
    // End:0xed
    else
    {
        ComboSubMode.ComboBox.List.Clear();
        temp = class'wGameSettings'.static.GetWeaponRestrictions();
        MapID = GetSelectedMapID();
        lp1 = 0;
        J0x63:
        // End:0xed [While If]
        if(lp1 < temp.Length)
        {
            // End:0xe3
            if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
            {
                ComboSubMode.ComboBox.AddItem(temp[lp1], class'BTCustomDrawHK'.static.MakeIntClass(lp1));
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x63;
        }
    }
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
    FillSubMode();
}

function int GetGameModeIndex()
{
    return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
}

defaultproperties
{
    GameMode=255
    Map=255
    strLabel[0]="Mode"
    strLabel[1]="Map"
    strLabel[2]="Sub-Mode"
    strAllMaps="All Maps"
    strAllModes="All Modes"
    strAllSubMode="All Sub-Modes"
    begin object name=mLabelMap class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0,Y1=448.0,X2=383.0,Y2=461.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mLabelMap'
    LabelMap=mLabelMap
    begin object name=mComboMap class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=439.0,X2=640.0,Y2=469.0)
        RenderWeight=0.370
        OnDraw=InternalDraw
        OnChange=ComboMap_OnChange
    object end
    // Reference: BTComboBoxHK'BTWindowQuickEnterRoomHK.mComboMap'
    ComboMap=mComboMap
    begin object name=mLabelGameMode class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0,Y1=203.0,X2=383.0,Y2=216.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mLabelGameMode'
    LabelGameMode=mLabelGameMode
    begin object name=mComboGameMode class=BTComboBoxHK
        bUseAWinPos=true
        RenderWeight=0.360
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowQuickEnterRoomHK.mComboGameMode'
    ComboGameMode=mComboGameMode
    begin object name=mLabelSubMode class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0,Y1=504.0,X2=383.0,Y2=517.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mLabelSubMode'
    LabelSubMode=mLabelSubMode
    begin object name=mComboSubMode class=BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0,Y1=495.0,X2=504.0,Y2=525.0)
        RenderWeight=0.360
        OnDraw=InternalDraw
    object end
    // Reference: BTComboBoxHK'BTWindowQuickEnterRoomHK.mComboSubMode'
    ComboSubMode=mComboSubMode
    begin object name=mImageMap class=BTOwnerDrawImageHK
        AWinPos=(X1=384.0,Y1=286.0,X2=640.0,Y2=437.0)
        RenderWeight=0.20
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mImageMap'
    ImageMap=mImageMap
    begin objec[0]t name=mImageMap0 class=BTOwnerDrawImageHK
        AWinPos=(X1=611.0,Y1=290.0,X2=635.0,Y2=314.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mImageMap0'
    ImageSupply=mImageMap0
    begin object name=mImageMap1 class=BTOwnerDrawImageHK
        AWinPos=(X1=582.0,Y1=290.0,X2=606.0,Y2=314.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mImageMap1'
    ImageSupply=mImageMap1
    begin object name=mImageMap2 class=BTOwnerDrawImageHK
        AWinPos=(X1=553.0,Y1=290.0,X2=577.0,Y2=314.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mImageMap2'
    ImageSupply=mImageMap2
    begin object name=mNewMapIcon class=BTOwnerDrawImageHK
        AWinPos=(X1=387.0,Y1=290.0,X2=437.0,Y2=315.0)
        RenderWeight=0.210
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowQuickEnterRoomHK.mNewMapIcon'
    NewMapIcon=mNewMapIcon
    fbBackgroundImage=(X1=297.0,Y1=159.0,X2=727.0,Y2=598.0)
    fbTopLine=(X1=403.0,Y1=165.0,X2=621.0,Y2=180.0)
    fbBottomLine=(X1=201.0,Y1=512.0,X2=823.0,Y2=555.0)
    fbButtonOK=(X1=387.0,Y1=545.0,X2=511.0,Y2=582.0)
    fbButtonCancel=(X1=513.0,Y1=545.0,X2=637.0,Y2=582.0)
    strTitle="Quick Join"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnRendered=FloatingRendered
    OnSaveINI=InternalOnSaveINI
}