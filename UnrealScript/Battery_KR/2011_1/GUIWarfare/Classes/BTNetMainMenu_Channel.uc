class BTNetMainMenu_Channel extends BTNetGUIPage
    editinlinenew
    instanced;

enum Phrase
{
    PHRASE_NONE,                    // 0
    PHRASE_BACKTOLOBBY,             // 1
    PHRASE_CREATEGAMEROOM,          // 2
    PHRASE_ENTERGAMEROOM            // 3
};

var export editinline BTNetMainMenu_Channel_GameRoomListBox gameroom;
var export editinline GUIListBox ChatLines;
var BTNetMainMenu_Channel.Phrase curPhrase;
var export editinline BTNetGUIChildPage FindFriendsPage;
var export editinline BTNetGUIChildPage CreateRoomPage;
var transient wMatchMaker MatchMaker;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    gameroom = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
    ChatLines = GUIListBox(Controls[8]);
    ChatLines.List.TextAlign = 0;
    curPhrase = 0;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    //return;    
}

function testlistadd()
{
    local export editinline BTNetMainMenu_Channel_GameRoomListBox RoomList;
    local export editinline BTNetMainMenu_Channel_GameRoomList List;
    local string RoomNum, usercnt, Title;

    RoomNum = "1";
    usercnt = "(1/10)";
    Title = "let us fight again!";
    RoomList = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
    List = BTNetMainMenu_Channel_GameRoomList(RoomList.List);
    List.Add(RoomNum, Title, usercnt);
    //return;    
}

function OnReOpen()
{
    DoRefresh();
    Log("Channel::OnReOpen");
    //return;    
}

function InternalOnOpen()
{
    DoRefresh();
    Controls[6].SetFocus(none);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool InternalOnDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    SaveConfig();
    OnClose(bCanceled);
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x22
    if((int(key) == 13) && int(State) == 1)
    {
        return true;        
    }
    else
    {
        // End:0x4B
        if((int(key) == 27) && int(State) == 1)
        {
            OnClick_BackTolobby(self);
            return true;            
        }
        else
        {
            return false;
        }
    }
    //return;    
}

function bool ChatInput_OnKeyType(out byte key, optional string Unicode)
{
    local export editinline GUIEditBox chatEditBox;

    chatEditBox = GUIEditBox(Controls[6]);
    return chatEditBox.InternalOnKeyType(key, Unicode);
    //return;    
}

function bool ChatInput_OnKeyEvent(out byte key, out byte State, float Delta)
{
    local export editinline GUIEditBox chatEditBox;
    local bool retval;

    chatEditBox = GUIEditBox(Controls[6]);
    // End:0x42
    if(chatEditBox.InternalOnKeyEvent(key, State, Delta) == true)
    {
        retval = true;        
    }
    else
    {
        // End:0x6F
        if((int(key) == 13) && int(State) == 1)
        {
            retval = SendChatNormal();            
        }
        else
        {
            retval = false;
        }
    }
    chatEditBox.SetFocus(none);
    return retval;
    //return;    
}

function bool SendChatNormal()
{
    local string chatline;
    local export editinline GUIEditBox EditBox;

    EditBox = GUIEditBox(Controls[6]);
    chatline = EditBox.GetText();
    // End:0x36
    if(chatline == "")
    {
        return false;
    }
    page_Main.TcpChannel.sfReqChatNormal(chatline);
    EditBox.SetText("");
    return true;
    //return;    
}

function bool FindFriends_OnClick(GUIComponent Sender)
{
    // End:0x1A
    if(FindFriendsPage == none)
    {
        FindFriendsPage = new Class'GUIWarfare_Decompressed.BTNetFindFriends';
    }
    return FindFriendsPage.OpenChildPage(self);
    //return;    
}

function bool EnterGameRoom_OnClick(GUIComponent Sender)
{
    local export editinline BTNetMainMenu_Channel_GameRoomList List;
    local export editinline BTNetMainMenu_Channel_GameRoomListBox ListBox;
    local int GameRoomNum;

    ListBox = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
    List = BTNetMainMenu_Channel_GameRoomList(ListBox.List);
    // End:0x87
    if(List.GetSelectedGameRoom(GameRoomNum) == true)
    {
        page_Main.iRoomNum = GameRoomNum;
        curPhrase = 3;
        page_Main.TcpChannel.sfReqLeaveChannel(page_Main.iChannel);
    }
    return true;
    //return;    
}

function bool Quit_OnClick(GUIComponent Sender)
{
    Controller.CloseAll(false);
    Console(Controller.Master.Console).ConsoleCommand("exit");
    return true;
    //return;    
}

function bool ChatEnter_OnClick(GUIComponent Sender)
{
    return SendChatNormal();
    //return;    
}

function bool BTGameRoomList_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool OnClick_BackTolobby(GUIComponent Sender)
{
    curPhrase = 1;
    page_Main.TcpChannel.sfReqLeaveChannel(page_Main.iChannel);
    return true;
    //return;    
}

function bool OnClick_CreateRoom(GUIComponent Sender)
{
    // End:0x1A
    if(CreateRoomPage == none)
    {
        CreateRoomPage = new Class'GUIWarfare_Decompressed.BTNetCreateRoom';
    }
    CreateRoomPage.OpenChildPage(self);
    return true;
    //return;    
}

function bool rfAckChatNormal(int id, string Sender, string Message)
{
    local export editinline GUIListBox ChatList;

    ChatList = GUIListBox(Controls[8]);
    ChatList.List.Add((Sender $ ": ") $ Message);
    ChatList.List.Down();
    ChatList.FocusLast(ChatList);
    Controls[6].SetFocus(none);
    return true;
    //return;    
}

function rfAckRoomListStart(int Result, int TotalCount)
{
    //return;    
}

function bool rfAckRoomList(int TotalCount, array<int> GameNum, array<string> Title, array<string> MapName, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<byte> WeaponLimit, array<byte> IsHardCore, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword)
{
    return true;
    //return;    
}

function bool rfAckChannelUserList(int UID, string UserID)
{
    local export editinline GUIListBox UserList;
    local string UIDstring;

    UIDstring = string(UID);
    UserList = GUIListBox(Controls[9]);
    UserList.List.Add(UserID, none, UIDstring);
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string Clanname, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int Result, string ErrMsg)
{
    local export editinline GUIListBox UserList;
    local string UIDstring;

    UIDstring = string(UID);
    // End:0x27
    if(UserID == MatchMaker.My_szName)
    {
        return true;
    }
    UserList = GUIListBox(Controls[9]);
    UserList.List.Add(UserID, none, UIDstring);
    return true;
    //return;    
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    page_Main.iRoomNum = NetRoomInfo.RoomNumber;
    page_Main.TcpChannel.sfReqLeaveChannel(page_Main.iChannel);
    return true;
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    local export editinline BTNetMainMenu_Channel_GameRoomList List;
    local export editinline BTNetMainMenu_Channel_GameRoomListBox ListBox;
    local export editinline GUIListBox UserList;
    local int nRoomNum;

    // End:0x14B
    if(UserID == MatchMaker.My_szName)
    {
        switch(curPhrase)
        {
            // End:0x60
            case 2:
                MatchMaker.bIsOwner = true;
                page_Main.TcpChannel.sfReqEnterRoom(page_Main.iRoomNum, "");
                // End:0x148
                break;
            // End:0xF4
            case 3:
                ListBox = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
                List = BTNetMainMenu_Channel_GameRoomList(ListBox.List);
                List.GetSelectedGameRoom(nRoomNum);
                page_Main.iRoomNum = nRoomNum;
                MatchMaker.bIsOwner = false;
                page_Main.TcpChannel.sfReqEnterRoom(page_Main.iRoomNum, "");
                // End:0x148
                break;
            // End:0x145
            case 1:
                Log("BTNetMainMenu_Lobby(ParentPage).DoRefreshChannel();");
                page_Main.SetPage(6, true);
                // End:0x148
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        UserList = GUIListBox(Controls[9]);
        UserList.List.RemoveItem(UserID);
    }
    return true;
    //return;    
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, int Result, string ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    switch(curPhrase)
    {
        // End:0x68
        case 2:
            Log("PHRASE_CREATEGAMEROOM");
            // End:0x63
            if(UserID == MatchMaker.My_szName)
            {
                MatchMaker.bIsOwner = true;
                page_Main.SetPage(9, true);                
            }
            else
            {
                return false;
            }
            // End:0xE4
            break;
        // End:0xC3
        case 3:
            Log("PHRASE_ENTERGAMEROOM");
            // End:0xC0
            if(UserID == MatchMaker.My_szName)
            {
                MatchMaker.bIsOwner = false;
                page_Main.SetPage(9, true);
            }
            // End:0xE4
            break;
        // End:0xE1
        case 1:
            Log("PHRASE_BACKTOLOBBY");
            // End:0xE4
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool DoRefresh()
{
    local export editinline BTNetMainMenu_Channel_GameRoomList List;
    local export editinline BTNetMainMenu_Channel_GameRoomListBox ListBox;
    local export editinline GUIListBox ulistbox;

    ListBox = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
    List = BTNetMainMenu_Channel_GameRoomList(ListBox.List);
    ulistbox = GUIListBox(Controls[9]);
    ulistbox.List.Clear();
    List.Clear();
    curPhrase = 0;
    page_Main.TcpChannel.sfReqChannelUserList(page_Main.iChannel, 0, 100);
    return true;
    //return;    
}

event rfAckGameRoomDestory(int GameRoomNum)
{
    local export editinline BTNetMainMenu_Channel_GameRoomListBox ListBox;
    local export editinline BTNetMainMenu_Channel_GameRoomList List;

    ListBox = BTNetMainMenu_Channel_GameRoomListBox(Controls[0]);
    List = BTNetMainMenu_Channel_GameRoomList(ListBox.List);
    List.Remove(GameRoomNum);
    //return;    
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetMainMenu_Channel.InternalOnOpen
    OnClose=BTNetMainMenu_Channel.InternalOnClose
    // Reference: BTNetMainMenu_Channel_GameRoomListBox'GUIWarfare_Decompressed.BTNetMainMenu_Channel.BTGameRoomList'
    begin object name="BTGameRoomList" class=GUIWarfare_Decompressed.BTNetMainMenu_Channel_GameRoomListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=BTGameRoomList.InternalOnCreateComponent
        StyleName="WarfareChannel_GameRoomList"
        WinTop=0.1861979
        WinLeft=0.0527344
        WinWidth=0.6376953
        WinHeight=0.4283854
        OnClick=BTNetMainMenu_Channel.BTGameRoomList_OnClick
    end object
    Controls[0]=BTGameRoomList
    // Reference: GUILabel'GUIWarfare_Decompressed.BTNetMainMenu_Channel.GameRoomStatic'
    begin object name="GameRoomStatic" class=XInterface.GUILabel
        StyleName="Header"
        WinWidth=0.0000000
        WinHeight=0.0000000
    end object
    Controls[1]=GameRoomStatic
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.EnterGameRoom'
    begin object name="EnterGameRoom" class=XInterface.GUIButton
        StyleName="WarfareChannel_EnterRoomButton"
        WinTop=0.6276042
        WinLeft=0.5068359
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Channel.EnterGameRoom_OnClick
        OnKeyEvent=EnterGameRoom.InternalOnKeyEvent
    end object
    Controls[2]=EnterGameRoom
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.Quit'
    begin object name="Quit" class=XInterface.GUIButton
        Caption="Quit"
        StyleName="WarfareChannel_QuitButton"
        WinTop=0.0091146
        WinLeft=0.9511719
        WinWidth=0.0410156
        WinHeight=0.0520833
        OnClick=BTNetMainMenu_Channel.Quit_OnClick
        OnKeyEvent=Quit.InternalOnKeyEvent
    end object
    Controls[3]=Quit
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.BackToLobby'
    begin object name="BackToLobby" class=XInterface.GUIButton
        Caption="Find Friends"
        StyleName="WarfareChannel_FindFriendButton"
        WinTop=0.6276042
        WinLeft=0.4121094
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Channel.FindFriends_OnClick
        OnKeyEvent=BackToLobby.InternalOnKeyEvent
    end object
    Controls[4]=BackToLobby
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.CreateRoom'
    begin object name="CreateRoom" class=XInterface.GUIButton
        Caption="Create Room"
        StyleName="WarfareChannel_MakeRoomButton"
        Hint="This tooltip is just test"
        WinTop=0.6276042
        WinLeft=0.3173828
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Channel.OnClick_CreateRoom
        OnKeyEvent=CreateRoom.InternalOnKeyEvent
    end object
    Controls[5]=CreateRoom
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetMainMenu_Channel.ChatInput'
    begin object name="ChatInput" class=XInterface.GUIEditBox
        StyleName="WarfareChannel_ChatInput"
        WinTop=0.9049479
        WinLeft=0.3193359
        WinWidth=0.2998047
        WinHeight=0.0260417
        OnActivate=ChatInput.InternalActivate
        OnDeActivate=ChatInput.InternalDeactivate
        OnKeyType=BTNetMainMenu_Channel.ChatInput_OnKeyType
        OnKeyEvent=BTNetMainMenu_Channel.ChatInput_OnKeyEvent
    end object
    Controls[6]=ChatInput
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.ChatEnter'
    begin object name="ChatEnter" class=XInterface.GUIButton
        Caption="Chatting Enter"
        StyleName="WarfareChannel_FindFriendButton"
        Hint="Play a practice match"
        WinWidth=0.0000000
        WinHeight=0.0000000
        OnClick=BTNetMainMenu_Channel.ChatEnter_OnClick
        OnKeyEvent=ChatEnter.InternalOnKeyEvent
    end object
    Controls[7]=ChatEnter
    // Reference: GUIListBox'GUIWarfare_Decompressed.BTNetMainMenu_Channel.ChatList'
    begin object name="ChatList" class=XInterface.GUIListBox
        SelectedStyleName="WarfareChannel_ChatList"
        bVisibleWhenEmpty=true
        OnCreateComponent=ChatList.InternalOnCreateComponent
        StyleName="WarfareChannel_ChatList"
        WinTop=0.7630208
        WinLeft=0.3193359
        WinWidth=0.3710938
        WinHeight=0.1406250
    end object
    Controls[8]=ChatList
    // Reference: GUIListBox'GUIWarfare_Decompressed.BTNetMainMenu_Channel.UserList'
    begin object name="UserList" class=XInterface.GUIListBox
        SelectedStyleName="WarfareChannel_UserList"
        bVisibleWhenEmpty=true
        OnCreateComponent=UserList.InternalOnCreateComponent
        StyleName="WarfareChannel_UserList"
        WinTop=0.1861979
        WinLeft=0.7128906
        WinWidth=0.2187500
        WinHeight=0.7447917
    end object
    Controls[9]=UserList
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetMainMenu_Channel.RoomName'
    begin object name="RoomName" class=XInterface.GUIEditBox
        WinWidth=0.0000000
        WinHeight=0.0000000
        OnActivate=RoomName.InternalActivate
        OnDeActivate=RoomName.InternalDeactivate
        OnKeyType=RoomName.InternalOnKeyType
        OnKeyEvent=RoomName.InternalOnKeyEvent
    end object
    Controls[10]=RoomName
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetMainMenu_Channel.backg'
    begin object name="backg" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.lobby_Textures.lobby_back2'
        ImageStyle=6
    end object
    Controls[11]=backg
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Channel.QEnter'
    begin object name="QEnter" class=XInterface.GUIButton
        StyleName="WarfareChannel_QEnterRoomButton"
        WinTop=0.6276042
        WinLeft=0.6015625
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Channel.EnterGameRoom_OnClick
        OnKeyEvent=QEnter.InternalOnKeyEvent
    end object
    Controls[12]=QEnter
    // Reference: GUIImage'GUIWarfare_Decompressed.BTNetMainMenu_Channel.ChatBG'
    begin object name="ChatBG" class=XInterface.GUIImage
        Image=Texture'Warfare_UI.lobby_Textures.chat_back2'
        ImageStyle=6
        WinTop=0.7291667
        WinLeft=0.3173828
        WinWidth=0.3759766
        WinHeight=0.2070313
    end object
    Controls[13]=ChatBG
    OnKeyEvent=BTNetMainMenu_Channel.MyKeyEvent
}