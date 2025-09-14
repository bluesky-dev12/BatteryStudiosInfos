class UT2K4SPTab_DetailMatch extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUISectionBackground sbgChallengeBg;
var() automated GUISectionBackground sbgOwnTeamBg;
var() automated GUISectionBackground sbgEnemyTeamBg;
var() automated GUISectionBackground sbgDetailsBg;
var() automated GUI2K4MultiColumnListBox mclOwnTeam;
var() automated GUI2K4MultiColumnListBox mclEnemyTeam;
var() automated GUILabel lblMatchTitle;
var() automated GUIScrollTextBox stDescription;
var localized string MatchTitleCaption;
var localized string msgWon;
var localized string msgLost;
var localized string msgTeamPayment;
var localized string msgInjury;
var localized string msgSpecialAwards;
var localized string msgBalanceChangeUp;
var localized string msgBalanceChangeDown;
var localized string msgPayCheck;
var localized string msgEarns;
var localized string msgBonusMoneyWon;
var localized string msgBonusMoneyLost;
var localized string msgBonusOverview;
var localized string msgBonusOverviewItem;
var() automated GUIImage imgChallengeBg;
var() automated GUILabel lblChallengeTitle;
var() automated GUIComboBox cbChallenges;
var localized string ColumnHeadings[4];
var localized string msgSelectChal;
var array<PlayerMatchDetailsRecord> PlayerList1;
var array<PlayerMatchDetailsRecord> PlayerList2;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x11E
    if(GP != none)
    {
        cbChallenges.AddItem(msgSelectChal);
        // End:0x5A
        if(!GP.lmdTeamGame)
        {
            cbChallenges.DisableComponent(cbChallenges);            
        }
        else
        {
            i = 0;
            J0x61:

            // End:0x118 [Loop If]
            if(i < GP.UT2K4GameLadder.default.ChallengeGames.Length)
            {
                // End:0x10E
                if(GP.UT2K4GameLadder.default.ChallengeGames[i].canChallenge(GP))
                {
                    cbChallenges.AddItem(GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeName,, GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeMenu);
                }
                i++;
                // [Loop Continue]
                goto J0x61;
            }
        }
        FillData();
    }
    //return;    
}

function FillData()
{
    local int i;
    local string detailContent, tmp, tmp2, tmp3;
    local array<string> TeamName;
    local Class<UT2K4TeamRoster> ETIclass;

    PlayerList1.Length = 0;
    PlayerList2.Length = 0;
    lblMatchTitle.Caption = Repl(Repl(MatchTitleCaption, "%gametype%", GP.lmdGameType), "%map%", GP.lmdMap);
    sbgOwnTeamBg.Caption = GP.TeamName;
    TeamName.Length = 2;
    TeamName[GP.lmdMyTeam] = sbgOwnTeamBg.Caption;
    mclOwnTeam.List.__OnDrawItem__Delegate = OnDrawPlayerList1;
    mclOwnTeam.List.ExpandLastColumn = true;
    mclOwnTeam.List.ColumnHeadings[0] = ColumnHeadings[0];
    mclOwnTeam.List.ColumnHeadings[1] = ColumnHeadings[1];
    mclOwnTeam.List.ColumnHeadings[2] = ColumnHeadings[2];
    mclOwnTeam.List.ColumnHeadings[3] = ColumnHeadings[3];
    mclOwnTeam.List.InitColumnPerc[0] = 0.3700000;
    mclOwnTeam.List.InitColumnPerc[1] = 0.2000000;
    mclOwnTeam.List.InitColumnPerc[2] = 0.2000000;
    mclOwnTeam.List.InitColumnPerc[3] = 0.2300000;
    mclOwnTeam.List.SortColumn = 1;
    mclOwnTeam.List.SortDescending = true;
    // End:0x2BE
    if(!GP.lmdTeamGame)
    {
        mclOwnTeam.WinLeft = 0.3051020;
        sbgOwnTeamBg.WinLeft = 0.2872450;
        mclEnemyTeam.bVisible = false;
        sbgEnemyTeamBg.bVisible = false;
        PlayerList1 = GP.PlayerMatchDetails;
        i = 0;
        J0x289:

        // End:0x2BB [Loop If]
        if(i < PlayerList1.Length)
        {
            mclOwnTeam.List.AddedItem();
            i++;
            // [Loop Continue]
            goto J0x289;
        }        
    }
    else
    {
        ETIclass = Class<UT2K4TeamRoster>(DynamicLoadObject(GP.lmdEnemyTeam, Class'Core.Class'));
        sbgEnemyTeamBg.Caption = ETIclass.default.TeamName;
        TeamName[int(float(GP.lmdMyTeam + 1) % float(2))] = sbgEnemyTeamBg.Caption;
        mclEnemyTeam.List.__OnDrawItem__Delegate = OnDrawPlayerList2;
        mclEnemyTeam.List.ExpandLastColumn = true;
        mclEnemyTeam.List.ColumnHeadings[0] = ColumnHeadings[0];
        mclEnemyTeam.List.ColumnHeadings[1] = ColumnHeadings[1];
        mclEnemyTeam.List.ColumnHeadings[2] = ColumnHeadings[2];
        mclEnemyTeam.List.ColumnHeadings[3] = ColumnHeadings[3];
        mclEnemyTeam.List.InitColumnPerc[0] = 0.3700000;
        mclEnemyTeam.List.InitColumnPerc[1] = 0.2000000;
        mclEnemyTeam.List.InitColumnPerc[2] = 0.2000000;
        mclEnemyTeam.List.InitColumnPerc[3] = 0.2300000;
        mclEnemyTeam.List.SortColumn = 1;
        mclEnemyTeam.List.SortDescending = true;
        i = 0;
        J0x4A6:

        // End:0x56A [Loop If]
        if(i < GP.PlayerMatchDetails.Length)
        {
            // End:0x527
            if(GP.PlayerMatchDetails[i].Team == GP.lmdMyTeam)
            {
                PlayerList1[PlayerList1.Length] = GP.PlayerMatchDetails[i];
                mclOwnTeam.List.AddedItem();
                // [Explicit Continue]
                goto J0x560;
            }
            PlayerList2[PlayerList2.Length] = GP.PlayerMatchDetails[i];
            mclEnemyTeam.List.AddedItem();
            J0x560:

            i++;
            // [Loop Continue]
            goto J0x4A6;
        }
    }
    detailContent = "";
    // End:0x592
    if(GP.lmdWonMatch)
    {
        tmp = msgWon;        
    }
    else
    {
        tmp = msgLost;
    }
    tmp = Repl(Repl(tmp, "%gametype%", GP.lmdGameType), "%map%", GP.lmdMap);
    tmp = Repl(Repl(tmp, "%gametime%", string(GP.lmdGameTime / float(60))), "%PrizeMoney%", GP.MoneyToString(GP.lmdPrizeMoney));
    // End:0x6FD
    if(GP.lmdTotalBonusMoney > 0)
    {
        // End:0x6AD
        if(GP.lmdWonMatch)
        {
            tmp = Repl(tmp, "%BonusMoney%", Repl(msgBonusMoneyWon, "%BonusMoney%", GP.MoneyToString(GP.lmdTotalBonusMoney)));            
        }
        else
        {
            tmp = Repl(tmp, "%BonusMoney%", Repl(msgBonusMoneyLost, "%BonusMoney%", GP.MoneyToString(GP.lmdTotalBonusMoney)));
        }        
    }
    else
    {
        tmp = Repl(tmp, "%BonusMoney%", "");
    }
    // End:0x74F
    if(GP.lmdTeamGame)
    {
        tmp = Repl(tmp, "%enemies%", string(PlayerList2.Length));        
    }
    else
    {
        tmp = Repl(tmp, "%enemies%", string(PlayerList1.Length - 1));
    }
    // End:0x7AC
    if(GP.PayCheck.Length > 0)
    {
        tmp = Repl(tmp, "%team_payment%", msgTeamPayment);        
    }
    else
    {
        tmp = Repl(tmp, "%team_payment%", "");
    }
    // End:0x826
    if(GP.lmdBalanceChange > 0)
    {
        tmp2 = Repl(msgBalanceChangeUp, "%balance_absolute%", GP.MoneyToString(int(Abs(float(GP.lmdBalanceChange)))));        
    }
    else
    {
        tmp2 = Repl(msgBalanceChangeDown, "%balance_absolute%", GP.MoneyToString(int(Abs(float(GP.lmdBalanceChange)))));
    }
    tmp = Repl(tmp, "%balance_change%", tmp2);
    detailContent $= tmp;
    // End:0x95F
    if(GP.lmdInjury > -1)
    {
        tmp = Repl(msgInjury, "%player%", GP.BotStats[GP.lmdInjury].Name);
        tmp = Repl(tmp, "%health%", string(GP.lmdInjuryHealth));
        tmp = Repl(tmp, "%treatment%", GP.MoneyToString(GP.lmdInjuryTreatment));
        detailContent $= ("||" $ tmp);
    }
    tmp = "";
    i = 0;
    J0x96E:

    // End:0xAA3 [Loop If]
    if(i < GP.PlayerMatchDetails.Length)
    {
        // End:0xA99
        if(GP.PlayerMatchDetails[i].SpecialAwards.Length > 0)
        {
            tmp3 = GP.PlayerMatchDetails[i].Name;
            // End:0xA2F
            if((GP.PlayerMatchDetails[i].Team > -1) && GP.lmdTeamGame)
            {
                tmp3 @= (("(" $ TeamName[GP.PlayerMatchDetails[i].Team]) $ ")");
            }
            tmp2 = Repl(msgSpecialAwards, "%player%", tmp3);
            tmp2 = Repl(tmp2, "%awards%", JoinArray(GP.PlayerMatchDetails[i].SpecialAwards, ", ", true));
            tmp $= ("|" $ tmp2);
        }
        i++;
        // [Loop Continue]
        goto J0x96E;
    }
    // End:0xAC2
    if(tmp != "")
    {
        detailContent $= ("|" $ tmp);
    }
    // End:0xB96
    if(GP.PayCheck.Length > 0)
    {
        detailContent $= ("||" $ msgPayCheck);
        i = 0;
        J0xAF2:

        // End:0xB96 [Loop If]
        if(i < GP.PayCheck.Length)
        {
            detailContent $= ("|" $ Repl(Repl(msgEarns, "%player%", GP.BotStats[GP.PayCheck[i].BotID].Name), "%payment%", GP.MoneyToString(GP.PayCheck[i].Payment)));
            i++;
            // [Loop Continue]
            goto J0xAF2;
        }
    }
    tmp = "";
    i = 0;
    J0xBA5:

    // End:0xC90 [Loop If]
    if(i < 6)
    {
        // End:0xC86
        if(GP.lmdSpree[i] > 0)
        {
            tmp2 = msgBonusOverviewItem;
            tmp2 = Repl(tmp2, "%bonusname%", Class'GUI2K4_Decompressed.UT2K4SPTab_Profile'.default.SpreeLabel[i]);
            tmp2 = Repl(tmp2, "%bonuscount%", string(GP.lmdSpree[i]));
            tmp2 = Repl(tmp2, "%bonusmoney%", GP.MoneyToString(GP.SpreeBonus[i]));
            tmp $= ("|" $ tmp2);
        }
        i++;
        // [Loop Continue]
        goto J0xBA5;
    }
    i = 0;
    J0xC97:

    // End:0xD82 [Loop If]
    if(i < 7)
    {
        // End:0xD78
        if(GP.lmdMultiKills[i] > 0)
        {
            tmp2 = msgBonusOverviewItem;
            tmp2 = Repl(tmp2, "%bonusname%", Class'GUI2K4_Decompressed.UT2K4SPTab_Profile'.default.MultiKillsLabel[i]);
            tmp2 = Repl(tmp2, "%bonuscount%", string(GP.lmdMultiKills[i]));
            tmp2 = Repl(tmp2, "%bonusmoney%", GP.MoneyToString(GP.MultiKillBonus[i]));
            tmp $= ("|" $ tmp2);
        }
        i++;
        // [Loop Continue]
        goto J0xC97;
    }
    // End:0xDA9
    if(tmp != "")
    {
        detailContent $= (("||" $ msgBonusOverview) $ tmp);
    }
    stDescription.SetContent(detailContent);
    mclOwnTeam.List.SortList();
    mclEnemyTeam.List.SortList();
    //return;    
}

function OnDrawPlayerList1(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;

    i = mclOwnTeam.List.SortData[i].SortItem;
    // End:0x3A
    if(PlayerList1.Length <= i)
    {
        return;
    }
    mclOwnTeam.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, PlayerList1[i].Name, mclOwnTeam.List.FontScale);
    mclOwnTeam.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Score)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x227
    if((CellLeft + XL) <= (mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth()))
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Score)), mclOwnTeam.List.FontScale);
    }
    mclOwnTeam.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Kills)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x378
    if((CellLeft + XL) <= (mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth()))
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Kills)), mclOwnTeam.List.FontScale);
    }
    mclOwnTeam.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Deaths)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x4C9
    if((CellLeft + XL) <= (mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth()))
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Deaths)), mclOwnTeam.List.FontScale);
    }
    //return;    
}

function OnDrawPlayerList2(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;

    i = mclEnemyTeam.List.SortData[i].SortItem;
    // End:0x3A
    if(PlayerList2.Length <= i)
    {
        return;
    }
    mclEnemyTeam.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, PlayerList2[i].Name, mclEnemyTeam.List.FontScale);
    mclEnemyTeam.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Score)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x227
    if((CellLeft + XL) <= (mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth()))
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Score)), mclEnemyTeam.List.FontScale);
    }
    mclEnemyTeam.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Kills)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x378
    if((CellLeft + XL) <= (mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth()))
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Kills)), mclEnemyTeam.List.FontScale);
    }
    mclEnemyTeam.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Deaths)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x4C9
    if((CellLeft + XL) <= (mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth()))
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Deaths)), mclEnemyTeam.List.FontScale);
    }
    //return;    
}

function OnChallengeSelect(GUIComponent Sender)
{
    local string tmp;

    tmp = cbChallenges.GetExtra();
    // End:0x43
    if(tmp != "")
    {
        Controller.OpenMenu(tmp, GP.lmdEnemyTeam);
    }
    cbChallenges.SetIndex(0);
    //return;    
}

function string mclPlayersOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    local string S;
    local array<PlayerMatchDetailsRecord> List;

    // End:0x1D
    if(Sender == mclOwnTeam)
    {
        List = PlayerList1;        
    }
    else
    {
        List = PlayerList2;
    }
    switch(Column)
    {
        // End:0x4C
        case 0:
            S = List[Item].Name;
            // End:0xE7
            break;
        // End:0x7E
        case 1:
            S = string(int(List[Item].Score));
            PadLeft(S, 5, "0");
            // End:0xE7
            break;
        // End:0xB1
        case 2:
            S = string(int(List[Item].Kills));
            PadLeft(S, 5, "0");
            // End:0xE7
            break;
        // End:0xE4
        case 3:
            S = string(int(List[Item].Deaths));
            PadLeft(S, 5, "0");
            // End:0xE7
            break;
        // End:0xFFFF
        default:
            break;
    }
    return S;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPLsbgChallengeBg'
    begin object name="SPLsbgChallengeBg" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="??"
        WinTop=0.4226750
        WinLeft=0.2812500
        WinWidth=0.4437500
        WinHeight=0.1403060
        bBoundToParent=true
        OnPreDraw=SPLsbgChallengeBg.InternalPreDraw
    end object
    sbgChallengeBg=SPLsbgChallengeBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMimgOwnTeamBg'
    begin object name="SPDMimgOwnTeamBg" class=XInterface.GUISectionBackground
        WinTop=0.0750000
        WinLeft=0.0500000
        WinWidth=0.4318880
        WinHeight=0.3437500
        bBoundToParent=true
        OnPreDraw=SPDMimgOwnTeamBg.InternalPreDraw
    end object
    sbgOwnTeamBg=SPDMimgOwnTeamBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMimgEnemyTeamBg'
    begin object name="SPDMimgEnemyTeamBg" class=XInterface.GUISectionBackground
        WinTop=0.0750000
        WinLeft=0.5334180
        WinWidth=0.4318880
        WinHeight=0.3437500
        bBoundToParent=true
        OnPreDraw=SPDMimgEnemyTeamBg.InternalPreDraw
    end object
    sbgEnemyTeamBg=SPDMimgEnemyTeamBg
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMimgDetailsBg'
    begin object name="SPDMimgDetailsBg" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.5666670
        WinLeft=0.0500000
        WinWidth=0.9000000
        WinHeight=0.4250000
        bBoundToParent=true
        OnPreDraw=SPDMimgDetailsBg.InternalPreDraw
    end object
    sbgDetailsBg=SPDMimgDetailsBg
    // Reference: GUI2K4MultiColumnListBox'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMmclOwnTeam'
    begin object name="SPDMmclOwnTeam" class=GUI2K4_Decompressed.GUI2K4MultiColumnListBox
        OnGetSortString=UT2K4SPTab_DetailMatch.mclPlayersOnGetSortString
        bVisibleWhenEmpty=true
        OnCreateComponent=SPDMmclOwnTeam.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1333330
        WinLeft=0.0678320
        WinWidth=0.3975000
        WinHeight=0.2540560
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    mclOwnTeam=SPDMmclOwnTeam
    // Reference: GUI2K4MultiColumnListBox'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMmclEnemyTeam'
    begin object name="SPDMmclEnemyTeam" class=GUI2K4_Decompressed.GUI2K4MultiColumnListBox
        OnGetSortString=UT2K4SPTab_DetailMatch.mclPlayersOnGetSortString
        bVisibleWhenEmpty=true
        OnCreateComponent=SPDMmclEnemyTeam.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1333330
        WinLeft=0.5512500
        WinWidth=0.3975000
        WinHeight=0.2540560
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    mclEnemyTeam=SPDMmclEnemyTeam
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMlblMatchTitle'
    begin object name="SPDMlblMatchTitle" class=XInterface.GUILabel
        TextAlign=1
        FontScale=2
        StyleName="NoBackground"
        WinLeft=0.0500000
        WinWidth=0.9000000
        WinHeight=0.0825000
        RenderWeight=0.1100000
        bBoundToParent=true
    end object
    lblMatchTitle=SPDMlblMatchTitle
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPDMstDescription'
    begin object name="SPDMstDescription" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPDMstDescription.InternalOnCreateComponent
        WinTop=0.6368760
        WinLeft=0.0728830
        WinWidth=0.8529080
        WinHeight=0.3302300
        bBoundToParent=true
    end object
    stDescription=SPDMstDescription
    MatchTitleCaption="%map% ???? %gametype% ??"
    msgWon="%enemies% ?? ??? %map%?? %gametime%? ?? ??? %gametype% ???? ???????.|?? ??? %PrizeMoney%??? ??? ?????. %BonusMoney%  %team_payment%"
    msgLost="%enemies%?? ??? %map%?? %gametime% ?? ??? %gametype% ???? ??????. %BonusMoney% %team_payment%"
    msgTeamPayment="%balance_change%"
    msgInjury="%player%?? ?? ???? ??? ??, ??? %health% ???????. ??? ??? ??? %treatment% ??? ??? ?????."
    msgSpecialAwards="%player%?? ???? ??? ??? ?????:|        %awards%"
    msgBalanceChangeUp="%balance_absolute%?? ?????."
    msgBalanceChangeDown="%balance_absolute%?? ?????."
    msgPayCheck="?? ??:"
    msgEarns="    %player% ?? %payment%? ?????."
    msgBonusMoneyWon=" ????? ??? %BonusMoney%??? ??? ?? ?????."
    msgBonusMoneyLost=" ??? ??? %BonusMoney%?? ??? ??? ????,"
    msgBonusOverview="??? ?? ??? ???? ?????:"
    msgBonusOverviewItem="    %bonuscount% x %bonusname% %bonusmoney%"
    // Reference: GUIComboBox'GUI2K4_Decompressed.UT2K4SPTab_DetailMatch.SPLcbChallenges'
    begin object name="SPLcbChallenges" class=XInterface.GUIComboBox
        bReadOnly=true
        bShowListOnFocus=true
        Hint="???? ?? ????"
        WinTop=0.4782530
        WinLeft=0.2949850
        WinWidth=0.4173470
        WinHeight=0.0486480
        TabOrder=2
        bBoundToParent=true
        OnChange=UT2K4SPTab_DetailMatch.OnChallengeSelect
        OnKeyEvent=SPLcbChallenges.InternalOnKeyEvent
    end object
    cbChallenges=SPLcbChallenges
    ColumnHeadings[0]="??"
    ColumnHeadings[1]="??"
    ColumnHeadings[2]="????"
    ColumnHeadings[3]="????"
    msgSelectChal="??? ??? ??????"
    PanelCaption="????? ???? ??"
    PropagateVisibility=false
}