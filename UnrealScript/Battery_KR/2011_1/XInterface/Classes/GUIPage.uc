class GUIPage extends GUIMultiComponent
    abstract
    native
    editinlinenew
    instanced;

var() bool bRenderWorld;
var() bool bPauseIfPossible;
var() bool bCheckResolution;
var() bool bCaptureInput;
var() bool bRequire640x480;
var() bool bPersistent;
var() bool bDisconnectOnOpen;
var() bool bAllowedAsLast;
var() bool bRestorable;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIPage ParentPage;
var() Material Background;
var() Color BackgroundColor;
var() Color InactiveFadeColor;
var() Color ActiveFadeColor;
var() Sound OpenSound;
var() Sound CloseSound;
var() GUI.EMenuRenderStyle BackgroundRStyle;
//var delegate<OnOpen> __OnOpen__Delegate;
//var delegate<OnReOpen> __OnReOpen__Delegate;
//var delegate<OnClose> __OnClose__Delegate;
//var delegate<OnCanClose> __OnCanClose__Delegate;
//var delegate<FadedIn> __FadedIn__Delegate;
//var delegate<FadedOut> __FadedOut__Delegate;

delegate OnOpen()
{
    // End:0x25
    if((Controller != none) && Controller.bSnapCursor)
    {
        CenterMouse();
    }
    //return;    
}

delegate OnReOpen()
{
    //return;    
}

delegate OnClose(optional bool bCancelled)
{
    //return;    
}

delegate bool OnCanClose(optional bool bCancelled)
{
    return true;
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    OnClose(bCancelled);
    //return;    
}

function PlayOpenSound()
{
    PlayerOwner().PlayOwnedSound(OpenSound, 6, 1.0000000);
    //return;    
}

function PlayCloseSound()
{
    PlayerOwner().PlayOwnedSound(CloseSound, 6, 1.0000000);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    FocusFirst(none);
    //return;    
}

function CheckResolution(bool Closing, GUIController InController)
{
    local string CurrentRes, Xstr, Ystr;
    local int ResX, ResY;

    // End:0x0D
    if(InController == none)
    {
        return;
    }
    // End:0x8D
    if((InController.ResX == 0) || InController.ResY == 0)
    {
        CurrentRes = PlayerOwner().ConsoleCommand("GETCURRENTRES");
        // End:0x8A
        if(Divide(CurrentRes, "x", Xstr, Ystr))
        {
            ResX = int(Xstr);
            ResY = int(Ystr);
        }        
    }
    else
    {
        ResX = InController.ResX;
        ResY = InController.ResY;
        CurrentRes = (string(InController.ResX) $ "x") $ string(InController.ResY);
    }
    // End:0x1DA
    if(!Closing)
    {
        // End:0x1D8
        if((((InController != none) && ResX < 640) && ResY < 480) && bRequire640x480)
        {
            // End:0x18A
            if(InController.bModAuthor)
            {
                Log((string(Name) $ ".CheckResolution() - menu requires 640x480.  Currently at ") $ CurrentRes, 'ModAuthor');
            }
            InController.GameResolution = CurrentRes;
            Console(InController.Master.Console).DelayedConsoleCommand("TEMPSETRES 640x480");
        }
        return;
    }
    // End:0x1FE
    if(!bRequire640x480 || InController.GameResolution == "")
    {
        return;
    }
    // End:0x36D
    if(CurrentRes != InController.GameResolution)
    {
        // End:0x2F1
        if(!InController.NeedsMenuResolution())
        {
            // End:0x29F
            if(InController.bModAuthor)
            {
                Log((string(Name) $ ".CheckResolution() - restoring menu resolution to standard value:") @ InController.GameResolution, 'ModAuthor');
            }
            Console(InController.Master.Console).DelayedConsoleCommand("SETRES" @ InController.GameResolution);
            InController.GameResolution = "";            
        }
        else
        {
            // End:0x36D
            if(InController.bModAuthor)
            {
                Log(string(Name) $ ".CheckResolution() - not restoring resolution to standard value: ParentMenu would abort.", 'ModAuthor');
            }
        }
    }
    //return;    
}

event ChangeHint(string NewHint)
{
    SetHint(NewHint);
    //return;    
}

event SetFocus(GUIComponent Who)
{
    // End:0x0D
    if(Who == none)
    {
        return;
    }
    super.SetFocus(Who);
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    //return;    
}

function bool GetRestoreParams(out string Param1, out string Param2)
{
    //return;    
}

function HandleObject(Object obj, optional Object OptionalObj_1, optional Object OptionalObj_2)
{
    //return;    
}

function string GetDataString()
{
    return "";
    //return;    
}

function SetDataString(string str)
{
    //return;    
}

function bool NotifyLevelChange()
{
    LevelChanged();
    return true;
    //return;    
}

event free()
{
    //return;    
}

final function bool IsOpen()
{
    // End:0x0D
    if(Controller == none)
    {
        return false;
    }
    return Controller.FindMenuIndex(self) != -1;
    //return;    
}

function bool AllowOpen(string MenuClass)
{
    return true;
    //return;    
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    FadedIn();
    //return;    
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    FadedOut();
    //return;    
}

delegate FadedIn()
{
    //return;    
}

delegate FadedOut()
{
    //return;    
}

defaultproperties
{
    bCaptureInput=true
    bRequire640x480=true
    BackgroundColor=(R=255,G=255,B=255,A=255)
    InactiveFadeColor=(R=64,G=64,B=64,A=255)
    ActiveFadeColor=(R=255,G=255,B=255,A=255)
    BackgroundRStyle=1
    RenderWeight=0.0001000
    bTabStop=false
    bAcceptsInput=true
}