/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteMapListConfigPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class MapVoteMapListConfigPage extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Return;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_UseMapList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_MapListPrefix;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MultiSelectListBox lb_MapList;
var localized string sbCaption;
var array<GameRecord> GameTypes;
var bool bChanged;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    class'CacheManager'.static.GetGameTypeList(GameTypes);
    ch_UseMapList.SetComponentValue(string(class'DefaultMapListLoader'.default.bUseMapList));
    // End:0x6c
    if(class'DefaultMapListLoader'.default.bUseMapList)
    {
        DisableComponent(ed_MapListPrefix);
        EnableComponent(lb_MapList);
    }
    // End:0x82
    else
    {
        EnableComponent(ed_MapListPrefix);
        DisableComponent(lb_MapList);
    }
    ed_MapListPrefix.SetComponentValue(class'DefaultMapListLoader'.default.MapNamePrefixes);
    LoadMapLists();
    i = 0;
    J0xac:
    // End:0xfe [While If]
    if(i < class'DefaultMapListLoader'.default.MapListTypeList.Length)
    {
        lb_MapList.List.Find(class'DefaultMapListLoader'.default.MapListTypeList[i], false, true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xac;
    }
    sb_Main.SetPosition(0.040, 0.1466150, 0.5537890, 0.5070310);
    sb_Main.ManageComponent(lb_MapList);
    sb_Main.bFillClient = true;
    sb_Main.Caption = sbCaption;
    b_OK.__OnClick__Delegate = OkClick;
    bChanged = false;
}

function LoadMapLists()
{
    local int i;

    lb_MapList.List.Clear();
    i = 0;
    J0x1f:
    // End:0x7e [While If]
    if(i < GameTypes.Length)
    {
        lb_MapList.List.Add(GameTypes[i].GameName $ " MapList", none, GameTypes[i].MapListClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
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
    // End:0x4b
    else
    {
        EnableComponent(ed_MapListPrefix);
        DisableComponent(lb_MapList);
    }
}

function MapListChange(GUIComponent Sender)
{
    bChanged = true;
}

function SaveChange()
{
    local int i;
    local string SelectedMapLists;
    local array<string> MapListArray;

    // End:0xe3
    if(bChanged)
    {
        SelectedMapLists = lb_MapList.List.GetExtra();
        Split(SelectedMapLists, ",", MapListArray);
        class'DefaultMapListLoader'.default.MapListTypeList.Length = MapListArray.Length;
        i = 0;
        J0x53:
        // End:0x8d [While If]
        if(i < MapListArray.Length)
        {
            class'DefaultMapListLoader'.default.MapListTypeList[i] = MapListArray[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x53;
        }
        class'DefaultMapListLoader'.default.bUseMapList = bool(ch_UseMapList.GetComponentValue());
        class'DefaultMapListLoader'.default.MapNamePrefixes = ed_MapListPrefix.GetComponentValue();
        class'DefaultMapListLoader'.static.StaticSaveConfig();
        bChanged = false;
    }
}

function bool OkClick(GUIComponent Sender)
{
    SaveChange();
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    begin object name=MapListCheckBox class=moCheckBox
        ComponentWidth=0.20
        Caption="? ??? ??? ????"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ? ???? ? ??? ????? ????? ??? ?????."
        WinTop=0.0875190
        WinLeft=0.2277920
        WinWidth=0.5435760
        WinHeight=0.03750
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UseMapList_Change
    object end
    // Reference: moCheckBox'MapVoteMapListConfigPage.MapListCheckBox'
    ch_UseMapList=MapListCheckBox
    begin object name=MapListLoaderPrefixEditBox class=moEditBox
        CaptionWidth=0.40
        ComponentWidth=0.60
        Caption="? ????"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ?? ???? ???. ?? ??? ?? ??? ???."
        WinTop=0.8121610
        WinLeft=0.1086710
        WinWidth=0.7873230
        WinHeight=0.03750
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MapListChange
    object end
    // Reference: moEditBox'MapVoteMapListConfigPage.MapListLoaderPrefixEditBox'
    ed_MapListPrefix=MapListLoaderPrefixEditBox
    begin object name=MapListListBox class=MultiSelectListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ??? ? ??? ??? ?????."
        WinTop=0.1466150
        WinLeft=0.040
        WinWidth=0.5537890
        WinHeight=0.5070310
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=MapListChange
    object end
    // Reference: MultiSelectListBox'MapVoteMapListConfigPage.MapListListBox'
    lb_MapList=MapListListBox
    sbCaption="? ??? ???"
    WindowName="? ?? ??? ????"
    DefaultLeft=0.20
    DefaultTop=0.10
    DefaultWidth=0.60
    DefaultHeight=0.80
    WinTop=0.10
    WinLeft=0.20
    WinWidth=0.60
    WinHeight=0.80
    bAcceptsInput=true
}