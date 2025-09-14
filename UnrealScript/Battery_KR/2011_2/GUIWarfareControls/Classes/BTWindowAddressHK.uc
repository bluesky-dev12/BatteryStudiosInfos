class BTWindowAddressHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bToggleSelectAll;
var localized string strButtonAll[2];
var() automated FloatBox fbButtonAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAll;
var export editinline TabControlMocker TabControl;
var() automated FloatBox fbACLAddress;
var export editinline BTACLAddressHK ACLAddress[3];
var localized string strButtonTab[3];
var() automated FloatBox fbButtonTab[3];
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

    // End:0x14F [Loop If]
    if(i < 3)
    {
        ButtonTab[i] = NewButtonComponent(fbButtonTab[i]);
        ButtonTab[i].ButtonID = i;
        ButtonTab[i].SetDefaultTabButtonImage();
        ButtonTab[i].Caption = strButtonTab[i];
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ACLAddress[i] = BTACLAddressHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLAddressHK', fbACLAddress));
        TabControl.BindTabButtonAndPanel(ButtonTab[i], ACLAddress[i]);
        i++;
        // [Loop Continue]
        goto J0x69;
    }
    //return;    
}

function bool ButtonAll_OnClick(GUIComponent Sender)
{
    local int i, CurrentTabIndex;

    CurrentTabIndex = TabControl.GetCurrentTabIndex();
    // End:0x9C
    if(bToggleSelectAll)
    {
        bToggleSelectAll = false;
        ButtonAll.Caption = strButtonAll[1];
        i = 0;
        J0x43:

        // End:0x99 [Loop If]
        if(i < ACLAddress[CurrentTabIndex].ACLRowList.Length)
        {
            ACLAddress[CurrentTabIndex].ACLRowList[i].DataPerColumn[2].IntValue = 1;
            i++;
            // [Loop Continue]
            goto J0x43;
        }        
    }
    else
    {
        bToggleSelectAll = true;
        ButtonAll.Caption = strButtonAll[0];
        i = 0;
        J0xC1:

        // End:0x117 [Loop If]
        if(i < ACLAddress[CurrentTabIndex].ACLRowList.Length)
        {
            ACLAddress[CurrentTabIndex].ACLRowList[i].DataPerColumn[2].IntValue = 0;
            i++;
            // [Loop Continue]
            goto J0xC1;
        }
    }
    return true;
    //return;    
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
        // End:0x2E
        case 1:
            // End:0x39
            break;
        // End:0x36
        case 2:
            // End:0x39
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

defaultproperties
{
    fbButtonAll=(X1=367.0000000,Y1=569.0000000,X2=461.0000000,Y2=601.0000000)
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTWindowAddressHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbACLAddress=(X1=361.0000000,Y1=217.0000000,X2=649.0000000,Y2=559.0000000)
    fbButtonTab[0]=(X1=362.0000000,Y1=194.0000000,X2=462.0000000,Y2=217.0000000)
    fbButtonTab[1]=(X1=463.0000000,Y1=194.0000000,X2=563.0000000,Y2=217.0000000)
    fbButtonTab[2]=(X1=564.0000000,Y1=194.0000000,X2=664.0000000,Y2=217.0000000)
    fbBackgroundImage=(X1=337.0000000,Y1=143.0000000,X2=688.0000000,Y2=626.0000000)
    fbTopLine=(X1=357.0000000,Y1=163.0000000,X2=668.0000000,Y2=188.0000000)
    fbBottomLine=(X1=357.0000000,Y1=563.0000000,X2=668.0000000,Y2=606.0000000)
    fbButtonOK=(X1=465.0000000,Y1=569.0000000,X2=559.0000000,Y2=601.0000000)
    fbButtonCancel=(X1=563.0000000,Y1=569.0000000,X2=657.0000000,Y2=601.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}