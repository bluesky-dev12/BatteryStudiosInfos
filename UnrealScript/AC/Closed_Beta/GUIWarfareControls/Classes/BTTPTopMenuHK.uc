class BTTPTopMenuHK extends GUITabPanel
    editinlinenew
    instanced;

const BtnCount = 7;

var export editinline BTOwnerDrawImageHK LabelNewMail;
var export editinline BTOwnerDrawCaptionButtonHK Quest;
var export editinline BTOwnerDrawCaptionButtonHK PostBox;
var export editinline BTOwnerDrawCaptionButtonHK Shop;
var export editinline BTOwnerDrawCaptionButtonHK Inventory;
var export editinline BTOwnerDrawCaptionButtonHK Clan;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK GoBack;
var export editinline BTOwnerDrawImageHK TopBgDeco;
var localized string strShop;
var localized string strInven;
var export editinline BTOwnerDrawCaptionButtonHK ButtonList[7];
var localized string strTooltip[7];
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
    if(i < 7)
    {
        // End:0xB2
        if((ButtonList[i] != none) && int(ButtonList[i].MenuState) == int(1))
        {
            // End:0xB2
            if(strTooltip[i] != "")
            {
                btToolTip.OriginalString.Text = strTooltip[i];
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
    Quest = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    PostBox = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Shop = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Inventory = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
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
    Clan = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Option = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    GoBack = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    i = 0;
    J0x171:

    // End:0x23D [Loop If]
    if(i < 5)
    {
        Quest.buttonImage[i] = btimg;
        PostBox.buttonImage[i] = btimg;
        Shop.buttonImage[i] = btimg;
        Inventory.buttonImage[i] = btimg;
        Clan.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        GoBack.buttonImage[i] = btimg;
        i++;
        // [Loop Continue]
        goto J0x171;
    }
    Shop.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(446.0000000, 22.0000000, 598.0000000, 72.0000000);
    Shop.SetDefaultFontColor();
    Inventory.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(598.0000000, 22.0000000, 750.0000000, 72.0000000);
    Inventory.SetDefaultFontColor();
    Quest.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(788.0000000, 20.0000000, 832.0000000, 74.0000000);
    PostBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(833.0000000, 20.0000000, 877.0000000, 74.0000000);
    Clan.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(878.0000000, 20.0000000, 922.0000000, 74.0000000);
    Option.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(923.0000000, 20.0000000, 967.0000000, 74.0000000);
    GoBack.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(968.0000000, 20.0000000, 1012.0000000, 74.0000000);
    ButtonList[0] = Quest;
    ButtonList[1] = PostBox;
    ButtonList[2] = Shop;
    ButtonList[3] = Inventory;
    ButtonList[4] = Clan;
    ButtonList[5] = Option;
    ButtonList[6] = GoBack;
    Quest.ButtonID = 11;
    Quest.__OnClick__Delegate = TopMenuButton_OnClick;
    Quest.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_n;
    Quest.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_on;
    Quest.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_n;
    Quest.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_cli;
    Quest.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_block;
    Quest.InitComponent(Controller, self);
    AppendComponent(Quest);
    PostBox.ButtonID = 1;
    PostBox.__OnClick__Delegate = TopMenuButton_OnClick;
    PostBox.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_n;
    PostBox.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_on;
    PostBox.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_n;
    PostBox.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_cli;
    PostBox.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Mailbox_block;
    PostBox.InitComponent(Controller, self);
    AppendComponent(PostBox);
    LabelNewMail = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelNewMail.RenderWeight = PostBox.RenderWeight + 0.1000000;
    LabelNewMail.bUseAWinPos = true;
    LabelNewMail.AWinPos = PostBox.AWinPos;
    LabelNewMail.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_new;
    LabelNewMail.InitComponent(Controller, self);
    AppendComponent(LabelNewMail);
    LabelNewMail.SetVisibility(false);
    Shop.ButtonID = 2;
    Shop.__OnClick__Delegate = TopMenuButton_OnClick;
    Shop.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_n;
    Shop.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_on;
    Shop.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_n;
    Shop.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_cli;
    Shop.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_block;
    Shop.Caption = strShop;
    Shop.InitComponent(Controller, self);
    AppendComponent(Shop);
    Inventory.ButtonID = 3;
    Inventory.__OnClick__Delegate = TopMenuButton_OnClick;
    Inventory.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_n;
    Inventory.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_on;
    Inventory.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_n;
    Inventory.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_cli;
    Inventory.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.TopMenuBtn_block;
    Inventory.Caption = strInven;
    Inventory.InitComponent(Controller, self);
    AppendComponent(Inventory);
    Clan.ButtonID = 5;
    Clan.__OnClick__Delegate = TopMenuButton_OnClick;
    Clan.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.InitComponent(Controller, self);
    AppendComponent(Clan);
    Option.ButtonID = 9;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_on;
    Option.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_cli;
    Option.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_block;
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    GoBack.ButtonID = 10;
    GoBack.__OnClick__Delegate = TopMenuButton_OnClick;
    GoBack.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_n;
    GoBack.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_on;
    GoBack.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_n;
    GoBack.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_cli;
    GoBack.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Back_block;
    GoBack.InitComponent(Controller, self);
    AppendComponent(GoBack);
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

defaultproperties
{
    strShop="Item Shop"
    strInven="Inventory"
    strTooltip[0]="Review your current missions for progress and rewards."
    strTooltip[1]="View messages, gifts, and loot you have purchased at auction."
    strTooltip[2]="Purchase weapons, gear, and paid items."
    strTooltip[3]="Equip weapons and skills and set quick slots."
    strTooltip[4]="Join a clan, check your clan information, or manage clan members."
    strTooltip[5]="Adjust video, audio, control, and other game settings."
    strTooltip[6]="Return to the previous menu."
    OnRendered=BTTPTopMenuHK.Internal_OnRendered
}