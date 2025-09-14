/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MaplistEditor.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:33
 *	Functions:28
 *
 *******************************************************************************/
class MaplistEditor extends FloatingWindow
    dependson(UT2K4Tab_MainSP)
    editinlinenew
    instanced;

var() editconst noexport array<editconst MapItem> Maps;
var() editconst noexport GameRecord CurrentGameType;
var() editconst noexport MaplistManager MapHandler;
var() editconst noexport int GameIndex;
var() editconst noexport int RecordIndex;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITreeListBox lb_ActiveMaps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITreeListBox lb_AllMaps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Add;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_AddAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Remove;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MoveUp;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MoveDown;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_New;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Delete;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Rename;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIEditBox ed_MapName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox co_Maplist;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_MapList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Active;
var() editconst noexport editinline GUITreeList li_Active;
var() editconst noexport editinline GUITreeList li_Avail;
var export editinline UT2K4Tab_MainSP MainPanel;
var bool bOnlyShowCustom;
var bool bOnlyShowOfficial;
var() localized string InvalidMaplistClassText;
var() localized string NewMaplistPageCaption;
var() localized string MaplistEditCaption;
var() localized string RenameMaplistPageCaption;
var() localized string LinkText;
var() localized string AutoSelectText;
var() localized string BonusVehicles;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Active = lb_ActiveMaps.List;
    li_Avail = lb_AllMaps.List;
    // End:0xa5
    if(li_Avail != none)
    {
        li_Avail.__OnDblClick__Delegate = ModifyMapList;
        li_Avail.__OnDragDrop__Delegate = RemoveDragDrop;
        li_Avail.AddLinkObject(b_Add, true);
        li_Avail.bSorted = true;
        li_Avail.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
    }
    // End:0x14d
    if(li_Active != none)
    {
        li_Active.__OnDblClick__Delegate = ModifyMapList;
        li_Active.__OnDragDrop__Delegate = AddDragDrop;
        li_Active.AddLinkObject(b_Remove, true);
        li_Active.AddLinkObject(b_MoveUp, true);
        li_Active.AddLinkObject(b_MoveDown, true);
        li_Active.bSorted = false;
        li_Active.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Active.bGroupItems = false;
    }
    sb_Avail.ManageComponent(lb_AllMaps);
    sb_Active.ManageComponent(lb_ActiveMaps);
    co_Maplist.List.bInitializeList = false;
    SetupSizingCaption();
}

function SetupSizingCaption()
{
    local string str;

    str = b_New.Caption;
    // End:0x44
    if(Len(b_Rename.Caption) > Len(str))
    {
        str = b_Rename.Caption;
    }
    // End:0x74
    if(Len(b_Delete.Caption) > Len(str))
    {
        str = b_Delete.Caption;
    }
    b_New.SizingCaption = str;
    b_Rename.SizingCaption = str;
    b_Delete.SizingCaption = str;
}

function Initialize(MaplistManager InHandler)
{
    MapHandler = InHandler;
    // End:0x20
    if(InitGameType())
    {
        ReloadAvailable();
        RefreshMaplistNames();
    }
}

function bool InitGameType()
{
    local int i;
    local array<GameRecord> Games;

    class'CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x18:
    // End:0x88 [While If]
    if(i < Games.Length)
    {
        // End:0x7e
        if(Games[i].ClassName ~= Controller.LastGameType)
        {
            CurrentGameType = Games[i];
            GameIndex = MapHandler.GetGameIndex(CurrentGameType.ClassName);
        }
        // End:0x88
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x18;
        }
    }
    return i < Games.Length;
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

function ReloadAvailable()
{
    local int i, j;
    local array<string> CustomLinkSetups;

    // End:0x4b2
    if(MapHandler.GetAvailableMaps(GameIndex, Maps))
    {
        li_Avail.bNotify = false;
        li_Avail.Clear();
        i = 0;
        J0x43:
        // End:0x4b2 [While If]
        if(i < Maps.Length)
        {
            // End:0x81
            if(class'CacheManager'.static.IsDefaultContent(Maps[i].MapName))
            {
                // End:0x7e
                if(bOnlyShowCustom)
                {
                }
                // End:0x4a8
                else
                {
                    // This is an implied JumpToken;
                    goto J0x8d;
                }
                // End:0x8d
                if(bOnlyShowOfficial)
                {
                }
                // End:0x4a8
                else
                {
                    J0x8d:
                    // End:0x1a0
                    if(Maps[i].Options.Length > 0)
                    {
                        li_Avail.AddItem(AutoSelectText @ LinkText, Maps[i].MapName $ "?LinkSetup=Random", Maps[i].MapName);
                        j = 0;
                        J0xfb:
                        // End:0x19d [While If]
                        if(j < Maps[i].Options.Length)
                        {
                            li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ Maps[i].Options[j].Value, Maps[i].MapName);
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0xfb;
                        }
                    }
                    // End:0x1cf
                    else
                    {
                        li_Avail.AddItem(Maps[i].MapName, Maps[i].MapName);
                    }
                    // End:0x4a8
                    if(CurrentGameType.MapPrefix == "ONS")
                    {
                        CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                        j = 0;
                        J0x21f:
                        // End:0x296 [While If]
                        if(j < CustomLinkSetups.Length)
                        {
                            li_Avail.AddItem(CustomLinkSetups[j] @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ CustomLinkSetups[j], Maps[i].MapName);
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x21f;
                        }
                        // End:0x4a8
                        if(OrigONSMap(Maps[i].MapName) && Controller.bECEEdition)
                        {
                            li_Avail.AddItem(Maps[i].MapName $ BonusVehicles, Maps[i].MapName $ "?BonusVehicles=true");
                            j = 0;
                            J0x317:
                            // End:0x3d7 [While If]
                            if(j < Maps[i].Options.Length)
                            {
                                li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ Maps[i].Options[j].Value $ "?BonusVehicles=true", Maps[i].MapName $ BonusVehicles);
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0x317;
                            }
                            CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                            j = 0;
                            J0x413:
                            // End:0x4a8 [While If]
                            if(j < CustomLinkSetups.Length)
                            {
                                li_Avail.AddItem(CustomLinkSetups[j] @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ CustomLinkSetups[j] $ "?BonusVehicles=true", Maps[i].MapName $ BonusVehicles);
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0x413;
                            }
                        }
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x43;
        }
    }
    // End:0x4d3
    if(li_Avail.bSorted)
    {
        li_Avail.Sort();
    }
    li_Avail.bNotify = true;
}

singular function ReloadActive()
{
    local int i;
    local array<string> NewActiveMaps;

    li_Active.bNotify = false;
    li_Avail.bNotify = false;
    li_Active.Clear();
    RecordIndex = MapHandler.GetRecordIndex(GameIndex, co_Maplist.GetText());
    NewActiveMaps = MapHandler.GetMapList(GameIndex, RecordIndex);
    i = 0;
    J0x80:
    // End:0xab [While If]
    if(i < NewActiveMaps.Length)
    {
        AddMap(NewActiveMaps[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x80;
    }
    li_Active.bNotify = true;
    li_Avail.bNotify = true;
}

function RefreshMaplistNames(optional string CurrentMapList)
{
    local int i, Index, Current;
    local array<string> AR;

    Index = MapHandler.GetGameIndex(CurrentGameType.ClassName);
    AR = MapHandler.GetMapListNames(Index);
    Current = MapHandler.GetRecordIndex(Index, CurrentMapList);
    // End:0x81
    if(Current == -1)
    {
        Current = MapHandler.GetActiveList(Index);
    }
    co_Maplist.List.bNotify = false;
    co_Maplist.List.Clear();
    i = 0;
    J0xba:
    // End:0xee [While If]
    if(i < AR.Length)
    {
        co_Maplist.AddItem(AR[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xba;
    }
    co_Maplist.List.bNotify = true;
    CurrentMapList = MapHandler.GetMapListTitle(Index, Current);
    co_Maplist.SetText(CurrentMapList, true);
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    StoreMaplists();
    // End:0x6b
    if(MainPanel != none)
    {
        i = MainPanel.li_Maps.FindIndexByValue(li_Active.GetValueAtIndex(0));
        // End:0x6b
        if(i != -1)
        {
            MainPanel.li_Maps.SetIndex(i);
        }
    }
    super(GUIPage).Closed(Sender, bCancelled);
}

function bool AddMap(optional string MapName)
{
    local int i, j;
    local array<int> Indexes;
    local array<GUITreeNode> PendingElements;
    local MapItem Item;
    local string MN;

    // End:0x2f4
    if(MapName != "")
    {
        li_Avail.bNotify = false;
        Indexes = li_Avail.GetIndexList();
        i = 0;
        J0x39:
        // End:0x99 [While If]
        if(i < Indexes.Length)
        {
            // End:0x8f
            if(li_Avail.ValidSelectionAt(Indexes[i]) && MapName ~= li_Avail.GetValueAtIndex(Indexes[i]))
            {
            }
            // End:0x99
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x39;
            }
        }
        // End:0x2a5
        if(i < Indexes.Length)
        {
            PendingElements[0] = li_Avail.Elements[Indexes[i]];
            i = li_Active.FindIndexByValue(PendingElements[0].Value);
            // End:0x28e
            if(i == -1)
            {
                class'MaplistRecord'.static.CreateMapItem(PendingElements[0].Value, Item);
                MN = Item.MapName;
                i = 0;
                J0x132:
                // End:0x189 [While If]
                if(i < Item.Options.Length)
                {
                    // End:0x17f
                    if(Item.Options[i].key ~= "BonusVehicles")
                    {
                        MN $= "(BV)";
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x132;
                }
                i = 0;
                J0x190:
                // End:0x213 [While If]
                if(i < Item.Options.Length)
                {
                    // End:0x209
                    if(Item.Options[i].key ~= "LinkSetup")
                    {
                        li_Active.AddItem(MN @ "-" @ Item.Options[i].Value, Item.FullURL,, true);
                    }
                    // End:0x213
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x190;
                    }
                }
                // End:0x28b
                if(i == Item.Options.Length)
                {
                    // End:0x26b
                    if(CurrentGameType.MapPrefix ~= "ONS")
                    {
                        li_Active.AddItem(MN @ "-" @ AutoSelectText, Item.MapName,, true);
                    }
                    // End:0x28b
                    else
                    {
                        li_Active.AddItem(MN, Item.MapName,, true);
                    }
                }
            }
            // End:0x2a2
            else
            {
                li_Active.SilentSetIndex(i);
            }
        }
        // End:0x2f1
        else
        {
            Log("AddMap() didn't find map named" @ MapName, 'MapHandler');
            MapHandler.RemoveMap(GameIndex, RecordIndex, MapName);
        }
    }
    // End:0x529
    else
    {
        // End:0x30a
        if(!li_Avail.IsValid())
        {
            return false;
        }
        li_Avail.bNotify = false;
        PendingElements = li_Avail.GetPendingElements(true);
        i = 0;
        J0x338:
        // End:0x529 [While If]
        if(i < PendingElements.Length)
        {
            // End:0x51f
            if(li_Avail.ValidSelection())
            {
                j = li_Active.FindIndexByValue(PendingElements[i].Value);
                // End:0x4e2
                if(j == -1)
                {
                    class'MaplistRecord'.static.CreateMapItem(PendingElements[i].Value, Item);
                    MN = Item.MapName;
                    j = 0;
                    J0x3c9:
                    // End:0x420 [While If]
                    if(j < Item.Options.Length)
                    {
                        // End:0x416
                        if(Item.Options[j].key ~= "BonusVehicles")
                        {
                            MN $= "(BV)";
                        }
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x3c9;
                    }
                    j = 0;
                    J0x427:
                    // End:0x4aa [While If]
                    if(j < Item.Options.Length)
                    {
                        // End:0x4a0
                        if(Item.Options[j].key ~= "LinkSetup")
                        {
                            li_Active.AddItem(MN @ "-" @ Item.Options[j].Value, Item.FullURL,, true);
                        }
                        // End:0x4aa
                        else
                        {
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x427;
                        }
                    }
                    // End:0x4df
                    if(j == Item.Options.Length)
                    {
                        li_Active.AddItem(MN, Item.MapName,, true);
                    }
                }
                // End:0x4f6
                else
                {
                    li_Active.SilentSetIndex(j);
                }
                MapHandler.AddMap(GameIndex, RecordIndex, PendingElements[i].Value);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x338;
        }
    }
    li_Avail.bNotify = true;
    li_Avail.ClearPendingElements();
    li_Avail.SetIndex(li_Avail.Index);
    return true;
}

function bool RemoveMap()
{
    local int i;
    local array<GUITreeNode> PendingElements;

    // End:0x16
    if(!li_Active.IsValid())
    {
        return false;
    }
    li_Active.bNotify = false;
    PendingElements = li_Active.GetPendingElements(true);
    i = 0;
    J0x44:
    // End:0xb5 [While If]
    if(i < PendingElements.Length)
    {
        // End:0xab
        if(li_Active.ValidSelection())
        {
            li_Active.RemoveElement(PendingElements[i],, true);
            MapHandler.RemoveMap(GameIndex, RecordIndex, PendingElements[i].Value);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    li_Active.bNotify = true;
    li_Active.ClearPendingElements();
    li_Active.SetIndex(li_Active.Index);
    return true;
}

function bool ButtonPreDraw(Canvas C)
{
    local float X, W, BW, L;

    W = sb_MapList.ActualWidth() - sb_MapList.ImageOffset[0] - sb_MapList.ImageOffset[2];
    X = W - sb_MapList.ImageOffset[2];
    BW = b_New.ActualWidth() + b_Rename.ActualWidth() + b_Delete.ActualWidth() + float(6);
    L = X - BW;
    b_New.WinLeft = L;
    L += b_New.ActualWidth() + float(3);
    b_Rename.WinLeft = L;
    L += b_Rename.ActualWidth() + float(3);
    b_Delete.WinLeft = L;
    b_New.WinTop = 0.1808460;
    b_Rename.WinTop = 0.1808460;
    b_Delete.WinTop = 0.1808460;
    co_Maplist.WinLeft = sb_MapList.ActualLeft() + sb_MapList.ImageOffset[0];
    co_Maplist.WinTop = 0.1254670;
    co_Maplist.WinWidth = 0.8024850;
    W = sb_Avail.WinWidth / float(2) - sb_Avail.WinWidth * 0.020;
    b_AddAll.WinLeft = sb_Avail.WinLeft;
    b_AddAll.WinWidth = W;
    b_Add.WinLeft = sb_Avail.WinLeft + sb_Avail.WinWidth - W;
    b_Add.WinWidth = W;
    W = sb_Active.WinWidth / float(2) - sb_Active.WinWidth * 0.020;
    b_MoveUp.WinLeft = sb_Active.WinLeft;
    b_MoveUp.WinWidth = W;
    b_Remove.WinLeft = sb_Active.WinLeft;
    b_Remove.WinWidth = W;
    b_MoveDown.WinLeft = sb_Active.WinLeft + sb_Active.WinWidth - W;
    b_MoveDown.WinWidth = W;
    b_RemoveAll.WinLeft = sb_Active.WinLeft + sb_Active.WinWidth - W;
    b_RemoveAll.WinWidth = W;
    return false;
}

function RenameMaplist(optional bool bCancelled)
{
    local string str;

    str = Controller.ActivePage.GetDataString();
    // End:0x4d
    if(!bCancelled && str != "")
    {
        UpdateCustomMapList(str);
        RefreshMaplistNames(str);
    }
}

function CreateNewMaplist(optional bool bCancelled)
{
    local string str, Warning;
    local array<string> AR;

    str = Controller.ActivePage.GetDataString();
    // End:0x100
    if(!bCancelled && str != "")
    {
        // End:0x9d
        if(MapHandler.GetDefaultMaps(CurrentGameType.MapListClassName, AR) && AR.Length > 0)
        {
            RecordIndex = MapHandler.AddList(CurrentGameType.ClassName, str, AR);
            RefreshMaplistNames(str);
        }
        // End:0x100
        else
        {
            Warning = Repl(InvalidMaplistClassText, "%name%", str);
            Warning = Repl(Warning, "%game%", CurrentGameType.ClassName);
            Warning = Repl(Warning, "%mapclass%", CurrentGameType.MapListClassName);
            Warn(Warning);
        }
    }
}

singular function bool ModifyMapList(GUIComponent Sender)
{
    local int Index, NewIndex;
    local string str;

    // End:0x51
    if(Sender == lb_AllMaps || Sender == li_Avail)
    {
        // End:0x3b
        if(li_Avail.ValidSelection())
        {
            AddMap();
        }
        // End:0x4f
        else
        {
            li_Avail.InternalDblClick(li_Avail);
        }
        return true;
    }
    // End:0xa2
    if(Sender == lb_ActiveMaps || Sender == li_Active)
    {
        // End:0x8c
        if(li_Active.ValidSelection())
        {
            RemoveMap();
        }
        // End:0xa0
        else
        {
            li_Active.InternalDblClick(li_Active);
        }
        return true;
    }
    // End:0xb4
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    switch(Sender)
    {
        // End:0xca
        case b_Add:
            return AddMap();
        // End:0x189
        case b_AddAll:
            // End:0xe9
            if(lb_AllMaps.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.bNotify = false;
            li_Active.bNotify = false;
            Index = 0;
            J0x112:
            // End:0x165 [While If]
            if(Index < li_Avail.ItemCount)
            {
                // End:0x15b
                if(li_Avail.ValidSelectionAt(Index))
                {
                    li_Avail.SilentSetIndex(Index);
                    AddMap();
                }
                ++ Index;
                // This is an implied JumpToken; Continue!
                goto J0x112;
            }
            li_Avail.bNotify = true;
            li_Active.bNotify = true;
            return true;
        // End:0x198
        case b_Remove:
            return RemoveMap();
        // End:0x279
        case b_RemoveAll:
            // End:0x1b7
            if(lb_ActiveMaps.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.bNotify = false;
            li_Active.bNotify = false;
            Index = 0;
            J0x1e0:
            // End:0x246 [While If]
            if(Index < li_Active.ItemCount)
            {
                // End:0x23c
                if(li_Active.ValidSelectionAt(Index))
                {
                    MapHandler.RemoveMap(GameIndex, RecordIndex, li_Active.GetValueAtIndex(Index));
                }
                ++ Index;
                // This is an implied JumpToken; Continue!
                goto J0x1e0;
            }
            li_Active.Clear();
            li_Avail.bNotify = true;
            li_Active.bNotify = true;
            return true;
        // End:0x33f
        case b_MoveUp:
            // End:0x297
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = li_Active.GetValue();
            // End:0x33d
            if(Index > 0 && li_Active.Swap(Index, Index - 1))
            {
                NewIndex = li_Active.FindIndexByValue(str);
                li_Active.SetIndex(NewIndex);
                MapHandler.ShiftMap(GameIndex, RecordIndex, str, -1);
            }
            return true;
        // End:0x411
        case b_MoveDown:
            // End:0x35d
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = li_Active.GetValue();
            // End:0x40f
            if(Index < li_Active.ItemCount - 1 && li_Active.Swap(Index, Index + 1))
            {
                NewIndex = li_Active.FindIndexByValue(str);
                li_Active.SetIndex(NewIndex);
                MapHandler.ShiftMap(GameIndex, RecordIndex, str, 1);
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CustomMaplistClick(GUIComponent Sender)
{
    local string str;

    switch(Sender)
    {
        // End:0x59
        case b_New:
            // End:0x56
            if(Controller.OpenMenu(Controller.RequestDataMenu, NewMaplistPageCaption, MaplistEditCaption))
            {
                Controller.ActivePage.__OnClose__Delegate = CreateNewMaplist;
            }
            // End:0x135
            break;
        // End:0xb9
        case b_Delete:
            RecordIndex = MapHandler.RemoveList(GameIndex, RecordIndex);
            str = MapHandler.GetMapListTitle(GameIndex, RecordIndex);
            RefreshMaplistNames(str);
            ReloadAvailable();
            ReloadActive();
            // End:0x135
            break;
        // End:0x132
        case b_Rename:
            // End:0x12f
            if(Controller.OpenMenu(Controller.RequestDataMenu, RenameMaplistPageCaption, MaplistEditCaption))
            {
                Controller.ActivePage.SetDataString(co_Maplist.Get());
                Controller.ActivePage.__OnClose__Delegate = RenameMaplist;
            }
            // End:0x135
            break;
        // End:0xffff
        default:
            return true;
    }
}

function MaplistSelectChange(GUIComponent Sender)
{
    ReloadActive();
}

function bool AddDragDrop(GUIComponent Sender)
{
    local array<GUITreeNode> AR;
    local int i, idx;

    // End:0x1b9
    if(Sender == li_Active)
    {
        idx = li_Active.DropIndex;
        // End:0x50
        if(!li_Active.IsValidIndex(idx))
        {
            idx = li_Active.ItemCount;
        }
        // End:0x80
        if(Controller.DropSource == li_Avail)
        {
            AR = li_Avail.GetPendingElements();
        }
        // End:0x12b
        else
        {
            // End:0x12b
            if(Controller.DropSource == li_Active)
            {
                AR = li_Active.GetPendingElements();
                i = 0;
                J0xb4:
                // End:0x12b [While If]
                if(i < AR.Length)
                {
                    // End:0xde
                    if(AR[i].Value == "")
                    {
                    }
                    // End:0x121
                    else
                    {
                        MapHandler.RemoveMap(GameIndex, RecordIndex, AR[i].Value);
                        li_Active.RemoveElement(AR[i]);
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xb4;
                }
            }
        }
        i = AR.Length - 1;
        J0x13a:
        // End:0x1a3 [While If]
        if(i >= 0)
        {
            // End:0x16b
            if(AR[i].Value == "")
            {
                AR.Remove(i, 1);
            }
            // End:0x199
            else
            {
                MapHandler.InsertMap(GameIndex, RecordIndex, AR[i].Value, idx);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x13a;
        }
        li_Active.InternalOnDragDrop(li_Active);
        return true;
    }
    return false;
}

function bool RemoveDragDrop(GUIComponent Sender)
{
    local array<GUITreeNode> AR;
    local int i;

    // End:0xb7
    if(Sender == li_Avail)
    {
        // End:0x29
        if(Controller.DropSource != li_Active)
        {
            return false;
        }
        AR = li_Active.GetPendingElements();
        i = 0;
        J0x45:
        // End:0xa2 [While If]
        if(i < AR.Length)
        {
            // End:0x6f
            if(AR[i].Value == "")
            {
            }
            // End:0x98
            else
            {
                MapHandler.RemoveMap(GameIndex, RecordIndex, AR[i].Value);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
        return li_Avail.InternalOnDragDrop(Sender);
    }
    return false;
}

function AddMapOption(string MapName, string OptionName, optional string Value);
function InternalCheckLinkedObj(GUIListBase List)
{
    // End:0x24
    if(List.IsValid())
    {
        List.EnableLinkedObjects();
    }
    // End:0x33
    else
    {
        List.DisableLinkedObjects();
    }
    // End:0x55
    if(li_Avail.ItemCount > 0)
    {
        EnableComponent(b_AddAll);
    }
    // End:0x60
    else
    {
        DisableComponent(b_AddAll);
    }
    // End:0x82
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);
    }
    // End:0x8d
    else
    {
        DisableComponent(b_RemoveAll);
    }
    // End:0xaf
    if(li_Active.Index == 0)
    {
        DisableComponent(b_MoveUp);
    }
    // End:0xde
    else
    {
        // End:0xde
        if(li_Active.Index == li_Active.ItemCount - 1)
        {
            DisableComponent(b_MoveDown);
        }
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x59
    if(moButton(Sender) != none && GUILabel(NewComp) != none)
    {
        GUILabel(NewComp).TextColor = WhiteColor;
        moButton(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

function StoreMaplists()
{
    local int i, idx;

    MapHandler.ApplyMapList(GameIndex, RecordIndex);
    i = 0;
    J0x20:
    // End:0xa2 [While If]
    if(i < co_Maplist.ItemCount())
    {
        idx = MapHandler.GetRecordIndex(GameIndex, co_Maplist.List.GetItemAtIndex(i));
        // End:0x98
        if(idx != RecordIndex)
        {
            MapHandler.SaveMapList(GameIndex, idx);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function UpdateCustomMapList(optional string NewName)
{
    // End:0x30
    if(NewName != "")
    {
        RecordIndex = MapHandler.RenameList(GameIndex, RecordIndex, NewName);
    }
    MapHandler.SaveMapList(GameIndex, RecordIndex);
}

function string GetMapPrefix()
{
    return CurrentGameType.MapPrefix;
}

function string GetMapListClass()
{
    return CurrentGameType.MapListClassName;
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName == MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

event free()
{
    MapHandler = none;
    MainPanel = none;
    super(GUIPage).free();
}

defaultproperties
{
    begin object name=ActiveMaps class=GUITreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        TabOrder=7
    object end
    // Reference: GUITreeListBox'MaplistEditor.ActiveMaps'
    lb_ActiveMaps=ActiveMaps
    begin object name=InactiveMaps class=GUITreeListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=4
    object end
    // Reference: GUITreeListBox'MaplistEditor.InactiveMaps'
    lb_AllMaps=InactiveMaps
    begin object name=AddButton class=GUIButton
        Caption="??"
        Hint="???? ?? ????? ?????."
        WinTop=0.8525380
        WinLeft=0.2637430
        WinWidth=0.2038070
        WinHeight=0.0563120
        TabOrder=6
        bScaleToParent=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.AddButton'
    b_Add=AddButton
    begin object name=AddAllButton class=GUIButton
        Caption="?? ??"
        Hint="?? ?? ????? ?????."
        WinTop=0.8525380
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0563120
        TabOrder=5
        bScaleToParent=true
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.AddAllButton'
    b_AddAll=AddAllButton
    begin object name=RemoveButton class=GUIButton
        Caption="? ??"
        AutoSizePadding=(HorzPerc=0.50,VertPerc=0.0)
        Hint="???? ?? ?????? ?????."
        WinTop=0.8981110
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=10
        bScaleToParent=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.RemoveButton'
    b_Remove=RemoveButton
    begin object name=RemoveAllButton class=GUIButton
        Caption="?? ? ??"
        Hint="??? ????? ?? ??? ?????."
        WinTop=0.8981110
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=11
        bScaleToParent=true
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.RemoveAllButton'
    b_RemoveAll=RemoveAllButton
    begin object name=MoveUpButton class=GUIButton
        Caption="??"
        Hint="??? ?? ????? ??? ?? ????."
        WinTop=0.8525380
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=9
        bScaleToParent=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.MoveUpButton'
    b_MoveUp=MoveUpButton
    begin object name=MoveDownButton class=GUIButton
        Caption="???"
        Hint="??? ?? ????? ??? ??? ????."
        WinTop=0.8525380
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=8
        bScaleToParent=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.MoveDownButton'
    b_MoveDown=MoveDownButton
    begin object name=NewMaplistButton class=GUIButton
        Caption="?? ???"
        bAutoSize=true
        Hint="??? ??? ????? ???? ? ????."
        WinTop=0.1025510
        WinLeft=0.0606710
        WinWidth=0.123020
        WinHeight=0.0563120
        TabOrder=1
        OnClick=CustomMaplistClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.NewMaplistButton'
    b_New=NewMaplistButton
    begin object name=DeleteMaplistButton class=GUIButton
        Caption="?????? ??"
        bAutoSize=true
        Hint="??? ????? ?????. ??? ???? ????? ??? ?? ????? ?? ??? ??? ????? ????? ?????."
        WinTop=0.1025510
        WinLeft=0.3180240
        WinWidth=0.123020
        WinHeight=0.0563120
        TabOrder=3
        OnPreDraw=ButtonPreDraw
        OnClick=CustomMaplistClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.DeleteMaplistButton'
    b_Delete=DeleteMaplistButton
    begin object name=RenameMaplistButton class=GUIButton
        Caption="?????"
        bAutoSize=true
        Hint="???? ????? ????? ?????."
        WinTop=0.1025510
        WinLeft=0.1893480
        WinWidth=0.123020
        WinHeight=0.0563120
        TabOrder=2
        OnClick=CustomMaplistClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MaplistEditor.RenameMaplistButton'
    b_Rename=RenameMaplistButton
    begin object name=SelectMaplistCombo class=GUIComboBox
        bReadOnly=true
        Hint="?? ???? ??? ????? ?????."
        WinTop=0.1098080
        WinLeft=0.471550
        WinWidth=0.4413840
        WinHeight=0.0450830
        TabOrder=0
        OnChange=MaplistSelectChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'MaplistEditor.SelectMaplistCombo'
    co_Maplist=SelectMaplistCombo
    begin object name=MapListSectionBackground class=AltSectionBackground
        WinTop=0.0551620
        WinLeft=0.0236460
        WinWidth=0.94310
        WinHeight=0.1905950
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'MaplistEditor.MapListSectionBackground'
    sb_MapList=MapListSectionBackground
    begin object name=InactiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="????? ?? ?"
        WinTop=0.2618350
        WinLeft=0.0349140
        WinWidth=0.4654320
        WinHeight=0.5649170
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MaplistEditor.InactiveBackground'
    sb_Avail=InactiveBackground
    begin object name=ActiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        WinTop=0.2618350
        WinLeft=0.5112430
        WinWidth=0.4654320
        WinHeight=0.5649170
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MaplistEditor.ActiveBackground'
    sb_Active=ActiveBackground
    InvalidMaplistClassText=" %game%? ??? ???? ???? ?? ??? ???? %name% (?)? ??? ? ????: '%mapclass%'!"
    NewMaplistPageCaption="??? ???? ???"
    MaplistEditCaption="???? ??: "
    RenameMaplistPageCaption="???? ?? ???? ??"
    LinkText="?? ??"
    AutoSelectText="?? ??"
    BonusVehicles=" (Bonus Vehicles)"
    WindowName="???? ??"
    MinPageWidth=0.9303130
    MinPageHeight=0.9313050
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.0381250
    DefaultTop=0.021680
    DefaultWidth=0.9303130
    DefaultHeight=0.9313050
    InactiveFadeColor=(R=80,G=80,B=80,A=255)
    WinTop=0.021680
    WinLeft=0.0381250
    WinWidth=0.9303130
    WinHeight=0.9313050
}