class UT2k4Browser_ServerListPageInternet extends UT2K4Browser_ServerListPageMS
    config(User)
    editinlinenew
    instanced;

var CustomFilter LoadCustomFilter;
var config int PlayCount;
var config int ShowAt;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(UT2k4Browser_ServerListPageBase).InitComponent(MyController, myOwner);
    Browser.co_GameType.__OnChange__Delegate = NewGameType;
    GameTypeChanged(UT2k4Browser_ServersList(Browser.co_GameType.GetObject()));
    // End:0x66
    if(PlayCount < ShowAt)
    {
        PlayCount++;
    }
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x28
    if(bShow && bInit)
    {
        bInit = false;
    }
    //return;    
}

function Refresh()
{
    local int i, j;
    local string TmpString;
    local array<AFilterRule> Rules;
    local QueryData QueryItem;

    GameTypeChanged(UT2k4Browser_ServersList(Browser.co_GameType.GetObject()));
    super.Refresh();
    // End:0x75
    if(PlayCount == ShowAt)
    {
        Controller.OpenMenu("gui2k4.UT2K4TryAMod", "" $ string(PlayCount));
        PlayCount = ShowAt + 1;
    }
    SaveConfig();
    AddQueryTerm("gametype", GetItemName(Browser.CurrentGameType), 0);
    // End:0xC8
    if(Browser.bStandardServersOnly)
    {
        AddQueryTerm("standard", "true", 0);
    }
    i = 0;
    J0xCF:

    // End:0x1CE [Loop If]
    if(i < FilterMaster.AllFilters.Length)
    {
        // End:0x1C4
        if(FilterMaster.IsActiveAt(i))
        {
            Rules = FilterMaster.GetFilterRules(i);
            j = 0;
            J0x120:

            // End:0x1C4 [Loop If]
            if(j < Rules.Length)
            {
                QueryItem = Rules[j].FilterItem;
                // End:0x1BA
                if(ValidateQueryItem(Rules[j].FilterType, QueryItem))
                {
                    TmpString = QueryItem.Value;
                    // End:0x19B
                    if(int(QueryItem.QueryType) < 2)
                    {
                        Class'GUI2K4_Decompressed.CustomFilter'.static.ChopClass(TmpString);
                    }
                    AddQueryTerm(QueryItem.key, TmpString, QueryItem.QueryType);
                }
                j++;
                // [Loop Continue]
                goto J0x120;
            }
        }
        i++;
        // [Loop Continue]
        goto J0xCF;
    }
    Browser.Uplink().StartQuery(0);
    SetFooterCaption(StartQueryString);
    //return;    
}

function ClearAllLists()
{
    local int i;
    local export editinline GUIList ComboList;
    local export editinline UT2k4Browser_ServersList List;

    // End:0x23
    if((Browser == none) || Browser.co_GameType == none)
    {
        return;
    }
    ComboList = Browser.co_GameType.MyComboBox.List;
    i = 0;
    J0x50:

    // End:0xCA [Loop If]
    if(i < ComboList.ItemCount)
    {
        List = UT2k4Browser_ServersList(ComboList.GetObject());
        // End:0xC0
        if(List != none)
        {
            List.__OnChange__Delegate = None;
            List.SetAnchor(none);
            List.Clear();
        }
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

function InitServerList()
{
    li_Server = UT2k4Browser_ServersList(lb_Server.List);
    li_Server.__OnChange__Delegate = ServerListChanged;
    li_Server.bPresort = true;
    lb_Server.SetAnchor(self);
    //return;    
}

function NewGameType(GUIComponent Sender)
{
    local string SelectedGame;
    local export editinline UT2k4Browser_ServersList List;

    // End:0x1A
    if(Sender != Browser.co_GameType)
    {
        return;
    }
    SelectedGame = moComboBox(Sender).GetExtra();
    // End:0x4E
    if(Browser.CurrentGameType ~= SelectedGame)
    {
        return;
    }
    Browser.CurrentGameType = SelectedGame;
    Browser.SaveConfig();
    List = UT2k4Browser_ServersList(Browser.co_GameType.GetObject());
    // End:0xAF
    if(List.Servers.Length == 0)
    {
        Refresh();        
    }
    else
    {
        GameTypeChanged(List);
        BindQueryClient(Browser.Uplink());
        li_Server.AutoPingServers();
    }
    //return;    
}

function GameTypeChanged(UT2k4Browser_ServersList NewList)
{
    // End:0x5D
    if(NewList != none)
    {
        // End:0x49
        if(li_Server != none)
        {
            li_Server.__OnChange__Delegate = None;
            li_Server.StopPings();
            li_Server.SetAnchor(none);
        }
        lb_Server.InitBaseList(NewList);
    }
    InitServerList();
    //return;    
}

function bool ValidateQueryItem(CustomFilter.EDataType FilterType, QueryData Data)
{
    local int i;

    // End:0x17
    if(int(Data.QueryType) == int(6))
    {
        return false;
    }
    switch(FilterType)
    {
        // End:0x8D
        case 0:
            i = 0;
            J0x2A:

            // End:0x8B [Loop If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x81
                if(Browser.Uplink().Query[i].key == Data.key)
                {
                    return false;
                }
                i++;
                // [Loop Continue]
                goto J0x2A;
            }
            return true;
        // End:0x22E
        case 1:
            // End:0xA9
            if(int(Data.QueryType) == int(1))
            {
                return false;
            }
            i = 0;
            J0xB0:

            // End:0x22C [Loop If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x222
                if(Browser.Uplink().Query[i].key == Data.key)
                {
                    // End:0x11C
                    if(int(Data.QueryType) == int(0))
                    {
                        return false;
                    }
                    switch(Browser.Uplink().Query[i].QueryType)
                    {
                        // End:0x15D
                        case 4:
                            // End:0x15D
                            if(int(Data.QueryType) == int(5))
                            {
                                return false;
                            }
                        // End:0x1B0
                        case 5:
                            // End:0x179
                            if(int(Data.QueryType) == int(4))
                            {
                                return false;
                            }
                            // End:0x1AD
                            if(Browser.Uplink().Query[i].Value >= Data.Value)
                            {
                                return false;
                            }
                            // End:0x21F
                            break;
                        // End:0x1CC
                        case 2:
                            // End:0x1CC
                            if(int(Data.QueryType) == int(3))
                            {
                                return false;
                            }
                        // End:0x21C
                        case 3:
                            // End:0x1E8
                            if(int(Data.QueryType) == int(2))
                            {
                                return false;
                            }
                            // End:0x21C
                            if(Browser.Uplink().Query[i].Value <= Data.Value)
                            {
                                return false;
                            }
                        // End:0xFFFF
                        default:
                            break;
                    }
                    // [Explicit Break]
                    goto J0x22C;
                }
                i++;
                // [Loop Continue]
                goto J0xB0;
            }
            J0x22C:

            return true;
        // End:0x2D1
        case 2:
            i = 0;
            J0x23A:

            // End:0x2CF [Loop If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x2C5
                if((Browser.Uplink().Query[i].key == Data.key) && Browser.Uplink().Query[i].Value == Data.Value)
                {
                    return false;
                }
                i++;
                // [Loop Continue]
                goto J0x23A;
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function FilterClicked()
{
    // End:0x57
    if(Controller.OpenMenu(Controller.FilterMenu))
    {
        Controller.ActivePage.__OnClose__Delegate = FiltersClosed;
        // End:0x57
        if(li_Server != none)
        {
            li_Server.StopPings();
        }
    }
    //return;    
}

function FiltersClosed(bool bCancelled)
{
    // End:0x1A
    if(!bCancelled)
    {
        ClearAllLists();
        Refresh();        
    }
    else
    {
        // End:0x34
        if(li_Server != none)
        {
            li_Server.AutoPingServers();
        }
    }
    //return;    
}

function bool ShouldDisplayGameType()
{
    return true;
    //return;    
}

function bool IsFilterAvailable(out string ButtonCaption)
{
    ButtonCaption = FilterCaption;
    return !Class'Engine.LevelInfo'.static.IsDemoBuild();
    //return;    
}

defaultproperties
{
    ShowAt=10
}