class BTWindowMessage extends BTWindow
    editinlinenew
    instanced;

var() automated GUILabel LabelMessage;
var() automated GUIButton ButtonOK;
var bool bAutoClose;
var bool bQuitOnOK;
var string ClassName;
//var delegate<OnOK> __OnOK__Delegate;

static function ShowWindow(GUIController con, optional string Msg)
{
    local export editinline GUIPage Page;
    local export editinline BTWindowMessage wndMsg;

    Log(("[BTWindowMessage::ShowWindow]" @ "msg=") $ Msg);
    con.OpenMenu(default.ClassName);
    Page = con.GetLastMenu();
    wndMsg = BTWindowMessage(Page);
    // End:0x9F
    if((wndMsg != none) && Msg != "")
    {
        wndMsg.LabelMessage.Caption = Msg;
    }
    //return;    
}

function SetMessage(string Msg)
{
    Log("[BTWindowMessage::SetMessage] " $ Msg);
    LabelMessage.Caption = Msg;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    //return;    
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization loc;

    loc = new Class'Engine.GlobalLocalization';
    ButtonOK.Caption = loc.CaptionOK;
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    FocusFirst(none);
    ApplyLocalizedStrings();
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

delegate OnOK(GUIComponent Sender)
{
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    Log((("[BTWindowMessage::ButtonOK_OnClick] bAutoClose=" $ string(bAutoClose)) $ " bQuitOnOK=") $ string(bQuitOnOK));
    // End:0x6F
    if(bAutoClose)
    {
        Controller.CloseMenu(false);
    }
    // End:0x8D
    if(bQuitOnOK)
    {
        Controller.ConsoleCommand("exit");
    }
    OnOK(self);
    return true;
    //return;    
}

defaultproperties
{
    bAutoClose=true
    ClassName="GUIWarfareControls.BTWindowMessage"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.1000000
    DefaultTop=0.3000000
    bRequire640x480=true
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.3500000
    WinLeft=-0.0100000
    WinWidth=1.0100000
    WinHeight=0.3000000
}