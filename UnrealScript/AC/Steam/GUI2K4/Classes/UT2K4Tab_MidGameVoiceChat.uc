/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MidGameVoiceChat.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:21
 *	Functions:27
 *
 *******************************************************************************/
class UT2K4Tab_MidGameVoiceChat extends MidGamePanel
    editinlinenew
    instanced;

struct ChatItem
{
    var int PlayerID;
    var bool bNoText;
    var bool bNoSpeech;
    var bool bNoVoice;
    var bool bBanned;
    var bool bDirty;
};

var array<ChatItem> ChatList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Players;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Specs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Options;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Players;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Specs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIList li_Players;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIList li_Specs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoVoiceChat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoSpeech;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoText;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Ban;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Reset;
var() int selectIndex;
var() localized string ApplySuccessText;
var() localized string ApplyFailText;
var() editconst bool bTeamGame;
var int RedTeamIndex;
var int BlueTeamIndex;
var localized string RedTeamDesc;
var localized string BlueTeamDesc;

function GameReplicationInfo GRI()
{
    return PlayerOwner().GameReplicationInfo;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    li_Players = lb_Players.List;
    li_Specs = lb_Specs.List;
    li_Players.bInitializeList = false;
    li_Specs.bInitializeList = false;
    sb_Players.ManageComponent(lb_Players);
    sb_Specs.ManageComponent(lb_Specs);
    sb_Options.ManageComponent(ch_NoText);
    sb_Options.ManageComponent(ch_NoSpeech);
    sb_Options.ManageComponent(ch_NoVoiceChat);
    sb_Options.ManageComponent(ch_Ban);
    AssociateButtons();
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x24
    if(!bShow)
    {
        ClearIndexes(none);
        SaveRestrictions();
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    SaveRestrictions();
    super(GUIMultiComponent).Closed(Sender, bCancelled);
}

function bool PreDraw(Canvas Canvas)
{
    // End:0x29
    if(GRI() != none)
    {
        bTeamGame = GRI().bTeamGame;
        FillPlayerLists();
    }
    return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x22
    if(Sender == b_Reset)
    {
        ResetRestrictions();
        ChatList.Remove(0, ChatList.Length);
    }
    UpdateButtonStates();
    return true;
}

function ListChange(GUIComponent Sender)
{
    local int id;
    local export editinline GUIList List;

    List = GUIListBox(Sender).List;
    // End:0x26
    if(List == none)
    {
        return;
    }
    ClearIndexes(List);
    id = int(List.GetExtra());
    // End:0x5e
    if(PlayerIDIsMine(id))
    {
        SelectedSelf();
        return;
    }
    selectIndex = FindChatListIndex(id);
    LoadRestrictions(selectIndex);
}

function InternalOnChange(GUIComponent Sender)
{
    local bool bResult;

    // End:0x12
    if(!ValidIndex(selectIndex))
    {
        return;
    }
    bResult = moCheckBox(Sender).IsChecked();
    ChatList[selectIndex].bDirty = true;
    switch(Sender)
    {
        // End:0x6a
        case ch_NoText:
            ChatList[selectIndex].bNoText = bResult;
            // End:0xd6
            break;
        // End:0x8d
        case ch_NoSpeech:
            ChatList[selectIndex].bNoSpeech = bResult;
            // End:0xd6
            break;
        // End:0xb0
        case ch_NoVoiceChat:
            ChatList[selectIndex].bNoVoice = bResult;
            // End:0xd6
            break;
        // End:0xd3
        case ch_Ban:
            ChatList[selectIndex].bBanned = bResult;
            // End:0xd6
            break;
        // End:0xffff
        default:
            // End:0x128
            if(ChatList[selectIndex].bDirty && ApplyRestriction(selectIndex))
            {
                ModifiedChatRestriction(self, ChatList[selectIndex].PlayerID);
                ChatList[selectIndex].bDirty = false;
            }
            UpdateButtonStates();
}

function FillPlayerLists()
{
    local string idx;

    // End:0x0e
    if(GRI() == none)
    {
        return;
    }
    // End:0x38
    if(li_Players.IsValid())
    {
        idx = li_Players.GetExtra();
    }
    // End:0x52
    else
    {
        // End:0x52
        if(li_Specs.IsValid())
        {
            idx = "";
        }
    }
    li_Players.bNotify = false;
    li_Specs.bNotify = false;
    ClearLists();
    PopulateLists(GRI());
    // End:0x123
    if(idx != "")
    {
        // End:0xdc
        if(li_Players.Find(idx, false, true) != "")
        {
            // End:0xd9
            if(!PlayerIDIsMine(int(idx)))
            {
                li_Players.CheckLinkedObjects(li_Players);
            }
        }
        // End:0x123
        else
        {
            // End:0x123
            if(li_Specs.Find(idx, false, true) != "")
            {
                // End:0x123
                if(!PlayerIDIsMine(int(idx)))
                {
                    li_Specs.CheckLinkedObjects(li_Specs);
                }
            }
        }
    }
    li_Players.bNotify = true;
    li_Specs.bNotify = true;
}

function PopulateLists(GameReplicationInfo GRI)
{
    local int i;
    local PlayerReplicationInfo PRI;

    // End:0x3e
    if(bTeamGame)
    {
        li_Players.Add(RedTeamDesc,,, true);
        li_Players.Add(BlueTeamDesc,,, true);
        BlueTeamIndex = 1;
    }
    i = 0;
    J0x45:
    // End:0x16d [While If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0xe3
        if(PRI == none || PRI.bBot || wPlayerReplicationInfo(PRI) == none || bTeamGame && PRI.Team == none && !PRI.bOnlySpectator)
        {
        }
        // End:0x163
        else
        {
            // End:0x115
            if(FindChatListIndex(PRI.PlayerID) == -1)
            {
                AddPlayerInfo(PRI.PlayerID);
            }
            // End:0x158
            if(PRI.bOnlySpectator)
            {
                li_Specs.Add(PRI.PlayerName,, string(PRI.PlayerID));
            }
            // End:0x163
            else
            {
                AddToPlayers(PRI);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
}

function AddToPlayers(PlayerReplicationInfo PRI)
{
    // End:0x137
    if(bTeamGame)
    {
        // End:0xcc
        if(PRI.Team.TeamIndex == 0)
        {
            // End:0x53
            if(RedTeamIndex == -1)
            {
                li_Players.Add(RedTeamDesc,,, true);
                RedTeamIndex = 0;
            }
            // End:0x8f
            if(BlueTeamIndex < 0)
            {
                li_Players.Add(PRI.PlayerName,, string(PRI.PlayerID));
            }
            // End:0xc9
            else
            {
                li_Players.Insert(BlueTeamIndex, PRI.PlayerName,, string(PRI.PlayerID));
                ++ BlueTeamIndex;
            }
        }
        // End:0x134
        else
        {
            // End:0x106
            if(BlueTeamIndex == -1)
            {
                BlueTeamIndex = li_Players.ItemCount;
                li_Players.Add(BlueTeamDesc,,, true);
            }
            li_Players.Add(PRI.PlayerName,, string(PRI.PlayerID));
        }
    }
    // End:0x165
    else
    {
        li_Players.Add(PRI.PlayerName,, string(PRI.PlayerID));
    }
}

function ClearIndexes(GUIList List)
{
    // End:0x23
    if(List != li_Players)
    {
        li_Players.SilentSetIndex(-1);
    }
    // End:0x46
    if(List != li_Specs)
    {
        li_Specs.SilentSetIndex(-1);
    }
    // End:0x57
    if(List == none)
    {
        SelectedSelf();
    }
}

function LoadRestrictions(int i)
{
    // End:0x5f
    if(!ValidIndex(i))
    {
        ch_NoText.SetComponentValue(string(false), true);
        ch_NoSpeech.SetComponentValue(string(false), true);
        ch_NoVoiceChat.SetComponentValue(string(false), true);
        ch_Ban.SetComponentValue(string(false), true);
    }
    // End:0xeb
    else
    {
        ch_NoText.SetComponentValue(string(ChatList[i].bNoText), true);
        ch_NoSpeech.SetComponentValue(string(ChatList[i].bNoSpeech), true);
        ch_NoVoiceChat.SetComponentValue(string(ChatList[i].bNoVoice), true);
        ch_Ban.SetComponentValue(string(ChatList[i].bBanned), true);
    }
    UpdateButtonStates();
}

function int AddPlayerInfo(int PlayerID)
{
    local int i;
    local PlayerController PC;
    local byte Restriction;

    PC = PlayerOwner();
    // End:0x23
    if(PC.ChatManager == none)
    {
        return -1;
    }
    i = FindChatListIndex(PlayerID);
    // End:0x5e
    if(i == -1)
    {
        i = ChatList.Length;
        ChatList.Length = i + 1;
    }
    ChatList[i].PlayerID = PlayerID;
    Restriction = PC.ChatManager.GetPlayerRestriction(PlayerID);
    UnpackRestriction(i, Restriction);
    return i;
}

function PackRestriction(int i, out byte Restriction)
{
    Restriction = 0;
    // End:0xb1
    if(ValidIndex(i))
    {
        // End:0x3c
        if(ChatList[i].bNoText)
        {
            Restriction = byte(Restriction | 1);
        }
        // End:0x63
        if(ChatList[i].bNoSpeech)
        {
            Restriction = byte(Restriction | 2);
        }
        // End:0x8a
        if(ChatList[i].bNoVoice)
        {
            Restriction = byte(Restriction | 4);
        }
        // End:0xb1
        if(ChatList[i].bBanned)
        {
            Restriction = byte(Restriction | 8);
        }
    }
}

function UnpackRestriction(int i, byte Restriction)
{
    // End:0x9c
    if(ValidIndex(i))
    {
        ChatList[i].bNoText = bool(Restriction & 1);
        ChatList[i].bNoSpeech = bool(Restriction & 2);
        ChatList[i].bNoVoice = bool(Restriction & 4);
        ChatList[i].bBanned = bool(Restriction & 8);
        ChatList[i].bDirty = false;
    }
}

function bool ApplyRestriction(int i)
{
    local byte Restriction;

    // End:0x41
    if(ValidIndex(i))
    {
        PackRestriction(i, Restriction);
        return PlayerOwner().ChatBan(ChatList[i].PlayerID, Restriction);
    }
    return false;
}

function SaveRestrictions()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x73 [While If]
    if(i < ChatList.Length)
    {
        // End:0x69
        if(ChatList[i].bDirty && ApplyRestriction(i))
        {
            ModifiedChatRestriction(self, ChatList[i].PlayerID);
            ChatList[i].bDirty = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ResetRestrictions()
{
    local int i;
    local byte Restriction;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < ChatList.Length)
    {
        PackRestriction(i, Restriction);
        // End:0x53
        if(Restriction != 0)
        {
            PlayerOwner().ChatBan(ChatList[i].PlayerID, 0);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    PlayerOwner().ChatManager.ClearConfig();
}

function UpdateChatRestriction(int PlayerID)
{
    local int i;

    super.UpdateChatRestriction(PlayerID);
    i = FindChatListIndex(PlayerID);
    // End:0x50
    if(ValidIndex(i))
    {
        UnpackRestriction(i, PlayerOwner().ChatManager.GetPlayerRestriction(PlayerID));
    }
    UpdateButtonStates();
}

function UpdateButtonStates()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    i = 0;
    J0x10:
    // End:0x4b [While If]
    if(i < ChatList.Length)
    {
        // End:0x41
        if(ChatList[i].bDirty)
        {
            EnableComponent(b_Reset);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10;
    }
    // End:0x99
    if(PC != none && PC.ChatManager != none && PC.ChatManager.Count() > 0)
    {
        EnableComponent(b_Reset);
        return;
    }
    DisableComponent(b_Reset);
}

function ClearLists()
{
    // End:0x23
    if(li_Players.ItemCount > 0)
    {
        li_Players.Clear();
    }
    // End:0x46
    if(li_Specs.ItemCount > 0)
    {
        li_Specs.Clear();
    }
}

function AssociateButtons()
{
    LinkList(li_Players);
    LinkList(li_Specs);
}

function LinkList(GUIList List)
{
    // End:0x0d
    if(List == none)
    {
        return;
    }
    List.AddLinkObject(ch_NoVoiceChat);
    List.AddLinkObject(ch_NoSpeech);
    List.AddLinkObject(ch_NoText);
    List.AddLinkObject(ch_Ban);
}

function int FindChatListIndex(int PlayerID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < ChatList.Length)
    {
        // End:0x37
        if(PlayerID == ChatList[i].PlayerID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool ValidIndex(int i)
{
    return i >= 0 && i < ChatList.Length;
}

function SelectedSelf()
{
    ch_NoText.SetComponentValue(string(false), true);
    ch_NoSpeech.SetComponentValue(string(false), true);
    ch_NoVoiceChat.SetComponentValue(string(false), true);
    ch_Ban.SetComponentValue(string(false), true);
    DisableComponent(ch_NoText);
    DisableComponent(ch_NoSpeech);
    DisableComponent(ch_NoVoiceChat);
    DisableComponent(ch_Ban);
}

defaultproperties
{
    begin object name=PlayersBackground class=AltSectionBackground
        Caption="????"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.0303250
        WinLeft=0.019250
        WinWidth=0.4620190
        WinHeight=0.8995060
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameVoiceChat.PlayersBackground'
    sb_Players=PlayersBackground
    begin object name=SpecBackground class=AltSectionBackground
        Caption="???"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.0303250
        WinLeft=0.5125440
        WinWidth=0.4620190
        WinHeight=0.4683850
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameVoiceChat.SpecBackground'
    sb_Specs=SpecBackground
    begin object name=OptionBackground class=AltSectionBackground
        Caption="??? ??"
        TopPadding=0.040
        WinTop=0.5080630
        WinLeft=0.5125440
        WinWidth=0.4620190
        WinHeight=0.3943910
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameVoiceChat.OptionBackground'
    sb_Options=OptionBackground
    begin object name=PlayersList class=GUIListBox
        bInitializeList=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0416670
        WinLeft=0.056250
        WinWidth=0.431250
        WinHeight=0.518750
        TabOrder=0
        OnChange=ListChange
    object end
    // Reference: GUIListBox'UT2K4Tab_MidGameVoiceChat.PlayersList'
    lb_Players=PlayersList
    begin object name=SpecList class=GUIListBox
        bInitializeList=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0416670
        WinLeft=0.531250
        WinWidth=0.431250
        WinHeight=0.518750
        TabOrder=1
        OnChange=ListChange
    object end
    // Reference: GUIListBox'UT2K4Tab_MidGameVoiceChat.SpecList'
    lb_Specs=SpecList
    begin object name=NoVoiceChat class=moCheckBox
        Caption="??? ?? ??? ????"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ??? ?? ???? ?? ?????. (?? ??? ????? ???)"
        WinTop=0.7501780
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.049840
        TabOrder=4
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_MidGameVoiceChat.NoVoiceChat'
    ch_NoVoiceChat=NoVoiceChat
    begin object name=NOSPEECH class=moCheckBox
        Caption="?? ??? ????"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ?? ???? ?? ?????"
        WinTop=0.6854240
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.049840
        TabOrder=3
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_MidGameVoiceChat.NOSPEECH'
    ch_NoSpeech=NOSPEECH
    begin object name=NOTEXT class=moCheckBox
        Caption="?? ??? ????"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ?? ???? ?? ?????"
        WinTop=0.620670
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.049840
        TabOrder=2
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_MidGameVoiceChat.NOTEXT'
    ch_NoText=NOTEXT
    begin object name=BanPlayer class=moCheckBox
        Caption="???? ??"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ??? ?? ??? ???? ???? ??????."
        WinTop=0.8149320
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.049840
        TabOrder=5
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'UT2K4Tab_MidGameVoiceChat.BanPlayer'
    ch_Ban=BanPlayer
    begin object name=ResetButton class=GUIButton
        Caption="???"
        MenuState=4
        Hint="??? ?? ???? ???? ??? ???.."
        WinTop=0.8996680
        WinLeft=0.6827450
        WinWidth=0.1200670
        WinHeight=0.0518360
        TabOrder=7
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MidGameVoiceChat.ResetButton'
    b_Reset=ResetButton
    ApplySuccessText="????? ???????!"
    ApplyFailText="??? ? ????!"
    RedTeamIndex=-1
    BlueTeamIndex=-1
    RedTeamDesc="??"
    BlueTeamDesc="??"
    OnPreDraw=PreDraw
}