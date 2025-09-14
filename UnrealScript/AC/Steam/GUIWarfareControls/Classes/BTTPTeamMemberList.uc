/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPTeamMemberList.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:9
 *
 *******************************************************************************/
class BTTPTeamMemberList extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelTop[6];
var FloatBox fbButtonTop[6];
var localized string strButtonTop[6];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[6];
var export editinline BTACLTeamMemberListHK ACLList;
var export editinline BTCMTeamMemberListHK CMList;
var delegate<OnPopup> __OnPopup__Delegate;
var delegate<OnNonSelectPopup> __OnNonSelectPopup__Delegate;
var delegate<OnPopupCheck> __OnPopupCheck__Delegate;

function bool ButtonTop_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x220 [While If]
    if(i < 5)
    {
        ButtonTop[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        fb = fbButtonTop[i];
        fb.X1 = fb.X1 - float(13) + AWinPos.X1;
        fb.X2 = fb.X2 - float(13) + AWinPos.X1;
        ButtonTop[i].AWinPos = fb;
        ButtonTop[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.20;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].__OnClick__Delegate = ButtonTop_OnClick;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ACLList = BTACLTeamMemberListHK(NewComponent(new class'BTACLTeamMemberListHK', fb));
    ACLList.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    ACLList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    CMList = new class'BTCMTeamMemberListHK';
    CMList.InitComponent(self.Controller, none);
    CMList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMList.__OnClose__Delegate = ContextMenu_OnClose;
    CMList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLList.ContextMenu = CMList;
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x84
    if(ACLList.selectIndex >= 0)
    {
        ACLList.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLList.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(ACLList, CMList);
        return true;
    }
    // End:0x9e
    else
    {
        ACLList.MultiColumnList.bHotTrack = true;
    }
    return false;
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLList.MultiColumnList.bHotTrack = true;
    return true;
}

delegate OnPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl);
delegate OnNonSelectPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl);
delegate OnPopupCheck(BTACLTeamMemberListHK acl, BTCMTeamMemberListHK cm)
{
    local wMatchMaker MM;
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0xed
    if(acl.ACLRowList[acl.selectIndex].DataPerColumn[6].IntValue != MM.kUID)
    {
        // End:0xda
        if(MM.bIsOwner)
        {
            cm.ChangeStateByIndex(0, 0);
            cm.ChangeStateByIndex(1, 0);
        }
        cm.ChangeStateByIndex(3, 0);
    }
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    // End:0x16
    if(ACLList.selectIndex < 0)
    {
        return;
    }
    OnPopup(ContextMenuIndex, ACLList);
}

function int GetUserCount()
{
    return ACLList.ACLRowList.Length;
}

defaultproperties
{
    fbButtonTop[0]=(X1=13.0,Y1=189.0,X2=47.0,Y2=202.0)
    fbButtonTop[1]=(X1=47.0,Y1=189.0,X2=88.0,Y2=202.0)
    fbButtonTop[2]=(X1=81.0,Y1=189.0,X2=205.0,Y2=202.0)
    fbButtonTop[3]=(X1=205.0,Y1=189.0,X2=329.0,Y2=202.0)
    fbButtonTop[4]=(X1=329.0,Y1=189.0,X2=373.0,Y2=202.0)
    strButtonTop[0]="Clan"
    strButtonTop[1]="Lv."
    strButtonTop[2]="Nickname"
    strButtonTop[3]="Clan Name"
    strButtonTop[4]="Status"
    strButtonTop[5]="Ping"
}