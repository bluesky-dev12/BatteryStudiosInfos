/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\PopupPageBase.uc
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
class PopupPageBase extends UT2K4GUIPage
    editinlinenew
    instanced;

var bool bFadeTimeChangeAlpha;
var bool bFadeTimeChangeColor;
var bool bFadeTimeTranslate;
var bool bUseChangeAlpha;
var bool bUseTranslate;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify FloatingImage i_FrameBG;
var bool bCallFadeIn;
var bool bFading;
var bool bClosing;
var(Fade) float FadeTime;
var(Fade) float CurFadeTime;
var(Fade) byte CurFade;
var(Fade) byte DesiredFade;
var(Fade) byte StartFade;
var FloatBox CurAWinPos;
var FloatBox DesiredAWinPos;
var FloatBox slidePos;
var delegate<OnFadeEnd> __OnFadeEnd__Delegate;

event Opened(GUIComponent Sender)
{
    FadeIn(bUseTranslate, bUseChangeAlpha);
    super(GUIMultiComponent).Opened(Sender);
}

function bool FindPoupPageBaseInMenuStack(GUIPage CurrentPage)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6b [While If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x61
        if(Controller.MenuStack[i] != CurrentPage && PopupPageBase(Controller.MenuStack[i]) != none)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

delegate OnFadeEnd();
function bool InternalOnPreDraw(Canvas C)
{
    local float fadeDirection;
    local byte fadeByte;
    local bool bFadedState;

    // End:0x0e
    if(bFading == false)
    {
        return false;
    }
    bFadedState = FindPoupPageBaseInMenuStack(self);
    // End:0x2a1
    if(CurFadeTime < FadeTime)
    {
        // End:0x6d
        if(CurFadeTime + Controller.RenderDelta >= FadeTime)
        {
            CurFadeTime = FadeTime;
            CurFade = DesiredFade;
            OnFadeEnd();
        }
        // End:0xb3
        else
        {
            CurFadeTime += Controller.RenderDelta;
            CurFade = byte(float(StartFade) + float(DesiredFade - StartFade) * CurFadeTime / FadeTime);
        }
        // End:0xea
        if(bFadedState == false)
        {
            InactiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(CurFade, CurFade, CurFade, byte(255));
        }
        // End:0x112
        else
        {
            InactiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(default.DesiredFade, default.DesiredFade, default.DesiredFade, byte(255));
        }
        // End:0x137
        if(bCallFadeIn)
        {
            fadeDirection = 1.0 - CurFadeTime / FadeTime;
        }
        // End:0x149
        else
        {
            fadeDirection = CurFadeTime / FadeTime;
        }
        // End:0x196
        if(bFadeTimeChangeAlpha)
        {
            fadeByte = byte(1.0 - fadeDirection * 255.0);
            ActiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), fadeByte);
        }
        // End:0x20a
        else
        {
            // End:0x1e5
            if(bFadeTimeChangeColor)
            {
                fadeByte = byte(1.0 - fadeDirection * 255.0);
                ActiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(fadeByte, fadeByte, fadeByte, byte(255));
            }
            // End:0x20a
            else
            {
                ActiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
            }
        }
        // End:0x255
        if(bFadeTimeTranslate)
        {
            AWinFrame.X1 = fadeDirection * float(1024);
            AWinFrame.X2 = fadeDirection + float(1) * float(1024);
            self.TraversalApplyAWinPos();
        }
        // End:0x294
        if(CurFadeTime >= FadeTime)
        {
            bFading = false;
            // End:0x28a
            if(bClosing)
            {
                bClosing = false;
                FadedOut();
            }
            // End:0x294
            else
            {
                FadedIn();
            }
        }
        PlayerOwner().ResetKeySleepTime();
    }
    return false;
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x64
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = true;
        bClosing = false;
        bFading = true;
        CurFadeTime = 0.0;
        DesiredFade = 100;
        StartFade = byte(255);
        bFadeTimeTranslate = bTranslate;
        bFadeTimeChangeAlpha = bChangeAlpha;
    }
    // End:0x6e
    else
    {
        FadedIn();
    }
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x70
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = false;
        // End:0x6d
        if(bClosing == false)
        {
            bFading = true;
            bClosing = true;
            CurFadeTime = 0.0;
            DesiredFade = byte(255);
            StartFade = 100;
            bFadeTimeTranslate = bTranslate;
            bFadeTimeChangeAlpha = bChangeAlpha;
        }
    }
    // End:0x7a
    else
    {
        FadedOut();
    }
}

function Default_FadedOut()
{
    Controller.CloseMenuPage(self);
}

defaultproperties
{
    begin object name=FloatingFrameBackground class=FloatingImage
        ImageStyle=1
        ImageRenderStyle=1
        WinTop=0.020
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=0.980
        RenderWeight=0.0000030
    object end
    // Reference: FloatingImage'PopupPageBase.FloatingFrameBackground'
    i_FrameBG=FloatingFrameBackground
    FadeTime=0.30
    CurFade=255
    DesiredFade=100
    bRenderWorld=true
    bRequire640x480=true
    BackgroundRStyle=4
    FadedOut=Default_FadedOut
    OnPreDraw=InternalOnPreDraw
}