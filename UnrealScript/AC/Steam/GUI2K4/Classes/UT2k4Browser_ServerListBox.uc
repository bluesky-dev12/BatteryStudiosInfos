/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_ServerListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:11
 *
 *******************************************************************************/
class UT2k4Browser_ServerListBox extends ServerBrowserMCListBox
    dependson(ServerBrowserMCListBox)
    dependson(EditFavoritePage)
    dependson(FilterPageBase)
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
}

function SetToolTipText(string NewToolTipText);
function bool PreDrawHint(Canvas C)
{
    local export editinline UT2k4Browser_ServersList L;
    local int IconW, i;
    local float XL, YL, MaxWidth, TotalHeight;
    local export editinline GUIStyles S;

    L = UT2k4Browser_ServersList(List);
    // End:0x5a
    if(L == none || Controller == none || !MousingOverIcons() || ToolTip == none || ToolTip.Style == none)
    {
        return true;
    }
    // End:0x27f
    if(ToolTip.bResetPosition || ToolTip.bTrackMouse)
    {
        S = ToolTip.Style;
        i = 0;
        J0x9b:
        // End:0x1a3 [While If]
        if(i < L.Icons.Length)
        {
            IconW = L.Icons[i].MaterialUSize();
            S.TextSize(C, L.MenuState, L.IconDescriptions[i], XL, YL, L.FontScale);
            XL += float(IconW) + 0.20 * float(IconW);
            // End:0x15e
            if(XL > MaxWidth)
            {
                MaxWidth = XL;
            }
            YL = float(Max(int(YL), L.Icons[i].MaterialVSize()));
            TotalHeight += YL;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x9b;
        }
        TotalHeight += float(S.BorderOffsets[1] + S.BorderOffsets[3]);
        ToolTip.WinWidth = MaxWidth + float(S.BorderOffsets[0]) + float(S.BorderOffsets[2]);
        ToolTip.WinHeight = TotalHeight;
        ToolTip.WinTop = ToolTip.GetTop(C);
        ToolTip.WinLeft = ToolTip.GetLeft(C);
        ToolTip.bResetPosition = false;
    }
    return true;
}

function bool DrawHint(Canvas C)
{
    local export editinline GUIStyles S;
    local export editinline UT2k4Browser_ServersList L;
    local Plane NormMod;
    local int i, IconW, IconH;
    local float X, Y, XL, YL;

    L = UT2k4Browser_ServersList(List);
    // End:0x5a
    if(L == none || Controller == none || !MousingOverIcons() || ToolTip == none || ToolTip.Style == none)
    {
        return true;
    }
    S = ToolTip.Style;
    X = ToolTip.WinLeft;
    Y = ToolTip.WinTop;
    XL = ToolTip.WinWidth;
    YL = ToolTip.WinHeight;
    NormMod = C.ColorModulate;
    C.ColorModulate.W = 0.30;
    C.ColorModulate.X = 0.20;
    C.ColorModulate.Y = 0.20;
    C.ColorModulate.Z = 0.20;
    S.Draw(C, 0, X + float(2), Y + float(2), XL, YL);
    C.ColorModulate = NormMod;
    S.Draw(C, 0, X, Y, XL, YL);
    X += float(S.BorderOffsets[0]);
    Y += float(S.BorderOffsets[1]);
    i = 0;
    J0x1e3:
    // End:0x38f [While If]
    if(i < L.Icons.Length)
    {
        IconW = L.Icons[i].MaterialUSize();
        IconH = L.Icons[i].MaterialVSize();
        S.TextSize(C, L.MenuState, L.IconDescriptions[i], XL, YL, L.FontScale);
        YL = FMax(YL, float(IconH));
        C.SetPos(X, Y);
        C.DrawTile(L.Icons[i], float(IconW), YL, 0.0, 0.0, float(IconW), float(IconH));
        S.DrawText(C, L.MenuState, X + float(IconW) + 0.20 * float(IconW), Y, XL, YL, 0, L.IconDescriptions[i], L.FontScale);
        Y += YL;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e3;
    }
    return true;
}

function bool MousingOverIcons()
{
    local float IconRight, IconLeft, IconWidth;

    // End:0x1a
    if(List == none || Controller == none)
    {
        return false;
    }
    List.GetCellLeftWidth(0, IconLeft, IconWidth);
    IconRight = IconLeft + IconWidth;
    return Controller.MouseX >= IconLeft && Controller.MouseX <= IconRight;
}

function bool InternalOnOpen(GUIContextMenu Sender)
{
    Sender.ContextItems.Remove(0, Sender.ContextItems.Length);
    // End:0x65
    if(List.IsValid())
    {
        Sender.ContextItems = ContextItems;
        // End:0x62
        if(class'LevelInfo'.static.IsDemoBuild())
        {
            RemoveFilterOptions(Sender);
        }
    }
    // End:0x9d
    else
    {
        Sender.ContextItems[0] = ContextItems[ADDFAVIDX];
        Sender.ContextItems[1] = ContextItems[OPENIPIDX];
    }
    return true;
}

function RemoveFilterOptions(GUIContextMenu Menu)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < Menu.ContextItems.Length)
    {
        // End:0x5d
        if(Menu.ContextItems[i] == ContextItems[FILTERIDX])
        {
            Menu.ContextItems.Remove(i, 4);
        }
        // End:0x67
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local int i, idx;
    local bool bWasSuccess;
    local export editinline UT2k4Browser_ServersList L;

    L = UT2k4Browser_ServersList(List);
    // End:0x37e
    if(Sender != none)
    {
        // End:0x3e
        if(Sender.ContextItems[Index] == "-")
        {
            ++ Index;
        }
        // End:0x57
        if(NotifyContextSelect(Sender, Index))
        {
            return;
        }
        switch(Sender.ContextItems[Index])
        {
            // End:0x8e
            case ContextItems[JOINIDX]:
                L.Connect(false);
                // End:0x37e
                break;
            // End:0xaf
            case ContextItems[SPECIDX]:
                L.Connect(true);
                // End:0x37e
                break;
            // End:0xff
            case ContextItems[REPINGIDX]:
                idx = List.CurrentListId();
                tp_Anchor.PingServer(idx, 1, L.Servers[idx]);
                // End:0x37e
                break;
            // End:0x11f
            case ContextItems[REFRESHIDX]:
                tp_Anchor.RefreshClicked();
                // End:0x37e
                break;
            // End:0x13f
            case ContextItems[FILTERIDX]:
                tp_Anchor.FilterClicked();
                // End:0x37e
                break;
            // End:0x1e1
            case ContextItems[TEMPLATEIDX]:
                idx = List.CurrentListId();
                // End:0x1de
                if(idx >= 0 && Controller.OpenMenu(Controller.FilterMenu))
                {
                    FilterPageBase(Controller.ActivePage).CreateTemplateFilter(L.Servers[idx].ServerName, L.Servers[idx].ServerInfo);
                }
                // End:0x37e
                break;
            // End:0x27e
            case ContextItems[CLEARFILTERIDX]:
                i = 0;
                J0x1f6:
                // End:0x24b [While If]
                if(i < tp_Anchor.FilterMaster.AllFilters.Length)
                {
                    // End:0x241
                    if(tp_Anchor.FilterMaster.ActivateFilter(i, false))
                    {
                        bWasSuccess = true;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x1f6;
                }
                // End:0x27b
                if(bWasSuccess)
                {
                    tp_Anchor.FilterMaster.SaveFilters();
                    tp_Anchor.Refresh();
                }
                // End:0x37e
                break;
            // End:0x2fe
            case ContextItems[ADDFAVIDX]:
                // End:0x2be
                if(L.IsValid())
                {
                    L.AddFavorite(tp_Anchor.Browser);
                }
                // End:0x2fb
                else
                {
                    // End:0x2fb
                    if(Controller.OpenMenu(Controller.EditFavoriteMenu))
                    {
                        Controller.ActivePage.__OnClose__Delegate = AddFavClosed;
                    }
                }
                // End:0x37e
                break;
            // End:0x31e
            case ContextItems[COPYIDX]:
                L.CopyServerToClipboard();
                // End:0x37e
                break;
            // End:0x37b
            case ContextItems[OPENIPIDX]:
                // End:0x364
                if(L.IsValid())
                {
                    Controller.OpenMenu(OpenIPPage, L.Get());
                }
                // End:0x378
                else
                {
                    Controller.OpenMenu(OpenIPPage);
                }
                // End:0x37e
                break;
            // End:0xffff
            default:
            }
}

function AddFavClosed(bool bCancelled)
{
    tp_Anchor.Browser.OnAddFavorite(EditFavoritePage(Controller.ActivePage).Server);
}

function SetAnchor(UT2k4Browser_ServerListPageBase AnchorPage)
{
    super.SetAnchor(AnchorPage);
    MyScrollBar.MyGripButton.__OnMousePressed__Delegate = tp_Anchor.MousePressed;
    MyScrollBar.MyGripButton.__OnMouseRelease__Delegate = tp_Anchor.MouseReleased;
}

function InitBaseList(GUIListBase LocalList)
{
    local export editinline GUIMultiColumnList L;

    L = GUIMultiColumnList(LocalList);
    // End:0x2e
    if(L == none || List == LocalList)
    {
        return;
    }
    // End:0x71
    if(List != none)
    {
        List.SetTimer(0.0, false);
        RemoveComponent(List, true);
        AppendComponent(L, false);
        List = L;
    }
    // End:0x88
    else
    {
        List = L;
        AppendComponent(L, false);
    }
    Header.MyList = List;
    super(GUIListBoxBase).InitBaseList(LocalList);
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
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnOpen=InternalOnOpen
        OnClose=InternalOnClose
        OnSelect=InternalOnClick
        StyleName="ServerListContextMenu"
    object end
    // Reference: GUIContextMenu'UT2k4Browser_ServerListBox.RCMenu'
    ContextMenu=RCMenu
    begin object name=ServerListToolTip class=GUIToolTip
        ExpirationSeconds=8.0
        OnPreDraw=PreDrawHint
        OnDraw=DrawHint
    object end
    // Reference: GUIToolTip'UT2k4Browser_ServerListBox.ServerListToolTip'
    ToolTip=ServerListToolTip
}