class BTWindowInviteFriendHK extends BTWindow
    editinlinenew
    instanced;

var() automated BTOwnerDrawImageHK BackgroundImage;
var() automated BTOwnerDrawImageHK TopLine;
var() automated BTOwnerDrawImageHK BottomLine;
var() automated BTOwnerDrawCaptionButtonHK ButtonOK;
var() automated BTOwnerDrawCaptionButtonHK ButtonCancel;
var() automated BTOwnerDrawImageHK LabelDivider;
var() automated BTOwnerDrawImageHK LabelInviteMsg;
var() automated BTOwnerDrawImageHK LabelSendMsg;
var() automated BTOwnerDrawImageHK LabelEditMsg;
var() automated BTMultiLineEditBoxHK MultiLineEditMsg;
var localized string strTitle;
var localized string strSendMsg;
var localized string strInviteMsg;
var localized string strOK;
var localized string strCancel;
var string FriendName;
var int friendUID;
//var delegate<OnOK> __OnOK__Delegate;

function SetData(string UserName, int UID)
{
    FriendName = UserName;
    friendUID = UID;
    LabelInviteMsg.Caption = FriendName $ strInviteMsg;
    //return;    
}

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_3;
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back;
    TopLine.CaptionDrawType = 3;
    i = 0;
    J0x62:

    // End:0x8F [Loop If]
    if(i < 5)
    {
        TopLine.FontSize[i] = 12;
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    TopLine.CaptionPadding[0] = 8;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_pup_sau;
    ButtonOK.SetDefaultButtonImage();
    i = 0;
    J0xD5:

    // End:0x154 [Loop If]
    if(i < 5)
    {
        ButtonOK.FontSize[i] = 12;
        ButtonCancel.FontSize[i] = ButtonOK.FontSize[i];
        ButtonCancel.buttonImage[i] = ButtonOK.buttonImage[i];
        i++;
        // [Loop Continue]
        goto J0xD5;
    }
    LabelDivider.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    LabelEditMsg.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    self.LabelInviteMsg.CaptionDrawType = 0;
    self.LabelSendMsg.CaptionDrawType = 0;
    LabelSendMsg.FontSize[0] = 9;
    LabelSendMsg.FontSize[1] = 9;
    LabelSendMsg.FontSize[2] = 9;
    LabelSendMsg.FontSize[3] = 9;
    LabelSendMsg.FontSize[4] = 9;
    ApplyLocalizedStrings();
    MultiLineEditMsg.SetVisibleLineCount(5);
    MultiLineEditMsg.MaxTextStrNum = 255;
    //return;    
}

function ApplyLocalizedStrings()
{
    TopLine.Caption = strTitle;
    LabelSendMsg.Caption = strSendMsg;
    LabelInviteMsg.Caption = FriendName $ strInviteMsg;
    ButtonOK.Caption = strOK;
    ButtonCancel.Caption = strCancel;
    //return;    
}

event Opened(GUIComponent Sender)
{
    self.CurFadeTime = 1.0000000;
    super.Opened(Sender);
    self.MultiLineEditMsg.SetText("");
    self.MultiLineEditMsg.FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
    //return;    
}

defaultproperties
{
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=245.0000000,Y1=248.0000000,X2=779.0000000,Y2=519.0000000)
        RenderWeight=0.0100000
        OnRendered=mBackgroundImage.Internal_OnRendered
    end object
    BackgroundImage=mBackgroundImage
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mTopLine'
    begin object name="mTopLine" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=265.0000000,Y1=268.0000000,X2=769.0000000,Y2=294.0000000)
        OnRendered=mTopLine.Internal_OnRendered
    end object
    TopLine=mTopLine
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mBottomLine'
    begin object name="mBottomLine" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=265.0000000,Y1=456.0000000,X2=759.0000000,Y2=519.0000000)
        OnRendered=mBottomLine.Internal_OnRendered
    end object
    BottomLine=mBottomLine
    // Reference: BTOwnerDrawCaptionButtonHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mButtonOK'
    begin object name="mButtonOK" class=GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK
        Caption="OK"
        AWinPos=(X1=391.0000000,Y1=462.0000000,X2=510.0000000,Y2=494.0000000)
        OnClickSound=0
        OnRendered=mButtonOK.OnRendered
        OnActivate=mButtonOK.InternalActivate
        OnDeActivate=mButtonOK.InternalDeactivate
        OnClick=BTWindowInviteFriendHK.ButtonOK_OnClick
        OnKeyEvent=mButtonOK.InternalOnKeyEvent
    end object
    ButtonOK=mButtonOK
    // Reference: BTOwnerDrawCaptionButtonHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mButtonCancel'
    begin object name="mButtonCancel" class=GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK
        Caption="Cancel"
        AWinPos=(X1=515.0000000,Y1=462.0000000,X2=634.0000000,Y2=494.0000000)
        OnClickSound=0
        OnRendered=mButtonCancel.OnRendered
        OnActivate=mButtonCancel.InternalActivate
        OnDeActivate=mButtonCancel.InternalDeactivate
        OnClick=BTWindowInviteFriendHK.XButtonClicked
        OnKeyEvent=mButtonCancel.InternalOnKeyEvent
    end object
    ButtonCancel=mButtonCancel
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mLabelDivider'
    begin object name="mLabelDivider" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=273.0000000,Y1=344.0000000,X2=751.0000000,Y2=346.0000000)
        OnRendered=mLabelDivider.Internal_OnRendered
    end object
    LabelDivider=mLabelDivider
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mLabelInviteMsg'
    begin object name="mLabelInviteMsg" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=277.0000000,Y1=312.0000000,X2=745.0000000,Y2=374.0000000)
        OnRendered=mLabelInviteMsg.Internal_OnRendered
    end object
    LabelInviteMsg=mLabelInviteMsg
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mLabelSendMsg'
    begin object name="mLabelSendMsg" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=275.0000000,Y1=358.0000000,X2=358.0000000,Y2=378.0000000)
        OnRendered=mLabelSendMsg.Internal_OnRendered
    end object
    LabelSendMsg=mLabelSendMsg
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mLabelEditMsg'
    begin object name="mLabelEditMsg" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=351.0000000,Y1=354.0000000,X2=751.0000000,Y2=448.0000000)
        OnRendered=mLabelEditMsg.Internal_OnRendered
    end object
    LabelEditMsg=mLabelEditMsg
    // Reference: BTMultiLineEditBoxHK'GUIWarfareControls_Decompressed.BTWindowInviteFriendHK.mMultiLineEditMsg'
    begin object name="mMultiLineEditMsg" class=GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=357.0000000,Y1=358.0000000,X2=745.0000000,Y2=440.0000000)
        OnDraw=mMultiLineEditMsg.OwnerDraw
        OnActivate=mMultiLineEditMsg.InternalActivate
        OnDeActivate=mMultiLineEditMsg.InternalDeactivate
        OnMousePressed=mMultiLineEditMsg.OnMousePressed
        OnMouseRelease=mMultiLineEditMsg.OnMouseRelease
        OnChange=mMultiLineEditMsg.OnChange
        OnKeyType=mMultiLineEditMsg.InternalOnKeyType
        OnKeyEvent=mMultiLineEditMsg.InternalOnKeyEvent
    end object
    MultiLineEditMsg=mMultiLineEditMsg
    strTitle="??????????"
    strSendMsg="??????????"
    strInviteMsg="?????????????"
    strOK="??????????"
    strCancel="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}