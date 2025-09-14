/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowRequestFriendHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:10
 *
 *******************************************************************************/
class BTWindowRequestFriendHK extends BTWindowHK
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelDivider;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelInviteMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelEditMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTMultiLineEditBoxHK MultiLineEditMsg;
var localized string strInviteMsg;
var array<string> friendNames;
var array<int> friendUIDs;
var array<string> friendRequestMsg;

function SetData(string UserName, int UID, string Msg)
{
    friendNames.Length = 0;
    friendUIDs.Length = 0;
    friendRequestMsg.Length = 0;
    friendNames[friendNames.Length] = UserName;
    friendUIDs[friendUIDs.Length] = UID;
    friendRequestMsg[friendRequestMsg.Length] = Msg;
    MultiLineEditMsg.SetText(Msg);
    LabelInviteMsg.Caption = UserName $ strInviteMsg;
}

function AddData(string UserName, int UID, string Msg)
{
    // End:0x10
    if(CheckExistFriendList(UID))
    {
        return;
    }
    friendNames[friendNames.Length] = UserName;
    friendUIDs[friendUIDs.Length] = UID;
    friendRequestMsg[friendRequestMsg.Length] = Msg;
}

function UpdateData()
{
    MultiLineEditMsg.SetText(friendRequestMsg[0]);
    ApplyLocalizedStrings();
}

function DelData()
{
    // End:0x24
    if(friendNames.Length > 0)
    {
        friendNames.Remove(0, 1);
        friendUIDs.Remove(0, 1);
        friendRequestMsg.Remove(0, 1);
    }
}

function GetTopFriendInfo(out string friName, out int friID)
{
    // End:0x26
    if(IsExistFrinedList() == true)
    {
        friName = friendNames[0];
        friID = friendUIDs[0];
    }
}

function bool CheckExistFriendList(int UID)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x38 [While If]
    if(lp1 < friendUIDs.Length)
    {
        // End:0x2e
        if(friendUIDs[lp1] == UID)
        {
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool IsExistFrinedList()
{
    return friendNames.Length > 0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelDivider.BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    LabelEditMsg.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    self.LabelInviteMsg.CaptionDrawType = 0;
    ApplyLocalizedStrings();
    TopLine.CaptionPadding[0] = 4;
}

function ApplyLocalizedStrings()
{
    LabelInviteMsg.Caption = friendNames[0] $ strInviteMsg;
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    self.MultiLineEditMsg.SetText("");
    self.MultiLineEditMsg.FocusFirst(none);
}

defaultproperties
{
    begin object name=mLabelDivider class=BTOwnerDrawImageHK
        AWinPos=(X1=273.0,Y1=344.0,X2=751.0,Y2=346.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRequestFriendHK.mLabelDivider'
    LabelDivider=mLabelDivider
    begin object name=mLabelInviteMsg class=BTOwnerDrawImageHK
        AWinPos=(X1=277.0,Y1=312.0,X2=745.0,Y2=374.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRequestFriendHK.mLabelInviteMsg'
    LabelInviteMsg=mLabelInviteMsg
    begin object name=mLabelEditMsg class=BTOwnerDrawImageHK
        AWinPos=(X1=270.0,Y1=354.0,X2=751.0,Y2=448.0)
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTWindowRequestFriendHK.mLabelEditMsg'
    LabelEditMsg=mLabelEditMsg
    begin object name=mMultiLineEditMsg class=BTMultiLineEditBoxHK
        bReadOnly=true
        bUseAWinPos=true
        AWinPos=(X1=277.0,Y1=358.0,X2=745.0,Y2=440.0)
        OnDraw=OwnerDraw
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnMousePressed=OnMousePressed
        OnMouseRelease=OnMouseRelease
        OnChange=OnChange
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTMultiLineEditBoxHK'BTWindowRequestFriendHK.mMultiLineEditMsg'
    MultiLineEditMsg=mMultiLineEditMsg
    strInviteMsg=" sent you a friend invite. Do you accept?"
    fbBackgroundImage=(X1=245.0,Y1=248.0,X2=779.0,Y2=519.0)
    fbTopLine=(X1=265.0,Y1=268.0,X2=769.0,Y2=294.0)
    fbBottomLine=(X1=265.0,Y1=456.0,X2=759.0,Y2=519.0)
    fbButtonOK=(X1=391.0,Y1=462.0,X2=510.0,Y2=494.0)
    fbButtonCancel=(X1=515.0,Y1=462.0,X2=634.0,Y2=494.0)
    strTitle="Friend Invitation Request"
    strOK="Accept"
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