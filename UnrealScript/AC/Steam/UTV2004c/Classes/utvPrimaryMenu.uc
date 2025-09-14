/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004c\Classes\utvPrimaryMenu.uc
 * Package Imports:
 *	UTV2004c
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class utvPrimaryMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var float BoxHeight;
var float BoxWidth;
var float MarginWidth;
var float ItemHeight;
var float ItemGap;
var utvInteraction ui;
var utvReplication ur;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int A, Prev, Mark;
    local utvInteraction tui;
    local utvReplication tur;

    super(GUIPage).InitComponent(MyController, myOwner);
    Controls[0].WinHeight = BoxHeight;
    Controls[0].WinWidth = BoxWidth;
    Controls[0].WinTop = 0.50 - 0.50 * BoxHeight;
    Controls[0].WinLeft = 0.50 - 0.50 * BoxWidth;
    Controls[1].WinHeight = ItemHeight;
    Controls[1].WinWidth = BoxWidth - MarginWidth * float(2);
    Controls[1].WinTop = Controls[0].WinTop + 0.0020;
    Controls[1].WinLeft = Controls[0].WinLeft + MarginWidth;
    Controls[2].WinHeight = ItemHeight;
    Controls[2].WinWidth = BoxWidth * 0.40;
    Controls[2].WinTop = Controls[1].WinTop + ItemGap + ItemHeight;
    Controls[2].WinLeft = Controls[1].WinLeft + MarginWidth;
    Controls[24].WinHeight = ItemHeight;
    Controls[24].WinWidth = BoxWidth * 0.40;
    Controls[24].WinTop = Controls[2].WinTop + ItemGap + ItemHeight;
    Controls[24].WinLeft = Controls[2].WinLeft;
    Controls[26].WinHeight = 0.0050;
    Controls[26].WinWidth = BoxWidth - MarginWidth * float(2);
    Controls[26].WinTop = Controls[24].WinTop + ItemGap + ItemHeight;
    Controls[26].WinLeft = Controls[1].WinLeft;
    Controls[3].WinHeight = ItemHeight;
    Controls[3].WinWidth = Controls[24].WinWidth;
    Controls[3].WinTop = Controls[24].WinTop + ItemGap * float(3) + ItemHeight;
    Controls[3].WinLeft = Controls[24].WinLeft;
    Prev = 3;
    Mark = 0;
    A = 4;
    J0x35d:
    // End:0x46a [While If]
    if(A < 11)
    {
        // End:0x391
        if(A == 8 && Mark == 0)
        {
            A = 22;
            Mark = 1;
        }
        Controls[A].WinHeight = ItemHeight;
        Controls[A].WinWidth = Controls[Prev].WinWidth;
        Controls[A].WinTop = Controls[Prev].WinTop + ItemGap + ItemHeight;
        Controls[A].WinLeft = Controls[Prev].WinLeft;
        Prev = A;
        // End:0x460
        if(A == 22 && Mark == 1)
        {
            A = 7;
        }
        ++ A;
        // This is an implied JumpToken; Continue!
        goto J0x35d;
    }
    Controls[11].WinHeight = ItemHeight;
    Controls[11].WinWidth = Controls[10].WinWidth;
    Controls[11].WinTop = Controls[10].WinTop + ItemHeight * float(2);
    Controls[11].WinLeft = Controls[10].WinLeft;
    Controls[12].WinHeight = ItemHeight;
    Controls[12].WinWidth = BoxWidth * 0.50;
    Controls[12].WinTop = Controls[1].WinTop + ItemGap * float(2) + ItemHeight;
    Controls[12].WinLeft = Controls[0].WinLeft + BoxWidth * 0.50;
    Controls[25].WinHeight = ItemHeight;
    Controls[25].WinWidth = ItemHeight;
    Controls[25].WinTop = Controls[12].WinTop + ItemHeight;
    Controls[25].WinLeft = Controls[12].WinLeft;
    Controls[13].WinHeight = ItemHeight;
    Controls[13].WinWidth = BoxWidth * 0.40;
    Controls[13].WinTop = Controls[25].WinTop + ItemGap * float(3) + ItemHeight;
    Controls[13].WinLeft = Controls[25].WinLeft;
    Prev = 13;
    Mark = 0;
    A = 14;
    J0x6b3:
    // End:0x7ec [While If]
    if(A < 21)
    {
        // End:0x6e7
        if(A == 18 && Mark == 0)
        {
            A = 23;
            Mark = 1;
        }
        Controls[A].WinHeight = ItemHeight;
        Controls[A].WinWidth = Controls[Prev].WinWidth;
        Controls[A].WinTop = Controls[Prev].WinTop + ItemGap + ItemHeight;
        Controls[A].WinLeft = Controls[Prev].WinLeft;
        Controls[A].TabOrder = Controls[Prev].TabOrder + 1;
        Prev = A;
        // End:0x7e2
        if(A == 23 && Mark == 1)
        {
            A = 17;
        }
        ++ A;
        // This is an implied JumpToken; Continue!
        goto J0x6b3;
    }
    Controls[21].WinHeight = ItemHeight;
    Controls[21].WinWidth = Controls[20].WinWidth;
    Controls[21].WinTop = Controls[20].WinTop + ItemHeight * float(2);
    Controls[21].WinLeft = Controls[20].WinLeft;
    // End:0x894
    foreach AllObjects(class'utvInteraction', tui)
    {
        ui = tui;                
    }
    // End:0x8b0
    foreach AllObjects(class'utvReplication', tur)
    {
        ur = tur;                
    }
    GUILabel(Controls[12]).Caption = string(ui.Clients);
    GUIEditBox(Controls[13]).TextStr = ui.ServerAddress;
    GUIEditBox(Controls[14]).TextStr = string(ui.serverPort);
    GUIEditBox(Controls[15]).TextStr = string(ui.ListenPort);
    GUIEditBox(Controls[16]).TextStr = ui.JoinPassword;
    GUIEditBox(Controls[17]).TextStr = ui.PrimaryPassword;
    GUIEditBox(Controls[18]).TextStr = ui.NormalPassword;
    GUIEditBox(Controls[19]).TextStr = string(ui.Delay);
    GUIEditBox(Controls[20]).TextStr = string(ui.MaxClients);
    GUIEditBox(Controls[23]).TextStr = ui.VipPassword;
    GUICheckBoxButton(Controls[25]).bChecked = !ur.MuteChat;
    __OnClose__Delegate = InternalOnClose;
    RemapComponents();
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if(PC != none && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x50
    if(Sender == Controls[11])
    {
        ur.MuteChat = !GUICheckBoxButton(Controls[25]).bChecked;
        SendChanges();
        Controller.CloseMenu();
    }
    // End:0xa7
    if(Sender == Controls[21])
    {
        ui.P.ClientMessage("Resetting server");
        SendChanges();
        ResetServer();
        Controller.CloseMenu();
    }
    return true;
}

function InternalOnChange(GUIComponent Sender);
function SendChanges()
{
    local string S;

    ui.ServerAddress = GUIEditBox(Controls[13]).TextStr;
    ui.serverPort = int(GUIEditBox(Controls[14]).TextStr);
    ui.ListenPort = int(GUIEditBox(Controls[15]).TextStr);
    ui.JoinPassword = GUIEditBox(Controls[16]).TextStr;
    ui.PrimaryPassword = GUIEditBox(Controls[17]).TextStr;
    ui.NormalPassword = GUIEditBox(Controls[18]).TextStr;
    ui.Delay = int(float(GUIEditBox(Controls[19]).TextStr));
    ui.MaxClients = int(GUIEditBox(Controls[20]).TextStr);
    ui.VipPassword = GUIEditBox(Controls[23]).TextStr;
    S = "5 serveraddress=" $ ui.ServerAddress;
    S = S $ " serverport=" $ string(ui.serverPort);
    S = S $ " listenport=" $ string(ui.ListenPort);
    S = S $ " joinpassword=" $ ui.JoinPassword;
    S = S $ " primarypassword=" $ ui.PrimaryPassword;
    S = S $ " vippassword=" $ ui.VipPassword;
    S = S $ " normalpassword=" $ ui.NormalPassword;
    S = S $ " delay=" $ string(ui.Delay);
    S = S $ " maxclients=" $ string(ui.MaxClients);
    ur.SendToServer(S);
}

function ResetServer()
{
    local string S;

    S = "6 ";
    ur.SendToServer(S);
}

defaultproperties
{
    BoxHeight=0.740
    BoxWidth=0.50
    MarginWidth=0.020
    ItemHeight=0.040
    ItemGap=0.010
    bRenderWorld=true
    bRequire640x480=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
}