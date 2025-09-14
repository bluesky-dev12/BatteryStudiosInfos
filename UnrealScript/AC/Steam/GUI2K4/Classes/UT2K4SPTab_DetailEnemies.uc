/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_DetailEnemies.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4SPTab_DetailEnemies extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgFoesBG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbdDetails;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUI2K4MultiColumnListBox mclFoes;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPicture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox cbDescription;
var localized array<localized string> StrengthLabels;
var array<TeamStatsRecord> TeamStats;
var array< class<UT2K4TeamRoster> > TeamRosters;
var string TeamDetailPage;
var localized string ColumnHeadings[5];
var localized string msgMembers;
var export editinline GUIStyles SelStyle;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    mclFoes.List.__OnDrawItem__Delegate = OnDrawFoesList;
    mclFoes.List.ExpandLastColumn = true;
    mclFoes.List.ColumnHeadings[0] = ColumnHeadings[0];
    mclFoes.List.ColumnHeadings[1] = ColumnHeadings[1];
    mclFoes.List.ColumnHeadings[2] = ColumnHeadings[2];
    mclFoes.List.ColumnHeadings[3] = ColumnHeadings[3];
    mclFoes.List.ColumnHeadings[4] = ColumnHeadings[4];
    mclFoes.List.InitColumnPerc[0] = 0.30;
    mclFoes.List.InitColumnPerc[1] = 0.150;
    mclFoes.List.InitColumnPerc[2] = 0.150;
    mclFoes.List.InitColumnPerc[3] = 0.20;
    mclFoes.List.InitColumnPerc[4] = 0.20;
    // End:0x32b
    if(GP != none)
    {
        i = 0;
        J0x1a2:
        // End:0x32b [While If]
        if(i < GP.TeamStats.Length)
        {
            // End:0x321
            if(GP.TeamStats[i].Matches > 0 && GP.TeamStats[i].Name != "")
            {
                TeamStats.Length = TeamStats.Length + 1;
                TeamStats[TeamStats.Length - 1] = GP.TeamStats[i];
                TeamStats[TeamStats.Length - 1].Level = int(float(TeamStats[TeamStats.Length - 1].Level + StrengthLabels.Length) % float(StrengthLabels.Length));
                TeamRosters.Length = TeamStats.Length;
                TeamRosters[TeamStats.Length - 1] = class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, class'Class'));
                // End:0x309
                if(TeamRosters[TeamStats.Length - 1] == none)
                {
                    Warn("Failed spawning UT2K4TeamRoster:" @ GP.TeamStats[i].Name);
                }
                mclFoes.List.AddedItem();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1a2;
        }
    }
    mclFoes.List.SortList();
    mclFoes.List.__OnChange__Delegate = OnTeamSelect;
    SelStyle = Controller.GetStyle(mclFoes.SelectedStyleName, mclFoes.FontScale);
}

function OnDrawFoesList(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;
    local export editinline GUIStyles curstyle;

    // End:0x4d
    if(bSelected)
    {
        SelStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
        curstyle = SelStyle;
    }
    // End:0x6a
    else
    {
        curstyle = mclFoes.List.Style;
    }
    i = mclFoes.List.SortData[i].SortItem;
    // End:0xa5
    if(TeamRosters[i] == none)
    {
        return;
    }
    mclFoes.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, TeamRosters[i].default.TeamName, mclFoes.List.FontScale);
    mclFoes.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].Matches), XL, YL, mclFoes.List.FontScale);
    // End:0x25c
    if(CellLeft + XL <= mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth())
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].Matches), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].Won), XL, YL, mclFoes.List.FontScale);
    // End:0x385
    if(CellLeft + XL <= mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth())
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].Won), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].rating), XL, YL, mclFoes.List.FontScale);
    // End:0x4ae
    if(CellLeft + XL <= mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth())
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].rating), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(4, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, StrengthLabels[TeamStats[i].Level], XL, YL, mclFoes.List.FontScale);
    // End:0x5df
    if(CellLeft + XL <= mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth())
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, StrengthLabels[TeamStats[i].Level], mclFoes.List.FontScale);
    }
}

function onCmFoesClick(GUIContextMenu Sender, int ClickIndex)
{
    local int i;

    // End:0x75
    if(ClickIndex == 0)
    {
        i = mclFoes.List.SortData[mclFoes.List.Index].SortItem;
        // End:0x75
        if(TeamStats.Length > 0)
        {
            Controller.OpenMenu(TeamDetailPage, TeamStats[i].Name);
        }
    }
}

function string mclFoesOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    local string S;

    switch(Column)
    {
        // End:0x28
        case 0:
            S = TeamRosters[Item].default.TeamName;
            // End:0xef
            break;
        // End:0x58
        case 1:
            S = string(TeamStats[Item].Matches);
            PadLeft(S, 5, "0");
            // End:0xef
            break;
        // End:0x89
        case 2:
            S = string(TeamStats[Item].Won);
            PadLeft(S, 5, "0");
            // End:0xef
            break;
        // End:0xbb
        case 3:
            S = string(TeamStats[Item].rating * float(1000) + float(100000));
            // End:0xef
            break;
        // End:0xec
        case 4:
            S = string(TeamStats[Item].Level);
            PadLeft(S, 5, "0");
            // End:0xef
            break;
        // End:0xffff
        default:
            return S;
    }
}

function OnTeamSelect(GUIComponent Sender)
{
    local int i;

    i = mclFoes.List.SortData[mclFoes.List.Index].SortItem;
    // End:0x71
    if(i < TeamStats.Length && i > -1)
    {
        ShowTeamDetails(TeamStats[i].Name);
    }
}

function ShowTeamDetails(string TeamName)
{
    local class<UT2K4TeamRoster> ETI;
    local array<string> TeamMembers;
    local string TeamDesc;

    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(TeamName, class'Class'));
    // End:0x5d
    if(ETI == none)
    {
        Warn(TeamName @ "is not a valid subclass of UT2K4TeamRoster");
        return;
    }
    sbdDetails.Caption = ETI.default.TeamName;
    // End:0xbd
    if(ETI.default.TeamSymbolName != "")
    {
        imgPicture.Image = Material(DynamicLoadObject(ETI.default.TeamSymbolName, class'Material', true));
    }
    // End:0xef
    if(!GP.GetAltTeamRoster(TeamName, TeamMembers))
    {
        TeamMembers = ETI.default.RosterNames;
    }
    TeamDesc = ETI.default.TeamDescription;
    // End:0x135
    if(TeamMembers.Length != 0)
    {
        TeamDesc @= "||" $ msgMembers @ JoinArray(TeamMembers, ", ", true);
    }
    cbDescription.SetContent(TeamDesc);
    // End:0x182
    if(ETI.default.VoiceOver != none)
    {
        PlayerOwner().PlayOwnedSound(ETI.default.VoiceOver, 6, 1.0);
    }
    // End:0x1b8
    else
    {
        // End:0x1b8
        if(ETI.default.TeamNameSound != none)
        {
            PlayerOwner().PlayOwnedSound(ETI.default.TeamNameSound, 6, 1.0);
        }
    }
}

defaultproperties
{
    begin object name=SPPsbgFoesBG class=GUISectionBackground
        Caption="? ?"
        WinTop=0.6165870
        WinLeft=0.080
        WinWidth=0.82750
        WinHeight=0.3562490
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_DetailEnemies.SPPsbgFoesBG'
    sbgFoesBG=SPPsbgFoesBG
    begin object name=SPPsbdDetails class=AltSectionBackground
        WinTop=0.03650
        WinLeft=0.082750
        WinWidth=0.8207510
        WinHeight=0.5520
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_DetailEnemies.SPPsbdDetails'
    sbdDetails=SPPsbdDetails
    begin object name=SPDEmclFoes class=GUI2K4MultiColumnListBox
        OnGetSortString=mclFoesOnGetSortString
        SelectedStyleName="ListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.6754110
        WinLeft=0.0978320
        WinWidth=0.7918370
        WinHeight=0.2678560
        RenderWeight=0.20
        bBoundToParent=true
        OnChange=OnTeamSelect
    object end
    // Reference: GUI2K4MultiColumnListBox'UT2K4SPTab_DetailEnemies.SPDEmclFoes'
    mclFoes=SPDEmclFoes
    begin object name=SPDTimgPicture class=GUIImage
        ImageStyle=4
        ImageAlign=1
        WinTop=0.1051630
        WinLeft=0.1012760
        WinWidth=0.3188780
        WinHeight=0.4170910
        RenderWeight=0.30
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SPTab_DetailEnemies.SPDTimgPicture'
    imgPicture=SPDTimgPicture
    begin object name=SPDTcbDescription class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1089980
        WinLeft=0.4311230
        WinWidth=0.4562490
        WinHeight=0.41250
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SPTab_DetailEnemies.SPDTcbDescription'
    cbDescription=SPDTcbDescription
    StrengthLabels=// Object reference not set to an instance of an object.
    
    TeamDetailPage="GUI2K4.UT2K4SP_DetailsTeam"
    ColumnHeadings[0]="??"
    ColumnHeadings[1]="?? ??"
    ColumnHeadings[2]="?? ??"
    ColumnHeadings[3]="??"
    ColumnHeadings[4]="?? ??"
    msgMembers="??:"
    PanelCaption="?? ??"
    begin object name=SPDEcmFoes class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=onCmFoesClick
    object end
    // Reference: GUIContextMenu'UT2K4SPTab_DetailEnemies.SPDEcmFoes'
    ContextMenu=SPDEcmFoes
}