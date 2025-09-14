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
var() automated GUISectionBackground sb_Players;
var() automated GUISectionBackground sb_Specs;
var() automated GUISectionBackground sb_Options;
var() automated GUIListBox lb_Players;
var() automated GUIListBox lb_Specs;
var() automated GUIList li_Players;
var() automated GUIList li_Specs;
var() automated moCheckBox ch_NoVoiceChat;
var() automated moCheckBox ch_NoSpeech;
var() automated moCheckBox ch_NoText;
var() automated moCheckBox ch_Ban;
var() automated GUIButton b_Reset;
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
    //return;    
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
    //return;    
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
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    SaveRestrictions();
    super(GUIMultiComponent).Closed(Sender, bCancelled);
    //return;    
}

function bool PreDraw(Canvas Canvas)
{
    // End:0x29
    if((GRI()) != none)
    {
        bTeamGame = GRI().bTeamGame;
        FillPlayerLists();
    }
    return false;
    //return;    
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
    //return;    
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
    // End:0x5E
    if(PlayerIDIsMine(id))
    {
        SelectedSelf();
        return;
    }
    selectIndex = FindChatListIndex(id);
    LoadRestrictions(selectIndex);
    //return;    
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
        // End:0x6A
        case ch_NoText:
            ChatList[selectIndex].bNoText = bResult;
            // End:0xD6
            break;
        // End:0x8D
        case ch_NoSpeech:
            ChatList[selectIndex].bNoSpeech = bResult;
            // End:0xD6
            break;
        // End:0xB0
        case ch_NoVoiceChat:
            ChatList[selectIndex].bNoVoice = bResult;
            // End:0xD6
            break;
        // End:0xD3
        case ch_Ban:
            ChatList[selectIndex].bBanned = bResult;
            // End:0xD6
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x128
    if(ChatList[selectIndex].bDirty && ApplyRestriction(selectIndex))
    {
        ModifiedChatRestriction(self, ChatList[selectIndex].PlayerID);
        ChatList[selectIndex].bDirty = false;
    }
    UpdateButtonStates();
    //return;    
}

function FillPlayerLists()
{
    local string idx;

    // End:0x0E
    if((GRI()) == none)
    {
        return;
    }
    // End:0x38
    if(li_Players.IsValid())
    {
        idx = li_Players.GetExtra();        
    }
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
        // End:0xDC
        if(li_Players.Find(idx, false, true) != "")
        {
            // End:0xD9
            if(!PlayerIDIsMine(int(idx)))
            {
                li_Players.CheckLinkedObjects(li_Players);
            }            
        }
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
    //return;    
}

function PopulateLists(GameReplicationInfo GRI)
{
    local int i;
    local PlayerReplicationInfo PRI;

    // End:0x3E
    if(bTeamGame)
    {
        li_Players.Add(RedTeamDesc,,, true);
        li_Players.Add(BlueTeamDesc,,, true);
        BlueTeamIndex = 1;
    }
    i = 0;
    J0x45:

    // End:0x16D [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0xE3
        if((((PRI == none) || PRI.bBot) || wPlayerReplicationInfo(PRI) == none) || (bTeamGame && PRI.Team == none) && !PRI.bOnlySpectator)
        {
            // [Explicit Continue]
            goto J0x163;
        }
        // End:0x115
        if((FindChatListIndex(PRI.PlayerID)) == -1)
        {
            AddPlayerInfo(PRI.PlayerID);
        }
        // End:0x158
        if(PRI.bOnlySpectator)
        {
            li_Specs.Add(PRI.PlayerName,, string(PRI.PlayerID));
            // [Explicit Continue]
            goto J0x163;
        }
        AddToPlayers(PRI);
        J0x163:

        i++;
        // [Loop Continue]
        goto J0x45;
    }
    //return;    
}

function AddToPlayers(PlayerReplicationInfo PRI)
{
    // End:0x137
    if(bTeamGame)
    {
        // End:0xCC
        if(PRI.Team.TeamIndex == 0)
        {
            // End:0x53
            if(RedTeamIndex == -1)
            {
                li_Players.Add(RedTeamDesc,,, true);
                RedTeamIndex = 0;
            }
            // End:0x8F
            if(BlueTeamIndex < 0)
            {
                li_Players.Add(PRI.PlayerName,, string(PRI.PlayerID));                
            }
            else
            {
                li_Players.Insert(BlueTeamIndex, PRI.PlayerName,, string(PRI.PlayerID));
                BlueTeamIndex++;
            }            
        }
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
    else
    {
        li_Players.Add(PRI.PlayerName,, string(PRI.PlayerID));
    }
    //return;    
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
    //return;    
}

function LoadRestrictions(int i)
{
    // End:0x5F
    if(!ValidIndex(i))
    {
        ch_NoText.SetComponentValue(string(false), true);
        ch_NoSpeech.SetComponentValue(string(false), true);
        ch_NoVoiceChat.SetComponentValue(string(false), true);
        ch_Ban.SetComponentValue(string(false), true);        
    }
    else
    {
        ch_NoText.SetComponentValue(string(ChatList[i].bNoText), true);
        ch_NoSpeech.SetComponentValue(string(ChatList[i].bNoSpeech), true);
        ch_NoVoiceChat.SetComponentValue(string(ChatList[i].bNoVoice), true);
        ch_Ban.SetComponentValue(string(ChatList[i].bBanned), true);
    }
    UpdateButtonStates();
    //return;    
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
    // End:0x5E
    if(i == -1)
    {
        i = ChatList.Length;
        ChatList.Length = i + 1;
    }
    ChatList[i].PlayerID = PlayerID;
    Restriction = PC.ChatManager.GetPlayerRestriction(PlayerID);
    UnpackRestriction(i, Restriction);
    return i;
    //return;    
}

function PackRestriction(int i, out byte Restriction)
{
    Restriction = 0;
    // End:0xB1
    if(ValidIndex(i))
    {
        // End:0x3C
        if(ChatList[i].bNoText)
        {
            Restriction = byte(int(Restriction) | 1);
        }
        // End:0x63
        if(ChatList[i].bNoSpeech)
        {
            Restriction = byte(int(Restriction) | 2);
        }
        // End:0x8A
        if(ChatList[i].bNoVoice)
        {
            Restriction = byte(int(Restriction) | 4);
        }
        // End:0xB1
        if(ChatList[i].bBanned)
        {
            Restriction = byte(int(Restriction) | 8);
        }
    }
    //return;    
}

function UnpackRestriction(int i, byte Restriction)
{
    // End:0x9C
    if(ValidIndex(i))
    {
        ChatList[i].bNoText = bool(int(Restriction) & 1);
        ChatList[i].bNoSpeech = bool(int(Restriction) & 2);
        ChatList[i].bNoVoice = bool(int(Restriction) & 4);
        ChatList[i].bBanned = bool(int(Restriction) & 8);
        ChatList[i].bDirty = false;
    }
    //return;    
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
    //return;    
}

function SaveRestrictions()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x73 [Loop If]
    if(i < ChatList.Length)
    {
        // End:0x69
        if(ChatList[i].bDirty && ApplyRestriction(i))
        {
            ModifiedChatRestriction(self, ChatList[i].PlayerID);
            ChatList[i].bDirty = false;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ResetRestrictions()
{
    local int i;
    local byte Restriction;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < ChatList.Length)
    {
        PackRestriction(i, Restriction);
        // End:0x53
        if(int(Restriction) != 0)
        {
            PlayerOwner().ChatBan(ChatList[i].PlayerID, 0);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    PlayerOwner().ChatManager.ClearConfig();
    //return;    
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
    //return;    
}

function UpdateButtonStates()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    i = 0;
    J0x10:

    // End:0x4B [Loop If]
    if(i < ChatList.Length)
    {
        // End:0x41
        if(ChatList[i].bDirty)
        {
            EnableComponent(b_Reset);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x10;
    }
    // End:0x99
    if(((PC != none) && PC.ChatManager != none) && PC.ChatManager.Count() > 0)
    {
        EnableComponent(b_Reset);
        return;
    }
    DisableComponent(b_Reset);
    //return;    
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
    //return;    
}

function AssociateButtons()
{
    LinkList(li_Players);
    LinkList(li_Specs);
    //return;    
}

function LinkList(GUIList List)
{
    // End:0x0D
    if(List == none)
    {
        return;
    }
    List.AddLinkObject(ch_NoVoiceChat);
    List.AddLinkObject(ch_NoSpeech);
    List.AddLinkObject(ch_NoText);
    List.AddLinkObject(ch_Ban);
    //return;    
}

function int FindChatListIndex(int PlayerID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < ChatList.Length)
    {
        // End:0x37
        if(PlayerID == ChatList[i].PlayerID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool ValidIndex(int i)
{
    return (i >= 0) && i < ChatList.Length;
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.PlayersBackground'
    begin object name="PlayersBackground" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="????"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.0303250
        WinLeft=0.0192500
        WinWidth=0.4620190
        WinHeight=0.8995060
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=PlayersBackground.InternalPreDraw
    end object
    sb_Players=PlayersBackground
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.SpecBackground'
    begin object name="SpecBackground" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="???"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.0303250
        WinLeft=0.5125440
        WinWidth=0.4620190
        WinHeight=0.4683850
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=SpecBackground.InternalPreDraw
    end object
    sb_Specs=SpecBackground
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.OptionBackground'
    begin object name="OptionBackground" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="??? ??"
        TopPadding=0.0400000
        WinTop=0.5080630
        WinLeft=0.5125440
        WinWidth=0.4620190
        WinHeight=0.3943910
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=OptionBackground.InternalPreDraw
    end object
    sb_Options=OptionBackground
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.PlayersList'
    begin object name="PlayersList" class=XInterface.GUIListBox
        bInitializeList=false
        OnCreateComponent=PlayersList.InternalOnCreateComponent
        WinTop=0.0416670
        WinLeft=0.0562500
        WinWidth=0.4312500
        WinHeight=0.5187500
        TabOrder=0
        OnChange=UT2K4Tab_MidGameVoiceChat.ListChange
    end object
    lb_Players=PlayersList
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.SpecList'
    begin object name="SpecList" class=XInterface.GUIListBox
        bInitializeList=false
        OnCreateComponent=SpecList.InternalOnCreateComponent
        WinTop=0.0416670
        WinLeft=0.5312500
        WinWidth=0.4312500
        WinHeight=0.5187500
        TabOrder=1
        OnChange=UT2K4Tab_MidGameVoiceChat.ListChange
    end object
    lb_Specs=SpecList
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.NoVoiceChat'
    begin object name="NoVoiceChat" class=XInterface.moCheckBox
        Caption="??? ?? ??? ????"
        OnCreateComponent=NoVoiceChat.InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ??? ?? ???? ?? ?????. (?? ??? ????? ???)"
        WinTop=0.7501780
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.0498400
        TabOrder=4
        OnChange=UT2K4Tab_MidGameVoiceChat.InternalOnChange
    end object
    ch_NoVoiceChat=NoVoiceChat
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.NOSPEECH'
    begin object name="NOSPEECH" class=XInterface.moCheckBox
        Caption="?? ??? ????"
        OnCreateComponent=NOSPEECH.InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ?? ???? ?? ?????"
        WinTop=0.6854240
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.0498400
        TabOrder=3
        OnChange=UT2K4Tab_MidGameVoiceChat.InternalOnChange
    end object
    ch_NoSpeech=NOSPEECH
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.NOTEXT'
    begin object name="NOTEXT" class=XInterface.moCheckBox
        Caption="?? ??? ????"
        OnCreateComponent=NOTEXT.InternalOnCreateComponent
        MenuState=4
        Hint="? ???????? ?? ???? ?? ?????"
        WinTop=0.6206700
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.0498400
        TabOrder=2
        OnChange=UT2K4Tab_MidGameVoiceChat.InternalOnChange
    end object
    ch_NoText=NOTEXT
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.BanPlayer'
    begin object name="BanPlayer" class=XInterface.moCheckBox
        Caption="???? ??"
        OnCreateComponent=BanPlayer.InternalOnCreateComponent
        MenuState=4
        Hint="? ????? ??? ??? ?? ??? ???? ???? ??????."
        WinTop=0.8149320
        WinLeft=0.6478840
        WinWidth=0.3385240
        WinHeight=0.0498400
        TabOrder=5
        OnChange=UT2K4Tab_MidGameVoiceChat.InternalOnChange
    end object
    ch_Ban=BanPlayer
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MidGameVoiceChat.ResetButton'
    begin object name="ResetButton" class=XInterface.GUIButton
        Caption="???"
        MenuState=4
        Hint="??? ?? ???? ???? ??? ???.."
        WinTop=0.8996680
        WinLeft=0.6827450
        WinWidth=0.1200670
        WinHeight=0.0518360
        TabOrder=7
        bStandardized=true
        OnClick=UT2K4Tab_MidGameVoiceChat.InternalOnClick
        OnKeyEvent=ResetButton.InternalOnKeyEvent
    end object
    b_Reset=ResetButton
    ApplySuccessText="????? ???????!"
    ApplyFailText="??? ? ????!"
    RedTeamIndex=-1
    BlueTeamIndex=-1
    RedTeamDesc="??"
    BlueTeamDesc="??"
    OnPreDraw=UT2K4Tab_MidGameVoiceChat.PreDraw
}