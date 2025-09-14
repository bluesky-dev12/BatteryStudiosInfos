class BTNetMainMenu_GameRoom extends BTNetGUIPage
    editinlinenew
    instanced;

var int MyTeamNum;
var string hostAddress;
var int nStartCount;
var bool bStarting;
var string RoomOwnerID;
var byte bIsPlaying;
var transient wMatchMaker MatchMaker;
var int PlayerNumber;
var int StartWaitingCount;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIListBox RedBox, BlueBox, ChatList;
    local export editinline GUIButton StartButton;

    super.InitComponent(MyController, myOwner);
    RedBox = GUIListBox(Controls[1]);
    BlueBox = GUIListBox(Controls[2]);
    ChatList = GUIListBox(Controls[10]);
    ChatList.List.TextAlign = 0;
    StartButton = GUIButton(Controls[5]);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0xCC
    if(MatchMaker.bIsOwner == false)
    {
        StartButton.DisableMe();        
    }
    else
    {
        StartButton.EnableMe();
    }
    //return;    
}

function InternalOnOpen()
{
    Controls[0].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
    page_Main.TcpChannel.sfReqRoomUserList(MatchMaker.My_iRoom);
    page_Main.TcpChannel.sfReqGameHostInfo(MatchMaker.My_iRoom);
    //return;    
}

event Opened(GUIComponent Sender)
{
    local export editinline BTNetMainMenu_GameRoom_TeamListBox RedBox, BlueBox;
    local export editinline BTNetMainMenu_GameRoom_TeamList RedList, BlueList;
    local export editinline GUIButton c2IUA, c2RSA, StartButton;
    local export editinline GUIComboBox MapCombo, GameCombo;

    super.Opened(Sender);
    StartButton = GUIButton(Controls[5]);
    RedBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[1]);
    BlueBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[2]);
    RedList = BTNetMainMenu_GameRoom_TeamList(RedBox.List);
    BlueList = BTNetMainMenu_GameRoom_TeamList(BlueBox.List);
    c2IUA = GUIButton(Controls[7]);
    c2RSA = GUIButton(Controls[8]);
    MapCombo = GUIComboBox(Controls[12]);
    GameCombo = GUIComboBox(Controls[13]);
    RedList.Clear();
    BlueList.Clear();
    c2IUA.EnableMe();
    c2RSA.EnableMe();
    // End:0x176
    if(MatchMaker.bIsOwner == false)
    {
        StartButton.DisableMe();
        MapCombo.DisableMe();
        GameCombo.DisableMe();
        page_Main.TcpChannel.sfReqGameRoomInfo(MatchMaker.My_iRoom, MatchMaker.My_iUID);        
    }
    else
    {
        StartButton.EnableMe();
        MapCombo.EnableMe();
        GameCombo.EnableMe();
    }
    ReadMatchMaker();
    //return;    
}

function ReadMatchMaker()
{
    ReadMapList();
    ReadGameList();
    //return;    
}

function ReadMapList()
{
    local int i;
    local export editinline GUIComboBox MapCombo;
    local int iFormerIndex;

    MapCombo = GUIComboBox(Controls[12]);
    MapCombo.__OnChange__Delegate = None;
    MapCombo.List.Clear();
    Controller.GetMapList("", MapCombo.List);
    MapCombo.List.RemoveItem("Entry");
    MapCombo.List.RemoveItem("AutoPlay");
    i = 0;
    J0xA6:

    // End:0xE3 [Loop If]
    if(i < 10)
    {
        MapCombo.List.RemoveItem("Auto" $ string(i));
        i++;
        // [Loop Continue]
        goto J0xA6;
    }
    MapCombo.List.SortList();
    iFormerIndex = MapCombo.List.FindIndex(MatchMaker.szMapName, true);
    // End:0x14E
    if(iFormerIndex != -1)
    {
        MapCombo.SetIndex(iFormerIndex);        
    }
    else
    {
        MapCombo.SetIndex(0);
    }
    MapCombo.__OnChange__Delegate = OnClick_MapChange;
    //return;    
}

function ReadGameList()
{
    local export editinline GUIComboBox GameCombo;
    local int iFormerIndex;

    GameCombo = GUIComboBox(Controls[13]);
    GameCombo.__OnChange__Delegate = None;
    GameCombo.List.Clear();
    GameCombo.AddItem("WGame.wTeamGame");
    GameCombo.AddItem("WGame.wTeam3Game");
    GameCombo.List.SortList();
    iFormerIndex = GameCombo.List.FindIndex(MatchMaker.szGameClass, true);
    // End:0xEB
    if(iFormerIndex != -1)
    {
        GameCombo.SetIndex(iFormerIndex);        
    }
    else
    {
        GameCombo.SetIndex(0);
    }
    GameCombo.__OnChange__Delegate = OnClick_GameChange;
    //return;    
}

function OnReOpen()
{
    local export editinline GUIButton StartButton;

    StartButton = GUIButton(Controls[5]);
    // End:0x3A
    if(MatchMaker.bIsOwner == false)
    {
        StartButton.DisableMe();        
    }
    else
    {
        StartButton.EnableMe();
    }
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
    // End:0x29
    if((int(key) == 27) && int(State) == 1)
    {
        OnClick_BackTolobby(self);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool GetRestoreParams(out string Param1, out string Param2)
{
    Param1 = MatchMaker.My_szName;
    Param2 = string(MatchMaker.My_iRoom);
    return true;
    //return;    
}

function bool OnClick_QuitGameRoom(GUIComponent Sender)
{
    Controller.CloseAll(false);
    Console(Controller.Master.Console).ConsoleCommand("exit");
    return true;
    //return;    
}

function bool OnClick_StartGame(GUIComponent Sender)
{
    // End:0x26
    if(int(bIsPlaying) == 1)
    {
        MatchMaker.StartMatch(0, false, hostAddress);        
    }
    else
    {
        page_Main.TcpChannel.sfReqStartGame(MatchMaker.My_iRoom);
    }
    return true;
    //return;    
}

function bool OnClick_ChangeTeam(GUIComponent Sender)
{
    // End:0x27
    if(MyTeamNum == 0)
    {
        page_Main.TcpChannel.sfReqChangeTeam(1);        
    }
    else
    {
        page_Main.TcpChannel.sfReqChangeTeam(0);
    }
    return true;
    //return;    
}

function rfAckRoomUserList(int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost)
{
    local export editinline BTNetMainMenu_GameRoom_TeamListBox RedBox, BlueBox;
    local export editinline BTNetMainMenu_GameRoom_TeamList List;

    Log((((((((((((string(self) $ "::rfAckRoomUserList(") $ string(UID)) $ ",") $ UserName) $ ",") $ string(Grade)) $ ",") $ string(TeamNum)) $ ",") $ string(Statue)) $ ",") $ string(IsHost));
    RedBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[1]);
    BlueBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[2]);
    // End:0xF3
    if(TeamNum == 0)
    {
        List = BTNetMainMenu_GameRoom_TeamList(RedBox.List);
        List.Add(string(UID), "BatteryClan", string(Grade), UserName, string(Statue), string(IsHost));        
    }
    else
    {
        // End:0x154
        if(TeamNum == 1)
        {
            List = BTNetMainMenu_GameRoom_TeamList(BlueBox.List);
            List.Add(string(UID), "BatteryClan", string(Grade), UserName, string(Statue), string(IsHost));
        }
    }
    page_Main.TcpChannel.sfReqIsGameRoomPlaying(MatchMaker.My_iRoom);
    //return;    
}

function rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, int Result, string ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local export editinline BTNetMainMenu_GameRoom_TeamListBox RedBox, BlueBox;
    local export editinline BTNetMainMenu_GameRoom_TeamList List;

    RedBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[1]);
    BlueBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[2]);
    // End:0x81
    if(TeamNum == 0)
    {
        List = BTNetMainMenu_GameRoom_TeamList(RedBox.List);
        List.Add(string(UID), "BatteryClan", string(Grade), UserID, string(0), string(0));        
    }
    else
    {
        List = BTNetMainMenu_GameRoom_TeamList(BlueBox.List);
        List.Add(string(UID), "BatteryClan", string(Grade), UserID, string(0), string(0));
    }
    MyTeamNum = TeamNum;
    MatchMaker.SetMyTeam(MyTeamNum);
    PlayerNumber++;
    //return;    
}

function rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    local export editinline BTNetMainMenu_GameRoom_TeamListBox RedBox, BlueBox;
    local export editinline BTNetMainMenu_GameRoom_TeamList RedList, BlueList;

    RedBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[1]);
    BlueBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[2]);
    RedList = BTNetMainMenu_GameRoom_TeamList(RedBox.List);
    BlueList = BTNetMainMenu_GameRoom_TeamList(BlueBox.List);
    // End:0x127
    if(Result == 0)
    {
        RedList.Remove(string(UID));
        BlueList.Remove(string(UID));
        // End:0xBF
        if(TeamNum == 0)
        {
            RedList.Add(string(UID), "", "0", UserID, "0", "0");
        }
        // End:0xF0
        if(TeamNum == 1)
        {
            BlueList.Add(string(UID), "", "0", UserID, "0", "0");
        }
        // End:0x113
        if(MatchMaker.My_szName == UserID)
        {
            MyTeamNum = TeamNum;
        }
        MatchMaker.SetMyTeam(MyTeamNum);
    }
    //return;    
}

function rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    hostAddress = IP;
    Log("Host ip is " $ hostAddress);
    //return;    
}

function rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    local export editinline GUIButton c2IUA, c2RSA;

    c2IUA = GUIButton(Controls[7]);
    c2RSA = GUIButton(Controls[8]);
    c2IUA.DisableMe();
    c2RSA.DisableMe();
    // End:0x6D
    if(MatchMaker.bIsOwner == true)
    {
        MatchMaker.StartMatch(0, true);        
    }
    else
    {
        SetTimer(1.0000000, true);
        bStarting = true;
    }
    //return;    
}

event Timer()
{
    local export editinline GUIListBox ChatList;
    local int nDisCount;

    ChatList = GUIListBox(Controls[10]);
    // End:0xE3
    if(bStarting)
    {
        nStartCount = nStartCount + 1;
        nDisCount = StartWaitingCount - nStartCount;
        ChatList.List.Add((" Game Starting in " $ string(nDisCount)) $ " seconds..");
        ChatList.List.Down();
        // End:0xE3
        if(nStartCount == StartWaitingCount)
        {
            // End:0xBE
            if(MatchMaker.bIsOwner == true)
            {                
            }
            else
            {
                MatchMaker.StartMatch(0, false, hostAddress);
            }
            nStartCount = 0;
            bStarting = false;
        }
    }
    //return;    
}

function bool GChatEdit_OnKeyType(out byte key, optional string Unicode)
{
    local export editinline GUIEditBox chatEditBox;

    chatEditBox = GUIEditBox(Controls[11]);
    return chatEditBox.InternalOnKeyType(key, Unicode);
    //return;    
}

function bool GChatEdit_OnKeyEvent(out byte key, out byte State, float Delta)
{
    local export editinline GUIEditBox chatEditBox;
    local bool retval;

    chatEditBox = GUIEditBox(Controls[11]);
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

    EditBox = GUIEditBox(Controls[11]);
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

function rfAckChatNormal(int id, string Sender, string Message)
{
    local export editinline GUIListBox ChatList;

    ChatList = GUIListBox(Controls[10]);
    ChatList.List.Add((Sender $ ": ") $ Message);
    ChatList.List.Down();
    ChatList.FocusLast(ChatList);
    SetFocus(Controls[11]);
    //return;    
}

function rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    local export editinline BTNetMainMenu_GameRoom_TeamListBox RedBox, BlueBox;
    local export editinline BTNetMainMenu_GameRoom_TeamList RedList, BlueList;
    local export editinline GUIListBox ChatList;

    RedBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[1]);
    BlueBox = BTNetMainMenu_GameRoom_TeamListBox(Controls[2]);
    RedList = BTNetMainMenu_GameRoom_TeamList(RedBox.List);
    BlueList = BTNetMainMenu_GameRoom_TeamList(BlueBox.List);
    Log((((((((("rfACKLEAVEROOM => " $ string(Num)) $ ":") $ string(UID)) $ ":") $ UserID) $ ":") $ string(Result)) $ ":") $ ErrMsg);
    // End:0x16B
    if(Result == 0)
    {
        // End:0x13F
        if(UserID == MatchMaker.My_szName)
        {
            ChatList = GUIListBox(Controls[10]);
            ChatList.List.Clear();
            RedList.Clear();
            BlueList.Clear();
            page_Main.TcpChannel.sfReqEnterChannel(page_Main.iChannel);            
        }
        else
        {
            RedList.Remove(string(UID));
            BlueList.Remove(string(UID));
        }
    }
    PlayerNumber--;
    //return;    
}

function rfAckEnterChannel(int id, int UID, string UserID, int Level, string Clanname, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int Result, string ErrMsg)
{
    // End:0x1D
    if(Result == 0)
    {
        page_Main.SetPage(8, true);
    }
    //return;    
}

function bool OnClick_ChangeToIUA(GUIComponent Sender)
{
    // End:0x10
    if(MyTeamNum == 0)
    {
        return true;        
    }
    else
    {
        page_Main.TcpChannel.sfReqChangeTeam(0);
    }
    return true;
    //return;    
}

function bool OnClick_ChangeToRSA(GUIComponent Sender)
{
    // End:0x10
    if(MyTeamNum == 1)
    {
        return true;        
    }
    else
    {
        page_Main.TcpChannel.sfReqChangeTeam(1);
    }
    return true;
    //return;    
}

function bool OnClick_BackTolobby(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqLeaveRoom(MatchMaker.My_iRoom);
    return true;
    //return;    
}

event rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    local export editinline GUIButton StartButton;

    StartButton = GUIButton(Controls[5]);
    // End:0x2D
    if(GameRoomNum != MatchMaker.My_iRoom)
    {
        return;
    }
    bIsPlaying = IsPlaying;
    // End:0x54
    if(int(IsPlaying) == 1)
    {
        StartButton.EnableMe();
    }
    //return;    
}

function OnClick_MapChange(GUIComponent Sender)
{
    local export editinline GUIComboBox MapCombo;

    MapCombo = GUIComboBox(Controls[12]);
    // End:0x6A
    if(MapCombo.TextStr != "")
    {
        page_Main.TcpChannel.sfReqSelectMap(MatchMaker.My_iRoom, MatchMaker.My_iUID, MapCombo.TextStr);
    }
    //return;    
}

function OnClick_GameChange(GUIComponent Sender)
{
    local export editinline GUIComboBox GameCombo;

    GameCombo = GUIComboBox(Controls[13]);
    // End:0x87
    if(GameCombo.TextStr != "")
    {
        page_Main.TcpChannel.sfReqChangeGameMode(MatchMaker.My_iRoom, MatchMaker.My_iUID, GameCombo.TextStr, MatchMaker.GetGameModeNum(GameCombo.TextStr));
    }
    //return;    
}

function rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    // End:0x1A
    if(MatchMaker.My_iRoom != GameNum)
    {
        return;
    }
    SelectMap(MapName);
    //return;    
}

function SelectMap(string szName)
{
    local export editinline GUIComboBox MapCombo;

    MatchMaker.szMapName = szName;
    MapCombo = GUIComboBox(Controls[12]);
    MapCombo.__OnChange__Delegate = None;
    MapCombo.SetIndex(MapCombo.FindIndex(MatchMaker.szMapName));
    MapCombo.__OnChange__Delegate = OnClick_MapChange;
    //return;    
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    // End:0x1A
    if(MatchMaker.My_iRoom != GameNum)
    {
        return true;
    }
    SelectGame(GameMode);
    return true;
    //return;    
}

function SelectGame(string szClassName)
{
    local export editinline GUIComboBox GameCombo;

    MatchMaker.szGameClass = szClassName;
    GameCombo = GUIComboBox(Controls[13]);
    GameCombo.__OnChange__Delegate = None;
    GameCombo.SetIndex(GameCombo.FindIndex(MatchMaker.szGameClass));
    GameCombo.__OnChange__Delegate = OnClick_GameChange;
    //return;    
}

function rfAckGameRoomState(int GameRoomNum, MatchState RoomState)
{
    // End:0x1A
    if(GameRoomNum != MatchMaker.My_iRoom)
    {
        return;
    }
    MatchMaker.SetCurMatchState(RoomState);
    //return;    
}

function rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    // End:0x1F
    if(RoomInfo.RoomNumber != MatchMaker.My_iRoom)
    {
        return;
    }
    SelectMap(RoomInfo.MapName);
    SelectGame(RoomInfo.GameClass);
    //return;    
}

defaultproperties
{
    StartWaitingCount=6
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetMainMenu_GameRoom.InternalOnOpen
    OnClose=BTNetMainMenu_GameRoom.InternalOnClose
    // Reference: GUILabel'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.RoomTitle'
    begin object name="RoomTitle" class=XInterface.GUILabel
        Caption="Game Room Name"
        WinWidth=0.0000000
        WinHeight=0.0000000
    end object
    Controls[0]=RoomTitle
    // Reference: BTNetMainMenu_GameRoom_TeamListBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.RedTeamList'
    begin object name="RedTeamList" class=GUIWarfare_Decompressed.BTNetMainMenu_GameRoom_TeamListBox
        SelectedStyleName="WarfareGameRoom_IUAListBox"
        bVisibleWhenEmpty=true
        OnCreateComponent=RedTeamList.InternalOnCreateComponent
        StyleName="WarfareGameRoom_IUAListBox"
        WinTop=0.1458333
        WinLeft=0.0712891
        WinWidth=0.2861328
        WinHeight=0.2617188
    end object
    Controls[1]=RedTeamList
    // Reference: BTNetMainMenu_GameRoom_TeamListBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.BlueTeamList'
    begin object name="BlueTeamList" class=GUIWarfare_Decompressed.BTNetMainMenu_GameRoom_TeamListBox
        SelectedStyleName="WarfareGameRoom_RSAListBox"
        bVisibleWhenEmpty=true
        OnCreateComponent=BlueTeamList.InternalOnCreateComponent
        StyleName="WarfareGameRoom_RSAListBox"
        WinTop=0.1458333
        WinLeft=0.3593750
        WinWidth=0.2861328
        WinHeight=0.2617188
    end object
    Controls[2]=BlueTeamList
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.QuitGameRoom'
    begin object name="QuitGameRoom" class=XInterface.GUIButton
        StyleName="WarfareGameRoom_QuitButton"
        WinTop=0.0104167
        WinLeft=0.9511719
        WinWidth=0.0410156
        WinHeight=0.0520833
        OnClick=BTNetMainMenu_GameRoom.OnClick_QuitGameRoom
        OnKeyEvent=QuitGameRoom.InternalOnKeyEvent
    end object
    Controls[3]=QuitGameRoom
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.ChangeTeam'
    begin object name="ChangeTeam" class=XInterface.GUIButton
        Caption="Change Team"
        WinWidth=0.0000000
        WinHeight=0.0000000
        OnClick=BTNetMainMenu_GameRoom.OnClick_ChangeTeam
        OnKeyEvent=ChangeTeam.InternalOnKeyEvent
    end object
    Controls[4]=ChangeTeam
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.StartGame'
    begin object name="StartGame" class=XInterface.GUIButton
        Caption="Start Game"
        StyleName="WarfareGameRoom_StartGameButton"
        WinTop=0.8411458
        WinLeft=0.8203125
        WinWidth=0.1044922
        WinHeight=0.1015625
        OnClick=BTNetMainMenu_GameRoom.OnClick_StartGame
        OnKeyEvent=StartGame.InternalOnKeyEvent
    end object
    Controls[5]=StartGame
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.GameRoom_Back'
    begin object name="GameRoom_Back" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.wait_Textures.wait_back3'
        ImageStyle=6
    end object
    Controls[6]=GameRoom_Back
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.ChangeToIUA'
    begin object name="ChangeToIUA" class=XInterface.GUIButton
        StyleName="WarfareGameRoom_IUAButton"
        WinTop=0.0742188
        WinLeft=0.0546875
        WinWidth=0.1044922
        WinHeight=0.0325521
        OnClick=BTNetMainMenu_GameRoom.OnClick_ChangeToIUA
        OnKeyEvent=ChangeToIUA.InternalOnKeyEvent
    end object
    Controls[7]=ChangeToIUA
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.ChangeToRSA'
    begin object name="ChangeToRSA" class=XInterface.GUIButton
        StyleName="WarfareGameRoom_RSAButton"
        WinTop=0.0742188
        WinLeft=0.1621094
        WinWidth=0.1044922
        WinHeight=0.0325521
        OnClick=BTNetMainMenu_GameRoom.OnClick_ChangeToRSA
        OnKeyEvent=ChangeToRSA.InternalOnKeyEvent
    end object
    Controls[8]=ChangeToRSA
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.BackToLobby'
    begin object name="BackToLobby" class=XInterface.GUIButton
        StyleName="WarfareGameRoom_BackLobbyButton"
        WinTop=0.8411458
        WinLeft=0.7128906
        WinWidth=0.1044922
        WinHeight=0.1015625
        OnClick=BTNetMainMenu_GameRoom.OnClick_BackTolobby
        OnKeyEvent=BackToLobby.InternalOnKeyEvent
    end object
    Controls[9]=BackToLobby
    // Reference: GUIListBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.GChatList'
    begin object name="GChatList" class=XInterface.GUIListBox
        SelectedStyleName="WarfareGameRoom_ChatList"
        bVisibleWhenEmpty=true
        OnCreateComponent=GChatList.InternalOnCreateComponent
        StyleName="WarfareGameRoom_ChatList"
        WinTop=0.7695313
        WinLeft=0.0781250
        WinWidth=0.3935547
        WinHeight=0.1406250
    end object
    Controls[10]=GChatList
    // Reference: GUIEditBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.GChatEdit'
    begin object name="GChatEdit" class=XInterface.GUIEditBox
        StyleName="WarfareGameRoom_ChatInput"
        WinTop=0.9114583
        WinLeft=0.0810547
        WinWidth=0.3193359
        WinHeight=0.0260417
        OnActivate=GChatEdit.InternalActivate
        OnDeActivate=GChatEdit.InternalDeactivate
        OnKeyType=BTNetMainMenu_GameRoom.GChatEdit_OnKeyType
        OnKeyEvent=BTNetMainMenu_GameRoom.GChatEdit_OnKeyEvent
    end object
    Controls[11]=GChatEdit
    // Reference: GUIComboBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.MapCombo'
    begin object name="MapCombo" class=XInterface.GUIComboBox
        bReadOnly=true
        WinTop=0.6625520
        WinLeft=0.7075690
        WinWidth=0.2109770
        WinHeight=0.0270310
        bBoundToParent=true
        OnKeyEvent=MapCombo.InternalOnKeyEvent
    end object
    Controls[12]=MapCombo
    // Reference: GUIComboBox'GUIWarfare_Decompressed.BTNetMainMenu_GameRoom.GameCombo'
    begin object name="GameCombo" class=XInterface.GUIComboBox
        bReadOnly=true
        WinTop=0.4355520
        WinLeft=0.5405690
        WinWidth=0.1559770
        WinHeight=0.0270310
        bBoundToParent=true
        OnKeyEvent=GameCombo.InternalOnKeyEvent
    end object
    Controls[13]=GameCombo
    OnKeyEvent=BTNetMainMenu_GameRoom.MyKeyEvent
}