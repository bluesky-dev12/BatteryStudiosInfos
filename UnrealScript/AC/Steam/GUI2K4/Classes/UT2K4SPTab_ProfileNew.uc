/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_ProfileNew.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:14
 *
 *******************************************************************************/
class UT2K4SPTab_ProfileNew extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbEditBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbPortraitBack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbSponsorBack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnPrevSkin;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnNextSkin;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnPrevSponsor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnNextSponsor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox edName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox edTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cbDifficulty;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICharacterListTeam clPlayerSkins;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImageList ilSponsor;
var localized string DefaultTeamName;
var string DefaultCharacter;
var string TeamSponsorPrefix;
var int DefaultDifficulty;
var int DefaultTeamSponsor;
var array<string> InitialFreeAgents;
var string GameIntroURL;
var localized string ErrorProfileExists;
var localized string ErrorCantCreateProfile;
var() localized string DifficultyLevels[8];

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(pMyController, myOwner);
    edName.MyEditBox.MaxWidth = 16;
    edName.MyEditBox.AllowedCharSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_";
    clPlayerSkins.InitListInclusive("SP");
    i = 0;
    J0x9d:
    // End:0xcd [While If]
    if(i < 8)
    {
        cbDifficulty.AddItem(DifficultyLevels[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9d;
    }
    LoadSponsorSymbols();
    ResetValues();
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x59
    if(bShow)
    {
        MainWindow.btnPlay.Caption = CaptionCreate;
        MainWindow.btnBack.Caption = CaptionCancel;
        btnPlayEnabled(true);
    }
    // End:0x93
    else
    {
        MainWindow.btnPlay.Caption = CaptionPlay;
        MainWindow.btnBack.Caption = CaptionBack;
    }
}

function bool onPlayClick()
{
    local array<string> ExistingProfiles;
    local string ProfileName;
    local int i;
    local export editinline GUIQuestionPage QPage;

    ProfileName = MainWindow.ProfilePrefix $ edName.GetText();
    Controller.GetProfileList(MainWindow.ProfilePrefix, ExistingProfiles);
    i = 0;
    J0x4e:
    // End:0x102 [While If]
    if(i < ExistingProfiles.Length)
    {
        // End:0xf8
        if(ExistingProfiles[i] ~= ProfileName)
        {
            // End:0xeb
            if(Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                QPage = GUIQuestionPage(Controller.ActivePage);
                QPage.SetupQuestion(QPage.Replace(ErrorProfileExists, "profile", edName.GetText()), 1, 1);
            }
            SetFocus(edName);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    GP = PlayerOwner().Level.Game.CreateDataObject(ProfileClass, "GameProfile", ProfileName);
    // End:0x4b4
    if(GP != none)
    {
        GP.CreateProfile(PlayerOwner());
        GP.PlayerName = edName.GetText();
        GP.TeamName = edTeam.GetText();
        GP.TeamSymbolName = string(ilSponsor.Image);
        GP.PlayerCharacter = clPlayerSkins.GetName();
        AddDefaultBots(GP);
        AddDefaultTeams(GP);
        GP.BaseDifficulty = float(cbDifficulty.GetIndex());
        GP.InjuryChance = GP.InjuryChance + GP.BaseDifficulty / float(30);
        GP.ChallengeChance = GP.ChallengeChance + GP.BaseDifficulty / float(30);
        GP.FeeIncrease = GP.FeeIncrease + GP.BaseDifficulty / float(300);
        GP.TeamPercentage = GP.TeamPercentage + GP.BaseDifficulty / float(30);
        GP.MatchBonus = GP.MatchBonus + GP.TeamPercentage / float(10);
        GP.InjuryTreatment = GP.InjuryTreatment + GP.BaseDifficulty / float(50);
        GP.MapChallengeCost = GP.MapChallengeCost + GP.BaseDifficulty / float(100);
        GP.AltPath = Rand(2147483647);
        PlayerOwner().Level.Game.CurrentGameProfile = GP;
        GP.Initialize(PlayerOwner().Level.Game, ProfileName);
        GP.SpecialEvent = "WELCOME";
        PlayerOwner().Level.Game.CurrentGameProfile.bInLadderGame = true;
        // End:0x461
        if(!PlayerOwner().Level.Game.SavePackage(ProfileName))
        {
            Warn("Couldn't save profile package");
        }
        PlayerOwner().ConsoleCommand("START" @ GameIntroURL $ ProfileName);
        // End:0x4a0
        if(MainWindow != none)
        {
            MainWindow.bAllowedAsLast = true;
        }
        Controller.CloseAll(false, true);
    }
    // End:0x57f
    else
    {
        Warn("Error creating profile");
        // End:0x51f
        if(Controller.OpenMenu(Controller.QuestionMenuClass))
        {
            QPage = GUIQuestionPage(Controller.ActivePage);
            QPage.SetupQuestion(ErrorCantCreateProfile, 1, 1);
        }
        MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[0], MainWindow.PanelClass[0],, MainWindow.PanelHint[0], true);
        MainWindow.UpdateTabs();
        return true;
    }
    return true;
}

function bool onBackClick()
{
    local array<string> profilenames;

    MainWindow.btnBack.Caption = CaptionBack;
    Controller.GetProfileList(MainWindow.ProfilePrefix, profilenames);
    // End:0x5d
    if(profilenames.Length == 0)
    {
        Controller.CloseMenu();
    }
    // End:0xac
    else
    {
        MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[0], MainWindow.PanelClass[0],, MainWindow.PanelHint[0], true);
    }
    return true;
}

function OnNameActivate()
{
    // End:0x34
    if(edName.GetText() == clPlayerSkins.GetName())
    {
        edName.SetText("");
    }
}

function OnTeamActivate()
{
    // End:0x2a
    if(edTeam.GetText() == DefaultTeamName)
    {
        edTeam.SetText("");
    }
}

function OnNameDeActivate()
{
    // End:0x3c
    if(edName.GetText() == "")
    {
        edName.SetText(Repl(clPlayerSkins.GetName(), ".", "_"));
    }
    // End:0x66
    if(edTeam.GetText() == "")
    {
        edTeam.SetText(DefaultTeamName);
    }
}

function onNameChange(GUIComponent Sender)
{
    btnPlayEnabled(edName.GetText() != "" && edTeam.GetText() != "");
}

function bool onSelectSkin(GUIComponent Sender)
{
    local string Prev;

    Prev = Repl(clPlayerSkins.GetName(), ".", "_");
    // End:0x3e
    if(Sender == btnPrevSkin)
    {
        clPlayerSkins.ScrollLeft();
    }
    // End:0x5c
    else
    {
        // End:0x5c
        if(Sender == btnNextSkin)
        {
            clPlayerSkins.ScrollRight();
        }
    }
    // End:0x9b
    if(edName.GetText() == Prev)
    {
        edName.SetText(Repl(clPlayerSkins.GetName(), ".", "_"));
    }
    return OnClick(Sender);
}

function bool onSelectSponsor(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevSponsor)
    {
        ilSponsor.PrevImage();
    }
    // End:0x3f
    else
    {
        // End:0x3f
        if(Sender == btnNextSponsor)
        {
            ilSponsor.NextImage();
        }
    }
    return OnClick(Sender);
}

function ResetValues()
{
    local int i;

    edTeam.SetText(DefaultTeamName);
    cbDifficulty.SetIndex(DefaultDifficulty);
    clPlayerSkins.Find(DefaultCharacter);
    edName.SetText(clPlayerSkins.GetName());
    i = 0;
    J0x61:
    // End:0xd1 [While If]
    if(i < ilSponsor.MatNames.Length)
    {
        // End:0xc7
        if(ilSponsor.MatNames[i] ~= "TeamSymbols_Battery.Design1")
        {
            ilSponsor.SetIndex(i);
        }
        // End:0xd1
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x61;
        }
    }
}

function AddDefaultBots(UT2K4GameProfile GP)
{
    local array<PlayerRecord> FreeAgents;
    local int i;

    GP.BotStats.Length = 0;
    class'wUtil'.static.GetPlayerList(FreeAgents);
    i = 0;
    J0x29:
    // End:0xda [While If]
    if(i < FreeAgents.Length)
    {
        // End:0xd0
        if(FreeAgents[i].Menu ~= "SP" && FreeAgents[i].Species == class'SPECIES_Egypt' || FreeAgents[i].Species == class'SPECIES_Merc')
        {
            // End:0xb0
            if(FreeAgents[i].DefaultName ~= GP.PlayerCharacter)
            {
            }
            // End:0xd0
            else
            {
                GP.GetBotPosition(FreeAgents[i].DefaultName, true);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29;
    }
    i = 0;
    J0xe1:
    // End:0x116 [While If]
    if(i < InitialFreeAgents.Length)
    {
        GP.GetBotPosition(InitialFreeAgents[i], true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
}

function AddDefaultTeams(UT2K4GameProfile GP)
{
    local class<UT2K4RosterGroup> RGclass;
    local int i;

    RGclass = class<UT2K4RosterGroup>(DynamicLoadObject("wGame.UT2K4TeamRosterPhantom", class'Class'));
    i = 0;
    J0x3b:
    // End:0x82 [While If]
    if(i < RGclass.default.Rosters.Length)
    {
        GP.GetTeamPosition(RGclass.default.Rosters[i], true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
}

function LoadSponsorSymbols()
{
    local int i;
    local Material M;
    local array<string> SymbolNames;

    Controller.GetTeamSymbolList(SymbolNames, true);
    i = 0;
    J0x1c:
    // End:0x76 [While If]
    if(i < SymbolNames.Length)
    {
        M = Material(DynamicLoadObject(SymbolNames[i], class'Material'));
        ilSponsor.AddMaterial(SymbolNames[i], M);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
}

defaultproperties
{
    begin object name=SPNimgEditBg class=GUISectionBackground
        Caption="????"
        WinTop=0.1014630
        WinLeft=0.5362630
        WinWidth=0.4251710
        WinHeight=0.770
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_ProfileNew.SPNimgEditBg'
    sbEditBg=SPNimgEditBg
    begin object name=SPNimgPortraitBack class=GUISectionBackground
        Caption="?????"
        WinTop=0.1014630
        WinLeft=0.0304280
        WinWidth=0.2341330
        WinHeight=0.770
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_ProfileNew.SPNimgPortraitBack'
    sbPortraitBack=SPNimgPortraitBack
    begin object name=SPNimgSponsorBack class=GUISectionBackground
        Caption="? ??"
        WinTop=0.1014630
        WinLeft=0.2738650
        WinWidth=0.2532650
        WinHeight=0.770
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_ProfileNew.SPNimgSponsorBack'
    sbSponsorBack=SPNimgSponsorBack
    begin object name=SPNbtnPrevSkin class=GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ?????"
        WinTop=0.7337220
        WinLeft=0.0608670
        WinWidth=0.048750
        WinHeight=0.080
        TabOrder=5
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=onSelectSkin
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_ProfileNew.SPNbtnPrevSkin'
    btnPrevSkin=SPNbtnPrevSkin
    begin object name=SPNbtnNextSkin class=GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ?????"
        WinTop=0.7337220
        WinLeft=0.1780540
        WinWidth=0.048750
        WinHeight=0.080
        TabOrder=6
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=onSelectSkin
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_ProfileNew.SPNbtnNextSkin'
    btnNextSkin=SPNbtnNextSkin
    begin object name=SPNbtnPrevSponsor class=GUIButton
        StyleName="ArrowLeft"
        Hint="??? ?? ??? ?????"
        WinTop=0.7337220
        WinLeft=0.3115050
        WinWidth=0.048750
        WinHeight=0.080
        TabOrder=8
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=onSelectSponsor
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_ProfileNew.SPNbtnPrevSponsor'
    btnPrevSponsor=SPNbtnPrevSponsor
    begin object name=SPNbtnNextSponsor class=GUIButton
        StyleName="ArrowRight"
        Hint="??? ?? ??? ?????"
        WinTop=0.7337220
        WinLeft=0.433380
        WinWidth=0.0550
        WinHeight=0.080
        TabOrder=9
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=onSelectSponsor
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_ProfileNew.SPNbtnNextSponsor'
    btnNextSponsor=SPNbtnNextSponsor
    begin object name=SPNmeName class=moEditBox
        bVerticalLayout=true
        Caption="???? ??: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ??? ?????"
        WinTop=0.2860870
        WinLeft=0.5722580
        WinWidth=0.3450
        WinHeight=0.12250
        TabOrder=1
        bBoundToParent=true
        OnActivate=OnNameActivate
        OnDeActivate=OnNameDeActivate
        OnChange=onNameChange
    object end
    // Reference: moEditBox'UT2K4SPTab_ProfileNew.SPNmeName'
    edName=SPNmeName
    begin object name=SPNmeTeam class=moEditBox
        bVerticalLayout=true
        Caption="? ??: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ??? ?????"
        WinTop=0.4280070
        WinLeft=0.5722580
        WinWidth=0.3450
        WinHeight=0.12250
        TabOrder=2
        bBoundToParent=true
        OnActivate=OnTeamActivate
        OnDeActivate=OnNameDeActivate
        OnChange=onNameChange
    object end
    // Reference: moEditBox'UT2K4SPTab_ProfileNew.SPNmeTeam'
    edTeam=SPNmeTeam
    begin object name=SPNmcDifficulty class=moComboBox
        bReadOnly=true
        bVerticalLayout=true
        Caption="???: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="???? ?????"
        WinTop=0.5688030
        WinLeft=0.5722580
        WinWidth=0.3450
        WinHeight=0.0683110
        TabOrder=3
        bBoundToParent=true
    object end
    // Reference: moComboBox'UT2K4SPTab_ProfileNew.SPNmcDifficulty'
    cbDifficulty=SPNmcDifficulty
    begin object name=SPNclPlayerSkins class=GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="??? ??? ??? ??? ???? ?? ? ? ????"
        WinTop=0.1919210
        WinLeft=0.0482070
        WinWidth=0.1995660
        WinHeight=0.50
        TabOrder=0
        bBoundToParent=true
        OnClick=InternalOnClick
        OnRightClick=InternalOnRightClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnKeyEvent=InternalOnKeyEvent
        OnBeginDrag=InternalOnBeginDrag
        OnEndDrag=InternalOnEndDrag
        OnDragDrop=InternalOnDragDrop
        OnDragEnter=InternalOnDragEnter
        OnDragLeave=InternalOnDragLeave
        OnDragOver=InternalOnDragOver
    object end
    // Reference: GUICharacterListTeam'UT2K4SPTab_ProfileNew.SPNclPlayerSkins'
    clPlayerSkins=SPNclPlayerSkins
    begin object name=SPNilSponsor class=GUIImageList
        bWrap=true
        ImageStyle=4
        ImageRenderStyle=1
        ImageAlign=1
        Hint="??? ??? ??? ? ???? ??? ? ????"
        WinTop=0.1892960
        WinLeft=0.3044010
        WinWidth=0.1855610
        WinHeight=0.5063780
        TabOrder=7
        bBoundToParent=true
    object end
    // Reference: GUIImageList'UT2K4SPTab_ProfileNew.SPNilSponsor'
    ilSponsor=SPNilSponsor
    DefaultTeamName="?"
    DefaultCharacter="Jakob"
    DefaultDifficulty=2
    DefaultTeamSponsor=1
    InitialFreeAgents=// Object reference not set to an instance of an object.
    
    GameIntroURL="MOV-UT2004-Intro?quickstart=true?TeamScreen=False?savegame="
    ErrorProfileExists="'%profile%'(?)?? ??? ????? ?? ?????!"
    ErrorCantCreateProfile="???? ??? ??"
    DifficultyLevels[0]="??"
    DifficultyLevels[1]="??"
    DifficultyLevels[2]="???"
    DifficultyLevels[3]="???"
    DifficultyLevels[4]="??"
    DifficultyLevels[5]="????"
    DifficultyLevels[6]="???"
    DifficultyLevels[7]="????"
    PanelCaption="? ????"
}