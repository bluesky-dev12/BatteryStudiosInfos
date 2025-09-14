/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4MidGameMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4MidGameMenu extends UT2K4GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var localized string LeaveEntryButtonText;
var bool bPerButtonSizes;
var export editinline GUIButton SizingButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage MyHeader;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bContinue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bQuit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bForfit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bSettings;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bChangeTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bAdd2Favorites;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bServerBrowser;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bVoting;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bMapVoting;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bKickVoting;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton bMatchSetup;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local PlayerController PC;

    super(GUIPage).InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    // End:0x74
    if(PC.GameReplicationInfo == none || !PC.GameReplicationInfo.bTeamGame || PC.GameReplicationInfo.bNoTeamChanges)
    {
        RemoveComponent(bChangeTeam);
    }
    // End:0xad
    if(PC.Level.NetMode != 0)
    {
        bForfit.Caption = LeaveMPButtonText;
    }
    // End:0xc1
    else
    {
        bForfit.Caption = LeaveSPButtonText;
    }
    // End:0x10f
    if(PC.Level.NetMode == 0)
    {
        RemoveComponent(bVoting);
        RemoveComponent(bMapVoting);
        RemoveComponent(bKickVoting);
        RemoveComponent(bMatchSetup);
    }
    GetSizingButton();
}

function GetSizingButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8a [While If]
    if(i < Components.Length)
    {
        // End:0x80
        if(GUIButton(Components[i]) != none)
        {
            // End:0x80
            if(SizingButton == none || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
            {
                SizingButton = GUIButton(Components[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local int i, X, Y;
    local float XL, YL;

    SizingButton.Style.TextSize(Canvas, SizingButton.MenuState, SizingButton.Caption, XL, YL, SizingButton.FontScale);
    XL += float(16);
    YL += float(8);
    bQuit.WinWidth = XL;
    bQuit.WinLeft = Canvas.ClipX - bQuit.WinWidth;
    bQuit.WinTop = 0.0;
    bQuit.WinHeight = YL;
    i = 0;
    J0xd7:
    // End:0x250 [While If]
    if(i < Components.Length)
    {
        // End:0x246
        if(GUIButton(Components[i]) != none && Components[i] != bQuit)
        {
            // End:0x196
            if(bPerButtonSizes)
            {
                Components[i].Style.TextSize(Canvas, Components[i].MenuState, GUIButton(Components[i]).Caption, XL, YL, Components[i].FontScale);
                YL += float(8);
            }
            // End:0x1cc
            if(float(X) + XL > bQuit.WinLeft)
            {
                X = 0;
                Y += int(YL);
            }
            Components[i].WinTop = float(Y);
            Components[i].WinLeft = float(X);
            Components[i].WinWidth = XL;
            Components[i].WinHeight = YL;
            X += int(XL);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd7;
    }
    MyHeader.WinHeight = float(Y) + YL + float(2);
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x23
    if(bIgnoreEsc && key == 27)
    {
        bIgnoreEsc = false;
        return true;
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

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x30
    if(Sender == bQuit)
    {
        Controller.OpenMenu(Controller.GetQuitPage());
    }
    // End:0x46e
    else
    {
        // End:0xc7
        if(Sender == bForfit)
        {
            PlayerOwner().ConsoleCommand("DISCONNECT");
            // End:0xb5
            if(PlayerOwner().Level.Game.CurrentGameProfile != none)
            {
                PlayerOwner().Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PlayerOwner().Level, true);
            }
            // End:0xc4
            else
            {
                Controller.CloseMenu();
            }
        }
        // End:0x46e
        else
        {
            // End:0xe8
            if(Sender == bContinue)
            {
                Controller.CloseMenu();
            }
            // End:0x46e
            else
            {
                // End:0x118
                if(Sender == bSettings)
                {
                    Controller.OpenMenu(Controller.GetSettingsPage());
                }
                // End:0x46e
                else
                {
                    // End:0x146
                    if(Sender == bChangeTeam)
                    {
                        PlayerOwner().SwitchTeam();
                        Controller.CloseMenu();
                    }
                    // End:0x46e
                    else
                    {
                        // End:0x18c
                        if(Sender == bAdd2Favorites)
                        {
                            PlayerOwner().ConsoleCommand("ADDCURRENTTOFAVORITES");
                            Controller.CloseMenu();
                        }
                        // End:0x46e
                        else
                        {
                            // End:0x1bc
                            if(Sender == bServerBrowser)
                            {
                                Controller.OpenMenu(Controller.GetServerBrowserPage());
                            }
                            // End:0x46e
                            else
                            {
                                // End:0x3e4
                                if(Sender == bVoting)
                                {
                                    // End:0x3ae
                                    if(bMapVoting.bVisible == false)
                                    {
                                        bMapVoting.bVisible = true;
                                        bMapVoting.WinLeft = bVoting.WinLeft;
                                        bMapVoting.WinWidth = bVoting.WinWidth;
                                        bMapVoting.WinTop = bVoting.WinTop + bVoting.WinHeight;
                                        bMapVoting.WinHeight = bVoting.WinHeight;
                                        bKickVoting.bVisible = true;
                                        bKickVoting.WinLeft = bVoting.WinLeft;
                                        bKickVoting.WinWidth = bVoting.WinWidth;
                                        bKickVoting.WinTop = bVoting.WinTop + bVoting.WinHeight * float(2);
                                        bKickVoting.WinHeight = bVoting.WinHeight;
                                        bMatchSetup.bVisible = true;
                                        bMatchSetup.WinLeft = bVoting.WinLeft;
                                        bMatchSetup.WinWidth = bVoting.WinWidth;
                                        bMatchSetup.WinTop = bVoting.WinTop + bVoting.WinHeight * float(3);
                                        bMatchSetup.WinHeight = bVoting.WinHeight;
                                    }
                                    // End:0x3e1
                                    else
                                    {
                                        bMapVoting.bVisible = false;
                                        bKickVoting.bVisible = false;
                                        bMatchSetup.bVisible = false;
                                    }
                                }
                                // End:0x46e
                                else
                                {
                                    // End:0x413
                                    if(Sender == bMapVoting)
                                    {
                                        Controller.OpenMenu(Controller.MapVotingMenu);
                                    }
                                    // End:0x46e
                                    else
                                    {
                                        // End:0x442
                                        if(Sender == bKickVoting)
                                        {
                                            Controller.OpenMenu(Controller.KickVotingMenu);
                                        }
                                        // End:0x46e
                                        else
                                        {
                                            // End:0x46e
                                            if(Sender == bMatchSetup)
                                            {
                                                Controller.OpenMenu(Controller.MatchSetupMenu);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    // End:0x1a
    if(Sender == self)
    {
        Controller.CloseMenu();
    }
}

defaultproperties
{
    bIgnoreEsc=true
    LeaveMPButtonText="?? ??"
    LeaveSPButtonText="?? ??"
    LeaveEntryButtonText="?? ????"
    begin object name=MGHeader class=GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        WinHeight=64.0
    object end
    // Reference: GUIImage'UT2K4MidGameMenu.MGHeader'
    MyHeader=MGHeader
    begin object name=ContMatchButton class=GUIButton
        Caption="????"
        TabOrder=0
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.ContMatchButton'
    bContinue=ContMatchButton
    begin object name=QuitGameButton class=GUIButton
        Caption="UT2004 ???"
        TabOrder=8
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.QuitGameButton'
    bQuit=QuitGameButton
    begin object name=LeaveMatchButton class=GUIButton
        TabOrder=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.LeaveMatchButton'
    bForfit=LeaveMatchButton
    begin object name=SettingsButton class=GUIButton
        Caption="??"
        TabOrder=2
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.SettingsButton'
    bSettings=SettingsButton
    begin object name=ChangeTeamButton class=GUIButton
        Caption="? ???"
        TabOrder=3
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.ChangeTeamButton'
    bChangeTeam=ChangeTeamButton
    begin object name=AddFavoriteButton class=GUIButton
        Caption="????? ??"
        TabOrder=4
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.AddFavoriteButton'
    bAdd2Favorites=AddFavoriteButton
    begin object name=BrowserButton class=GUIButton
        Caption="?? ????"
        TabOrder=5
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.BrowserButton'
    bServerBrowser=BrowserButton
    begin object name=VotingButton class=GUIButton
        Caption="??..."
        TabOrder=6
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.VotingButton'
    bVoting=VotingButton
    begin object name=MapVotingButton class=GUIButton
        Caption="? ??"
        RenderWeight=0.60
        bTabStop=true
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.MapVotingButton'
    bMapVoting=MapVotingButton
    begin object name=KickVotingButton class=GUIButton
        Caption="?? ??"
        RenderWeight=0.60
        bTabStop=true
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.KickVotingButton'
    bKickVoting=KickVotingButton
    begin object name=MatchSetupButton class=GUIButton
        Caption="?? ??"
        RenderWeight=0.60
        bTabStop=true
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4MidGameMenu.MatchSetupButton'
    bMatchSetup=MatchSetupButton
    bAllowedAsLast=true
    OnClose=InternalOnClose
    OnPreDraw=InternalOnPreDraw
    OnMouseRelease=InternalOnMouseRelease
    OnKeyEvent=InternalOnKeyEvent
}