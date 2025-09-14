/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:3
 *
 *******************************************************************************/
class BTTPInventoryHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var localized string strSkill;
var localized string strQuickSlot;
var BTROModelNew CharacterModel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInven[3];
var export editinline GUITabPanel TPInven[3];
var export editinline BTTPInventoryWeaponHK TPWeapon;
var export editinline BTTPInventorySkillHK TPSkill;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TPWeapon = new class'BTTPInventoryWeaponHK';
    TPSkill = new class'BTTPInventorySkillHK';
    TPQuickSlot = new class'BTTPInventoryQuickSlotHK';
    ButtonInven[0].Caption = strWeapon;
    ButtonInven[1].Caption = strSkill;
    ButtonInven[2].Caption = strQuickSlot;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    TPWeapon.CharacterModel = CharacterModel;
    TPSkill.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    ButtonInven[0].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[1].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[2].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
}

function bool TabControl_ButtonInven_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TabControl.SetVisiblePanel(btn.ButtonID);
    return true;
}

function bool SaveButton_OnClick(GUIComponent Sender)
{
    CharacterModel.SaveModelData();
    return true;
}

defaultproperties
{
    strWeapon="Weapon"
    strSkill="Skill"
    strQuickSlot="Quick Slot"
    TabControl=mTabControl
}