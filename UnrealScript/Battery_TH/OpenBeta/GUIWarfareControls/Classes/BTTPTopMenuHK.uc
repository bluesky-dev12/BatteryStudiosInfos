class BTTPTopMenuHK extends GUITabPanel
    editinlinenew
    instanced;

const BtnCount = 10;

var export editinline BTOwnerDrawImageHK LabelNewMail;
var export editinline BTOwnerDrawCaptionButtonHK Quest;
var export editinline BTOwnerDrawCaptionButtonHK MyInfo;
var export editinline BTOwnerDrawCaptionButtonHK PostBox;
var export editinline BTOwnerDrawCaptionButtonHK Shop;
var export editinline BTOwnerDrawCaptionButtonHK Inventory;
var export editinline BTOwnerDrawCaptionButtonHK Auction;
var export editinline BTOwnerDrawCaptionButtonHK Clan;
var export editinline BTOwnerDrawCaptionButtonHK Help;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK GoBack;
var export editinline BTOwnerDrawCaptionButtonHK ButtonList[10];
var localized string strTooltip[10];
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
    if(i < 10)
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
    MyInfo = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    PostBox = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Shop = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Inventory = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Option = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    GoBack = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    i = 0;
    J0x9C:

    // End:0x1B6 [Loop If]
    if(i < 5)
    {
        Quest.buttonImage[i] = btimg;
        MyInfo.buttonImage[i] = btimg;
        PostBox.buttonImage[i] = btimg;
        Shop.buttonImage[i] = btimg;
        Inventory.buttonImage[i] = btimg;
        Auction.buttonImage[i] = btimg;
        Clan.buttonImage[i] = btimg;
        Help.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        GoBack.buttonImage[i] = btimg;
        i++;
        // [Loop Continue]
        goto J0x9C;
    }
    Quest.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(664.0000000, 6.0000000, 728.0000000, 70.0000000);
    MyInfo.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(715.0000000, 6.0000000, 779.0000000, 70.0000000);
    PostBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(766.0000000, 6.0000000, 830.0000000, 70.0000000);
    Shop.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(817.0000000, 6.0000000, 881.0000000, 70.0000000);
    Inventory.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(868.0000000, 6.0000000, 932.0000000, 70.0000000);
    Option.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(919.0000000, 6.0000000, 983.0000000, 70.0000000);
    GoBack.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(970.0000000, 6.0000000, 1034.0000000, 70.0000000);
    ButtonList[0] = Quest;
    ButtonList[1] = MyInfo;
    ButtonList[2] = PostBox;
    ButtonList[3] = Shop;
    ButtonList[4] = Inventory;
    ButtonList[5] = Auction;
    ButtonList[6] = Clan;
    ButtonList[7] = Help;
    ButtonList[8] = Option;
    ButtonList[9] = GoBack;
    Quest.ButtonID = 11;
    Quest.__OnClick__Delegate = TopMenuButton_OnClick;
    Quest.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_quest_n';
    Quest.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_quest_on';
    Quest.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_quest_n';
    Quest.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_quest_cli';
    Quest.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_quest_dis';
    Quest.InitComponent(Controller, self);
    AppendComponent(Quest);
    MyInfo.ButtonID = 0;
    MyInfo.__OnClick__Delegate = TopMenuButton_OnClick;
    MyInfo.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_myif_n';
    MyInfo.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_myif_on';
    MyInfo.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_myif_n';
    MyInfo.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_myif_cli';
    MyInfo.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_myif_dis';
    MyInfo.InitComponent(Controller, self);
    AppendComponent(MyInfo);
    PostBox.ButtonID = 1;
    PostBox.__OnClick__Delegate = TopMenuButton_OnClick;
    PostBox.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_post_n';
    PostBox.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_post_on';
    PostBox.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_post_n';
    PostBox.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_post_cli';
    PostBox.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_post_dis';
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
    Shop.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_store_n';
    Shop.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_store_on';
    Shop.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_store_n';
    Shop.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_store_cli';
    Shop.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_store_dis';
    Shop.InitComponent(Controller, self);
    AppendComponent(Shop);
    Inventory.ButtonID = 3;
    Inventory.__OnClick__Delegate = TopMenuButton_OnClick;
    Inventory.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_inven_n';
    Inventory.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_inven_on';
    Inventory.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_inven_n';
    Inventory.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_inven_cli';
    Inventory.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_inven_dis';
    Inventory.InitComponent(Controller, self);
    AppendComponent(Inventory);
    Option.ButtonID = 9;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_opti_n';
    Option.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_opti_on';
    Option.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_opti_n';
    Option.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_opti_cli';
    Option.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_opti_dis';
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    GoBack.ButtonID = 10;
    GoBack.__OnClick__Delegate = TopMenuButton_OnClick;
    GoBack.buttonImage[0].Image = Texture'Warfare_TH_UI_UI.Common.butt_return_n';
    GoBack.buttonImage[1].Image = Texture'Warfare_TH_UI_UI.Common.butt_return_on';
    GoBack.buttonImage[2].Image = Texture'Warfare_TH_UI_UI.Common.butt_return_n';
    GoBack.buttonImage[3].Image = Texture'Warfare_TH_UI_UI.Common.butt_return_cli';
    GoBack.buttonImage[4].Image = Texture'Warfare_TH_UI_UI.Common.butt_return_dis';
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
    strTooltip[0]="????????????????????????????????????????????????????????????"
    strTooltip[1]="????????????????? Record ??????????????????????????????????????????????????????????&?????????????"
    strTooltip[2]="???????????????????????????????????????????????????????????????????????????"
    strTooltip[3]="????????????????????????????????????????????????"
    strTooltip[4]="???????????????????????????????????????????"
    strTooltip[5]="??????????/???/??????????????????????????????"
    strTooltip[6]="???????????????????????????????????????????????????????????????????????"
    strTooltip[7]="????????????????????????????????????????????????"
    strTooltip[8]="????????????????????????????????????, ????????????????????"
    strTooltip[9]="????????????????????"
    OnRendered=BTTPTopMenuHK.Internal_OnRendered
}