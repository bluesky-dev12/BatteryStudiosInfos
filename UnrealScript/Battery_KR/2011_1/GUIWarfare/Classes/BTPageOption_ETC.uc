class BTPageOption_ETC extends BTPageOption_Base
    editinlinenew
    instanced;

var() automated GUILabel LabelRadioLanguage;
var() automated BTComboBox ComboRadioLanguage;
var() automated GUILabel LabelShowAlly;
var() automated BTCheckBoxSet CbxsetShowAlly;
var localized string CaptionRadioLanguage;
var localized string CaptionRadioLanguageKorean;
var localized string CaptionRadioLanguageEnglish;
var localized string CaptionShowAlly;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    ComboRadioLanguage.ComboBox.AddItem(CaptionRadioLanguageKorean);
    ComboRadioLanguage.ComboBox.AddItem(CaptionRadioLanguageEnglish);
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelRadioLanguage.Caption = CaptionRadioLanguage;
    LabelShowAlly.Caption = CaptionShowAlly;
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_ETC.mLabelRadioLanguage'
    begin object name="mLabelRadioLanguage" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2591146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelRadioLanguage=mLabelRadioLanguage
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_ETC.mComboRadioLanguage'
    begin object name="mComboRadioLanguage" class=GUIWarfareControls.BTComboBox
        WinTop=0.2591146
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboRadioLanguage.InternalPreDraw
    end object
    ComboRadioLanguage=mComboRadioLanguage
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_ETC.mLabelShowAlly'
    begin object name="mLabelShowAlly" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2981771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelShowAlly=mLabelShowAlly
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_ETC.mCbxsetShowAlly'
    begin object name="mCbxsetShowAlly" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.2981771
        OnPreDraw=mCbxsetShowAlly.InternalOnPreDraw
    end object
    CbxsetShowAlly=mCbxsetShowAlly
    CaptionRadioLanguage="??? ??"
    CaptionRadioLanguageKorean="???"
    CaptionRadioLanguageEnglish="??"
    CaptionShowAlly="?? ??"
}