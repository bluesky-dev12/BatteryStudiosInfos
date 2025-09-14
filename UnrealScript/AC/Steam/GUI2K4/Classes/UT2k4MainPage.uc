/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4MainPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:6
 *
 *******************************************************************************/
class UT2k4MainPage extends UT2K4GUIPage
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Tabs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIHeader t_Header;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonFooter t_Footer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BackgroundImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bkChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bkScan;
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
}

function InternalOnChange(GUIComponent Sender);
function HandleParameters(string Param1, string Param2)
{
    // End:0x2c
    if(Param1 != "")
    {
        // End:0x2c
        if(c_Tabs != none)
        {
            c_Tabs.ActivateTabByName(Param1, true);
        }
    }
}

function bool GetRestoreParams(out string Param1, out string Param2)
{
    // End:0x40
    if(c_Tabs != none && c_Tabs.ActiveTab != none)
    {
        Param1 = c_Tabs.ActiveTab.Caption;
        return true;
    }
    return false;
}

static function bool UnlockCharacter(string CharName)
{
    local int i;
    local array<string> unLocked;

    // End:0x0e
    if(CharName == "")
    {
        return false;
    }
    Split(default.TotalUnlockedCharacters, ";", unLocked);
    i = 0;
    J0x24:
    // End:0x55 [While If]
    if(i < unLocked.Length)
    {
        // End:0x4b
        if(unLocked[i] ~= CharName)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
    unLocked[unLocked.Length] = CharName;
    default.TotalUnlockedCharacters = JoinArray(unLocked, ";", true);
    StaticSaveConfig();
    return true;
}

static function bool IsUnlocked(string CharName)
{
    return CharName != "" && InStr(";" $ Caps(default.TotalUnlockedCharacters) $ ";", ";" $ Caps(CharName) $ ";") != -1;
}

defaultproperties
{
    begin object name=PageTabs class=GUITabControl
        bDockPanels=true
        TabHeight=0.040
        BackgroundStyleName="TabBackground"
        WinLeft=0.010
        WinWidth=0.980
        WinHeight=0.040
        RenderWeight=0.490
        TabOrder=3
        bAcceptsInput=true
        OnActivate=InternalOnActivate
        OnChange=InternalOnChange
    object end
    // Reference: GUITabControl'UT2k4MainPage.PageTabs'
    c_Tabs=PageTabs
    begin object name=PageBackground class=BackgroundImage
        ImageStyle=5
        X1=0
        Y1=0
        X2=4
        Y2=768
        RenderWeight=0.010
    object end
    // Reference: BackgroundImage'UT2k4MainPage.PageBackground'
    i_Background=PageBackground
    begin object name=BkChar class=GUIImage
        ImageStyle=2
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.020
    object end
    // Reference: GUIImage'UT2k4MainPage.BkChar'
    i_bkChar=BkChar
    begin object name=PageScanLine class=BackgroundImage
        ImageColor=(R=255,G=255,B=255,A=32)
        ImageStyle=6
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=32
        Y2=32
        RenderWeight=0.030
    object end
    // Reference: BackgroundImage'UT2k4MainPage.PageScanLine'
    i_bkScan=PageScanLine
    HighScoreFile="BatteryHighScores"
    bPersistent=true
    bRestorable=true
}