class BTPageOption_Sound extends BTPageOption_Base
    editinlinenew
    instanced;

var float fMusic;
var float fEffects;
var float fTTS;
var int iVoice;
var int iMode;
var int iVoiceMode;
var int iAnnounce;
var string sStatAnnouncer;
var string sRewAnnouncer;
var bool bRev;
var bool bBeep;
var bool bAuto;
var bool bMature;
var bool bLow;
var bool bCompat;
var bool b3DSound;
var bool bEAX;
var bool bDefault;
var bool bTTS;
var bool bTTSIRC;
var bool bOnlyTeamTTS;
var bool bVoiceChat;
var() automated GUILabel LabelBGMVol;
var() automated BTCheckBoxSet CbsetBGMVol;
var() automated BTSliderSet SlideBGMVol;
var() automated GUILabel LabelEffectVol;
var() automated BTCheckBoxSet CbsetEffectVol;
var() automated BTSliderSet SlideEffectVol;
var() automated FloatingImage Separator1;
var() automated GUILabel LabelVoiceChat;
var() automated BTCheckBoxSet CbsetVoiceChat;
var() automated GUILabel LabelMicVol;
var() automated BTCheckBoxSet CbsetMicVol;
var() automated BTSliderSet SlideMicVol;
var() automated GUILabel LabelVoiceVol;
var() automated BTCheckBoxSet CbsetVoiceVol;
var() automated BTSliderSet SlideVoiceVol;
var localized string CaptionBGMVol;
var localized string CaptionEffectVol;
var localized string CaptionVoiceChat;
var localized string CaptionMicVol;
var localized string CaptionVoiceVol;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    CbsetVoiceChat.SetEnabled(false);
    CbsetMicVol.SetEnabled(false);
    SlideMicVol.SetEnabled(false);
    CbsetVoiceVol.SetEnabled(false);
    SlideVoiceVol.SetEnabled(false);
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelBGMVol.Caption = CaptionBGMVol;
    LabelEffectVol.Caption = CaptionEffectVol;
    LabelVoiceChat.Caption = CaptionVoiceChat;
    LabelMicVol.Caption = CaptionMicVol;
    LabelVoiceVol.Caption = CaptionVoiceVol;
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x9E
        case SlideBGMVol:
            fMusic = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
            SlideBGMVol.Slide.SetValue(fMusic * 100.0000000);
            CbsetBGMVol.SetValue(fMusic != float(0));
            // End:0x12F
            break;
        // End:0x12C
        case SlideEffectVol:
            fEffects = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"));
            SlideEffectVol.Slide.SetValue(fEffects * 100.0000000);
            CbsetEffectVol.SetValue(fEffects != float(0));
            // End:0x12F
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;
    local bool bIsWin32;

    bIsWin32 = PlatformIsWindows() && !PlatformIs64Bit();
    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x85
        case CbsetBGMVol:
            SlideBGMVol.SetEnabled(CbsetBGMVol.GetValue());
            // End:0x82
            if(CbsetBGMVol.GetValue() == false)
            {
                SlideBGMVol.Slide.Adjust(-1.0000000);
            }
            // End:0x216
            break;
        // End:0x125
        case SlideBGMVol:
            fMusic = SlideBGMVol.Slide.Value / 100.0000000;
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(fMusic));
            PC.ConsoleCommand("SetMusicVolume" @ string(fMusic));
            // End:0x216
            break;
        // End:0x180
        case CbsetEffectVol:
            SlideEffectVol.SetEnabled(CbsetEffectVol.GetValue());
            // End:0x17D
            if(CbsetEffectVol.GetValue() == false)
            {
                SlideEffectVol.Slide.Adjust(-1.0000000);
            }
            // End:0x216
            break;
        // End:0x213
        case SlideEffectVol:
            fEffects = SlideEffectVol.Slide.Value / 100.0000000;
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fEffects));
            PC.ConsoleCommand("stopsounds");
            // End:0x216
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool SaveSettings()
{
    local PlayerController PC;
    local float fTemp;

    super.SaveSettings();
    PC = PlayerOwner();
    fTemp = SlideBGMVol.Slide.Value / 100.0000000;
    // End:0x8A
    if(fMusic != fTemp)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(fTemp));
    }
    fTemp = SlideEffectVol.Slide.Value / 100.0000000;
    // End:0x105
    if(fEffects != fTemp)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fTemp));
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Sound.mLabelBGMVol'
    begin object name="mLabelBGMVol" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2591146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelBGMVol=mLabelBGMVol
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Sound.mCbsetBGMVol'
    begin object name="mCbsetBGMVol" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.2591146
        OnPreDraw=mCbsetBGMVol.InternalOnPreDraw
        OnChange=BTPageOption_Sound.InternalOnChange
    end object
    CbsetBGMVol=mCbsetBGMVol
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Sound.mSlideBGMVol'
    begin object name="mSlideBGMVol" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="0.5"
        WinTop=0.2981771
        OnPreDraw=mSlideBGMVol.InternalOnPreDraw
        OnChange=BTPageOption_Sound.InternalOnChange
        OnLoadINI=BTPageOption_Sound.InternalOnLoadINI
    end object
    SlideBGMVol=mSlideBGMVol
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Sound.mLabelEffectVol'
    begin object name="mLabelEffectVol" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.3372396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelEffectVol=mLabelEffectVol
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Sound.mCbsetEffectVol'
    begin object name="mCbsetEffectVol" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.3372396
        OnPreDraw=mCbsetEffectVol.InternalOnPreDraw
        OnChange=BTPageOption_Sound.InternalOnChange
    end object
    CbsetEffectVol=mCbsetEffectVol
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Sound.mSlideEffectVol'
    begin object name="mSlideEffectVol" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        IniDefault="0.9"
        OnPreDraw=mSlideEffectVol.InternalOnPreDraw
        OnChange=BTPageOption_Sound.InternalOnChange
        OnLoadINI=BTPageOption_Sound.InternalOnLoadINI
    end object
    SlideEffectVol=mSlideEffectVol
    // Reference: FloatingImage'GUIWarfare_Decompressed.BTPageOption_Sound.mSeparator1'
    begin object name="mSeparator1" class=XInterface.FloatingImage
        Image=Texture'Warfare_UI.Common_1.line_bagic_2pixel'
        X1=0
        Y1=0
        X2=2
        Y2=2
        DropShadowX=0
        DropShadowY=0
        WinTop=0.4388021
        WinLeft=0.2939453
        WinWidth=0.3974609
        WinHeight=0.0013021
        RenderWeight=0.2000000
    end object
    Separator1=mSeparator1
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Sound.mLabelVoiceChat'
    begin object name="mLabelVoiceChat" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.4544271
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelVoiceChat=mLabelVoiceChat
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Sound.mCbsetVoiceChat'
    begin object name="mCbsetVoiceChat" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.4544271
        OnPreDraw=mCbsetVoiceChat.InternalOnPreDraw
    end object
    CbsetVoiceChat=mCbsetVoiceChat
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Sound.mLabelMicVol'
    begin object name="mLabelMicVol" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.4934896
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelMicVol=mLabelMicVol
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Sound.mCbsetMicVol'
    begin object name="mCbsetMicVol" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.4934896
        OnPreDraw=mCbsetMicVol.InternalOnPreDraw
    end object
    CbsetMicVol=mCbsetMicVol
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Sound.mSlideMicVol'
    begin object name="mSlideMicVol" class=GUIWarfareControls.BTSliderSet
        WinTop=0.5325521
        OnPreDraw=mSlideMicVol.InternalOnPreDraw
    end object
    SlideMicVol=mSlideMicVol
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Sound.mLabelVoiceVol'
    begin object name="mLabelVoiceVol" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.5716146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelVoiceVol=mLabelVoiceVol
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Sound.mCbsetVoiceVol'
    begin object name="mCbsetVoiceVol" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.5716146
        OnPreDraw=mCbsetVoiceVol.InternalOnPreDraw
    end object
    CbsetVoiceVol=mCbsetVoiceVol
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Sound.mSlideVoiceVol'
    begin object name="mSlideVoiceVol" class=GUIWarfareControls.BTSliderSet
        WinTop=0.6106771
        OnPreDraw=mSlideVoiceVol.InternalOnPreDraw
    end object
    SlideVoiceVol=mSlideVoiceVol
    CaptionBGMVol="?? ?? ??"
    CaptionEffectVol="??? ??"
    CaptionVoiceChat="?? ??"
    CaptionMicVol="??? ??"
    CaptionVoiceVol="?? ??"
}