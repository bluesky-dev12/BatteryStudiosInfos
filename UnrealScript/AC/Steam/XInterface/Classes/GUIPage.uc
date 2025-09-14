/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:24
 *
 *******************************************************************************/
class GUIPage extends GUIMultiComponent
    dependson(GUIMultiComponent)
    native
    editinlinenew
    abstract
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
var() editconst noexport editinline GUIPage ParentPage;
var() Material Background;
var() Color BackgroundColor;
var() Color InactiveFadeColor;
var() Color ActiveFadeColor;
var() Sound OpenSound;
var() Sound CloseSound;
var() GUI.EMenuRenderStyle BackgroundRStyle;
var delegate<OnOpen> __OnOpen__Delegate;
var delegate<OnReOpen> __OnReOpen__Delegate;
var delegate<OnClose> __OnClose__Delegate;
var delegate<OnCanClose> __OnCanClose__Delegate;
var delegate<FadedIn> __FadedIn__Delegate;
var delegate<FadedOut> __FadedOut__Delegate;

delegate OnOpen()
{
    // End:0x25
    if(Controller != none && Controller.bSnapCursor)
    {
        CenterMouse();
    }
}

delegate OnReOpen();
delegate OnClose(optional bool bCancelled);
delegate bool OnCanClose(optional bool bCancelled)
{
    return true;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    OnClose(bCancelled);
}

function PlayOpenSound()
{
    PlayerOwner().PlayOwnedSound(OpenSound, 6, 1.0);
}

function PlayCloseSound()
{
    PlayerOwner().PlayOwnedSound(CloseSound, 6, 1.0);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    FocusFirst(none);
}

function CheckResolution(bool Closing, GUIController InController)
{
    local string CurrentRes, Xstr, Ystr;
    local int ResX, ResY;

    // End:0x0d
    if(InController == none)
    {
        return;
    }
    // End:0x8d
    if(InController.ResX == 0 || InController.ResY == 0)
    {
        CurrentRes = PlayerOwner().ConsoleCommand("GETCURRENTRES");
        // End:0x8a
        if(Divide(CurrentRes, "x", Xstr, Ystr))
        {
            ResX = int(Xstr);
            ResY = int(Ystr);
        }
    }
    // End:0xe2
    else
    {
        ResX = InController.ResX;
        ResY = InController.ResY;
        CurrentRes = string(InController.ResX) $ "x" $ string(InController.ResY);
    }
    // End:0x1da
    if(!Closing)
    {
        // End:0x1d8
        if(InController != none && ResX < 640 && ResY < 480 && bRequire640x480)
        {
            // End:0x18a
            if(InController.bModAuthor)
            {
                Log(string(Name) $ ".CheckResolution() - menu requires 640x480.  Currently at " $ CurrentRes, 'ModAuthor');
            }
            InController.GameResolution = CurrentRes;
            Console(InController.Master.Console).DelayedConsoleCommand("TEMPSETRES 640x480");
        }
        return;
    }
    // End:0x1fe
    if(!bRequire640x480 || InController.GameResolution == "")
    {
        return;
    }
    // End:0x36d
    if(CurrentRes != InController.GameResolution)
    {
        // End:0x2f1
        if(!InController.NeedsMenuResolution())
        {
            // End:0x29f
            if(InController.bModAuthor)
            {
                Log(string(Name) $ ".CheckResolution() - restoring menu resolution to standard value:" @ InController.GameResolution, 'ModAuthor');
            }
            Console(InController.Master.Console).DelayedConsoleCommand("SETRES" @ InController.GameResolution);
            InController.GameResolution = "";
        }
        // End:0x36d
        else
        {
            // End:0x36d
            if(InController.bModAuthor)
            {
                Log(string(Name) $ ".CheckResolution() - not restoring resolution to standard value: ParentMenu would abort.", 'ModAuthor');
            }
        }
    }
}

event ChangeHint(string NewHint)
{
    SetHint(NewHint);
}

event SetFocus(GUIComponent Who)
{
    // End:0x0d
    if(Who == none)
    {
        return;
    }
    super.SetFocus(Who);
}

event HandleParameters(string Param1, string Param2);
function bool GetRestoreParams(out string Param1, out string Param2);
function HandleObject(Object obj, optional Object OptionalObj_1, optional Object OptionalObj_2);
function string GetDataString()
{
    return "";
}

function SetDataString(string str);
function bool NotifyLevelChange()
{
    LevelChanged();
    return true;
}

event free();
final function bool IsOpen()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return Controller.FindMenuIndex(self) != -1;
}

function bool AllowOpen(string MenuClass)
{
    return true;
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    FadedIn();
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    FadedOut();
}

delegate FadedIn();
delegate FadedOut();

defaultproperties
{
    bCaptureInput=true
    bRequire640x480=true
    BackgroundColor=(R=255,G=255,B=255,A=255)
    InactiveFadeColor=(R=64,G=64,B=64,A=255)
    ActiveFadeColor=(R=255,G=255,B=255,A=255)
    BackgroundRStyle=1
    RenderWeight=0.00010
    bTabStop=true
    bAcceptsInput=true
}