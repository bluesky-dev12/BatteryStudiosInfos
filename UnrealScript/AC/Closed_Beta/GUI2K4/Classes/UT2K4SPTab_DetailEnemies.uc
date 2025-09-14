class UT2K4SPTab_DetailEnemies extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUISectionBackground sbgFoesBG;
var() automated GUISectionBackground sbdDetails;
var() automated GUI2K4MultiColumnListBox mclFoes;
var() automated GUIImage imgPicture;
var() automated GUIButton btnOk;
var() automated GUIScrollTextBox cbDescription;
var localized array<localized string> StrengthLabels;
var array<TeamStatsRecord> TeamStats;
var array< Class<UT2K4TeamRoster> > TeamRosters;
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
    mclFoes.List.InitColumnPerc[0] = 0.3000000;
    mclFoes.List.InitColumnPerc[1] = 0.1500000;
    mclFoes.List.InitColumnPerc[2] = 0.1500000;
    mclFoes.List.InitColumnPerc[3] = 0.2000000;
    mclFoes.List.InitColumnPerc[4] = 0.2000000;
    // End:0x32B
    if(GP != none)
    {
        i = 0;
        J0x1A2:

        // End:0x32B [Loop If]
        if(i < GP.TeamStats.Length)
        {
            // End:0x321
            if((GP.TeamStats[i].Matches > 0) && GP.TeamStats[i].Name != "")
            {
                TeamStats.Length = TeamStats.Length + 1;
                TeamStats[TeamStats.Length - 1] = GP.TeamStats[i];
                TeamStats[TeamStats.Length - 1].Level = int(float(TeamStats[TeamStats.Length - 1].Level + StrengthLabels.Length) % float(StrengthLabels.Length));
                TeamRosters.Length = TeamStats.Length;
                TeamRosters[TeamStats.Length - 1] = Class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, Class'Core.Class'));
                // End:0x309
                if(TeamRosters[TeamStats.Length - 1] == none)
                {
                    Warn("Failed spawning UT2K4TeamRoster:" @ GP.TeamStats[i].Name);
                }
                mclFoes.List.AddedItem();
            }
            i++;
            // [Loop Continue]
            goto J0x1A2;
        }
    }
    mclFoes.List.SortList();
    mclFoes.List.__OnChange__Delegate = OnTeamSelect;
    SelStyle = Controller.GetStyle(mclFoes.SelectedStyleName, mclFoes.FontScale);
    //return;    
}

function OnDrawFoesList(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, XL, YL;
    local export editinline GUIStyles curstyle;

    // End:0x4D
    if(bSelected)
    {
        SelStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
        curstyle = SelStyle;        
    }
    else
    {
        curstyle = mclFoes.List.Style;
    }
    i = mclFoes.List.SortData[i].SortItem;
    // End:0xA5
    if(TeamRosters[i] == none)
    {
        return;
    }
    mclFoes.List.GetCellLeftWidth(0, CellLeft, CellWidth);
    curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, TeamRosters[i].default.TeamName, mclFoes.List.FontScale);
    mclFoes.List.GetCellLeftWidth(1, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].Matches), XL, YL, mclFoes.List.FontScale);
    // End:0x25C
    if((CellLeft + XL) <= (mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth()))
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].Matches), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(2, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].Won), XL, YL, mclFoes.List.FontScale);
    // End:0x385
    if((CellLeft + XL) <= (mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth()))
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].Won), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(3, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, string(TeamStats[i].rating), XL, YL, mclFoes.List.FontScale);
    // End:0x4AE
    if((CellLeft + XL) <= (mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth()))
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, string(TeamStats[i].rating), mclFoes.List.FontScale);
    }
    mclFoes.List.GetCellLeftWidth(4, CellLeft, CellWidth);
    curstyle.TextSize(Canvas, mclFoes.List.MenuState, StrengthLabels[TeamStats[i].Level], XL, YL, mclFoes.List.FontScale);
    // End:0x5DF
    if((CellLeft + XL) <= (mclFoes.List.ActualLeft() + mclFoes.List.ActualWidth()))
    {
        curstyle.DrawText(Canvas, mclFoes.List.MenuState, CellLeft, Y, CellWidth, H, 0, StrengthLabels[TeamStats[i].Level], mclFoes.List.FontScale);
    }
    //return;    
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
    //return;    
}

function string mclFoesOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    local string S;

    switch(Column)
    {
        // End:0x28
        case 0:
            S = TeamRosters[Item].default.TeamName;
            // End:0xEF
            break;
        // End:0x58
        case 1:
            S = string(TeamStats[Item].Matches);
            PadLeft(S, 5, "0");
            // End:0xEF
            break;
        // End:0x89
        case 2:
            S = string(TeamStats[Item].Won);
            PadLeft(S, 5, "0");
            // End:0xEF
            break;
        // End:0xBB
        case 3:
            S = string((TeamStats[Item].rating * float(1000)) + float(100000));
            // End:0xEF
            break;
        // End:0xEC
        case 4:
            S = string(TeamStats[Item].Level);
            PadLeft(S, 5, "0");
            // End:0xEF
            break;
        // End:0xFFFF
        default:
            break;
    }
    return S;
    //return;    
}

function OnTeamSelect(GUIComponent Sender)
{
    local int i;

    i = mclFoes.List.SortData[mclFoes.List.Index].SortItem;
    // End:0x71
    if((i < TeamStats.Length) && i > -1)
    {
        ShowTeamDetails(TeamStats[i].Name);
    }
    //return;    
}

function ShowTeamDetails(string TeamName)
{
    local Class<UT2K4TeamRoster> ETI;
    local array<string> TeamMembers;
    local string TeamDesc;

    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(TeamName, Class'Core.Class'));
    // End:0x5D
    if(ETI == none)
    {
        Warn(TeamName @ "is not a valid subclass of UT2K4TeamRoster");
        return;
    }
    sbdDetails.Caption = ETI.default.TeamName;
    // End:0xBD
    if(ETI.default.TeamSymbolName != "")
    {
        imgPicture.Image = Material(DynamicLoadObject(ETI.default.TeamSymbolName, Class'Engine.Material', true));
    }
    // End:0xEF
    if(!GP.GetAltTeamRoster(TeamName, TeamMembers))
    {
        TeamMembers = ETI.default.RosterNames;
    }
    TeamDesc = ETI.default.TeamDescription;
    // End:0x135
    if(TeamMembers.Length != 0)
    {
        TeamDesc @= (("||" $ msgMembers) @ JoinArray(TeamMembers, ", ", true));
    }
    cbDescription.SetContent(TeamDesc);
    // End:0x182
    if(ETI.default.VoiceOver != none)
    {
        PlayerOwner().PlayOwnedSound(ETI.default.VoiceOver, 6, 1.0000000);        
    }
    else
    {
        // End:0x1B8
        if(ETI.default.TeamNameSound != none)
        {
            PlayerOwner().PlayOwnedSound(ETI.default.TeamNameSound, 6, 1.0000000);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPPsbgFoesBG'
    begin object name="SPPsbgFoesBG" class=XInterface.GUISectionBackground
        Caption="? ?"
        WinTop=0.6165870
        WinLeft=0.0800000
        WinWidth=0.8275000
        WinHeight=0.3562490
        bBoundToParent=true
        OnPreDraw=SPPsbgFoesBG.InternalPreDraw
    end object
    sbgFoesBG=SPPsbgFoesBG
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPPsbdDetails'
    begin object name="SPPsbdDetails" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.0365000
        WinLeft=0.0827500
        WinWidth=0.8207510
        WinHeight=0.5520000
        bBoundToParent=true
        OnPreDraw=SPPsbdDetails.InternalPreDraw
    end object
    sbdDetails=SPPsbdDetails
    // Reference: GUI2K4MultiColumnListBox'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPDEmclFoes'
    begin object name="SPDEmclFoes" class=GUI2K4_Decompressed.GUI2K4MultiColumnListBox
        OnGetSortString=UT2K4SPTab_DetailEnemies.mclFoesOnGetSortString
        SelectedStyleName="ListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=SPDEmclFoes.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.6754110
        WinLeft=0.0978320
        WinWidth=0.7918370
        WinHeight=0.2678560
        RenderWeight=0.2000000
        bBoundToParent=true
        OnChange=UT2K4SPTab_DetailEnemies.OnTeamSelect
    end object
    mclFoes=SPDEmclFoes
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPDTimgPicture'
    begin object name="SPDTimgPicture" class=XInterface.GUIImage
        ImageStyle=4
        ImageAlign=1
        WinTop=0.1051630
        WinLeft=0.1012760
        WinWidth=0.3188780
        WinHeight=0.4170910
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgPicture=SPDTimgPicture
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPDTcbDescription'
    begin object name="SPDTcbDescription" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=SPDTcbDescription.InternalOnCreateComponent
        WinTop=0.1089980
        WinLeft=0.4311230
        WinWidth=0.4562490
        WinHeight=0.4125000
        bBoundToParent=true
    end object
    cbDescription=SPDTcbDescription
    StrengthLabels[0]="??"
    StrengthLabels[1]="??"
    StrengthLabels[2]="??"
    StrengthLabels[3]="?? ??"
    StrengthLabels[4]="??"
    TeamDetailPage="GUI2K4.UT2K4SP_DetailsTeam"
    ColumnHeadings[0]="??"
    ColumnHeadings[1]="?? ??"
    ColumnHeadings[2]="?? ??"
    ColumnHeadings[3]="??"
    ColumnHeadings[4]="?? ??"
    msgMembers="??:"
    PanelCaption="?? ??"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies.SPDEcmFoes'
    begin object name="SPDEcmFoes" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=UT2K4SPTab_DetailEnemies.onCmFoesClick
    end object
    ContextMenu=SPDEcmFoes
}