class BTWindowRoomInfo extends BTWindow
    editinlinenew
    instanced;

var() automated BTBoxImage BorderPanel;
var() automated BTBoxImage BorderSeparator;
var() automated FloatingImage TitleForEdit;
var() automated FloatingImage TitleForView;
var() automated BTInputImage BorderTitle;
var() automated BTInputImage BorderRoomName;
var() automated BTInputImage BorderPassword;
var() automated GUILabel LabelRoomName;
var() automated GUIEditBox EditRoomName;
var() automated GUILabel LabelPassword;
var() automated GUIEditBox EditPassword;
var() automated GUILabel LabelMap;
var() automated BTComboBox ComboMap;
var() automated GUILabel LabelGameMode;
var() automated BTComboBox ComboGameMode;
var() automated GUILabel LabelCapacity;
var() automated BTComboBox ComboCapacity;
var() automated GUILabel LabelScore;
var() automated BTComboBox ComboScore;
var() automated GUILabel LabelGameTime;
var() automated BTComboBox comboTime;
var() automated GUILabel LabelWeaponRestriction;
var() automated BTComboBox ComboWeaponRestriction;
var() automated GUILabel LabelHardcore;
var() automated BTComboBox ComboHardcore;
var() automated GUILabel LabelAllyDamage;
var() automated GUILabel LabelMultiBomb;
var() automated BTComboBox ComboMultiBomb;
var() automated GUILabel LabelJumpIn;
var() automated GUILabel LabelFreeView;
var() automated BTComboBox ComboFreeView;
var() automated GUILabel LabelVoiceChat;
var() automated GUILabel LabelTeamBalance;
var() automated GUILabel LabelSpectate;
var() automated GUILabel LabelKillCam;
var() automated GUILabel LabelVote;
var localized string CaptionMultiBomb;
var localized string CaptionAllyDamage;
var localized string CaptionJumpIn;
var localized string CaptionFreeView;
var localized string CaptionVoiceChat;
var localized string CaptionTeamBalance;
var localized string CaptionSpectate;
var localized string CaptionKillCam;
var localized string CaptionVote;
var localized string CaptionBombForEveryone;
var localized string CaptionBombForOne;
var() automated GUIButton ButtonOKForEdit;
var() automated GUIButton ButtonOKForView;
var() automated GUIButton ButtonCancelForEdit;
var() automated BTTailImage TailLeftForEdit;
var() automated BTTailImage TailRightForEdit;
var() automated BTTailImage TailLeftForView;
var() automated BTTailImage TailRightForView;
var wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
//var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
    ApplyLocalizedStrings();
    InitializeCombos();
    TR_InitializeRespawnMode();
    //return;    
}

function TR_InitializeRespawnMode()
{
    ComboWeaponRestriction.ComboBox.AddItem("Old Respawn");
    ComboWeaponRestriction.ComboBox.AddItem("New Respawn");
    ComboWeaponRestriction.ComboBox.SetIndex(1);
    //return;    
}

function bool TR_GetNewRespawn()
{
    return ComboWeaponRestriction.ComboBox.Index != 0;
    //return;    
}

function InitializeCombos()
{
    ComboGameMode.ComboBox.Edit.bReadOnly = true;
    ComboGameMode.ComboBox.__OnChange__Delegate = ComboGameMode_OnChange;
    ComboCapacity.ComboBox.Edit.bReadOnly = true;
    ComboHardcore.ComboBox.Edit.bReadOnly = true;
    ComboMap.ComboBox.Edit.bReadOnly = true;
    ComboScore.ComboBox.Edit.bReadOnly = true;
    comboTime.ComboBox.Edit.bReadOnly = true;
    ComboWeaponRestriction.ComboBox.Edit.bReadOnly = true;
    ComboMultiBomb.ComboBox.Edit.bReadOnly = true;
    ComboFreeView.ComboBox.Edit.bReadOnly = true;
    //return;    
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization globalLoc;

    globalLoc = new Class'Engine.GlobalLocalization';
    LabelRoomName.Caption = globalLoc.CaptionRoomName;
    LabelPassword.Caption = globalLoc.CaptionPassword;
    LabelMap.Caption = globalLoc.CaptionMap;
    LabelGameMode.Caption = globalLoc.CaptionGameMode;
    LabelCapacity.Caption = globalLoc.CaptionCapacity;
    LabelGameTime.Caption = globalLoc.CaptionGameTime;
    LabelScore.Caption = globalLoc.CaptionTargetScore;
    LabelWeaponRestriction.Caption = "Respawn";
    LabelHardcore.Caption = globalLoc.CaptionHardcore;
    LabelMultiBomb.Caption = CaptionMultiBomb;
    LabelAllyDamage.Caption = CaptionAllyDamage;
    LabelJumpIn.Caption = CaptionJumpIn;
    LabelFreeView.Caption = CaptionFreeView;
    LabelVoiceChat.Caption = CaptionVoiceChat;
    LabelTeamBalance.Caption = CaptionTeamBalance;
    LabelSpectate.Caption = CaptionSpectate;
    LabelKillCam.Caption = CaptionKillCam;
    LabelVote.Caption = CaptionVote;
    //return;    
}

event Opened(GUIComponent Sender)
{
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function DumpStringListToGUIList(array<string> From, GUIList to)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x3B [Loop If]
    if(lp1 < From.Length)
    {
        to.Add(From[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DumpGUIList(GUIList From, GUIList to)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4D [Loop If]
    if(lp1 < From.Elements.Length)
    {
        to.AddElement(From.Elements[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FillMultiBomb()
{
    ComboMultiBomb.ComboBox.List.Clear();
    ComboMultiBomb.ComboBox.AddItem(CaptionBombForEveryone);
    ComboMultiBomb.ComboBox.AddItem(CaptionBombForOne);
    ComboMultiBomb.ComboBox.SetIndex(0);
    //return;    
}

function FillFreeView()
{
    ComboFreeView.ComboBox.List.Clear();
    ComboFreeView.ComboBox.AddItem("Yes");
    ComboFreeView.ComboBox.AddItem("No");
    ComboFreeView.ComboBox.SetIndex(1);
    //return;    
}

function FillGameModeList()
{
    local int lp1;

    ComboGameMode.ComboBox.List.Clear();
    lp1 = 0;
    J0x28:

    // End:0xBB [Loop If]
    if(lp1 < GameModeInfos.Length)
    {
        ComboGameMode.ComboBox.AddItem(GameModeInfos[lp1].UserFriendlyName, none, GameModeInfos[lp1].ClassName);
        // End:0xB1
        if(GameModeInfos[lp1].ClassName == Class'Engine.wGameSettings'.default.DefaultGameModeClass)
        {
            ComboGameMode.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

function FillMapList()
{
    local int i;
    local array<wMapInfo> Maps;

    ComboMap.ComboBox.List.Clear();
    Maps = MatchMaker.MapSettings.GetAllMapInfos();
    i = 0;
    J0x46:

    // End:0xA1 [Loop If]
    if(i < Maps.Length)
    {
        ComboMap.ComboBox.AddItem(Maps[i].FriendlyName, none, Maps[i].File);
        i++;
        // [Loop Continue]
        goto J0x46;
    }
    //return;    
}

function fill(GUIList capacityList, GUIList timeList)
{
    FillMapList();
    ComboGameMode.ComboBox.Clear();
    ComboCapacity.ComboBox.Clear();
    comboTime.ComboBox.Clear();
    FillGameModeList();
    FillMultiBomb();
    FillFreeView();
    DumpGUIList(capacityList, ComboCapacity.ComboBox.List);
    DumpGUIList(timeList, comboTime.ComboBox.List);
    //return;    
}

private function _setComboBox(GUIComboBox Combo, string Value)
{
    local int idx;

    idx = Combo.List.FindIndex(Value, true);
    // End:0x4A
    if(idx != -1)
    {
        Combo.SetIndex(idx);        
    }
    else
    {
        Combo.SetIndex(0);
    }
    //return;    
}

function SetMap(string Map)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x87 [Loop If]
    if(i < ComboMap.ComboBox.ItemCount())
    {
        // End:0x7D
        if(Caps(ComboMap.ComboBox.List.GetExtraAtIndex(i)) == Caps(Map))
        {
            ComboMap.ComboBox.SetIndex(i);
            // [Explicit Break]
            goto J0x87;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x87:

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

function SetGameModeClass(string gameModeClass)
{
    local int lp1, idx;

    idx = 0;
    lp1 = 0;
    J0x0E:

    // End:0x8A [Loop If]
    if(lp1 < ComboGameMode.ComboBox.List.Elements.Length)
    {
        // End:0x80
        if(Locs(ComboGameMode.ComboBox.List.Elements[lp1].ExtraStrData) == Locs(gameModeClass))
        {
            idx = lp1;
            // [Explicit Break]
            goto J0x8A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x0E;
    }
    J0x8A:

    ComboGameMode.ComboBox.SetIndex(idx);
    UpdateComboScoreList();
    UpdateComboTimeList();
    UpdateMultiBomb();
    //return;    
}

function UpdateMultiBomb()
{
    // End:0x34
    if((GetGameModeClass()) ~= "wMission.wSDGameInfo")
    {
        ComboMultiBomb.SetEnabled(true);        
    }
    else
    {
        ComboMultiBomb.SetEnabled(false);
    }
    //return;    
}

function string GetGameModeUserFriendlyName()
{
    return ComboGameMode.ComboBox.TextStr;
    //return;    
}

function string GetGameModeClass()
{
    return ComboGameMode.ComboBox.List.Elements[ComboGameMode.ComboBox.Index].ExtraStrData;
    //return;    
}

function SetCapacity(string Value)
{
    _setComboBox(ComboCapacity.ComboBox, Value);
    //return;    
}

function string GetCapacity()
{
    return ComboCapacity.ComboBox.TextStr;
    //return;    
}

function UpdateComboTimeList()
{
    local int lp1;
    local GameModeInfo modeInfo;

    comboTime.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByClass(GetGameModeClass());
    lp1 = 0;
    J0x43:

    // End:0xDF [Loop If]
    if(lp1 < modeInfo.TimeLimits.Length)
    {
        comboTime.ComboBox.AddItem(modeInfo.TimeLimits[lp1]);
        // End:0xD5
        if(modeInfo.TimeLimits[lp1] == modeInfo.Scores_DefaultTimeLimits[ComboScore.ComboBox.GetIndex()])
        {
            comboTime.ComboBox.SetIndex(lp1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x43;
    }
    //return;    
}

function SetTime(string Value)
{
    _setComboBox(comboTime.ComboBox, Value);
    //return;    
}

function string GetTime()
{
    return comboTime.ComboBox.TextStr;
    //return;    
}

function UpdateComboScoreList()
{
    local int lp1;
    local GameModeInfo modeInfo;

    ComboScore.ComboBox.List.Clear();
    modeInfo = Class'Engine.wGameSettings'.static.GetGameModeByClass(GetGameModeClass());
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
    //return;    
}

function SetScore(string Score)
{
    _setComboBox(ComboScore.ComboBox, Score);
    //return;    
}

function string GetScore()
{
    return ComboScore.ComboBox.TextStr;
    //return;    
}

function SetRandomRoomName()
{
    local array<string> Names;

    Names[0] = "GoGoGo~GoGoGo~!";
    Names[1] = "Only Best! Only Batteries!";
    Names[2] = "The Battery rules the world";
    EditRoomName.SetText(Names[Rand(Names.Length)]);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
    //return;    
}

function bool ButtonCancel_Clicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function ComboGameMode_OnChange(GUIComponent Sender)
{
    UpdateComboScoreList();
    UpdateComboTimeList();
    UpdateMultiBomb();
    //return;    
}

function bool GetMultiBomb()
{
    return ComboMultiBomb.ComboBox.TextStr == CaptionBombForEveryone;
    //return;    
}

function SetMultiBomb(bool Value)
{
    // End:0x28
    if(Value == true)
    {
        _setComboBox(ComboMultiBomb.ComboBox, CaptionBombForEveryone);        
    }
    else
    {
        _setComboBox(ComboMultiBomb.ComboBox, CaptionBombForOne);
    }
    //return;    
}

function bool GetFreeView()
{
    return ComboFreeView.ComboBox.GetIndex() == 0;
    //return;    
}

function SetFreeView(bool Value)
{
    // End:0x25
    if(Value)
    {
        ComboFreeView.ComboBox.SetIndex(0);        
    }
    else
    {
        ComboFreeView.ComboBox.SetIndex(1);
    }
    //return;    
}

function SetEditable(bool Value)
{
    TitleForEdit.bVisible = Value;
    TitleForView.bVisible = !Value;
    TailLeftForEdit.bVisible = Value;
    TailRightForEdit.bVisible = Value;
    TailLeftForView.bVisible = !Value;
    TailRightForView.bVisible = !Value;
    ButtonOKForEdit.bVisible = Value;
    ButtonOKForView.bVisible = !Value;
    ButtonCancelForEdit.bVisible = Value;
    EditRoomName.bAcceptsInput = Value;
    EditPassword.bAcceptsInput = Value;
    ComboCapacity.ComboBox.SetEnabled(Value);
    ComboGameMode.ComboBox.SetEnabled(Value);
    ComboMap.ComboBox.SetEnabled(Value);
    ComboScore.ComboBox.SetEnabled(Value);
    comboTime.ComboBox.SetEnabled(Value);
    ComboWeaponRestriction.ComboBox.SetEnabled(Value);
    ComboHardcore.ComboBox.SetEnabled(Value);
    ComboMultiBomb.ComboBox.SetEnabled(Value);
    //return;    
}

defaultproperties
{
    CaptionMultiBomb="????"
    CaptionAllyDamage="????"
    CaptionJumpIn="?????"
    CaptionFreeView="????"
    CaptionVoiceChat="????"
    CaptionTeamBalance="????"
    CaptionSpectate="????"
    CaptionKillCam="??"
    CaptionVote="??"
    CaptionBombForEveryone="? ??"
    CaptionBombForOne="1?"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.3000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.2128870
    WinLeft=0.3146790
    WinWidth=0.4000000
    WinHeight=0.6000000
}