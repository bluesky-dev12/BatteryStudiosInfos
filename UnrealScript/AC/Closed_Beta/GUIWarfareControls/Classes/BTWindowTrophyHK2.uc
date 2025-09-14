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
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_7;
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    LabelCenterLine = NewLabelComponent(fbLabelCenterLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_3ditem_back_0_TrophyBack, ButtonOK.RenderWeight - 0.0200000);
    LabelCenterLine.bAcceptsInput = false;
    LabelCenterLineText = NewLabelComponent(fbLabelCenterLineText, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_page_thema_trophy, ButtonOK.RenderWeight - 0.0100000);
    LabelCenterLineText.bAcceptsInput = false;
    LabelPromotion = NewLabelComponent(fbLabelPromotion, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_trophy, LabelCenterLine.RenderWeight - 0.0100000);
    LabelPromotion.bAcceptsInput = false;
    i = 0;
    J0x123:

    // End:0x47F [Loop If]
    if(i < 2)
    {
        ButtonItemState[i] = BTTPItemUIStatusHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPItemUIStatusHK', fbButtonItemState[i], 0.6700000));
        ButtonItemState[i].bAcceptsInput = false;
        ButtonItemState[i].ro.SetPos(21, 60, 206, 211, 523 / 2);
        ButtonItemState[i].ro.SetHeight(12, 8, 12);
        EditItemDescription[i] = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fbEditItemDescription[i]));
        EditItemDescription[i].bAcceptsInput = false;
        EditItemDescription[i].bReadOnly = true;
        LabelItemDescription[i] = NewLabelComponent(fbLabelItemDescription[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5, EditItemDescription[i].RenderWeight - 0.0100000);
        LabelPreview[i] = NewLabelComponent(fbLabelPreview[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_3ditem_back_0_WeaponBack, 0.6000000);
        LabelPreview[i].bAcceptsInput = false;
        btWeapon[i] = BTModelWeaponHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTModelWeaponHK', fbLabelPreview[i], 0.6500000));
        btWeapon[i].bAcceptsInput = true;
        LabelPreviewSlide[i] = BTLabelSlideAnimationHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelSlideAnimationHK', fbLabelPreview[i], 0.7000000));
        LabelPreviewSlide[i].bAcceptsInput = false;
        LabelPreviewSlide[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        Texture(LabelPreviewSlide[i].BackgroundImage.Image).bAlphaTexture = false;
        LabelContent[i] = NewLabelComponent(fbLabelContent[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_3ditem_back_0_EditBack, 0.9800000);
        LabelContent[i].bAcceptsInput = false;
        LabelContent[i].SetDefaultFontColor();
        LabelContent[i].SetFontSizeAll(12);
        LabelContent[i].CaptionDrawType = 4;
        LabelContent[i].Caption = strLabelContent;
        ButtonItemBox[i] = BTAniItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAniItemBoxButtonHK', fbButtonItemBox[i], 0.9900000));
        ButtonItemBox[i].bAcceptsInput = false;
        i++;
        // [Loop Continue]
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
    //return;    
}

function ItemBox_OnStartScaleAni(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x87 [Loop If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(float(255) * (float(1) - (scaleValue / ScaleMax)));
        LabelContent[0].FontShadowColor[i].A = byte(float(100) * (float(1) - (scaleValue / ScaleMax)));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0xB9
    if(TrophyReceiver[0] != "")
    {
        LabelContent[0].Caption = TrophyReceiver[0] $ strRequiredUser[0];        
    }
    else
    {
        LabelContent[0].Caption = strRequiredUser[1];
    }
    LabelContent[0].bUseFontScaleValue = true;
    LabelContent[0].FontScaleValue = scaleValue + float(1);
    // End:0x129
    if(bPlayScaleAniSound == false)
    {
        PlayerOwner().PlaySound(Sound'Warfare_Sound_UI.Result.ui_result_loot_user_open', 0, 1.0000000);
        bPlayScaleAniSound = true;
    }
    //return;    
}

function ItemBox_OnScaleAniChanged(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8B [Loop If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(float(255) * (1.0000000 - (scaleValue / ScaleMax)));
        LabelContent[0].FontShadowColor[i].A = byte(float(100) * (1.0000000 - (scaleValue / ScaleMax)));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    LabelContent[0].FontScaleValue = scaleValue + float(1);
    //return;    
}

function ItemBox_OnDramaEnded()
{
    local int i;

    Log("[BTWindowTrophyHK2::ItemBox_OnDramaEnded]");
    i = 0;
    J0x34:

    // End:0x88 [Loop If]
    if(i < 5)
    {
        LabelContent[0].FontColor[i].A = byte(255);
        LabelContent[0].FontShadowColor[i].A = 100;
        i++;
        // [Loop Continue]
        goto J0x34;
    }
    LabelContent[0].bUseFontScaleValue = false;
    // End:0xBB
    if(TrophyReceiver[0] == MyNickName)
    {
        ButtonOK.EnableMe();
    }
    ButtonCancel.EnableMe();
    //return;    
}

function ItemBox_OnStartScaleAni2(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x87 [Loop If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(float(255) * (float(1) - (scaleValue / ScaleMax)));
        LabelContent[1].FontShadowColor[i].A = byte(float(100) * (float(1) - (scaleValue / ScaleMax)));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0xB9
    if(TrophyReceiver[1] != "")
    {
        LabelContent[1].Caption = TrophyReceiver[1] $ strRequiredUser[0];        
    }
    else
    {
        LabelContent[1].Caption = strRequiredUser[1];
    }
    LabelContent[1].bUseFontScaleValue = true;
    LabelContent[1].FontScaleValue = scaleValue + float(1);
    // End:0x129
    if(bPlayScaleAniSound == false)
    {
        PlayerOwner().PlaySound(Sound'Warfare_Sound_UI.Result.ui_result_loot_user_open', 0, 1.0000000);
        bPlayScaleAniSound = true;
    }
    //return;    
}

function ItemBox_OnScaleAniChanged2(float scaleValue, float ScaleMax)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8B [Loop If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(float(255) * (1.0000000 - (scaleValue / ScaleMax)));
        LabelContent[1].FontShadowColor[i].A = byte(float(100) * (1.0000000 - (scaleValue / ScaleMax)));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    LabelContent[1].FontScaleValue = scaleValue + float(1);
    //return;    
}

function ItemBox_OnDramaEnded2()
{
    local int i;

    Log("[BTWindowTrophyHK2::ItemBox_OnDramaEnded2]");
    i = 0;
    J0x35:

    // End:0x89 [Loop If]
    if(i < 5)
    {
        LabelContent[1].FontColor[i].A = byte(255);
        LabelContent[1].FontShadowColor[i].A = 100;
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    LabelContent[1].bUseFontScaleValue = false;
    // End:0xBC
    if(TrophyReceiver[1] == MyNickName)
    {
        ButtonOK.EnableMe();
    }
    ButtonCancel.EnableMe();
    //return;    
}

function ButtonItemBox_OnChangeItemInfo1(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ButtonItemBox[0].SetData(GameMgr.CandidateLists[Index], none);
    ButtonItemState[0].SetData(GameMgr.CandidateLists[Index], none);
    EditItemDescription[0].SetText(GameMgr.CandidateLists[Index].ItemDescription);
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd1()
{
    local PartInfo PInfo;

    // End:0x3E
    if(SaveItemInfo[0].ItemID == 0)
    {
        ButtonItemBox[0].itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox;
    }
    ButtonItemBox[0].SetData(SaveItemInfo[0], SaveInstanceInfo[0]);
    ButtonItemState[0].SetData(SaveItemInfo[0], SaveInstanceInfo[0]);
    EditItemDescription[0].SetText(SaveItemInfo[0].ItemDescription);
    // End:0x14C
    if(SaveItemInfo[0] != none)
    {
        roWeapon[0].ChangeWeapon(SaveItemInfo[0].ItemID, SaveInstanceInfo[0].PartID);
        roWeapon[0].SetPositionUI(SaveItemInfo[0].vBootyitem_3d.X, SaveItemInfo[0].vBootyitem_3d.Y, SaveItemInfo[0].vBootyitem_3d.Z);
        roWeapon[0].SetRotationUI(SaveItemInfo[0].fBootyitem_3d_rot_y);
    }
    //return;    
}

function ButtonItemBox_OnChangeItemInfo2(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ButtonItemBox[1].SetData(GameMgr.CandidateLists[Index], none);
    ButtonItemState[1].SetData(GameMgr.CandidateLists[Index], none);
    EditItemDescription[1].SetText(GameMgr.CandidateLists[Index].ItemDescription);
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd2()
{
    local PartInfo PInfo;

    // End:0x3E
    if(SaveItemInfo[1].ItemID == 0)
    {
        ButtonItemBox[1].itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox;
    }
    ButtonItemBox[1].SetData(SaveItemInfo[1], SaveInstanceInfo[1]);
    ButtonItemState[1].SetData(SaveItemInfo[1], SaveInstanceInfo[1]);
    EditItemDescription[1].SetText(SaveItemInfo[1].ItemDescription);
    // End:0x14C
    if(SaveItemInfo[1] != none)
    {
        roWeapon[1].ChangeWeapon(SaveItemInfo[1].ItemID, SaveInstanceInfo[1].PartID);
        roWeapon[1].SetPositionUI(SaveItemInfo[1].vBootyitem_3d.X, SaveItemInfo[1].vBootyitem_3d.Y, SaveItemInfo[1].vBootyitem_3d.Z);
        roWeapon[1].SetRotationUI(SaveItemInfo[1].fBootyitem_3d_rot_y);
    }
    //return;    
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
        SaveItemInfo[0] = new Class'Engine.wItemBoxHK';
        SaveItemInfo[0].ItemID = 0;
        SaveItemInfo[0].ItemName = "";
        SaveItemInfo[0].ItemImage = Texture(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    ButtonItemBox[0].SetData(GameMgr.CandidateLists[0], none);
    ButtonItemState[0].SetData(GameMgr.CandidateLists[0], none);
    EditItemDescription[0].SetText(GameMgr.CandidateLists[0].ItemDescription);
    ButtonItemBox[0].itemBox.SetCandidateListSize(GameMgr.CandidateLists.Length);
    ButtonItemBox[0].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo1;
    ButtonItemBox[0].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd1;
    // End:0x26A
    if(SaveItemInfo[1] == none)
    {
        SaveItemInfo[1] = new Class'Engine.wItemBoxHK';
        SaveItemInfo[1].ItemID = 0;
        SaveItemInfo[1].ItemName = "";
        SaveItemInfo[1].ItemImage = Texture(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    ButtonItemBox[1].SetData(GameMgr.CandidateLists[0], none);
    ButtonItemState[1].SetData(GameMgr.CandidateLists[0], none);
    EditItemDescription[1].SetText(GameMgr.CandidateLists[0].ItemDescription);
    ButtonItemBox[1].itemBox.SetCandidateListSize(GameMgr.CandidateLists.Length);
    ButtonItemBox[1].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo2;
    ButtonItemBox[1].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd2;
    // End:0x3D5
    if(ItemInfo1 != none)
    {
        // End:0x387
        if(ro1 == none)
        {
            ro1 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelWeapon');
        }
        roWeapon[0] = ro1;
        roWeapon[0].Init();
        roWeapon[0].AWinPos = fbLabelPreview[0];
        btWeapon[0].cModel = roWeapon[0];
    }
    // End:0x46B
    if(ItemInfo2 != none)
    {
        // End:0x41D
        if(ro2 == none)
        {
            ro2 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelWeapon');
        }
        roWeapon[1] = ro2;
        roWeapon[1].Init();
        roWeapon[1].AWinPos = fbLabelPreview[1];
        btWeapon[1].cModel = roWeapon[1];
    }
    ButtonOK.DisableMe();
    ButtonCancel.DisableMe();
    //return;    
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(Sound'Warfare_Sound_UI.Result.ui_result_loot_item_open', 6, 1.0000000);
    //return;    
}

defaultproperties
{
    strRequiredUser[0]=" acquired the item."
    strRequiredUser[1]="Failed to acquire loot"
    fbButtonItemBox[0]=(X1=482.0000000,Y1=223.0000000,X2=716.0000000,Y2=335.0000000)
    fbButtonItemBox[1]=(X1=482.0000000,Y1=422.0000000,X2=716.0000000,Y2=534.0000000)
    fbButtonItemState[0]=(X1=484.0000000,Y1=132.0000000,X2=1007.0000000,Y2=208.0000000)
    fbButtonItemState[1]=(X1=484.0000000,Y1=681.0000000,X2=1007.0000000,Y2=758.0000000)
    fbEditItemDescription[0]=(X1=727.0000000,Y1=231.0000000,X2=1004.0000000,Y2=360.0000000)
    fbEditItemDescription[1]=(X1=727.0000000,Y1=430.0000000,X2=1004.0000000,Y2=560.0000000)
    fbLabelItemDescription[0]=(X1=722.0000000,Y1=223.0000000,X2=1009.0000000,Y2=368.0000000)
    fbLabelItemDescription[1]=(X1=722.0000000,Y1=422.0000000,X2=1009.0000000,Y2=568.0000000)
    fbLabelSeparator[0]=(X1=385.0000000,Y1=304.0000000,X2=387.0000000,Y2=491.0000000)
    fbLabelSeparator[1]=(X1=637.0000000,Y1=304.0000000,X2=639.0000000,Y2=491.0000000)
    fbLabelPreview[0]=(X1=480.0000000,Y1=29.0000000,X2=1009.0000000,Y2=212.0000000)
    fbLabelPreview[1]=(X1=480.0000000,Y1=578.0000000,X2=1009.0000000,Y2=762.0000000)
    fbLabelCenterLineText=(X1=810.0000000,Y1=379.0000000,X2=970.0000000,Y2=411.0000000)
    fbLabelCenterLine=(X1=462.0000000,Y1=373.0000000,X2=1024.0000000,Y2=416.0000000)
    strLabelTopLine="Acquired Loot"
    fbLabelPromotion=(X1=738.0000000,Y1=268.0000000,X2=994.0000000,Y2=524.0000000)
    fbLabelContent[0]=(X1=482.0000000,Y1=334.0000000,X2=716.0000000,Y2=368.0000000)
    fbLabelContent[1]=(X1=482.0000000,Y1=533.0000000,X2=716.0000000,Y2=567.0000000)
    fbBackgroundImage=(X1=461.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    fbButtonOK=(X1=482.0000000,Y1=379.0000000,X2=596.0000000,Y2=411.0000000)
    fbButtonCancel=(X1=601.0000000,Y1=379.0000000,X2=715.0000000,Y2=411.0000000)
    strOK="Inventory"
    strCancel="OK"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    OnOpen=BTWindowTrophyHK2.Internal_OnOpen
}