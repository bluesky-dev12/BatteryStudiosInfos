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
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x10
    if(int(key) == 27)
    {
        return true;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    MyController.RegisterStyle(Class'XInterface_Decompressed.STY_RosterButton');
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
    //return;    
}

function ReloadPortraits()
{
    local GameProfile GP;
    local array<PlayerRecord> PlayerRecords;
    local int i;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    // End:0xAB
    if(GP != none)
    {
        i = 0;
        J0x36:

        // End:0x88 [Loop If]
        if(i < GP.PlayerTeam.Length)
        {
            PlayerRecords[i] = Class'WGame.wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
            i++;
            // [Loop Continue]
            goto J0x36;
        }
        cltMyTeam.ResetList(PlayerRecords, GP.PlayerTeam.Length);
    }
    //return;    
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
    //return;    
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
        else
        {
            cltPortrait.Find(cltMyTeam.GetName());
            CharListUpdate(Sender);
        }
    }
    //return;    
}

function bool IsOnTeam(string botname)
{
    local int i;
    local GameProfile GP;

    // End:0x0E
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

        // End:0x83 [Loop If]
        if(i < GP.7)
        {
            // End:0x79
            if(GP.PlayerTeam[i] ~= botname)
            {
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x44;
        }
    }
    return false;
    //return;    
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
    J0x4C:

    // End:0x88 [Loop If]
    if(i < GP.7)
    {
        // End:0x7E
        if(GP.PlayerTeam[i] == "")
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
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
    //return;    
}

function BuildStats(out PlayerRecord pR, GUIListBox charbox, GUIListBox teambox)
{
    local string str;
    local GameProfile GP;

    GP = PlayerOwner().Level.Game.CurrentGameProfile;
    charbox.List.Clear();
    str = pR.DefaultName;
    charbox.List.Add(str);
    str = Class'WGame.wUtil'.static.GetFavoriteWeaponFor(pR);
    charbox.List.Add(str);
    str = Class'WGame.wUtil'.default.AccuracyString @ string(Class'WGame.wUtil'.static.AccuracyRating(pR));
    charbox.List.Add(str);
    str = Class'WGame.wUtil'.default.AggressivenessString @ string(Class'WGame.wUtil'.static.AggressivenessRating(pR));
    charbox.List.Add(str);
    str = Class'WGame.wUtil'.default.AgilityString @ string(Class'WGame.wUtil'.static.AgilityRating(pR));
    charbox.List.Add(str);
    str = Class'WGame.wUtil'.default.TacticsString @ string(Class'WGame.wUtil'.static.TacticsRating(pR));
    charbox.List.Add(str);
    teambox.List.Clear();
    str = GP.TeamName @ StatsMessage;
    teambox.List.Add(str);
    str = Class'WGame.wUtil'.default.AccuracyString @ string(Class'WGame.wUtil'.static.TeamAccuracyRating(GP));
    teambox.List.Add(str);
    str = Class'WGame.wUtil'.default.AggressivenessString @ string(Class'WGame.wUtil'.static.TeamAggressivenessRating(GP));
    teambox.List.Add(str);
    str = Class'WGame.wUtil'.default.AgilityString @ string(Class'WGame.wUtil'.static.TeamAgilityRating(GP));
    teambox.List.Add(str);
    str = Class'WGame.wUtil'.default.TacticsString @ string(Class'WGame.wUtil'.static.TeamTacticsRating(GP));
    teambox.List.Add(str);
    //return;    
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
    J0x5A:

    // End:0x143 [Loop If]
    if(nextDraft < 7)
    {
        // End:0x84
        if(GP.PlayerTeam[nextDraft] != "")
        {
            // [Explicit Continue]
            goto J0x139;
        }
        listoffset = cltPortrait.Index + Rand(listsize - 1);
        listoffset = int(float(listoffset) % float(listsize));
        i = 0;
        J0xC3:

        // End:0xEB [Loop If]
        if(i < listoffset)
        {
            cltPortrait.ScrollRight();
            i++;
            // [Loop Continue]
            goto J0xC3;
        }
        J0xEB:

        // End:0x115 [Loop If]
        if(IsOnTeam(cltPortrait.GetName()))
        {
            cltPortrait.ScrollRight();
            // [Loop Continue]
            goto J0xEB;
        }
        GP.PlayerTeam[nextDraft] = cltPortrait.GetName();
        J0x139:

        nextDraft++;
        // [Loop Continue]
        goto J0x5A;
    }
    bPlaySounds = oldbPlaySounds;
    //return;    
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
    else
    {
        // End:0xB5
        if(Sender == butRelease)
        {
            bPlaySounds = false;
            GP.ReleaseTeammate(cltPortrait.GetName());
            cltMyTeam.Index = -1;            
        }
        else
        {
            // End:0x13C
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
            else
            {
                // End:0x1C3
                if(Sender == butEnter)
                {
                    // End:0x1BE
                    if(Controller.OpenMenu("XInterface.GUIQuestionPage"))
                    {
                        Page = GUIQuestionPage(Controller.ActivePage);
                        Page.SetupQuestion(EnterConfirmMessage, 48, 32);
                        Page.__OnButtonClick__Delegate = EnterConfirm;
                    }
                    return true;                    
                }
                else
                {
                    // End:0x1E4
                    if(Sender == butLeft)
                    {
                        cltPortrait.ScrollLeft();                        
                    }
                    else
                    {
                        // End:0x205
                        if(Sender == butRight)
                        {
                            cltPortrait.ScrollRight();                            
                        }
                        else
                        {
                            // End:0x21A
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
    //return;    
}

event ChangeHint(string NewHint)
{
    MyHintBar.SetCaption(NewHint);
    //return;    
}

function FinishButtonClick()
{
    butEnter.bVisible = IsTeamFull();
    butEnter.bAcceptsInput = IsTeamFull();
    ReloadPortraits();
    CharListUpdate(cltPortrait);
    //return;    
}

function ClearConfirm(byte bButton)
{
    // End:0x3C
    if(int(bButton) == 16)
    {
        PlayerOwner().Level.Game.CurrentGameProfile.ClearTeammates();
        FinishButtonClick();
    }
    //return;    
}

function EnterConfirm(byte bButton)
{
    // End:0x63
    if(int(bButton) == 16)
    {
        PlayerOwner().Level.Game.SavePackage(PlayerOwner().Level.Game.CurrentGameProfile.PackageName);
        Controller.CloseMenu();
    }
    //return;    
}

defaultproperties
{
    ButtonStyleEnabled="RoundButton"
    ButtonStyleDisabled="NoBackground"
    ClearConfirmMessage="About to delete the current roster. Proceed?"
    EnterConfirmMessage="Are you ready for the tournament?"
    StatsMessage="Stats"
    bPlaySounds=true
    // Reference: GUIImage'XInterface_Decompressed.UT2DraftTeam.SPDTRosterBK0'
    begin object name="SPDTRosterBK0" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1308330
        WinLeft=0.5868750
        WinWidth=0.3776170
        WinHeight=0.5984380
    end object
    Controls[0]=SPDTRosterBK0
    // Reference: GUILabel'XInterface_Decompressed.UT2DraftTeam.SPDTMatchData'
    begin object name="SPDTMatchData" class=XInterface_Decompressed.GUILabel
        Caption="No game profile => No match data"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2LargeFont"
        WinTop=-0.1200000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    Controls[1]=SPDTMatchData
    // Reference: GUIScrollTextBox'XInterface_Decompressed.UT2DraftTeam.SPDTCharData'
    begin object name="SPDTCharData" class=XInterface_Decompressed.GUIScrollTextBox
        CharDelay=0.0400000
        EOLDelay=0.2500000
        OnCreateComponent=SPDTCharData.InternalOnCreateComponent
        Hint="Teammate profile."
        WinTop=0.1291670
        WinLeft=0.0240630
        WinWidth=0.5200000
        WinHeight=0.3596870
        bNeverFocus=true
    end object
    Controls[2]=SPDTCharData
    // Reference: GUIListBox'XInterface_Decompressed.UT2DraftTeam.SPDTCharStats'
    begin object name="SPDTCharStats" class=XInterface_Decompressed.GUIListBox
        OnCreateComponent=SPDTCharStats.InternalOnCreateComponent
        WinTop=0.4912490
        WinLeft=0.0240630
        WinWidth=0.5200000
        WinHeight=0.2378130
        bAcceptsInput=false
        bNeverFocus=true
    end object
    Controls[3]=SPDTCharStats
    // Reference: GUICharacterListTeam'XInterface_Decompressed.UT2DraftTeam.SPDTRosterCharList'
    begin object name="SPDTRosterCharList" class=XInterface_Decompressed.GUICharacterListTeam
        bLocked=true
        bFillBounds=true
        bAllowSelectEmpty=false
        FixedItemsPerPage=7
        StyleName="CharButton"
        Hint="Choose teammates for the next match."
        WinTop=0.7500000
        WinLeft=0.0046880
        WinWidth=0.6703150
        WinHeight=0.1700000
        OnClick=SPDTRosterCharList.InternalOnClick
        OnRightClick=SPDTRosterCharList.InternalOnRightClick
        OnMousePressed=SPDTRosterCharList.InternalOnMousePressed
        OnMouseRelease=SPDTRosterCharList.InternalOnMouseRelease
        OnKeyEvent=SPDTRosterCharList.InternalOnKeyEvent
        OnBeginDrag=SPDTRosterCharList.InternalOnBeginDrag
        OnEndDrag=SPDTRosterCharList.InternalOnEndDrag
        OnDragDrop=SPDTRosterCharList.InternalOnDragDrop
        OnDragEnter=SPDTRosterCharList.InternalOnDragEnter
        OnDragLeave=SPDTRosterCharList.InternalOnDragLeave
        OnDragOver=SPDTRosterCharList.InternalOnDragOver
    end object
    Controls[4]=SPDTRosterCharList
    // Reference: GUIImage'XInterface_Decompressed.UT2DraftTeam.SPDTCharListBox'
    begin object name="SPDTCharListBox" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.7416670
        WinLeft=0.0078130
        WinWidth=0.6398460
        WinHeight=0.1856250
    end object
    Controls[5]=SPDTCharListBox
    // Reference: GUICharacterListTeam'XInterface_Decompressed.UT2DraftTeam.SPDTPortrait'
    begin object name="SPDTPortrait" class=XInterface_Decompressed.GUICharacterListTeam
        bFillBounds=true
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="Choose Teammates"
        WinTop=0.1903130
        WinLeft=0.6875000
        WinWidth=0.1333000
        WinHeight=0.4000000
        OnClick=SPDTPortrait.InternalOnClick
        OnRightClick=SPDTPortrait.InternalOnRightClick
        OnMousePressed=SPDTPortrait.InternalOnMousePressed
        OnMouseRelease=SPDTPortrait.InternalOnMouseRelease
        OnKeyEvent=SPDTPortrait.InternalOnKeyEvent
        OnBeginDrag=SPDTPortrait.InternalOnBeginDrag
        OnEndDrag=SPDTPortrait.InternalOnEndDrag
        OnDragDrop=SPDTPortrait.InternalOnDragDrop
        OnDragEnter=SPDTPortrait.InternalOnDragEnter
        OnDragLeave=SPDTPortrait.InternalOnDragLeave
        OnDragOver=SPDTPortrait.InternalOnDragOver
    end object
    Controls[6]=SPDTPortrait
    // Reference: GUIButton'XInterface_Decompressed.UT2DraftTeam.SPDTDraft'
    begin object name="SPDTDraft" class=XInterface_Decompressed.GUIButton
        Caption="Nominate"
        Hint="Add this character to the team."
        WinTop=0.6029170
        WinLeft=0.6206260
        WinWidth=0.1328120
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnKeyEvent=SPDTDraft.InternalOnKeyEvent
    end object
    Controls[7]=SPDTDraft
    // Reference: GUIButton'XInterface_Decompressed.UT2DraftTeam.SPDTRelease'
    begin object name="SPDTRelease" class=XInterface_Decompressed.GUIButton
        Caption="Remove"
        Hint="Remove this character from the team."
        WinTop=0.6029170
        WinLeft=0.8049980
        WinWidth=0.1328120
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnKeyEvent=SPDTRelease.InternalOnKeyEvent
    end object
    Controls[8]=SPDTRelease
    // Reference: GUIButton'XInterface_Decompressed.UT2DraftTeam.SPDTClear'
    begin object name="SPDTClear" class=XInterface_Decompressed.GUIButton
        Caption="Delete"
        StyleName="SquareMenuButton"
        Hint="Delete the team roster."
        WinTop=0.9300000
        WinWidth=0.1200000
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnKeyEvent=SPDTClear.InternalOnKeyEvent
    end object
    Controls[9]=SPDTClear
    // Reference: GUIButton'XInterface_Decompressed.UT2DraftTeam.SPDTEnter'
    begin object name="SPDTEnter" class=XInterface_Decompressed.GUIButton
        Caption="Play"
        StyleName="SquareMenuButton"
        Hint="Enter this team in the tournament."
        WinTop=0.9300000
        WinLeft=0.8800000
        WinWidth=0.1200000
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnKeyEvent=SPDTEnter.InternalOnKeyEvent
    end object
    Controls[10]=SPDTEnter
    // Reference: GUIGFXButton'XInterface_Decompressed.UT2DraftTeam.SPDTPicLeft'
    begin object name="SPDTPicLeft" class=XInterface_Decompressed.GUIGFXButton
        Position=2
        Hint="Choose your teammates."
        WinTop=0.3358330
        WinLeft=0.6015630
        WinWidth=0.0800000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnKeyEvent=SPDTPicLeft.InternalOnKeyEvent
    end object
    Controls[11]=SPDTPicLeft
    // Reference: GUIGFXButton'XInterface_Decompressed.UT2DraftTeam.SPDTPicRight'
    begin object name="SPDTPicRight" class=XInterface_Decompressed.GUIGFXButton
        Position=2
        Hint="Choose your teammates."
        WinTop=0.3358330
        WinLeft=0.8703120
        WinWidth=0.0800000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnKeyEvent=SPDTPicRight.InternalOnKeyEvent
    end object
    Controls[12]=SPDTPicRight
    // Reference: GUILabel'XInterface_Decompressed.UT2DraftTeam.SPDTLblChoose'
    begin object name="SPDTLblChoose" class=XInterface_Decompressed.GUILabel
        Caption="Select Teammates"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.1220840
        WinLeft=0.5924980
        WinWidth=0.3687500
        WinHeight=0.0796870
    end object
    Controls[13]=SPDTLblChoose
    // Reference: GUIListBox'XInterface_Decompressed.UT2DraftTeam.SPDTTeamStats'
    begin object name="SPDTTeamStats" class=XInterface_Decompressed.GUIListBox
        OnCreateComponent=SPDTTeamStats.InternalOnCreateComponent
        WinTop=0.7391660
        WinLeft=0.6540630
        WinWidth=0.3387500
        WinHeight=0.1890620
        bAcceptsInput=false
        bNeverFocus=true
    end object
    Controls[14]=SPDTTeamStats
    // Reference: GUITitleBar'XInterface_Decompressed.UT2DraftTeam.SPDTHeader'
    begin object name="SPDTHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Single Player | Nominate Team"
        StyleName="Header"
        WinTop=0.0364060
        WinHeight=46.0000000
    end object
    Controls[15]=SPDTHeader
    // Reference: GUITitleBar'XInterface_Decompressed.UT2DraftTeam.SPDTHints'
    begin object name="SPDTHints" class=XInterface_Decompressed.GUITitleBar
        bUseTextHeight=false
        StyleName="Footer"
        WinTop=0.9300000
        WinLeft=0.1200000
        WinWidth=0.7600000
        WinHeight=0.0550000
    end object
    Controls[16]=SPDTHints
    // Reference: GUIButton'XInterface_Decompressed.UT2DraftTeam.SPDTAuto'
    begin object name="SPDTAuto" class=XInterface_Decompressed.GUIButton
        Caption="Auto Reinforce"
        Hint="Automatically reinforce the team."
        WinTop=0.6666670
        WinLeft=0.6812450
        WinWidth=0.1875000
        WinHeight=0.0550000
        bFocusOnWatch=true
        OnKeyEvent=SPDTAuto.InternalOnKeyEvent
    end object
    Controls[17]=SPDTAuto
    bAcceptsInput=false
}