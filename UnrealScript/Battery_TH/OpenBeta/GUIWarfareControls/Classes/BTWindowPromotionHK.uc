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
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    LabelContent = NewLabelComponent(fbLabelContent, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelContent.SetFontSizeAll(12);
    LabelContent.CaptionDrawType = 0;
    LabelContent.Caption = strLabelContent;
    LabelPromotion = BTLabelPromotionHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelPromotionHK', fbLabelPromotion, 0.9900000));
    LabelPromotion.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_promot_Scale;
    LabelPromotion.__OnStartPhase__Delegate = LabelPromotion_OnStartPhase;
    LabelPromotion.__OnEndPhase__Delegate = LabelPromotion_OnEndPhase;
    LabelLevel = NewLabelComponent(fbLabelLevel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    i = 0;
    J0x172:

    // End:0x1F7 [Loop If]
    if(i < 3)
    {
        itemBox[i] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
        itemBox[i].itemBox.ChangeState(13);
        itemBox[i].itemBox.bBackgroundInfo = true;
        i++;
        // [Loop Continue]
        goto J0x172;
    }
    //return;    
}

function LabelPromotion_OnStartPhase(int Phase)
{
    // End:0x1A
    if(Phase == 1)
    {
        ButtonOK.EnableMe();
    }
    //return;    
}

function LabelPromotion_OnEndPhase(int Phase)
{
    //return;    
}

function SetData(int Level)
{
    LabelLevel.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    PlayerOwner().Level.GameMgr.GetLevelImage(Level, 0, LabelLevel.BackgroundImage);
    LabelPromotion.StartShow();
    //return;    
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
            // End:0x9FC
            break;
        // End:0x3C5
        case 1:
            // End:0x252
            if(ItemID[i] == 0)
            {
                ItemInfo = new Class'Engine.wItemBoxHK';
                itemBox[0].itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_FT_point;
                itemBox[0].itemBox.ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[0].itemBox.strPoint);
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                instanceInfo.OverlapCount = 1;
                itemBox[0].itemBox.ItemInfo = ItemInfo;
                itemBox[0].itemBox.instanceInfo = instanceInfo;
                itemBox[0].bUseAWinPos = true;
                itemBox[0].AWinPos = fbOdd[1];
                itemBox[0].ApplyAWinPos();                
            }
            else
            {
                ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[0]);
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                // End:0x2E8
                if(ItemInfo.CostType == 1)
                {
                    instanceInfo.LeftTime.Day = PartID[0] / 24;
                    instanceInfo.LeftTime.Hour = int(float(PartID[0]) % float(24));                    
                }
                else
                {
                    // End:0x340
                    if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                    {
                        instanceInfo.PartID = PartID[0];
                        instanceInfo.Durability = 100000;                        
                    }
                    else
                    {
                        // End:0x36B
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
            // End:0x9FC
            break;
        // End:0x6DF
        case 2:
            i = 0;
            J0x3D1:

            // End:0x6DC [Loop If]
            if(i < 2)
            {
                // End:0x53A
                if(ItemID[i] == 0)
                {
                    ItemInfo = new Class'Engine.wItemBoxHK';
                    itemBox[i].itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_FT_point;
                    itemBox[i].itemBox.ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[i].itemBox.strPoint);
                    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                    instanceInfo.OverlapCount = 1;
                    itemBox[i].itemBox.ItemInfo = ItemInfo;
                    itemBox[i].itemBox.instanceInfo = instanceInfo;
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbEven[i];
                    itemBox[i].ApplyAWinPos();
                    // [Explicit Continue]
                    goto J0x6D2;
                }
                ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[i]);
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                // End:0x5DC
                if(ItemInfo.CostType == 1)
                {
                    instanceInfo.LeftTime.Day = PartID[i] / 24;
                    instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));                    
                }
                else
                {
                    // End:0x638
                    if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                    {
                        instanceInfo.PartID = PartID[i];
                        instanceInfo.Durability = 100000;                        
                    }
                    else
                    {
                        // End:0x667
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
                J0x6D2:

                i++;
                // [Loop Continue]
                goto J0x3D1;
            }
            // End:0x9FC
            break;
        // End:0x9F9
        case 3:
            i = 0;
            J0x6EB:

            // End:0x9F6 [Loop If]
            if(i < 3)
            {
                // End:0x854
                if(ItemID[i] == 0)
                {
                    ItemInfo = new Class'Engine.wItemBoxHK';
                    itemBox[i].itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_FT_point;
                    itemBox[i].itemBox.ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, string(PartID[i]) @ itemBox[i].itemBox.strPoint);
                    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                    instanceInfo.OverlapCount = 1;
                    itemBox[i].itemBox.ItemInfo = ItemInfo;
                    itemBox[i].itemBox.instanceInfo = instanceInfo;
                    itemBox[i].bUseAWinPos = true;
                    itemBox[i].AWinPos = fbOdd[i];
                    itemBox[i].ApplyAWinPos();
                    // [Explicit Continue]
                    goto J0x9EC;
                }
                ItemInfo = PlayerOwner().Level.GameMgr.FindUIItem(ItemID[i]);
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                // End:0x8F6
                if(ItemInfo.CostType == 1)
                {
                    instanceInfo.LeftTime.Day = PartID[i] / 24;
                    instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));                    
                }
                else
                {
                    // End:0x952
                    if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                    {
                        instanceInfo.PartID = PartID[i];
                        instanceInfo.Durability = 100000;                        
                    }
                    else
                    {
                        // End:0x981
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
                J0x9EC:

                i++;
                // [Loop Continue]
                goto J0x6EB;
            }
            // End:0x9FC
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(Sound'Warfare_Sound_UI.Result.ui_result_level_up', 6, 1.0000000);
    //return;    
}

defaultproperties
{
    strLevelUpItemEmpty="???????????????????????????"
    strPoint="BP"
    strLabelTopLine="??????????"
    fbLabelPromotion=(X1=428.0000000,Y1=95.0000000,X2=606.0000000,Y2=279.0000000)
    strLabelContent="????????????????????"
    fbLabelContent=(X1=454.0000000,Y1=428.0000000,X2=1024.0000000,Y2=768.0000000)
    fbLabelLevel=(X1=415.0000000,Y1=420.0000000,X2=1024.0000000,Y2=768.0000000)
    fbEven[0]=(X1=275.0000000,Y1=303.0000000,X2=510.0000000,Y2=415.0000000)
    fbEven[1]=(X1=516.0000000,Y1=303.0000000,X2=751.0000000,Y2=415.0000000)
    fbOdd[0]=(X1=153.0000000,Y1=303.0000000,X2=388.0000000,Y2=415.0000000)
    fbOdd[1]=(X1=395.0000000,Y1=303.0000000,X2=630.0000000,Y2=415.0000000)
    fbOdd[2]=(X1=636.0000000,Y1=303.0000000,X2=871.0000000,Y2=415.0000000)
    fbLabelPromotion2=(X1=428.0000000,Y1=140.0000000,X2=606.0000000,Y2=324.0000000)
    fbLabelContent2=(X1=454.0000000,Y1=365.0000000,X2=1024.0000000,Y2=768.0000000)
    fbLabelLevel2=(X1=415.0000000,Y1=360.0000000,X2=1024.0000000,Y2=768.0000000)
    fbBackgroundImage2=(X1=-20.0000000,Y1=294.0000000,X2=1044.0000000,Y2=474.0000000)
    fbTopLine2=(X1=0.0000000,Y1=314.0000000,X2=1024.0000000,Y2=340.0000000)
    fbBottomLine2=(X1=0.0000000,Y1=411.0000000,X2=1024.0000000,Y2=454.0000000)
    fbButtonOK2=(X1=395.0000000,Y1=416.0000000,X2=629.0000000,Y2=448.0000000)
    fbBackgroundImage=(X1=-20.0000000,Y1=249.0000000,X2=1044.0000000,Y2=520.0000000)
    fbTopLine=(X1=0.0000000,Y1=269.0000000,X2=1024.0000000,Y2=295.0000000)
    fbBottomLine=(X1=0.0000000,Y1=457.0000000,X2=1024.0000000,Y2=500.0000000)
    fbButtonOK=(X1=395.0000000,Y1=462.0000000,X2=629.0000000,Y2=494.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    OnOpen=BTWindowPromotionHK.Internal_OnOpen
}