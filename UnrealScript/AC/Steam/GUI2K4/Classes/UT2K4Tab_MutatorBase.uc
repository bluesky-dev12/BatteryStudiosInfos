/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MutatorBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:25
 *
 *******************************************************************************/
class UT2K4Tab_MutatorBase extends UT2K4GameTabBase
    dependson(UT2K4GameTabBase)
    editinlinenew
    instanced;

var string LastActiveMutators;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Active;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Description;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Active;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MutDesc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Config;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Add;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_AddAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Remove;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveAll;
var GameRecord currentGame;
var array<MutatorRecord> MutatorList;
var string MutConfigMenu;
var localized string GroupConflictText;
var localized string ThisText;
var localized string TheseText;
var localized string ContextItems[3];
var bool bIsMultiplayer;
var delegate<OnChangeMutators> __OnChangeMutators__Delegate;

delegate OnChangeMutators(string ActiveMutatorString);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x8f
    if(lb_Avail.List != none)
    {
        lb_Avail.List.__OnDragDrop__Delegate = RemoveMutatorDrop;
        lb_Avail.List.bInitializeList = false;
        lb_Avail.List.bDropSource = true;
        lb_Avail.List.bDropTarget = true;
    }
    // End:0x10e
    if(lb_Active.List != none)
    {
        lb_Active.List.__OnDragDrop__Delegate = AddMutatorDrop;
        lb_Active.List.bInitializeList = false;
        lb_Active.List.bDropSource = true;
        lb_Active.List.bDropTarget = true;
    }
    // End:0x18b
    if(lb_Avail.ContextMenu != none)
    {
        lb_Avail.ContextMenu.__OnSelect__Delegate = ContextClick;
        lb_Avail.ContextMenu.__OnOpen__Delegate = lb_Avail.MyOpen;
        lb_Avail.ContextMenu.__OnClose__Delegate = lb_Avail.MyClose;
    }
    // End:0x208
    if(lb_Active.ContextMenu != none)
    {
        lb_Active.ContextMenu.__OnSelect__Delegate = ContextClick;
        lb_Active.ContextMenu.__OnOpen__Delegate = lb_Active.MyOpen;
        lb_Active.ContextMenu.__OnClose__Delegate = lb_Active.MyClose;
    }
    lb_Avail.List.__OnDblClick__Delegate = AvailDBLClick;
    lb_Active.List.__OnDblClick__Delegate = SelectedDBLClick;
    lb_Avail.List.__CheckLinkedObjects__Delegate = InternalCheckObj;
    lb_Avail.List.AddLinkObject(b_Add, true);
    lb_Active.List.__CheckLinkedObjects__Delegate = InternalCheckObj;
    lb_Active.List.AddLinkObject(b_Remove, true);
    lb_Active.List.DisableLinkedObjects();
    lb_Avail.List.DisableLinkedObjects();
    InternalCheckObj(none);
    sb_Avail.ManageComponent(lb_Avail);
    sb_Active.ManageComponent(lb_Active);
    sb_Description.ManageComponent(lb_MutDesc);
}

function ShowPanel(bool bShow)
{
    local string S;

    super(GUITabPanel).ShowPanel(bShow);
    // End:0x28
    if(bShow && bInit)
    {
        bInit = false;
    }
    // End:0x78
    if(!bShow && !bInit)
    {
        S = BuildActiveMutatorString();
        // End:0x78
        if(S != LastActiveMutators)
        {
            LastActiveMutators = S;
            OnChangeMutators(LastActiveMutators);
            SaveConfig();
        }
    }
}

function SetCurrentGame(GameRecord currentGame)
{
    local int i;
    local string M, t;
    local class<GameInfo> GameClass;

    // End:0x1b
    if(MutatorList.Length > 0)
    {
        M = BuildActiveMutatorString();
    }
    // End:0x26
    else
    {
        M = LastActiveMutators;
    }
    class'CacheManager'.static.GetMutatorList(MutatorList);
    GameClass = class<GameInfo>(DynamicLoadObject(currentGame.ClassName, class'Class'));
    // End:0xb6
    if(GameClass != none)
    {
        i = MutatorList.Length - 1;
        J0x71:
        // End:0xb6 [While If]
        if(i >= 0)
        {
            // End:0xac
            if(!GameClass.static.AllowMutator(MutatorList[i].ClassName))
            {
                MutatorList.Remove(i, 1);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x71;
        }
    }
    lb_Active.List.bNotify = false;
    lb_Avail.List.bNotify = false;
    lb_Active.List.Clear();
    lb_Avail.List.Clear();
    i = 0;
    J0x121:
    // End:0x174 [While If]
    if(i < MutatorList.Length)
    {
        lb_Avail.List.Add(MutatorList[i].FriendlyName,, MutatorList[i].Description);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x121;
    }
    t = NextMutatorInString(M);
    J0x185:
    // End:0x1b0 [While If]
    if(t != "")
    {
        SelectMutator(t);
        t = NextMutatorInString(M);
        // This is an implied JumpToken; Continue!
        goto J0x185;
    }
    lb_Active.List.bNotify = true;
    lb_Avail.List.bNotify = true;
    lb_Active.List.CheckLinkedObjects(lb_Active.List);
    lb_Avail.List.CheckLinkedObjects(lb_Avail.List);
}

function InternalCheckObj(GUIListBase List)
{
    // End:0x89
    if(List != none)
    {
        // End:0x7a
        if(List.IsValid())
        {
            List.EnableLinkedObjects();
            // End:0x77
            if(List.ItemCount > 0 && Controller.bCurMenuInitialized)
            {
                lb_MutDesc.SetContent(GUIList(List).GetExtra());
            }
        }
        // End:0x89
        else
        {
            List.DisableLinkedObjects();
        }
    }
    // End:0xbf
    if(lb_Active.List.ItemCount > 0)
    {
        EnableComponent(b_Config);
        EnableComponent(b_RemoveAll);
    }
    // End:0xd5
    else
    {
        DisableComponent(b_Config);
        DisableComponent(b_RemoveAll);
    }
    // End:0x100
    if(lb_Avail.List.ItemCount > 0)
    {
        EnableComponent(b_AddAll);
    }
    // End:0x10b
    else
    {
        DisableComponent(b_AddAll);
    }
}

function string Play()
{
    local string URL;
    local bool B;

    // End:0x8a
    if(!class'LevelInfo'.static.IsDemoBuild())
    {
        URL = BuildActiveMutatorString();
        B = URL != LastActiveMutators || URL != default.LastActiveMutators;
        // End:0x76
        if(URL != "")
        {
            LastActiveMutators = URL;
            URL = "?Mutator=" $ URL;
        }
        // End:0x7e
        else
        {
            LastActiveMutators = "";
        }
        // End:0x8a
        if(B)
        {
            SaveConfig();
        }
    }
    return URL;
}

function string BuildActiveMutatorString()
{
    local string str, Result;
    local int i;

    i = 0;
    J0x07:
    // End:0x8d [While If]
    if(i < lb_Active.List.ItemCount)
    {
        str = ResolveMutator(lb_Active.List.GetItemAtIndex(i));
        // End:0x83
        if(str != "")
        {
            // End:0x75
            if(Result != "")
            {
                Result $= ",";
            }
            Result $= str;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Result;
}

function string ResolveMutator(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < MutatorList.Length)
    {
        // End:0x42
        if(MutatorList[i].FriendlyName ~= FriendlyName)
        {
            return MutatorList[i].ClassName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function string NextMutatorInString(out string mut)
{
    local string t;
    local int P;

    // End:0x0f
    if(mut == "")
    {
        return "";
    }
    P = InStr(mut, ",");
    // End:0x37
    if(P < 0)
    {
        P = Len(mut);
    }
    EatStr(t, mut, P);
    mut = Mid(mut, 1);
    return t;
}

function SelectMutator(string mutClass)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < MutatorList.Length)
    {
        // End:0x6b
        if(MutatorList[i].ClassName ~= mutClass && lb_Avail.List.Find(MutatorList[i].FriendlyName) != "")
        {
            AddMutator(none);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool AvailDBLClick(GUIComponent Sender)
{
    AddMutator(Sender);
    return true;
}

function bool SelectedDBLClick(GUIComponent Sender)
{
    RemoveMutator(Sender);
    return true;
}

function bool MutConfigClick(GUIComponent Sender)
{
    local array<string> MutClassNames;
    local int i;

    MutClassNames.Length = lb_Active.List.ItemCount;
    i = 0;
    J0x25:
    // End:0x7f [While If]
    if(i < lb_Active.List.ItemCount)
    {
        MutClassNames[i] = ResolveMutator(lb_Active.List.GetItemAtIndex(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    // End:0xf9
    if(Controller.OpenMenu(MutConfigMenu))
    {
        MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
        MutatorConfigMenu(Controller.ActivePage).bIsMultiplayer = bIsMultiplayer;
        MutatorConfigMenu(Controller.ActivePage).Initialize();
    }
    return true;
}

function ListChange(GUIComponent Sender)
{
    // End:0x43
    if(Sender == lb_Avail)
    {
        lb_Active.List.SilentSetIndex(-1);
        InternalCheckObj(lb_Active.List);
    }
    // End:0x97
    else
    {
        // End:0x86
        if(Sender == lb_Active)
        {
            lb_Avail.List.SilentSetIndex(-1);
            InternalCheckObj(lb_Avail.List);
        }
        // End:0x97
        else
        {
            lb_MutDesc.SetContent("");
        }
    }
}

function bool AddingGroup(string Group)
{
    local int i;
    local GUIListElem Element;
    local bool bConflict;

    // End:0x0e
    if(Group == "")
    {
        return false;
    }
    i = lb_Active.List.ItemCount - 1;
    J0x2e:
    // End:0xfe [While If]
    if(i >= 0)
    {
        // End:0xf4
        if(GetGroupFor(lb_Active.List.GetItemAtIndex(i)) ~= Group)
        {
            lb_Active.List.GetAtIndex(i, Element.Item, Element.ExtraData, Element.ExtraStrData);
            lb_Avail.List.AddElement(Element);
            lb_Active.List.RemoveSilent(i, 1);
            SetFooterCaption(GroupConflictText, 2.0);
            bConflict = true;
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
    return bConflict;
}

function string GetGroupFor(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < MutatorList.Length)
    {
        // End:0x42
        if(MutatorList[i].FriendlyName ~= FriendlyName)
        {
            return MutatorList[i].GroupName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function bool AddMutator(GUIComponent Sender)
{
    local int i, j;
    local string gname;
    local array<GUIListElem> PendingElements;
    local array<string> Groups;

    // End:0x1f
    if(!lb_Avail.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Avail.List.GetPendingElements(true);
    lb_Avail.List.bNotify = false;
    i = PendingElements.Length - 1;
    J0x67:
    // End:0x151 [While If]
    if(i >= 0)
    {
        gname = GetGroupFor(PendingElements[i].Item);
        j = 0;
        J0x95:
        // End:0xd3 [While If]
        if(j < Groups.Length)
        {
            // End:0xc9
            if(Groups[j] ~= gname)
            {
                PendingElements.Remove(i, 1);
            }
            // End:0xd3
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x95;
            }
        }
        // End:0xf4
        if(j == Groups.Length)
        {
            Groups[j] = gname;
        }
        lb_Avail.List.RemoveElement(PendingElements[i],, true);
        AddingGroup(gname);
        lb_Active.List.AddElement(PendingElements[i]);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
    lb_Avail.List.bNotify = true;
    lb_Avail.List.ClearPendingElements();
    lb_Avail.List.SetIndex(lb_Avail.List.Index);
    // End:0x1e5
    if(lb_Avail.List.bSorted)
    {
        lb_Avail.List.Sort();
    }
    return true;
}

function bool AddMutatorDrop(GUIComponent Sender)
{
    local array<GUIListElem> PendingElements;
    local array<string> Groups;
    local string gname;
    local int i, j;

    // End:0x30
    if(Controller == none || Controller.DropSource != lb_Avail.List)
    {
        return false;
    }
    // End:0x4f
    if(!lb_Avail.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Avail.List.GetPendingElements();
    i = PendingElements.Length - 1;
    J0x7c:
    // End:0x12f [While If]
    if(i >= 0)
    {
        gname = GetGroupFor(PendingElements[i].Item);
        j = 0;
        J0xaa:
        // End:0xf9 [While If]
        if(j < Groups.Length)
        {
            // End:0xef
            if(Groups[j] ~= gname)
            {
                RemovePendingMutator(PendingElements[i]);
                PendingElements.Remove(i, 1);
            }
            // End:0xf9
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xaa;
            }
        }
        // End:0x11a
        if(j == Groups.Length)
        {
            Groups[j] = gname;
        }
        AddingGroup(gname);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
    return lb_Active.List.InternalOnDragDrop(Sender);
}

function bool RemoveMutatorDrop(GUIComponent Sender)
{
    // End:0x30
    if(Controller == none || Controller.DropSource != lb_Active.List)
    {
        return false;
    }
    return lb_Avail.List.InternalOnDragDrop(Sender);
}

function RemovePendingMutator(GUIListElem elem, optional GUIList List)
{
    local int i, Index;

    // End:0x1f
    if(List == none)
    {
        List = lb_Avail.List;
    }
    Index = List.FindIndex(elem.Item);
    // End:0xb2
    if(Index == -1)
    {
        Log("RemovePendingMutator() not executed.  Item not found in available list:" $ elem.Item @ elem.ExtraStrData);
        return;
    }
    i = 0;
    J0xb9:
    // End:0x112 [While If]
    if(i < List.SelectedItems.Length)
    {
        // End:0x108
        if(List.SelectedItems[i] == Index)
        {
            List.SelectedItems.Remove(i, 1);
        }
        // End:0x112
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xb9;
        }
    }
    i = 0;
    J0x119:
    // End:0x174 [While If]
    if(i < List.SelectedElements.Length)
    {
        // End:0x16a
        if(List.SelectedElements[i] == elem)
        {
            List.SelectedElements.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x119;
    }
}

function bool RemoveMutator(GUIComponent Sender)
{
    local int i;
    local array<GUIListElem> PendingElements;

    // End:0x1f
    if(!lb_Active.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Active.List.GetPendingElements(true);
    lb_Active.List.bNotify = false;
    i = 0;
    J0x5f:
    // End:0xc1 [While If]
    if(i < PendingElements.Length)
    {
        lb_Active.List.RemoveElement(PendingElements[i],, true);
        lb_Avail.List.AddElement(PendingElements[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    lb_Active.List.bNotify = true;
    lb_Active.List.ClearPendingElements();
    return true;
}

function bool AddAllMutators(GUIComponent Sender)
{
    local int i;
    local array<GUIListElem> elem;

    elem = lb_Avail.List.Elements;
    lb_Avail.List.Clear();
    i = 0;
    J0x3c:
    // End:0x95 [While If]
    if(i < elem.Length)
    {
        AddingGroup(GetGroupFor(elem[i].Item));
        lb_Active.List.AddElement(elem[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool RemoveAllMutators(GUIComponent Sender)
{
    lb_Avail.List.LoadFrom(lb_Active.List, false);
    lb_Active.List.Clear();
    return true;
}

function ContextClick(GUIContextMenu Sender, int Index)
{
    local array<string> MutClassNames, MutNames;
    local int i;

    // End:0xee
    if(Sender == lb_Avail.ContextMenu)
    {
        // End:0xd9
        if(Index == 1)
        {
            MutNames = lb_Avail.List.GetPendingItems(true);
            i = 0;
            J0x49:
            // End:0x80 [While If]
            if(i < MutNames.Length)
            {
                MutClassNames[i] = ResolveMutator(MutNames[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x49;
            }
            // End:0xd6
            if(Controller.OpenMenu(MutConfigMenu))
            {
                MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
                MutatorConfigMenu(Controller.ActivePage).Initialize();
            }
        }
        // End:0xeb
        else
        {
            // End:0xeb
            if(Index == 0)
            {
                AddMutator(none);
            }
        }
    }
    // End:0x1d9
    else
    {
        // End:0x1d9
        if(Sender == lb_Active.ContextMenu)
        {
            // End:0x1c7
            if(Index == 1)
            {
                MutNames = lb_Active.List.GetPendingItems(true);
                i = 0;
                J0x137:
                // End:0x16e [While If]
                if(i < MutNames.Length)
                {
                    MutClassNames[i] = ResolveMutator(MutNames[i]);
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x137;
                }
                // End:0x1c4
                if(Controller.OpenMenu(MutConfigMenu))
                {
                    MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
                    MutatorConfigMenu(Controller.ActivePage).Initialize();
                }
            }
            // End:0x1d9
            else
            {
                // End:0x1d9
                if(Index == 0)
                {
                    RemoveMutator(none);
                }
            }
        }
    }
}

function bool ContextMenuOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent InMenuOwner)
{
    local array<string> items;

    // End:0x15e
    if(GUIListBox(InMenuOwner) != none && GUIList(Sender) != none)
    {
        items = GUIList(Sender).GetPendingItems(true);
        // End:0xd4
        if(items.Length == 1)
        {
            // End:0x82
            if(InMenuOwner == lb_Avail)
            {
                Menu.ContextItems[0] = Repl(ContextItems[0], "%text%", ThisText);
            }
            // End:0xa9
            else
            {
                Menu.ContextItems[0] = Repl(ContextItems[1], "%text%", ThisText);
            }
            Menu.ContextItems[1] = Repl(ContextItems[2], "%text%", ThisText);
        }
        // End:0x15c
        else
        {
            // End:0x10d
            if(InMenuOwner == lb_Avail)
            {
                Menu.ContextItems[0] = Repl(ContextItems[0], "%text%", TheseText);
            }
            // End:0x134
            else
            {
                Menu.ContextItems[0] = Repl(ContextItems[1], "%text%", TheseText);
            }
            Menu.ContextItems[1] = Repl(ContextItems[2], "%text%", TheseText);
        }
        return true;
    }
    return false;
}

defaultproperties
{
    begin object name=AvailBackground class=GUISectionBackground
        Caption="?? ??? ????"
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.00250
        BottomPadding=0.00250
        WinTop=0.0366140
        WinLeft=0.0251560
        WinWidth=0.3808590
        WinHeight=0.5476970
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MutatorBase.AvailBackground'
    sb_Avail=AvailBackground
    begin object name=ActiveBackground class=GUISectionBackground
        Caption="??? ????"
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.00250
        BottomPadding=0.00250
        WinTop=0.0366140
        WinLeft=0.5868760
        WinWidth=0.3808590
        WinHeight=0.5476970
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MutatorBase.ActiveBackground'
    sb_Active=ActiveBackground
    begin object name=DescriptionBackground class=GUISectionBackground
        Caption="???? ????"
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.00250
        BottomPadding=0.00250
        WinTop=0.6106780
        WinLeft=0.0259760
        WinWidth=0.9429690
        WinHeight=0.2917960
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_MutatorBase.DescriptionBackground'
    sb_Description=DescriptionBackground
    begin object name=IAMutatorAvailList class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        HandleContextMenuOpen=ContextMenuOpen
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ???? ???."
        WinTop=0.1449370
        WinLeft=0.0261080
        WinWidth=0.3789550
        WinHeight=0.5014460
        TabOrder=0
        ContextMenu=GUIContextMenu'UT2K4Tab_MutatorBase.RCMenu'
        OnChange=ListChange
    object end
    // Reference: GUIListBox'UT2K4Tab_MutatorBase.IAMutatorAvailList'
    lb_Avail=IAMutatorAvailList
    begin object name=IAMutatorSelectedList class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ???? ????? ??? ???."
        WinTop=0.1449370
        WinLeft=0.5843760
        WinWidth=0.3789550
        WinHeight=0.5014460
        TabOrder=5
        ContextMenu=GUIContextMenu'UT2K4Tab_MutatorBase.RCMenu'
        OnChange=ListChange
    object end
    // Reference: GUIListBox'UT2K4Tab_MutatorBase.IAMutatorSelectedList'
    lb_Active=IAMutatorSelectedList
    begin object name=IAMutatorScroll class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6485950
        WinLeft=0.0283330
        WinWidth=0.9382540
        WinHeight=0.2442960
        bTabStop=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_MutatorBase.IAMutatorScroll'
    lb_MutDesc=IAMutatorScroll
    begin object name=IAMutatorConfig class=GUIButton
        Caption="???? ??"
        Hint="??? ????? ?????."
        WinTop=0.933490
        WinLeft=0.7294920
        WinWidth=0.2390630
        WinHeight=0.0546480
        TabOrder=6
        bVisible=true
        OnClick=MutConfigClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MutatorBase.IAMutatorConfig'
    b_Config=IAMutatorConfig
    begin object name=IAMutatorAdd class=GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ???? ?????."
        WinTop=0.1941140
        WinLeft=0.4250
        WinWidth=0.1450
        WinHeight=0.050
        TabOrder=1
        OnClickSound=3
        OnClick=AddMutator
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MutatorBase.IAMutatorAdd'
    b_Add=IAMutatorAdd
    begin object name=IAMutatorAll class=GUIButton
        Caption="?? ??"
        Hint="?? ?????? ??? ???? ???? ?????.."
        WinTop=0.2592180
        WinLeft=0.4250
        WinWidth=0.1450
        WinHeight=0.050
        TabOrder=2
        OnClickSound=3
        OnClick=AddAllMutators
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MutatorBase.IAMutatorAll'
    b_AddAll=IAMutatorAll
    begin object name=IAMutatorRemove class=GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ????? ????."
        WinTop=0.4243220
        WinLeft=0.4250
        WinWidth=0.1450
        WinHeight=0.050
        TabOrder=4
        OnClickSound=4
        OnClick=RemoveMutator
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MutatorBase.IAMutatorRemove'
    b_Remove=IAMutatorRemove
    begin object name=IAMutatorClear class=GUIButton
        Caption="?? ??"
        Hint="?? ?????? ??? ???? ????? ?????."
        WinTop=0.3602590
        WinLeft=0.4250
        WinWidth=0.1450
        WinHeight=0.050
        TabOrder=3
        OnClickSound=4
        OnClick=RemoveAllMutators
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MutatorBase.IAMutatorClear'
    b_RemoveAll=IAMutatorClear
    MutConfigMenu="GUI2K4.MutatorConfigMenu"
    GroupConflictText="???? ?? ?????? ??? ??? ? ????."
    ThisText="? ????"
    TheseText="? ?????"
    ContextItems[0]="%text% ??"
    ContextItems[1]="%text% ??"
    ContextItems[2]="%text% ??"
    WinTop=0.150
    WinHeight=0.770
}