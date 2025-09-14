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
var() automated BTOwnerDrawImageHK LabelMap;
var() automated BTComboBoxHK ComboMap;
var() automated BTOwnerDrawImageHK LabelGameMode;
var() automated BTComboBoxHK ComboGameMode;
var() automated BTOwnerDrawImageHK LabelSubMode;
var() automated BTComboBoxHK ComboSubMode;
var array<export editinline BTOwnerDrawCaptionButtonHK> GameModeBtnList;
var transient wMatchMaker MatchMaker;
var() automated BTOwnerDrawImageHK ImageMap;
var() automated BTOwnerDrawImageHK ImageSupply[3];
var() automated BTOwnerDrawImageHK NewMapIcon;
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

    fbButtonGameMode.X1 = 311.0000000;
    fbButtonGameMode.Y1 = 257.0000000;
    fbButtonGameMode.X2 = 411.0000000;
    fbButtonGameMode.Y2 = 273.0000000;
    super.InitComponent(MyController, myOwner);
    fboxTemp = Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox();
    GroupGameMode = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fboxTemp));
    GroupMap = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fboxTemp));
    GroupSubMode = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fboxTemp));
    GameModes = Class'Engine.wGameSettings'.static.GetAllGameModes();
    SubModes = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    allGameMode.UserFriendlyName = strAllModes;
    GameModes.Insert(0, 1);
    GameModes[0] = allGameMode;
    AllMap = new Class'Engine.wMapInfo';
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
    ButtonGameMode[0].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.X1 = fbTopLine.X1 + float(10);
    fboxLine.X2 = fbTopLine.X2 - float(10);
    fboxLine.Y1 = fboxBtn.Y2 + float(13);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    ButtonMap[0].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    nBtnCount = 0;
    ButtonSubMode[i].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    fbBottomLine.Y2 = fbBackgroundImage.Y2 - float(20);
    fbBottomLine.Y1 = fbBottomLine.Y2 - float(43);
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ImageMap.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
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
    else
    {
        ComboMap.ComboBox.SetIndex(Map);
    }
    ComboSubMode.ComboBox.SetIndex(SubModeIdx);
    TopLine.CaptionDrawType = 4;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.QuickEnterRoom_Win_BG;
    BackgroundImage.AWinPos = fbBackgroundImage;
    nOffsetY = int(float(int(float(Controller.ResY) - (BackgroundImage.AWinPos.Y2 - BackgroundImage.AWinPos.Y1)) / 2) - BackgroundImage.AWinPos.Y1);
    SetContentOffset(0, nOffsetY);
    ButtonCancel.__OnClick__Delegate = OnCancel;
    bCancelled = false;
    ComboGameMode.bVisible = false;
    // End:0x67E
    if(MatchMaker.kClanMatch_InChannel)
    {
        ComboSubMode.DisableMe();
    }
    GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
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

function string InternalOnSaveINI(GUIComponent Sender)
{
    // End:0xAC
    if(!bCancelled)
    {
        GameMode = int(nSelGameMode);
        // End:0x40
        if(ComboMap.ComboBox.Index == 0)
        {
            Map = 255;            
        }
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
    //return;    
}

function bool OnCancel(GUIComponent Sender)
{
    bCancelled = true;
    FadeOut(false, true);
    return true;
    //return;    
}

function ComboMap_OnChange(GUIComponent Sender)
{
    FillSubMode();
    //return;    
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
    GameModeIndex = GameModeDispOrder[int(nSelGameMode)];
    ComboMap.ComboBox.AddItem(strAllMaps, none, "255");
    i = 0;
    J0x1CB:

    // End:0x3F4 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x2B8
        if(int(nSelGameMode) == 255)
        {
            // End:0x23D
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = (Maps[i].NewMapIcon $ " ") $ Maps[i].FriendlyName;                
            }
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x2B5
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
            // [Explicit Continue]
            goto J0x3EA;
        }
        // End:0x3EA
        if((Maps[i].MapID >= 0) && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, int(nSelGameMode)) != 0)
        {
            // End:0x372
            if(Maps[i].NewMapIcon != "-")
            {
                MapName = (Maps[i].NewMapIcon $ " ") $ Maps[i].FriendlyName;                
            }
            else
            {
                MapName = Maps[i].FriendlyName;
            }
            // End:0x3EA
            if(Maps[i].File != "TUT-BasicTraining")
            {
                ComboMap.ComboBox.AddItem(MapName, none, Maps[i].File);
            }
        }
        J0x3EA:

        i++;
        // [Loop Continue]
        goto J0x1CB;
    }
    //return;    
}

function FloatingRendered(Canvas C)
{
    local int i;
    local wMapInfo mInfo;
    local string MapName;

    i = 1;
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
    // End:0x16A
    if(MapName == "255")
    {
        ImageMap.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.All_Map_Img;        
    }
    else
    {
        ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    }
    i = 0;
    J0x1A3:

    // End:0x26E [Loop If]
    if(i < 3)
    {
        // End:0x1FA
        if((mInfo.ResourceSupplyImages[i] == "-") || MapName == "255")
        {
            ImageSupply[i].BackgroundImage.Image = none;
            // [Explicit Continue]
            goto J0x264;
        }
        // End:0x264
        if(mInfo.ResourceSupplyImages[i] != "-")
        {
            ImageSupply[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        }
        J0x264:

        i++;
        // [Loop Continue]
        goto J0x1A3;
    }
    // End:0x2B1
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

function FillSubModeList()
{
    local int i;
    local array<string> SubModes;

    ComboSubMode.ComboBox.List.Clear();
    SubModes = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
    i = 0;
    J0x3D:

    // End:0x95 [Loop If]
    if(i < SubModes.Length)
    {
        // End:0x8B
        if(Class'Engine.wGameSettings'.static.IsAllowedWeaponRest(i - 1))
        {
            ComboSubMode.ComboBox.AddItem(SubModes[i], none);
        }
        ++i;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelMap.Caption = strLabel[1];
    LabelGameMode.Caption = strLabel[0];
    LabelSubMode.Caption = strLabel[2];
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

function int GetSubModeIDFromComboIndex(int idx)
{
    local int i;
    local string FriendlyName;
    local array<string> temp;

    FriendlyName = ComboSubMode.ComboBox.GetItem(idx);
    temp = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
    i = 0;
    J0x3F:

    // End:0x77 [Loop If]
    if(i < temp.Length)
    {
        // End:0x6D
        if(InStr(FriendlyName, temp[i]) >= 0)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    return 0;
    //return;    
}

function InitGameModeList(optional bool bSet, optional int Index)
{
    local int i, GameModeIndex, MapID;
    local export editinline BTOwnerDrawCaptionButtonHK TempBtn;
    local array<int> GameModeDispOrder;
    local GameModeInfo gmi;

    MapID = GetSelectedMapID();
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    TempBtn = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    TempBtn.bUseAWinPos = true;
    TempBtn.AWinPos.X1 = 383.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
    TempBtn.AWinPos.Y1 = 197.0000000 + float(28 * (GameModeBtnList.Length / 4));
    TempBtn.AWinPos.X2 = 459.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
    TempBtn.AWinPos.Y2 = 225.0000000 + float(28 * (GameModeBtnList.Length / 4));
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
    J0x1B8:

    // End:0x3F9 [Loop If]
    if(i < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[i];
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        // End:0x20D
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
            // [Explicit Continue]
            goto J0x3EF;
        }
        // End:0x22E
        if(MapID == 29)
        {
            // End:0x22E
            if(GameModeDispOrder[i] != 8)
            {
                // [Explicit Continue]
                goto J0x3EF;
            }
        }
        // End:0x243
        if(GameModeDispOrder[i] == 8)
        {
            // [Explicit Continue]
            goto J0x3EF;
        }
        TempBtn = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        TempBtn.bUseAWinPos = true;
        TempBtn.AWinPos.X1 = 383.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y1 = 197.0000000 + float(28 * (GameModeBtnList.Length / 4));
        TempBtn.AWinPos.X2 = 459.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y2 = 225.0000000 + float(28 * (GameModeBtnList.Length / 4));
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
        J0x3EF:

        ++i;
        // [Loop Continue]
        goto J0x1B8;
    }
    i = 0;
    J0x400:

    // End:0x482 [Loop If]
    if(i < GameModeBtnList.Length)
    {
        GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        // End:0x478
        if(GameMode == GameModeBtnList[i].ButtonID)
        {
            GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
        }
        i++;
        // [Loop Continue]
        goto J0x400;
    }
    // End:0x51B
    if(MatchMaker.kClanMatch_InChannel)
    {
        i = 0;
        J0x49B:

        // End:0x50A [Loop If]
        if(i < GameModeBtnList.Length)
        {
            // End:0x4EB
            if(GameModeBtnList[i].ButtonID == Class'Engine.wGameSettings'.static.GetModeIndex_SD())
            {
                GameModeBtnList[i].EnableMe();
                // [Explicit Continue]
                goto J0x500;
            }
            GameModeBtnList[i].DisableMe();
            J0x500:

            i++;
            // [Loop Continue]
            goto J0x49B;
        }
        SelGameMode(GameModeBtnList[i]);
    }
    //return;    
}

function string GetMapName()
{
    return ComboMap.ComboBox.List.GetExtraAtIndex(ComboMap.ComboBox.Index);
    //return;    
}

function bool SelGameMode(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    ComboMap.ComboBox.List.Clear();
    i = 0;
    J0x28:

    // End:0xE6 [Loop If]
    if(i < GameModeBtnList.Length)
    {
        GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
        // End:0xDC
        if(GameModeBtnList[i] == Sender)
        {
            GameModeBtnList[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
            btn = BTOwnerDrawCaptionButtonHK(Sender);
            nSelGameMode = byte(btn.ButtonID);
            ComboGameMode.ComboBox.SetIndex(int(nSelGameMode));
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    FillMapList(int(nSelGameMode));
    FillSubMode();
    return true;
    //return;    
}

function FillSubMode()
{
    local int lp1, BotModeIdx;
    local array<string> temp;
    local int MapID;

    // End:0x1A
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(BotModeIdx))
    {        
    }
    else
    {
        ComboSubMode.ComboBox.List.Clear();
        temp = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
        MapID = GetSelectedMapID();
        lp1 = 0;
        J0x63:

        // End:0xED [Loop If]
        if(lp1 < temp.Length)
        {
            // End:0xE3
            if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
            {
                ComboSubMode.ComboBox.AddItem(temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
            }
            lp1++;
            // [Loop Continue]
            goto J0x63;
        }
    }
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
    FillSubMode();
    //return;    
}

function int GetGameModeIndex()
{
    return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    //return;    
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
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mLabelMap'
    begin object name="mLabelMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0000000,Y1=448.0000000,X2=383.0000000,Y2=461.0000000)
        OnRendered=mLabelMap.Internal_OnRendered
    end object
    LabelMap=mLabelMap
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mComboMap'
    begin object name="mComboMap" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=439.0000000,X2=640.0000000,Y2=469.0000000)
        RenderWeight=0.3700000
        OnDraw=mComboMap.InternalDraw
        OnChange=BTWindowQuickEnterRoomHK.ComboMap_OnChange
    end object
    ComboMap=mComboMap
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mLabelGameMode'
    begin object name="mLabelGameMode" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0000000,Y1=203.0000000,X2=383.0000000,Y2=216.0000000)
        OnRendered=mLabelGameMode.Internal_OnRendered
    end object
    LabelGameMode=mLabelGameMode
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mComboGameMode'
    begin object name="mComboGameMode" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        RenderWeight=0.3600000
        OnDraw=mComboGameMode.InternalDraw
    end object
    ComboGameMode=mComboGameMode
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mLabelSubMode'
    begin object name="mLabelSubMode" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=316.0000000,Y1=504.0000000,X2=383.0000000,Y2=517.0000000)
        OnRendered=mLabelSubMode.Internal_OnRendered
    end object
    LabelSubMode=mLabelSubMode
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mComboSubMode'
    begin object name="mComboSubMode" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=384.0000000,Y1=495.0000000,X2=504.0000000,Y2=525.0000000)
        RenderWeight=0.3600000
        OnDraw=mComboSubMode.InternalDraw
    end object
    ComboSubMode=mComboSubMode
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mImageMap'
    begin object name="mImageMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=384.0000000,Y1=286.0000000,X2=640.0000000,Y2=437.0000000)
        RenderWeight=0.2000000
        OnRendered=mImageMap.Internal_OnRendered
    end object
    ImageMap=mImageMap
    // Referenc[0]e: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mImageMap0'
    begin object name="mImageMap0" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=611.0000000,Y1=290.0000000,X2=635.0000000,Y2=314.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap0.Internal_OnRendered
    end object
    ImageSupply=mImageMap0
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mImageMap1'
    begin object name="mImageMap1" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=582.0000000,Y1=290.0000000,X2=606.0000000,Y2=314.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap1.Internal_OnRendered
    end object
    ImageSupply=mImageMap1
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mImageMap2'
    begin object name="mImageMap2" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=553.0000000,Y1=290.0000000,X2=577.0000000,Y2=314.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap2.Internal_OnRendered
    end object
    ImageSupply=mImageMap2
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowQuickEnterRoomHK.mNewMapIcon'
    begin object name="mNewMapIcon" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=387.0000000,Y1=290.0000000,X2=437.0000000,Y2=315.0000000)
        RenderWeight=0.2100000
        OnRendered=mNewMapIcon.Internal_OnRendered
    end object
    NewMapIcon=mNewMapIcon
    fbBackgroundImage=(X1=297.0000000,Y1=159.0000000,X2=727.0000000,Y2=598.0000000)
    fbTopLine=(X1=403.0000000,Y1=165.0000000,X2=621.0000000,Y2=180.0000000)
    fbBottomLine=(X1=201.0000000,Y1=512.0000000,X2=823.0000000,Y2=555.0000000)
    fbButtonOK=(X1=387.0000000,Y1=545.0000000,X2=511.0000000,Y2=582.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=545.0000000,X2=637.0000000,Y2=582.0000000)
    strTitle="Quick Join"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnRendered=BTWindowQuickEnterRoomHK.FloatingRendered
    OnSaveINI=BTWindowQuickEnterRoomHK.InternalOnSaveINI
}