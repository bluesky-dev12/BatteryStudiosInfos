/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\Team3PlayerLoginMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:8
 *
 *******************************************************************************/
class Team3PlayerLoginMenu extends FloatingWindow
    editinlinenew
    instanced;

var(MidGame) array<GUITabItem> Panels;
var(MidGame) GUITabItem SPRulesPanel;
var(MidGame) GUITabItem IARulesPanel;
var(MidGame) /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Main;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    local PlayerController PC;

    super.InitComponent(MyController, MyComponent);
    PC = PlayerOwner();
    // End:0x65
    if(PC != none && PC.Level.NetMode == 0)
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
}

function bool FloatingPreDraw(Canvas C)
{
    // End:0x1c
    if(PlayerOwner().GameReplicationInfo != none)
    {
        SetVisibility(true);
    }
    // End:0x23
    else
    {
        SetVisibility(false);
    }
    return false;
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

function AddPanels()
{
    local int i;
    local export editinline MidGamePanel Panel;

    i = 0;
    J0x07:
    // End:0x65 [While If]
    if(i < Panels.Length)
    {
        Panel = MidGamePanel(c_Main.AddTabItem(Panels[i]));
        // End:0x5b
        if(Panel != none)
        {
            Panel.__ModifiedChatRestriction__Delegate = UpdateChatRestriction;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UpdateChatRestriction(MidGamePanel Sender, int PlayerID)
{
    local int i;

    // End:0x0d
    if(Sender == none)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0xd5 [While If]
    if(i < c_Main.TabStack.Length)
    {
        // End:0xcb
        if(c_Main.TabStack[i] != none && MidGamePanel(c_Main.TabStack[i].MyPanel) != none && c_Main.TabStack[i].MyPanel != Sender)
        {
            MidGamePanel(c_Main.TabStack[i].MyPanel).UpdateChatRestriction(PlayerID);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function SetTitle()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x7f
    if(PC.Level.NetMode == 0 || PC.GameReplicationInfo == none || PC.GameReplicationInfo.ServerName == "")
    {
        WindowName = PC.Level.GetURLMap();
    }
    // End:0x9f
    else
    {
        WindowName = "???? ?????? ????????????";
    }
    t_WindowTitle.SetCaption(WindowName);
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
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
}

defaultproperties
{
    Panels=// Object reference not set to an instance of an object.
    
    SPRulesPanel=(ClassName="GUI2K4.UT2K4Tab_ServerInfo",Caption="Rules",Hint="Game settings")
    begin object name=LoginMenuTC class=GUITabControl
        bFillSpace=true
        bDockPanels=true
        TabHeight=30.0
        BackgroundStyleName="TabBackground"
        WinTop=45.0
        WinLeft=8.0
        WinWidth=800.0
        WinHeight=32.0
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=InternalOnActivate
    object end
    // Reference: GUITabControl'Team3PlayerLoginMenu.LoginMenuTC'
    c_Main=LoginMenuTC
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bMoveAllowed=true
    DefaultLeft=104.0
    DefaultTop=38.0
    DefaultWidth=816.0
    DefaultHeight=652.0
    bRequire640x480=true
    bPersistent=true
    bAllowedAsLast=true
    OnClose=InternalOnClose
    WinTop=38.0
    WinLeft=104.0
    WinWidth=816.0
    WinHeight=652.0
}