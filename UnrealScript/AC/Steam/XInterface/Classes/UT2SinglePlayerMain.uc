/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2SinglePlayerMain.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:11
 *
 *******************************************************************************/
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
        // End:0x58
        else
        {
        }
        // End:0x81
        if(GP.SpecialEvent != "")
        {
            HandleSpecialEvent(GP.SpecialEvent);
        }
    }
}

function PopupButton(byte yButton)
{
    PlayerOwner().Level.Game.CurrentGameProfile.SpecialEvent = "";
}

function HandleSpecialEvent(string SpecialEvent);
event ChangeHint(string NewHint)
{
    GUITitleBar(Controls[1]).SetCaption(NewHint);
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
    // End:0x19c
    else
    {
        // End:0x19c
        if(Sender == ButtonPlay)
        {
            GP = PlayerOwner().Level.Game.CurrentGameProfile;
            // End:0x13c
            if(GP != none)
            {
                PlayerOwner().Level.Game.SavePackage(GP.PackageName);
                // End:0xf5
                if(GP.CurrentLadder > 0 || GP.CurrentLadder == 0 && GP.CurrentMenuRung == 5 && GP.PlayerTeam[0] == "")
                {
                    HandleSpecialEvent("DRAFT");
                    return true;
                }
                myLevel = PlayerOwner().Level;
                Controller.CloseAll(false);
                GP.StartNewMatch(GP.CurrentLadder, myLevel);
            }
            // End:0x19c
            else
            {
                // End:0x19c
                if(Controller.OpenMenu("XInterface.GUIQuestionPage"))
                {
                    GPage = GUIQuestionPage(Controller.TopPage());
                    GPage.SetupQuestion(MessageCreateProfileFirst, 1, 1);
                }
            }
        }
    }
    return true;
}

function TabChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    ResetTitleBar(GUITabButton(Sender));
}

function ResetTitleBar(GUITabButton tB)
{
    // End:0x98
    if(PlayerOwner().Level.Game.CurrentGameProfile != none)
    {
        GUITitleBar(Controls[4]).SetCaption(GUITitleBar(default.Controls[4]).GetCaption() @ "|" @ PlayerOwner().Level.Game.CurrentGameProfile.PlayerName @ "|" @ tB.Caption);
    }
    // End:0xdb
    else
    {
        GUITitleBar(Controls[4]).SetCaption(GUITitleBar(default.Controls[4]).GetCaption() @ "|" @ tB.Caption);
    }
}

function BoxChange(GUIComponent Sender)
{
    HandleSpecialEvent(moComboBox(Sender).GetText());
}

function PassThroughProfileUpdated();
function ProfileUpdated()
{
    local GameProfile GP;
    local bool bRosterOn;

    // End:0x35
    if(TabC != none && TabC.ActiveTab != none)
    {
        ResetTitleBar(TabC.ActiveTab);
    }
    // End:0x42
    if(!bFinishedPanels)
    {
        return;
    }
    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x7c
    if(GP == none)
    {
        bRosterOn = false;
    }
    // End:0x97
    else
    {
        bRosterOn = GP.PlayerTeam[0] != "";
    }
}

defaultproperties
{
    MessageLadderAvailable="Ladder games are available."
    MessageLadderComplete="="Game complete.""
    MessageCreateProfileFirst="Create or load a profile before playing."
    TabNameProfileNew="Create Profile"
    TabNameProfileLoad="Manage Profile"
    TabNameQualification="Qualifications"
    TabNameLadder="Ladder Game"
    TabNameRoster="Roster"
    TabNameTutorials="Tutorial"
    TabHintProfileNew="Begin a new single player battle."
    TabHintProfileLoad="Manage the current single player battle."
    TabHintQualification="UT personal preliminaries."
    TabHintLadder="UT Team Match"
    TabHintRoster="Line up next match."
    TabHintTutorials="Check the game type tutorial."
    Controls=// Object reference not set to an instance of an object.
    
}