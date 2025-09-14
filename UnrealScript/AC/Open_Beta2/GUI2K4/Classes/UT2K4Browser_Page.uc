class UT2K4Browser_Page extends UT2K4TabPanel
    editinlinenew
    instanced;

var() export editinline UT2k4ServerBrowser Browser;
var() export editinline UT2k4Browser_Footer t_Footer;
var() localized string MustUpgradeString;
var() localized string QueryCompleteString;
var() localized string StartQueryString;
var() localized string AuthFailString;
var() localized string ConnFailString;
var() localized string ConnTimeoutString;
var() localized string RetryString;
var() localized string ReadyString;
var() localized string BackCaption;
var() localized string RefreshCaption;
var() localized string JoinCaption;
var() localized string SpectateCaption;
var() localized string FilterCaption;
var() localized string UnspecifiedNetworkError;
var() string CurrentFooterCaption;
var() bool bCommonButtonWidth;
//var delegate<OnOpenConnection> __OnOpenConnection__Delegate;
//var delegate<OnCloseConnection> __OnCloseConnection__Delegate;
//var delegate<RefreshFooter> __RefreshFooter__Delegate;

delegate OnOpenConnection(optional int Count)
{
    //return;    
}

delegate OnCloseConnection(optional int Count)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x4B
    if(UT2k4ServerBrowser(myOwner.MenuOwner) != none)
    {
        Browser = UT2k4ServerBrowser(myOwner.MenuOwner);
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    super(GUIPanel).InitComponent(MyController, myOwner);
    CurrentFooterCaption = ReadyString;
    //return;    
}

event Opened(GUIComponent Sender)
{
    // End:0x53
    if(((Browser == none) || t_Footer == none) && UT2k4ServerBrowser(Sender) != none)
    {
        Browser = UT2k4ServerBrowser(Sender);
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    super(GUIMultiComponent).Opened(Sender);
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x52
    if(bShow)
    {
        Browser.t_Header.SetCaption(PanelCaption);
        RefreshFooter(self, string(!bCommonButtonWidth));
        SetFooterCaption(CurrentFooterCaption);
    }
    //return;    
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool ShouldDisplayGameType()
{
    return false;
    //return;    
}

function QueryComplete(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    //return;    
}

function ReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    //return;    
}

function ReceivedPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    //return;    
}

function AddQueryTerm(coerce string key, coerce string Value, MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    i = 0;
    J0x07:

    // End:0x9E [Loop If]
    if(i < Browser.Uplink().Query.Length)
    {
        QD = Browser.Uplink().Query[i];
        // End:0x94
        if(((QD.key ~= key) && QD.Value ~= Value) && int(QD.QueryType) == int(QueryType))
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    QD.key = key;
    QD.Value = Value;
    QD.QueryType = QueryType;
    Browser.Uplink().Query[i] = QD;
    //return;    
}

function ResetQueryClient(ServerQueryClient Client)
{
    // End:0x0D
    if(Client == none)
    {
        return;
    }
    Client.CancelPings();
    BindQueryClient(Client);
    SetFooterCaption(ReadyString);
    //return;    
}

function BindQueryClient(ServerQueryClient Client)
{
    // End:0x0D
    if(Client == none)
    {
        return;
    }
    Client.__OnReceivedPingInfo__Delegate = ReceivedPingInfo;
    Client.__OnPingTimeout__Delegate = ReceivedPingTimeout;
    //return;    
}

function CloseMSConnection()
{
    // End:0x3D
    if(Browser != none)
    {
        Browser.Uplink().CancelPings();
        Browser.Uplink().Stop();
    }
    //return;    
}

delegate RefreshFooter(optional UT2K4Browser_Page Page, optional string bPerButtonSizes)
{
    //return;    
}

function SetFooterCaption(string NewCaption, optional bool bAppend)
{
    local export editinline GUITabControl TC;

    TC = GUITabControl(MenuOwner);
    // End:0x41
    if(TC.PendingTab != none)
    {
        // End:0x3E
        if(TC.PendingTab != MyButton)
        {
            return;
        }        
    }
    else
    {
        // End:0x5B
        if(TC.ActiveTab != MyButton)
        {
            return;
        }
    }
    // End:0x7F
    if(t_Footer == none)
    {
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    // End:0xAD
    if(bAppend)
    {
        NewCaption = t_Footer.t_StatusBar.GetCaption() $ NewCaption;
    }
    t_Footer.t_StatusBar.SetCaption(NewCaption);
    CurrentFooterCaption = t_Footer.t_StatusBar.Caption;
    //return;    
}

function SetJoinCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Join == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Join.Caption $ NewCaption;
    }
    t_Footer.b_Join.Caption = NewCaption;
    //return;    
}

function SetSpectateCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Spectate == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Spectate.Caption $ NewCaption;
    }
    t_Footer.b_Spectate.Caption = NewCaption;
    //return;    
}

function SetRefreshCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Refresh == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Refresh.Caption $ NewCaption;
    }
    t_Footer.b_Refresh.Caption = NewCaption;
    //return;    
}

function CheckJoinButton(bool Available)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Join == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Join);        
    }
    else
    {
        DisableComponent(t_Footer.b_Join);
    }
    //return;    
}

function CheckSpectateButton(bool Available)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Spectate == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Spectate);        
    }
    else
    {
        DisableComponent(t_Footer.b_Spectate);
    }
    //return;    
}

function CheckRefreshButton(bool Available)
{
    // End:0x23
    if((t_Footer == none) || t_Footer.b_Refresh == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Refresh);        
    }
    else
    {
        DisableComponent(t_Footer.b_Refresh);
    }
    //return;    
}

function JoinClicked()
{
    //return;    
}

function SpectateClicked()
{
    //return;    
}

function FilterClicked()
{
    //return;    
}

function RefreshClicked()
{
    Refresh();
    //return;    
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
    //return;    
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    return true;
    //return;    
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = JoinCaption;
    return true;
    //return;    
}

function bool IsFilterAvailable(out string ButtonCaption)
{
    ButtonCaption = FilterCaption;
    return false;
    //return;    
}

function ShowNetworkError(optional string ErrorMsg)
{
    local export editinline GUIPage Page;

    // End:0x17
    if(ErrorMsg == "")
    {
        ErrorMsg = UnspecifiedNetworkError;
    }
    Page = Controller.ShowQuestionDialog(ErrorMsg, 68, 64);
    // End:0x54
    if(Page != none)
    {
        Page.__OnClose__Delegate = NetworkErrorClosed;
    }
    //return;    
}

function NetworkErrorClosed(bool bCancelled)
{
    //return;    
}

defaultproperties
{
    MustUpgradeString="????? ??, ?? ???? ?????."
    QueryCompleteString="?? ??!"
    StartQueryString="??? ?? ?? ?"
    AuthFailString="?? ??"
    ConnFailString="?? ??"
    ConnTimeoutString="?? ?? ??"
    RetryString=" - ??? ?"
    ReadyString="??"
    BackCaption="?? ????"
    RefreshCaption="??"
    JoinCaption="??"
    SpectateCaption="??"
    FilterCaption="??"
    UnspecifiedNetworkError="???? ??? ???? ??? ???????."
    bCommonButtonWidth=true
    bFillHeight=true
    FadeInTime=0.2500000
}