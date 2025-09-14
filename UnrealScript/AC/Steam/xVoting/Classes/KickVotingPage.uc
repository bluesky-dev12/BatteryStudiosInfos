/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\KickVotingPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:8
 *
 *******************************************************************************/
class KickVotingPage extends VotingPage
    dependson(VotingPage)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_List;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify KickVoteMultiColumnListBox lb_PlayerListBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_PlayerListTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Info;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Kick;
var localized string lmsgKickVotingDisabled;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    sb_List.ManageComponent(lb_PlayerListBox);
    sb_List.ImageOffset[1] = 8.0;
}

function InternalOnOpen()
{
    // End:0xa4
    if(MVRI == none || MVRI != none && !MVRI.bKickVote)
    {
        Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage");
        GUIQuestionPage(Controller.TopPage()).SetupQuestion(lmsgKickVotingDisabled, 1, 1);
        GUIQuestionPage(Controller.TopPage()).__OnButtonClick__Delegate = OnOkButtonClick;
        return;
    }
    lb_PlayerListBox.List.__OnDblClick__Delegate = PlayerListDblClick;
    KickVoteMultiColumnList(lb_PlayerListBox.List).LoadPlayerList(MVRI);
    f_Chat.__OnSubmit__Delegate = SendKickVote;
    f_Chat.WinTop = 0.5614570;
    f_Chat.WinHeight = 0.4320310;
}

function OnOkButtonClick(byte bButton)
{
    Controller.CloseAll(true, true);
}

function UpdateKickVoteCount(KickVoteScore KVCData)
{
    KickVoteMultiColumnList(lb_PlayerListBox.List).UpdatedVoteCount(KVCData.PlayerID, KVCData.KickVoteCount);
}

function bool PlayerListDblClick(GUIComponent Sender)
{
    SendKickVote();
    return true;
}

function SendKickVote()
{
    local int PlayerID;

    PlayerID = KickVoteMultiColumnList(lb_PlayerListBox.List).GetSelectedPlayerID();
    // End:0x46
    if(PlayerID > -1)
    {
        MVRI.SendKickVote(PlayerID);
    }
}

function bool InfoClick(GUIComponent Sender)
{
    lb_PlayerListBox.InternalOnClick(lb_PlayerListBox.ContextMenu, 1);
    return true;
}

function bool KickClick(GUIComponent Sender)
{
    lb_PlayerListBox.InternalOnClick(lb_PlayerListBox.ContextMenu, 0);
    return true;
}

defaultproperties
{
    begin object name=ListBackground class=AltSectionBackground
        bFillClient=true
        WinTop=0.0520830
        WinLeft=0.0234380
        WinWidth=0.9531250
        WinHeight=0.4613570
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'KickVotingPage.ListBackground'
    sb_List=ListBackground
    begin object name=PlayerListBoxControl class=KickVoteMultiColumnListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1622390
        WinLeft=0.2541410
        WinWidth=0.4730470
        WinHeight=0.4817580
        OnRightClick=InternalOnRightClick
    object end
    // Reference: KickVoteMultiColumnListBox'KickVotingPage.PlayerListBoxControl'
    lb_PlayerListBox=PlayerListBoxControl
    begin object name=InfoButton class=GUIButton
        Caption="Info"
        WinTop=0.5110820
        WinLeft=0.5506340
        WinWidth=0.1600750
        TabOrder=1
        bStandardized=true
        OnClick=InfoClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'KickVotingPage.InfoButton'
    b_Info=InfoButton
    begin object name=KickButton class=GUIButton
        Caption="Kick"
        WinTop=0.5110820
        WinLeft=0.7154110
        WinWidth=0.1377440
        TabOrder=1
        bStandardized=true
        OnClick=KickClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'KickVotingPage.KickButton'
    b_Kick=KickButton
    lmsgKickVotingDisabled="?? ???? ????? ????? ???????!"
    WindowName="Kick Voting"
    OnOpen=InternalOnOpen
}