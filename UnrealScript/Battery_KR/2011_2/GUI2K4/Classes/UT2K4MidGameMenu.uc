class UT2K4MidGameMenu extends UT2K4GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var localized string LeaveEntryButtonText;
var bool bPerButtonSizes;
var export editinline GUIButton SizingButton;
var() automated GUIImage MyHeader;
var() automated GUIButton bContinue;
var() automated GUIButton bQuit;
var() automated GUIButton bForfit;
var() automated GUIButton bSettings;
var() automated GUIButton bChangeTeam;
var() automated GUIButton bAdd2Favorites;
var() automated GUIButton bServerBrowser;
var() automated GUIButton bVoting;
var() automated GUIButton bMapVoting;
var() automated GUIButton bKickVoting;
var() automated GUIButton bMatchSetup;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local PlayerController PC;

    super(GUIPage).InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    // End:0x74
    if(((PC.GameReplicationInfo == none) || !PC.GameReplicationInfo.bTeamGame) || PC.GameReplicationInfo.bNoTeamChanges)
    {
        RemoveComponent(bChangeTeam);
    }
    // End:0xAD
    if(int(PC.Level.NetMode) != int(NM_Standalone))
    {
        bForfit.Caption = LeaveMPButtonText;        
    }
    else
    {
        bForfit.Caption = LeaveSPButtonText;
    }
    // End:0x10F
    if(int(PC.Level.NetMode) == int(NM_Standalone))
    {
        RemoveComponent(bVoting);
        RemoveComponent(bMapVoting);
        RemoveComponent(bKickVoting);
        RemoveComponent(bMatchSetup);
    }
    GetSizingButton();
    //return;    
}

function GetSizingButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8A [Loop If]
    if(i < Components.Length)
    {
        // End:0x80
        if(GUIButton(Components[i]) != none)
        {
            // End:0x80
            if((SizingButton == none) || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
            {
                SizingButton = GUIButton(Components[i]);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    bQuit.WinTop = 0.0000000;
    bQuit.WinHeight = YL;
    i = 0;
    J0xD7:

    // End:0x250 [Loop If]
    if(i < Components.Length)
    {
        // End:0x246
        if((GUIButton(Components[i]) != none) && Components[i] != bQuit)
        {
            // End:0x196
            if(bPerButtonSizes)
            {
                Components[i].Style.TextSize(Canvas, Components[i].MenuState, GUIButton(Components[i]).Caption, XL, YL, Components[i].FontScale);
                YL += float(8);
            }
            // End:0x1CC
            if((float(X) + XL) > bQuit.WinLeft)
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
        i++;
        // [Loop Continue]
        goto J0xD7;
    }
    MyHeader.WinHeight = (float(Y) + YL) + float(2);
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x23
    if(bIgnoreEsc && int(key) == 27)
    {
        bIgnoreEsc = false;
        return true;
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

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x30
    if(Sender == bQuit)
    {
        Controller.OpenMenu(Controller.GetQuitPage());        
    }
    else
    {
        // End:0xC7
        if(Sender == bForfit)
        {
            PlayerOwner().ConsoleCommand("DISCONNECT");
            // End:0xB5
            if(PlayerOwner().Level.Game.CurrentGameProfile != none)
            {
                PlayerOwner().Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PlayerOwner().Level, true);                
            }
            else
            {
                Controller.CloseMenu();
            }            
        }
        else
        {
            // End:0xE8
            if(Sender == bContinue)
            {
                Controller.CloseMenu();                
            }
            else
            {
                // End:0x118
                if(Sender == bSettings)
                {
                    Controller.OpenMenu(Controller.GetSettingsPage());                    
                }
                else
                {
                    // End:0x146
                    if(Sender == bChangeTeam)
                    {
                        PlayerOwner().SwitchTeam();
                        Controller.CloseMenu();                        
                    }
                    else
                    {
                        // End:0x18C
                        if(Sender == bAdd2Favorites)
                        {
                            PlayerOwner().ConsoleCommand("ADDCURRENTTOFAVORITES");
                            Controller.CloseMenu();                            
                        }
                        else
                        {
                            // End:0x1BC
                            if(Sender == bServerBrowser)
                            {
                                Controller.OpenMenu(Controller.GetServerBrowserPage());                                
                            }
                            else
                            {
                                // End:0x3E4
                                if(Sender == bVoting)
                                {
                                    // End:0x3AE
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
                                        bKickVoting.WinTop = bVoting.WinTop + (bVoting.WinHeight * float(2));
                                        bKickVoting.WinHeight = bVoting.WinHeight;
                                        bMatchSetup.bVisible = true;
                                        bMatchSetup.WinLeft = bVoting.WinLeft;
                                        bMatchSetup.WinWidth = bVoting.WinWidth;
                                        bMatchSetup.WinTop = bVoting.WinTop + (bVoting.WinHeight * float(3));
                                        bMatchSetup.WinHeight = bVoting.WinHeight;                                        
                                    }
                                    else
                                    {
                                        bMapVoting.bVisible = false;
                                        bKickVoting.bVisible = false;
                                        bMatchSetup.bVisible = false;
                                    }                                    
                                }
                                else
                                {
                                    // End:0x413
                                    if(Sender == bMapVoting)
                                    {
                                        Controller.OpenMenu(Controller.MapVotingMenu);                                        
                                    }
                                    else
                                    {
                                        // End:0x442
                                        if(Sender == bKickVoting)
                                        {
                                            Controller.OpenMenu(Controller.KickVotingMenu);                                            
                                        }
                                        else
                                        {
                                            // End:0x46E
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
    //return;    
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    // End:0x1A
    if(Sender == self)
    {
        Controller.CloseMenu();
    }
    //return;    
}

defaultproperties
{
    bIgnoreEsc=true
    LeaveMPButtonText="?? ??"
    LeaveSPButtonText="?? ??"
    LeaveEntryButtonText="?? ????"
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4MidGameMenu.MGHeader'
    begin object name="MGHeader" class=XInterface.GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        WinHeight=64.0000000
    end object
    MyHeader=MGHeader
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.ContMatchButton'
    begin object name="ContMatchButton" class=XInterface.GUIButton
        Caption="????"
        TabOrder=0
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=ContMatchButton.InternalOnKeyEvent
    end object
    bContinue=ContMatchButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.QuitGameButton'
    begin object name="QuitGameButton" class=XInterface.GUIButton
        Caption="UT2004 ???"
        TabOrder=8
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=QuitGameButton.InternalOnKeyEvent
    end object
    bQuit=QuitGameButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.LeaveMatchButton'
    begin object name="LeaveMatchButton" class=XInterface.GUIButton
        TabOrder=1
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=LeaveMatchButton.InternalOnKeyEvent
    end object
    bForfit=LeaveMatchButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.SettingsButton'
    begin object name="SettingsButton" class=XInterface.GUIButton
        Caption="??"
        TabOrder=2
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=SettingsButton.InternalOnKeyEvent
    end object
    bSettings=SettingsButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.ChangeTeamButton'
    begin object name="ChangeTeamButton" class=XInterface.GUIButton
        Caption="? ???"
        TabOrder=3
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=ChangeTeamButton.InternalOnKeyEvent
    end object
    bChangeTeam=ChangeTeamButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.AddFavoriteButton'
    begin object name="AddFavoriteButton" class=XInterface.GUIButton
        Caption="????? ??"
        TabOrder=4
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=AddFavoriteButton.InternalOnKeyEvent
    end object
    bAdd2Favorites=AddFavoriteButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.BrowserButton'
    begin object name="BrowserButton" class=XInterface.GUIButton
        Caption="?? ????"
        TabOrder=5
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=BrowserButton.InternalOnKeyEvent
    end object
    bServerBrowser=BrowserButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.VotingButton'
    begin object name="VotingButton" class=XInterface.GUIButton
        Caption="??..."
        TabOrder=6
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=VotingButton.InternalOnKeyEvent
    end object
    bVoting=VotingButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.MapVotingButton'
    begin object name="MapVotingButton" class=XInterface.GUIButton
        Caption="? ??"
        RenderWeight=0.6000000
        bTabStop=false
        bVisible=false
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=MapVotingButton.InternalOnKeyEvent
    end object
    bMapVoting=MapVotingButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.KickVotingButton'
    begin object name="KickVotingButton" class=XInterface.GUIButton
        Caption="?? ??"
        RenderWeight=0.6000000
        bTabStop=false
        bVisible=false
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=KickVotingButton.InternalOnKeyEvent
    end object
    bKickVoting=KickVotingButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4MidGameMenu.MatchSetupButton'
    begin object name="MatchSetupButton" class=XInterface.GUIButton
        Caption="?? ??"
        RenderWeight=0.6000000
        bTabStop=false
        bVisible=false
        OnClick=UT2K4MidGameMenu.InternalOnClick
        OnKeyEvent=MatchSetupButton.InternalOnKeyEvent
    end object
    bMatchSetup=MatchSetupButton
    bAllowedAsLast=true
    OnClose=UT2K4MidGameMenu.InternalOnClose
    OnPreDraw=UT2K4MidGameMenu.InternalOnPreDraw
    OnMouseRelease=UT2K4MidGameMenu.InternalOnMouseRelease
    OnKeyEvent=UT2K4MidGameMenu.InternalOnKeyEvent
}