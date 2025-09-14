/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTAutoImageListNew.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BTAutoImageListNew extends BTAutoImageListHK
    dependson(BTAutoImageListHK)
    dependson(BTScrollZoneHK)
    editinlinenew
    instanced;

function InitScrollBar()
{
    local Image zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new class'BTScrollZoneHK';
    zoneimg = class'BTUIResourcePoolHK'.default.Scrol_New_BG;
    Zone.zoneImage = zoneimg;
    ImageListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new class'BTScrollButtonHK';
    ibtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    ibtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_up_cli;
    ibtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_up_dis;
    ibtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    ImageListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new class'BTScrollButtonHK';
    dbtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    dbtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_dn_cli;
    dbtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_dn_dis;
    dbtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    ImageListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new class'BTGripButtonHK';
    Grip.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    Grip.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_grip_cli;
    Grip.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    ImageListBox.MyScrollBar.MyGripButton = Grip;
    ImageListBox.MyScrollBar.bScrollStyle = true;
    vsb = GUIVertScrollBar(ImageListBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
}
