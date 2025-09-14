/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:6
 *
 *******************************************************************************/
class BTTPOptionHK extends BTTabPanelHK
    dependson(BTTPOptionSoundHK)
    dependson(BTTPOptionInputHK)
    dependson(BTTPOptionETCHK)
    editinlinenew
    instanced;

var localized string strButtonTab[5];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[5];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[5];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[5];
var export editinline BTTPOptionGraphicHK TPGraphic;
var export editinline BTTPOptionSoundHK TPSound;
var export editinline BTTPOptionInputHK TPInput;
var export editinline BTTPOptionCommunityHK TPCommunity;
var export editinline BTTPOptionETCHK TPETC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x2b2 [While If]
    if(i < 5)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(fbButtonTab[i].X1, fbButtonTab[i].Y1, fbButtonTab[i].X2, fbButtonTab[i].Y2);
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        ButtonTab[i].SetFontSizeAll(9);
        ButtonTab[i].SetBigTabButtonImage();
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1 + float(24), AWinPos.X2, AWinPos.Y2);
        // End:0x171
        if(i == 0)
        {
            TPGraphic = BTTPOptionGraphicHK(NewComponent(new class'BTTPOptionGraphicHK', fb));
            TPPanel[i] = TPGraphic;
        }
        // End:0x269
        else
        {
            // End:0x1af
            if(i == 1)
            {
                TPSound = BTTPOptionSoundHK(NewComponent(new class'BTTPOptionSoundHK', fb));
                TPPanel[i] = TPSound;
            }
            // End:0x269
            else
            {
                // End:0x1ee
                if(i == 2)
                {
                    TPInput = BTTPOptionInputHK(NewComponent(new class'BTTPOptionInputHK', fb));
                    TPPanel[i] = TPInput;
                }
                // End:0x269
                else
                {
                    // End:0x22d
                    if(i == 3)
                    {
                        TPCommunity = BTTPOptionCommunityHK(NewComponent(new class'BTTPOptionCommunityHK', fb));
                        TPPanel[i] = TPCommunity;
                    }
                    // End:0x269
                    else
                    {
                        // End:0x269
                        if(i == 4)
                        {
                            TPETC = BTTPOptionETCHK(NewComponent(new class'BTTPOptionETCHK', fb));
                            TPPanel[i] = TPETC;
                        }
                    }
                }
            }
        }
        TabControl.BindTabButtonAndPanel(ButtonTab[i], TPPanel[i]);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    TabControl.SetVisiblePanel(0);
    TPPanel[0].Internal_OnClick(none);
    BTTPOptionGQAdvanceHK(TPGraphic.Content[5]).ButtonAdvance.__OnClick__Delegate = ButtonAdvance_OnClick;
    TPGraphic.__OnChangeScreen__Delegate = TPETC.OnChangeScreen;
    TPETC.OnChangeScreen(TPGraphic.CurrentInfo.width, TPGraphic.CurrentInfo.Height);
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x75 [While If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x6b
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            TPPanel[lp1].Internal_OnClick(none);
        }
        // End:0x75
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return true;
}

function bool ButtonAdvance_OnClick(GUIComponent Sender)
{
    local PlayerController PC;
    local wMatchMaker MM;

    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    // End:0x55
    if(MM != none && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    SaveData();
    Controller.OpenMenu("GUIWarfareControls.BTWindowOptionAdvanceHK");
    return true;
}

function SaveData()
{
    TPGraphic.SaveData();
    TPSound.SaveData();
    TPInput.SaveData();
    TPETC.SaveData();
}

function ResetData()
{
    TPGraphic.ResetData();
    TPSound.ResetData();
    TPInput.ResetData();
    TPETC.ResetData();
}

function DefaultResetData()
{
    switch(TabControl.CurrentTabIndex)
    {
        // End:0x26
        case 0:
            TPGraphic.DefaultResetData();
            // End:0x6d
            break;
        // End:0x3c
        case 1:
            TPSound.DefaultResetData();
            // End:0x6d
            break;
        // End:0x53
        case 2:
            TPInput.DefaultResetData();
            // End:0x6d
            break;
        // End:0x6a
        case 4:
            TPETC.DefaultResetData();
            // End:0x6d
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    strButtonTab[0]="Graphics"
    strButtonTab[1]="Sound"
    strButtonTab[2]="Controls"
    strButtonTab[3]="Community"
    strButtonTab[4]="Other"
    TabControl=mTabControl
    fbButtonTab[0]=(X1=252.0,Y1=87.0,X2=355.0,Y2=119.0)
    fbButtonTab[1]=(X1=356.0,Y1=87.0,X2=459.0,Y2=119.0)
    fbButtonTab[2]=(X1=460.0,Y1=87.0,X2=563.0,Y2=119.0)
    fbButtonTab[3]=(X1=564.0,Y1=87.0,X2=667.0,Y2=119.0)
    fbButtonTab[4]=(X1=668.0,Y1=87.0,X2=771.0,Y2=119.0)
    fbTPPanel=(X1=242.0,Y1=141.0,X2=760.0,Y2=605.0)
}