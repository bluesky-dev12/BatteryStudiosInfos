class BTTPTeamMemberList extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelTop[6];
var FloatBox fbButtonTop[6];
var localized string strButtonTop[6];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[6];
var export editinline BTACLTeamMemberListHK ACLList;
var export editinline BTCMTeamMemberListHK CMList;
//var delegate<OnPopup> __OnPopup__Delegate;
//var delegate<OnNonSelectPopup> __OnNonSelectPopup__Delegate;
//var delegate<OnPopupCheck> __OnPopupCheck__Delegate;

function bool ButtonTop_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x248 [Loop If]
    if(i < 6)
    {
        ButtonTop[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        fb = fbButtonTop[i];
        fb.X1 = (fb.X1 - float(19)) + AWinPos.X1;
        fb.X2 = (fb.X2 - float(19)) + AWinPos.X1;
        fb.Y1 = (fb.Y1 - float(174)) + AWinPos.Y1;
        fb.Y2 = (fb.Y2 - float(174)) + AWinPos.Y1;
        ButtonTop[i].AWinPos = fb;
        ButtonTop[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.2000000;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].__OnClick__Delegate = ButtonTop_OnClick;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x24F:

    // End:0x3DE [Loop If]
    if(i < 5)
    {
        LabelTop[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.1900000;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        i++;
        // [Loop Continue]
        goto J0x24F;
    }
    LabelTop[5] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelTop[5].bUseAWinPos = true;
    LabelTop[5].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[5].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[5].AWinPos.X2 = ButtonTop[5].AWinPos.X2;
    LabelTop[5].AWinPos.Y2 = ButtonTop[5].AWinPos.Y2;
    LabelTop[5].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[5].RenderWeight = 0.1000000;
    LabelTop[5].InitComponent(Controller, self);
    AppendComponent(LabelTop[5]);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1 + float(27), AWinPos.X2, AWinPos.Y2);
    ACLList = BTACLTeamMemberListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLTeamMemberListHK', fb));
    ACLList.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    CMList = new Class'GUIWarfareControls_Decompressed.BTCMTeamMemberListHK';
    CMList.InitComponent(self.Controller, none);
    CMList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMList.__OnClose__Delegate = ContextMenu_OnClose;
    CMList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLList.ContextMenu = CMList;
    //return;    
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
    else
    {
        ACLList.MultiColumnList.bHotTrack = true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLList.MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

delegate OnPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl)
{
    //return;    
}

delegate OnNonSelectPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl)
{
    //return;    
}

delegate OnPopupCheck(BTACLTeamMemberListHK acl, BTCMTeamMemberListHK cm)
{
    local wMatchMaker MM;
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0xED
    if(acl.ACLRowList[acl.selectIndex].DataPerColumn[6].IntValue != MM.kUID)
    {
        // End:0xDA
        if(MM.bIsOwner)
        {
            cm.ChangeStateByIndex(0, 0);
            cm.ChangeStateByIndex(1, 0);
        }
        cm.ChangeStateByIndex(3, 0);
    }
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    // End:0x16
    if(ACLList.selectIndex < 0)
    {
        return;
    }
    OnPopup(ContextMenuIndex, ACLList);
    //return;    
}

function int GetUserCount()
{
    return ACLList.ACLRowList.Length;
    //return;    
}

defaultproperties
{
    fbButtonTop[0]=(X1=19.0000000,Y1=174.0000000,X2=54.0000000,Y2=200.0000000)
    fbButtonTop[1]=(X1=54.0000000,Y1=174.0000000,X2=88.0000000,Y2=200.0000000)
    fbButtonTop[2]=(X1=88.0000000,Y1=174.0000000,X2=200.0000000,Y2=200.0000000)
    fbButtonTop[3]=(X1=200.0000000,Y1=174.0000000,X2=312.0000000,Y2=200.0000000)
    fbButtonTop[4]=(X1=312.0000000,Y1=174.0000000,X2=353.0000000,Y2=200.0000000)
    fbButtonTop[5]=(X1=353.0000000,Y1=174.0000000,X2=381.0000000,Y2=200.0000000)
    strButtonTop[0]="????"
    strButtonTop[1]="??"
    strButtonTop[2]="????????"
    strButtonTop[3]="????????"
    strButtonTop[4]="Sta."
    strButtonTop[5]="Pin"
}