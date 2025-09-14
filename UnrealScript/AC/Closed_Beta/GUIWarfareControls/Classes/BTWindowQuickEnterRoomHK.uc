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
var config int WeaponRestriction;
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
var byte nSelGameMode;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nRow, nColumn, nBtnCount, nOffsetY;

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
    nSelGameMode = byte(255);
    FillMapList(255);
    FillSubModeList();
    InitGameModeList();
    FillSubMode();
    ApplyLocalizedStrings();
    ComboMap.ComboBox.SetIndex(0);
    ComboSubMode.ComboBox.SetIndex(0);
    GameModeBtnList[0].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    nSelGameMode = 0;
    TopLine.CaptionDrawType = 4;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.QuickEnterRoom_Win_BG;
    BackgroundImage.AWinPos = fbBackgroundImage;
    nOffsetY = int(float(int(float(Controller.ResY) - (BackgroundImage.AWinPos.Y2 - BackgroundImage.AWinPos.Y1)) / 2) - BackgroundImage.AWinPos.Y1);
    SetContentOffset(0, nOffsetY);
    GroupSubMode.SelectButton(WeaponRestriction);
    GroupGameMode.SelectButton(GameMode);
    GroupMap.SelectButton(Map);
    ButtonCancel.__OnClick__Delegate = OnCancel;
    bCancelled = false;
    ComboGameMode.bVisible = false;
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    // End:0x97
    if(!bCancelled)
    {
        GameMode = int(nSelGameMode);
        // End:0x5A
        if(ComboMap.ComboBox.Index == (ComboMap.ComboBox.ItemCount() - 1))
        {
            Map = 255;            
        }
        else
        {
            Map = ComboMap.ComboBox.Index;
        }
        WeaponRestriction = ComboSubMode.ComboBox.Index;
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
    local int i;
    local wMapInfo mInfo;

    mInfo = MatchMaker.MapSettings.GetMapInfo(GetMapName());
    ImageMap.BackgroundImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    i = 0;
    J0x5D:

    // End:0xE2 [Loop If]
    if(i < 3)
    {
        // End:0x8A
        if(mInfo.ResourceSupplyImages[i] == "")
        {
            // [Explicit Break]
            goto J0xE2;
            // [Explicit Continue]
            goto J0xD8;
        }
        ImageSupply[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        J0xD8:

        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    J0xE2:

    i = 3;
    J0xEA:

    // End:0x11B [Loop If]
    if(i < 3)
    {
        ImageSupply[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0xEA;
    }
    FillSubMode();
    //return;    
}

function FillMapList(int nIndex)
{
    local int i, lp1, GameModeIndex;
    local array<int> GameModeDispOrder;
    local array<wMapInfo> Maps;

    ComboMap.ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    GameModeDispOrder = Class'Engine.wGameSettings'.static.GetGameModeDispOrder();
    GameModeIndex = GameModeDispOrder[int(nSelGameMode)];
    i = 0;
    J0xA9:

    // End:0x1BA [Loop If]
    if(i < Maps.Length)
    {
        // End:0x10B
        if(int(nSelGameMode) == 255)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, none, Maps[i].File);
            // [Explicit Continue]
            goto J0x1B0;
        }
        // End:0x1B0
        if((Maps[i].MapID >= 0) && PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(Maps[i].MapID, GameModeIndex) == 0)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, none, Maps[i].File);
        }
        J0x1B0:

        i++;
        // [Loop Continue]
        goto J0xA9;
    }
    ComboMap.ComboBox.AddItem(strAllMaps, none);
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

    // End:0xD0 [Loop If]
    if(i < Maps.Length)
    {
        // End:0xC6
        if(Maps[i].FriendlyName == FriendlyName)
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

function InitGameModeList(optional bool bSet, optional int Index)
{
    local int i, GameModeIndex, MapID;
    local array<GameModeInfo> GameModes;
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
    TempBtn.SetFontSizeAll(9);
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

    // End:0x479 [Loop If]
    if(i < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[i];
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        // End:0x2D7
        if(((((((gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_Medal()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_COL()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_Sabotage()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_Defence()) || gmi.ModeIndex == Class'Engine.wGameSettings'.static.GetModeIndex_Infection())
        {
            // [Explicit Continue]
            goto J0x46F;
            // [Explicit Continue]
            goto J0x46F;
        }
        TempBtn = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        TempBtn.bUseAWinPos = true;
        TempBtn.AWinPos.X1 = 383.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y1 = 197.0000000 + float(28 * (GameModeBtnList.Length / 4));
        TempBtn.AWinPos.X2 = 459.0000000 + (float(78) * (float(GameModeBtnList.Length) % float(4)));
        TempBtn.AWinPos.Y2 = 225.0000000 + float(28 * (GameModeBtnList.Length / 4));
        TempBtn.SetDefaultButtonImage();
        TempBtn.SetDefaultFontColor();
        TempBtn.SetFontSizeAll(9);
        TempBtn.CaptionDrawType = 4;
        TempBtn.Caption = gmi.UserFriendlyName;
        TempBtn.__OnClick__Delegate = SelGameMode;
        TempBtn.OnClickSound = 0;
        TempBtn.ButtonID = GameModeIndex;
        TempBtn.InitComponent(Controller, self);
        AppendComponent(TempBtn);
        GameModeBtnList[GameModeBtnList.Length] = TempBtn;
        J0x46F:

        ++i;
        // [Loop Continue]
        goto J0x1B8;
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
    local int i, lp1, GameModeIndex;
    local array<int> GameModeDispOrder;
    local array<wMapInfo> Maps;
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
    FillSubModeList();
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
    strLabel[0]="Game Mode"
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
    OnSaveINI=BTWindowQuickEnterRoomHK.InternalOnSaveINI
}