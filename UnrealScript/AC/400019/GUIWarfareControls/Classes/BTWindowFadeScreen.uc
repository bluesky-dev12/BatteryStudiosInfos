class BTWindowFadeScreen extends BTWindowStateHK
    editinlinenew
    instanced;

var FloatBox fbShowLabelInfo[2];
var Image ImgCircle;
var export editinline BTOwnerDrawImageHK ImgFade;
var export editinline BTOwnerDrawImageHK ShowLabelInfo[2];
var float FadeInTime;
var float FadeInStartTime;
var float CloseWaitTime;
var bool FadeInStart;
var string strFadeInSound;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0xA9 [Loop If]
    if(i < 2)
    {
        ShowLabelInfo[i] = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbShowLabelInfo[i]));
        ShowLabelInfo[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
        ShowLabelInfo[i].SetFontSizeAll(21);
        ShowLabelInfo[i].SetVisibility(false);
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    ImgFade = NewLabelComponent(fbBackgroundImage, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Combo_New_Back_Blur);
    BackgroundImage.SetVisibility(false);
    //return;    
}

static function bool StartFadeInOut(GUIController con, float _fadeOutTime, float _holdingTime, float _fadeInTime, float _closeWaitTime, optional Image ImageBack)
{
    // End:0x94
    if(con.OpenMenu("GUIWarfareControls.BTWindowFadeScreen") == false)
    {
        Log("[BTWindowFadeScreen::StartFadeInOut] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    BTWindowFadeScreen(con.TopPage()).FadeTime = _fadeOutTime;
    BTWindowFadeScreen(con.TopPage()).StartTimeOut(_fadeOutTime + _holdingTime);
    BTWindowFadeScreen(con.TopPage()).FadeInTime = _fadeInTime;
    BTWindowFadeScreen(con.TopPage()).CloseWaitTime = _closeWaitTime;
    BTWindowFadeScreen(con.TopPage()).ImgCircle = ImageBack;
    BTWindowFadeScreen(con.TopPage()).BackgroundImage.BackgroundImage = ImageBack;
    return true;
    //return;    
}

function DefaultCloseWindow_OnTimeOut(GUIComponent Sender)
{
    local int i;

    // End:0xC8
    if(!FadeInStart)
    {
        FadeInStartTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
        BTWindowFadeScreen(Controller.TopPage()).StartTimeOut(FadeInTime + CloseWaitTime);
        FadeInStart = true;
        BackgroundImage.SetVisibility(true);
        i = 0;
        J0x83:

        // End:0xAF [Loop If]
        if(i < 2)
        {
            ShowLabelInfo[i].SetVisibility(true);
            ++i;
            // [Loop Continue]
            goto J0x83;
        }
        PlayerOwner().FmodClientPlaySound(strFadeInSound,,, 6);        
    }
    else
    {
        Controller.CloseMenu(false);
    }
    //return;    
}

function InternalOnRendered(Canvas C)
{
    local int widthSize, heightSize;
    local FloatBox fbSize;
    local float fadeInCurrentTime;

    FloatingRendered(C);
    // End:0x12E
    if((bFading && bCallFadeIn) && CurFadeTime < FadeTime)
    {
        widthSize = int(Lerp(CurFadeTime / FadeTime, 1024.0000000, 0.0000000));
        heightSize = int(Lerp(CurFadeTime / FadeTime, 768.0000000, 0.0000000));
        fbSize.X1 = (1024.0000000 - float(widthSize)) / float(2);
        fbSize.Y1 = (768.0000000 - float(heightSize)) / float(2);
        fbSize.X2 = fbSize.X1 + float(widthSize);
        fbSize.Y2 = fbSize.Y1 + float(heightSize);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImgCircle, fbSize.X1, fbSize.Y1, fbSize.X2, fbSize.Y2);        
    }
    else
    {
        // End:0x1AF
        if(FadeInStart)
        {
            fadeInCurrentTime = Controller.ViewportOwner.Actor.Level.TimeSeconds - FadeInStartTime;
            // End:0x1AF
            if(fadeInCurrentTime < FadeInTime)
            {
                ImgFade.BackgroundImage.DrawColor.A = byte(Lerp(fadeInCurrentTime / FadeInTime, 255.0000000, 0.0000000));
            }
        }
    }
    //return;    
}

defaultproperties
{
    fbShowLabelInfo[0]=(X1=66.0000000,Y1=460.0000000,X2=958.0000000,Y2=486.0000000)
    fbShowLabelInfo[1]=(X1=66.0000000,Y1=492.0000000,X2=958.0000000,Y2=518.0000000)
    fbBackgroundImage=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    UseOpenSound=false
    UseCloseSound=false
    bUseChangeAlpha=false
    OnRendered=BTWindowFadeScreen.InternalOnRendered
}