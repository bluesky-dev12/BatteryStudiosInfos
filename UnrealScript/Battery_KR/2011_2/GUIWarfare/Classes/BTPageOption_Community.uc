class BTPageOption_Community extends BTPageOption_Base
    editinlinenew
    instanced;

var() automated GUILabel LabelWhisper;
var() automated BTComboBox ComboWhisper;
var() automated GUILabel LabelMessage;
var() automated BTComboBox ComboMessage;
var() automated GUILabel LabelInvitation;
var() automated BTComboBox ComboInvitation;
var() automated GUILabel LabelRequestFriend;
var() automated BTComboBox ComboRequestFriend;
var() automated GUILabel LabelChatOption;
var() automated BTComboBox ComboChatOption;
var() automated GUILabel LabelJoinClan;
var() automated BTComboBox ComboJoinClan;
var localized string CaptionWhisper;
var localized string CaptionMessage;
var localized string CaptionInvitation;
var localized string CaptionRequestFriend;
var localized string CaptionChatOption;
var localized string CaptionJoinClan;
var localized string CaptionAllowAll;
var localized string CaptionDenyAll;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    ComboWhisper.ComboBox.AddItem(CaptionAllowAll);
    ComboWhisper.ComboBox.AddItem(CaptionDenyAll);
    ComboMessage.ComboBox.AddItem(CaptionAllowAll);
    ComboMessage.ComboBox.AddItem(CaptionDenyAll);
    ComboInvitation.ComboBox.AddItem(CaptionAllowAll);
    ComboInvitation.ComboBox.AddItem(CaptionDenyAll);
    ComboRequestFriend.ComboBox.AddItem(CaptionAllowAll);
    ComboRequestFriend.ComboBox.AddItem(CaptionDenyAll);
    ComboChatOption.ComboBox.AddItem(CaptionAllowAll);
    ComboChatOption.ComboBox.AddItem(CaptionDenyAll);
    ComboJoinClan.ComboBox.AddItem(CaptionAllowAll);
    ComboJoinClan.ComboBox.AddItem(CaptionDenyAll);
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelWhisper.Caption = CaptionWhisper;
    LabelMessage.Caption = CaptionMessage;
    LabelInvitation.Caption = CaptionInvitation;
    LabelRequestFriend.Caption = CaptionRequestFriend;
    LabelChatOption.Caption = CaptionChatOption;
    LabelJoinClan.Caption = CaptionJoinClan;
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelWhisper'
    begin object name="mLabelWhisper" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.2591146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelWhisper=mLabelWhisper
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboWhisper'
    begin object name="mComboWhisper" class=GUIWarfareControls.BTComboBox
        WinTop=0.2591146
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboWhisper.InternalPreDraw
    end object
    ComboWhisper=mComboWhisper
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelMessage'
    begin object name="mLabelMessage" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.2981771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelMessage=mLabelMessage
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboMessage'
    begin object name="mComboMessage" class=GUIWarfareControls.BTComboBox
        WinTop=0.2981771
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboMessage.InternalPreDraw
    end object
    ComboMessage=mComboMessage
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelInvitation'
    begin object name="mLabelInvitation" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.3372396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelInvitation=mLabelInvitation
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboInvitation'
    begin object name="mComboInvitation" class=GUIWarfareControls.BTComboBox
        WinTop=0.3372396
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboInvitation.InternalPreDraw
    end object
    ComboInvitation=mComboInvitation
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelRequestFriend'
    begin object name="mLabelRequestFriend" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.3763021
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelRequestFriend=mLabelRequestFriend
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboRequestFriend'
    begin object name="mComboRequestFriend" class=GUIWarfareControls.BTComboBox
        WinTop=0.3763021
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboRequestFriend.InternalPreDraw
    end object
    ComboRequestFriend=mComboRequestFriend
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelChatOption'
    begin object name="mLabelChatOption" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.4153646
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelChatOption=mLabelChatOption
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboChatOption'
    begin object name="mComboChatOption" class=GUIWarfareControls.BTComboBox
        WinTop=0.4153646
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboChatOption.InternalPreDraw
    end object
    ComboChatOption=mComboChatOption
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Community.mLabelJoinClan'
    begin object name="mLabelJoinClan" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.4544271
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelJoinClan=mLabelJoinClan
    // Reference: BTComboBox'GUIWarfare_Decompressed.BTPageOption_Community.mComboJoinClan'
    begin object name="mComboJoinClan" class=GUIWarfareControls.BTComboBox
        WinTop=0.4544271
        WinLeft=0.3955078
        WinWidth=0.2958984
        OnPreDraw=mComboJoinClan.InternalPreDraw
    end object
    ComboJoinClan=mComboJoinClan
    CaptionWhisper="??"
    CaptionMessage="??"
    CaptionInvitation="??"
    CaptionRequestFriend="?? ?? ???"
    CaptionChatOption="?? ??"
    CaptionJoinClan="?? ?? ??"
    CaptionAllowAll="?? ??"
    CaptionDenyAll="?? ??"
}