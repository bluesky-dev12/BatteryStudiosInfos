class BTTPOptionCommunityHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var export editinline BTACLMessengerBanHK aclban;
var localized string strLabel[6];
var localized string strAllowMode[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTCMMessengerBanHK cm;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    Label.Length = 6;
    Content.Length = 6;
    InternalPadding.Length = 6;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 6)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    InitializeLabel();
    InitializeContent();
    __Content_AWinPos_Changed__Delegate = TPOptionCommunity_Content_AWinPos_Changed;
    ACLList_PositionChanged(0);
    aclban = BTACLMessengerBanHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMessengerBanHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 500.0000000, 300.0000000), 1.0000000));
    aclban.BackgroundImage.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1.Image;
    cm = new Class'GUIWarfareControls_Decompressed.BTCMMessengerBanHK';
    cm.InitComponent(Controller, none);
    cm.__OnOpen__Delegate = ContextMenu_OnOpen;
    cm.__OnClose__Delegate = ContextMenu_OnClose;
    cm.__OnSelected__Delegate = ContextMenu_OnSelected;
    aclban.ContextMenu = cm;
    MM = PlayerOwner().Level.GetMatchMaker();
    UpdateBlockUserList(MM.BlockUserListForOption);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FloatBox TPOptionCommunity_Content_AWinPos_Changed(int i, int vi, FloatBox fb)
{
    local FloatBox fb2;

    // End:0x1A3
    if(i == 5)
    {
        fb.Y2 = fbACLList.Y2;
        fb.X2 = fb.X2 - float(15);
        fb2.X1 = fb.X2 + float(1);
        fb2.X2 = fb.X2 + float(15);
        fb2.Y1 = fb.Y1;
        fb2.Y2 = fb.Y2;
        aclban.MultiColumnList.MyScrollBar.AWinPos = fb2;
        aclban.MultiColumnList.MyScrollBar.ApplyAWinPos();
        aclban.AWinPos = fb;
        aclban.ApplyAWinPos();
        aclban.MultiColumnList.bUseAWinPos = true;
        aclban.MultiColumnList.AWinPos = fb;
        aclban.MultiColumnList.ApplyAWinPos();
        aclban.MultiColumnBox.bUseAWinPos = true;
        aclban.MultiColumnBox.AWinPos = fb;
        aclban.MultiColumnBox.ApplyAWinPos();
    }
    return fb;
    //return;    
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[2]);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[1]);
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[0]).DisableMe();
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7900000);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[2]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[1]);
    BTComboBoxHK(Content[1]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[1]).DisableMe();
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7800000);
    BTComboBoxHK(Content[2]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[2]).ComboBox.AddItem(strAllowMode[1]);
    BTComboBoxHK(Content[2]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[2]).DisableMe();
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTComboBoxHK(Content[3]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[3]).ComboBox.AddItem(strAllowMode[1]);
    BTComboBoxHK(Content[3]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[3]).DisableMe();
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTOwnerDrawImageHK(Content[4]).BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7500000);
    BTOwnerDrawImageHK(Content[5]).BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local wMatchMaker MM;

    // End:0x16
    if(aclban.selectIndex < 0)
    {
        return;
    }
    Log("[BTTPOptionCommnunityHK::ContextMenu_OnSelected]");
    MM = PlayerOwner().Level.GetMatchMaker();
    MM.kTcpChannel.sfReqRemoveBlockUserList(aclban.GetUserName(aclban.selectIndex));
    //return;    
}

function UpdateBlockUserList(array<string> blockuserlist)
{
    local int i;

    aclban.SavePos();
    aclban.RemoveAll();
    i = 0;
    J0x25:

    // End:0x59 [Loop If]
    if(i < blockuserlist.Length)
    {
        aclban.AddBlockUser(blockuserlist[i]);
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    aclban.LoadPos();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x70
    if(aclban.selectIndex >= 0)
    {
        aclban.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(aclban.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        return true;        
    }
    else
    {
        aclban.MultiColumnList.bHotTrack = true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    aclban.MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

defaultproperties
{
    strLabel[0]="???"
    strLabel[1]="??? ????"
    strLabel[2]="?? ??"
    strLabel[3]="?? ??"
    strLabel[5]="?? ???"
    strAllowMode[0]="?? ??"
    strAllowMode[1]="??&???&PC???? ??"
    strAllowMode[2]="??&???? ??"
}