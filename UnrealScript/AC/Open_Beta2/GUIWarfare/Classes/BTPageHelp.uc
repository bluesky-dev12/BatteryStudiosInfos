class BTPageHelp extends BTNetGUIPageHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK HelpImage;

function InternalOnOpen()
{
    __NFUN_270__("BTPageHelp::InternalOnOpen()");
    Log("[BTPageHelp::InternalOnOpen] ");
    PlayerOwner().Player.Console.SetOneBGM("bgm_lobby_part1");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageHelp::InternalOnClose()");
    Log("[BTPageHelp::InternalOnClose] ");
    OnClose(bCanceled);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    HelpImage = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 768.0000000 - float(697), 1024.0000000, 768.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.help_page);
    TPTopMenu.PostBox.DisableMe();
    TPTopMenu.Shop.DisableMe();
    TPTopMenu.Inventory.DisableMe();
    TPTopMenu.Clan.DisableMe();
    TPTopMenu.Option.DisableMe();
    TPTopMenu.Quest.DisableMe();
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 432.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 480.0000000;
    Controller.PushPage();
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageHelp_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageHelp_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

defaultproperties
{
    bPersistent=false
    OnOpen=BTPageHelp.InternalOnOpen
    OnClose=BTPageHelp.InternalOnClose
}