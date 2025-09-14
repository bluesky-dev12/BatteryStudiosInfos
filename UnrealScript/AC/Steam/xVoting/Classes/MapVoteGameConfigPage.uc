/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteGameConfigPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:10
 *
 *******************************************************************************/
class MapVoteGameConfigPage extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_List;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_List2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_GameConfigList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GameClass;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_GameTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Acronym;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Prefix;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MultiSelectListBox lb_Mutator;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Parameter;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_New;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Delete;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Default;
var array<GameRecord> GameTypes;
var array<MutatorRecord> Mutators;
var() editconst noexport GameRecord currentGame;
var() int SaveIndex;
var() int ListIndex;
var bool bChanged;
var localized string lmsgNew;
var localized string lmsgAdd;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x73 [While If]
    if(i < class'xVotingHandler'.default.GameConfig.Length)
    {
        lb_GameConfigList.List.Add(class'xVotingHandler'.default.GameConfig[i].GameName, none, string(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    // End:0x9b
    if(lb_GameConfigList.List.ItemCount == 0)
    {
        DisableComponent(b_Delete);
    }
    class'CacheManager'.static.GetGameTypeList(GameTypes);
    i = 0;
    J0xb3:
    // End:0xfd [While If]
    if(i < GameTypes.Length)
    {
        co_GameClass.AddItem(GameTypes[i].GameName, none, GameTypes[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb3;
    }
    class'CacheManager'.static.GetMutatorList(Mutators);
    LoadMutators();
    sb_Main.SetPosition(0.4833590, 0.0646780, 0.451250, 0.7169910);
    lb_GameConfigList.List.AddLinkObject(co_GameClass);
    lb_GameConfigList.List.AddLinkObject(ed_GameTitle);
    lb_GameConfigList.List.AddLinkObject(ed_Acronym);
    lb_GameConfigList.List.AddLinkObject(ed_Prefix);
    lb_GameConfigList.List.AddLinkObject(ed_Parameter);
    lb_GameConfigList.List.AddLinkObject(lb_Mutator);
    lb_GameConfigList.List.AddLinkObject(ch_Default);
    lb_GameConfigList.List.AddLinkObject(b_Delete);
    lb_GameConfigList.__OnChange__Delegate = GameConfigList_Changed;
    bChanged = false;
    sb_Main.TopPadding = 0.0;
    sb_Main.BottomPadding = 0.40;
    sb_Main.Caption = "Options";
    sb_List.ManageComponent(lb_GameConfigList);
    sb_List.LeftPadding = 0.0050;
    sb_List.RightPadding = 0.0050;
    sb_Main.ManageComponent(ch_Default);
    sb_Main.ManageComponent(co_GameClass);
    sb_Main.ManageComponent(ed_GameTitle);
    sb_Main.ManageComponent(ed_Acronym);
    sb_Main.ManageComponent(ed_Prefix);
    sb_Main.ManageComponent(ed_Parameter);
    sb_List2.ManageComponent(lb_Mutator);
    // End:0x36e
    if(lb_GameConfigList.List.ItemCount == 0)
    {
        DisableComponent(b_Delete);
    }
    // End:0x387
    else
    {
        lb_GameConfigList.List.SetIndex(0);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x27
    if(Sender == b_OK)
    {
        SaveChange();
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x48
    if(Sender == b_Cancel)
    {
        Controller.CloseMenu(true);
        return true;
    }
    return false;
}

function InternalOnOpen()
{
    lb_GameConfigList.List.SetIndex(0);
}

function LoadMutators()
{
    local int i;

    lb_Mutator.List.Clear();
    i = 0;
    J0x1f:
    // End:0x72 [While If]
    if(i < Mutators.Length)
    {
        lb_Mutator.List.Add(Mutators[i].FriendlyName, none, Mutators[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function GameConfigList_Changed(GUIComponent Sender)
{
    local int i;
    local array<string> MutatorArray;

    // End:0x42
    if(lb_GameConfigList.List.ItemCount == 0 || lb_GameConfigList.List.Index == ListIndex)
    {
        return;
    }
    SaveChange();
    SaveIndex = int(lb_GameConfigList.List.GetExtra());
    ListIndex = lb_GameConfigList.List.Index;
    LoadMutators();
    co_GameClass.Find(class'xVotingHandler'.default.GameConfig[SaveIndex].GameClass, true, true);
    ed_GameTitle.SetComponentValue(class'xVotingHandler'.default.GameConfig[SaveIndex].GameName, true);
    ed_Acronym.SetComponentValue(class'xVotingHandler'.default.GameConfig[SaveIndex].Acronym, true);
    ed_Prefix.SetComponentValue(class'xVotingHandler'.default.GameConfig[SaveIndex].Prefix, true);
    ed_Parameter.SetComponentValue(class'xVotingHandler'.default.GameConfig[SaveIndex].Options, true);
    ch_Default.SetComponentValue(string(class'xVotingHandler'.default.DefaultGameConfig == SaveIndex), true);
    Split(class'xVotingHandler'.default.GameConfig[SaveIndex].Mutators, ",", MutatorArray);
    i = 0;
    J0x1ab:
    // End:0x1eb [While If]
    if(i < MutatorArray.Length)
    {
        lb_Mutator.List.Find(MutatorArray[i], false, true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ab;
    }
    bChanged = false;
}

function int GameIndex()
{
    local string GameClass;
    local int i;

    GameClass = co_GameClass.GetExtra();
    i = 0;
    J0x1c:
    // End:0x56 [While If]
    if(i < GameTypes.Length)
    {
        // End:0x4c
        if(GameTypes[i].ClassName == GameClass)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    return -1;
}

function FieldChange(GUIComponent Sender)
{
    local int i, j;

    bChanged = true;
    // End:0xf8
    if(Sender == co_GameClass)
    {
        i = GameIndex();
        j = 0;
        J0x2a:
        // End:0xb5 [While If]
        if(j < GameTypes.Length)
        {
            // End:0xab
            if(GameTypes[j].GameName == ed_GameTitle.GetText())
            {
                ed_GameTitle.SetComponentValue(GameTypes[i].GameName, true);
                lb_GameConfigList.List.SetItemAtIndex(ListIndex, GameTypes[i].GameName);
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x2a;
        }
        ed_Acronym.SetComponentValue(GameTypes[i].GameAcronym, true);
        ed_Prefix.SetComponentValue(GameTypes[i].MapPrefix, true);
    }
    // End:0x142
    else
    {
        // End:0x142
        if(Sender == ed_GameTitle)
        {
            // End:0x142
            if(ListIndex != -1)
            {
                lb_GameConfigList.List.SetItemAtIndex(ListIndex, ed_GameTitle.GetText());
            }
        }
    }
}

function bool SaveChange()
{
    local int i;

    // End:0x0d
    if(!bChanged)
    {
        return true;
    }
    // End:0x1b5
    if(SaveIndex == -1)
    {
        i = class'xVotingHandler'.default.GameConfig.Length;
        class'xVotingHandler'.default.GameConfig.Length = i + 1;
        class'xVotingHandler'.default.GameConfig[i].GameClass = co_GameClass.GetExtra();
        class'xVotingHandler'.default.GameConfig[i].GameName = ed_GameTitle.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Acronym = ed_Acronym.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Prefix = ed_Prefix.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Options = ed_Parameter.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Mutators = lb_Mutator.List.GetExtra();
        // End:0x170
        if(bool(ch_Default.GetComponentValue()))
        {
            class'xVotingHandler'.default.DefaultGameConfig = i;
        }
        class'xVotingHandler'.static.StaticSaveConfig();
        SaveIndex = i;
        lb_GameConfigList.List.SetExtraAtIndex(ListIndex, "" $ string(SaveIndex));
    }
    // End:0x2f6
    else
    {
        i = SaveIndex;
        class'xVotingHandler'.default.GameConfig[i].GameClass = co_GameClass.GetExtra();
        class'xVotingHandler'.default.GameConfig[i].GameName = ed_GameTitle.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Acronym = ed_Acronym.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Prefix = ed_Prefix.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Options = ed_Parameter.GetComponentValue();
        class'xVotingHandler'.default.GameConfig[i].Mutators = lb_Mutator.List.GetExtra();
        // End:0x2e7
        if(bool(ch_Default.GetComponentValue()))
        {
            class'xVotingHandler'.default.DefaultGameConfig = i;
        }
        class'xVotingHandler'.static.StaticSaveConfig();
    }
    bChanged = false;
    return true;
}

function bool NewButtonClick(GUIComponent Sender)
{
    local int i;

    SaveChange();
    i = GameIndex();
    lb_GameConfigList.List.bNotify = false;
    lb_GameConfigList.List.Insert(0, "** New **",, "-1", true);
    lb_GameConfigList.List.bNotify = true;
    ed_GameTitle.SetComponentValue("** New **", true);
    ed_Acronym.SetComponentValue(GameTypes[i].GameAcronym, true);
    ed_Prefix.SetComponentValue(GameTypes[i].MapPrefix, true);
    ed_Parameter.SetComponentValue("", true);
    ch_Default.SetComponentValue("False", true);
    LoadMutators();
    ListIndex = 0;
    SaveIndex = -1;
    bChanged = true;
    EnableComponent(co_GameClass);
    EnableComponent(ed_GameTitle);
    EnableComponent(ed_Acronym);
    EnableComponent(ed_Prefix);
    EnableComponent(ed_Parameter);
    EnableComponent(lb_Mutator);
    EnableComponent(ch_Default);
    EnableComponent(b_Delete);
    return true;
}

function bool DeleteButtonClick(GUIComponent Sender)
{
    local int i, X;

    // End:0x2f
    if(SaveIndex >= 0)
    {
        class'xVotingHandler'.default.GameConfig.Remove(SaveIndex, 1);
        class'xVotingHandler'.static.StaticSaveConfig();
    }
    // End:0xe9
    if(ListIndex >= 0)
    {
        i = 0;
        J0x41:
        // End:0xcb [While If]
        if(i < lb_GameConfigList.List.ItemCount)
        {
            X = int(lb_GameConfigList.List.GetExtraAtIndex(i));
            // End:0xc1
            if(X > SaveIndex)
            {
                lb_GameConfigList.List.SetExtraAtIndex(i, "" $ string(X - 1));
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x41;
        }
        lb_GameConfigList.List.Remove(ListIndex, 1);
    }
    SaveIndex = -1;
    ListIndex = -1;
    // End:0x1f2
    if(lb_GameConfigList.List.ItemCount == 0)
    {
        DisableComponent(b_Delete);
        co_GameClass.SetIndex(-1);
        ed_GameTitle.SetComponentValue("", true);
        ed_Acronym.SetComponentValue("", true);
        ed_Prefix.SetComponentValue("", true);
        ed_Parameter.SetComponentValue("", true);
        ch_Default.SetComponentValue("False", true);
        DisableComponent(co_GameClass);
        DisableComponent(ed_GameTitle);
        DisableComponent(ed_Acronym);
        DisableComponent(ed_Prefix);
        DisableComponent(ed_Parameter);
        DisableComponent(lb_Mutator);
        DisableComponent(ch_Default);
        bChanged = false;
    }
    // End:0x20b
    else
    {
        lb_GameConfigList.List.SetIndex(0);
    }
    return true;
}

defaultproperties
{
    begin object name=SBList class=AltSectionBackground
        bFillClient=true
        Caption="????"
        WinTop=0.0442720
        WinLeft=0.0429690
        WinWidth=0.3779290
        WinHeight=0.7539070
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'MapVoteGameConfigPage.SBList'
    sb_List=SBList
    begin object name=SBList2 class=AltSectionBackground
        Caption="????"
        LeftPadding=0.0
        RightPadding=0.0
        TopPadding=0.10
        BottomPadding=0.10
        WinTop=0.5401590
        WinLeft=0.4833590
        WinWidth=0.451250
        WinHeight=0.2958990
        RenderWeight=0.490
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'MapVoteGameConfigPage.SBList2'
    sb_List2=SBList2
    begin object name=GameConfigListBox class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="?????? ??? ????? ?????."
        WinTop=0.1607750
        WinLeft=0.6267580
        WinWidth=0.3440870
        WinHeight=0.7277590
        TabOrder=0
    object end
    // Reference: GUIListBox'MapVoteGameConfigPage.GameConfigListBox'
    lb_GameConfigList=GameConfigListBox
    begin object name=GameClassComboBox class=moComboBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="??? ????? ?? ?? ??? ????."
        WinTop=0.1361350
        WinLeft=0.0289550
        WinWidth=0.592970
        WinHeight=0.0768550
        TabOrder=4
        OnChange=FieldChange
    object end
    // Reference: moComboBox'MapVoteGameConfigPage.GameClassComboBox'
    co_GameClass=GameClassComboBox
    begin object name=GameTitleEditBox class=moEditBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="??? ?? ??? ??? ????."
        WinTop=0.2238440
        WinLeft=0.0289550
        WinWidth=0.592970
        WinHeight=0.0742490
        TabOrder=3
        OnChange=FieldChange
    object end
    // Reference: moEditBox'MapVoteGameConfigPage.GameTitleEditBox'
    ed_GameTitle=GameTitleEditBox
    begin object name=AcronymEditBox class=moEditBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="????? ???? ???, ??, ??? ?????. ?? ???? ? ??? ????."
        WinTop=0.3063430
        WinLeft=0.0289550
        WinWidth=0.592970
        WinHeight=0.0768550
        TabOrder=5
        OnChange=FieldChange
    object end
    // Reference: moEditBox'MapVoteGameConfigPage.AcronymEditBox'
    ed_Acronym=AcronymEditBox
    begin object name=PrefixEditBox class=moEditBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="? ????"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ?? ???? ???. ??? ?????."
        WinTop=0.3931850
        WinLeft=0.0289550
        WinWidth=0.592970
        WinHeight=0.0742490
        TabOrder=6
        OnChange=FieldChange
    object end
    // Reference: moEditBox'MapVoteGameConfigPage.PrefixEditBox'
    ed_Prefix=PrefixEditBox
    begin object name=MutatorListBox class=MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ????? ?????."
        WinTop=0.4843690
        WinLeft=0.2242670
        WinWidth=0.3964850
        WinHeight=0.3152340
        TabOrder=9
        OnChange=FieldChange
    object end
    // Reference: MultiSelectListBox'MapVoteGameConfigPage.MutatorListBox'
    lb_Mutator=MutatorListBox
    begin object name=ParameterEditBox class=moEditBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="??? ?? ?? ????? (??)???. ??? ?????(?: ????=4, ?? ????=4)"
        WinTop=0.8269490
        WinLeft=0.0777830
        WinWidth=0.4904310
        TabOrder=7
        OnChange=FieldChange
    object end
    // Reference: moEditBox'MapVoteGameConfigPage.ParameterEditBox'
    ed_Parameter=ParameterEditBox
    begin object name=NewButton class=GUIButton
        Caption="?? ???"
        Hint="??? ??? ?????"
        WinTop=0.9139250
        WinLeft=0.0600470
        WinWidth=0.1582810
        TabOrder=1
        OnClick=NewButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MapVoteGameConfigPage.NewButton'
    b_New=NewButton
    begin object name=DeleteButton class=GUIButton
        Caption="????"
        MenuState=4
        Hint="??? ?? ??? ?????"
        WinTop=0.9139250
        WinLeft=0.2684030
        WinWidth=0.1595310
        TabOrder=2
        OnClick=DeleteButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MapVoteGameConfigPage.DeleteButton'
    b_Delete=DeleteButton
    begin object name=DefaultCheckBox class=moCheckBox
        ComponentWidth=0.20
        Caption="Default"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="?? ????? ??? ??? ??? ????? ??????"
        WinTop=0.8269490
        WinLeft=0.6598140
        WinWidth=0.1949220
        TabOrder=8
        OnChange=FieldChange
    object end
    // Reference: moCheckBox'MapVoteGameConfigPage.DefaultCheckBox'
    ch_Default=DefaultCheckBox
    SaveIndex=-1
    ListIndex=-1
    lmsgNew="?? ???"
    lmsgAdd="????"
    WindowName="?? ?? ? ??"
    DefaultLeft=0.0410150
    DefaultTop=0.031510
    DefaultWidth=0.9171870
    DefaultHeight=0.8850750
    OnOpen=InternalOnOpen
    WinTop=0.031510
    WinLeft=0.0410150
    WinWidth=0.9171870
    WinHeight=0.8850750
    bAcceptsInput=true
}