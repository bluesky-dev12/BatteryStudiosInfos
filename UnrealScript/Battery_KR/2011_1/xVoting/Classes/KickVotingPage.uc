class KickVotingPage extends VotingPage
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_List;
var() automated KickVoteMultiColumnListBox lb_PlayerListBox;
var() automated GUILabel l_PlayerListTitle;
var() automated GUIButton b_Info;
var() automated GUIButton b_Kick;
var localized string lmsgKickVotingDisabled;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    sb_List.ManageComponent(lb_PlayerListBox);
    sb_List.ImageOffset[1] = 8.0000000;
    //return;    
}

function InternalOnOpen()
{
    // End:0xA4
    if((MVRI == none) || (MVRI != none) && !MVRI.bKickVote)
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
    //return;    
}

function OnOkButtonClick(byte bButton)
{
    Controller.CloseAll(true, true);
    //return;    
}

function UpdateKickVoteCount(KickVoteScore KVCData)
{
    KickVoteMultiColumnList(lb_PlayerListBox.List).UpdatedVoteCount(KVCData.PlayerID, KVCData.KickVoteCount);
    //return;    
}

function bool PlayerListDblClick(GUIComponent Sender)
{
    SendKickVote();
    return true;
    //return;    
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
    //return;    
}

function bool InfoClick(GUIComponent Sender)
{
    lb_PlayerListBox.InternalOnClick(lb_PlayerListBox.ContextMenu, 1);
    return true;
    //return;    
}

function bool KickClick(GUIComponent Sender)
{
    lb_PlayerListBox.InternalOnClick(lb_PlayerListBox.ContextMenu, 0);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'xVoting_Decompressed.KickVotingPage.ListBackground'
    begin object name="ListBackground" class=GUI2K4.AltSectionBackground
        bFillClient=true
        WinTop=0.0520830
        WinLeft=0.0234380
        WinWidth=0.9531250
        WinHeight=0.4613570
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=ListBackground.InternalPreDraw
    end object
    sb_List=ListBackground
    // Reference: KickVoteMultiColumnListBox'xVoting_Decompressed.KickVotingPage.PlayerListBoxControl'
    begin object name="PlayerListBoxControl" class=xVoting_Decompressed.KickVoteMultiColumnListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=PlayerListBoxControl.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1622390
        WinLeft=0.2541410
        WinWidth=0.4730470
        WinHeight=0.4817580
        OnRightClick=PlayerListBoxControl.InternalOnRightClick
    end object
    lb_PlayerListBox=PlayerListBoxControl
    // Reference: GUIButton'xVoting_Decompressed.KickVotingPage.InfoButton'
    begin object name="InfoButton" class=XInterface.GUIButton
        Caption="Info"
        WinTop=0.5110820
        WinLeft=0.5506340
        WinWidth=0.1600750
        TabOrder=1
        bStandardized=true
        OnClick=KickVotingPage.InfoClick
        OnKeyEvent=InfoButton.InternalOnKeyEvent
    end object
    b_Info=InfoButton
    // Reference: GUIButton'xVoting_Decompressed.KickVotingPage.KickButton'
    begin object name="KickButton" class=XInterface.GUIButton
        Caption="Kick"
        WinTop=0.5110820
        WinLeft=0.7154110
        WinWidth=0.1377440
        TabOrder=1
        bStandardized=true
        OnClick=KickVotingPage.KickClick
        OnKeyEvent=KickButton.InternalOnKeyEvent
    end object
    b_Kick=KickButton
    lmsgKickVotingDisabled="?? ???? ????? ????? ???????!"
    WindowName="Kick Voting"
    OnOpen=KickVotingPage.InternalOnOpen
}