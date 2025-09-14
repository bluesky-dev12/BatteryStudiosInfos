class BTPageMatchResult_Booty extends BTNetGUIPage
    editinlinenew
    instanced;

var transient GameInfo kGameInfo;
var transient wMatchMaker kMatchMaker;
var() automated GUIButton ButtonClose;
var bool bCanClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMatchResult_Booty_TCP BTPageMatchResult_Booty_TCP;

    BTPageMatchResult_Booty_TCP = new Class'GUIWarfare_Decompressed.BTPageMatchResult_Booty_TCP';
    BTPageMatchResult_Booty_TCP.Owner = self;
    return BTPageMatchResult_Booty_TCP;
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

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    kMatchMaker.EndMatch();
    bCanClose = true;
    return true;
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUIWarfare_Decompressed.BTPageMatchResult_Booty.mButtonClose'
    begin object name="mButtonClose" class=XInterface.GUIButton
        Caption="Close"
        StyleName="STY2Warfare_ConformButton"
        WinTop=0.5990000
        WinLeft=0.4220000
        WinWidth=0.1570000
        OnClick=BTPageMatchResult_Booty.ButtonClose_OnClick
        OnKeyEvent=mButtonClose.InternalOnKeyEvent
    end object
    ButtonClose=mButtonClose
    bRenderWorld=true
    bPersistent=true
    bAllowedAsLast=true
    OnCanClose=BTPageMatchResult_Booty.OnCanClose
    OnKeyEvent=BTPageMatchResult_Booty.MyKeyEvent
}