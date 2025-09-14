class BTNetMainMenu_Lobby extends BTNetGUIPage
    editinlinenew
    instanced;

var export editinline BTNetMainMenu_ChannelListBox ChannelList;
var transient wMatchMaker MatchMaker;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ChannelList = BTNetMainMenu_ChannelListBox(Controls[1]);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    //return;    
}

function OnReOpen()
{
    Log("OnReopen()");
    //return;    
}

function InternalOnOpen()
{
    OnOpen();
    DoRefreshChannel();
    Controls[1].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
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
    OnClose(bCanceled);
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x29
    if((int(key) == 27) && int(State) == 1)
    {
        Quit_OnClick(self);
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
    Param2 = "Refresh";
    return true;
    //return;    
}

function bool EnterChannel_OnClick(GUIComponent Sender)
{
    local export editinline BTNetMainMenu_ChannelList List;
    local int idx;

    List = BTNetMainMenu_ChannelList(ChannelList.List);
    idx = List.GetSelectedChannelID();
    GoChannel(idx);
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

function bool BTChannelList_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool BTChannelList_OnDblClick(GUIComponent Sender)
{
    local export editinline BTNetMainMenu_ChannelList List;
    local int idx;

    List = BTNetMainMenu_ChannelList(ChannelList.List);
    idx = List.GetSelectedChannelID();
    GoChannel(idx);
    return true;
    //return;    
}

function bool Refresh_OnClick(GUIComponent Sender)
{
    return DoRefreshChannel();
    //return;    
}

function bool DoRefreshChannel()
{
    local export editinline BTNetMainMenu_ChannelListBox lbChannelList;

    Log("DoRefreshChannel()");
    lbChannelList = BTNetMainMenu_ChannelListBox(Controls[1]);
    lbChannelList.List.Clear();
    page_Main.TcpChannel.sfReqChannelList(0);
    return true;
    //return;    
}

function bool rfAckChannelList(int id, string Title, int CurUser, int MaxUser)
{
    local string ChannelID;
    local export editinline BTNetMainMenu_ChannelList MyList;

    MyList = BTNetMainMenu_ChannelList(ChannelList.List);
    ChannelID = string(id);
    MyList.Add(string(id), Title, ((("(" $ string(CurUser)) $ "/") $ string(MaxUser)) $ ")");
    return true;
    //return;    
}

function bool GoChannel(int ChannelID)
{
    page_Main.iChannel = ChannelID;
    page_Main.TcpChannel.sfReqEnterChannel(ChannelID);
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string Clanname, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int Result, string ErrMsg)
{
    // End:0x1D
    if(Result == 0)
    {
        page_Main.SetPage(8, true);
    }
    return true;
    //return;    
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetMainMenu_Lobby.InternalOnOpen
    OnClose=BTNetMainMenu_Lobby.InternalOnClose
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.Channel_Back'
    begin object name="Channel_Back" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.channel_Textures.channel_back2'
        ImageStyle=6
    end object
    Controls[0]=Channel_Back
    // Reference: BTNetMainMenu_ChannelListBox'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.BTChannelList'
    begin object name="BTChannelList" class=GUIWarfare_Decompressed.BTNetMainMenu_ChannelListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=BTChannelList.InternalOnCreateComponent
        StyleName="WarfareListBox"
        WinTop=0.1927083
        WinLeft=0.2968750
        WinWidth=0.3232422
        WinHeight=0.6575521
        OnClick=BTNetMainMenu_Lobby.BTChannelList_OnClick
        OnDblClick=BTNetMainMenu_Lobby.BTChannelList_OnDblClick
    end object
    Controls[1]=BTChannelList
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.EnterChannel'
    begin object name="EnterChannel" class=XInterface.GUIButton
        StyleName="WarfareLobby_EnterButton"
        WinTop=0.8645833
        WinLeft=0.3466797
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Lobby.EnterChannel_OnClick
        OnKeyEvent=EnterChannel.InternalOnKeyEvent
    end object
    Controls[2]=EnterChannel
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.Quit'
    begin object name="Quit" class=XInterface.GUIButton
        StyleName="WarfareLobby_ExitButton"
        WinTop=0.0100911
        WinLeft=0.9511719
        WinWidth=0.0520833
        WinHeight=0.0520833
        OnClick=BTNetMainMenu_Lobby.Quit_OnClick
        OnKeyEvent=Quit.InternalOnKeyEvent
    end object
    Controls[3]=Quit
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.QuickEnterChannel'
    begin object name="QuickEnterChannel" class=XInterface.GUIButton
        StyleName="WarfareLobby_QuickEnterButton"
        WinTop=0.8645833
        WinLeft=0.4414063
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Lobby.EnterChannel_OnClick
        OnKeyEvent=QuickEnterChannel.InternalOnKeyEvent
    end object
    Controls[4]=QuickEnterChannel
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.RefreshChannel'
    begin object name="RefreshChannel" class=XInterface.GUIButton
        StyleName="WarfareLobby_RefreshButton"
        WinTop=0.8645833
        WinLeft=0.5361328
        WinWidth=0.0917969
        WinHeight=0.0546875
        OnClick=BTNetMainMenu_Lobby.Refresh_OnClick
        OnKeyEvent=RefreshChannel.InternalOnKeyEvent
    end object
    Controls[5]=RefreshChannel
    // Reference: GUIImage'GUIWarfare_Decompressed.BTNetMainMenu_Lobby.ChannelHeader'
    begin object name="ChannelHeader" class=XInterface.GUIImage
        Image=Texture'Warfare_UI.channel_Textures.ch_box'
        ImageStyle=6
        WinTop=0.1666667
        WinLeft=0.2968750
        WinWidth=0.3232422
        WinHeight=0.0234375
    end object
    Controls[6]=ChannelHeader
    OnKeyEvent=BTNetMainMenu_Lobby.MyKeyEvent
}