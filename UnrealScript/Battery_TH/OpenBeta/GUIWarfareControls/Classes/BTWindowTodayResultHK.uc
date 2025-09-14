class BTWindowTodayResultHK extends BTWindowHK
    editinlinenew
    instanced;

var BTRODecorateStringHK decoString;
var() automated FloatBox fbLabel[2];
var localized string strLabel[2];
var export editinline BTOwnerDrawImageHK Label[2];
var() automated FloatBox fbLabelLevelBG[4];
var export editinline BTOwnerDrawImageHK LabelLevelBG[4];
var() automated FloatBox fbLabelLevelIConB[4];
var export editinline BTOwnerDrawImageHK LabelLevelIConB[4];
var() automated FloatBox fbLabelLevelIConF[4];
var export editinline BTOwnerDrawImageHK LabelLevelIConF[4];
var() automated FloatBox fbLabelLevel[3];
var export editinline BTOwnerDrawImageHK LabelLevel[3];
var() automated FloatBox fbTPItemList[3];
var export editinline BTTPItemListHK TPItemList[3];
var localized string strExpBar;
var() automated FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool Exit_OnClick(GUIComponent Sender)
{
    Console(Controller.Master.Console).ConsoleCommand("exit");
    return true;
    //return;    
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

    // End:0xDA [Loop If]
    if(i < 2)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(11);
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    i = 0;
    J0xE1:

    // End:0x1D8 [Loop If]
    if(i < 3)
    {
        LabelLevel[i] = NewLabelComponent(fbLabelLevel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelLevelBG[i] = NewLabelComponent(fbLabelLevelBG[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_panel_2);
        LabelLevelIConB[i] = NewLabelComponent(fbLabelLevelIConB[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_icon, 0.9800000);
        LabelLevelIConF[i] = NewLabelComponent(fbLabelLevelIConF[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_icon, 0.9900000);
        LabelLevelIConF[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
        i++;
        // [Loop Continue]
        goto J0xE1;
    }
    LabelLevelBG[3] = NewLabelComponent(fbLabelLevelBG[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_panel_1);
    LabelLevelIConB[3] = NewLabelComponent(fbLabelLevelIConB[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_icon, 0.9800000);
    LabelLevelIConF[3] = NewLabelComponent(fbLabelLevelIConF[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_icon, 0.9900000);
    LabelLevelIConF[3].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    i = 2;
    J0x28A:

    // End:0x54D [Loop If]
    if(i >= 0)
    {
        TPItemList[i] = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPItemListHK', fbTPItemList[i]));
        TPItemList[i].MyData.myLevel = 999;
        TPItemList[i].MyData.MyCash = 99999;
        TPItemList[i].MyData.MyPoint = 99999;
        TPItemList[i].SetOutlineBorder(4, 4);
        TPItemList[i].ItemList.SetItemSize(157, 89);
        TPItemList[i].ItemList.SetItemCountPerPage(3, 1);
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.X1 = 0.0000000;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.Y1 = 0.0000000;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.X2 = 0.0000000;
        TPItemList[i].ItemList.ImageList.MyScrollBar.AWinPos.Y2 = 0.0000000;
        TPItemList[i].ItemList.ImageList.MyScrollBar.ApplyAWinPos();
        TPItemList[i].ItemList.ImageList.MyScrollBar.SetVisibility(false);
        TPItemList[i].ItemList.bIgnoreMouseOnState = true;
        TPItemList[i].ItemList.bIgnoreFocusedState = true;
        TPItemList[i].ItemList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
        i--;
        // [Loop Continue]
        goto J0x28A;
    }
    expbar = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', fbExpBar));
    expbar.ro.LineWidth = 2;
    expbar.ro.bDrawArrow = true;
    UpdateData();
    decoString = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    decoString.Init();
    decoString.OriginalString.FontDrawType = 3;
    TPItemList[0].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_0;
    TPItemList[1].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_1;
    TPItemList[2].ItemList.ImageList.__OnRendered__Delegate = TPItemList_ImageListBox_OnRendered_2;
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
}

function UpdateData()
{
    local int i, j;
    local wGameManager GameMgr;
    local wMatchMaker MM;
    local int perc, curExp, maxExp, startExp;
    local string LevelName[3];
    local array<wPromotionParam> arrItems;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    LevelName[0] = GameMgr.GetLevelName(MM.kLevel + 1);
    LevelName[1] = GameMgr.GetLevelName(MM.kLevel + 2);
    LevelName[2] = GameMgr.GetLevelName(MM.kLevel + 3);
    LabelLevel[0].Caption = LevelName[0];
    LabelLevel[1].Caption = LevelName[1];
    LabelLevel[2].Caption = LevelName[2];
    curExp = MM.kExp;
    startExp = MM.kStartExp;
    maxExp = MM.kEndExp;
    perc = 100 - int((float(curExp - startExp) / float(maxExp - startExp)) * 100.0000000);
    expbar.SetData(curExp - startExp, maxExp - startExp, Class'Engine.BTCustomDrawHK'.static.FormatString(strExpBar, LevelName[0], string(perc)), "");
    GameMgr.GetLevelImage(MM.kLevel + 1, 0, LabelLevelIConF[0].BackgroundImage);
    GameMgr.GetLevelImage(MM.kLevel + 2, 0, LabelLevelIConF[1].BackgroundImage);
    GameMgr.GetLevelImage(MM.kLevel + 3, 0, LabelLevelIConF[2].BackgroundImage);
    GameMgr.GetLevelImage(MM.kLevel, 0, LabelLevelIConF[3].BackgroundImage);
    i = 0;
    J0x2A8:

    // End:0x3E9 [Loop If]
    if(i < 3)
    {
        arrItems.Length = GameMgr.GetPromotionItemsCount((MM.kLevel + i) + 1);
        GameMgr.GetPromotionItems((MM.kLevel + i) + 1, arrItems);
        j = 0;
        J0x315:

        // End:0x3DF [Loop If]
        if(j < arrItems.Length)
        {
            // End:0x379
            if(int(arrItems[j].sAcquireItem) != 0)
            {
                AddItem(i, int(arrItems[j].sAcquireItem), arrItems[j].nPartID);
                // [Explicit Continue]
                goto J0x3D5;
            }
            // End:0x3D5
            if((arrItems[j].sAcquireItem == "point") && arrItems[j].nPartID != 0)
            {
                AddItem(i, 0, arrItems[j].nPartID);
            }
            J0x3D5:

            j++;
            // [Loop Continue]
            goto J0x315;
        }
        i++;
        // [Loop Continue]
        goto J0x2A8;
    }
    TPItemList[0].ItemList.ShowAll(100);
    TPItemList[1].ItemList.ShowAll(100);
    TPItemList[2].ItemList.ShowAll(100);
    //return;    
}

function AddItem(int pos, int ItemID, int PartID)
{
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    ro.Init();
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.OverlapCount = 1;
    // End:0x127
    if(ItemID == 0)
    {
        // End:0x124
        if(PartID != 0)
        {
            ro.ItemInfo = new Class'Engine.wItemBoxHK';
            ro.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_Item_FT_point;
            ro.ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, string(PartID) @ ro.strPoint);
            ro.ChangeState(13);
            ro.MyData = TPItemList[pos].MyData;
        }        
    }
    else
    {
        ro.ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x1AA
        if(ro.ItemInfo.CostType == 1)
        {
            instanceInfo.LeftTime.Day = PartID / 24;
            instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));            
        }
        else
        {
            // End:0x212
            if((ro.ItemInfo.CostType == 0) || ro.ItemInfo.CostType == 2)
            {
                instanceInfo.PartID = PartID;
                instanceInfo.Durability = 100000;                
            }
            else
            {
                // End:0x244
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
    //return;    
}

defaultproperties
{
    fbLabel[0]=(X1=151.0000000,Y1=202.0000000,X2=250.0000000,Y2=220.0000000)
    fbLabel[1]=(X1=151.0000000,Y1=265.0000000,X2=250.0000000,Y2=283.0000000)
    strLabel[0]="??????????"
    strLabel[1]="??????"
    fbLabelLevelBG[0]=(X1=256.0000000,Y1=250.0000000,X2=422.0000000,Y2=297.0000000)
    fbLabelLevelBG[1]=(X1=429.0000000,Y1=250.0000000,X2=595.0000000,Y2=297.0000000)
    fbLabelLevelBG[2]=(X1=602.0000000,Y1=250.0000000,X2=768.0000000,Y2=297.0000000)
    fbLabelLevelBG[3]=(X1=256.0000000,Y1=183.0000000,X2=768.0000000,Y2=240.0000000)
    fbLabelLevelIConB[0]=(X1=271.0000000,Y1=257.0000000,X2=305.0000000,Y2=291.0000000)
    fbLabelLevelIConB[1]=(X1=444.0000000,Y1=257.0000000,X2=478.0000000,Y2=291.0000000)
    fbLabelLevelIConB[2]=(X1=617.0000000,Y1=257.0000000,X2=651.0000000,Y2=291.0000000)
    fbLabelLevelIConB[3]=(X1=271.0000000,Y1=194.0000000,X2=305.0000000,Y2=228.0000000)
    fbLabelLevelIConF[0]=(X1=272.0000000,Y1=258.0000000,X2=304.0000000,Y2=290.0000000)
    fbLabelLevelIConF[1]=(X1=445.0000000,Y1=258.0000000,X2=477.0000000,Y2=290.0000000)
    fbLabelLevelIConF[2]=(X1=618.0000000,Y1=258.0000000,X2=650.0000000,Y2=290.0000000)
    fbLabelLevelIConF[3]=(X1=272.0000000,Y1=195.0000000,X2=304.0000000,Y2=227.0000000)
    fbLabelLevel[0]=(X1=311.0000000,Y1=265.0000000,X2=405.0000000,Y2=283.0000000)
    fbLabelLevel[1]=(X1=484.0000000,Y1=265.0000000,X2=578.0000000,Y2=283.0000000)
    fbLabelLevel[2]=(X1=657.0000000,Y1=265.0000000,X2=751.0000000,Y2=283.0000000)
    fbTPItemList[0]=(X1=256.0000000,Y1=297.0000000,X2=423.0000000,Y2=573.0000000)
    fbTPItemList[1]=(X1=429.0000000,Y1=297.0000000,X2=596.0000000,Y2=573.0000000)
    fbTPItemList[2]=(X1=602.0000000,Y1=297.0000000,X2=769.0000000,Y2=573.0000000)
    strExpBar="?????????????????? %0 ????? %1%"
    fbExpBar=(X1=318.0000000,Y1=198.0000000,X2=754.0000000,Y2=224.0000000)
    fbBackgroundImage=(X1=127.0000000,Y1=128.0000000,X2=898.0000000,Y2=639.0000000)
    fbTopLine=(X1=147.0000000,Y1=147.0000000,X2=878.0000000,Y2=173.0000000)
    fbBottomLine=(X1=147.0000000,Y1=576.0000000,X2=878.0000000,Y2=620.0000000)
    fbButtonOK=(X1=390.0000000,Y1=581.0000000,X2=510.0000000,Y2=613.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=581.0000000,X2=634.0000000,Y2=613.0000000)
    strTitle="????????????????"
    strOK="?????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}