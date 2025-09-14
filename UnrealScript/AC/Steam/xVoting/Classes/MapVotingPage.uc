/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVotingPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:8
 *
 *******************************************************************************/
class MapVotingPage extends VotingPage
    dependson(VotingPage)
    dependson(MapVoteMultiColumnListBox)
    dependson(MapVoteCountMultiColumnList)
    dependson(MapVoteMultiColumnList)
    dependson(MapVoteFooter)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MapVoteMultiColumnListBox lb_MapListBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify MapVoteCountMultiColumnListBox lb_VoteCountListBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GameType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Mode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapListBackground;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapCountListBackground;
var localized string lmsgMapVotingDisabled;
var localized string lmsgReplicationNotFinished;
var localized string lmsgMapDisabled;
var localized string lmsgTotalMaps;
var localized string lmsgMode[8];

function InternalOnOpen()
{
    local int i, D;

    // End:0xa4
    if(MVRI == none || MVRI != none && !MVRI.bMapVote)
    {
        Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage");
        GUIQuestionPage(Controller.TopPage()).SetupQuestion(lmsgMapVotingDisabled, 1, 1);
        GUIQuestionPage(Controller.TopPage()).__OnButtonClick__Delegate = OnOkButtonClick;
        return;
    }
    // End:0x160
    if(MVRI.GameConfig.Length < MVRI.GameConfigCount || MVRI.MapList.Length < MVRI.MapCount)
    {
        Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage");
        GUIQuestionPage(Controller.TopPage()).SetupQuestion(lmsgReplicationNotFinished, 1, 1);
        GUIQuestionPage(Controller.TopPage()).__OnButtonClick__Delegate = OnOkButtonClick;
        return;
    }
    i = 0;
    J0x167:
    // End:0x1ba [While If]
    if(i < MVRI.GameConfig.Length)
    {
        co_GameType.AddItem(MVRI.GameConfig[i].GameName, none, string(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x167;
    }
    co_GameType.MyComboBox.List.SortList();
    t_WindowTitle.Caption = t_WindowTitle.Caption @ "(" $ lmsgMode[MVRI.Mode] $ ")";
    lb_MapListBox.LoadList(MVRI);
    MapVoteCountMultiColumnList(lb_VoteCountListBox.List).LoadList(MVRI);
    lb_VoteCountListBox.List.__OnDblClick__Delegate = MapListDblClick;
    lb_VoteCountListBox.List.bDropTarget = true;
    lb_MapListBox.List.__OnDblClick__Delegate = MapListDblClick;
    lb_MapListBox.List.bDropSource = true;
    co_GameType.__OnChange__Delegate = GameTypeChanged;
    f_Chat.__OnSubmit__Delegate = Submit;
    D = co_GameType.MyComboBox.List.FindExtra(string(MVRI.CurrentGameConfig));
    // End:0x340
    if(D > -1)
    {
        co_GameType.SetIndex(D);
    }
}

function Submit()
{
    SendVote(none);
}

function GameTypeChanged(GUIComponent Sender)
{
    local int GameTypeIndex;

    GameTypeIndex = int(co_GameType.GetExtra());
    // End:0x57
    if(GameTypeIndex > -1)
    {
        lb_MapListBox.ChangeGameType(GameTypeIndex);
        lb_MapListBox.List.__OnDblClick__Delegate = MapListDblClick;
    }
}

function OnOkButtonClick(byte bButton)
{
    Controller.CloseMenu(true);
}

function UpdateMapVoteCount(int UpdatedIndex, bool bRemoved)
{
    MapVoteCountMultiColumnList(lb_VoteCountListBox.List).UpdatedVoteCount(UpdatedIndex, bRemoved);
}

function bool MapListDblClick(GUIComponent Sender)
{
    SendVote(Sender);
    return true;
}

function SendVote(GUIComponent Sender)
{
    local int MapIndex, GameConfigIndex;

    // End:0xd6
    if(Sender == lb_VoteCountListBox.List)
    {
        MapIndex = MapVoteCountMultiColumnList(lb_VoteCountListBox.List).GetSelectedMapIndex();
        // End:0xd3
        if(MapIndex > -1)
        {
            GameConfigIndex = MapVoteCountMultiColumnList(lb_VoteCountListBox.List).GetSelectedGameConfigIndex();
            // End:0xc1
            if(MVRI.MapList[MapIndex].bEnabled || PlayerOwner().PlayerReplicationInfo.bAdmin)
            {
                MVRI.SendMapVote(MapIndex, GameConfigIndex);
            }
            // End:0xd3
            else
            {
                PlayerOwner().ClientMessage(lmsgMapDisabled);
            }
        }
    }
    // End:0x185
    else
    {
        MapIndex = MapVoteMultiColumnList(lb_MapListBox.List).GetSelectedMapIndex();
        // End:0x185
        if(MapIndex > -1)
        {
            GameConfigIndex = int(co_GameType.GetExtra());
            // End:0x173
            if(MVRI.MapList[MapIndex].bEnabled || PlayerOwner().PlayerReplicationInfo.bAdmin)
            {
                MVRI.SendMapVote(MapIndex, GameConfigIndex);
            }
            // End:0x185
            else
            {
                PlayerOwner().ClientMessage(lmsgMapDisabled);
            }
        }
    }
}

function bool AlignBK(Canvas C)
{
    i_MapCountListBackground.WinWidth = lb_VoteCountListBox.MyList.ActualWidth();
    i_MapCountListBackground.WinHeight = lb_VoteCountListBox.MyList.ActualHeight();
    i_MapCountListBackground.WinLeft = lb_VoteCountListBox.MyList.ActualLeft();
    i_MapCountListBackground.WinTop = lb_VoteCountListBox.MyList.ActualTop();
    i_MapListBackground.WinWidth = lb_MapListBox.MyList.ActualWidth();
    i_MapListBackground.WinHeight = lb_MapListBox.MyList.ActualHeight();
    i_MapListBackground.WinLeft = lb_MapListBox.MyList.ActualLeft();
    i_MapListBackground.WinTop = lb_MapListBox.MyList.ActualTop();
    return false;
}

defaultproperties
{
    begin object name=MapListBox class=MapVoteMultiColumnListBox
        HeaderColumnPerc=// Object reference not set to an instance of an object.
        
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.371020
        WinLeft=0.020
        WinWidth=0.960
        WinHeight=0.2931040
        bBoundToParent=true
        bScaleToParent=true
        OnRightClick=InternalOnRightClick
    object end
    // Reference: MapVoteMultiColumnListBox'MapVotingPage.MapListBox'
    lb_MapListBox=MapListBox
    begin object name=VoteCountListBox class=MapVoteCountMultiColumnListBox
        HeaderColumnPerc=// Object reference not set to an instance of an object.
        
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.052930
        WinLeft=0.020
        WinWidth=0.960
        WinHeight=0.223770
        bBoundToParent=true
        bScaleToParent=true
        OnRightClick=InternalOnRightClick
    object end
    // Reference: MapVoteCountMultiColumnListBox'MapVotingPage.VoteCountListBox'
    lb_VoteCountListBox=VoteCountListBox
    begin object name=GameTypeCombo class=moComboBox
        CaptionWidth=0.350
        Caption="?? ?? ?????: "
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.3343090
        WinLeft=0.1992190
        WinWidth=0.7578090
        WinHeight=0.03750
        bScaleToParent=true
    object end
    // Reference: moComboBox'MapVotingPage.GameTypeCombo'
    co_GameType=GameTypeCombo
    begin object name=MapListBackground class=GUIImage
        ImageStyle=1
        WinTop=0.371020
        WinLeft=0.010
        WinWidth=0.980
        WinHeight=0.3165420
    object end
    // Reference: GUIImage'MapVotingPage.MapListBackground'
    i_MapListBackground=MapListBackground
    begin object name=MapCountListBackground class=GUIImage
        ImageStyle=1
        WinTop=0.052930
        WinLeft=0.010
        WinWidth=0.980
        WinHeight=0.223770
        OnDraw=AlignBK
    object end
    // Reference: GUIImage'MapVotingPage.MapCountListBackground'
    i_MapCountListBackground=MapCountListBackground
    lmsgMapVotingDisabled="?? ???? ? ??? ????? ???????!"
    lmsgReplicationNotFinished="? ??? ???? ?. ??? ?? ?????."
    lmsgMapDisabled="??? ?? ??? ? ????."
    lmsgTotalMaps="%mapcount% ?? ?"
    lmsgMode[0]="?? ??"
    lmsgMode[1]="?? ??? ?? ??"
    lmsgMode[2]="?? ??"
    lmsgMode[3]="?? ??? ?? ??"
    lmsgMode[4]="?? ??? ?? ??"
    lmsgMode[5]="?? ??, ?? ??, ?? ??"
    lmsgMode[6]="?? ??? ?? ??"
    lmsgMode[7]="?? ??, ?? ??, ?? ??"
    WindowName="Map Voting"
    OnOpen=InternalOnOpen
}