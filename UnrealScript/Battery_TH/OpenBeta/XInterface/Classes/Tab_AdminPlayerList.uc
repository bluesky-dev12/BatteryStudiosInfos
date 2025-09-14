class Tab_AdminPlayerList extends UT2K3TabPanel
    editinlinenew
    instanced;

var export editinline AdminPlayerList MyPlayerList;
var export editinline GUIMultiColumnListBox MyListBox;
var bool bAdvancedAdmin;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MyListBox = GUIMultiColumnListBox(Controls[1]);
    MyPlayerList = AdminPlayerList(MyListBox.Controls[0]);
    MyPlayerList.InitComponent(MyController, self);
    WinWidth = Controller.ActivePage.WinWidth;
    WinLeft = Controller.ActivePage.WinLeft;
    //return;    
}

function ProcessRule(string NewRule)
{
    // End:0x2A
    if(NewRule == "Done")
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = None;        
    }
    else
    {
        MyPlayerList.Add(NewRule);
    }
    //return;    
}

function ReloadList()
{
    MyPlayerList.Clear();
    // End:0x46
    if(wPlayer(PlayerOwner()) != none)
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = ProcessRule;
        wPlayer(PlayerOwner()).ServerRequestPlayerInfo();
    }
    //return;    
}

function bool KickClicked(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("Admin Kick" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);
    ReloadList();
    return true;
    //return;    
}

function bool BanClicked(GUIComponent Sender)
{
    // End:0x4E
    if(bAdvancedAdmin)
    {
        PlayerOwner().ConsoleCommand("Admin Kick Ban" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);        
    }
    else
    {
        PlayerOwner().ConsoleCommand("Admin KickBan" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);
    }
    ReloadList();
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'XInterface_Decompressed.Tab_AdminPlayerList.AdminBackground'
    begin object name="AdminBackground" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bNeverFocus=true
    end object
    Controls[0]=AdminBackground
    // Reference: GUIMultiColumnListBox'XInterface_Decompressed.Tab_AdminPlayerList.AdminPlayersListBox'
    begin object name="AdminPlayersListBox" class=XInterface_Decompressed.GUIMultiColumnListBox
        bVisibleWhenEmpty=true
        Controls[0]=AdminPlayerList'XInterface_Decompressed.Tab_AdminPlayerList.AdminList'
        OnCreateComponent=AdminPlayersListBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinHeight=0.8781270
    end object
    Controls[1]=AdminPlayersListBox
    // Reference: GUIButton'XInterface_Decompressed.Tab_AdminPlayerList.AdminPlayerKick'
    begin object name="AdminPlayerKick" class=XInterface_Decompressed.GUIButton
        Caption="??"
        StyleName="SquareMenuButton"
        Hint="??? ????? ?????"
        WinTop=0.9000000
        WinLeft=0.7437500
        WinWidth=0.1200000
        WinHeight=0.0706250
        OnClick=Tab_AdminPlayerList.KickClicked
        OnKeyEvent=AdminPlayerKick.InternalOnKeyEvent
    end object
    Controls[2]=AdminPlayerKick
    // Reference: GUIButton'XInterface_Decompressed.Tab_AdminPlayerList.AdminPlayerBan'
    begin object name="AdminPlayerBan" class=XInterface_Decompressed.GUIButton
        Caption="??"
        StyleName="SquareMenuButton"
        Hint="??? ????? ??? ?????"
        WinTop=0.9000000
        WinLeft=0.8687500
        WinWidth=0.1200000
        WinHeight=0.0706250
        OnClick=Tab_AdminPlayerList.BanClicked
        OnKeyEvent=AdminPlayerBan.InternalOnKeyEvent
    end object
    Controls[3]=AdminPlayerBan
    WinHeight=0.6250030
}