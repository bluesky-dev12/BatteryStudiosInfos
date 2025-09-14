class BTTPOptionCommunityHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var export editinline BTACLMessengerBanHK aclban;
var localized string strLabel[2];
var localized string strAllowMode[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTCMMessengerBanHK cm;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    Label.Length = 1;
    Content.Length = 1;
    InternalPadding.Length = 1;
    i = 0;
    J0x2F:

    // End:0x5F [Loop If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y2 = 3.0000000;
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    InitializeLabel();
    InitializeContent();
    __Content_AWinPos_Changed__Delegate = TPOptionCommunity_Content_AWinPos_Changed;
    ACLList_PositionChanged(0);
    aclban = BTACLMessengerBanHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMessengerBanHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 367.0000000, 296.0000000), 1.0000000));
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

function FloatBox TPOptionCommunity_Content_AWinPos_Changed(int i, int vi, FloatBox fbList)
{
    local FloatBox fbScrol;

    // End:0x190
    if(i == 0)
    {
        fbList.X1 = 378.0000000;
        fbList.Y1 = 150.0000000;
        fbList.X2 = 718.0000000;
        fbList.Y2 = 442.0000000;
        fbScrol.X1 = fbList.X2 - float(2);
        fbScrol.X2 = fbList.X2 + float(19);
        fbScrol.Y1 = fbList.Y1;
        fbScrol.Y2 = fbList.Y2;
        aclban.MultiColumnList.MyScrollBar.AWinPos = fbScrol;
        aclban.MultiColumnList.MyScrollBar.ApplyAWinPos();
        aclban.MultiColumnList.bUseAWinPos = true;
        aclban.MultiColumnList.AWinPos = fbList;
        aclban.MultiColumnList.ApplyAWinPos();
        aclban.MultiColumnBox.bUseAWinPos = true;
        aclban.MultiColumnBox.AWinPos = fbList;
        aclban.MultiColumnBox.ApplyAWinPos();
    }
    return fbList;
    //return;    
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7500000);
    BTOwnerDrawImageHK(Content[0]).BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
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
    strLabel[0]="Whisper"
    strLabel[1]="Invite to Game"
    strAllowMode[0]="Allow All"
    strAllowMode[1]="Block All"
    strAllowMode[2]="Allow Friend and Community Only"
}