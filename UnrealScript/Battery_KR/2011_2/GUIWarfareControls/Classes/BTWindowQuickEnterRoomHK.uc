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
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    allGameMode.UserFriendlyName = strAllModes;
    GameModes.Insert(0, 1);
    GameModes[0] = allGameMode;
    AllMap = new Class'Engine.wMapInfo';
    AllMap.FriendlyName = strAllMaps;
    Maps.Insert(0, 1);
    Maps[0] = AllMap;
    SubModes.Insert(0, 1);
    SubModes[0] = strAllSubMode;
    fboxLabel.X1 = fbTopLine.X1 + float(20);
    fboxLabel.X2 = fboxLabel.X1 + float(80);
    fboxLabel.Y1 = fbTopLine.Y1 + float(38);
    fboxLabel.Y2 = fboxLabel.Y1 + float(32);
    Label[0] = NewLabelComponent(fboxLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label[0].Caption = strLabel[0];
    Label[0].SetFontDrawType(3);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    nBtnCount = 0;
    i = 0;
    J0x2B3:

    // End:0x45B [Loop If]
    if(i < GameModes.Length)
    {
        // End:0x307
        if((((i - 1) == Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial()) || (i - 1) == 9) || (i - 1) == 10)
        {
            // [Explicit Continue]
            goto J0x451;
            // [Explicit Continue]
            goto J0x451;
        }
        nRow = nBtnCount / 4;
        nColumn = int(float(nBtnCount) % float(4));
        fboxBtn.X1 = fboxTemp.X1 + float(nColumn * 128);
        fboxBtn.X2 = fboxBtn.X1 + float(128);
        fboxBtn.Y1 = fboxTemp.Y1 + float(nRow * 32);
        fboxBtn.Y2 = fboxBtn.Y1 + float(32);
        ButtonGameMode[nBtnCount] = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fboxBtn));
        ButtonGameMode[nBtnCount].SetDefaultRadioImage();
        ButtonGameMode[nBtnCount].SetDefaultRadioButtonFontColor();
        ButtonGameMode[nBtnCount].CaptionDrawType = 3;
        ButtonGameMode[nBtnCount].Caption = GameModes[i].UserFriendlyName;
        GroupGameMode.AddButton(ButtonGameMode[nBtnCount]);
        ++nBtnCount;
        J0x451:

        ++i;
        // [Loop Continue]
        goto J0x2B3;
    }
    ButtonGameMode[0].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.X1 = fbTopLine.X1 + float(10);
    fboxLine.X2 = fbTopLine.X2 - float(10);
    fboxLine.Y1 = fboxBtn.Y2 + float(13);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    NewLabelComponent(fboxLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    fboxLabel.Y1 = fboxLine.Y2 + float(13);
    fboxLabel.Y2 = fboxLabel.Y1 + float(32);
    Label[1] = NewLabelComponent(fboxLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label[1].Caption = strLabel[1];
    Label[1].SetFontDrawType(3);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    i = 0;
    J0x5EB:

    // End:0x74C [Loop If]
    if(i < Maps.Length)
    {
        nRow = i / 4;
        nColumn = int(float(i) % float(4));
        fboxBtn.X1 = fboxTemp.X1 + float(nColumn * 128);
        fboxBtn.X2 = fboxBtn.X1 + float(128);
        fboxBtn.Y1 = fboxTemp.Y1 + float(nRow * 32);
        fboxBtn.Y2 = fboxBtn.Y1 + float(32);
        ButtonMap[i] = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fboxBtn));
        ButtonMap[i].SetDefaultRadioImage();
        ButtonMap[i].CaptionDrawType = 3;
        ButtonMap[i].SetDefaultRadioButtonFontColor();
        ButtonMap[i].Caption = Maps[i].FriendlyName;
        GroupMap.AddButton(ButtonMap[i]);
        ++i;
        // [Loop Continue]
        goto J0x5EB;
    }
    ButtonMap[0].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    NewLabelComponent(fboxLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    fboxLabel.Y1 = fboxLine.Y2 + float(13);
    fboxLabel.Y2 = fboxLabel.Y1 + float(32);
    Label[2] = NewLabelComponent(fboxLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label[2].Caption = strLabel[2];
    Label[2].SetFontDrawType(3);
    fboxTemp.X1 = fboxLabel.X1 + float(80);
    fboxTemp.X2 = fboxTemp.X1 + float(80);
    fboxTemp.Y1 = fboxLabel.Y1;
    fboxTemp.Y2 = fboxLabel.Y2;
    nBtnCount = 0;
    i = 0;
    J0x8B1:

    // End:0xA2A [Loop If]
    if(i < SubModes.Length)
    {
        // End:0xA20
        if(Class'Engine.wGameSettings'.static.IsAllowedWeaponRest(i - 1))
        {
            nRow = nBtnCount / 4;
            nColumn = int(float(nBtnCount) % float(4));
            fboxBtn.X1 = fboxTemp.X1 + float(nColumn * 128);
            fboxBtn.X2 = fboxBtn.X1 + float(128);
            fboxBtn.Y1 = fboxTemp.Y1 + float(nRow * 32);
            fboxBtn.Y2 = fboxBtn.Y1 + float(32);
            ButtonSubMode[nBtnCount] = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fboxBtn));
            ButtonSubMode[nBtnCount].Caption = SubModes[i];
            ButtonSubMode[nBtnCount].SetDefaultRadioImage();
            ButtonSubMode[nBtnCount].SetDefaultRadioButtonFontColor();
            ButtonSubMode[nBtnCount].CaptionDrawType = 3;
            GroupSubMode.AddButton(ButtonSubMode[nBtnCount]);
            nBtnCount++;
        }
        ++i;
        // [Loop Continue]
        goto J0x8B1;
    }
    ButtonSubMode[i].FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonNBold();
    fboxLine.Y1 = fboxBtn.Y1 + float(38);
    fboxLine.Y2 = fboxLine.Y1 + float(2);
    NewLabelComponent(fboxLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    fbButtonOK.Y1 = fboxLine.Y2 + float(38);
    fbButtonOK.Y2 = fbButtonOK.Y1 + float(33);
    fbButtonCancel.Y1 = fbButtonOK.Y1;
    fbButtonCancel.Y2 = fbButtonOK.Y2;
    fbBackgroundImage.Y2 = fbButtonOK.Y2 + float(23);
    fbBottomLine.Y2 = fbBackgroundImage.Y2 - float(20);
    fbBottomLine.Y1 = fbBottomLine.Y2 - float(43);
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    BackgroundImage.AWinPos = fbBackgroundImage;
    nOffsetY = int(float(int(float(Controller.ResY) - (BackgroundImage.AWinPos.Y2 - BackgroundImage.AWinPos.Y1)) / 2) - BackgroundImage.AWinPos.Y1);
    SetContentOffset(0, nOffsetY);
    GroupSubMode.SelectButton(WeaponRestriction);
    GroupGameMode.SelectButton(GameMode);
    GroupMap.SelectButton(Map);
    ButtonCancel.__OnClick__Delegate = OnCancel;
    bCancelled = false;
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    // End:0x4D
    if(!bCancelled)
    {
        GameMode = GroupGameMode.GetSelectIndex();
        Map = GroupMap.GetSelectIndex();
        WeaponRestriction = GroupSubMode.GetSelectIndex();
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

defaultproperties
{
    strLabel[0]="?? ??"
    strLabel[1]="?"
    strLabel[2]="?? ??"
    strAllMaps="?? ?"
    strAllModes="?? ??"
    strAllSubMode="?? ????"
    fbBackgroundImage=(X1=181.0000000,Y1=193.0000000,X2=843.0000000,Y2=575.0000000)
    fbTopLine=(X1=201.0000000,Y1=213.0000000,X2=823.0000000,Y2=239.0000000)
    fbBottomLine=(X1=201.0000000,Y1=512.0000000,X2=823.0000000,Y2=555.0000000)
    fbButtonOK=(X1=391.0000000,Y1=0.0000000,X2=511.0000000,Y2=0.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=0.0000000,X2=635.0000000,Y2=0.0000000)
    strTitle="?? ??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnSaveINI=BTWindowQuickEnterRoomHK.InternalOnSaveINI
}