/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPAuctionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:1
 *
 *******************************************************************************/
class BTTPAuctionHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strBuying;
var localized string strMyAuction;
var localized string strSelling;
var BTROModelNew CharacterModel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuction[3];
var export editinline GUITabPanel TPAuction[3];
var export editinline BTTPAuctionBuyingHK TPBuying;
var export editinline BTTPAuctionMyAuctionHK TPMyAuction;
var export editinline BTTPAuctionSellingHK TPSelling;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x320 [While If]
    if(i < 3)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(110 * i) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = AWinPos.X1 + float(110 * i + 1) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.ButtonID = i;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonAuction[i] = serverButton;
        // End:0x1eb
        if(i == 0)
        {
            TPBuying = new class'BTTPAuctionBuyingHK';
            serverTP = TPBuying;
        }
        // End:0x22d
        else
        {
            // End:0x213
            if(i == 1)
            {
                TPMyAuction = new class'BTTPAuctionMyAuctionHK';
                serverTP = TPMyAuction;
            }
            // End:0x22d
            else
            {
                TPSelling = new class'BTTPAuctionSellingHK';
                serverTP = TPSelling;
            }
        }
        serverTP.bUseAWinPos = true;
        fb.X1 = AWinPos.X1;
        fb.Y1 = AWinPos.Y1 + float(23);
        fb.X2 = AWinPos.X2;
        fb.Y2 = AWinPos.Y2;
        serverTP.AWinPos = fb;
        serverTP.RenderWeight = 0.50;
        serverTP.InitComponent(Controller, self);
        AppendComponent(serverTP);
        TPAuction[i] = serverTP;
        TabControl.BindTabButtonAndPanel(ButtonAuction[i], TPAuction[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    ButtonAuction[0].Caption = strBuying;
    ButtonAuction[1].Caption = strMyAuction;
    ButtonAuction[2].Caption = strSelling;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    TPBuying.CharacterModel = CharacterModel;
    TPMyAuction.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    self.Controller.LogControlInfo(ButtonAuction[1]);
}

defaultproperties
{
    strBuying="Buy"
    strMyAuction="My Bids"
    strSelling="Sell"
    TabControl=mTabControl
}