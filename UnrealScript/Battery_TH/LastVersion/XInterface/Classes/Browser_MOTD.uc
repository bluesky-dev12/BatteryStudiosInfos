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
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    StatusBar = GUITitleBar(GUIPanel(Controls[1]).Controls[3]);
    StatusBar.SetCaption(ReadyString);
    MSC = PlayerOwner().Level.Spawn(Class'IpDrv.MasterServerClient');
    MSC.__OnReceivedMOTDData__Delegate = MyReceivedMOTDData;
    MSC.__OnQueryFinished__Delegate = MyQueryFinished;
    MOTDTextBox = GUIScrollTextBox(Controls[0]);
    GUIButton(GUIPanel(Controls[1]).Controls[0]).__OnClick__Delegate = BackClick;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = RefreshClick;
    UpgradeButton = GUIButton(GUIPanel(Controls[1]).Controls[2]);
    UpgradeButton.__OnClick__Delegate = UpgradeClick;
    // End:0x17E
    if(!GotMOTD)
    {
        UpgradeButton.bVisible = false;
        MustUpgrade = false;
        MSC.StartQuery(1);
        StatusBar.SetCaption(StartQueryString);
        SetTimer(0.0000000, false);
    }
    Controls[2].bBoundToParent = false;
    GUILabel(Controls[2]).Caption = ("Battery" @ VersionString) @ PlayerOwner().Level.EngineVersion;
    //return;    
}

function MyReceivedMOTDData(MasterServerClient.EMOTDResponse Command, string Data)
{
    switch(Command)
    {
        // End:0x2F
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function MyQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
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
            // End:0xEA
            break;
        // End:0x6C
        case 0:
            StatusBar.SetCaption(AuthFailString);
            SetTimer(ReReadyPause, false);
            // End:0xEA
            break;
        // End:0xB2
        case 1:
            StatusBar.SetCaption(ConnFailString);
            SetTimer(ReReadyPause, false);
            Browser.MOTDVerified(false);
            MSC.StartQuery(1);
            // End:0xEA
            break;
        // End:0xE7
        case 2:
            StatusBar.SetCaption(ConnTimeoutString);
            Browser.MOTDVerified(false);
            SetTimer(ReReadyPause, false);
            // End:0xEA
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnCloseBrowser()
{
    // End:0x2D
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Destroy();
        MSC = none;
    }
    //return;    
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool RefreshClick(GUIComponent Sender)
{
    MustUpgrade = false;
    UpgradeButton.bVisible = false;
    MSC.Stop();
    MSC.StartQuery(1);
    StatusBar.SetCaption(StartQueryString);
    SetTimer(0.0000000, false);
    return true;
    //return;    
}

function bool UpgradeClick(GUIComponent Sender)
{
    MSC.LaunchAutoUpdate();
    return true;
    //return;    
}

defaultproperties
{
    ReReadyPause=2.0000000
    VersionString="Ver."
    // Reference: GUIScrollTextBox'XInterface_Decompressed.Browser_MOTD.MyMOTDText'
    begin object name="MyMOTDText" class=XInterface_Decompressed.GUIScrollTextBox
        CharDelay=0.0040000
        EOLDelay=0.1000000
        OnCreateComponent=MyMOTDText.InternalOnCreateComponent
        WinTop=0.0480000
        WinLeft=0.0500000
        WinWidth=0.9000000
        WinHeight=0.8000000
        bNeverFocus=true
    end object
    Controls[0]=MyMOTDText
    // Reference: GUIPanel'XInterface_Decompressed.Browser_MOTD.FooterPanel'
    begin object name="FooterPanel" class=XInterface_Decompressed.GUIPanel
        Controls[0]=GUIButton'XInterface_Decompressed.Browser_MOTD.MyBackButton'
        Controls[1]=GUIButton'XInterface_Decompressed.Browser_MOTD.MyRefreshButton'
        Controls[2]=GUIButton'XInterface_Decompressed.Browser_MOTD.MyUpgradeButton'
        Controls[3]=GUITitleBar'XInterface_Decompressed.Browser_MOTD.MyStatus'
        WinTop=0.9000000
        WinHeight=0.1000000
    end object
    Controls[1]=FooterPanel
    // Reference: GUILabel'XInterface_Decompressed.Browser_MOTD.VersionNum'
    begin object name="VersionNum" class=XInterface_Decompressed.GUILabel
        TextAlign=2
        TextColor=(R=100,G=100,B=160,A=255)
        WinTop=0.0025000
        WinLeft=0.4950000
        WinWidth=0.5000000
        WinHeight=0.0400000
    end object
    Controls[2]=VersionNum
}