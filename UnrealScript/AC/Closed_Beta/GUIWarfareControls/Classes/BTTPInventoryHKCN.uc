class BTTPInventoryHKCN extends BTTPInventoryHK
    editinlinenew
    instanced;

var localized string strRSA;
var localized string strAF;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    TPWeapon = new Class'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHKCN';
    TPWeapon.InitComponent(Controller, self);
    AppendComponent(TPWeapon);
    TPQuickSlot = new Class'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHKCN';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
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

function bool SaveButton_OnClick(GUIComponent Sender)
{
    CharacterModel.SaveModelData();
    return true;
    //return;    
}

defaultproperties
{
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryHKCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}