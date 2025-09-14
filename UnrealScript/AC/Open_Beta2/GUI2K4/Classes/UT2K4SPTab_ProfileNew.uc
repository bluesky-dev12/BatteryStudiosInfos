class UT2K4SPTab_ProfileNew extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUISectionBackground sbEditBg;
var() automated GUISectionBackground sbPortraitBack;
var() automated GUISectionBackground sbSponsorBack;
var() automated GUIButton btnPrevSkin;
var() automated GUIButton btnNextSkin;
var() automated GUIButton btnPrevSponsor;
var() automated GUIButton btnNextSponsor;
var() automated moEditBox edName;
var() automated moEditBox edTeam;
var() automated moComboBox cbDifficulty;
var() automated GUICharacterListTeam clPlayerSkins;
var() automated GUIImageList ilSponsor;
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
    J0x9D:

    // End:0xCD [Loop If]
    if(i < 8)
    {
        cbDifficulty.AddItem(DifficultyLevels[i]);
        i++;
        // [Loop Continue]
        goto J0x9D;
    }
    LoadSponsorSymbols();
    ResetValues();
    //return;    
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
    else
    {
        MainWindow.btnPlay.Caption = CaptionPlay;
        MainWindow.btnBack.Caption = CaptionBack;
    }
    //return;    
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
    J0x4E:

    // End:0x102 [Loop If]
    if(i < ExistingProfiles.Length)
    {
        // End:0xF8
        if(ExistingProfiles[i] ~= ProfileName)
        {
            // End:0xEB
            if(Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                QPage = GUIQuestionPage(Controller.ActivePage);
                QPage.SetupQuestion(QPage.Replace(ErrorProfileExists, "profile", edName.GetText()), 1, 1);
            }
            SetFocus(edName);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    GP = PlayerOwner().Level.Game.CreateDataObject(ProfileClass, "GameProfile", ProfileName);
    // End:0x4B4
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
        GP.InjuryChance = GP.InjuryChance + (GP.BaseDifficulty / float(30));
        GP.ChallengeChance = GP.ChallengeChance + (GP.BaseDifficulty / float(30));
        GP.FeeIncrease = GP.FeeIncrease + (GP.BaseDifficulty / float(300));
        GP.TeamPercentage = GP.TeamPercentage + (GP.BaseDifficulty / float(30));
        GP.MatchBonus = GP.MatchBonus + (GP.TeamPercentage / float(10));
        GP.InjuryTreatment = GP.InjuryTreatment + (GP.BaseDifficulty / float(50));
        GP.MapChallengeCost = GP.MapChallengeCost + (GP.BaseDifficulty / float(100));
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
        PlayerOwner().ConsoleCommand(("START" @ GameIntroURL) $ ProfileName);
        // End:0x4A0
        if(MainWindow != none)
        {
            MainWindow.bAllowedAsLast = true;
        }
        Controller.CloseAll(false, true);        
    }
    else
    {
        Warn("Error creating profile");
        // End:0x51F
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
    //return;    
}

function bool onBackClick()
{
    local array<string> profilenames;

    MainWindow.btnBack.Caption = CaptionBack;
    Controller.GetProfileList(MainWindow.ProfilePrefix, profilenames);
    // End:0x5D
    if(profilenames.Length == 0)
    {
        Controller.CloseMenu();        
    }
    else
    {
        MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[0], MainWindow.PanelClass[0],, MainWindow.PanelHint[0], true);
    }
    return true;
    //return;    
}

function OnNameActivate()
{
    // End:0x34
    if(edName.GetText() == clPlayerSkins.GetName())
    {
        edName.SetText("");
    }
    //return;    
}

function OnTeamActivate()
{
    // End:0x2A
    if(edTeam.GetText() == DefaultTeamName)
    {
        edTeam.SetText("");
    }
    //return;    
}

function OnNameDeActivate()
{
    // End:0x3C
    if(edName.GetText() == "")
    {
        edName.SetText(Repl(clPlayerSkins.GetName(), ".", "_"));
    }
    // End:0x66
    if(edTeam.GetText() == "")
    {
        edTeam.SetText(DefaultTeamName);
    }
    //return;    
}

function onNameChange(GUIComponent Sender)
{
    btnPlayEnabled((edName.GetText() != "") && edTeam.GetText() != "");
    //return;    
}

function bool onSelectSkin(GUIComponent Sender)
{
    local string Prev;

    Prev = Repl(clPlayerSkins.GetName(), ".", "_");
    // End:0x3E
    if(Sender == btnPrevSkin)
    {
        clPlayerSkins.ScrollLeft();        
    }
    else
    {
        // End:0x5C
        if(Sender == btnNextSkin)
        {
            clPlayerSkins.ScrollRight();
        }
    }
    // End:0x9B
    if(edName.GetText() == Prev)
    {
        edName.SetText(Repl(clPlayerSkins.GetName(), ".", "_"));
    }
    return OnClick(Sender);
    //return;    
}

function bool onSelectSponsor(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevSponsor)
    {
        ilSponsor.PrevImage();        
    }
    else
    {
        // End:0x3F
        if(Sender == btnNextSponsor)
        {
            ilSponsor.NextImage();
        }
    }
    return OnClick(Sender);
    //return;    
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

    // End:0xD1 [Loop If]
    if(i < ilSponsor.MatNames.Length)
    {
        // End:0xC7
        if(ilSponsor.MatNames[i] ~= "TeamSymbols_Battery.Design1")
        {
            ilSponsor.SetIndex(i);
            // [Explicit Break]
            goto J0xD1;
        }
        i++;
        // [Loop Continue]
        goto J0x61;
    }
    J0xD1:

    //return;    
}

function AddDefaultBots(UT2K4GameProfile GP)
{
    local array<PlayerRecord> FreeAgents;
    local int i;

    GP.BotStats.Length = 0;
    Class'WGame.wUtil'.static.GetPlayerList(FreeAgents);
    i = 0;
    J0x29:

    // End:0xDA [Loop If]
    if(i < FreeAgents.Length)
    {
        // End:0xD0
        if((FreeAgents[i].Menu ~= "SP") && (FreeAgents[i].Species == Class'WGame.SPECIES_Egypt') || FreeAgents[i].Species == Class'WGame.SPECIES_Merc')
        {
            // End:0xB0
            if(FreeAgents[i].DefaultName ~= GP.PlayerCharacter)
            {
                // [Explicit Continue]
                goto J0xD0;
            }
            GP.GetBotPosition(FreeAgents[i].DefaultName, true);
        }
        J0xD0:

        i++;
        // [Loop Continue]
        goto J0x29;
    }
    i = 0;
    J0xE1:

    // End:0x116 [Loop If]
    if(i < InitialFreeAgents.Length)
    {
        GP.GetBotPosition(InitialFreeAgents[i], true);
        i++;
        // [Loop Continue]
        goto J0xE1;
    }
    //return;    
}

function AddDefaultTeams(UT2K4GameProfile GP)
{
    local Class<UT2K4RosterGroup> RGclass;
    local int i;

    RGclass = Class<UT2K4RosterGroup>(DynamicLoadObject("wGame.UT2K4TeamRosterPhantom", Class'Core.Class'));
    i = 0;
    J0x3B:

    // End:0x82 [Loop If]
    if(i < RGclass.default.Rosters.Length)
    {
        GP.GetTeamPosition(RGclass.default.Rosters[i], true);
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    //return;    
}

function LoadSponsorSymbols()
{
    local int i;
    local Material M;
    local array<string> SymbolNames;

    Controller.GetTeamSymbolList(SymbolNames, true);
    i = 0;
    J0x1C:

    // End:0x76 [Loop If]
    if(i < SymbolNames.Length)
    {
        M = Material(DynamicLoadObject(SymbolNames[i], Class'Engine.Material'));
        ilSponsor.AddMaterial(SymbolNames[i], M);
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNimgEditBg'
    begin object name="SPNimgEditBg" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.1014630
        WinLeft=0.5362630
        WinWidth=0.4251710
        WinHeight=0.7700000
        bBoundToParent=true
        OnPreDraw=SPNimgEditBg.InternalPreDraw
    end object
    sbEditBg=SPNimgEditBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNimgPortraitBack'
    begin object name="SPNimgPortraitBack" class=XInterface.GUISectionBackground
        Caption="?????"
        WinTop=0.1014630
        WinLeft=0.0304280
        WinWidth=0.2341330
        WinHeight=0.7700000
        bBoundToParent=true
        OnPreDraw=SPNimgPortraitBack.InternalPreDraw
    end object
    sbPortraitBack=SPNimgPortraitBack
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNimgSponsorBack'
    begin object name="SPNimgSponsorBack" class=XInterface.GUISectionBackground
        Caption="? ??"
        WinTop=0.1014630
        WinLeft=0.2738650
        WinWidth=0.2532650
        WinHeight=0.7700000
        bBoundToParent=true
        OnPreDraw=SPNimgSponsorBack.InternalPreDraw
    end object
    sbSponsorBack=SPNimgSponsorBack
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNbtnPrevSkin'
    begin object name="SPNbtnPrevSkin" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ?????"
        WinTop=0.7337220
        WinLeft=0.0608670
        WinWidth=0.0487500
        WinHeight=0.0800000
        TabOrder=5
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4SPTab_ProfileNew.onSelectSkin
        OnKeyEvent=SPNbtnPrevSkin.InternalOnKeyEvent
    end object
    btnPrevSkin=SPNbtnPrevSkin
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNbtnNextSkin'
    begin object name="SPNbtnNextSkin" class=XInterface.GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ?????"
        WinTop=0.7337220
        WinLeft=0.1780540
        WinWidth=0.0487500
        WinHeight=0.0800000
        TabOrder=6
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4SPTab_ProfileNew.onSelectSkin
        OnKeyEvent=SPNbtnNextSkin.InternalOnKeyEvent
    end object
    btnNextSkin=SPNbtnNextSkin
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNbtnPrevSponsor'
    begin object name="SPNbtnPrevSponsor" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        Hint="??? ?? ??? ?????"
        WinTop=0.7337220
        WinLeft=0.3115050
        WinWidth=0.0487500
        WinHeight=0.0800000
        TabOrder=8
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4SPTab_ProfileNew.onSelectSponsor
        OnKeyEvent=SPNbtnPrevSponsor.InternalOnKeyEvent
    end object
    btnPrevSponsor=SPNbtnPrevSponsor
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNbtnNextSponsor'
    begin object name="SPNbtnNextSponsor" class=XInterface.GUIButton
        StyleName="ArrowRight"
        Hint="??? ?? ??? ?????"
        WinTop=0.7337220
        WinLeft=0.4333800
        WinWidth=0.0550000
        WinHeight=0.0800000
        TabOrder=9
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4SPTab_ProfileNew.onSelectSponsor
        OnKeyEvent=SPNbtnNextSponsor.InternalOnKeyEvent
    end object
    btnNextSponsor=SPNbtnNextSponsor
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNmeName'
    begin object name="SPNmeName" class=XInterface.moEditBox
        bVerticalLayout=true
        Caption="???? ??: "
        OnCreateComponent=SPNmeName.InternalOnCreateComponent
        Hint="???? ??? ?????"
        WinTop=0.2860870
        WinLeft=0.5722580
        WinWidth=0.3450000
        WinHeight=0.1225000
        TabOrder=1
        bBoundToParent=true
        OnActivate=UT2K4SPTab_ProfileNew.OnNameActivate
        OnDeActivate=UT2K4SPTab_ProfileNew.OnNameDeActivate
        OnChange=UT2K4SPTab_ProfileNew.onNameChange
    end object
    edName=SPNmeName
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNmeTeam'
    begin object name="SPNmeTeam" class=XInterface.moEditBox
        bVerticalLayout=true
        Caption="? ??: "
        OnCreateComponent=SPNmeTeam.InternalOnCreateComponent
        Hint="?? ??? ?????"
        WinTop=0.4280070
        WinLeft=0.5722580
        WinWidth=0.3450000
        WinHeight=0.1225000
        TabOrder=2
        bBoundToParent=true
        OnActivate=UT2K4SPTab_ProfileNew.OnTeamActivate
        OnDeActivate=UT2K4SPTab_ProfileNew.OnNameDeActivate
        OnChange=UT2K4SPTab_ProfileNew.onNameChange
    end object
    edTeam=SPNmeTeam
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNmcDifficulty'
    begin object name="SPNmcDifficulty" class=XInterface.moComboBox
        bReadOnly=true
        bVerticalLayout=true
        Caption="???: "
        OnCreateComponent=SPNmcDifficulty.InternalOnCreateComponent
        Hint="???? ?????"
        WinTop=0.5688030
        WinLeft=0.5722580
        WinWidth=0.3450000
        WinHeight=0.0683110
        TabOrder=3
        bBoundToParent=true
    end object
    cbDifficulty=SPNmcDifficulty
    // Reference: GUICharacterListTeam'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNclPlayerSkins'
    begin object name="SPNclPlayerSkins" class=XInterface.GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="??? ??? ??? ??? ???? ?? ? ? ????"
        WinTop=0.1919210
        WinLeft=0.0482070
        WinWidth=0.1995660
        WinHeight=0.5000000
        TabOrder=0
        bBoundToParent=true
        OnClick=SPNclPlayerSkins.InternalOnClick
        OnRightClick=SPNclPlayerSkins.InternalOnRightClick
        OnMousePressed=SPNclPlayerSkins.InternalOnMousePressed
        OnMouseRelease=SPNclPlayerSkins.InternalOnMouseRelease
        OnKeyEvent=SPNclPlayerSkins.InternalOnKeyEvent
        OnBeginDrag=SPNclPlayerSkins.InternalOnBeginDrag
        OnEndDrag=SPNclPlayerSkins.InternalOnEndDrag
        OnDragDrop=SPNclPlayerSkins.InternalOnDragDrop
        OnDragEnter=SPNclPlayerSkins.InternalOnDragEnter
        OnDragLeave=SPNclPlayerSkins.InternalOnDragLeave
        OnDragOver=SPNclPlayerSkins.InternalOnDragOver
    end object
    clPlayerSkins=SPNclPlayerSkins
    // Reference: GUIImageList'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew.SPNilSponsor'
    begin object name="SPNilSponsor" class=XInterface.GUIImageList
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
    end object
    ilSponsor=SPNilSponsor
    DefaultTeamName="?"
    DefaultCharacter="Jakob"
    DefaultDifficulty=2
    DefaultTeamSponsor=1
    InitialFreeAgents[0]="Hathor"
    InitialFreeAgents[1]="Huntress"
    InitialFreeAgents[2]="Sunspear"
    InitialFreeAgents[3]="Cipher"
    InitialFreeAgents[4]="Medusa"
    InitialFreeAgents[5]="Jackhammer"
    InitialFreeAgents[6]="Avarice"
    InitialFreeAgents[7]="Darkling"
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