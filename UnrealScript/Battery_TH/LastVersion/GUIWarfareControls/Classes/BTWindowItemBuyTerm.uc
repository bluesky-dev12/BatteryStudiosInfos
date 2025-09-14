class BTWindowItemBuyTerm extends BTWindowHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
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
var BTROItemBoxHK Ro;
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
    __OnOK__Delegate = ItemBuyTerm_OnOK;
    UpdateDefaultWindow();
    TopLine.CaptionDrawType = 4;
    //return;    
}

function SetRenderObject(BTROItemBoxHK Ro)
{
    self.Ro = Ro;
    ItemBoxView.SetData(Ro.ItemInfo, Ro.instanceInfo);
    // End:0xC0
    if(((Ro.ItemInfo.IsCashItem() == true) && Ro.instanceInfo != none) && Ro.instanceInfo.cashItemInfo != none)
    {
        lbItemName.Caption = Ro.instanceInfo.cashItemInfo.WZItemName;        
    }
    else
    {
        lbItemName.Caption = Ro.ItemInfo.ItemName;
    }
    SetData(Ro.ItemInfo.ItemID, Ro.instanceInfo.UniqueID, Ro.ItemInfo);
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

function bool ItemBuyTerm_OnOK(GUIComponent Sender)
{
    local wItemBoxHK ib;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager GameMgr;

    ib = Ro.ItemInfo;
    cii = Ro.instanceInfo.cashItemInfo;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x24A
    if(cii != none)
    {
        temp.Length = 1;
        temp[0] = ib.ItemID;
        MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade, ib.ItemID);
        // End:0x18B
        if(UseGP20())
        {
            Log((("sfReqBuyItemByWebzenCashGP20(" $ string(cii.WZPriceSeq[int(OptionDay) - 1])) $ ",") $ string(cashType));
            TcpChannel.sfReqBuyItemByWebzenCashGP20(cii.WZPriceSeq[int(OptionDay) - 1], byte(cashType), __NFUN_921__(0));            
        }
        else
        {
            Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[int(OptionDay) - 1]));
            TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[int(OptionDay) - 1], temp, __NFUN_921__(0), OptionDay, 1);
        }        
    }
    else
    {
        Log((("sfReqBuyShopItem(" $ string(ItemID)) $ " ") $ ItemInfo.ItemName);
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade, ib.ItemID);
        TcpChannel.sfReqBuyShopItem(ItemID, __NFUN_921__(0), OptionDay, 1);
    }
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyTerm');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = ItemBuyHK_OnTimeOut;
    return true;
    //return;    
}

function ItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    // End:0x50
    if((BTWindowDefineInfoHK(Controller.TopPage()) != none) && BTWindowDefineInfoHK(Controller.TopPage()).DefineCode == 21)
    {
        Controller.CloseMenu(false);
    }
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 182);
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
    strBriefingInfo[0]="?????????????????????????????????"
    strBriefingInfo[1]="?????????????????????????????????????????????????"
    strBriefingInfo[2]="????????????????????????????????????????????????????????"
    strBriefingInfo[3]="?????????????????????????????????????????"
    fbItemName=(X1=403.0000000,Y1=279.0000000,X2=621.0000000,Y2=294.0000000)
    fbBackgroundImage=(X1=297.0000000,Y1=159.0000000,X2=727.0000000,Y2=472.0000000)
    fbTopLine=(X1=403.0000000,Y1=165.0000000,X2=621.0000000,Y2=180.0000000)
    fbBottomLine=(X1=317.0000000,Y1=441.0000000,X2=707.0000000,Y2=484.0000000)
    fbButtonOK=(X1=378.0000000,Y1=419.0000000,X2=502.0000000,Y2=456.0000000)
    fbButtonCancel=(X1=522.0000000,Y1=419.0000000,X2=646.0000000,Y2=456.0000000)
    strTitle="???????????"
    strOK="?????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}