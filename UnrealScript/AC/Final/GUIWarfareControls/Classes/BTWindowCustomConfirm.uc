class BTWindowCustomConfirm extends BTWindowHK
    editinlinenew
    instanced;

var() automated FloatBox fbLabel[3];
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
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Buy_bgdeco;
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    TopLine.SetFontSizeAll(11);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    i = 0;
    J0xD0:

    // End:0x15F [Loop If]
    if(i < 3)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].SetFontSizeAll(11);
        Label[i].SetFontDrawType(4);
        i++;
        // [Loop Continue]
        goto J0xD0;
    }
    Label[0].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(153, 153, 153, byte(255)));
    Label[1].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), 107, 107, byte(255)));
    Label[2].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), 107, 107, byte(255)));
    fbStartItemBtns.X1 = 110.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(150);
    fbStartItemBtns.Y1 = 96.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(13);
    i = 0;
    J0x23F:

    // End:0x2FE [Loop If]
    if(i < 5)
    {
        PartLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        PartLabel[i].Caption = strPartLabel[i];
        PartLabel[i].SetFontSizeAll(9);
        PartLabel[i].SetFontDrawType(5);
        fbStartItemBtns.Y1 = fbStartItemBtns.Y1 + float(97);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y2 + float(97);
        i++;
        // [Loop Continue]
        goto J0x23F;
    }
    btnSizeX = 167;
    btnSizeY = 88;
    btnSpacingY = 9;
    fbStartItemBtns.X1 = 282.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(btnSizeX);
    fbStartItemBtns.Y1 = 85.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
    i = 0;
    J0x379:

    // End:0x418 [Loop If]
    if(i < 5)
    {
        btnOrigCustomItems[i] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbStartItemBtns, 0.9000000));
        btnOrigCustomItems[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        fbStartItemBtns.Y1 = fbStartItemBtns.Y2 + float(btnSpacingY);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
        i++;
        // [Loop Continue]
        goto J0x379;
    }
    fbStartItemBtns.X1 = 512.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(btnSizeX);
    fbStartItemBtns.Y1 = 85.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
    i = 0;
    J0x47B:

    // End:0x4F7 [Loop If]
    if(i < 5)
    {
        btnDestCustomItems[i] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbStartItemBtns, 0.9000000));
        fbStartItemBtns.Y1 = fbStartItemBtns.Y2 + float(btnSpacingY);
        fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(btnSizeY);
        i++;
        // [Loop Continue]
        goto J0x47B;
    }
    fbStartItemBtns.X1 = 698.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(125);
    fbStartItemBtns.Y1 = 126.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    btnSpacingY = 97;
    i = 0;
    J0x55C:

    // End:0x631 [Loop If]
    if(i < 5)
    {
        PartPointLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        PartPointLabel[i].CaptionDrawType = 5;
        PartPointLabel[i].Caption = "0";
        PartPointLabel[i].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(127, 233, 31, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        PartPointLabel[i].SetFontSizeAll(10);
        i++;
        // [Loop Continue]
        goto J0x55C;
    }
    fbStartItemBtns.X1 = 698.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(125);
    fbStartItemBtns.Y1 = 149.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x68E:

    // End:0x763 [Loop If]
    if(i < 5)
    {
        PartCashLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        PartCashLabel[i].CaptionDrawType = 5;
        PartCashLabel[i].Caption = "0";
        PartCashLabel[i].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(2, 198, 254, byte(255)));
        PartCashLabel[i].SetFontSizeAll(10);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0x68E;
    }
    fbStartItemBtns.X1 = 828.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 126.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x7C0:

    // End:0x897 [Loop If]
    if(i < 5)
    {
        PartPointTextLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        PartPointTextLabel[i].Caption = strPoint;
        PartPointTextLabel[i].CaptionDrawType = 4;
        PartPointTextLabel[i].SetFontSizeAll(10);
        PartPointTextLabel[i].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(127, 233, 31, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0x7C0;
    }
    fbStartItemBtns.X1 = 828.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 149.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(14);
    i = 0;
    J0x8F4:

    // End:0x9CB [Loop If]
    if(i < 5)
    {
        PartCashTextLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        PartCashTextLabel[i].Caption = strCash;
        PartCashTextLabel[i].CaptionDrawType = 4;
        PartCashTextLabel[i].SetFontSizeAll(10);
        PartCashTextLabel[i].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(2, 198, 254, byte(255)));
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0x8F4;
    }
    btnSpacingY = 30;
    fbStartItemBtns.X1 = 110.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(150);
    fbStartItemBtns.Y1 = 618.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xA30:

    // End:0xAE4 [Loop If]
    if(i < 3)
    {
        CalcTextLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        CalcTextLabel[i].Caption = self.strCalcPrice[i];
        CalcTextLabel[i].SetFontSizeAll(11);
        CalcTextLabel[i].CaptionDrawType = 5;
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0xA30;
    }
    fbStartItemBtns.X1 = 400.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 618.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xB41:

    // End:0xBEF [Loop If]
    if(i < 3)
    {
        CalcPointTextLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        CalcPointTextLabel[i].Caption = self.strPoint;
        CalcPointTextLabel[i].CaptionDrawType = 4;
        CalcPointTextLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0xB41;
    }
    CalcPointTextLabel[0].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(178, 233, 31, byte(255)));
    CalcPointTextLabel[1].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcPointTextLabel[2].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = fbStartItemBtns.X1 - float(129);
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(126);
    fbStartItemBtns.Y1 = 618.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xCE2:

    // End:0xD89 [Loop If]
    if(i < 3)
    {
        CalcPointLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        CalcPointLabel[i].CaptionDrawType = 5;
        CalcPointLabel[i].Caption = "0";
        CalcPointLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0xCE2;
    }
    CalcPointLabel[0].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(178, 233, 31, byte(255)));
    CalcPointLabel[1].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcPointLabel[2].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = 584.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(51);
    fbStartItemBtns.Y1 = 618.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0xE71:

    // End:0xF1F [Loop If]
    if(i < 3)
    {
        CalcCashTextLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        CalcCashTextLabel[i].Caption = self.strCash;
        CalcCashTextLabel[i].CaptionDrawType = 4;
        CalcCashTextLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0xE71;
    }
    CalcCashTextLabel[0].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(2, 198, 254, byte(255)));
    CalcCashTextLabel[1].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcCashTextLabel[2].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = fbStartItemBtns.X1 - float(129);
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(129);
    fbStartItemBtns.Y1 = 618.0000000;
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(15);
    i = 0;
    J0x1012:

    // End:0x10B9 [Loop If]
    if(i < 3)
    {
        CalcCashLabel[i] = NewLabelComponent(fbStartItemBtns, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        CalcCashLabel[i].CaptionDrawType = 5;
        CalcCashLabel[i].Caption = "0";
        CalcCashLabel[i].SetFontSizeAll(11);
        fbStartItemBtns.Y1 += float(btnSpacingY);
        fbStartItemBtns.Y2 += float(btnSpacingY);
        i++;
        // [Loop Continue]
        goto J0x1012;
    }
    CalcCashLabel[0].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(2, 198, 254, byte(255)));
    CalcCashLabel[1].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    CalcCashLabel[2].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    fbStartItemBtns.X1 = 658.0000000;
    fbStartItemBtns.Y1 = 605.0000000;
    fbStartItemBtns.X2 = 912.0000000;
    fbStartItemBtns.Y2 = 675.0000000;
    NotifyLabel = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    NotifyLabel.bUseAWinPos = true;
    NotifyLabel.AWinPos = fbStartItemBtns;
    NotifyLabel.InitComponent(Controller, self);
    AppendComponent(NotifyLabel);
    NotifyLabel.SetFontColor(byte(255), 50, 16, byte(255));
    NotifyLabel.SetFontSizeAll(11);
    NotifyLabel.SetVisibleLineCount(4);
    NotifyLabel.bReadOnly = true;
    NotifyLabel.TextStr = strNotify;
    //return;    
}

function SetItem(int iOrigOrWanted, int iButtonIndex, int PartID, int PaintingID)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wWeaponCustomPartsParam wcpp;
    local wGameManager GameMgr;
    local wPaintGroupParam pgp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x8E
    if(PartID != 0)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(PartID);
        // End:0x8B
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        }        
    }
    else
    {
        // End:0xD6
        if(PaintingID > 0)
        {
            pgp = GameMgr.GetPaintGroupParam(PaintingID);
            ItemInfo = GameMgr.FindUIItem(pgp.PaintingItemID);
        }
    }
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    instanceInfo.PaintID = PaintingID;
    instanceInfo.OverlapCount = 1;
    // End:0x14A
    if(iOrigOrWanted == 0)
    {
        btnOrigCustomItems[iButtonIndex].SetData(ItemInfo, instanceInfo);        
    }
    else
    {
        btnDestCustomItems[iButtonIndex].SetData(ItemInfo, instanceInfo);
    }
    //return;    
}

function SetPrice(int iIndex, int OrigPartID, int iWantedPartID, int OrigPaintID, int WantedPaintID)
{
    local wWeaponCustomPartsParam wcpp;
    local wGameManager GameMgr;
    local wItemBaseParam ItemParam;
    local wPaintGroupParam pgp;
    local int iResult;
    local wGP20Product gp20Product;
    local int PointPrice, CashPrice;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    PartPointLabel[iIndex].Caption = "0";
    PartCashLabel[iIndex].Caption = "0";
    // End:0xC6
    if(iIndex == 0)
    {
        // End:0xC3
        if((OrigPaintID != WantedPaintID) && WantedPaintID > 0)
        {
            pgp = GameMgr.GetPaintGroupParam(WantedPaintID);
            ItemParam = GameMgr.GetItemParam(pgp.PaintingItemID);
        }        
    }
    else
    {
        // End:0x133
        if((OrigPartID != iWantedPartID) && iWantedPartID > 1)
        {
            wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iWantedPartID);
            // End:0x133
            if(wcpp.iItemID > 0)
            {
                ItemParam = GameMgr.GetItemParam(wcpp.iItemID);
            }
        }
    }
    // End:0x23C
    if(ItemParam != none)
    {
        PointPrice = ItemParam.iPointPrice[0];
        // End:0x1A9
        if(UseGP20())
        {
            gp20Product = GameMgr.GetGP20ProductFromCode(wcpp.iItemID, iResult);
            // End:0x1A6
            if(iResult == 1)
            {
                CashPrice = gp20Product.GetPrice(0);
            }            
        }
        else
        {
            CashPrice = ItemParam.iCashPrice[0];
        }
        // End:0x210
        if(int(ItemParam.eGrade) == int(GameMgr.14))
        {
            PartCashLabel[iIndex].Caption = "" $ string(CashPrice);
            iSumItemCashPrice += CashPrice;            
        }
        else
        {
            PartPointLabel[iIndex].Caption = "" $ string(PointPrice);
            iSumItemPointPrice += PointPrice;
        }
    }
    //return;    
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
    //return;    
}

defaultproperties
{
    fbLabel[0]=(X1=271.0000000,Y1=47.0000000,X2=463.0000000,Y2=62.0000000)
    fbLabel[1]=(X1=500.0000000,Y1=47.0000000,X2=692.0000000,Y2=62.0000000)
    fbLabel[2]=(X1=692.0000000,Y1=47.0000000,X2=884.0000000,Y2=62.0000000)
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
    fbBackgroundImage=(X1=105.0000000,Y1=4.0000000,X2=919.0000000,Y2=767.0000000)
    fbTopLine=(X1=312.0000000,Y1=10.0000000,X2=712.0000000,Y2=25.0000000)
    fbBottomLine=(X1=166.0000000,Y1=684.0000000,X2=859.0000000,Y2=728.0000000)
    fbButtonOK=(X1=386.0000000,Y1=719.0000000,X2=510.0000000,Y2=756.0000000)
    fbButtonCancel=(X1=512.0000000,Y1=719.0000000,X2=636.0000000,Y2=756.0000000)
    strTitle="Buy Attachments"
    strOK="Buy"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}