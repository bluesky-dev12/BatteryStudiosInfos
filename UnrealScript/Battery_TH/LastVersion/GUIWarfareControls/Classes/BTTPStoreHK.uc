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
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x115 [Loop If]
    if(i < 1)
    {
        // End:0x47
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
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 500.0000000);
    CharacterModel.cameraPos.X = -340.0000000;
    CharacterModel.cameraPos.Y = 15.0000000;
    CharacterModel.cameraPos.Z = 2.5000000;
    TPWeapon.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    //return;    
}

defaultproperties
{
    strWeapon="?????"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}