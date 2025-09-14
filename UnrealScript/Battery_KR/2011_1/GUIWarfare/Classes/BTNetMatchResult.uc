class BTNetMatchResult extends BTNetGUIPage
    editinlinenew
    instanced;

var transient GameInfo kGameInfo;
var transient wMatchMaker kMatchMaker;
var export editinline transient GUIButton Btn_Close;
var bool bCanClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Btn_Close = GUIButton(Controls[1]);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    // End:0x45
    if(kGameInfo == none)
    {
        kGameInfo = Controller.ViewportOwner.Actor.Level.Game;
    }
    // End:0x80
    if(kMatchMaker == none)
    {
        kMatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    }
    bCanClose = false;
    //return;    
}

function bool OnCanClose(optional bool bCancelled)
{
    return bCanClose;
    //return;    
}

function bool OnClick_Close(GUIComponent Sender)
{
    kMatchMaker.EndMatch();
    bCanClose = true;
    return true;
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x24
    if((int(key) == 13) && int(State) == 1)
    {
        OnClick_Close(self);
    }
    // End:0x46
    if((int(key) == 27) && int(State) == 1)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    // End:0x39
    if(Result != 0)
    {
        Log((("Error - " $ string(self)) $ "::rfAckGameOver - ") $ ErrMsg);
    }
    kMatchMaker.EndMatch();
    Btn_Close.EnableMe();
    //return;    
}

function rfAckUpdateScore1(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<byte> EXPBonuses, array<int> Points, array<byte> PointBonuses)
{
    //return;    
}

function rfAckUpdateScore2(array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID, array<int> MainWeaponIDs, array<byte> MainWeaponRanks, array<byte> MainWeaponEXPs)
{
    //return;    
}

defaultproperties
{
    bRenderWorld=true
    bPersistent=true
    bAllowedAsLast=true
    OnCanClose=BTNetMatchResult.OnCanClose
    // Reference: BackgroundImage'GUIWarfare_Decompressed.BTNetMatchResult.bgImg'
    begin object name="bgImg" class=XInterface.BackgroundImage
        Image=Texture'Warfare_UI.ID_Textures.ID_back2'
        ImageStyle=6
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.0000000
        WinHeight=0.0000000
    end object
    Controls[0]=bgImg
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetMatchResult.Obj1'
    begin object name="Obj1" class=XInterface.GUIButton
        Caption="Close"
        StyleName="WarfareConnectButton"
        Hint="If click, close this page."
        WinTop=0.7500000
        WinLeft=0.7500000
        WinWidth=0.0917970
        WinHeight=0.0546880
        OnClick=BTNetMatchResult.OnClick_Close
        OnKeyEvent=Obj1.InternalOnKeyEvent
    end object
    Controls[1]=Obj1
    // Reference: GUILabel'GUIWarfare_Decompressed.BTNetMatchResult.Label_Title'
    begin object name="Label_Title" class=XInterface.GUILabel
        Caption="Result"
        WinTop=0.1500000
        WinLeft=0.1500000
    end object
    Controls[2]=Label_Title
    WinTop=0.2525520
    WinLeft=0.1679690
    WinWidth=0.5759770
    WinHeight=0.4070310
    OnKeyEvent=BTNetMatchResult.MyKeyEvent
}