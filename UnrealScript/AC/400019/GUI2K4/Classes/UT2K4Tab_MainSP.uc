class UT2K4Tab_MainSP extends UT2K4Tab_MainBase
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Selection;
var() automated GUISectionBackground sb_Preview;
var() automated GUISectionBackground sb_Options;
var() automated AltSectionBackground asb_Scroll;
var() automated GUIScrollTextBox lb_MapDesc;
var() automated GUITreeListBox lb_Maps;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITreeList li_Maps;
var() automated moButton b_Maplist;
var() automated moButton b_Tutorial;
var() automated GUIImage i_MapPreview;
var() automated GUIImage i_DescBack;
var() automated GUILabel l_MapAuthor;
var() automated GUILabel l_MapPlayers;
var() automated GUILabel l_NoPreview;
var() localized string MapCaption;
var() localized string BonusVehicles;
var() localized string BonusVehiclesMsg;
var string LastSelectedMap;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local array<MapRecord> TutMaps;

    super.InitComponent(MyController, myOwner);
    // End:0x2F
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
    Class'Engine.CacheManager'.static.GetMapList(TutMaps, "TUT");
    TutorialMaps.Length = TutMaps.Length;
    i = 0;
    J0x9D:

    // End:0xD3 [Loop If]
    if(i < TutMaps.Length)
    {
        TutorialMaps[i] = TutMaps[i].MapName;
        i++;
        // [Loop Continue]
        goto J0x9D;
    }
    lb_Maps.bBoundToParent = false;
    lb_Maps.bScaleToParent = false;
    sb_Selection.ManageComponent(lb_Maps);
    asb_Scroll.ManageComponent(lb_MapDesc);
    // End:0x152
    if(int(CurrentGameType.GameTypeGroup) == 3)
    {
        ch_OfficialMapsOnly.Checked(false);
        ch_OfficialMapsOnly.DisableMe();        
    }
    else
    {
        ch_OfficialMapsOnly.EnableMe();
    }
    sb_Options.ManageComponent(ch_OfficialMapsOnly);
    sb_Options.ManageComponent(b_Maplist);
    sb_Options.ManageComponent(b_Tutorial);
    InitMapHandler();
    //return;    
}

function InitGameType()
{
    local int i;
    local array<GameRecord> Games;
    local bool bReloadMaps;

    Class'Engine.CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x18:

    // End:0x8C [Loop If]
    if(i < Games.Length)
    {
        // End:0x82
        if(Games[i].ClassName ~= Controller.LastGameType)
        {
            bReloadMaps = CurrentGameType.MapPrefix != Games[i].MapPrefix;
            CurrentGameType = Games[i];
            // [Explicit Break]
            goto J0x8C;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    J0x8C:

    // End:0x9E
    if(i == Games.Length)
    {
        return;
    }
    SetGameTypeCaption();
    CheckGameTutorial();
    // End:0xB9
    if(bReloadMaps)
    {
        InitMaps();
    }
    i = li_Maps.FindIndexByValue(LastSelectedMap);
    // End:0xE9
    if(i == -1)
    {
        i = 0;
    }
    li_Maps.SetIndex(i);
    li_Maps.Expand(i);
    //return;    
}

function bool OrigONSMap(string MapName)
{
    // End:0xEC
    if(((((((((MapName ~= "ONS-ArcticStronghold") || MapName ~= "ONS-Crossfire") || MapName ~= "ONS-Dawn") || MapName ~= "ONS-Dria") || MapName ~= "ONS-FrostBite") || MapName ~= "ONS-Primeval") || MapName ~= "ONS-RedPlanet") || MapName ~= "ONS-Severance") || MapName ~= "ONS-Torlan")
    {
        return true;
    }
    return false;
    //return;    
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
    Class'Engine.CacheManager'.static.GetMapList(CacheMaps, MapPrefix);
    // End:0x52C
    if(MapHandler.GetAvailableMaps(MapHandler.GetGameIndex(CurrentGameType.ClassName), Maps))
    {
        li_Maps.bNotify = false;
        li_Maps.Clear();
        i = 0;
        J0xE0:

        // End:0x52C [Loop If]
        if(i < Maps.Length)
        {
            dt = none;
            // End:0x125
            if(Class'Engine.CacheManager'.static.IsDefaultContent(Maps[i].MapName))
            {
                // End:0x122
                if(bOnlyShowCustom)
                {
                    // [Explicit Continue]
                    goto J0x522;
                }                
            }
            else
            {
                // End:0x131
                if(bOnlyShowOfficial)
                {
                    // [Explicit Continue]
                    goto J0x522;
                }
            }
            j = FindCacheRecordIndex(Maps[i].MapName);
            // End:0x1E9
            if(Class'Engine.CacheManager'.static.Is2003Content(Maps[i].MapName))
            {
                // End:0x1CA
                if(CacheMaps[j].TextName != "")
                {
                    // End:0x1CA
                    if(!Divide(CacheMaps[j].TextName, ".", Package, Item))
                    {
                        Package = "XMaps";
                        Item = CacheMaps[j].TextName;
                    }
                }
                dt = Class'WGame.wUtil'.static.LoadDecoText(Package, Item);
            }
            // End:0x214
            if(dt != none)
            {
                Desc = JoinArray(dt.Rows, "|");                
            }
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

                // End:0x522 [Loop If]
                if(BV < 2)
                {
                    // End:0x3B9
                    if(Maps[i].Options.Length > 0)
                    {
                        Package = CacheMaps[j].Description;
                        li_Maps.AddItem(AutoSelectText @ LinkText, Maps[i].MapName $ "?LinkSetup=Random", CurrentItem,, Package);
                        k = 0;
                        J0x31C:

                        // End:0x3B9 [Loop If]
                        if(k < Maps[i].Options.Length)
                        {
                            li_Maps.AddItem(Maps[i].Options[k].Value @ LinkText, (Maps[i].MapName $ "?LinkSetup=") $ Maps[i].Options[k].Value, CurrentItem,, Package);
                            k++;
                            // [Loop Continue]
                            goto J0x31C;
                        }
                    }
                    CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                    k = 0;
                    J0x3F5:

                    // End:0x46B [Loop If]
                    if(k < CustomLinkSetups.Length)
                    {
                        li_Maps.AddItem(CustomLinkSetups[k] @ LinkText, ((Maps[i].MapName $ "?") $ "LinkSetup=") $ CustomLinkSetups[k], CurrentItem,, Package);
                        k++;
                        // [Loop Continue]
                        goto J0x3F5;
                    }
                    // End:0x48C
                    if(!OrigONSMap(Maps[i].MapName))
                    {
                        // [Explicit Break]
                        goto J0x522;                        
                    }
                    else
                    {
                        // End:0x501
                        if((BV < 1) && Controller.bECEEdition)
                        {
                            li_Maps.AddItem(Maps[i].MapName $ BonusVehicles, Maps[i].MapName,,, BonusVehiclesMsg $ Package);
                            CurrentItem = CurrentItem $ BonusVehicles;
                        }
                    }
                    // End:0x518
                    if(!Controller.bECEEdition)
                    {
                        // [Explicit Break]
                        goto J0x522;
                    }
                    BV++;
                    // [Loop Continue]
                    goto J0x291;
                }
            }
            J0x522:

            i++;
            // [Loop Continue]
            goto J0xE0;
        }
    }
    // End:0x54D
    if(li_Maps.bSorted)
    {
        li_Maps.SortList();
    }
    // End:0x5B4
    if(StoredItem.Caption != "")
    {
        i = li_Maps.FindFullIndex(StoredItem.Caption, StoredItem.Value, StoredItem.ParentCaption);
        // End:0x5B4
        if(i != -1)
        {
            li_Maps.SilentSetIndex(i);
        }
    }
    li_Maps.bNotify = true;
    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function ReadMapInfo(string MapName)
{
    local string MDesc;
    local int Index;

    // End:0x0E
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
    // End:0x6E
    if(CacheMaps[Index].FriendlyName != "")
    {
        asb_Scroll.Caption = CacheMaps[Index].FriendlyName;        
    }
    else
    {
        asb_Scroll.Caption = MapName;
    }
    UpdateScreenshot(Index);
    // End:0xDD
    if(CacheMaps[Index].PlayerCountMin == CacheMaps[Index].PlayerCountMax)
    {
        l_MapPlayers.Caption = string(CacheMaps[Index].PlayerCountMin) @ PlayerText;        
    }
    else
    {
        l_MapPlayers.Caption = ((string(CacheMaps[Index].PlayerCountMin) @ "-") @ string(CacheMaps[Index].PlayerCountMax)) @ PlayerText;
    }
    MDesc = li_Maps.GetExtra();
    // End:0x14A
    if(MDesc == "")
    {
        MDesc = MessageNoInfo;
    }
    lb_MapDesc.SetContent(MDesc);
    // End:0x1C6
    if((CacheMaps[Index].Author != "") && !Class'Engine.CacheManager'.static.IsDefaultContent(CacheMaps[Index].MapName))
    {
        l_MapAuthor.Caption = (AuthorText $ ":") @ CacheMaps[Index].Author;        
    }
    else
    {
        l_MapAuthor.Caption = "";
    }
    //return;    
}

function CheckGameTutorial()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x78 [Loop If]
    if(i < TutorialMaps.Length)
    {
        // End:0x6E
        if(Mid(TutorialMaps[i], InStr(TutorialMaps[i], "-") + 1) ~= CurrentGameType.GameAcronym)
        {
            EnableComponent(b_Tutorial);
            b_Tutorial.SetComponentValue(TutorialMaps[i], true);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    DisableComponent(b_Tutorial);
    b_Tutorial.SetComponentValue("", true);
    //return;    
}

function UpdateScreenshot(int Index)
{
    local Material Screenie;

    // End:0x43
    if((Index >= 0) && Index < CacheMaps.Length)
    {
        Screenie = Material(DynamicLoadObject(CacheMaps[Index].ScreenshotRef, Class'Engine.Material'));
    }
    i_MapPreview.Image = Screenie;
    l_NoPreview.SetVisibility(Screenie == none);
    i_MapPreview.SetVisibility(Screenie != none);
    //return;    
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
    //return;    
}

function SetGameTypeCaption()
{
    sb_Selection.Caption = CurrentGameType.GameName @ MapCaption;
    //return;    
}

function string Play()
{
    return GetMapURL(li_Maps, -1);
    //return;    
}

function string GetMapURL(GUITreeList List, int Index)
{
    local string URL;

    URL = super.GetMapURL(List, Index);
    // End:0x69
    if((CurrentGameType.MapPrefix ~= "ONS") && InStr(Caps(URL), "?LINKSETUP=") == -1)
    {
        URL $= "?LinkSetup=Default";
    }
    // End:0xC4
    if((InStr(List.GetCaption(), BonusVehicles) >= 0) || InStr(List.GetParentCaption(), BonusVehicles) >= 0)
    {
        URL $= "?BonusVehicles=true";        
    }
    else
    {
        URL $= "?BonusVehicles=false";
    }
    return URL;
    //return;    
}

function MaplistConfigClick(GUIComponent Sender)
{
    local export editinline MaplistEditor MaplistPage;

    // End:0x8B
    if(Controller.OpenMenu(MaplistEditorMenu))
    {
        MaplistPage = MaplistEditor(Controller.ActivePage);
        // End:0x8B
        if(MaplistPage != none)
        {
            MaplistPage.MainPanel = self;
            MaplistPage.bOnlyShowOfficial = bOnlyShowOfficial;
            MaplistPage.bOnlyShowCustom = bOnlyShowCustom;
            MaplistPage.Initialize(MapHandler);
        }
    }
    //return;    
}

function bool MapListDblClick(GUIComponent Sender)
{
    // End:0x33
    if(li_Maps.ValidSelection())
    {
        return p_Anchor.InternalOnClick(p_Anchor.b_Primary);        
    }
    else
    {
        // End:0x8A
        if(CurrentGameType.MapPrefix ~= "ONS")
        {
            // End:0x87
            if(!li_Maps.IsToggleClick(li_Maps.Index))
            {
                return p_Anchor.InternalOnClick(p_Anchor.b_Primary);
            }            
        }
        else
        {
            return li_Maps.InternalDblClick(Sender);
        }
    }
    return true;
    //return;    
}

function TutorialClicked(GUIComponent Sender)
{
    // End:0x72
    if(Sender == b_Tutorial)
    {
        Play();
        PlayerOwner().ConsoleCommand(("START" @ b_Tutorial.GetComponentValue()) $ "?quickstart=true?TeamScreen=false");
        Controller.CloseAll(false, true);
    }
    //return;    
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
        // End:0x4D
        if(li_Maps.IsValid())
        {
            EnableComponent(b_Primary);
            EnableComponent(b_Secondary);
        }
        Class'Engine.MaplistRecord'.static.CreateMapItem(li_Maps.GetValue(), Item);
        LastSelectedMap = Item.FullURL;
        SaveConfig();
        ReadMapInfo(Item.MapName);
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x40
    if((moButton(Sender) != none) && GUILabel(NewComp) != none)
    {
        moButton(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

function bool HandleContextSelect(GUIContextMenu Sender, int Index)
{
    local string MapName;

    // End:0xAC
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
                // End:0xAC
                break;
            // End:0xA9
            case 3:
                bOnlyShowOfficial = !bOnlyShowOfficial;
                InitMaps();
                ch_OfficialMapsOnly.SetComponentValue(string(bOnlyShowOfficial), true);
                // End:0xAC
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return true;
        //return;        
    }
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < CacheMaps.Length)
    {
        // End:0x37
        if(CacheMaps[i].MapName == MapName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MainSP.SelectionGroup'
    begin object name="SelectionGroup" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="? ??"
        WinTop=0.0181250
        WinLeft=0.0169930
        WinWidth=0.4821490
        WinHeight=0.6033300
        OnPreDraw=SelectionGroup.InternalPreDraw
    end object
    sb_Selection=SelectionGroup
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MainSP.PreviewGroup'
    begin object name="PreviewGroup" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="????"
        WinTop=0.0181250
        WinLeft=0.5157430
        WinWidth=0.4708990
        WinHeight=0.9743050
        OnPreDraw=PreviewGroup.InternalPreDraw
    end object
    sb_Preview=PreviewGroup
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MainSP.OptionsGroup'
    begin object name="OptionsGroup" class=XInterface.GUISectionBackground
        Caption="??"
        BottomPadding=0.0700000
        WinTop=0.6425800
        WinLeft=0.0180080
        WinWidth=0.4821490
        WinHeight=0.3517720
        OnPreDraw=OptionsGroup.InternalPreDraw
    end object
    sb_Options=OptionsGroup
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MainSP.ScrollSection'
    begin object name="ScrollSection" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="? ??"
        WinTop=0.5252190
        WinLeft=0.5461180
        WinWidth=0.4098880
        WinHeight=0.4378140
        OnPreDraw=ScrollSection.InternalPreDraw
    end object
    asb_Scroll=ScrollSection
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_MainSP.MapDescription'
    begin object name="MapDescription" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=MapDescription.InternalOnCreateComponent
        WinTop=0.6284210
        WinLeft=0.5610650
        WinWidth=0.3799930
        WinHeight=0.2684100
        bTabStop=false
        bNeverFocus=true
    end object
    lb_MapDesc=MapDescription
    // Reference: GUITreeListBox'GUI2K4_Decompressed.UT2K4Tab_MainSP.AvailableMaps'
    begin object name="AvailableMaps" class=XInterface.GUITreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=AvailableMaps.InternalOnCreateComponent
        Hint="????? ? ??? ?? ???? ???? ?????. ???? ??? ???? ??? ??? ??? ? ????."
        WinTop=0.1692720
        WinLeft=0.0456710
        WinWidth=0.4224810
        WinHeight=0.4498700
        TabOrder=0
        OnChange=UT2K4Tab_MainSP.MapListChange
    end object
    lb_Maps=AvailableMaps
    // Reference: moButton'GUI2K4_Decompressed.UT2K4Tab_MainSP.MaplistButton'
    begin object name="MaplistButton" class=XInterface.moButton
        ButtonCaption="???? ??"
        ComponentWidth=1.0000000
        OnCreateComponent=MaplistButton.InternalOnCreateComponent
        Hint="?????? ??? ?? ?????."
        WinTop=0.8885870
        WinLeft=0.0392580
        WinWidth=0.3417970
        WinHeight=0.0500000
        TabOrder=2
        OnChange=UT2K4Tab_MainSP.MaplistConfigClick
    end object
    b_Maplist=MaplistButton
    // Reference: moButton'GUI2K4_Decompressed.UT2K4Tab_MainSP.TutorialButton'
    begin object name="TutorialButton" class=XInterface.moButton
        ButtonCaption="?? ???? ??"
        ComponentWidth=1.0000000
        OnCreateComponent=TutorialButton.InternalOnCreateComponent
        Hint="? ?? ??? ????? ???."
        WinTop=0.9133260
        WinLeft=0.5569530
        WinWidth=0.3486330
        WinHeight=0.0500000
        TabOrder=3
        OnChange=UT2K4Tab_MainSP.TutorialClicked
    end object
    b_Tutorial=TutorialButton
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_MainSP.MapPreviewImage'
    begin object name="MapPreviewImage" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.3574800
        RenderWeight=0.2000000
    end object
    i_MapPreview=MapPreviewImage
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_MainSP.MapAuthorLabel'
    begin object name="MapAuthorLabel" class=XInterface.GUILabel
        Caption="????"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4052780
        WinLeft=0.5222650
        WinWidth=0.4532850
        WinHeight=0.0325520
        RenderWeight=0.3000000
    end object
    l_MapAuthor=MapAuthorLabel
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_MainSP.RecommendedPlayers'
    begin object name="RecommendedPlayers" class=XInterface.GUILabel
        Caption="4~8??? ??? ??? ??? ???."
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4741660
        WinLeft=0.5212880
        WinWidth=0.4453130
        WinHeight=0.0325520
        RenderWeight=0.3000000
    end object
    l_MapPlayers=RecommendedPlayers
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_MainSP.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="????? ????."
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.1076910
        WinLeft=0.5626680
        WinWidth=0.3720020
        WinHeight=0.3574800
    end object
    l_NoPreview=NoPreview
    MapCaption="?"
    BonusVehicles=" (Bonus Vehicles)"
    BonusVehiclesMsg="(Includes Bonus Vehicles)|"
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MainSP.FilterCheck'
    begin object name="FilterCheck" class=XInterface.moCheckBox
        CaptionWidth=0.1000000
        ComponentWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=FilterCheck.InternalOnCreateComponent
        Hint="?? ?? ??? ?????? ??? ??? ?????."
        WinTop=0.7728650
        WinLeft=0.0517580
        WinWidth=0.3417970
        WinHeight=0.0300350
        TabOrder=1
        OnChange=UT2K4Tab_MainSP.ChangeMapFilter
    end object
    ch_OfficialMapsOnly=FilterCheck
}