/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowInviteFriendHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:9
 *
 *******************************************************************************/
class BTWindowInviteFriendHK extends BTWindow
    dependson(BTWindow)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK TopLine;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BottomLine;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonOK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelDivider;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelInviteMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelSendMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelEditMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTMultiLineEditBoxHK MultiLineEditMsg;
var localized string strTitle;
var localized string strSendMsg;
var localized string strInviteMsg;
var localized string strOK;
var localized string strCancel;
var string FriendName;
var int friendUID;
var delegate<OnOK> __OnOK__Delegate;

function SetData(string UserName, int UID)
{
    FriendName = UserName;
    friendUID = UID;
    LabelInviteMsg.Caption = FriendName $ strInviteMsg;
}

delegate bool OnOK(GUIComponent Sender);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_3;
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_ptitl_back;
    TopLine.CaptionDrawType = 3;
    i = 0;
    J0x62:
    // End:0x8f [While If]
    if(i < 5)
    {
        TopLine.FontSize[i] = 12;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    TopLine.CaptionPadding[0] = 8;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_pup_sau;
    ButtonOK.SetDefaultButtonImage();
    i = 0;
    J0xd5:
    // End:0x154 [While If]
    if(i < 5)
    {
        ButtonOK.FontSize[i] = 12;
        ButtonCancel.FontSize[i] = ButtonOK.FontSize[i];
        ButtonCancel.buttonImage[i] = ButtonOK.buttonImage[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd5;
    }
    LabelDivider.BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    LabelEditMsg.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
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
}

function ApplyLocalizedStrings()
{
    TopLine.Caption = strTitle;
    LabelSendMsg.Caption = strSendMsg;
    LabelInviteMsg.Caption = FriendName $ strInviteMsg;
    ButtonOK.Caption = strOK;
    ButtonCancel.Caption = strCancel;
}

event Opened(GUIComponent Sender)
{
    self.CurFadeTime = 1.0;
    super.Opened(Sender);
    self.MultiLineEditMsg.SetText("");
    self.MultiLineEditMsg.FocusFirst(none);
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
}

defaultproperties
{
    begin object name=mBackgroundImage class=BTOwnerDrawImageHK
        AWinPos=(X1=245.0,Y1=248.0,X2=779.0,Y2=519.0)
        RenderWeight=0.010
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    begin object name=mTopLine class=BTOwnerDrawImageHK
        AWinPos=(X1=265.0,Y1=268.0,X2=769.0,Y2=294.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mTopLine'
    TopLine=mTopLine
    begin object name=mBottomLine class=BTOwnerDrawImageHK
        AWinPos=(X1=265.0,Y1=456.0,X2=759.0,Y2=519.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mBottomLine'
    BottomLine=mBottomLine
    begin object name=mButtonOK class=BTOwnerDrawCaptionButtonHK
        Caption="OK"
        AWinPos=(X1=391.0,Y1=462.0,X2=510.0,Y2=494.0)
        OnClickSound=0
        OnRendered=OnRendered
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnClick=ButtonOK_OnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTOwnerDrawCaptionButtonHK'BTWindowInviteFriendHK.mButtonOK'
    ButtonOK=mButtonOK
    begin object name=mButtonCancel class=BTOwnerDrawCaptionButtonHK
        Caption="Cancel"
        AWinPos=(X1=515.0,Y1=462.0,X2=634.0,Y2=494.0)
        OnClickSound=0
        OnRendered=OnRendered
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnClick=XButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTOwnerDrawCaptionButtonHK'BTWindowInviteFriendHK.mButtonCancel'
    ButtonCancel=mButtonCancel
    begin object name=mLabelDivider class=BTOwnerDrawImageHK
        AWinPos=(X1=273.0,Y1=344.0,X2=751.0,Y2=346.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mLabelDivider'
    LabelDivider=mLabelDivider
    begin object name=mLabelInviteMsg class=BTOwnerDrawImageHK
        AWinPos=(X1=277.0,Y1=312.0,X2=745.0,Y2=374.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mLabelInviteMsg'
    LabelInviteMsg=mLabelInviteMsg
    begin object name=mLabelSendMsg class=BTOwnerDrawImageHK
        CaptionDrawType=3
        AWinPos=(X1=275.0,Y1=358.0,X2=358.0,Y2=378.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mLabelSendMsg'
    LabelSendMsg=mLabelSendMsg
    begin object name=mLabelEditMsg class=BTOwnerDrawImageHK
        AWinPos=(X1=351.0,Y1=354.0,X2=751.0,Y2=448.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowInviteFriendHK.mLabelEditMsg'
    LabelEditMsg=mLabelEditMsg
    begin object name=mMultiLineEditMsg class=BTMultiLineEditBoxHK
        bUseAWinPos=true
        AWinPos=(X1=357.0,Y1=358.0,X2=745.0,Y2=440.0)
        OnDraw=OwnerDraw
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnMousePressed=OnMousePressed
        OnMouseRelease=OnMouseRelease
        OnChange=OnChange
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTMultiLineEditBoxHK'BTWindowInviteFriendHK.mMultiLineEditMsg'
    MultiLineEditMsg=mMultiLineEditMsg
    strTitle="Friend Invitation"
    strSendMsg="Message"
    strInviteMsg=" will be added to your Friends List."
    strOK="Invite"
    strCancel="Cancel"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
}