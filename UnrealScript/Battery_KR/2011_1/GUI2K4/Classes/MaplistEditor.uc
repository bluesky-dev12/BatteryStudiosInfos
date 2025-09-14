class MaplistEditor extends FloatingWindow
    editinlinenew
    instanced;

var() editconst noexport array<editconst MapItem> Maps;
var() editconst noexport GameRecord CurrentGameType;
var() editconst noexport MaplistManager MapHandler;
var() editconst noexport int GameIndex;
var() editconst noexport int RecordIndex;
var() automated GUITreeListBox lb_ActiveMaps;
var() automated GUITreeListBox lb_AllMaps;
var() automated GUIButton b_Add;
var() automated GUIButton b_AddAll;
var() automated GUIButton b_Remove;
var() automated GUIButton b_RemoveAll;
var() automated GUIButton b_MoveUp;
var() automated GUIButton b_MoveDown;
var() automated GUIButton b_New;
var() automated GUIButton b_Delete;
var() automated GUIButton b_Rename;
var() automated GUIEditBox ed_MapName;
var() automated GUIComboBox co_Maplist;
var() automated GUISectionBackground sb_MapList;
var() automated GUISectionBackground sb_Avail;
var() automated GUISectionBackground sb_Active;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITreeList li_Active;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITreeList li_Avail;
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
    // End:0xA5
    if(li_Avail != none)
    {
        li_Avail.__OnDblClick__Delegate = ModifyMapList;
        li_Avail.__OnDragDrop__Delegate = RemoveDragDrop;
        li_Avail.AddLinkObject(b_Add, true);
        li_Avail.bSorted = true;
        li_Avail.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
    }
    // End:0x14D
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
    //return;    
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
    //return;    
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
    //return;    
}

function bool InitGameType()
{
    local int i;
    local array<GameRecord> Games;

    Class'Engine.CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x18:

    // End:0x88 [Loop If]
    if(i < Games.Length)
    {
        // End:0x7E
        if(Games[i].ClassName ~= Controller.LastGameType)
        {
            CurrentGameType = Games[i];
            GameIndex = MapHandler.GetGameIndex(CurrentGameType.ClassName);
            // [Explicit Break]
            goto J0x88;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    J0x88:

    return i < Games.Length;
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

function ReloadAvailable()
{
    local int i, j;
    local array<string> CustomLinkSetups;

    // End:0x4B2
    if(MapHandler.GetAvailableMaps(GameIndex, Maps))
    {
        li_Avail.bNotify = false;
        li_Avail.Clear();
        i = 0;
        J0x43:

        // End:0x4B2 [Loop If]
        if(i < Maps.Length)
        {
            // End:0x81
            if(Class'Engine.CacheManager'.static.IsDefaultContent(Maps[i].MapName))
            {
                // End:0x7E
                if(bOnlyShowCustom)
                {
                    // [Explicit Continue]
                    goto J0x4A8;
                }                
            }
            else
            {
                // End:0x8D
                if(bOnlyShowOfficial)
                {
                    // [Explicit Continue]
                    goto J0x4A8;
                }
            }
            // End:0x1A0
            if(Maps[i].Options.Length > 0)
            {
                li_Avail.AddItem(AutoSelectText @ LinkText, Maps[i].MapName $ "?LinkSetup=Random", Maps[i].MapName);
                j = 0;
                J0xFB:

                // End:0x19D [Loop If]
                if(j < Maps[i].Options.Length)
                {
                    li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, (Maps[i].MapName $ "?LinkSetup=") $ Maps[i].Options[j].Value, Maps[i].MapName);
                    j++;
                    // [Loop Continue]
                    goto J0xFB;
                }                
            }
            else
            {
                li_Avail.AddItem(Maps[i].MapName, Maps[i].MapName);
            }
            // End:0x4A8
            if(CurrentGameType.MapPrefix == "ONS")
            {
                CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                j = 0;
                J0x21F:

                // End:0x296 [Loop If]
                if(j < CustomLinkSetups.Length)
                {
                    li_Avail.AddItem(CustomLinkSetups[j] @ LinkText, (Maps[i].MapName $ "?LinkSetup=") $ CustomLinkSetups[j], Maps[i].MapName);
                    j++;
                    // [Loop Continue]
                    goto J0x21F;
                }
                // End:0x4A8
                if((OrigONSMap(Maps[i].MapName)) && Controller.bECEEdition)
                {
                    li_Avail.AddItem(Maps[i].MapName $ BonusVehicles, Maps[i].MapName $ "?BonusVehicles=true");
                    j = 0;
                    J0x317:

                    // End:0x3D7 [Loop If]
                    if(j < Maps[i].Options.Length)
                    {
                        li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, ((Maps[i].MapName $ "?LinkSetup=") $ Maps[i].Options[j].Value) $ "?BonusVehicles=true", Maps[i].MapName $ BonusVehicles);
                        j++;
                        // [Loop Continue]
                        goto J0x317;
                    }
                    CustomLinkSetups = GetPerObjectNames(Maps[i].MapName, "ONSPowerLinkCustomSetup");
                    j = 0;
                    J0x413:

                    // End:0x4A8 [Loop If]
                    if(j < CustomLinkSetups.Length)
                    {
                        li_Avail.AddItem(CustomLinkSetups[j] @ LinkText, ((Maps[i].MapName $ "?LinkSetup=") $ CustomLinkSetups[j]) $ "?BonusVehicles=true", Maps[i].MapName $ BonusVehicles);
                        j++;
                        // [Loop Continue]
                        goto J0x413;
                    }
                }
            }
            J0x4A8:

            i++;
            // [Loop Continue]
            goto J0x43;
        }
    }
    // End:0x4D3
    if(li_Avail.bSorted)
    {
        li_Avail.Sort();
    }
    li_Avail.bNotify = true;
    //return;    
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

    // End:0xAB [Loop If]
    if(i < NewActiveMaps.Length)
    {
        AddMap(NewActiveMaps[i]);
        i++;
        // [Loop Continue]
        goto J0x80;
    }
    li_Active.bNotify = true;
    li_Avail.bNotify = true;
    //return;    
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
    J0xBA:

    // End:0xEE [Loop If]
    if(i < AR.Length)
    {
        co_Maplist.AddItem(AR[i]);
        i++;
        // [Loop Continue]
        goto J0xBA;
    }
    co_Maplist.List.bNotify = true;
    CurrentMapList = MapHandler.GetMapListTitle(Index, Current);
    co_Maplist.SetText(CurrentMapList, true);
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    StoreMaplists();
    // End:0x6B
    if(MainPanel != none)
    {
        i = MainPanel.li_Maps.FindIndexByValue(li_Active.GetValueAtIndex(0));
        // End:0x6B
        if(i != -1)
        {
            MainPanel.li_Maps.SetIndex(i);
        }
    }
    super(GUIPage).Closed(Sender, bCancelled);
    //return;    
}

function bool AddMap(optional string MapName)
{
    local int i, j;
    local array<int> Indexes;
    local array<GUITreeNode> PendingElements;
    local MapItem Item;
    local string MN;

    // End:0x2F4
    if(MapName != "")
    {
        li_Avail.bNotify = false;
        Indexes = li_Avail.GetIndexList();
        i = 0;
        J0x39:

        // End:0x99 [Loop If]
        if(i < Indexes.Length)
        {
            // End:0x8F
            if(li_Avail.ValidSelectionAt(Indexes[i]) && MapName ~= li_Avail.GetValueAtIndex(Indexes[i]))
            {
                // [Explicit Break]
                goto J0x99;
            }
            i++;
            // [Loop Continue]
            goto J0x39;
        }
        J0x99:

        // End:0x2A5
        if(i < Indexes.Length)
        {
            PendingElements[0] = li_Avail.Elements[Indexes[i]];
            i = li_Active.FindIndexByValue(PendingElements[0].Value);
            // End:0x28E
            if(i == -1)
            {
                Class'Engine.MaplistRecord'.static.CreateMapItem(PendingElements[0].Value, Item);
                MN = Item.MapName;
                i = 0;
                J0x132:

                // End:0x189 [Loop If]
                if(i < Item.Options.Length)
                {
                    // End:0x17F
                    if(Item.Options[i].key ~= "BonusVehicles")
                    {
                        MN $= "(BV)";
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x132;
                }
                i = 0;
                J0x190:

                // End:0x213 [Loop If]
                if(i < Item.Options.Length)
                {
                    // End:0x209
                    if(Item.Options[i].key ~= "LinkSetup")
                    {
                        li_Active.AddItem((MN @ "-") @ Item.Options[i].Value, Item.FullURL,, true);
                        // [Explicit Break]
                        goto J0x213;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x190;
                }
                J0x213:

                // End:0x28B
                if(i == Item.Options.Length)
                {
                    // End:0x26B
                    if(CurrentGameType.MapPrefix ~= "ONS")
                    {
                        li_Active.AddItem((MN @ "-") @ AutoSelectText, Item.MapName,, true);                        
                    }
                    else
                    {
                        li_Active.AddItem(MN, Item.MapName,, true);
                    }
                }                
            }
            else
            {
                li_Active.SilentSetIndex(i);
            }            
        }
        else
        {
            Log("AddMap() didn't find map named" @ MapName, 'MapHandler');
            MapHandler.RemoveMap(GameIndex, RecordIndex, MapName);
        }        
    }
    else
    {
        // End:0x30A
        if(!li_Avail.IsValid())
        {
            return false;
        }
        li_Avail.bNotify = false;
        PendingElements = li_Avail.GetPendingElements(true);
        i = 0;
        J0x338:

        // End:0x529 [Loop If]
        if(i < PendingElements.Length)
        {
            // End:0x51F
            if(li_Avail.ValidSelection())
            {
                j = li_Active.FindIndexByValue(PendingElements[i].Value);
                // End:0x4E2
                if(j == -1)
                {
                    Class'Engine.MaplistRecord'.static.CreateMapItem(PendingElements[i].Value, Item);
                    MN = Item.MapName;
                    j = 0;
                    J0x3C9:

                    // End:0x420 [Loop If]
                    if(j < Item.Options.Length)
                    {
                        // End:0x416
                        if(Item.Options[j].key ~= "BonusVehicles")
                        {
                            MN $= "(BV)";
                        }
                        j++;
                        // [Loop Continue]
                        goto J0x3C9;
                    }
                    j = 0;
                    J0x427:

                    // End:0x4AA [Loop If]
                    if(j < Item.Options.Length)
                    {
                        // End:0x4A0
                        if(Item.Options[j].key ~= "LinkSetup")
                        {
                            li_Active.AddItem((MN @ "-") @ Item.Options[j].Value, Item.FullURL,, true);
                            // [Explicit Break]
                            goto J0x4AA;
                        }
                        j++;
                        // [Loop Continue]
                        goto J0x427;
                    }
                    J0x4AA:

                    // End:0x4DF
                    if(j == Item.Options.Length)
                    {
                        li_Active.AddItem(MN, Item.MapName,, true);
                    }                    
                }
                else
                {
                    li_Active.SilentSetIndex(j);
                }
                MapHandler.AddMap(GameIndex, RecordIndex, PendingElements[i].Value);
            }
            i++;
            // [Loop Continue]
            goto J0x338;
        }
    }
    li_Avail.bNotify = true;
    li_Avail.ClearPendingElements();
    li_Avail.SetIndex(li_Avail.Index);
    return true;
    //return;    
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

    // End:0xB5 [Loop If]
    if(i < PendingElements.Length)
    {
        // End:0xAB
        if(li_Active.ValidSelection())
        {
            li_Active.RemoveElement(PendingElements[i],, true);
            MapHandler.RemoveMap(GameIndex, RecordIndex, PendingElements[i].Value);
        }
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    li_Active.bNotify = true;
    li_Active.ClearPendingElements();
    li_Active.SetIndex(li_Active.Index);
    return true;
    //return;    
}

function bool ButtonPreDraw(Canvas C)
{
    local float X, W, BW, L;

    W = (sb_MapList.ActualWidth() - sb_MapList.ImageOffset[0]) - sb_MapList.ImageOffset[2];
    X = W - sb_MapList.ImageOffset[2];
    BW = ((b_New.ActualWidth() + b_Rename.ActualWidth()) + b_Delete.ActualWidth()) + float(6);
    L = X - BW;
    b_New.WinLeft = L;
    L += (b_New.ActualWidth() + float(3));
    b_Rename.WinLeft = L;
    L += (b_Rename.ActualWidth() + float(3));
    b_Delete.WinLeft = L;
    b_New.WinTop = 0.1808460;
    b_Rename.WinTop = 0.1808460;
    b_Delete.WinTop = 0.1808460;
    co_Maplist.WinLeft = sb_MapList.ActualLeft() + sb_MapList.ImageOffset[0];
    co_Maplist.WinTop = 0.1254670;
    co_Maplist.WinWidth = 0.8024850;
    W = (sb_Avail.WinWidth / float(2)) - (sb_Avail.WinWidth * 0.0200000);
    b_AddAll.WinLeft = sb_Avail.WinLeft;
    b_AddAll.WinWidth = W;
    b_Add.WinLeft = (sb_Avail.WinLeft + sb_Avail.WinWidth) - W;
    b_Add.WinWidth = W;
    W = (sb_Active.WinWidth / float(2)) - (sb_Active.WinWidth * 0.0200000);
    b_MoveUp.WinLeft = sb_Active.WinLeft;
    b_MoveUp.WinWidth = W;
    b_Remove.WinLeft = sb_Active.WinLeft;
    b_Remove.WinWidth = W;
    b_MoveDown.WinLeft = (sb_Active.WinLeft + sb_Active.WinWidth) - W;
    b_MoveDown.WinWidth = W;
    b_RemoveAll.WinLeft = (sb_Active.WinLeft + sb_Active.WinWidth) - W;
    b_RemoveAll.WinWidth = W;
    return false;
    //return;    
}

function RenameMaplist(optional bool bCancelled)
{
    local string str;

    str = Controller.ActivePage.GetDataString();
    // End:0x4D
    if(!bCancelled && str != "")
    {
        UpdateCustomMapList(str);
        RefreshMaplistNames(str);
    }
    //return;    
}

function CreateNewMaplist(optional bool bCancelled)
{
    local string str, Warning;
    local array<string> AR;

    str = Controller.ActivePage.GetDataString();
    // End:0x100
    if(!bCancelled && str != "")
    {
        // End:0x9D
        if(MapHandler.GetDefaultMaps(CurrentGameType.MapListClassName, AR) && AR.Length > 0)
        {
            RecordIndex = MapHandler.AddList(CurrentGameType.ClassName, str, AR);
            RefreshMaplistNames(str);            
        }
        else
        {
            Warning = Repl(InvalidMaplistClassText, "%name%", str);
            Warning = Repl(Warning, "%game%", CurrentGameType.ClassName);
            Warning = Repl(Warning, "%mapclass%", CurrentGameType.MapListClassName);
            Warn(Warning);
        }
    }
    //return;    
}

singular function bool ModifyMapList(GUIComponent Sender)
{
    local int Index, NewIndex;
    local string str;

    // End:0x51
    if((Sender == lb_AllMaps) || Sender == li_Avail)
    {
        // End:0x3B
        if(li_Avail.ValidSelection())
        {
            AddMap();            
        }
        else
        {
            li_Avail.InternalDblClick(li_Avail);
        }
        return true;
    }
    // End:0xA2
    if((Sender == lb_ActiveMaps) || Sender == li_Active)
    {
        // End:0x8C
        if(li_Active.ValidSelection())
        {
            RemoveMap();            
        }
        else
        {
            li_Active.InternalDblClick(li_Active);
        }
        return true;
    }
    // End:0xB4
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    switch(Sender)
    {
        // End:0xCA
        case b_Add:
            return AddMap();
        // End:0x189
        case b_AddAll:
            // End:0xE9
            if(lb_AllMaps.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.bNotify = false;
            li_Active.bNotify = false;
            Index = 0;
            J0x112:

            // End:0x165 [Loop If]
            if(Index < li_Avail.ItemCount)
            {
                // End:0x15B
                if(li_Avail.ValidSelectionAt(Index))
                {
                    li_Avail.SilentSetIndex(Index);
                    AddMap();
                }
                Index++;
                // [Loop Continue]
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
            // End:0x1B7
            if(lb_ActiveMaps.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.bNotify = false;
            li_Active.bNotify = false;
            Index = 0;
            J0x1E0:

            // End:0x246 [Loop If]
            if(Index < li_Active.ItemCount)
            {
                // End:0x23C
                if(li_Active.ValidSelectionAt(Index))
                {
                    MapHandler.RemoveMap(GameIndex, RecordIndex, li_Active.GetValueAtIndex(Index));
                }
                Index++;
                // [Loop Continue]
                goto J0x1E0;
            }
            li_Active.Clear();
            li_Avail.bNotify = true;
            li_Active.bNotify = true;
            return true;
        // End:0x33F
        case b_MoveUp:
            // End:0x297
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = li_Active.GetValue();
            // End:0x33D
            if((Index > 0) && li_Active.Swap(Index, Index - 1))
            {
                NewIndex = li_Active.FindIndexByValue(str);
                li_Active.SetIndex(NewIndex);
                MapHandler.ShiftMap(GameIndex, RecordIndex, str, -1);
            }
            return true;
        // End:0x411
        case b_MoveDown:
            // End:0x35D
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = li_Active.GetValue();
            // End:0x40F
            if((Index < (li_Active.ItemCount - 1)) && li_Active.Swap(Index, Index + 1))
            {
                NewIndex = li_Active.FindIndexByValue(str);
                li_Active.SetIndex(NewIndex);
                MapHandler.ShiftMap(GameIndex, RecordIndex, str, 1);
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
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
        // End:0xB9
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
            // End:0x12F
            if(Controller.OpenMenu(Controller.RequestDataMenu, RenameMaplistPageCaption, MaplistEditCaption))
            {
                Controller.ActivePage.SetDataString(co_Maplist.Get());
                Controller.ActivePage.__OnClose__Delegate = RenameMaplist;
            }
            // End:0x135
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function MaplistSelectChange(GUIComponent Sender)
{
    ReloadActive();
    //return;    
}

function bool AddDragDrop(GUIComponent Sender)
{
    local array<GUITreeNode> AR;
    local int i, idx;

    // End:0x1B9
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
        else
        {
            // End:0x12B
            if(Controller.DropSource == li_Active)
            {
                AR = li_Active.GetPendingElements();
                i = 0;
                J0xB4:

                // End:0x12B [Loop If]
                if(i < AR.Length)
                {
                    // End:0xDE
                    if(AR[i].Value == "")
                    {
                        // [Explicit Continue]
                        goto J0x121;
                    }
                    MapHandler.RemoveMap(GameIndex, RecordIndex, AR[i].Value);
                    li_Active.RemoveElement(AR[i]);
                    J0x121:

                    i++;
                    // [Loop Continue]
                    goto J0xB4;
                }
            }
        }
        i = AR.Length - 1;
        J0x13A:

        // End:0x1A3 [Loop If]
        if(i >= 0)
        {
            // End:0x16B
            if(AR[i].Value == "")
            {
                AR.Remove(i, 1);
                // [Explicit Continue]
                goto J0x199;
            }
            MapHandler.InsertMap(GameIndex, RecordIndex, AR[i].Value, idx);
            J0x199:

            i--;
            // [Loop Continue]
            goto J0x13A;
        }
        li_Active.InternalOnDragDrop(li_Active);
        return true;
    }
    return false;
    //return;    
}

function bool RemoveDragDrop(GUIComponent Sender)
{
    local array<GUITreeNode> AR;
    local int i;

    // End:0xB7
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

        // End:0xA2 [Loop If]
        if(i < AR.Length)
        {
            // End:0x6F
            if(AR[i].Value == "")
            {
                // [Explicit Continue]
                goto J0x98;
            }
            MapHandler.RemoveMap(GameIndex, RecordIndex, AR[i].Value);
            J0x98:

            i++;
            // [Loop Continue]
            goto J0x45;
        }
        return li_Avail.InternalOnDragDrop(Sender);
    }
    return false;
    //return;    
}

function AddMapOption(string MapName, string OptionName, optional string Value)
{
    //return;    
}

function InternalCheckLinkedObj(GUIListBase List)
{
    // End:0x24
    if(List.IsValid())
    {
        List.EnableLinkedObjects();        
    }
    else
    {
        List.DisableLinkedObjects();
    }
    // End:0x55
    if(li_Avail.ItemCount > 0)
    {
        EnableComponent(b_AddAll);        
    }
    else
    {
        DisableComponent(b_AddAll);
    }
    // End:0x82
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);        
    }
    else
    {
        DisableComponent(b_RemoveAll);
    }
    // End:0xAF
    if(li_Active.Index == 0)
    {
        DisableComponent(b_MoveUp);        
    }
    else
    {
        // End:0xDE
        if(li_Active.Index == (li_Active.ItemCount - 1))
        {
            DisableComponent(b_MoveDown);
        }
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x59
    if((moButton(Sender) != none) && GUILabel(NewComp) != none)
    {
        GUILabel(NewComp).TextColor = WhiteColor;
        moButton(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function StoreMaplists()
{
    local int i, idx;

    MapHandler.ApplyMapList(GameIndex, RecordIndex);
    i = 0;
    J0x20:

    // End:0xA2 [Loop If]
    if(i < co_Maplist.ItemCount())
    {
        idx = MapHandler.GetRecordIndex(GameIndex, co_Maplist.List.GetItemAtIndex(i));
        // End:0x98
        if(idx != RecordIndex)
        {
            MapHandler.SaveMapList(GameIndex, idx);
        }
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

function UpdateCustomMapList(optional string NewName)
{
    // End:0x30
    if(NewName != "")
    {
        RecordIndex = MapHandler.RenameList(GameIndex, RecordIndex, NewName);
    }
    MapHandler.SaveMapList(GameIndex, RecordIndex);
    //return;    
}

function string GetMapPrefix()
{
    return CurrentGameType.MapPrefix;
    //return;    
}

function string GetMapListClass()
{
    return CurrentGameType.MapListClassName;
    //return;    
}

function int FindCacheRecordIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName == MapName)
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

event free()
{
    MapHandler = none;
    MainPanel = none;
    super(GUIPage).free();
    //return;    
}

defaultproperties
{
    // Reference: GUITreeListBox'GUI2K4_Decompressed.MaplistEditor.ActiveMaps'
    begin object name="ActiveMaps" class=XInterface.GUITreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=ActiveMaps.InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        TabOrder=7
    end object
    lb_ActiveMaps=ActiveMaps
    // Reference: GUITreeListBox'GUI2K4_Decompressed.MaplistEditor.InactiveMaps'
    begin object name="InactiveMaps" class=XInterface.GUITreeListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InactiveMaps.InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=4
    end object
    lb_AllMaps=InactiveMaps
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.AddButton'
    begin object name="AddButton" class=XInterface.GUIButton
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
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=AddButton.InternalOnKeyEvent
    end object
    b_Add=AddButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.AddAllButton'
    begin object name="AddAllButton" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?? ?? ????? ?????."
        WinTop=0.8525380
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0563120
        TabOrder=5
        bScaleToParent=true
        OnClickSound=3
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=AddAllButton.InternalOnKeyEvent
    end object
    b_AddAll=AddAllButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.RemoveButton'
    begin object name="RemoveButton" class=XInterface.GUIButton
        Caption="? ??"
        AutoSizePadding=(HorzPerc=0.5000000,VertPerc=0.0000000)
        Hint="???? ?? ?????? ?????."
        WinTop=0.8981110
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=10
        bScaleToParent=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=RemoveButton.InternalOnKeyEvent
    end object
    b_Remove=RemoveButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.RemoveAllButton'
    begin object name="RemoveAllButton" class=XInterface.GUIButton
        Caption="?? ? ??"
        Hint="??? ????? ?? ??? ?????."
        WinTop=0.8981110
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0563120
        TabOrder=11
        bScaleToParent=true
        OnClickSound=4
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
    end object
    b_RemoveAll=RemoveAllButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.MoveUpButton'
    begin object name="MoveUpButton" class=XInterface.GUIButton
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
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=MoveUpButton.InternalOnKeyEvent
    end object
    b_MoveUp=MoveUpButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.MoveDownButton'
    begin object name="MoveDownButton" class=XInterface.GUIButton
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
        OnClick=MaplistEditor.ModifyMapList
        OnKeyEvent=MoveDownButton.InternalOnKeyEvent
    end object
    b_MoveDown=MoveDownButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.NewMaplistButton'
    begin object name="NewMaplistButton" class=XInterface.GUIButton
        Caption="?? ???"
        bAutoSize=true
        Hint="??? ??? ????? ???? ? ????."
        WinTop=0.1025510
        WinLeft=0.0606710
        WinWidth=0.1230200
        WinHeight=0.0563120
        TabOrder=1
        OnClick=MaplistEditor.CustomMaplistClick
        OnKeyEvent=NewMaplistButton.InternalOnKeyEvent
    end object
    b_New=NewMaplistButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.DeleteMaplistButton'
    begin object name="DeleteMaplistButton" class=XInterface.GUIButton
        Caption="?????? ??"
        bAutoSize=true
        Hint="??? ????? ?????. ??? ???? ????? ??? ?? ????? ?? ??? ??? ????? ????? ?????."
        WinTop=0.1025510
        WinLeft=0.3180240
        WinWidth=0.1230200
        WinHeight=0.0563120
        TabOrder=3
        OnPreDraw=MaplistEditor.ButtonPreDraw
        OnClick=MaplistEditor.CustomMaplistClick
        OnKeyEvent=DeleteMaplistButton.InternalOnKeyEvent
    end object
    b_Delete=DeleteMaplistButton
    // Reference: GUIButton'GUI2K4_Decompressed.MaplistEditor.RenameMaplistButton'
    begin object name="RenameMaplistButton" class=XInterface.GUIButton
        Caption="?????"
        bAutoSize=true
        Hint="???? ????? ????? ?????."
        WinTop=0.1025510
        WinLeft=0.1893480
        WinWidth=0.1230200
        WinHeight=0.0563120
        TabOrder=2
        OnClick=MaplistEditor.CustomMaplistClick
        OnKeyEvent=RenameMaplistButton.InternalOnKeyEvent
    end object
    b_Rename=RenameMaplistButton
    // Reference: GUIComboBox'GUI2K4_Decompressed.MaplistEditor.SelectMaplistCombo'
    begin object name="SelectMaplistCombo" class=XInterface.GUIComboBox
        bReadOnly=true
        Hint="?? ???? ??? ????? ?????."
        WinTop=0.1098080
        WinLeft=0.4715500
        WinWidth=0.4413840
        WinHeight=0.0450830
        TabOrder=0
        OnChange=MaplistEditor.MaplistSelectChange
        OnKeyEvent=SelectMaplistCombo.InternalOnKeyEvent
    end object
    co_Maplist=SelectMaplistCombo
    // Reference: AltSectionBackground'GUI2K4_Decompressed.MaplistEditor.MapListSectionBackground'
    begin object name="MapListSectionBackground" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.0551620
        WinLeft=0.0236460
        WinWidth=0.9431000
        WinHeight=0.1905950
        OnPreDraw=MapListSectionBackground.InternalPreDraw
    end object
    sb_MapList=MapListSectionBackground
    // Reference: GUISectionBackground'GUI2K4_Decompressed.MaplistEditor.InactiveBackground'
    begin object name="InactiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="????? ?? ?"
        WinTop=0.2618350
        WinLeft=0.0349140
        WinWidth=0.4654320
        WinHeight=0.5649170
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InactiveBackground.InternalPreDraw
    end object
    sb_Avail=InactiveBackground
    // Reference: GUISectionBackground'GUI2K4_Decompressed.MaplistEditor.ActiveBackground'
    begin object name="ActiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        WinTop=0.2618350
        WinLeft=0.5112430
        WinWidth=0.4654320
        WinHeight=0.5649170
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=ActiveBackground.InternalPreDraw
    end object
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
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.0381250
    DefaultTop=0.0216800
    DefaultWidth=0.9303130
    DefaultHeight=0.9313050
    InactiveFadeColor=(R=80,G=80,B=80,A=255)
    WinTop=0.0216800
    WinLeft=0.0381250
    WinWidth=0.9303130
    WinHeight=0.9313050
}