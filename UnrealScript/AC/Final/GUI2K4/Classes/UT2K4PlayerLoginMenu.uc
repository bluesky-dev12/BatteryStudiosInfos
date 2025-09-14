class UT2K4PlayerLoginMenu extends FloatingWindow
    editinlinenew
    instanced;

var(MidGame) array<GUITabItem> Panels;
var(MidGame) GUITabItem SPRulesPanel;
var(MidGame) GUITabItem IARulesPanel;
var(MidGame) automated GUITabControl c_Main;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    local PlayerController PC;

    super.InitComponent(MyController, MyComponent);
    PC = PlayerOwner();
    // End:0x65
    if((PC != none) && int(PC.Level.NetMode) == int(NM_Standalone))
    {
        RemoveMultiplayerTabs(PC.Level.Game);
    }
    // End:0x77
    if(Panels.Length > 0)
    {
        AddPanels();
    }
    SetTitle();
    t_WindowTitle.DockedTabs = c_Main;
    //return;    
}

function bool FloatingPreDraw(Canvas C)
{
    // End:0x1C
    if(PlayerOwner().GameReplicationInfo != none)
    {
        SetVisibility(true);        
    }
    else
    {
        SetVisibility(false);
    }
    return false;
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

function AddPanels()
{
    local int i;
    local export editinline MidGamePanel Panel;

    i = 0;
    J0x07:

    // End:0x65 [Loop If]
    if(i < Panels.Length)
    {
        Panel = MidGamePanel(c_Main.AddTabItem(Panels[i]));
        // End:0x5B
        if(Panel != none)
        {
            Panel.__ModifiedChatRestriction__Delegate = UpdateChatRestriction;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UpdateChatRestriction(MidGamePanel Sender, int PlayerID)
{
    local int i;

    // End:0x0D
    if(Sender == none)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0xD5 [Loop If]
    if(i < c_Main.TabStack.Length)
    {
        // End:0xCB
        if(((c_Main.TabStack[i] != none) && MidGamePanel(c_Main.TabStack[i].MyPanel) != none) && c_Main.TabStack[i].MyPanel != Sender)
        {
            MidGamePanel(c_Main.TabStack[i].MyPanel).UpdateChatRestriction(PlayerID);
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function SetTitle()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x7F
    if(((int(PC.Level.NetMode) == int(NM_Standalone)) || PC.GameReplicationInfo == none) || PC.GameReplicationInfo.ServerName == "")
    {
        WindowName = PC.Level.GetURLMap();        
    }
    else
    {
        WindowName = "¿©±â °íÃÄÁà ÈûÂù¾ÆÀÚ¾¾¾ß";
    }
    t_WindowTitle.SetCaption(WindowName);
    //return;    
}

function RemoveMultiplayerTabs(GameInfo Game)
{
    // End:0x22
    if(Game.CurrentGameProfile != none)
    {
        Panels[2] = SPRulesPanel;
    }
    Panels.Remove(3, 1);
    Panels.Remove(1, 1);
    //return;    
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
    //return;    
}

defaultproperties
{
    Panels[0]=(ClassName="GUI2K4.UT2K4Tab_PlayerLoginControls",Caption="??",Hint="????? ??")
    Panels[1]=(ClassName="",Caption="MOTD",Hint="??? ???")
    Panels[2]=(ClassName="",Caption="?? ??",Hint="?? ??? ?? ? ???? ??")
    Panels[3]=(ClassName="",Caption="??",Hint="?? ?????? ???? ??")
    Panels[4]=(ClassName="",Caption="??",Hint="??? ??")
    SPRulesPanel=(ClassName="GUI2K4.UT2K4Tab_ServerInfo",Caption="??",Hint="?? ??")
    // Reference: GUITabControl'GUI2K4_Decompressed.UT2K4PlayerLoginMenu.LoginMenuTC'
    begin object name="LoginMenuTC" class=XInterface.GUITabControl
        bFillSpace=true
        bDockPanels=true
        TabHeight=0.0375000
        BackgroundStyleName="TabBackground"
        WinTop=0.0602150
        WinLeft=0.0125000
        WinWidth=0.9749990
        WinHeight=0.0446440
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=LoginMenuTC.InternalOnActivate
    end object
    c_Main=LoginMenuTC
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.1103130
    DefaultTop=0.0579160
    DefaultWidth=0.7796880
    DefaultHeight=0.8470830
    bRequire640x480=true
    bPersistent=true
    bAllowedAsLast=true
    OnClose=UT2K4PlayerLoginMenu.InternalOnClose
    WinTop=0.0579160
    WinLeft=0.1103130
    WinWidth=0.7796880
    WinHeight=0.8470830
}