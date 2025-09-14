/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCustomConfirm.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:4
 *
 *******************************************************************************/
class BTWindowCustomConfirm extends BTWindowHK
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[3];
var localized string strLabel[3];
var export editinline BTOwnerDrawImageHK Label[3];
var localized string strPoint;
var localized string strCash;
var localized string strPartLabel[5];
var export editinline BTOwnerDrawImageHK PartLabel[5];
var export editinline BTOwnerDrawImageHK PartPointLabel[5];
var export editinline BTOwnerDrawImageHK PartCashLabel[5];
var export editinline BTOwnerDrawImageHK PartPointTextLabel[5];
var export editinline BTOwnerDrawImageHK PartCashTextLabel[5];
var localized string strCalcPrice[3];
var export editinline BTOwnerDrawImageHK CalcTextLabel[3];
var export editinline BTOwnerDrawImageHK CalcPointTextLabel[3];
var export editinline BTOwnerDrawImageHK CalcCashTextLabel[3];
var export editinline BTOwnerDrawImageHK CalcPointLabel[3];
var export editinline BTOwnerDrawImageHK CalcCashLabel[3];
var localized string strNotify;
var export editinline BTMultiLineEditBoxHK NotifyLabel;
var export editinline BTItemBoxButtonHK btnOrigCustomItems[5];
var export editinline BTItemBoxButtonHK btnDestCustomItems[5];
var int iSumItemPointPrice;
var int iSumItemCashPrice;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, btnSizeX, btnSizeY, btnSpacingY;
    local FloatBox fbStartItemBtns;
    local wGameManager GameMgr;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.ItemRemodel_Buy_bgdeco;
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    TopLine.SetFontSizeAll(11);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    i = 0;
    J0xd0:
    // End:0x15f [While If]
    if(i < 3)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(11);
        Label[i].SetFontDrawType(4);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd0;
    }
    Label[0].SetFontColorAll(class'Canvas'.static.MakeColor(153, 153, 153, byte(255)));
    Label[1].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), 107, 107, byte(255)));
    Label[2].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), 107, 107, byte(255)));
    fbStartItemBtns.X1 = 110.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(150);
    fbStartItemBtns.Y1 = 96.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(13);
    i = 0;
    J0x23f:
    // End:0x2fe [While If]
    if(i < 5)
    {
        PartLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        PartLabel[i].Caption = strPartLabel[i];
        PartLabel[i].SetFontSizeAll(9);
        PartLabel[i].SetFontDrawType(5);
        fbStartItemBtns.Y1 = fbStartItemBtns.Y1 + float(97);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y2 + float(97);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23f;
    }
    btnSizeX = 167;
    btnSizeY = 88;
    btnSpacingY = 9;
    fbStartItemBtns.X1 = 282.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(btnSizeX);
    fbStartItemBtns.Y1 = 85.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
    i = 0;
    J0x379:
    // End:0x418 [While If]
    if(i < 5)
    {
        btnOrigCustomItems[i] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbStartItemBtns, 0.90));
        btnOrigCustomItems[i].BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
        fbStartItemBtns.Y1 = fbStartItemBtns.Y2 + float(btnSpacingY);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x379;
    }
    fbStartItemBtns.X1 = 512.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(btnSizeX);
    fbStartItemBtns.Y1 = 85.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
    i = 0;
    J0x47b:
    // End:0x4f7 [While If]
    if(i < 5)
    {
        btnDestCustomItems[i] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbStartItemBtns, 0.90));
        fbStartItemBtns.Y1 = fbStartItemBtns.Y2 + float(btnSpacingY);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47b;
    }
    fbStartItemBtns.X1 = 698.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(125);
    fbStartItemBtns.Y1 = 126.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    btnSpacingY = 97;
    i = 0;
    J0x55c:
    // End:0x631 [While If]
    if(i < 5)
    {
        PartPointLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        PartPointLabel[i].CaptionDrawType = 5;
        PartPointLabel[i].Caption = "0";
        PartPointLabel[i].SetFontColorAll(class'Canvas'.static.MakeColor(127, 233, 31, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        PartPointLabel[i].SetFontSizeAll(10);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x55c;
    }
    fbStartItemBtns.X1 = 698.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(125);
    fbStartItemBtns.Y1 = 149.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x68e:
    // End:0x763 [While If]
    if(i < 5)
    {
        PartCashLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        PartCashLabel[i].CaptionDrawType = 5;
        PartCashLabel[i].Caption = "0";
        PartCashLabel[i].SetFontColorAll(class'Canvas'.static.MakeColor(2, 198, 254, byte(255)));
        PartCashLabel[i].SetFontSizeAll(10);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x68e;
    }
    fbStartItemBtns.X1 = 828.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 126.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x7c0:
    // End:0x897 [While If]
    if(i < 5)
    {
        PartPointTextLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        PartPointTextLabel[i].Caption = strPoint;
        PartPointTextLabel[i].CaptionDrawType = 4;
        PartPointTextLabel[i].SetFontSizeAll(10);
        PartPointTextLabel[i].SetFontColorAll(class'Canvas'.static.MakeColor(127, 233, 31, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7c0;
    }
    fbStartItemBtns.X1 = 828.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 149.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x8f4:
    // End:0x9cb [While If]
    if(i < 5)
    {
        PartCashTextLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        PartCashTextLabel[i].Caption = strCash;
        PartCashTextLabel[i].CaptionDrawType = 4;
        PartCashTextLabel[i].SetFontSizeAll(10);
        PartCashTextLabel[i].SetFontColorAll(class'Canvas'.static.MakeColor(2, 198, 254, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8f4;
    }
    btnSpacingY = 30;
    fbStartItemBtns.X1 = 110.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(150);
    fbStartItemBtns.Y1 = 618.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xa30:
    // End:0xae4 [While If]
    if(i < 3)
    {
        CalcTextLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        CalcTextLabel[i].Caption = self.strCalcPrice[i];
        CalcTextLabel[i].SetFontSizeAll(11);
        CalcTextLabel[i].CaptionDrawType = 5;
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa30;
    }
    fbStartItemBtns.X1 = 400.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 618.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xb41:
    // End:0xbef [While If]
    if(i < 3)
    {
        CalcPointTextLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        CalcPointTextLabel[i].Caption = self.strPoint;
        CalcPointTextLabel[i].CaptionDrawType = 4;
        CalcPointTextLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb41;
    }
    CalcPointTextLabel[0].SetFontColorAll(class'Canvas'.static.MakeColor(178, 233, 31, byte(255)));
    CalcPointTextLabel[1].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcPointTextLabel[2].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = fbStartItemBtns.X1 - float(129);
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(126);
    fbStartItemBtns.Y1 = 618.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xce2:
    // End:0xd89 [While If]
    if(i < 3)
    {
        CalcPointLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        CalcPointLabel[i].CaptionDrawType = 5;
        CalcPointLabel[i].Caption = "0";
        CalcPointLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xce2;
    }
    CalcPointLabel[0].SetFontColorAll(class'Canvas'.static.MakeColor(178, 233, 31, byte(255)));
    CalcPointLabel[1].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcPointLabel[2].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = 584.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 618.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xe71:
    // End:0xf1f [While If]
    if(i < 3)
    {
        CalcCashTextLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        CalcCashTextLabel[i].Caption = self.strCash;
        CalcCashTextLabel[i].CaptionDrawType = 4;
        CalcCashTextLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe71;
    }
    CalcCashTextLabel[0].SetFontColorAll(class'Canvas'.static.MakeColor(2, 198, 254, byte(255)));
    CalcCashTextLabel[1].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcCashTextLabel[2].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = fbStartItemBtns.X1 - float(129);
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(129);
    fbStartItemBtns.Y1 = 618.0;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0x1012:
    // End:0x10b9 [While If]
    if(i < 3)
    {
        CalcCashLabel[i] = NewLabelComponent(fbStartItemBtns, class'BTUIResourcePoolHK'.default.empty);
        CalcCashLabel[i].CaptionDrawType = 5;
        CalcCashLabel[i].Caption = "0";
        CalcCashLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1012;
    }
    CalcCashLabel[0].SetFontColorAll(class'Canvas'.static.MakeColor(2, 198, 254, byte(255)));
    CalcCashLabel[1].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcCashLabel[2].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = 658.0;
    fbStartItemBtns.Y1 = 605.0;
    fbStartItemBtns.X2 = 912.0;
    fbStartItemBtns.Y2 = 675.0;
    NotifyLabel = new class'BTMultiLineEditBoxHK';
    NotifyLabel.bUseAWinPos = true;
    NotifyLabel.AWinPos = fbStartItemBtns;
    NotifyLabel.InitComponent(Controller, self);
    AppendComponent(NotifyLabel);
    NotifyLabel.SetFontColor(byte(255), 50, 16, byte(255));
    NotifyLabel.SetFontSizeAll(11);
    NotifyLabel.SetVisibleLineCount(4);
    NotifyLabel.bReadOnly = true;
    NotifyLabel.TextStr = strNotify;
}

function SetItem(int iOrigOrWanted, int iButtonIndex, int PartID, int PaintingID)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wWeaponCustomPartsParam wcpp;
    local wGameManager GameMgr;
    local wPaintGroupParam pgp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x8e
    if(PartID != 0)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(PartID);
        // End:0x8b
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        }
    }
    // End:0xd6
    else
    {
        // End:0xd6
        if(PaintingID > 0)
        {
            pgp = GameMgr.GetPaintGroupParam(PaintingID);
            ItemInfo = GameMgr.FindUIItem(pgp.PaintingItemID);
        }
    }
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    instanceInfo.PaintID = PaintingID;
    instanceInfo.OverlapCount = 1;
    // End:0x14a
    if(iOrigOrWanted == 0)
    {
        btnOrigCustomItems[iButtonIndex].SetData(ItemInfo, instanceInfo);
    }
    // End:0x169
    else
    {
        btnDestCustomItems[iButtonIndex].SetData(ItemInfo, instanceInfo);
    }
}

function SetPrice(int iIndex, int OrigPartID, int iWantedPartID, int OrigPaintID, int WantedPaintID)
{
    local wWeaponCustomPartsParam wcpp;
    local wGameManager GameMgr;
    local wItemBaseParam ItemParam;
    local wPaintGroupParam pgp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    PartPointLabel[iIndex].Caption = "0";
    PartCashLabel[iIndex].Caption = "0";
    // End:0x14a
    if(iIndex == 0)
    {
        // End:0x147
        if(OrigPaintID != WantedPaintID && WantedPaintID > 0)
        {
            pgp = GameMgr.GetPaintGroupParam(WantedPaintID);
            ItemParam = GameMgr.GetItemParam(pgp.PaintingItemID);
            PartPointLabel[iIndex].Caption = "" $ string(ItemParam.iPointPrice[0]);
            PartCashLabel[iIndex].Caption = "" $ string(ItemParam.iCashPrice[0]);
            iSumItemPointPrice += ItemParam.iPointPrice[0];
            iSumItemCashPrice += ItemParam.iCashPrice[0];
        }
    }
    // End:0x23b
    else
    {
        // End:0x23b
        if(OrigPartID != iWantedPartID && iWantedPartID > 1)
        {
            wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iWantedPartID);
            // End:0x23b
            if(wcpp.iItemID > 0)
            {
                ItemParam = GameMgr.GetItemParam(wcpp.iItemID);
                PartPointLabel[iIndex].Caption = "" $ string(ItemParam.iPointPrice[0]);
                PartCashLabel[iIndex].Caption = "" $ string(ItemParam.iCashPrice[0]);
                iSumItemPointPrice += ItemParam.iPointPrice[0];
                iSumItemCashPrice += ItemParam.iCashPrice[0];
            }
        }
    }
}

function SetData(int OrigUnionedPartID, int WantedUnionedPartID, int OrigPaintingID, int WantedPaintingID)
{
    local int iOrigSightPartID, iOrigSilencerPartID, iOrigBarrelPartID, iOrigGunstockPartID, iDestSightPartID, iDestSilencerPartID,
	    iDestBarrelPartID, iDestGunstockPartID;

    local wGameManager GameMgr;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    iOrigSightPartID = OrigUnionedPartID & 1023;
    iOrigBarrelPartID = OrigUnionedPartID & 130048;
    iOrigSilencerPartID = OrigUnionedPartID & 16646144;
    iOrigGunstockPartID = OrigUnionedPartID & 2130706432;
    iDestSightPartID = WantedUnionedPartID & 1023;
    iDestBarrelPartID = WantedUnionedPartID & 130048;
    iDestSilencerPartID = WantedUnionedPartID & 16646144;
    iDestGunstockPartID = WantedUnionedPartID & 2130706432;
    SetItem(0, 0, 0, OrigPaintingID);
    SetItem(0, 1, iOrigSightPartID, 0);
    SetItem(0, 2, iOrigSilencerPartID, 0);
    SetItem(0, 3, iOrigBarrelPartID, 0);
    SetItem(0, 4, iOrigGunstockPartID, 0);
    SetItem(1, 0, 0, WantedPaintingID);
    SetItem(1, 1, iDestSightPartID, 0);
    SetItem(1, 2, iDestSilencerPartID, 0);
    SetItem(1, 3, iDestBarrelPartID, 0);
    SetItem(1, 4, iDestGunstockPartID, 0);
    iSumItemPointPrice = 0;
    iSumItemCashPrice = 0;
    SetPrice(0, 0, 0, OrigPaintingID, WantedPaintingID);
    SetPrice(1, iOrigSightPartID, iDestSightPartID, 0, 0);
    SetPrice(2, iOrigSilencerPartID, iDestSilencerPartID, 0, 0);
    SetPrice(3, iOrigBarrelPartID, iDestBarrelPartID, 0, 0);
    SetPrice(4, iOrigGunstockPartID, iDestGunstockPartID, 0, 0);
    CalcPointLabel[0].Caption = "" $ string(MM.kPoint);
    CalcCashLabel[0].Caption = "" $ string(MM.kCash);
    CalcPointLabel[1].Caption = "" $ string(iSumItemPointPrice);
    CalcCashLabel[1].Caption = "" $ string(iSumItemCashPrice);
    CalcPointLabel[2].Caption = "" $ string(MM.kPoint - iSumItemPointPrice);
    CalcCashLabel[2].Caption = "" $ string(MM.kCash - iSumItemCashPrice);
}

defaultproperties
{
    fbLabel[0]=(X1=271.0,Y1=47.0,X2=463.0,Y2=62.0)
    fbLabel[1]=(X1=500.0,Y1=47.0,X2=692.0,Y2=62.0)
    fbLabel[2]=(X1=692.0,Y1=47.0,X2=884.0,Y2=62.0)
    strLabel[0]="Old Attachments"
    strLabel[1]="Owned Attachments"
    strLabel[2]="Attachment Price"
    strPoint="Points"
    strCash="Cash"
    strPartLabel[0]="Painting"
    strPartLabel[1]="Mount"
    strPartLabel[2]="Front"
    strPartLabel[3]="Barrel"
    strPartLabel[4]="Stock"
    strCalcPrice[0]="Owned Amount"
    strCalcPrice[1]="Item Price"
    strCalcPrice[2]="Balance"
    strNotify="Old attachments are permanently removed when new attachments are purchased."
    fbBackgroundImage=(X1=105.0,Y1=4.0,X2=919.0,Y2=767.0)
    fbTopLine=(X1=312.0,Y1=10.0,X2=712.0,Y2=25.0)
    fbBottomLine=(X1=166.0,Y1=684.0,X2=859.0,Y2=728.0)
    fbButtonOK=(X1=386.0,Y1=719.0,X2=510.0,Y2=756.0)
    fbButtonCancel=(X1=512.0,Y1=719.0,X2=636.0,Y2=756.0)
    strTitle="Buy Attachments"
    strOK="Buy"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}