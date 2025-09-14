class MapVoteMapListConfigPage extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() automated GUIButton b_Return;
var() automated moCheckBox ch_UseMapList;
var() automated moEditBox ed_MapListPrefix;
var() automated MultiSelectListBox lb_MapList;
var localized string sbCaption;
var array<GameRecord> GameTypes;
var bool bChanged;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    Class'Engine.CacheManager'.static.GetGameTypeList(GameTypes);
    ch_UseMapList.SetComponentValue(string(Class'xVoting_Decompressed.DefaultMapListLoader'.default.bUseMapList));
    // End:0x6C
    if(Class'xVoting_Decompressed.DefaultMapListLoader'.default.bUseMapList)
    {
        DisableComponent(ed_MapListPrefix);
        EnableComponent(lb_MapList);        
    }
    else
    {
        EnableComponent(ed_MapListPrefix);
        DisableComponent(lb_MapList);
    }
    ed_MapListPrefix.SetComponentValue(Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapNamePrefixes);
    LoadMapLists();
    i = 0;
    J0xAC:

    // End:0xFE [Loop If]
    if(i < Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapListTypeList.Length)
    {
        lb_MapList.List.Find(Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapListTypeList[i], false, true);
        i++;
        // [Loop Continue]
        goto J0xAC;
    }
    sb_Main.SetPosition(0.0400000, 0.1466150, 0.5537890, 0.5070310);
    sb_Main.ManageComponent(lb_MapList);
    sb_Main.bFillClient = true;
    sb_Main.Caption = sbCaption;
    b_OK.__OnClick__Delegate = OkClick;
    bChanged = false;
    //return;    
}

function LoadMapLists()
{
    local int i;

    lb_MapList.List.Clear();
    i = 0;
    J0x1F:

    // End:0x7E [Loop If]
    if(i < GameTypes.Length)
    {
        lb_MapList.List.Add(GameTypes[i].GameName $ " MapList", none, GameTypes[i].MapListClassName);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function UseMapList_Change(GUIComponent Sender)
{
    bChanged = true;
    // End:0x35
    if(bool(ch_UseMapList.GetComponentValue()))
    {
        DisableComponent(ed_MapListPrefix);
        EnableComponent(lb_MapList);        
    }
    else
    {
        EnableComponent(ed_MapListPrefix);
        DisableComponent(lb_MapList);
    }
    //return;    
}

function MapListChange(GUIComponent Sender)
{
    bChanged = true;
    //return;    
}

function SaveChange()
{
    local int i;
    local string SelectedMapLists;
    local array<string> MapListArray;

    // End:0xE3
    if(bChanged)
    {
        SelectedMapLists = lb_MapList.List.GetExtra();
        Split(SelectedMapLists, ",", MapListArray);
        Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapListTypeList.Length = MapListArray.Length;
        i = 0;
        J0x53:

        // End:0x8D [Loop If]
        if(i < MapListArray.Length)
        {
            Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapListTypeList[i] = MapListArray[i];
            i++;
            // [Loop Continue]
            goto J0x53;
        }
        Class'xVoting_Decompressed.DefaultMapListLoader'.default.bUseMapList = bool(ch_UseMapList.GetComponentValue());
        Class'xVoting_Decompressed.DefaultMapListLoader'.default.MapNamePrefixes = ed_MapListPrefix.GetComponentValue();
        Class'xVoting_Decompressed.DefaultMapListLoader'.static.StaticSaveConfig();
        bChanged = false;
    }
    //return;    
}

function bool OkClick(GUIComponent Sender)
{
    SaveChange();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'xVoting_Decompressed.MapVoteMapListConfigPage.MapListCheckBox'
    begin object name="MapListCheckBox" class=XInterface.moCheckBox
        ComponentWidth=0.2000000
        Caption="? ??? ??? ????"
        OnCreateComponent=MapListCheckBox.InternalOnCreateComponent
        Hint="?? ? ???? ? ??? ????? ????? ??? ?????."
        WinTop=0.0875190
        WinLeft=0.2277920
        WinWidth=0.5435760
        WinHeight=0.0375000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MapVoteMapListConfigPage.UseMapList_Change
    end object
    ch_UseMapList=MapListCheckBox
    // Reference: moEditBox'xVoting_Decompressed.MapVoteMapListConfigPage.MapListLoaderPrefixEditBox'
    begin object name="MapListLoaderPrefixEditBox" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        ComponentWidth=0.6000000
        Caption="? ????"
        OnCreateComponent=MapListLoaderPrefixEditBox.InternalOnCreateComponent
        Hint="? ?? ???? ???. ?? ??? ?? ??? ???."
        WinTop=0.8121610
        WinLeft=0.1086710
        WinWidth=0.7873230
        WinHeight=0.0375000
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MapVoteMapListConfigPage.MapListChange
    end object
    ed_MapListPrefix=MapListLoaderPrefixEditBox
    // Reference: MultiSelectListBox'xVoting_Decompressed.MapVoteMapListConfigPage.MapListListBox'
    begin object name="MapListListBox" class=XInterface.MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=MapListListBox.InternalOnCreateComponent
        Hint="? ??? ??? ? ??? ??? ?????."
        WinTop=0.1466150
        WinLeft=0.0400000
        WinWidth=0.5537890
        WinHeight=0.5070310
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MapVoteMapListConfigPage.MapListChange
    end object
    lb_MapList=MapListListBox
    sbCaption="? ??? ???"
    WindowName="? ?? ??? ????"
    DefaultLeft=0.2000000
    DefaultTop=0.1000000
    DefaultWidth=0.6000000
    DefaultHeight=0.8000000
    WinTop=0.1000000
    WinLeft=0.2000000
    WinWidth=0.6000000
    WinHeight=0.8000000
    bAcceptsInput=false
}