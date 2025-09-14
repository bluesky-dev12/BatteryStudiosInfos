class AdminPanelMaps extends AdminPanelBase
    editinlinenew
    instanced;

var() automated GUIListBoxBase lb_Maps;
var bool bReceivedMaps;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    lb_Maps.__NotifyContextSelect__Delegate = HandleContextSelect;
    lb_Maps.ContextMenu.ContextItems.Remove(1, lb_Maps.ContextMenu.ContextItems.Length - 1);
    //return;    
}

function ShowPanel()
{
    super.ShowPanel();
    // End:0x17
    if(!bReceivedMaps)
    {
        RefreshMaplist();
    }
    //return;    
}

function RefreshMaplist()
{
    bReceivedMaps = false;
    SetTimer(3.0000000, true);
    Timer();
    //return;    
}

function Timer()
{
    // End:0x1E
    if(bReceivedMaps || wPlayer(PlayerOwner()) == none)
    {
        KillTimer();
        return;
    }
    wPlayer(PlayerOwner()).__ProcessMapName__Delegate = ProcessMapName;
    wPlayer(PlayerOwner()).ServerRequestMapList();
    //return;    
}

function ProcessMapName(string NewMap)
{
    GUIList(lb_Maps.MyList).Add(NewMap);
    //return;    
}

function bool HandleContextSelect(GUIContextMenu Sender, int Index)
{
    local string MapName;

    // End:0x7E
    if(Sender != none)
    {
        MapName = GUIList(lb_Maps.MyList).Get();
        // End:0x6D
        if(MapName != "")
        {
            Console(Controller.Master.Console).DelayedConsoleCommand("open" @ MapName);
        }
        Controller.CloseAll(false, true);
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: MapListBox'GUI2K4_Decompressed.AdminPanelMaps.MapList'
    begin object name="MapList" class=GUI2K4_Decompressed.MapListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=MapList.InternalOnCreateComponent
        WinTop=0.1437500
        WinHeight=0.8343750
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Maps=MapList
    PanelCaption="?"
}