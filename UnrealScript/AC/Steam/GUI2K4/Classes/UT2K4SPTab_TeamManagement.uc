/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_TeamManagement.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:38
 *	Functions:21
 *
 *******************************************************************************/
class UT2K4SPTab_TeamManagement extends UT2K4SPTab_Base
    dependson(UT2K4SPTab_Qualification)
    dependson(UT2K4SPTab_LadderBase)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgTeamBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgSelectionBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgFreeAgentBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgOverviewBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgSelectionFaceBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgSelectionFace;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDescription;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICharacterListTeam clFreeAgents;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnHire;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnFire;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnLeft;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnRight;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnTreat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnTreatAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnAutoMake;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox edBalance;
var array<export editinline GUIImage> TeamFaces;
var array<export editinline GUIProgressBar> TeamHealth;
var localized string HealthHint;
var localized string NameTitle;
var localized string AggressionCaption;
var localized string AccuracyCaption;
var localized string AgilityCaption;
var localized string TacticsCaption;
var localized string FeeCaption;
var localized string HealthCaption;
var localized string msgFirstDraftYourTeam;
var bool bInitialDraft;
var Material EmptySlotImage;
var PlayerRecord ActivePR;
var int ActiveBotPos;
var int ActiveTreatmentCost;
var int TotalTreatmentCost;
var bool bHasFullTeam;
var bool NoTeamEditing;
var array<string> NewTeam;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    CreateTeamButtons(2, 3, 0.040);
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xac
    if(bShow)
    {
        UpdateTeamList();
        FillFreeAgentsList(clFreeAgents);
        // End:0x78
        if(bInitialDraft)
        {
            btnPlayEnabled(bHasFullTeam);
            MainWindow.btnPlay.Caption = CaptionDone;
            MainWindow.btnBack.Caption = CaptionCancel;
        }
        // End:0xac
        else
        {
            btnPlayEnabled(MainWindow.LastLadderPage != none);
            MainWindow.btnPlay.Caption = CaptionPlay;
        }
    }
}

function CreateTeamButtons(int Cols, int Rows, optional float topOffset)
{
    local int i, N;
    local export editinline GUIImage img, img2;
    local export editinline GUIButton btn;
    local export editinline GUIProgressBar pB;
    local float colWidth, rowHeight, CellWidth, cellHeight, spacingHeight, spacingWidth,
	    X, Y;

    rowHeight = sbgTeamBg.WinHeight / float(Rows) * 0.870;
    colWidth = sbgTeamBg.WinWidth / float(Cols);
    CellWidth = colWidth * 0.90;
    cellHeight = rowHeight * 0.80;
    X = FMin(CellWidth * 2.550, cellHeight);
    CellWidth = X / 2.550;
    cellHeight = X;
    spacingHeight = rowHeight - cellHeight / 2.0 + 0.0050;
    spacingWidth = colWidth - CellWidth / 2.0 - 0.0050;
    TeamFaces.Length = GP.GetMaxTeamSize();
    TeamHealth.Length = TeamFaces.Length;
    i = 0;
    J0x105:
    // End:0x6aa [While If]
    if(i < GP.GetMaxTeamSize())
    {
        X = float(i) % float(Cols) * colWidth + spacingWidth + sbgTeamBg.WinLeft / float(2);
        Y = float(i / Cols) * rowHeight + spacingHeight + topOffset + sbgTeamBg.WinTop;
        // End:0x211
        if(i / Cols + 1 == Rows && Rows * Cols > GP.GetMaxTeamSize())
        {
            N = Rows * Cols - GP.GetMaxTeamSize();
            X = X + colWidth * float(N) / 2.0;
        }
        img = new class'GUIImage';
        img.WinLeft = X - 0.001250;
        img.WinTop = Y - 0.0050;
        img.WinWidth = CellWidth + 0.00250;
        img.WinHeight = cellHeight + 0.0093750;
        img.Image = imgSelectionFaceBg.Image;
        img.ImageStyle = 2;
        img.bNeverFocus = true;
        img.bAcceptsInput = false;
        img.RenderWeight = 0.110;
        img.bBoundToParent = true;
        AppendComponent(img, true);
        img2 = new class'GUIImage';
        img2.WinLeft = X;
        img2.WinTop = Y;
        img2.WinWidth = CellWidth;
        img2.WinHeight = cellHeight;
        img2.Image = EmptySlotImage;
        img2.ImageStyle = 2;
        img2.bNeverFocus = true;
        img2.bAcceptsInput = false;
        img2.RenderWeight = 0.120;
        img2.ImageRenderStyle = 5;
        img2.ImageColor.A = byte(255);
        img2.bBoundToParent = true;
        TeamFaces[i] = img2;
        AppendComponent(img2, true);
        btn = new class'GUIButton';
        btn.WinLeft = X;
        btn.WinTop = Y;
        btn.WinWidth = CellWidth;
        btn.WinHeight = cellHeight;
        btn.RenderWeight = 0.30;
        btn.StyleName = "NoBackground";
        btn.Tag = i;
        btn.__OnClick__Delegate = onTeamOnClick;
        btn.TabOrder = Controls.Length + 1;
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnDragDrop__Delegate = TeamMemberOnDragDrop;
        btn.bBoundToParent = true;
        AppendComponent(btn, true);
        pB = new class'GUIProgressBar';
        pB.WinLeft = btn.WinLeft + btn.WinWidth;
        pB.WinTop = Y;
        pB.WinWidth = 0.0150;
        pB.WinHeight = cellHeight;
        pB.Low = 0.0;
        pB.High = 100.0;
        pB.Caption = "";
        pB.bShowLow = false;
        pB.bShowHigh = false;
        pB.bShowValue = false;
        pB.CaptionWidth = 0.0;
        pB.ValueRightWidth = 0.0;
        pB.RenderWeight = 0.20;
        pB.BarDirection = 3;
        pB.bBoundToParent = true;
        TeamHealth[i] = pB;
        AppendComponent(pB, false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x105;
    }
}

function UpdateTeamList()
{
    local int i, bp, j;
    local PlayerRecord pR;

    TotalTreatmentCost = 0;
    i = 0;
    J0x0e:
    // End:0x338 [While If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0x2c7
        if(GP.PlayerTeam[i] != "")
        {
            pR = class'wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
            TeamFaces[i].Image = pR.Portrait;
            bp = GP.GetBotPosition(pR.DefaultName, true);
            TotalTreatmentCost += int(Round(100.0 - float(GP.BotStats[bp].Health) * float(GP.BotStats[bp].Price) / float(100) * GP.InjuryTreatment));
            TeamHealth[i].Value = float(GP.BotStats[bp].Health);
            TeamHealth[i].BarColor.R = byte(float(255) * 1.0 - float(GP.BotStats[bp].Health) / 100.0);
            TeamHealth[i].BarColor.G = byte(float(255) * float(GP.BotStats[bp].Health) / 100.0);
            TeamHealth[i].BarColor.B = 0;
            TeamHealth[i].Hint = Repl(Repl(HealthHint, "%player%", GP.BotStats[bp].Name), "%health%", string(GP.BotStats[bp].Health));
            TeamFaces[i].ImageColor.A = byte(255);
            j = 0;
            J0x271:
            // End:0x2c4 [While If]
            if(j < NewTeam.Length)
            {
                // End:0x2ba
                if(NewTeam[j] ~= pR.DefaultName)
                {
                    TeamFaces[i].ImageColor.A = 127;
                }
                // End:0x2c4
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x271;
                }
            }
        }
        // End:0x32e
        else
        {
            TeamFaces[i].ImageColor.A = 127;
            TeamFaces[i].Image = EmptySlotImage;
            TeamHealth[i].Value = 0.0;
            TeamHealth[i].Hint = "";
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    edBalance.SetText(GP.MoneyToString(GP.Balance));
    // End:0x3ab
    if(TotalTreatmentCost < GP.Balance - GP.MinBalance && TotalTreatmentCost > 0)
    {
        btnTreatAll.EnableMe();
    }
    // End:0x3ba
    else
    {
        btnTreatAll.DisableMe();
    }
    // End:0x3eb
    if(TotalTreatmentCost > 0)
    {
        btnTreatAll.Hint = GP.MoneyToString(TotalTreatmentCost);
    }
    // End:0x3fc
    else
    {
        btnTreatAll.Hint = "";
    }
}

function bool onTeamOnClick(GUIComponent Sender)
{
    // End:0x88
    if(GP.PlayerTeam[Sender.Tag] != "")
    {
        btnHire.MenuStateChange(4);
        // End:0x4f
        if(!NoTeamEditing)
        {
            btnFire.EnableMe();
        }
        ActivePR = class'wUtil'.static.FindPlayerRecord(GP.PlayerTeam[Sender.Tag]);
        showPlayerDetails(true);
    }
    return true;
}

function onFreeAgentChange(GUIComponent Sender)
{
    local int i;

    ActivePR = GUICharacterListTeam(Sender).GetRecord();
    showPlayerDetails();
    // End:0x3a
    if(!NoTeamEditing)
    {
        btnFire.DisableMe();
    }
    // End:0x92
    if(GP.Balance - GP.MinBalance < GP.GetBotPrice(ActivePR.DefaultName))
    {
        // End:0x90
        if(!NoTeamEditing)
        {
            btnHire.DisableMe();
        }
        return;
    }
    i = 0;
    J0x99:
    // End:0xf4 [While If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xea
        if(GP.PlayerTeam[i] == "")
        {
            // End:0xe7
            if(!NoTeamEditing)
            {
                btnHire.EnableMe();
            }
        }
        // End:0xf4
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x99;
        }
    }
    return;
}

function bool onFreeAgentScroll(GUIComponent Sender)
{
    // End:0x28
    if(clFreeAgents.Index == -1)
    {
        clFreeAgents.Index = 0;
    }
    // End:0x49
    if(Sender == btnLeft)
    {
        clFreeAgents.PgUp();
    }
    // End:0x67
    else
    {
        // End:0x67
        if(Sender == btnRight)
        {
            clFreeAgents.PgDown();
        }
    }
    return true;
}

function showPlayerDetails(optional bool bIsTeamMate)
{
    local string PlayerDetails, tmp;

    // End:0x13
    if(ActivePR.DefaultName == "")
    {
        return;
    }
    imgSelectionFace.Image = ActivePR.Portrait;
    PlayerDetails = Controller.LoadDecoText("", ActivePR.TextName);
    tmp = Left(PlayerDetails, InStr(PlayerDetails, "|"));
    tmp = Mid(tmp, InStr(tmp, ":") + 1);
    J0x7e:
    // End:0x9f [While If]
    if(Left(tmp, 1) == " ")
    {
        tmp = Mid(tmp, 1);
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
    // End:0xd3
    if(tmp != "")
    {
        sbDescription.SetContent(Repl(PlayerDetails, tmp, ActivePR.DefaultName));
    }
    // End:0xec
    else
    {
        sbDescription.SetContent(ActivePR.DefaultName);
    }
    ActiveBotPos = GP.GetBotPosition(ActivePR.DefaultName, true);
    ActiveTreatmentCost = int(Round(100.0 - float(GP.BotStats[ActiveBotPos].Health) * float(GP.BotStats[ActiveBotPos].Price) / float(100) * GP.InjuryTreatment));
    // End:0x1b3
    if(ActiveTreatmentCost < GP.Balance - GP.MinBalance && ActiveTreatmentCost > 0)
    {
        btnTreat.EnableMe();
    }
    // End:0x1c2
    else
    {
        btnTreat.DisableMe();
    }
    PlayerDetails = FeeCaption @ GP.MoneyToString(GP.BotStats[ActiveBotPos].Price);
    // End:0x25c
    if(ActiveTreatmentCost > 0)
    {
        PlayerDetails $= "|" $ HealthCaption @ string(GP.BotStats[ActiveBotPos].Health) $ "%|     (" $ GP.MoneyToString(ActiveTreatmentCost) $ ")";
    }
    // End:0x268
    else
    {
        PlayerDetails $= "|";
    }
    PlayerDetails $= "|" $ AccuracyCaption @ string(class'wUtil'.static.AccuracyRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ AggressionCaption @ string(class'wUtil'.static.AggressivenessRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ AgilityCaption @ string(class'wUtil'.static.AgilityRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ TacticsCaption @ string(class'wUtil'.static.TacticsRating(ActivePR)) $ "%";
    PlayerDetails $= "|" $ class'wUtil'.static.GetFavoriteWeaponFor(ActivePR);
    sbDetails.SetContent(PlayerDetails);
}

function bool onHireClick(GUIComponent Sender)
{
    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x3d
    if(HireBot(ActivePR.DefaultName, true))
    {
        btnFire.EnableMe();
        btnHire.DisableMe();
    }
    return true;
}

function bool HireBot(string botname, optional bool bUpdateList)
{
    local int i;

    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x126
    if(GP.AddTeammate(botname))
    {
        i = 0;
        J0x29:
        // End:0x5b [While If]
        if(i < NewTeam.Length)
        {
            // End:0x51
            if(NewTeam[i] ~= botname)
            {
            }
            // End:0x5b
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x29;
            }
        }
        NewTeam[i] = botname;
        GP.Balance -= GP.GetBotPrice(botname);
        // End:0x10a
        if(bInitialDraft)
        {
            i = 0;
            J0xa0:
            // End:0xe1 [While If]
            if(i < GP.GetMaxTeamSize())
            {
                // End:0xd7
                if(GP.PlayerTeam[i] == "")
                {
                }
                // End:0xe1
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xa0;
                }
            }
            bHasFullTeam = i == GP.GetMaxTeamSize();
            btnPlayEnabled(bHasFullTeam);
        }
        // End:0x124
        if(bUpdateList)
        {
            UpdateTeamList();
            FillFreeAgentsList(clFreeAgents);
        }
        return true;
    }
    return false;
}

function bool onFireClick(GUIComponent Sender)
{
    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x8b
    if(FireBot(ActivePR.DefaultName, true))
    {
        btnFire.DisableMe();
        // End:0x7c
        if(GP.Balance - GP.MinBalance > GP.GetBotPrice(ActivePR.DefaultName))
        {
            btnHire.EnableMe();
        }
        // End:0x8b
        else
        {
            btnHire.DisableMe();
        }
    }
    return true;
}

function bool FireBot(string botname, optional bool bUpdateList)
{
    local int i;

    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x15a
    if(GP.ReleaseTeammate(botname))
    {
        i = 0;
        J0x29:
        // End:0x7f [While If]
        if(i < NewTeam.Length)
        {
            // End:0x75
            if(NewTeam[i] ~= botname)
            {
                GP.Balance += GP.GetBotPrice(botname);
            }
            // End:0x7f
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x29;
            }
        }
        i = GP.GetBotPosition(botname);
        // End:0xc4
        if(i > -1)
        {
            GP.BotStats[i].Health = 100;
        }
        // End:0x13e
        if(bInitialDraft)
        {
            i = 0;
            J0xd4:
            // End:0x115 [While If]
            if(i < GP.GetMaxTeamSize())
            {
                // End:0x10b
                if(GP.PlayerTeam[i] == "")
                {
                }
                // End:0x115
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xd4;
                }
            }
            bHasFullTeam = i == GP.GetMaxTeamSize();
            btnPlayEnabled(bHasFullTeam);
        }
        // End:0x158
        if(bUpdateList)
        {
            UpdateTeamList();
            FillFreeAgentsList(clFreeAgents);
        }
        return true;
    }
    return false;
}

function bool onPlayClick()
{
    // End:0x8c
    if(bInitialDraft)
    {
        MainWindow.tpQualification = UT2K4SPTab_Qualification(MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[3], MainWindow.PanelClass[3],, MainWindow.PanelHint[3], true));
        MainWindow.tpQualification.onPlayClick();
        return true;
    }
    // End:0xb9
    else
    {
        // End:0xb9
        if(MainWindow.LastLadderPage != none)
        {
            return MainWindow.LastLadderPage.onPlayClick();
        }
    }
    return false;
}

function FillFreeAgentsList(GUICharacterListTeam cL)
{
    local array<PlayerRecord> FreeAgents;
    local int i, pos;

    class'wUtil'.static.GetPlayerList(FreeAgents);
    i = FreeAgents.Length - 1;
    J0x20:
    // End:0xc7 [While If]
    if(i >= 0)
    {
        // End:0x5d
        if(FreeAgents[i].DefaultName ~= GP.PlayerCharacter)
        {
            FreeAgents.Remove(i, 1);
        }
        // End:0xbd
        else
        {
            pos = GP.GetBotPosition(FreeAgents[i].DefaultName);
            // End:0xb1
            if(pos != -1)
            {
                // End:0xb1
                if(GP.BotStats[pos].FreeAgent)
                {
                }
                // End:0xbd
                else
                {
                }
                FreeAgents.Remove(i, 1);
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    cL.InitList();
    cL.ResetList(FreeAgents, FreeAgents.Length);
}

function bool onTreatClick(GUIComponent Sender)
{
    GP.BotStats[ActiveBotPos].Health = 100;
    GP.Balance -= ActiveTreatmentCost;
    UpdateTeamList();
    btnTreat.DisableMe();
    return true;
}

function bool onTreatAllClick(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x46 [While If]
    if(i < GP.BotStats.Length)
    {
        GP.BotStats[i].Health = 100;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    GP.Balance -= TotalTreatmentCost;
    UpdateTeamList();
    btnTreat.DisableMe();
    return true;
}

function bool TeamMemberOnDragDrop(GUIComponent Target)
{
    local string tmp;

    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x38
    if(GUIButton(Controller.DropSource) != none && GUIButton(Target) != none)
    {
        return false;
    }
    // End:0x138
    if(GUIButton(Target) != none && GUICharacterListTeam(Controller.DropSource) != none)
    {
        // End:0xb4
        if(GP.Balance - GP.MinBalance < GP.GetBotPrice(GUICharacterListTeam(Controller.DropSource).GetName()))
        {
            return false;
        }
        FireBot(GP.PlayerTeam[Target.Tag], false);
        HireBot(GUICharacterListTeam(Controller.DropSource).GetName(), true);
        GUICharacterListTeam(Controller.DropSource).SetOutlineAlpha(255);
        Target.OnClick(Target);
        return true;
    }
    // End:0x1e3
    else
    {
        // End:0x1d1
        if(GUICharacterListTeam(Target) != none && GUIButton(Controller.DropSource) != none)
        {
            tmp = GP.PlayerTeam[Controller.DropSource.Tag];
            FireBot(tmp, true);
            GUICharacterListTeam(Target).Find(tmp);
            Target.OnChange(Target);
            return true;
        }
        // End:0x1e3
        else
        {
            // End:0x1e3
            if(GUICharacterList(Target) != none)
            {
                return true;
            }
        }
    }
    return false;
}

function bool FreeAgentOnBeginDrag(GUIComponent Sender)
{
    // End:0x0b
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x56
    if(GP.Balance - GP.MinBalance < GP.GetBotPrice(GUICharacterListTeam(Sender).GetName()))
    {
        return false;
    }
    // End:0x70
    else
    {
        return GUICharacterListTeam(Sender).InternalOnBeginDrag(Sender);
    }
}

function LockManagementTools()
{
    NoTeamEditing = true;
    btnFire.DisableMe();
    btnHire.DisableMe();
    btnAutoMake.DisableMe();
    clFreeAgents.DisableMe();
}

function bool onAutoMakeClick(GUIComponent Sender)
{
    local int i;
    local string botname;

    i = 0;
    J0x07:
    // End:0xbd [While If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xb3
        if(GP.PlayerTeam[i] == "")
        {
            botname = clFreeAgents.GetNameAt(int(float(i) % float(clFreeAgents.ItemCount)));
            // End:0xb0
            if(GP.Balance - GP.MinBalance > GP.GetBotPrice(botname))
            {
                HireBot(botname);
            }
            // End:0xb3
            else
            {
                // This is an implied JumpToken;
                goto J0xbd;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    J0xbd:
    UpdateTeamList();
    FillFreeAgentsList(clFreeAgents);
    return true;
}

function bool onBackClick()
{
    local int i;

    // End:0x1d
    if(!bInitialDraft)
    {
        Controller.CloseMenu();
    }
    // End:0x100
    else
    {
        i = GP.GetMaxTeamSize() - 1;
        J0x35:
        // End:0x7f [While If]
        if(i >= 0)
        {
            // End:0x75
            if(GP.PlayerTeam[i] != "")
            {
                FireBot(GP.PlayerTeam[i]);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x35;
        }
        MainWindow.btnBack.Caption = CaptionBack;
        MainWindow.tpQualification = UT2K4SPTab_Qualification(MainWindow.ReplaceTab(3, MainWindow.tpTeamManagement, true));
        MainWindow.c_Tabs.ActivateTab(MainWindow.tpQualification.MyButton, true);
    }
    return true;
}

defaultproperties
{
    begin object name=SPLsbgTeamBg class=AltSectionBackground
        Caption="?? ?"
        WinTop=0.0166670
        WinLeft=0.0061730
        WinWidth=0.318750
        WinHeight=0.968750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_TeamManagement.SPLsbgTeamBg'
    sbgTeamBg=SPLsbgTeamBg
    begin object name=SPLsbgSelectionBg class=GUISectionBackground
        Caption="??"
        WinTop=0.0166670
        WinLeft=0.56250
        WinWidth=0.4250
        WinHeight=0.66250
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_TeamManagement.SPLsbgSelectionBg'
    sbgSelectionBg=SPLsbgSelectionBg
    begin object name=SPLsbgFreeAgentBg class=GUISectionBackground
        Caption="?? ????"
        WinTop=0.70
        WinLeft=0.3348720
        WinWidth=0.6627550
        WinHeight=0.28750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_TeamManagement.SPLsbgFreeAgentBg'
    sbgFreeAgentBg=SPLsbgFreeAgentBg
    begin object name=SPLsbgOverviewBg class=AltSectionBackground
        WinTop=0.2083330
        WinLeft=0.3373720
        WinWidth=0.2126280
        WinHeight=0.468750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_TeamManagement.SPLsbgOverviewBg'
    sbgOverviewBg=SPLsbgOverviewBg
    begin object name=SPTMimgSelectionFaceBg class=GUIImage
        ImageStyle=2
        WinTop=0.0812840
        WinLeft=0.5890820
        WinWidth=0.0950
        WinHeight=0.30
        RenderWeight=0.110
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_TeamManagement.SPTMimgSelectionFaceBg'
    imgSelectionFaceBg=SPTMimgSelectionFaceBg
    begin object name=SPTMimgSelectionFace class=GUIImage
        ImageStyle=2
        WinTop=0.0881820
        WinLeft=0.5903320
        WinWidth=0.09250
        WinHeight=0.290
        RenderWeight=0.120
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_TeamManagement.SPTMimgSelectionFace'
    imgSelectionFace=SPTMimgSelectionFace
    begin object name=SPTMsbDescription class=GUIScrollTextBox
        CharDelay=0.00250
        EOLDelay=0.50
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.380130
        WinLeft=0.5852560
        WinWidth=0.3820410
        WinHeight=0.2747450
        RenderWeight=0.20
        TabOrder=4
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_TeamManagement.SPTMsbDescription'
    sbDescription=SPTMsbDescription
    begin object name=SPTMsbDetails class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0812840
        WinLeft=0.6890050
        WinWidth=0.2783160
        WinHeight=0.2808670
        RenderWeight=0.20
        TabOrder=3
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_TeamManagement.SPTMsbDetails'
    sbDetails=SPTMsbDetails
    begin object name=SPNclFreeAgents class=GUICharacterListTeam
        bMultiSelect=true
        StyleName="CharButton"
        WinTop=0.7627210
        WinLeft=0.3861220
        WinWidth=0.5615050
        WinHeight=0.204490
        RenderWeight=0.20
        TabOrder=4
        bBoundToParent=true
        bDropSource=true
        bDropTarget=true
        OnClick=InternalOnClick
        OnRightClick=InternalOnRightClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnChange=onFreeAgentChange
        OnKeyEvent=InternalOnKeyEvent
        OnBeginDrag=FreeAgentOnBeginDrag
        OnEndDrag=InternalOnEndDrag
        OnDragDrop=TeamMemberOnDragDrop
        OnDragEnter=InternalOnDragEnter
        OnDragLeave=InternalOnDragLeave
        OnDragOver=InternalOnDragOver
    object end
    // Reference: GUICharacterListTeam'UT2K4SPTab_TeamManagement.SPNclFreeAgents'
    clFreeAgents=SPNclFreeAgents
    begin object name=SPPbtnHire class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ?????"
        WinTop=0.0333330
        WinLeft=0.3411990
        WinWidth=0.206250
        WinHeight=0.050
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
        OnClick=onHireClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPPbtnHire'
    btnHire=SPPbtnHire
    begin object name=SPPbtnFire class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="? ??? ?????."
        WinTop=0.0916670
        WinLeft=0.3411990
        WinWidth=0.206250
        WinHeight=0.050
        RenderWeight=0.20
        TabOrder=2
        bBoundToParent=true
        OnClick=onFireClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPPbtnFire'
    btnFire=SPPbtnFire
    begin object name=SPNbtnLeft class=GUIButton
        StyleName="ArrowLeft"
        WinTop=0.8061540
        WinLeft=0.343750
        WinWidth=0.050
        WinHeight=0.090
        TabOrder=5
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=onFreeAgentScroll
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPNbtnLeft'
    btnLeft=SPNbtnLeft
    begin object name=SPNbtnRight class=GUIButton
        StyleName="ArrowRight"
        WinTop=0.8061540
        WinLeft=0.938750
        WinWidth=0.050
        WinHeight=0.090
        TabOrder=6
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=onFreeAgentScroll
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPNbtnRight'
    btnRight=SPNbtnRight
    begin object name=SPPbtnTreat class=GUIButton
        Caption="?? ??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ??? ?????"
        WinTop=0.5215360
        WinLeft=0.352550
        WinWidth=0.1848210
        WinHeight=0.050
        RenderWeight=0.20
        TabOrder=5
        bBoundToParent=true
        OnClick=onTreatClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPPbtnTreat'
    btnTreat=SPPbtnTreat
    begin object name=SPPbtnTreatAll class=GUIButton
        Caption="?? ??"
        FontScale=0
        Hint="?? ??? ??? ?????"
        WinTop=0.5703820
        WinLeft=0.352550
        WinWidth=0.1848210
        WinHeight=0.050
        RenderWeight=0.20
        TabOrder=6
        bBoundToParent=true
        OnClick=onTreatAllClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPPbtnTreatAll'
    btnTreatAll=SPPbtnTreatAll
    begin object name=SPPbtnAutoMake class=GUIButton
        Caption="??"
        FontScale=0
        Hint="??? ?? ???? ????"
        WinTop=0.150
        WinLeft=0.3411990
        WinWidth=0.206250
        WinHeight=0.050
        RenderWeight=0.20
        TabOrder=3
        bBoundToParent=true
        OnClick=onAutoMakeClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SPTab_TeamManagement.SPPbtnAutoMake'
    btnAutoMake=SPPbtnAutoMake
    begin object name=SPTMedBalance class=moEditBox
        bReadOnly=true
        bVerticalLayout=true
        Caption="???:"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.2712830
        WinLeft=0.3551020
        WinWidth=0.1796940
        WinHeight=0.0341560
        TabOrder=4
        bBoundToParent=true
    object end
    // Reference: moEditBox'UT2K4SPTab_TeamManagement.SPTMedBalance'
    edBalance=SPTMedBalance
    HealthHint="%player%? ??? %health%%???"
    NameTitle="??:"
    AggressionCaption="???:"
    AccuracyCaption="???:"
    AgilityCaption="???:"
    TacticsCaption="??:"
    FeeCaption="???:"
    HealthCaption="??:"
    msgFirstDraftYourTeam="?? ?? ??? ????."
    PanelCaption="? ??"
}