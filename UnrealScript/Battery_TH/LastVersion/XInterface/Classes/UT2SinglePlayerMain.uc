class UT2SinglePlayerMain extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline GUIButton ButtonMenu;
var export editinline GUIButton ButtonPlay;
var export editinline GUITabControl TabC;
var localized string MessageLadderAvailable;
var localized string MessageLadderComplete;
var localized string MessageCreateProfileFirst;
var localized string TabNameProfileNew;
var localized string TabNameProfileLoad;
var localized string TabNameQualification;
var localized string TabNameLadder;
var localized string TabNameRoster;
var localized string TabNameTutorials;
var localized string TabHintProfileNew;
var localized string TabHintProfileLoad;
var localized string TabHintQualification;
var localized string TabHintLadder;
var localized string TabHintRoster;
var localized string TabHintTutorials;
var bool bFinishedPanels;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    TabC = GUITabControl(Controls[0]);
    ButtonMenu = GUIButton(Controls[2]);
    ButtonPlay = GUIButton(Controls[3]);
    GUITitleBar(Controls[4]).DockedTabs = TabC;
    bFinishedPanels = true;
    ProfileUpdated();
    TabC.bDockPanels = true;
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    local GameProfile GP;

    super(GUIPage).HandleParameters(Param1, Param2);
    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x81
    if(GP != none)
    {
        // End:0x58
        if(GP.ladderrung[1] >= 0)
        {            
        }
        // End:0x81
        if(GP.SpecialEvent != "")
        {
            HandleSpecialEvent(GP.SpecialEvent);
        }
    }
    //return;    
}

function PopupButton(byte yButton)
{
    PlayerOwner().Level.Game.CurrentGameProfile.SpecialEvent = "";
    //return;    
}

function HandleSpecialEvent(string SpecialEvent)
{
    //return;    
}

event ChangeHint(string NewHint)
{
    GUITitleBar(Controls[1]).SetCaption(NewHint);
    //return;    
}

function bool ButtonClick(GUIComponent Sender)
{
    local GameProfile GP;
    local LevelInfo myLevel;
    local export editinline GUIQuestionPage GPage;

    // End:0x21
    if(Sender == ButtonMenu)
    {
        Controller.CloseMenu();        
    }
    else
    {
        // End:0x19C
        if(Sender == ButtonPlay)
        {
            GP = PlayerOwner().Level.Game.CurrentGameProfile;
            // End:0x13C
            if(GP != none)
            {
                PlayerOwner().Level.Game.SavePackage(GP.PackageName);
                // End:0xF5
                if(((GP.CurrentLadder > 0) || (GP.CurrentLadder == 0) && GP.CurrentMenuRung == 5) && GP.PlayerTeam[0] == "")
                {
                    HandleSpecialEvent("DRAFT");
                    return true;
                }
                myLevel = PlayerOwner().Level;
                Controller.CloseAll(false);
                GP.StartNewMatch(GP.CurrentLadder, myLevel);                
            }
            else
            {
                // End:0x19C
                if(Controller.OpenMenu("XInterface.GUIQuestionPage"))
                {
                    GPage = GUIQuestionPage(Controller.TopPage());
                    GPage.SetupQuestion(MessageCreateProfileFirst, 1, 1);
                }
            }
        }
    }
    return true;
    //return;    
}

function TabChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    ResetTitleBar(GUITabButton(Sender));
    //return;    
}

function ResetTitleBar(GUITabButton tB)
{
    // End:0x98
    if(PlayerOwner().Level.Game.CurrentGameProfile != none)
    {
        GUITitleBar(Controls[4]).SetCaption((((GUITitleBar(default.Controls[4]).GetCaption() @ "|") @ PlayerOwner().Level.Game.CurrentGameProfile.PlayerName) @ "|") @ tB.Caption);        
    }
    else
    {
        GUITitleBar(Controls[4]).SetCaption((GUITitleBar(default.Controls[4]).GetCaption() @ "|") @ tB.Caption);
    }
    //return;    
}

function BoxChange(GUIComponent Sender)
{
    HandleSpecialEvent(moComboBox(Sender).GetText());
    //return;    
}

function PassThroughProfileUpdated()
{
    //return;    
}

function ProfileUpdated()
{
    local GameProfile GP;
    local bool bRosterOn;

    // End:0x35
    if((TabC != none) && TabC.ActiveTab != none)
    {
        ResetTitleBar(TabC.ActiveTab);
    }
    // End:0x42
    if(!bFinishedPanels)
    {
        return;
    }
    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x7C
    if(GP == none)
    {
        bRosterOn = false;        
    }
    else
    {
        bRosterOn = GP.PlayerTeam[0] != "";
    }
    //return;    
}

defaultproperties
{
    MessageLadderAvailable="ladder is now available."
    MessageLadderComplete="=\"\""
    MessageCreateProfileFirst="You must create or load a profile before playing."
    TabNameProfileNew="Create Profile"
    TabNameProfileLoad="Manage Profiles"
    TabNameQualification="Qualification"
    TabNameLadder="Ladder"
    TabNameRoster="Roster"
    TabNameTutorials="Tutorials"
    TabHintProfileNew="Create a new single player campaign"
    TabHintProfileLoad="Manage your existing single player campaigns"
    TabHintQualification="Individual competition to qualify for the Unreal Tournament"
    TabHintLadder="Team competition in the Unreal Tournament"
    TabHintRoster="Manage your lineup for the next match"
    TabHintTutorials="View tutorials for each game type"
    // Reference: GUITabControl'XInterface_Decompressed.UT2SinglePlayerMain.SPTabs'
    begin object name="SPTabs" class=XInterface_Decompressed.GUITabControl
        bFillSpace=true
        TabHeight=0.0400000
        WinTop=0.2500000
        WinHeight=48.0000000
        bAcceptsInput=true
        OnActivate=SPTabs.InternalOnActivate
        OnChange=UT2SinglePlayerMain.TabChange
    end object
    Controls[0]=SPTabs
    // Reference: GUITitleBar'XInterface_Decompressed.UT2SinglePlayerMain.SPHints'
    begin object name="SPHints" class=XInterface_Decompressed.GUITitleBar
        bUseTextHeight=false
        StyleName="Footer"
        WinTop=0.9300000
        WinLeft=0.1200000
        WinWidth=0.7600000
        WinHeight=0.0550000
    end object
    Controls[1]=SPHints
    // Reference: GUIButton'XInterface_Decompressed.UT2SinglePlayerMain.SPBack'
    begin object name="SPBack" class=XInterface_Decompressed.GUIButton
        Caption="MENU"
        StyleName="SquareMenuButton"
        Hint="Return to main menu"
        WinTop=0.9300000
        WinWidth=0.1200000
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnClick=UT2SinglePlayerMain.ButtonClick
        OnKeyEvent=SPBack.InternalOnKeyEvent
    end object
    Controls[2]=SPBack
    // Reference: GUIButton'XInterface_Decompressed.UT2SinglePlayerMain.SPPlay'
    begin object name="SPPlay" class=XInterface_Decompressed.GUIButton
        Caption="PLAY"
        StyleName="SquareMenuButton"
        Hint="Play the selected match"
        WinTop=0.9300000
        WinLeft=0.8800000
        WinWidth=0.1200000
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnClick=UT2SinglePlayerMain.ButtonClick
        OnKeyEvent=SPPlay.InternalOnKeyEvent
    end object
    Controls[3]=SPPlay
    // Reference: GUITitleBar'XInterface_Decompressed.UT2SinglePlayerMain.SPPageHeader'
    begin object name="SPPageHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Single Player"
        StyleName="Header"
        WinTop=0.0364060
        WinHeight=46.0000000
    end object
    Controls[4]=SPPageHeader
}