/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_MOTD.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:8
 *
 *******************************************************************************/
class Browser_MOTD extends Browser_Page
    editinlinenew
    instanced;

var MasterServerClient MSC;
var string MOTD;
var export editinline GUIScrollTextBox MOTDTextBox;
var export editinline GUIButton UpgradeButton;
var bool MustUpgrade;
var bool GotMOTD;
var export editinline GUITitleBar StatusBar;
var float ReReadyPause;
var localized string VersionString;

event Timer()
{
    StatusBar.SetCaption(ReadyString);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    StatusBar = GUITitleBar(GUIPanel(Controls[1]).Controls[3]);
    StatusBar.SetCaption(ReadyString);
    MSC = PlayerOwner().Level.Spawn(class'MasterServerClient');
    MSC.__OnReceivedMOTDData__Delegate = MyReceivedMOTDData;
    MSC.__OnQueryFinished__Delegate = MyQueryFinished;
    MOTDTextBox = GUIScrollTextBox(Controls[0]);
    GUIButton(GUIPanel(Controls[1]).Controls[0]).__OnClick__Delegate = BackClick;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = RefreshClick;
    UpgradeButton = GUIButton(GUIPanel(Controls[1]).Controls[2]);
    UpgradeButton.__OnClick__Delegate = UpgradeClick;
    // End:0x17e
    if(!GotMOTD)
    {
        UpgradeButton.bVisible = false;
        MustUpgrade = false;
        MSC.StartQuery(1);
        StatusBar.SetCaption(StartQueryString);
        SetTimer(0.0, false);
    }
    Controls[2].bBoundToParent = false;
    GUILabel(Controls[2]).Caption = "Battery" @ VersionString @ PlayerOwner().Level.EngineVersion;
}

function MyReceivedMOTDData(IpDrv.MasterServerClient.EMOTDResponse Command, string Data)
{
    switch(Command)
    {
        // End:0x2f
        case 0:
            GotMOTD = true;
            MOTDTextBox.SetContent(Data, Chr(13));
            // End:0x84
            break;
        // End:0x48
        case 2:
            UpgradeButton.bVisible = true;
            // End:0x84
            break;
        // End:0x69
        case 1:
            MustUpgrade = true;
            UpgradeButton.bVisible = true;
            // End:0x84
            break;
        // End:0x71
        case 3:
            // End:0x84
            break;
        // End:0x79
        case 4:
            // End:0x84
            break;
        // End:0x81
        case 5:
            // End:0x84
            break;
        // End:0xffff
        default:
}

function MyQueryFinished(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    switch(ResponseInfo)
    {
        // End:0x47
        case 3:
            StatusBar.SetCaption(QueryCompleteString);
            SetTimer(ReReadyPause, false);
            // End:0x44
            if(!MustUpgrade)
            {
                Browser.MOTDVerified(true);
            }
            // End:0xea
            break;
        // End:0x6c
        case 0:
            StatusBar.SetCaption(AuthFailString);
            SetTimer(ReReadyPause, false);
            // End:0xea
            break;
        // End:0xb2
        case 1:
            StatusBar.SetCaption(ConnFailString);
            SetTimer(ReReadyPause, false);
            Browser.MOTDVerified(false);
            MSC.StartQuery(1);
            // End:0xea
            break;
        // End:0xe7
        case 2:
            StatusBar.SetCaption(ConnTimeoutString);
            Browser.MOTDVerified(false);
            SetTimer(ReReadyPause, false);
            // End:0xea
            break;
        // End:0xffff
        default:
}

function OnCloseBrowser()
{
    // End:0x2d
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Destroy();
        MSC = none;
    }
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function bool RefreshClick(GUIComponent Sender)
{
    MustUpgrade = false;
    UpgradeButton.bVisible = false;
    MSC.Stop();
    MSC.StartQuery(1);
    StatusBar.SetCaption(StartQueryString);
    SetTimer(0.0, false);
    return true;
}

function bool UpgradeClick(GUIComponent Sender)
{
    MSC.LaunchAutoUpdate();
    return true;
}

defaultproperties
{
    ReReadyPause=2.0
    VersionString="Version"
    Controls=// Object reference not set to an instance of an object.
    
}