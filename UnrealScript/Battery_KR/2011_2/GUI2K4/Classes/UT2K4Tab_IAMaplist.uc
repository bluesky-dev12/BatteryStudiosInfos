class UT2K4Tab_IAMaplist extends UT2K4Tab_ServerMapList
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_Maps.__NotifyContextSelect__Delegate = HandleContextSelect;
    lb_Maps.ContextMenu.ContextItems.Remove(1, lb_Maps.ContextMenu.ContextItems.Length - 1);
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

function ProcessMapName(string NewMap)
{
    bReceivedMaps = true;
    GUIList(lb_Maps.MyList).Add(NewMap);
    //return;    
}

defaultproperties
{
    // Reference: MapListBox'GUI2K4_Decompressed.UT2K4Tab_IAMaplist.MapList'
    begin object name="MapList" class=GUI2K4_Decompressed.MapListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=MapList.InternalOnCreateComponent
        WinTop=0.1437500
        WinHeight=0.8343750
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Maps=MapList
}