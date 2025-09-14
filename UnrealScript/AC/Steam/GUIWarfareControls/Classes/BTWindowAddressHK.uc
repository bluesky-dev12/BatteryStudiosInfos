/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowAddressHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowAddressHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bToggleSelectAll;
var localized string strButtonAll[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAll;
var export editinline TabControlMocker TabControl;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLAddress;
var export editinline BTACLAddressHK ACLAddress[3];
var localized string strButtonTab[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonTab[3];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    bToggleSelectAll = false;
    ButtonAll = NewButtonComponent(fbButtonAll);
    ButtonAll.SetDefaultButtonImage();
    ButtonAll.Caption = strButtonAll[0];
    ButtonAll.__OnClick__Delegate = ButtonAll_OnClick;
    i = 0;
    J0x69:
    // End:0x14f [While If]
    if(i < 3)
    {
        ButtonTab[i] = NewButtonComponent(fbButtonTab[i]);
        ButtonTab[i].ButtonID = i;
        ButtonTab[i].SetDefaultTabButtonImage();
        ButtonTab[i].Caption = strButtonTab[i];
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ACLAddress[i] = BTACLAddressHK(NewComponent(new class'BTACLAddressHK', fbACLAddress));
        TabControl.BindTabButtonAndPanel(ButtonTab[i], ACLAddress[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x69;
    }
}

function bool ButtonAll_OnClick(GUIComponent Sender)
{
    local int i, CurrentTabIndex;

    CurrentTabIndex = TabControl.GetCurrentTabIndex();
    // End:0x9c
    if(bToggleSelectAll)
    {
        bToggleSelectAll = false;
        ButtonAll.Caption = strButtonAll[1];
        i = 0;
        J0x43:
        // End:0x99 [While If]
        if(i < ACLAddress[CurrentTabIndex].ACLRowList.Length)
        {
            ACLAddress[CurrentTabIndex].ACLRowList[i].DataPerColumn[2].IntValue = 1;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x43;
        }
    }
    // End:0x117
    else
    {
        bToggleSelectAll = true;
        ButtonAll.Caption = strButtonAll[0];
        i = 0;
        J0xc1:
        // End:0x117 [While If]
        if(i < ACLAddress[CurrentTabIndex].ACLRowList.Length)
        {
            ACLAddress[CurrentTabIndex].ACLRowList[i].DataPerColumn[2].IntValue = 0;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc1;
        }
    }
    return true;
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0x39
            break;
        // End:0x2e
        case 1:
            // End:0x39
            break;
        // End:0x36
        case 2:
            // End:0x39
            break;
        // End:0xffff
        default:
            return true;
    }
}

defaultproperties
{
    fbButtonAll=(X1=367.0,Y1=569.0,X2=461.0,Y2=601.0)
    TabControl=mTabControl
    fbACLAddress=(X1=361.0,Y1=217.0,X2=649.0,Y2=559.0)
    fbButtonTab[0]=(X1=362.0,Y1=194.0,X2=462.0,Y2=217.0)
    fbButtonTab[1]=(X1=463.0,Y1=194.0,X2=563.0,Y2=217.0)
    fbButtonTab[2]=(X1=564.0,Y1=194.0,X2=664.0,Y2=217.0)
    fbBackgroundImage=(X1=337.0,Y1=143.0,X2=688.0,Y2=626.0)
    fbTopLine=(X1=357.0,Y1=163.0,X2=668.0,Y2=188.0)
    fbBottomLine=(X1=357.0,Y1=563.0,X2=668.0,Y2=606.0)
    fbButtonOK=(X1=465.0,Y1=569.0,X2=559.0,Y2=601.0)
    fbButtonCancel=(X1=563.0,Y1=569.0,X2=657.0,Y2=601.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}