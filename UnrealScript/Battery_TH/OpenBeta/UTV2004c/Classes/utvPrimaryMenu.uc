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
    Controls[0].WinTop = 0.5000000 - (0.5000000 * BoxHeight);
    Controls[0].WinLeft = 0.5000000 - (0.5000000 * BoxWidth);
    Controls[1].WinHeight = ItemHeight;
    Controls[1].WinWidth = BoxWidth - (MarginWidth * float(2));
    Controls[1].WinTop = Controls[0].WinTop + 0.0020000;
    Controls[1].WinLeft = Controls[0].WinLeft + MarginWidth;
    Controls[2].WinHeight = ItemHeight;
    Controls[2].WinWidth = BoxWidth * 0.4000000;
    Controls[2].WinTop = (Controls[1].WinTop + ItemGap) + ItemHeight;
    Controls[2].WinLeft = Controls[1].WinLeft + MarginWidth;
    Controls[24].WinHeight = ItemHeight;
    Controls[24].WinWidth = BoxWidth * 0.4000000;
    Controls[24].WinTop = (Controls[2].WinTop + ItemGap) + ItemHeight;
    Controls[24].WinLeft = Controls[2].WinLeft;
    Controls[26].WinHeight = 0.0050000;
    Controls[26].WinWidth = BoxWidth - (MarginWidth * float(2));
    Controls[26].WinTop = (Controls[24].WinTop + ItemGap) + ItemHeight;
    Controls[26].WinLeft = Controls[1].WinLeft;
    Controls[3].WinHeight = ItemHeight;
    Controls[3].WinWidth = Controls[24].WinWidth;
    Controls[3].WinTop = (Controls[24].WinTop + (ItemGap * float(3))) + ItemHeight;
    Controls[3].WinLeft = Controls[24].WinLeft;
    Prev = 3;
    Mark = 0;
    A = 4;
    J0x35D:

    // End:0x46A [Loop If]
    if(A < 11)
    {
        // End:0x391
        if((A == 8) && Mark == 0)
        {
            A = 22;
            Mark = 1;
        }
        Controls[A].WinHeight = ItemHeight;
        Controls[A].WinWidth = Controls[Prev].WinWidth;
        Controls[A].WinTop = (Controls[Prev].WinTop + ItemGap) + ItemHeight;
        Controls[A].WinLeft = Controls[Prev].WinLeft;
        Prev = A;
        // End:0x460
        if((A == 22) && Mark == 1)
        {
            A = 7;
        }
        ++A;
        // [Loop Continue]
        goto J0x35D;
    }
    Controls[11].WinHeight = ItemHeight;
    Controls[11].WinWidth = Controls[10].WinWidth;
    Controls[11].WinTop = Controls[10].WinTop + (ItemHeight * float(2));
    Controls[11].WinLeft = Controls[10].WinLeft;
    Controls[12].WinHeight = ItemHeight;
    Controls[12].WinWidth = BoxWidth * 0.5000000;
    Controls[12].WinTop = (Controls[1].WinTop + (ItemGap * float(2))) + ItemHeight;
    Controls[12].WinLeft = Controls[0].WinLeft + (BoxWidth * 0.5000000);
    Controls[25].WinHeight = ItemHeight;
    Controls[25].WinWidth = ItemHeight;
    Controls[25].WinTop = Controls[12].WinTop + ItemHeight;
    Controls[25].WinLeft = Controls[12].WinLeft;
    Controls[13].WinHeight = ItemHeight;
    Controls[13].WinWidth = BoxWidth * 0.4000000;
    Controls[13].WinTop = (Controls[25].WinTop + (ItemGap * float(3))) + ItemHeight;
    Controls[13].WinLeft = Controls[25].WinLeft;
    Prev = 13;
    Mark = 0;
    A = 14;
    J0x6B3:

    // End:0x7EC [Loop If]
    if(A < 21)
    {
        // End:0x6E7
        if((A == 18) && Mark == 0)
        {
            A = 23;
            Mark = 1;
        }
        Controls[A].WinHeight = ItemHeight;
        Controls[A].WinWidth = Controls[Prev].WinWidth;
        Controls[A].WinTop = (Controls[Prev].WinTop + ItemGap) + ItemHeight;
        Controls[A].WinLeft = Controls[Prev].WinLeft;
        Controls[A].TabOrder = Controls[Prev].TabOrder + 1;
        Prev = A;
        // End:0x7E2
        if((A == 23) && Mark == 1)
        {
            A = 17;
        }
        ++A;
        // [Loop Continue]
        goto J0x6B3;
    }
    Controls[21].WinHeight = ItemHeight;
    Controls[21].WinWidth = Controls[20].WinWidth;
    Controls[21].WinTop = Controls[20].WinTop + (ItemHeight * float(2));
    Controls[21].WinLeft = Controls[20].WinLeft;
    // End:0x894
    foreach AllObjects(Class'UTV2004c_Decompressed.utvInteraction', tui)
    {
        ui = tui;        
    }    
    // End:0x8B0
    foreach AllObjects(Class'UTV2004c_Decompressed.utvReplication', tur)
    {
        ur = tur;        
    }    
    GUILabel(Controls[12]).Caption = string(ui.Clients);
    GUIEditBox(Controls[13]).TextStr = ui.ServerAddress;
    GUIEditBox(Controls[14]).TextStr = string(ui.ServerPort);
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
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if((PC != none) && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
    //return;    
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
    // End:0xA7
    if(Sender == Controls[21])
    {
        ui.P.ClientMessage("Resetting server");
        SendChanges();
        ResetServer();
        Controller.CloseMenu();
    }
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

function SendChanges()
{
    local string S;

    ui.ServerAddress = GUIEditBox(Controls[13]).TextStr;
    ui.ServerPort = int(GUIEditBox(Controls[14]).TextStr);
    ui.ListenPort = int(GUIEditBox(Controls[15]).TextStr);
    ui.JoinPassword = GUIEditBox(Controls[16]).TextStr;
    ui.PrimaryPassword = GUIEditBox(Controls[17]).TextStr;
    ui.NormalPassword = GUIEditBox(Controls[18]).TextStr;
    ui.Delay = int(float(GUIEditBox(Controls[19]).TextStr));
    ui.MaxClients = int(GUIEditBox(Controls[20]).TextStr);
    ui.VipPassword = GUIEditBox(Controls[23]).TextStr;
    S = "5 serveraddress=" $ ui.ServerAddress;
    S = (S $ " serverport=") $ string(ui.ServerPort);
    S = (S $ " listenport=") $ string(ui.ListenPort);
    S = (S $ " joinpassword=") $ ui.JoinPassword;
    S = (S $ " primarypassword=") $ ui.PrimaryPassword;
    S = (S $ " vippassword=") $ ui.VipPassword;
    S = (S $ " normalpassword=") $ ui.NormalPassword;
    S = (S $ " delay=") $ string(ui.Delay);
    S = (S $ " maxclients=") $ string(ui.MaxClients);
    ur.SendToServer(S);
    //return;    
}

function ResetServer()
{
    local string S;

    S = "6 ";
    ur.SendToServer(S);
    //return;    
}

defaultproperties
{
    BoxHeight=0.7400000
    BoxWidth=0.5000000
    MarginWidth=0.0200000
    ItemHeight=0.0400000
    ItemGap=0.0100000
    bRenderWorld=true
    bRequire640x480=false
    bAllowedAsLast=true
    // Reference: GUIImage'UTV2004c_Decompressed.utvPrimaryMenu.Background'
    begin object name="Background" class=XInterface.GUIImage
        ImageStyle=1
        bNeverFocus=true
    end object
    Controls[0]=Background
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.TitleText'
    begin object name="TitleText" class=XInterface.GUILabel
        Caption="UTV2004 Primary settings"
        TextAlign=1
        TextColor=(R=255,G=255,B=0,A=255)
    end object
    Controls[1]=TitleText
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.Label1'
    begin object name="Label1" class=XInterface.GUILabel
        Caption="Total clients"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[2]=Label1
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelSA'
    begin object name="LabelSA" class=XInterface.GUILabel
        Caption="Server address"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[3]=LabelSA
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelSP'
    begin object name="LabelSP" class=XInterface.GUILabel
        Caption="Server port"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[4]=LabelSP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelLP'
    begin object name="LabelLP" class=XInterface.GUILabel
        Caption="Listen port"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[5]=LabelLP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelJP'
    begin object name="LabelJP" class=XInterface.GUILabel
        Caption="Join password"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[6]=LabelJP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelPP'
    begin object name="LabelPP" class=XInterface.GUILabel
        Caption="Primary password"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[7]=LabelPP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelNP'
    begin object name="LabelNP" class=XInterface.GUILabel
        Caption="Normal password"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[8]=LabelNP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelD'
    begin object name="LabelD" class=XInterface.GUILabel
        Caption="Delay"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[9]=LabelD
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelMC'
    begin object name="LabelMC" class=XInterface.GUILabel
        Caption="Max clients"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[10]=LabelMC
    // Reference: GUIButton'UTV2004c_Decompressed.utvPrimaryMenu.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="OK"
        StyleName="MidGameButton"
        TabOrder=50
        OnClick=utvPrimaryMenu.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[11]=OkButton
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelTC'
    begin object name="LabelTC" class=XInterface.GUILabel
        Caption="tc"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
        bMultiLine=true
    end object
    Controls[12]=LabelTC
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxSA'
    begin object name="BoxSA" class=XInterface.GUIEditBox
        TabOrder=1
        OnActivate=BoxSA.InternalActivate
        OnDeActivate=BoxSA.InternalDeactivate
        OnKeyType=BoxSA.InternalOnKeyType
        OnKeyEvent=BoxSA.InternalOnKeyEvent
    end object
    Controls[13]=BoxSA
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxSP'
    begin object name="BoxSP" class=XInterface.GUIEditBox
        bIntOnly=true
        OnActivate=BoxSP.InternalActivate
        OnDeActivate=BoxSP.InternalDeactivate
        OnKeyType=BoxSP.InternalOnKeyType
        OnKeyEvent=BoxSP.InternalOnKeyEvent
    end object
    Controls[14]=BoxSP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxLP'
    begin object name="BoxLP" class=XInterface.GUIEditBox
        bIntOnly=true
        OnActivate=BoxLP.InternalActivate
        OnDeActivate=BoxLP.InternalDeactivate
        OnKeyType=BoxLP.InternalOnKeyType
        OnKeyEvent=BoxLP.InternalOnKeyEvent
    end object
    Controls[15]=BoxLP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxJP'
    begin object name="BoxJP" class=XInterface.GUIEditBox
        OnActivate=BoxJP.InternalActivate
        OnDeActivate=BoxJP.InternalDeactivate
        OnKeyType=BoxJP.InternalOnKeyType
        OnKeyEvent=BoxJP.InternalOnKeyEvent
    end object
    Controls[16]=BoxJP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxPP'
    begin object name="BoxPP" class=XInterface.GUIEditBox
        OnActivate=BoxPP.InternalActivate
        OnDeActivate=BoxPP.InternalDeactivate
        OnKeyType=BoxPP.InternalOnKeyType
        OnKeyEvent=BoxPP.InternalOnKeyEvent
    end object
    Controls[17]=BoxPP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxNP'
    begin object name="BoxNP" class=XInterface.GUIEditBox
        OnActivate=BoxNP.InternalActivate
        OnDeActivate=BoxNP.InternalDeactivate
        OnKeyType=BoxNP.InternalOnKeyType
        OnKeyEvent=BoxNP.InternalOnKeyEvent
    end object
    Controls[18]=BoxNP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxD'
    begin object name="BoxD" class=XInterface.GUIEditBox
        bFloatOnly=true
        OnActivate=BoxD.InternalActivate
        OnDeActivate=BoxD.InternalDeactivate
        OnKeyType=BoxD.InternalOnKeyType
        OnKeyEvent=BoxD.InternalOnKeyEvent
    end object
    Controls[19]=BoxD
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxMC'
    begin object name="BoxMC" class=XInterface.GUIEditBox
        bIntOnly=true
        OnActivate=BoxMC.InternalActivate
        OnDeActivate=BoxMC.InternalDeactivate
        OnKeyType=BoxMC.InternalOnKeyType
        OnKeyEvent=BoxMC.InternalOnKeyEvent
    end object
    Controls[20]=BoxMC
    // Reference: GUIButton'UTV2004c_Decompressed.utvPrimaryMenu.ResetButton'
    begin object name="ResetButton" class=XInterface.GUIButton
        Caption="Reset"
        StyleName="MidGameButton"
        TabOrder=51
        OnClick=utvPrimaryMenu.InternalOnClick
        OnKeyEvent=ResetButton.InternalOnKeyEvent
    end object
    Controls[21]=ResetButton
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelVP'
    begin object name="LabelVP" class=XInterface.GUILabel
        Caption="VIP password"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[22]=LabelVP
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.BoxVP'
    begin object name="BoxVP" class=XInterface.GUIEditBox
        OnActivate=BoxVP.InternalActivate
        OnDeActivate=BoxVP.InternalDeactivate
        OnKeyType=BoxVP.InternalOnKeyType
        OnKeyEvent=BoxVP.InternalOnKeyEvent
    end object
    Controls[23]=BoxVP
    // Reference: GUILabel'UTV2004c_Decompressed.utvPrimaryMenu.LabelMute'
    begin object name="LabelMute" class=XInterface.GUILabel
        Caption="Show UTV Chat"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
    end object
    Controls[24]=LabelMute
    // Reference: GUICheckBoxButton'UTV2004c_Decompressed.utvPrimaryMenu.MuteButton'
    begin object name="MuteButton" class=XInterface.GUICheckBoxButton
        TabOrder=100
        OnKeyEvent=MuteButton.InternalOnKeyEvent
    end object
    Controls[25]=MuteButton
    // Reference: GUIEditBox'UTV2004c_Decompressed.utvPrimaryMenu.HorizLine'
    begin object name="HorizLine" class=XInterface.GUIEditBox
        bAcceptsInput=false
        bNeverFocus=true
        OnActivate=HorizLine.InternalActivate
        OnDeActivate=HorizLine.InternalDeactivate
        OnKeyType=HorizLine.InternalOnKeyType
        OnKeyEvent=HorizLine.InternalOnKeyEvent
    end object
    Controls[26]=HorizLine
}