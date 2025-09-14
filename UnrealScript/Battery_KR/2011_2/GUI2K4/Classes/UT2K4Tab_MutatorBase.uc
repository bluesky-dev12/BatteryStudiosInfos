class UT2K4Tab_MutatorBase extends UT2K4GameTabBase
    editinlinenew
    instanced;

var string LastActiveMutators;
var() automated GUISectionBackground sb_Avail;
var() automated GUISectionBackground sb_Active;
var() automated GUISectionBackground sb_Description;
var() automated GUIListBox lb_Avail;
var() automated GUIListBox lb_Active;
var() automated GUIScrollTextBox lb_MutDesc;
var() automated GUIButton b_Config;
var() automated GUIButton b_Add;
var() automated GUIButton b_AddAll;
var() automated GUIButton b_Remove;
var() automated GUIButton b_RemoveAll;
var GameRecord currentGame;
var array<MutatorRecord> MutatorList;
var string MutConfigMenu;
var localized string GroupConflictText;
var localized string ThisText;
var localized string TheseText;
var localized string ContextItems[3];
var bool bIsMultiplayer;
//var delegate<OnChangeMutators> __OnChangeMutators__Delegate;

delegate OnChangeMutators(string ActiveMutatorString)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x8F
    if(lb_Avail.List != none)
    {
        lb_Avail.List.__OnDragDrop__Delegate = RemoveMutatorDrop;
        lb_Avail.List.bInitializeList = false;
        lb_Avail.List.bDropSource = true;
        lb_Avail.List.bDropTarget = true;
    }
    // End:0x10E
    if(lb_Active.List != none)
    {
        lb_Active.List.__OnDragDrop__Delegate = AddMutatorDrop;
        lb_Active.List.bInitializeList = false;
        lb_Active.List.bDropSource = true;
        lb_Active.List.bDropTarget = true;
    }
    // End:0x18B
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
    //return;    
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
    //return;    
}

function SetCurrentGame(GameRecord currentGame)
{
    local int i;
    local string M, t;
    local Class<GameInfo> GameClass;

    // End:0x1B
    if(MutatorList.Length > 0)
    {
        M = BuildActiveMutatorString();        
    }
    else
    {
        M = LastActiveMutators;
    }
    Class'Engine.CacheManager'.static.GetMutatorList(MutatorList);
    GameClass = Class<GameInfo>(DynamicLoadObject(currentGame.ClassName, Class'Core.Class'));
    // End:0xB6
    if(GameClass != none)
    {
        i = MutatorList.Length - 1;
        J0x71:

        // End:0xB6 [Loop If]
        if(i >= 0)
        {
            // End:0xAC
            if(!GameClass.static.AllowMutator(MutatorList[i].ClassName))
            {
                MutatorList.Remove(i, 1);
            }
            i--;
            // [Loop Continue]
            goto J0x71;
        }
    }
    lb_Active.List.bNotify = false;
    lb_Avail.List.bNotify = false;
    lb_Active.List.Clear();
    lb_Avail.List.Clear();
    i = 0;
    J0x121:

    // End:0x174 [Loop If]
    if(i < MutatorList.Length)
    {
        lb_Avail.List.Add(MutatorList[i].FriendlyName,, MutatorList[i].Description);
        i++;
        // [Loop Continue]
        goto J0x121;
    }
    t = NextMutatorInString(M);
    J0x185:

    // End:0x1B0 [Loop If]
    if(t != "")
    {
        SelectMutator(t);
        t = NextMutatorInString(M);
        // [Loop Continue]
        goto J0x185;
    }
    lb_Active.List.bNotify = true;
    lb_Avail.List.bNotify = true;
    lb_Active.List.CheckLinkedObjects(lb_Active.List);
    lb_Avail.List.CheckLinkedObjects(lb_Avail.List);
    //return;    
}

function InternalCheckObj(GUIListBase List)
{
    // End:0x89
    if(List != none)
    {
        // End:0x7A
        if(List.IsValid())
        {
            List.EnableLinkedObjects();
            // End:0x77
            if((List.ItemCount > 0) && Controller.bCurMenuInitialized)
            {
                lb_MutDesc.SetContent(GUIList(List).GetExtra());
            }            
        }
        else
        {
            List.DisableLinkedObjects();
        }
    }
    // End:0xBF
    if(lb_Active.List.ItemCount > 0)
    {
        EnableComponent(b_Config);
        EnableComponent(b_RemoveAll);        
    }
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
    else
    {
        DisableComponent(b_AddAll);
    }
    //return;    
}

function string Play()
{
    local string URL;
    local bool B;

    // End:0x8A
    if(!Class'Engine.LevelInfo'.static.IsDemoBuild())
    {
        URL = BuildActiveMutatorString();
        B = (URL != LastActiveMutators) || URL != default.LastActiveMutators;
        // End:0x76
        if(URL != "")
        {
            LastActiveMutators = URL;
            URL = "?Mutator=" $ URL;            
        }
        else
        {
            LastActiveMutators = "";
        }
        // End:0x8A
        if(B)
        {
            SaveConfig();
        }
    }
    return URL;
    //return;    
}

function string BuildActiveMutatorString()
{
    local string str, Result;
    local int i;

    i = 0;
    J0x07:

    // End:0x8D [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Result;
    //return;    
}

function string ResolveMutator(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < MutatorList.Length)
    {
        // End:0x42
        if(MutatorList[i].FriendlyName ~= FriendlyName)
        {
            return MutatorList[i].ClassName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function string NextMutatorInString(out string mut)
{
    local string t;
    local int P;

    // End:0x0F
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
    //return;    
}

function SelectMutator(string mutClass)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < MutatorList.Length)
    {
        // End:0x6B
        if((MutatorList[i].ClassName ~= mutClass) && lb_Avail.List.Find(MutatorList[i].FriendlyName) != "")
        {
            AddMutator(none);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool AvailDBLClick(GUIComponent Sender)
{
    AddMutator(Sender);
    return true;
    //return;    
}

function bool SelectedDBLClick(GUIComponent Sender)
{
    RemoveMutator(Sender);
    return true;
    //return;    
}

function bool MutConfigClick(GUIComponent Sender)
{
    local array<string> MutClassNames;
    local int i;

    MutClassNames.Length = lb_Active.List.ItemCount;
    i = 0;
    J0x25:

    // End:0x7F [Loop If]
    if(i < lb_Active.List.ItemCount)
    {
        MutClassNames[i] = ResolveMutator(lb_Active.List.GetItemAtIndex(i));
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    // End:0xF9
    if(Controller.OpenMenu(MutConfigMenu))
    {
        MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
        MutatorConfigMenu(Controller.ActivePage).bIsMultiplayer = bIsMultiplayer;
        MutatorConfigMenu(Controller.ActivePage).Initialize();
    }
    return true;
    //return;    
}

function ListChange(GUIComponent Sender)
{
    // End:0x43
    if(Sender == lb_Avail)
    {
        lb_Active.List.SilentSetIndex(-1);
        InternalCheckObj(lb_Active.List);        
    }
    else
    {
        // End:0x86
        if(Sender == lb_Active)
        {
            lb_Avail.List.SilentSetIndex(-1);
            InternalCheckObj(lb_Avail.List);            
        }
        else
        {
            lb_MutDesc.SetContent("");
        }
    }
    //return;    
}

function bool AddingGroup(string Group)
{
    local int i;
    local GUIListElem Element;
    local bool bConflict;

    // End:0x0E
    if(Group == "")
    {
        return false;
    }
    i = lb_Active.List.ItemCount - 1;
    J0x2E:

    // End:0xFE [Loop If]
    if(i >= 0)
    {
        // End:0xF4
        if((GetGroupFor(lb_Active.List.GetItemAtIndex(i))) ~= Group)
        {
            lb_Active.List.GetAtIndex(i, Element.Item, Element.ExtraData, Element.ExtraStrData);
            lb_Avail.List.AddElement(Element);
            lb_Active.List.RemoveSilent(i, 1);
            SetFooterCaption(GroupConflictText, 2.0000000);
            bConflict = true;
        }
        i--;
        // [Loop Continue]
        goto J0x2E;
    }
    return bConflict;
    //return;    
}

function string GetGroupFor(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < MutatorList.Length)
    {
        // End:0x42
        if(MutatorList[i].FriendlyName ~= FriendlyName)
        {
            return MutatorList[i].GroupName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function bool AddMutator(GUIComponent Sender)
{
    local int i, j;
    local string gname;
    local array<GUIListElem> PendingElements;
    local array<string> Groups;

    // End:0x1F
    if(!lb_Avail.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Avail.List.GetPendingElements(true);
    lb_Avail.List.bNotify = false;
    i = PendingElements.Length - 1;
    J0x67:

    // End:0x151 [Loop If]
    if(i >= 0)
    {
        gname = GetGroupFor(PendingElements[i].Item);
        j = 0;
        J0x95:

        // End:0xD3 [Loop If]
        if(j < Groups.Length)
        {
            // End:0xC9
            if(Groups[j] ~= gname)
            {
                PendingElements.Remove(i, 1);
                // [Explicit Break]
                goto J0xD3;
            }
            j++;
            // [Loop Continue]
            goto J0x95;
        }
        J0xD3:

        // End:0xF4
        if(j == Groups.Length)
        {
            Groups[j] = gname;
        }
        lb_Avail.List.RemoveElement(PendingElements[i],, true);
        AddingGroup(gname);
        lb_Active.List.AddElement(PendingElements[i]);
        i--;
        // [Loop Continue]
        goto J0x67;
    }
    lb_Avail.List.bNotify = true;
    lb_Avail.List.ClearPendingElements();
    lb_Avail.List.SetIndex(lb_Avail.List.Index);
    // End:0x1E5
    if(lb_Avail.List.bSorted)
    {
        lb_Avail.List.Sort();
    }
    return true;
    //return;    
}

function bool AddMutatorDrop(GUIComponent Sender)
{
    local array<GUIListElem> PendingElements;
    local array<string> Groups;
    local string gname;
    local int i, j;

    // End:0x30
    if((Controller == none) || Controller.DropSource != lb_Avail.List)
    {
        return false;
    }
    // End:0x4F
    if(!lb_Avail.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Avail.List.GetPendingElements();
    i = PendingElements.Length - 1;
    J0x7C:

    // End:0x12F [Loop If]
    if(i >= 0)
    {
        gname = GetGroupFor(PendingElements[i].Item);
        j = 0;
        J0xAA:

        // End:0xF9 [Loop If]
        if(j < Groups.Length)
        {
            // End:0xEF
            if(Groups[j] ~= gname)
            {
                RemovePendingMutator(PendingElements[i]);
                PendingElements.Remove(i, 1);
                // [Explicit Break]
                goto J0xF9;
            }
            j++;
            // [Loop Continue]
            goto J0xAA;
        }
        J0xF9:

        // End:0x11A
        if(j == Groups.Length)
        {
            Groups[j] = gname;
        }
        AddingGroup(gname);
        i--;
        // [Loop Continue]
        goto J0x7C;
    }
    return lb_Active.List.InternalOnDragDrop(Sender);
    //return;    
}

function bool RemoveMutatorDrop(GUIComponent Sender)
{
    // End:0x30
    if((Controller == none) || Controller.DropSource != lb_Active.List)
    {
        return false;
    }
    return lb_Avail.List.InternalOnDragDrop(Sender);
    //return;    
}

function RemovePendingMutator(GUIListElem elem, optional GUIList List)
{
    local int i, Index;

    // End:0x1F
    if(List == none)
    {
        List = lb_Avail.List;
    }
    Index = List.FindIndex(elem.Item);
    // End:0xB2
    if(Index == -1)
    {
        Log(("RemovePendingMutator() not executed.  Item not found in available list:" $ elem.Item) @ elem.ExtraStrData);
        return;
    }
    i = 0;
    J0xB9:

    // End:0x112 [Loop If]
    if(i < List.SelectedItems.Length)
    {
        // End:0x108
        if(List.SelectedItems[i] == Index)
        {
            List.SelectedItems.Remove(i, 1);
            // [Explicit Break]
            goto J0x112;
        }
        i++;
        // [Loop Continue]
        goto J0xB9;
    }
    J0x112:

    i = 0;
    J0x119:

    // End:0x174 [Loop If]
    if(i < List.SelectedElements.Length)
    {
        // End:0x16A
        if(List.SelectedElements[i] == elem)
        {
            List.SelectedElements.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x119;
    }
    //return;    
}

function bool RemoveMutator(GUIComponent Sender)
{
    local int i;
    local array<GUIListElem> PendingElements;

    // End:0x1F
    if(!lb_Active.List.IsValid())
    {
        return true;
    }
    PendingElements = lb_Active.List.GetPendingElements(true);
    lb_Active.List.bNotify = false;
    i = 0;
    J0x5F:

    // End:0xC1 [Loop If]
    if(i < PendingElements.Length)
    {
        lb_Active.List.RemoveElement(PendingElements[i],, true);
        lb_Avail.List.AddElement(PendingElements[i]);
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    lb_Active.List.bNotify = true;
    lb_Active.List.ClearPendingElements();
    return true;
    //return;    
}

function bool AddAllMutators(GUIComponent Sender)
{
    local int i;
    local array<GUIListElem> elem;

    elem = lb_Avail.List.Elements;
    lb_Avail.List.Clear();
    i = 0;
    J0x3C:

    // End:0x95 [Loop If]
    if(i < elem.Length)
    {
        AddingGroup(GetGroupFor(elem[i].Item));
        lb_Active.List.AddElement(elem[i]);
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool RemoveAllMutators(GUIComponent Sender)
{
    lb_Avail.List.LoadFrom(lb_Active.List, false);
    lb_Active.List.Clear();
    return true;
    //return;    
}

function ContextClick(GUIContextMenu Sender, int Index)
{
    local array<string> MutClassNames, MutNames;
    local int i;

    // End:0xEE
    if(Sender == lb_Avail.ContextMenu)
    {
        // End:0xD9
        if(Index == 1)
        {
            MutNames = lb_Avail.List.GetPendingItems(true);
            i = 0;
            J0x49:

            // End:0x80 [Loop If]
            if(i < MutNames.Length)
            {
                MutClassNames[i] = ResolveMutator(MutNames[i]);
                i++;
                // [Loop Continue]
                goto J0x49;
            }
            // End:0xD6
            if(Controller.OpenMenu(MutConfigMenu))
            {
                MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
                MutatorConfigMenu(Controller.ActivePage).Initialize();
            }            
        }
        else
        {
            // End:0xEB
            if(Index == 0)
            {
                AddMutator(none);
            }
        }        
    }
    else
    {
        // End:0x1D9
        if(Sender == lb_Active.ContextMenu)
        {
            // End:0x1C7
            if(Index == 1)
            {
                MutNames = lb_Active.List.GetPendingItems(true);
                i = 0;
                J0x137:

                // End:0x16E [Loop If]
                if(i < MutNames.Length)
                {
                    MutClassNames[i] = ResolveMutator(MutNames[i]);
                    i++;
                    // [Loop Continue]
                    goto J0x137;
                }
                // End:0x1C4
                if(Controller.OpenMenu(MutConfigMenu))
                {
                    MutatorConfigMenu(Controller.ActivePage).ActiveMuts = MutClassNames;
                    MutatorConfigMenu(Controller.ActivePage).Initialize();
                }                
            }
            else
            {
                // End:0x1D9
                if(Index == 0)
                {
                    RemoveMutator(none);
                }
            }
        }
    }
    //return;    
}

function bool ContextMenuOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent InMenuOwner)
{
    local array<string> items;

    // End:0x15E
    if((GUIListBox(InMenuOwner) != none) && GUIList(Sender) != none)
    {
        items = GUIList(Sender).GetPendingItems(true);
        // End:0xD4
        if(items.Length == 1)
        {
            // End:0x82
            if(InMenuOwner == lb_Avail)
            {
                Menu.ContextItems[0] = Repl(ContextItems[0], "%text%", ThisText);                
            }
            else
            {
                Menu.ContextItems[0] = Repl(ContextItems[1], "%text%", ThisText);
            }
            Menu.ContextItems[1] = Repl(ContextItems[2], "%text%", ThisText);            
        }
        else
        {
            // End:0x10D
            if(InMenuOwner == lb_Avail)
            {
                Menu.ContextItems[0] = Repl(ContextItems[0], "%text%", TheseText);                
            }
            else
            {
                Menu.ContextItems[0] = Repl(ContextItems[1], "%text%", TheseText);
            }
            Menu.ContextItems[1] = Repl(ContextItems[2], "%text%", TheseText);
        }
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.AvailBackground'
    begin object name="AvailBackground" class=XInterface.GUISectionBackground
        Caption="?? ??? ????"
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.0025000
        BottomPadding=0.0025000
        WinTop=0.0366140
        WinLeft=0.0251560
        WinWidth=0.3808590
        WinHeight=0.5476970
        OnPreDraw=AvailBackground.InternalPreDraw
    end object
    sb_Avail=AvailBackground
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.ActiveBackground'
    begin object name="ActiveBackground" class=XInterface.GUISectionBackground
        Caption="??? ????"
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.0025000
        BottomPadding=0.0025000
        WinTop=0.0366140
        WinLeft=0.5868760
        WinWidth=0.3808590
        WinHeight=0.5476970
        OnPreDraw=ActiveBackground.InternalPreDraw
    end object
    sb_Active=ActiveBackground
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.DescriptionBackground'
    begin object name="DescriptionBackground" class=XInterface.GUISectionBackground
        Caption="???? ????"
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.0025000
        BottomPadding=0.0025000
        WinTop=0.6106780
        WinLeft=0.0259760
        WinWidth=0.9429690
        WinHeight=0.2917960
        OnPreDraw=DescriptionBackground.InternalPreDraw
    end object
    sb_Description=DescriptionBackground
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorAvailList'
    begin object name="IAMutatorAvailList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        HandleContextMenuOpen=UT2K4Tab_MutatorBase.ContextMenuOpen
        OnCreateComponent=IAMutatorAvailList.InternalOnCreateComponent
        Hint="????? ???? ???."
        WinTop=0.1449370
        WinLeft=0.0261080
        WinWidth=0.3789550
        WinHeight=0.5014460
        TabOrder=0
        ContextMenu=GUIContextMenu'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.RCMenu'
        OnChange=UT2K4Tab_MutatorBase.ListChange
    end object
    lb_Avail=IAMutatorAvailList
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorSelectedList'
    begin object name="IAMutatorSelectedList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=IAMutatorSelectedList.InternalOnCreateComponent
        Hint="?? ???? ????? ??? ???."
        WinTop=0.1449370
        WinLeft=0.5843760
        WinWidth=0.3789550
        WinHeight=0.5014460
        TabOrder=5
        ContextMenu=GUIContextMenu'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.RCMenu'
        OnChange=UT2K4Tab_MutatorBase.ListChange
    end object
    lb_Active=IAMutatorSelectedList
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorScroll'
    begin object name="IAMutatorScroll" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        bVisibleWhenEmpty=true
        OnCreateComponent=IAMutatorScroll.InternalOnCreateComponent
        WinTop=0.6485950
        WinLeft=0.0283330
        WinWidth=0.9382540
        WinHeight=0.2442960
        bTabStop=false
        bNeverFocus=true
    end object
    lb_MutDesc=IAMutatorScroll
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorConfig'
    begin object name="IAMutatorConfig" class=XInterface.GUIButton
        Caption="???? ??"
        Hint="??? ????? ?????."
        WinTop=0.9334900
        WinLeft=0.7294920
        WinWidth=0.2390630
        WinHeight=0.0546480
        TabOrder=6
        bVisible=false
        OnClick=UT2K4Tab_MutatorBase.MutConfigClick
        OnKeyEvent=IAMutatorConfig.InternalOnKeyEvent
    end object
    b_Config=IAMutatorConfig
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorAdd'
    begin object name="IAMutatorAdd" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ???? ?????."
        WinTop=0.1941140
        WinLeft=0.4250000
        WinWidth=0.1450000
        WinHeight=0.0500000
        TabOrder=1
        OnClickSound=3
        OnClick=UT2K4Tab_MutatorBase.AddMutator
        OnKeyEvent=IAMutatorAdd.InternalOnKeyEvent
    end object
    b_Add=IAMutatorAdd
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorAll'
    begin object name="IAMutatorAll" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?? ?????? ??? ???? ???? ?????.."
        WinTop=0.2592180
        WinLeft=0.4250000
        WinWidth=0.1450000
        WinHeight=0.0500000
        TabOrder=2
        OnClickSound=3
        OnClick=UT2K4Tab_MutatorBase.AddAllMutators
        OnKeyEvent=IAMutatorAll.InternalOnKeyEvent
    end object
    b_AddAll=IAMutatorAll
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorRemove'
    begin object name="IAMutatorRemove" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ????? ????."
        WinTop=0.4243220
        WinLeft=0.4250000
        WinWidth=0.1450000
        WinHeight=0.0500000
        TabOrder=4
        OnClickSound=4
        OnClick=UT2K4Tab_MutatorBase.RemoveMutator
        OnKeyEvent=IAMutatorRemove.InternalOnKeyEvent
    end object
    b_Remove=IAMutatorRemove
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MutatorBase.IAMutatorClear'
    begin object name="IAMutatorClear" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?? ?????? ??? ???? ????? ?????."
        WinTop=0.3602590
        WinLeft=0.4250000
        WinWidth=0.1450000
        WinHeight=0.0500000
        TabOrder=3
        OnClickSound=4
        OnClick=UT2K4Tab_MutatorBase.RemoveAllMutators
        OnKeyEvent=IAMutatorClear.InternalOnKeyEvent
    end object
    b_RemoveAll=IAMutatorClear
    MutConfigMenu="GUI2K4.MutatorConfigMenu"
    GroupConflictText="???? ?? ?????? ??? ??? ? ????."
    ThisText="? ????"
    TheseText="? ?????"
    ContextItems[0]="%text% ??"
    ContextItems[1]="%text% ??"
    ContextItems[2]="%text% ??"
    WinTop=0.1500000
    WinHeight=0.7700000
}