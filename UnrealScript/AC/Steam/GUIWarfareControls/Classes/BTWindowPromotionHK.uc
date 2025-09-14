/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowPromotionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:6
 *
 *******************************************************************************/
class BTWindowPromotionHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLevelUpItemEmpty;
var localized string strPoint;
var localized string strLabelTopLine;
var FloatBox fbLabelPromotion;
var export editinline BTLabelPromotionHK LabelPromotion;
var localized string strLabelContent;
var FloatBox fbLabelContent;
var export editinline BTOwnerDrawImageHK LabelContent;
var FloatBox fbLabelLevel;
var export editinline BTOwnerDrawImageHK LabelLevel;
var FloatBox fbEven[2];
var FloatBox fbOdd[3];
var export editinline BTItemBoxButtonHK itemBox[3];
var FloatBox fbLabelPromotion2;
var FloatBox fbLabelContent2;
var FloatBox fbLabelLevel2;
var FloatBox fbBackgroundImage2;
var FloatBox fbTopLine2;
var FloatBox fbBottomLine2;
var FloatBox fbButtonOK2;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ButtonOK.DisableMe();
    ButtonCancel.SetVisibility(false);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    LabelContent = NewLabelComponent(fbLabelContent, class'BTUIResourcePoolHK'.default.empty);
    LabelContent.SetFontSizeAll(12);
    LabelContent.CaptionDrawType = 0;
    LabelContent.Caption = strLabelContent;
    LabelPromotion = BTLabelPromotionHK(NewComponent(new class'BTLabelPromotionHK', fbLabelPromotion, 0.990));
    LabelPromotion.BackgroundImage = class'BTUIResourcePoolHK'.default.img_promot_Scale;
    LabelPromotion.__OnStartPhase__Delegate = LabelPromotion_OnStartPhase;
    LabelPromotion.__OnEndPhase__Delegate = LabelPromotion_OnEndPhase;
    LabelLevel = NewLabelComponent(fbLabelLevel, class'BTUIResourcePoolHK'.default.empty);
    i = 0;
    J0x172:
    // End:0x1f7 [While If]
    if(i < 3)
    {
        itemBox[i] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
        itemBox[i].itemBox.ChangeState(13);
        itemBox[i].itemBox.bBackgroundInfo = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x172;
    }
}

function LabelPromotion_OnStartPhase(int Phase)
{
    // End:0x1a
    if(Phase == 1)
    {
        ButtonOK.EnableMe();
    }
}

function LabelPromotion_OnEndPhase(int Phase);
function SetData(int Level)
{
    LabelLevel.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    PlayerOwner().Level.GameMgr.GetLevelImage(Level, 0, LabelLevel.BackgroundImage);
    LabelPromotion.StartShow();
}

function SetPromotionItem(int Exp, array<int> ItemID, array<int> PartID)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    BackgroundImage.Caption = "";
    switch(ItemID.Length)
    {
        // End:0x115
        case 0:
            BackgroundImage.AWinPos = fbBackgroundImage2;
            BackgroundImage.ApplyAWinPos();
            TopLine.AWinPos = fbTopLine2;
            TopLine.ApplyAWinPos();
            BottomLine.AWinPos = fbBottomLine2;
            BottomLine.ApplyAWinPos();
            LabelPromotion.AWinPos = fbLabelPromotion2;
            LabelPromotion.ApplyAWinPos();
            LabelContent.AWinPos = fbLabelContent2;
            LabelContent.ApplyAWinPos();
            LabelLevel.AWinPos = fbLabelLevel2;
            LabelLevel.ApplyAWinPos();
            ButtonOK.AWinPos = fbButtonOK2;
            ButtonOK.ApplyAWinPos();
            // End:0xa41
            break;
        // End:0x3dc
        case 1:
            // End:0x252
            if(ItemID[i] == 0)
            {
                ItemInfo = new class'wItemBoxHK';
                itemBox[0].itemBox.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_FT_point;
                itemBox[0].itemBox.ItemName = class'BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[0].itemBox.strPoint);
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.OverlapCount = 1;
                itemBox[0].itemBox.ItemInfo = ItemInfo;
                itemBox[0].itemBox.instanceInfo = instanceInfo;
                itemBox[0].bUseAWinPos = true;
                itemBox[0].AWinPos = fbOdd[1];
                itemBox[0].ApplyAWinPos();
            }
            // End:0x3d9
            else
            {
                ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[0]);
                instanceInfo = new class'wItemBoxInstanceHK';
                // End:0x2ff
                if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
                {
                    instanceInfo.LeftTime.Day = PartID[0] / 24;
                    instanceInfo.LeftTime.Hour = int(float(PartID[0]) % float(24));
                }
                // End:0x382
                else
                {
                    // End:0x357
                    if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                    {
                        instanceInfo.PartID = PartID[0];
                        instanceInfo.Durability = 100000;
                    }
                    // End:0x382
                    else
                    {
                        // End:0x382
                        if(ItemInfo.CostType == 3)
                        {
                            instanceInfo.OverlapCount = PartID[0];
                        }
                    }
                }
                itemBox[0].SetData(ItemInfo, instanceInfo);
                itemBox[0].bUseAWinPos = true;
                itemBox[0].AWinPos = fbOdd[1];
                itemBox[0].ApplyAWinPos();
            }
            // End:0xa41
            break;
        // End:0x70d
        case 2:
            i = 0;
            J0x3e8:
            // End:0x70a [While If]
            if(i < 2)
            {
                // End:0x551
                if(ItemID[i] == 0)
                {
                    ItemInfo = new class'wItemBoxHK';
                    itemBox[i].itemBox.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_FT_point;
                    itemBox[i].itemBox.ItemName = class'BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[i].itemBox.strPoint);
                    instanceInfo = new class'wItemBoxInstanceHK';
                    instanceInfo.OverlapCount = 1;
                    itemBox[i].itemBox.ItemInfo = ItemInfo;
                    itemBox[i].itemBox.instanceInfo = instanceInfo;
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbEven[i];
                    itemBox[i].ApplyAWinPos();
                }
                // End:0x700
                else
                {
                    ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[i]);
                    instanceInfo = new class'wItemBoxInstanceHK';
                    // End:0x60a
                    if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
                    {
                        instanceInfo.LeftTime.Day = PartID[i] / 24;
                        instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));
                    }
                    // End:0x695
                    else
                    {
                        // End:0x666
                        if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                        {
                            instanceInfo.PartID = PartID[i];
                            instanceInfo.Durability = 100000;
                        }
                        // End:0x695
                        else
                        {
                            // End:0x695
                            if(ItemInfo.CostType == 3)
                            {
                                instanceInfo.OverlapCount = PartID[i];
                            }
                        }
                    }
                    itemBox[i].SetData(ItemInfo, instanceInfo);
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbEven[i];
                    itemBox[i].ApplyAWinPos();
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x3e8;
            }
            // End:0xa41
            break;
        // End:0xa3e
        case 3:
            i = 0;
            J0x719:
            // End:0xa3b [While If]
            if(i < 3)
            {
                // End:0x882
                if(ItemID[i] == 0)
                {
                    ItemInfo = new class'wItemBoxHK';
                    itemBox[i].itemBox.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_FT_point;
                    itemBox[i].itemBox.ItemName = class'BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[i].itemBox.strPoint);
                    instanceInfo = new class'wItemBoxInstanceHK';
                    instanceInfo.OverlapCount = 1;
                    itemBox[i].itemBox.ItemInfo = ItemInfo;
                    itemBox[i].itemBox.instanceInfo = instanceInfo;
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbOdd[i];
                    itemBox[i].ApplyAWinPos();
                }
                // End:0xa31
                else
                {
                    ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[i]);
                    instanceInfo = new class'wItemBoxInstanceHK';
                    // End:0x93b
                    if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
                    {
                        instanceInfo.LeftTime.Day = PartID[i] / 24;
                        instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));
                    }
                    // End:0x9c6
                    else
                    {
                        // End:0x997
                        if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                        {
                            instanceInfo.PartID = PartID[i];
                            instanceInfo.Durability = 100000;
                        }
                        // End:0x9c6
                        else
                        {
                            // End:0x9c6
                            if(ItemInfo.CostType == 3)
                            {
                                instanceInfo.OverlapCount = PartID[i];
                            }
                        }
                    }
                    itemBox[i].SetData(ItemInfo, instanceInfo);
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbOdd[i];
                    itemBox[i].ApplyAWinPos();
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x719;
            }
            // End:0xa41
            break;
        // End:0xffff
        default:
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(sound'ui_result_level_up', 6, 1.0);
}

defaultproperties
{
    strLevelUpItemEmpty="There is no reward for the promotion."
    strPoint="Points"
    strLabelTopLine="Promotion"
    fbLabelPromotion=(X1=428.0,Y1=95.0,X2=606.0,Y2=279.0)
    strLabelContent="Congratulations on your promotion."
    fbLabelContent=(X1=454.0,Y1=428.0,X2=1024.0,Y2=768.0)
    fbLabelLevel=(X1=415.0,Y1=420.0,X2=1024.0,Y2=768.0)
    fbEven[0]=(X1=275.0,Y1=303.0,X2=510.0,Y2=415.0)
    fbEven[1]=(X1=516.0,Y1=303.0,X2=751.0,Y2=415.0)
    fbOdd[0]=(X1=153.0,Y1=303.0,X2=388.0,Y2=415.0)
    fbOdd[1]=(X1=395.0,Y1=303.0,X2=630.0,Y2=415.0)
    fbOdd[2]=(X1=636.0,Y1=303.0,X2=871.0,Y2=415.0)
    fbLabelPromotion2=(X1=428.0,Y1=140.0,X2=606.0,Y2=324.0)
    fbLabelContent2=(X1=454.0,Y1=365.0,X2=1024.0,Y2=768.0)
    fbLabelLevel2=(X1=415.0,Y1=360.0,X2=1024.0,Y2=768.0)
    fbBackgroundImage2=(X1=-20.0,Y1=294.0,X2=1044.0,Y2=474.0)
    fbTopLine2=(X1=0.0,Y1=314.0,X2=1024.0,Y2=340.0)
    fbBottomLine2=(X1=0.0,Y1=411.0,X2=1024.0,Y2=454.0)
    fbButtonOK2=(X1=395.0,Y1=416.0,X2=629.0,Y2=448.0)
    fbBackgroundImage=(X1=-20.0,Y1=249.0,X2=1044.0,Y2=520.0)
    fbTopLine=(X1=0.0,Y1=269.0,X2=1024.0,Y2=295.0)
    fbBottomLine=(X1=0.0,Y1=457.0,X2=1024.0,Y2=500.0)
    fbButtonOK=(X1=395.0,Y1=462.0,X2=629.0,Y2=494.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    OnOpen=Internal_OnOpen
}