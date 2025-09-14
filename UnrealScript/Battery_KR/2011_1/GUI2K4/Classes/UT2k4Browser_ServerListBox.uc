class UT2k4Browser_ServerListBox extends ServerBrowserMCListBox
    config(User)
    editinlinenew
    instanced;

var() config string OpenIPPage;
var bool bIconClick;
var float IconCounter;
var array<string> ContextItems;
var int JOINIDX;
var int SPECIDX;
var int REPINGIDX;
var int REFRESHIDX;
var int FILTERIDX;
var int TEMPLATEIDX;
var int CLEARFILTERIDX;
var int ADDFAVIDX;
var int OPENIPIDX;
var int COPYIDX;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBoxBase).InitComponent(MyController, myOwner);
    ContextItems = ContextMenu.ContextItems;
    //return;    
}

function SetToolTipText(string NewToolTipText)
{
    //return;    
}

function bool PreDrawHint(Canvas C)
{
    local export editinline UT2k4Browser_ServersList L;
    local int IconW, i;
    local float XL, YL, MaxWidth, TotalHeight;
    local export editinline GUIStyles S;

    L = UT2k4Browser_ServersList(List);
    // End:0x5A
    if(((((L == none) || Controller == none) || !MousingOverIcons()) || ToolTip == none) || ToolTip.Style == none)
    {
        return true;
    }
    // End:0x27F
    if(ToolTip.bResetPosition || ToolTip.bTrackMouse)
    {
        S = ToolTip.Style;
        i = 0;
        J0x9B:

        // End:0x1A3 [Loop If]
        if(i < L.Icons.Length)
        {
            IconW = L.Icons[i].MaterialUSize();
            S.TextSize(C, L.MenuState, L.IconDescriptions[i], XL, YL, L.FontScale);
            XL += (float(IconW) + (0.2000000 * float(IconW)));
            // End:0x15E
            if(XL > MaxWidth)
            {
                MaxWidth = XL;
            }
            YL = float(Max(int(YL), L.Icons[i].MaterialVSize()));
            TotalHeight += YL;
            i++;
            // [Loop Continue]
            goto J0x9B;
        }
        TotalHeight += float(S.BorderOffsets[1] + S.BorderOffsets[3]);
        ToolTip.WinWidth = (MaxWidth + float(S.BorderOffsets[0])) + float(S.BorderOffsets[2]);
        ToolTip.WinHeight = TotalHeight;
        ToolTip.WinTop = ToolTip.GetTop(C);
        ToolTip.WinLeft = ToolTip.GetLeft(C);
        ToolTip.bResetPosition = false;
    }
    return true;
    //return;    
}

function bool DrawHint(Canvas C)
{
    local export editinline GUIStyles S;
    local export editinline UT2k4Browser_ServersList L;
    local Plane NormMod;
    local int i, IconW, IconH;
    local float X, Y, XL, YL;

    L = UT2k4Browser_ServersList(List);
    // End:0x5A
    if(((((L == none) || Controller == none) || !MousingOverIcons()) || ToolTip == none) || ToolTip.Style == none)
    {
        return true;
    }
    S = ToolTip.Style;
    X = ToolTip.WinLeft;
    Y = ToolTip.WinTop;
    XL = ToolTip.WinWidth;
    YL = ToolTip.WinHeight;
    NormMod = C.ColorModulate;
    C.ColorModulate.W = 0.3000000;
    C.ColorModulate.X = 0.2000000;
    C.ColorModulate.Y = 0.2000000;
    C.ColorModulate.Z = 0.2000000;
    S.Draw(C, 0, X + float(2), Y + float(2), XL, YL);
    C.ColorModulate = NormMod;
    S.Draw(C, 0, X, Y, XL, YL);
    X += float(S.BorderOffsets[0]);
    Y += float(S.BorderOffsets[1]);
    i = 0;
    J0x1E3:

    // End:0x38F [Loop If]
    if(i < L.Icons.Length)
    {
        IconW = L.Icons[i].MaterialUSize();
        IconH = L.Icons[i].MaterialVSize();
        S.TextSize(C, L.MenuState, L.IconDescriptions[i], XL, YL, L.FontScale);
        YL = FMax(YL, float(IconH));
        C.SetPos(X, Y);
        C.DrawTile(L.Icons[i], float(IconW), YL, 0.0000000, 0.0000000, float(IconW), float(IconH));
        S.DrawText(C, L.MenuState, (X + float(IconW)) + (0.2000000 * float(IconW)), Y, XL, YL, 0, L.IconDescriptions[i], L.FontScale);
        Y += YL;
        i++;
        // [Loop Continue]
        goto J0x1E3;
    }
    return true;
    //return;    
}

function bool MousingOverIcons()
{
    local float IconRight, IconLeft, IconWidth;

    // End:0x1A
    if((List == none) || Controller == none)
    {
        return false;
    }
    List.GetCellLeftWidth(0, IconLeft, IconWidth);
    IconRight = IconLeft + IconWidth;
    return (Controller.MouseX >= IconLeft) && Controller.MouseX <= IconRight;
    //return;    
}

function bool InternalOnOpen(GUIContextMenu Sender)
{
    Sender.ContextItems.Remove(0, Sender.ContextItems.Length);
    // End:0x65
    if(List.IsValid())
    {
        Sender.ContextItems = ContextItems;
        // End:0x62
        if(Class'Engine.LevelInfo'.static.IsDemoBuild())
        {
            RemoveFilterOptions(Sender);
        }        
    }
    else
    {
        Sender.ContextItems[0] = ContextItems[ADDFAVIDX];
        Sender.ContextItems[1] = ContextItems[OPENIPIDX];
    }
    return true;
    //return;    
}

function RemoveFilterOptions(GUIContextMenu Menu)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < Menu.ContextItems.Length)
    {
        // End:0x5D
        if(Menu.ContextItems[i] == ContextItems[FILTERIDX])
        {
            Menu.ContextItems.Remove(i, 4);
            // [Explicit Break]
            goto J0x67;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x67:

    //return;    
}

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local int i, idx;
    local bool bWasSuccess;
    local export editinline UT2k4Browser_ServersList L;

    L = UT2k4Browser_ServersList(List);
    // End:0x37E
    if(Sender != none)
    {
        // End:0x3E
        if(Sender.ContextItems[Index] == "-")
        {
            Index++;
        }
        // End:0x57
        if(NotifyContextSelect(Sender, Index))
        {
            return;
        }
        switch(Sender.ContextItems[Index])
        {
            // End:0x8E
            case ContextItems[JOINIDX]:
                L.Connect(false);
                // End:0x37E
                break;
            // End:0xAF
            case ContextItems[SPECIDX]:
                L.Connect(true);
                // End:0x37E
                break;
            // End:0xFF
            case ContextItems[REPINGIDX]:
                idx = List.CurrentListId();
                tp_Anchor.PingServer(idx, 1, L.Servers[idx]);
                // End:0x37E
                break;
            // End:0x11F
            case ContextItems[REFRESHIDX]:
                tp_Anchor.RefreshClicked();
                // End:0x37E
                break;
            // End:0x13F
            case ContextItems[FILTERIDX]:
                tp_Anchor.FilterClicked();
                // End:0x37E
                break;
            // End:0x1E1
            case ContextItems[TEMPLATEIDX]:
                idx = List.CurrentListId();
                // End:0x1DE
                if((idx >= 0) && Controller.OpenMenu(Controller.FilterMenu))
                {
                    FilterPageBase(Controller.ActivePage).CreateTemplateFilter(L.Servers[idx].ServerName, L.Servers[idx].ServerInfo);
                }
                // End:0x37E
                break;
            // End:0x27E
            case ContextItems[CLEARFILTERIDX]:
                i = 0;
                J0x1F6:

                // End:0x24B [Loop If]
                if(i < tp_Anchor.FilterMaster.AllFilters.Length)
                {
                    // End:0x241
                    if(tp_Anchor.FilterMaster.ActivateFilter(i, false))
                    {
                        bWasSuccess = true;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x1F6;
                }
                // End:0x27B
                if(bWasSuccess)
                {
                    tp_Anchor.FilterMaster.SaveFilters();
                    tp_Anchor.Refresh();
                }
                // End:0x37E
                break;
            // End:0x2FE
            case ContextItems[ADDFAVIDX]:
                // End:0x2BE
                if(L.IsValid())
                {
                    L.AddFavorite(tp_Anchor.Browser);                    
                }
                else
                {
                    // End:0x2FB
                    if(Controller.OpenMenu(Controller.EditFavoriteMenu))
                    {
                        Controller.ActivePage.__OnClose__Delegate = AddFavClosed;
                    }
                }
                // End:0x37E
                break;
            // End:0x31E
            case ContextItems[COPYIDX]:
                L.CopyServerToClipboard();
                // End:0x37E
                break;
            // End:0x37B
            case ContextItems[OPENIPIDX]:
                // End:0x364
                if(L.IsValid())
                {
                    Controller.OpenMenu(OpenIPPage, L.Get());                    
                }
                else
                {
                    Controller.OpenMenu(OpenIPPage);
                }
                // End:0x37E
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function AddFavClosed(bool bCancelled)
{
    tp_Anchor.Browser.OnAddFavorite(EditFavoritePage(Controller.ActivePage).Server);
    //return;    
}

function SetAnchor(UT2k4Browser_ServerListPageBase AnchorPage)
{
    super.SetAnchor(AnchorPage);
    MyScrollBar.MyGripButton.__OnMousePressed__Delegate = tp_Anchor.MousePressed;
    MyScrollBar.MyGripButton.__OnMouseRelease__Delegate = tp_Anchor.MouseReleased;
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    local export editinline GUIMultiColumnList L;

    L = GUIMultiColumnList(LocalList);
    // End:0x2E
    if((L == none) || List == LocalList)
    {
        return;
    }
    // End:0x71
    if(List != none)
    {
        List.SetTimer(0.0000000, false);
        RemoveComponent(List, true);
        AppendComponent(L, false);
        List = L;        
    }
    else
    {
        List = L;
        AppendComponent(L, false);
    }
    Header.MyList = List;
    super(GUIListBoxBase).InitBaseList(LocalList);
    //return;    
}

defaultproperties
{
    OpenIPPage="GUI2K4.UT2K4Browser_OpenIP"
    SPECIDX=1
    REPINGIDX=3
    REFRESHIDX=4
    FILTERIDX=6
    TEMPLATEIDX=7
    CLEARFILTERIDX=8
    ADDFAVIDX=10
    OPENIPIDX=12
    COPYIDX=11
    DefaultListClass="GUI2K4.UT2K4Browser_ServersList"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2k4Browser_ServerListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems[0]="??? ??"
        ContextItems[1]="???? ??"
        ContextItems[2]="-"
        ContextItems[3]="?? ?? ??"
        ContextItems[4]="??? ??"
        ContextItems[5]="-"
        ContextItems[6]="?? ??"
        ContextItems[7]="??? ??"
        ContextItems[8]="?? ?? ???? ??"
        ContextItems[9]="-"
        ContextItems[10]="????? ??"
        ContextItems[11]="IP? ??"
        OnOpen=UT2k4Browser_ServerListBox.InternalOnOpen
        OnClose=UT2k4Browser_ServerListBox.InternalOnClose
        OnSelect=UT2k4Browser_ServerListBox.InternalOnClick
        StyleName="ServerListContextMenu"
    end object
    ContextMenu=RCMenu
    // Reference: GUIToolTip'GUI2K4_Decompressed.UT2k4Browser_ServerListBox.ServerListToolTip'
    begin object name="ServerListToolTip" class=XInterface.GUIToolTip
        ExpirationSeconds=8.0000000
        OnPreDraw=UT2k4Browser_ServerListBox.PreDrawHint
        OnDraw=UT2k4Browser_ServerListBox.DrawHint
    end object
    ToolTip=ServerListToolTip
}