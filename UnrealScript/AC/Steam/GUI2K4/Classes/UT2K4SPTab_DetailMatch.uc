/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_DetailMatch.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:29
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4SPTab_DetailMatch extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgChallengeBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgOwnTeamBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgEnemyTeamBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgDetailsBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUI2K4MultiColumnListBox mclOwnTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUI2K4MultiColumnListBox mclEnemyTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblMatchTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox stDescription;
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgChallengeBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblChallengeTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox cbChallenges;
var localized string ColumnHeadings[4];
var localized string msgSelectChal;
var array<PlayerMatchDetailsRecord> PlayerList1;
var array<PlayerMatchDetailsRecord> PlayerList2;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x11e
    if(GP != none)
    {
        cbChallenges.AddItem(msgSelectChal);
        // End:0x5a
        if(!GP.lmdTeamGame)
        {
            cbChallenges.DisableComponent(cbChallenges);
        }
        // End:0x118
        else
        {
            i = 0;
            J0x61:
            // End:0x118 [While If]
            if(i < GP.UT2K4GameLadder.default.ChallengeGames.Length)
            {
                // End:0x10e
                if(GP.UT2K4GameLadder.default.ChallengeGames[i].canChallenge(GP))
                {
                    cbChallenges.AddItem(GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeName,, GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeMenu);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x61;
            }
        }
        FillData();
    }
}

function FillData()
{
    local int i;
    local string detailContent, tmp, tmp2, tmp3;
    local array<string> TeamName;
    local class<UT2K4TeamRoster> ETIclass;

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
    mclOwnTeam.List.InitColumnPerc[0] = 0.370;
    mclOwnTeam.List.InitColumnPerc[1] = 0.20;
    mclOwnTeam.List.InitColumnPerc[2] = 0.20;
    mclOwnTeam.List.InitColumnPerc[3] = 0.230;
    mclOwnTeam.List.SortColumn = 1;
    mclOwnTeam.List.SortDescending = true;
    // End:0x2be
    if(!GP.lmdTeamGame)
    {
        mclOwnTeam.WinLeft = 0.3051020;
        sbgOwnTeamBg.WinLeft = 0.2872450;
        mclEnemyTeam.bVisible = false;
        sbgEnemyTeamBg.bVisible = false;
        PlayerList1 = GP.PlayerMatchDetails;
        i = 0;
        J0x289:
        // End:0x2bb [While If]
        if(i < PlayerList1.Length)
        {
            mclOwnTeam.List.AddedItem();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x289;
        }
    }
    // End:0x56a
    else
    {
        ETIclass = class<UT2K4TeamRoster>(DynamicLoadObject(GP.lmdEnemyTeam, class'Class'));
        sbgEnemyTeamBg.Caption = ETIclass.default.TeamName;
        TeamName[int(float(GP.lmdMyTeam + 1) % float(2))] = sbgEnemyTeamBg.Caption;
        mclEnemyTeam.List.__OnDrawItem__Delegate = OnDrawPlayerList2;
        mclEnemyTeam.List.ExpandLastColumn = true;
        mclEnemyTeam.List.ColumnHeadings[0] = ColumnHeadings[0];
        mclEnemyTeam.List.ColumnHeadings[1] = ColumnHeadings[1];
        mclEnemyTeam.List.ColumnHeadings[2] = ColumnHeadings[2];
        mclEnemyTeam.List.ColumnHeadings[3] = ColumnHeadings[3];
        mclEnemyTeam.List.InitColumnPerc[0] = 0.370;
        mclEnemyTeam.List.InitColumnPerc[1] = 0.20;
        mclEnemyTeam.List.InitColumnPerc[2] = 0.20;
        mclEnemyTeam.List.InitColumnPerc[3] = 0.230;
        mclEnemyTeam.List.SortColumn = 1;
        mclEnemyTeam.List.SortDescending = true;
        i = 0;
        J0x4a6:
        // End:0x56a [While If]
        if(i < GP.PlayerMatchDetails.Length)
        {
            // End:0x527
            if(GP.PlayerMatchDetails[i].Team == GP.lmdMyTeam)
            {
                PlayerList1[PlayerList1.Length] = GP.PlayerMatchDetails[i];
                mclOwnTeam.List.AddedItem();
            }
            // End:0x560
            else
            {
                PlayerList2[PlayerList2.Length] = GP.PlayerMatchDetails[i];
                mclEnemyTeam.List.AddedItem();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4a6;
        }
    }
    detailContent = "";
    // End:0x592
    if(GP.lmdWonMatch)
    {
        tmp = msgWon;
    }
    // End:0x59d
    else
    {
        tmp = msgLost;
    }
    tmp = Repl(Repl(tmp, "%gametype%", GP.lmdGameType), "%map%", GP.lmdMap);
    tmp = Repl(Repl(tmp, "%gametime%", string(GP.lmdGameTime / float(60))), "%PrizeMoney%", GP.MoneyToString(GP.lmdPrizeMoney));
    // End:0x6fd
    if(GP.lmdTotalBonusMoney > 0)
    {
        // End:0x6ad
        if(GP.lmdWonMatch)
        {
            tmp = Repl(tmp, "%BonusMoney%", Repl(msgBonusMoneyWon, "%BonusMoney%", GP.MoneyToString(GP.lmdTotalBonusMoney)));
        }
        // End:0x6fa
        else
        {
            tmp = Repl(tmp, "%BonusMoney%", Repl(msgBonusMoneyLost, "%BonusMoney%", GP.MoneyToString(GP.lmdTotalBonusMoney)));
        }
    }
    // End:0x71a
    else
    {
        tmp = Repl(tmp, "%BonusMoney%", "");
    }
    // End:0x74f
    if(GP.lmdTeamGame)
    {
        tmp = Repl(tmp, "%enemies%", string(PlayerList2.Length));
    }
    // End:0x772
    else
    {
        tmp = Repl(tmp, "%enemies%", string(PlayerList1.Length - 1));
    }
    // End:0x7ac
    if(GP.PayCheck.Length > 0)
    {
        tmp = Repl(tmp, "%team_payment%", msgTeamPayment);
    }
    // End:0x7cb
    else
    {
        tmp = Repl(tmp, "%team_payment%", "");
    }
    // End:0x826
    if(GP.lmdBalanceChange > 0)
    {
        tmp2 = Repl(msgBalanceChangeUp, "%balance_absolute%", GP.MoneyToString(int(Abs(float(GP.lmdBalanceChange)))));
    }
    // End:0x86a
    else
    {
        tmp2 = Repl(msgBalanceChangeDown, "%balance_absolute%", GP.MoneyToString(int(Abs(float(GP.lmdBalanceChange)))));
    }
    tmp = Repl(tmp, "%balance_change%", tmp2);
    detailContent $= tmp;
    // End:0x95f
    if(GP.lmdInjury > -1)
    {
        tmp = Repl(msgInjury, "%player%", GP.BotStats[GP.lmdInjury].Name);
        tmp = Repl(tmp, "%health%", string(GP.lmdInjuryHealth));
        tmp = Repl(tmp, "%treatment%", GP.MoneyToString(GP.lmdInjuryTreatment));
        detailContent $= "||" $ tmp;
    }
    tmp = "";
    i = 0;
    J0x96e:
    // End:0xaa3 [While If]
    if(i < GP.PlayerMatchDetails.Length)
    {
        // End:0xa99
        if(GP.PlayerMatchDetails[i].SpecialAwards.Length > 0)
        {
            tmp3 = GP.PlayerMatchDetails[i].Name;
            // End:0xa2f
            if(GP.PlayerMatchDetails[i].Team > -1 && GP.lmdTeamGame)
            {
                tmp3 @= "(" $ TeamName[GP.PlayerMatchDetails[i].Team] $ ")";
            }
            tmp2 = Repl(msgSpecialAwards, "%player%", tmp3);
            tmp2 = Repl(tmp2, "%awards%", JoinArray(GP.PlayerMatchDetails[i].SpecialAwards, ", ", true));
            tmp $= "|" $ tmp2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x96e;
    }
    // End:0xac2
    if(tmp != "")
    {
        detailContent $= "|" $ tmp;
    }
    // End:0xb96
    if(GP.PayCheck.Length > 0)
    {
        detailContent $= "||" $ msgPayCheck;
        i = 0;
        J0xaf2:
        // End:0xb96 [While If]
        if(i < GP.PayCheck.Length)
        {
            detailContent $= "|" $ Repl(Repl(msgEarns, "%player%", GP.BotStats[GP.PayCheck[i].BotID].Name), "%payment%", GP.MoneyToString(GP.PayCheck[i].Payment));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xaf2;
        }
    }
    tmp = "";
    i = 0;
    J0xba5:
    // End:0xc90 [While If]
    if(i < 6)
    {
        // End:0xc86
        if(GP.lmdSpree[i] > 0)
        {
            tmp2 = msgBonusOverviewItem;
            tmp2 = Repl(tmp2, "%bonusname%", class'UT2K4SPTab_Profile'.default.SpreeLabel[i]);
            tmp2 = Repl(tmp2, "%bonuscount%", string(GP.lmdSpree[i]));
            tmp2 = Repl(tmp2, "%bonusmoney%", GP.MoneyToString(GP.SpreeBonus[i]));
            tmp $= "|" $ tmp2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xba5;
    }
    i = 0;
    J0xc97:
    // End:0xd82 [While If]
    if(i < 7)
    {
        // End:0xd78
        if(GP.lmdMultiKills[i] > 0)
        {
            tmp2 = msgBonusOverviewItem;
            tmp2 = Repl(tmp2, "%bonusname%", class'UT2K4SPTab_Profile'.default.MultiKillsLabel[i]);
            tmp2 = Repl(tmp2, "%bonuscount%", string(GP.lmdMultiKills[i]));
            tmp2 = Repl(tmp2, "%bonusmoney%", GP.MoneyToString(GP.MultiKillBonus[i]));
            tmp $= "|" $ tmp2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc97;
    }
    // End:0xda9
    if(tmp != "")
    {
        detailContent $= "||" $ msgBonusOverview $ tmp;
    }
    stDescription.SetContent(detailContent);
    mclOwnTeam.List.SortList();
    mclEnemyTeam.List.SortList();
}

function OnDrawPlayerList1(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;

    i = mclOwnTeam.List.SortData[i].SortItem;
    // End:0x3a
    if(PlayerList1.Length <= i)
    {
        return;
    }
    mclOwnTeam.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, PlayerList1[i].Name, mclOwnTeam.List.FontScale);
    mclOwnTeam.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Score)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x227
    if(CellLeft + XL <= mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth())
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Score)), mclOwnTeam.List.FontScale);
    }
    mclOwnTeam.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Kills)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x378
    if(CellLeft + XL <= mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth())
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Kills)), mclOwnTeam.List.FontScale);
    }
    mclOwnTeam.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    mclOwnTeam.List.Style.TextSize(Canvas, mclOwnTeam.List.MenuState, string(int(PlayerList1[i].Deaths)), XL, YL, mclOwnTeam.List.FontScale);
    // End:0x4c9
    if(CellLeft + XL <= mclOwnTeam.List.ActualLeft() + mclOwnTeam.List.ActualWidth())
    {
        mclOwnTeam.List.Style.DrawText(Canvas, mclOwnTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList1[i].Deaths)), mclOwnTeam.List.FontScale);
    }
}

function OnDrawPlayerList2(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;

    i = mclEnemyTeam.List.SortData[i].SortItem;
    // End:0x3a
    if(PlayerList2.Length <= i)
    {
        return;
    }
    mclEnemyTeam.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, PlayerList2[i].Name, mclEnemyTeam.List.FontScale);
    mclEnemyTeam.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Score)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x227
    if(CellLeft + XL <= mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth())
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Score)), mclEnemyTeam.List.FontScale);
    }
    mclEnemyTeam.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Kills)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x378
    if(CellLeft + XL <= mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth())
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Kills)), mclEnemyTeam.List.FontScale);
    }
    mclEnemyTeam.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    mclEnemyTeam.List.Style.TextSize(Canvas, mclEnemyTeam.List.MenuState, string(int(PlayerList2[i].Deaths)), XL, YL, mclEnemyTeam.List.FontScale);
    // End:0x4c9
    if(CellLeft + XL <= mclEnemyTeam.List.ActualLeft() + mclEnemyTeam.List.ActualWidth())
    {
        mclEnemyTeam.List.Style.DrawText(Canvas, mclEnemyTeam.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(int(PlayerList2[i].Deaths)), mclEnemyTeam.List.FontScale);
    }
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
}

function string mclPlayersOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    local string S;
    local array<PlayerMatchDetailsRecord> List;

    // End:0x1d
    if(Sender == mclOwnTeam)
    {
        List = PlayerList1;
    }
    // End:0x28
    else
    {
        List = PlayerList2;
    }
    switch(Column)
    {
        // End:0x4c
        case 0:
            S = List[Item].Name;
            // End:0xe7
            break;
        // End:0x7e
        case 1:
            S = string(int(List[Item].Score));
            PadLeft(S, 5, "0");
            // End:0xe7
            break;
        // End:0xb1
        case 2:
            S = string(int(List[Item].Kills));
            PadLeft(S, 5, "0");
            // End:0xe7
            break;
        // End:0xe4
        case 3:
            S = string(int(List[Item].Deaths));
            PadLeft(S, 5, "0");
            // End:0xe7
            break;
        // End:0xffff
        default:
            return S;
    }
}

defaultproperties
{
    begin object name=SPLsbgChallengeBg class=AltSectionBackground
        Caption="??"
        WinTop=0.4226750
        WinLeft=0.281250
        WinWidth=0.443750
        WinHeight=0.1403060
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_DetailMatch.SPLsbgChallengeBg'
    sbgChallengeBg=SPLsbgChallengeBg
    begin object name=SPDMimgOwnTeamBg class=GUISectionBackground
        WinTop=0.0750
        WinLeft=0.050
        WinWidth=0.4318880
        WinHeight=0.343750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_DetailMatch.SPDMimgOwnTeamBg'
    sbgOwnTeamBg=SPDMimgOwnTeamBg
    begin object name=SPDMimgEnemyTeamBg class=GUISectionBackground
        WinTop=0.0750
        WinLeft=0.5334180
        WinWidth=0.4318880
        WinHeight=0.343750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_DetailMatch.SPDMimgEnemyTeamBg'
    sbgEnemyTeamBg=SPDMimgEnemyTeamBg
    begin object name=SPDMimgDetailsBg class=GUISectionBackground
        Caption="????"
        WinTop=0.5666670
        WinLeft=0.050
        WinWidth=0.90
        WinHeight=0.4250
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_DetailMatch.SPDMimgDetailsBg'
    sbgDetailsBg=SPDMimgDetailsBg
    begin object name=SPDMmclOwnTeam class=GUI2K4MultiColumnListBox
        OnGetSortString=mclPlayersOnGetSortString
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1333330
        WinLeft=0.0678320
        WinWidth=0.39750
        WinHeight=0.2540560
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUI2K4MultiColumnListBox'UT2K4SPTab_DetailMatch.SPDMmclOwnTeam'
    mclOwnTeam=SPDMmclOwnTeam
    begin object name=SPDMmclEnemyTeam class=GUI2K4MultiColumnListBox
        OnGetSortString=mclPlayersOnGetSortString
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1333330
        WinLeft=0.551250
        WinWidth=0.39750
        WinHeight=0.2540560
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUI2K4MultiColumnListBox'UT2K4SPTab_DetailMatch.SPDMmclEnemyTeam'
    mclEnemyTeam=SPDMmclEnemyTeam
    begin object name=SPDMlblMatchTitle class=GUILabel
        TextAlign=1
        FontScale=2
        StyleName="NoBackground"
        WinLeft=0.050
        WinWidth=0.90
        WinHeight=0.08250
        RenderWeight=0.110
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SPTab_DetailMatch.SPDMlblMatchTitle'
    lblMatchTitle=SPDMlblMatchTitle
    begin object name=SPDMstDescription class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6368760
        WinLeft=0.0728830
        WinWidth=0.8529080
        WinHeight=0.330230
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_DetailMatch.SPDMstDescription'
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
    begin object name=SPLcbChallenges class=GUIComboBox
        bReadOnly=true
        bShowListOnFocus=true
        Hint="???? ?? ????"
        WinTop=0.4782530
        WinLeft=0.2949850
        WinWidth=0.4173470
        WinHeight=0.0486480
        TabOrder=2
        bBoundToParent=true
        OnChange=OnChallengeSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'UT2K4SPTab_DetailMatch.SPLcbChallenges'
    cbChallenges=SPLcbChallenges
    ColumnHeadings[0]="??"
    ColumnHeadings[1]="??"
    ColumnHeadings[2]="????"
    ColumnHeadings[3]="????"
    msgSelectChal="??? ??? ??????"
    PanelCaption="????? ???? ??"
    PropagateVisibility=true
}