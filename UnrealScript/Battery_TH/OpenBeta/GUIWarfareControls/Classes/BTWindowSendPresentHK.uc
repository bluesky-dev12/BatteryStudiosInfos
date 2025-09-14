class BTWindowSendPresentHK extends BTWindowHK
    editinlinenew
    instanced;

var int ItemID;
var int BuyOpt[2];
var FloatBox fbItemBox;
var export editinline BTItemBoxButtonHK itemBox;
var FloatBox fbSeparator;
var export editinline BTOwnerDrawImageHK Separator;
var FloatBox fbButtonAddress;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAddress;
var FloatBox fbLabel[4];
var FloatBox fbEditReceiveUser;
var FloatBox fbEditContent;
var export editinline BTOwnerDrawImageHK Label[4];
var export editinline BTEditBoxHK EditReceiveUser;
var export editinline BTMultiLineEditBoxHK EditContent;
var localized string strLabel[2];
var localized string strButtonAddress;
var BTROItemBoxHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    itemBox = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    Separator = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    ButtonAddress = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonAddress.bUseAWinPos = true;
    ButtonAddress.AWinPos = fbButtonAddress;
    ButtonAddress.SetDefaultButtonImage();
    ButtonAddress.SetDefaultFontColor();
    ButtonAddress.SetFontSizeAll(9);
    ButtonAddress.Caption = strButtonAddress;
    ButtonAddress.InitComponent(MyController, self);
    AppendComponent(ButtonAddress);
    ButtonAddress.DisableMe();
    i = 0;
    J0x1B6:

    // End:0x30C [Loop If]
    if(i < 4)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        // End:0x23A
        if(i < 2)
        {
            Label[i].Caption = strLabel[i];
        }
        // End:0x290
        if(i == 1)
        {
            Label[i].FontSize[0] = 8;
            Label[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        }
        // End:0x2BF
        if(i >= 2)
        {
            Label[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
        }
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        i++;
        // [Loop Continue]
        goto J0x1B6;
    }
    EditReceiveUser = new Class'GUIWarfareControls_Decompressed.BTEditBoxHK';
    EditReceiveUser.bUseAWinPos = true;
    EditReceiveUser.AWinPos = fbEditReceiveUser;
    EditReceiveUser.InitComponent(MyController, self);
    AppendComponent(EditReceiveUser);
    EditContent = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    EditContent.bUseAWinPos = true;
    EditContent.AWinPos = fbEditContent;
    EditContent.InitComponent(MyController, self);
    AppendComponent(EditContent);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    EditReceiveUser.MaxTextStrNum = 16;
    EditContent.SetVisibleLineCount(12);
    EditContent.MaxTextStrNum = 500;
    //return;    
}

function SetRenderObject(BTROItemBoxHK ro)
{
    self.ro = ro;
    //return;    
}

function SetData(int iItemID, int Opt1, int opt2)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemID = iItemID;
    BuyOpt[0] = Opt1;
    BuyOpt[1] = opt2;
    itemBox.SetData(GameMgr.FindUIItem(ItemID), none);
    EditReceiveUser.Clear();
    EditContent.Clear();
    //return;    
}

defaultproperties
{
    fbItemBox=(X1=395.0000000,Y1=172.0000000,X2=630.0000000,Y2=284.0000000)
    fbSeparator=(X1=341.0000000,Y1=292.0000000,X2=683.0000000,Y2=294.0000000)
    fbButtonAddress=(X1=633.0000000,Y1=304.0000000,X2=683.0000000,Y2=325.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=309.0000000,X2=428.0000000,Y2=330.0000000)
    fbLabel[1]=(X1=341.0000000,Y1=335.0000000,X2=579.0000000,Y2=351.0000000)
    fbLabel[2]=(X1=440.0000000,Y1=302.0000000,X2=625.0000000,Y2=328.0000000)
    fbLabel[3]=(X1=341.0000000,Y1=353.0000000,X2=683.0000000,Y2=580.0000000)
    fbEditReceiveUser=(X1=443.0000000,Y1=305.0000000,X2=622.0000000,Y2=328.0000000)
    fbEditContent=(X1=344.0000000,Y1=356.0000000,X2=680.0000000,Y2=580.0000000)
    strLabel[0]="????????"
    strLabel[1]="????????????????????????????"
    strButtonAddress="Rec.???????"
    fbBackgroundImage=(X1=313.0000000,Y1=118.0000000,X2=711.0000000,Y2=651.0000000)
    fbTopLine=(X1=333.0000000,Y1=138.0000000,X2=691.0000000,Y2=164.0000000)
    fbBottomLine=(X1=333.0000000,Y1=589.0000000,X2=691.0000000,Y2=631.0000000)
    fbButtonOK=(X1=390.0000000,Y1=594.0000000,X2=509.0000000,Y2=626.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=594.0000000,X2=633.0000000,Y2=626.0000000)
    strTitle="??????????"
    strOK="??????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}