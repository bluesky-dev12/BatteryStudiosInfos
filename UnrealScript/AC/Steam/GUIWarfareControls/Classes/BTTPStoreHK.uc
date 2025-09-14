/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPStoreHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:1
 *
 *******************************************************************************/
class BTTPStoreHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var BTROModelNew CharacterModel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
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
    // End:0x2da [While If]
    if(i < 1)
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
        ButtonInven[i] = serverButton;
        // End:0x1e7
        if(i == 0)
        {
            TPWeapon = new class'BTTPStoreWeaponHKCN';
            serverTP = TPWeapon;
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
        TPInven[i] = serverTP;
        TabControl.BindTabButtonAndPanel(ButtonInven[i], TPInven[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    ButtonInven[0].Caption = strWeapon;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    TPWeapon.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
}

defaultproperties
{
    strWeapon="Weapons"
    TabControl=mTabControl
}