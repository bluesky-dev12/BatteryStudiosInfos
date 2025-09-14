class BTTPInventoryHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var localized string strSkill;
var localized string strQuickSlot;
var BTROModelNew CharacterModel;
var() automated TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInven[3];
var export editinline GUITabPanel TPInven[3];
var export editinline BTTPInventoryWeaponHK TPWeapon;
var export editinline BTTPInventorySkillHK TPSkill;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TPWeapon = new Class'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK';
    TPSkill = new Class'GUIWarfareControls_Decompressed.BTTPInventorySkillHK';
    TPQuickSlot = new Class'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK';
    ButtonInven[0].Caption = strWeapon;
    ButtonInven[1].Caption = strSkill;
    ButtonInven[2].Caption = strQuickSlot;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    TPWeapon.CharacterModel = CharacterModel;
    TPSkill.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    ButtonInven[0].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[1].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[2].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    //return;    
}

function bool TabControl_ButtonInven_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TabControl.SetVisiblePanel(btn.ButtonID);
    return true;
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
    strWeapon="Weapon"
    strSkill="Skill"
    strQuickSlot="Quick Slot"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}