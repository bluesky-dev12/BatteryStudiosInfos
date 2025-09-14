/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MainSP.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:18
 *
 *******************************************************************************/
class UT2K4Tab_MainSP extends UT2K4Tab_MainBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Selection;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Preview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Options;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground asb_Scroll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MapDesc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITreeListBox lb_Maps;
var() editconst noexport editinline GUITreeList li_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moButton b_Maplist;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moButton b_Tutorial;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapPreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_DescBack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_MapAuthor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_MapPlayers;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_NoPreview;
var() localized string MapCaption;
var() localized string BonusVehicles;
var() localized string BonusVehiclesMsg;
var string LastSelectedMap;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local array<MapRecord> TutMaps;

    super.InitComponent(MyController, myOwner);
    // End:0x2f
    if(lb_Maps != none)
    {
        li_Maps = lb_Maps.List;
    }
    // End:0x73
    if(li_Maps != none)
    {
        li_Maps.__OnDblClick__Delegate = MapListDblClick;
        li_Maps.bSorted = true;
        lb_Maps.__NotifyContextSelect__Delegate = HandleContextSelect;
    }
    class'CacheManager'.static.GetMapList(TutMaps, "TUT");
    TutorialMaps.Length = TutMaps.Length;
    i = 0;
    J0x9d:
    // End:0xd3 [While If]
    if(i < TutMaps.Length)
    {
        TutorialMaps[i] = TutMaps[i].MapName;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9d;
    }
    lb_Maps.bBoundToParent = false;
    lb_Maps.bScaleToParent = false;
    sb_Selection.ManageComponent(lb_Maps);
    asb_Scroll.ManageComponent(lb_MapDesc);
    // End:0x152
    if(CurrentGameType.GameTypeGroup == 3)
    {
        ch_OfficialMapsOnly.Checked(false);
        ch_OfficialMapsOnly.DisableMe();
    }
    // End:0x161
    else
    {
        ch_OfficialMapsOnly.EnableMe();
    }
    sb_Options.ManageComponent(ch_OfficialMapsOnly);
    sb_Options.ManageComponent(b_Maplist);
    sb_Options.ManageComponent(b_Tutorial);
    InitMapHandler();
}

function InitGameType()
{
    local int i;
    local array<GameRecord> Games;
    local bool bReloadMaps;

    class'CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x18:
    // End:0x8c [While If]
    if(i < Games.Length)
    {
        // End:0x82
        if(Games[i].ClassName ~= Controller.LastGameType)
        {
            bReloadMaps = CurrentGameType.MapPrefix != Games[i].MapPrefix;
            CurrentGameType = Games[i];
        }
        // End:0x8c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x18;
        }
    }
    // End:0x9e
    if(i == Games.Length)
    {
        return;
    }
    SetGameTypeCaption();
    CheckGameTutorial();
    // End:0xb9
    if(bReloadMaps)
    {
        InitMaps();
    }
    i = li_Maps.FindIndexByValue(LastSelectedMap);
    // End:0xe9
    if(i == -1)
    {
        i = 0;
    }
    li_Maps.SetIndex(i);
    li_Maps.Expand(i);
}

function bool OrigONSMap(string MapName)
{
    // End:0xec
    if(MapName ~= "ONS-ArcticStronghold" || MapName ~= "ONS-Crossfire" || MapName ~= "ONS-Dawn" || MapName ~= "ONS-Dria" || MapName ~= "ONS-FrostBite" || MapName ~= "ONS-Primeval" || MapName ~= "ONS-RedPlanet" || MapName ~= "ONS-Severance" || MapName ~= "ONS-Torlan")
    {
        return true;
    }
    return false;
}

function InitMaps(optional string MapPrefix)
{
    local int i, j, k, BV;
    local bool bTemp;
    local string Package, Item, CurrentItem, Desc;
    local GUITreeNode StoredItem;
    local DecoText dt;
    local array<string> CustomLinkSetups;

    // End:0x18
    if(MapPrefix == "")
    {
        MapPrefix = GetMapPrefix();
    }
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    // End:0x73
    if(li_Maps.IsValid())
    {
        li_Maps.GetElementAtIndex(li_Maps.Index, StoredItem);
    }
    class'CacheManager'.static.GetMapList(CacheMaps, MapPrefix);
    // End:0x52c
    if(MapHandler.GetAvailableMaps(MapHandler.GetGameIndex(CurrentGameType.ClassName), Maps))
    {
        li_Maps.bNotify = false;
        li_Maps.Clear();
        i = 0;
        J0xe0:
        // End:0x52c [While If]
        if(i < Maps.Length)
        {
            dt = none;
            // End:0x125
            if(class'CacheManager'.static.IsDefaultContent(Maps[i].MapName))
            {
                // End:0x122
                if(bOnlyShowCustom)
                {
                }
                // End:0x522
                else
                {
                    // This is an implied JumpToken;
                    goto J0x131;
                }
                // End:0x131
                if(bOnlyShowOfficial)
                {
                }
                // End:0x522
                else
                {
                    J0x131:
                    j = FindCacheRecordIndex(Maps[i].MapName);
                    // End:0x1e9
                    if(class'CacheManager'.static.Is2003Content(Maps[i].MapName))
                    {
                        // End:0x1ca
                        if(CacheMaps[j].TextName != "")
                        {
                            // End:0x1ca
                            if(!Divide(CacheMaps[j].TextName, ".", Package, Item))
                            {
                                Package = "XMaps";
                                Item = CacheMaps[j].TextName;
                            }
                        }
                        dt = class'wUtil'.static.LoadDecoText(Package, Item);
                    }
                    // End:0x214
                    if(dt != none)
                    {
                        Desc = JoinArray(dt.Rows, "|");
                    }
                    // End:0x22a
                    else
                    {
                        Desc = CacheMaps[j].Description;
                    }
                    li_Maps.AddItem(Maps[i].MapName, Maps[i].MapName,,, Desc);
                    // End:0x522
                    if(CurrentGameType.MapPrefix ~= "ONS")
                    {
                        CurrentItem = Maps[i].MapName;
                        BV = 0;
                        J0x291:
                        // End:0x522 [While If]
                        if(BV < 2)
                        {
                            // End:0x3b9
                            if(Maps[i].Options.Length > 0)
                            {
                                Package = CacheMaps[j].Description;
                                li_Maps.AddItem(AutoSelectText @ LinkText, Maps[i].MapName $ "?LinkSetup=Random", CurrentItem,, Package);
                                k = 0;
                                J0x31c:
                                // End:0x3b9 [While If]
                                if(k < Maps[i].Options.Length)
                                {
                                    li_Maps.AddItem(Maps[i].Options[k].Value @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ Maps[i].Options[k].Value, CurrentItem,, Package);
                                    ++ k;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x31c;
                                }
                            }
                            CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                            k = 0;
                            J0x3f5:
                            // End:0x46b [While If]
                            if(k < CustomLinkSetups.Length)
                            {
                                li_Maps.AddItem(CustomLinkSetups[k] @ LinkText, Maps[i].MapName $ "?" $ "LinkSetup=" $ CustomLinkSetups[k], CurrentItem,, Package);
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x3f5;
                            }
                            // End:0x48c
                            if(!OrigONSMap(Maps[i].MapName))
                            {
                                // This is an implied JumpToken;
                                goto J0x522;
                            }
                            // End:0x501
                            else
                            {
                                // End:0x501
                                if(BV < 1 && Controller.bECEEdition)
                                {
                                    li_Maps.AddItem(Maps[i].MapName $ BonusVehicles, Maps[i].MapName,,, BonusVehiclesMsg $ Package);
                                    CurrentItem = CurrentItem $ BonusVehicles;
                                }
                            }
                            // End:0x518
                            if(!Controller.bECEEdition)
                            {
                            }
                            // End:0x522
                            else
                            {
                                ++ BV;
                                // This is an implied JumpToken; Continue!
                                goto J0x291;
                            }
                        }
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xe0;
        }
    }
    // End:0x54d
    if(li_Maps.bSorted)
    {
        li_Maps.SortList();
    }
    // End:0x5b4
    if(StoredItem.Caption != "")
    {
        i = li_Maps.FindFullIndex(StoredItem.Caption, StoredItem.Value, StoredItem.ParentCaption);
        // End:0x5b4
        if(i != -1)
        {
            li_Maps.SilentSetIndex(i);
        }
    }
    li_Maps.bNotify = true;
    Controller.bCurMenuInitialized = bTemp;
}

function ReadMapInfo(string MapName)
{
    local string MDesc;
    local int Index;

    // End:0x0e
    if(MapName == "")
    {
        return;
    }
    // End:0x24
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    Index = FindCacheRecordIndex(MapName);
    // End:0x6e
    if(CacheMaps[Index].FriendlyName != "")
    {
        asb_Scroll.Caption = CacheMaps[Index].FriendlyName;
    }
    // End:0x82
    else
    {
        asb_Scroll.Caption = MapName;
    }
    UpdateScreenshot(Index);
    // End:0xdd
    if(CacheMaps[Index].PlayerCountMin == CacheMaps[Index].PlayerCountMax)
    {
        l_MapPlayers.Caption = string(CacheMaps[Index].PlayerCountMin) @ PlayerText;
    }
    // End:0x11e
    else
    {
        l_MapPlayers.Caption = string(CacheMaps[Index].PlayerCountMin) @ "-" @ string(CacheMaps[Index].PlayerCountMax) @ PlayerText;
    }
    MDesc = li_Maps.GetExtra();
    // End:0x14a
    if(MDesc == "")
    {
        MDesc = MessageNoInfo;
    }
    lb_MapDesc.SetContent(MDesc);
    // End:0x1c6
    if(CacheMaps[Index].Author != "" && !class'CacheManager'.static.IsDefaultContent(CacheMaps[Index].MapName))
    {
        l_MapAuthor.Caption = AuthorText $ ":" @ CacheMaps[Index].Author;
    }
    // End:0x1d7
    else
    {
        l_MapAuthor.Caption = "";
    }
}

function CheckGameTutorial()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x78 [While If]
    if(i < TutorialMaps.Length)
    {
        // End:0x6e
        if(Mid(TutorialMaps[i], InStr(TutorialMaps[i], "-") + 1) ~= CurrentGameType.GameAcronym)
        {
            EnableComponent(b_Tutorial);
            b_Tutorial.SetComponentValue(TutorialMaps[i], true);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    DisableComponent(b_Tutorial);
    b_Tutorial.SetComponentValue("", true);
}

function UpdateScreenshot(int Index)
{
    local Material Screenie;

    // End:0x43
    if(Index >= 0 && Index < CacheMaps.Length)
    {
        Screenie = Material(DynamicLoadObject(CacheMaps[Index].ScreenshotRef, class'Material'));
    }
    i_MapPreview.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapPreview.SetVisibility(Screenie != none);
}

event SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    // End:0x55
    if(bIsVisible)
    {
        l_NoPreview.SetVisibility(i_MapPreview.Image == none);
        i_MapPreview.SetVisibility(i_MapPreview.Image != none);
    }
}

function SetGameTypeCaption()
{
    sb_Selection.Caption = CurrentGameType.GameName @ MapCaption;
}

function string Play()
{
    return GetMapURL(li_Maps, -1);
}

function string GetMapURL(GUITreeList List, int Index)
{
    local string URL;

    URL = super.GetMapURL(List, Index);
    // End:0x69
    if(CurrentGameType.MapPrefix ~= "ONS" && InStr(Caps(URL), "?LINKSETUP=") == -1)
    {
        URL $= "?LinkSetup=Default";
    }
    // End:0xc4
    if(InStr(List.GetCaption(), BonusVehicles) >= 0 || InStr(List.GetParentCaption(), BonusVehicles) >= 0)
    {
        URL $= "?BonusVehicles=true";
    }
    // End:0xe3
    else
    {
        URL $= "?BonusVehicles=false";
    }
    return URL;
}

function MaplistConfigClick(GUIComponent Sender)
{
    local export editinline MaplistEditor MaplistPage;

    // End:0x8b
    if(Controller.OpenMenu(MaplistEditorMenu))
    {
        MaplistPage = MaplistEditor(Controller.ActivePage);
        // End:0x8b
        if(MaplistPage != none)
        {
            MaplistPage.MainPanel = self;
            MaplistPage.bOnlyShowOfficial = bOnlyShowOfficial;
            MaplistPage.bOnlyShowCustom = bOnlyShowCustom;
            MaplistPage.Initialize(MapHandler);
        }
    }
}

function bool MapListDblClick(GUIComponent Sender)
{
    // End:0x33
    if(li_Maps.ValidSelection())
    {
        return p_Anchor.InternalOnClick(p_Anchor.b_Primary);
    }
    // End:0x9f
    else
    {
        // End:0x8a
        if(CurrentGameType.MapPrefix ~= "ONS")
        {
            // End:0x87
            if(!li_Maps.IsToggleClick(li_Maps.Index))
            {
                return p_Anchor.InternalOnClick(p_Anchor.b_Primary);
            }
        }
        // End:0x9f
        else
        {
            return li_Maps.InternalDblClick(Sender);
        }
    }
    return true;
}

function TutorialClicked(GUIComponent Sender)
{
    // End:0x72
    if(Sender == b_Tutorial)
    {
        Play();
        PlayerOwner().ConsoleCommand("START" @ b_Tutorial.GetComponentValue() $ "?quickstart=true?TeamScreen=false");
        Controller.CloseAll(false, true);
    }
}

function MapListChange(GUIComponent Sender)
{
    local MapItem Item;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x93
    if(Sender == lb_Maps)
    {
        // End:0x4d
        if(li_Maps.IsValid())
        {
            EnableComponent(b_Primary);
            EnableComponent(b_Secondary);
        }
        class'MaplistRecord'.static.CreateMapItem(li_Maps.GetValue(), Item);
        LastSelectedMap = Item.FullURL;
        SaveConfig();
        ReadMapInfo(Item.MapName);
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x40
    if(moButton(Sender) != none && GUILabel(NewComp) != none)
    {
        moButton(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
}

function bool HandleContextSelect(GUIContextMenu Sender, int Index)
{
    local string MapName;

    // End:0xac
    if(Sender != none)
    {
        switch(Index)
        {
            // End:0x16
            case 0:
            // End:0x74
            case 1:
                MapName = GetMapURL(li_Maps, -1);
                // End:0x71
                if(MapName != "")
                {
                    p_Anchor.PrepareToPlay(MapName, MapName);
                    p_Anchor.StartGame(MapName, Index == 1);
                }
                // End:0xac
                break;
            // End:0xa9
            case 3:
                bOnlyShowOfficial = !bOnlyShowOfficial;
                InitMaps();
                ch_OfficialMapsOnly.SetComponentValue(string(bOnlyShowOfficial), true);
                // End:0xac
                break;
            // End:0xffff
            default:
            }
            return true;
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < CacheMaps.Length)
    {
        // End:0x37
        if(CacheMaps[i].MapName == MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

defaultproperties
{
    begin object name=SelectionGroup class=GUISectionBackground
        bFillClient=true
        Caption="? ??"
        WinTop=0.0181250
        WinLeft=0.0169930
        WinWidth=0.4821490
        WinHeight=0.603330
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MainSP.SelectionGroup'
    sb_Selection=SelectionGroup
    begin object name=PreviewGroup class=GUISectionBackground
        bFillClient=true
        Caption="????"
        WinTop=0.0181250
        WinLeft=0.5157430
        WinWidth=0.4708990
        WinHeight=0.9743050
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MainSP.PreviewGroup'
    sb_Preview=PreviewGroup
    begin object name=OptionsGroup class=GUISectionBackground
        Caption="??"
        BottomPadding=0.070
        WinTop=0.642580
        WinLeft=0.0180080
        WinWidth=0.4821490
        WinHeight=0.3517720
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MainSP.OptionsGroup'
    sb_Options=OptionsGroup
    begin object name=ScrollSection class=AltSectionBackground
        bFillClient=true
        Caption="? ??"
        WinTop=0.5252190
        WinLeft=0.5461180
        WinWidth=0.4098880
        WinHeight=0.4378140
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MainSP.ScrollSection'
    asb_Scroll=ScrollSection
    begin object name=MapDescription class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6284210
        WinLeft=0.5610650
        WinWidth=0.3799930
        WinHeight=0.268410
        bTabStop=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_MainSP.MapDescription'
    lb_MapDesc=MapDescription
    begin object name=AvailableMaps class=GUITreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ? ??? ?? ???? ???? ?????. ???? ??? ???? ??? ??? ??? ? ????."
        WinTop=0.1692720
        WinLeft=0.0456710
        WinWidth=0.4224810
        WinHeight=0.449870
        TabOrder=0
        OnChange=MapListChange
    object end
    // Reference: GUITreeListBox'UT2K4Tab_MainSP.AvailableMaps'
    lb_Maps=AvailableMaps
    begin object name=MaplistButton class=moButton
        ButtonCaption="???? ??"
        ComponentWidth=1.0
        OnCreateComponent=InternalOnCreateComponent
        Hint="?????? ??? ?? ?????."
        WinTop=0.8885870
        WinLeft=0.0392580
        WinWidth=0.3417970
        WinHeight=0.050
        TabOrder=2
        OnChange=MaplistConfigClick
    object end
    // Reference: moButton'UT2K4Tab_MainSP.MaplistButton'
    b_Maplist=MaplistButton
    begin object name=TutorialButton class=moButton
        ButtonCaption="?? ???? ??"
        ComponentWidth=1.0
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ?? ??? ????? ???."
        WinTop=0.9133260
        WinLeft=0.5569530
        WinWidth=0.3486330
        WinHeight=0.050
        TabOrder=3
        OnChange=TutorialClicked
    object end
    // Reference: moButton'UT2K4Tab_MainSP.TutorialButton'
    b_Tutorial=TutorialButton
    begin object name=MapPreviewImage class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.357480
        RenderWeight=0.20
    object end
    // Reference: GUIImage'UT2K4Tab_MainSP.MapPreviewImage'
    i_MapPreview=MapPreviewImage
    begin object name=MapAuthorLabel class=GUILabel
        Caption="????"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4052780
        WinLeft=0.5222650
        WinWidth=0.4532850
        WinHeight=0.0325520
        RenderWeight=0.30
    object end
    // Reference: GUILabel'UT2K4Tab_MainSP.MapAuthorLabel'
    l_MapAuthor=MapAuthorLabel
    begin object name=RecommendedPlayers class=GUILabel
        Caption="4~8??? ??? ??? ??? ???."
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4741660
        WinLeft=0.5212880
        WinWidth=0.4453130
        WinHeight=0.0325520
        RenderWeight=0.30
    object end
    // Reference: GUILabel'UT2K4Tab_MainSP.RecommendedPlayers'
    l_MapPlayers=RecommendedPlayers
    begin object name=NoPreview class=GUILabel
        Caption="????? ????."
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.357480
    object end
    // Reference: GUILabel'UT2K4Tab_MainSP.NoPreview'
    l_NoPreview=NoPreview
    MapCaption="?"
    BonusVehicles=" (Bonus Vehicles)"
    BonusVehiclesMsg="(Includes Bonus Vehicles)|"
    begin object name=FilterCheck class=moCheckBox
        CaptionWidth=0.10
        ComponentWidth=0.90
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ?? ??? ?????? ??? ??? ?????."
        WinTop=0.7728650
        WinLeft=0.0517580
        WinWidth=0.3417970
        WinHeight=0.0300350
        TabOrder=1
        OnChange=ChangeMapFilter
    object end
    // Reference: moCheckBox'UT2K4Tab_MainSP.FilterCheck'
    ch_OfficialMapsOnly=FilterCheck
}