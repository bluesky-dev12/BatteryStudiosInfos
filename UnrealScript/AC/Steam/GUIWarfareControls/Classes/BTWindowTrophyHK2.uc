/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowTrophyHK2.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:31
 *	Functions:13
 *
 *******************************************************************************/
class BTWindowTrophyHK2 extends BTWindowHK
    editinlinenew
    instanced;

var bool bPlayScaleAniSound;
var localized string strRequiredUser[2];
var string MyNickName;
var string TrophyReceiver[2];
var wItemBoxHK SaveItemInfo[2];
var wItemBoxInstanceHK SaveInstanceInfo[2];
var FloatBox fbButtonItemBox[2];
var export editinline BTAniItemBoxButtonHK ButtonItemBox[2];
var FloatBox fbButtonItemState[2];
var export editinline BTTPItemUIStatusHK ButtonItemState[2];
var FloatBox fbEditItemDescription[2];
var export editinline BTMultiLineEditBoxHK EditItemDescription[2];
var FloatBox fbLabelItemDescription[2];
var export editinline BTOwnerDrawImageHK LabelItemDescription[2];
var FloatBox fbLabelSeparator[2];
var export editinline BTOwnerDrawImageHK LabelSeparator[2];
var FloatBox fbLabelPreview[2];
var export editinline BTOwnerDrawImageHK LabelPreview[2];
var export editinline BTModelWeaponHK btWeapon[2];
var BTROModelWeapon roWeapon[2];
var export editinline BTLabelSlideAnimationHK LabelPreviewSlide[2];
var FloatBox fbLabelCenterLineText;
var export editinline BTOwnerDrawImageHK LabelCenterLineText;
var FloatBox fbLabelCenterLine;
var export editinline BTOwnerDrawImageHK LabelCenterLine;
var localized string strLabelTopLine;
var FloatBox fbLabelPromotion;
var export editinline BTOwnerDrawImageHK LabelPromotion;
var localized string strLabelContent;
var FloatBox fbLabelContent[2];
var export editinline BTOwnerDrawImageHK LabelContent[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_7;
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    LabelCenterLine = NewLabelComponent(fbLabelCenterLine, class'BTUIResourcePoolHK'.default.img_3ditem_back_0_TrophyBack, ButtonOK.RenderWeight - 0.020);
    LabelCenterLine.bAcceptsInput = false;
    LabelCenterLineText = NewLabelComponent(fbLabelCenterLineText, class'BTUIResourcePoolHK'.default.img_page_thema_trophy, ButtonOK.RenderWeight - 0.010);
    LabelCenterLineText.bAcceptsInput = false;
    LabelPromotion = NewLabelComponent(fbLabelPromotion, class'BTUIResourcePoolHK'.default.img_trophy, LabelCenterLine.RenderWeight - 0.010);
    LabelPromotion.bAcceptsInput = false;
    i = 0;
    J0x123:
    // End:0x47f [While If]
    if(i < 2)
    {
        ButtonItemState[i] = BTTPItemUIStatusHK(NewComponent(new class'BTTPItemUIStatusHK', fbButtonItemState[i], 0.670));
        ButtonItemState[i].bAcceptsInput = false;
        ButtonItemState[i].ro.SetPos(21, 60, 206, 211, 523 / 2);
        ButtonItemState[i].ro.SetHeight(12, 8, 12);
        EditItemDescription[i] = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', fbEditItemDescription[i]));
        EditItemDescription[i].bAcceptsInput = false;
        EditItemDescription[i].bReadOnly = true;
        LabelItemDescription[i] = NewLabelComponent(fbLabelItemDescription[i], class'BTUIResourcePoolHK'.default.panel_5, EditItemDescription[i].RenderWeight - 0.010);
        LabelPreview[i] = NewLabelComponent(fbLabelPreview[i], class'BTUIResourcePoolHK'.default.img_3ditem_back_0_WeaponBack, 0.60);
        LabelPreview[i].bAcceptsInput = false;
        btWeapon[i] = BTModelWeaponHK(NewComponent(new class'BTModelWeaponHK', fbLabelPreview[i], 0.650));
        btWeapon[i].bAcceptsInput = true;
        LabelPreviewSlide[i] = BTLabelSlideAnimationHK(NewComponent(new class'BTLabelSlideAnimationHK', fbLabelPreview[i], 0.70));
        LabelPreviewSlide[i].bAcceptsInput = false;
        LabelPreviewSlide[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
        Texture(LabelPreviewSlide[i].BackgroundImage.Image).bAlphaTexture = false;
        LabelContent[i] = NewLabelComponent(fbLabelContent[i], class'BTUIResourcePoolHK'.default.img_3ditem_back_0_EditBack, 0.980);
        LabelContent[i].bAcceptsInput = false;
        LabelContent[i].SetDefaultFontColor();
        LabelContent[i].SetFontSizeAll(12);
        LabelContent[i].CaptionDrawType = 4;
        LabelContent[i].Caption = strLabelContent;
        ButtonItemBox[i] = BTAniItemBoxButtonHK(NewComponent(new class'BTAniItemBoxButtonHK', fbButtonItemBox[i], 0.990));
        ButtonItemBox[i].bAcceptsInput = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x123;
    }
    ButtonItemBox[0].itemBox.__OnStartScaleAni__Delegate = ItemBox_OnStartScaleAni;
    ButtonItemBox[0].itemBox.__OnScaleAniChanged__Delegate = ItemBox_OnScaleAniChanged;
    ButtonItemBox[0].itemBox.__OnDramaEnded__Delegate = ItemBox_OnDramaEnded;
    ButtonItemBox[0].bAcceptsInput = false;
    ButtonItemBox[1].itemBox.__OnStartScaleAni__Delegate = ItemBox_OnStartScaleAni2;
    ButtonItemBox[1].itemBox.__OnScaleAniChanged__Delegate = ItemBox_OnScaleAniChanged2;
    ButtonItemBox[1].itemBox.__OnDramaEnded__Delegate = ItemBox_OnDramaEnded2;
    ButtonItemBox[1].bAcceptsInput = false;
}

function ItemBox_OnStartScaleAni(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x87 [While If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(float(255) * float(1) - scaleValue / ScaleMax);
        LabelContent[0].FontShadowColor[i].A = byte(float(100) * float(1) - scaleValue / ScaleMax);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0xb9
    if(TrophyReceiver[0] != "")
    {
        LabelContent[0].Caption = TrophyReceiver[0] $ strRequiredUser[0];
    }
    // End:0xd1
    else
    {
        LabelContent[0].Caption = strRequiredUser[1];
    }
    LabelContent[0].bUseFontScaleValue = true;
    LabelContent[0].FontScaleValue = scaleValue + float(1);
    // End:0x129
    if(bPlayScaleAniSound == false)
    {
        PlayerOwner().PlaySound(sound'ui_result_loot_user_open', 0, 1.0);
        bPlayScaleAniSound = true;
    }
}

function ItemBox_OnScaleAniChanged(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8b [While If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(float(255) * 1.0 - scaleValue / ScaleMax);
        LabelContent[0].FontShadowColor[i].A = byte(float(100) * 1.0 - scaleValue / ScaleMax);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    LabelContent[0].FontScaleValue = scaleValue + float(1);
}

function ItemBox_OnDramaEnded()
{
    local int i;

    Log("[BTWindowTrophyHK2::ItemBox_OnDramaEnded]");
    i = 0;
    J0x34:
    // End:0x88 [While If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(255);
        LabelContent[0].FontShadowColor[i].A = 100;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x34;
    }
    LabelContent[0].bUseFontScaleValue = false;
    // End:0xbb
    if(TrophyReceiver[0] == MyNickName)
    {
        ButtonOK.EnableMe();
    }
    ButtonCancel.EnableMe();
}

function ItemBox_OnStartScaleAni2(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x87 [While If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(float(255) * float(1) - scaleValue / ScaleMax);
        LabelContent[1].FontShadowColor[i].A = byte(float(100) * float(1) - scaleValue / ScaleMax);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0xb9
    if(TrophyReceiver[1] != "")
    {
        LabelContent[1].Caption = TrophyReceiver[1] $ strRequiredUser[0];
    }
    // End:0xd1
    else
    {
        LabelContent[1].Caption = strRequiredUser[1];
    }
    LabelContent[1].bUseFontScaleValue = true;
    LabelContent[1].FontScaleValue = scaleValue + float(1);
    // End:0x129
    if(bPlayScaleAniSound == false)
    {
        PlayerOwner().PlaySound(sound'ui_result_loot_user_open', 0, 1.0);
        bPlayScaleAniSound = true;
    }
}

function ItemBox_OnScaleAniChanged2(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8b [While If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(float(255) * 1.0 - scaleValue / ScaleMax);
        LabelContent[1].FontShadowColor[i].A = byte(float(100) * 1.0 - scaleValue / ScaleMax);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    LabelContent[1].FontScaleValue = scaleValue + float(1);
}

function ItemBox_OnDramaEnded2()
{
    local int i;

    Log("[BTWindowTrophyHK2::ItemBox_OnDramaEnded2]");
    i = 0;
    J0x35:
    // End:0x89 [While If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(255);
        LabelContent[1].FontShadowColor[i].A = 100;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    LabelContent[1].bUseFontScaleValue = false;
    // End:0xbc
    if(TrophyReceiver[1] == MyNickName)
    {
        ButtonOK.EnableMe();
    }
    ButtonCancel.EnableMe();
}

function ButtonItemBox_OnChangeItemInfo1(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ButtonItemBox[0].SetData(GameMgr.CandidateLists[Index], none);
    ButtonItemState[0].SetData(GameMgr.CandidateLists[Index], none);
    EditItemDescription[0].SetText(GameMgr.CandidateLists[Index].ItemDescription);
}

function ButtonItemBox_OnChangeItemInfoEnd1()
{
    // End:0x3e
    if(SaveItemInfo[0].ItemID == 0)
    {
        ButtonItemBox[0].itemBox.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox;
    }
    ButtonItemBox[0].SetData(SaveItemInfo[0], SaveInstanceInfo[0]);
    ButtonItemState[0].SetData(SaveItemInfo[0], SaveInstanceInfo[0]);
    EditItemDescription[0].SetText(SaveItemInfo[0].ItemDescription);
    // End:0x14c
    if(SaveItemInfo[0] != none)
    {
        roWeapon[0].ChangeWeapon(SaveItemInfo[0].ItemID, SaveInstanceInfo[0].PartID);
        roWeapon[0].SetPositionUI(SaveItemInfo[0].vBootyitem_3d.X, SaveItemInfo[0].vBootyitem_3d.Y, SaveItemInfo[0].vBootyitem_3d.Z);
        roWeapon[0].SetRotationUI(SaveItemInfo[0].fBootyitem_3d_rot_y);
    }
}

function ButtonItemBox_OnChangeItemInfo2(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ButtonItemBox[1].SetData(GameMgr.CandidateLists[Index], none);
    ButtonItemState[1].SetData(GameMgr.CandidateLists[Index], none);
    EditItemDescription[1].SetText(GameMgr.CandidateLists[Index].ItemDescription);
}

function ButtonItemBox_OnChangeItemInfoEnd2()
{
    // End:0x3e
    if(SaveItemInfo[1].ItemID == 0)
    {
        ButtonItemBox[1].itemBox.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox;
    }
    ButtonItemBox[1].SetData(SaveItemInfo[1], SaveInstanceInfo[1]);
    ButtonItemState[1].SetData(SaveItemInfo[1], SaveInstanceInfo[1]);
    EditItemDescription[1].SetText(SaveItemInfo[1].ItemDescription);
    // End:0x14c
    if(SaveItemInfo[1] != none)
    {
        roWeapon[1].ChangeWeapon(SaveItemInfo[1].ItemID, SaveInstanceInfo[1].PartID);
        roWeapon[1].SetPositionUI(SaveItemInfo[1].vBootyitem_3d.X, SaveItemInfo[1].vBootyitem_3d.Y, SaveItemInfo[1].vBootyitem_3d.Z);
        roWeapon[1].SetRotationUI(SaveItemInfo[1].fBootyitem_3d_rot_y);
    }
}

function SetData(string MyNickName, string TrophyReceiver1, string TrophyReceiver2, wItemBoxHK ItemInfo1, wItemBoxInstanceHK InstanceInfo1, wItemBoxHK ItemInfo2, wItemBoxInstanceHK InstanceInfo2, optional BTROModelWeapon ro1, optional BTROModelWeapon ro2)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    self.MyNickName = MyNickName;
    self.TrophyReceiver[0] = TrophyReceiver1;
    self.TrophyReceiver[1] = TrophyReceiver2;
    LabelContent[0].Caption = "";
    LabelContent[1].Caption = "";
    SaveItemInfo[0] = ItemInfo1;
    SaveInstanceInfo[0] = InstanceInfo1;
    SaveItemInfo[1] = ItemInfo2;
    SaveInstanceInfo[1] = InstanceInfo2;
    // End:0x129
    if(SaveItemInfo[0] == none)
    {
        SaveItemInfo[0] = new class'wItemBoxHK';
        SaveItemInfo[0].ItemID = 0;
        SaveItemInfo[0].ItemName = "";
        SaveItemInfo[0].ItemImage = Texture(class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    ButtonItemBox[0].SetData(GameMgr.CandidateLists[0], none);
    ButtonItemState[0].SetData(GameMgr.CandidateLists[0], none);
    EditItemDescription[0].SetText(GameMgr.CandidateLists[0].ItemDescription);
    ButtonItemBox[0].itemBox.SetCandidateListSize(GameMgr.CandidateLists.Length);
    ButtonItemBox[0].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo1;
    ButtonItemBox[0].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd1;
    // End:0x26a
    if(SaveItemInfo[1] == none)
    {
        SaveItemInfo[1] = new class'wItemBoxHK';
        SaveItemInfo[1].ItemID = 0;
        SaveItemInfo[1].ItemName = "";
        SaveItemInfo[1].ItemImage = Texture(class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    ButtonItemBox[1].SetData(GameMgr.CandidateLists[0], none);
    ButtonItemState[1].SetData(GameMgr.CandidateLists[0], none);
    EditItemDescription[1].SetText(GameMgr.CandidateLists[0].ItemDescription);
    ButtonItemBox[1].itemBox.SetCandidateListSize(GameMgr.CandidateLists.Length);
    ButtonItemBox[1].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo2;
    ButtonItemBox[1].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd2;
    // End:0x3d5
    if(ItemInfo1 != none)
    {
        // End:0x387
        if(ro1 == none)
        {
            ro1 = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelWeapon');
        }
        roWeapon[0] = ro1;
        roWeapon[0].Init();
        roWeapon[0].AWinPos = fbLabelPreview[0];
        btWeapon[0].cModel = roWeapon[0];
    }
    // End:0x46b
    if(ItemInfo2 != none)
    {
        // End:0x41d
        if(ro2 == none)
        {
            ro2 = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelWeapon');
        }
        roWeapon[1] = ro2;
        roWeapon[1].Init();
        roWeapon[1].AWinPos = fbLabelPreview[1];
        btWeapon[1].cModel = roWeapon[1];
    }
    ButtonOK.DisableMe();
    ButtonCancel.DisableMe();
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(sound'ui_result_loot_item_open', 6, 1.0);
}

defaultproperties
{
    strRequiredUser[0]=" acquired"
    strRequiredUser[1]="Failed to acquire loot"
    fbButtonItemBox[0]=(X1=482.0,Y1=223.0,X2=716.0,Y2=335.0)
    fbButtonItemBox[1]=(X1=482.0,Y1=422.0,X2=716.0,Y2=534.0)
    fbButtonItemState[0]=(X1=484.0,Y1=132.0,X2=1007.0,Y2=208.0)
    fbButtonItemState[1]=(X1=484.0,Y1=681.0,X2=1007.0,Y2=758.0)
    fbEditItemDescription[0]=(X1=727.0,Y1=231.0,X2=1004.0,Y2=360.0)
    fbEditItemDescription[1]=(X1=727.0,Y1=430.0,X2=1004.0,Y2=560.0)
    fbLabelItemDescription[0]=(X1=722.0,Y1=223.0,X2=1009.0,Y2=368.0)
    fbLabelItemDescription[1]=(X1=722.0,Y1=422.0,X2=1009.0,Y2=568.0)
    fbLabelSeparator[0]=(X1=385.0,Y1=304.0,X2=387.0,Y2=491.0)
    fbLabelSeparator[1]=(X1=637.0,Y1=304.0,X2=639.0,Y2=491.0)
    fbLabelPreview[0]=(X1=480.0,Y1=29.0,X2=1009.0,Y2=212.0)
    fbLabelPreview[1]=(X1=480.0,Y1=578.0,X2=1009.0,Y2=762.0)
    fbLabelCenterLineText=(X1=810.0,Y1=379.0,X2=970.0,Y2=411.0)
    fbLabelCenterLine=(X1=462.0,Y1=373.0,X2=1024.0,Y2=416.0)
    strLabelTopLine="Acquired Loot"
    fbLabelPromotion=(X1=738.0,Y1=268.0,X2=994.0,Y2=524.0)
    fbLabelContent[0]=(X1=482.0,Y1=334.0,X2=716.0,Y2=368.0)
    fbLabelContent[1]=(X1=482.0,Y1=533.0,X2=716.0,Y2=567.0)
    fbBackgroundImage=(X1=461.0,Y1=0.0,X2=1024.0,Y2=768.0)
    fbButtonOK=(X1=482.0,Y1=379.0,X2=596.0,Y2=411.0)
    fbButtonCancel=(X1=601.0,Y1=379.0,X2=715.0,Y2=411.0)
    strOK="Inventory"
    strCancel="OK"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    OnOpen=Internal_OnOpen
}