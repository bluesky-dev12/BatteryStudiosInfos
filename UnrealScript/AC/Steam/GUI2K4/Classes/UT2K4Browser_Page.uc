/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Browser_Page.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:32
 *
 *******************************************************************************/
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
var delegate<OnOpenConnection> __OnOpenConnection__Delegate;
var delegate<OnCloseConnection> __OnCloseConnection__Delegate;
var delegate<RefreshFooter> __RefreshFooter__Delegate;

delegate OnOpenConnection(optional int Count);
delegate OnCloseConnection(optional int Count);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x4b
    if(UT2k4ServerBrowser(myOwner.MenuOwner) != none)
    {
        Browser = UT2k4ServerBrowser(myOwner.MenuOwner);
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    super(GUIPanel).InitComponent(MyController, myOwner);
    CurrentFooterCaption = ReadyString;
}

event Opened(GUIComponent Sender)
{
    // End:0x53
    if(Browser == none || t_Footer == none && UT2k4ServerBrowser(Sender) != none)
    {
        Browser = UT2k4ServerBrowser(Sender);
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    super(GUIMultiComponent).Opened(Sender);
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
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    return false;
}

function bool ShouldDisplayGameType()
{
    return false;
}

function QueryComplete(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info);
function ReceivedPingInfo(int ServerID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S);
function ReceivedPingTimeout(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause);
function AddQueryTerm(coerce string key, coerce string Value, IpDrv.MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    i = 0;
    J0x07:
    // End:0x9e [While If]
    if(i < Browser.Uplink().Query.Length)
    {
        QD = Browser.Uplink().Query[i];
        // End:0x94
        if(QD.key ~= key && QD.Value ~= Value && QD.QueryType == QueryType)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    QD.key = key;
    QD.Value = Value;
    QD.QueryType = QueryType;
    Browser.Uplink().Query[i] = QD;
}

function ResetQueryClient(ServerQueryClient Client)
{
    // End:0x0d
    if(Client == none)
    {
        return;
    }
    Client.CancelPings();
    BindQueryClient(Client);
    SetFooterCaption(ReadyString);
}

function BindQueryClient(ServerQueryClient Client)
{
    // End:0x0d
    if(Client == none)
    {
        return;
    }
    Client.__OnReceivedPingInfo__Delegate = ReceivedPingInfo;
    Client.__OnPingTimeout__Delegate = ReceivedPingTimeout;
}

function CloseMSConnection()
{
    // End:0x3d
    if(Browser != none)
    {
        Browser.Uplink().CancelPings();
        Browser.Uplink().Stop();
    }
}

delegate RefreshFooter(optional UT2K4Browser_Page Page, optional string bPerButtonSizes);
function SetFooterCaption(string NewCaption, optional bool bAppend)
{
    local export editinline GUITabControl TC;

    TC = GUITabControl(MenuOwner);
    // End:0x41
    if(TC.PendingTab != none)
    {
        // End:0x3e
        if(TC.PendingTab != MyButton)
        {
            return;
        }
    }
    // End:0x5b
    else
    {
        // End:0x5b
        if(TC.ActiveTab != MyButton)
        {
            return;
        }
    }
    // End:0x7f
    if(t_Footer == none)
    {
        t_Footer = UT2k4Browser_Footer(Browser.t_Footer);
    }
    // End:0xad
    if(bAppend)
    {
        NewCaption = t_Footer.t_StatusBar.GetCaption() $ NewCaption;
    }
    t_Footer.t_StatusBar.SetCaption(NewCaption);
    CurrentFooterCaption = t_Footer.t_StatusBar.Caption;
}

function SetJoinCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Join == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Join.Caption $ NewCaption;
    }
    t_Footer.b_Join.Caption = NewCaption;
}

function SetSpectateCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Spectate == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Spectate.Caption $ NewCaption;
    }
    t_Footer.b_Spectate.Caption = NewCaption;
}

function SetRefreshCaption(string NewCaption, optional bool bAppend)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Refresh == none)
    {
        return;
    }
    // End:0x50
    if(bAppend)
    {
        NewCaption = t_Footer.b_Refresh.Caption $ NewCaption;
    }
    t_Footer.b_Refresh.Caption = NewCaption;
}

function CheckJoinButton(bool Available)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Join == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Join);
    }
    // End:0x57
    else
    {
        DisableComponent(t_Footer.b_Join);
    }
}

function CheckSpectateButton(bool Available)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Spectate == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Spectate);
    }
    // End:0x57
    else
    {
        DisableComponent(t_Footer.b_Spectate);
    }
}

function CheckRefreshButton(bool Available)
{
    // End:0x23
    if(t_Footer == none || t_Footer.b_Refresh == none)
    {
        return;
    }
    // End:0x43
    if(Available)
    {
        EnableComponent(t_Footer.b_Refresh);
    }
    // End:0x57
    else
    {
        DisableComponent(t_Footer.b_Refresh);
    }
}

function JoinClicked();
function SpectateClicked();
function FilterClicked();
function RefreshClicked()
{
    Refresh();
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    return true;
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = JoinCaption;
    return true;
}

function bool IsFilterAvailable(out string ButtonCaption)
{
    ButtonCaption = FilterCaption;
    return false;
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
}

function NetworkErrorClosed(bool bCancelled);

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
    FadeInTime=0.250
}