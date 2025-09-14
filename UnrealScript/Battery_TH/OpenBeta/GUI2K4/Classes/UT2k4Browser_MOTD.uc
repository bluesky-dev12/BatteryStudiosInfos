class UT2k4Browser_MOTD extends UT2K4Browser_Page
    config(User)
    editinlinenew
    instanced;

var() automated GUIScrollTextBox lb_MOTD;
var() automated GUILabel l_Version;
var() automated GUIButton b_QuickConnect;
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
    //return;    
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_MOTD.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
    //return;    
}

event Timer()
{
    // End:0x3B
    if(RetryCount++ < RetryMax)
    {
        SetFooterCaption(RetryString, true);
        Browser.Uplink().StartQuery(1);        
    }
    else
    {
        SetFooterCaption(ReadyString);
        KillTimer();
    }
    //return;    
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
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x37
    if(bShow && !bInit)
    {
        BindQueryClient(Browser.Uplink());
    }
    //return;    
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
    //return;    
}

function ReceivedMOTD(MasterServerClient.EMOTDResponse Command, string Data)
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
            // End:0xB9
            break;
        // End:0x87
        case 2:
            bOptionalUpgrade = true;
            CheckJoinButton(true);
            // End:0xB9
            break;
        // End:0x9E
        case 1:
            bUpgrade = true;
            CheckJoinButton(true);
            // End:0xB9
            break;
        // End:0xA6
        case 3:
            // End:0xB9
            break;
        // End:0xAE
        case 4:
            // End:0xB9
            break;
        // End:0xB6
        case 5:
            // End:0xB9
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OpenStatusMessage(string Code, optional string Data)
{
    // End:0x3B
    if(!Browser.bHideNetworkMessage)
    {
        Controller.OpenMenu(Controller.NetworkMsgMenu, Code, Data);
    }
    Browser.bHideNetworkMessage = true;
    SetFooterCaption(AuthFailString);
    SetTimer(ReReadyPause, false);
    //return;    
}

function QueryComplete(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    switch(ResponseInfo)
    {
        // End:0xBE
        case 3:
            // End:0xBB
            if(Info == 1)
            {
                // End:0x6B
                if(Browser.Uplink().ModRevLevel > 0)
                {
                    Class'GUI2K4_Decompressed.Ut2K4Community'.default.ModRevLevel = Browser.Uplink().ModRevLevel;
                    Class'GUI2K4_Decompressed.Ut2K4Community'.static.StaticSaveConfig();
                }
                SetFooterCaption(QueryCompleteString);
                RetryCount = RetryMax;
                SetTimer(ReReadyPause, false);
                // End:0xBB
                if(!bUpgrade && !Browser.Verified)
                {
                    Browser.MOTDVerified(true);
                }
            }
            // End:0x1D2
            break;
        // End:0xE5
        case 0:
            OpenStatusMessage("RI_AuthenticationFailed");
            // End:0x1D2
            break;
        // End:0x101
        case 5:
            OpenStatusMessage("RI_DevClient");
            // End:0x1D2
            break;
        // End:0x11D
        case 6:
            OpenStatusMessage("RI_BadClient");
            // End:0x1D2
            break;
        // End:0x137
        case 8:
            OpenStatusMessage("RI_UTANBAN");
            // End:0x1D2
            break;
        // End:0x177
        case 7:
            OpenStatusMessage("RI_BannedClient", string(ResponseInfo) $ Browser.Uplink().OptionalResult);
            // End:0x1D2
            break;
        // End:0x1A3
        case 1:
            lb_MOTD.SetContent(ConnectFailed);
            Browser.MOTDVerified(false);
            // End:0x1D2
            break;
        // End:0x1CF
        case 2:
            lb_MOTD.SetContent(ConnectTimeout);
            Browser.MOTDVerified(false);
            // End:0x1D2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function JoinClicked()
{
    Browser.Uplink().LaunchAutoUpdate();
    //return;    
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    return false;
    //return;    
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = UpgradeCaption;
    return bUpgrade || bOptionalUpgrade;
    //return;    
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x4F
    if(Sender == b_QuickConnect)
    {
        // End:0x4D
        if(Controller.OpenMenu(QuickConnectMenu))
        {
            Controller.ActivePage.HandleObject(Browser.Uplink());
        }
        return true;
    }
    return false;
    //return;    
}

function ResetQueryClient(ServerQueryClient Client)
{
    super.ResetQueryClient(Client);
    // End:0x31
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).Query.Length = 0;
    }
    //return;    
}

function BindQueryClient(ServerQueryClient Client)
{
    super.BindQueryClient(Client);
    // End:0x4D
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).__OnReceivedMOTDData__Delegate = ReceivedMOTD;
        MasterServerClient(Client).__OnQueryFinished__Delegate = QueryComplete;
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2k4Browser_MOTD.MyMOTDText'
    begin object name="MyMOTDText" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0500000
        EOLDelay=0.1000000
        bVisibleWhenEmpty=true
        OnCreateComponent=MyMOTDText.InternalOnCreateComponent
        StyleName="ListBox"
        WinTop=0.0026790
        WinHeight=0.8332030
        RenderWeight=0.6000000
        TabOrder=1
        bNeverFocus=true
    end object
    lb_MOTD=MyMOTDText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2k4Browser_MOTD.VersionNum'
    begin object name="VersionNum" class=XInterface.GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=-0.0434150
        WinLeft=0.7935000
        WinWidth=0.2021280
        WinHeight=0.0400000
        RenderWeight=20.7000008
    end object
    l_Version=VersionNum
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_MOTD.QuickPlay'
    begin object name="QuickPlay" class=XInterface.GUIButton
        Caption="? ???"
        bAutoSize=true
        Hint="??? ???? ??? ??? ??? ?? ?? ? ??? ?????."
        WinTop=0.8661460
        WinLeft=0.4251800
        WinWidth=0.1619940
        WinHeight=0.0790630
        TabOrder=2
        OnClick=UT2k4Browser_MOTD.InternalOnClick
        OnKeyEvent=QuickPlay.InternalOnKeyEvent
    end object
    b_QuickConnect=QuickPlay
    ReReadyPause=3.0000000
    RetryMax=10
    UpgradeCaption="?????"
    VersionString="??"
    QuickConnectMenu="GUI2K4.UT2K4QuickPlay"
    ConnectFailed="The UT2004 ??? ??? ???? ?????. ??? ?? ??? ????."
    ConnectTimeout="The UT2004 ??? ?? ??? ???????"
    MOTDHeader="UT 2004? ?? ??? ?????. UT2004? ????? ????? ? ?? ???? ??  ???? ??? ?? ???? ?? ????. | ?? ????? ???, http://www.unrealtournament.com ?? ??? ??? ??? ?? ??? ??? ?? ? ????.|?? UT 2004? ??? ???? ???? ? ?? ??? ?? ?? ? ????."
    PanelCaption="Epic ????? ??"
}