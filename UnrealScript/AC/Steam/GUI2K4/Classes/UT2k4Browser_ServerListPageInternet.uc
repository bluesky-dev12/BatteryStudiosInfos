/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_ServerListPageInternet.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:12
 *
 *******************************************************************************/
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
        ++ PlayCount;
    }
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x28
    if(bShow && bInit)
    {
        bInit = false;
    }
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
    // End:0xc8
    if(Browser.bStandardServersOnly)
    {
        AddQueryTerm("standard", "true", 0);
    }
    i = 0;
    J0xcf:
    // End:0x1ce [While If]
    if(i < FilterMaster.AllFilters.Length)
    {
        // End:0x1c4
        if(FilterMaster.IsActiveAt(i))
        {
            Rules = FilterMaster.GetFilterRules(i);
            j = 0;
            J0x120:
            // End:0x1c4 [While If]
            if(j < Rules.Length)
            {
                QueryItem = Rules[j].FilterItem;
                // End:0x1ba
                if(ValidateQueryItem(Rules[j].FilterType, QueryItem))
                {
                    TmpString = QueryItem.Value;
                    // End:0x19b
                    if(QueryItem.QueryType < 2)
                    {
                        class'CustomFilter'.static.ChopClass(TmpString);
                    }
                    AddQueryTerm(QueryItem.key, TmpString, QueryItem.QueryType);
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x120;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xcf;
    }
    Browser.Uplink().StartQuery(0);
    SetFooterCaption(StartQueryString);
}

function ClearAllLists()
{
    local int i;
    local export editinline GUIList ComboList;
    local export editinline UT2k4Browser_ServersList List;

    // End:0x23
    if(Browser == none || Browser.co_GameType == none)
    {
        return;
    }
    ComboList = Browser.co_GameType.MyComboBox.List;
    i = 0;
    J0x50:
    // End:0xca [While If]
    if(i < ComboList.ItemCount)
    {
        List = UT2k4Browser_ServersList(ComboList.GetObject());
        // End:0xc0
        if(List != none)
        {
            List.__OnChange__Delegate = None;
            List.SetAnchor(none);
            List.Clear();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
}

function InitServerList()
{
    li_Server = UT2k4Browser_ServersList(lb_Server.List);
    li_Server.__OnChange__Delegate = ServerListChanged;
    li_Server.bPresort = true;
    lb_Server.SetAnchor(self);
}

function NewGameType(GUIComponent Sender)
{
    local string SelectedGame;
    local export editinline UT2k4Browser_ServersList List;

    // End:0x1a
    if(Sender != Browser.co_GameType)
    {
        return;
    }
    SelectedGame = moComboBox(Sender).GetExtra();
    // End:0x4e
    if(Browser.CurrentGameType ~= SelectedGame)
    {
        return;
    }
    Browser.CurrentGameType = SelectedGame;
    Browser.SaveConfig();
    List = UT2k4Browser_ServersList(Browser.co_GameType.GetObject());
    // End:0xaf
    if(List.Servers.Length == 0)
    {
        Refresh();
    }
    // End:0xde
    else
    {
        GameTypeChanged(List);
        BindQueryClient(Browser.Uplink());
        li_Server.AutoPingServers();
    }
}

function GameTypeChanged(UT2k4Browser_ServersList NewList)
{
    // End:0x5d
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
}

function bool ValidateQueryItem(CustomFilter.EDataType FilterType, QueryData Data)
{
    local int i;

    // End:0x17
    if(Data.QueryType == 6)
    {
        return false;
    }
    switch(FilterType)
    {
        // End:0x8d
        case 0:
            i = 0;
            J0x2a:
            // End:0x8b [While If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x81
                if(Browser.Uplink().Query[i].key == Data.key)
                {
                    return false;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2a;
            }
            return true;
        // End:0x22e
        case 1:
            // End:0xa9
            if(Data.QueryType == 1)
            {
                return false;
            }
            i = 0;
            J0xb0:
            // End:0x22c [While If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x222
                if(Browser.Uplink().Query[i].key == Data.key)
                {
                    // End:0x11c
                    if(Data.QueryType == 0)
                    {
                        return false;
                    }
                    switch(Browser.Uplink().Query[i].QueryType)
                    {
                        // End:0x15d
                        case 4:
                            // End:0x15d
                            if(Data.QueryType == 5)
                            {
                                return false;
                        }
                        // End:0x1b0
                        case 5:
                            // End:0x179
                            if(Data.QueryType == 4)
                            {
                                return false;
                            }
                            // End:0x1ad
                            if(Browser.Uplink().Query[i].Value >= Data.Value)
                            {
                                return false;
                            }
                            // End:0x21f
                            break;
                        // End:0x1cc
                        case 2:
                            // End:0x1cc
                            if(Data.QueryType == 3)
                            {
                                return false;
                        }
                        // End:0x21c
                        case 3:
                            // End:0x1e8
                            if(Data.QueryType == 2)
                            {
                                return false;
                            }
                            // End:0x21c
                            if(Browser.Uplink().Query[i].Value <= Data.Value)
                            {
                                return false;
                        }
                        // End:0xffff
                        default:
                            // End:0x22c Break;
                            break;
                        }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xb0;
            }
            return true;
        // End:0x2d1
        case 2:
            i = 0;
            J0x23a:
            // End:0x2cf [While If]
            if(i < Browser.Uplink().Query.Length)
            {
                // End:0x2c5
                if(Browser.Uplink().Query[i].key == Data.key && Browser.Uplink().Query[i].Value == Data.Value)
                {
                    return false;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x23a;
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
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
}

function FiltersClosed(bool bCancelled)
{
    // End:0x1a
    if(!bCancelled)
    {
        ClearAllLists();
        Refresh();
    }
    // End:0x34
    else
    {
        // End:0x34
        if(li_Server != none)
        {
            li_Server.AutoPingServers();
        }
    }
}

function bool ShouldDisplayGameType()
{
    return true;
}

function bool IsFilterAvailable(out string ButtonCaption)
{
    ButtonCaption = FilterCaption;
    return !class'LevelInfo'.static.IsDemoBuild();
}

defaultproperties
{
    ShowAt=10
}