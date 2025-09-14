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
var array<int> RandItemBestInfo_0;
var array<int> RandItemBestInfo_1;
var array<int> RandItemBestInfo_2;
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
var bool useEndSound;
//var delegate<RandEnd> __RandEnd__Delegate;

delegate RandEnd()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ButtonCancel.SetVisibility(false);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    i = 0;
    J0x86:

    // End:0x10B [Loop If]
    if(i < 3)
    {
        itemBox[i] = BTAniItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAniItemBoxButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
        itemBox[i].itemBox.ChangeState(11);
        itemBox[i].itemBox.bBackgroundInfo = true;
        i++;
        // [Loop Continue]
        goto J0x86;
    }
    AniEndCount = 0;
    ButtonOK.DisableMe();
    //return;    
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
        // End:0x9E
        case 1:
            itemBox[0].bUseAWinPos = true;
            itemBox[0].AWinPos = fbOdd[1];
            itemBox[0].ApplyAWinPos();
            itemBox[0].SetVisibility(true);
            // End:0x1AF
            break;
        // End:0x125
        case 2:
            i = 0;
            J0xAA:

            // End:0x122 [Loop If]
            if(i < 2)
            {
                itemBox[i].bUseAWinPos = true;
                itemBox[i].AWinPos = fbEven[i];
                itemBox[i].ApplyAWinPos();
                itemBox[i].SetVisibility(true);
                i++;
                // [Loop Continue]
                goto J0xAA;
            }
            // End:0x1AF
            break;
        // End:0x1AC
        case 3:
            i = 0;
            J0x131:

            // End:0x1A9 [Loop If]
            if(i < 3)
            {
                itemBox[i].bUseAWinPos = true;
                itemBox[i].AWinPos = fbOdd[i];
                itemBox[i].ApplyAWinPos();
                itemBox[i].SetVisibility(true);
                i++;
                // [Loop Continue]
                goto J0x131;
            }
            // End:0x1AF
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetAcquireItem(int RandNum, int ItemID, int PartID, BtrDouble UniqueID)
{
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    SaveItemInfo[RandNum] = GameMgr.FindUIItem(ItemID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.ItemID = ItemID;
    // End:0xEC
    if((SaveItemInfo[RandNum].CostType == 1) || SaveItemInfo[RandNum].CostType == 4)
    {
        instanceInfo.LeftTime.Day = PartID / 24;
        instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));        
    }
    else
    {
        // End:0x14E
        if((SaveItemInfo[RandNum].CostType == 0) || SaveItemInfo[RandNum].CostType == 2)
        {
            instanceInfo.PartID = PartID;
            instanceInfo.Durability = 100000;            
        }
        else
        {
            // End:0x17D
            if(SaveItemInfo[RandNum].CostType == 3)
            {
                instanceInfo.OverlapCount = PartID;
            }
        }
    }
    SaveInstanceInfo[RandNum] = instanceInfo;
    //return;    
}

function CandidateItems(out array<wItemBoxHK> randItemInfo, out array<wItemBoxInstanceHK> randInstanceInfo, out array<int> randBestItemID, int RandNum, array<int> ItemID, array<int> PartID, array<int> BestItemID)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    randItemInfo.Length = ItemID.Length;
    randInstanceInfo.Length = ItemID.Length;
    i = 0;
    J0x50:

    // End:0x1ED [Loop If]
    if(i < ItemID.Length)
    {
        randItemInfo[i] = GameMgr.FindUIItem(ItemID[i]);
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        instanceInfo.ItemID = ItemID[i];
        // End:0x135
        if((randItemInfo[i].CostType == 1) || randItemInfo[i].CostType == 4)
        {
            instanceInfo.LeftTime.Day = PartID[i] / 24;
            instanceInfo.LeftTime.Hour = int(float(PartID[i]) % float(24));            
        }
        else
        {
            // End:0x19D
            if((randItemInfo[i].CostType == 0) || randItemInfo[i].CostType == 2)
            {
                instanceInfo.PartID = PartID[i];
                instanceInfo.Durability = 100000;                
            }
            else
            {
                // End:0x1D2
                if(randItemInfo[i].CostType == 3)
                {
                    instanceInfo.OverlapCount = PartID[i];
                }
            }
        }
        randInstanceInfo[i] = instanceInfo;
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    randBestItemID.Length = BestItemID.Length;
    i = 0;
    J0x201:

    // End:0x232 [Loop If]
    if(i < BestItemID.Length)
    {
        randBestItemID[i] = BestItemID[i];
        i++;
        // [Loop Continue]
        goto J0x201;
    }
    itemBox[RandNum].itemBox.SetCandidateListSize(ItemID.Length);
    itemBox[RandNum].SetData(randItemInfo[0], randInstanceInfo[0], IsBestItem(0, randItemInfo[0].ItemID));
    //return;    
}

function SetCandidateItems(int RandNum, array<int> ItemID, array<int> PartID, array<int> BestItemID)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xAC
    if(RandNum == 0)
    {
        CandidateItems(RandItemInfo_0, RandInstanceInfo_0, RandItemBestInfo_0, RandNum, ItemID, PartID, BestItemID);
        itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_0;
        itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_0;        
    }
    else
    {
        // End:0x129
        if(RandNum == 1)
        {
            CandidateItems(RandItemInfo_1, RandInstanceInfo_1, RandItemBestInfo_1, RandNum, ItemID, PartID, BestItemID);
            itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_1;
            itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_1;            
        }
        else
        {
            // End:0x1A4
            if(RandNum == 2)
            {
                CandidateItems(RandItemInfo_2, RandInstanceInfo_2, RandItemBestInfo_2, RandNum, ItemID, PartID, BestItemID);
                itemBox[RandNum].itemBox.__OnChangeItemInfo__Delegate = ButtonItemBox_OnChangeItemInfo_2;
                itemBox[RandNum].itemBox.__OnChangeItemInfoEnd__Delegate = ButtonItemBox_OnChangeItemInfoEnd_2;
            }
        }
    }
    itemBox[RandNum].itemBox.__OnDramaEnded__Delegate = Internal_OnDramaEnded;
    //return;    
}

function ButtonItemBox_OnChangeItemInfo(array<wItemBoxHK> randItemInfo, array<wItemBoxInstanceHK> randInstanceInfo, int itemBoxIndex, int Index)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    itemBox[itemBoxIndex].SetData(randItemInfo[Index], randInstanceInfo[Index], IsBestItem(itemBoxIndex, randItemInfo[Index].ItemID));
    // End:0xDF
    if(itemBox[itemBoxIndex].itemBox.RollCount > (itemBox[itemBoxIndex].itemBox.RollMaxCount / 2))
    {
        itemBox[itemBoxIndex + 1].itemBox.bStartCheckCount = true;
    }
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd(int itemBoxIndex)
{
    // End:0x80
    if(SaveItemInfo[itemBoxIndex] == none)
    {
        SaveItemInfo[itemBoxIndex] = new Class'Engine.wItemBoxHK';
        SaveItemInfo[itemBoxIndex].ItemID = 0;
        SaveItemInfo[itemBoxIndex].ItemName = "";
        SaveItemInfo[itemBoxIndex].ItemImage = Texture(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_WP_ETC_RifleBox.Image);
    }
    itemBox[itemBoxIndex].SetData(SaveItemInfo[itemBoxIndex], SaveInstanceInfo[itemBoxIndex], IsBestItem(itemBoxIndex, SaveItemInfo[itemBoxIndex].ItemID));
    //return;    
}

function ButtonItemBox_OnChangeItemInfo_0(int Index)
{
    ButtonItemBox_OnChangeItemInfo(RandItemInfo_0, RandInstanceInfo_0, 0, Index);
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd_0()
{
    ButtonItemBox_OnChangeItemInfoEnd(0);
    //return;    
}

function ButtonItemBox_OnChangeItemInfo_1(int Index)
{
    ButtonItemBox_OnChangeItemInfo(RandItemInfo_1, RandInstanceInfo_1, 1, Index);
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd_1()
{
    ButtonItemBox_OnChangeItemInfoEnd(1);
    //return;    
}

function ButtonItemBox_OnChangeItemInfo_2(int Index)
{
    ButtonItemBox_OnChangeItemInfo(RandItemInfo_2, RandInstanceInfo_2, 2, Index);
    //return;    
}

function ButtonItemBox_OnChangeItemInfoEnd_2()
{
    ButtonItemBox_OnChangeItemInfoEnd(2);
    //return;    
}

function Internal_OnDramaEnded()
{
    // End:0x3D
    if(useEndSound)
    {
        PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Result/user_open",,, 6);
    }
    AniEndCount++;
    // End:0x59
    if(AniEndCount == ItemCount)
    {
        AllEnd();
    }
    //return;    
}

function AllEnd()
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0x136 [Loop If]
    if(i < ItemIDChoose.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ItemIDChoose[i]);
        // End:0xE5
        if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
        {
            GameMgr.AddInstanceItemByParameter(ItemIDChoose[i], ItemIdx[i], 0, 13, 1, 100000, PartIDChoose[i], 0, StackCount[i], 0, UntilTime[i]);
            // [Explicit Continue]
            goto J0x12C;
        }
        GameMgr.AddInstanceItemByParameter(ItemIDChoose[i], ItemIdx[i], 0, 13, 1, 100000, 0, 0, StackCount[i], 0, UntilTime[i]);
        J0x12C:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    GameMgr.UpdateItemList(GameMgr);
    RandEnd();
    ButtonOK.EnableMe();
    //return;    
}

function Internal_OnOpen()
{
    // End:0x3C
    if(UseOpenSound)
    {
        PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Result/level_up",,, 6);
    }
    //return;    
}

function bool IsBestItem(int RandNum, int ItemID)
{
    local int i;
    local bool IsBestItem;

    // End:0x4F
    if(RandNum == 0)
    {
        i = 0;
        J0x12:

        // End:0x4C [Loop If]
        if(i < RandItemBestInfo_0.Length)
        {
            // End:0x42
            if(ItemID == RandItemBestInfo_0[i])
            {
                IsBestItem = true;
                // [Explicit Break]
                goto J0x4C;
            }
            ++i;
            // [Loop Continue]
            goto J0x12;
        }
        J0x4C:
        
    }
    else
    {
        // End:0x9E
        if(RandNum == 1)
        {
            i = 0;
            J0x61:

            // End:0x9B [Loop If]
            if(i < RandItemBestInfo_1.Length)
            {
                // End:0x91
                if(ItemID == RandItemBestInfo_1[i])
                {
                    IsBestItem = true;
                    // [Explicit Break]
                    goto J0x9B;
                }
                ++i;
                // [Loop Continue]
                goto J0x61;
            }
            J0x9B:
            
        }
        else
        {
            // End:0xEB
            if(RandNum == 2)
            {
                i = 0;
                J0xB1:

                // End:0xEB [Loop If]
                if(i < RandItemBestInfo_2.Length)
                {
                    // End:0xE1
                    if(ItemID == RandItemBestInfo_2[i])
                    {
                        IsBestItem = true;
                        // [Explicit Break]
                        goto J0xEB;
                    }
                    ++i;
                    // [Loop Continue]
                    goto J0xB1;
                }
            }
        }
    }
    J0xEB:

    return IsBestItem;
    //return;    
}

function SetStepProcess()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < 3)
    {
        itemBox[i].itemBox.bStartCheckCount = false;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    itemBox[0].itemBox.bStartCheckCount = true;
    //return;    
}

defaultproperties
{
    strLabelTopLine="Random Box"
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
    useEndSound=true
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
    OnOpen=BTWindowRandBoxHK.Internal_OnOpen
}