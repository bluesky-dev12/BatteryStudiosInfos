/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_MOTD.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:16
 *
 *******************************************************************************/
class UT2k4Browser_MOTD extends UT2K4Browser_Page
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MOTD;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Version;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_QuickConnect;
var string MOTD;
var bool bUpgrade;
var bool bOptionalUpgrade;
var bool GotMOTD;
var float ReReadyPause;
var int RetryCount;
var() config int RetryMax;
var localized string UpgradeCaption;
var localized string VersionString;
var config string QuickConnectMenu;
var localized string ConnectFailed;
var localized string ConnectTimeout;
var localized string MOTDHeader;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_MOTD.MyScrollText.bClickText = true;
    lb_MOTD.MyScrollText.__OnDblClick__Delegate = LaunchURL;
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_MOTD.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
}

event Timer()
{
    // End:0x3b
    if(++ RetryCount < RetryMax)
    {
        SetFooterCaption(RetryString, true);
        Browser.Uplink().StartQuery(1);
    }
    // End:0x49
    else
    {
        SetFooterCaption(ReadyString);
        KillTimer();
    }
}

event Opened(GUIComponent Sender)
{
    l_Version.Caption = VersionString @ PlayerOwner().Level.EngineVersion;
    // End:0x47
    if(!GotMOTD)
    {
        DisableComponent(b_QuickConnect);
        Refresh();
    }
    super.Opened(Sender);
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x37
    if(bShow && !bInit)
    {
        BindQueryClient(Browser.Uplink());
    }
}

function Refresh()
{
    KillTimer();
    bUpgrade = false;
    CheckJoinButton(false);
    lb_MOTD.Stop();
    RetryCount = 0;
    ResetQueryClient(Browser.Uplink());
    SetFooterCaption(StartQueryString);
    Browser.Uplink().StartQuery(1);
}

function ReceivedMOTD(IpDrv.MasterServerClient.EMOTDResponse Command, string Data)
{
    switch(Command)
    {
        // End:0x70
        case 0:
            GotMOTD = true;
            // End:0x43
            if(MOTDHeader != "")
            {
                ReplaceText(MOTDHeader, "|", Chr(13));
                MOTDHeader = MOTDHeader $ Chr(13);
            }
            EnableComponent(b_QuickConnect);
            lb_MOTD.SetContent(MOTDHeader $ Data, Chr(13));
            // End:0xb9
            break;
        // End:0x87
        case 2:
            bOptionalUpgrade = true;
            CheckJoinButton(true);
            // End:0xb9
            break;
        // End:0x9e
        case 1:
            bUpgrade = true;
            CheckJoinButton(true);
            // End:0xb9
            break;
        // End:0xa6
        case 3:
            // End:0xb9
            break;
        // End:0xae
        case 4:
            // End:0xb9
            break;
        // End:0xb6
        case 5:
            // End:0xb9
            break;
        // End:0xffff
        default:
}

function OpenStatusMessage(string Code, optional string Data)
{
    // End:0x3b
    if(!Browser.bHideNetworkMessage)
    {
        Controller.OpenMenu(Controller.NetworkMsgMenu, Code, Data);
    }
    Browser.bHideNetworkMessage = true;
    SetFooterCaption(AuthFailString);
    SetTimer(ReReadyPause, false);
}

function QueryComplete(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    switch(ResponseInfo)
    {
        // End:0xbe
        case 3:
            // End:0xbb
            if(Info == 1)
            {
                // End:0x6b
                if(Browser.Uplink().ModRevLevel > 0)
                {
                    class'Ut2K4Community'.default.ModRevLevel = Browser.Uplink().ModRevLevel;
                    class'Ut2K4Community'.static.StaticSaveConfig();
                }
                SetFooterCaption(QueryCompleteString);
                RetryCount = RetryMax;
                SetTimer(ReReadyPause, false);
                // End:0xbb
                if(!bUpgrade && !Browser.Verified)
                {
                    Browser.MOTDVerified(true);
                }
            }
            // End:0x1d2
            break;
        // End:0xe5
        case 0:
            OpenStatusMessage("RI_AuthenticationFailed");
            // End:0x1d2
            break;
        // End:0x101
        case 5:
            OpenStatusMessage("RI_DevClient");
            // End:0x1d2
            break;
        // End:0x11d
        case 6:
            OpenStatusMessage("RI_BadClient");
            // End:0x1d2
            break;
        // End:0x137
        case 8:
            OpenStatusMessage("RI_UTANBAN");
            // End:0x1d2
            break;
        // End:0x177
        case 7:
            OpenStatusMessage("RI_BannedClient", string(ResponseInfo) $ Browser.Uplink().OptionalResult);
            // End:0x1d2
            break;
        // End:0x1a3
        case 1:
            lb_MOTD.SetContent(ConnectFailed);
            Browser.MOTDVerified(false);
            // End:0x1d2
            break;
        // End:0x1cf
        case 2:
            lb_MOTD.SetContent(ConnectTimeout);
            Browser.MOTDVerified(false);
            // End:0x1d2
            break;
        // End:0xffff
        default:
}

function JoinClicked()
{
    Browser.Uplink().LaunchAutoUpdate();
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    return false;
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = UpgradeCaption;
    return bUpgrade || bOptionalUpgrade;
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x4f
    if(Sender == b_QuickConnect)
    {
        // End:0x4d
        if(Controller.OpenMenu(QuickConnectMenu))
        {
            Controller.ActivePage.HandleObject(Browser.Uplink());
        }
        return true;
    }
    return false;
}

function ResetQueryClient(ServerQueryClient Client)
{
    super.ResetQueryClient(Client);
    // End:0x31
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).Query.Length = 0;
    }
}

function BindQueryClient(ServerQueryClient Client)
{
    super.BindQueryClient(Client);
    // End:0x4d
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).__OnReceivedMOTDData__Delegate = ReceivedMOTD;
        MasterServerClient(Client).__OnQueryFinished__Delegate = QueryComplete;
    }
}

defaultproperties
{
    begin object name=MyMOTDText class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.050
        EOLDelay=0.10
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ListBox"
        WinTop=0.0026790
        WinHeight=0.8332030
        RenderWeight=0.60
        TabOrder=1
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2k4Browser_MOTD.MyMOTDText'
    lb_MOTD=MyMOTDText
    begin object name=VersionNum class=GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=-0.0434150
        WinLeft=0.79350
        WinWidth=0.2021280
        WinHeight=0.040
        RenderWeight=20.70
    object end
    // Reference: GUILabel'UT2k4Browser_MOTD.VersionNum'
    l_Version=VersionNum
    begin object name=QuickPlay class=GUIButton
        Caption="? ???"
        bAutoSize=true
        Hint="??? ???? ??? ??? ??? ?? ?? ? ??? ?????."
        WinTop=0.8661460
        WinLeft=0.425180
        WinWidth=0.1619940
        WinHeight=0.0790630
        TabOrder=2
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_MOTD.QuickPlay'
    b_QuickConnect=QuickPlay
    ReReadyPause=3.0
    RetryMax=10
    UpgradeCaption="?????"
    VersionString="??"
    QuickConnectMenu="GUI2K4.UT2K4QuickPlay"
    ConnectFailed="The UT2004 ??? ??? ???? ?????. ??? ?? ??? ????."
    ConnectTimeout="The UT2004 ??? ?? ??? ???????"
    MOTDHeader="UT 2004? ?? ??? ?????. UT2004? ????? ????? ? ?? ???? ??  ???? ??? ?? ???? ?? ????. | ?? ????? ???, http://www.unrealtournament.com ?? ??? ??? ??? ?? ??? ??? ?? ? ????.|?? UT 2004? ??? ???? ???? ? ?? ??? ?? ?? ? ????."
    PanelCaption="Epic ????? ??"
}