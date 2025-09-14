/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowTodayResultHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:8
 *
 *******************************************************************************/
class BTWindowTodayResultHK extends BTWindowHK
    editinlinenew
    instanced;

var BTRODecorateStringHK decoString;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[2];
var localized string strLabel[2];
var export editinline BTOwnerDrawImageHK Label[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLevelBG[4];
var export editinline BTOwnerDrawImageHK LabelLevelBG[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLevelIConB[4];
var export editinline BTOwnerDrawImageHK LabelLevelIConB[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLevelIConF[4];
var export editinline BTOwnerDrawImageHK LabelLevelIConF[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLevel[3];
var export editinline BTOwnerDrawImageHK LabelLevel[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList[3];
var export editinline BTTPItemListHK TPItemList[3];
var localized string strExpBar;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;
var const int iMaxLevel;

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    return true;
}

function bool Exit_OnClick(GUIComponent Sender)
{
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wGameManager GameMgr;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TopLine.SetFontDrawType(4);
    __OnOK__Delegate = Exit_OnClick;
    i = 0;
    J0x62:
    // End:0xda [While If]
    if(i < 2)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(11);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    i = 0;
    J0xe1:
    // End:0x1d8 [While If]
    if(i < 3)
    {
        LabelLevel[i] = NewLabelComponent(fbLabelLevel[i], class'BTUIResourcePoolHK'.default.empty);
        LabelLevelBG[i] = NewLabelComponent(fbLabelLevelBG[i], class'BTUIResourcePoolHK'.default.img_panel_2);
        LabelLevelIConB[i] = NewLabelComponent(fbLabelLevelIConB[i], class'BTUIResourcePoolHK'.default.img_edge_icon, 0.980);
        LabelLevelIConF[i] = NewLabelComponent(fbLabelLevelIConF[i], class'BTUIResourcePoolHK'.default.img_edge_icon, 0.990);
        LabelLevelIConF[i].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
    LabelLevelBG[3] = NewLabelComponent(fbLabelLevelBG[i], class'BTUIResourcePoolHK'.default.img_panel_1);
    LabelLevelIConB[3] = NewLabelComponent(fbLabelLevelIConB[i], class'BTUIResourcePoolHK'.default.img_edge_icon, 0.980);
    LabelLevelIConF[3] = NewLabelComponent(fbLabelLevelIConF[i], class'BTUIResourcePoolHK'.default.img_edge_icon, 0.990);
    LabelLevelIConF[3].BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    i = 2;
    J0x28a:
    // End:0x54d [While If]
    if(i >= 0)
    {
        TPItemList[i] = BTTPItemListHK(NewComponent(new class'BTTPItemListHK', fbTPItemList[i]));
        TPItemList[i].MyData.myLevel = 999;
        TPItemList[i].MyData.MyCash = 99999;
        TPItemList[i].MyData.MyPoint = 99999;
        TPItemList[i].SetOutlineBorder(4, 4);
        TPItemList[i].ItemList.SetItemSize(157, 89);
        TPItemList[i].ItemList.SetItemCountPerPage(3, 1);
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.X1 = 0.0;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.Y1 = 0.0;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.X2 = 0.0;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.Y2 = 0.0;
        TPItemList[i].ItemList.ImageList.MyScrollBar.ApplyAWinPos();
        TPItemList[i].ItemList.ImageList.MyScrollBar.SetVisibility(false);
        TPItemList[i].ItemList.bIgnoreMouseOnState = true;
        TPItemList[i].ItemList.bIgnoreFocusedState = true;
        TPItemList[i].ItemList.BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x28a;
    }
    expbar = BTExpBarHK(NewComponent(new class'BTExpBarHK', fbExpBar));
    expbar.ro.LineWidth = 2;
    expbar.ro.bDrawArrow = true;
    UpdateData();
    decoString = new class'BTRODecorateStringHK';
    decoString.Init();
    decoString.OriginalString.FontDrawType = 3;
    TPItemList[0].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_0;
    TPItemList[1].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_1;
    TPItemList[2].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_2;
}

function TPItemList_ImageListBox_OnRendered_0(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x173
    if(TPItemList[0].ItemList.VolatileSelectItemIndex >= 0)
    {
        decoString.bVisible = true;
        decoString.AWinPos.X1 = float(int(Controller.MouseX) + 10);
        decoString.AWinPos.X2 = float(int(Controller.MouseX) + 310);
        decoString.AWinPos.Y1 = float(int(Controller.MouseY) + 10);
        decoString.AWinPos.Y2 = float(int(Controller.MouseY) + 24);
        ro = BTROItemBoxHK(TPItemList[0].ItemList.DataList[TPItemList[0].ItemList.SelectItemIndex]);
        // End:0x173
        if(ro.ItemInfo.ItemDescription != "")
        {
            decoString.SetData(ro.ItemInfo.ItemDescription);
            decoString.Render(C);
            return;
        }
    }
    decoString.bVisible = false;
}

function TPItemList_ImageListBox_OnRendered_1(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x173
    if(TPItemList[1].ItemList.VolatileSelectItemIndex >= 0)
    {
        decoString.bVisible = true;
        decoString.AWinPos.X1 = float(int(Controller.MouseX) + 10);
        decoString.AWinPos.X2 = float(int(Controller.MouseX) + 310);
        decoString.AWinPos.Y1 = float(int(Controller.MouseY) + 10);
        decoString.AWinPos.Y2 = float(int(Controller.MouseY) + 24);
        ro = BTROItemBoxHK(TPItemList[1].ItemList.DataList[TPItemList[1].ItemList.SelectItemIndex]);
        // End:0x173
        if(ro.ItemInfo.ItemDescription != "")
        {
            decoString.SetData(ro.ItemInfo.ItemDescription);
            decoString.Render(C);
            return;
        }
    }
    decoString.bVisible = false;
}

function TPItemList_ImageListBox_OnRendered_2(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x176
    if(TPItemList[2].ItemList.VolatileSelectItemIndex >= 0)
    {
        decoString.bVisible = true;
        decoString.AWinPos.X1 = float(int(Controller.MouseX) + 10);
        decoString.AWinPos.X2 = float(int(Controller.MouseX) + 310);
        decoString.AWinPos.Y1 = float(int(Controller.MouseY) + 10);
        decoString.AWinPos.Y2 = float(int(Controller.MouseY) + 24);
        ro = BTROItemBoxHK(TPItemList[2].ItemList.DataList[TPItemList[2].ItemList.SelectItemIndex]);
        // End:0x176
        if(ro.ItemInfo.ItemDescription != "")
        {
            decoString.SetData(ro.ItemInfo.ItemDescription);
            decoString.Render(C);
            return;
        }
    }
    decoString.bVisible = false;
}

function UpdateData()
{
    local int i, j, iLevelCount;
    local wGameManager GameMgr;
    local wMatchMaker MM;
    local int perc, curExp, maxExp, startExp;
    local string LevelName[3];
    local array<wPromotionParam> arrItems;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    iLevelCount = 0;
    i = 1;
    J0x6d:
    // End:0xac [While If]
    if(i <= 3)
    {
        // End:0x9b
        if(MM.kLevel + i > iMaxLevel)
        {
        }
        // End:0xac
        else
        {
            ++ iLevelCount;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6d;
        }
    }
    // End:0xb9
    if(iLevelCount == 0)
    {
        return;
    }
    i = 0;
    J0xc0:
    // End:0x2b1 [While If]
    if(i < iLevelCount)
    {
        LevelName[i] = GameMgr.GetLevelName(MM.kLevel + i + 1);
        LabelLevel[i].Caption = LevelName[i];
        GameMgr.GetLevelImage(MM.kLevel + i + 1, 0, LabelLevelIConF[i].BackgroundImage);
        arrItems.Length = GameMgr.GetPromotionItemsCount(MM.kLevel + i + 1);
        GameMgr.GetPromotionItems(MM.kLevel + i + 1, arrItems);
        j = 0;
        J0x1bf:
        // End:0x289 [While If]
        if(j < arrItems.Length)
        {
            // End:0x223
            if(int(arrItems[j].sAcquireItem) != 0)
            {
                AddItem(i, int(arrItems[j].sAcquireItem), arrItems[j].nPartID);
            }
            // End:0x27f
            else
            {
                // End:0x27f
                if(arrItems[j].sAcquireItem == "point" && arrItems[j].nPartID != 0)
                {
                    AddItem(i, 0, arrItems[j].nPartID);
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1bf;
        }
        TPItemList[i].ItemList.ShowItemAll();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc0;
    }
    GameMgr.GetLevelImage(MM.kLevel, 0, LabelLevelIConF[3].BackgroundImage);
    curExp = MM.kExp;
    startExp = MM.kStartExp;
    maxExp = MM.kEndExp;
    // End:0x35b
    if(maxExp != 0)
    {
        perc = 100 - int(float(curExp - startExp) / float(maxExp - startExp) * 100.0);
    }
    // End:0x363
    else
    {
        perc = 100;
    }
    expbar.SetData(curExp - startExp, maxExp - startExp, class'BTCustomDrawHK'.static.FormatString(strExpBar, LevelName[0], string(perc)), "");
}

function AddItem(int pos, int ItemID, int PartID)
{
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new class'BTROItemBoxHK';
    ro.Init();
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.OverlapCount = 1;
    // End:0x127
    if(ItemID == 0)
    {
        // End:0x124
        if(PartID != 0)
        {
            ro.ItemInfo = new class'wItemBoxHK';
            ro.ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_FT_point;
            ro.ItemName = class'BTCustomDrawHK'.static.MakeText(10, 0, string(PartID) @ ro.strPoint);
            ro.ChangeState(13);
            ro.MyData = TPItemList[pos].MyData;
        }
    }
    // End:0x2bb
    else
    {
        ro.ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x1ca
        if(ro.ItemInfo.CostType == 1 || ro.ItemInfo.CostType == 4)
        {
            instanceInfo.LeftTime.Day = PartID / 24;
            instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));
        }
        // End:0x264
        else
        {
            // End:0x232
            if(ro.ItemInfo.CostType == 0 || ro.ItemInfo.CostType == 2)
            {
                instanceInfo.PartID = PartID;
                instanceInfo.Durability = 100000;
            }
            // End:0x264
            else
            {
                // End:0x264
                if(ro.ItemInfo.CostType == 3)
                {
                    instanceInfo.OverlapCount = PartID;
                }
            }
        }
        ro.instanceInfo = instanceInfo;
        ro.ChangeState(12);
        ro.MyData = TPItemList[pos].MyData;
        ro.Update();
    }
    TPItemList[pos].ItemList.AddItem(ro);
}

defaultproperties
{
    fbLabel[0]=(X1=151.0,Y1=202.0,X2=250.0,Y2=220.0)
    fbLabel[1]=(X1=151.0,Y1=265.0,X2=250.0,Y2=283.0)
    strLabel[0]="Current Lv."
    strLabel[1]="Reward"
    fbLabelLevelBG[0]=(X1=256.0,Y1=250.0,X2=422.0,Y2=297.0)
    fbLabelLevelBG[1]=(X1=429.0,Y1=250.0,X2=595.0,Y2=297.0)
    fbLabelLevelBG[2]=(X1=602.0,Y1=250.0,X2=768.0,Y2=297.0)
    fbLabelLevelBG[3]=(X1=256.0,Y1=183.0,X2=768.0,Y2=240.0)
    fbLabelLevelIConB[0]=(X1=271.0,Y1=257.0,X2=305.0,Y2=291.0)
    fbLabelLevelIConB[1]=(X1=444.0,Y1=257.0,X2=478.0,Y2=291.0)
    fbLabelLevelIConB[2]=(X1=617.0,Y1=257.0,X2=651.0,Y2=291.0)
    fbLabelLevelIConB[3]=(X1=271.0,Y1=194.0,X2=305.0,Y2=228.0)
    fbLabelLevelIConF[0]=(X1=272.0,Y1=258.0,X2=304.0,Y2=290.0)
    fbLabelLevelIConF[1]=(X1=445.0,Y1=258.0,X2=477.0,Y2=290.0)
    fbLabelLevelIConF[2]=(X1=618.0,Y1=258.0,X2=650.0,Y2=290.0)
    fbLabelLevelIConF[3]=(X1=272.0,Y1=195.0,X2=304.0,Y2=227.0)
    fbLabelLevel[0]=(X1=311.0,Y1=265.0,X2=405.0,Y2=283.0)
    fbLabelLevel[1]=(X1=484.0,Y1=265.0,X2=578.0,Y2=283.0)
    fbLabelLevel[2]=(X1=657.0,Y1=265.0,X2=751.0,Y2=283.0)
    fbTPItemList[0]=(X1=256.0,Y1=297.0,X2=423.0,Y2=573.0)
    fbTPItemList[1]=(X1=429.0,Y1=297.0,X2=596.0,Y2=573.0)
    fbTPItemList[2]=(X1=602.0,Y1=297.0,X2=769.0,Y2=573.0)
    strExpBar="%1% EXP to %0."
    fbExpBar=(X1=318.0,Y1=198.0,X2=754.0,Y2=224.0)
    iMaxLevel=100
    fbBackgroundImage=(X1=127.0,Y1=128.0,X2=898.0,Y2=639.0)
    fbTopLine=(X1=147.0,Y1=147.0,X2=878.0,Y2=173.0)
    fbBottomLine=(X1=147.0,Y1=576.0,X2=878.0,Y2=620.0)
    fbButtonOK=(X1=390.0,Y1=581.0,X2=510.0,Y2=613.0)
    fbButtonCancel=(X1=515.0,Y1=581.0,X2=634.0,Y2=613.0)
    strTitle="Today's Results"
    strOK="Quit Game"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}