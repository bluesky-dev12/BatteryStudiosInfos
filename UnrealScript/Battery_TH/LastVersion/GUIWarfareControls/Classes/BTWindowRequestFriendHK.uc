class BTWindowRequestFriendHK extends BTWindowHK
    editinlinenew
    instanced;

var() automated BTOwnerDrawImageHK LabelDivider;
var() automated BTOwnerDrawImageHK LabelInviteMsg;
var() automated BTOwnerDrawImageHK LabelEditMsg;
var() automated BTMultiLineEditBoxHK MultiLineEditMsg;
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
    //return;    
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
    //return;    
}

function UpdateData()
{
    MultiLineEditMsg.SetText(friendRequestMsg[0]);
    ApplyLocalizedStrings();
    //return;    
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
    //return;    
}

function GetTopFriendInfo(out string friName, out int friID)
{
    // End:0x26
    if((IsExistFrinedList()) == true)
    {
        friName = friendNames[0];
        friID = friendUIDs[0];
    }
    //return;    
}

function bool CheckExistFriendList(int UID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(lp1 < friendUIDs.Length)
    {
        // End:0x2E
        if(friendUIDs[lp1] == UID)
        {
            return true;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool IsExistFrinedList()
{
    return friendNames.Length > 0;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelDivider.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    LabelEditMsg.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    self.LabelInviteMsg.CaptionDrawType = 0;
    ApplyLocalizedStrings();
    TopLine.CaptionPadding[0] = 4;
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelInviteMsg.Caption = friendNames[0] $ strInviteMsg;
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    self.MultiLineEditMsg.SetText("");
    self.MultiLineEditMsg.FocusFirst(none);
    //return;    
}

defaultproperties
{
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRequestFriendHK.mLabelDivider'
    begin object name="mLabelDivider" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=273.0000000,Y1=344.0000000,X2=751.0000000,Y2=346.0000000)
        OnRendered=mLabelDivider.Internal_OnRendered
    end object
    LabelDivider=mLabelDivider
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRequestFriendHK.mLabelInviteMsg'
    begin object name="mLabelInviteMsg" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=277.0000000,Y1=312.0000000,X2=745.0000000,Y2=374.0000000)
        OnRendered=mLabelInviteMsg.Internal_OnRendered
    end object
    LabelInviteMsg=mLabelInviteMsg
    // Reference: BTOwnerDrawImageHK'GUIWarfareControls_Decompressed.BTWindowRequestFriendHK.mLabelEditMsg'
    begin object name="mLabelEditMsg" class=GUIWarfareControls_Decompressed.BTOwnerDrawImageHK
        AWinPos=(X1=270.0000000,Y1=354.0000000,X2=751.0000000,Y2=448.0000000)
        OnRendered=mLabelEditMsg.Internal_OnRendered
    end object
    LabelEditMsg=mLabelEditMsg
    // Reference: BTMultiLineEditBoxHK'GUIWarfareControls_Decompressed.BTWindowRequestFriendHK.mMultiLineEditMsg'
    begin object name="mMultiLineEditMsg" class=GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK
        bReadOnly=true
        bUseAWinPos=true
        AWinPos=(X1=277.0000000,Y1=358.0000000,X2=745.0000000,Y2=440.0000000)
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
    strInviteMsg="??????????????????? ????????????"
    fbBackgroundImage=(X1=245.0000000,Y1=248.0000000,X2=779.0000000,Y2=519.0000000)
    fbTopLine=(X1=265.0000000,Y1=268.0000000,X2=769.0000000,Y2=294.0000000)
    fbBottomLine=(X1=265.0000000,Y1=456.0000000,X2=759.0000000,Y2=519.0000000)
    fbButtonOK=(X1=391.0000000,Y1=462.0000000,X2=510.0000000,Y2=494.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=462.0000000,X2=634.0000000,Y2=494.0000000)
    strTitle="????????????"
    strOK="??????"
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