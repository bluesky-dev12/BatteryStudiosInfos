/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2DraftTeam.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:16
 *
 *******************************************************************************/
class UT2DraftTeam extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline GUIListBox lboStats;
var export editinline GUIListBox lboTeamStats;
var export editinline GUILabel lblMatchData;
var export editinline GUILabel lblChoose;
var export editinline GUIScrollTextBox stbPlayerData;
var export editinline GUICharacterListTeam cltMyTeam;
var export editinline GUICharacterListTeam cltPortrait;
var export editinline GUIButton butDraft;
var export editinline GUIButton butRelease;
var export editinline GUIButton butClear;
var export editinline GUIButton butEnter;
var export editinline GUIButton butAuto;
var export editinline GUIGFXButton butLeft;
var export editinline GUIGFXButton butRight;
var export editinline GUITitleBar MyTitleBar;
var export editinline GUITitleBar MyHintBar;
var string ButtonStyleEnabled;
var string ButtonStyleDisabled;
var localized string ClearConfirmMessage;
var localized string EnterConfirmMessage;
var localized string StatsMessage;
var bool bPlaySounds;

function Created()
{
    lblMatchData = GUILabel(Controls[1]);
    stbPlayerData = GUIScrollTextBox(Controls[2]);
    lboStats = GUIListBox(Controls[3]);
    cltMyTeam = GUICharacterListTeam(Controls[4]);
    cltPortrait = GUICharacterListTeam(Controls[6]);
    butDraft = GUIButton(Controls[7]);
    butRelease = GUIButton(Controls[8]);
    butClear = GUIButton(Controls[9]);
    butEnter = GUIButton(Controls[10]);
    butLeft = GUIGFXButton(Controls[11]);
    butRight = GUIGFXButton(Controls[12]);
    lblChoose = GUILabel(Controls[13]);
    lboTeamStats = GUIListBox(Controls[14]);
    MyTitleBar = GUITitleBar(Controls[15]);
    MyHintBar = GUITitleBar(Controls[16]);
    butAuto = GUIButton(Controls[17]);
    __OnKeyEvent__Delegate = MyKeyEvent;
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x10
    if(key == 27)
    {
        return true;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    MyController.RegisterStyle(class'STY_RosterButton');
    super(GUIPage).InitComponent(MyController, myOwner);
    cltPortrait.InitListInclusive("SP");
    cltPortrait.Find("Gorge");
    cltPortrait.__OnChange__Delegate = CharListChange;
    CharListUpdate(cltPortrait);
    ReloadPortraits();
    butEnter.bVisible = false;
    butEnter.bAcceptsInput = false;
    butDraft.__OnClick__Delegate = ButtonClick;
    butRelease.__OnClick__Delegate = ButtonClick;
    butClear.__OnClick__Delegate = ButtonClick;
    butEnter.__OnClick__Delegate = ButtonClick;
    butLeft.__OnClick__Delegate = ButtonClick;
    butRight.__OnClick__Delegate = ButtonClick;
    butAuto.__OnClick__Delegate = ButtonClick;
    lboStats.List.bAcceptsInput = false;
    lboTeamStats.List.bAcceptsInput = false;
    cltMyTeam.__OnChange__Delegate = CharListChange;
    cltMyTeam.Index = -1;
}

function ReloadPortraits()
{
    local GameProfile GP;
    local array<PlayerRecord> PlayerRecords;
    local int i;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0xab
    if(GP != none)
    {
        i = 0;
        J0x36:
        // End:0x88 [While If]
        if(i < GP.PlayerTeam.Length)
        {
            PlayerRecords[i] = class'wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x36;
        }
        cltMyTeam.ResetList(PlayerRecords, GP.PlayerTeam.Length);
    }
}

function CharListUpdate(GUIComponent Sender)
{
    local export editinline GUICharacterList GCL;
    local PlayerRecord pR;
    local string str;

    GCL = cltPortrait;
    pR = GCL.GetRecord();
    // End:0x49
    if(bPlaySounds)
    {
        PlayerOwner().ClientPlaySound(GCL.GetSound(),,, 6);
    }
    str = Mid(pR.TextName, Max(InStr(pR.TextName, ".") + 1, 0));
    stbPlayerData.SetContent(Controller.LoadDecoText("xPlayers", str));
    BuildStats(pR, lboStats, lboTeamStats);
    UpdateDraftable(true);
}

function CharListChange(GUIComponent Sender)
{
    OnChange(Sender);
    // End:0x70
    if(Sender == cltMyTeam)
    {
        // End:0x47
        if(cltMyTeam.GetName() == "")
        {
            cltMyTeam.Index = -1;
        }
        // End:0x70
        else
        {
            cltPortrait.Find(cltMyTeam.GetName());
            CharListUpdate(Sender);
        }
    }
}

function bool IsOnTeam(string botname)
{
    local int i;
    local GameProfile GP;

    // End:0x0e
    if(botname == "")
    {
        return false;
    }
    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x83
    if(GP != none)
    {
        i = 0;
        J0x44:
        // End:0x83 [While If]
        if(i < GP.7)
        {
            // End:0x79
            if(GP.PlayerTeam[i] ~= botname)
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x44;
        }
    }
    return false;
}

function bool IsTeamFull()
{
    local GameProfile GP;
    local int i;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x45
    if(GP.PlayerTeam.Length < GP.7)
    {
        return false;
    }
    i = 0;
    J0x4c:
    // End:0x88 [While If]
    if(i < GP.7)
    {
        // End:0x7e
        if(GP.PlayerTeam[i] == "")
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    return true;
}

function UpdateDraftable(bool bAffordable)
{
    local bool bOnTeam, bCanDraft;

    bCanDraft = bAffordable && !IsTeamFull();
    bOnTeam = IsOnTeam(cltPortrait.GetName());
    butDraft.bAcceptsInput = !bOnTeam && bCanDraft;
    butRelease.bAcceptsInput = bOnTeam;
    butDraft.bVisible = butDraft.bAcceptsInput;
    butRelease.bVisible = butRelease.bAcceptsInput;
}

function BuildStats(out PlayerRecord pR, GUIListBox charbox, GUIListBox teambox)
{
    local string str;
    local GameProfile GP;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    charbox.List.Clear();
    str = pR.DefaultName;
    charbox.List.Add(str);
    str = class'wUtil'.static.GetFavoriteWeaponFor(pR);
    charbox.List.Add(str);
    str = class'wUtil'.default.AccuracyString @ string(class'wUtil'.static.AccuracyRating(pR));
    charbox.List.Add(str);
    str = class'wUtil'.default.AggressivenessString @ string(class'wUtil'.static.AggressivenessRating(pR));
    charbox.List.Add(str);
    str = class'wUtil'.default.AgilityString @ string(class'wUtil'.static.AgilityRating(pR));
    charbox.List.Add(str);
    str = class'wUtil'.default.TacticsString @ string(class'wUtil'.static.TacticsRating(pR));
    charbox.List.Add(str);
    teambox.List.Clear();
    str = GP.TeamName @ StatsMessage;
    teambox.List.Add(str);
    str = class'wUtil'.default.AccuracyString @ string(class'wUtil'.static.TeamAccuracyRating(GP));
    teambox.List.Add(str);
    str = class'wUtil'.default.AggressivenessString @ string(class'wUtil'.static.TeamAggressivenessRating(GP));
    teambox.List.Add(str);
    str = class'wUtil'.default.AgilityString @ string(class'wUtil'.static.TeamAgilityRating(GP));
    teambox.List.Add(str);
    str = class'wUtil'.default.TacticsString @ string(class'wUtil'.static.TeamTacticsRating(GP));
    teambox.List.Add(str);
}

function AutoFillTeam()
{
    local int nextDraft;
    local bool oldbPlaySounds;
    local GameProfile GP;
    local int listsize, i, listoffset;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0x31
    if(GP == none)
    {
        return;
    }
    oldbPlaySounds = bPlaySounds;
    listsize = cltPortrait.PlayerList.Length;
    nextDraft = 0;
    J0x5a:
    // End:0x143 [While If]
    if(nextDraft < 7)
    {
        // End:0x84
        if(GP.PlayerTeam[nextDraft] != "")
        {
        }
        // End:0x139
        else
        {
            listoffset = cltPortrait.Index + Rand(listsize - 1);
            listoffset = int(float(listoffset) % float(listsize));
            i = 0;
            J0xc3:
            // End:0xeb [While If]
            if(i < listoffset)
            {
                cltPortrait.ScrollRight();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xc3;
            }
            J0xeb:
            // End:0x115 [While If]
            if(IsOnTeam(cltPortrait.GetName()))
            {
                cltPortrait.ScrollRight();
                // This is an implied JumpToken; Continue!
                goto J0xeb;
            }
            GP.PlayerTeam[nextDraft] = cltPortrait.GetName();
        }
        ++ nextDraft;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    bPlaySounds = oldbPlaySounds;
}

function bool ButtonClick(GUIComponent Sender)
{
    local GameProfile GP;
    local export editinline GUIQuestionPage Page;
    local bool oldbPlaySounds;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    oldbPlaySounds = bPlaySounds;
    // End:0x69
    if(Sender == butDraft)
    {
        bPlaySounds = false;
        GP.AddTeammate(cltPortrait.GetName());
    }
    // End:0x21a
    else
    {
        // End:0xb5
        if(Sender == butRelease)
        {
            bPlaySounds = false;
            GP.ReleaseTeammate(cltPortrait.GetName());
            cltMyTeam.Index = -1;
        }
        // End:0x21a
        else
        {
            // End:0x13c
            if(Sender == butClear)
            {
                // End:0x137
                if(Controller.OpenMenu("XInterface.GUIQuestionPage"))
                {
                    Page = GUIQuestionPage(Controller.ActivePage);
                    Page.SetupQuestion(ClearConfirmMessage, 48, 32);
                    Page.__OnButtonClick__Delegate = ClearConfirm;
                }
                return true;
            }
            // End:0x21a
            else
            {
                // End:0x1c3
                if(Sender == butEnter)
                {
                    // End:0x1be
                    if(Controller.OpenMenu("XInterface.GUIQuestionPage"))
                    {
                        Page = GUIQuestionPage(Controller.ActivePage);
                        Page.SetupQuestion(EnterConfirmMessage, 48, 32);
                        Page.__OnButtonClick__Delegate = EnterConfirm;
                    }
                    return true;
                }
                // End:0x21a
                else
                {
                    // End:0x1e4
                    if(Sender == butLeft)
                    {
                        cltPortrait.ScrollLeft();
                    }
                    // End:0x21a
                    else
                    {
                        // End:0x205
                        if(Sender == butRight)
                        {
                            cltPortrait.ScrollRight();
                        }
                        // End:0x21a
                        else
                        {
                            // End:0x21a
                            if(Sender == butAuto)
                            {
                                AutoFillTeam();
                            }
                        }
                    }
                }
            }
        }
    }
    FinishButtonClick();
    bPlaySounds = oldbPlaySounds;
    return true;
}

event ChangeHint(string NewHint)
{
    MyHintBar.SetCaption(NewHint);
}

function FinishButtonClick()
{
    butEnter.bVisible = IsTeamFull();
    butEnter.bAcceptsInput = IsTeamFull();
    ReloadPortraits();
    CharListUpdate(cltPortrait);
}

function ClearConfirm(byte bButton)
{
    // End:0x3c
    if(bButton == 16)
    {
        PlayerOwner().Level.Game.CurrentGameProfile.ClearTeammates();
        FinishButtonClick();
    }
}

function EnterConfirm(byte bButton)
{
    // End:0x63
    if(bButton == 16)
    {
        PlayerOwner().Level.Game.SavePackage(PlayerOwner().Level.Game.CurrentGameProfile.PackageName);
        Controller.CloseMenu();
    }
}

defaultproperties
{
    ButtonStyleEnabled="RoundButton"
    ButtonStyleDisabled="NoBackground"
    ClearConfirmMessage="About to delete the current roster. Proceed?"
    EnterConfirmMessage="Are you ready for the tournament?"
    StatsMessage="Stats"
    bPlaySounds=true
    Controls=// Object reference not set to an instance of an object.
    
    bAcceptsInput=true
}