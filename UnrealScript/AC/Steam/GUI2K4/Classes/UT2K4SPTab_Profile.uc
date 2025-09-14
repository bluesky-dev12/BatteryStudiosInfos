/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_Profile.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4SPTab_Profile extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbProfiles;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbDetailsBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbFaceBorder;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbSponsorBorder;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgFace;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgFaceBlur;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgSponsor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lbProfiles;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnDelete;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCreate;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnHighScores;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var int HackyIndex;
var localized string NoProfileSelected;
var localized string ProfileDetails;
var localized string DeleteProfile;
var localized string OverloadProfile;
var localized string CheatWarning;
var localized string SpreeLabel[6];
var localized string MultiKillsLabel[7];

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    HackyIndex = -1;
    lbProfiles.List.__OnDblClick__Delegate = OnProfileDblClick;
    bInit = true;
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xb1
    if(bShow)
    {
        // End:0x2b
        if(!Controller.bCurMenuInitialized)
        {
            return;
        }
        // End:0x42
        if(bInit)
        {
            bInit = false;
            UpdateProfileList();
        }
        MainWindow.btnPlay.Caption = CaptionLoad;
        // End:0x95
        if(lbProfiles.List.ItemCount != 0)
        {
            btnPlayEnabled(true);
            btnDelete.EnableMe();
        }
        // End:0xab
        else
        {
            btnPlayEnabled(false);
            btnDelete.DisableMe();
        }
        UpdateProfileDesc();
    }
}

function UpdateProfileList()
{
    local array<string> profilenames;
    local int i;

    Profile("GetProfileList");
    Controller.GetProfileList(MainWindow.ProfilePrefix, profilenames);
    Profile("GetProfileList");
    lbProfiles.List.Clear();
    i = 0;
    J0x6d:
    // End:0xb0 [While If]
    if(i < profilenames.Length)
    {
        lbProfiles.List.Add(getProfileName(profilenames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6d;
    }
    // End:0xe8
    if(GP != none)
    {
        lbProfiles.List.Find(getProfileName(GP.PackageName));
    }
}

function UpdateProfileDesc()
{
    local string SelectedProfile;
    local UT2K4GameProfile SelectedGP;
    local PlayerRecord pR;
    local string NewDetails, tmp;
    local int i;

    Profile("UpdateProfileDesc");
    SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
    // End:0x8f
    if(SelectedProfile != "")
    {
        SelectedGP = PlayerOwner().Level.Game.LoadDataObject(ProfileClass, "GameProfile", SelectedProfile);
    }
    // End:0xf8
    if(SelectedGP == none)
    {
        imgFace.Image = none;
        imgFace.ImageColor.A = 196;
        imgFaceBlur.bVisible = true;
        imgSponsor.Image = none;
        sbDetails.SetContent(NoProfileSelected);
    }
    // End:0x5ad
    else
    {
        // End:0x152
        if(GP != none && SelectedGP.PackageName ~= GP.PackageName)
        {
            imgFaceBlur.bVisible = false;
            imgFace.ImageColor.A = byte(255);
        }
        // End:0x179
        else
        {
            imgFaceBlur.bVisible = true;
            imgFace.ImageColor.A = 196;
        }
        pR = class'wUtil'.static.FindPlayerRecord(SelectedGP.PlayerCharacter);
        imgFace.Image = pR.Portrait;
        imgSponsor.Image = Material(DynamicLoadObject(SelectedGP.TeamSymbolName, class'Material'));
        NewDetails = Repl(ProfileDetails, "%teamname%", SelectedGP.TeamName);
        NewDetails = Repl(NewDetails, "%playername%", SelectedGP.PlayerName);
        NewDetails = Repl(NewDetails, "%teammembers%", JoinArray(SelectedGP.PlayerTeam, ", ", true));
        NewDetails = Repl(NewDetails, "%totaltime%", string(int(Round(SelectedGP.TotalTime / float(60)))));
        NewDetails = Repl(NewDetails, "%credits%", ProfileClass.static.MoneyToString(SelectedGP.Balance));
        NewDetails = Repl(NewDetails, "%matches%", string(SelectedGP.Matches));
        NewDetails = Repl(NewDetails, "%wins%", string(SelectedGP.Wins));
        NewDetails = Repl(NewDetails, "%kills%", string(SelectedGP.Kills));
        NewDetails = Repl(NewDetails, "%deaths%", string(SelectedGP.Deaths));
        NewDetails = Repl(NewDetails, "%Goals%", string(SelectedGP.Goals));
        tmp = "";
        i = 0;
        J0x3a0:
        // End:0x401 [While If]
        if(i < 6)
        {
            // End:0x3f7
            if(SelectedGP.Spree[i] > 0)
            {
                tmp $= "|" $ SpreeLabel[i] @ string(SelectedGP.Spree[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3a0;
        }
        NewDetails = Repl(NewDetails, "%sprees%", tmp);
        tmp = "";
        i = 0;
        J0x42c:
        // End:0x48d [While If]
        if(i < 7)
        {
            // End:0x483
            if(SelectedGP.MultiKills[i] > 0)
            {
                tmp $= "|" $ MultiKillsLabel[i] @ string(SelectedGP.MultiKills[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x42c;
        }
        NewDetails = Repl(NewDetails, "%multikills%", tmp);
        tmp = "";
        i = 0;
        J0x4bc:
        // End:0x52b [While If]
        if(i < 6)
        {
            // End:0x521
            if(SelectedGP.SpecialAwards[i] > 0)
            {
                tmp $= "|" $ SelectedGP.msgSpecialAward[i] $ ":" @ string(SelectedGP.SpecialAwards[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4bc;
        }
        NewDetails = Repl(NewDetails, "%specialawards%", tmp);
        sbDetails.SetContent(NewDetails);
        // End:0x5ad
        if(SelectedGP.PlayerName == "42")
        {
            MainWindow.btnDebugExec.bVisible = true;
            MainWindow.edDebugExec.bVisible = true;
        }
    }
    Profile("UpdateProfileDesc");
}

function bool btnCreateOnClick(GUIComponent Sender)
{
    btnPlayEnabled(true);
    MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[1], MainWindow.PanelClass[1],, MainWindow.PanelHint[1], true);
    return true;
}

function bool btnDeleteOnClick(GUIComponent Sender)
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0xa1
    if(Controller.OpenMenu(Controller.QuestionMenuClass))
    {
        SelectedProfile = lbProfiles.List.Get();
        QPage = GUIQuestionPage(Controller.TopPage());
        QPage.SetupQuestion(QPage.Replace(DeleteProfile, "profile", SelectedProfile), 48, 32);
        QPage.__OnButtonClick__Delegate = OnConfirmDelete;
    }
    return true;
}

function OnConfirmDelete(byte bButton)
{
    local string SelectedProfile;

    // End:0x10f
    if(bButton == 16)
    {
        SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
        // End:0x97
        if(GP != none && GP.PackageName == SelectedProfile)
        {
            GP = none;
            PlayerOwner().Level.Game.CurrentGameProfile = none;
            MainWindow.UpdateTabs();
        }
        // End:0xe9
        if(!PlayerOwner().Level.Game.DeletePackage(SelectedProfile))
        {
            Log("Failed to delete profile " $ SelectedProfile, LogPrefix);
        }
        UpdateProfileList();
        btnPlayEnabled(lbProfiles.List.ItemCount != 0);
    }
}

function onProfileChange(GUIComponent Sender)
{
    local string selected;

    // End:0x23
    if(HackyIndex == lbProfiles.List.Index)
    {
        return;
    }
    HackyIndex = lbProfiles.List.Index;
    selected = lbProfiles.List.Get();
    // End:0xba
    if(selected != "" || GP != none && MainWindow.ProfilePrefix $ selected == GP.PackageName)
    {
        btnPlayEnabled(true);
        btnDelete.EnableMe();
    }
    // End:0xd0
    else
    {
        btnPlayEnabled(false);
        btnDelete.DisableMe();
    }
    UpdateProfileDesc();
}

function bool OnProfileDblClick(GUIComponent Sender)
{
    return onPlayClick();
}

function bool onPlayClick()
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0xbe
    if(GP != none)
    {
        SelectedProfile = lbProfiles.List.Get();
        // End:0x53
        if(GP.PackageName ~= MainWindow.ProfilePrefix $ SelectedProfile)
        {
            return true;
        }
        // End:0xb9
        if(Controller.OpenMenu(Controller.QuestionMenuClass))
        {
            QPage = GUIQuestionPage(Controller.TopPage());
            QPage.SetupQuestion(OverloadProfile, 48, 32);
            QPage.__OnButtonClick__Delegate = OnConfirmLoad;
        }
        return true;
    }
    // End:0xc8
    else
    {
        OnConfirmLoad(16);
        return true;
    }
}

function OnConfirmLoad(byte bButton)
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0x142
    if(bButton == 16)
    {
        // End:0x46
        if(GP != none)
        {
            PlayerOwner().Level.Game.SavePackage(GP.PackageName);
        }
        SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
        GP = PlayerOwner().Level.Game.LoadDataObject(ProfileClass, "GameProfile", SelectedProfile);
        // End:0x13a
        if(GP.StoredPlayerID() != PlayerOwner().GetPlayerIDHash())
        {
            // End:0x137
            if(Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(CheatWarning, 48, 32);
                QPage.__OnButtonClick__Delegate = OnFinalLoad;
            }
        }
        // End:0x142
        else
        {
            OnFinalLoad(8);
        }
    }
}

function OnFinalLoad(byte bButton)
{
    local string SelectedProfile;

    // End:0x14f
    if(bButton == 16 || bButton == 8)
    {
        GP.LoadProfile(PlayerOwner());
        // End:0x14c
        if(GP != none)
        {
            SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
            PlayerOwner().Level.Game.CurrentGameProfile = GP;
            GP.Initialize(PlayerOwner().Level.Game, SelectedProfile);
            GP.bInLadderGame = true;
            GP.bIsChallenge = false;
            MainWindow.UpdateTabs(true);
            MainWindow.HandleGameProfile();
            GP.bInLadderGame = false;
            // End:0x14c
            if(MainWindow.SetActiveTab != none)
            {
                MainWindow.c_Tabs.ActivateTab(MainWindow.SetActiveTab.MyButton, true);
            }
        }
    }
    // End:0x176
    else
    {
        GP = none;
        PlayerOwner().Level.Game.CurrentGameProfile = none;
    }
}

function bool btnHighScoresOnClick(GUIComponent Sender)
{
    return Controller.OpenMenu(MainWindow.HighScorePage);
}

defaultproperties
{
    begin object name=SPPsbProfiles class=GUISectionBackground
        Caption="????"
        WinTop=0.0465880
        WinLeft=0.0232430
        WinWidth=0.2708990
        WinHeight=0.803050
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_Profile.SPPsbProfiles'
    sbProfiles=SPPsbProfiles
    begin object name=SPPsbDetailsBg class=GUISectionBackground
        Caption="????"
        WinTop=0.3689750
        WinLeft=0.610
        WinWidth=0.370
        WinHeight=0.4846680
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_Profile.SPPsbDetailsBg'
    sbDetailsBg=SPPsbDetailsBg
    begin object name=SPPimgFaceBorder class=AltSectionBackground
        WinTop=0.050
        WinLeft=0.310
        WinWidth=0.280
        WinHeight=0.80
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_Profile.SPPimgFaceBorder'
    sbFaceBorder=SPPimgFaceBorder
    begin object name=SPPimgSponsorBorder class=GUISectionBackground
        bAltCaption=true
        WinTop=0.050
        WinLeft=0.610
        WinWidth=0.370
        WinHeight=0.2929590
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_Profile.SPPimgSponsorBorder'
    sbSponsorBorder=SPPimgSponsorBorder
    begin object name=SPPimgFace class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=196)
        ImageStyle=2
        WinTop=0.1069770
        WinLeft=0.3240050
        WinWidth=0.251990
        WinHeight=0.6860980
        RenderWeight=0.30
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_Profile.SPPimgFace'
    imgFace=SPPimgFace
    begin object name=SPPimgFaceBlur class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1069770
        WinLeft=0.3240050
        WinWidth=0.251990
        WinHeight=0.6860980
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_Profile.SPPimgFaceBlur'
    imgFaceBlur=SPPimgFaceBlur
    begin object name=SPPimgSponsor class=GUIImage
        ImageStyle=4
        ImageRenderStyle=1
        ImageAlign=1
        WinTop=0.1084120
        WinLeft=0.6252550
        WinWidth=0.3382140
        WinHeight=0.2211990
        RenderWeight=0.30
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_Profile.SPPimgSponsor'
    imgSponsor=SPPimgSponsor
    begin object name=SPPlbProfiles class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        FontScale=1
        Hint="????? ?????"
        WinTop=0.1259010
        WinLeft=0.0418320
        WinWidth=0.2368880
        WinHeight=0.6898710
        TabOrder=1
        bBoundToParent=true
        OnChange=onProfileChange
    object end
    // Reference: GUIListBox'UT2K4SPTab_Profile.SPPlbProfiles'
    lbProfiles=SPPlbProfiles
    begin object name=SPPbtnDelete class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ?????"
        WinTop=0.90
        WinLeft=0.180
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=3
        bBoundToParent=true
        OnClick=btnDeleteOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_Profile.SPPbtnDelete'
    btnDelete=SPPbtnDelete
    begin object name=SPPbtnCreate class=GUIButton
        Caption="?? ???"
        FontScale=0
        Hint="? ????? ????"
        WinTop=0.90
        WinLeft=0.40
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=4
        bBoundToParent=true
        OnClick=btnCreateOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_Profile.SPPbtnCreate'
    btnCreate=SPPbtnCreate
    begin object name=SPPbtnHighScores class=GUIButton
        Caption="?? ???"
        FontScale=0
        Hint="?? ???? ???"
        WinTop=0.90
        WinLeft=0.620
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=5
        bBoundToParent=true
        OnClick=btnHighScoresOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_Profile.SPPbtnHighScores'
    btnHighScores=SPPbtnHighScores
    begin object name=SPPsbDetails class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4391840
        WinLeft=0.6341330
        WinWidth=0.3254850
        WinHeight=0.3886220
        TabOrder=2
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_Profile.SPPsbDetails'
    sbDetails=SPPsbDetails
    NoProfileSelected="??? ????? ????..."
    ProfileDetails="?: %teamname%|??: %playername%|???: %teammembers%||? ?? ??: %totaltime% ?|???: %credits%||?? ??: %matches%|??: %wins%|?? ??? ?? ?: %kills%|? ???? ?? ??: %deaths%|??: %Goals%|%sprees%|%multikills%|%specialawards%"
    DeleteProfile="'%profile%'? ????? ???? ???.||? ????? ?????????"
    OverloadProfile="?? ??? ????? ????.||? ????? ?????????"
    CheatWarning="??!|? ????? ??? ????? ??? ???? ????.|? ?????? ?? ????? ??? ? ????.|? ????? ?????????"
    SpreeLabel[0]="?? ???:"
    SpreeLabel[1]="????:"
    SpreeLabel[2]="?????:"
    SpreeLabel[3]="?????:"
    SpreeLabel[4]="????:"
    SpreeLabel[5]="??? ?:"
    MultiKillsLabel[0]="?? ?:"
    MultiKillsLabel[1]="?? ?:"
    MultiKillsLabel[2]="?? ?:"
    MultiKillsLabel[3]="??? ?:"
    MultiKillsLabel[4]="??? ?:"
    MultiKillsLabel[5]="????? ?:"
    MultiKillsLabel[6]="?? ?!:"
    PanelCaption="????"
}