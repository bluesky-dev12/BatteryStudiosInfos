class BTWindowItemBuyTerm extends BTWindowHK
    editinlinenew
    instanced;

var int ItemID;
var BtrDouble UniqueID;
var byte OptionDay;
var wItemBoxHK ItemInfo;
var wItemBoxInstanceHK instanceInfo;
var wItemBoxCashHK cii;
var FloatBox fbItemBoxView;
var export editinline BTItemBoxButtonHK ItemBoxView;
var export editinline BTOwnerDrawImageHK lbBriefingInfo[4];
var FloatBox fbBriefingInfo[4];
var localized string strBriefingInfo[4];
var export editinline BTOwnerDrawImageHK lbItemName;
var FloatBox fbItemName;
var localized string strItemRemaingTime;
var localized string strRemaingTerm[2];
var localized string strItemRenewal;
var export editinline BTOwnerDrawImageHK imgItemSelectBack;
var FloatBox fbItemSelectBack;
var BTROItemBoxHK ro;
var int cashType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    imgItemSelectBack = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    imgItemSelectBack.bUseAWinPos = true;
    imgItemSelectBack.AWinPos = fbBackgroundImage;
    imgItemSelectBack.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_timeitempopup_info;
    imgItemSelectBack.InitComponent(MyController, self);
    AppendComponent(imgItemSelectBack);
    super.InitComponent(MyController, myOwner);
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    ItemBoxView.AWinPos = fbItemBoxView;
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.ChangeState(18);
    lbItemName = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    lbItemName.bUseAWinPos = true;
    lbItemName.AWinPos = fbItemName;
    lbItemName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    lbItemName.SetFontSizeAll(11);
    lbItemName.SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbItemName.InitComponent(MyController, self);
    AppendComponent(lbItemName);
    i = 0;
    J0x189:

    // End:0x291 [Loop If]
    if(i < 4)
    {
        lbBriefingInfo[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        lbBriefingInfo[i].bUseAWinPos = true;
        lbBriefingInfo[i].AWinPos = fbBriefingInfo[i];
        lbBriefingInfo[i].Caption = strBriefingInfo[i];
        lbBriefingInfo[i].SetFontSizeAll(9);
        lbBriefingInfo[i].CaptionDrawType = 4;
        lbBriefingInfo[i].SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
        lbBriefingInfo[i].InitComponent(MyController, self);
        AppendComponent(lbBriefingInfo[i]);
        ++i;
        // [Loop Continue]
        goto J0x189;
    }
    UpdateDefaultWindow();
    TopLine.CaptionDrawType = 4;
    //return;    
}

function SetRenderObject(BTROItemBoxHK ro)
{
    self.ro = ro;
    ItemBoxView.SetData(ro.ItemInfo, ro.instanceInfo);
    // End:0xC0
    if(((ro.ItemInfo.IsCashItem() == true) && ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
    {
        lbItemName.Caption = ro.instanceInfo.CashItemInfo.WZItemName;        
    }
    else
    {
        lbItemName.Caption = ro.ItemInfo.ItemName;
    }
    SetData(ro.ItemInfo.ItemID, ro.instanceInfo.UniqueID, ro.ItemInfo);
    //return;    
}

function SetData(int iItemID, BtrDouble iUniqueID, wItemBoxHK itemInfoBase)
{
    ItemID = iItemID;
    UniqueID = iUniqueID;
    ItemInfo = itemInfoBase;
    //return;    
}

function SetOptionDay(byte iDay)
{
    OptionDay = iDay;
    //return;    
}

function SetCashType(int buyCashType)
{
    cashType = buyCashType;
    //return;    
}

defaultproperties
{
    OptionDay=1
    fbItemBoxView=(X1=436.0000000,Y1=289.0000000,X2=589.0000000,Y2=343.0000000)
    fbBriefingInfo[0]=(X1=323.0000000,Y1=198.0000000,X2=701.0000000,Y2=211.0000000)
    fbBriefingInfo[1]=(X1=323.0000000,Y1=213.0000000,X2=701.0000000,Y2=226.0000000)
    fbBriefingInfo[2]=(X1=323.0000000,Y1=228.0000000,X2=701.0000000,Y2=241.0000000)
    fbBriefingInfo[3]=(X1=323.0000000,Y1=243.0000000,X2=701.0000000,Y2=256.0000000)
    strBriefingInfo[0]="When a new item is purchased, the item is at maximum durability."
    strBriefingInfo[1]="To extend the duration of items already purchased, "
    strBriefingInfo[2]=" use the 'Extend' button in your Inventory."
    strBriefingInfo[3]="Purchase selected item(s)?"
    fbItemName=(X1=403.0000000,Y1=279.0000000,X2=621.0000000,Y2=294.0000000)
    fbBackgroundImage=(X1=297.0000000,Y1=159.0000000,X2=727.0000000,Y2=472.0000000)
    fbTopLine=(X1=403.0000000,Y1=165.0000000,X2=621.0000000,Y2=180.0000000)
    fbBottomLine=(X1=317.0000000,Y1=441.0000000,X2=707.0000000,Y2=484.0000000)
    fbButtonOK=(X1=378.0000000,Y1=419.0000000,X2=502.0000000,Y2=456.0000000)
    fbButtonCancel=(X1=522.0000000,Y1=419.0000000,X2=646.0000000,Y2=456.0000000)
    strOK="Buy Item"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}