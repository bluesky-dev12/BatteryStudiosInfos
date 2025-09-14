/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowRandBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:27
 *	Functions:11
 *
 *******************************************************************************/
class BTWindowRandBoxHK extends BTWindowHK
    editinlinenew
    instanced;

var array<int> ItemIDChoose;
var array<int> PartIDChoose;
var array<BtrDouble> ItemIdx;
var array<BtrDouble> UntilTime;
var array<int> StackCount;
var wItemBoxHK SaveItemInfo[3];
var wItemBoxInstanceHK SaveInstanceInfo[3];
var array<wItemBoxHK> RandItemInfo_0;
var array<wItemBoxHK> RandItemInfo_1;
var array<wItemBoxHK> RandItemInfo_2;
var array<wItemBoxInstanceHK> RandInstanceInfo_0;
var array<wItemBoxInstanceHK> RandInstanceInfo_1;
var array<wItemBoxInstanceHK> RandInstanceInfo_2;
var int AniEndCount;
var int ItemCount;
var localized string strPoint;
var localized string strLabelTopLine;
var FloatBox fbEven[2];
var FloatBox fbOdd[3];
var export editinline BTAniItemBoxButtonHK itemBox[3];
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
    ButtonCancel.SetVisibility(false);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    i = 0;
    J0x86:
    // End:0x10b [While If]
    if(i < 3)
    {
        itemBox[i] = BTAniItemBoxButtonHK(NewComponent(new class'BTAniItemBoxButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
        itemBox[i].itemBox.ChangeState(11);
        itemBox[i].itemBox.bBackgroundInfo = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x86;
    }
    AniEndCount = 0;
    ButtonOK.DisableMe();
}

function SetItemCount(int Count)
{
    local int i;

    ItemCount = Count;
    itemBox[0].SetVisibility(false);
    itemBox[1].SetVisibility(false);
    itemBox[2].SetVisibility(false);
    switch(Count)
    {
        // End:0x9e
        case 1:
            itemBox[0].bUseAWinPos = true;
            itemBox[0].AWinPos = fbOdd[1];
            itemBox[0].ApplyAWinPos();
            itemBox[0].SetVisibility(true);
            // End:0x1af
            break;
        // End:0x125
        case 2:
            i = 0;
            J0xaa:
            // End:0x122 [While If]
            if(i < 2)
            {
                itemBox[i].bUseAWinPos = true;
                itemBox[i].AWinPos = fbEven[i];
                itemBox[i].ApplyAWinPos();
                itemBox[i].SetVisibility(true);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xaa;
            }
            // End:0x1af
            break;
        // End:0x1ac
        case 3:
            i = 0;
            J0x131:
            // End:0x1a9 [While If]
            if(i < 3)
            {
                itemBox[i].bUseAWinPos = true;
                itemBox[i].AWinPos = fbOdd[i];
                itemBox[i].ApplyAWinPos();
                itemBox[i].SetVisibility(true);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x131;
            }
            // End:0x1af
            break;
        // End:0xffff
        default:
}

function SetAcquireItem(int RandNum, int ItemID, int PartID, BtrDouble UniqueID)
{
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    SaveItemInfo[RandNum] = GameMgr.FindUIItem(ItemID);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.ItemID = ItemID;
    // End:0xec
    if(SaveItemInfo[RandNum].CostType == 1 || SaveItemInfo[RandNum].CostType == 4)
    {
        instanceInfo.LeftTime.Day = PartID / 24;
        instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));
    }
    // End:0x17d
    else
    {
        // End:0x14e
        if(SaveItemInfo[RandNum].CostType == 0 || SaveItemInfo[RandNum].CostType == 2)
        {
            instanceInfo.PartID = PartID;
            instanceInfo.Durability = 100000;
        }
        // End:0x17d
        else
        {
            // End:0x17d
            if(SaveItemInfo[RandNum].CostType == 3)
            {
                instanceInfo.OverlapCount = PartID;
            }
        }
    }
    SaveInstanceInfo[RandNum] = instanceInfo;
}

function SetCandidateItems(int RandNum, array<int> ItemID, array<int> PartID)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x288
    if(RandNum == 0)
    {
        RandItemInfo_0.Length = ItemID.Length;
        RandInstanceInfo_0.Length = ItemID.Length;
        i = 0;
        J0x5b:
        // End:0x1f8 [While If]
        if(i < ItemID.Length)
        {
            RandItemInfo_0[i] = GameMgr.FindUIItem(ItemID[i]);
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemID[i];
            // End:0x140
            if(RandItemInfo_0[i].CostType == 1 || RandItemInfo_0[i].CostType == 4)
            {
                instanceInfo.LeftTime.Day = PartID[i] / 24;
                instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));
            }
            // End:0x1dd
            else
            {
                // End:0x1a8
                if(RandItemInfo_0[i].CostType == 0 || RandItemInfo_0[i].CostType == 2)
                {
                    instanceInfo.PartID = PartID[i];
                    instanceInfo.Durability = 100000;
                }
                // End:0x1dd
                else
                {
                    // End:0x1dd
                    if(RandItemInfo_0[i].CostType == 3)
                    {
                        instanceInfo.OverlapCount = PartID[i];
                    }
                }
            }
            RandInstanceInfo_0[i] = instanceInfo;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5b;
        }
        itemBox[RandNum].itemBox.SetCandidateListSize(ItemID.Length);
        itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_0;
        itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_0;
        itemBox[RandNum].SetData(RandItemInfo_0[0], RandInstanceInfo_0[0]);
    }
    // End:0x738
    else
    {
        // End:0x4e1
        if(RandNum == 1)
        {
            RandItemInfo_1.Length = ItemID.Length;
            RandInstanceInfo_1.Length = ItemID.Length;
            i = 0;
            J0x2b4:
            // End:0x451 [While If]
            if(i < ItemID.Length)
            {
                RandItemInfo_1[i] = GameMgr.FindUIItem(ItemID[i]);
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemID[i];
                // End:0x399
                if(RandItemInfo_1[i].CostType == 1 || RandItemInfo_1[i].CostType == 4)
                {
                    instanceInfo.LeftTime.Day = PartID[i] / 24;
                    instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));
                }
                // End:0x436
                else
                {
                    // End:0x401
                    if(RandItemInfo_1[i].CostType == 0 || RandItemInfo_1[i].CostType == 2)
                    {
                        instanceInfo.PartID = PartID[i];
                        instanceInfo.Durability = 100000;
                    }
                    // End:0x436
                    else
                    {
                        // End:0x436
                        if(RandItemInfo_1[i].CostType == 3)
                        {
                            instanceInfo.OverlapCount = PartID[i];
                        }
                    }
                }
                RandInstanceInfo_1[i] = instanceInfo;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2b4;
            }
            itemBox[RandNum].itemBox.SetCandidateListSize(ItemID.Length);
            itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_1;
            itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_1;
            itemBox[RandNum].SetData(RandItemInfo_1[0], RandInstanceInfo_1[0]);
        }
        // End:0x738
        else
        {
            // End:0x738
            if(RandNum == 2)
            {
                RandItemInfo_2.Length = ItemID.Length;
                RandInstanceInfo_2.Length = ItemID.Length;
                i = 0;
                J0x50e:
                // End:0x6ab [While If]
                if(i < ItemID.Length)
                {
                    RandItemInfo_2[i] = GameMgr.FindUIItem(ItemID[i]);
                    instanceInfo = new class'wItemBoxInstanceHK';
                    instanceInfo.ItemID = ItemID[i];
                    // End:0x5f3
                    if(RandItemInfo_2[i].CostType == 1 || RandItemInfo_2[i].CostType == 4)
                    {
                        instanceInfo.LeftTime.Day = PartID[i] / 24;
                        instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));
                    }
                    // End:0x690
                    else
                    {
                        // End:0x65b
                        if(RandItemInfo_2[i].CostType == 0 || RandItemInfo_2[i].CostType == 2)
                        {
                            instanceInfo.PartID = PartID[i];
                            instanceInfo.Durability = 100000;
                        }
                        // End:0x690
                        else
                        {
                            // End:0x690
                            if(RandItemInfo_2[i].CostType == 3)
                            {
                                instanceInfo.OverlapCount = PartID[i];
                            }
                        }
                    }
                    RandInstanceInfo_2[i] = instanceInfo;
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x50e;
                }
                itemBox[RandNum].itemBox.SetCandidateListSize(ItemID.Length);
                itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_2;
                itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_2;
                itemBox[RandNum].SetData(RandItemInfo_2[0], RandInstanceInfo_2[0]);
            }
        }
    }
}

function ButtonItemBox_OnChangeItemInfo_0(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    itemBox[0].SetData(RandItemInfo_0[Index], RandInstanceInfo_0[Index]);
}

function ButtonItemBox_OnChangeItemInfoEnd_0()
{
    PlayerOwner().PlaySound(sound'ui_result_loot_user_open', 0, 1.0);
    // End:0x82
    if(SaveItemInfo[0] == none)
    {
        SaveItemInfo[0] = new class'wItemBoxHK';
        SaveItemInfo[0].ItemID = 0;
        SaveItemInfo[0].ItemName = "";
        SaveItemInfo[0].ItemImage = Texture(class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    itemBox[0].SetData(SaveItemInfo[0], SaveInstanceInfo[0]);
    ++ AniEndCount;
    // End:0xc6
    if(AniEndCount == ItemCount)
    {
        ButtonOK.EnableMe();
    }
}

function ButtonItemBox_OnChangeItemInfo_1(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    itemBox[1].SetData(RandItemInfo_1[Index], RandInstanceInfo_1[Index]);
}

function ButtonItemBox_OnChangeItemInfoEnd_1()
{
    // End:0x6c
    if(SaveItemInfo[1] == none)
    {
        SaveItemInfo[1] = new class'wItemBoxHK';
        SaveItemInfo[1].ItemID = 0;
        SaveItemInfo[1].ItemName = "";
        SaveItemInfo[1].ItemImage = Texture(class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    itemBox[1].SetData(SaveItemInfo[1], SaveInstanceInfo[1]);
    ++ AniEndCount;
    // End:0xb0
    if(AniEndCount == ItemCount)
    {
        ButtonOK.EnableMe();
    }
}

function ButtonItemBox_OnChangeItemInfo_2(int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    itemBox[2].SetData(RandItemInfo_2[Index], RandInstanceInfo_2[Index]);
}

function ButtonItemBox_OnChangeItemInfoEnd_2()
{
    // End:0x71
    if(SaveItemInfo[2] == none)
    {
        SaveItemInfo[2] = new class'wItemBoxHK';
        SaveItemInfo[2].ItemID = 0;
        SaveItemInfo[2].ItemName = "";
        SaveItemInfo[2].ItemImage = Texture(class'BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    itemBox[2].SetData(SaveItemInfo[2], SaveInstanceInfo[2]);
    ++ AniEndCount;
    // End:0xb8
    if(AniEndCount == ItemCount)
    {
        ButtonOK.EnableMe();
    }
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(sound'ui_result_level_up', 6, 1.0);
}

defaultproperties
{
    strLabelTopLine="Random Box"
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