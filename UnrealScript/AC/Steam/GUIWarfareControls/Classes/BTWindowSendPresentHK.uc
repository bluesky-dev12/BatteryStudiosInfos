/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowSendPresentHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:4
 *
 *******************************************************************************/
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
var byte cashType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    itemBox = new class'BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    Separator = new class'BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    ButtonAddress = new class'BTOwnerDrawCaptionButtonHK';
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
    J0x1b6:
    // End:0x30c [While If]
    if(i < 4)
    {
        Label[i] = new class'BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        // End:0x23a
        if(i < 2)
        {
            Label[i].Caption = strLabel[i];
        }
        // End:0x290
        if(i == 1)
        {
            Label[i].FontSize[0] = 8;
            Label[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        }
        // End:0x2bf
        if(i >= 2)
        {
            Label[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
        }
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b6;
    }
    EditReceiveUser = new class'BTEditBoxHK';
    EditReceiveUser.bUseAWinPos = true;
    EditReceiveUser.AWinPos = fbEditReceiveUser;
    EditReceiveUser.InitComponent(MyController, self);
    AppendComponent(EditReceiveUser);
    EditContent = new class'BTMultiLineEditBoxHK';
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
}

function SetRenderObject(BTROItemBoxHK ro)
{
    self.ro = ro;
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
}

function SetCashType(byte buyCashType)
{
    cashType = buyCashType;
}

defaultproperties
{
    fbItemBox=(X1=395.0,Y1=172.0,X2=630.0,Y2=284.0)
    fbSeparator=(X1=341.0,Y1=292.0,X2=683.0,Y2=294.0)
    fbButtonAddress=(X1=633.0,Y1=304.0,X2=683.0,Y2=325.0)
    fbLabel[0]=(X1=344.0,Y1=309.0,X2=428.0,Y2=330.0)
    fbLabel[1]=(X1=341.0,Y1=335.0,X2=579.0,Y2=351.0)
    fbLabel[2]=(X1=440.0,Y1=302.0,X2=625.0,Y2=328.0)
    fbLabel[3]=(X1=341.0,Y1=353.0,X2=683.0,Y2=580.0)
    fbEditReceiveUser=(X1=443.0,Y1=305.0,X2=622.0,Y2=328.0)
    fbEditContent=(X1=344.0,Y1=356.0,X2=680.0,Y2=580.0)
    strLabel[0]="Recipient"
    strLabel[1]="- You cannot send a gift to multiple people."
    strButtonAddress="Friends"
    fbBackgroundImage=(X1=313.0,Y1=118.0,X2=711.0,Y2=651.0)
    fbTopLine=(X1=333.0,Y1=138.0,X2=691.0,Y2=164.0)
    fbBottomLine=(X1=333.0,Y1=589.0,X2=691.0,Y2=631.0)
    fbButtonOK=(X1=390.0,Y1=594.0,X2=509.0,Y2=626.0)
    fbButtonCancel=(X1=514.0,Y1=594.0,X2=633.0,Y2=626.0)
    strTitle="Send Gift"
    strOK="Send Gift"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}