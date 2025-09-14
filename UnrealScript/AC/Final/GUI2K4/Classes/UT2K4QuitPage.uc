class UT2K4QuitPage extends BlackoutWindow
    editinlinenew
    instanced;

var() automated GUIButton YesButton;
var() automated GUIButton NoButton;
var() automated GUILabel QuitDesc;

function bool InternalOnClick(GUIComponent Sender)
{
    Log("[UT2K4QuitPage::InternalOnClick]");
    // End:0xB9
    if(Sender == YesButton)
    {
        Log("[UT2K4QuitPage::InternalOnClick] YES");
        // End:0xA2
        if(PlayerOwner().Level.IsDemoBuild())
        {
            Controller.ReplaceMenu("XInterface.UT2DemoQuitPage");            
        }
        else
        {
            PlayerOwner().ConsoleCommand("exit");
        }        
    }
    else
    {
        Log("[UT2K4QuitPage::InternalOnClick] NO");
        Controller.CloseMenu(false);
    }
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x43
    if(int(State) == 3)
    {
        // End:0x2A
        if(int(key) == 11)
        {
            InternalOnClick(NoButton);            
        }
        else
        {
            // End:0x43
            if(int(key) == 13)
            {
                InternalOnClick(YesButton);
            }
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4QuitPage.cYesButton'
    begin object name="cYesButton" class=XInterface.GUIButton
        Caption="?"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5156250
        WinLeft=0.1640630
        WinWidth=0.2000000
        TabOrder=0
        OnClick=UT2K4QuitPage.InternalOnClick
        OnKeyEvent=cYesButton.InternalOnKeyEvent
    end object
    YesButton=cYesButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4QuitPage.cNoButton'
    begin object name="cNoButton" class=XInterface.GUIButton
        Caption="???"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5156250
        WinLeft=0.6109370
        WinWidth=0.2000000
        TabOrder=1
        OnClick=UT2K4QuitPage.InternalOnClick
        OnKeyEvent=cNoButton.InternalOnKeyEvent
    end object
    NoButton=cNoButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4QuitPage.cQuitDesc'
    begin object name="cQuitDesc" class=XInterface.GUILabel
        Caption="?? ????????"
        TextAlign=1
        TextColor=(R=253,G=237,B=244,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4260420
        WinHeight=32.0000000
        RenderWeight=4.0000000
    end object
    QuitDesc=cQuitDesc
    OnKeyEvent=UT2K4QuitPage.InternalOnKeyEvent
}