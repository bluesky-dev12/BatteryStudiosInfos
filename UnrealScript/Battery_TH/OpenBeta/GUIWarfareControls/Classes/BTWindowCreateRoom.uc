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
var() automated BTOwnerDrawImageHK ImageMap;
var() automated BTOwnerDrawImageHK ImageSupply[3];
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BorderRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    BorderPassword.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    ImageMap.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
    InitializeCombos();
    FillWindow();
    ApplyLocalizedStrings();
    TopLine.CaptionPadding[0] = 8;
    EditRoomName.MaxTextStrNum = 40;
    EditRoomName.bLimitDrawSize = true;
    EditRoomName.LimitDrawWidth = 230.0000000;
    EditPassword.MaxTextStrNum = 20;
    // End:0x15F
    if(MatchMaker.kClanMatch_InChannel)
    {
        ComboGameMode.DisableMe();
        ComboWeaponRestriction.DisableMe();
        ComboScore.DisableMe();
    }
    //return;    
}

function InitializeCombos()
{
    ComboCapacity.ComboBox.Edit.bReadOnly = true;
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboGameMode.ComboBox.Edit.bReadOnly = true;
    ComboGameMode.ComboBox.MaxVisibleItems = 20;
    ComboMap.ComboBox.Edit.bReadOnly = true;
    ComboScore.ComboBox.Edit.bReadOnly = true;
    ComboWeaponRestriction.ComboBox.Edit.bReadOnly = true;
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
    FillWeaponRestrictions();
    //return;    
}

function int GetGameModeIndex()
{
    return IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
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

function FillMapList()
{
    local int i;
    local array<wMapInfo> Maps;

    ComboMap.ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x81:

    // End:0xF6 [Loop If]
    if(i < Maps.Length)
    {
        // End:0xEC
        if(Maps[i].MapID > 0)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, none, Maps[i].File);
        }
        i++;
        // [Loop Continue]
        goto J0x81;
    }
    i = 0;
    J0xFD:

    // End:0x172 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x168
        if(Maps[i].MapID == 0)
        {
            ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, none, Maps[i].File);
        }
        i++;
        // [Loop Continue]
        goto J0xFD;
    }
    i = 0;
    J0x179:

    // End:0x202 [Loop If]
    if(i < ComboMap.ComboBox.ItemCount())
    {
        // End:0x1F8
        if(Caps(ComboMap.ComboBox.List.GetExtraAtIndex(i)) == Caps(Class'Engine.wGameSettings'.default.DefaultMap))
        {
            ComboMap.ComboBox.SetIndex(i);
            // [Explicit Break]
            goto J0x202;
        }
        i++;
        // [Loop Continue]
        goto J0x179;
    }
    J0x202:

    //return;    
}

function FillGameModeList(optional bool bSet, optional int Index)
{
    local int lp1, GameModeIndex;
    local bool bSetGameMode;
    local array<int> GameModeDispOrder;
    local int MapID;
    local wMapInfo mInfo;
    local GameModeInfo gmi;

    MapID = GetSelectedMapID();
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByID(MapID);
    ComboGameMode.ComboBox.List.Clear();
    GameModeDispOrder.Length = 0;
    GameModeDispOrder[GameModeDispOrder.Length] = 0;
    GameModeDispOrder[GameModeDispOrder.Length] = 3;
    GameModeDispOrder[GameModeDispOrder.Length] = 1;
    GameModeDispOrder[GameModeDispOrder.Length] = 2;
    GameModeDispOrder[GameModeDispOrder.Length] = 5;
    GameModeDispOrder[GameModeDispOrder.Length] = 6;
    GameModeDispOrder[GameModeDispOrder.Length] = 7;
    GameModeDispOrder[GameModeDispOrder.Length] = 8;
    lp1 = 0;
    J0xE6:

    // End:0x2E8 [Loop If]
    if(lp1 < GameModeDispOrder.Length)
    {
        GameModeIndex = GameModeDispOrder[lp1];
        // End:0x121
        if(MatchMaker.IsChannelRestrictionModes(GameModeIndex))
        {
            // [Explicit Continue]
            goto J0x2DE;
        }
        // End:0x15D
        if(PlayerOwner().Level.GetMatchMaker().MapSettings.IsGameModeEnable(MapID, GameModeIndex) == 0)
        {
            // [Explicit Continue]
            goto J0x2DE;
        }
        // End:0x181
        if(MapID == 29)
        {
            // End:0x17E
            if(GameModeDispOrder[lp1] != 8)
            {
                // [Explicit Continue]
                goto J0x2DE;
            }            
        }
        else
        {
            // End:0x196
            if(GameModeDispOrder[lp1] == 8)
            {
                // [Explicit Continue]
                goto J0x2DE;
            }
        }
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex);
        ComboGameMode.ComboBox.AddItem(gmi.UserFriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(GameModeIndex), gmi.ClassName);
        // End:0x227
        if(ComboGameMode.ComboBox.ItemCount() == 1)
        {
            ComboGameMode.ComboBox.SetIndex(0);
        }
        // End:0x29C
        if(bSet == false)
        {
            // End:0x299
            if((bSetGameMode == false) && gmi.ClassName == Class'Engine.wGameSettings'.default.DefaultGameModeClass)
            {
                ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
                bSetGameMode = true;
            }
            // [Explicit Continue]
            goto J0x2DE;
        }
        // End:0x2DE
        if(GameModeIndex == Index)
        {
            ComboGameMode.ComboBox.SetIndex(ComboGameMode.ComboBox.ItemCount() - 1);
        }
        J0x2DE:

        lp1++;
        // [Loop Continue]
        goto J0xE6;
    }
    // End:0x386
    if(MatchMaker.kClanMatch_InChannel)
    {
        lp1 = 0;
        J0x301:

        // End:0x386 [Loop If]
        if(lp1 < ComboGameMode.ComboBox.ItemCount())
        {
            // End:0x37C
            if(IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(lp1)).Index == 1)
            {
                ComboGameMode.ComboBox.SetIndex(lp1);
                return;
            }
            lp1++;
            // [Loop Continue]
            goto J0x301;
        }
    }
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

function FillCapacity()
{
    local int lp1;
    local GameModeInfo modeInfo;
    local int MapID, MaxUserCount;
    local wMapInfo mInfo;
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
    local array<string> Temp;
    local int MapID;

    BotModeIdx = IntClass(ComboGameMode.ComboBox.List.GetObjectAtIndex(ComboGameMode.ComboBox.Index)).Index;
    // End:0x118
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(BotModeIdx))
    {
        LabelWeaponRestriction.Caption = Class'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[0];
        ComboWeaponRestriction.ComboBox.List.Clear();
        Temp = Class'Engine.wGameSettings'.static.GetBotModeTeam(BotModeIdx);
        lp1 = 0;
        J0xC4:

        // End:0x115 [Loop If]
        if(lp1 < Temp.Length)
        {
            ComboWeaponRestriction.ComboBox.AddItem(Temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
            lp1++;
            // [Loop Continue]
            goto J0xC4;
        }        
    }
    else
    {
        LabelWeaponRestriction.Caption = CaptionWeaponRestriction;
        ComboWeaponRestriction.ComboBox.List.Clear();
        Temp = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
        MapID = GetSelectedMapID();
        lp1 = 0;
        J0x175:

        // End:0x21C [Loop If]
        if(lp1 < Temp.Length)
        {
            // End:0x1A2
            if(Class'Engine.wGameSettings'.static.IsAllowedWeaponRest(lp1) == false)
            {
                // [Explicit Continue]
                goto J0x212;
            }
            // End:0x212
            if(PlayerOwner().Level.GetMatchMaker().MapSettings.GetWeaponRestriction(MapID, lp1) > 0)
            {
                ComboWeaponRestriction.ComboBox.AddItem(Temp[lp1], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(lp1));
            }
            J0x212:

            lp1++;
            // [Loop Continue]
            goto J0x175;
        }
    }
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
    // End:0x6F
    if((GetGameModeIndex()) == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        ComboScore.SetVisibility(false);
        ComboWeaponRestriction.SetVisibility(false);
        LabelScore.SetVisibility(false);
        LabelWeaponRestriction.SetVisibility(false);        
    }
    else
    {
        ComboScore.SetVisibility(true);
        ComboWeaponRestriction.SetVisibility(true);
        LabelScore.SetVisibility(true);
        LabelWeaponRestriction.SetVisibility(true);
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
    FillGameModeList(true, GetGameModeIndex());
    FillCapacity();
    FillScoreList();
    FillWeaponRestrictions();
    //return;    
}

defaultproperties
{
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelRoomName'
    begin object name="mLabelRoomName" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=215.0000000,Y1=281.0000000,X2=271.0000000,Y2=306.0000000)
        OnRendered=mLabelRoomName.Internal_OnRendered
    end object
    LabelRoomName=mLabelRoomName
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mBorderRoomName'
    begin object name="mBorderRoomName" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=287.0000000,Y1=281.0000000,X2=557.0000000,Y2=306.0000000)
        OnRendered=mBorderRoomName.Internal_OnRendered
    end object
    BorderRoomName=mBorderRoomName
    // Reference: BTEditBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mEditRoomName'
    begin object name="mEditRoomName" class=GUIWarfareControls_Decompressed.BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=291.0000000,Y1=283.0000000,X2=553.0000000,Y2=306.0000000)
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
        AWinPos=(X1=215.0000000,Y1=315.0000000,X2=271.0000000,Y2=340.0000000)
        OnRendered=mLabelPassword.Internal_OnRendered
    end object
    LabelPassword=mLabelPassword
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mBorderPassword'
    begin object name="mBorderPassword" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=287.0000000,Y1=315.0000000,X2=557.0000000,Y2=340.0000000)
        OnRendered=mBorderPassword.Internal_OnRendered
    end object
    BorderPassword=mBorderPassword
    // Reference: BTEditBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mEditPassword'
    begin object name="mEditPassword" class=GUIWarfareControls_Decompressed.BTEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=291.0000000,Y1=317.0000000,X2=553.0000000,Y2=340.0000000)
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
        AWinPos=(X1=215.0000000,Y1=349.0000000,X2=271.0000000,Y2=375.0000000)
        OnRendered=mLabelMap.Internal_OnRendered
    end object
    LabelMap=mLabelMap
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboMap'
    begin object name="mComboMap" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=287.0000000,Y1=349.0000000,X2=557.0000000,Y2=375.0000000)
        RenderWeight=0.3500000
        OnDraw=mComboMap.InternalDraw
        OnChange=BTWindowCreateRoom.ComboMap_OnChange
    end object
    ComboMap=mComboMap
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelGameMode'
    begin object name="mLabelGameMode" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=215.0000000,Y1=383.0000000,X2=271.0000000,Y2=408.0000000)
        OnRendered=mLabelGameMode.Internal_OnRendered
    end object
    LabelGameMode=mLabelGameMode
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboGameMode'
    begin object name="mComboGameMode" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=287.0000000,Y1=383.0000000,X2=557.0000000,Y2=408.0000000)
        RenderWeight=0.3000000
        OnDraw=mComboGameMode.InternalDraw
    end object
    ComboGameMode=mComboGameMode
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelCapacity'
    begin object name="mLabelCapacity" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=215.0000000,Y1=417.0000000,X2=271.0000000,Y2=442.0000000)
        OnRendered=mLabelCapacity.Internal_OnRendered
    end object
    LabelCapacity=mLabelCapacity
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboCapacity'
    begin object name="mComboCapacity" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=287.0000000,Y1=417.0000000,X2=557.0000000,Y2=442.0000000)
        RenderWeight=0.2500000
        OnDraw=mComboCapacity.InternalDraw
    end object
    ComboCapacity=mComboCapacity
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelWeaponRestriction'
    begin object name="mLabelWeaponRestriction" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=215.0000000,Y1=451.0000000,X2=271.0000000,Y2=476.0000000)
        OnRendered=mLabelWeaponRestriction.Internal_OnRendered
    end object
    LabelWeaponRestriction=mLabelWeaponRestriction
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboWeaponRestriction'
    begin object name="mComboWeaponRestriction" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=287.0000000,Y1=451.0000000,X2=390.0000000,Y2=476.0000000)
        RenderWeight=0.2100000
        OnDraw=mComboWeaponRestriction.InternalDraw
    end object
    ComboWeaponRestriction=mComboWeaponRestriction
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mLabelScore'
    begin object name="mLabelScore" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=396.0000000,Y1=451.0000000,X2=452.0000000,Y2=476.0000000)
        OnRendered=mLabelScore.Internal_OnRendered
    end object
    LabelScore=mLabelScore
    // Reference: BTComboBoxHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mComboScore'
    begin object name="mComboScore" class=GUIWarfareControls_Decompressed.BTComboBoxHK
        bUseAWinPos=true
        AWinPos=(X1=465.0000000,Y1=451.0000000,X2=557.0000000,Y2=476.0000000)
        RenderWeight=0.2100000
        OnDraw=mComboScore.InternalDraw
    end object
    ComboScore=mComboScore
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap'
    begin object name="mImageMap" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=569.0000000,Y1=288.0000000,X2=811.0000000,Y2=469.0000000)
        RenderWeight=0.2000000
        OnRendered=mImageMap.Internal_OnRendered
    end object
    ImageMap=mImageMap
    // Referenc[0]e: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap0'
    begin object name="mImageMap0" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=782.0000000,Y1=293.0000000,X2=806.0000000,Y2=317.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap0.Internal_OnRendered
    end object
    ImageSupply=mImageMap0
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap1'
    begin object name="mImageMap1" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=753.0000000,Y1=293.0000000,X2=777.0000000,Y2=317.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap1.Internal_OnRendered
    end object
    ImageSupply=mImageMap1
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowCreateRoom.mImageMap2'
    begin object name="mImageMap2" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=725.0000000,Y1=293.0000000,X2=749.0000000,Y2=317.0000000)
        RenderWeight=0.2100000
        OnRendered=mImageMap2.Internal_OnRendered
    end object
    ImageSupply=mImageMap2
    DefaultRoomNamesCount=9
    DefaultRoomNames[0]="???????????? FPS!"
    DefaultRoomNames[1]="?????????????? Battery!"
    DefaultRoomNames[2]="????????! ????????????????? "
    DefaultRoomNames[3]="?? SHIFT ???????????????????!"
    DefaultRoomNames[4]="?? E ??????????????!"
    DefaultRoomNames[5]="??????????????????????????!"
    DefaultRoomNames[6]="?????????????????????????!"
    DefaultRoomNames[7]="?????????????????!"
    DefaultRoomNames[8]="?????????????????!"
    CaptionRoomName="????????"
    CaptionPassword="?????????"
    CaptionMap="??????"
    CaptionGameMode="???????"
    CaptionCapacity="???????"
    CaptionWeaponRestriction="Mode"
    CaptionScore="Point"
    fbBackgroundImage=(X1=181.0000000,Y1=227.0000000,X2=844.0000000,Y2=547.0000000)
    fbTopLine=(X1=201.0000000,Y1=247.0000000,X2=822.0000000,Y2=273.0000000)
    fbBottomLine=(X1=201.0000000,Y1=485.0000000,X2=822.0000000,Y2=527.0000000)
    fbButtonOK=(X1=391.0000000,Y1=491.0000000,X2=509.0000000,Y2=522.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=491.0000000,X2=633.0000000,Y2=522.0000000)
    strTitle="?????????"
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