class MapVoteGameConfigPage extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_List;
var() automated GUISectionBackground sb_List2;
var() automated GUIListBox lb_GameConfigList;
var() automated moComboBox co_GameClass;
var() automated moEditBox ed_GameTitle;
var() automated moEditBox ed_Acronym;
var() automated moEditBox ed_Prefix;
var() automated MultiSelectListBox lb_Mutator;
var() automated moEditBox ed_Parameter;
var() automated GUIButton b_New;
var() automated GUIButton b_Delete;
var() automated moCheckBox ch_Default;
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

    // End:0x73 [Loop If]
    if(i < Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig.Length)
    {
        lb_GameConfigList.List.Add(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].GameName, none, string(i));
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    // End:0x9B
    if(lb_GameConfigList.List.ItemCount == 0)
    {
        DisableComponent(b_Delete);
    }
    Class'Engine.CacheManager'.static.GetGameTypeList(GameTypes);
    i = 0;
    J0xB3:

    // End:0xFD [Loop If]
    if(i < GameTypes.Length)
    {
        co_GameClass.AddItem(GameTypes[i].GameName, none, GameTypes[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0xB3;
    }
    Class'Engine.CacheManager'.static.GetMutatorList(Mutators);
    LoadMutators();
    sb_Main.SetPosition(0.4833590, 0.0646780, 0.4512500, 0.7169910);
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
    sb_Main.TopPadding = 0.0000000;
    sb_Main.BottomPadding = 0.4000000;
    sb_Main.Caption = "Options";
    sb_List.ManageComponent(lb_GameConfigList);
    sb_List.LeftPadding = 0.0050000;
    sb_List.RightPadding = 0.0050000;
    sb_Main.ManageComponent(ch_Default);
    sb_Main.ManageComponent(co_GameClass);
    sb_Main.ManageComponent(ed_GameTitle);
    sb_Main.ManageComponent(ed_Acronym);
    sb_Main.ManageComponent(ed_Prefix);
    sb_Main.ManageComponent(ed_Parameter);
    sb_List2.ManageComponent(lb_Mutator);
    // End:0x36E
    if(lb_GameConfigList.List.ItemCount == 0)
    {
        DisableComponent(b_Delete);        
    }
    else
    {
        lb_GameConfigList.List.SetIndex(0);
    }
    //return;    
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
    //return;    
}

function InternalOnOpen()
{
    lb_GameConfigList.List.SetIndex(0);
    //return;    
}

function LoadMutators()
{
    local int i;

    lb_Mutator.List.Clear();
    i = 0;
    J0x1F:

    // End:0x72 [Loop If]
    if(i < Mutators.Length)
    {
        lb_Mutator.List.Add(Mutators[i].FriendlyName, none, Mutators[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function GameConfigList_Changed(GUIComponent Sender)
{
    local int i;
    local array<string> MutatorArray;

    // End:0x42
    if((lb_GameConfigList.List.ItemCount == 0) || lb_GameConfigList.List.Index == ListIndex)
    {
        return;
    }
    SaveChange();
    SaveIndex = int(lb_GameConfigList.List.GetExtra());
    ListIndex = lb_GameConfigList.List.Index;
    LoadMutators();
    co_GameClass.Find(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].GameClass, true, true);
    ed_GameTitle.SetComponentValue(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].GameName, true);
    ed_Acronym.SetComponentValue(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].Acronym, true);
    ed_Prefix.SetComponentValue(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].Prefix, true);
    ed_Parameter.SetComponentValue(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].Options, true);
    ch_Default.SetComponentValue(string(Class'xVoting_Decompressed.xVotingHandler'.default.DefaultGameConfig == SaveIndex), true);
    Split(Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[SaveIndex].Mutators, ",", MutatorArray);
    i = 0;
    J0x1AB:

    // End:0x1EB [Loop If]
    if(i < MutatorArray.Length)
    {
        lb_Mutator.List.Find(MutatorArray[i], false, true);
        i++;
        // [Loop Continue]
        goto J0x1AB;
    }
    bChanged = false;
    //return;    
}

function int GameIndex()
{
    local string GameClass;
    local int i;

    GameClass = co_GameClass.GetExtra();
    i = 0;
    J0x1C:

    // End:0x56 [Loop If]
    if(i < GameTypes.Length)
    {
        // End:0x4C
        if(GameTypes[i].ClassName == GameClass)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    return -1;
    //return;    
}

function FieldChange(GUIComponent Sender)
{
    local int i, j;

    bChanged = true;
    // End:0xF8
    if(Sender == co_GameClass)
    {
        i = GameIndex();
        j = 0;
        J0x2A:

        // End:0xB5 [Loop If]
        if(j < GameTypes.Length)
        {
            // End:0xAB
            if(GameTypes[j].GameName == ed_GameTitle.GetText())
            {
                ed_GameTitle.SetComponentValue(GameTypes[i].GameName, true);
                lb_GameConfigList.List.SetItemAtIndex(ListIndex, GameTypes[i].GameName);
            }
            j++;
            // [Loop Continue]
            goto J0x2A;
        }
        ed_Acronym.SetComponentValue(GameTypes[i].GameAcronym, true);
        ed_Prefix.SetComponentValue(GameTypes[i].MapPrefix, true);        
    }
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
    //return;    
}

function bool SaveChange()
{
    local int i;

    // End:0x0D
    if(!bChanged)
    {
        return true;
    }
    // End:0x1B5
    if(SaveIndex == -1)
    {
        i = Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig.Length;
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig.Length = i + 1;
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].GameClass = co_GameClass.GetExtra();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].GameName = ed_GameTitle.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Acronym = ed_Acronym.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Prefix = ed_Prefix.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Options = ed_Parameter.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Mutators = lb_Mutator.List.GetExtra();
        // End:0x170
        if(bool(ch_Default.GetComponentValue()))
        {
            Class'xVoting_Decompressed.xVotingHandler'.default.DefaultGameConfig = i;
        }
        Class'xVoting_Decompressed.xVotingHandler'.static.StaticSaveConfig();
        SaveIndex = i;
        lb_GameConfigList.List.SetExtraAtIndex(ListIndex, "" $ string(SaveIndex));        
    }
    else
    {
        i = SaveIndex;
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].GameClass = co_GameClass.GetExtra();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].GameName = ed_GameTitle.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Acronym = ed_Acronym.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Prefix = ed_Prefix.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Options = ed_Parameter.GetComponentValue();
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig[i].Mutators = lb_Mutator.List.GetExtra();
        // End:0x2E7
        if(bool(ch_Default.GetComponentValue()))
        {
            Class'xVoting_Decompressed.xVotingHandler'.default.DefaultGameConfig = i;
        }
        Class'xVoting_Decompressed.xVotingHandler'.static.StaticSaveConfig();
    }
    bChanged = false;
    return true;
    //return;    
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
    //return;    
}

function bool DeleteButtonClick(GUIComponent Sender)
{
    local int i, X;

    // End:0x2F
    if(SaveIndex >= 0)
    {
        Class'xVoting_Decompressed.xVotingHandler'.default.GameConfig.Remove(SaveIndex, 1);
        Class'xVoting_Decompressed.xVotingHandler'.static.StaticSaveConfig();
    }
    // End:0xE9
    if(ListIndex >= 0)
    {
        i = 0;
        J0x41:

        // End:0xCB [Loop If]
        if(i < lb_GameConfigList.List.ItemCount)
        {
            X = int(lb_GameConfigList.List.GetExtraAtIndex(i));
            // End:0xC1
            if(X > SaveIndex)
            {
                lb_GameConfigList.List.SetExtraAtIndex(i, "" $ string(X - 1));
            }
            i++;
            // [Loop Continue]
            goto J0x41;
        }
        lb_GameConfigList.List.Remove(ListIndex, 1);
    }
    SaveIndex = -1;
    ListIndex = -1;
    // End:0x1F2
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
    else
    {
        lb_GameConfigList.List.SetIndex(0);
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'xVoting_Decompressed.MapVoteGameConfigPage.SBList'
    begin object name="SBList" class=GUI2K4.AltSectionBackground
        bFillClient=true
        Caption="????"
        WinTop=0.0442720
        WinLeft=0.0429690
        WinWidth=0.3779290
        WinHeight=0.7539070
        OnPreDraw=SBList.InternalPreDraw
    end object
    sb_List=SBList
    // Reference: AltSectionBackground'xVoting_Decompressed.MapVoteGameConfigPage.SBList2'
    begin object name="SBList2" class=GUI2K4.AltSectionBackground
        Caption="????"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        TopPadding=0.1000000
        BottomPadding=0.1000000
        WinTop=0.5401590
        WinLeft=0.4833590
        WinWidth=0.4512500
        WinHeight=0.2958990
        RenderWeight=0.4900000
        OnPreDraw=SBList2.InternalPreDraw
    end object
    sb_List2=SBList2
    // Reference: GUIListBox'xVoting_Decompressed.MapVoteGameConfigPage.GameConfigListBox'
    begin object name="GameConfigListBox" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=GameConfigListBox.InternalOnCreateComponent
        Hint="?????? ??? ????? ?????."
        WinTop=0.1607750
        WinLeft=0.6267580
        WinWidth=0.3440870
        WinHeight=0.7277590
        TabOrder=0
    end object
    lb_GameConfigList=GameConfigListBox
    // Reference: moComboBox'xVoting_Decompressed.MapVoteGameConfigPage.GameClassComboBox'
    begin object name="GameClassComboBox" class=XInterface.moComboBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="?? ???"
        OnCreateComponent=GameClassComboBox.InternalOnCreateComponent
        MenuState=4
        Hint="??? ????? ?? ?? ??? ????."
        WinTop=0.1361350
        WinLeft=0.0289550
        WinWidth=0.5929700
        WinHeight=0.0768550
        TabOrder=4
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    co_GameClass=GameClassComboBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteGameConfigPage.GameTitleEditBox'
    begin object name="GameTitleEditBox" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="?? ???"
        OnCreateComponent=GameTitleEditBox.InternalOnCreateComponent
        MenuState=4
        Hint="??? ?? ??? ??? ????."
        WinTop=0.2238440
        WinLeft=0.0289550
        WinWidth=0.5929700
        WinHeight=0.0742490
        TabOrder=3
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    ed_GameTitle=GameTitleEditBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteGameConfigPage.AcronymEditBox'
    begin object name="AcronymEditBox" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="??"
        OnCreateComponent=AcronymEditBox.InternalOnCreateComponent
        MenuState=4
        Hint="????? ???? ???, ??, ??? ?????. ?? ???? ? ??? ????."
        WinTop=0.3063430
        WinLeft=0.0289550
        WinWidth=0.5929700
        WinHeight=0.0768550
        TabOrder=5
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    ed_Acronym=AcronymEditBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteGameConfigPage.PrefixEditBox'
    begin object name="PrefixEditBox" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="? ????"
        OnCreateComponent=PrefixEditBox.InternalOnCreateComponent
        MenuState=4
        Hint="? ?? ???? ???. ??? ?????."
        WinTop=0.3931850
        WinLeft=0.0289550
        WinWidth=0.5929700
        WinHeight=0.0742490
        TabOrder=6
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    ed_Prefix=PrefixEditBox
    // Reference: MultiSelectListBox'xVoting_Decompressed.MapVoteGameConfigPage.MutatorListBox'
    begin object name="MutatorListBox" class=XInterface.MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=MutatorListBox.InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ????? ?????."
        WinTop=0.4843690
        WinLeft=0.2242670
        WinWidth=0.3964850
        WinHeight=0.3152340
        TabOrder=9
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    lb_Mutator=MutatorListBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteGameConfigPage.ParameterEditBox'
    begin object name="ParameterEditBox" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="????"
        OnCreateComponent=ParameterEditBox.InternalOnCreateComponent
        MenuState=4
        Hint="??? ?? ?? ????? (??)???. ??? ?????(?: ????=4, ?? ????=4)"
        WinTop=0.8269490
        WinLeft=0.0777830
        WinWidth=0.4904310
        TabOrder=7
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    ed_Parameter=ParameterEditBox
    // Reference: GUIButton'xVoting_Decompressed.MapVoteGameConfigPage.newButton'
    begin object name="newButton" class=XInterface.GUIButton
        Caption="?? ???"
        Hint="??? ??? ?????"
        WinTop=0.9139250
        WinLeft=0.0600470
        WinWidth=0.1582810
        TabOrder=1
        OnClick=MapVoteGameConfigPage.NewButtonClick
        OnKeyEvent=newButton.InternalOnKeyEvent
    end object
    b_New=newButton
    // Reference: GUIButton'xVoting_Decompressed.MapVoteGameConfigPage.DeleteButton'
    begin object name="DeleteButton" class=XInterface.GUIButton
        Caption="????"
        MenuState=4
        Hint="??? ?? ??? ?????"
        WinTop=0.9139250
        WinLeft=0.2684030
        WinWidth=0.1595310
        TabOrder=2
        OnClick=MapVoteGameConfigPage.DeleteButtonClick
        OnKeyEvent=DeleteButton.InternalOnKeyEvent
    end object
    b_Delete=DeleteButton
    // Reference: moCheckBox'xVoting_Decompressed.MapVoteGameConfigPage.DefaultCheckBox'
    begin object name="DefaultCheckBox" class=XInterface.moCheckBox
        ComponentWidth=0.2000000
        Caption="Default"
        OnCreateComponent=DefaultCheckBox.InternalOnCreateComponent
        MenuState=4
        Hint="?? ????? ??? ??? ??? ????? ??????"
        WinTop=0.8269490
        WinLeft=0.6598140
        WinWidth=0.1949220
        TabOrder=8
        OnChange=MapVoteGameConfigPage.FieldChange
    end object
    ch_Default=DefaultCheckBox
    SaveIndex=-1
    ListIndex=-1
    lmsgNew="?? ???"
    lmsgAdd="????"
    WindowName="?? ?? ? ??"
    DefaultLeft=0.0410150
    DefaultTop=0.0315100
    DefaultWidth=0.9171870
    DefaultHeight=0.8850750
    OnOpen=MapVoteGameConfigPage.InternalOnOpen
    WinTop=0.0315100
    WinLeft=0.0410150
    WinWidth=0.9171870
    WinHeight=0.8850750
    bAcceptsInput=false
}