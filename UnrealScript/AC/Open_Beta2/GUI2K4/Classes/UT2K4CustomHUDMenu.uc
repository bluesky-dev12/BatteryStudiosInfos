class UT2K4CustomHUDMenu extends LargeWindow
    abstract
    editinlinenew
    instanced;

var Class<GameInfo> GameClass;
var() automated GUIButton b_Cancel;
var() automated GUIButton b_Reset;
var() automated GUIButton b_OK;

function HandleParameters(string GameClassName, string Nothing)
{
    super(GUIPage).HandleParameters(GameClassName, Nothing);
    // End:0x24
    if(InitializeGameClass(GameClassName))
    {
        LoadSettings();
    }
    //return;    
}

function bool InitializeGameClass(string GameClassName)
{
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x1C
    if(bCancelled)
    {
        return;
    }
    SaveSettings();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_Reset)
    {
        RestoreDefaults();        
    }
    else
    {
        // End:0x48
        if(GUIButton(Sender) != none)
        {
            Controller.CloseMenu(GUIButton(Sender) == b_Cancel);
        }
    }
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

function LoadSettings()
{
    //return;    
}

function SaveSettings()
{
    //return;    
}

function RestoreDefaults()
{
    LoadSettings();
    //return;    
}

defaultproperties
{
    DefaultLeft=0.1250000
    DefaultTop=0.1500000
    DefaultWidth=0.5983980
    DefaultHeight=0.7000000
    WinTop=0.1500000
    WinLeft=0.1250000
    WinWidth=0.5983980
    WinHeight=0.7000000
}