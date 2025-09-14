class UT2K4SPTab_Profile extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUISectionBackground sbProfiles;
var() automated GUISectionBackground sbDetailsBg;
var() automated GUISectionBackground sbFaceBorder;
var() automated GUISectionBackground sbSponsorBorder;
var() automated GUIImage imgFace;
var() automated GUIImage imgFaceBlur;
var() automated GUIImage imgSponsor;
var() automated GUIListBox lbProfiles;
var() automated GUIButton btnDelete;
var() automated GUIButton btnCreate;
var() automated GUIButton btnHighScores;
var() automated GUIScrollTextBox sbDetails;
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
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xB1
    if(bShow)
    {
        // End:0x2B
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
        else
        {
            btnPlayEnabled(false);
            btnDelete.DisableMe();
        }
        UpdateProfileDesc();
    }
    //return;    
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
    J0x6D:

    // End:0xB0 [Loop If]
    if(i < profilenames.Length)
    {
        lbProfiles.List.Add(getProfileName(profilenames[i]));
        i++;
        // [Loop Continue]
        goto J0x6D;
    }
    // End:0xE8
    if(GP != none)
    {
        lbProfiles.List.Find(getProfileName(GP.PackageName));
    }
    //return;    
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
    // End:0x8F
    if(SelectedProfile != "")
    {
        SelectedGP = PlayerOwner().Level.Game.LoadDataObject(ProfileClass, "GameProfile", SelectedProfile);
    }
    // End:0xF8
    if(SelectedGP == none)
    {
        imgFace.Image = none;
        imgFace.ImageColor.A = 196;
        imgFaceBlur.bVisible = true;
        imgSponsor.Image = none;
        sbDetails.SetContent(NoProfileSelected);        
    }
    else
    {
        // End:0x152
        if((GP != none) && SelectedGP.PackageName ~= GP.PackageName)
        {
            imgFaceBlur.bVisible = false;
            imgFace.ImageColor.A = byte(255);            
        }
        else
        {
            imgFaceBlur.bVisible = true;
            imgFace.ImageColor.A = 196;
        }
        pR = Class'WGame.wUtil'.static.FindPlayerRecord(SelectedGP.PlayerCharacter);
        imgFace.Image = pR.Portrait;
        imgSponsor.Image = Material(DynamicLoadObject(SelectedGP.TeamSymbolName, Class'Engine.Material'));
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
        J0x3A0:

        // End:0x401 [Loop If]
        if(i < 6)
        {
            // End:0x3F7
            if(SelectedGP.Spree[i] > 0)
            {
                tmp $= (("|" $ SpreeLabel[i]) @ string(SelectedGP.Spree[i]));
            }
            i++;
            // [Loop Continue]
            goto J0x3A0;
        }
        NewDetails = Repl(NewDetails, "%sprees%", tmp);
        tmp = "";
        i = 0;
        J0x42C:

        // End:0x48D [Loop If]
        if(i < 7)
        {
            // End:0x483
            if(SelectedGP.MultiKills[i] > 0)
            {
                tmp $= (("|" $ MultiKillsLabel[i]) @ string(SelectedGP.MultiKills[i]));
            }
            i++;
            // [Loop Continue]
            goto J0x42C;
        }
        NewDetails = Repl(NewDetails, "%multikills%", tmp);
        tmp = "";
        i = 0;
        J0x4BC:

        // End:0x52B [Loop If]
        if(i < 6)
        {
            // End:0x521
            if(SelectedGP.SpecialAwards[i] > 0)
            {
                tmp $= ((("|" $ SelectedGP.msgSpecialAward[i]) $ ":") @ string(SelectedGP.SpecialAwards[i]));
            }
            i++;
            // [Loop Continue]
            goto J0x4BC;
        }
        NewDetails = Repl(NewDetails, "%specialawards%", tmp);
        sbDetails.SetContent(NewDetails);
        // End:0x5AD
        if(SelectedGP.PlayerName == "42")
        {
            MainWindow.btnDebugExec.bVisible = true;
            MainWindow.edDebugExec.bVisible = true;
        }
    }
    Profile("UpdateProfileDesc");
    //return;    
}

function bool btnCreateOnClick(GUIComponent Sender)
{
    btnPlayEnabled(true);
    MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[1], MainWindow.PanelClass[1],, MainWindow.PanelHint[1], true);
    return true;
    //return;    
}

function bool btnDeleteOnClick(GUIComponent Sender)
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0xA1
    if(Controller.OpenMenu(Controller.QuestionMenuClass))
    {
        SelectedProfile = lbProfiles.List.Get();
        QPage = GUIQuestionPage(Controller.TopPage());
        QPage.SetupQuestion(QPage.Replace(DeleteProfile, "profile", SelectedProfile), 48, 32);
        QPage.__OnButtonClick__Delegate = OnConfirmDelete;
    }
    return true;
    //return;    
}

function OnConfirmDelete(byte bButton)
{
    local string SelectedProfile;

    // End:0x10F
    if(int(bButton) == 16)
    {
        SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
        // End:0x97
        if((GP != none) && GP.PackageName == SelectedProfile)
        {
            GP = none;
            PlayerOwner().Level.Game.CurrentGameProfile = none;
            MainWindow.UpdateTabs();
        }
        // End:0xE9
        if(!PlayerOwner().Level.Game.DeletePackage(SelectedProfile))
        {
            Log("Failed to delete profile " $ SelectedProfile, LogPrefix);
        }
        UpdateProfileList();
        btnPlayEnabled(lbProfiles.List.ItemCount != 0);
    }
    //return;    
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
    // End:0xBA
    if((selected != "") || (GP != none) && (MainWindow.ProfilePrefix $ selected) == GP.PackageName)
    {
        btnPlayEnabled(true);
        btnDelete.EnableMe();        
    }
    else
    {
        btnPlayEnabled(false);
        btnDelete.DisableMe();
    }
    UpdateProfileDesc();
    //return;    
}

function bool OnProfileDblClick(GUIComponent Sender)
{
    return onPlayClick();
    //return;    
}

function bool onPlayClick()
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0xBE
    if(GP != none)
    {
        SelectedProfile = lbProfiles.List.Get();
        // End:0x53
        if(GP.PackageName ~= (MainWindow.ProfilePrefix $ SelectedProfile))
        {
            return true;
        }
        // End:0xB9
        if(Controller.OpenMenu(Controller.QuestionMenuClass))
        {
            QPage = GUIQuestionPage(Controller.TopPage());
            QPage.SetupQuestion(OverloadProfile, 48, 32);
            QPage.__OnButtonClick__Delegate = OnConfirmLoad;
        }
        return true;        
    }
    else
    {
        OnConfirmLoad(16);
        return true;
    }
    //return;    
}

function OnConfirmLoad(byte bButton)
{
    local export editinline GUIQuestionPage QPage;
    local string SelectedProfile;

    // End:0x142
    if(int(bButton) == 16)
    {
        // End:0x46
        if(GP != none)
        {
            PlayerOwner().Level.Game.SavePackage(GP.PackageName);
        }
        SelectedProfile = MainWindow.ProfilePrefix $ lbProfiles.List.Get();
        GP = PlayerOwner().Level.Game.LoadDataObject(ProfileClass, "GameProfile", SelectedProfile);
        // End:0x13A
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
        else
        {
            OnFinalLoad(8);
        }
    }
    //return;    
}

function OnFinalLoad(byte bButton)
{
    local string SelectedProfile;

    // End:0x14F
    if((int(bButton) == 16) || int(bButton) == 8)
    {
        GP.LoadProfile(PlayerOwner());
        // End:0x14C
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
            // End:0x14C
            if(MainWindow.SetActiveTab != none)
            {
                MainWindow.c_Tabs.ActivateTab(MainWindow.SetActiveTab.MyButton, true);
            }
        }        
    }
    else
    {
        GP = none;
        PlayerOwner().Level.Game.CurrentGameProfile = none;
    }
    //return;    
}

function bool btnHighScoresOnClick(GUIComponent Sender)
{
    return Controller.OpenMenu(MainWindow.HighScorePage);
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPsbProfiles'
    begin object name="SPPsbProfiles" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.0465880
        WinLeft=0.0232430
        WinWidth=0.2708990
        WinHeight=0.8030500
        bBoundToParent=true
        OnPreDraw=SPPsbProfiles.InternalPreDraw
    end object
    sbProfiles=SPPsbProfiles
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPsbDetailsBg'
    begin object name="SPPsbDetailsBg" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.3689750
        WinLeft=0.6100000
        WinWidth=0.3700000
        WinHeight=0.4846680
        OnPreDraw=SPPsbDetailsBg.InternalPreDraw
    end object
    sbDetailsBg=SPPsbDetailsBg
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPimgFaceBorder'
    begin object name="SPPimgFaceBorder" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.0500000
        WinLeft=0.3100000
        WinWidth=0.2800000
        WinHeight=0.8000000
        bBoundToParent=true
        OnPreDraw=SPPimgFaceBorder.InternalPreDraw
    end object
    sbFaceBorder=SPPimgFaceBorder
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPimgSponsorBorder'
    begin object name="SPPimgSponsorBorder" class=XInterface.GUISectionBackground
        bAltCaption=true
        WinTop=0.0500000
        WinLeft=0.6100000
        WinWidth=0.3700000
        WinHeight=0.2929590
        bBoundToParent=true
        OnPreDraw=SPPimgSponsorBorder.InternalPreDraw
    end object
    sbSponsorBorder=SPPimgSponsorBorder
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPimgFace'
    begin object name="SPPimgFace" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=196)
        ImageStyle=2
        WinTop=0.1069770
        WinLeft=0.3240050
        WinWidth=0.2519900
        WinHeight=0.6860980
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgFace=SPPimgFace
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPimgFaceBlur'
    begin object name="SPPimgFaceBlur" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1069770
        WinLeft=0.3240050
        WinWidth=0.2519900
        WinHeight=0.6860980
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    imgFaceBlur=SPPimgFaceBlur
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPimgSponsor'
    begin object name="SPPimgSponsor" class=XInterface.GUIImage
        ImageStyle=4
        ImageRenderStyle=1
        ImageAlign=1
        WinTop=0.1084120
        WinLeft=0.6252550
        WinWidth=0.3382140
        WinHeight=0.2211990
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgSponsor=SPPimgSponsor
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPlbProfiles'
    begin object name="SPPlbProfiles" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=SPPlbProfiles.InternalOnCreateComponent
        FontScale=1
        Hint="????? ?????"
        WinTop=0.1259010
        WinLeft=0.0418320
        WinWidth=0.2368880
        WinHeight=0.6898710
        TabOrder=1
        bBoundToParent=true
        OnChange=UT2K4SPTab_Profile.onProfileChange
    end object
    lbProfiles=SPPlbProfiles
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPbtnDelete'
    begin object name="SPPbtnDelete" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ?????"
        WinTop=0.9000000
        WinLeft=0.1800000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=3
        bBoundToParent=true
        OnClick=UT2K4SPTab_Profile.btnDeleteOnClick
        OnKeyEvent=SPPbtnDelete.InternalOnKeyEvent
    end object
    btnDelete=SPPbtnDelete
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPbtnCreate'
    begin object name="SPPbtnCreate" class=XInterface.GUIButton
        Caption="?? ???"
        FontScale=0
        Hint="? ????? ????"
        WinTop=0.9000000
        WinLeft=0.4000000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=4
        bBoundToParent=true
        OnClick=UT2K4SPTab_Profile.btnCreateOnClick
        OnKeyEvent=SPPbtnCreate.InternalOnKeyEvent
    end object
    btnCreate=SPPbtnCreate
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPbtnHighScores'
    begin object name="SPPbtnHighScores" class=XInterface.GUIButton
        Caption="?? ???"
        FontScale=0
        Hint="?? ???? ???"
        WinTop=0.9000000
        WinLeft=0.6200000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=5
        bBoundToParent=true
        OnClick=UT2K4SPTab_Profile.btnHighScoresOnClick
        OnKeyEvent=SPPbtnHighScores.InternalOnKeyEvent
    end object
    btnHighScores=SPPbtnHighScores
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_Profile.SPPsbDetails'
    begin object name="SPPsbDetails" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        OnCreateComponent=SPPsbDetails.InternalOnCreateComponent
        WinTop=0.4391840
        WinLeft=0.6341330
        WinWidth=0.3254850
        WinHeight=0.3886220
        TabOrder=2
        bBoundToParent=true
    end object
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