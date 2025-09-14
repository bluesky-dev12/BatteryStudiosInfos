class BTTPStoreHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var BTROModelNew CharacterModel;
var() automated TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInven[2];
var export editinline GUITabPanel TPInven[2];
var export editinline BTTPStoreWeaponHK TPWeapon;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x2DA [Loop If]
    if(i < 1)
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
        ButtonInven[i] = serverButton;
        // End:0x1E7
        if(i == 0)
        {
            TPWeapon = new Class'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK';
            serverTP = TPWeapon;
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
        TPInven[i] = serverTP;
        TabControl.BindTabButtonAndPanel(ButtonInven[i], TPInven[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    ButtonInven[0].Caption = strWeapon;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    TPWeapon.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    //return;    
}

defaultproperties
{
    strWeapon="??"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}