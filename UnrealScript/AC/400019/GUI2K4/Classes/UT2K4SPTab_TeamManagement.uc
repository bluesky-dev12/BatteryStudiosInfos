class UT2K4SPTab_TeamManagement extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUISectionBackground sbgTeamBg;
var() automated GUISectionBackground sbgSelectionBg;
var() automated GUISectionBackground sbgFreeAgentBg;
var() automated GUISectionBackground sbgOverviewBg;
var() automated GUIImage imgSelectionFaceBg;
var() automated GUIImage imgSelectionFace;
var() automated GUIScrollTextBox sbDescription;
var() automated GUIScrollTextBox sbDetails;
var() automated GUICharacterListTeam clFreeAgents;
var() automated GUIButton btnHire;
var() automated GUIButton btnFire;
var() automated GUIButton btnLeft;
var() automated GUIButton btnRight;
var() automated GUIButton btnTreat;
var() automated GUIButton btnTreatAll;
var() automated GUIButton btnAutoMake;
var() automated GUILabel lblTeam;
var() automated moEditBox edBalance;
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
    CreateTeamButtons(2, 3, 0.0400000);
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xAC
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
        else
        {
            btnPlayEnabled(MainWindow.LastLadderPage != none);
            MainWindow.btnPlay.Caption = CaptionPlay;
        }
    }
    //return;    
}

function CreateTeamButtons(int Cols, int Rows, optional float topOffset)
{
    local int i, N;
    local export editinline GUIImage img, img2;
    local export editinline GUIButton btn;
    local export editinline GUIProgressBar pB;
    local float colWidth, rowHeight, CellWidth, cellHeight, spacingHeight, spacingWidth,
	    X, Y;

    rowHeight = (sbgTeamBg.WinHeight / float(Rows)) * 0.8700000;
    colWidth = sbgTeamBg.WinWidth / float(Cols);
    CellWidth = colWidth * 0.9000000;
    cellHeight = rowHeight * 0.8000000;
    X = FMin(CellWidth * 2.5500000, cellHeight);
    CellWidth = X / 2.5500000;
    cellHeight = X;
    spacingHeight = ((rowHeight - cellHeight) / 2.0000000) + 0.0050000;
    spacingWidth = ((colWidth - CellWidth) / 2.0000000) - 0.0050000;
    TeamFaces.Length = GP.GetMaxTeamSize();
    TeamHealth.Length = TeamFaces.Length;
    i = 0;
    J0x105:

    // End:0x6AA [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        X = (((float(i) % float(Cols)) * colWidth) + spacingWidth) + (sbgTeamBg.WinLeft / float(2));
        Y = (((float(i / Cols) * rowHeight) + spacingHeight) + topOffset) + sbgTeamBg.WinTop;
        // End:0x211
        if((((i / Cols) + 1) == Rows) && (Rows * Cols) > GP.GetMaxTeamSize())
        {
            N = (Rows * Cols) - GP.GetMaxTeamSize();
            X = X + ((colWidth * float(N)) / 2.0000000);
        }
        img = new Class'XInterface.GUIImage';
        img.WinLeft = X - 0.0012500;
        img.WinTop = Y - 0.0050000;
        img.WinWidth = CellWidth + 0.0025000;
        img.WinHeight = cellHeight + 0.0093750;
        img.Image = imgSelectionFaceBg.Image;
        img.ImageStyle = 2;
        img.bNeverFocus = true;
        img.bAcceptsInput = false;
        img.RenderWeight = 0.1100000;
        img.bBoundToParent = true;
        AppendComponent(img, true);
        img2 = new Class'XInterface.GUIImage';
        img2.WinLeft = X;
        img2.WinTop = Y;
        img2.WinWidth = CellWidth;
        img2.WinHeight = cellHeight;
        img2.Image = EmptySlotImage;
        img2.ImageStyle = 2;
        img2.bNeverFocus = true;
        img2.bAcceptsInput = false;
        img2.RenderWeight = 0.1200000;
        img2.ImageRenderStyle = 5;
        img2.ImageColor.A = byte(255);
        img2.bBoundToParent = true;
        TeamFaces[i] = img2;
        AppendComponent(img2, true);
        btn = new Class'XInterface.GUIButton';
        btn.WinLeft = X;
        btn.WinTop = Y;
        btn.WinWidth = CellWidth;
        btn.WinHeight = cellHeight;
        btn.RenderWeight = 0.3000000;
        btn.StyleName = "NoBackground";
        btn.Tag = i;
        btn.__OnClick__Delegate = onTeamOnClick;
        btn.TabOrder = Controls.Length + 1;
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnDragDrop__Delegate = TeamMemberOnDragDrop;
        btn.bBoundToParent = true;
        AppendComponent(btn, true);
        pB = new Class'XInterface.GUIProgressBar';
        pB.WinLeft = btn.WinLeft + btn.WinWidth;
        pB.WinTop = Y;
        pB.WinWidth = 0.0150000;
        pB.WinHeight = cellHeight;
        pB.Low = 0.0000000;
        pB.High = 100.0000000;
        pB.Caption = "";
        pB.bShowLow = false;
        pB.bShowHigh = false;
        pB.bShowValue = false;
        pB.CaptionWidth = 0.0000000;
        pB.ValueRightWidth = 0.0000000;
        pB.RenderWeight = 0.2000000;
        pB.BarDirection = 3;
        pB.bBoundToParent = true;
        TeamHealth[i] = pB;
        AppendComponent(pB, false);
        i++;
        // [Loop Continue]
        goto J0x105;
    }
    //return;    
}

function UpdateTeamList()
{
    local int i, bp, j;
    local PlayerRecord pR;

    TotalTreatmentCost = 0;
    i = 0;
    J0x0E:

    // End:0x338 [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0x2C7
        if(GP.PlayerTeam[i] != "")
        {
            pR = Class'WGame.wUtil'.static.FindPlayerRecord(GP.PlayerTeam[i]);
            TeamFaces[i].Image = pR.Portrait;
            bp = GP.GetBotPosition(pR.DefaultName, true);
            TotalTreatmentCost += int(Round((((100.0000000 - float(GP.BotStats[bp].Health)) * float(GP.BotStats[bp].Price)) / float(100)) * GP.InjuryTreatment));
            TeamHealth[i].Value = float(GP.BotStats[bp].Health);
            TeamHealth[i].BarColor.R = byte(float(255) * (1.0000000 - (float(GP.BotStats[bp].Health) / 100.0000000)));
            TeamHealth[i].BarColor.G = byte(float(255) * (float(GP.BotStats[bp].Health) / 100.0000000));
            TeamHealth[i].BarColor.B = 0;
            TeamHealth[i].Hint = Repl(Repl(HealthHint, "%player%", GP.BotStats[bp].Name), "%health%", string(GP.BotStats[bp].Health));
            TeamFaces[i].ImageColor.A = byte(255);
            j = 0;
            J0x271:

            // End:0x2C4 [Loop If]
            if(j < NewTeam.Length)
            {
                // End:0x2BA
                if(NewTeam[j] ~= pR.DefaultName)
                {
                    TeamFaces[i].ImageColor.A = 127;
                    // [Explicit Break]
                    goto J0x2C4;
                }
                j++;
                // [Loop Continue]
                goto J0x271;
            }
            J0x2C4:

            // [Explicit Continue]
            goto J0x32E;
        }
        TeamFaces[i].ImageColor.A = 127;
        TeamFaces[i].Image = EmptySlotImage;
        TeamHealth[i].Value = 0.0000000;
        TeamHealth[i].Hint = "";
        J0x32E:

        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    edBalance.SetText(GP.MoneyToString(GP.Balance));
    // End:0x3AB
    if((TotalTreatmentCost < (GP.Balance - GP.MinBalance)) && TotalTreatmentCost > 0)
    {
        btnTreatAll.EnableMe();        
    }
    else
    {
        btnTreatAll.DisableMe();
    }
    // End:0x3EB
    if(TotalTreatmentCost > 0)
    {
        btnTreatAll.Hint = GP.MoneyToString(TotalTreatmentCost);        
    }
    else
    {
        btnTreatAll.Hint = "";
    }
    //return;    
}

function bool onTeamOnClick(GUIComponent Sender)
{
    // End:0x88
    if(GP.PlayerTeam[Sender.Tag] != "")
    {
        btnHire.MenuStateChange(4);
        // End:0x4F
        if(!NoTeamEditing)
        {
            btnFire.EnableMe();
        }
        ActivePR = Class'WGame.wUtil'.static.FindPlayerRecord(GP.PlayerTeam[Sender.Tag]);
        showPlayerDetails(true);
    }
    return true;
    //return;    
}

function onFreeAgentChange(GUIComponent Sender)
{
    local int i;

    ActivePR = GUICharacterListTeam(Sender).GetRecord();
    showPlayerDetails();
    // End:0x3A
    if(!NoTeamEditing)
    {
        btnFire.DisableMe();
    }
    // End:0x92
    if((GP.Balance - GP.MinBalance) < GP.GetBotPrice(ActivePR.DefaultName))
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

    // End:0xF4 [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xEA
        if(GP.PlayerTeam[i] == "")
        {
            // End:0xE7
            if(!NoTeamEditing)
            {
                btnHire.EnableMe();
            }
            // [Explicit Break]
            goto J0xF4;
        }
        i++;
        // [Loop Continue]
        goto J0x99;
    }
    J0xF4:

    return;
    //return;    
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
    else
    {
        // End:0x67
        if(Sender == btnRight)
        {
            clFreeAgents.PgDown();
        }
    }
    return true;
    //return;    
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
    J0x7E:

    // End:0x9F [Loop If]
    if(Left(tmp, 1) == " ")
    {
        tmp = Mid(tmp, 1);
        // [Loop Continue]
        goto J0x7E;
    }
    // End:0xD3
    if(tmp != "")
    {
        sbDescription.SetContent(Repl(PlayerDetails, tmp, ActivePR.DefaultName));        
    }
    else
    {
        sbDescription.SetContent(ActivePR.DefaultName);
    }
    ActiveBotPos = GP.GetBotPosition(ActivePR.DefaultName, true);
    ActiveTreatmentCost = int(Round((((100.0000000 - float(GP.BotStats[ActiveBotPos].Health)) * float(GP.BotStats[ActiveBotPos].Price)) / float(100)) * GP.InjuryTreatment));
    // End:0x1B3
    if((ActiveTreatmentCost < (GP.Balance - GP.MinBalance)) && ActiveTreatmentCost > 0)
    {
        btnTreat.EnableMe();        
    }
    else
    {
        btnTreat.DisableMe();
    }
    PlayerDetails = FeeCaption @ GP.MoneyToString(GP.BotStats[ActiveBotPos].Price);
    // End:0x25C
    if(ActiveTreatmentCost > 0)
    {
        PlayerDetails $= ((((("|" $ HealthCaption) @ string(GP.BotStats[ActiveBotPos].Health)) $ "%|     (") $ GP.MoneyToString(ActiveTreatmentCost)) $ ")");        
    }
    else
    {
        PlayerDetails $= "|";
    }
    PlayerDetails $= ((("|" $ AccuracyCaption) @ string(Class'WGame.wUtil'.static.AccuracyRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ AggressionCaption) @ string(Class'WGame.wUtil'.static.AggressivenessRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ AgilityCaption) @ string(Class'WGame.wUtil'.static.AgilityRating(ActivePR))) $ "%");
    PlayerDetails $= ((("|" $ TacticsCaption) @ string(Class'WGame.wUtil'.static.TacticsRating(ActivePR))) $ "%");
    PlayerDetails $= ("|" $ Class'WGame.wUtil'.static.GetFavoriteWeaponFor(ActivePR));
    sbDetails.SetContent(PlayerDetails);
    //return;    
}

function bool onHireClick(GUIComponent Sender)
{
    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x3D
    if(HireBot(ActivePR.DefaultName, true))
    {
        btnFire.EnableMe();
        btnHire.DisableMe();
    }
    return true;
    //return;    
}

function bool HireBot(string botname, optional bool bUpdateList)
{
    local int i;

    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x126
    if(GP.AddTeammate(botname))
    {
        i = 0;
        J0x29:

        // End:0x5B [Loop If]
        if(i < NewTeam.Length)
        {
            // End:0x51
            if(NewTeam[i] ~= botname)
            {
                // [Explicit Break]
                goto J0x5B;
            }
            i++;
            // [Loop Continue]
            goto J0x29;
        }
        J0x5B:

        NewTeam[i] = botname;
        GP.Balance -= GP.GetBotPrice(botname);
        // End:0x10A
        if(bInitialDraft)
        {
            i = 0;
            J0xA0:

            // End:0xE1 [Loop If]
            if(i < GP.GetMaxTeamSize())
            {
                // End:0xD7
                if(GP.PlayerTeam[i] == "")
                {
                    // [Explicit Break]
                    goto J0xE1;
                }
                i++;
                // [Loop Continue]
                goto J0xA0;
            }
            J0xE1:

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
    //return;    
}

function bool onFireClick(GUIComponent Sender)
{
    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x8B
    if(FireBot(ActivePR.DefaultName, true))
    {
        btnFire.DisableMe();
        // End:0x7C
        if((GP.Balance - GP.MinBalance) > GP.GetBotPrice(ActivePR.DefaultName))
        {
            btnHire.EnableMe();            
        }
        else
        {
            btnHire.DisableMe();
        }
    }
    return true;
    //return;    
}

function bool FireBot(string botname, optional bool bUpdateList)
{
    local int i;

    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x15A
    if(GP.ReleaseTeammate(botname))
    {
        i = 0;
        J0x29:

        // End:0x7F [Loop If]
        if(i < NewTeam.Length)
        {
            // End:0x75
            if(NewTeam[i] ~= botname)
            {
                GP.Balance += GP.GetBotPrice(botname);
                // [Explicit Break]
                goto J0x7F;
            }
            i++;
            // [Loop Continue]
            goto J0x29;
        }
        J0x7F:

        i = GP.GetBotPosition(botname);
        // End:0xC4
        if(i > -1)
        {
            GP.BotStats[i].Health = 100;
        }
        // End:0x13E
        if(bInitialDraft)
        {
            i = 0;
            J0xD4:

            // End:0x115 [Loop If]
            if(i < GP.GetMaxTeamSize())
            {
                // End:0x10B
                if(GP.PlayerTeam[i] == "")
                {
                    // [Explicit Break]
                    goto J0x115;
                }
                i++;
                // [Loop Continue]
                goto J0xD4;
            }
            J0x115:

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
    //return;    
}

function bool onPlayClick()
{
    // End:0x8C
    if(bInitialDraft)
    {
        MainWindow.tpQualification = UT2K4SPTab_Qualification(MainWindow.c_Tabs.ReplaceTab(MyButton, MainWindow.PanelCaption[3], MainWindow.PanelClass[3],, MainWindow.PanelHint[3], true));
        MainWindow.tpQualification.onPlayClick();
        return true;        
    }
    else
    {
        // End:0xB9
        if(MainWindow.LastLadderPage != none)
        {
            return MainWindow.LastLadderPage.onPlayClick();
        }
    }
    return false;
    //return;    
}

function FillFreeAgentsList(GUICharacterListTeam cL)
{
    local array<PlayerRecord> FreeAgents;
    local int i, pos;

    Class'WGame.wUtil'.static.GetPlayerList(FreeAgents);
    i = FreeAgents.Length - 1;
    J0x20:

    // End:0xC7 [Loop If]
    if(i >= 0)
    {
        // End:0x5D
        if(FreeAgents[i].DefaultName ~= GP.PlayerCharacter)
        {
            FreeAgents.Remove(i, 1);
            // [Explicit Continue]
            goto J0xBD;
        }
        pos = GP.GetBotPosition(FreeAgents[i].DefaultName);
        // End:0xB1
        if(pos != -1)
        {
            // End:0xB1
            if(GP.BotStats[pos].FreeAgent)
            {
                // [Explicit Continue]
                goto J0xBD;
            }
        }
        FreeAgents.Remove(i, 1);
        J0xBD:

        i--;
        // [Loop Continue]
        goto J0x20;
    }
    cL.InitList();
    cL.ResetList(FreeAgents, FreeAgents.Length);
    //return;    
}

function bool onTreatClick(GUIComponent Sender)
{
    GP.BotStats[ActiveBotPos].Health = 100;
    GP.Balance -= ActiveTreatmentCost;
    UpdateTeamList();
    btnTreat.DisableMe();
    return true;
    //return;    
}

function bool onTreatAllClick(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < GP.BotStats.Length)
    {
        GP.BotStats[i].Health = 100;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    GP.Balance -= TotalTreatmentCost;
    UpdateTeamList();
    btnTreat.DisableMe();
    return true;
    //return;    
}

function bool TeamMemberOnDragDrop(GUIComponent Target)
{
    local string tmp;

    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x38
    if((GUIButton(Controller.DropSource) != none) && GUIButton(Target) != none)
    {
        return false;
    }
    // End:0x138
    if((GUIButton(Target) != none) && GUICharacterListTeam(Controller.DropSource) != none)
    {
        // End:0xB4
        if((GP.Balance - GP.MinBalance) < GP.GetBotPrice(GUICharacterListTeam(Controller.DropSource).GetName()))
        {
            return false;
        }
        FireBot(GP.PlayerTeam[Target.Tag], false);
        HireBot(GUICharacterListTeam(Controller.DropSource).GetName(), true);
        GUICharacterListTeam(Controller.DropSource).SetOutlineAlpha(255);
        Target.OnClick(Target);
        return true;        
    }
    else
    {
        // End:0x1D1
        if((GUICharacterListTeam(Target) != none) && GUIButton(Controller.DropSource) != none)
        {
            tmp = GP.PlayerTeam[Controller.DropSource.Tag];
            FireBot(tmp, true);
            GUICharacterListTeam(Target).Find(tmp);
            Target.OnChange(Target);
            return true;            
        }
        else
        {
            // End:0x1E3
            if(GUICharacterList(Target) != none)
            {
                return true;
            }
        }
    }
    return false;
    //return;    
}

function bool FreeAgentOnBeginDrag(GUIComponent Sender)
{
    // End:0x0B
    if(NoTeamEditing)
    {
        return false;
    }
    // End:0x56
    if((GP.Balance - GP.MinBalance) < GP.GetBotPrice(GUICharacterListTeam(Sender).GetName()))
    {
        return false;        
    }
    else
    {
        return GUICharacterListTeam(Sender).InternalOnBeginDrag(Sender);
    }
    //return;    
}

function LockManagementTools()
{
    NoTeamEditing = true;
    btnFire.DisableMe();
    btnHire.DisableMe();
    btnAutoMake.DisableMe();
    clFreeAgents.DisableMe();
    //return;    
}

function bool onAutoMakeClick(GUIComponent Sender)
{
    local int i;
    local string botname;

    i = 0;
    J0x07:

    // End:0xBD [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0xB3
        if(GP.PlayerTeam[i] == "")
        {
            botname = clFreeAgents.GetNameAt(int(float(i) % float(clFreeAgents.ItemCount)));
            // End:0xB0
            if((GP.Balance - GP.MinBalance) > GP.GetBotPrice(botname))
            {
                HireBot(botname);
                // [Explicit Continue]
                goto J0xB3;
            }
            // [Explicit Break]
            goto J0xBD;
        }
        J0xB3:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xBD:

    UpdateTeamList();
    FillFreeAgentsList(clFreeAgents);
    return true;
    //return;    
}

function bool onBackClick()
{
    local int i;

    // End:0x1D
    if(!bInitialDraft)
    {
        Controller.CloseMenu();        
    }
    else
    {
        i = GP.GetMaxTeamSize() - 1;
        J0x35:

        // End:0x7F [Loop If]
        if(i >= 0)
        {
            // End:0x75
            if(GP.PlayerTeam[i] != "")
            {
                FireBot(GP.PlayerTeam[i]);
            }
            i--;
            // [Loop Continue]
            goto J0x35;
        }
        MainWindow.btnBack.Caption = CaptionBack;
        MainWindow.tpQualification = UT2K4SPTab_Qualification(MainWindow.ReplaceTab(3, MainWindow.tpTeamManagement, true));
        MainWindow.c_Tabs.ActivateTab(MainWindow.tpQualification.MyButton, true);
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPLsbgTeamBg'
    begin object name="SPLsbgTeamBg" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="?? ?"
        WinTop=0.0166670
        WinLeft=0.0061730
        WinWidth=0.3187500
        WinHeight=0.9687500
        bBoundToParent=true
        OnPreDraw=SPLsbgTeamBg.InternalPreDraw
    end object
    sbgTeamBg=SPLsbgTeamBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPLsbgSelectionBg'
    begin object name="SPLsbgSelectionBg" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0166670
        WinLeft=0.5625000
        WinWidth=0.4250000
        WinHeight=0.6625000
        bBoundToParent=true
        OnPreDraw=SPLsbgSelectionBg.InternalPreDraw
    end object
    sbgSelectionBg=SPLsbgSelectionBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPLsbgFreeAgentBg'
    begin object name="SPLsbgFreeAgentBg" class=XInterface.GUISectionBackground
        Caption="?? ????"
        WinTop=0.7000000
        WinLeft=0.3348720
        WinWidth=0.6627550
        WinHeight=0.2875000
        bBoundToParent=true
        OnPreDraw=SPLsbgFreeAgentBg.InternalPreDraw
    end object
    sbgFreeAgentBg=SPLsbgFreeAgentBg
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPLsbgOverviewBg'
    begin object name="SPLsbgOverviewBg" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.2083330
        WinLeft=0.3373720
        WinWidth=0.2126280
        WinHeight=0.4687500
        bBoundToParent=true
        OnPreDraw=SPLsbgOverviewBg.InternalPreDraw
    end object
    sbgOverviewBg=SPLsbgOverviewBg
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPTMimgSelectionFaceBg'
    begin object name="SPTMimgSelectionFaceBg" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0812840
        WinLeft=0.5890820
        WinWidth=0.0950000
        WinHeight=0.3000000
        RenderWeight=0.1100000
        bBoundToParent=true
    end object
    imgSelectionFaceBg=SPTMimgSelectionFaceBg
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPTMimgSelectionFace'
    begin object name="SPTMimgSelectionFace" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0881820
        WinLeft=0.5903320
        WinWidth=0.0925000
        WinHeight=0.2900000
        RenderWeight=0.1200000
        bBoundToParent=true
    end object
    imgSelectionFace=SPTMimgSelectionFace
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPTMsbDescription'
    begin object name="SPTMsbDescription" class=XInterface.GUIScrollTextBox
        CharDelay=0.0025000
        EOLDelay=0.5000000
        bVisibleWhenEmpty=true
        OnCreateComponent=SPTMsbDescription.InternalOnCreateComponent
        WinTop=0.3801300
        WinLeft=0.5852560
        WinWidth=0.3820410
        WinHeight=0.2747450
        RenderWeight=0.2000000
        TabOrder=4
        bBoundToParent=true
    end object
    sbDescription=SPTMsbDescription
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPTMsbDetails'
    begin object name="SPTMsbDetails" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=SPTMsbDetails.InternalOnCreateComponent
        WinTop=0.0812840
        WinLeft=0.6890050
        WinWidth=0.2783160
        WinHeight=0.2808670
        RenderWeight=0.2000000
        TabOrder=3
        bBoundToParent=true
    end object
    sbDetails=SPTMsbDetails
    // Reference: GUICharacterListTeam'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPNclFreeAgents'
    begin object name="SPNclFreeAgents" class=XInterface.GUICharacterListTeam
        bMultiSelect=false
        StyleName="CharButton"
        WinTop=0.7627210
        WinLeft=0.3861220
        WinWidth=0.5615050
        WinHeight=0.2044900
        RenderWeight=0.2000000
        TabOrder=4
        bBoundToParent=true
        bDropSource=true
        bDropTarget=true
        OnClick=SPNclFreeAgents.InternalOnClick
        OnRightClick=SPNclFreeAgents.InternalOnRightClick
        OnMousePressed=SPNclFreeAgents.InternalOnMousePressed
        OnMouseRelease=SPNclFreeAgents.InternalOnMouseRelease
        OnChange=UT2K4SPTab_TeamManagement.onFreeAgentChange
        OnKeyEvent=SPNclFreeAgents.InternalOnKeyEvent
        OnBeginDrag=UT2K4SPTab_TeamManagement.FreeAgentOnBeginDrag
        OnEndDrag=SPNclFreeAgents.InternalOnEndDrag
        OnDragDrop=UT2K4SPTab_TeamManagement.TeamMemberOnDragDrop
        OnDragEnter=SPNclFreeAgents.InternalOnDragEnter
        OnDragLeave=SPNclFreeAgents.InternalOnDragLeave
        OnDragOver=SPNclFreeAgents.InternalOnDragOver
    end object
    clFreeAgents=SPNclFreeAgents
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPPbtnHire'
    begin object name="SPPbtnHire" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ?????"
        WinTop=0.0333330
        WinLeft=0.3411990
        WinWidth=0.2062500
        WinHeight=0.0500000
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SPTab_TeamManagement.onHireClick
        OnKeyEvent=SPPbtnHire.InternalOnKeyEvent
    end object
    btnHire=SPPbtnHire
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPPbtnFire'
    begin object name="SPPbtnFire" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        Hint="? ??? ?????."
        WinTop=0.0916670
        WinLeft=0.3411990
        WinWidth=0.2062500
        WinHeight=0.0500000
        RenderWeight=0.2000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SPTab_TeamManagement.onFireClick
        OnKeyEvent=SPPbtnFire.InternalOnKeyEvent
    end object
    btnFire=SPPbtnFire
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPNbtnLeft'
    begin object name="SPNbtnLeft" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        WinTop=0.8061540
        WinLeft=0.3437500
        WinWidth=0.0500000
        WinHeight=0.0900000
        TabOrder=5
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4SPTab_TeamManagement.onFreeAgentScroll
        OnKeyEvent=SPNbtnLeft.InternalOnKeyEvent
    end object
    btnLeft=SPNbtnLeft
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPNbtnRight'
    begin object name="SPNbtnRight" class=XInterface.GUIButton
        StyleName="ArrowRight"
        WinTop=0.8061540
        WinLeft=0.9387500
        WinWidth=0.0500000
        WinHeight=0.0900000
        TabOrder=6
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4SPTab_TeamManagement.onFreeAgentScroll
        OnKeyEvent=SPNbtnRight.InternalOnKeyEvent
    end object
    btnRight=SPNbtnRight
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPPbtnTreat'
    begin object name="SPPbtnTreat" class=XInterface.GUIButton
        Caption="?? ??"
        MenuState=4
        FontScale=0
        Hint="??? ????? ??? ?????"
        WinTop=0.5215360
        WinLeft=0.3525500
        WinWidth=0.1848210
        WinHeight=0.0500000
        RenderWeight=0.2000000
        TabOrder=5
        bBoundToParent=true
        OnClick=UT2K4SPTab_TeamManagement.onTreatClick
        OnKeyEvent=SPPbtnTreat.InternalOnKeyEvent
    end object
    btnTreat=SPPbtnTreat
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPPbtnTreatAll'
    begin object name="SPPbtnTreatAll" class=XInterface.GUIButton
        Caption="?? ??"
        FontScale=0
        Hint="?? ??? ??? ?????"
        WinTop=0.5703820
        WinLeft=0.3525500
        WinWidth=0.1848210
        WinHeight=0.0500000
        RenderWeight=0.2000000
        TabOrder=6
        bBoundToParent=true
        OnClick=UT2K4SPTab_TeamManagement.onTreatAllClick
        OnKeyEvent=SPPbtnTreatAll.InternalOnKeyEvent
    end object
    btnTreatAll=SPPbtnTreatAll
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPPbtnAutoMake'
    begin object name="SPPbtnAutoMake" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        Hint="??? ?? ???? ????"
        WinTop=0.1500000
        WinLeft=0.3411990
        WinWidth=0.2062500
        WinHeight=0.0500000
        RenderWeight=0.2000000
        TabOrder=3
        bBoundToParent=true
        OnClick=UT2K4SPTab_TeamManagement.onAutoMakeClick
        OnKeyEvent=SPPbtnAutoMake.InternalOnKeyEvent
    end object
    btnAutoMake=SPPbtnAutoMake
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4SPTab_TeamManagement.SPTMedBalance'
    begin object name="SPTMedBalance" class=XInterface.moEditBox
        bReadOnly=true
        bVerticalLayout=true
        Caption="???:"
        OnCreateComponent=SPTMedBalance.InternalOnCreateComponent
        WinTop=0.2712830
        WinLeft=0.3551020
        WinWidth=0.1796940
        WinHeight=0.0341560
        TabOrder=4
        bBoundToParent=true
    end object
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