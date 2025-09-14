class BTTPTopMenuHK extends GUITabPanel
    editinlinenew
    instanced;

const BtnCount = 9;

enum HEADERBUTTON_TYPE
{
    HB_TYPE_POSTBOX,                // 0
    HB_TYPE_SHOP,                   // 1
    HB_TYPE_INVENTORY,              // 2
    HB_TYPE_CLAN,                   // 3
    HB_TYPE_OPTION,                 // 4
    HB_TYPE_GOBACK,                 // 5
    HB_TYPE_QUEST,                  // 6
    HB_TYPE_EXIT,                   // 7
    HB_TYPE_LUCKY                   // 8
};

var export editinline BTOwnerDrawImageHK LabelNewMail;
var export editinline BTOwnerDrawCaptionButtonHK Quest;
var export editinline BTOwnerDrawCaptionButtonHK PostBox;
var export editinline BTOwnerDrawCaptionButtonHK Shop;
var export editinline BTOwnerDrawCaptionButtonHK Inventory;
var export editinline BTOwnerDrawCaptionButtonHK Clan;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK GoBack;
var export editinline BTOwnerDrawCaptionButtonHK Exit;
var export editinline BTOwnerDrawCaptionButtonHK Lucky;
var export editinline BTOwnerDrawImageHK TopBgDeco;
var localized string strShop;
var localized string strInven;
var localized string strLucky;
var export editinline BTOwnerDrawCaptionButtonHK ButtonList[9];
var localized string strToolTip[9];
var BTRODecorateStringHK btToolTip;
//var delegate<HeaderButton_OnClick> __HeaderButton_OnClick__Delegate;

delegate bool HeaderButton_OnClick(GUIComponent Sender)
{
    //return;    
}

function bool TopMenuButton_OnClick(GUIComponent Sender)
{
    return HeaderButton_OnClick(Sender);
    //return;    
}

function SetNewMailArrived(bool bNewMail)
{
    LabelNewMail.SetVisibility(bNewMail);
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xBC [Loop If]
    if(i < 9)
    {
        // End:0xB2
        if((ButtonList[i] != none) && int(ButtonList[i].MenuState) == int(1))
        {
            // End:0xB2
            if(strToolTip[i] != "")
            {
                btToolTip.OriginalString.Text = strToolTip[i];
                btToolTip.AWinPos = GetTooltipPos(0, 0);
                btToolTip.bNeedUpdate = true;
                btToolTip.Render(Canvas);
            }
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Image btimg;

    super(GUIPanel).InitComponent(MyController, myOwner);
    btimg = Class'Engine.BTCustomDrawHK'.static.MakeImage(64, 64, 28, none);
    TopBgDeco = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    TopBgDeco.RenderWeight = 0.5000000;
    TopBgDeco.bUseAWinPos = true;
    TopBgDeco.AWinPos.X1 = 0.0000000;
    TopBgDeco.AWinPos.Y1 = 0.0000000;
    TopBgDeco.AWinPos.X2 = 1024.0000000;
    TopBgDeco.AWinPos.Y2 = 94.0000000;
    TopBgDeco.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopBgDeco;
    TopBgDeco.InitComponent(Controller, self);
    AppendComponent(TopBgDeco);
    Quest = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    PostBox = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Shop = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Inventory = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Clan = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Option = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    GoBack = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Exit = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Lucky = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    i = 0;
    J0x18F:

    // End:0x28F [Loop If]
    if(i < 5)
    {
        Quest.buttonImage[i] = btimg;
        PostBox.buttonImage[i] = btimg;
        Shop.buttonImage[i] = btimg;
        Inventory.buttonImage[i] = btimg;
        Clan.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        GoBack.buttonImage[i] = btimg;
        Exit.buttonImage[i] = btimg;
        Lucky.buttonImage[i] = btimg;
        i++;
        // [Loop Continue]
        goto J0x18F;
    }
    Shop.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(446.0000000, 22.0000000, 598.0000000, 72.0000000);
    Inventory.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(598.0000000, 22.0000000, 750.0000000, 72.0000000);
    Quest.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(788.0000000, 20.0000000, 832.0000000, 74.0000000);
    PostBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(833.0000000, 20.0000000, 877.0000000, 74.0000000);
    Clan.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(878.0000000, 20.0000000, 922.0000000, 74.0000000);
    Option.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(923.0000000, 20.0000000, 967.0000000, 74.0000000);
    GoBack.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(968.0000000, 20.0000000, 1012.0000000, 74.0000000);
    Lucky.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(294.0000000, 22.0000000, 446.0000000, 72.0000000);
    Shop.SetDefaultFontColor();
    Shop.SetFontSizeAll(13);
    Shop.CaptionPadding[1] = 5;
    Inventory.SetDefaultFontColor();
    Inventory.SetFontSizeAll(13);
    Inventory.CaptionPadding[1] = 5;
    Lucky.SetDefaultFontColor();
    Lucky.SetFontSizeAll(13);
    Lucky.CaptionPadding[1] = 5;
    ButtonList[0] = Shop;
    ButtonList[1] = Inventory;
    ButtonList[2] = Quest;
    ButtonList[3] = PostBox;
    ButtonList[4] = Clan;
    ButtonList[5] = Option;
    ButtonList[6] = GoBack;
    ButtonList[7] = Exit;
    ButtonList[8] = Lucky;
    InitButton(Quest, int(6), "", Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_block);
    InitButton(PostBox, int(0), "", Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_block);
    InitButton(Shop, int(1), strShop, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuShop_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuShop_Btn_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuShop_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuShop_Btn_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuShop_Btn_block);
    InitButton(Inventory, int(2), strInven, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuInven_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuInven_Btn_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuInven_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuInven_Btn_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuInven_Btn_block);
    InitButton(Clan, int(3), "", Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block);
    InitButton(Option, int(4), "", Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_block);
    InitButton(GoBack, int(5), "", Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_block);
    InitButton(Lucky, int(8), strLucky, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuLuckyShop_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuLuckyShop_Btn_on, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuLuckyShop_Btn_n, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuLuckyShop_Btn_cli, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuLuckyShop_Btn_block);
    LabelNewMail = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelNewMail.RenderWeight = PostBox.RenderWeight + 0.1000000;
    LabelNewMail.bUseAWinPos = true;
    LabelNewMail.AWinPos = PostBox.AWinPos;
    LabelNewMail.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_new;
    LabelNewMail.InitComponent(Controller, self);
    AppendComponent(LabelNewMail);
    LabelNewMail.SetVisibility(false);
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
    //return;    
}

function InitButton(out BTOwnerDrawCaptionButtonHK targetButton, int ButtonID, string buttonName, Image buttonImage0, Image buttonImage1, Image buttonImage2, Image buttonImage3, Image buttonImage4)
{
    targetButton.ButtonID = ButtonID;
    targetButton.__OnClick__Delegate = TopMenuButton_OnClick;
    targetButton.buttonImage[0] = buttonImage0;
    targetButton.buttonImage[1] = buttonImage1;
    targetButton.buttonImage[2] = buttonImage2;
    targetButton.buttonImage[3] = buttonImage3;
    targetButton.buttonImage[4] = buttonImage4;
    targetButton.Caption = buttonName;
    targetButton.CaptionDrawType = 4;
    targetButton.InitComponent(Controller, self);
    AppendComponent(targetButton);
    //return;    
}

defaultproperties
{
    strShop="  Item Shop"
    strInven="  Inventory"
    strLucky="  Fortune Depot"
    strToolTip[0]="Purchase weapons, gear, and paid items."
    strToolTip[1]="Equip weapons and skills and set quick slots."
    strToolTip[2]="Review your current missions for progress and rewards."
    strToolTip[3]="View messages, gifts, and loot you have purchased at auction."
    strToolTip[4]="Join a clan, check your clan information, or manage clan members."
    strToolTip[5]="Adjust video, audio, control, and other game settings."
    strToolTip[6]="Return to the previous menu."
    strToolTip[7]="Quit Game."
    strToolTip[8]="Fortune Depot"
    OnRendered=BTTPTopMenuHK.Internal_OnRendered
}