class PopupPageBase extends UT2K4GUIPage
    editinlinenew
    instanced;

var bool bFadeTimeChangeAlpha;
var bool bFadeTimeChangeColor;
var bool bFadeTimeTranslate;
var bool bUseChangeAlpha;
var bool bUseTranslate;
var() automated FloatingImage i_FrameBG;
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
//var delegate<OnFadeEnd> __OnFadeEnd__Delegate;

event Opened(GUIComponent Sender)
{
    FadeIn(bUseTranslate, bUseChangeAlpha);
    super(GUIMultiComponent).Opened(Sender);
    //return;    
}

function bool FindPoupPageBaseInMenuStack(GUIPage CurrentPage)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6B [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x61
        if((Controller.MenuStack[i] != CurrentPage) && PopupPageBase(Controller.MenuStack[i]) != none)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

delegate OnFadeEnd()
{
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local float fadeDirection;
    local byte fadeByte;
    local bool bFadedState;

    // End:0x0E
    if(bFading == false)
    {
        return false;
    }
    bFadedState = FindPoupPageBaseInMenuStack(self);
    // End:0x2A1
    if(CurFadeTime < FadeTime)
    {
        // End:0x6D
        if((CurFadeTime + Controller.RenderDelta) >= FadeTime)
        {
            CurFadeTime = FadeTime;
            CurFade = DesiredFade;
            OnFadeEnd();            
        }
        else
        {
            CurFadeTime += Controller.RenderDelta;
            CurFade = byte(float(StartFade) + (float(int(DesiredFade) - int(StartFade)) * (CurFadeTime / FadeTime)));
        }
        // End:0xEA
        if(bFadedState == false)
        {
            InactiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(CurFade, CurFade, CurFade, byte(255));            
        }
        else
        {
            InactiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(default.DesiredFade, default.DesiredFade, default.DesiredFade, byte(255));
        }
        // End:0x137
        if(bCallFadeIn)
        {
            fadeDirection = 1.0000000 - (CurFadeTime / FadeTime);            
        }
        else
        {
            fadeDirection = CurFadeTime / FadeTime;
        }
        // End:0x196
        if(bFadeTimeChangeAlpha)
        {
            fadeByte = byte((1.0000000 - fadeDirection) * 255.0000000);
            ActiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), fadeByte);            
        }
        else
        {
            // End:0x1E5
            if(bFadeTimeChangeColor)
            {
                fadeByte = byte((1.0000000 - fadeDirection) * 255.0000000);
                ActiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(fadeByte, fadeByte, fadeByte, byte(255));                
            }
            else
            {
                ActiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(255));
            }
        }
        // End:0x255
        if(bFadeTimeTranslate)
        {
            AWinFrame.X1 = fadeDirection * float(1024);
            AWinFrame.X2 = (fadeDirection + float(1)) * float(1024);
            self.TraversalApplyAWinPos();
        }
        // End:0x294
        if(CurFadeTime >= FadeTime)
        {
            bFading = false;
            // End:0x28A
            if(bClosing)
            {
                bClosing = false;
                FadedOut();                
            }
            else
            {
                FadedIn();
            }
        }
        PlayerOwner().ResetKeySleepTime();
    }
    return false;
    //return;    
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x64
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = true;
        bClosing = false;
        bFading = true;
        CurFadeTime = 0.0000000;
        DesiredFade = 100;
        StartFade = byte(255);
        bFadeTimeTranslate = bTranslate;
        bFadeTimeChangeAlpha = bChangeAlpha;        
    }
    else
    {
        FadedIn();
    }
    //return;    
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x70
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = false;
        // End:0x6D
        if(bClosing == false)
        {
            bFading = true;
            bClosing = true;
            CurFadeTime = 0.0000000;
            DesiredFade = byte(255);
            StartFade = 100;
            bFadeTimeTranslate = bTranslate;
            bFadeTimeChangeAlpha = bChangeAlpha;
        }        
    }
    else
    {
        FadedOut();
    }
    //return;    
}

function Default_FadedOut()
{
    Controller.CloseMenuPage(self);
    //return;    
}

defaultproperties
{
    // Reference: FloatingImage'GUI2K4_Decompressed.PopupPageBase.FloatingFrameBackground'
    begin object name="FloatingFrameBackground" class=XInterface.FloatingImage
        ImageStyle=1
        ImageRenderStyle=1
        WinTop=0.0200000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=0.9800000
        RenderWeight=0.0000030
    end object
    i_FrameBG=FloatingFrameBackground
    FadeTime=0.3000000
    CurFade=255
    DesiredFade=100
    bRenderWorld=true
    bRequire640x480=false
    BackgroundRStyle=4
    FadedOut=PopupPageBase.Default_FadedOut
    OnPreDraw=PopupPageBase.InternalOnPreDraw
}