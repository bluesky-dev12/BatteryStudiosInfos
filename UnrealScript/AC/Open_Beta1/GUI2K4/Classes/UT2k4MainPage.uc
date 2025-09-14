class UT2k4MainPage extends UT2K4GUIPage
    config(User)
    editinlinenew
    instanced;

var() automated GUITabControl c_Tabs;
var() automated GUIHeader t_Header;
var() automated ButtonFooter t_Footer;
var() automated BackgroundImage i_Background;
var() automated GUIImage i_bkChar;
var() automated GUIImage i_bkScan;
var string HighScoreFile;
var private globalconfig string TotalUnlockedCharacters;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(GUIPage).InitComponent(MyC, MyO);
    c_Tabs.MyFooter = t_Footer;
    t_Header.DockedTabs = c_Tabs;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    // End:0x2C
    if(Param1 != "")
    {
        // End:0x2C
        if(c_Tabs != none)
        {
            c_Tabs.ActivateTabByName(Param1, true);
        }
    }
    //return;    
}

function bool GetRestoreParams(out string Param1, out string Param2)
{
    // End:0x40
    if((c_Tabs != none) && c_Tabs.ActiveTab != none)
    {
        Param1 = c_Tabs.ActiveTab.Caption;
        return true;
    }
    return false;
    //return;    
}

static function bool UnlockCharacter(string CharName)
{
    local int i;
    local array<string> unLocked;

    // End:0x0E
    if(CharName == "")
    {
        return false;
    }
    Split(default.TotalUnlockedCharacters, ";", unLocked);
    i = 0;
    J0x24:

    // End:0x55 [Loop If]
    if(i < unLocked.Length)
    {
        // End:0x4B
        if(unLocked[i] ~= CharName)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    unLocked[unLocked.Length] = CharName;
    default.TotalUnlockedCharacters = JoinArray(unLocked, ";", true);
    StaticSaveConfig();
    return true;
    //return;    
}

static function bool IsUnlocked(string CharName)
{
    return (CharName != "") && InStr((";" $ Caps(default.TotalUnlockedCharacters)) $ ";", (";" $ Caps(CharName)) $ ";") != -1;
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'GUI2K4_Decompressed.UT2k4MainPage.PageTabs'
    begin object name="PageTabs" class=XInterface.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        BackgroundStyleName="TabBackground"
        WinLeft=0.0100000
        WinWidth=0.9800000
        WinHeight=0.0400000
        RenderWeight=0.4900000
        TabOrder=3
        bAcceptsInput=true
        OnActivate=PageTabs.InternalOnActivate
        OnChange=UT2k4MainPage.InternalOnChange
    end object
    c_Tabs=PageTabs
    // Reference: BackgroundImage'GUI2K4_Decompressed.UT2k4MainPage.PageBackground'
    begin object name="PageBackground" class=XInterface.BackgroundImage
        ImageStyle=5
        X1=0
        Y1=0
        X2=4
        Y2=768
        RenderWeight=0.0100000
    end object
    i_Background=PageBackground
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainPage.BkChar'
    begin object name="BkChar" class=XInterface.GUIImage
        ImageStyle=2
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.0200000
    end object
    i_bkChar=BkChar
    // Reference: BackgroundImage'GUI2K4_Decompressed.UT2k4MainPage.PageScanLine'
    begin object name="PageScanLine" class=XInterface.BackgroundImage
        ImageColor=(R=255,G=255,B=255,A=32)
        ImageStyle=6
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=32
        Y2=32
        RenderWeight=0.0300000
    end object
    i_bkScan=PageScanLine
    HighScoreFile="BatteryHighScores"
    bPersistent=true
    bRestorable=true
}