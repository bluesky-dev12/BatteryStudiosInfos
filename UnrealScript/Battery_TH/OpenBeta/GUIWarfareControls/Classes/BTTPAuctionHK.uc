class BTTPAuctionHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strBuying;
var localized string strMyAuction;
var localized string strSelling;
var BTROModelNew CharacterModel;
var() automated TabControlMocker TabControl;
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

    // End:0x320 [Loop If]
    if(i < 3)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(110 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(110 * (i + 1))) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
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
        // End:0x1EB
        if(i == 0)
        {
            TPBuying = new Class'GUIWarfareControls_Decompressed.BTTPAuctionBuyingHK';
            serverTP = TPBuying;            
        }
        else
        {
            // End:0x213
            if(i == 1)
            {
                TPMyAuction = new Class'GUIWarfareControls_Decompressed.BTTPAuctionMyAuctionHK';
                serverTP = TPMyAuction;                
            }
            else
            {
                TPSelling = new Class'GUIWarfareControls_Decompressed.BTTPAuctionSellingHK';
                serverTP = TPSelling;
            }
        }
        serverTP.bUseAWinPos = true;
        fb.X1 = AWinPos.X1;
        fb.Y1 = AWinPos.Y1 + float(23);
        fb.X2 = AWinPos.X2;
        fb.Y2 = AWinPos.Y2;
        serverTP.AWinPos = fb;
        serverTP.RenderWeight = 0.5000000;
        serverTP.InitComponent(Controller, self);
        AppendComponent(serverTP);
        TPAuction[i] = serverTP;
        TabControl.BindTabButtonAndPanel(ButtonAuction[i], TPAuction[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    ButtonAuction[0].Caption = strBuying;
    ButtonAuction[1].Caption = strMyAuction;
    ButtonAuction[2].Caption = strSelling;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    TPBuying.CharacterModel = CharacterModel;
    TPMyAuction.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    self.Controller.LogControlInfo(ButtonAuction[1]);
    //return;    
}

defaultproperties
{
    strBuying="????"
    strMyAuction="?????????"
    strSelling="???"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPAuctionHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}